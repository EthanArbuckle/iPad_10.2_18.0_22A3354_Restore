@implementation CKChatBotInfoController

- (IMHandle)handle
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKChatBotInfoController_handle);
  swift_beginAccess();
  return (IMHandle *)*v2;
}

- (void)setHandle:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___CKChatBotInfoController_handle);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSString)fallbackHandle
{
  void *v2;

  swift_beginAccess();
  sub_18E7669BC();
  v2 = (void *)sub_18E768954();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setFallbackHandle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_18E768984();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___CKChatBotInfoController_fallbackHandle);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (CKChatBotInfoController)initWithHandle:(id)a3 fallbackHandle:(id)a4
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  v6 = sub_18E768984();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKChatBotInfoController_handle) = (Class)a3;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___CKChatBotInfoController_fallbackHandle);
  *v7 = v6;
  v7[1] = v8;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ChatBotInfoController();
  v9 = a3;
  return -[CKChatBotInfoController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
}

- (CKChatBotInfoController)initWithCoder:(id)a3
{
  CKChatBotInfoController *result;

  result = (CKChatBotInfoController *)sub_18E769320();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  CKChatBotInfoController *v2;

  v2 = self;
  sub_18E55FF84();

}

- (CKChatBotInfoController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CKChatBotInfoController *result;

  v4 = a4;
  result = (CKChatBotInfoController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
