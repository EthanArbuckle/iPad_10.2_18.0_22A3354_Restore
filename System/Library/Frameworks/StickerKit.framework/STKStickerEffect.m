@implementation STKStickerEffect

- (NSString)description
{
  void *v2;

  sub_2346197A0();
  v2 = (void *)sub_234717730();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)isStroked
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKStickerEffect_isStroked;
  swift_beginAccess();
  return *v2;
}

- (void)setIsStroked:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKStickerEffect_isStroked;
  swift_beginAccess();
  *v4 = a3;
}

- (float)strokeRadius
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_strokeRadius);
}

- (void)setStrokeRadius:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_strokeRadius) = a3;
}

- (float)strokeBlurRadius
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_strokeBlurRadius);
}

- (void)setStrokeBlurRadius:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_strokeBlurRadius) = a3;
}

- (float)smallStrokeRadiusMultiplier
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_smallStrokeRadiusMultiplier);
}

- (void)setSmallStrokeRadiusMultiplier:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_smallStrokeRadiusMultiplier) = a3;
}

- (BOOL)forceSmallStrokeRadiusMultiplier
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___STKStickerEffect_forceSmallStrokeRadiusMultiplier);
}

- (void)setForceSmallStrokeRadiusMultiplier:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___STKStickerEffect_forceSmallStrokeRadiusMultiplier) = a3;
}

- (BOOL)isPuffy
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___STKStickerEffect_isPuffy);
}

- (void)setIsPuffy:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___STKStickerEffect_isPuffy) = a3;
}

- (float)normalsRadius
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_normalsRadius);
}

- (void)setNormalsRadius:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_normalsRadius) = a3;
}

- (int)iridescence
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_iridescence);
}

- (void)setIridescence:(int)a3
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_iridescence) = a3;
}

- (BOOL)applyIridescenceBeforeStroke
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___STKStickerEffect_applyIridescenceBeforeStroke);
}

- (void)setApplyIridescenceBeforeStroke:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___STKStickerEffect_applyIridescenceBeforeStroke) = a3;
}

- (BOOL)isBrushed
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___STKStickerEffect_isBrushed);
}

- (void)setIsBrushed:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___STKStickerEffect_isBrushed) = a3;
}

- (BOOL)applyBrushBeforeStroke
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___STKStickerEffect_applyBrushBeforeStroke);
}

- (void)setApplyBrushBeforeStroke:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___STKStickerEffect_applyBrushBeforeStroke) = a3;
}

- (float)shadowRadius
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_shadowRadius);
}

- (void)setShadowRadius:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_shadowRadius) = a3;
}

- (float)shadowAlpha
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_shadowAlpha);
}

- (void)setShadowAlpha:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_shadowAlpha) = a3;
}

- (double)shadowOffset
{
  return *(double *)(a1 + OBJC_IVAR___STKStickerEffect_shadowOffset);
}

- (void)setShadowOffset:(STKStickerEffect *)self
{
  objc_class *v2;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_shadowOffset) = v2;
}

- (double)shadowParallax
{
  return *(double *)(a1 + OBJC_IVAR___STKStickerEffect_shadowParallax);
}

- (void)setShadowParallax:(STKStickerEffect *)self
{
  objc_class *v2;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_shadowParallax) = v2;
}

- (float)smallShadowSizeMultiplier
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_smallShadowSizeMultiplier);
}

- (void)setSmallShadowSizeMultiplier:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_smallShadowSizeMultiplier) = a3;
}

- (float)smallShadowAlphaMultiplier
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_smallShadowAlphaMultiplier);
}

- (void)setSmallShadowAlphaMultiplier:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect_smallShadowAlphaMultiplier) = a3;
}

- (BOOL)isComicEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKStickerEffect_isComicEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsComicEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKStickerEffect_isComicEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)requiresDeviceMotion
{
  return sub_234619F34();
}

- (BOOL)isCurlEnabled
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___STKStickerEffect_isCurlEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsCurlEnabled:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___STKStickerEffect_isCurlEnabled;
  swift_beginAccess();
  *v4 = a3;
}

- (void)applyComicParameters
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___STKStickerEffect_comicParameters;
  *v2 = 0;
  *(_OWORD *)(v2 + 4) = xmmword_2347218C0;
  *(_QWORD *)(v2 + 20) = 0x3DCCCCCD3F000000;
  *((_QWORD *)v2 + 4) = 6;
}

- (void)applyComicInkParameters
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___STKStickerEffect_comicParameters;
  *v2 = 1;
  *(_OWORD *)(v2 + 4) = xmmword_2347218D0;
  *(_QWORD *)(v2 + 20) = 0x3DCCCCCD3F000000;
  *((_QWORD *)v2 + 4) = 6;
}

- (void)applyTo:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  STKStickerEffect *v9;
  char *v10;
  char *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  char *v15;
  _QWORD v16[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  v10 = sub_23461A1F8();
  if (v10)
  {
    v11 = v10;
    v12 = (_QWORD *)swift_allocObject();
    v12[2] = v11;
    v12[3] = v8;
    v12[4] = v9;
    v12[5] = sub_2345B5DA8;
    v12[6] = v7;
    v16[4] = sub_23461B254;
    v16[5] = v12;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 1107296256;
    v16[2] = sub_23461966C;
    v16[3] = &block_descriptor_19;
    v13 = _Block_copy(v16);
    v14 = v8;
    v9 = v9;
    v15 = v11;
    swift_retain();
    swift_release();
    itk_performBlockOnMainThread();
    _Block_release(v13);

  }
  swift_release();

}

+ (STKStickerEffect)noneEffect
{
  return (STKStickerEffect *)sub_23461B01C((uint64_t)a1, (uint64_t)a2, &qword_256171BA8, (id *)&qword_256175F98);
}

+ (STKStickerEffect)strokeEffect
{
  return (STKStickerEffect *)sub_23461B01C((uint64_t)a1, (uint64_t)a2, &qword_256171BB0, (id *)&qword_256175FA0);
}

+ (STKStickerEffect)comicEffect
{
  return (STKStickerEffect *)sub_23461B01C((uint64_t)a1, (uint64_t)a2, &qword_256171BB8, (id *)&qword_256175FA8);
}

+ (STKStickerEffect)puffyEffect
{
  return (STKStickerEffect *)sub_23461B01C((uint64_t)a1, (uint64_t)a2, &qword_256171BC0, (id *)&qword_256175FB0);
}

+ (STKStickerEffect)iridescentEffect
{
  return (STKStickerEffect *)sub_23461B01C((uint64_t)a1, (uint64_t)a2, &qword_256171BC8, (id *)&qword_256175FB8);
}

+ (STKStickerEffect)liveEffect
{
  return (STKStickerEffect *)sub_23461B01C((uint64_t)a1, (uint64_t)a2, &qword_256171BD0, (id *)&qword_256175FC0);
}

- (STKStickerEffect)init
{
  return (STKStickerEffect *)StickerEffect.init()();
}

- (void).cxx_destruct
{
  sub_2346035A8(*(id *)((char *)&self->super.isa + OBJC_IVAR___STKStickerEffect____lazy_storage___viewForRendering));
}

@end
