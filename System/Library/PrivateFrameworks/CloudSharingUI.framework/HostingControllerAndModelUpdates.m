@implementation HostingControllerAndModelUpdates

- (UIViewController)viewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_viewController));
}

- (id)sourceAppBundleIDDidChangeBlock
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v2 = *(_QWORD *)&self->viewController[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_sourceAppBundleIDDidChangeBlock];
  v5[4] = *(Class *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_sourceAppBundleIDDidChangeBlock);
  v5[5] = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_20D63223C;
  v5[3] = &block_descriptor_2;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (_TtC14CloudSharingUI32HostingControllerAndModelUpdates)initWithViewController:(id)a3 sourceAppBundleIDDidChangeBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  void (**v8)();
  id v9;
  objc_super v11;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_viewController) = (Class)a3;
  v8 = (void (**)())((char *)self
                   + OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_sourceAppBundleIDDidChangeBlock);
  *v8 = sub_20D632974;
  v8[1] = (void (*)())v7;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for HostingControllerAndModelUpdates();
  v9 = a3;
  return -[HostingControllerAndModelUpdates init](&v11, sel_init);
}

- (_TtC14CloudSharingUI32HostingControllerAndModelUpdates)init
{
  _TtC14CloudSharingUI32HostingControllerAndModelUpdates *result;

  result = (_TtC14CloudSharingUI32HostingControllerAndModelUpdates *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_viewController));
  swift_release();
}

@end
