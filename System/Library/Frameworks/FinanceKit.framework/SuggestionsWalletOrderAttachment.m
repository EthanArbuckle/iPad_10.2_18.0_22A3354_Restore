@implementation SuggestionsWalletOrderAttachment

- (NSURL)url
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_23361D340();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_url;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_23361D268();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSURL *)v8;
}

- (void)setUrl:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void (*v9)(char *, char *, uint64_t);
  _TtC10FinanceKit32SuggestionsWalletOrderAttachment *v10;
  uint64_t v11;

  v4 = sub_23361D340();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23361D2D4();
  v8 = (char *)self + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_url;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();

}

- (NSData)data
{
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_data);
  swift_beginAccess();
  v4 = *v2;
  v3 = v2[1];
  sub_2331D1374(v4, v3);
  v5 = (void *)sub_23361D3AC();
  sub_23316BEA4(v4, v3);
  return (NSData *)v5;
}

- (void)setData:(id)a3
{
  id v4;
  _TtC10FinanceKit32SuggestionsWalletOrderAttachment *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;

  v4 = a3;
  v5 = self;
  v6 = sub_23361D3C4();
  v8 = v7;

  v9 = (uint64_t *)((char *)v5 + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_data);
  swift_beginAccess();
  v10 = *v9;
  v11 = v9[1];
  *v9 = v6;
  v9[1] = v8;
  sub_23316BEA4(v10, v11);

}

- (NSString)fqoid
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23361E12C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setFqoid:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_23361E150();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_fqoid);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (int64_t)state
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_state);
  swift_beginAccess();
  return *v2;
}

- (void)setState:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_state);
  swift_beginAccess();
  *v4 = a3;
}

+ (id)readContentsOfOrderAt:(id)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v10;

  v4 = sub_23361D340();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23361D2D4();
  swift_getObjCClassMetadata();
  v8 = (void *)static SuggestionsWalletOrderAttachment.readContentsOfOrder(at:)(v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v8;
}

- (_TtC10FinanceKit32SuggestionsWalletOrderAttachment)init
{
  _TtC10FinanceKit32SuggestionsWalletOrderAttachment *result;

  result = (_TtC10FinanceKit32SuggestionsWalletOrderAttachment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_url;
  v4 = sub_23361D340();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_23316BEA4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_data), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC10FinanceKit32SuggestionsWalletOrderAttachment_data]);
  swift_bridgeObjectRelease();
}

@end
