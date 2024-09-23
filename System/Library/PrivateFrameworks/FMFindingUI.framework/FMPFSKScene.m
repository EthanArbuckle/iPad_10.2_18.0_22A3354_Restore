@implementation FMPFSKScene

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_23A9C1748(self, (uint64_t)a2, (uint64_t)a3, a4, sub_23A9C1804);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_23A9C1748(self, (uint64_t)a2, (uint64_t)a3, a4, sub_23A9C1BB4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_23A9C1748(self, (uint64_t)a2, (uint64_t)a3, a4, sub_23A9C1FE4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_23A9C1748(self, (uint64_t)a2, (uint64_t)a3, a4, sub_23A9C2390);
}

- (_TtC11FMFindingUI11FMPFSKScene)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23A9E9C00();
}

- (void)dealloc
{
  _TtC11FMFindingUI11FMPFSKScene *v2;

  v2 = self;
  sub_23A9E6D6C();
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[11];
  char v9;

  v3 = *(_OWORD *)((char *)&self->super.super._skcEffectNode + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[8] = *(_OWORD *)((char *)&self->super.super.super._focusBehavior + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[9] = v3;
  v8[10] = *(_OWORD *)((char *)&self->super._pausedTime + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v9 = *((_BYTE *)&self->super._visibleRect.origin.y + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v4 = *(_OWORD *)((char *)&self->super.super.super._attributeValues + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[4] = *(_OWORD *)((char *)&self->super.super.super._keyedSubSprites
                    + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[5] = v4;
  v5 = *(_OWORD *)((char *)&self->super.super.super._version + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[6] = *(_OWORD *)((char *)&self->super.super.super._userData + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[7] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[1] = v6;
  v7 = *(_OWORD *)((char *)&self->super.super.super._actions + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[2] = *(_OWORD *)((char *)&self->super.super.super._parent + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[3] = v7;
  sub_23A9E9800((uint64_t)v8, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23A9E983C);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_ringView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_axisesNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_patternNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_motionManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_dotCountObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_debugModeObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_opacitySpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_isolationQueue));
  sub_23A972074((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_altDelegate);
}

- (NSString)description
{
  _TtC11FMFindingUI11FMPFSKScene *v2;
  void *v3;

  v2 = self;
  sub_23A9A19A0();

  v3 = (void *)sub_23AA32FB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)update:(double)a3
{
  _TtC11FMFindingUI11FMPFSKScene *v4;

  v4 = self;
  sub_23A9E790C(a3);

}

- (CGSize)size
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMPFSKScene();
  -[SKScene size](&v4, sel_size);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  double height;
  double width;
  _TtC11FMFindingUI11FMPFSKScene *v5;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_23A9E8038(width, height);

}

- (_TtC11FMFindingUI11FMPFSKScene)initWithSize:(CGSize)a3
{
  _TtC11FMFindingUI11FMPFSKScene *result;

  result = (_TtC11FMFindingUI11FMPFSKScene *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11FMFindingUI11FMPFSKScene)init
{
  _TtC11FMFindingUI11FMPFSKScene *result;

  result = (_TtC11FMFindingUI11FMPFSKScene *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
