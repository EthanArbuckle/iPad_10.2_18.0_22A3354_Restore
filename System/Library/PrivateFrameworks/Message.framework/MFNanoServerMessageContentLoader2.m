@implementation MFNanoServerMessageContentLoader2

- (void).cxx_destruct
{
  swift_getObjectType();
  sub_1A5139FD8();
  sub_1A5139FB0();
}

- (NSString)messageId
{
  MFNanoServerMessageContentLoader2 *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  MFNanoServerMessageContentLoader2.messageId.getter();

  v6 = (id)sub_1A594B3F4();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (BOOL)highPriority
{
  MFNanoServerMessageContentLoader2 *v3;

  swift_getObjectType();
  v3 = self;
  MFNanoServerMessageContentLoader2.highPriority.getter();

  return sub_1A594A2B4() & 1;
}

- (void)setHighPriority:(BOOL)a3
{
  MFNanoServerMessageContentLoader2 *v4;
  char v5;

  swift_getObjectType();
  v4 = self;
  v5 = sub_1A594A2C0();
  MFNanoServerMessageContentLoader2.highPriority.setter(v5 & 1);

}

- (MFNanoServerMessageContentLoader2)initWithMessageId:(id)a3 highPriority:(BOOL)a4 mailMessageLibrary:(id)a5 maximumImageWidth:(double)a6 workQueue:(id)a7 delegate:(id)a8
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  char v12;
  uint64_t v14;
  uint64_t v19;
  char *v21;

  swift_getObjectType();
  v8 = a3;
  v9 = a5;
  v10 = a7;
  swift_unknownObjectRetain();
  v19 = sub_1A594B40C();
  v14 = v11;
  v12 = sub_1A594A2C0();
  v21 = sub_1A535DE54(v19, v14, v12 & 1, a5, a7, (uint64_t)a8, a6);

  return (MFNanoServerMessageContentLoader2 *)v21;
}

- (void)start
{
  MFNanoServerMessageContentLoader2 *v3;

  swift_getObjectType();
  v3 = self;
  MFNanoServerMessageContentLoader2.start()();

}

- (void)cancel
{
  MFNanoServerMessageContentLoader2 *v3;

  swift_getObjectType();
  v3 = self;
  MFNanoServerMessageContentLoader2.cancel()();

}

- (MFNanoServerMessageContentLoader2)init
{
  swift_getObjectType();
  return (MFNanoServerMessageContentLoader2 *)MFNanoServerMessageContentLoader2.init()();
}

@end
