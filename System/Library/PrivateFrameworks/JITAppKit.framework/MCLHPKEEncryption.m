@implementation MCLHPKEEncryption

- (void)encryptString:(id)a3 certBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
{
  id v7;
  id v8;
  MCLHPKEEncryption *v9;
  uint64_t v10;
  uint64_t v11;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v7 = a3;
  v8 = a4;
  v14 = _Block_copy(a5);
  v15 = _Block_copy(a6);
  v9 = self;
  v17 = sub_21CAC5B2C();
  v22 = v10;
  v16 = sub_21CAC5B2C();
  v20 = v11;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v14;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v15;
  sub_21CABA3A4(v17, v22, v16, v20, (uint64_t)sub_21CABB06C, v19, (uint64_t)sub_21CABB0B0, v18);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)encryptJSON:(id)a3 certBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
{
  id v7;
  id v8;
  MCLHPKEEncryption *v9;
  void *v10;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  void *v20;

  v7 = a3;
  v8 = a4;
  v13 = _Block_copy(a5);
  v14 = _Block_copy(a6);
  v9 = self;
  v20 = (void *)sub_21CAC5AE4();
  v15 = (void *)sub_21CAC5B2C();
  v18 = v10;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v14;
  sub_21CABA7A8(v20, v15, v18, sub_21CABB0F4, v17, sub_21CABB138, v16);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (MCLHPKEEncryption)init
{
  return (MCLHPKEEncryption *)sub_21CABCA24();
}

- (void).cxx_destruct
{

}

@end
