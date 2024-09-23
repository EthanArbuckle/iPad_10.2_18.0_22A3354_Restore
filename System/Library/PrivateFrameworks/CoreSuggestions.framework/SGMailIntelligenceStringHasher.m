@implementation SGMailIntelligenceStringHasher

- (SGMailIntelligenceStringHasher)initWithSaltValue:(id)a3
{
  id v5;
  SGMailIntelligenceStringHasher *v6;
  SGMailIntelligenceStringHasher *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGMailIntelligenceStringHasher;
  v6 = -[SGMailIntelligenceStringHasher init](&v9, sel_init);
  v7 = v6;
  if (v5 && v6)
    objc_storeStrong((id *)&v6->_salt, a3);

  return v7;
}

- (SGMailIntelligenceStringHasher)init
{
  void *v3;
  void *v4;
  SGMailIntelligenceStringHasher *v5;

  +[SGPersistentSaltProvider saltProviderFromKeyChainWithServiceIdentifier:accessGroup:](SGPersistentSaltProvider, "saltProviderFromKeyChainWithServiceIdentifier:accessGroup:", CFSTR("com.apple.suggestions.mail-interaction-log.salt"), CFSTR("com.apple.suggestions.mail-intelligence"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "salt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SGMailIntelligenceStringHasher initWithSaltValue:](self, "initWithSaltValue:", v4);

  return v5;
}

- (NSData)rotatingSalt
{
  NSData *rotatingSalt;
  void *v4;
  NSData *v5;
  NSData *v6;

  rotatingSalt = self->_rotatingSalt;
  if (!rotatingSalt)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGMailIntelligenceStringHasher rotatingSaltForDate:](SGMailIntelligenceStringHasher, "rotatingSaltForDate:", v4);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    v6 = self->_rotatingSalt;
    self->_rotatingSalt = v5;

    rotatingSalt = self->_rotatingSalt;
  }
  return rotatingSalt;
}

- (int64_t)truncatedSHA256:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (!self->_salt)
    return 0;
  v9[0] = self->_salt;
  v4 = a3;
  -[SGMailIntelligenceStringHasher rotatingSalt](self, "rotatingSalt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[SGMailIntelligenceStringHasher truncatedSHA256:salts:](SGMailIntelligenceStringHasher, "truncatedSHA256:salts:", v4, v6);

  return v7;
}

- (int64_t)hashedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (!self->_salt)
    return 0;
  v9[0] = self->_salt;
  v4 = a3;
  -[SGMailIntelligenceStringHasher rotatingSalt](self, "rotatingSalt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[SGMailIntelligenceStringHasher hashedString:salts:](SGMailIntelligenceStringHasher, "hashedString:salts:", v4, v6);

  return v7;
}

- (int64_t)unrotatedHashedString:(id)a3 withHashSize:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  NSData *salt;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!self->_salt)
    return 0;
  salt = self->_salt;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &salt, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[SGMailIntelligenceStringHasher hashedString:salts:](SGMailIntelligenceStringHasher, "hashedString:salts:", v6, v7, salt, v12);

  v9 = v8 % a4;
  return v9;
}

- (id)unrotatedHashedStrings:(id)a3 withHashSize:(unint64_t)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__SGMailIntelligenceStringHasher_unrotatedHashedStrings_withHashSize___block_invoke;
  v5[3] = &unk_1E4761D18;
  v5[4] = self;
  v5[5] = a4;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)hashedUserId
{
  return -[SGMailIntelligenceStringHasher hashedString:](self, "hashedString:", CFSTR("USER-ID"));
}

- (void)setRotatingSalt:(id)a3
{
  objc_storeStrong((id *)&self->_rotatingSalt, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotatingSalt, 0);
  objc_storeStrong((id *)&self->_salt, 0);
}

uint64_t __70__SGMailIntelligenceStringHasher_unrotatedHashedStrings_withHashSize___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "unrotatedHashedString:withHashSize:", a2, *(_QWORD *)(a1 + 40)));
}

+ (id)rotatingSaltForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "component:fromDate:", 8, v4);

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "component:fromDate:", 4, v4);

  v9 = (v6 - 1) & 1;
  if (v6 < 1)
    v9 = -v9;
  v10 = __OFSUB__(v6, v9);
  v11 = v6 - v9;
  if (v11 < 0 != v10)
    ++v11;
  v12 = 6 * v8 + (v11 >> 1) - 12120;
  v13 = v12 & 0x7F;
  v15 = -v12;
  v14 = v15 < 0;
  v16 = v15 & 0x7F;
  if (v14)
    LOBYTE(v17) = v13;
  else
    v17 = -v16;
  v19 = v17;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v19, 1);
}

+ (int64_t)truncatedSHA256:(id)a3 salts:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  void *v15;
  int64_t v16;
  int64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CC_SHA256_CTX c;
  _BYTE v24[128];
  _OWORD md[2];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  memset(md, 0, sizeof(md));
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "length"))
        {
          v13 = objc_retainAutorelease(v12);
          CC_SHA256_Update(&c, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v9);
  }

  v14 = objc_retainAutorelease(v5);
  CC_SHA256_Update(&c, (const void *)objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"));
  CC_SHA256_Final((unsigned __int8 *)md, &c);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);
  v18 = 0;
  objc_msgSend(v15, "getBytes:length:", &v18, 8);
  v16 = v18;

  return v16;
}

+ (int64_t)hashedString:(id)a3 salts:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;

  v5 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[SGMailIntelligenceStringHasher truncatedSHA256:salts:](SGMailIntelligenceStringHasher, "truncatedSHA256:salts:", v6, v5);

  return v7;
}

@end
