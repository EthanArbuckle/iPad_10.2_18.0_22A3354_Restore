@implementation _NSAttributeDescriptor

+ (void)initialize
{
  if (_NSAttributeDescriptor == a1)
  {
    objc_opt_class();
    objc_opt_class();
    objc_opt_class();
  }
}

- (_NSAttributeDescriptor)initWithName:(id)a3
{
  _NSAttributeDescriptor *v4;

  v4 = -[_NSAttributeDescriptor init](self, "init");
  if (v4)
    v4->_name = (NSString *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSAttributeDescriptor;
  -[_NSAttributeDescriptor dealloc](&v3, sel_dealloc);
}

- (id)attributeValueFromValue:(id)a3
{
  objc_class *v5;

  v5 = NSClassFromString((NSString *)CFSTR("_NSAttributeDescriptor"));
  NSRequestConcreteImplementation((uint64_t)self, a2, v5);
}

- (NSString)name
{
  return self->_name;
}

+ (id)descriptorForAttributeKey:(id)a3
{
  id v4;
  id result;
  _QWORD __key[3];

  __key[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "hasPrefix:", CFSTR("NS")) & 1) != 0)
  {
    v4 = a3;
  }
  else if (objc_msgSend(a3, "length"))
  {
    v4 = 0;
    if (-[NSCharacterSet characterIsMember:](+[NSCharacterSet lowercaseLetterCharacterSet](NSCharacterSet, "lowercaseLetterCharacterSet"), "characterIsMember:", objc_msgSend(a3, "characterAtIndex:", 0)))
    {
      v4 = (id)objc_msgSend(a3, "mutableCopy");
      objc_msgSend(v4, "replaceCharactersInRange:withString:", 0, 1, objc_msgSend((id)objc_msgSend(a3, "substringWithRange:", 0, 1), "capitalizedString"));
      objc_msgSend(v4, "insertString:atIndex:", CFSTR("NS"), 0);
      objc_msgSend(v4, "appendString:", CFSTR("AttributeName"));
    }
  }
  else
  {
    v4 = 0;
  }
  result = (id)objc_msgSend(v4, "length");
  if (result)
  {
    __key[0] = v4;
    __key[1] = 0;
    result = bsearch_b(__key, &attributeKeyToDescriptor, 0xCuLL, 0x10uLL, &__block_literal_global_27);
    if (result)
      return (id)*((_QWORD *)result + 1);
  }
  return result;
}

@end
