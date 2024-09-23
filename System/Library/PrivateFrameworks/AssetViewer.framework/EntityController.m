@implementation EntityController

- (ASVUnifiedGestureRecognizer)worldGestureRecognizer
{
  return (ASVUnifiedGestureRecognizer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC11AssetViewer16EntityController_worldGestureRecognizer));
}

- (void)setWorldGestureRecognizer:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController_worldGestureRecognizer);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController_worldGestureRecognizer) = (Class)a3;
  v3 = a3;

}

- (float)levitationHeight
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController_levitationHeight);
}

- (void)setLevitationHeight:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController_levitationHeight) = a3;
}

- (NSURL)accessibilityAssetURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F01C5DB0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC11AssetViewer16EntityController_accessibilityAssetURL;
  swift_beginAccess();
  sub_1D93D6ECC((uint64_t)v6, (uint64_t)v5);
  v7 = sub_1D94D1204();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1D94D1174();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (void)setAccessibilityAssetURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC11AssetViewer16EntityController *v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F01C5DB0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1D94D11BC();
    v8 = sub_1D94D1204();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1D94D1204();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC11AssetViewer16EntityController_accessibilityAssetURL;
  swift_beginAccess();
  v11 = self;
  sub_1D93D6E84((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();

}

- (NSArray)entityAccessibilityWrappers
{
  _TtC11AssetViewer16EntityController *v2;
  void *v3;

  v2 = self;
  sub_1D94D2344();

  sub_1D94D1D2C();
  v3 = (void *)sub_1D94D3118();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (NSString)description
{
  _TtC11AssetViewer16EntityController *v2;
  void *v3;

  v2 = self;
  sub_1D94D2380();
  sub_1D94D3064();
  swift_bridgeObjectRelease();
  sub_1D94D3064();

  v3 = (void *)sub_1D94D2F74();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  _TtC11AssetViewer16EntityController *v2;
  objc_super v3;

  v2 = self;
  sub_1D93D529C();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for EntityController();
  -[EntityController dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  void *v3;

  swift_release();
  swift_release();
  swift_release();

  sub_1D93D6F14((uint64_t)self + OBJC_IVAR____TtC11AssetViewer16EntityController_delegate);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1D93D6F38(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11AssetViewer16EntityController_projectPointHandler));
  sub_1D93D6F38(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11AssetViewer16EntityController_shouldDisableGesturesHandler));
  swift_release();

  swift_release();
  swift_release();
  v3 = *(void **)&self->type[OBJC_IVAR____TtC11AssetViewer16EntityController_sceneUnderstandingState];
  swift_release();
  sub_1D93D6F48(v3);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1D93D6F6C((uint64_t)self + OBJC_IVAR____TtC11AssetViewer16EntityController_accessibilityAssetURL);
}

- (void)rotateByDeltaYaw:(float)a3 deltaPitch:(float)a4
{
  _TtC11AssetViewer16EntityController *v6;

  v6 = self;
  sub_1D93D2CF4(a3, a4);

}

- (CGRect)calculateAssetScreenBoundingRectIn:(id)a3
{
  id v4;
  _TtC11AssetViewer16EntityController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  v5 = self;
  sub_1D94D235C();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)scaleTo:(float)a3 updateARScale:(BOOL)a4
{
  _TtC11AssetViewer16EntityController *v5;

  v5 = self;
  sub_1D93D5D00(a3);

}

- (_TtC11AssetViewer16EntityController)init
{
  _TtC11AssetViewer16EntityController *result;

  result = (_TtC11AssetViewer16EntityController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)screenPointIsOnAsset:(_TtC11AssetViewer16EntityController *)self
{
  return 1;
}

- (__n128)assetTransform
{
  id v2;
  __int128 v3;
  __int128 v5;

  sub_1D94D23BC();
  v2 = a1;
  sub_1D94D151C();
  v5 = v3;

  return (__n128)v5;
}

- (__n128)assetWorldPosition
{
  id v1;
  __int128 v2;
  __int128 v4;

  v1 = a1;
  sub_1D93D57D8();
  v4 = v2;

  return (__n128)v4;
}

- (double)assetScreenPosition
{
  id v1;
  double v2;

  v1 = a1;
  v2 = sub_1D93D5894();

  return v2;
}

- (double)assetHeadScreenPositionForScale:(void *)a1
{
  id v1;
  double v2;

  v1 = a1;
  v2 = sub_1D93D668C();

  return v2;
}

- (float)assetYaw
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController_currentTurntableYaw);
}

- (float)assetPitch
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController_currentTurntablePitch);
}

- (float)assetScale
{
  _TtC11AssetViewer16EntityController *v2;
  float v3;

  v2 = self;
  v3 = sub_1D93D59BC();

  return v3;
}

- (__n128)assetNaturalSize
{
  return *(__n128 *)(a1 + OBJC_IVAR____TtC11AssetViewer16EntityController__assetNaturalSize);
}

- (float)assetScaleToFitUnitBox
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController__assetScaleToFitUnitBox);
}

- (void)worldGestureRecognizerBeganTranslation:(id)a3
{
  id v4;
  _TtC11AssetViewer16EntityController *v5;

  v4 = a3;
  v5 = self;
  sub_1D9457C84();

}

- (void)worldGestureRecognizerEndedTranslation:(id)a3
{
  id v4;
  _TtC11AssetViewer16EntityController *v5;

  v4 = a3;
  v5 = self;
  sub_1D9457D88();

}

- (void)worldGestureRecognizerBeganTranslationDeceleration:(id)a3
{
  id v4;
  _TtC11AssetViewer16EntityController *v5;

  v4 = a3;
  v5 = self;
  sub_1D93D529C();

}

- (void)worldGestureRecognizer:(id)a3 decelerationTranslationDelta:
{
  id v4;
  _TtC11AssetViewer16EntityController *v5;

  v4 = a3;
  v5 = self;
  sub_1D9457F54();

}

- (void)worldGestureRecognizerEndedTranslationDeceleration:(id)a3
{
  id v5;
  _TtC11AssetViewer16EntityController *v6;

  if (MEMORY[0x1DF08DD88]((char *)self + OBJC_IVAR____TtC11AssetViewer16EntityController_delegate, a2))
  {
    v5 = a3;
    v6 = self;
    sub_1D9497520((char *)v6);

    swift_unknownObjectRelease();
  }
}

- (void)worldGestureRecognizer:(id)a3 translatedAssetToScreenPoint:
{
  double v3;
  double v4;
  id v6;
  _TtC11AssetViewer16EntityController *v7;

  v4 = v3;
  v6 = a3;
  v7 = self;
  sub_1D945807C(v4);

}

- (void)worldGestureRecognizerBeganLevitation:(id)a3
{
  id v4;
  _TtC11AssetViewer16EntityController *v5;

  v4 = a3;
  v5 = self;
  sub_1D9458B70();

}

- (void)worldGestureRecognizerEndedLevitation:(id)a3
{
  id v5;
  _TtC11AssetViewer16EntityController *v6;

  if (MEMORY[0x1DF08DD88]((char *)self + OBJC_IVAR____TtC11AssetViewer16EntityController_delegate, a2))
  {
    v5 = a3;
    v6 = self;
    sub_1D9497520((char *)v6);
    sub_1D94A9158();

    swift_unknownObjectRelease();
  }
}

- (void)worldGestureRecognizer:(id)a3 levitatedAssetToScreenPoint:
{
  float32x2_t v3;
  float32x2_t v4;
  id v6;
  _TtC11AssetViewer16EntityController *v7;

  v4 = v3;
  v6 = a3;
  v7 = self;
  sub_1D9457248(v6, v4);

}

- (void)turntableGestureRecognizer:(id)a3 rotatedAssetByDeltaYaw:(float)a4 deltaPitch:(float)a5
{
  uint64_t (*v8)(uint64_t);
  id v9;
  _TtC11AssetViewer16EntityController *v10;
  uint64_t v11;
  char v12;
  id v13;
  _TtC11AssetViewer16EntityController *v14;

  v8 = *(uint64_t (**)(uint64_t))((char *)&self->super.isa
                                         + OBJC_IVAR____TtC11AssetViewer16EntityController_shouldDisableGesturesHandler);
  if (v8)
  {
    v9 = a3;
    v10 = self;
    v11 = sub_1D93D6BE8((uint64_t)v8);
    v12 = v8(v11);
    sub_1D93D6F38((uint64_t)v8);
    if ((v12 & 1) != 0)
      goto LABEL_6;
  }
  else
  {
    v13 = a3;
    v14 = self;
  }
  sub_1D93D2CF4(a4, a5);
LABEL_6:

}

- (void)unifiedGestureRecognizer:(id)a3 doubleTappedAtScreenPoint:(BOOL)a4 onAsset:
{
  float32x2_t v4;
  float32x2_t v5;
  uint64_t v8;
  void *v9;
  id v10;
  _TtC11AssetViewer16EntityController *v11;

  v5 = v4;
  v8 = MEMORY[0x1DF08DD88]((char *)self + OBJC_IVAR____TtC11AssetViewer16EntityController_delegate, a2, a3, a4);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = a3;
    v11 = self;
    objc_msgSend(v9, sel_entityController_doubleTappedAt_, v11, vcvtq_f64_f32(v5));

    swift_unknownObjectRelease();
  }
}

- (void)unifiedGestureRecognizer:(id)a3 singleTappedAtScreenPoint:(BOOL)a4 onAsset:
{
  uint64_t v4;
  id v7;
  _TtC11AssetViewer16EntityController *v8;
  uint64_t v9;

  v9 = v4;
  if (MEMORY[0x1DF08DD88]((char *)self + OBJC_IVAR____TtC11AssetViewer16EntityController_delegate, a2, a3, a4))
  {
    v7 = a3;
    v8 = self;
    sub_1D9435594(*(float *)&v9, *((float *)&v9 + 1));

    swift_unknownObjectRelease();
  }
}

- (void)unifiedGestureRecognizerBeganRotation:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  _TtC11AssetViewer16EntityController *v7;
  uint64_t v8;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer16EntityController_physicsStateManager);
  v5 = *(_QWORD *)&self->entity[OBJC_IVAR____TtC11AssetViewer16EntityController_physicsStateManager];
  v6 = a3;
  v7 = self;
  v8 = swift_bridgeObjectRetain();
  sub_1D94BCC84(v8, (void (*)(uint64_t, uint64_t))sub_1D9458EC4);
  swift_bridgeObjectRelease();
  sub_1D94BAF20(v4, v5);

}

- (void)unifiedGestureRecognizer:(id)a3 rotatedAssetByDeltaYaw:(float)a4
{
  id v6;
  _TtC11AssetViewer16EntityController *v7;

  v6 = a3;
  v7 = self;
  sub_1D9458C64(a4);

}

- (void)unifiedGestureRecognizerEndedRotation:(id)a3
{
  id v4;
  _TtC11AssetViewer16EntityController *v5;

  v4 = a3;
  v5 = self;
  sub_1D9458D6C();

}

- (void)unifiedGestureRecognizerBeganScaling:(id)a3
{
  id v4;
  _TtC11AssetViewer16EntityController *v5;

  v4 = a3;
  v5 = self;
  sub_1D9458DF0();

}

- (void)unifiedGestureRecognizer:(id)a3 scaledAssetToScale:(float)a4
{
  uint64_t (*v6)(uint64_t);
  id v7;
  _TtC11AssetViewer16EntityController *v8;
  uint64_t v9;
  char v10;
  id v11;
  _TtC11AssetViewer16EntityController *v12;

  v6 = *(uint64_t (**)(uint64_t))((char *)&self->super.isa
                                         + OBJC_IVAR____TtC11AssetViewer16EntityController_shouldDisableGesturesHandler);
  if (v6)
  {
    v7 = a3;
    v8 = self;
    v9 = sub_1D93D6BE8((uint64_t)v6);
    v10 = v6(v9);
    sub_1D93D6F38((uint64_t)v6);
    if ((v10 & 1) != 0)
      goto LABEL_6;
  }
  else
  {
    v11 = a3;
    v12 = self;
  }
  sub_1D93D5D00(a4);
LABEL_6:

}

- (void)unifiedGestureRecognizerEndedScaling:(id)a3
{
  id v5;
  _TtC11AssetViewer16EntityController *v6;

  if (MEMORY[0x1DF08DD88]((char *)self + OBJC_IVAR____TtC11AssetViewer16EntityController_delegate, a2))
  {
    v5 = a3;
    v6 = self;
    sub_1D941F808((uint64_t)v6, 1);

    swift_unknownObjectRelease();
  }
}

@end
