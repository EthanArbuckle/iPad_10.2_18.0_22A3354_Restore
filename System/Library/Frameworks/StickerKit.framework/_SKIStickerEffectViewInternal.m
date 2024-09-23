@implementation _SKIStickerEffectViewInternal

- (void)scrollViewWillChange:(id)a3
{
  sub_2346D2D24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_2346D2A84);
}

- (void)scrollViewDidChange:(id)a3
{
  sub_2346D2D24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_2346D2BEC);
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  void *v5;
  id v6;
  id v7;
  objc_class *v8;
  objc_class *v9;
  _SKIStickerEffectViewInternal *v10;

  if ((*((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_displayLinkActive) & 1) == 0)
  {
    v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_displayLink);
    v6 = v5;
    v7 = a3;
    v10 = self;
    sub_2346D5BD8(v5);
    v9 = v8;

    *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_unitScreenCenter) = v9;
    sub_2346D5800();

  }
}

- (BOOL)boundsIncludeStroke
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_boundsIncludeStroke);
}

- (void)setBoundsIncludeStroke:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_boundsIncludeStroke) = a3;
}

- (BOOL)reRenderOnMotion
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_reRenderOnMotion);
}

- (void)setReRenderOnMotion:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_reRenderOnMotion) = a3;
}

- (float)curlPosition
{
  return *(float *)((char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_curlPosition);
}

- (void)setCurlPosition:(float)a3
{
  _SKIStickerEffectViewInternal *v4;

  v4 = self;
  sub_2346D3768(a3);

}

- (STKStickerEffect)effect
{
  return (STKStickerEffect *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____SKIStickerEffectViewInternal_effect));
}

- (void)setEffect:(id)a3
{
  id v4;
  _SKIStickerEffectViewInternal *v5;

  v4 = a3;
  v5 = self;
  sub_2346D380C(v4);

}

- (void)configureWithImage:(id)a3 effect:(id)a4 didDisplayHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _SKIStickerEffectViewInternal *v12;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_2346D879C;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_2346D38A4(v10, v11, (uint64_t)v8, v9);
  sub_2345B0C7C((uint64_t)v8);

}

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____SKIStickerEffectViewInternal_image));
}

- (void)setImage:(id)a3
{
  void *v4;
  _SKIStickerEffectViewInternal *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_image);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_image) = (Class)a3;
  v6 = a3;
  v5 = self;
  sub_2346D3ADC((uint64_t)v4);

}

- (BOOL)isPaused
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_isPaused);
}

- (void)setIsPaused:(BOOL)a3
{
  int v3;
  _SKIStickerEffectViewInternal *v4;

  v3 = *((unsigned __int8 *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_isPaused);
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_isPaused) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_2346D5800();

  }
}

- (NSString)description
{
  _SKIStickerEffectViewInternal *v2;
  void *v3;

  v2 = self;
  sub_2346D3C48();

  v3 = (void *)sub_234717730();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_SKIStickerEffectViewInternal)initWithDevice:(id)a3
{
  swift_unknownObjectRetain();
  return (_SKIStickerEffectViewInternal *)sub_2346D3E80(a3);
}

- (_SKIStickerEffectViewInternal)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2346D7CBC();
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_image);
  if (v3)
  {
    objc_msgSend(v3, sel_size);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)type metadata accessor for StickerEffectView();
    -[_SKIStickerEffectViewInternal intrinsicContentSize](&v6, sel_intrinsicContentSize);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  sub_2346D4C18(self, (uint64_t)a2, (const char **)&selRef_layoutSubviews, (void (*)(id))sub_2346D49B4);
}

- (void)didMoveToWindow
{
  sub_2346D4C18(self, (uint64_t)a2, (const char **)&selRef_didMoveToWindow, (void (*)(id))sub_2346D4C7C);
}

- (void)dealloc
{
  _SKIStickerEffectViewInternal *v2;

  v2 = self;
  sub_2346D53F4();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____SKIStickerEffectViewInternal_logger;
  v4 = sub_234716224();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____SKIStickerEffectViewInternal_metalLayerContainer));
  swift_unknownObjectRelease();
  swift_unknownObjectWeakDestroy();

  swift_release();
  sub_2345B0C7C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____SKIStickerEffectViewInternal_displayHandler));

}

- (void)playSettlingAnimation
{
  _SKIStickerEffectViewInternal *v2;

  v2 = self;
  *(CFTimeInterval *)((char *)&v2->super.super.super.isa + OBJC_IVAR____SKIStickerEffectViewInternal_settlingStartTime) = CACurrentMediaTime();
  sub_2346D5800();

}

- (void)_internalUpdateFromDisplayLink:(id)a3
{
  id v4;
  _SKIStickerEffectViewInternal *v5;

  v4 = a3;
  v5 = self;
  sub_2346D591C(v4);

}

- (void)snapshotWithCompletionHandler:(id)a3
{
  void *v4;
  _SKIStickerEffectViewInternal *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_2346D82B4((char *)v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (_SKIStickerEffectViewInternal)initWithFrame:(CGRect)a3
{
  _SKIStickerEffectViewInternal *result;

  result = (_SKIStickerEffectViewInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (void)resetRestingOrientation
{
  uint64_t v0;
  char v1;

  if (qword_256171B90 != -1)
    swift_once();
  v0 = qword_256188140;
  v1 = *(_BYTE *)(qword_256188140 + 48);
  *(_OWORD *)(qword_256188140 + 64) = *(_OWORD *)(qword_256188140 + 32);
  *(_BYTE *)(v0 + 80) = v1;
  *(CFTimeInterval *)(v0 + 88) = CACurrentMediaTime();
  *(_BYTE *)(v0 + 96) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_BYTE *)(v0 + 48) = 1;
}

@end
