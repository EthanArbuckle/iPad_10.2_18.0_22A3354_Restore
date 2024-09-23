@implementation WidgetExtensionProviderObserver

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  id v4;
  _TtC14CarPlayAssetUI31WidgetExtensionProviderObserver *v5;

  v4 = a3;
  v5 = self;
  sub_237A4BA40();

}

- (_TtC14CarPlayAssetUI31WidgetExtensionProviderObserver)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_weakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[WidgetExtensionProviderObserver init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
