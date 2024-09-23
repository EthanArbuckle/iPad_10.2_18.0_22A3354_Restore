@implementation MessageComposeViewController

- (_TtC14FamilyCircleUI28MessageComposeViewController)initWithCoder:(id)a3
{
  objc_class *v3;
  char *v4;
  char *v5;
  char *v6;
  _TtC14FamilyCircleUI28MessageComposeViewController *v7;
  objc_super v9;

  v3 = (objc_class *)type metadata accessor for MessageComposeViewController();
  v4 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v4[OBJC_IVAR____TtC14FamilyCircleUI28MessageComposeViewController_finalRecipients] = MEMORY[0x24BEE4AF8];
  v5 = &v4[OBJC_IVAR____TtC14FamilyCircleUI28MessageComposeViewController_onDoneSharing];
  *(_QWORD *)v5 = nullsub_1;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &v4[OBJC_IVAR____TtC14FamilyCircleUI28MessageComposeViewController_onCancel];
  *(_QWORD *)v6 = nullsub_1;
  *((_QWORD *)v6 + 1) = 0;
  v9.receiver = v4;
  v9.super_class = v3;
  v7 = -[MessageComposeViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

- (void)messageComposeViewController:(MFMessageComposeViewController *)a3 shouldSendMessage:(NSString *)a4 toRecipients:(NSArray *)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  MFMessageComposeViewController *v19;
  NSString *v20;
  NSArray *v21;
  _TtC14FamilyCircleUI28MessageComposeViewController *v22;
  uint64_t v23;

  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_254A021E8;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2549F6A10;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_20E032A2C((uint64_t)v13, (uint64_t)&unk_2549F7C60, (uint64_t)v18);
  swift_release();
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;
  _TtC14FamilyCircleUI28MessageComposeViewController *v7;

  v6 = a3;
  v7 = self;
  sub_20E0184F4(a4);

}

- (_TtC14FamilyCircleUI28MessageComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC14FamilyCircleUI28MessageComposeViewController *result;

  v4 = a4;
  result = (_TtC14FamilyCircleUI28MessageComposeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
