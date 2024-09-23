@implementation HRELightsAllOffContextActionTemplate

- (HRELightsAllOffContextActionTemplate)init
{
  HRELightsAllOffContextActionTemplate *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HRELightsAllOffContextActionTemplate;
  v2 = -[HRETemplate init](&v6, sel_init);
  if (v2)
  {
    HRELocalizedString(CFSTR("HREContextActionNameLightsAllOff"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HREContextActionTemplate setContextActionName:](v2, "setContextActionName:", v3);

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4D0B8]), "initWithSystemImageNamed:", CFSTR("lightbulb.slash"));
    -[HREContextActionTemplate setIconDescriptor:](v2, "setIconDescriptor:", v4);

    -[HRETemplate setIdentifier:](v2, "setIdentifier:", CFSTR("lightsAllOffContextAction"));
    -[HRETemplate setSortingPriority:](v2, "setSortingPriority:", 4.0);
  }
  return v2;
}

- (id)extraInvolvedTypes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = *MEMORY[0x24BDD6C00];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_lazy_actionMap
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v8 = CFSTR("HREServiceTypeAll");
  v6 = *MEMORY[0x24BDD5970];
  v7 = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HRECharacteristicActionMap characteristicActionMap:](HRECharacteristicActionMap, "characteristicActionMap:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
