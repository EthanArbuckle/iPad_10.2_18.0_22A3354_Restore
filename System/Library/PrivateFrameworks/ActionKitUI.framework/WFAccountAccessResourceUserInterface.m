@implementation WFAccountAccessResourceUserInterface

- (void)authorizeWithAccountClassName:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  WFAccountAccessResourceUserInterface *v9;

  v5 = _Block_copy(a4);
  v6 = sub_21EBB7B60();
  v8 = v7;
  _Block_copy(v5);
  v9 = self;
  sub_21EB6ACD0(v6, v8, v9, (void (**)(_QWORD, _QWORD, _QWORD))v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (WFAccountAccessResourceUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (WFAccountAccessResourceUserInterface *)sub_21EB6C228(v5, a4);
}

@end
