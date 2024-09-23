@implementation IATextInputActionsSessionDictationBeganAction

- (int64_t)mergeActionIfPossible:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  int64_t v59;

  v4 = a3;
  v9 = objc_msgSend_source(self, v5, v6, v7, v8);
  if (v9 == objc_msgSend_source(v4, v10, v11, v12, v13))
  {
    objc_msgSend_asDictationBegan(v4, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v18;
    if (v18)
    {
      v24 = objc_msgSend_dictationBeganCount(v18, v19, v20, v21, v22);
      v29 = objc_msgSend_dictationBeganCount(self, v25, v26, v27, v28);
      objc_msgSend_setDictationBeganCount_(self, v30, v29 + v24, v31, v32);
      v37 = objc_msgSend_modelessUsedAtLeastOnceCount(v23, v33, v34, v35, v36);
      v42 = objc_msgSend_modelessUsedAtLeastOnceCount(self, v38, v39, v40, v41);
      objc_msgSend_setModelessUsedAtLeastOnceCount_(self, v43, v42 + v37, v44, v45);
      v50 = objc_msgSend_multiModalDictationBeganCount(v23, v46, v47, v48, v49);
      v55 = objc_msgSend_multiModalDictationBeganCount(self, v51, v52, v53, v54);
      objc_msgSend_setMultiModalDictationBeganCount_(self, v56, v55 + v50, v57, v58);
      v59 = 1;
    }
    else
    {
      v59 = 0;
    }

  }
  else
  {
    v59 = 0;
  }

  return v59;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)IATextInputActionsSessionDictationBeganAction;
  -[IATextInputActionsSessionAction description](&v57, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  v14 = objc_msgSend_dictationBeganCount(self, v10, v11, v12, v13);
  objc_msgSend_stringWithFormat_(v9, v15, (uint64_t)CFSTR("dictationBeganCount=%lu"), v16, v17, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v19, (uint64_t)v18, v20, v21);

  v22 = (void *)MEMORY[0x24BDD17C8];
  v27 = objc_msgSend_modelessUsedAtLeastOnceCount(self, v23, v24, v25, v26);
  objc_msgSend_stringWithFormat_(v22, v28, (uint64_t)CFSTR("modelessUsedAtLeastOnceCount=%lu"), v29, v30, v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v32, (uint64_t)v31, v33, v34);

  v35 = (void *)MEMORY[0x24BDD17C8];
  v40 = objc_msgSend_multiModalDictationBeganCount(self, v36, v37, v38, v39);
  objc_msgSend_stringWithFormat_(v35, v41, (uint64_t)CFSTR("multiModalDictationBeganCount=%lu"), v42, v43, v40);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v45, (uint64_t)v44, v46, v47);

  objc_msgSend_componentsJoinedByString_(v8, v48, (uint64_t)CFSTR(", "), v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v52, (uint64_t)CFSTR(", %@"), v53, v54, v51);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  return v55;
}

- (int64_t)inputActionCount
{
  return 0;
}

- (unint64_t)dictationBeganCount
{
  return self->_dictationBeganCount;
}

- (void)setDictationBeganCount:(unint64_t)a3
{
  self->_dictationBeganCount = a3;
}

- (unint64_t)modelessUsedAtLeastOnceCount
{
  return self->_modelessUsedAtLeastOnceCount;
}

- (void)setModelessUsedAtLeastOnceCount:(unint64_t)a3
{
  self->_modelessUsedAtLeastOnceCount = a3;
}

- (unint64_t)multiModalDictationBeganCount
{
  return self->_multiModalDictationBeganCount;
}

- (void)setMultiModalDictationBeganCount:(unint64_t)a3
{
  self->_multiModalDictationBeganCount = a3;
}

- (IATextInputActionsSessionDictationBeganAction)initWithCoder:(id)a3
{
  id v4;
  IATextInputActionsSessionDictationBeganAction *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)IATextInputActionsSessionDictationBeganAction;
  v5 = -[IATextInputActionsSessionAction initWithCoder:](&v31, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, (uint64_t)CFSTR("dictationBeganCount"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_dictationBeganCount = objc_msgSend_unsignedLongValue(v9, v10, v11, v12, v13);

    v14 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, (uint64_t)CFSTR("modelessUsedAtLeastOnceCount"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_modelessUsedAtLeastOnceCount = objc_msgSend_unsignedLongValue(v17, v18, v19, v20, v21);

    v22 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, (uint64_t)CFSTR("multiModalDictationBeganCount"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_multiModalDictationBeganCount = objc_msgSend_unsignedLongValue(v25, v26, v27, v28, v29);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)IATextInputActionsSessionDictationBeganAction;
  v4 = a3;
  -[IATextInputActionsSessionAction encodeWithCoder:](&v23, sel_encodeWithCoder_, v4);
  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v5, self->_dictationBeganCount, v6, v7, v23.receiver, v23.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, (uint64_t)CFSTR("dictationBeganCount"), v10);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v11, self->_modelessUsedAtLeastOnceCount, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("modelessUsedAtLeastOnceCount"), v16);

  objc_msgSend_numberWithUnsignedLong_(MEMORY[0x24BDD16E0], v17, self->_multiModalDictationBeganCount, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v21, (uint64_t)v20, (uint64_t)CFSTR("multiModalDictationBeganCount"), v22);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
