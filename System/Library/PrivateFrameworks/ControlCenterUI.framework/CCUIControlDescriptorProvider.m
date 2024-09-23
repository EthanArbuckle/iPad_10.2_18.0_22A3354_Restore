@implementation CCUIControlDescriptorProvider

- (CCUIControlDescriptorProvider)initWithWidgetExtensionProvider:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CCUIControlDescriptorProvider_widgetExtensionProvider) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ControlDescriptorProvider();
  v4 = a3;
  return -[CCUIControlDescriptorProvider init](&v6, sel_init);
}

- (id)descriptorFor:(id)a3
{
  id v4;
  CCUIControlDescriptorProvider *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1CFBFAAB0();

  return v6;
}

- (CCUIControlDescriptorProvider)init
{
  CCUIControlDescriptorProvider *result;

  result = (CCUIControlDescriptorProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
