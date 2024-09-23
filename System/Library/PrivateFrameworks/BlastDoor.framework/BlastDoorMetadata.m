@implementation BlastDoorMetadata

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for Metadata, &OBJC_IVAR___BlastDoorMetadata_metadata);
}

- (NSUUID)messageGUID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v12;

  v3 = type metadata accessor for Metadata();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1AD63B084();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD0D3D2C((uint64_t)self + OBJC_IVAR___BlastDoorMetadata_metadata, (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for Metadata);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
  v10 = (void *)sub_1AD63B060();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (NSUUID *)v10;
}

- (BOOL)has_timestamp
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMetadata_metadata;
  return (v2[*(int *)(type metadata accessor for Metadata() + 20) + 8] & 1) == 0;
}

- (unint64_t)timestamp
{
  char *v2;
  char *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMetadata_metadata;
  v3 = &v2[*(int *)(type metadata accessor for Metadata() + 20)];
  if (v3[8])
    return 0;
  else
    return *(_QWORD *)v3;
}

- (BOOL)wantsDeliveryReceipt
{
  return sub_1AD4BAB70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorMetadata_metadata, (uint64_t (*)(_QWORD))type metadata accessor for Metadata);
}

- (BOOL)wantsCheckpointing
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMetadata_metadata;
  return v2[*(int *)(type metadata accessor for Metadata() + 28)];
}

- (BlastDoorMetadata_StorageContext)storageContext
{
  char *v2;
  char *v3;
  char v4;
  char v5;
  objc_class *v6;
  char *v7;
  char *v8;
  objc_super v10;

  v2 = (char *)self + OBJC_IVAR___BlastDoorMetadata_metadata;
  v3 = &v2[*(int *)(type metadata accessor for Metadata() + 32)];
  v4 = *v3;
  v5 = v3[1];
  v6 = (objc_class *)type metadata accessor for _ObjCMetadata_StorageContextWrapper();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR___BlastDoorMetadata_StorageContext_metadata_StorageContext];
  *v8 = v4;
  v8[1] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  return (BlastDoorMetadata_StorageContext *)-[BlastDoorMetadata init](&v10, sel_init);
}

- (BlastDoorMetadata)init
{
  BlastDoorMetadata *result;

  result = (BlastDoorMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorMetadata_metadata, (uint64_t (*)(_QWORD))type metadata accessor for Metadata);
}

@end
