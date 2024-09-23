@implementation GKMultiplayerParticipantCollectionViewCell

+ (NSString)reuseIdentifier
{
  void *v2;

  static GKMultiplayerParticipantCollectionViewCell.reuseIdentifier.getter();
  v2 = (void *)sub_1AB7DAF60();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)sharePlayEnabled
{
  return GKMultiplayerParticipantCollectionViewCell.sharePlayEnabled.getter() & 1;
}

- (void)setSharePlayEnabled:(BOOL)a3
{
  _TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell *v4;

  v4 = self;
  GKMultiplayerParticipantCollectionViewCell.sharePlayEnabled.setter(a3);

}

- (_TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell *)sub_1AB46971C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB46A170();
}

- (id)tapHandler
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[6];

  v2 = GKMultiplayerParticipantCollectionViewCell.tapHandler.getter();
  if (!v2)
    return 0;
  v6[4] = v2;
  v6[5] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 1107296256;
  v6[2] = sub_1AB46A8B4;
  v6[3] = &block_descriptor;
  v4 = _Block_copy(v6);
  swift_release();
  return v4;
}

- (void)setTapHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell *v6;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1AB46D734;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  GKMultiplayerParticipantCollectionViewCell.tapHandler.setter((uint64_t)v4, v5);

}

- (BOOL)removeButtonHidden
{
  _TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = GKMultiplayerParticipantCollectionViewCell.removeButtonHidden.getter();

  return v3 & 1;
}

- (void)setRemoveButtonHidden:(BOOL)a3
{
  _TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell *v4;

  v4 = self;
  GKMultiplayerParticipantCollectionViewCell.removeButtonHidden.setter(a3);

}

- (void)applyWithParticipant:(id)a3 number:(int64_t)a4 isRemovingEnabled:(BOOL)a5 isInvitingEnabled:(BOOL)a6 layoutMode:(int64_t)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  _TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell *v13;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = self;
  GKMultiplayerParticipantCollectionViewCell.apply(participant:number:isRemovingEnabled:isInvitingEnabled:layoutMode:)(v12, a4, v9, v8, (void *)a7);

}

- (void)layoutSubviews
{
  _TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell *v2;

  v2 = self;
  GKMultiplayerParticipantCollectionViewCell.layoutSubviews()();

}

- (void)prepareForReuse
{
  _TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell *v2;

  v2 = self;
  GKMultiplayerParticipantCollectionViewCell.prepareForReuse()();

}

- (void)didTapRemoveButton:(id)a3
{
  _TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell *v4;
  _TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AB7DB758();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1AB46BAB0();

  sub_1AB46D6B8((uint64_t)v6);
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityNameLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB46BDD8();
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AB46BE04();
}

- (_TtC12GameCenterUI23GKMultiplayerStatusView)accessibilityStatusAccessoryView
{
  return (_TtC12GameCenterUI23GKMultiplayerStatusView *)sub_1AB46BE30();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_contentBackgroundView));
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_avatarView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_silhouetteView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_nameLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_subtitleLabel);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_removeButton);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_vibrantRemoveButton);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_focusGuide);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_messagesIconView);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_statusAccessoryView);
  sub_1AB46A9C4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_tapHandler));
  sub_1AB46B08C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_viewStatus), *(_QWORD *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_viewStatus), *((_BYTE *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell_viewStatus));
}

@end
