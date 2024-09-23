@implementation AuthenticateAccountsImageCardContentView

- (_TtC18SharingViewService40AuthenticateAccountsImageCardContentView)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _TtC18SharingViewService40AuthenticateAccountsImageCardContentView *result;

  v5 = OBJC_IVAR____TtC18SharingViewService40AuthenticateAccountsImageCardContentView_imageConfiguration;
  v6 = (void *)objc_opt_self(UIFont);
  v7 = a3;
  v8 = objc_msgSend(v6, "systemFontOfSize:", 100.0);
  v9 = objc_msgSend((id)objc_opt_self(UIImageSymbolConfiguration), "configurationWithFont:", v8);

  *(_QWORD *)&self->PRXCardContentView_opaque[v5] = v9;
  result = (_TtC18SharingViewService40AuthenticateAccountsImageCardContentView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100136660, "SharingViewService/AuthenticateAccountsImageCardContentView.swift", 65, 2, 48, 0);
  __break(1u);
  return result;
}

- (_TtC18SharingViewService40AuthenticateAccountsImageCardContentView)initWithCardStyle:(int64_t)a3
{
  _TtC18SharingViewService40AuthenticateAccountsImageCardContentView *result;

  result = (_TtC18SharingViewService40AuthenticateAccountsImageCardContentView *)_swift_stdlib_reportUnimplementedInitializer("SharingViewService.AuthenticateAccountsImageCardContentView", 59, "init(cardStyle:)", 16, 0);
  __break(1u);
  return result;
}

- (_TtC18SharingViewService40AuthenticateAccountsImageCardContentView)initWithFrame:(CGRect)a3
{
  _TtC18SharingViewService40AuthenticateAccountsImageCardContentView *result;

  result = (_TtC18SharingViewService40AuthenticateAccountsImageCardContentView *)_swift_stdlib_reportUnimplementedInitializer("SharingViewService.AuthenticateAccountsImageCardContentView", 59, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_10007F198(*(_QWORD *)&self->PRXCardContentView_opaque[OBJC_IVAR____TtC18SharingViewService40AuthenticateAccountsImageCardContentView_imageDefinition], *(_QWORD *)&self->imageTintColor[OBJC_IVAR____TtC18SharingViewService40AuthenticateAccountsImageCardContentView_imageDefinition]);
}

@end
