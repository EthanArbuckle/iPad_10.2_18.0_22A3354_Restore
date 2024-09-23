@implementation APMetricNotificationRegistrar

- (APMetricNotificationRegistrar)init
{
  APMetricNotificationRegistrar *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableDictionary *registryByPurpose;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableDictionary *registryByClosure;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableDictionary *registryToAllPurpose;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableDictionary *registryToInternalPurpose;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableDictionary *registryToExternalPurpose;
  NSLock *v28;
  NSLock *registryLock;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)APMetricNotificationRegistrar;
  v2 = -[APMetricNotificationRegistrar init](&v31, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E08]);
    v6 = objc_msgSend_initWithCapacity_(v3, v4, 4, v5);
    registryByPurpose = v2->_registryByPurpose;
    v2->_registryByPurpose = (NSMutableDictionary *)v6;

    v8 = objc_alloc(MEMORY[0x1E0C99E08]);
    v11 = objc_msgSend_initWithCapacity_(v8, v9, 16, v10);
    registryByClosure = v2->_registryByClosure;
    v2->_registryByClosure = (NSMutableDictionary *)v11;

    v13 = objc_alloc(MEMORY[0x1E0C99E08]);
    v16 = objc_msgSend_initWithCapacity_(v13, v14, 4, v15);
    registryToAllPurpose = v2->_registryToAllPurpose;
    v2->_registryToAllPurpose = (NSMutableDictionary *)v16;

    v18 = objc_alloc(MEMORY[0x1E0C99E08]);
    v21 = objc_msgSend_initWithCapacity_(v18, v19, 4, v20);
    registryToInternalPurpose = v2->_registryToInternalPurpose;
    v2->_registryToInternalPurpose = (NSMutableDictionary *)v21;

    v23 = objc_alloc(MEMORY[0x1E0C99E08]);
    v26 = objc_msgSend_initWithCapacity_(v23, v24, 4, v25);
    registryToExternalPurpose = v2->_registryToExternalPurpose;
    v2->_registryToExternalPurpose = (NSMutableDictionary *)v26;

    v2->_registrationCounter = 1;
    v28 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    registryLock = v2->_registryLock;
    v2->_registryLock = v28;

  }
  return v2;
}

- (void)receivedMetric:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = objc_msgSend_purpose(v4, v5, v6, v7);
  v12 = objc_msgSend_metric(v4, v9, v10, v11);
  v13 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend__closuresForRegisteredForNonSpecificPurposeInternal_(self, v14, v8 >> 63, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v13, v17, (uint64_t)v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__closuresForPurpose_andMetric_(self, v20, v8, v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unionSet_(v19, v22, (uint64_t)v21, v23);

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = v19;
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v32;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v32 != v28)
          objc_enumerationMutation(v24);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v29) + 16))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v29));
        ++v29;
      }
      while (v27 != v29);
      v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v30, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v27);
  }

}

- (id)_closuresForPurpose:(int64_t)a3 andMetric:(int64_t)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;

  objc_msgSend_registryLock(self, a2, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v7, v8, v9, v10);
  objc_msgSend_registryByPurpose(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v15, a3, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v14, v18, (uint64_t)v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v20, v21, (uint64_t)CFSTR("allMetrics"), v22);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (a4 >= 1)
  {
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v23, a4, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v20, v28, (uint64_t)v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v30;
    if (v26)
    {
      v35 = (void *)objc_msgSend_copy(v26, v31, v32, v33);

      objc_msgSend_unionHashTable_(v35, v36, (uint64_t)v34, v37);
      v26 = v35;
    }
    else
    {
      v26 = v30;
    }

  }
  objc_msgSend_setRepresentation(v26, v23, v24, v25);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v7, v39, v40, v41);

  return v38;
}

- (NSMutableDictionary)registryByPurpose
{
  return self->_registryByPurpose;
}

- (id)_closuresForRegisteredForNonSpecificPurposeInternal:(BOOL)a3
{
  uint64_t v3;
  _BOOL4 v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;

  v4 = a3;
  objc_msgSend_registryLock(self, a2, a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v6, v7, v8, v9);
  v10 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_registryToAllPurpose(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayWithArray_(v10, v19, (uint64_t)v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend_registryToInternalPurpose(self, v22, v23, v24);
  else
    objc_msgSend_registryToExternalPurpose(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObjectsFromArray_(v21, v30, (uint64_t)v29, v31);

  objc_msgSend_unlock(v6, v32, v33, v34);
  objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99D20], v35, (uint64_t)v21, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (NSLock)registryLock
{
  return self->_registryLock;
}

- (NSMutableDictionary)registryToAllPurpose
{
  return self->_registryToAllPurpose;
}

- (NSMutableDictionary)registryToExternalPurpose
{
  return self->_registryToExternalPurpose;
}

- (NSMutableDictionary)registryToInternalPurpose
{
  return self->_registryToInternalPurpose;
}

- (int64_t)registerHandlerForPurpose:(int64_t)a3 closure:(id)a4
{
  return MEMORY[0x1E0DE7D20](self, sel_registerHandlerForPurpose_andMetric_closure_, a3, -1);
}

- (id)_metricRegistryForPurpose:(int64_t)a3 andMetric:(int64_t)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  const char *v24;
  const char *v25;
  id v26;
  const char *v27;
  const char *v28;

  objc_msgSend_registryByPurpose(self, a2, a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v7, a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v6, v10, (uint64_t)v9, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0C99E08]);
    v14 = (void *)objc_msgSend_initWithCapacity_(v15, v16, 4, v17);
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v14, (uint64_t)v9);
  }
  if (a4 < 1)
  {
    objc_msgSend_objectForKey_(v14, v12, (uint64_t)CFSTR("allMetrics"), v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v26 = objc_alloc(MEMORY[0x1E0CB3690]);
      v22 = (void *)objc_msgSend_initWithOptions_capacity_(v26, v27, 5, 4);
      objc_msgSend_setObject_forKey_(v14, v28, (uint64_t)v22, (uint64_t)CFSTR("allMetrics"));
    }
  }
  else
  {
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v12, a4, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v14, v20, (uint64_t)v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v23 = objc_alloc(MEMORY[0x1E0CB3690]);
      v22 = (void *)objc_msgSend_initWithOptions_capacity_(v23, v24, 5, 2);
      objc_msgSend_setObject_forKey_(v14, v25, (uint64_t)v22, (uint64_t)v19);
    }

  }
  return v22;
}

- (int64_t)registerHandlerForPurpose:(int64_t)a3 andMetric:(int64_t)a4 closure:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t registrationCounter;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;

  v8 = a5;
  objc_msgSend_registryLock(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v12, v13, v14, v15);
  registrationCounter = self->_registrationCounter;
  self->_registrationCounter = registrationCounter + 1;
  objc_msgSend__metricRegistryForPurpose_andMetric_(self, v17, a3, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend_copy(v8, v19, v20, v21);

  objc_msgSend_registryByClosure(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v27, registrationCounter, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = _Block_copy(v22);
  objc_msgSend_addObject_(v18, v31, (uint64_t)v30, v32);

  v33 = _Block_copy(v22);
  objc_msgSend_setObject_forKey_(v26, v34, (uint64_t)v33, (uint64_t)v29);

  objc_msgSend_unlock(v12, v35, v36, v37);
  return registrationCounter;
}

- (int64_t)registerHandlerForAllPurposesAndAllMetricsWithClosure:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  int64_t v10;

  v4 = a3;
  objc_msgSend_registryToAllPurpose(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend__registerHandlerInRegistry_closure_(self, v9, (uint64_t)v8, (uint64_t)v4);

  return v10;
}

- (int64_t)registerHandlerForInternalPurposesAndAllMetricsWithClosure:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  int64_t v10;

  v4 = a3;
  objc_msgSend_registryToInternalPurpose(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend__registerHandlerInRegistry_closure_(self, v9, (uint64_t)v8, (uint64_t)v4);

  return v10;
}

- (int64_t)registerHandlerForExternalPurposesAndAllMetricsWithClosure:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  int64_t v10;

  v4 = a3;
  objc_msgSend_registryToExternalPurpose(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend__registerHandlerInRegistry_closure_(self, v9, (uint64_t)v8, (uint64_t)v4);

  return v10;
}

- (int64_t)_registerHandlerInRegistry:(id)a3 closure:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t registrationCounter;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a4;
  v7 = a3;
  objc_msgSend_registryLock(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v11, v12, v13, v14);
  registrationCounter = self->_registrationCounter;
  self->_registrationCounter = registrationCounter + 1;
  v19 = (void *)objc_msgSend_copy(v6, v16, v17, v18);

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v20, registrationCounter, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = _Block_copy(v19);
  objc_msgSend_setObject_forKey_(v7, v24, (uint64_t)v23, (uint64_t)v22);

  objc_msgSend_unlock(v11, v25, v26, v27);
  return registrationCounter;
}

- (void)removeHandlerWithIdentifier:(int64_t)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;

  objc_msgSend_registryLock(self, a2, a3, v3);
  v39 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v39, v6, v7, v8);
  objc_msgSend_registryByClosure(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v13, a3, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v12, v16, (uint64_t)v15, v17);
  objc_msgSend_registryToAllPurpose(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v21, v22, (uint64_t)v15, v23);

  objc_msgSend_registryToInternalPurpose(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v27, v28, (uint64_t)v15, v29);

  objc_msgSend_registryToExternalPurpose(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectForKey_(v33, v34, (uint64_t)v15, v35);

  objc_msgSend_unlock(v39, v36, v37, v38);
}

- (NSMutableDictionary)registryByClosure
{
  return self->_registryByClosure;
}

- (int64_t)registrationCounter
{
  return self->_registrationCounter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registryToExternalPurpose, 0);
  objc_storeStrong((id *)&self->_registryToInternalPurpose, 0);
  objc_storeStrong((id *)&self->_registryToAllPurpose, 0);
  objc_storeStrong((id *)&self->_registryLock, 0);
  objc_storeStrong((id *)&self->_registryByClosure, 0);
  objc_storeStrong((id *)&self->_registryByPurpose, 0);
}

@end
