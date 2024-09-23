@implementation MessageUITipsManager

- (_TtC9MessageUI20MessageUITipsManager)initWith:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC9MessageUI20MessageUITipsManager *)MessageUITipsManager.init(with:)(a3);
}

- (void)controllerDidAppear
{
  _TtC9MessageUI20MessageUITipsManager *v2;

  v2 = self;
  sub_1ABA59470();

}

- (void)controllerDidDisappear
{
  _TtC9MessageUI20MessageUITipsManager *v2;

  v2 = self;
  sub_1ABA5A1F0();

}

+ (void)setShouldDisplayTo:(BOOL)a3
{
  swift_getObjCClassMetadata();
  sub_1ABA650E4();
  swift_getObjCClassMetadata();
  static MessageUITipsManager.setShouldDisplay(to:)();
}

+ (void)donateHasUsedAttachment
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static MessageUITipsManager.donateHasUsedAttachment()();
}

+ (void)donateHasSentEmailEvent
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  static MessageUITipsManager.donateHasSentEmailEvent()();
}

- (_TtC9MessageUI20MessageUITipsManager)init
{
  return (_TtC9MessageUI20MessageUITipsManager *)MessageUITipsManager.init()();
}

- (void).cxx_destruct
{
  sub_1ABA5BDB4();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

@end
