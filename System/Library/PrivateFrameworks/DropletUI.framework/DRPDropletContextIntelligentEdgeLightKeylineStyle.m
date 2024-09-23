@implementation DRPDropletContextIntelligentEdgeLightKeylineStyle

- (BOOL)preferAudioReactivity
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_preferAudioReactivity;
  swift_beginAccess();
  return *v2;
}

- (void)setPreferAudioReactivity:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_preferAudioReactivity;
  swift_beginAccess();
  *v4 = a3;
}

- (unint64_t)style
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_style);
  swift_beginAccess();
  return *v2;
}

- (void)setStyle:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_style);
  swift_beginAccess();
  *v4 = a3;
}

- (double)innerWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_innerWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setInnerWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_innerWidth);
  swift_beginAccess();
  *v4 = a3;
}

- (double)outerWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_outerWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setOuterWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_outerWidth);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)innerWidthSoft
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_innerWidthSoft;
  swift_beginAccess();
  return *v2;
}

- (void)setInnerWidthSoft:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_innerWidthSoft;
  swift_beginAccess();
  *v4 = a3;
}

- (double)outerWidthBlurRadius
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_outerWidthBlurRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setOuterWidthBlurRadius:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_outerWidthBlurRadius);
  swift_beginAccess();
  *v4 = a3;
}

- (UIEdgeInsets)keylineOutsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = sub_23A8329D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineOutsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setKeylineOutsets:(UIEdgeInsets)a3
{
  sub_23A832A74((uint64_t)self, a3.top, a3.left, a3.bottom, a3.right, (uint64_t)a2, &OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineOutsets);
}

- (UIEdgeInsets)keylineFadeLengths
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = sub_23A8329D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineFadeLengths);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setKeylineFadeLengths:(UIEdgeInsets)a3
{
  sub_23A832A74((uint64_t)self, a3.top, a3.left, a3.bottom, a3.right, (uint64_t)a2, &OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_keylineFadeLengths);
}

- (double)normalizedStartLocation
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStartLocation);
  swift_beginAccess();
  return *v2;
}

- (void)setNormalizedStartLocation:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStartLocation);
  swift_beginAccess();
  *v4 = a3;
}

- (double)normalizedStopLocation
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStopLocation);
  swift_beginAccess();
  return *v2;
}

- (void)setNormalizedStopLocation:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextIntelligentEdgeLightKeylineStyle_normalizedStopLocation);
  swift_beginAccess();
  *v4 = a3;
}

- (DRPDropletContextIntelligentEdgeLightKeylineStyle)initWithPreferringAudioReactivity:(BOOL)a3
{
  return -[DRPDropletContextIntelligentEdgeLightKeylineStyle initWithPreferringAudioReactivity:style:](self, sel_initWithPreferringAudioReactivity_style_, a3, 2);
}

- (DRPDropletContextIntelligentEdgeLightKeylineStyle)initWithPreferringAudioReactivity:(BOOL)a3 style:(unint64_t)a4
{
  return (DRPDropletContextIntelligentEdgeLightKeylineStyle *)DRPDropletContextIntelligentEdgeLightKeylineStyle.init(preferringAudioReactivity:style:)(a3, a4);
}

- (DRPDropletContextIntelligentEdgeLightKeylineStyle)initWithPreferringAudioReactivity:(BOOL)a3 style:(unint64_t)a4 innerWidthSoft:(BOOL)a5 outerWidthBlurRadius:(double)a6 innerWidth:(double)a7 outerWidth:(double)a8 keylineOutsets:(UIEdgeInsets)a9 keylineFadeLengths:(UIEdgeInsets)a10 normalizedStartLocation:(double)a11 normalizedStopLocation:(double)a12
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  return (DRPDropletContextIntelligentEdgeLightKeylineStyle *)DRPDropletContextIntelligentEdgeLightKeylineStyle.init(preferringAudioReactivity:style:innerWidthSoft:outerWidthBlurRadius:innerWidth:outerWidth:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:)(a3, a4, a5, a6, a7, a8, a9.top, a9.left, a9.bottom, a9.right, a10.top, a4, a5, v12, v13, v14, *(__int128 *)&a10.left, *(uint64_t *)&a10.right, *(uint64_t *)&a11,
                                                                *(uint64_t *)&a12);
}

- (BOOL)isEqual:(id)a3
{
  return sub_23A833438(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))DRPDropletContextIntelligentEdgeLightKeylineStyle.isEqual(_:));
}

- (id)copy
{
  return (id)sub_23A83364C(self, (uint64_t)a2, (void (*)(_QWORD *__return_ptr))DRPDropletContextIntelligentEdgeLightKeylineStyle.copy());
}

- (NSString)description
{
  return (NSString *)sub_23A833BA8(self, (uint64_t)a2, (void (*)(void))sub_23A8336D4);
}

- (NSString)debugDescription
{
  return (NSString *)sub_23A833BA8(self, (uint64_t)a2, (void (*)(void))sub_23A8336D4);
}

- (DRPDropletContextIntelligentEdgeLightKeylineStyle)init
{
  DRPDropletContextIntelligentEdgeLightKeylineStyle *result;

  result = (DRPDropletContextIntelligentEdgeLightKeylineStyle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
