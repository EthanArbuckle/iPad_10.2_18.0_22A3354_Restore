@implementation ClimateMaxACButton

- (void)cabinService:(id)a3 didUpdateMaxACOn:(BOOL)a4
{
  id v5;
  _TtC7Climate18ClimateMaxACButton *v6;

  v5 = a3;
  v6 = self;
  sub_10007813C();
  -[ClimateMaxACButton setEnabled:](v6, "setEnabled:", (unint64_t)sub_10005E2B0() < 8);
  sub_100066A90();
  sub_100066C24();

}

@end
