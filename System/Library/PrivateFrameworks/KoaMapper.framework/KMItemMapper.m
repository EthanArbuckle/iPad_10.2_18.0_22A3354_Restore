@implementation KMItemMapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapper, 0);
}

+ (id)_mapperForObjectClass:(Class)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __objc2_class *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (+[KMMapper_SAPerson externalObjectClass](KMMapper_SAPerson, "externalObjectClass") == a3)
  {
    v12 = KMMapper_SAPerson;
  }
  else if (+[KMMapper_SAAppInfo externalObjectClass](KMMapper_SAAppInfo, "externalObjectClass") == a3)
  {
    v12 = KMMapper_SAAppInfo;
  }
  else if (+[KMMapper_INVocabularyItem externalObjectClass](KMMapper_INVocabularyItem, "externalObjectClass") == a3)
  {
    v12 = KMMapper_INVocabularyItem;
  }
  else if (+[KMMapper_CNContact externalObjectClass](KMMapper_CNContact, "externalObjectClass") == a3)
  {
    v12 = KMMapper_CNContact;
  }
  else if (+[KMMapper_LSApplicationRecord externalObjectClass](KMMapper_LSApplicationRecord, "externalObjectClass") == a3)
  {
    v12 = KMMapper_LSApplicationRecord;
  }
  else if (+[KMMapper_HMHome externalObjectClass](KMMapper_HMHome, "externalObjectClass") == a3)
  {
    v12 = KMMapper_HMHome;
  }
  else if (+[KMMapper_MPMediaEntity externalObjectClass](KMMapper_MPMediaEntity, "externalObjectClass") == a3)
  {
    v12 = KMMapper_MPMediaEntity;
  }
  else if (+[KMMapper_SASyncSiriKitAppVocabulary externalObjectClass](KMMapper_SASyncSiriKitAppVocabulary, "externalObjectClass") == a3)
  {
    v12 = KMMapper_SASyncSiriKitAppVocabulary;
  }
  else if (+[KMMapper_RTLocationOfInterest externalObjectClass](KMMapper_RTLocationOfInterest, "externalObjectClass") == a3)
  {
    v12 = KMMapper_RTLocationOfInterest;
  }
  else if (+[KMMapper_PortraitEntity externalObjectClass](KMMapper_PortraitEntity, "externalObjectClass") == a3)
  {
    v12 = KMMapper_PortraitEntity;
  }
  else if (+[KMMapper_AppGlobalVocabulary externalObjectClass](KMMapper_AppGlobalVocabulary, "externalObjectClass") == a3)
  {
    v12 = KMMapper_AppGlobalVocabulary;
  }
  else if (+[KMMapper_EKEvent externalObjectClass](KMMapper_EKEvent, "externalObjectClass") == a3)
  {
    v12 = KMMapper_EKEvent;
  }
  else
  {
    if (+[KMMapper_PBSUserProfile externalObjectClass](KMMapper_PBSUserProfile, "externalObjectClass") != a3)
    {
      v5 = (void *)MEMORY[0x24BDD1540];
      v13 = *MEMORY[0x24BDD0BA0];
      v6 = (void *)MEMORY[0x24BDD17C8];
      NSStringFromClass(a3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Object class (%@) not supported"), v7, v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.koa.mapper"), 2, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      KVSetError();

      return 0;
    }
    v12 = KMMapper_PBSUserProfile;
  }
  return objc_alloc_init(v12);
}

- (KMItemMapper)initWithObjectClass:(Class)a3 error:(id *)a4
{
  KMItemMapper *v6;
  uint64_t v7;
  KMMapper *mapper;
  KMItemMapper *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)KMItemMapper;
  v6 = -[KMItemMapper init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "_mapperForObjectClass:error:", a3, a4);
    v7 = objc_claimAutoreleasedReturnValue();
    mapper = v6->_mapper;
    v6->_mapper = (KMMapper *)v7;

    if (!v6->_mapper)
    {
      v9 = 0;
      goto LABEL_6;
    }
    v6->_externalObjectClass = (Class)objc_msgSend((id)objc_opt_class(), "externalObjectClass");
  }
  v9 = v6;
LABEL_6:

  return v9;
}

- (KMItemMapper)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (int64_t)targetItemType
{
  return -[KMMapper targetItemType](self->_mapper, "targetItemType");
}

- (id)itemsFromExternalObject:(id)a3 additionalFields:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BDD0BA0];
    v34[0] = CFSTR("Object to be mapped is nil");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.koa.mapper"), 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    KVSetError();

LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0BA0];
    v15 = (void *)MEMORY[0x24BDD17C8];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(self->_externalObjectClass);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("Object class (%@) inconsistent with expected class (%@) provided at initialization"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.koa.mapper"), 3, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    KVSetError();

LABEL_9:
    goto LABEL_10;
  }
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v22 = (void *)MEMORY[0x24BDD1540];
      v29 = *MEMORY[0x24BDD0BA0];
      v23 = (void *)MEMORY[0x24BDD17C8];
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Invalid additional fields: %@ must be %@"), v9, v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.koa.mapper"), 5, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      KVSetError();

      goto LABEL_9;
    }
  }
  -[KMMapper itemsFromExternalObject:additionalFields:error:](self->_mapper, "itemsFromExternalObject:additionalFields:error:", v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v10;
}

@end
