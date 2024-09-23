@implementation IMDFileEventBroadcaster

+ (id)sharedInstance
{
  if (qword_1ED935630 != -1)
    swift_once();
  return (id)qword_1ED935620;
}

- (void)observeChangesInPath:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  IMDFileEventBroadcaster *v7;
  Swift::String v8;

  v4 = sub_1D166DACC();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  IMDFileEventBroadcaster.observeChanges(in:)(v8);

  swift_bridgeObjectRelease();
}

- (void)stopObserving
{
  IMDFileEventBroadcaster *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDFileEventBroadcaster_fileEventStream))
  {
    v2 = self;
    swift_retain();
    FileEventStream.stop()();

    swift_release();
  }
}

- (IMDFileEventBroadcaster)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDFileEventBroadcaster_fileEventStream) = 0;
  v3.receiver = self;
  v3.super_class = (Class)IMDFileEventBroadcaster;
  return -[IMDFileEventBroadcaster init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
