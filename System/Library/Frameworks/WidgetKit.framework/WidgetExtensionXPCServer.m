@implementation WidgetExtensionXPCServer

- (BOOL)shouldAcceptConnection:(id)a3
{
  id v5;
  id v6;
  _TtC9WidgetKit24WidgetExtensionXPCServer *v7;
  id v8;
  id v9;

  v5 = objc_allocWithZone((Class)type metadata accessor for WidgetExtensionXPCServer.ExportedObject());
  v6 = a3;
  v7 = self;
  v8 = sub_1908AB3CC(v6);
  v9 = objc_msgSend((id)type metadata accessor for _WidgetExtensionBaseContext(), sel__extensionAuxiliaryVendorProtocol);
  objc_msgSend(v6, sel_setExportedInterface_, v9);

  objc_msgSend(v6, sel_setExportedObject_, v8);
  objc_msgSend(v6, sel_resume);

  return 1;
}

- (_TtC9WidgetKit24WidgetExtensionXPCServer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WidgetExtensionXPCServer();
  return -[WidgetExtensionXPCServer init](&v3, sel_init);
}

@end
