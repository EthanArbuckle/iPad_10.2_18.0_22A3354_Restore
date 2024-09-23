@implementation BKIOHIDServiceSimplePersistentPropertySupport

- (int64_t)setPersistentProperties:(id)a3 forServicesMatchingDescriptor:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[BKIOHIDServiceMatcher existingServices](self->_matcher, "existingServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "setProperties:", v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return 2;
}

- (BKIOHIDServiceSimplePersistentPropertySupport)initWithSenderDescriptor:(id)a3 matcherDataProvider:(id)a4 persistentPropertyController:(id)a5
{
  id v9;
  id v10;
  id v11;
  BKIOHIDServiceSimplePersistentPropertySupport *v12;
  BKIOHIDServiceSimplePersistentPropertySupport *v13;
  BKIOHIDServiceMatcher *v14;
  BKIOHIDServiceMatcher *matcher;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BKIOHIDServiceSimplePersistentPropertySupport;
  v12 = -[BKIOHIDServiceSimplePersistentPropertySupport init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_senderDescriptor, a3);
    objc_storeStrong((id *)&v13->_persistentPropertyController, a5);
    v14 = -[BKIOHIDServiceMatcher initWithSenderDescriptor:dataProvider:]([BKIOHIDServiceMatcher alloc], "initWithSenderDescriptor:dataProvider:", v9, v10);
    matcher = v13->_matcher;
    v13->_matcher = v14;

    -[BKIOHIDServiceMatcher startObserving:queue:](v13->_matcher, "startObserving:queue:", v13, MEMORY[0x1E0C80D38]);
  }

  return v13;
}

- (void)invalidate
{
  BKIOHIDServiceMatcher *matcher;

  -[BKIOHIDServiceMatcher invalidate](self->_matcher, "invalidate");
  matcher = self->_matcher;
  self->_matcher = 0;

}

- (BOOL)handlesPersistentPropertiesForSenderDescriptor:(id)a3
{
  return -[BKSHIDEventSenderDescriptor matchesDescriptor:failureReason:](self->_senderDescriptor, "matchesDescriptor:failureReason:", a3, 0);
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BKIOHIDServicePersistentPropertyController *persistentPropertyController;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v21;
    *(_QWORD *)&v7 = 138543362;
    v19 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        persistentPropertyController = self->_persistentPropertyController;
        objc_msgSend(v11, "senderDescriptor", v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKIOHIDServicePersistentPropertyController allPersistentPropertiesForServicesMatchingDescriptor:](persistentPropertyController, "allPersistentPropertiesForServicesMatchingDescriptor:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v14, "count");
        BKLogHID();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
        if (v15)
        {
          if (v17)
          {
            objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v25 = v18;
            v26 = 2114;
            v27 = v11;
            _os_log_impl(&dword_1C8914000, v16, OS_LOG_TYPE_DEFAULT, "sending persistent properties %{public}@ to %{public}@", buf, 0x16u);

          }
          objc_msgSend(v11, "setProperties:", v14);
        }
        else
        {
          if (v17)
          {
            *(_DWORD *)buf = v19;
            v25 = v11;
            _os_log_impl(&dword_1C8914000, v16, OS_LOG_TYPE_DEFAULT, "no persistent properties for %{public}@", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderDescriptor, 0);
  objc_storeStrong((id *)&self->_persistentPropertyController, 0);
  objc_storeStrong((id *)&self->_matcher, 0);
}

@end
