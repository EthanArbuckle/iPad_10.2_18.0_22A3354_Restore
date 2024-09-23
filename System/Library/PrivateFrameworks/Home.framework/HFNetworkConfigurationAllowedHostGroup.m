@implementation HFNetworkConfigurationAllowedHostGroup

- (HFNetworkConfigurationAllowedHostGroup)initWithName:(id)a3
{
  id v5;
  HFNetworkConfigurationAllowedHostGroup *v6;
  HFNetworkConfigurationAllowedHostGroup *v7;
  uint64_t v8;
  NSMutableSet *mutableAddresses;
  uint64_t v10;
  NSMutableSet *mutableAllowedHosts;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFNetworkConfigurationAllowedHostGroup;
  v6 = -[HFNetworkConfigurationAllowedHostGroup init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    mutableAddresses = v7->_mutableAddresses;
    v7->_mutableAddresses = (NSMutableSet *)v8;

    v7->_purpose = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    mutableAllowedHosts = v7->_mutableAllowedHosts;
    v7->_mutableAllowedHosts = (NSMutableSet *)v10;

  }
  return v7;
}

+ (id)groupsForNetworkConfigurationProfiles:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__HFNetworkConfigurationAllowedHostGroup_groupsForNetworkConfigurationProfiles___block_invoke;
  v11[3] = &unk_1EA732298;
  v12 = v5;
  v6 = v5;
  objc_msgSend(v4, "na_each:", v11);

  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __80__HFNetworkConfigurationAllowedHostGroup_groupsForNetworkConfigurationProfiles___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "allowedHosts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__HFNetworkConfigurationAllowedHostGroup_groupsForNetworkConfigurationProfiles___block_invoke_2;
  v4[3] = &unk_1EA732270;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);

}

void __80__HFNetworkConfigurationAllowedHostGroup_groupsForNetworkConfigurationProfiles___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  HFNetworkConfigurationAllowedHostGroup *v6;
  HFNetworkConfigurationAllowedHostGroup *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "name");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = -[HFNetworkConfigurationAllowedHostGroup initWithName:]([HFNetworkConfigurationAllowedHostGroup alloc], "initWithName:", v8);
  v7 = v6;

  -[HFNetworkConfigurationAllowedHostGroup addAllowedHost:](v7, "addAllowedHost:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v8);

}

- (NSString)purposeLocalizedDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CBA710], "hf_localizedDescriptionForAllowedHostPurpose:", -[HFNetworkConfigurationAllowedHostGroup purpose](self, "purpose"));
}

- (void)addAllowedHost:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFNetworkConfigurationAllowedHostGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v12, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFNetworkConfigurationAllowedHostGroup name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("allowedHost name %@ is not group name %@"), v7, v8);

  }
  -[HFNetworkConfigurationAllowedHostGroup mutableAddresses](self, "mutableAddresses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addresses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v10);

  -[HFNetworkConfigurationAllowedHostGroup setPurpose:](self, "setPurpose:", -[HFNetworkConfigurationAllowedHostGroup purpose](self, "purpose") | objc_msgSend(v12, "purpose"));
  -[HFNetworkConfigurationAllowedHostGroup mutableAllowedHosts](self, "mutableAllowedHosts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(unint64_t)a3
{
  self->_purpose = a3;
}

- (NSMutableSet)mutableAddresses
{
  return self->_mutableAddresses;
}

- (void)setMutableAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_mutableAddresses, a3);
}

- (NSMutableSet)mutableAllowedHosts
{
  return self->_mutableAllowedHosts;
}

- (void)setMutableAllowedHosts:(id)a3
{
  objc_storeStrong((id *)&self->_mutableAllowedHosts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAllowedHosts, 0);
  objc_storeStrong((id *)&self->_mutableAddresses, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
