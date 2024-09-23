@implementation FMPFSKPatternNode

- (_TtC11FMFindingUI17FMPFSKPatternNode)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23AA0676C();
}

- (NSString)description
{
  _TtC11FMFindingUI17FMPFSKPatternNode *v2;
  void *v3;

  v2 = self;
  sub_23A9A19A0();

  v3 = (void *)sub_23AA32FB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11FMFindingUI17FMPFSKPatternNode)init
{
  _TtC11FMFindingUI17FMPFSKPatternNode *result;

  result = (_TtC11FMFindingUI17FMPFSKPatternNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[11];
  unsigned __int8 v9;

  v3 = *(_OWORD *)&self->experienceType[OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_config];
  v8[8] = *(_OWORD *)((char *)&self->super._focusBehavior + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_config);
  v8[9] = v3;
  v8[10] = *(_OWORD *)&self->style[OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_config + 13];
  v9 = self->style[OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_config + 29];
  v4 = *(_OWORD *)((char *)&self->super._attributeValues + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_config);
  v8[4] = *(_OWORD *)((char *)&self->super._keyedSubSprites + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_config);
  v8[5] = v4;
  v5 = *(_OWORD *)((char *)&self->super._version + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_config);
  v8[6] = *(_OWORD *)((char *)&self->super._userData + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_config);
  v8[7] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_config);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_config);
  v8[1] = v6;
  v7 = *(_OWORD *)((char *)&self->super._actions + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_config);
  v8[2] = *(_OWORD *)((char *)&self->super._parent + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_config);
  v8[3] = v7;
  sub_23A9E9800((uint64_t)v8, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23A9E983C);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_canvasDebugNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_canvasInsideBorderBezierNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_canvasDiskBezierNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_canvasPatternSpinesNode));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_patternFragmentsNode));
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_noonDotColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_pointeeDotColor));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_pointeeNode));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_conformationFactorSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_conformedToExplodedFactorSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_energeticAngleSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_lethargicAngleSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_centerFactorSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_lookoutSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_trackSpring));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_labelsOpacitySpring));
  sub_23A972074((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI17FMPFSKPatternNode_delegate);
}

@end
