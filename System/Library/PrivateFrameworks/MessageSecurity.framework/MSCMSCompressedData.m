@implementation MSCMSCompressedData

- (MSOID)type
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MSCMSCompressedData_type);
  swift_beginAccess();
  return (MSOID *)*v2;
}

- (void)setType:(id)a3
{
  sub_1DEF05004((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___MSCMSCompressedData_type);
}

- (NSData)dataContent
{
  uint64_t *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___MSCMSCompressedData_dataContent);
  swift_beginAccess();
  v3 = 0;
  v4 = v2[1];
  if (v4 >> 60 != 15)
  {
    v5 = *v2;
    sub_1DEF03944(v5, v4);
    v3 = (void *)sub_1DEF144DC();
    sub_1DEF08E64(v5, v4);
  }
  return (NSData *)v3;
}

- (void)setDataContent:(id)a3
{
  void *v3;
  MSCMSCompressedData *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  MSCMSCompressedData *v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;

  v3 = a3;
  if (a3)
  {
    v5 = self;
    v6 = v3;
    v3 = (void *)sub_1DEF144F4();
    v8 = v7;

  }
  else
  {
    v9 = self;
    v8 = 0xF000000000000000;
  }
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___MSCMSCompressedData_dataContent);
  swift_beginAccess();
  v11 = *v10;
  v12 = v10[1];
  *v10 = (uint64_t)v3;
  v10[1] = v8;
  sub_1DEF08E64(v11, v12);

}

- (MSCMSMessage)embeddedContent
{
  swift_beginAccess();
  return (MSCMSMessage *)(id)swift_unknownObjectRetain();
}

- (void)setEmbeddedContent:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___MSCMSCompressedData_embeddedContent);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (MSOID)contentType
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MSCMSCompressedData_contentType);
  swift_beginAccess();
  return (MSOID *)*v2;
}

- (void)setContentType:(id)a3
{
  sub_1DEF05004((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___MSCMSCompressedData_contentType);
}

- (MSCMSCompressedData)initWithDataContent:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = sub_1DEF144F4();
  v7 = v6;

  return (MSCMSCompressedData *)MSCMSCompressedData.init(dataContent:)(v5, v7);
}

- (MSCMSCompressedData)initWithEmbeddedContent:(id)a3 error:(id *)a4
{
  swift_unknownObjectRetain();
  return (MSCMSCompressedData *)MSCMSCompressedData.init(embeddedContent:)(a3);
}

- (id)encodeMessageSecurityObject:(id *)a3
{
  MSCMSCompressedData *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v3 = self;
  v4 = MSCMSCompressedData.encodeSecurityObject()();
  v6 = v5;

  v7 = (void *)sub_1DEF144DC();
  sub_1DEF03824(v4, v6);
  return v7;
}

+ (id)decodeMessageSecurityObject:(id)a3 options:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  objc_class *v11;

  v6 = a3;
  v7 = a4;
  v8 = sub_1DEF144F4();
  v10 = v9;

  v11 = sub_1DEF0CBB0(v8, v10, a4);
  sub_1DEF03824(v8, v10);
  return v11;
}

- (MSCMSCompressedData)init
{
  MSCMSCompressedData *result;

  result = (MSCMSCompressedData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1DEF08E64(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MSCMSCompressedData_dataContent), *(_QWORD *)&self->type[OBJC_IVAR___MSCMSCompressedData_dataContent]);
  swift_unknownObjectRelease();

}

@end
