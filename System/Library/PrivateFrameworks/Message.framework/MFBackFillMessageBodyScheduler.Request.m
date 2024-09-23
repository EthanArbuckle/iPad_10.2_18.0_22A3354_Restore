@implementation MFBackFillMessageBodyScheduler.Request

- (unsigned)backFillID
{
  _TtCE7MessageCSo30MFBackFillMessageBodyScheduler7Request *v2;
  unsigned __int16 v5;

  v2 = self;
  v5 = sub_1A514C1CC();

  return v5;
}

- (BOOL)shouldDefer
{
  _TtCE7MessageCSo30MFBackFillMessageBodyScheduler7Request *v2;

  v2 = self;
  sub_1A514C244();

  return sub_1A594A2B4() & 1;
}

- (void)dealloc
{
  _TtCE7MessageCSo30MFBackFillMessageBodyScheduler7Request *v2;

  v2 = self;
  sub_1A514C370();
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  sub_1A5139FB0();
}

- (NSString)description
{
  _TtCE7MessageCSo30MFBackFillMessageBodyScheduler7Request *v2;
  id v5;

  v2 = self;
  sub_1A514E2D8();

  v5 = (id)sub_1A594B3F4();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)completeWithStatus:(int)a3
{
  _TtCE7MessageCSo30MFBackFillMessageBodyScheduler7Request *v3;

  v3 = self;
  sub_1A514E4BC(a3);

}

- (_TtCE7MessageCSo30MFBackFillMessageBodyScheduler7Request)init
{
  return (_TtCE7MessageCSo30MFBackFillMessageBodyScheduler7Request *)sub_1A514E88C();
}

@end
