@implementation HFUserAccessLevelItem

- (unint64_t)cameraAccessLevel
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[HFUserItem home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFUserItem user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeAccessControlForUser:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "camerasAccessLevel");

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HFUserAccessLevelItem;
  -[HFUserItem _subclass_updateWithOptions:](&v10, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__HFUserAccessLevelItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1EA72AF60;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
  return v6;
}

id __53__HFUserAccessLevelItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_msgSend(v3, "mutableCopy");

  HFLocalizedStringFromHMUserCameraAccessLevel(objc_msgSend(WeakRetained, "cameraAccessLevel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("cameraAccessLevel"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
