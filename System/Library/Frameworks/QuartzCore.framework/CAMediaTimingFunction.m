@implementation CAMediaTimingFunction

- (float)_solveForInput:(float)a3
{
  const double *v4;
  _OWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(v6, 0, sizeof(v6));
  -[CAMediaTimingFunction _getPoints:](self, "_getPoints:", v6);
  return CA::Render::TimingFunction::evaluate((CA::Render::TimingFunction *)v6, v4, a3, 0.00001);
}

- (void)_getPoints:(double *)a3
{
  float32x2_t *priv;
  float64x2_t v4;

  priv = (float32x2_t *)self->_priv;
  v4 = vcvtq_f64_f32(priv[1]);
  *(float64x2_t *)a3 = vcvtq_f64_f32(*priv);
  *((float64x2_t *)a3 + 1) = v4;
}

+ (void)CAMLParserEndElement:(id)a3 content:(id)a4
{
  void *v5;
  unsigned int v6;
  BOOL v7;
  const char *v8;
  size_t v9;
  CAML *v10;
  double v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  const char *v18;
  CAML *v19;
  CAMediaTimingFunction *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CAMediaTimingFunction *v25;
  CAMediaTimingFunction *v26;
  CAML *v27[2];

  v27[1] = *(CAML **)MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a4, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"));
  if (objc_msgSend(v5, "length"))
  {
    v6 = objc_msgSend(v5, "characterAtIndex:", 0);
    if ((v6 > 0xFF || (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v6 + 60) & 0x400) == 0)
      && (v6 <= 0x2E ? (v7 = ((1 << v6) & 0x680000000000) == 0) : (v7 = 1), v7))
    {
      v26 = +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", v5);
      if (v26)
        objc_msgSend(a3, "setElementValue:", v26);
      else
        objc_msgSend(a3, "parserError:", CFSTR("Unknown timing function: %@"), v5);
    }
    else
    {
      v8 = (const char *)objc_msgSend(v5, "UTF8String");
      v9 = strlen(v8);
      v10 = (CAML *)&v8[v9];
      v27[0] = (CAML *)v8;
      v11 = x_strtod(v8, v27, &v8[v9]);
      v27[0] = CAML::skip_whitespace(v27[0], v10, v12);
      v13 = x_strtod((const char *)v27[0], v27, (const char *)v10);
      v27[0] = CAML::skip_whitespace(v27[0], v10, v14);
      v15 = x_strtod((const char *)v27[0], v27, (const char *)v10);
      v27[0] = CAML::skip_whitespace(v27[0], v10, v16);
      v17 = x_strtod((const char *)v27[0], v27, (const char *)v10);
      v19 = CAML::skip_whitespace(v27[0], v10, v18);
      v20 = [CAMediaTimingFunction alloc];
      *(float *)&v11 = v11;
      LODWORD(v21) = LODWORD(v11);
      *(float *)&v13 = v13;
      LODWORD(v22) = LODWORD(v13);
      *(float *)&v15 = v15;
      LODWORD(v23) = LODWORD(v15);
      *(float *)&v17 = v17;
      LODWORD(v24) = LODWORD(v17);
      v25 = -[CAMediaTimingFunction initWithControlPoints::::](v20, "initWithControlPoints::::", v21, v22, v23, v24);
      objc_msgSend(a3, "setElementValue:", v25);

      if (v19 < v10)
      {
        if (*(_BYTE *)v19)
          objc_msgSend(a3, "parserWarning:", CFSTR("Ignoring trailing characters"));
      }
    }
  }
  else
  {
    objc_msgSend(a3, "parserError:", CFSTR("No timing function data"));
  }
}

+ (CAMediaTimingFunction)functionWithName:(CAMediaTimingFunctionName)name
{
  unsigned int v4;

  if (-[NSString isEqualToString:](name, "isEqualToString:", CFSTR("default")))
  {
    v4 = 0;
    return (CAMediaTimingFunction *)builtin_function(v4);
  }
  if (-[NSString isEqualToString:](name, "isEqualToString:", CFSTR("easeInEaseOut")))
  {
    v4 = 4;
    return (CAMediaTimingFunction *)builtin_function(v4);
  }
  if (-[NSString isEqualToString:](name, "isEqualToString:", CFSTR("easeIn")))
  {
    v4 = 2;
    return (CAMediaTimingFunction *)builtin_function(v4);
  }
  if (-[NSString isEqualToString:](name, "isEqualToString:", CFSTR("easeOut")))
  {
    v4 = 3;
    return (CAMediaTimingFunction *)builtin_function(v4);
  }
  if (-[NSString isEqualToString:](name, "isEqualToString:", CFSTR("linear")))
  {
    v4 = 1;
    return (CAMediaTimingFunction *)builtin_function(v4);
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAMediaTimingFunctionInvalid"), CFSTR("unknown timing function name: %@"), name);
  return 0;
}

+ (CAMediaTimingFunction)functionWithControlPoints:(float)c1x :(float)c1y :(float)c2x :(float)c2y
{
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v10 = objc_alloc((Class)a1);
  *(float *)&v11 = c1x;
  *(float *)&v12 = c1y;
  *(float *)&v13 = c2x;
  *(float *)&v14 = c2y;
  return (CAMediaTimingFunction *)(id)objc_msgSend(v10, "initWithControlPoints::::", v11, v12, v13, v14);
}

- (CAMediaTimingFunction)initWithControlPoints:(float)c1x :(float)c1y :(float)c2x :(float)c2y
{
  float v8;
  float v9;
  uint64_t v10;
  float *v11;
  CAMediaTimingFunction *v12;
  malloc_zone_t *malloc_zone;
  CAMediaTimingFunctionPrivate *v14;
  objc_super v16;
  uint64_t v17;

  v8 = c1y;
  v9 = c1x;
  v10 = 0;
  v17 = *MEMORY[0x1E0C80C00];
  c1x = vabds_f32(1.0, c2y);
  v11 = (float *)&dword_18475069C;
  c1y = 0.001;
  do
  {
    if (vabds_f32(*(v11 - 2), v9) < 0.001
      && vabds_f32(*(v11 - 1), v8) < 0.001
      && vabds_f32(*v11, c2x) < 0.001
      && c1x < 0.001)
    {

      return (CAMediaTimingFunction *)builtin_function(v10);
    }
    ++v10;
    v11 += 4;
  }
  while (v10 != 5);
  v16.receiver = self;
  v16.super_class = (Class)CAMediaTimingFunction;
  v12 = -[CAMediaTimingFunction init](&v16, sel_init, *(double *)&c1x, *(double *)&c1y);
  if (v12)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v14 = (CAMediaTimingFunctionPrivate *)malloc_type_zone_malloc(malloc_zone, 0x10uLL, 0x8BB15036uLL);
    v12->_priv = v14;
    if (v14)
    {
      *(float *)v14 = v9;
      *((float *)v14 + 1) = v8;
      *((float *)v14 + 2) = c2x;
      *((float *)v14 + 3) = c2y;
    }
    else
    {

      return 0;
    }
  }
  return v12;
}

- (void)dealloc
{
  CAMediaTimingFunctionPrivate *priv;
  malloc_zone_t *malloc_zone;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  priv = self->_priv;
  if (priv)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    malloc_zone_free(malloc_zone, priv);
  }
  v5.receiver = self;
  v5.super_class = (Class)CAMediaTimingFunction;
  -[CAMediaTimingFunction dealloc](&v5, sel_dealloc);
}

- (CAMediaTimingFunction)initWithCoder:(id)a3
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;

  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("c1x"));
  v6 = v5;
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("c1y"));
  v8 = v7;
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("c2x"));
  v10 = v9;
  objc_msgSend(a3, "decodeFloatForKey:", CFSTR("c2y"));
  LODWORD(v12) = v11;
  LODWORD(v13) = v6;
  LODWORD(v14) = v8;
  LODWORD(v15) = v10;
  return -[CAMediaTimingFunction initWithControlPoints::::](self, "initWithControlPoints::::", v13, v14, v15, v12);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)getControlPointAtIndex:(size_t)idx values:(float *)ptr
{
  _OWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (idx - 1 < 2)
  {
    memset(v11, 0, sizeof(v11));
    -[CAMediaTimingFunction _getPoints:](self, "_getPoints:", v11);
    _D0 = vcvt_f32_f64((float64x2_t)v11[idx - 1]);
LABEL_7:
    *(float32x2_t *)ptr = _D0;
    return;
  }
  if (idx == 3)
  {
    __asm { FMOV            V0.2S, #1.0 }
    goto LABEL_7;
  }
  if (idx)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAMediaTimingFunctionInvalidControlPoint"), CFSTR("no timing function control point with index: %d"), idx);
  else
    *(_QWORD *)ptr = 0;
}

- (id)description
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 0u;
  v4 = 0u;
  -[CAMediaTimingFunction _getPoints:](self, "_getPoints:", &v3);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%g %g; %g %g)"), v3, v4);
}

- (void)encodeWithCoder:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  -[CAMediaTimingFunction _getPoints:](self, "_getPoints:", &v8);
  HIDWORD(v4) = DWORD1(v8);
  *(float *)&v4 = *(double *)&v8;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("c1x"), v4);
  HIDWORD(v5) = HIDWORD(v8);
  *(float *)&v5 = *((double *)&v8 + 1);
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("c1y"), v5);
  HIDWORD(v6) = DWORD1(v9);
  *(float *)&v6 = *(double *)&v9;
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("c2x"), v6);
  HIDWORD(v7) = HIDWORD(v9);
  *(float *)&v7 = *((double *)&v9 + 1);
  objc_msgSend(a3, "encodeFloat:forKey:", CFSTR("c2y"), v7);
}

- (id)CAMLType
{
  return CFSTR("CAMediaTimingFunction");
}

- (void)encodeWithCAMLWriter:(id)a3
{
  CFStringRef v4;
  _OWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(v5, 0, sizeof(v5));
  -[CAMediaTimingFunction _getPoints:](self, "_getPoints:", v5);
  v4 = CACreateStringWithDoubleArray((uint64_t)v5, 4uLL, 0.0001);
  objc_msgSend(a3, "setElementContent:", v4);
  CFRelease(v4);
}

- (Object)CA_copyRenderValue
{
  const double *v2;
  _OWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  -[CAMediaTimingFunction _getPoints:](self, "_getPoints:", v4);
  return (Object *)CA::Render::Vector::new_vector((CA::Render::Vector *)4, v4, v2);
}

- (unint64_t)CA_numericValueCount
{
  return 4;
}

- (unint64_t)CA_copyNumericValue:(double *)a3
{
  __int128 v4;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  -[CAMediaTimingFunction _getPoints:](self, "_getPoints:", &v6);
  v4 = v7;
  *(_OWORD *)a3 = v6;
  *((_OWORD *)a3 + 1) = v4;
  return 4;
}

@end
