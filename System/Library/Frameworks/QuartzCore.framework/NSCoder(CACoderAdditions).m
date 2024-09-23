@implementation NSCoder(CACoderAdditions)

- (void)CA_decodeObjectForKey:()CACoderAdditions
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a1, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0CB3510], "CA_supportedClasses"), a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(v4, "decodedObject");
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(a1, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v5, "unarchiver:didDecodeObject:", a1, v4);
      }
    }
  }
  return v4;
}

+ (uint64_t)CA_supportedClasses
{
  if (+[NSCoder(CACoderAdditions) CA_supportedClasses]::once != -1)
    dispatch_once(&+[NSCoder(CACoderAdditions) CA_supportedClasses]::once, &__block_literal_global_318);
  return +[NSCoder(CACoderAdditions) CA_supportedClasses]::set;
}

- (void)CA_encodeObject:()CACoderAdditions forKey:conditional:
{
  objc_object *v8;
  CATintedImage *Proxy;
  void *Superclass;
  int v11;
  objc_class *Class;
  CATintedImage *v13;

  v8 = (objc_object *)objc_msgSend(a3, "replacementObjectForCoder:", a1);
  Proxy = CACodingCreateProxy(a1, v8);
  v13 = Proxy;
  if (Proxy)
    v8 = (objc_object *)Proxy;
  Superclass = (void *)-[objc_object classForKeyedArchiver](v8, "classForKeyedArchiver");
  if (!Superclass)
    Superclass = (void *)objc_opt_class();
  if (objc_msgSend(Superclass, "conformsToProtocol:", &unk_1EDD15DF8))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = objc_msgSend(Superclass, "supportsSecureCoding");
      if (Superclass)
      {
        if (v11)
        {
          while ((___ZL28class_supports_secure_codingP10objc_class_block_invoke((objc_class *)Superclass, sel_initWithCoder_) & 1) == 0)
          {
            Superclass = class_getSuperclass((Class)Superclass);
            if (!Superclass)
              goto LABEL_16;
          }
          Class = object_getClass(Superclass);
          if (___ZL28class_supports_secure_codingP10objc_class_block_invoke(Class, sel_supportsSecureCoding))
          {
            if ((a5 & 1) != 0)
              -[NSCoder encodeConditionalObject:forKey:](a1, "encodeConditionalObject:forKey:", v8, a4);
            else
              -[NSCoder encodeObject:forKey:](a1, "encodeObject:forKey:", v8, a4);
          }
        }
      }
    }
  }
LABEL_16:

}

- (void)CA_encodeCGFloatArray:()CACoderAdditions count:forKey:
{
  CFStringRef v7;
  CFStringRef v8;

  v7 = CACreateStringWithDoubleArray(a3, a4, 0.000001);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(a1, "encodeObject:forKey:", v7, a5);
    CFRelease(v8);
  }
}

- (BOOL)CA_decodeCGFloatArray:()CACoderAdditions count:forKey:
{
  uint64_t v7;
  void *i;

  v7 = objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), a5);
  if (v7)
  {
    for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v7); a4; --a4)
    {
      if ((objc_msgSend(i, "scanDouble:", a3) & 1) == 0)
        *a3 = 0;
      ++a3;
    }

  }
  return v7 != 0;
}

@end
