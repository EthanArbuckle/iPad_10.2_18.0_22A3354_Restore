@implementation ASPasswordSignInEventCollector

- (void)didUseCredentialForUsername:(id)a3 forURL:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inBrowserWithBundleIdentifier:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  _TtC26AuthenticationServicesCore30ASPasswordSignInEventCollector *v39;

  v39 = self;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A2E8A0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = v8;
  v9 = sub_20E6E9BC0();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v32 - v14;
  v16 = sub_20E6EA1CC();
  v35 = v17;
  v36 = v16;
  v38 = v15;
  sub_20E6E9B78();
  v33 = sub_20E6EA1CC();
  v19 = v18;
  v34 = sub_20E6EA1CC();
  v21 = v20;
  v22 = sub_20E6EA37C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v8, 1, 1, v22);
  v23 = v15;
  v24 = v9;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v23, v9);
  v25 = (*(unsigned __int8 *)(v10 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v26 = (v11 + v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  v27 = (char *)swift_allocObject();
  *((_QWORD *)v27 + 2) = 0;
  *((_QWORD *)v27 + 3) = 0;
  v29 = v35;
  v28 = v36;
  *((_QWORD *)v27 + 4) = v39;
  *((_QWORD *)v27 + 5) = v28;
  v30 = v33;
  *((_QWORD *)v27 + 6) = v29;
  *((_QWORD *)v27 + 7) = v30;
  *((_QWORD *)v27 + 8) = v19;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v27[v25], v13, v24);
  v31 = (uint64_t *)&v27[v26];
  *v31 = v34;
  v31[1] = v21;
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_20E696708((uint64_t)v37, (uint64_t)&unk_254A2E948, (uint64_t)v27);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v38, v24);
}

- (void)didUseCredentialForUsername:(id)a3 forHost:(id)a4 fromProviderWithBundleIdentifier:(id)a5 inAppWithBundleIdentifier:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A2E8A0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_20E6EA1CC();
  v12 = v11;
  if (a4)
  {
    v13 = sub_20E6EA1CC();
    a4 = v14;
  }
  else
  {
    v13 = 0;
  }
  v15 = sub_20E6EA1CC();
  v17 = v16;
  v18 = sub_20E6EA1CC();
  v20 = v19;
  v21 = sub_20E6EA37C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v10, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = v13;
  v22[5] = a4;
  v23 = v25;
  v22[6] = self;
  v22[7] = v23;
  v22[8] = v12;
  v22[9] = v15;
  v22[10] = v17;
  v22[11] = v18;
  v22[12] = v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain_n();
  sub_20E696708((uint64_t)v10, (uint64_t)&unk_254A2E940, (uint64_t)v22);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)providerForRecentlyFilledCredentialWithUsername:(NSString *)a3 forRelyingPartyIdentifier:(NSString *)a4 inAppWithBundleIdentifier:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  uint64_t v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A2E8A0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_20E6EA37C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_254A2E928;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_254A2E930;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  swift_retain();
  sub_20E6E2380((uint64_t)v13, (uint64_t)&unk_254A2E938, (uint64_t)v18);
  swift_release();
}

- (void)providerForRecentlyFilledCredentialWithUsername:(NSString *)a3 forAppWithBundleIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSString *v17;
  NSString *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A2E8A0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_20E6EA37C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_254A2E910;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_254A2EFD0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_20E6E2380((uint64_t)v11, (uint64_t)&unk_254A2E918, (uint64_t)v16);
  swift_release();
}

- (_TtC26AuthenticationServicesCore30ASPasswordSignInEventCollector)init
{
  objc_super v4;

  swift_defaultActor_initialize();
  swift_retain();
  *(_QWORD *)&self->_anon_60[8] = sub_20E6A5880(MEMORY[0x24BEE4AF8]);
  swift_release();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ASPasswordSignInEventCollector();
  return -[ASPasswordSignInEventCollector init](&v4, sel_init);
}

@end
