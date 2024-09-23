@implementation HAPBLEServiceCache

- (HAPBLEServiceCache)initWithServiceUUID:(id)a3 instanceId:(id)a4 instanceOrder:(unint64_t)a5 serviceProperties:(unint64_t)a6 linkedServices:(id)a7
{
  id v13;
  id v14;
  id v15;
  HAPBLEServiceCache *v16;
  HAPBLEServiceCache *v17;
  uint64_t v18;
  NSMutableArray *cachedCharacteristics;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HAPBLEServiceCache;
  v16 = -[HAPBLEServiceCache init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_serviceUUID, a3);
    objc_storeStrong((id *)&v17->_serviceInstanceId, a4);
    v17->_serviceInstanceOrder = a5;
    v17->_serviceProperties = a6;
    objc_storeStrong((id *)&v17->_linkedServices, a7);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    cachedCharacteristics = v17->_cachedCharacteristics;
    v17->_cachedCharacteristics = (NSMutableArray *)v18;

  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  HAPBLEServiceCache *v4;
  HAPBLEServiceCache *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  BOOL v13;

  v4 = (HAPBLEServiceCache *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HAPBLEServiceCache serviceUUID](self, "serviceUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPBLEServiceCache serviceUUID](v5, "serviceUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8
        && (-[HAPBLEServiceCache serviceInstanceId](self, "serviceInstanceId"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            -[HAPBLEServiceCache serviceInstanceId](v5, "serviceInstanceId"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v9, "isEqual:", v10),
            v10,
            v9,
            v11))
      {
        v12 = -[HAPBLEServiceCache serviceInstanceOrder](self, "serviceInstanceOrder");
        v13 = v12 == -[HAPBLEServiceCache serviceInstanceOrder](v5, "serviceInstanceOrder");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HAPBLEServiceCache serviceUUID](self, "serviceUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HAPBLEServiceCache serviceInstanceId](self, "serviceInstanceId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (void)updateWithService:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HAPBLEServiceCache setServiceInstanceOrder:](self, "setServiceInstanceOrder:", objc_msgSend(v4, "serviceInstanceOrder"));
  -[HAPBLEServiceCache setServiceProperties:](self, "setServiceProperties:", objc_msgSend(v4, "serviceProperties"));
  objc_msgSend(v4, "linkedServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEServiceCache setLinkedServices:](self, "setLinkedServices:", v5);

  objc_msgSend(v4, "cachedCharacteristics");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[HAPBLEServiceCache setCachedCharacteristics:](self, "setCachedCharacteristics:", v6);
}

- (void)updateWithCharacteristic:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HAPBLEServiceCache cachedCharacteristics](self, "cachedCharacteristics", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v10, "isEqual:", v4))
        {
          objc_msgSend(v10, "updateWithCharacteristic:", v4);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[HAPBLEServiceCache cachedCharacteristics](self, "cachedCharacteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);
LABEL_11:

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HAPBLEServiceCache serviceUUID](self, "serviceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SUUI"));

  -[HAPBLEServiceCache serviceInstanceId](self, "serviceInstanceId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SI"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPBLEServiceCache serviceInstanceOrder](self, "serviceInstanceOrder"), CFSTR("SO"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPBLEServiceCache serviceProperties](self, "serviceProperties"), CFSTR("SP"));
  -[HAPBLEServiceCache linkedServices](self, "linkedServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("LS"));

  -[HAPBLEServiceCache cachedCharacteristics](self, "cachedCharacteristics");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("CC"));

}

- (HAPBLEServiceCache)initWithCoder:(id)a3
{
  id v4;
  HAPBLEServiceCache *v5;
  uint64_t v6;
  NSUUID *serviceUUID;
  uint64_t v8;
  NSNumber *serviceInstanceId;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *linkedServices;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableArray *cachedCharacteristics;
  HAPBLEServiceCache *v20;
  objc_super v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HAPBLEServiceCache;
  v5 = -[HAPBLEServiceCache init](&v22, sel_init);
  if (!v5)
    goto LABEL_5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUUI"));
  v6 = objc_claimAutoreleasedReturnValue();
  serviceUUID = v5->_serviceUUID;
  v5->_serviceUUID = (NSUUID *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SI"));
  v8 = objc_claimAutoreleasedReturnValue();
  serviceInstanceId = v5->_serviceInstanceId;
  v5->_serviceInstanceId = (NSNumber *)v8;

  v5->_serviceInstanceOrder = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SO"));
  v5->_serviceProperties = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SP"));
  v10 = (void *)MEMORY[0x1E0C99E60];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("LS"));
  v13 = objc_claimAutoreleasedReturnValue();
  linkedServices = v5->_linkedServices;
  v5->_linkedServices = (NSArray *)v13;

  v15 = (void *)MEMORY[0x1E0C99E60];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("CC"));
  v18 = objc_claimAutoreleasedReturnValue();
  cachedCharacteristics = v5->_cachedCharacteristics;
  v5->_cachedCharacteristics = (NSMutableArray *)v18;

  if (!v5->_serviceInstanceId)
    goto LABEL_5;
  if (v5->_serviceUUID)
    v20 = v5;
  else
LABEL_5:
    v20 = 0;

  return v20;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPBLEServiceCache cachedCharacteristics](self, "cachedCharacteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\nList of Characteristics: %tu\n"), objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HAPBLEServiceCache cachedCharacteristics](self, "cachedCharacteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v10));
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        ++v10;
        v11 = v5;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

  v12 = (void *)MEMORY[0x1E0CB3940];
  -[HAPBLEServiceCache serviceUUID](self, "serviceUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPBLEServiceCache serviceInstanceId](self, "serviceInstanceId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HAPBLEServiceCache serviceInstanceOrder](self, "serviceInstanceOrder");
  v16 = -[HAPBLEServiceCache serviceProperties](self, "serviceProperties");
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v16 & 1) == 0)
  {
    if ((v16 & 2) == 0)
      goto LABEL_10;
LABEL_14:
    objc_msgSend(v18, "stringByAppendingString:", CFSTR(": Hidden"));
    v24 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v24;
    if ((v16 & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(v17, "stringByAppendingString:", CFSTR(": Primary"));
  v23 = objc_claimAutoreleasedReturnValue();

  v18 = (void *)v23;
  if ((v16 & 2) != 0)
    goto LABEL_14;
LABEL_10:
  if ((v16 & 4) != 0)
  {
LABEL_11:
    objc_msgSend(v18, "stringByAppendingString:", CFSTR(": Configurable"));
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
LABEL_12:
  -[HAPBLEServiceCache linkedServices](self, "linkedServices");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("\n\nService Info:\n\tService UUID: %@,\n\tInstanceId: %@,\n\tOrder: %lu,\n\tProperties: %@,\n\tLinkedServices: %@,\n\t %@"), v13, v14, v15, v18, v20, v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NSUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (NSNumber)serviceInstanceId
{
  return self->_serviceInstanceId;
}

- (unint64_t)serviceInstanceOrder
{
  return self->_serviceInstanceOrder;
}

- (void)setServiceInstanceOrder:(unint64_t)a3
{
  self->_serviceInstanceOrder = a3;
}

- (unint64_t)serviceProperties
{
  return self->_serviceProperties;
}

- (void)setServiceProperties:(unint64_t)a3
{
  self->_serviceProperties = a3;
}

- (NSArray)linkedServices
{
  return self->_linkedServices;
}

- (void)setLinkedServices:(id)a3
{
  objc_storeStrong((id *)&self->_linkedServices, a3);
}

- (NSMutableArray)cachedCharacteristics
{
  return self->_cachedCharacteristics;
}

- (void)setCachedCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCharacteristics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCharacteristics, 0);
  objc_storeStrong((id *)&self->_linkedServices, 0);
  objc_storeStrong((id *)&self->_serviceInstanceId, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
