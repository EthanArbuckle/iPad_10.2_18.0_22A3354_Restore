@implementation SFTabIconPool

- (SFTabIconPool)initWithSiteMetadataManager:(id)a3
{
  id v3;
  SFTabIconPool *v4;

  v3 = a3;
  v4 = (SFTabIconPool *)sub_18B8927E0(v3);

  return v4;
}

- (id)existingIconProvider
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconPool_wrapped);
  v3 = *(_QWORD *)(v2 + 24);
  v6[4] = *(_QWORD *)(v2 + 16);
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_18B890C24;
  v6[3] = &block_descriptor_18;
  v4 = _Block_copy(v6);
  sub_18BABFBB4();
  swift_release();
  return v4;
}

- (void)setExistingIconProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconPool_wrapped);
  *(_QWORD *)(v6 + 16) = sub_18B892940;
  *(_QWORD *)(v6 + 24) = v5;
  swift_release();
}

- (id)extensionIconProvider
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconPool_wrapped);
  v3 = *(_QWORD *)(v2 + 40);
  v6[4] = *(_QWORD *)(v2 + 32);
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_18B890E08;
  v6[3] = &block_descriptor_12;
  v4 = _Block_copy(v6);
  sub_18BABFBB4();
  swift_release();
  return v4;
}

- (void)setExtensionIconProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconPool_wrapped);
  *(_QWORD *)(v6 + 32) = sub_18B892938;
  *(_QWORD *)(v6 + 40) = v5;
  swift_release();
}

- (id)urlProvider
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconPool_wrapped);
  v3 = *(_QWORD *)(v2 + 56);
  v6[4] = *(_QWORD *)(v2 + 48);
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_18B89107C;
  v6[3] = &block_descriptor_6;
  v4 = _Block_copy(v6);
  sub_18BABFBB4();
  swift_release();
  return v4;
}

- (void)setUrlProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SFTabIconPool_wrapped);
  *(_QWORD *)(v6 + 48) = sub_18B8928F0;
  *(_QWORD *)(v6 + 56) = v5;
  swift_release();
}

- (void)iconDidChangeForIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  SFTabIconPool *v8;
  uint64_t v9;

  v4 = sub_18BAC0088();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BAC0070();
  v8 = self;
  sub_18B8912C0((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)makeRegistrationForIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  SFTabIconPool *v8;
  _QWORD *v9;
  char *v10;
  SFTabIconPool *v11;
  objc_super v13;

  v4 = sub_18BAC0088();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18BAC0070();
  v8 = self;
  sub_18BABFBB4();
  v9 = sub_18B96CEA0((uint64_t)v7);
  swift_release();
  v10 = (char *)objc_allocWithZone((Class)SFTabIconRegistration);
  *(_QWORD *)&v10[OBJC_IVAR___SFTabIconRegistration_wrapped] = v9;
  v13.receiver = v10;
  v13.super_class = (Class)SFTabIconRegistration;
  v11 = -[SFTabIconPool init](&v13, sel_init);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (SFTabIconPool)init
{
  SFTabIconPool *result;

  result = (SFTabIconPool *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
