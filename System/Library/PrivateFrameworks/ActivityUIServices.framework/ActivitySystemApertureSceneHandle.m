@implementation ActivitySystemApertureSceneHandle

- (FBScene)scene
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene);
  swift_beginAccess();
  return (FBScene *)*v2;
}

- (void)setScene:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (ACActivityDescriptor)descriptor
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_descriptor);
  swift_beginAccess();
  return (ACActivityDescriptor *)*v2;
}

- (void)setDescriptor:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_descriptor);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtP18ActivityUIServices41ActivitySystemApertureSceneHandleDelegate_)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_delegate;
  swift_beginAccess();
  return (_TtP18ActivityUIServices41ActivitySystemApertureSceneHandleDelegate_ *)(id)MEMORY[0x22E31826C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC18ActivityUIServices33ActivitySystemApertureSceneHandle)initWithAcActivityDescritor:(id)a3 systemMetricsRequest:(id)a4
{
  return (_TtC18ActivityUIServices33ActivitySystemApertureSceneHandle *)ActivitySystemApertureSceneHandle.init(acActivityDescritor:systemMetricsRequest:)(a3, a4);
}

- (void)dealloc
{
  _TtC18ActivityUIServices33ActivitySystemApertureSceneHandle *v2;
  objc_super v3;

  v2 = self;
  sub_22D846CDC();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ActivitySystemApertureSceneHandle();
  -[ActivitySystemApertureSceneHandle dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_scene));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_descriptor));
  v3 = (char *)self + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_activityDescriptor;
  v4 = sub_22D84B340();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_systemMetricsRequest));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_currentContentPayloadID));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_settingsDiffInspector));
  sub_22D817714((uint64_t)self + OBJC_IVAR____TtC18ActivityUIServices33ActivitySystemApertureSceneHandle_delegate);
}

- (void)invalidate
{
  _TtC18ActivityUIServices33ActivitySystemApertureSceneHandle *v2;

  v2 = self;
  sub_22D846CDC();

}

- (_TtC18ActivityUIServices33ActivitySystemApertureSceneHandle)init
{
  _TtC18ActivityUIServices33ActivitySystemApertureSceneHandle *result;

  result = (_TtC18ActivityUIServices33ActivitySystemApertureSceneHandle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sceneDidActivate:(id)a3
{
  id v4;
  _TtC18ActivityUIServices33ActivitySystemApertureSceneHandle *v5;

  v4 = a3;
  v5 = self;
  sub_22D848AE0("[%{public}s] Scene did activate.");

}

- (void)sceneDidInvalidate:(id)a3
{
  id v4;
  _TtC18ActivityUIServices33ActivitySystemApertureSceneHandle *v5;

  v4 = a3;
  v5 = self;
  sub_22D848AE0("[%{public}s] Scene did invalidate");

}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  _TtC18ActivityUIServices33ActivitySystemApertureSceneHandle *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  ActivitySystemApertureSceneHandle.sceneDidDeactivate(_:withError:)(v6, a4);

}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC18ActivityUIServices33ActivitySystemApertureSceneHandle *v8;

  sub_22D819F60(0, (unint64_t *)&unk_2540C5FB0);
  sub_22D833C04();
  v6 = sub_22D84B694();
  v7 = a3;
  v8 = self;
  sub_22D848D00(v6);

  swift_bridgeObjectRelease();
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TtC18ActivityUIServices33ActivitySystemApertureSceneHandle *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_22D8494A0((uint64_t)v11);

}

@end
