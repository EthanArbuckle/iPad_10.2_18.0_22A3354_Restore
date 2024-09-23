@implementation _FKWalletBankCredentialImporter

+ (id)makeImporter
{
  objc_class *ObjCClassMetadata;
  void *v3;
  char *v4;
  objc_super v6;

  if (qword_254244AD0 != -1)
    swift_once();
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v3 = off_254245198;
  v4 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(_QWORD *)&v4[OBJC_IVAR____FKWalletBankCredentialImporter_financeStore] = v3;
  v6.receiver = v4;
  v6.super_class = ObjCClassMetadata;
  swift_retain();
  return objc_msgSendSuper2(&v6, sel_init);
}

- (void)insertCredentialFrom:(PKBankAccountInformation *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  PKBankAccountInformation *v15;
  _FKWalletBankCredentialImporter *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254247060);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_23361E534();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2560540A8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2560574C0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_2336055F8((uint64_t)v9, (uint64_t)&unk_25604C750, (uint64_t)v14);
  swift_release();
}

- (_FKWalletBankCredentialImporter)init
{
  _FKWalletBankCredentialImporter *result;

  result = (_FKWalletBankCredentialImporter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
