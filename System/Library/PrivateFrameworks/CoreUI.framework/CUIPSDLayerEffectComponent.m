@implementation CUIPSDLayerEffectComponent

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  NSError *v5;
  NSErrorUserInfoKey v7;
  const __CFString *v8;

  v7 = NSLocalizedDescriptionKey;
  v8 = CFSTR("Effect Component not yet supported");
  v5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  if (a4)
    *a4 = v5;
  return 0;
}

- (CUIPSDLayerEffectComponent)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  NSAssertionHandler *v6;
  const char *Name;
  uint64_t v8;

  v6 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, *(_QWORD *)&a4);
  Name = sel_getName(a2);
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CUIPSLayerEffectsPreset.m"), 151, CFSTR("Abstract method %s called directly on %@.  This must be implemented by subclasses"), Name, objc_opt_class(self, v8));
  return 0;
}

- (id)_colorFromShapeEffectValue:(id)a3
{
  int8x8_t v3;
  CGColorSpace *SRGB;
  CGColor *v5;
  CUIColor *v6;
  CUIColor *v7;
  float64x2_t v9;
  double v10;
  uint64_t v11;

  v3.i32[0] = a3.var4;
  v3.i32[1] = a3.var4 >> 8;
  v9 = vcvtq_f64_f32(vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v3, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u)));
  v10 = (float)((float)a3.var2.b / 255.0);
  v11 = 0x3FF0000000000000;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  v5 = CGColorCreate(SRGB, v9.f64);
  v6 = [CUIColor alloc];
  v7 = -[CUIColor initWithCGColor:](v6, "initWithCGColor:", v5, *(_OWORD *)&v9, *(_QWORD *)&v10, v11);
  CGColorRelease(v5);
  return v7;
}

- (unsigned)effectType
{
  +[NSException raise:format:](NSException, "raise:format:", NSGenericException, CFSTR("Abstract method - not implemented"));
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectComponent;
  -[CUIPSDLayerEffectComponent dealloc](&v3, sel_dealloc);
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

@end
