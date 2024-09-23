@implementation CDBDefaultAccountInfo

- (CDBDefaultAccountInfo)initWithStore:(void *)a3
{
  CDBDefaultAccountInfo *v4;
  CDBDefaultAccountInfo *v5;
  id v6;
  uint64_t v7;
  NSArray *accountUserAddresses;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CDBDefaultAccountInfo;
  v4 = -[CDBDefaultAccountInfo init](&v10, sel_init);
  v5 = v4;
  if (a3 && v4)
  {
    v6 = CalStoreCopyCachedExternalInfo((uint64_t)a3);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ownerAddresses"));
    v7 = objc_claimAutoreleasedReturnValue();
    accountUserAddresses = v5->_accountUserAddresses;
    v5->_accountUserAddresses = (NSArray *)v7;

  }
  return v5;
}

- (BOOL)addressIsAccountOwner:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CDBDefaultAccountInfo addressURLIsAccountOwner:](self, "addressURLIsAccountOwner:", v5))
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mailto:%@"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[CDBDefaultAccountInfo addressURLIsAccountOwner:](self, "addressURLIsAccountOwner:", v9);
  }

  return v6;
}

- (BOOL)addressURLIsAccountOwner:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_accountUserAddresses;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(MEMORY[0x1E0D09C10], "compareAddressURL:localString:", v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10) & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountUserAddresses, 0);
}

@end
