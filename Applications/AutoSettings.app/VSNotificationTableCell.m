@implementation VSNotificationTableCell

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  _TtC12AutoSettings23VSNotificationTableCell *v6;

  v6 = self;
  sub_100015440(a3, a4);

}

- (_TtC12AutoSettings23VSNotificationTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC12AutoSettings23VSNotificationTableCell *)sub_10001574C(a3, (uint64_t)a4, v6);
}

- (void).cxx_destruct
{

}

@end
