@implementation GMEligibilityProvider

- (int64_t)eligibility
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  return *v2;
}

- (void)setEligibility:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)requestState
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState);
  swift_beginAccess();
  return *v2;
}

- (void)setRequestState:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState);
  swift_beginAccess();
  *v4 = a3;
}

+ (_TtC24AssistantSettingsSupport21GMEligibilityProvider)shared
{
  if (qword_254DC2DF8 != -1)
    swift_once();
  return (_TtC24AssistantSettingsSupport21GMEligibilityProvider *)(id)qword_254DC3378;
}

- (PSListController)presenter
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter);
  swift_beginAccess();
  return (PSListController *)*v2;
}

- (void)setPresenter:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtP24AssistantSettingsSupport29GMSpecifierControllerProcotol_)gmSpecifierController
{
  return (_TtP24AssistantSettingsSupport29GMSpecifierControllerProcotol_ *)(id)swift_unknownObjectRetain();
}

- (BOOL)deviceSupported
{
  return 0;
}

- (BOOL)activeEnabled
{
  _QWORD *v3;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  if (*v3 == 5)
    return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_gmSpecifierController), sel_featureOptInStatus);
  else
    return 0;
}

- (BOOL)onWaitlist
{
  uint64_t *v2;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  return sub_215426660(*v2, (uint64_t)&unk_24D33D7F0) & 1;
}

- (_TtC24AssistantSettingsSupport21GMEligibilityProvider)init
{
  return (_TtC24AssistantSettingsSupport21GMEligibilityProvider *)GMEligibilityProvider.init()();
}

- (void)fetchStatusWithPresenter:(id)a3
{
  id v5;
  _TtC24AssistantSettingsSupport21GMEligibilityProvider *v6;

  v5 = a3;
  v6 = self;
  sub_2154267BC(a3);

}

- (void)updateWithContext:(int64_t)a3
{
  _TtC24AssistantSettingsSupport21GMEligibilityProvider *v4;

  v4 = self;
  sub_215427400(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter));
  swift_unknownObjectRelease();
}

@end
