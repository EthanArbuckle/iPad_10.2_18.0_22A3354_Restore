@implementation LockdownModeManagerInternal

- (LockdownModeManagerInternal)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___LockdownModeManagerInternal____lazy_storage___connection) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[LockdownModeManagerInternal init](&v5, sel_init);
}

- (BOOL)enabled
{
  return _s12LockdownMode0aB7ManagerC7enabledSbvg_0() & 1;
}

+ (LockdownModeManagerInternal)shared
{
  if (qword_25435E070 != -1)
    swift_once();
  return (LockdownModeManagerInternal *)(id)qword_25435E078;
}

- (BOOL)enabledInAccount
{
  LockdownModeManagerInternal *v2;
  char v3;

  v2 = self;
  v3 = LockdownModeManager.enabledInAccount.getter();

  return v3 & 1;
}

- (void)getEnabledInAccount:(BOOL)a3 completion:(id)a4
{
  sub_240B190B8(self, (int)a2, a3, a4, (uint64_t)&unk_251104060, (uint64_t)sub_240B1A4F0, (void (*)(uint64_t, uint64_t, uint64_t))LockdownModeManager.getEnabledInAccount(synchronize:completion:));
}

- (void)setEnabled:(BOOL)a3 options:(id)a4 completion:(id)a5
{
  void *v8;
  LockdownModeManagerInternal *v9;

  v8 = _Block_copy(a5);
  if (a4)
    a4 = (id)sub_240B1A850();
  _Block_copy(v8);
  v9 = self;
  sub_240B1A160(a3, (uint64_t)a4, (uint64_t)v9, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)notifyRestrictionChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  LockdownModeManagerInternal *v7;
  Swift::String v8;

  v4 = sub_240B1A868();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LockdownModeManager.notifyRestrictionChanged(_:)(v8);

  swift_bridgeObjectRelease();
}

- (void)enableIfNeeded:(BOOL)a3 completion:(id)a4
{
  sub_240B190B8(self, (int)a2, a3, a4, (uint64_t)&unk_251103FC0, (uint64_t)sub_240B1A4D8, (void (*)(uint64_t, uint64_t, uint64_t))LockdownModeManager.enableIfNeeded(reboot:completion:));
}

- (void)migrateIfNeededWithCompletion:(id)a3
{
  void *v4;
  LockdownModeManagerInternal *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_240B1A32C((uint64_t)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)rebootIfNeeded
{
  uint64_t v2;
  void *v3;
  void *v4;
  LockdownModeManagerInternal *v5;
  _QWORD aBlock[6];

  v5 = self;
  v2 = sub_240B1831C((uint64_t)sub_240B18400, (uint64_t)&block_descriptor_72, (SEL *)&selRef_synchronousRemoteObjectProxyWithErrorHandler_);
  if (v2)
  {
    v3 = (void *)v2;
    aBlock[4] = sub_240B193BC;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_240B18950;
    aBlock[3] = &block_descriptor_42;
    v4 = _Block_copy(aBlock);
    objc_msgSend(v3, sel_rebootIfNeededWithCompletion_, v4);
    swift_unknownObjectRelease();
    _Block_release(v4);

  }
  else
  {

  }
}

- (void).cxx_destruct
{

}

@end
