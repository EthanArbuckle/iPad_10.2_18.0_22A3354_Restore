@implementation CNKParticipantScreenShareInfoViewInternal

- (double)customCornerRadius
{
  return ParticipantScreenShareInfoView.customCornerRadius.getter();
}

- (void)setCustomCornerRadius:(double)a3
{
  CNKParticipantScreenShareInfoViewInternal *v4;

  v4 = self;
  ParticipantScreenShareInfoView.customCornerRadius.setter(a3);

}

- (double)preferredHeight
{
  CNKParticipantScreenShareInfoViewInternal *v2;
  double v3;

  v2 = self;
  v3 = ParticipantScreenShareInfoView.preferredHeight.getter();

  return v3;
}

- (UIImage)avatarImage
{
  return (UIImage *)ParticipantScreenShareInfoView.avatarImage.getter();
}

- (void)setAvatarImage:(id)a3
{
  id v5;
  CNKParticipantScreenShareInfoViewInternal *v6;

  v5 = a3;
  v6 = self;
  ParticipantScreenShareInfoView.avatarImage.setter(a3);

}

- (CNKParticipantScreenShareInfoViewInternal)init
{
  return (CNKParticipantScreenShareInfoViewInternal *)ParticipantScreenShareInfoView.init()();
}

- (CNKParticipantScreenShareInfoViewInternal)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ParticipantScreenShareInfoView.init(coder:)();
}

- (void)layoutSubviews
{
  CNKParticipantScreenShareInfoViewInternal *v2;

  v2 = self;
  ParticipantScreenShareInfoView.layoutSubviews()((SEL *)&selRef_layoutSubviews);

}

- (void)configureWith:(id)a3 isFullScreenMode:(BOOL)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  CNKParticipantScreenShareInfoViewInternal *v9;
  Swift::String v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  ParticipantScreenShareInfoView.configure(with:isFullScreenMode:)(v10, a4);

  swift_bridgeObjectRelease();
}

- (CNKParticipantScreenShareInfoViewInternal)initWithFrame:(CGRect)a3
{
  ParticipantScreenShareInfoView.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CNKParticipantScreenShareInfoViewInternal_nameLabel));
  OUTLINED_FUNCTION_31(OBJC_IVAR___CNKParticipantScreenShareInfoViewInternal_stackView);
  OUTLINED_FUNCTION_31(OBJC_IVAR___CNKParticipantScreenShareInfoViewInternal_avatarImageView);
  OUTLINED_FUNCTION_31(OBJC_IVAR___CNKParticipantScreenShareInfoViewInternal_backgroundBlurView);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CNKParticipantScreenShareInfoViewInternal_avatarImage));
}

@end
