@implementation HMDShortcutActionModel

+ (Class)backedObjectClass
{
  return (Class)objc_opt_class();
}

+ (id)properties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___HMDShortcutActionModel;
  objc_msgSendSuper2(&v9, sel_properties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  NSStringFromSelector(sel_data);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (void)loadModelWithActionInformation:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDShortcutActionModel;
  v4 = a3;
  -[HMDActionModel loadModelWithActionInformation:](&v6, sel_loadModelWithActionInformation_, v4);
  objc_msgSend(v4, "hmf_dataForKey:", *MEMORY[0x1E0CBA100], v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDShortcutActionModel setData:](self, "setData:", v5);
}

@end
