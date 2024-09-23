@implementation WFEvernoteAccessResourceUserInterface

- (void)authorizeWithCompletionHandler:(id)a3
{
  void *v4;
  WFEvernoteAccessResourceUserInterface *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_21EB6F67C(v5, (void (**)(_QWORD, _QWORD, _QWORD))v4);
  _Block_release(v4);

}

- (WFEvernoteAccessResourceUserInterface)initWithUserInterfaceType:(id)a3 attribution:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (WFEvernoteAccessResourceUserInterface *)sub_21EB6FB5C(v5, a4);
}

@end
