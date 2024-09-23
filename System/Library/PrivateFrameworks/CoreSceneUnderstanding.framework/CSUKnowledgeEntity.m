@implementation CSUKnowledgeEntity

- (CSUKnowledgeEntity)initWithQID:(id)a3 withHumanReadableLabel:(id)a4 withHumanReadableSynonyms:(id)a5 withVersion:(int)a6
{
  id v11;
  id v12;
  id v13;
  CSUKnowledgeEntity *v14;
  CSUKnowledgeEntity *v15;
  CSUKnowledgeEntity *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CSUKnowledgeEntity;
  v14 = -[CSUKnowledgeEntity init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_QID, a3);
    objc_storeStrong((id *)&v15->_humanReadableLabel, a4);
    objc_storeStrong((id *)&v15->_humanReadableSynonyms, a5);
    v15->_version = a6;
    v16 = v15;
  }

  return v15;
}

- (CSUKnowledgeEntity)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  char isEqual;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  CSUKnowledgeEntity *v42;

  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("humanReadableSynonyms"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v8, v14, (uint64_t)v13, v15, v16);

  if ((isEqual & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend_objectForKeyedSubscript_(v4, v18, (uint64_t)CFSTR("humanReadableSynonyms"), v19, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v22, v24, (uint64_t)v23, v25, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_objectForKeyedSubscript_(v4, v18, (uint64_t)CFSTR("QID"), v19, v20);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v28, (uint64_t)CFSTR("humanReadableLabel"), v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v32, (uint64_t)CFSTR("version"), v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend_integerValue(v35, v36, v37, v38, v39);
  v42 = (CSUKnowledgeEntity *)objc_msgSend_initWithQID_withHumanReadableLabel_withHumanReadableSynonyms_withVersion_(self, v41, (uint64_t)v27, (uint64_t)v31, (uint64_t)v21, v40);

  return v42;
}

- (NSDictionary)dictionary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString *humanReadableLabel;
  NSSet *humanReadableSynonyms;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[4];
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v16[0] = CFSTR("QID");
  v16[1] = CFSTR("humanReadableLabel");
  humanReadableLabel = self->_humanReadableLabel;
  v17[0] = self->_QID;
  v17[1] = humanReadableLabel;
  v16[2] = CFSTR("humanReadableSynonyms");
  humanReadableSynonyms = self->_humanReadableSynonyms;
  if (humanReadableSynonyms)
    objc_msgSend_allObjects(humanReadableSynonyms, a2, v2, v3, v4);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], a2, v2, v3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  v16[3] = CFSTR("version");
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v9, self->_version, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v12;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v17, (uint64_t)v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v14;
}

- (NSString)QID
{
  return self->_QID;
}

- (NSString)humanReadableLabel
{
  return self->_humanReadableLabel;
}

- (NSSet)humanReadableSynonyms
{
  return self->_humanReadableSynonyms;
}

- (int)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_humanReadableSynonyms, 0);
  objc_storeStrong((id *)&self->_humanReadableLabel, 0);
  objc_storeStrong((id *)&self->_QID, 0);
}

@end
