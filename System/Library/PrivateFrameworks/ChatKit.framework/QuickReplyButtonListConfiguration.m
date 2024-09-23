@implementation QuickReplyButtonListConfiguration

- (NSNumber)rowIndex
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit33QuickReplyButtonListConfiguration_rowIndex);
  swift_beginAccess();
  return (NSNumber *)*v2;
}

- (void)setRowIndex:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit33QuickReplyButtonListConfiguration_rowIndex);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC7ChatKit33QuickReplyButtonListConfiguration)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit33QuickReplyButtonListConfiguration_rowIndex) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for QuickReplyButtonListConfiguration();
  return -[QuickReplyButtonListConfiguration init](&v3, sel_init);
}

- (void).cxx_destruct
{

}

@end
