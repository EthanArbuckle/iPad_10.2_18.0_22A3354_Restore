@implementation FollowingSearchContainerController

- (id)contentScrollView
{
  _TtC7NewsUI234FollowingSearchContainerController *v3;
  void *v4;
  id v5;
  void *v6;
  void *v8;

  type metadata accessor for SearchHomeContainerController();
  v3 = self;
  sub_1D6E275A8();
  v4 = v8;
  if (v8)
  {
    v5 = sub_1D6DAE01C();
  }
  else
  {
    v4 = (void *)MEMORY[0x1D82919D4]((char *)v3 + OBJC_IVAR____TtC7NewsUI234FollowingSearchContainerController_followingViewController);
    v5 = objc_msgSend(v4, sel_contentScrollView);
  }
  v6 = v5;

  return v6;
}

- (_TtC7NewsUI234FollowingSearchContainerController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  id v8;
  id v9;
  _TtC7NewsUI234FollowingSearchContainerController *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1D6E26978();
    swift_unknownObjectWeakInit();
    v8 = a4;
    a3 = (id)sub_1D6E26948();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectWeakInit();
    v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[FollowingSearchContainerController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);

  return v10;
}

- (_TtC7NewsUI234FollowingSearchContainerController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[FollowingSearchContainerController initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
