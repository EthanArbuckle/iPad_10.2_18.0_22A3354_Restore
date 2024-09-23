@implementation CBMutableCharacteristic

- (CBMutableCharacteristic)initWithType:(CBUUID *)UUID properties:(CBCharacteristicProperties)properties value:(NSData *)value permissions:(CBAttributePermissions)permissions
{
  NSData *v10;
  CBMutableCharacteristic *v11;
  CBMutableCharacteristic *v12;
  NSMutableArray *v13;
  NSMutableArray *subscribedCentrals;
  objc_super v16;

  v10 = value;
  v16.receiver = self;
  v16.super_class = (Class)CBMutableCharacteristic;
  v11 = -[CBAttribute initWithUUID:](&v16, sel_initWithUUID_, UUID);
  v12 = v11;
  if (v11)
  {
    -[CBCharacteristic setValue:](v11, "setValue:", v10);
    v12->_permissions = permissions;
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    subscribedCentrals = v12->_subscribedCentrals;
    v12->_subscribedCentrals = v13;

    -[CBCharacteristic setProperties:](v12, "setProperties:", properties);
    -[CBMutableCharacteristic addObserver:forKeyPath:options:context:](v12, "addObserver:forKeyPath:options:context:", v12, CFSTR("properties"), 0, 0);
    -[CBMutableCharacteristic addObserver:forKeyPath:options:context:](v12, "addObserver:forKeyPath:options:context:", v12, CFSTR("descriptors"), 0, 0);
  }

  return v12;
}

- (CBMutableCharacteristic)initWithService:(id)a3 dictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CBMutableCharacteristic *v13;
  uint64_t v14;
  NSNumber *ID;

  v5 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CBUUID UUIDWithData:](CBUUID, "UUIDWithData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgCharacteristicProperties"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAttributePermissions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CBMutableCharacteristic initWithType:properties:value:permissions:](self, "initWithType:properties:value:permissions:", v7, v9, v12, v11);
  if (v13)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAttributeID"));
    v14 = objc_claimAutoreleasedReturnValue();
    ID = v13->_ID;
    v13->_ID = (NSNumber *)v14;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[CBMutableCharacteristic removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("descriptors"));
  -[CBMutableCharacteristic removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("properties"));
  v3.receiver = self;
  v3.super_class = (Class)CBMutableCharacteristic;
  -[CBMutableCharacteristic dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  int v12;
  unint64_t v13;
  uint64_t i;
  CBMutableCharacteristic *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  SEL v26;
  id v27;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("descriptors")))
  {
    v26 = a2;
    v27 = v8;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[CBCharacteristic descriptors](self, "descriptors");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = 0;
      v29 = *(_QWORD *)v31;
      v13 = 0x1E53FE000;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          while (1)
          {
            v15 = self;
            if (*(_QWORD *)v31 != v29)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(v16, "UUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v13 + 3008), "UUIDWithString:", CFSTR("2901"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v17, "isEqual:", v18);

            if (!v19)
              break;
            self = v15;
            if ((v11 & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v26, v15, CFSTR("CBCharacteristic.m"), 194, CFSTR("Cannot have more than one User Description descriptor per characteristic"));
              v11 = 1;
              goto LABEL_17;
            }
            v11 = 1;
LABEL_13:
            v13 = 0x1E53FE000uLL;
            objc_msgSend(v16, "setCharacteristic:", self);
            if (v10 == ++i)
              goto LABEL_4;
          }
          objc_msgSend(v16, "UUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v13 + 3008), "UUIDWithString:", CFSTR("2904"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "isEqual:", v21);

          if ((v22 & v12) != 1)
          {
            v12 |= v22;
            self = v15;
            goto LABEL_13;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          self = v15;
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v26, v15, CFSTR("CBCharacteristic.m"), 198, CFSTR("Cannot have more than one Format descriptor per characteristic"));
          v12 = 1;
LABEL_17:
          v13 = 0x1E53FE000;

          objc_msgSend(v16, "setCharacteristic:", self);
        }
LABEL_4:
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v10);
    }

    v8 = v27;
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("properties")))
  {
    if ((-[CBCharacteristic properties](self, "properties") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCharacteristic.m"), 206, CFSTR("CBCharacteristicPropertyBroadcast is not allowed"));

      if ((-[CBCharacteristic properties](self, "properties") & 0x80) == 0)
        goto LABEL_24;
    }
    else if ((-[CBCharacteristic properties](self, "properties") & 0x80) == 0)
    {
      goto LABEL_24;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBCharacteristic.m"), 207, CFSTR("CBCharacteristicPropertyExtendedProperties is not allowed"));

  }
LABEL_24:

}

- (BOOL)handleCentralSubscribed:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = -[NSMutableArray containsObject:](self->_subscribedCentrals, "containsObject:", v4);
  if ((v5 & 1) == 0)
    -[NSMutableArray addObject:](self->_subscribedCentrals, "addObject:", v4);

  return v5 ^ 1;
}

- (BOOL)handleCentralUnsubscribed:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = -[NSMutableArray containsObject:](self->_subscribedCentrals, "containsObject:", v4);
  if (v5)
    -[NSMutableArray removeObject:](self->_subscribedCentrals, "removeObject:", v4);

  return v5;
}

- (void)handlePowerNotOn
{
  -[NSMutableArray removeAllObjects](self->_subscribedCentrals, "removeAllObjects");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  CBCharacteristicProperties v7;
  CBAttributePermissions v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CBAttribute UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBCharacteristic value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CBCharacteristic properties](self, "properties");
  v8 = -[CBMutableCharacteristic permissions](self, "permissions");
  -[CBCharacteristic descriptors](self, "descriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p UUID = %@, Value = %@, Properties = 0x%lX, Permissions = 0x%lX, Descriptors = %@, SubscribedCentrals = %@>"), v4, self, v5, v6, v7, v8, v9, self->_subscribedCentrals);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSArray)subscribedCentrals
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (CBAttributePermissions)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(CBAttributePermissions)permissions
{
  self->_permissions = permissions;
}

- (NSNumber)ID
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ID, 0);
  objc_storeStrong((id *)&self->_subscribedCentrals, 0);
}

@end
