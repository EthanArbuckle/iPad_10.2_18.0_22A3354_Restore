@implementation CNAutocompleteNameComponents

+ (CNAutocompleteNameComponents)nameComponentsWithFirstName:(id)a3 lastName:(id)a4 nickname:(id)a5 nameSuffix:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init((Class)a1);
  v15 = objc_msgSend(v13, "copy");

  v16 = (void *)v14[1];
  v14[1] = v15;

  v17 = objc_msgSend(v12, "copy");
  v18 = (void *)v14[2];
  v14[2] = v17;

  v19 = objc_msgSend(v11, "copy");
  v20 = (void *)v14[3];
  v14[3] = v19;

  v21 = objc_msgSend(v10, "copy");
  v22 = (void *)v14[4];
  v14[4] = v21;

  return (CNAutocompleteNameComponents *)v14;
}

+ (id)contactKeys
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C966C0];
  v5[0] = *MEMORY[0x1E0C966D0];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0C96798];
  v5[2] = *MEMORY[0x1E0C967A0];
  v5[3] = v3;
  v5[4] = *MEMORY[0x1E0C966B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  NSString *firstName;
  int v6;
  NSString *lastName;
  NSString *nickname;
  NSString *nameSuffix;

  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      firstName = self->_firstName;
      if (!((unint64_t)firstName | *((_QWORD *)a3 + 1))
        || (v6 = -[NSString isEqual:](firstName, "isEqual:")) != 0)
      {
        lastName = self->_lastName;
        if (!((unint64_t)lastName | *((_QWORD *)a3 + 2))
          || (v6 = -[NSString isEqual:](lastName, "isEqual:")) != 0)
        {
          nickname = self->_nickname;
          if (!((unint64_t)nickname | *((_QWORD *)a3 + 3))
            || (v6 = -[NSString isEqual:](nickname, "isEqual:")) != 0)
          {
            nameSuffix = self->_nameSuffix;
            if (!((unint64_t)nameSuffix | *((_QWORD *)a3 + 4))
              || (v6 = -[NSString isEqual:](nameSuffix, "isEqual:")) != 0)
            {
              LOBYTE(v6) = 1;
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_firstName);
  v4 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_lastName) - v3 + 32 * v3;
  v5 = objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_nickname) - v4 + 32 * v4;
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_nameSuffix) - v5 + 32 * v5 + 15699857;
}

- (NSString)firstName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)lastName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)nickname
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)nameSuffix
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
