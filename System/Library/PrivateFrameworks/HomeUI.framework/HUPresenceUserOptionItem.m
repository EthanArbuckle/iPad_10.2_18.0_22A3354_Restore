@implementation HUPresenceUserOptionItem

- (HUPresenceUserOptionItem)initWithUserItem:(id)a3 selectedLocationDevice:(id)a4 locationDeviceManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  HUPresenceUserOptionItem *v12;
  HUPresenceUserOptionItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HUPresenceUserOptionItem;
  v12 = -[HUPresenceUserOptionItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userItem, a3);
    objc_storeStrong((id *)&v13->_selectedLocationDevice, a4);
    objc_storeStrong((id *)&v13->_locationDeviceManager, a5);
  }

  return v13;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  HUPresenceUserOptionItem *v12;

  v4 = a3;
  -[HUPresenceUserOptionItem userItem](self, "userItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithOptions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke;
  v10[3] = &unk_1E6F57690;
  v11 = v4;
  v12 = self;
  v7 = v4;
  objc_msgSend(v6, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type")
    || (objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D30910]),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "BOOLValue"),
        v5,
        v6))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_2;
    v18[3] = &unk_1E6F4C518;
    v18[4] = *(_QWORD *)(a1 + 40);
    __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_2((uint64_t)v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_INFO, "fetching activeLocationDevice for current user: %@", buf, 0xCu);
    }

    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_7;
    v16[3] = &unk_1E6F504C8;
    v12 = v3;
    v17 = v12;
    objc_msgSend(v10, "flatMap:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_12;
    v14[3] = &unk_1E6F4F2D0;
    v15 = v12;
    objc_msgSend(v13, "recover:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

id __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  HULocationDevice *v7;
  void *v8;
  HULocationDevice *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "selectedLocationDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  if (v3 == 2)
  {
    v6 = (void *)MEMORY[0x1E0D519C0];
    v7 = [HULocationDevice alloc];
    objc_msgSend(*(id *)(a1 + 32), "selectedLocationDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HULocationDevice initWithHMDevice:](v7, "initWithHMDevice:", v8);
    objc_msgSend(v6, "futureWithResult:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v3 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "locationDeviceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "availableLocationDevicesFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "flatMap:", &__block_literal_global_228);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v3)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "selectedLocationDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v4, "type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Unknown device type %@"), v12);

    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "locationDeviceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeLocationDeviceFuture");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

id __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(a2, "na_firstObjectPassingTest:", &__block_literal_global_3_3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentDevice");
}

id __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_INFO, "activeLocationDevice for current user: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "results");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (objc_msgSend(v3, "isCurrentDevice"))
    HULocalizedModelString(CFSTR("HULocationDeviceCurrentDevice"));
  else
    objc_msgSend(v3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30BF8]);

  v8 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "futureWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __56__HUPresenceUserOptionItem__subclass_updateWithOptions___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "failed to get activeLocationDevice for current user; error: %@",
      (uint8_t *)&v7,
      0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HFUserItem)userItem
{
  return self->_userItem;
}

- (HULocationDeviceManager)locationDeviceManager
{
  return self->_locationDeviceManager;
}

- (HUPresenceCurrentUserLocationDevice)selectedLocationDevice
{
  return self->_selectedLocationDevice;
}

- (void)setSelectedLocationDevice:(id)a3
{
  objc_storeStrong((id *)&self->_selectedLocationDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedLocationDevice, 0);
  objc_storeStrong((id *)&self->_locationDeviceManager, 0);
  objc_storeStrong((id *)&self->_userItem, 0);
}

@end
