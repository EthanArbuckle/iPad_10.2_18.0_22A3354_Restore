@implementation BlockBasedFocusGuide

- (_TtC12GameCenterUI20BlockBasedFocusGuide)initWithCoder:(id)a3
{
  sub_1AB4DA8B8();
}

- (BOOL)isEnabled
{
  _TtC12GameCenterUI20BlockBasedFocusGuide *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1AB4DA94C();

  return v3 & 1;
}

- (void)setEnabled:(BOOL)a3
{
  _TtC12GameCenterUI20BlockBasedFocusGuide *v4;

  v4 = self;
  sub_1AB4DAA04(a3);

}

- (_TtC12GameCenterUI20BlockBasedFocusGuide)init
{
  sub_1AB4DAA44();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
