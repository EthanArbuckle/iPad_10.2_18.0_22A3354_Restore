@implementation FISentinelNode

- (_TtC26DocumentManagerExecutables14FISentinelNode)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FISentinelNode();
  return -[FICustomNode init](&v3, sel_init);
}

- (id)identifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  return (id)sub_21EB0350C();
}

- (NSString)displayName
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21EB02B58();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (FPItem)fpItem
{
  return (FPItem *)0;
}

- (UTType)contentType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_21EB025DC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s26DocumentManagerExecutables14FISentinelNodeC11contentType07UniformG11Identifiers6UTTypeVvg_0();
  v6 = (void *)sub_21EB024E0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (UTType *)v6;
}

- (NSString)typeIdentifier
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC26DocumentManagerExecutables14FISentinelNode *v7;
  UTType *v8;
  void *v9;
  uint64_t v11;

  v3 = sub_21EB025DC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v8 = -[FISentinelNode contentType](v7, sel_contentType);
  sub_21EB024F8();

  sub_21EB0248C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  v9 = (void *)sub_21EB02B58();
  swift_bridgeObjectRelease();
  return (NSString *)v9;
}

- (NSNumber)fileSize
{
  return (NSNumber *)0;
}

- (NSNumber)childItemCount
{
  return (NSNumber *)0;
}

- (id)providerID
{
  id v2;
  void *v3;

  swift_beginAccess();
  v2 = a1;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_21EB02B58();

  swift_bridgeObjectRelease();
  return v3;
}

- (NSDate)modificationDate
{
  return (NSDate *)0;
}

- (NSDate)doc_lastUsedDate
{
  return (NSDate *)0;
}

- (BOOL)isFolder
{
  return 0;
}

- (NSString)filename
{
  return (NSString *)(id)sub_21EB02B58();
}

- (NSURL)fileURL
{
  return (NSURL *)0;
}

- (_TtC26DocumentManagerExecutables14FISentinelNode)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FISentinelNode();
  return -[FISentinelNode initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
