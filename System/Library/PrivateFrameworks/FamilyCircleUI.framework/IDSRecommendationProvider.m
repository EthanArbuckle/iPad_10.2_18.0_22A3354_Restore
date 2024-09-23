@implementation IDSRecommendationProvider

- (id)getIDForEmailAddressWithHandle:(id)a3
{
  return sub_20DFF0B68(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void *))MEMORY[0x24BE4FE88]);
}

- (id)getIDForBestGuessIDWithHandle:(id)a3
{
  return sub_20DFF0B68(self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x24BE4F960]);
}

- (id)getIDForPhoneNumberWithPhoneNumber:(id)a3
{
  IDSRecommendationProvider *v4;
  void *v5;
  IDSRecommendationProvider *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    sub_20E07D5D4();
    v4 = self;
    v5 = (void *)sub_20E07D5A4();
  }
  else
  {
    v6 = self;
    v5 = 0;
  }
  v7 = (void *)_IDSCopyIDForPhoneNumberWithOptions();

  if (v7)
  {
    sub_20E07D5D4();

    swift_bridgeObjectRelease();
    v8 = (void *)sub_20E07D5A4();
  }
  else
  {

    v8 = 0;
  }
  swift_bridgeObjectRelease();
  return v8;
}

- (void)validateHandlesWithIdsDestinations:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  IDSRecommendationProvider *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_254A01378;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2549F6A10;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_20E032A2C((uint64_t)v9, (uint64_t)&unk_2549F7C60, (uint64_t)v14);
  swift_release();
}

- (IDSRecommendationProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IDSRecommendationProvider();
  return -[IDSRecommendationProvider init](&v3, sel_init);
}

@end
