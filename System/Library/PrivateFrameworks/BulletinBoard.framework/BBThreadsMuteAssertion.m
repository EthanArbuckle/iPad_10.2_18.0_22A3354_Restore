@implementation BBThreadsMuteAssertion

+ (id)threadsMuteAssertion
{
  BBThreadsMuteAssertion *v2;

  v2 = [BBThreadsMuteAssertion alloc];
  return -[BBThreadsMuteAssertion _initWithExpirationDateByThreadID:](v2, "_initWithExpirationDateByThreadID:", MEMORY[0x24BDBD1B8]);
}

+ (id)threadsMuteAssertionWithExpirationDateByThreadID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[BBThreadsMuteAssertion _initWithExpirationDateByThreadID:]([BBThreadsMuteAssertion alloc], "_initWithExpirationDateByThreadID:", v3);

  return v4;
}

- (id)_initWithExpirationDateByThreadID:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BBThreadsMuteAssertion;
  v5 = -[BBMuteAssertion _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    v7 = (void *)v5[1];
    v5[1] = v6;

  }
  return v5;
}

- (NSDictionary)expirationDateByThreadID
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_mutableExpirationDateByThreadID, "copy");
}

- (BOOL)isActiveForThreadIdentifier:(id)a3 currentDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_mutableExpirationDateByThreadID, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  else
  {
    v8 = 0;
    if (!v7)
      goto LABEL_4;
  }
  v9 = v7;
LABEL_7:
  v10 = v9;
  if (v8)
    v11 = objc_msgSend(v8, "compare:", v9) == 1;
  else
    v11 = 0;

  return v11;
}

- (void)setMutedUntilDate:(id)a3 forThreadIdentifier:(id)a4
{
  -[NSMutableDictionary setValue:forKey:](self->_mutableExpirationDateByThreadID, "setValue:forKey:", a3, a4);
}

- (void)setUnmutedForThreadIdentifier:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_mutableExpirationDateByThreadID, "removeObjectForKey:", a3);
}

- (void)getNextExpirationDate:(id *)a3 wasPurged:(BOOL *)a4 currentDate:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id *v18;
  BOOL *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v18 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v19 = a4;
  *a4 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary allKeys](self->_mutableExpirationDateByThreadID, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[NSMutableDictionary valueForKey:](self->_mutableExpirationDateByThreadID, "valueForKey:", v14, v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[BBThreadsMuteAssertion isActiveForThreadIdentifier:currentDate:](self, "isActiveForThreadIdentifier:currentDate:", v14, v7))
        {
          if (!v11 || objc_msgSend(v15, "compare:", v11) == -1)
          {
            v16 = v15;

            v11 = v16;
          }
        }
        else
        {
          -[NSMutableDictionary removeObjectForKey:](self->_mutableExpirationDateByThreadID, "removeObjectForKey:", v14);
          *v19 = 1;
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  v17 = objc_retainAutorelease(v11);
  *v18 = v17;

}

- (NSSet)threadIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[NSMutableDictionary allKeys](self->_mutableExpirationDateByThreadID, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (unint64_t)hash
{
  NSMutableDictionary *mutableExpirationDateByThreadID;
  unint64_t v3;
  _QWORD v5[6];
  _QWORD v6[4];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 31;
  mutableExpirationDateByThreadID = self->_mutableExpirationDateByThreadID;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__BBThreadsMuteAssertion_hash__block_invoke;
  v5[3] = &unk_24C564D30;
  v5[4] = &v7;
  v5[5] = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mutableExpirationDateByThreadID, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __30__BBThreadsMuteAssertion_hash__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v7 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "hash") + v6 * v5;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v10 = objc_msgSend(v7, "hash");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10 + v9 * v8;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  id v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && (v4 = v3) != 0)
  {
    v5 = v4;
    v6 = BSEqualDictionaries();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; expirationDateByThreadID: %@>"),
               objc_opt_class(),
               self,
               self->_mutableExpirationDateByThreadID);
}

- (id)toUNCMuteAssertion
{
  return (id)objc_msgSend(MEMORY[0x24BEBF4B0], "threadsMuteAssertionWithExpirationDateByThreadID:", self->_mutableExpirationDateByThreadID);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSMutableDictionary mutableCopy](self->_mutableExpirationDateByThreadID, "mutableCopy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BBThreadsMuteAssertion;
  v4 = a3;
  -[BBMuteAssertion encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_mutableExpirationDateByThreadID, CFSTR("expirationDateByThreadID"), v5.receiver, v5.super_class);

}

- (BBThreadsMuteAssertion)initWithCoder:(id)a3
{
  id v4;
  BBThreadsMuteAssertion *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *mutableExpirationDateByThreadID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BBThreadsMuteAssertion;
  v5 = -[BBMuteAssertion initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    BBAllowedClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("expirationDateByThreadID"));
    v7 = objc_claimAutoreleasedReturnValue();
    mutableExpirationDateByThreadID = v5->_mutableExpirationDateByThreadID;
    v5->_mutableExpirationDateByThreadID = (NSMutableDictionary *)v7;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableExpirationDateByThreadID, 0);
}

@end
