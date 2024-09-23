@implementation CIColor

- (CGFloat)alpha
{
  return CGColorGetAlpha((CGColorRef)self->_priv);
}

+ (CIColor)colorWithCGColor:(CGColorRef)c
{
  return (CIColor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithCGColor:", c);
}

- (CIColor)initWithCGColor:(CGColorRef)c
{
  CIColor *v3;
  CIColor *v5;
  CGColor *priv;
  CGColorRef v7;
  objc_super v9;
  CGFloat components[2];
  __int128 v11;
  uint64_t v12;

  v3 = self;
  v12 = *MEMORY[0x1E0C80C00];
  if (!c)
  {
    *(_OWORD *)components = 0u;
    v11 = 0u;
    if (GetDefaultColorSpace(void)::onceToken != -1)
      dispatch_once(&GetDefaultColorSpace(void)::onceToken, &__block_literal_global_5);
    v7 = CGColorCreate((CGColorSpaceRef)GetDefaultColorSpace(void)::cs, components);
    goto LABEL_9;
  }
  v9.receiver = self;
  v9.super_class = (Class)CIColor;
  v5 = -[CIColor init](&v9, sel_init);
  v3 = v5;
  if (v5)
  {
    priv = (CGColor *)v5->_priv;
    if (priv)
      CGColorRelease(priv);
    v7 = CGColorRetain(c);
LABEL_9:
    v3->_priv = v7;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease((CGColorRef)self->_priv);
  CGColorRelease((CGColorRef)self->_pad[0]);
  v3.receiver = self;
  v3.super_class = (Class)CIColor;
  -[CIColor dealloc](&v3, sel_dealloc);
}

- (CGFloat)blue
{
  CGColor *v2;

  v2 = -[CIColor rgbColor](self, "rgbColor");
  if (v2)
    return CGColorGetComponents(v2)[2];
  else
    return 0.0;
}

- (CGFloat)green
{
  CGColor *v2;

  v2 = -[CIColor rgbColor](self, "rgbColor");
  if (v2)
    return CGColorGetComponents(v2)[1];
  else
    return 0.0;
}

- (CGFloat)red
{
  CGColor *v2;

  v2 = -[CIColor rgbColor](self, "rgbColor");
  if (v2)
    return *CGColorGetComponents(v2);
  else
    return 0.0;
}

- (CGColor)rgbColor
{
  CGColor *v3;
  CGColorSpace *ColorSpace;
  CGColor *result;
  unsigned __int8 v6;

  v3 = -[CIColor cgColor](self, "cgColor");
  ColorSpace = CGColorGetColorSpace(v3);
  if (CGColorSpaceGetModel(ColorSpace) == kCGColorSpaceModelRGB)
    return v3;
  result = (CGColor *)self->_pad[0];
  if (!result)
  {
    {
      if (GetDefaultColorSpace(void)::onceToken != -1)
        dispatch_once(&GetDefaultColorSpace(void)::onceToken, &__block_literal_global_5);
      GetTransformToDefault(void)::transform = MEMORY[0x194024BA0](GetDefaultColorSpace(void)::cs, 0);
    }
    result = (CGColor *)CGColorTransformConvertColor();
    self->_pad[0] = result;
  }
  return result;
}

- (CGColor)cgColor
{
  return (CGColor *)self->_priv;
}

+ (CIColor)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a
{
  return (CIColor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:", r, g, b, a);
}

+ (CIColor)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b
{
  return (CIColor *)objc_msgSend(a1, "colorWithRed:green:blue:alpha:", r, g, b, 1.0);
}

+ (CIColor)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a colorSpace:(CGColorSpaceRef)colorSpace
{
  return (CIColor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRed:green:blue:alpha:colorSpace:", colorSpace, r, g, b, a);
}

+ (CIColor)colorWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b colorSpace:(CGColorSpaceRef)colorSpace
{
  return (CIColor *)objc_msgSend(a1, "colorWithRed:green:blue:alpha:colorSpace:", colorSpace, r, g, b, 1.0);
}

+ (CIColor)colorWithString:(NSString *)representation
{
  return (CIColor *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithString:", representation);
}

- (CIColor)init
{
  return -[CIColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
}

- (CIColor)initWithString:(id)a3
{
  char *v4;
  char *v5;
  int v6;
  uint64_t v7;
  __int128 v9;
  char *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (char *)objc_msgSend(a3, "UTF8String");
  if (!v4)
    return -[CIColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.0);
  v5 = v4;
  v10 = 0;
  v6 = *v4;
  if (v6 == 91 || v6 == 40)
    v5 = v4 + 1;
  v7 = 0;
  while (1)
  {
    *((double *)&v11 + v7) = strtod(v5, &v10);
    if (v10 == v5)
      break;
    ++v7;
    v5 = v10;
    if (v7 == 4)
      return -[CIColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v11, v12);
  }
  switch((int)v7)
  {
    case 0:
      v11 = 0uLL;
      *(_QWORD *)&v12 = 0;
      goto LABEL_13;
    case 1:
      *((_QWORD *)&v11 + 1) = v11;
      *(_QWORD *)&v12 = v11;
      goto LABEL_13;
    case 2:
      v9 = v11;
      *((_QWORD *)&v11 + 1) = v11;
      v12 = v9;
      return -[CIColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v11, v12);
    case 3:
LABEL_13:
      *((_QWORD *)&v12 + 1) = 0x3FF0000000000000;
      break;
    default:
      return -[CIColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v11, v12);
  }
  return -[CIColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v11, v12);
}

- (CIColor)initWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b
{
  return -[CIColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", r, g, b, 1.0);
}

- (CIColor)initWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a
{
  if (GetDefaultColorSpace(void)::onceToken != -1)
    dispatch_once(&GetDefaultColorSpace(void)::onceToken, &__block_literal_global_5);
  return -[CIColor initWithRed:green:blue:alpha:colorSpace:](self, "initWithRed:green:blue:alpha:colorSpace:", GetDefaultColorSpace(void)::cs, r, g, b, a);
}

- (CIColor)initWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b colorSpace:(CGColorSpaceRef)colorSpace
{
  return -[CIColor initWithRed:green:blue:alpha:colorSpace:](self, "initWithRed:green:blue:alpha:colorSpace:", colorSpace, r, g, b, 1.0);
}

- (CIColor)initWithRed:(CGFloat)r green:(CGFloat)g blue:(CGFloat)b alpha:(CGFloat)a colorSpace:(CGColorSpaceRef)colorSpace
{
  CGColor *v13;
  CIColor *v14;
  NSObject *v15;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  if (CGColorSpaceGetModel(colorSpace) == kCGColorSpaceModelRGB)
  {
    components[0] = r;
    components[1] = g;
    components[2] = b;
    components[3] = a;
    v13 = CGColorCreate(colorSpace, components);
    v14 = -[CIColor initWithCGColor:](self, "initWithCGColor:", v13);
    CGColorRelease(v13);
  }
  else
  {
    v15 = ci_logger_api();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CIColor initWithRed:green:blue:alpha:colorSpace:].cold.1(v15);

    return 0;
  }
  return v14;
}

- (size_t)numberOfComponents
{
  return CGColorGetNumberOfComponents((CGColorRef)self->_priv);
}

- (const)components
{
  return CGColorGetComponents((CGColorRef)self->_priv);
}

- (NSString)stringRepresentation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CIColor red](self, "red");
  v5 = v4;
  -[CIColor green](self, "green");
  v7 = v6;
  -[CIColor blue](self, "blue");
  v9 = v8;
  -[CIColor alpha](self, "alpha");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%g %g %g %g"), v5, v7, v9, v10);
}

- (CGColorSpaceRef)colorSpace
{
  return CGColorGetColorSpace((CGColorRef)self->_priv);
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && CGColorEqualToColor(-[CIColor cgColor](self, "cgColor"), (CGColorRef)objc_msgSend(a3, "cgColor"));
}

- (unint64_t)hash
{
  CGColorSpaceRef ColorSpace;
  int NumberOfComponents;
  const CGFloat *Components;
  unint64_t v6;
  uint64_t v7;
  double v8;

  ColorSpace = CGColorGetColorSpace((CGColorRef)self->_priv);
  NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)self->_priv);
  Components = CGColorGetComponents((CGColorRef)self->_priv);
  v6 = 33 * (_QWORD)ColorSpace + NumberOfComponents;
  if (NumberOfComponents >= 1)
  {
    v7 = NumberOfComponents;
    do
    {
      v8 = *Components++;
      v6 = 33 * v6 + (int)vcvtd_n_s64_f64(v8, 0xAuLL);
      --v7;
    }
    while (v7);
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CIColor initWithCGColor:](+[CIColor allocWithZone:](CIColor, "allocWithZone:", a3), "initWithCGColor:", self->_priv);
}

- (void)encodeWithCoder:(id)a3
{
  CGColor *v4;
  const CGFloat *Components;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = -[CIColor rgbColor](self, "rgbColor");
  if (v4)
  {
    Components = CGColorGetComponents(v4);
    v6 = *Components;
    *(float *)&v6 = *Components;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("red"), v6);
    v7 = Components[1];
    *(float *)&v7 = v7;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("green"), v7);
    v8 = Components[2];
    *(float *)&v8 = v8;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("blue"), v8);
    v9 = Components[3];
    *(float *)&v9 = v9;
    objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("alpha"), v9);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIColor)initWithCoder:(id)a3
{
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;
  double v10;
  float v11;

  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("red"));
  v6 = v5;
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("green"));
  v8 = v7;
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("blue"));
  v10 = v9;
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("alpha"));
  return -[CIColor initWithRed:green:blue:alpha:](self, "initWithRed:green:blue:alpha:", v6, v8, v10, v11);
}

- (id)description
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __22__CIColor_description__block_invoke;
  v3[3] = &unk_1E2EC2F58;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

uint64_t __22__CIColor_description__block_invoke(uint64_t a1, FILE *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;

  fprintf(a2, "<CIColor %p ", *(const void **)(a1 + 32));
  v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfComponents");
  v5 = objc_msgSend(*(id *)(a1 + 32), "components");
  if (v4 >= 1)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      if (v7)
        v8 = " ";
      else
        v8 = "(";
      fprintf(a2, "%s%g", v8, *(double *)(v6 + v7));
      v7 += 8;
    }
    while (8 * v4 != v7);
  }
  fwrite(") ", 2uLL, 1uLL, a2);
  CI::fprintf_cs(a2, (__sFILE *)objc_msgSend(*(id *)(a1 + 32), "colorSpace"), (CGColorSpace *)1);
  return fputc(62, a2);
}

+ (CIColor)blackColor
{
  objc_opt_self();
  return (CIColor *)&+[CIColor blackColor]::c;
}

+ (CIColor)whiteColor
{
  objc_opt_self();
  return (CIColor *)&+[CIColor whiteColor]::c;
}

+ (CIColor)grayColor
{
  objc_opt_self();
  return (CIColor *)&+[CIColor grayColor]::c;
}

+ (CIColor)redColor
{
  objc_opt_self();
  return (CIColor *)&+[CIColor redColor]::c;
}

+ (CIColor)greenColor
{
  objc_opt_self();
  return (CIColor *)&+[CIColor greenColor]::c;
}

+ (CIColor)blueColor
{
  objc_opt_self();
  return (CIColor *)&+[CIColor blueColor]::c;
}

+ (CIColor)cyanColor
{
  objc_opt_self();
  return (CIColor *)&+[CIColor cyanColor]::c;
}

+ (CIColor)magentaColor
{
  objc_opt_self();
  return (CIColor *)&+[CIColor magentaColor]::c;
}

+ (CIColor)yellowColor
{
  objc_opt_self();
  return (CIColor *)&+[CIColor yellowColor]::c;
}

+ (CIColor)clearColor
{
  objc_opt_self();
  return (CIColor *)&+[CIColor clearColor]::c;
}

- (id)debugQuickLookObject
{
  Class v3;
  Class v4;
  SEL Uid;

  v3 = NSClassFromString(CFSTR("UIColor"));
  if (v3 && (v4 = v3, (Uid = sel_getUid("colorWithCIColor:")) != 0))
    return (id)-[objc_class performSelector:withObject:](v4, "performSelector:withObject:", Uid, self);
  else
    return 0;
}

- (void)initWithRed:(os_log_t)log green:blue:alpha:colorSpace:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136446210;
  v2 = "-[CIColor initWithRed:green:blue:alpha:colorSpace:]";
  _os_log_error_impl(&dword_1921E4000, log, OS_LOG_TYPE_ERROR, "%{public}s colorSpace must be kCGColorSpaceModelRGB.", (uint8_t *)&v1, 0xCu);
}

@end
