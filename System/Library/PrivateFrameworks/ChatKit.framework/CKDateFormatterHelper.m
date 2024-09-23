@implementation CKDateFormatterHelper

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CKDateFormatterHelper_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, block);
  return (id)sharedInstance_sInstance_4;
}

void __39__CKDateFormatterHelper_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sInstance_4;
  sharedInstance_sInstance_4 = (uint64_t)v0;

}

- (CKDateFormatterHelper)init
{
  CKDateFormatterHelper *v2;
  NSCache *v3;
  NSCache *dateFormatterContainer;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;
  NSArray *lockList;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKDateFormatterHelper;
  v2 = -[CKDateFormatterHelper init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    dateFormatterContainer = v2->_dateFormatterContainer;
    v2->_dateFormatterContainer = v3;

    v5 = (void *)objc_opt_new();
    v6 = 11;
    do
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB38E0]);
      objc_msgSend(v5, "addObject:", v7);

      --v6;
    }
    while (v6);
    v8 = objc_msgSend(v5, "copy");
    lockList = v2->_lockList;
    v2->_lockList = (NSArray *)v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_removeAllObjects, *MEMORY[0x1E0CEB288], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel_removeAllObjects, *MEMORY[0x1E0CEB298], 0);

  }
  return v2;
}

- (id)getDateFormatterFor:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[CKDateFormatterHelper _keyForDateFormatterType:](self, "_keyForDateFormatterType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDateFormatterHelper lockList](self, "lockList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lock");
  -[CKDateFormatterHelper dateFormatterContainer](self, "dateFormatterContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[CKDateFormatterHelper _createDateFormatterFor:](self, "_createDateFormatterFor:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDateFormatterHelper dateFormatterContainer](self, "dateFormatterContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v5);

  }
  objc_msgSend(v7, "unlock");

  return v9;
}

- (id)_createDateFormatterFor:(int64_t)a3
{
  void *v5;
  __objc2_class *v6;
  uint64_t v7;
  void *v8;

  -[CKDateFormatterHelper _templateStringForFormatterType:](self, "_templateStringForFormatterType:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 9:
      v6 = CKAutoupdatingDateFormatter;
      goto LABEL_4;
    case 6:
    case 7:
      v6 = CKAutoupdatingRelativeDateFormatter;
LABEL_4:
      v7 = objc_msgSend([v6 alloc], "initWithTemplate:", v5);
      goto LABEL_5;
    case 8:
      -[CKDateFormatterHelper _createShortDateNoTimeInSentenceDateFormatter](self, "_createShortDateNoTimeInSentenceDateFormatter");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 10:
      -[CKDateFormatterHelper _createRelativeStandaloneDateFormatter](self, "_createRelativeStandaloneDateFormatter");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v8 = (void *)v7;
      break;
    default:
      v8 = 0;
      break;
  }

  return v8;
}

- (id)_createShortDateNoTimeInSentenceDateFormatter
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "__ck_currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setTimeStyle:", 0);
  objc_msgSend(v2, "setDateStyle:", 1);
  objc_msgSend(v2, "setFormattingContext:", 5);
  return v2;
}

- (id)_createRelativeStandaloneDateFormatter
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setTimeStyle:", 0);
  objc_msgSend(v2, "setDateStyle:", 1);
  objc_msgSend(MEMORY[0x1E0C99DC8], "__ck_currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend(v2, "setDoesRelativeDateFormatting:", 1);
  objc_msgSend(v2, "setFormattingContext:", 2);
  return v2;
}

- (id)_keyForDateFormatterType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA)
    return CFSTR("kThePastDateFormatterKey");
  else
    return off_1E2759BC0[a3 - 1];
}

- (id)_templateStringForFormatterType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA)
    return CFSTR("yMMMdjm");
  else
    return off_1E2759C18[a3 - 1];
}

- (void)removeAllObjects
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Clean up date formatter objects", v5, 2u);
    }

  }
  -[CKDateFormatterHelper dateFormatterContainer](self, "dateFormatterContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (NSCache)dateFormatterContainer
{
  return (NSCache *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDateFormatterContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)lockList
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLockList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockList, 0);
  objc_storeStrong((id *)&self->_dateFormatterContainer, 0);
}

@end
