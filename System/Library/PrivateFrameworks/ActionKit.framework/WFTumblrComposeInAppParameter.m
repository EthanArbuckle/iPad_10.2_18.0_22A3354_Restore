@implementation WFTumblrComposeInAppParameter

- (id)defaultSerializedRepresentation
{
  return (id)objc_msgSend(MEMORY[0x24BEC3B18], "serializedRepresentationFromNumber:", MEMORY[0x24BDBD1C0]);
}

- (void)wasAddedToWorkflow
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5.receiver = self;
  v5.super_class = (Class)WFTumblrComposeInAppParameter;
  -[WFTumblrComposeInAppParameter wasAddedToWorkflow](&v5, sel_wasAddedToWorkflow);
  objc_msgSend(MEMORY[0x24BEC39F0], "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("com.tumblr.tumblr");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addInstallStatusObserver:forAppIdentifiers:", self, v4);

}

- (void)wasRemovedFromWorkflow
{
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5.receiver = self;
  v5.super_class = (Class)WFTumblrComposeInAppParameter;
  -[WFTumblrComposeInAppParameter wasRemovedFromWorkflow](&v5, sel_wasRemovedFromWorkflow);
  objc_msgSend(MEMORY[0x24BEC39F0], "sharedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = CFSTR("com.tumblr.tumblr");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeInstallStatusObserver:forAppIdentifiers:", self, v4);

}

- (BOOL)isHidden
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BEC39F0], "sharedRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appWithIdentifier:", CFSTR("com.tumblr.tumblr"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInstalled") ^ 1;

  return v4;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFTumblrComposeInAppParameter;
  if (!-[WFTumblrComposeInAppParameter parameterStateIsValid:](&v9, sel_parameterStateIsValid_, v4))
    goto LABEL_4;
  objc_msgSend(v4, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "BOOLValue"))
  {

    goto LABEL_6;
  }
  v6 = -[WFTumblrComposeInAppParameter isHidden](self, "isHidden");

  if (!v6)
  {
LABEL_6:
    v7 = 1;
    goto LABEL_7;
  }
LABEL_4:
  v7 = 0;
LABEL_7:

  return v7;
}

- (void)appRegistry:(id)a3 installStatusChangedForApp:(id)a4
{
  -[WFTumblrComposeInAppParameter attributesDidChange](self, "attributesDidChange", a3, a4);
  -[WFTumblrComposeInAppParameter stateValidityCriteriaDidChange](self, "stateValidityCriteriaDidChange");
}

@end
