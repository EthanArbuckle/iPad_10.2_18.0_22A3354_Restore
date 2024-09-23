@implementation HUSoftwareUpdateInfoItemProvider

- (HUSoftwareUpdateInfoItemProvider)initWithHome:(id)a3
{
  id v5;
  HUSoftwareUpdateInfoItemProvider *v6;
  HUSoftwareUpdateInfoItemProvider *v7;
  uint64_t v8;
  NSMutableSet *softwareUpdateItems;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUSoftwareUpdateInfoItemProvider;
  v6 = -[HFItemProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_home, a3);
    v8 = objc_opt_new();
    softwareUpdateItems = v7->_softwareUpdateItems;
    v7->_softwareUpdateItems = (NSMutableSet *)v8;

  }
  return v7;
}

- (HUSoftwareUpdateInfoItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateInfoItemProvider.m"), 33, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSoftwareUpdateInfoItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HUSoftwareUpdateInfoItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t (**v12)(_QWORD, _QWORD);
  int v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _QWORD aBlock[4];
  id v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  v33 = 0u;
  -[HUSoftwareUpdateInfoItemProvider home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v34;
    *(_QWORD *)&v7 = 138412290;
    v26 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v10, "hf_hasSoftwareUpdate", v26))
        {
          -[HUSoftwareUpdateInfoItemProvider filter](self, "filter");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v11
            || (-[HUSoftwareUpdateInfoItemProvider filter](self, "filter"),
                v12 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
                v13 = ((uint64_t (**)(_QWORD, void *))v12)[2](v12, v10),
                v12,
                v11,
                v13))
          {
            if (objc_msgSend(v10, "hf_isReadyToInstallSoftwareUpdate")
              && (objc_msgSend(v10, "hf_hasNewValidSoftwareUpdate") & 1) == 0)
            {
              HFLogForCategory();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v26;
                v38 = v10;
                _os_log_error_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_ERROR, "Software update is ready to install but controller not controllable: %@", buf, 0xCu);
              }
            }
            else
            {
              objc_msgSend(v10, "hf_softwareUpdateHash");
              v14 = objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v10, "hf_isSoftwareUpdateInstalled"))
              {
                -[NSObject stringByAppendingString:](v14, "stringByAppendingString:", CFSTR("-Installed"));
                v15 = objc_claimAutoreleasedReturnValue();

                v14 = v15;
              }
              objc_msgSend(v3, "na_objectForKey:withDefaultValue:", v14, &__block_literal_global_159);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addObject:", v10);

            }
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compare_);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_2;
  v31[3] = &unk_1E6F50F00;
  v20 = v3;
  v32 = v20;
  objc_msgSend(v18, "na_map:", v31);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = v19;
  aBlock[1] = 3221225472;
  aBlock[2] = __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_5;
  aBlock[3] = &unk_1E6F58518;
  v30 = &__block_literal_global_14_2;
  v22 = _Block_copy(aBlock);
  objc_initWeak((id *)buf, self);
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v21, &__block_literal_global_14_2, v22, 0, &__block_literal_global_19_0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_7;
  v27[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v28, (id *)buf);
  objc_msgSend(v23, "flatMap:", v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v28);

  objc_destroyWeak((id *)buf);
  return v24;
}

uint64_t __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99E20], "set");
}

uint64_t __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

id __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_4;
  v5[3] = &unk_1E6F584F0;
  v5[4] = &v6;
  objc_msgSend(v2, "na_each:", v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7[3]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^= objc_msgSend(v3, "hash");

}

id __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

HUSoftwareUpdateInfoItem *__47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  HUSoftwareUpdateInfoItem *v3;

  v2 = a2;
  v3 = -[HUSoftwareUpdateInfoItem initWithAccessories:]([HUSoftwareUpdateInfoItem alloc], "initWithAccessories:", v2);

  return v3;
}

id __47__HUSoftwareUpdateInfoItemProvider_reloadItems__block_invoke_7(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "softwareUpdateItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minusSet:", v6);

  objc_msgSend(WeakRetained, "softwareUpdateItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)invalidationReasons
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)HUSoftwareUpdateInfoItemProvider;
  -[HFItemProvider invalidationReasons](&v7, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D308E0];
  v8[0] = *MEMORY[0x1E0D308A0];
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)softwareUpdateItems
{
  return self->_softwareUpdateItems;
}

- (void)setSoftwareUpdateItems:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareUpdateItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
