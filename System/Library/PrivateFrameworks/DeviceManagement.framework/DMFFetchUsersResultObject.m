@implementation DMFFetchUsersResultObject

- (DMFFetchUsersResultObject)initWithUsers:(id)a3
{
  id v4;
  DMFFetchUsersResultObject *v5;
  uint64_t v6;
  NSArray *users;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchUsersResultObject;
  v5 = -[CATTaskResultObject init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    users = v5->_users;
    v5->_users = (NSArray *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchUsersResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFFetchUsersResultObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *users;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DMFFetchUsersResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("users"));
    v9 = objc_claimAutoreleasedReturnValue();
    users = v5->_users;
    v5->_users = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFFetchUsersResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFFetchUsersResultObject users](self, "users", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("users"));

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[DMFFetchUsersResultObject users](self, "users");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("["));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    v9 = &stru_1E6ED9BA0;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "appendFormat:", CFSTR("%@\n%@"), v9, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
        v9 = CFSTR(",");
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v9 = CFSTR(",");
    }
    while (v7);
  }

  objc_msgSend(v4, "appendString:", CFSTR("\n]"));
  return v4;
}

uint64_t __40__DMFFetchUsersResultObject_description__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "username");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v3, "compare:", v4);
  return v5;
}

- (NSArray)users
{
  return self->_users;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_users, 0);
}

@end
