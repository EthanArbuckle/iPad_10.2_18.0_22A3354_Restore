@implementation MTClickEventHandler

- (id)knownFields
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[10];

  v10[9] = *MEMORY[0x24BDAC8D0];
  -[MTEventDataProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "knownFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MTClickEventHandler;
    -[MTImpressionableEventHandler knownFields](&v9, sel_knownFields);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = CFSTR("actionContext");
    v10[1] = CFSTR("actionDetails");
    v10[2] = CFSTR("actionType");
    v10[3] = CFSTR("actionUrl");
    v10[4] = CFSTR("location");
    v10[5] = CFSTR("targetId");
    v10[6] = CFSTR("targetType");
    v10[7] = CFSTR("positionX");
    v10[8] = CFSTR("positionY");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)eventType
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTClickEventHandler;
  -[MTEventHandler eventType](&v6, sel_eventType);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("click");
  v4 = v2;

  return v4;
}

- (id)eventVersion:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTClickEventHandler;
  -[MTEventHandler eventVersion:](&v7, sel_eventVersion_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_24C7B8328;
  v5 = v3;

  return v5;
}

@end
