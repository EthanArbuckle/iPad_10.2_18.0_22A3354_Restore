@implementation WalletDeletionObserver

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC13FinanceDaemon22WalletDeletionObserver *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13FinanceDaemon22WalletDeletionObserver_applicationWorkspace);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[WalletDeletionObserver dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13FinanceDaemon22WalletDeletionObserver_applicationWorkspace));
}

- (void)applicationsDidInstall:(id)a3
{
  sub_1CF4AA4B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1CF4AA328);
}

- (void)applicationsDidUninstall:(id)a3
{
  sub_1CF4AA4B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1CF4AA3F0);
}

- (_TtC13FinanceDaemon22WalletDeletionObserver)init
{
  _TtC13FinanceDaemon22WalletDeletionObserver *result;

  result = (_TtC13FinanceDaemon22WalletDeletionObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
