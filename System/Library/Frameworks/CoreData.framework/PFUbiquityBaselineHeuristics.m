@implementation PFUbiquityBaselineHeuristics

- (PFUbiquityBaselineHeuristics)init
{
  PFUbiquityBaselineHeuristics *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFUbiquityBaselineHeuristics;
  result = -[PFUbiquityBaselineHeuristics init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_ubiquityRootLocation = 0u;
    *(_OWORD *)&result->_localPeerID = 0u;
    result->_numRequiredTransactions = 100;
    result->_storeSize = 0;
    result->_logSize = 0;
    *(_QWORD *)result->_logToStoreSizeRatio = 0x3FE0000000000000;
    result->_currentBaselineKV = 0;
    result->_currentKV = 0;
    result->_minLogBytes = 1000000;
  }
  return result;
}

- (PFUbiquityBaselineHeuristics)initWithLocalPeerID:(id)a3 storeName:(id)a4 modelVersionHash:(id)a5 andUbiquityRootLocation:(id)a6
{
  PFUbiquityBaselineHeuristics *v10;

  v10 = -[PFUbiquityBaselineHeuristics init](self, "init");
  if (v10)
  {
    v10->_localPeerID = (NSString *)a3;
    v10->_storeName = (NSString *)a4;
    v10->_ubiquityRootLocation = (PFUbiquityLocation *)a6;
    v10->_modelVersionHash = (NSString *)a5;
    v10->_numRequiredTransactions = 100;
    *(_QWORD *)v10->_logToStoreSizeRatio = 0x3FE0000000000000;
    v10->_minLogBytes = 1000000;
  }
  return v10;
}

- (void)dealloc
{
  SEL v3;
  SEL v4;
  objc_super v5;

  self->_storeName = 0;
  self->_localPeerID = 0;

  self->_ubiquityRootLocation = 0;
  self->_modelVersionHash = 0;
  objc_setProperty_nonatomic(self, v3, 0, 80);
  objc_setProperty_nonatomic(self, v4, 0, 88);
  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityBaselineHeuristics;
  -[PFUbiquityBaselineHeuristics dealloc](&v5, sel_dealloc);
}

- (id)copy
{
  PFUbiquityBaselineHeuristics *v3;
  const char *v4;
  PFUbiquityBaselineHeuristics *v5;
  SEL v6;

  v3 = -[PFUbiquityBaselineHeuristics initWithLocalPeerID:storeName:modelVersionHash:andUbiquityRootLocation:]([PFUbiquityBaselineHeuristics alloc], "initWithLocalPeerID:storeName:modelVersionHash:andUbiquityRootLocation:", self->_localPeerID, self->_storeName, self->_modelVersionHash, self->_ubiquityRootLocation);
  v5 = v3;
  if (v3)
  {
    *(_OWORD *)&v3->_numRequiredTransactions = *(_OWORD *)&self->_numRequiredTransactions;
    v3->_logSize = self->_logSize;
    *(_QWORD *)v3->_logToStoreSizeRatio = *(_QWORD *)self->_logToStoreSizeRatio;
    v3->_minLogBytes = self->_minLogBytes;
    objc_setProperty_nonatomic(v3, v4, self->_currentBaselineKV, 80);
    objc_setProperty_nonatomic(v5, v6, self->_currentBaselineKV, 88);
  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PFUbiquityBaselineHeuristics;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", -[PFUbiquityBaselineHeuristics description](&v5, sel_description));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@:%@\n"), self->_localPeerID, self->_storeName);
  objc_msgSend(v3, "appendFormat:", CFSTR("\t_ubiquityRootLocation: %@\n"), self->_ubiquityRootLocation);
  objc_msgSend(v3, "appendFormat:", CFSTR("\ttransactions: %ld\n"), self->_numRequiredTransactions);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tsize: %ld:%ld\n"), self->_storeSize, self->_logSize);
  objc_msgSend(v3, "appendFormat:", CFSTR("\treqs: %Lf:%ld\n"), *(_QWORD *)self->_logToStoreSizeRatio, self->_minLogBytes);
  objc_msgSend(v3, "appendFormat:", CFSTR("\tkv: %@:%@"), self->_currentBaselineKV, self->_currentKV);
  return v3;
}

- (void)updateHeuristics
{
  os_unfair_lock_s **v2;
  os_unfair_lock_s **v3;
  os_unfair_lock_s *v4;
  void *v5;
  void *v6;
  off_t st_size;
  id v8;
  os_unfair_lock_s *v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  stat v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_opt_self();
    v2 = (os_unfair_lock_s **)-[PFUbiquitySwitchboard retainedEntryForStoreName:andLocalPeerID:](_sharedSwitchboard, a1[2], a1[1]);
    v3 = v2;
    if (!v2)
    {
      v8 = 0;
      v9 = 0;
LABEL_29:

      return;
    }
    v4 = v2[11];
    if (v4)
      v5 = *(void **)&v4[16]._os_unfair_lock_opaque;
    else
      v5 = 0;
    v6 = (void *)objc_msgSend((id)objc_msgSend(v5, "URL"), "path");
    memset(&v22, 0, sizeof(v22));
    if (!stat((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v22))
    {
      st_size = v22.st_size;
      goto LABEL_14;
    }
    if (*__error() == 2)
    {
      if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
      {
        NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Tried to stat missing file: %@"), "-[PFUbiquityBaselineHeuristics bytesForFileAtPath:]", 165, v6);
        st_size = 0;
        goto LABEL_14;
      }
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
    {
      v10 = __error();
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error getting the size of a file (%d): %@"), "-[PFUbiquityBaselineHeuristics bytesForFileAtPath:]", 167, *v10, v6);
      st_size = 0;
      goto LABEL_14;
    }
    st_size = 0;
LABEL_14:
    a1[6] = st_size;
    a1[7] = 0;
    v9 = -[PFUbiquityFilePresenter copyStatusDictionary](v3[6]);
    v8 = (id)-[os_unfair_lock_s allKeys](v9, "allKeys");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v8);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
          if (v14
            && *(_DWORD *)(v14 + 24) == 22
            && objc_msgSend(*(id *)(v14 + 48), "isEqualToString:", a1[4]))
          {
            v15 = (id)-[os_unfair_lock_s objectForKey:](v9, "objectForKey:", v14);
            if (v15)
              v16 = v15[6];
            else
              v16 = 0;
            a1[7] += v16;

          }
          ++v13;
        }
        while (v11 != v13);
        v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        v11 = v17;
      }
      while (v17);
    }
    goto LABEL_29;
  }
}

- (uint64_t)canRollBaseline:(uint64_t *)a1
{
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  PFUbiquityKnowledgeVector *v7;
  char v8;
  int v9;
  id *p_isa;
  void *v11;
  PFUbiquityKnowledgeVector *v12;
  id *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  _BOOL4 v30;
  uint64_t v31;
  char v32;
  char v33;
  void *v35;
  void *v37;
  uint64_t *v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  char v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  stat v47;
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v33 = 0;
    return v33 & 1;
  }
  v41 = 0;
  v3 = a1[3];
  if (!v3 || !-[PFUbiquityLocation fileExistsAtLocationWithLocalPeerID:error:](v3, 0, 0))
  {
    if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    {
      v37 = 0;
      v8 = 0;
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Asked if rolling the baseline is possible, but the root location does not appear to exist: %@"), "-[PFUbiquityBaselineHeuristics canRollBaseline:]", 280, a1[3]);
      goto LABEL_11;
    }
    v37 = 0;
    goto LABEL_49;
  }
  v4 = -[PFUbiquityLocation createFullPath](a1[3]);
  v37 = v4;
  if (v4)
  {
    v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");
    if (v5)
    {
      memset(&v47, 0, sizeof(v47));
      if (!stat(v5, &v47))
      {
        v35 = (void *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v47.st_mtimespec.tv_sec- *MEMORY[0x1E0C9ADF8]+ (double)v47.st_mtimespec.tv_nsec * 0.000000001);
        if (v35)
        {
          if (objc_msgSend(v35, "compare:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -259200.0)) == 1)
          {
            v9 = 0;
            v8 = 0;
            v42 = 0;
            goto LABEL_51;
          }
        }
      }
    }
  }
  v6 = (void *)a1[10];
  if (v6)
    v7 = v6;
  else
    v7 = objc_alloc_init(PFUbiquityKnowledgeVector);
  p_isa = (id *)&v7->super.isa;
  v11 = (void *)a1[11];
  if (v11)
    v12 = v11;
  else
    v12 = objc_alloc_init(PFUbiquityKnowledgeVector);
  v13 = (id *)&v12->super.isa;
  v48[0] = p_isa;
  v48[1] = v12;
  v14 = +[PFUbiquityKnowledgeVector createSetOfAllPeerIDsInKnowledgeVectors:]((uint64_t)PFUbiquityKnowledgeVector, (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2));
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v43, &v47, 16);
  v38 = a1;
  obj = v14;
  if (!v15)
  {
    v40 = 0;
    goto LABEL_41;
  }
  v40 = 0;
  v16 = *(_QWORD *)v44;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v44 != v16)
        objc_enumerationMutation(obj);
      v18 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v17);
      if (p_isa)
      {
        v19 = (void *)objc_msgSend(p_isa[1], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v17));
        if (!v13)
          goto LABEL_37;
      }
      else
      {
        v19 = 0;
        if (!v13)
        {
LABEL_37:
          v20 = 0;
          goto LABEL_25;
        }
      }
      v20 = (void *)objc_msgSend(v13[1], "objectForKey:", v18);
LABEL_25:
      v21 = objc_msgSend(v19, "integerValue");
      v22 = objc_msgSend(v20, "integerValue");
      v23 = v22;
      if (v21 < 0 || v22 <= v21)
      {
        if (v22 >= v21)
        {
          if (!v20
            && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
          {
            NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nThis is confusing, baseline has a transaction for %@(%@) but the current kv doesn't: %@\n%@"), "-[PFUbiquityBaselineHeuristics haveEnoughTransactionsToRoll]", 197, v38, v18, v19, p_isa, v13);
          }
        }
        else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 1))
        {
          NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  %@\nThis is confusing, baseline > current for peer: %@(%lu:%lu)"), "-[PFUbiquityBaselineHeuristics haveEnoughTransactionsToRoll]", 195, v38, v18, v23, v21);
        }
      }
      else
      {
        v24 = objc_msgSend(v20, "integerValue");
        v40 = v24 + v40 - objc_msgSend(v19, "integerValue");
      }
      ++v17;
    }
    while (v15 != v17);
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, &v47, 16);
    v15 = v25;
  }
  while (v25);
LABEL_41:
  v26 = v40 >= v38[5];

  if (v26)
    goto LABEL_42;
  if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
    NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Enough transactions have passed to roll baseline: %@"), "-[PFUbiquityBaselineHeuristics canRollBaseline:]", 270, v38);
  v27 = v38[7];
  if (v27 < 1)
    goto LABEL_49;
  v28 = v38[6];
  v29 = *((double *)v38 + 8);
  v30 = +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3);
  if (v27 >= (uint64_t)(v29 * (double)v28))
  {
    if (v30)
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Asked to roll baseline, enough disk space has been consumed by logs."), "-[PFUbiquityBaselineHeuristics logsConsumeEnoughDiskSpace]", 219);
LABEL_42:
    v8 = 1;
    +[PFUbiquityBaseline checkPeerReceiptsUnderRootLocation:forAgreementWithLocalPeerID:storeName:modelVersionHash:error:]((uint64_t)PFUbiquityBaseline, v38[3], v38[1], v38[2], v38[4], &v41);
    goto LABEL_50;
  }
  if (!v30)
  {
LABEL_49:
    v8 = 0;
LABEL_50:
    v9 = 1;
    goto LABEL_51;
  }
  v31 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v38[6]);
  v8 = 0;
  NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Asked to roll baseline but not enough space has been consumed yet by the transaction logs.\n\tStore Bytes: %@\n\tLog Bytes: %@"), "-[PFUbiquityBaselineHeuristics logsConsumeEnoughDiskSpace]", 223, v31, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v38[7]));
LABEL_11:
  v9 = 1;
LABEL_51:

  if (v41)
    v32 = v8;
  else
    v32 = 1;
  if (a2 && (v32 & 1) == 0)
    *a2 = v41;
  v33 = v42;
  if (v9)
    v33 = v8;
  return v33 & 1;
}

@end
