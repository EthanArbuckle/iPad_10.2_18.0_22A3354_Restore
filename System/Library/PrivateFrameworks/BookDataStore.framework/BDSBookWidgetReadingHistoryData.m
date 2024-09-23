@implementation BDSBookWidgetReadingHistoryData

- (BDSBookWidgetReadingHistoryData)initWithStateInfo:(id)a3 readingGoalsEnabled:(BOOL)a4
{
  id v7;
  BDSBookWidgetReadingHistoryData *v8;
  BDSBookWidgetReadingHistoryData *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BDSBookWidgetReadingHistoryData;
  v8 = -[BDSBookWidgetReadingHistoryData init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_stateInfo, a3);
    v9->_readingGoalsEnabled = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int isEqual;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  if (self != a3)
  {
    v9 = a3;
    objc_opt_class();
    BUDynamicCast();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v9) = 0;
    if (!self || !v4)
      goto LABEL_10;
    objc_msgSend_stateInfo(self, v5, v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stateInfo(v4, v11, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v10 == (void *)v15)
    {

    }
    else
    {
      v20 = (void *)v15;
      objc_msgSend_stateInfo(self, v16, v17, v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stateInfo(v4, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v21, v27, (uint64_t)v26, v28, v29);

      if (!isEqual)
      {
        LOBYTE(v9) = 0;
LABEL_10:

        return (char)v9;
      }
    }
    v35 = objc_msgSend_readingGoalsEnabled(self, v31, v32, v33, v34);
    LODWORD(v9) = v35 ^ objc_msgSend_readingGoalsEnabled(v4, v36, v37, v38, v39) ^ 1;
    goto LABEL_10;
  }
  LOBYTE(v9) = 1;
  return (char)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BDSBookWidgetReadingHistoryData)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BDSBookWidgetReadingHistoryData *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  BDSReadingHistoryStateInfo *stateInfo;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v9 = (BDSBookWidgetReadingHistoryData *)objc_msgSend_init(self, v5, v6, v7, v8);
  if (v9)
  {
    v10 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("stateInfo"), v12);
    v13 = objc_claimAutoreleasedReturnValue();
    stateInfo = v9->_stateInfo;
    v9->_stateInfo = (BDSReadingHistoryStateInfo *)v13;

    v9->_readingGoalsEnabled = objc_msgSend_decodeBoolForKey_(v4, v15, (uint64_t)CFSTR("readingGoalsEnabled"), v16, v17);
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  objc_msgSend_stateInfo(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v18, v9, (uint64_t)v8, (uint64_t)CFSTR("stateInfo"), v10);

  v15 = objc_msgSend_readingGoalsEnabled(self, v11, v12, v13, v14);
  objc_msgSend_encodeBool_forKey_(v18, v16, v15, (uint64_t)CFSTR("readingGoalsEnabled"), v17);

}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BDSBookWidgetReadingHistoryData *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v8 = objc_alloc_init(BDSBookWidgetReadingHistoryData);
  if (v8)
  {
    objc_msgSend_stateInfo(self, v4, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setStateInfo_(v8, v10, (uint64_t)v9, v11, v12);

    v17 = objc_msgSend_readingGoalsEnabled(self, v13, v14, v15, v16);
    objc_msgSend_setReadingGoalsEnabled_(v8, v18, v17, v19, v20);
  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  objc_msgSend_stateInfo(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_readingGoalsEnabled(self, v10, v11, v12, v13);
  objc_msgSend_stringWithFormat_(v3, v15, (uint64_t)CFSTR("<%@: %p stateInfo:%@, readingGoalsEnabled:%d>"), v16, v17, v4, self, v9, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BDSReadingHistoryStateInfo)stateInfo
{
  return self->_stateInfo;
}

- (void)setStateInfo:(id)a3
{
  objc_storeStrong((id *)&self->_stateInfo, a3);
}

- (BOOL)readingGoalsEnabled
{
  return self->_readingGoalsEnabled;
}

- (void)setReadingGoalsEnabled:(BOOL)a3
{
  self->_readingGoalsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateInfo, 0);
}

@end
