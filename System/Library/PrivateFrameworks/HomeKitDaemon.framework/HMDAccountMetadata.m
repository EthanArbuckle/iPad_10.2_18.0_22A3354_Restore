@implementation HMDAccountMetadata

- (NSString)iCloudAltDSID
{
  return (NSString *)sub_2219730A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HMDAccountMetadata_iCloudAltDSID);
}

- (void)setICloudAltDSID:(id)a3
{
  sub_221973184((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___HMDAccountMetadata_iCloudAltDSID);
}

- (NSString)firstName
{
  return (NSString *)sub_2219730A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HMDAccountMetadata_firstName);
}

- (void)setFirstName:(id)a3
{
  sub_221973184((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___HMDAccountMetadata_firstName);
}

- (NSString)lastName
{
  return (NSString *)sub_2219730A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HMDAccountMetadata_lastName);
}

- (void)setLastName:(id)a3
{
  sub_221973184((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___HMDAccountMetadata_lastName);
}

+ (HMDAccountMetadata)shared
{
  if (qword_25573B378 != -1)
    swift_once();
  return (HMDAccountMetadata *)(id)static AccountMetadata.shared;
}

- (HMDAccountMetadata)init
{
  HMDAccountMetadata *result;

  AccountMetadata.init()();
  return result;
}

- (void)updateAccountMetadata
{
  HMDAccountMetadata *v2;

  v2 = self;
  AccountMetadata.updateAccountMetadata()();

}

- (void)profilePhotoWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  HMDAccountMetadata *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25573FD20);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_222596EF4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_25573E8D0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_25573E9C0;
  v12[5] = v11;
  v13 = self;
  sub_2219F6010((uint64_t)v7, (uint64_t)&unk_25573FFC0, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
