@implementation CBMutableService

- (CBMutableService)initWithType:(CBUUID *)UUID primary:(BOOL)isPrimary
{
  _BOOL8 v4;
  CBUUID *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  CBMutableService *v11;
  CBMutableService *v12;
  objc_super v14;

  v4 = isPrimary;
  v7 = UUID;
  -[CBUUID data](v7, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length") != 2)
  {
    -[CBUUID data](v7, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10 == 16)
      goto LABEL_5;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CBService.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("UUID.data.length == 2 || UUID.data.length == 16"));
  }

LABEL_5:
  v14.receiver = self;
  v14.super_class = (Class)CBMutableService;
  v11 = -[CBAttribute initWithUUID:](&v14, sel_initWithUUID_, v7);
  v12 = v11;
  if (v11)
  {
    -[CBService setIsPrimary:](v11, "setIsPrimary:", v4);
    -[CBMutableService addObserver:forKeyPath:options:context:](v12, "addObserver:forKeyPath:options:context:", v12, CFSTR("characteristics"), 0, 0);
  }

  return v12;
}

- (CBMutableService)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CBMutableService *v8;
  uint64_t v9;
  NSNumber *ID;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CBUUID UUIDWithData:](CBUUID, "UUIDWithData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CBMutableService initWithType:primary:](self, "initWithType:primary:", v6, objc_msgSend(v7, "BOOLValue"));

  if (v8)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCBMsgArgAttributeID"));
    v9 = objc_claimAutoreleasedReturnValue();
    ID = v8->_ID;
    v8->_ID = (NSNumber *)v9;

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[CBMutableService removeObserver:forKeyPath:](self, "removeObserver:forKeyPath:", self, CFSTR("characteristics"));
  v3.receiver = self;
  v3.super_class = (Class)CBMutableService;
  -[CBMutableService dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("characteristics"), a4, a5, a6))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[CBService characteristics](self, "characteristics", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "setService:", self);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void)handlePowerNotOn
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CBService characteristics](self, "characteristics", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "handlePowerNotOn");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (-[CBService isPrimary](self, "isPrimary"))
    v5 = "YES";
  else
    v5 = "NO";
  -[CBAttribute UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBService includedServices](self, "includedServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBService characteristics](self, "characteristics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p Primary = %s, UUID = %@, Included Services = %@, Characteristics = %@>"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSNumber)ID
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ID, 0);
}

@end
