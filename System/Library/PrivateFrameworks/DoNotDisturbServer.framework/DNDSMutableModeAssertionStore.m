@implementation DNDSMutableModeAssertionStore

- (void)setAssertions:(id)a3
{
  NSArray *v4;
  NSArray *assertions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  assertions = self->super._assertions;
  self->super._assertions = v4;

}

- (void)setInvalidations:(id)a3
{
  NSArray *v4;
  NSArray *invalidations;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  invalidations = self->super._invalidations;
  self->super._invalidations = v4;

}

- (void)setInvalidationRequests:(id)a3
{
  NSArray *v4;
  NSArray *invalidationRequests;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  invalidationRequests = self->super._invalidationRequests;
  self->super._invalidationRequests = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDSModeAssertionStore _initWithStore:]([DNDSModeAssertionStore alloc], "_initWithStore:", self);
}

- (void)filterForSyncToPairedDevice:(id)a3 clientDetailsProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  -[DNDSModeAssertionStore assertions](self, "assertions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __108__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__filterForSyncToPairedDevice_clientDetailsProvider___block_invoke;
  v27[3] = &unk_1E86A6EB0;
  v10 = v7;
  v28 = v10;
  v11 = v6;
  v29 = v11;
  objc_msgSend(v8, "bs_filter:", v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMutableModeAssertionStore setAssertions:](self, "setAssertions:", v12);
  -[DNDSModeAssertionStore invalidations](self, "invalidations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __108__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__filterForSyncToPairedDevice_clientDetailsProvider___block_invoke_2;
  v24[3] = &unk_1E86A6ED8;
  v14 = v10;
  v25 = v14;
  v15 = v11;
  v26 = v15;
  objc_msgSend(v13, "bs_filter:", v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMutableModeAssertionStore setInvalidations:](self, "setInvalidations:", v16);
  -[DNDSModeAssertionStore invalidationRequests](self, "invalidationRequests");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v9;
  v21[1] = 3221225472;
  v21[2] = __108__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__filterForSyncToPairedDevice_clientDetailsProvider___block_invoke_3;
  v21[3] = &unk_1E86A6F00;
  v22 = v14;
  v23 = v15;
  v18 = v15;
  v20 = v14;
  objc_msgSend(v17, "bs_filter:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMutableModeAssertionStore setInvalidationRequests:](self, "setInvalidationRequests:", v19);
}

uint64_t __108__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__filterForSyncToPairedDevice_clientDetailsProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientDetailsForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isSyncSuppressedClient") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v3, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "deviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
    {
      v8 = 0;
    }
    else if (objc_msgSend(v7, "isIOS14SyncSuppressedClient"))
    {
      v8 = objc_msgSend(*(id *)(a1 + 40), "isIOS14EraOS") ^ 1;
    }
    else
    {
      v8 = 1;
    }

  }
  return v8;
}

uint64_t __108__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__filterForSyncToPairedDevice_clientDetailsProvider___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "assertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientDetailsForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v4, "reason");
  if (v9 == 1 || (objc_msgSend(v8, "isSyncSuppressedClient") & 1) != 0)
  {
    v10 = 0;
  }
  else if (objc_msgSend(v8, "isIOS14SyncSuppressedClient"))
  {
    v10 = objc_msgSend(*(id *)(a1 + 40), "isIOS14EraOS") ^ 1;
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

uint64_t __108__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__filterForSyncToPairedDevice_clientDetailsProvider___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientDetailsForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "reason");
  if (v8 == 1 || (objc_msgSend(v7, "isSyncSuppressedClient") & 1) != 0)
  {
    v9 = 0;
  }
  else if (objc_msgSend(v7, "isIOS14SyncSuppressedClient"))
  {
    v9 = objc_msgSend(*(id *)(a1 + 40), "isIOS14EraOS") ^ 1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)unresolveSourcesForSyncToPairedDevice:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  -[DNDSModeAssertionStore assertions](self, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__unresolveSourcesForSyncToPairedDevice___block_invoke;
  v19[3] = &unk_1E86A6F28;
  v7 = v4;
  v20 = v7;
  objc_msgSend(v5, "bs_compactMap:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMutableModeAssertionStore setAssertions:](self, "setAssertions:", v8);
  -[DNDSModeAssertionStore invalidations](self, "invalidations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__unresolveSourcesForSyncToPairedDevice___block_invoke_2;
  v17[3] = &unk_1E86A6F50;
  v10 = v7;
  v18 = v10;
  objc_msgSend(v9, "bs_mapNoNulls:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMutableModeAssertionStore setInvalidations:](self, "setInvalidations:", v11);
  -[DNDSModeAssertionStore invalidationRequests](self, "invalidationRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__unresolveSourcesForSyncToPairedDevice___block_invoke_3;
  v15[3] = &unk_1E86A6F78;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v12, "bs_mapNoNulls:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMutableModeAssertionStore setInvalidationRequests:](self, "setInvalidationRequests:", v13);
}

id __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__unresolveSourcesForSyncToPairedDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolveWithExpectedRemoteDeviceIdentifier:localDeviceIdentifier:remoteDeviceIdentifier:", v4, 0, CFSTR("dr"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__unresolveSourcesForSyncToPairedDevice___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolveWithExpectedRemoteDeviceIdentifier:localDeviceIdentifier:remoteDeviceIdentifier:", v4, 0, CFSTR("dr"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__unresolveSourcesForSyncToPairedDevice___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolveWithExpectedRemoteDeviceIdentifier:localDeviceIdentifier:remoteDeviceIdentifier:", v4, 0, CFSTR("dr"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)resolveSourcesForSyncFromPairedDevice:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  -[DNDSModeAssertionStore assertions](self, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__resolveSourcesForSyncFromPairedDevice___block_invoke;
  v19[3] = &unk_1E86A6F28;
  v7 = v4;
  v20 = v7;
  objc_msgSend(v5, "bs_compactMap:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMutableModeAssertionStore setAssertions:](self, "setAssertions:", v8);
  -[DNDSModeAssertionStore invalidations](self, "invalidations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__resolveSourcesForSyncFromPairedDevice___block_invoke_2;
  v17[3] = &unk_1E86A6F50;
  v10 = v7;
  v18 = v10;
  objc_msgSend(v9, "bs_mapNoNulls:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMutableModeAssertionStore setInvalidations:](self, "setInvalidations:", v11);
  -[DNDSModeAssertionStore invalidationRequests](self, "invalidationRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__resolveSourcesForSyncFromPairedDevice___block_invoke_3;
  v15[3] = &unk_1E86A6F78;
  v16 = v10;
  v14 = v10;
  objc_msgSend(v12, "bs_mapNoNulls:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMutableModeAssertionStore setInvalidationRequests:](self, "setInvalidationRequests:", v13);
}

id __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__resolveSourcesForSyncFromPairedDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolveWithExpectedRemoteDeviceIdentifier:localDeviceIdentifier:remoteDeviceIdentifier:", CFSTR("dr"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__resolveSourcesForSyncFromPairedDevice___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolveWithExpectedRemoteDeviceIdentifier:localDeviceIdentifier:remoteDeviceIdentifier:", CFSTR("dr"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__resolveSourcesForSyncFromPairedDevice___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolveWithExpectedRemoteDeviceIdentifier:localDeviceIdentifier:remoteDeviceIdentifier:", CFSTR("dr"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updateConfigurationModificationDatesWithDataSource:(id)a3 syncManager:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[DNDSModeAssertionStore assertions](self, "assertions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (objc_msgSend(v8, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "source");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deviceIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        objc_msgSend(v14, "syncManager:updateOutboundModeAssertion:", v6, v10);
        v13 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "setObject:atIndexedSubscript:", v13, v9);
        v10 = (void *)v13;
      }

      ++v9;
    }
    while (v9 < objc_msgSend(v8, "count"));
  }
  -[DNDSMutableModeAssertionStore setAssertions:](self, "setAssertions:", v8);

}

- (void)downgradeAssertionsIfNeededForSyncToPairedDevice:(id)a3 dataSource:(id)a4 syncManager:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v11 = a4;
  v8 = a5;
  if ((objc_msgSend(a3, "supportsKettle") & 1) == 0)
  {
    -[DNDSModeAssertionStore assertions](self, "assertions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __130__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__downgradeAssertionsIfNeededForSyncToPairedDevice_dataSource_syncManager___block_invoke;
    v12[3] = &unk_1E86A6FA0;
    v13 = v11;
    v14 = v8;
    objc_msgSend(v9, "bs_map:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSMutableModeAssertionStore setAssertions:](self, "setAssertions:", v10);
  }

}

id __130__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__downgradeAssertionsIfNeededForSyncToPairedDevice_dataSource_syncManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
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
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v3 = a2;
  if (objc_msgSend(v3, "isInternalScheduled"))
  {
    v5 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "details");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "syncManager:scheduleSettingsForModeIdentifier:", v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB3588];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dnds_dateIntervalForScheduleSettings:date:calendar:", v8, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D1D630], "lifetimeWithDateInterval:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "details");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "setLifetime:", v13);
    v16 = objc_alloc(MEMORY[0x1E0D1D5F8]);
    objc_msgSend(v3, "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v16, "initWithUUID:startDate:details:source:", v17, v18, v15, v19);

  }
  else
  {
    v20 = v3;
  }

  return v20;
}

- (void)sanitizeDatesForThreshold:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  -[DNDSModeAssertionStore assertions](self, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75__DNDSMutableModeAssertionStore_DateOperations__sanitizeDatesForThreshold___block_invoke;
  v19[3] = &unk_1E86A6F28;
  v7 = v4;
  v20 = v7;
  objc_msgSend(v5, "bs_mapNoNulls:", v19);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[DNDSMutableModeAssertionStore setAssertions:](self, "setAssertions:", v14);
  -[DNDSModeAssertionStore invalidations](self, "invalidations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __75__DNDSMutableModeAssertionStore_DateOperations__sanitizeDatesForThreshold___block_invoke_2;
  v17[3] = &unk_1E86A6F50;
  v9 = v7;
  v18 = v9;
  objc_msgSend(v8, "bs_mapNoNulls:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMutableModeAssertionStore setInvalidations:](self, "setInvalidations:", v10);
  -[DNDSModeAssertionStore invalidationRequests](self, "invalidationRequests");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __75__DNDSMutableModeAssertionStore_DateOperations__sanitizeDatesForThreshold___block_invoke_5;
  v15[3] = &unk_1E86A6F78;
  v16 = v9;
  v12 = v9;
  objc_msgSend(v11, "bs_mapNoNulls:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMutableModeAssertionStore setInvalidationRequests:](self, "setInvalidationRequests:", v13);
}

id __75__DNDSMutableModeAssertionStore_DateOperations__sanitizeDatesForThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  if (v6 == -1)
  {
    v7 = DNDSLogAssertionStore;
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionStore, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v8;
      v18 = 2114;
      v19 = v3;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Will sanitize assertion date: date=%{public}@ assertion=%{public}@", (uint8_t *)&v16, 0x16u);
    }
    v9 = objc_alloc(MEMORY[0x1E0D1D5F8]);
    objc_msgSend(v3, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "details");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "initWithUUID:startDate:details:source:", v10, v11, v12, v13);

    v3 = (id)v14;
  }
  return v3;
}

id __75__DNDSMutableModeAssertionStore_DateOperations__sanitizeDatesForThreshold___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "invalidationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  if (v6 == -1)
  {
    v7 = DNDSLogAssertionStore;
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionStore, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v16 = 138543618;
      v17 = v8;
      v18 = 2114;
      v19 = v3;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Will sanitize invalidation date: date=%{public}@ invalidation=%{public}@", (uint8_t *)&v16, 0x16u);
    }
    v9 = objc_alloc(MEMORY[0x1E0D1D628]);
    objc_msgSend(v3, "assertion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "details");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "initWithAssertion:invalidationDate:details:source:reason:reasonOverride:", v10, v11, v12, v13, objc_msgSend(v3, "reason"), objc_msgSend(v3, "reasonOverride"));

    v3 = (id)v14;
  }
  return v3;
}

id __75__DNDSMutableModeAssertionStore_DateOperations__sanitizeDatesForThreshold___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "requestDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  if (v6 == -1)
  {
    v7 = DNDSLogAssertionStore;
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionStore, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v15 = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v3;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Will sanitize invalidation request date: date=%{public}@ invalidationRequest=%{public}@", (uint8_t *)&v15, 0x16u);
    }
    objc_msgSend(v3, "predicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "details");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "source");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:details:source:reason:reasonOverride:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:details:source:reason:reasonOverride:", v9, v10, v11, v12, objc_msgSend(v3, "reason"), objc_msgSend(v3, "reasonOverride"));
    v13 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v13;
  }
  return v3;
}

@end
