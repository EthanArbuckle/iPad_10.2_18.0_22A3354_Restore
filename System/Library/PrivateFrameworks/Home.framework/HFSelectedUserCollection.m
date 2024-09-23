@implementation HFSelectedUserCollection

+ (id)allUsersCollection
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithType:specificUsers:", 0, v3);

  return v4;
}

+ (id)currentUserCollection
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithType:specificUsers:", 1, v3);

  return v4;
}

+ (HFSelectedUserCollection)collectionWithSpecificUsers:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:specificUsers:", 2, v4);

  return (HFSelectedUserCollection *)v5;
}

- (HFSelectedUserCollection)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithType_specificUsers_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSelectedUserCollection.m"), 56, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFSelectedUserCollection init]",
    v5);

  return 0;
}

- (HFSelectedUserCollection)initWithType:(unint64_t)a3 specificUsers:(id)a4
{
  id v6;
  HFSelectedUserCollection *v7;
  HFSelectedUserCollection *v8;
  NSSet *v9;
  NSSet *specificUsers;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFSelectedUserCollection;
  v7 = -[HFSelectedUserCollection init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    if (v6)
    {
      v9 = (NSSet *)v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v9 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    specificUsers = v8->_specificUsers;
    v8->_specificUsers = v9;

  }
  return v8;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_227 != -1)
    dispatch_once(&_MergedGlobals_227, &__block_literal_global_13_3);
  return (NAIdentity *)(id)qword_1ED378E10;
}

void __39__HFSelectedUserCollection_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendUnsignedIntegerCharacteristic:", &__block_literal_global_18_0);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_20_0);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ED378E10;
  qword_1ED378E10 = v3;

}

uint64_t __39__HFSelectedUserCollection_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type");
}

uint64_t __39__HFSelectedUserCollection_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "specificUsers");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (id)resolveSelectedUsersWithHome:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = -[HFSelectedUserCollection type](self, "type");
  switch(v5)
  {
    case 0uLL:
      v7 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v4, "hf_allUsersIncludingCurrentUser");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithArray:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = (void *)v9;

      break;
    case 1uLL:
      v10 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v4, "currentUser");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithObject:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      -[HFSelectedUserCollection specificUsers](self, "specificUsers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

+ (HFSelectedUserCollection)collectionWithResolvedUsers:(id)a3 inHome:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "hf_allUsersIncludingCurrentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "isEqualToSet:", v9);

  if (v10)
  {
    +[HFSelectedUserCollection allUsersCollection](HFSelectedUserCollection, "allUsersCollection");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "currentUser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v5, "isEqualToSet:", v14);

    if (v15)
      +[HFSelectedUserCollection currentUserCollection](HFSelectedUserCollection, "currentUserCollection");
    else
      +[HFSelectedUserCollection collectionWithSpecificUsers:](HFSelectedUserCollection, "collectionWithSpecificUsers:", v5);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v11;

  return (HFSelectedUserCollection *)v16;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSSet)specificUsers
{
  return self->_specificUsers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specificUsers, 0);
}

@end
