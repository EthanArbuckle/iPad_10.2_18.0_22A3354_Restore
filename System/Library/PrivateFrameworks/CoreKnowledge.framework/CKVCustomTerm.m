@implementation CKVCustomTerm

- (CKVCustomTerm)initWithItemId:(id)a3 vocabularyType:(unsigned __int16)a4 term:(id)a5
{
  return -[CKVCustomTerm initWithItemId:vocabularyType:term:vocabularyId:](self, "initWithItemId:vocabularyType:term:vocabularyId:", a3, a4, a5, 0);
}

- (CKVCustomTerm)initWithItemId:(id)a3 vocabularyType:(unsigned __int16)a4 term:(id)a5 vocabularyId:(id)a6
{
  int v8;
  id v10;
  id v11;
  id v12;
  CKVCustomTerm *v13;
  uint64_t v14;
  NSString *itemId;
  NSString *v16;
  uint64_t v17;
  NSString *term;
  NSString *v19;
  uint64_t v20;
  NSString *vocabularyId;
  CKVCustomTerm *v22;
  void *v23;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v8 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v29.receiver = self;
  v29.super_class = (Class)CKVCustomTerm;
  v13 = -[CKVCustomTerm init](&v29, sel_init);
  if (!v13)
    goto LABEL_8;
  v14 = objc_msgSend(v10, "copy");
  itemId = v13->_itemId;
  v13->_itemId = (NSString *)v14;

  v16 = v13->_itemId;
  if (!v16 || !-[NSString length](v16, "length"))
    goto LABEL_11;
  v13->_vocabularyType = v8;
  if (!CKVCustomTypeIsValid(v8))
  {
    v23 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v25 = v23;
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      CKVCustomTypeToNumber(v13->_vocabularyType);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v31 = "-[CKVCustomTerm initWithItemId:vocabularyType:term:vocabularyId:]";
      v32 = 2112;
      v33 = v27;
      v34 = 2112;
      v35 = v28;
      _os_log_error_impl(&dword_1A48B3000, v25, OS_LOG_TYPE_ERROR, "%s Cannot construct %@ with invalid vocabularyType: %@", buf, 0x20u);

    }
    goto LABEL_11;
  }
  v17 = objc_msgSend(v11, "copy");
  term = v13->_term;
  v13->_term = (NSString *)v17;

  v19 = v13->_term;
  if (!v19 || !-[NSString length](v19, "length"))
  {
LABEL_11:
    v22 = 0;
    goto LABEL_12;
  }
  v20 = objc_msgSend(v12, "copy");
  vocabularyId = v13->_vocabularyId;
  v13->_vocabularyId = (NSString *)v20;

LABEL_8:
  v22 = v13;
LABEL_12:

  return v22;
}

- (CKVCustomTerm)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("You must use - initWithItemId:termType:term:vocabularyId"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CKVCustomTerm)initWithCoder:(id)a3
{
  id v4;
  CKVCustomTerm *v5;
  uint64_t v6;
  NSString *itemId;
  uint64_t v8;
  NSString *term;
  uint64_t v10;
  NSString *vocabularyId;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKVCustomTerm;
  v5 = -[CKVCustomTerm init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemId"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemId = v5->_itemId;
    v5->_itemId = (NSString *)v6;

    v5->_vocabularyType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("vocabType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("term"));
    v8 = objc_claimAutoreleasedReturnValue();
    term = v5->_term;
    v5->_term = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("vocabId"));
    v10 = objc_claimAutoreleasedReturnValue();
    vocabularyId = v5->_vocabularyId;
    v5->_vocabularyId = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *itemId;
  id v5;

  itemId = self->_itemId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemId, CFSTR("itemId"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_vocabularyType, CFSTR("vocabType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_term, CFSTR("term"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_vocabularyId, CFSTR("vocabId"));

}

- (NSString)description
{
  void *v3;
  NSString *itemId;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKVCustomTerm;
  -[CKVCustomTerm description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  itemId = self->_itemId;
  CKVCustomTypeToNumber(self->_vocabularyType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("%@: %@ %@: %@, %@: %@, %@: %@"), CFSTR("itemId"), itemId, CFSTR("vocabType"), v5, CFSTR("term"), self->_term, CFSTR("vocabId"), self->_vocabularyId);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  CKVCustomTerm *v4;
  CKVCustomTerm *v5;
  BOOL v6;

  v4 = (CKVCustomTerm *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[CKVCustomTerm isEqualToCustomTerm:](self, "isEqualToCustomTerm:", v5);

  return v6;
}

- (BOOL)isEqualToCustomTerm:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  NSString *itemId;
  NSString *v10;
  int v11;
  int v12;
  char v13;
  int vocabularyType;
  NSString *term;
  NSString *v16;
  uint64_t v17;
  int v18;
  NSString *vocabularyId;
  NSString *v20;
  uint64_t v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  int v27;

  v7 = a3;
  v8 = v7;
  if (!v7)
  {
    v13 = 0;
    goto LABEL_30;
  }
  itemId = self->_itemId;
  v10 = itemId;
  if (!itemId)
  {
    objc_msgSend(v7, "itemId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      vocabularyType = self->_vocabularyType;
      v12 = 0;
      v13 = 0;
      if (vocabularyType != objc_msgSend(v8, "vocabularyType"))
      {
LABEL_29:

        goto LABEL_30;
      }
      goto LABEL_12;
    }
    v10 = self->_itemId;
  }
  objc_msgSend(v8, "itemId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[NSString isEqual:](v10, "isEqual:", v4) & 1) == 0)
  {

    v13 = 0;
    goto LABEL_28;
  }
  v11 = self->_vocabularyType;
  if (v11 != objc_msgSend(v8, "vocabularyType"))
  {
    v13 = 0;
LABEL_27:

    goto LABEL_28;
  }
  v12 = 1;
LABEL_12:
  term = self->_term;
  v16 = term;
  if (!term)
  {
    objc_msgSend(v8, "term");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      v27 = v12;
      v26 = 0;
      v18 = 0;
      goto LABEL_19;
    }
    v26 = (void *)v17;
    v16 = self->_term;
  }
  objc_msgSend(v8, "term");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqual:](v16, "isEqual:", v5))
  {
    v13 = 0;
    goto LABEL_25;
  }
  v27 = v12;
  v18 = 1;
LABEL_19:
  vocabularyId = self->_vocabularyId;
  v20 = vocabularyId;
  if (!vocabularyId)
  {
    objc_msgSend(v8, "vocabularyId");
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      v24 = 0;
      v13 = 1;
LABEL_33:

      if ((v18 & 1) != 0)
        goto LABEL_24;
      goto LABEL_34;
    }
    v25 = (void *)v21;
    v20 = self->_vocabularyId;
  }
  objc_msgSend(v8, "vocabularyId");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NSString isEqual:](v20, "isEqual:", v22);

  if (!vocabularyId)
  {
    v24 = v25;
    goto LABEL_33;
  }
  if (v18)
  {
LABEL_24:
    v12 = v27;
LABEL_25:

    if (term)
      goto LABEL_26;
    goto LABEL_35;
  }
LABEL_34:
  v12 = v27;
  if (term)
  {
LABEL_26:
    if (!v12)
      goto LABEL_28;
    goto LABEL_27;
  }
LABEL_35:

  if ((v12 & 1) != 0)
    goto LABEL_27;
LABEL_28:
  if (!itemId)
    goto LABEL_29;
LABEL_30:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;

  v3 = -[NSString hash](self->_itemId, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_vocabularyType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v3 ^ -[NSString hash](self->_term, "hash");
  v7 = v5 ^ v6 ^ -[NSString hash](self->_vocabularyId, "hash");

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSString copyWithZone:](self->_itemId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(_WORD *)(v5 + 8) = self->_vocabularyType;
  v8 = -[NSString copyWithZone:](self->_term, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSString copyWithZone:](self->_vocabularyId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  return (id)v5;
}

- (id)toItemWithError:(id *)a3
{
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = objc_alloc_init(MEMORY[0x1E0D42BF0]);
  v6 = -[CKVCustomTerm vocabularyType](self, "vocabularyType");
  -[CKVCustomTerm itemId](self, "itemId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItemType:itemId:error:", 1, v7, a3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_6;
  v9 = (void *)v8;
  v10 = CKVCustomTypeToFieldType(v6);
  -[CKVCustomTerm term](self, "term");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFieldWithType:value:error:", v10, v11, a3);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

LABEL_6:
    goto LABEL_7;
  }
  v13 = (void *)v12;
  -[CKVCustomTerm vocabularyId](self, "vocabularyId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addFieldWithType:value:error:", 20, v14, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "buildItemWithError:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v16;
}

- (NSString)itemId
{
  return self->_itemId;
}

- (unsigned)vocabularyType
{
  return self->_vocabularyType;
}

- (NSString)term
{
  return self->_term;
}

- (NSString)vocabularyId
{
  return self->_vocabularyId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocabularyId, 0);
  objc_storeStrong((id *)&self->_term, 0);
  objc_storeStrong((id *)&self->_itemId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)customTermFromItem:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  CKVCustomTerm *v7;
  CKVCustomTerm *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v13;
  objc_class *v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  objc_class *v17;
  void *v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t v26[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "itemType") == 1)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v33 = __Block_byref_object_copy_;
    *(_QWORD *)&v34 = __Block_byref_object_dispose_;
    *((_QWORD *)&v34 + 1) = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    v25 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __36__CKVCustomTerm_customTermFromItem___block_invoke;
    v19[3] = &unk_1E4D28E30;
    v19[4] = &v20;
    v19[5] = buf;
    objc_msgSend(v3, "enumerateFieldsUsingBlock:", v19);
    v4 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "fieldType");
    if ((unint64_t)(v4 - 1) > 0x12)
      v5 = 0;
    else
      v5 = word_1A49251B0[v4 - 1];
    v8 = [CKVCustomTerm alloc];
    objc_msgSend(v3, "itemId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CKVCustomTerm initWithItemId:vocabularyType:term:vocabularyId:](v8, "initWithItemId:vocabularyType:term:vocabularyId:", v9, v5, v10, v21[5]);

    if (!v7)
    {
      v11 = (id)CKLogContextVocabulary;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v26 = 136315650;
        v27 = "+[CKVCustomTerm customTermFromItem:]";
        v28 = 2112;
        v29 = v18;
        v30 = 2112;
        v31 = v3;
        _os_log_error_impl(&dword_1A48B3000, v11, OS_LOG_TYPE_ERROR, "%s Failed to initialize %@ from item: %@", v26, 0x20u);

      }
    }
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v6 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      v13 = v6;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      KVItemTypeName();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "+[CKVCustomTerm customTermFromItem:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v3;
      *(_WORD *)&buf[22] = 2112;
      v33 = v15;
      LOWORD(v34) = 2112;
      *(_QWORD *)((char *)&v34 + 2) = v16;
      _os_log_error_impl(&dword_1A48B3000, v13, OS_LOG_TYPE_ERROR, "%s Unexpected item: %@ expected %@ with itemType: %@", buf, 0x2Au);

    }
    v7 = 0;
  }

  return v7;
}

void __36__CKVCustomTerm_customTermFromItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "fieldType") == 20)
  {
    objc_msgSend(v8, "value");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = v8;
    v5 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }

}

@end
