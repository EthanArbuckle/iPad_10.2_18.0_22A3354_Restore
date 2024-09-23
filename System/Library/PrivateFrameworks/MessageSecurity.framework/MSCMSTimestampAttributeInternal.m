@implementation MSCMSTimestampAttributeInternal

- (MSOID)attributeType
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType);
  swift_beginAccess();
  return (MSOID *)*v2;
}

- (void)setAttributeType:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___MSCMSTimestampAttributeInternal_attributeType);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)dealloc
{
  objc_class *ObjectType;
  MSCMSTimestampAttributeInternal *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_beginAccess();
  v4 = self;
  free_TSTInfo();
  swift_endAccess();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[MSCMSTimestampAttributeInternal dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{

}

- (MSCMSTimestampAttributeInternal)initWithAttribute:(id)a3 error:(id *)a4
{
  MSCMSTimestampAttributeInternal *result;

  MSCMSTimestampAttributeInternal.init(attribute:)(a3);
  return result;
}

- (MSCMSTimestampAttributeInternal)initWithTimestampToken:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = sub_1DEF144F4();
  v7 = v6;

  return (MSCMSTimestampAttributeInternal *)MSCMSTimestampAttributeInternal.init(timestampToken:)(v5, v7);
}

- (BOOL)verifyTimestamp:(id)a3 error:(id *)a4
{
  id v5;
  MSCMSTimestampAttributeInternal *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v5 = a3;
  v6 = self;
  v7 = sub_1DEF144F4();
  v9 = v8;

  MSCMSTimestampAttributeInternal.verifyTimestamp(expectedMessageDigest:)(v7, v9);
  sub_1DEF03824(v7, v9);
  return 1;
}

- (id)encodeAttributeWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  sub_1DEF08C08();
  v4 = (void *)swift_allocError();
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = 0;
  *(_BYTE *)(v5 + 16) = 48;
  swift_willThrow();
  if (a3)
  {
    v6 = (void *)sub_1DEF14494();

    v7 = v6;
    *a3 = v6;
  }
  else
  {

  }
  return 0;
}

- (id)timestampToken
{
  uint64_t *v2;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___MSCMSTimestampAttributeInternal_tstinfo);
  swift_beginAccess();
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D68]), sel_initWithTimeIntervalSince1970_, (double)v2[11]);
}

- (MSCMSTimestampAttributeInternal)init
{
  MSCMSTimestampAttributeInternal *result;

  result = (MSCMSTimestampAttributeInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
