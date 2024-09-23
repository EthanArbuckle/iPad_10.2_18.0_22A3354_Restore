@implementation HUAppleMusicItem

- (HUAppleMusicItem)initWithMediaProfileContainer:(id)a3
{
  id v6;
  HUAppleMusicItem *v7;
  HUAppleMusicItem *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAppleMusicItem.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProfileContainer"));

  }
  v11.receiver = self;
  v11.super_class = (Class)HUAppleMusicItem;
  v7 = -[HUAppleMusicItem init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_mediaProfileContainer, a3);

  return v8;
}

- (HUAppleMusicItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithMediaProfileContainer_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAppleMusicItem.m"), 33, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUAppleMusicItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HUAppleMusicItem mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithMediaProfileContainer:", v5);

  objc_msgSend(v6, "copyLatestResultsFromItem:", self);
  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[HUAppleMusicItem mediaProfileContainer](self, "mediaProfileContainer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_appleMusicCurrentLoggedInAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  if (v5)
  {
    objc_msgSend(v5, "username");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("HOAppleMusicAccountKey"));
  }
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[HUAppleMusicItem mediaProfileContainer](self, "mediaProfileContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInt:", objc_msgSend(v10, "isControllable") ^ 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D30C80]);

  -[HUAppleMusicItem mediaProfileContainer](self, "mediaProfileContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hf_dependentHomeKitObjectsForDownstreamItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end
