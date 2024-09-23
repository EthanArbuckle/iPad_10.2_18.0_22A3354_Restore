@implementation CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary

+ (NSSet)allowedStatusKeys
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
}

+ (id)build
{
  return (id)objc_opt_new();
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSDictionary *v16;
  NSDictionary *statusANY;
  BOOL v18;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v13 = objc_opt_class();
        v21 = 0;
        -[CEMPayloadBase loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:](self, "loadDictionaryFromDictionary:withKey:classType:isRequired:defaultValue:error:", v7, v12, v13, 1, 0, &v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v21;
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);

        if (v15)
        {

          if (a4)
          {
            v15 = objc_retainAutorelease(v15);
            v18 = 0;
            *a4 = v15;
          }
          else
          {
            v18 = 0;
          }
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = (NSDictionary *)objc_msgSend(v6, "copy");
  statusANY = self->_statusANY;
  self->_statusANY = v16;

  v15 = 0;
  v18 = 1;
LABEL_13:

  return v18;
}

- (id)serializePayload
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_statusANY;
  v5 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_statusANY, "objectForKeyedSubscript:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CEMPayloadBase serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:](self, "serializeDictionaryIntoDictionary:withKey:withValue:dictSerializer:isRequired:defaultValue:", v3, v9, v10, &__block_literal_global_192, 1, 0);

      }
      v6 = -[NSDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CEMDeviceListRestrictionsCommand_StatusIntersectionDictionary;
  v4 = -[CEMPayloadBase copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSDictionary copy](self->_statusANY, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (NSDictionary)statusANY
{
  return self->_statusANY;
}

- (void)setStatusANY:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusANY, 0);
}

@end
