@implementation AuthenticateAccountsImageCardContentView

- (_TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  objc_class *v9;
  _TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView *result;

  v5 = OBJC_IVAR____TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView_imageConfiguration;
  v6 = (void *)objc_opt_self();
  v7 = a3;
  v8 = objc_msgSend(v6, sel_systemFontOfSize_, 100.0);
  v9 = (objc_class *)objc_msgSend((id)objc_opt_self(), sel_configurationWithFont_, v8);

  *(Class *)((char *)&self->super.super.super.super.isa + v5) = v9;
  result = (_TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView *)sub_23673757C();
  __break(1u);
  return result;
}

- (_TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView)initWithCardStyle:(int64_t)a3
{
  _TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView *result;

  result = (_TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView)initWithFrame:(CGRect)a3
{
  _TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView *result;

  result = (_TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView_imageTintColor));
  sub_236727240(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView_imageDefinition), *(id *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView_imageDefinition), *((_BYTE *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView_imageDefinition));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14AppleIDSetupUI40AuthenticateAccountsImageCardContentView_imageConfiguration));
}

@end
