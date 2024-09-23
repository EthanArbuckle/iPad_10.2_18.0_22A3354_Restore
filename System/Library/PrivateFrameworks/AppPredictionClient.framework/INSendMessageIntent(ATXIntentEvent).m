@implementation INSendMessageIntent(ATXIntentEvent)

- (void)atx_getArgsInto:()ATXIntentEvent
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  joinedDisplayNames(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArg1:", v6);

  objc_msgSend(a1, "serviceName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArg2:", v7);

}

@end
