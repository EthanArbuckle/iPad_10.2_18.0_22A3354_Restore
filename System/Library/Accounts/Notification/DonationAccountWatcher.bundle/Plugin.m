@implementation Plugin

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC22DonationAccountWatcher6Plugin *v13;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = self;
  sub_230F0DDC4(a3, a6);

}

- (_TtC22DonationAccountWatcher6Plugin)init
{
  id v2;
  id v3;
  _TtC22DonationAccountWatcher6Plugin *v4;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19190]), sel_init);
  v3 = objc_allocWithZone((Class)type metadata accessor for Plugin());
  v4 = (_TtC22DonationAccountWatcher6Plugin *)sub_230F0DCE8(v2);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  objc_msgSend(*(id *)((char *)&v4->super.isa + OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger), sel_pluginLoaded);
  return v4;
}

- (void)dealloc
{
  void *v2;
  _TtC22DonationAccountWatcher6Plugin *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22DonationAccountWatcher6Plugin_logger);
  v3 = self;
  objc_msgSend(v2, sel_pluginUnloaded);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for Plugin();
  -[Plugin dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
}

@end
