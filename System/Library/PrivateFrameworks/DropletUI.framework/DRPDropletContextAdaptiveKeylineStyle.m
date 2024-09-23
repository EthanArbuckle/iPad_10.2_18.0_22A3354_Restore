@implementation DRPDropletContextAdaptiveKeylineStyle

- (double)width
{
  double result;

  -[DRPDropletContextAdaptiveKeylineStyle outerWidth](self, sel_outerWidth);
  return result;
}

- (void)setWidth:(double)a3
{
  -[DRPDropletContextAdaptiveKeylineStyle setOuterWidth:](self, sel_setOuterWidth_, a3);
}

- (double)innerWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_innerWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setInnerWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_innerWidth);
  swift_beginAccess();
  *v4 = a3;
}

- (double)outerWidth
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_outerWidth);
  swift_beginAccess();
  return *v2;
}

- (void)setOuterWidth:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_outerWidth);
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

  v2 = sub_23A8329D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineOutsets);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setKeylineOutsets:(UIEdgeInsets)a3
{
  sub_23A832A74((uint64_t)self, a3.top, a3.left, a3.bottom, a3.right, (uint64_t)a2, &OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineOutsets);
}

- (UIEdgeInsets)keylineFadeLengths
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = sub_23A8329D4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineFadeLengths);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setKeylineFadeLengths:(UIEdgeInsets)a3
{
  sub_23A832A74((uint64_t)self, a3.top, a3.left, a3.bottom, a3.right, (uint64_t)a2, &OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineFadeLengths);
}

- (double)normalizedStartLocation
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStartLocation);
  swift_beginAccess();
  return *v2;
}

- (void)setNormalizedStartLocation:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStartLocation);
  swift_beginAccess();
  *v4 = a3;
}

- (double)normalizedStopLocation
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStopLocation);
  swift_beginAccess();
  return *v2;
}

- (void)setNormalizedStopLocation:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStopLocation);
  swift_beginAccess();
  *v4 = a3;
}

- (CAColorMatrix)adaptiveColorMatrix
{
  _OWORD *v4;
  CAColorMatrix *result;
  __int128 v6;
  __int128 v7;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_adaptiveColorMatrix);
  result = (CAColorMatrix *)swift_beginAccess();
  v6 = v4[1];
  *(_OWORD *)&retstr->var0 = *v4;
  *(_OWORD *)&retstr->var4 = v6;
  v7 = v4[3];
  *(_OWORD *)&retstr->var8 = v4[2];
  *(_OWORD *)&retstr->var12 = v7;
  *(_OWORD *)&retstr->var16 = v4[4];
  return result;
}

- (void)setAdaptiveColorMatrix:(CAColorMatrix *)a3
{
  _OWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = (_OWORD *)((char *)self + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_adaptiveColorMatrix);
  v7 = *(_OWORD *)&a3->var4;
  v8 = *(_OWORD *)&a3->var0;
  v5 = *(_OWORD *)&a3->var12;
  v6 = *(_OWORD *)&a3->var8;
  v4 = *(_OWORD *)&a3->var16;
  swift_beginAccess();
  *v3 = v8;
  v3[1] = v7;
  v3[2] = v6;
  v3[3] = v5;
  v3[4] = v4;
}

- (DRPDropletContextAdaptiveKeylineStyle)initWithWidth:(double)a3 boundaryFadeLength:(double)a4 adaptiveColorMatrix:(CAColorMatrix *)a5
{
  __int128 v5;
  __int128 v6;
  _OWORD v8[5];

  v5 = *(_OWORD *)&a5->var4;
  v8[0] = *(_OWORD *)&a5->var0;
  v8[1] = v5;
  v6 = *(_OWORD *)&a5->var12;
  v8[2] = *(_OWORD *)&a5->var8;
  v8[3] = v6;
  v8[4] = *(_OWORD *)&a5->var16;
  return -[DRPDropletContextAdaptiveKeylineStyle initWithInnerWidth:outerWidth:keylineOutsets:keylineFadeLengths:adaptiveColorMatrix:](self, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_adaptiveColorMatrix_, v8, 0.0, a3, -(a3 + a4), -(a3 + a4), -(a3 + a4), -(a3 + a4), *(_QWORD *)&a4, *(_QWORD *)&a4, *(_QWORD *)&a4, *(_QWORD *)&a4);
}

- (DRPDropletContextAdaptiveKeylineStyle)initWithInnerWidth:(double)a3 outerWidth:(double)a4 keylineOutsets:(UIEdgeInsets)a5 keylineFadeLengths:(UIEdgeInsets)a6 adaptiveColorMatrix:(CAColorMatrix *)a7
{
  __int128 v7;
  __int128 v8;
  _OWORD v10[5];

  v7 = *(_OWORD *)&a7->var4;
  v10[0] = *(_OWORD *)&a7->var0;
  v10[1] = v7;
  v8 = *(_OWORD *)&a7->var12;
  v10[2] = *(_OWORD *)&a7->var8;
  v10[3] = v8;
  v10[4] = *(_OWORD *)&a7->var16;
  return -[DRPDropletContextAdaptiveKeylineStyle initWithInnerWidth:outerWidth:keylineOutsets:keylineFadeLengths:normalizedStartLocation:normalizedStopLocation:adaptiveColorMatrix:](self, sel_initWithInnerWidth_outerWidth_keylineOutsets_keylineFadeLengths_normalizedStartLocation_normalizedStopLocation_adaptiveColorMatrix_, v10, a3, a4, a5.top, a5.left, a5.bottom, a5.right, *(_QWORD *)&a6.top, *(_QWORD *)&a6.left, *(_QWORD *)&a6.bottom, *(_QWORD *)&a6.right, 0, 0x3FF0000000000000);
}

- (DRPDropletContextAdaptiveKeylineStyle)initWithInnerWidth:(double)a3 outerWidth:(double)a4 keylineOutsets:(UIEdgeInsets)a5 keylineFadeLengths:(UIEdgeInsets)a6 normalizedStartLocation:(double)a7 normalizedStopLocation:(double)a8 adaptiveColorMatrix:(CAColorMatrix *)a9
{
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD *v14;
  objc_super v16;

  v9 = *(_OWORD *)&a9->var0;
  v10 = *(_OWORD *)&a9->var4;
  v11 = *(_OWORD *)&a9->var8;
  v12 = *(_OWORD *)&a9->var12;
  v13 = *(_OWORD *)&a9->var16;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_innerWidth) = a3;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_outerWidth) = a4;
  *(UIEdgeInsets *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineOutsets) = a5;
  *(UIEdgeInsets *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_keylineFadeLengths) = a6;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStartLocation) = a7;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_normalizedStopLocation) = a8;
  v14 = (_OWORD *)((char *)self + OBJC_IVAR___DRPDropletContextAdaptiveKeylineStyle_adaptiveColorMatrix);
  *v14 = v9;
  v14[1] = v10;
  v14[2] = v11;
  v14[3] = v12;
  v14[4] = v13;
  v16.receiver = self;
  v16.super_class = (Class)DRPDropletContextAdaptiveKeylineStyle;
  return -[DRPDropletContextAdaptiveKeylineStyle init](&v16, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  return sub_23A833438(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))DRPDropletContextAdaptiveKeylineStyle.isEqual(_:));
}

- (id)copy
{
  return (id)sub_23A83364C(self, (uint64_t)a2, (void (*)(_QWORD *__return_ptr))DRPDropletContextAdaptiveKeylineStyle.copy());
}

- (NSString)description
{
  return (NSString *)sub_23A833BA8(self, (uint64_t)a2, (void (*)(void))sub_23A831F04);
}

- (NSString)debugDescription
{
  return (NSString *)sub_23A833BA8(self, (uint64_t)a2, (void (*)(void))sub_23A831F04);
}

- (DRPDropletContextAdaptiveKeylineStyle)init
{
  DRPDropletContextAdaptiveKeylineStyle *result;

  result = (DRPDropletContextAdaptiveKeylineStyle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
