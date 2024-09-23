@implementation PersonalizationPrivacyConsentViewController

- (void)viewDidLoad
{
  _TtC10Blackbeard43PersonalizationPrivacyConsentViewController *v2;

  v2 = self;
  sub_23721C000();

}

- (void)didTapOptInButton
{
  sub_23721CB50((char *)self, (uint64_t)a2, 1);
}

- (void)didTapOptOutButton
{
  sub_23721CB50((char *)self, (uint64_t)a2, 0);
}

- (_TtC10Blackbeard43PersonalizationPrivacyConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC10Blackbeard43PersonalizationPrivacyConsentViewController *result;

  result = (_TtC10Blackbeard43PersonalizationPrivacyConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10Blackbeard43PersonalizationPrivacyConsentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC10Blackbeard43PersonalizationPrivacyConsentViewController *result;

  v6 = a5;
  result = (_TtC10Blackbeard43PersonalizationPrivacyConsentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10Blackbeard43PersonalizationPrivacyConsentViewController_privacyPreferenceClient);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10Blackbeard43PersonalizationPrivacyConsentViewController_textLabel));
  swift_unknownObjectRelease();
  sub_236E8BE48(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC10Blackbeard43PersonalizationPrivacyConsentViewController_onConsent));
  sub_236E8BE48(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC10Blackbeard43PersonalizationPrivacyConsentViewController_onDismiss));
}

@end
