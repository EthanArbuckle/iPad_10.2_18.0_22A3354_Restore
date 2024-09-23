@implementation NSJoin

+ (id)joinWithSourceAttributeName:(uint64_t)a3 destinationAttributeName:
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithSourceAttributeName:destinationAttributeName:", a2, a3);
}

- (NSJoin)initWithSourceAttributeName:(id)a3 destinationAttributeName:(id)a4
{
  NSJoin *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSJoin;
  v6 = -[NSJoin init](&v8, sel_init);
  if (v6)
  {
    v6->_sourceAttributeName = (NSString *)objc_msgSend(a3, "copy");
    v6->_destinationAttributeName = (NSString *)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSJoin;
  -[NSJoin dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  NSString *destinationAttributeName;
  char v8;

  if (!a3)
    return 0;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    return 0;
  if (self)
  {
    if (!-[NSString isEqualToString:](self->_sourceAttributeName, "isEqualToString:", *((_QWORD *)a3 + 1)))
      return 0;
    destinationAttributeName = self->_destinationAttributeName;
  }
  else
  {
    v8 = objc_msgSend(0, "isEqualToString:", *((_QWORD *)a3 + 1));
    destinationAttributeName = 0;
    if ((v8 & 1) == 0)
      return 0;
  }
  return -[NSString isEqualToString:](destinationAttributeName, "isEqualToString:", *((_QWORD *)a3 + 2));
}

- (unint64_t)hash
{
  uint64_t v3;
  NSString *destinationAttributeName;

  if (self)
  {
    v3 = -[NSString hash](self->_sourceAttributeName, "hash");
    destinationAttributeName = self->_destinationAttributeName;
  }
  else
  {
    v3 = objc_msgSend(0, "hash");
    destinationAttributeName = 0;
  }
  return -[NSString hash](destinationAttributeName, "hash") ^ v3;
}

- (NSJoin)initWithCoder:(id)a3
{
  return -[NSJoin initWithSourceAttributeName:destinationAttributeName:](self, "initWithSourceAttributeName:destinationAttributeName:", objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSSourceAttributeName")), objc_msgSend(a3, "decodeObjectForKey:", CFSTR("NSDestinationAttributeName")));
}

- (void)encodeWithCoder:(id)a3
{
  NSString *destinationAttributeName;

  if (self)
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_sourceAttributeName, CFSTR("NSSourceAttributeName"));
    destinationAttributeName = self->_destinationAttributeName;
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("NSSourceAttributeName"));
    destinationAttributeName = 0;
  }
  objc_msgSend(a3, "encodeObject:forKey:", destinationAttributeName, CFSTR("NSDestinationAttributeName"));
}

@end
