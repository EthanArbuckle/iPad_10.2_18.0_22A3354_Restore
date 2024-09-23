@implementation MCLECv3Encryption

- (void)encryptJSON:(id)a3 recipientCertBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
{
  id v7;
  id v8;
  MCLECv3Encryption *v9;
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
  sub_21CABE5DC(v20, v15, v18, sub_21CABEB70, v17, sub_21CABEBB4, v16);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)encryptWithPayload:(id)a3 recipientCertBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
{
  id v7;
  id v8;
  MCLECv3Encryption *v9;
  unint64_t v10;
  uint64_t v11;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  unint64_t v22;

  v7 = a3;
  v8 = a4;
  v14 = _Block_copy(a5);
  v15 = _Block_copy(a6);
  v9 = self;
  v21 = sub_21CAC5868();
  v22 = v10;
  v16 = sub_21CAC5B2C();
  v19 = v11;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v14;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v15;
  sub_21CABEBBC(v21, v22, v16, v19, (uint64_t)sub_21CAC2F68, v18, (uint64_t)sub_21CAC2FAC, v17);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_21CAAC698(v21, v22);
}

- (MCLECv3Encryption)init
{
  return (MCLECv3Encryption *)MCLECv3Encryption.init()();
}

- (void).cxx_destruct
{

}

@end
