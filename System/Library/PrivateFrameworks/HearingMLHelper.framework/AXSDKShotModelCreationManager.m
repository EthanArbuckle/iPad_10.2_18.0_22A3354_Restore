@implementation AXSDKShotModelCreationManager

- (AXSDKShotModelCreationManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXSDKShotModelCreationManager;
  return -[AXSDKShotModelCreationManager init](&v3, sel_init);
}

- (id)trainWithDetectorID:(id)a3 hallucinatorPath:(id)a4 pretrainedWeightsPath:(id)a5 error:(id *)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  AXSDKShotModelCreationManager *v20;
  void (*v21)(char *, uint64_t);
  void *v22;
  _QWORD v24[2];

  v24[0] = a6;
  v7 = sub_21909F084();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)v24 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v24 - v15;
  v17 = sub_21909F0D8();
  v19 = v18;
  sub_21909F078();
  sub_21909F078();
  v20 = self;
  sub_21909DCF8(v17, v19, v14, v11, (uint64_t)v16);

  swift_bridgeObjectRelease();
  v21 = *(void (**)(char *, uint64_t))(v8 + 8);
  v21(v11, v7);
  v21(v14, v7);
  v22 = (void *)sub_21909F06C();
  v21(v16, v7);
  return v22;
}

@end
