@implementation EAEmailAddressSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalSet, 0);
}

- (void)unionSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[EAEmailAddressSet internalSet](self, "internalSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internalSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v6);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)EAEmailAddressSet;
    -[EAEmailAddressSet unionSet:](&v7, sel_unionSet_, v4);
  }

}

- (void)addObject:(id)a3
{
  void *v5;
  _EAEmailAddress *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EAEmailAddressSet.m"), 173, CFSTR("Email must be string"));

  }
  -[EAEmailAddressSet internalSet](self, "internalSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_EAEmailAddress initWithEmailAddress:]([_EAEmailAddress alloc], "initWithEmailAddress:", v8);
  objc_msgSend(v5, "addObject:", v6);

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  EAEmailAddressSet *v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(EAEmailAddressSet);
  -[EAEmailAddressSet internalSet](self, "internalSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopyWithZone:", a3);
  -[EAEmailAddressSet setInternalSet:](v5, "setInternalSet:", v7);

  return v5;
}

- (id)member:(id)a3
{
  id v5;
  _EAEmailAddress *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EAEmailAddressSet.m"), 111, CFSTR("Email must be string"));

  }
  v6 = -[_EAEmailAddress initWithEmailAddress:]([_EAEmailAddress alloc], "initWithEmailAddress:", v5);
  -[EAEmailAddressSet internalSet](self, "internalSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "member:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emailAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSMutableSet)internalSet
{
  return self->_internalSet;
}

- (EAEmailAddressSet)init
{
  EAEmailAddressSet *v2;
  uint64_t v3;
  NSMutableSet *internalSet;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EAEmailAddressSet;
  v2 = -[EAEmailAddressSet init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", 0);
    internalSet = v2->_internalSet;
    v2->_internalSet = (NSMutableSet *)v3;

  }
  return v2;
}

- (void)setInternalSet:(id)a3
{
  objc_storeStrong((id *)&self->_internalSet, a3);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__EAEmailAddressSet_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, block);
  return (OS_os_log *)(id)log_log_0;
}

void __24__EAEmailAddressSet_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;

}

+ (id)set
{
  return objc_alloc_init((Class)a1);
}

+ (id)setWithCapacity:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCapacity:", a3);
}

- (EAEmailAddressSet)initWithCapacity:(unint64_t)a3
{
  EAEmailAddressSet *v4;
  uint64_t v5;
  NSMutableSet *internalSet;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EAEmailAddressSet;
  v4 = -[EAEmailAddressSet init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", a3);
    internalSet = v4->_internalSet;
    v4->_internalSet = (NSMutableSet *)v5;

  }
  return v4;
}

- (EAEmailAddressSet)initWithSerializedRepresentation:(id)a3
{
  id v4;
  void *v5;
  EAEmailAddressSet *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v4, 0);
  v6 = -[EAEmailAddressSet initWithCoder:](self, "initWithCoder:", v5);

  return v6;
}

- (NSData)serializedRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
  -[EAEmailAddressSet encodeWithCoder:](self, "encodeWithCoder:", v3);
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EAEmailAddressSet)initWithCoder:(id)a3
{
  id v4;
  EAEmailAddressSet *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableSet *internalSet;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EAEmailAddressSet;
  v5 = -[EAEmailAddressSet init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("EFPropertyKey_internalSet"));
    v9 = objc_claimAutoreleasedReturnValue();
    internalSet = v5->_internalSet;
    v5->_internalSet = (NSMutableSet *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EAEmailAddressSet;
  -[EAEmailAddressSet encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[EAEmailAddressSet internalSet](self, "internalSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_internalSet"));

}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[EAEmailAddressSet internalSet](self, "internalSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)intersectsSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count"))
  {
    -[EAEmailAddressSet internalSet](self, "internalSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internalSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "intersectsSet:", v6);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)EAEmailAddressSet;
    v7 = -[EAEmailAddressSet intersectsSet:](&v9, sel_intersectsSet_, v4);
  }

  return v7;
}

- (BOOL)isSubsetOfSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "count"))
  {
    -[EAEmailAddressSet internalSet](self, "internalSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internalSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isSubsetOfSet:", v6);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)EAEmailAddressSet;
    v7 = -[EAEmailAddressSet isSubsetOfSet:](&v9, sel_isSubsetOfSet_, v4);
  }

  return v7;
}

- (BOOL)isEqualToSet:(id)a3
{
  id v4;
  unint64_t v5;
  unsigned __int8 v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[EAEmailAddressSet count](self, "count"), v5 == objc_msgSend(v4, "count")))
  {
    v6 = -[EAEmailAddressSet isSubsetOfSet:](self, "isSubsetOfSet:", v4);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)EAEmailAddressSet;
    v6 = -[EAEmailAddressSet isEqualToSet:](&v9, sel_isEqualToSet_, v4);
  }
  v7 = v6;

  return v7;
}

- (id)allObjects
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[EAEmailAddressSet count](self, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[EAEmailAddressSet internalSet](self, "internalSet", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "emailAddress");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)objectEnumerator
{
  return -[_EAEmailAddressSetEnumerator initWithSet:]([_EAEmailAddressSetEnumerator alloc], "initWithSet:", self);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;
  uint64_t i;
  id v11;

  -[EAEmailAddressSet internalSet](self, "internalSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      v11 = a3->var1[i];
      a3->var1[i] = (id)objc_msgSend(v11, "emailAddress");

    }
  }
  return v9;
}

- (void)removeObject:(id)a3
{
  void *v5;
  _EAEmailAddress *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EAEmailAddressSet.m"), 178, CFSTR("Email must be string"));

  }
  -[EAEmailAddressSet internalSet](self, "internalSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_EAEmailAddress initWithEmailAddress:]([_EAEmailAddress alloc], "initWithEmailAddress:", v8);
  objc_msgSend(v5, "removeObject:", v6);

}

- (void)removeAllObjects
{
  id v2;

  -[EAEmailAddressSet internalSet](self, "internalSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)minusSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[EAEmailAddressSet internalSet](self, "internalSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "internalSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "minusSet:", v6);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)EAEmailAddressSet;
    -[EAEmailAddressSet minusSet:](&v7, sel_minusSet_, v4);
  }

}

- (void)intersectSet:(id)a3
{
  EAEmailAddressSet *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = (EAEmailAddressSet *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EAEmailAddressSet internalSet](self, "internalSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[EAEmailAddressSet internalSet](v4, "internalSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "intersectSet:", v6);

    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)EAEmailAddressSet;
      -[EAEmailAddressSet intersectSet:](&v7, sel_intersectSet_, v4);
    }
  }

}

- (void)setSet:(id)a3
{
  EAEmailAddressSet *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = (EAEmailAddressSet *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EAEmailAddressSet internalSet](v4, "internalSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");
      -[EAEmailAddressSet setInternalSet:](self, "setInternalSet:", v6);

      -[EAEmailAddressSet internalSet](self, "internalSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[EAEmailAddressSet internalSet](v4, "internalSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unionSet:", v8);

    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)EAEmailAddressSet;
      -[EAEmailAddressSet setSet:](&v9, sel_setSet_, v4);
    }
  }

}

- (void)initWithSerializedRepresentation:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_20A037000, log, OS_LOG_TYPE_FAULT, "Exception occured: %{public}@\nSymbols:\n%{public}@", buf, 0x16u);

}

@end
