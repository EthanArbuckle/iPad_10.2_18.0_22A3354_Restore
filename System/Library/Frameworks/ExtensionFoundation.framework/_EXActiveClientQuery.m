@implementation _EXActiveClientQuery

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_190C7DD70(v7);

  return v9 & 1;
}

- (void)query:(id)a3 resultDidUpdate:(id)a4 reply:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_190C7DF48(v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (BOOL)isEqual:(id)a3
{
  _TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery *v4;
  _TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_190CA8908();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_190C79D50((uint64_t)v8);

  sub_190C38990((uint64_t)v8, &qword_1ECD98D20);
  return v6 & 1;
}

- (int64_t)hash
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery_query), sel_hash);
}

- (_TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery)init
{
  _TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery *result;

  result = (_TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery_query));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19ExtensionFoundationP33_591406279EDD09BF7033B88E7B83DCFD20_EXActiveClientQuery_xpcListener));
  swift_unknownObjectWeakDestroy();
}

@end
