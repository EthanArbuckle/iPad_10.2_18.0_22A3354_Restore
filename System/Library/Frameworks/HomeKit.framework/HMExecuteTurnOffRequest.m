@implementation HMExecuteTurnOffRequest

+ (id)executeRequestWithActionSet:(id)a3
{
  id v3;
  HMExecuteTurnOffRequest *v4;

  v3 = a3;
  v4 = -[HMExecuteRequest initWithActionSet:]([HMExecuteTurnOffRequest alloc], "initWithActionSet:", v3);

  return v4;
}

@end
