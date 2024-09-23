@implementation CACGPathCodingProxy

- (id)decodedObject
{
  return self->_path;
}

- (CACGPathCodingProxy)initWithCoder:(id)a3
{
  CACGPathCodingProxy *v4;
  uint64_t v5;
  void *v6;
  CGMutablePathRef Mutable;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)CACGPathCodingProxy;
  v4 = -[CACGPathCodingProxy init](&v12, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0CB3510], "CA_supportedClasses"), CFSTR("LKCGPathSegments"));
    if (v5)
    {
      v6 = (void *)v5;
      Mutable = CGPathCreateMutable();
      v8 = objc_msgSend(v6, "count");
      if (v8)
      {
        v9 = v8;
        for (i = 0; i != v9; ++i)
          objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", i), "addToCGPath:", Mutable);
      }
    }
    else
    {
      Mutable = 0;
    }
    v4->_path = Mutable;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  CGPathRelease(self->_path);
  v3.receiver = self;
  v3.super_class = (Class)CACGPathCodingProxy;
  -[CACGPathCodingProxy dealloc](&v3, sel_dealloc);
}

- (CACGPathCodingProxy)initWithObject:(id)a3
{
  CACGPathCodingProxy *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)CACGPathCodingProxy;
  v4 = -[CACGPathCodingProxy init](&v6, sel_init);
  if (v4)
    v4->_path = (CGPath *)MEMORY[0x186DBC640](a3);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  CGPathApply(self->_path, v5, (CGPathApplierFunction)encodePathSegment);
  objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("LKCGPathSegments"));

}

@end
