@implementation CLSMultipleChoiceAnswerFormat

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLSMultipleChoiceAnswerFormat;
  return -[CLSAnswerFormat _init](&v3, sel__init);
}

- (CLSMultipleChoiceAnswerFormat)initWithType:(int64_t)a3
{
  CLSMultipleChoiceAnswerFormat *v4;
  const char *v5;
  CLSMultipleChoiceAnswerFormat *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLSMultipleChoiceAnswerFormat;
  v4 = -[CLSAnswerFormat _init](&v9, sel__init);
  v6 = v4;
  if (v4)
  {
    v4->_type = a3;
    v7 = 4;
    if (a3 == 1)
      v7 = 2;
    if (a3)
      objc_msgSend_setAnswerFormatType_(v4, v5, v7);
    else
      objc_msgSend_setAnswerFormatType_(v4, v5, 0);
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = (void *)objc_msgSend__init(v7, v8, v9);
  objc_msgSend_objectID(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend_copy(v13, v14, v15);
  objc_msgSend_setObjectID_(v10, v17, (uint64_t)v16);

  objc_msgSend_dateCreated(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_copy(v20, v21, v22);
  objc_msgSend_setDateCreated_(v10, v24, (uint64_t)v23);

  objc_msgSend_dateLastModified(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend_copy(v27, v28, v29);
  objc_msgSend_setDateLastModified_(v10, v31, (uint64_t)v30);

  objc_msgSend_parentObjectID(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend_copy(v34, v35, v36);
  objc_msgSend_setParentObjectID_(v10, v38, (uint64_t)v37);

  v41 = objc_msgSend_type(self, v39, v40);
  objc_msgSend_setType_(v10, v42, v41);
  v45 = objc_msgSend_answerFormatType(self, v43, v44);
  objc_msgSend_setAnswerFormatType_(v10, v46, v45);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend_answerChoiceItems(self, v47, v48, 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v60, v64, 16);
  if (v51)
  {
    v54 = v51;
    v55 = *(_QWORD *)v61;
    do
    {
      v56 = 0;
      do
      {
        if (*(_QWORD *)v61 != v55)
          objc_enumerationMutation(v49);
        v57 = (void *)objc_msgSend_copy(*(void **)(*((_QWORD *)&v60 + 1) + 8 * v56), v52, v53);
        objc_msgSend_addAnswerItem_(v10, v58, (uint64_t)v57);

        ++v56;
      }
      while (v54 != v56);
      v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v52, (uint64_t)&v60, v64, 16);
    }
    while (v54);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSMultipleChoiceAnswerFormat)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSMultipleChoiceAnswerFormat *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CLSMultipleChoiceAnswerFormat;
  v6 = -[CLSAnswerFormat initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v6)
    v6->_type = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("type"));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSMultipleChoiceAnswerFormat;
  v4 = a3;
  -[CLSAnswerFormat encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_type, CFSTR("type"), v6.receiver, v6.super_class);

}

- (int64_t)type
{
  uint64_t v2;
  int64_t type;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  type = self->_type;
  objc_msgSend_unlock(self, v5, v6);
  return type;
}

- (void)setType:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_type != a3)
  {
    self->_type = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (BOOL)validateObject:(id *)a3
{
  _BOOL4 v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CLSMultipleChoiceAnswerFormat;
  v5 = -[CLSAnswerFormat validateObject:](&v29, sel_validateObject_);
  if (v5)
  {
    if (self->_type)
    {
      objc_msgSend_answerChoiceItems(self, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend_count(v8, v9, v10);

      if (v11 < 6)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (void *)MEMORY[0x1E0CB34D0];
      v14 = objc_opt_class();
      objc_msgSend_bundleForClass_(v13, v15, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v16, v17, (uint64_t)CFSTR("ERROR_DESCRIPTION_MULTIPLE_CHOICE_EXCEED_ALLOWED_NUMBER_FORMAT"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v12, v19, (uint64_t)v18, 5);
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      v21 = (void *)MEMORY[0x1E0CB34D0];
      v22 = objc_opt_class();
      objc_msgSend_bundleForClass_(v21, v23, v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v16, v24, (uint64_t)CFSTR("ERROR_DESCRIPTION_UNKNOWN_MULTIPLE_CHOICE_TYPE"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v20, v25, (uint64_t)v18);
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v27, (uint64_t)a3, 6, self, v26);
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (NSArray)answerChoiceItems
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (void)addAnswerItem:(id)a3
{
  objc_msgSend_addChild_changedPropertyName_(self, a2, (uint64_t)a3, CFSTR("answerChoiceItems"));
}

- (void)removeAnswerItem:(id)a3
{
  objc_msgSend_removeChild_changedPropertyName_(self, a2, (uint64_t)a3, CFSTR("answerChoiceItems"));
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  char v24;
  char v25;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  char v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  char v64;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = 0;
    goto LABEL_15;
  }
  v10 = v9;
  objc_msgSend_objectID(self, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend_objectID(v10, v13, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v24 = 0;
      goto LABEL_17;
    }
  }
  objc_msgSend_objectID(self, v13, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_11;
  v4 = (void *)v16;
  objc_msgSend_objectID(v10, v17, v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend_objectID(self, v19, v20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectID(v10, v21, v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v3, v23, (uint64_t)v7) & 1) == 0)
  {

    goto LABEL_10;
  }
  v61 = v7;
  v62 = v3;
  v24 = 1;
LABEL_17:
  v64 = v24;
  objc_msgSend_parentObjectID(self, v13, v14);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29 || (objc_msgSend_parentObjectID(v10, v27, v28), (v63 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_parentObjectID(self, v27, v28);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!v30)
      goto LABEL_38;
    v3 = (void *)v30;
    objc_msgSend_parentObjectID(v10, v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v60 = (void *)v33;
      objc_msgSend_parentObjectID(self, v34, v35);
      v36 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_parentObjectID(v10, v37, v38);
      v39 = objc_claimAutoreleasedReturnValue();
      v59 = (void *)v36;
      v40 = (void *)v36;
      v7 = (void *)v39;
      if (!objc_msgSend_isEqualToString_(v40, v41, v39))
      {
        v25 = 0;
        goto LABEL_26;
      }
      v58 = 1;
      v44 = objc_msgSend_type(self, v42, v43, v6);
      goto LABEL_30;
    }

    if (v29)
    else

    if ((v64 & 1) != 0)
    {

      goto LABEL_10;
    }
LABEL_11:
    v25 = 0;
    goto LABEL_12;
  }
  v63 = 0;
  v58 = 0;
  v44 = objc_msgSend_type(self, v27, v28, v6);
LABEL_30:
  if (v44 == objc_msgSend_type(v10, v45, v46))
  {
    v49 = objc_msgSend_answerFormatType(self, v47, v48);
    if (v49 == objc_msgSend_answerFormatType(v10, v50, v51))
    {
      objc_msgSend_answerChoiceItems(v10, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend_answerChoiceArraysEqual_(self, v55, (uint64_t)v54);

      v6 = v57;
      if ((v58 & 1) == 0)
      {
        v56 = v64;
        if (v29)
          goto LABEL_41;
        goto LABEL_44;
      }
LABEL_26:

      if (v29)
      {

        if ((v64 & 1) != 0)
          goto LABEL_42;
        goto LABEL_12;
      }
      v56 = v64;
LABEL_44:

      goto LABEL_41;
    }
  }
  if ((v58 & 1) != 0)
  {

  }
  v6 = v57;
LABEL_38:
  v56 = v64;
  if (!v29)

  v25 = 0;
LABEL_41:

  if ((v56 & 1) != 0)
  {
LABEL_42:

  }
LABEL_12:
  if (!v15)

LABEL_15:
  return v25;
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  unint64_t v25;

  objc_msgSend_objectID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);

  objc_msgSend_parentObjectID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;

  v16 = v13 ^ (2 * objc_msgSend_type(self, v14, v15));
  v19 = v16 ^ (4 * objc_msgSend_answerFormatType(self, v17, v18));
  objc_msgSend_answerChoiceItems(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v19 ^ objc_msgSend_hash(v22, v23, v24);

  return v25;
}

- (BOOL)answerChoiceArraysEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t i;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  char isEqual;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_answerChoiceItems(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_count(v7, v8, v9);
  if (v10 == objc_msgSend_count(v4, v11, v12))
  {
    objc_msgSend_sortDescriptorWithKey_ascending_(MEMORY[0x1E0CB3928], v13, (uint64_t)CFSTR("displayOrder"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v14;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v15, (uint64_t)v34, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend_sortedArrayUsingDescriptors_(v7, v17, (uint64_t)v16);
      v19 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_sortedArrayUsingDescriptors_(v4, v20, (uint64_t)v16);
      v21 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v19;
      v4 = (id)v21;
    }
    v22 = objc_msgSend_count(v7, v17, v18);
    if (v22 < 1)
    {
      v24 = 1;
    }
    else
    {
      v23 = v22;
      v24 = 0;
      for (i = 0; i != v23; v24 = i >= v23)
      {
        v26 = (void *)MEMORY[0x1D82573E4]();
        objc_msgSend_objectAtIndexedSubscript_(v7, v27, i);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v4, v29, i);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v28, v31, (uint64_t)v30);

        objc_autoreleasePoolPop(v26);
        if ((isEqual & 1) == 0)
          break;
        ++i;
      }
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40CB26C;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB930 != -1)
    dispatch_once(&qword_1ED0FB930, block);
  return (id)qword_1ED0FB928;
}

@end
