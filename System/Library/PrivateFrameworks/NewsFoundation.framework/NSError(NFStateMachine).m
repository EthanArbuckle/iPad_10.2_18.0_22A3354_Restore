@implementation NSError(NFStateMachine)

+ (id)fc_createStateMachineErrorForCode:()NFStateMachine userInfo:
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x24BDD1540];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithDomain:code:userInfo:", CFSTR("com.apple.news.state.machine"), a3, v6);

  return v7;
}

- (BOOL)fc_isStateMachineError:()NFStateMachine
{
  void *v5;
  int v6;

  objc_msgSend(a1, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.news.state.machine"));

  return v6 && objc_msgSend(a1, "code") == a3;
}

@end
