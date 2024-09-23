@implementation ASUIClientWrapper

- (void)pickerStartedPairing
{
  _TtC17AccessorySetupKit17ASUIClientWrapper *v2;

  v2 = self;
  sub_232DCED14();

}

- (void)pickerSetupFailed:(id)a3
{
  _TtC17AccessorySetupKit17ASUIClientWrapper *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_232DCED50((uint64_t)a3);

}

- (void)pickerStartedBridging
{
  _TtC17AccessorySetupKit17ASUIClientWrapper *v2;

  v2 = self;
  sub_232DCEE74();

}

- (void)pickerStartedRename
{
  _TtC17AccessorySetupKit17ASUIClientWrapper *v2;

  v2 = self;
  sub_232DCEEB0();

}

- (void)pickerDidPresent
{
  _TtC17AccessorySetupKit17ASUIClientWrapper *v2;

  v2 = self;
  sub_232DCEEEC();

}

- (void)pickerDidDismiss:(id)a3
{
  _TtC17AccessorySetupKit17ASUIClientWrapper *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_232DCEFD8(a3);

}

- (void)pickerDidSelectAccessory
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager);
  if (v2)
    *(_QWORD *)(v2 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_debounceCounter) = 0;
}

- (void)relayPickerCompletion:(id)a3
{
  _TtC17AccessorySetupKit17ASUIClientWrapper *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_232DCF170(a3);

}

- (id)retrieveDisplayItems
{
  void *v2;
  _TtC17AccessorySetupKit17ASUIClientWrapper *v3;
  id v4;
  unint64_t v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager);
  if (v2)
  {
    v3 = self;
    v4 = v2;
    v5 = swift_bridgeObjectRetain();
    sub_232DCF3F8(v5);

    swift_bridgeObjectRelease();
  }
  v6 = (void *)sub_232DD0E2C();
  swift_bridgeObjectRelease();
  return v6;
}

- (_TtC17AccessorySetupKit17ASUIClientWrapper)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ASUIClientWrapper();
  return -[ASUIClientWrapper init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

@end
