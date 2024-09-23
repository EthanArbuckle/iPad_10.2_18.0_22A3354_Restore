@implementation CKInboxCellData

- (UIImage)image
{
  return (UIImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___CKInboxCellData_image));
}

- (NSString)title
{
  void *v2;

  sub_18E7669BC();
  v2 = (void *)sub_18E768954();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (unint64_t)filterMode
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR___CKInboxCellData_filterMode);
}

- (CKInboxCellData)initWithImage:(id)a3 title:(id)a4 filterMode:(unint64_t)a5
{
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  id v11;
  objc_super v13;

  v8 = sub_18E768984();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKInboxCellData_image) = (Class)a3;
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___CKInboxCellData_title);
  *v9 = v8;
  v9[1] = v10;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKInboxCellData_filterMode) = (Class)a5;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for InboxCellData();
  v11 = a3;
  return -[CKInboxCellData init](&v13, sel_init);
}

- (CKInboxCellData)init
{
  CKInboxCellData *result;

  result = (CKInboxCellData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

+ (CKInboxCellData)allMessagesCellData
{
  return (CKInboxCellData *)sub_18E674034((uint64_t)a1, (uint64_t)a2, &qword_1EE1074A0, (id *)&qword_1EE10EA38);
}

+ (CKInboxCellData)knownSendersCellData
{
  return (CKInboxCellData *)sub_18E674034((uint64_t)a1, (uint64_t)a2, &qword_1EE1074A8, (id *)&qword_1EE10EA40);
}

+ (CKInboxCellData)unknownSendersCellData
{
  return (CKInboxCellData *)sub_18E674034((uint64_t)a1, (uint64_t)a2, &qword_1EE1074B0, (id *)&qword_1EE10EA48);
}

+ (CKInboxCellData)unreadMessagesCellData
{
  return (CKInboxCellData *)sub_18E674034((uint64_t)a1, (uint64_t)a2, &qword_1EE1074B8, (id *)&qword_1EE10EA50);
}

+ (CKInboxCellData)oscarCellData
{
  return (CKInboxCellData *)sub_18E674034((uint64_t)a1, (uint64_t)a2, &qword_1EE1074C0, (id *)&qword_1EE10EA58);
}

+ (CKInboxCellData)recentlyDeletedCellData
{
  return (CKInboxCellData *)sub_18E674034((uint64_t)a1, (uint64_t)a2, &qword_1EE1074C8, (id *)&qword_1EE10EA60);
}

+ (CKInboxCellData)transactionalCellData
{
  return (CKInboxCellData *)sub_18E674034((uint64_t)a1, (uint64_t)a2, &qword_1EE1074D0, (id *)&qword_1EE10EA68);
}

+ (CKInboxCellData)promotionalCellData
{
  return (CKInboxCellData *)sub_18E674034((uint64_t)a1, (uint64_t)a2, &qword_1EE1074D8, (id *)&qword_1EE10EA70);
}

+ (CKInboxCellData)junkCellData
{
  return (CKInboxCellData *)sub_18E674034((uint64_t)a1, (uint64_t)a2, &qword_1EE1074E0, (id *)&qword_1EE10EA78);
}

+ (CKInboxCellData)blackholeJunkCellData
{
  return (CKInboxCellData *)sub_18E674034((uint64_t)a1, (uint64_t)a2, &qword_1EE1074E8, (id *)&qword_1EE10EA80);
}

@end
