@implementation QuickReplyContent

- (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit17QuickReplyContent_size);
  v3 = *(double *)&self->size[OBJC_IVAR____TtC7ChatKit17QuickReplyContent_size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSArray)rows
{
  void *v2;

  sub_18E7669BC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0F4FF0);
  v2 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSArray)rowHeights
{
  void *v2;

  sub_18E7669BC();
  v2 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSDictionary)indicesForReply
{
  void *v2;

  sub_18E7669BC();
  v2 = (void *)sub_18E768864();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (int64_t)numReplies
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit17QuickReplyContent_numReplies);
}

- (double)transcriptHeight
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit17QuickReplyContent_transcriptHeight);
}

- (NSString)debugDescription
{
  _TtC7ChatKit17QuickReplyContent *v2;
  void *v3;

  v2 = self;
  sub_18E541F18();

  v3 = (void *)sub_18E768954();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC7ChatKit17QuickReplyContent)initWithReplies:(id)a3 maxWidth:(double)a4 transcriptHeight:(double)a5
{
  uint64_t v7;

  v7 = sub_18E768AE0();
  return (_TtC7ChatKit17QuickReplyContent *)QuickReplyContent.init(replies:maxWidth:transcriptHeight:)(v7, a4, a5);
}

- (int64_t)indexForReply:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC7ChatKit17QuickReplyContent *v7;
  int64_t v8;

  if (a3)
  {
    v4 = sub_18E768984();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8 = sub_18E542B0C(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (NSArray)strings
{
  _TtC7ChatKit17QuickReplyContent *v2;
  void *v3;

  v2 = self;
  sub_18E542C48();

  v3 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC7ChatKit17QuickReplyContent *v4;
  _TtC7ChatKit17QuickReplyContent *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_18E769194();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_18E542CD0((uint64_t)v8);

  sub_18E00FA98((uint64_t)v8, qword_1EE0FB3F0);
  return v6 & 1;
}

- (_TtC7ChatKit17QuickReplyContent)init
{
  _TtC7ChatKit17QuickReplyContent *result;

  result = (_TtC7ChatKit17QuickReplyContent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
