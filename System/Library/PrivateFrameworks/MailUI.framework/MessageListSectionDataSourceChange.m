@implementation MessageListSectionDataSourceChange

- (NSString)ef_publicDescription
{
  _TtC6MailUI34MessageListSectionDataSourceChange *v2;
  id v5;

  v2 = self;
  MessageListSectionDataSourceChange.ef_publicDescription.getter();

  v5 = (id)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (BOOL)isSkipped
{
  _TtC6MailUI34MessageListSectionDataSourceChange *v2;

  v2 = self;
  MessageListSectionDataSourceChange.isSkipped.getter();

  return sub_1D565EE08() & 1;
}

- (BOOL)isValid
{
  _TtC6MailUI34MessageListSectionDataSourceChange *v2;

  v2 = self;
  MessageListSectionDataSourceChange.isValid.getter();

  return sub_1D565EE08() & 1;
}

- (BOOL)isEmpty
{
  _TtC6MailUI34MessageListSectionDataSourceChange *v2;

  v2 = self;
  MessageListSectionDataSourceChange.isEmpty.getter();

  return sub_1D565EE08() & 1;
}

- (BOOL)failed
{
  _TtC6MailUI34MessageListSectionDataSourceChange *v2;

  v2 = self;
  MessageListSectionDataSourceChange.failed.getter();

  return sub_1D565EE08() & 1;
}

+ (id)withInitialCount:(int64_t)a3 validCount:(int64_t)a4 isFirstChange:(BOOL)a5
{
  char v7;

  swift_getObjCClassMetadata();
  v7 = sub_1D565EE14();
  swift_getObjCClassMetadata();
  return static MessageListSectionDataSourceChange.with(initialCount:validCount:isFirstChange:)(a3, (void *)a4, v7 & 1);
}

- (BOOL)isCleanSnapshot
{
  _TtC6MailUI34MessageListSectionDataSourceChange *v2;

  v2 = self;
  MessageListSectionDataSourceChange.isCleanSnapshot.getter();

  return sub_1D565EE08() & 1;
}

+ (id)cleanSnapshot
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  return static MessageListSectionDataSourceChange.cleanSnapshot()();
}

- (BOOL)isFirstChange
{
  _TtC6MailUI34MessageListSectionDataSourceChange *v2;

  v2 = self;
  MessageListSectionDataSourceChange.isFirstChange.getter();

  return sub_1D565EE08() & 1;
}

+ (id)skipped
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  return static MessageListSectionDataSourceChange.skipped()();
}

+ (id)stale
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  return static MessageListSectionDataSourceChange.stale()();
}

+ (id)withCount:(int64_t)a3
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  return static MessageListSectionDataSourceChange.with(count:)((void *)a3);
}

+ (id)withCount:(int64_t)a3 isFirstChange:(BOOL)a4
{
  char v5;

  swift_getObjCClassMetadata();
  v5 = sub_1D565EE14();
  swift_getObjCClassMetadata();
  return static MessageListSectionDataSourceChange.with(count:isFirstChange:)((void *)a3, v5 & 1);
}

+ (id)withInitialCount:(int64_t)a3 validCount:(int64_t)a4
{
  swift_getObjCClassMetadata();
  swift_getObjCClassMetadata();
  return static MessageListSectionDataSourceChange.with(initialCount:validCount:)(a3, (void *)a4);
}

+ (id)sectionRemovedWithSection:(id)a3
{
  id v3;
  id v6;

  swift_getObjCClassMetadata();
  v3 = a3;
  swift_getObjCClassMetadata();
  v6 = static MessageListSectionDataSourceChange.sectionRemoved(section:)(a3);

  return v6;
}

- (int64_t)count
{
  _TtC6MailUI34MessageListSectionDataSourceChange *v2;
  int64_t v5;

  v2 = self;
  v5 = MessageListSectionDataSourceChange.count.getter();

  return v5;
}

- (BOOL)isStale
{
  _TtC6MailUI34MessageListSectionDataSourceChange *v2;

  v2 = self;
  MessageListSectionDataSourceChange.isStale.getter();

  return sub_1D565EE08() & 1;
}

- (BOOL)isSectionRemoval
{
  _TtC6MailUI34MessageListSectionDataSourceChange *v2;

  v2 = self;
  MessageListSectionDataSourceChange.isSectionRemoval.getter();

  return sub_1D565EE08() & 1;
}

- (_TtC6MailUI34MessageListSectionDataSourceChange)init
{
  return (_TtC6MailUI34MessageListSectionDataSourceChange *)MessageListSectionDataSourceChange.init()();
}

- (void).cxx_destruct
{
  sub_1D55E46E8((uint64_t)self + OBJC_IVAR____TtC6MailUI34MessageListSectionDataSourceChange_change);
}

- (NSString)description
{
  _TtC6MailUI34MessageListSectionDataSourceChange *v2;
  id v5;

  v2 = self;
  MessageListSectionDataSourceChange.description.getter();

  v5 = (id)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (NSString)debugDescription
{
  _TtC6MailUI34MessageListSectionDataSourceChange *v2;
  id v5;

  v2 = self;
  MessageListSectionDataSourceChange.debugDescription.getter();

  v5 = (id)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

@end
