@implementation HFAccessoryProfileGroupItem

- (HFAccessoryProfileGroupItem)initWithProfiles:(id)a3 groupIdentifier:(id)a4 valueSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFAccessoryProfileGroupItem *v12;
  HFAccessoryProfileGroupItem *v13;
  void *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HFAccessoryProfileGroupItem;
  v12 = -[HFItemGroupItem init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_profiles, a3);
    objc_storeStrong((id *)&v13->_groupIdentifier, a4);
    objc_storeStrong((id *)&v13->_valueSource, a5);
    -[HFAccessoryProfileGroupItem _buildProfileItems](v13, "_buildProfileItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemGroupItem setItems:](v13, "setItems:", v14);

  }
  return v13;
}

- (HFAccessoryProfileGroupItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithProfiles_groupIdentifier_valueSource_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessoryProfileGroupItem.m"), 34, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessoryProfileGroupItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFAccessoryProfileGroupItem valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFAccessoryProfileGroupItem copyWithValueSource:](self, "copyWithValueSource:", v4);

  return v5;
}

- (id)accessories
{
  void *v2;
  void *v3;

  -[HFAccessoryProfileGroupItem profiles](self, "profiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_130);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __42__HFAccessoryProfileGroupItem_accessories__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessory");
}

- (NSSet)services
{
  void *v2;
  void *v3;

  -[HFAccessoryProfileGroupItem profiles](self, "profiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_7_8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

id __39__HFAccessoryProfileGroupItem_services__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_buildProfileItems
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[HFAccessoryProfileGroupItem profiles](self, "profiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__HFAccessoryProfileGroupItem__buildProfileItems__block_invoke;
  v6[3] = &unk_1EA736D78;
  v6[4] = self;
  objc_msgSend(v3, "na_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

HFAccessoryProfileItem *__49__HFAccessoryProfileGroupItem__buildProfileItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HFAccessoryProfileItem *v4;
  void *v5;
  HFAccessoryProfileItem *v6;

  v3 = a2;
  v4 = [HFAccessoryProfileItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "valueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFAccessoryProfileItem initWithProfile:valueSource:](v4, "initWithProfile:valueSource:", v3, v5);

  return v6;
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[HFAccessoryProfileGroupItem profiles](self, "profiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessoryProfileGroupItem groupIdentifier](self, "groupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithProfiles:groupIdentifier:valueSource:", v6, v7, v4);

  objc_msgSend(v8, "copyLatestResultsFromItem:", self);
  return v8;
}

- (NSSet)profiles
{
  return self->_profiles;
}

- (NSNumber)groupIdentifier
{
  return self->_groupIdentifier;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
}

@end
