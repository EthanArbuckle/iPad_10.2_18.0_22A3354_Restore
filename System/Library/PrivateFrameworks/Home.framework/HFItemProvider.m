@implementation HFItemProvider

+ (BOOL)prefersNonBlockingReloads
{
  return 0;
}

- (NSSet)clientInvalidationReasons
{
  return self->_clientInvalidationReasons;
}

uint64_t __100__HFItemProvider_HFForSubclassesOnly__reloadItemsWithObjects_keyAdaptor_itemAdaptor_filter_itemMap___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
}

- (id)reloadItemsWithObjects:(id)a3 keyAdaptor:(id)a4 itemAdaptor:(id)a5 filter:(id)a6 itemMap:(id)a7
{
  id v12;
  void (**v13)(id, _QWORD);
  void (**v14)(id, id);
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  uint64_t v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t n;
  uint64_t v65;
  HFItemProviderReloadResults *v66;
  void *v67;
  void *v69;
  void *v70;
  void *v71;
  void (**v72)(id, id);
  void *v73;
  unsigned int (**v74)(_QWORD, _QWORD);
  void *v75;
  void (**v77)(id, void *);
  void *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  uint8_t v103[128];
  uint8_t buf[4];
  HFItemProvider *v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  void *v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (void (**)(id, _QWORD))a4;
  v14 = (void (**)(id, id))a5;
  v15 = a6;
  v77 = (void (**)(id, void *))a7;
  if (!v77)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemProvider.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemMap"));

  }
  v74 = (unsigned int (**)(_QWORD, _QWORD))v15;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemProvider.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyAdaptor"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  -[HFItemProvider items](self, "items");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v99;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v99 != v19)
          objc_enumerationMutation(v16);
        v21 = *(id *)(*((_QWORD *)&v98 + 1) + 8 * i);
        v14[2](v14, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v78, "setObject:forKeyedSubscript:", v21, v22);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
    }
    while (v18);
  }
  v72 = v14;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v23 = v12;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v95;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v95 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * j);
        v13[2](v13, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          objc_msgSend(v79, "objectForKeyedSubscript:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v30 && (!v74 || v74[2](v74, v28)))
            objc_msgSend(v79, "setObject:forKeyedSubscript:", v28, v29);
        }

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
    }
    while (v25);
  }
  v73 = v13;
  v71 = v23;

  v31 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v78, "allKeys");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v79, "allKeys");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setWithArray:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFSetDiff diffFromSet:toSet:](HFSetDiff, "diffFromSet:toSet:", v33, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v75 = v37;
  objc_msgSend(v37, "deletions");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v91;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v91 != v42)
          objc_enumerationMutation(v39);
        v44 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * k);
        objc_msgSend(v78, "objectForKeyedSubscript:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        HFLogForCategory(0x29uLL);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v105 = self;
          v106 = 2112;
          v107 = v44;
          v108 = 2112;
          v109 = v45;
          _os_log_impl(&dword_1DD34E000, v46, OS_LOG_TYPE_DEFAULT, "%@: Removing HomeKit item for identifier %@: %@", buf, 0x20u);
        }

        objc_msgSend(v38, "addObject:", v45);
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
    }
    while (v41);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  objc_msgSend(v75, "additions");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v87;
    do
    {
      for (m = 0; m != v50; ++m)
      {
        if (*(_QWORD *)v87 != v51)
          objc_enumerationMutation(v48);
        v53 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * m);
        objc_msgSend(v79, "objectForKeyedSubscript:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v77[2](v77, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        if (v55)
        {
          HFLogForCategory(0x29uLL);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v105 = self;
            v106 = 2112;
            v107 = v53;
            v108 = 2112;
            v109 = v54;
            _os_log_impl(&dword_1DD34E000, v56, OS_LOG_TYPE_DEFAULT, "%@: Adding item for identifier %@: %@", buf, 0x20u);
          }

          objc_msgSend(v47, "addObject:", v55);
        }

      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v86, v103, 16);
    }
    while (v50);
  }

  objc_msgSend(v75, "updates");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __100__HFItemProvider_HFForSubclassesOnly__reloadItemsWithObjects_keyAdaptor_itemAdaptor_filter_itemMap___block_invoke;
  v84[3] = &unk_1EA734480;
  v58 = v78;
  v85 = v58;
  objc_msgSend(v57, "na_map:", v84);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  -[HFItemProvider items](self, "items");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v81;
    do
    {
      for (n = 0; n != v62; ++n)
      {
        if (*(_QWORD *)v81 != v63)
          objc_enumerationMutation(v60);
        v65 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * n);
        if ((objc_msgSend(v47, "containsObject:", v65) & 1) == 0
          && (objc_msgSend(v59, "containsObject:", v65) & 1) == 0)
        {
          objc_msgSend(v38, "addObject:", v65);
        }
      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v80, v102, 16);
    }
    while (v62);
  }

  v66 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:]([HFItemProviderReloadResults alloc], "initWithAddedItems:removedItems:existingItems:", v47, v38, v59);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  return v67;
}

uint64_t __84__HFItemProvider_HFForSubclassesOnly__reloadItemsWithHomeKitObjects_filter_itemMap___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

id __84__HFItemProvider_HFForSubclassesOnly__reloadItemsWithHomeKitObjects_filter_itemMap___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v7;

  v3 = a2;
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_1F03F0850) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("HFItemProvider.m"), 214, CFSTR("-reloadItemsWithHomeKitObjects expects all existing items to conform to HFHomeKitItemProtocol"));

  }
  objc_msgSend(v3, "homeKitObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)reloadItemsWithHomeKitObjects:(id)a3 filter:(id)a4 itemMap:(id)a5
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__HFItemProvider_HFForSubclassesOnly__reloadItemsWithHomeKitObjects_filter_itemMap___block_invoke_2;
  v6[3] = &unk_1EA7344E8;
  v6[4] = self;
  v6[5] = a2;
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", a3, &__block_literal_global_108, v6, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HFItemProvider)init
{
  HFItemProvider *v2;
  NSSet *v3;
  NSSet *clientInvalidationReasons;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFItemProvider;
  v2 = -[HFItemProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    clientInvalidationReasons = v2->_clientInvalidationReasons;
    v2->_clientInvalidationReasons = v3;

  }
  return v2;
}

- (id)asGeneric
{
  sub_1DD42484C();
  return HFItemProvider.asGeneric()();
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)reloadItems
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemProvider.m"), 104, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFItemProvider reloadItems]", objc_opt_class());

  v5 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 36);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "futureWithError:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSSet)items
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemProvider.m"), 110, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFItemProvider items]", objc_opt_class());

  return 0;
}

- (void)setClientInvalidationReasons:(id)a3
{
  id v4;
  NSSet *v5;
  NSSet *clientInvalidationReasons;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
    v5 = (NSSet *)v4;
  else
    v5 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
  clientInvalidationReasons = self->_clientInvalidationReasons;
  self->_clientInvalidationReasons = v5;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInvalidationReasons, 0);
}

@end
