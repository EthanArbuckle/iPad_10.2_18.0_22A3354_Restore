@implementation PeoplePickerActionBar

- (_TtC15ConversationKit21PeoplePickerActionBar)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  PeoplePickerActionBar.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit21PeoplePickerActionBar *v2;

  v2 = self;
  PeoplePickerActionBar.layoutSubviews()();

}

- (void)rttEnablementDidChange
{
  _TtC15ConversationKit21PeoplePickerActionBar *v2;

  v2 = self;
  PeoplePickerActionBar.rttEnablementDidChange()();

}

- (_TtC15ConversationKit21PeoplePickerActionBar)initWithFrame:(CGRect)a3
{
  PeoplePickerActionBar.init(frame:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar_delegate);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar_handleToDisplay);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___videoButton);
  OUTLINED_FUNCTION_11_55((uint64_t)self + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___audioButtonConfiguration);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___audioButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar_audioButtonLeadingConstraint);
  OUTLINED_FUNCTION_11_55((uint64_t)self + OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___cancelButtonConfiguration);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___cancelButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___faceTimeAddPersonButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___sharePlayAddPersonButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___inviteWithMessagesButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___inviteWithMessagesButtonStackView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___messagesButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___messageAndFaceTimeStackView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___audioVideoCallMenu);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___audioCallDisambiguationMenu);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___backgroundView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___backgroundGradientLayer);
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___audioVideoDropdownButton);
  OUTLINED_FUNCTION_11_55((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___faceTimeAudioDropdownMenuItem);
  OUTLINED_FUNCTION_11_55((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit21PeoplePickerActionBar____lazy_storage___callUsingIPhoneDescriptiveMenuItem);
  OUTLINED_FUNCTION_0();
}

- (void)cancelButtonTapped:(id)a3
{
  id v4;
  _TtC15ConversationKit21PeoplePickerActionBar *v5;

  v4 = a3;
  v5 = self;
  PeoplePickerActionBar.cancelButtonTapped(_:)((uint64_t)v4, 6);

}

- (void)audioButtonTapped:(id)a3
{
  id v4;
  _TtC15ConversationKit21PeoplePickerActionBar *v5;

  v4 = a3;
  v5 = self;
  PeoplePickerActionBar.audioButtonTapped(_:)();

}

- (void)videoButtonTapped
{
  _TtC15ConversationKit21PeoplePickerActionBar *v2;

  v2 = self;
  PeoplePickerActionBar.videoButtonTapped()();

}

- (void)addPersonButtonTapped:(id)a3
{
  id v4;
  _TtC15ConversationKit21PeoplePickerActionBar *v5;

  v4 = a3;
  v5 = self;
  PeoplePickerActionBar.cancelButtonTapped(_:)((uint64_t)v4, 3);

}

- (void)inviteWithMessagesButtonTapped:(id)a3
{
  id v4;
  _TtC15ConversationKit21PeoplePickerActionBar *v5;

  v4 = a3;
  v5 = self;
  PeoplePickerActionBar.cancelButtonTapped(_:)((uint64_t)v4, 4);

}

- (void)messagesButtonTapped:(id)a3
{
  id v4;
  _TtC15ConversationKit21PeoplePickerActionBar *v5;

  v4 = a3;
  v5 = self;
  PeoplePickerActionBar.cancelButtonTapped(_:)((uint64_t)v4, 5);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15ConversationKit21PeoplePickerActionBar *v6;
  _TtC15ConversationKit21PeoplePickerActionBar *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  PeoplePickerActionBar.traitCollectionDidChange(_:)(v8);

}

@end
