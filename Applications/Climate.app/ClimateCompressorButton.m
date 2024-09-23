@implementation ClimateCompressorButton

- (void)cabinService:(id)a3 didUpdateCompressorOn:(BOOL)a4
{
  id v5;
  _TtC7Climate23ClimateCompressorButton *v6;

  v5 = a3;
  v6 = self;
  sub_10007813C();
  -[ClimateCompressorButton setEnabled:](v6, "setEnabled:", (unint64_t)sub_100004250() < 8);
  sub_100066A90();
  sub_100066C24();

}

@end
