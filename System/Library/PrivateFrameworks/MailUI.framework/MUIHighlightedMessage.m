@implementation MUIHighlightedMessage

- (void).cxx_destruct
{
  swift_getObjectType();

  swift_unknownObjectRelease();
  sub_1D5530388();
}

- (NSAttributedString)topLine
{
  MUIHighlightedMessage *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  v6 = sub_1D55E6A5C();

  return (NSAttributedString *)v6;
}

- (EMMessageListItem)messageListItem
{
  MUIHighlightedMessage *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  v6 = (id)sub_1D55E6AE8();

  return (EMMessageListItem *)v6;
}

- (NSString)sender
{
  MUIHighlightedMessage *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  sub_1D55E6B94();

  v6 = (id)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (void)setSender:(id)a3
{
  id v4;
  MUIHighlightedMessage *v5;
  uint64_t v6;
  uint64_t v7;

  swift_getObjectType();
  v4 = a3;
  v5 = self;
  v6 = sub_1D565FE10();
  sub_1D55E6D20(v6, v7);

}

- (MUIHighlightedMessage)initWithTopLine:(id)a3 messageListItem:(id)a4
{
  id v4;

  swift_getObjectType();
  v4 = a3;
  swift_unknownObjectRetain();
  return (MUIHighlightedMessage *)sub_1D55E7700(a3, (uint64_t)a4);
}

- (int64_t)hash
{
  MUIHighlightedMessage *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  v6 = MUIHighlightedMessage.hash.getter();

  return (int64_t)v6;
}

- (NSString)description
{
  MUIHighlightedMessage *v3;
  id v6;

  swift_getObjectType();
  v3 = self;
  MUIHighlightedMessage.description.getter();

  v6 = (id)sub_1D565FDF8();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (MUIHighlightedMessage)init
{
  swift_getObjectType();
  return (MUIHighlightedMessage *)MUIHighlightedMessage.init()();
}

@end
