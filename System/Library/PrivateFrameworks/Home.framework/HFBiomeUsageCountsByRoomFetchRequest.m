@implementation HFBiomeUsageCountsByRoomFetchRequest

- (HFBiomeUsageCountsByRoomFetchRequest)initWithHome:(id)a3
{
  HFBiomeUsageCountsByRoomFetchRequest *v3;
  uint64_t v4;
  NSMapTable *usageCountByAccessoryRepresentableByRoom;
  uint64_t v6;
  NSMapTable *roomsByUniqueIdentifier;
  uint64_t v8;
  NSMapTable *accessoryRepresentablesByUniqueIdentifier;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HFBiomeUsageCountsByRoomFetchRequest;
  v3 = -[HFBiomeAbstractFetchRequest initWithHome:](&v11, sel_initWithHome_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    usageCountByAccessoryRepresentableByRoom = v3->_usageCountByAccessoryRepresentableByRoom;
    v3->_usageCountByAccessoryRepresentableByRoom = (NSMapTable *)v4;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    roomsByUniqueIdentifier = v3->_roomsByUniqueIdentifier;
    v3->_roomsByUniqueIdentifier = (NSMapTable *)v6;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    accessoryRepresentablesByUniqueIdentifier = v3->_accessoryRepresentablesByUniqueIdentifier;
    v3->_accessoryRepresentablesByUniqueIdentifier = (NSMapTable *)v8;

  }
  return v3;
}

- (void)eventHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location[2];

  v4 = a3;
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_initWeak(location, self);
    objc_msgSend(v5, "roomUniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke;
    v22[3] = &unk_1EA733438;
    objc_copyWeak(&v23, location);
    -[HFBiomeUsageCountsByRoomFetchRequest _roomWithUniqueIdentifierString:uniqueIdentifierToRoomBlock:](self, "_roomWithUniqueIdentifierString:uniqueIdentifierToRoomBlock:", v6, v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "serviceGroupUniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "serviceGroupUniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v7;
      v20[1] = 3221225472;
      v20[2] = __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke_2;
      v20[3] = &unk_1EA733460;
      objc_copyWeak(&v21, location);
      -[HFBiomeUsageCountsByRoomFetchRequest _accessoryRepresentableWithUniqueIdentifierString:uniqueIdentifierToAccessoryRepesentableBlock:](self, "_accessoryRepresentableWithUniqueIdentifierString:uniqueIdentifierToAccessoryRepesentableBlock:", v10, v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[HFBiomeUsageCountsByRoomFetchRequest _incrementUsageCountForAccessoryRepresentable:inRoom:](self, "_incrementUsageCountForAccessoryRepresentable:inRoom:", v11, v8);
      objc_destroyWeak(&v21);
    }
    objc_msgSend(v5, "accessoryUniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke_3;
    v18[3] = &unk_1EA733460;
    objc_copyWeak(&v19, location);
    -[HFBiomeUsageCountsByRoomFetchRequest _accessoryRepresentableWithUniqueIdentifierString:uniqueIdentifierToAccessoryRepesentableBlock:](self, "_accessoryRepresentableWithUniqueIdentifierString:uniqueIdentifierToAccessoryRepesentableBlock:", v12, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFBiomeUsageCountsByRoomFetchRequest _incrementUsageCountForAccessoryRepresentable:inRoom:](self, "_incrementUsageCountForAccessoryRepresentable:inRoom:", v13, v8);
    objc_msgSend(v5, "serviceUniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke_4;
    v16[3] = &unk_1EA733460;
    objc_copyWeak(&v17, location);
    -[HFBiomeUsageCountsByRoomFetchRequest _accessoryRepresentableWithUniqueIdentifierString:uniqueIdentifierToAccessoryRepesentableBlock:](self, "_accessoryRepresentableWithUniqueIdentifierString:uniqueIdentifierToAccessoryRepesentableBlock:", v14, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFBiomeUsageCountsByRoomFetchRequest _incrementUsageCountForAccessoryRepresentable:inRoom:](self, "_incrementUsageCountForAccessoryRepresentable:inRoom:", v15, v8);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v23);
    objc_destroyWeak(location);
  }

}

id __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_roomWithIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unsigned int (**v7)(_QWORD, _QWORD);
  void *v8;
  id v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_serviceGroupWithIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "filter");
  v7 = (unsigned int (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (((unsigned int (**)(_QWORD, void *))v7)[2](v7, v6))
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

id __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unsigned int (**v7)(_QWORD, _QWORD);
  void *v8;
  id v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_accessoryWithIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "filter");
  v7 = (unsigned int (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (((unsigned int (**)(_QWORD, void *))v7)[2](v7, v6))
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

id __53__HFBiomeUsageCountsByRoomFetchRequest_eventHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  unsigned int (**v7)(_QWORD, _QWORD);
  void *v8;
  id v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_serviceWithIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "filter");
  v7 = (unsigned int (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (((unsigned int (**)(_QWORD, void *))v7)[2](v7, v6))
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (void)_incrementUsageCountForAccessoryRepresentable:(id)a3 inRoom:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = a4;
  if (a3)
  {
    v14 = v6;
    v7 = a3;
    -[HFBiomeUsageCountsByRoomFetchRequest usageCountByAccessoryRepresentableByRoom](self, "usageCountByAccessoryRepresentableByRoom");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFBiomeUsageCountsByRoomFetchRequest usageCountByAccessoryRepresentableByRoom](self, "usageCountByAccessoryRepresentableByRoom");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v9, v14);

    }
    objc_msgSend(v9, "objectForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12 + 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, v7);

    v6 = v14;
  }

}

- (id)_accessoryRepresentableWithUniqueIdentifierString:(id)a3 uniqueIdentifierToAccessoryRepesentableBlock:(id)a4
{
  void (**v6)(id, void *);
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void (**)(id, void *))a4;
  v7 = (objc_class *)MEMORY[0x1E0CB3A28];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithUUIDString:", v8);

  -[HFBiomeUsageCountsByRoomFetchRequest accessoryRepresentablesByUniqueIdentifier](self, "accessoryRepresentablesByUniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v6[2](v6, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFBiomeUsageCountsByRoomFetchRequest accessoryRepresentablesByUniqueIdentifier](self, "accessoryRepresentablesByUniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v9);

  }
  return v11;
}

- (id)_roomWithUniqueIdentifierString:(id)a3 uniqueIdentifierToRoomBlock:(id)a4
{
  void (**v6)(id, void *);
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void (**)(id, void *))a4;
  v7 = (objc_class *)MEMORY[0x1E0CB3A28];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithUUIDString:", v8);

  -[HFBiomeUsageCountsByRoomFetchRequest roomsByUniqueIdentifier](self, "roomsByUniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v6[2](v6, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFBiomeUsageCountsByRoomFetchRequest roomsByUniqueIdentifier](self, "roomsByUniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v9);

  }
  return v11;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSMapTable)usageCountByAccessoryRepresentableByRoom
{
  return (NSMapTable *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUsageCountByAccessoryRepresentableByRoom:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMapTable)roomsByUniqueIdentifier
{
  return (NSMapTable *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRoomsByUniqueIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMapTable)accessoryRepresentablesByUniqueIdentifier
{
  return (NSMapTable *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAccessoryRepresentablesByUniqueIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryRepresentablesByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_roomsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_usageCountByAccessoryRepresentableByRoom, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
