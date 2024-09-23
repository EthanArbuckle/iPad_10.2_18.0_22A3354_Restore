@implementation HDBackgroundObservationServerExtensionManager

- (HDBackgroundObservationServerExtensionManager)init
{
  HDBackgroundObservationServerExtensionManager *v2;
  HDBackgroundObservationServerExtensionManager *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *availableExtensions;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDBackgroundObservationServerExtensionManager;
  v2 = -[HDBackgroundObservationServerExtensionManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    availableExtensions = v3->_availableExtensions;
    v3->_availableExtensions = v4;

  }
  return v3;
}

- (id)extensionForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  NSMutableDictionary *availableExtensions;
  uint64_t v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  _QWORD v26[3];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  v7 = v6;
  v8 = v7;
  if (!self)
  {

    availableExtensions = (NSMutableDictionary *)MEMORY[0x10];
LABEL_17:
    -[NSMutableDictionary removeObjectForKey:](availableExtensions, "removeObjectForKey:", v8, (_QWORD)v20);
    v11 = 0;
    v18 = 0;
    goto LABEL_18;
  }
  os_unfair_lock_assert_owner(&self->_lock);
  v25 = *MEMORY[0x1E0CB2A28];
  v26[0] = CFSTR("com.apple.healthkit.background-observation");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionsWithMatchingAttributes:error:", v9, a4);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "hd_extensionContainerBundleIdentifier", (_QWORD)v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", v8) & 1) != 0)
        {
          v11 = v14;

          goto LABEL_12;
        }

      }
      v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_12:

  availableExtensions = self->_availableExtensions;
  if (!v11)
    goto LABEL_17;
  -[NSMutableDictionary objectForKeyedSubscript:](availableExtensions, "objectForKeyedSubscript:", v8);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (id)v17;
  }
  else
  {
    v18 = -[HDBackgroundObservationServerExtension _initWithExtension:]([HDBackgroundObservationServerExtension alloc], "_initWithExtension:", v11);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_availableExtensions, "setObject:forKeyedSubscript:", v18, v8);
  }
LABEL_18:
  os_unfair_lock_unlock(&self->_lock);

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableExtensions, 0);
}

@end
