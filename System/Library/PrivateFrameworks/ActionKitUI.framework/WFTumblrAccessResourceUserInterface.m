@implementation WFTumblrAccessResourceUserInterface

- (void)authorizeWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  WFTumblrAccessResourceUserInterface *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_21EB83AE8((uint64_t)sub_21EB6A494, v5);

  swift_release();
}

- (WFTumblrAccessResourceUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (WFTumblrAccessResourceUserInterface *)sub_21EB83F8C(v5, a4);
}

@end
