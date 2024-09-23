@implementation NRMutableDevice

- (NSUUID)pairingID
{
  void *v2;
  void *v3;

  -[NRMutableDevice objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("pairingID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (BOOL)isPaired
{
  void *v2;
  void *v3;
  char v4;

  -[NRMutableDevice objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("isPaired"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isSetup
{
  void *v2;
  void *v3;
  char v4;

  -[NRMutableDevice objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("isSetup"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isActive
{
  void *v2;
  void *v3;
  char v4;

  -[NRMutableDevice objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("isActive"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isArchived
{
  void *v2;
  void *v3;
  char v4;

  -[NRMutableDevice objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("isArchived"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isAltAccount
{
  void *v2;
  void *v3;
  char v4;

  -[NRMutableDevice objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("isAltAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)migratable
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  double v11;
  BOOL v12;
  BOOL v13;

  -[NRMutableDevice objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("isArchived"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "BOOLValue");
  -[NRMutableDevice objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("migrationConsent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "BOOLValue");
  -[NRMutableDevice objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("migrationConsentDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "timeIntervalSinceNow");
    v12 = v11 <= 0.0;
    if (v11 < -86400.0)
      v12 = 0;
    v13 = v12 & v8 & v5;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)supportsCapability:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  v4 = a3;
  -[NRMutableDevice objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("capabilities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = objc_msgSend(v6, "hasUUID:", v4);
  else
    v7 = objc_msgSend(v6, "containsObject:", v4);
  v8 = v7;

  return v8;
}

+ (id)diffsToActivate:(BOOL)a3 withDate:(id)a4
{
  _BOOL4 v4;
  id v5;
  NRDevicePropertyDiffType *v6;
  NRDevicePropertyDiff *v7;
  NRDevicePropertyDiff *v8;
  NRDevicePropertyDiffType *v9;
  NRDevicePropertyDiffType *v10;
  NRDevicePropertyDiff *v11;
  NRDevicePropertyDiffType *v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  NRDevicePropertyDiff *v16;
  NRDevicePropertyDiffType *v17;
  NRDevicePropertyDiff *v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v4 = a3;
  v24[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = [NRDevicePropertyDiffType alloc];
  v7 = [NRDevicePropertyDiff alloc];
  if (v4)
  {
    v8 = -[NRDevicePropertyDiff initWithValue:](v7, "initWithValue:", MEMORY[0x1E0C9AAB0]);
    v9 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:](v6, "initWithDiff:andChangeType:", v8, 1);

    v10 = [NRDevicePropertyDiffType alloc];
    v11 = -[NRDevicePropertyDiff initWithValue:]([NRDevicePropertyDiff alloc], "initWithValue:", v5);

    v12 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:](v10, "initWithDiff:andChangeType:", v11, 1);
    v23[0] = CFSTR("isActive");
    v23[1] = CFSTR("lastActiveDate");
    v24[0] = v9;
    v24[1] = v12;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = v24;
    v15 = v23;
  }
  else
  {
    v16 = -[NRDevicePropertyDiff initWithValue:](v7, "initWithValue:", MEMORY[0x1E0C9AAA0]);
    v9 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:](v6, "initWithDiff:andChangeType:", v16, 1);

    v17 = [NRDevicePropertyDiffType alloc];
    v18 = -[NRDevicePropertyDiff initWithValue:]([NRDevicePropertyDiff alloc], "initWithValue:", v5);

    v12 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:](v17, "initWithDiff:andChangeType:", v18, 1);
    v21[0] = CFSTR("isActive");
    v21[1] = CFSTR("lastInactiveDate");
    v22[0] = v9;
    v22[1] = v12;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = v22;
    v15 = v21;
  }
  objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)diffsToPair:(BOOL)a3 withDate:(id)a4
{
  _BOOL4 v4;
  id v5;
  NRDevicePropertyDiffType *v6;
  NRDevicePropertyDiff *v7;
  NRDevicePropertyDiff *v8;
  NRDevicePropertyDiffType *v9;
  NRDevicePropertyDiffType *v10;
  NRDevicePropertyDiff *v11;
  NRDevicePropertyDiffType *v12;
  NRDevicePropertyDiff *v13;
  void *v14;
  NRDevicePropertyDiffType *v15;
  NRDevicePropertyDiffType *v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  const __CFString *v22;
  NRDevicePropertyDiffType *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[3];
  _QWORD v27[4];

  v4 = a3;
  v27[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = [NRDevicePropertyDiffType alloc];
  v7 = [NRDevicePropertyDiff alloc];
  if (v4)
  {
    v8 = -[NRDevicePropertyDiff initWithValue:](v7, "initWithValue:", MEMORY[0x1E0C9AAB0]);
    v9 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:](v6, "initWithDiff:andChangeType:", v8, 1);

    if (v5)
    {
      v10 = [NRDevicePropertyDiffType alloc];
      v11 = -[NRDevicePropertyDiff initWithValue:]([NRDevicePropertyDiff alloc], "initWithValue:", v5);
      v12 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:](v10, "initWithDiff:andChangeType:", v11, 1);

    }
    else
    {
      v12 = 0;
    }
    v15 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:]([NRDevicePropertyDiffType alloc], "initWithDiff:andChangeType:", 0, 2);
    v16 = v15;
    if (v12)
    {
      v26[0] = CFSTR("isPaired");
      v26[1] = CFSTR("pairedDate");
      v27[0] = v9;
      v27[1] = v12;
      v26[2] = CFSTR("isArchived");
      v27[2] = v15;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = v27;
      v19 = v26;
      v20 = 3;
    }
    else
    {
      v24[0] = CFSTR("isPaired");
      v24[1] = CFSTR("isArchived");
      v25[0] = v9;
      v25[1] = v15;
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = v25;
      v19 = v24;
      v20 = 2;
    }
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = -[NRDevicePropertyDiff initWithValue:](v7, "initWithValue:", MEMORY[0x1E0C9AAA0]);
    v9 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:](v6, "initWithDiff:andChangeType:", v13, 1);

    v22 = CFSTR("isPaired");
    v23 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

+ (id)diffsToSetStatusCode:(unint64_t)a3 andCompatibilityState:(unsigned __int16)a4
{
  uint64_t v4;
  NRDevicePropertyDiff *v6;
  void *v7;
  NRDevicePropertyDiff *v8;
  NRDevicePropertyDiffType *v9;
  NRDevicePropertyDiff *v10;
  void *v11;
  NRDevicePropertyDiff *v12;
  NRDevicePropertyDiffType *v13;
  NRDevicePropertyDiffType *v14;
  void *v15;
  _QWORD *v16;
  const __CFString **v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  const __CFString *v23;
  _QWORD v24[2];

  v4 = a4;
  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = [NRDevicePropertyDiff alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NRDevicePropertyDiff initWithValue:](v6, "initWithValue:", v7);

  v9 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:]([NRDevicePropertyDiffType alloc], "initWithDiff:andChangeType:", v8, 0);
  v10 = [NRDevicePropertyDiff alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NRDevicePropertyDiff initWithValue:](v10, "initWithValue:", v11);

  v13 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:]([NRDevicePropertyDiffType alloc], "initWithDiff:andChangeType:", v12, 1);
  v14 = v13;
  if (a3)
  {
    v21[0] = CFSTR("compatibilityState");
    v21[1] = CFSTR("statusCode");
    v22[0] = v13;
    v22[1] = v9;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = v22;
    v17 = (const __CFString **)v21;
    v18 = 2;
  }
  else
  {
    v23 = CFSTR("compatibilityState");
    v24[0] = v13;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = v24;
    v17 = &v23;
    v18 = 1;
  }
  objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)diffsToSetStatusCode:(unint64_t)a3
{
  NRDevicePropertyDiff *v4;
  void *v5;
  NRDevicePropertyDiff *v6;
  NRDevicePropertyDiffType *v7;
  NRDevicePropertyDiffType *v8;
  void *v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = [NRDevicePropertyDiff alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NRDevicePropertyDiff initWithValue:](v4, "initWithValue:", v5);

  v7 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:]([NRDevicePropertyDiffType alloc], "initWithDiff:andChangeType:", v6, 0);
  v8 = v7;
  if (a3)
  {
    v11 = CFSTR("statusCode");
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v9;
}

+ (id)diffsToClearStatusCodeAndCompatibilityState
{
  NRDevicePropertyDiffType *v2;
  NRDevicePropertyDiffType *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:]([NRDevicePropertyDiffType alloc], "initWithDiff:andChangeType:", 0, 2);
  v3 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:]([NRDevicePropertyDiffType alloc], "initWithDiff:andChangeType:", 0, 2);
  v6[0] = CFSTR("compatibilityState");
  v6[1] = CFSTR("statusCode");
  v7[0] = v3;
  v7[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)parseDiff:(id)a3 forPropertyChange:(id)a4 withBlock:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void (**v12)(id, uint64_t, void *);

  v12 = (void (**)(id, uint64_t, void *))a5;
  objc_msgSend(a3, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "changeType");
    objc_msgSend(v8, "diff");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v9, v11);

  }
}

- (NRMutableDevice)init
{
  NRMutableDevice *v2;
  uint64_t v3;
  NSMutableDictionary *properties;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NRMutableDevice;
  v2 = -[NRMutableStateBase init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    properties = v2->_properties;
    v2->_properties = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)setProperty:(id)a3 forName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NRDevicePropertyDiffType *v10;
  NRDeviceDiff *v11;
  void *v12;
  NRDeviceDiff *v13;
  id v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[NRMutableDevice objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NRMutableDeviceProperty diffFrom:to:](NRMutableDeviceProperty, "diffFrom:to:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:]([NRDevicePropertyDiffType alloc], "initWithDiff:andChangeType:", v9, 1);
  if (v10)
  {
    v11 = [NRDeviceDiff alloc];
    v15 = v6;
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NRDeviceDiff initWithDiffPropertyDiffs:](v11, "initWithDiffPropertyDiffs:", v12);

  }
  else
  {
    v13 = 0;
  }
  v14 = -[NRMutableStateBase applyDiff:](self, "applyDiff:", v13);

}

- (void)removePropertyForName:(id)a3
{
  id v4;
  NRDevicePropertyDiffType *v5;
  NRDeviceDiff *v6;
  void *v7;
  NRDeviceDiff *v8;
  id v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:]([NRDevicePropertyDiffType alloc], "initWithDiff:andChangeType:", 0, 2);
  v6 = [NRDeviceDiff alloc];
  v10 = v4;
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[NRDeviceDiff initWithDiffPropertyDiffs:](v6, "initWithDiffPropertyDiffs:", v7);
  v9 = -[NRMutableStateBase applyDiff:](self, "applyDiff:", v8);

}

- (void)invalidate
{
  NSMutableDictionary *properties;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NRMutableDevice;
  -[NRMutableStateBase invalidate](&v4, sel_invalidate);
  properties = self->_properties;
  self->_properties = 0;

}

- (id)propertyForName:(id)a3
{
  void *v3;
  NRMutableDeviceProperty *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_properties, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[NRMutableDeviceProperty initWithValue:]([NRMutableDeviceProperty alloc], "initWithValue:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)allPropertyNames
{
  return (id)-[NSMutableDictionary allKeys](self->_properties, "allKeys");
}

- (unint64_t)count
{
  return -[NSMutableDictionary count](self->_properties, "count");
}

+ (id)diffFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  id *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  NRDevicePropertyDiffType *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  NRDevicePropertyDiffType *v32;
  NRDeviceDiff *v33;
  id obj;
  id *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (id *)v5;
  v8 = (id *)v6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v8;
  if (objc_msgSend(v7, "count"))
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v7[5], "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    v14 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v8[5], "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "minusSet:", v16);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v17 = v13;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v42 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          v23 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:]([NRDevicePropertyDiffType alloc], "initWithDiff:andChangeType:", 0, 2);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, v22);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v19);
    }

  }
  if (objc_msgSend(v8, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v8[5];
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(obj);
          v28 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
          if (v7)
          {
            objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v29 = 0;
          }
          objc_msgSend(v8, "objectForKeyedSubscript:", v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          +[NRMutableDeviceProperty diffFrom:to:](NRMutableDeviceProperty, "diffFrom:to:", v29, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            v32 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:]([NRDevicePropertyDiffType alloc], "initWithDiff:andChangeType:", v31, v29 != 0);
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v32, v28);

            v8 = v36;
          }

        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v25);
    }

  }
  if (objc_msgSend(v9, "count"))
    v33 = -[NRDeviceDiff initWithDiffPropertyDiffs:]([NRDeviceDiff alloc], "initWithDiffPropertyDiffs:", v9);
  else
    v33 = 0;

  return v33;
}

- (id)applyDiff:(id)a3 upOnly:(BOOL)a4 notifyParent:(BOOL)a5 unconditional:(BOOL)a6
{
  _BOOL4 v7;
  id v9;
  NRMutableDevice *v10;
  id *p_isa;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  _BOOL4 v28;
  BOOL v29;
  void *v30;
  void *context;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v7 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (objc_msgSend(v9, "count"))
  {
    v28 = v7;
    context = (void *)MEMORY[0x1A1B01C40]();
    v10 = self;
    p_isa = (id *)&v10->super.super.isa;
    v12 = (uint64_t)v10;
    v29 = a6;
    if (!a6)
    {
      v12 = -[NRMutableDevice copyWithZone:](v10, "copyWithZone:", 0);

    }
    v30 = (void *)v12;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v14)
    {
      v15 = v14;
      v33 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v33)
            objc_enumerationMutation(v13);
          v17 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "diff");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "value");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(p_isa[5], "objectForKeyedSubscript:", v17);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          if (v19)
          {
            if (!v21 || !a4)
              objc_msgSend(p_isa[5], "setObject:forKeyedSubscript:", v20, v17);
          }
          else
          {
            objc_msgSend(p_isa[5], "removeObjectForKey:", v17);
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v15);
    }

    if (v29)
    {
      v23 = v30;
      if (!v13)
        goto LABEL_24;
    }
    else
    {
      v23 = v30;
      objc_msgSend((id)objc_opt_class(), "diffFrom:to:", v30, p_isa);
      v26 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v26;
      if (!v26)
      {
LABEL_24:

        objc_autoreleasePoolPop(context);
        v25 = v13;
        v24 = v25;
        goto LABEL_25;
      }
    }
    if (v28)
      objc_msgSend(p_isa, "notifyParentWithDiff:", v13);
    objc_msgSend(p_isa, "notifyObserversWithDiff:", v13);
    goto LABEL_24;
  }
  v24 = 0;
  v25 = v9;
LABEL_25:

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_createIndex:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v17 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v17)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:name:classes:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectClasses:name:classes:owner:", v9, CFSTR("device property key"), v10, self);

        objc_msgSend(v5, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[NRUnarchivedObjectVerifier unarchivingVerifyObjectClasses:name:classes:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectClasses:name:classes:owner:", v11, CFSTR("device property value"), v12, self);

        objc_msgSend(v11, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v11, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, v9);

        }
        ++v8;
      }
      while (v7 != v8);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v16;
}

- (NRMutableDevice)initWithCoder:(id)a3
{
  id v4;
  NRMutableDevice *v5;
  uint64_t v6;
  void *v7;
  NRPBMutableDevice *v8;
  NRMutableDevice *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *properties;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NRMutableDevice init](self, "init");
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11, v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("properties"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:name:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectIsNotNil:name:owner:", v5->_properties, CFSTR("device properties dictionary"), v5);
    -[NRMutableDevice _createIndex:](v5, "_createIndex:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    properties = v5->_properties;
    v5->_properties = (NSMutableDictionary *)v14;

LABEL_5:
    v9 = v5;
    goto LABEL_6;
  }
  v7 = (void *)v6;
  v8 = -[NRPBMutableDevice initWithData:]([NRPBMutableDevice alloc], "initWithData:", v6);
  v9 = -[NRMutableDevice initWithProtobuf:](v5, "initWithProtobuf:", v8);

LABEL_6:
  return v9;
}

- (NRMutableDevice)initWithProtobuf:(id)a3
{
  id v4;
  NRMutableDevice *v5;
  NSMutableDictionary *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  NSMutableDictionary *properties;
  NSMutableDictionary *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NRMutableDevice;
  v5 = -[NRMutableStateBase init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "names");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 0;
      do
      {
        objc_msgSend(v4, "names");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "properties");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          +[NRDevicePropertyDiff unpackPropertyValue:](NRDevicePropertyDiff, "unpackPropertyValue:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v15, v11);

        }
        ++v9;
        objc_msgSend(v4, "names");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

      }
      while (v9 < v17);
    }
    properties = v5->_properties;
    v5->_properties = v6;
    v19 = v6;

    +[NRUnarchivedObjectVerifier unarchivingVerifyObjectIsNotNil:name:owner:](NRUnarchivedObjectVerifier, "unarchivingVerifyObjectIsNotNil:name:owner:", v5->_properties, CFSTR("device properties dictionary"), v5);
  }

  return v5;
}

- (NRPBMutableDevice)protobuf
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *v15;
  NRMutableDevice *v16;
  NRMiniUUIDSet *v17;
  NRMutableDeviceProperty *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNames:", v4);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperties:", v5);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = self->_properties;
  v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v24)
  {
    v7 = *(_QWORD *)v26;
    v23 = v3;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[NRMutableDevice objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", CFSTR("capabilities"))
          && (objc_msgSend(v10, "value"),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              isKindOfClass = objc_opt_isKindOfClass(),
              v11,
              (isKindOfClass & 1) != 0))
        {
          objc_msgSend(v10, "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v7;
          v15 = v6;
          v16 = self;
          v17 = -[NRMiniUUIDSet initWithUUIDSet:]([NRMiniUUIDSet alloc], "initWithUUIDSet:", v13);
          v18 = -[NRMutableDeviceProperty initWithValue:]([NRMutableDeviceProperty alloc], "initWithValue:", v17);
          -[NRMutableDeviceProperty protobuf](v18, "protobuf");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          self = v16;
          v6 = v15;
          v7 = v14;
          v3 = v23;

        }
        else
        {
          objc_msgSend(v10, "protobuf");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v3, "names");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v9);

        if (v19)
        {
          objc_msgSend(v3, "properties");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v19);

        }
      }
      v24 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v24);
  }

  return (NRPBMutableDevice *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NRMutableDevice protobuf](self, "protobuf");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("data"));

}

+ (id)enclosedClassTypes
{
  void *v2;
  void *v3;

  +[NRMutableDeviceProperty enclosedClassTypes](NRMutableDeviceProperty, "enclosedClassTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)hash
{
  NSMutableDictionary *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_properties;
  v3 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    v6 = 1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v6 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "hash", (_QWORD)v9) - v6 + 32 * v6;
      }
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  NRMutableDevice *v4;
  NRMutableDevice *v5;
  NSMutableDictionary *properties;
  char v7;

  v4 = (NRMutableDevice *)a3;
  v5 = v4;
  if (v4 == self)
    goto LABEL_6;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7 = 0;
    goto LABEL_8;
  }
  properties = self->_properties;
  if (properties == v5->_properties)
LABEL_6:
    v7 = 1;
  else
    v7 = -[NSMutableDictionary isEqual:](properties, "isEqual:");
LABEL_8:

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("NRMutableDevice[%p]"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](self->_properties, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1A1B01C40]();
        -[NRMutableDevice objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByPaddingToLength:withString:startingAtIndex:", 30, CFSTR(" "), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[NRTextFormattingUtilities prefixLinesWithString:withText:](NRTextFormattingUtilities, "prefixLinesWithString:withText:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "appendString:", v15);
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v3;
}

uint64_t __30__NRMutableDevice_description__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  NRDevicePropertyDiffType *v12;
  NRDeviceDiff *v13;
  id v14;
  void *v16;
  NSMutableDictionary *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_properties;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NRMutableDevice objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[NRMutableDeviceProperty diffFrom:to:](NRMutableDeviceProperty, "diffFrom:to:", 0, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NRDevicePropertyDiffType initWithDiff:andChangeType:]([NRDevicePropertyDiffType alloc], "initWithDiff:andChangeType:", v11, 0);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v9);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v13 = -[NRDeviceDiff initWithDiffPropertyDiffs:]([NRDeviceDiff alloc], "initWithDiffPropertyDiffs:", v4);
  v14 = (id)objc_msgSend(v16, "applyDiff:upOnly:notifyParent:unconditional:", v13, 0, 0, 1);

  return v16;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  v8 = (void *)-[NSMutableDictionary copy](self->_properties, "copy");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (void)setProtobuf:(id)a3
{
  objc_storeStrong((id *)&self->_protobuf, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_protobuf, 0);
}

@end
