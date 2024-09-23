@implementation BusinessDetailsViewModel

- (_TtC7ChatKit24BusinessDetailsViewModel)initWithConversation:(id)a3
{
  id v3;
  _TtC7ChatKit24BusinessDetailsViewModel *v4;
  _TtC7ChatKit24BusinessDetailsViewModel *v5;

  v3 = a3;
  sub_18E703D00(v3);
  v5 = v4;

  return v5;
}

- (_TtC7ChatKit24BusinessDetailsViewModel)init
{
  _TtC7ChatKit24BusinessDetailsViewModel *result;

  result = (_TtC7ChatKit24BusinessDetailsViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit24BusinessDetailsViewModel___observationRegistrar;
  v4 = sub_18E766494();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
