@implementation SceneObserver

- (_TtC12DrawingBoard13SceneObserver)init
{
  _TtC12DrawingBoard13SceneObserver *result;

  result = (_TtC12DrawingBoard13SceneObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23A6DEBD4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_actionHandler));
  sub_23A6DEB98((uint64_t)self + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_continuation, &qword_2569AF500);
}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4;
  _TtC12DrawingBoard13SceneObserver *v5;

  v4 = a3;
  v5 = self;
  sub_23A6DCEAC(v4);

}

- (void)sceneDidActivate:(id)a3
{
  id v4;
  _TtC12DrawingBoard13SceneObserver *v5;

  v4 = a3;
  v5 = self;
  sub_23A6DDEE4();

}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  id v6;
  _TtC12DrawingBoard13SceneObserver *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_23A6DE068(a4);

}

- (void)sceneDidInvalidate:(id)a3
{
  id v4;
  _TtC12DrawingBoard13SceneObserver *v5;

  v4 = a3;
  v5 = self;
  sub_23A6DE1F8();

}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  id v6;
  id v7;
  _TtC12DrawingBoard13SceneObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A6DE380(v7, 2);

}

- (void)scene:(id)a3 didPrepareUpdateWithContext:(id)a4
{
  id v6;
  id v7;
  _TtC12DrawingBoard13SceneObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A6DE380(v7, 3);

}

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
  id v6;
  id v7;
  _TtC12DrawingBoard13SceneObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23A6DE380(v7, 4);

}

- (void)scene:(id)a3 didCompleteUpdateWithContext:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC12DrawingBoard13SceneObserver *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_23A6DE380(v9, 5);

}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TtC12DrawingBoard13SceneObserver *v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  sub_23A6DE514(v11, v12, a6);

}

- (id)scene:(id)a3 handleActions:(id)a4
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t *__return_ptr, id *);
  void *v11;

  sub_23A6DD7B4();
  sub_23A6DD7F0();
  v5 = sub_23A70D54C();
  v6 = (char *)self + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_actionHandler;
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12DrawingBoard13SceneObserver_actionHandler);
  v8 = *((_QWORD *)v6 + 1);
  if (v7)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    *(_QWORD *)(v9 + 24) = v8;
    v10 = (void (*)(uint64_t *__return_ptr, id *))sub_23A6DEAE0;
  }
  else
  {
    v10 = (void (*)(uint64_t *__return_ptr, id *))sub_23A6DD3D4;
  }
  sub_23A6DEAAC(v7);
  sub_23A6DE880(v5, v10);
  swift_release();
  v11 = (void *)sub_23A70D540();
  swift_release();
  return v11;
}

@end
