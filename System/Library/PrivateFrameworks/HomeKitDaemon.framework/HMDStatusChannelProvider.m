@implementation HMDStatusChannelProvider

- (id)createStatusChannelWithPrefix:(id)a3 identifier:(id)a4 queue:(id)a5
{
  id v7;
  id v8;
  id v9;
  HMDStatusChannel *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[HMDStatusChannel initWithChannelPrefix:identifier:queue:]([HMDStatusChannel alloc], "initWithChannelPrefix:identifier:queue:", v9, v8, v7);

  return v10;
}

@end
