@implementation LKCGColorCodingProxy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LKCGColorCodingProxy)initWithCoder:(id)a3
{
  LKCGColorCodingProxy *v4;
  CGPattern *v5;
  CGPattern *v6;
  CFTypeID v7;
  CGColorRef v8;
  float v9;
  float v10;
  float v11;
  float v12;
  CGColorSpace *v13;
  objc_super v15;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)LKCGColorCodingProxy;
  v4 = -[LKCGColorCodingProxy init](&v15, sel_init);
  if (v4)
  {
    v5 = (CGPattern *)objc_msgSend(a3, "CA_decodeObjectForKey:", CFSTR("CGColorPattern"));
    if (!v5)
    {
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("r"));
      components[0] = v9;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("g"));
      components[1] = v10;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("b"));
      components[2] = v11;
      objc_msgSend(a3, "decodeFloatForKey:", CFSTR("a"));
      components[3] = v12;
      v13 = (CGColorSpace *)CAGetColorSpace(0x1Cu);
      v8 = CGColorCreate(v13, components);
      goto LABEL_6;
    }
    v6 = v5;
    v7 = CFGetTypeID(v5);
    if (v7 == CGPatternGetTypeID())
    {
      v8 = CA_CGPatternColorCreate(v6);
LABEL_6:
      v4->_color = v8;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)LKCGColorCodingProxy;
  -[LKCGColorCodingProxy dealloc](&v3, sel_dealloc);
}

- (id)decodedObject
{
  return self->_color;
}

- (LKCGColorCodingProxy)initWithObject:(id)a3
{
  LKCGColorCodingProxy *v4;
  CGColorRef v5;
  CGColorSpace *v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)LKCGColorCodingProxy;
  v4 = -[LKCGColorCodingProxy init](&v8, sel_init);
  if (v4)
  {
    if (!CGColorGetPattern((CGColorRef)a3))
    {
      v7 = (CGColorSpace *)CAGetColorSpace(0x1Cu);
      CARetainColorTransform(v7);
      v4->_color = (CGColor *)CGColorTransformConvertColor();
      CGColorTransformRelease();
      if (v4->_color)
        return v4;
      goto LABEL_4;
    }
    v5 = CGColorRetain((CGColorRef)a3);
    v4->_color = v5;
    if (!v5)
    {
LABEL_4:

      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  CGPatternRef Pattern;
  const CGFloat *Components;
  double v7;
  double v8;
  double v9;
  double v10;

  Pattern = CGColorGetPattern(self->_color);
  if (Pattern)
  {
    objc_msgSend(a3, "CA_encodeObject:forKey:conditional:", Pattern, CFSTR("CGColorPattern"), 0);
  }
  else
  {
    Components = CGColorGetComponents(self->_color);
    v7 = *Components;
    *(float *)&v7 = *Components;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("r"), v7);
    v8 = Components[1];
    *(float *)&v8 = v8;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("g"), v8);
    v9 = Components[2];
    *(float *)&v9 = v9;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("b"), v9);
    v10 = Components[3];
    *(float *)&v10 = v10;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("a"), v10);
  }
}

@end
