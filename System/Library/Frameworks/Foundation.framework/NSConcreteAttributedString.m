@implementation NSConcreteAttributedString

- (unint64_t)length
{
  return -[NSString length](self->string, "length");
}

- (NSConcreteAttributedString)initWithString:(id)a3 attributes:(id)a4
{
  NSConcreteAttributedString *v5;
  NSConcreteAttributedString *v6;
  NSMutableRLEArray *v7;
  void *v8;

  v5 = -[NSConcreteAttributedString initWithString:](self, "initWithString:", a3);
  v6 = v5;
  if (a4 && v5)
  {
    v7 = -[NSRLEArray init](+[NSMutableRLEArray allocWithZone:](NSMutableRLEArray, "allocWithZone:", -[NSConcreteAttributedString zone](v5, "zone")), "init");
    v8 = (void *)objc_msgSend((id)_NSAttributeDictionaryClass(), "newWithDictionary:", a4);
    -[NSMutableRLEArray insertObject:range:](v7, "insertObject:range:", v8, 0, -[NSConcreteAttributedString length](v6, "length"));
    if (-[NSAttributedString _willRequireIntentResolutionWhenContainingAttributes:](v6, "_willRequireIntentResolutionWhenContainingAttributes:", v8))
    {
      -[NSAttributedString _markRequiringIntentResolution](v6, "_markRequiringIntentResolution");
    }

    v6->attributes = &v7->super;
  }
  return v6;
}

- (NSConcreteAttributedString)initWithString:(id)a3
{
  uint64_t v6;
  NSString *v7;
  NSConcreteAttributedString *v8;
  NSConcreteAttributedString *v9;
  uint64_t v10;
  objc_class *v12;
  const char *v13;
  void *v14;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = _NSNameOfClass(v12);
      v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s %s: nil value"), v13, sel_getName(a2)), 0);
      objc_exception_throw(v14);
    }
    if ((initWithString__warned & 1) == 0)
    {
      v6 = objc_opt_class();
      v7 = NSStringFromSelector(a2);
      NSLog((NSString *)CFSTR("-[%@ %@] called with nil string argument. This has undefined behavior and will raise an exception in post-Leopard linked apps. This warning is displayed only once."), v6, v7);
      initWithString__warned = 1;
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)NSConcreteAttributedString;
  v8 = -[NSConcreteAttributedString init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(a3, "copyWithZone:", -[NSConcreteAttributedString zone](v8, "zone"));
    v9->string = (NSString *)v10;
    if (!a3 || v10)
    {
      v9->attributes = 0;
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (id)string
{
  return self->string;
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSUInteger v6;

  if (self->attributes)
    return -[NSRLEArray objectAtIndex:effectiveRange:](self->attributes, "objectAtIndex:effectiveRange:", a3, a4);
  if (a4)
  {
    v6 = -[NSString length](self->string, "length", a3);
    a4->location = 0;
    a4->length = v6;
  }
  return (id)objc_msgSend((id)_NSAttributeDictionaryClass(), "emptyAttributeDictionary");
}

- (id)_runArrayHoldingAttributes
{
  return self->attributes;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteAttributedString;
  -[NSConcreteAttributedString dealloc](&v3, sel_dealloc);
}

- (NSConcreteAttributedString)initWithAttributedString:(id)a3
{
  NSConcreteAttributedString *v4;
  void *v5;
  unint64_t v6;
  NSMutableRLEArray *v7;
  unint64_t i;
  void *v9;
  unint64_t v10;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = -[NSConcreteAttributedString initWithString:](self, "initWithString:", objc_msgSend(a3, "string"));
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = (void *)objc_msgSend(a3, "_runArrayHoldingAttributes");
      if (v5)
        v4->attributes = (NSRLEArray *)objc_msgSend(v5, "copyWithZone:", -[NSConcreteAttributedString zone](v4, "zone"));
    }
    if (!v4->attributes)
    {
      v6 = -[NSString length](v4->string, "length");
      v7 = -[NSRLEArray init](+[NSMutableRLEArray allocWithZone:](NSMutableRLEArray, "allocWithZone:", -[NSConcreteAttributedString zone](v4, "zone")), "init");
      if (v6)
      {
        for (i = 0; i < v6; i += v14)
        {
          v13 = 0;
          v14 = 0;
          v9 = (void *)objc_msgSend((id)_NSAttributeDictionaryClass(), "newWithDictionary:", objc_msgSend(a3, "attributesAtIndex:effectiveRange:", i, &v13));
          if (v14 + v13 <= v6)
            v10 = v13 - i + v14;
          else
            v10 = v6 - i;
          if (v13 != i || v14 + v13 > v6)
            v14 = v10;
          -[NSMutableRLEArray insertObject:range:](v7, "insertObject:range:", v9, i, v10);

        }
      }
      v4->attributes = &v7->super;
    }
    if (objc_msgSend(a3, "_mayRequireIntentResolution"))
      -[NSAttributedString _markRequiringIntentResolution](v4, "_markRequiringIntentResolution");
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (_CFExecutableLinkedOnOrAfter())
    return self;
  v6.receiver = self;
  v6.super_class = (Class)NSConcreteAttributedString;
  return -[NSAttributedString copyWithZone:](&v6, sel_copyWithZone_, a3);
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  NSUInteger v7;

  if (self->attributes)
    return (id)objc_msgSend(-[NSRLEArray objectAtIndex:effectiveRange:](self->attributes, "objectAtIndex:effectiveRange:", a4, a5), "objectForKey:", a3);
  if (a5)
  {
    v7 = -[NSString length](self->string, "length", a3, a4);
    a5->location = 0;
    a5->length = v7;
  }
  return 0;
}

- (NSConcreteAttributedString)init
{
  return -[NSConcreteAttributedString initWithString:](self, "initWithString:", &stru_1E0F56070);
}

@end
