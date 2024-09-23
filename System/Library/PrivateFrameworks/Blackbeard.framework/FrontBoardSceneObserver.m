@implementation FrontBoardSceneObserver

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC26FitnessWindowSceneObserverP33_03FD6EEFDC9DDC2AF54349F023E69D6223FrontBoardSceneObserver *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC26FitnessWindowSceneObserverP33_03FD6EEFDC9DDC2AF54349F023E69D6223FrontBoardSceneObserver_scene);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[FrontBoardSceneObserver dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26FitnessWindowSceneObserverP33_03FD6EEFDC9DDC2AF54349F023E69D6223FrontBoardSceneObserver_scene));
  swift_release();
}

- (_TtC26FitnessWindowSceneObserverP33_03FD6EEFDC9DDC2AF54349F023E69D6223FrontBoardSceneObserver)init
{
  _TtC26FitnessWindowSceneObserverP33_03FD6EEFDC9DDC2AF54349F023E69D6223FrontBoardSceneObserver *result;

  result = (_TtC26FitnessWindowSceneObserverP33_03FD6EEFDC9DDC2AF54349F023E69D6223FrontBoardSceneObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  void (*v6)(id);
  id v7;
  id v8;
  _TtC26FitnessWindowSceneObserverP33_03FD6EEFDC9DDC2AF54349F023E69D6223FrontBoardSceneObserver *v9;

  v6 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtC26FitnessWindowSceneObserverP33_03FD6EEFDC9DDC2AF54349F023E69D6223FrontBoardSceneObserver_didUpdateHandler);
  v7 = a3;
  v8 = a4;
  v9 = self;
  v6(v8);

}

@end
