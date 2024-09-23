@implementation BSBrandObjcShim

- (NSString)brandURI
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  BSBrandObjcShim *v7;
  void *v8;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v4 = v3[5];
  v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 32);
  v7 = self;
  v6(v4, v5);

  v8 = (void *)sub_21CAF81CC();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (BOOL)isRCSChatBot
{
  _QWORD *v3;
  id v4;
  BSBrandObjcShim *v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v4 = objc_allocWithZone((Class)IMSharedUtilitiesSoftLinkingWrapper);
  v5 = self;
  v6 = objc_msgSend(v4, sel_init);
  v7 = v3 + 2;
  v8 = v3[5];
  v9 = v3[6];
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v9 + 32))(v8, v9);
  v10 = (void *)sub_21CAF81CC();
  swift_bridgeObjectRelease();
  LOBYTE(v4) = objc_msgSend(v6, sel_isRCSChatBot_, v10);

  return (char)v4;
}

- (NSString)name
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  BSBrandObjcShim *v7;
  void *v8;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v4 = v3[5];
  v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 40);
  v7 = self;
  v6(v4, v5);

  v8 = (void *)sub_21CAF81CC();
  swift_bridgeObjectRelease();
  return (NSString *)v8;
}

- (NSArray)categories
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  BSBrandObjcShim *v7;
  uint64_t v8;
  void *v9;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v4 = v3[5];
  v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 48);
  v7 = self;
  v8 = v6(v4, v5);

  if (v8)
  {
    v9 = (void *)sub_21CAF8244();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return (NSArray *)v9;
}

- (NSString)primaryPhoneNumber
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  BSBrandObjcShim *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v4 = v3[5];
  v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 64);
  v7 = self;
  v6(v4, v5);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_21CAF81CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSString)primaryBrandColorHexString
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  BSBrandObjcShim *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v4 = v3[5];
  v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 72);
  v7 = self;
  v6(v4, v5);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_21CAF81CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSString)secondaryBrandColorHexString
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  BSBrandObjcShim *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v4 = v3[5];
  v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 80);
  v7 = self;
  v6(v4, v5);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_21CAF81CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (BOOL)isVerified
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  BSBrandObjcShim *v7;
  char v8;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v4 = v3[5];
  v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 88);
  v7 = self;
  v8 = v6(v4, v5);

  return v8 & 1;
}

- (NSString)verifiedBy
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  BSBrandObjcShim *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v4 = v3[5];
  v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 96);
  v7 = self;
  v6(v4, v5);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_21CAF81CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSURL)website
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  BSBrandObjcShim *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v7 = v6[5];
  v8 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v7);
  v9 = *(void (**)(uint64_t, uint64_t))(v8 + 104);
  v10 = self;
  v9(v7, v8);

  v11 = sub_21CAF80E8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v5, 1, v11) != 1)
  {
    v13 = (void *)sub_21CAF80B8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v11);
  }
  return (NSURL *)v13;
}

- (NSString)messageNumber
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  BSBrandObjcShim *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v4 = v3[5];
  v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 112);
  v7 = self;
  v6(v4, v5);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_21CAF81CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSString)emailAddress
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  BSBrandObjcShim *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v4 = v3[5];
  v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 120);
  v7 = self;
  v6(v4, v5);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_21CAF81CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSString)address
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  BSBrandObjcShim *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v4 = v3[5];
  v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 128);
  v7 = self;
  v6(v4, v5);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_21CAF81CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSURL)termsAndConditionsURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  BSBrandObjcShim *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v7 = v6[5];
  v8 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v7);
  v9 = *(void (**)(uint64_t, uint64_t))(v8 + 136);
  v10 = self;
  v9(v7, v8);

  v11 = sub_21CAF80E8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v5, 1, v11) != 1)
  {
    v13 = (void *)sub_21CAF80B8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v11);
  }
  return (NSURL *)v13;
}

- (NSURL)genericCSSTemplateURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  BSBrandObjcShim *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D0EC0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v7 = v6[5];
  v8 = v6[6];
  __swift_project_boxed_opaque_existential_1(v6 + 2, v7);
  v9 = *(void (**)(uint64_t, uint64_t))(v8 + 144);
  v10 = self;
  v9(v7, v8);

  v11 = sub_21CAF80E8();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v5, 1, v11) != 1)
  {
    v13 = (void *)sub_21CAF80B8();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v11);
  }
  return (NSURL *)v13;
}

- (NSString)localizedDescription
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  BSBrandObjcShim *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v4 = v3[5];
  v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 56);
  v7 = self;
  v6(v4, v5);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_21CAF81CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSString)localizedResponseTime
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  BSBrandObjcShim *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v4 = v3[5];
  v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 152);
  v7 = self;
  v6(v4, v5);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_21CAF81CC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (NSData)logoFingerprint
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  BSBrandObjcShim *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v4 = v3[5];
  v5 = v3[6];
  __swift_project_boxed_opaque_existential_1(v3 + 2, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 160);
  v7 = self;
  v8 = v6(v4, v5);
  v10 = v9;

  if (v10 >> 60 == 15)
  {
    v11 = 0;
  }
  else
  {
    v11 = (void *)sub_21CAF80F4();
    sub_21CADEAA0(v8, v10);
  }
  return (NSData *)v11;
}

- (void)squareLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  BSBrandObjcShim *v10;

  height = a3.height;
  width = a3.width;
  v7 = _Block_copy(a4);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v10 = self;
  sub_21CAF5B04(v9, (void (*)(_QWORD, unint64_t, void *))sub_21CAF2628, v8, width, height);

  swift_release();
}

- (void)wideLogoDataForDesiredSize:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  BSBrandObjcShim *v10;

  height = a3.height;
  width = a3.width;
  v7 = _Block_copy(a4);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v10 = self;
  sub_21CAF6044(v9, (void (*)(_QWORD, unint64_t, void *))sub_21CAF2628, v8, width, height);

  swift_release();
}

- (void)logoFileURLOfType:(int64_t)a3 desiredSize:(CGSize)a4 completionHandler:(id)a5
{
  CGFloat height;
  CGFloat width;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  CGFloat *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  BSBrandObjcShim *v18;
  uint64_t v19;

  height = a4.height;
  width = a4.width;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552D18C0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = (CGFloat *)swift_allocObject();
  *((_QWORD *)v14 + 2) = a3;
  v14[3] = width;
  v14[4] = height;
  *((_QWORD *)v14 + 5) = v13;
  *((_QWORD *)v14 + 6) = self;
  v15 = sub_21CAF8274();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2552D18D0;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2552D18E0;
  v17[5] = v16;
  v18 = self;
  sub_21CAF18E8((uint64_t)v12, (uint64_t)&unk_2552D18F0, (uint64_t)v17);
  swift_release();
}

- (void)logoDataOfType:(int64_t)a3 desiredSize:(CGSize)a4 fingerprint:(id)a5 completion:(id)a6
{
  double height;
  double width;
  void *v10;
  BSBrandObjcShim *v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  height = a4.height;
  width = a4.width;
  v10 = _Block_copy(a6);
  v11 = self;
  if (a5)
  {
    v12 = a5;
    a5 = (id)sub_21CAF8100();
    v14 = v13;

  }
  else
  {
    v14 = 0xF000000000000000;
  }
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v10;
  sub_21CAF6584(a3, (uint64_t)a5, v14, *(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand), (void (*)(_QWORD, unint64_t, void *))sub_21CAF2628, v15, width, height);
  swift_release();
  sub_21CADEAA0((uint64_t)a5, v14);

}

- (void)assetDataOfType:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  BSBrandObjcShim *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSBrandObjcShim_brand);
  v9 = self;
  sub_21CAF6BB4(a3, v8, (void (*)(_QWORD, unint64_t, void *))sub_21CAEA070, v7);

  swift_release();
}

- (void)clearCachedAssets:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BSBrandObjcShim *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_21CAF2230;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_21CAF5024();

  swift_release();
  swift_release();
}

+ (id)mockBrand
{
  return _s16BusinessServices13BrandObjcShimC04mockC0ACyFZ_0();
}

- (BSBrandObjcShim)init
{
  BSBrandObjcShim *result;

  result = (BSBrandObjcShim *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

+ (NSString)placeholderName
{
  void *v2;

  if (qword_2552D0B08 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21CAF81CC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

@end
