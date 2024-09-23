@implementation HDDatabaseTransactionContext

- (HDDatabaseTransactionContext)init
{
  return (HDDatabaseTransactionContext *)-[HDDatabaseTransactionContext _initWithOptions:journalType:cacheScope:assertions:statistics:]((id *)&self->super.isa, 0, 0, 0, 0, 0);
}

- (id)_initWithOptions:(void *)a3 journalType:(void *)a4 cacheScope:(void *)a5 assertions:(void *)a6 statistics:
{
  id v11;
  id v12;
  id *v13;
  uint64_t v14;
  id v15;
  objc_super v17;

  v11 = a5;
  v12 = a6;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)HDDatabaseTransactionContext;
    v13 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v13;
    if (v13)
    {
      v13[2] = a4;
      v13[3] = a2;
      v13[1] = a3;
      if (objc_msgSend(v11, "count"))
      {
        v14 = objc_msgSend(v11, "mutableCopy");
        v15 = a1[4];
        a1[4] = (id)v14;

      }
      objc_storeStrong(a1 + 5, a6);
    }
  }

  return a1;
}

- (id)_initWithOptions:(unint64_t)a3
{
  return -[HDDatabaseTransactionContext _initWithOptions:journalType:cacheScope:assertions:statistics:]((id *)&self->super.isa, (void *)a3, 0, 0, 0, 0);
}

- (id)copyForWriting
{
  void *v4;

  if (-[HDDatabaseTransactionContext requiresWrite](self, "requiresWrite"))
    return (id)-[HDDatabaseTransactionContext copy](self, "copy");
  v4 = (void *)-[HDDatabaseTransactionContext mutableCopy](self, "mutableCopy");
  objc_msgSend(v4, "setRequiresWrite:", 1);
  return v4;
}

- (id)copyForWritingProtectedData
{
  void *v4;

  if (-[HDDatabaseTransactionContext requiresWrite](self, "requiresWrite")
    && -[HDDatabaseTransactionContext requiresProtectedData](self, "requiresProtectedData"))
  {
    return (id)-[HDDatabaseTransactionContext copy](self, "copy");
  }
  v4 = (void *)-[HDDatabaseTransactionContext mutableCopy](self, "mutableCopy");
  objc_msgSend(v4, "setRequiresWrite:", 1);
  objc_msgSend(v4, "setRequiresProtectedData:", 1);
  return v4;
}

- (id)copyForReadingProtectedData
{
  void *v4;

  if (-[HDDatabaseTransactionContext requiresProtectedData](self, "requiresProtectedData"))
    return (id)-[HDDatabaseTransactionContext copy](self, "copy");
  v4 = (void *)-[HDDatabaseTransactionContext mutableCopy](self, "mutableCopy");
  objc_msgSend(v4, "setRequiresProtectedData:", 1);
  return v4;
}

+ (id)_cachedContextForOptions:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_self();
  if (qword_1ED552308 != -1)
    dispatch_once(&qword_1ED552308, &__block_literal_global_105);
  v3 = (void *)_MergedGlobals_207;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __57__HDDatabaseTransactionContext__cachedContextForOptions___block_invoke()
{
  id v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v6[0] = &unk_1E6DFC980;
  v0 = -[HDDatabaseTransactionContext _initWithOptions:]([HDDatabaseTransactionContext alloc], "_initWithOptions:", 0);
  v7[0] = v0;
  v6[1] = &unk_1E6DFC998;
  v1 = -[HDDatabaseTransactionContext _initWithOptions:]([HDDatabaseTransactionContext alloc], "_initWithOptions:", 1);
  v7[1] = v1;
  v6[2] = &unk_1E6DFC9B0;
  v2 = -[HDDatabaseTransactionContext _initWithOptions:]([HDDatabaseTransactionContext alloc], "_initWithOptions:", 2);
  v7[2] = v2;
  v6[3] = &unk_1E6DFC9C8;
  v3 = -[HDDatabaseTransactionContext _initWithOptions:]([HDDatabaseTransactionContext alloc], "_initWithOptions:", 3);
  v7[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_MergedGlobals_207;
  _MergedGlobals_207 = v4;

}

+ (id)contextForWriting
{
  return +[HDDatabaseTransactionContext _cachedContextForOptions:]((uint64_t)a1, 1);
}

+ (id)contextForWritingProtectedData
{
  return +[HDDatabaseTransactionContext _cachedContextForOptions:]((uint64_t)a1, 3);
}

+ (id)contextForReading
{
  return +[HDDatabaseTransactionContext _cachedContextForOptions:]((uint64_t)a1, 0);
}

+ (id)contextForReadingProtectedData
{
  return +[HDDatabaseTransactionContext _cachedContextForOptions:]((uint64_t)a1, 2);
}

+ (id)highPriorityContext
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithOptions:", 16);
}

+ (id)contextForAccessibilityAssertion:(id)a3
{
  id v3;
  HDDatabaseTransactionContext *v4;
  id *p_isa;
  void *v6;
  id *v7;

  v3 = a3;
  v4 = [HDDatabaseTransactionContext alloc];
  p_isa = (id *)&v4->super.isa;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HDDatabaseTransactionContext _initWithOptions:journalType:cacheScope:assertions:statistics:](p_isa, 0, 0, 0, v6, 0);

  }
  else
  {
    v7 = -[HDDatabaseTransactionContext _initWithOptions:journalType:cacheScope:assertions:statistics:]((id *)&v4->super.isa, 0, 0, 0, 0, 0);
  }

  return v7;
}

- (id)mergedContextWithContext:(id)a3 error:(id *)a4
{
  id v6;
  HDDatabaseTransactionContext *v7;
  id *p_isa;
  void *journalType;
  uint64_t v11;
  int64_t v12;
  void *cacheScope;
  uint64_t v14;
  int64_t v15;
  id v16;
  HDDatabaseTransactionContextStatistics *v17;
  HDDatabaseTransactionContextStatistics *v18;
  HDDatabaseTransactionContextStatistics *v19;

  v6 = a3;
  if (v6
    && !-[HDDatabaseTransactionContext isEqual:](self, "isEqual:", v6)
    && !objc_msgSend(v6, "isEmpty"))
  {
    if (-[HDDatabaseTransactionContext isEmpty](self, "isEmpty"))
    {
      v7 = (HDDatabaseTransactionContext *)v6;
      goto LABEL_5;
    }
    journalType = (void *)self->_journalType;
    v11 = objc_msgSend(v6, "journalType");
    v12 = self->_journalType;
    if (v12)
    {
      if (v11 && v11 != v12)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 107, CFSTR("Outer transaction journal type %ld is incompatible with type %ld"), self->_journalType, v11);
LABEL_18:
        p_isa = 0;
        goto LABEL_6;
      }
    }
    else
    {
      journalType = (void *)v11;
    }
    cacheScope = (void *)self->_cacheScope;
    v14 = objc_msgSend(v6, "cacheScope");
    v15 = self->_cacheScope;
    if (v15)
    {
      if (v14 && v14 != v15)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 107, CFSTR("Outer transaction cache scope %ld is incompatible with %ld"), self->_cacheScope, v14);
        goto LABEL_18;
      }
    }
    else
    {
      cacheScope = (void *)v14;
    }
    v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    if (-[NSMutableSet count](self->_accessibilityAssertions, "count"))
      objc_msgSend(v16, "unionSet:", self->_accessibilityAssertions);
    if (objc_msgSend(*((id *)v6 + 4), "count"))
      objc_msgSend(v16, "unionSet:", *((_QWORD *)v6 + 4));
    v17 = self->_statistics;
    v18 = (HDDatabaseTransactionContextStatistics *)*((_QWORD *)v6 + 5);
    if (v17)
    {
      v19 = v17;
      if (v18 && v18 != self->_statistics)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a4, 107, CFSTR("Transaction statistics are not mergeable"));
        p_isa = 0;
LABEL_30:

        goto LABEL_6;
      }
    }
    else
    {
      v19 = v18;
    }
    p_isa = -[HDDatabaseTransactionContext _initWithOptions:journalType:cacheScope:assertions:statistics:]((id *)[HDDatabaseTransactionContext alloc], (void *)(*((_QWORD *)v6 + 3) | self->_options), journalType, cacheScope, v16, v19);
    goto LABEL_30;
  }
  v7 = self;
LABEL_5:
  p_isa = (id *)&v7->super.isa;
LABEL_6:

  return p_isa;
}

- (BOOL)containsContext:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  uint64_t v8;
  int64_t journalType;
  uint64_t v10;
  int64_t cacheScope;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v22;
  uint64_t v23;

  v6 = a3;
  if (!v6 || -[HDDatabaseTransactionContext isEqual:](self, "isEqual:", v6))
    goto LABEL_3;
  if (objc_msgSend(v6, "journalType"))
  {
    v8 = objc_msgSend(v6, "journalType");
    journalType = self->_journalType;
    if (v8 != journalType)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v22 = journalType;
      v23 = objc_msgSend(v6, "journalType");
      v15 = CFSTR("Outer transaction journal type %ld is incompatible with type %ld");
LABEL_25:
      v14 = v16;
      goto LABEL_35;
    }
  }
  if (objc_msgSend(v6, "cacheScope") == 1)
  {
    v10 = objc_msgSend(v6, "cacheScope");
    cacheScope = self->_cacheScope;
    if (v10 != cacheScope)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v22 = cacheScope;
      v23 = objc_msgSend(v6, "cacheScope");
      v15 = CFSTR("Outer transaction cache scope %ld is incompatible with %ld");
      goto LABEL_25;
    }
  }
  if (objc_msgSend(v6, "requiresWrite")
    && !-[HDDatabaseTransactionContext requiresWrite](self, "requiresWrite"))
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("Outer transaction must require write");
    goto LABEL_35;
  }
  if (objc_msgSend(v6, "requiresProtectedData")
    && !-[HDDatabaseTransactionContext requiresProtectedData](self, "requiresProtectedData"))
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("Outer transaction must require protected data");
    goto LABEL_35;
  }
  if (objc_msgSend(v6, "skipJournalMerge")
    && !-[HDDatabaseTransactionContext skipJournalMerge](self, "skipJournalMerge"))
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("Outer transaction must skip journal merge");
    goto LABEL_35;
  }
  if (objc_msgSend(v6, "requiresNewDatabaseConnection")
    && !-[HDDatabaseTransactionContext requiresNewDatabaseConnection](self, "requiresNewDatabaseConnection"))
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("Outer transaction must require new database connection");
    goto LABEL_35;
  }
  if (objc_msgSend(v6, "allowsJournalingDuringProtectedRead")
    && !-[HDDatabaseTransactionContext allowsJournalingDuringProtectedRead](self, "allowsJournalingDuringProtectedRead")
    && (!-[HDDatabaseTransactionContext requiresProtectedData](self, "requiresProtectedData")
     || !-[HDDatabaseTransactionContext requiresWrite](self, "requiresWrite")))
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = CFSTR("Outer transaction must allow journaling during protected read or allow writing protected data");
    goto LABEL_35;
  }
  objc_msgSend(v6, "accessibilityAssertions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v13 = -[NSMutableSet count](self->_accessibilityAssertions, "count");

    if (!v13)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = CFSTR("Outer transaction must have database accessibility assertion");
LABEL_35:
      objc_msgSend(v14, "hk_assignError:code:format:", a4, 107, v15, v22, v23);
      v7 = 0;
      goto LABEL_36;
    }
  }
  else
  {

  }
  objc_msgSend(v6, "statistics");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[HDDatabaseTransactionContext statistics](self, "statistics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "statistics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19 != v20)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = CFSTR("Outer transaction must have the same statistics object");
      goto LABEL_35;
    }
  }
LABEL_3:
  v7 = 1;
LABEL_36:

  return v7;
}

- (BOOL)skipJournalMerge
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (BOOL)skipTransactionStartTasks
{
  return (LOBYTE(self->_options) >> 5) & 1;
}

- (BOOL)requiresNewDatabaseConnection
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (BOOL)allowsJournalingDuringProtectedRead
{
  return (LOBYTE(self->_options) >> 6) & 1;
}

- (BOOL)isEmpty
{
  return !self->_options
      && !self->_journalType
      && !self->_cacheScope
      && !-[NSMutableSet count](self->_accessibilityAssertions, "count")
      && self->_statistics == 0;
}

- (BOOL)requiresWrite
{
  return self->_options & 1;
}

- (BOOL)requiresProtectedData
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (BOOL)highPriority
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

- (NSSet)accessibilityAssertions
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)-[NSMutableSet copy](self->_accessibilityAssertions, "copy");
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSSet *)v5;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_options ^ (self->_journalType << 8) ^ (self->_cacheScope << 16);
  return v2 ^ -[HDDatabaseTransactionContextStatistics hash](self->_statistics, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HDDatabaseTransactionContext *v4;
  HDDatabaseTransactionContext *v5;
  HDDatabaseTransactionContext *v6;
  NSMutableSet *accessibilityAssertions;
  NSMutableSet *v8;
  BOOL v9;

  v4 = (HDDatabaseTransactionContext *)a3;
  if (self == v4)
  {
    v9 = 1;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = 0;
    goto LABEL_16;
  }
  v5 = v4;
  v6 = v5;
  if (self->_journalType != v5->_journalType || self->_options != v5->_options || self->_cacheScope != v5->_cacheScope)
    goto LABEL_12;
  accessibilityAssertions = self->_accessibilityAssertions;
  v8 = v6->_accessibilityAssertions;
  if (accessibilityAssertions == v8)
    goto LABEL_17;
  if (v8)
  {
    if ((-[NSMutableSet isEqual:](accessibilityAssertions, "isEqual:") & 1) == 0)
    {
      accessibilityAssertions = self->_accessibilityAssertions;
      goto LABEL_10;
    }
LABEL_17:
    v9 = self->_statistics == v6->_statistics;
    goto LABEL_13;
  }
LABEL_10:
  if (!-[NSMutableSet count](accessibilityAssertions, "count")
    && !-[NSMutableSet count](v6->_accessibilityAssertions, "count"))
  {
    goto LABEL_17;
  }
LABEL_12:
  v9 = 0;
LABEL_13:

LABEL_16:
  return v9;
}

- (id)description
{
  int64_t journalType;
  __CFString *v4;
  __CFString *v5;
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;

  journalType = self->_journalType;
  if (journalType)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" journal=%ld"), journalType);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E6D11BB8;
  }
  if (self->_cacheScope)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" cache-scope=%ld"), self->_cacheScope);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E6D11BB8;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[HDDatabaseTransactionContext skipJournalMerge](self, "skipJournalMerge"))
    objc_msgSend(v6, "addObject:", CFSTR("skip-journal"));
  if (-[HDDatabaseTransactionContext requiresNewDatabaseConnection](self, "requiresNewDatabaseConnection"))
    objc_msgSend(v6, "addObject:", CFSTR("new-connection"));
  if (-[HDDatabaseTransactionContext requiresWrite](self, "requiresWrite"))
    objc_msgSend(v6, "addObject:", CFSTR("write"));
  if (-[HDDatabaseTransactionContext requiresProtectedData](self, "requiresProtectedData"))
    objc_msgSend(v6, "addObject:", CFSTR("protected-data"));
  if (-[HDDatabaseTransactionContext highPriority](self, "highPriority"))
    objc_msgSend(v6, "addObject:", CFSTR("high-priority"));
  if (-[HDDatabaseTransactionContext skipTransactionStartTasks](self, "skipTransactionStartTasks"))
    objc_msgSend(v6, "addObject:", CFSTR("skip-transaction-start"));
  if (-[HDDatabaseTransactionContext allowsJournalingDuringProtectedRead](self, "allowsJournalingDuringProtectedRead"))
    objc_msgSend(v6, "addObject:", CFSTR("allows-journaling-during-protected-read"));
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("none");
  }
  if (-[NSMutableSet count](self->_accessibilityAssertions, "count"))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[NSMutableSet allObjects](self->_accessibilityAssertions, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_map:", &__block_literal_global_242);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR(" assertions={%@}"), v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = &stru_1E6D11BB8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@%@%@ options=%@%@>"), objc_opt_class(), v4, v5, v7, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __43__HDDatabaseTransactionContext_description__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ownerIdentifier");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[HDDatabaseTransactionContext _initWithOptions:journalType:cacheScope:assertions:statistics:]((id *)[HDMutableDatabaseTransactionContext alloc], (void *)self->_options, (void *)self->_journalType, (void *)self->_cacheScope, self->_accessibilityAssertions, self->_statistics);
}

- (int64_t)journalType
{
  return self->_journalType;
}

- (int64_t)cacheScope
{
  return self->_cacheScope;
}

- (HDDatabaseTransactionContextStatistics)statistics
{
  return self->_statistics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
  objc_storeStrong((id *)&self->_accessibilityAssertions, 0);
}

@end
