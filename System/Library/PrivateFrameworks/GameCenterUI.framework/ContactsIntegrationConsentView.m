@implementation ContactsIntegrationConsentView

- (_TtC12GameCenterUI30ContactsIntegrationConsentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB567044();
}

- (void)primaryAction
{
  _TtC12GameCenterUI30ContactsIntegrationConsentView *v2;

  v2 = self;
  sub_1AB5671B4(1, (uint64_t)sub_1AB567460);

}

- (void)secondaryAction
{
  _TtC12GameCenterUI30ContactsIntegrationConsentView *v2;

  v2 = self;
  sub_1AB5671B4(0, (uint64_t)sub_1AB567460);

}

- (void).cxx_destruct
{
  sub_1AB4CB5BC((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_delegate);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_iconImage);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_detailView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_primaryTrayButton);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30ContactsIntegrationConsentView_secondaryTrayButton));
}

@end
