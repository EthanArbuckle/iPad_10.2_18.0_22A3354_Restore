@implementation DetailsViewConfiguration

- (void)toggleSharingStateFromABCard
{
  _TtC7ChatKit24DetailsViewConfiguration *v2;

  v2 = self;
  sub_18E56C080();

}

- (void)batchDownloadNotificationFired:(id)a3
{
  id v4;
  _TtC7ChatKit24DetailsViewConfiguration *v5;

  v4 = a3;
  v5 = self;
  sub_18E5A4C08();

}

- (void)contactsManagerViewModelsDidChange:(id)a3
{
  id v4;
  _TtC7ChatKit24DetailsViewConfiguration *v5;

  v4 = a3;
  v5 = self;
  sub_18E5F8B64(v4);

}

- (void)handleKeyTransparencyStatusChanged:(id)a3
{
  id v4;
  _TtC7ChatKit24DetailsViewConfiguration *v5;

  v4 = a3;
  v5 = self;
  sub_18E668484();

}

- (void)chatAutoDonatingHandleUpdateNotification:(id)a3
{
  id v4;
  _TtC7ChatKit24DetailsViewConfiguration *v5;

  v4 = a3;
  v5 = self;
  sub_18E6E335C(v4);

}

- (void)conversationJoinStateChanged:(id)a3
{
  id v5;
  _TtC7ChatKit24DetailsViewConfiguration *v6;

  swift_getKeyPath();
  sub_18E5F8FAC();
  v5 = a3;
  v6 = self;
  sub_18E766458();

  swift_release();
}

- (void)conversationParticipantsChanged:(id)a3
{
  id v5;
  _TtC7ChatKit24DetailsViewConfiguration *v6;

  swift_getKeyPath();
  sub_18E5F8FAC();
  v5 = a3;
  v6 = self;
  sub_18E766458();

  swift_release();
}

- (void)accountDefaultsChanged:(id)a3
{
  id v5;
  _TtC7ChatKit24DetailsViewConfiguration *v6;

  swift_getKeyPath();
  sub_18E5F8FAC();
  v5 = a3;
  v6 = self;
  sub_18E766458();

  swift_release();
}

- (void)serviceForSendingChanged:(id)a3
{
  id v5;
  _TtC7ChatKit24DetailsViewConfiguration *v6;

  swift_getKeyPath();
  sub_18E5F8FAC();
  v5 = a3;
  v6 = self;
  sub_18E766458();

  swift_release();
}

- (_TtC7ChatKit24DetailsViewConfiguration)init
{
  _TtC7ChatKit24DetailsViewConfiguration *result;

  result = (_TtC7ChatKit24DetailsViewConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__delegate);
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__alertPresenter);
  sub_18E522F74((uint64_t)self + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__presentingViewController);
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__suggestionsEnabledContactsStore));
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__supportsSharingFocusStatus));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration__isSharingFocusStatus));
  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit24DetailsViewConfiguration___observationRegistrar;
  v4 = sub_18E766494();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
