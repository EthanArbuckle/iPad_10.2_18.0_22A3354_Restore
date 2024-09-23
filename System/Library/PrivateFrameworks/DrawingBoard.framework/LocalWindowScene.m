@implementation LocalWindowScene

- (void)_readySceneForConnection
{
  _TtC12DrawingBoard16LocalWindowScene *v2;

  v2 = self;
  sub_23A7021B8();

}

- (void)_invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)swift_getObjectType();
  -[LocalWindowScene _invalidate](&v2, sel__invalidate);
}

- (_TtC12DrawingBoard16LocalWindowScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _TtC12DrawingBoard16LocalWindowScene *v12;
  _TtC12DrawingBoard16LocalWindowScene *v13;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12DrawingBoard16LocalWindowScene_myWindow) = 0;
  v8 = OBJC_IVAR____TtC12DrawingBoard16LocalWindowScene__delegate;
  v9 = objc_allocWithZone((Class)type metadata accessor for LocalWindowSceneDelegate());
  v10 = a3;
  v11 = a4;
  v12 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);

  v15.receiver = v12;
  v15.super_class = ObjectType;
  v13 = -[LocalWindowScene initWithSession:connectionOptions:](&v15, sel_initWithSession_connectionOptions_, v10, v11);

  return v13;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12DrawingBoard16LocalWindowScene_myWindow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12DrawingBoard16LocalWindowScene__delegate));
}

@end
