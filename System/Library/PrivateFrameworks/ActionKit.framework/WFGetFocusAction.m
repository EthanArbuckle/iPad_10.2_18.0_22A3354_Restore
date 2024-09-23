@implementation WFGetFocusAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  WFFocusMode *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BEC3D40], "activeMode", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isPlaceholder"))
  {
    -[WFGetFocusAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }
  else
  {
    objc_msgSend(v8, "activityIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v5 = -[WFFocusMode initWithFCActivityDescribing:]([WFFocusMode alloc], "initWithFCActivityDescribing:", v8);
      +[WFContentItem itemWithObject:](WFFocusModeContentItem, "itemWithObject:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        -[WFGetFocusAction output](self, "output");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addItem:", v6);

      }
      -[WFGetFocusAction finishRunningWithError:](self, "finishRunningWithError:", 0);

    }
    else
    {
      -[WFGetFocusAction finishRunningWithError:](self, "finishRunningWithError:", 0);
    }

  }
}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

@end
