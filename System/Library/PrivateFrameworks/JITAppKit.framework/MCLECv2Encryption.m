@implementation MCLECv2Encryption

- (BOOL)prependsEphemeralKeyPadding
{
  MCLECv2Encryption *v2;

  v2 = self;
  sub_21CAAF114();

  return sub_21CAC58C8() & 1;
}

- (void)setPrependsEphemeralKeyPadding:(BOOL)a3
{
  MCLECv2Encryption *v3;
  char v4;

  v3 = self;
  v4 = sub_21CAC58D4();
  sub_21CAAF1C8(v4 & 1);

}

- (void)encryptJSON:(id)a3 recipientCertBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
{
  id v7;
  id v8;
  MCLECv2Encryption *v9;
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
  sub_21CAAF2D4(v20, v15, v18, sub_21CAAF978, v17, sub_21CAAFA50, v16);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)encryptJSON:(id)a3 recipientKeyHexEncoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
{
  id v7;
  id v8;
  MCLECv2Encryption *v9;
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
  sub_21CAAFA58(v20, v15, v18, sub_21CAAFF54, v17, sub_21CAAFF98, v16);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)encryptString:(id)a3 recipientKeyBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
{
  id v7;
  id v8;
  MCLECv2Encryption *v9;
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
  sub_21CAAFFA0(v17, v22, v16, v20, (uint64_t)sub_21CAB0390, v19, (void (*)(void))sub_21CAB03D4, v18);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)encrypt:(id)a3 recipientCertBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
{
  id v7;
  id v8;
  MCLECv2Encryption *v9;
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
  MCLECv2Encryption.encrypt(_:recipientCertBase64Encoded:onSuccess:onFailure:)(v21, v22, v16, v19, (uint64_t)sub_21CAB13C8, v18, (uint64_t)sub_21CAB140C, v17);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_21CAAC698(v21, v22);
}

- (void)encrypt:(id)a3 recipientKeyHexEncoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
{
  id v7;
  id v8;
  MCLECv2Encryption *v9;
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
  MCLECv2Encryption.encrypt(_:recipientKeyHexEncoded:onSuccess:onFailure:)(v21, v22, v16, v19, (uint64_t)sub_21CAB21B8, v18, (uint64_t)sub_21CAB21FC, v17);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_21CAAC698(v21, v22);
}

- (void)encrypt:(id)a3 recipientKeyBase64Encoded:(id)a4 onSuccess:(id)a5 onFailure:(id)a6
{
  id v7;
  id v8;
  MCLECv2Encryption *v9;
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
  MCLECv2Encryption.encrypt(_:recipientKeyBase64Encoded:onSuccess:onFailure:)(v21, v22, v16, v19, (uint64_t)sub_21CAB30A4, v18, (uint64_t)sub_21CAB30E8, v17);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_21CAAC698(v21, v22);
}

- (MCLECv2Encryption)init
{
  return (MCLECv2Encryption *)MCLECv2Encryption.init()();
}

- (void).cxx_destruct
{

}

@end
