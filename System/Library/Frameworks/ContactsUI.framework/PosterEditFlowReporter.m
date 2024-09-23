@implementation PosterEditFlowReporter

- (void)dealloc
{
  _TtC10ContactsUI22PosterEditFlowReporter *v2;
  objc_super v3;

  v2 = self;
  sub_18ACF973C();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for PosterEditFlowReporter();
  -[PosterEditFlowReporter dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC10ContactsUI22PosterEditFlowReporter_logger;
  v4 = sub_18AF4E900();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC10ContactsUI22PosterEditFlowReporter_startTime;
  v6 = sub_18AF5028C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (void)startingFromSNAPWithMeCard:(BOOL)a3
{
  _TtC10ContactsUI22PosterEditFlowReporter *v4;

  v4 = self;
  sub_18ACF8490(a3);

}

- (void)startingFromContactsWithMeCard:(BOOL)a3 isEditing:(BOOL)a4
{
  _TtC10ContactsUI22PosterEditFlowReporter *v6;

  v6 = self;
  sub_18ACF85F0(a3, a4);

}

- (void)startingFromOnboardingWithMeCard:(BOOL)a3
{
  _TtC10ContactsUI22PosterEditFlowReporter *v4;

  v4 = self;
  sub_18ACF8824(a3);

}

- (void)willEditCreatingNew
{
  _TtC10ContactsUI22PosterEditFlowReporter *v2;

  v2 = self;
  sub_18ACF8990();

}

- (void)willEditAvatar
{
  _TtC10ContactsUI22PosterEditFlowReporter *v2;

  v2 = self;
  sub_18ACF89D8();

}

- (void)willEditPoster
{
  _TtC10ContactsUI22PosterEditFlowReporter *v2;

  v2 = self;
  sub_18ACF8B1C();

}

- (void)didModifyAvatar
{
  _TtC10ContactsUI22PosterEditFlowReporter *v2;

  v2 = self;
  sub_18ACF8B64();

}

- (void)didModifyPoster
{
  _TtC10ContactsUI22PosterEditFlowReporter *v2;

  v2 = self;
  sub_18ACF8BAC();

}

- (void)didSkipAvatar
{
  _TtC10ContactsUI22PosterEditFlowReporter *v2;

  v2 = self;
  sub_18ACF8D0C();

}

- (void)didSkipPoster
{
  _TtC10ContactsUI22PosterEditFlowReporter *v2;

  v2 = self;
  sub_18ACF8D54();

}

- (void)didCancelFromCarousel
{
  _TtC10ContactsUI22PosterEditFlowReporter *v2;

  v2 = self;
  sub_18ACF8EB4();

}

- (void)didCancelFromOnboardingWelcome
{
  _TtC10ContactsUI22PosterEditFlowReporter *v2;

  v2 = self;
  sub_18ACF9010();

}

- (void)didCancelFromOnboardingNew
{
  _TtC10ContactsUI22PosterEditFlowReporter *v2;

  v2 = self;
  sub_18ACF9168();

}

- (void)didCancelFromAvatarEditor
{
  _TtC10ContactsUI22PosterEditFlowReporter *v2;

  v2 = self;
  sub_18ACF92C4();

}

- (void)didCancelFromPosterEditor
{
  _TtC10ContactsUI22PosterEditFlowReporter *v2;

  v2 = self;
  sub_18ACF9458();

}

- (void)didDelete
{
  _TtC10ContactsUI22PosterEditFlowReporter *v2;

  v2 = self;
  sub_18ACF95EC();

}

- (void)didFinish
{
  _TtC10ContactsUI22PosterEditFlowReporter *v2;

  v2 = self;
  sub_18ACF973C();

}

- (_TtC10ContactsUI22PosterEditFlowReporter)init
{
  return (_TtC10ContactsUI22PosterEditFlowReporter *)PosterEditFlowReporter.init()();
}

@end
