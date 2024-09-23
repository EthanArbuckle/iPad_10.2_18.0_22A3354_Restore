@implementation TSFeedViewContext

- (NSNumber)presentationReason
{
  return (NSNumber *)sub_1D69BF0B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_presentationReason);
}

- (void)setPresentationReason:(id)a3
{
  sub_1D69BF14C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___TSFeedViewContext_presentationReason);
}

- (NSNumber)feedPickerSection
{
  return (NSNumber *)sub_1D69BF0B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_feedPickerSection);
}

- (void)setFeedPickerSection:(id)a3
{
  sub_1D69BF14C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___TSFeedViewContext_feedPickerSection);
}

- (NSNumber)feedPickerType
{
  return (NSNumber *)sub_1D69BF0B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_feedPickerType);
}

- (void)setFeedPickerType:(id)a3
{
  sub_1D69BF14C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___TSFeedViewContext_feedPickerType);
}

- (NSNumber)displayRank
{
  return (NSNumber *)sub_1D69BF0B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_displayRank);
}

- (void)setDisplayRank:(id)a3
{
  sub_1D69BF14C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___TSFeedViewContext_displayRank);
}

- (NSNumber)externalAnalyticsFeedReferrer
{
  return (NSNumber *)sub_1D69BF0B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_externalAnalyticsFeedReferrer);
}

- (void)setExternalAnalyticsFeedReferrer:(id)a3
{
  sub_1D69BF14C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___TSFeedViewContext_externalAnalyticsFeedReferrer);
}

- (NSString)previousArticleID
{
  return (NSString *)sub_1D64D9034((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_previousArticleID);
}

- (void)setPreviousArticleID:(id)a3
{
  sub_1D64D90C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_previousArticleID);
}

- (NSNumber)previousArticleVersion
{
  return (NSNumber *)sub_1D69BF0B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_previousArticleVersion);
}

- (void)setPreviousArticleVersion:(id)a3
{
  sub_1D69BF14C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___TSFeedViewContext_previousArticleVersion);
}

- (BOOL)showSubscribedAlert
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___TSFeedViewContext_showSubscribedAlert;
  swift_beginAccess();
  return *v2;
}

- (void)setShowSubscribedAlert:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___TSFeedViewContext_showSubscribedAlert;
  swift_beginAccess();
  *v4 = a3;
}

- (TSAnalyticsReferral)referral
{
  return (TSAnalyticsReferral *)sub_1D69BF0B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_referral);
}

- (void)setReferral:(id)a3
{
  sub_1D69BF14C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___TSFeedViewContext_referral);
}

- (NSURL)sourceURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  sub_1D5F53614();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___TSFeedViewContext_sourceURL;
  swift_beginAccess();
  sub_1D5FCC8F4((uint64_t)v6, (uint64_t)v5);
  v7 = sub_1D6E15BE4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1D6E15B30();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (void)setSourceURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  TSFeedViewContext *v11;
  uint64_t v12;

  sub_1D5F53614();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1D6E15B78();
    v8 = sub_1D6E15BE4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1D6E15BE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR___TSFeedViewContext_sourceURL;
  swift_beginAccess();
  v11 = self;
  sub_1D64D9610((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();

}

- (NSString)title
{
  return (NSString *)sub_1D64D9034((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_title);
}

- (void)setTitle:(id)a3
{
  sub_1D64D90C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_title);
}

- (NSString)tagName
{
  return (NSString *)sub_1D64D9034((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_tagName);
}

- (void)setTagName:(id)a3
{
  sub_1D64D90C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_tagName);
}

- (NSString)sourceApplication
{
  return (NSString *)sub_1D64D9034((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_sourceApplication);
}

- (void)setSourceApplication:(id)a3
{
  sub_1D64D90C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_sourceApplication);
}

- (NSString)userActivityType
{
  return (NSString *)sub_1D64D9034((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_userActivityType);
}

- (void)setUserActivityType:(id)a3
{
  sub_1D64D90C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_userActivityType);
}

- (NSString)sourceSearchText
{
  return (NSString *)sub_1D64D9034((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_sourceSearchText);
}

- (void)setSourceSearchText:(id)a3
{
  sub_1D64D90C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_sourceSearchText);
}

- (NSString)adPreviewID
{
  return (NSString *)sub_1D64D9034((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_adPreviewID);
}

- (void)setAdPreviewID:(id)a3
{
  sub_1D64D90C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_adPreviewID);
}

- (NSString)adPreviewSessionID
{
  return (NSString *)sub_1D64D9034((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_adPreviewSessionID);
}

- (void)setAdPreviewSessionID:(id)a3
{
  sub_1D64D90C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_adPreviewSessionID);
}

- (NSString)adQToken
{
  return (NSString *)sub_1D64D9034((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_adQToken);
}

- (void)setAdQToken:(id)a3
{
  sub_1D64D90C0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_adQToken);
}

- (NSNumber)maximumAdRequestsForCurrentAdPreviewID
{
  return (NSNumber *)sub_1D69BF0B0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_maximumAdRequestsForCurrentAdPreviewID);
}

- (void)setMaximumAdRequestsForCurrentAdPreviewID:(id)a3
{
  sub_1D69BF14C((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___TSFeedViewContext_maximumAdRequestsForCurrentAdPreviewID);
}

- (void)setWithPresentationReason:(int)a3
{
  sub_1D69BF300(self, (uint64_t)a2, *(uint64_t *)&a3, &OBJC_IVAR___TSFeedViewContext_presentationReason);
}

- (void)setWithFeedPickerSection:(int)a3
{
  sub_1D69BF300(self, (uint64_t)a2, *(uint64_t *)&a3, &OBJC_IVAR___TSFeedViewContext_feedPickerSection);
}

- (void)setWithFeedPickerType:(int)a3
{
  sub_1D69BF300(self, (uint64_t)a2, *(uint64_t *)&a3, &OBJC_IVAR___TSFeedViewContext_feedPickerType);
}

- (void)setWithSourceURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  TSFeedViewContext *v12;
  uint64_t v13;

  sub_1D5F53614();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D6E15BE4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D6E15B78();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  v11 = (char *)self + OBJC_IVAR___TSFeedViewContext_sourceURL;
  swift_beginAccess();
  v12 = self;
  sub_1D64D9610((uint64_t)v6, (uint64_t)v11);
  swift_endAccess();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)setWithSourceApplication:(id)a3
{
  sub_1D64D8EFC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_sourceApplication);
}

- (void)setWithUserActivityType:(id)a3
{
  sub_1D64D8EFC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_userActivityType);
}

- (void)setWithSourceSearchText:(id)a3
{
  sub_1D64D8EFC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_sourceSearchText);
}

- (void)setWithAdPreviewID:(id)a3
{
  sub_1D64D8EFC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_adPreviewID);
}

- (void)setWithAdPreviewSessionID:(id)a3
{
  sub_1D64D8EFC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_adPreviewSessionID);
}

- (void)setWithAdQToken:(id)a3
{
  sub_1D64D8EFC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_adQToken);
}

- (void)setWithMaximumAdRequestsForCurrentAdPreviewID:(int64_t)a3
{
  sub_1D69BF8C0(self, (uint64_t)a2, a3, &OBJC_IVAR___TSFeedViewContext_maximumAdRequestsForCurrentAdPreviewID);
}

- (void)setWithDisplayRank:(int64_t)a3
{
  sub_1D69BF8C0(self, (uint64_t)a2, a3, &OBJC_IVAR___TSFeedViewContext_displayRank);
}

- (void)setWithExternalAnalyticsFeedReferrer:(int64_t)a3
{
  sub_1D69BF8C0(self, (uint64_t)a2, a3, &OBJC_IVAR___TSFeedViewContext_externalAnalyticsFeedReferrer);
}

- (void)setWithReferral:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___TSFeedViewContext_referral);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)setWithPreviousArticleID:(id)a3
{
  sub_1D64D8EFC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TSFeedViewContext_previousArticleID);
}

- (void)setWithPreviousArticleVersion:(int64_t)a3
{
  sub_1D69BF8C0(self, (uint64_t)a2, a3, &OBJC_IVAR___TSFeedViewContext_previousArticleVersion);
}

- (void)setFeedTagType:(unint64_t)a3
{
  char *v4;

  v4 = (char *)self + OBJC_IVAR___TSFeedViewContext_feedTagType;
  swift_beginAccess();
  *(_QWORD *)v4 = a3;
  v4[8] = 0;
}

- (TSFeedViewContext)init
{
  return (TSFeedViewContext *)FeedViewContext.init()();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  sub_1D60178E0((uint64_t)self + OBJC_IVAR___TSFeedViewContext_sourceURL);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
