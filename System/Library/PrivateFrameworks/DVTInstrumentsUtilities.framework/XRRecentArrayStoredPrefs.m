@implementation XRRecentArrayStoredPrefs

+ (id)sharedInstanceForPreferencePath:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  XRRecentArrayStoredPrefs *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  if (qword_25583C860 != -1)
    dispatch_once(&qword_25583C860, &unk_24EDC2B50);
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_25583C858, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend_objectForKey_((void *)qword_25583C850, v4, (uint64_t)v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = [XRRecentArrayStoredPrefs alloc];
    v7 = (void *)objc_msgSend_initWithMaximumRecentCount_preferencePath_(v8, v9, 10, (uint64_t)v3, v10);
    objc_msgSend_setObject_forKeyedSubscript_((void *)qword_25583C850, v11, (uint64_t)v7, (uint64_t)v3, v12);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_25583C858);

  return v7;
}

- (XRRecentArrayStoredPrefs)initWithMaximumRecentCount:(unint64_t)a3 preferencePath:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  XRRecentArrayStoredPrefs *v10;
  uint64_t v11;
  NSString *preferencePathArray;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *preferencePathMaxCount;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)XRRecentArrayStoredPrefs;
  v10 = -[XRRecentArray initWithMaximumRecentCount:](&v23, sel_initWithMaximumRecentCount_, a3);
  if (v10)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v7, (uint64_t)CFSTR("%@.array"), v8, v9, v6);
    v11 = objc_claimAutoreleasedReturnValue();
    preferencePathArray = v10->_preferencePathArray;
    v10->_preferencePathArray = (NSString *)v11;

    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)CFSTR("%@.maxCount"), v14, v15, v6);
    v16 = objc_claimAutoreleasedReturnValue();
    preferencePathMaxCount = v10->_preferencePathMaxCount;
    v10->_preferencePathMaxCount = (NSString *)v16;

    objc_msgSend__readUserDefaults(v10, v18, v19, v20, v21);
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  objc_msgSend_synchronize(self, a2, v2, v3, v4);
  v6.receiver = self;
  v6.super_class = (Class)XRRecentArrayStoredPrefs;
  -[XRRecentArrayStoredPrefs dealloc](&v6, sel_dealloc);
}

- (void)_readUserDefaults
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  BOOL v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  objc_super v42;
  objc_super v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v6, v7, (uint64_t)self->_preferencePathArray, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v6, v11, (uint64_t)self->_preferencePathMaxCount, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v14;
  if (v10)
    v20 = v14 == 0;
  else
    v20 = 1;
  if (v20)
  {
    objc_msgSend_setObject_forKey_(v6, v15, MEMORY[0x24BDBD1A8], (uint64_t)self->_preferencePathArray, v18);
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)&unk_24EDD4C78, (uint64_t)self->_preferencePathMaxCount, v22);
    v27 = objc_msgSend_unsignedIntegerValue(&unk_24EDD4C78, v23, v24, v25, v26);
    v48.receiver = self;
    v48.super_class = (Class)XRRecentArrayStoredPrefs;
    -[XRRecentArray setMaximumRecentCount:](&v48, sel_setMaximumRecentCount_, v27);
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v41 = v10;
    objc_msgSend_reverseObjectEnumerator(v10, v15, v16, v17, v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v44, (uint64_t)v49, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v45 != v32)
            objc_enumerationMutation(v28);
          v34 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          v43.receiver = self;
          v43.super_class = (Class)XRRecentArrayStoredPrefs;
          -[XRRecentArray addEntry:](&v43, sel_addEntry_, v34);
        }
        v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v35, (uint64_t)&v44, (uint64_t)v49, 16);
      }
      while (v31);
    }

    v40 = objc_msgSend_unsignedIntegerValue(v19, v36, v37, v38, v39);
    v42.receiver = self;
    v42.super_class = (Class)XRRecentArrayStoredPrefs;
    -[XRRecentArray setMaximumRecentCount:](&v42, sel_setMaximumRecentCount_, v40);
    v10 = v41;
  }

}

- (void)synchronize
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->super._lock, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v3, v4, v5, v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v15, v7, (uint64_t)self->super._entries, (uint64_t)self->_preferencePathArray, v8);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v9, self->super._maximumRecentCount, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v15, v13, (uint64_t)v12, (uint64_t)self->_preferencePathMaxCount, v14);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->super._lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferencePathMaxCount, 0);
  objc_storeStrong((id *)&self->_preferencePathArray, 0);
}

@end
