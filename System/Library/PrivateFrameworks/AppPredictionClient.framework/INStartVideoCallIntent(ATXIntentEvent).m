@implementation INStartVideoCallIntent(ATXIntentEvent)

- (void)atx_getArgsInto:()ATXIntentEvent
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "contacts");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  joinedDisplayNames(v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArg1:", v5);

}

@end
