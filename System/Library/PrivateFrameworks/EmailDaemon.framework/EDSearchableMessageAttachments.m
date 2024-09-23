@implementation EDSearchableMessageAttachments

+ (CSCustomAttributeKey)specificUTIsAttribute
{
  if (qword_1EFCBBB28 != -1)
    swift_once();
  return (CSCustomAttributeKey *)(id)qword_1EFCBC118;
}

- (EDSearchableMessageAttachments)initWithNames:(id)a3 paths:(id)a4 UTIs:(id)a5 specificUTIs:(id)a6 mimeTypes:(id)a7 kinds:(id)a8
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  objc_super v18;

  v9 = sub_1D3124EF0();
  v10 = sub_1D3124EF0();
  v11 = sub_1D3124EF0();
  sub_1D3124D28();
  v12 = sub_1D3124EF0();
  v13 = sub_1D3124EF0();
  v14 = sub_1D3124EF0();
  v15 = (Class *)((char *)&self->super.isa + OBJC_IVAR___EDSearchableMessageAttachments__underlying);
  *(_QWORD *)&self->_underlying[OBJC_IVAR___EDSearchableMessageAttachments__underlying + 16] = &type metadata for SearchableMessageAttachments;
  v16 = (_QWORD *)swift_allocObject();
  *v15 = v16;
  v16[2] = v9;
  v16[3] = v10;
  v16[4] = v11;
  v16[5] = v12;
  v16[6] = v13;
  v16[7] = v14;
  v18.receiver = self;
  v18.super_class = (Class)EDSearchableMessageAttachments;
  return -[EDSearchableMessageAttachments init](&v18, sel_init);
}

- (void)addToAttributes:(id)a3
{
  id v5;
  EDSearchableMessageAttachments *v6;
  _QWORD v7[12];

  sub_1D3108558((uint64_t)self + OBJC_IVAR___EDSearchableMessageAttachments__underlying, (uint64_t)v7);
  v5 = a3;
  v6 = self;
  swift_dynamicCast();
  v7[0] = v7[6];
  v7[1] = v7[7];
  v7[2] = v7[8];
  v7[3] = v7[9];
  v7[4] = v7[10];
  v7[5] = v7[11];
  SearchableMessageAttachments.addTo(_:)((CSSearchableItemAttributeSet)v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (EDSearchableMessageAttachments)init
{
  EDSearchableMessageAttachments *result;

  result = (EDSearchableMessageAttachments *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___EDSearchableMessageAttachments__underlying);
}

@end
