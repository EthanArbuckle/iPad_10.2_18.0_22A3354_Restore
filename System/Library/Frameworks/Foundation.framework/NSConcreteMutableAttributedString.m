@implementation NSConcreteMutableAttributedString

- (unint64_t)length
{
  return -[NSString length](self->mutableString, "length");
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return -[NSRLEArray objectAtIndex:effectiveRange:](self->mutableAttributes, "objectAtIndex:effectiveRange:", a3, a4);
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  return (id)objc_msgSend(-[NSRLEArray objectAtIndex:effectiveRange:](self->mutableAttributes, "objectAtIndex:effectiveRange:", a4, a5), "objectForKey:", a3);
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    v7 = (void *)objc_msgSend((id)_NSAttributeDictionaryClass(), "newWithDictionary:", a3);
    -[NSMutableRLEArray replaceObjectsInRange:withObject:length:](self->mutableAttributes, "replaceObjectsInRange:withObject:length:", location, length, v7, length);
    if (-[NSAttributedString _willRequireIntentResolutionWhenContainingAttributes:](self, "_willRequireIntentResolutionWhenContainingAttributes:", v7))
    {
      -[NSConcreteMutableAttributedString _markRequiringIntentResolution](self, "_markRequiringIntentResolution");
    }

    -[NSConcreteMutableAttributedString edited:range:changeInLength:](self, "edited:range:changeInLength:", 1, location, length, 0);
  }
}

- (NSConcreteMutableAttributedString)initWithAttributedString:(id)a3
{
  NSConcreteMutableAttributedString *v4;
  NSConcreteMutableAttributedString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t i;
  void *v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v16;
  unint64_t v17;
  objc_super v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)NSConcreteMutableAttributedString;
  v4 = -[NSConcreteMutableAttributedString init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = -[NSConcreteMutableAttributedString zone](v4, "zone");
    v7 = (void *)objc_msgSend((id)objc_opt_class(), "_mutableStringClass");
    if (a3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(a3, "_runArrayHoldingAttributes");
        if (v8)
          v5->mutableAttributes = (NSMutableRLEArray *)objc_msgSend(v8, "mutableCopyWithZone:", v6);
      }
      if (!v5->mutableAttributes)
      {
        v9 = objc_msgSend((id)objc_msgSend(a3, "string"), "length");
        v5->mutableAttributes = -[NSRLEArray init](+[NSMutableRLEArray allocWithZone:](NSMutableRLEArray, "allocWithZone:", v6), "init");
        if (v9)
        {
          for (i = 0; i < v9; i += v17)
          {
            v16 = 0;
            v17 = 0;
            v11 = (void *)objc_msgSend((id)_NSAttributeDictionaryClass(), "newWithDictionary:", objc_msgSend(a3, "attributesAtIndex:effectiveRange:", i, &v16));
            if (v17 + v16 <= v9)
              v12 = v16 - i + v17;
            else
              v12 = v9 - i;
            if (v16 != i || v17 + v16 > v9)
              v17 = v12;
            -[NSMutableRLEArray insertObject:range:](v5->mutableAttributes, "insertObject:range:", v11, i, v12);

          }
        }
      }
      if (v7 == (void *)__NSMutableStringClass)
        v14 = objc_msgSend((id)objc_msgSend(a3, "string"), "mutableCopyWithZone:", v6);
      else
        v14 = objc_msgSend((id)objc_msgSend(v7, "allocWithZone:", v6), "initWithString:", objc_msgSend(a3, "string"));
      v5->mutableString = (NSMutableString *)v14;
      if (objc_msgSend(a3, "_mayRequireIntentResolution"))
        -[NSConcreteMutableAttributedString _markRequiringIntentResolution](v5, "_markRequiringIntentResolution");
    }
    else
    {
      v5->mutableAttributes = -[NSRLEArray init](+[NSMutableRLEArray allocWithZone:](NSMutableRLEArray, "allocWithZone:", v6), "init");
      v5->mutableString = (NSMutableString *)objc_msgSend((id)objc_msgSend(v7, "allocWithZone:", v6), "init");
    }
  }
  return v5;
}

+ (Class)_mutableStringClass
{
  return (Class)__NSMutableStringClass;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  length = a3.length;
  location = a3.location;
  v13 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a4, "string");
  v9 = objc_msgSend(v8, "length");
  if (v9)
  {
    v11 = 0;
    v12 = 0;
    do
    {
      v10 = (void *)objc_msgSend((id)_NSAttributeDictionaryClass(), "newWithDictionary:", objc_msgSend(a4, "attributesAtIndex:effectiveRange:", v11, &v11));
      -[NSMutableRLEArray insertObject:range:](self->mutableAttributes, "insertObject:range:", v10, v11 + location, v12);

      v11 += v12;
    }
    while (v11 < v9);
  }
  if (length)
    -[NSMutableRLEArray deleteObjectsInRange:](self->mutableAttributes, "deleteObjectsInRange:", v9 + location, length);
  -[NSMutableString replaceCharactersInRange:withString:](self->mutableString, "replaceCharactersInRange:withString:", location, length, v8);
  if (objc_msgSend(a4, "_mayRequireIntentResolution"))
    -[NSConcreteMutableAttributedString _markRequiringIntentResolution](self, "_markRequiringIntentResolution");
  -[NSConcreteMutableAttributedString edited:range:changeInLength:](self, "edited:range:changeInLength:", 3, location, length, v9 - length);
}

- (id)string
{
  return self->mutableString;
}

- (BOOL)_mayRequireIntentResolution
{
  return *((_BYTE *)&self->fields + 1) != 0;
}

- (id)_runArrayHoldingAttributes
{
  return self->mutableAttributes;
}

- (NSConcreteMutableAttributedString)initWithString:(id)a3
{
  uint64_t v6;
  NSString *v7;
  NSConcreteMutableAttributedString *v8;
  NSConcreteMutableAttributedString *v9;
  objc_class *v11;
  const char *v12;
  void *v13;

  if (!a3)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = _NSNameOfClass(v11);
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s %s: nil value"), v12, sel_getName(a2)), 0);
      objc_exception_throw(v13);
    }
    if ((initWithString__warned_120 & 1) == 0)
    {
      v6 = objc_opt_class();
      v7 = NSStringFromSelector(a2);
      NSLog((NSString *)CFSTR("-[%@ %@] called with nil string argument. This has undefined behavior and will raise an exception in post-Leopard linked apps. This warning is displayed only once."), v6, v7);
      initWithString__warned_120 = 1;
    }
  }
  v8 = -[NSConcreteMutableAttributedString initWithAttributedString:](self, "initWithAttributedString:", 0);
  v9 = v8;
  if (v8)
    -[NSConcreteMutableAttributedString replaceCharactersInRange:withString:](v8, "replaceCharactersInRange:withString:", 0, 0, a3);
  return v9;
}

- (NSConcreteMutableAttributedString)initWithString:(id)a3 attributes:(id)a4
{
  uint64_t v8;
  NSString *v9;
  NSConcreteMutableAttributedString *v10;
  NSConcreteMutableAttributedString *v11;
  void *v12;
  uint64_t v13;
  objc_class *v15;
  const char *v16;
  void *v17;

  if (!a3)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v15 = (objc_class *)objc_opt_class();
      v16 = _NSNameOfClass(v15);
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s %s: nil value"), v16, sel_getName(a2)), 0);
      objc_exception_throw(v17);
    }
    if ((initWithString_attributes__warned & 1) == 0)
    {
      v8 = objc_opt_class();
      v9 = NSStringFromSelector(a2);
      NSLog((NSString *)CFSTR("-[%@ %@] called with nil string argument. This has undefined behavior and will raise an exception in post-Leopard linked apps. This warning is displayed only once."), v8, v9);
      initWithString_attributes__warned = 1;
    }
  }
  v10 = -[NSConcreteMutableAttributedString initWithAttributedString:](self, "initWithAttributedString:", 0);
  v11 = v10;
  if (v10)
  {
    -[NSConcreteMutableAttributedString replaceCharactersInRange:withString:](v10, "replaceCharactersInRange:withString:", 0, 0, a3);
    v12 = (void *)objc_msgSend((id)_NSAttributeDictionaryClass(), "newWithDictionary:", a4);
    v13 = -[NSConcreteMutableAttributedString length](v11, "length");
    -[NSMutableRLEArray replaceObjectsInRange:withObject:length:](v11->mutableAttributes, "replaceObjectsInRange:withObject:length:", 0, v13, v12, v13);
    if (-[NSAttributedString _willRequireIntentResolutionWhenContainingAttributes:](v11, "_willRequireIntentResolutionWhenContainingAttributes:", v12))
    {
      -[NSConcreteMutableAttributedString _markRequiringIntentResolution](v11, "_markRequiringIntentResolution");
    }

  }
  return v11;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  id v9;
  id v10;
  NSMutableRLEArray *mutableAttributes;
  NSUInteger v12;
  id v13;
  id v14;

  length = a3.length;
  location = a3.location;
  v8 = objc_msgSend(a4, "length");
  if (v8)
  {
    if (length)
    {
      v9 = -[NSRLEArray objectAtIndex:effectiveRange:](self->mutableAttributes, "objectAtIndex:effectiveRange:", location, 0);
      v10 = v9;
      goto LABEL_6;
    }
    if (location)
    {
      mutableAttributes = self->mutableAttributes;
      v12 = location - 1;
    }
    else
    {
      if (!-[NSString length](self->mutableString, "length"))
      {
        v13 = (id)objc_msgSend((id)_NSAttributeDictionaryClass(), "emptyAttributeDictionary");
LABEL_14:
        v9 = v13;
        v14 = v13;
        -[NSMutableRLEArray insertObject:range:](self->mutableAttributes, "insertObject:range:", v9, location, v8);
        if (!v9)
          goto LABEL_8;
        goto LABEL_7;
      }
      mutableAttributes = self->mutableAttributes;
      v12 = 0;
    }
    v13 = -[NSRLEArray objectAtIndex:effectiveRange:](mutableAttributes, "objectAtIndex:effectiveRange:", v12, 0);
    goto LABEL_14;
  }
  if (!length)
    goto LABEL_8;
  v9 = 0;
LABEL_6:
  -[NSMutableRLEArray replaceObjectsInRange:withObject:length:](self->mutableAttributes, "replaceObjectsInRange:withObject:length:", location, length, v9, v8);
  if (v9)
LABEL_7:

LABEL_8:
  -[NSMutableString replaceCharactersInRange:withString:](self->mutableString, "replaceCharactersInRange:withString:", location, length, a4);
  -[NSConcreteMutableAttributedString edited:range:changeInLength:](self, "edited:range:changeInLength:", 2, location, length, v8 - length);
}

- (NSConcreteMutableAttributedString)initWithCoder:(id)a3
{
  NSConcreteMutableAttributedString *v4;

  v4 = -[NSConcreteMutableAttributedString init](self, "init");
  if ((_NSReadMutableAttributedStringWithCoder(a3, v4) & 1) == 0)
  {

    return 0;
  }
  return v4;
}

- (id)attribute:(id)a3 atIndex:(unint64_t)a4 longestEffectiveRange:(_NSRange *)a5 inRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  void *v10;
  NSUInteger v11;
  NSUInteger v12;
  objc_class *v13;
  IMP MethodImplementation;
  objc_class *v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  BOOL v27;
  _NSRange *v29;
  NSUInteger v30;
  IMP v31;
  uint64_t v33;
  NSUInteger v34;
  uint64_t v35;
  _QWORD v36[2];

  length = a6.length;
  location = a6.location;
  v36[1] = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36[0] = 0;
  v34 = 0;
  v10 = (void *)objc_msgSend(-[NSRLEArray objectAtIndex:effectiveRange:runIndex:](self->mutableAttributes, "objectAtIndex:effectiveRange:runIndex:", a4, &v34, v36), "objectForKey:", a3);
  if (a5)
  {
    v29 = a5;
    v33 = 0;
    v11 = v34;
    v12 = v35 + v34;
    v30 = location + length;
    v13 = (objc_class *)objc_opt_class();
    MethodImplementation = class_getMethodImplementation(v13, sel_objectAtRunIndex_length_);
    if (v10)
    {
      v15 = (objc_class *)objc_opt_class();
      v31 = class_getMethodImplementation(v15, sel_isEqual_);
    }
    else
    {
      v31 = 0;
    }
    v16 = v36[0];
    if (v12 < v30)
    {
      v17 = location;
      v18 = v36[0] + 1;
      do
      {
        v19 = (void *)((uint64_t (*)(NSMutableRLEArray *, char *, uint64_t, uint64_t *))MethodImplementation)(self->mutableAttributes, sel_objectAtRunIndex_length_, v18, &v33);
        if (!v19)
          break;
        v20 = objc_msgSend(v19, "objectForKey:", a3);
        if (v10 != (void *)v20
          && (!v10 || !((unsigned int (*)(void *, char *, uint64_t))v31)(v10, sel_isEqual_, v20)))
        {
          break;
        }
        v12 += v33;
        ++v18;
      }
      while (v12 < v30);
      v16 = v36[0];
      location = v17;
    }
    v21 = location;
    if (v11 > location)
    {
      v22 = v16 - 1;
      do
      {
        v23 = objc_msgSend((id)((uint64_t (*)(NSMutableRLEArray *, char *, uint64_t, uint64_t *))MethodImplementation)(self->mutableAttributes, sel_objectAtRunIndex_length_, v22, &v33), "objectForKey:", a3);
        if (v10 != (void *)v23
          && (!v10 || !((unsigned int (*)(void *, char *, uint64_t))v31)(v10, sel_isEqual_, v23)))
        {
          break;
        }
        v11 -= v33;
        --v22;
      }
      while (v11 > v21);
    }
    v24 = v30;
    if (v30 >= v12)
      v24 = v12;
    if (v11 > v21 || v21 >= v12)
    {
      v25 = v24 - v11;
      if (v11 < v30)
        v26 = v11;
      else
        v26 = 0;
      if (v11 >= v30)
        v25 = 0;
      v27 = v21 > v11;
      if (v21 <= v11)
        v21 = v26;
      else
        v21 = 0;
      if (v27)
        v25 = 0;
    }
    else
    {
      v25 = v24 - v21;
    }
    v29->location = v21;
    v29->length = v25;
  }
  return v10;
}

- (void)addAttribute:(id)a3 value:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger v11;
  id v12;
  id v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  BOOL v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v21;
  id v22;
  objc_class *v24;
  const char *v25;
  void *v26;
  NSUInteger v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (a5.length)
  {
    if (!a4)
    {
      v24 = (objc_class *)objc_opt_class();
      v25 = _NSNameOfClass(v24);
      v26 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s %s: nil value"), v25, sel_getName(a2)), 0);
      objc_exception_throw(v26);
    }
    length = a5.length;
    location = a5.location;
    v10 = a5.length;
    v11 = a5.location;
    do
    {
      v27 = 0;
      v28 = 0;
      v12 = -[NSRLEArray objectAtIndex:effectiveRange:](self->mutableAttributes, "objectAtIndex:effectiveRange:", v11, &v27);
      v13 = v12;
      v14 = v27;
      if (v28 + v27 >= v11 + v10)
        v15 = v11 + v10;
      else
        v15 = v28 + v27;
      v16 = v15 - v11;
      v17 = v27 > v11 || v11 >= v28 + v27;
      if (v17)
        v18 = 0;
      else
        v18 = v11;
      if (v17)
        v16 = 0;
      v19 = v15 - v27;
      if (v11 > v27 || v27 >= v11 + v10)
      {
        v14 = v18;
        v21 = v16;
      }
      else
      {
        v21 = v19;
      }
      v27 = v14;
      v28 = v21;
      v22 = (id)objc_msgSend(v12, "newWithKey:object:", a3, a4);
      if (v22 != v13)
        -[NSMutableRLEArray replaceObjectsInRange:withObject:length:](self->mutableAttributes, "replaceObjectsInRange:withObject:length:", v27, v28, v22, v28);

      v11 += v28;
      v10 -= v28;
    }
    while (v10);
    if (-[NSAttributedString _willRequireIntentResolutionWhenContainingAttribute:value:](self, "_willRequireIntentResolutionWhenContainingAttribute:value:", a3, a4))
    {
      -[NSConcreteMutableAttributedString _markRequiringIntentResolution](self, "_markRequiringIntentResolution");
    }
    -[NSConcreteMutableAttributedString edited:range:changeInLength:](self, "edited:range:changeInLength:", 1, location, length, 0);
  }
}

- (NSConcreteMutableAttributedString)init
{
  return -[NSConcreteMutableAttributedString initWithString:](self, "initWithString:", &stru_1E0F56070);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteMutableAttributedString;
  -[NSConcreteMutableAttributedString dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_markRequiringIntentResolution
{
  *((_BYTE *)&self->fields + 1) = 1;
}

- (void)_markIntentsResolved
{
  *(_DWORD *)&self->fields &= 0xFFFF00FF;
}

@end
