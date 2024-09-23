@implementation CLSQuestionStep

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D407E508;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB600 != -1)
    dispatch_once(&qword_1ED0FB600, block);
  return (id)qword_1ED0FB5F8;
}

- (CLSQuestionStep)init
{
  CLSQuestionStep *v2;
  const char *v3;
  const char *v4;
  const char *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLSQuestionStep;
  v2 = -[CLSObject _init](&v7, sel__init);
  objc_msgSend_setVersion_(v2, v3, 1);
  objc_msgSend_setType_(v2, v4, 1);
  objc_msgSend_setQuestionType_(v2, v5, 0);
  return v2;
}

- (CLSQuestionStep)initWithQuestionText:(id)a3 answerFormat:(id)a4
{
  id v7;
  id v8;
  id *v9;
  CLSQuestionStep *v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CLSQuestionStep;
  v9 = -[CLSObject _init](&v19, sel__init);
  v10 = (CLSQuestionStep *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 17, a3);
    v13 = objc_msgSend_answerFormatType(v8, v11, v12);
    if (v13 >= 5)
      v15 = 1;
    else
      v15 = v13;
    v10->_questionType = v15;
    objc_msgSend_setVersion_(v10, v14, 1);
    objc_msgSend_setType_(v10, v16, 1);
    objc_msgSend_addChild_changedPropertyName_(v10, v17, (uint64_t)v8, CFSTR("answerFormat"));
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSQuestionStep)initWithCoder:(id)a3
{
  id v4;
  CLSQuestionStep *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *questionText;
  const char *v10;
  const char *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CLSQuestionStep;
  v5 = -[CLSSurveyStep initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("questionText"));
    v8 = objc_claimAutoreleasedReturnValue();
    questionText = v5->_questionText;
    v5->_questionText = (NSString *)v8;

    v5->_displayOrder = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("displayOrder"));
    v5->_questionType = objc_msgSend_decodeIntegerForKey_(v4, v11, (uint64_t)CFSTR("questionType"));
  }

  return v5;
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
  uint64_t v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
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
  v45 = objc_msgSend_version(self, v43, v44);
  objc_msgSend_setVersion_(v10, v46, v45);
  v49 = objc_msgSend_displayOrder(self, v47, v48);
  objc_msgSend_setDisplayOrder_(v10, v50, v49);
  v53 = objc_msgSend_questionType(self, v51, v52);
  objc_msgSend_setQuestionType_(v10, v54, v53);
  objc_msgSend_questionText(self, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend_copy(v57, v58, v59);
  objc_msgSend_setQuestionText_(v10, v61, (uint64_t)v60);

  objc_msgSend_answerFormat(self, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)objc_msgSend_copy(v64, v65, v66);
  objc_msgSend_setAnswerFormat_(v10, v68, (uint64_t)v67);

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  objc_msgSend_assets(self, v69, v70, 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v72, (uint64_t)&v82, v86, 16);
  if (v73)
  {
    v76 = v73;
    v77 = *(_QWORD *)v83;
    do
    {
      v78 = 0;
      do
      {
        if (*(_QWORD *)v83 != v77)
          objc_enumerationMutation(v71);
        v79 = (void *)objc_msgSend_copy(*(void **)(*((_QWORD *)&v82 + 1) + 8 * v78), v74, v75);
        objc_msgSend_addAsset_(v10, v80, (uint64_t)v79);

        ++v78;
      }
      while (v76 != v78);
      v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v74, (uint64_t)&v82, v86, 16);
    }
    while (v76);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSQuestionStep;
  v4 = a3;
  -[CLSSurveyStep encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_questionText, CFSTR("questionText"), v8.receiver, v8.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_displayOrder, CFSTR("displayOrder"));
  objc_msgSend_encodeInteger_forKey_(v4, v7, self->_questionType, CFSTR("questionType"));

}

- (CLSAnswerFormat)answerFormat
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend_childrenPassingTest_(self, a2, (uint64_t)&unk_1E9749B30);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (CLSAnswerFormat *)v5;
}

- (void)setAnswerFormat:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend_answerFormat(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeChild_changedPropertyName_(self, v8, (uint64_t)v7, CFSTR("answerFormat"));

  objc_msgSend_addChild_changedPropertyName_(self, v9, (uint64_t)v4, CFSTR("answerFormat"));
  v12 = objc_msgSend_answerFormatType(v4, v10, v11);

  if (v12 >= 5)
    v14 = 1;
  else
    v14 = v12;
  objc_msgSend_setQuestionType_(self, v13, v14);
}

- (int64_t)questionType
{
  uint64_t v2;
  int64_t questionType;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  questionType = self->_questionType;
  objc_msgSend_unlock(self, v5, v6);
  return questionType;
}

- (void)setQuestionType:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_questionType != a3)
  {
    self->_questionType = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (int64_t)displayOrder
{
  uint64_t v2;
  int64_t displayOrder;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  displayOrder = self->_displayOrder;
  objc_msgSend_unlock(self, v5, v6);
  return displayOrder;
}

- (void)setDisplayOrder:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_displayOrder != a3)
  {
    self->_displayOrder = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (NSString)questionText
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_questionText;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setQuestionText:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *questionText;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  questionText = self->_questionText;
  v12 = (id)v8;
  if (v8 | (unint64_t)questionText
    && (!v8 || !questionText || (objc_msgSend_isEqualToString_(questionText, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_questionText, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)mergeWithObject:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSQuestionStep;
  -[CLSObject mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("questionText");
  v22[1] = CFSTR("displayOrder");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 2);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v16, v21, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend_valueForKey_(v4, v9, v13, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setValue_forKey_(self, v15, (uint64_t)v14, v13);

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v16, v21, 16);
    }
    while (v10);
  }

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  char v24;
  char v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  char v66;
  void *v67;
  void *v69;
  char v70;
  void *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  char v100;
  void *v101;
  char v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = 0;
    goto LABEL_43;
  }
  v9 = v8;
  objc_msgSend_objectID(self, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend_objectID(v9, v12, v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v24 = 0;
      goto LABEL_11;
    }
  }
  objc_msgSend_objectID(self, v12, v13);
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_39;
  v4 = (void *)v15;
  objc_msgSend_objectID(v9, v16, v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_38:

    goto LABEL_39;
  }
  objc_msgSend_objectID(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectID(v9, v21, v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v20, v23, (uint64_t)v6) & 1) == 0)
  {

    goto LABEL_38;
  }
  v104 = v6;
  v105 = v20;
  v24 = 1;
LABEL_11:
  objc_msgSend_parentObjectID(self, v12, v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28 || (objc_msgSend_parentObjectID(v9, v26, v27), (v107 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_parentObjectID(self, v26, v27);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!v29)
      goto LABEL_34;
    v106 = (void *)v29;
    objc_msgSend_parentObjectID(v9, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {

      if (!v28)
      {

        if ((v24 & 1) == 0)
          goto LABEL_39;
        goto LABEL_37;
      }
      goto LABEL_36;
    }
    v103 = v3;
    v101 = (void *)v32;
    objc_msgSend_parentObjectID(self, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parentObjectID(v9, v36, v37);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v35, v38, (uint64_t)v6) & 1) == 0)
    {

      if (v28)
      else

      v3 = v103;
      if ((v24 & 1) == 0)
        goto LABEL_39;
      goto LABEL_37;
    }
    v99 = v35;
    v102 = v24;
    v100 = 1;
  }
  else
  {
    v103 = v3;
    v102 = v24;
    v107 = 0;
    v100 = 0;
  }
  v39 = objc_msgSend_type(self, v26, v27);
  if (v39 == objc_msgSend_type(v9, v40, v41))
  {
    v44 = objc_msgSend_version(self, v42, v43);
    if (v44 == objc_msgSend_version(v9, v45, v46))
    {
      objc_msgSend_questionText(self, v47, v48);
      v98 = objc_claimAutoreleasedReturnValue();
      if (v98 || (objc_msgSend_questionText(v9, v49, v50), (v97 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend_questionText(self, v49, v50);
        v51 = objc_claimAutoreleasedReturnValue();
        if (!v51)
          goto LABEL_70;
        v54 = (void *)v51;
        objc_msgSend_questionText(v9, v52, v53);
        v55 = objc_claimAutoreleasedReturnValue();
        v58 = v102;
        if (!v55)
        {

          v25 = 0;
          goto LABEL_50;
        }
        v96 = (void *)v55;
        objc_msgSend_questionText(self, v56, v57);
        v59 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_questionText(v9, v60, v61);
        v62 = objc_claimAutoreleasedReturnValue();
        v95 = (void *)v59;
        v63 = (void *)v59;
        v64 = (void *)v62;
        if (!objc_msgSend_isEqualToString_(v63, v65, v62))
        {
          v25 = 0;
          goto LABEL_53;
        }
        v93 = v64;
        v94 = v54;
        v66 = 1;
      }
      else
      {
        v97 = 0;
        v66 = 0;
      }
      v72 = objc_msgSend_questionType(self, v49, v50);
      if (v72 == objc_msgSend_questionType(v9, v73, v74))
      {
        v77 = objc_msgSend_displayOrder(self, v75, v76);
        if (v77 == objc_msgSend_displayOrder(v9, v78, v79))
        {
          objc_msgSend_answerFormat(self, v80, v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_answerFormat(v9, v83, v84);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_isEqual_(v82, v85, (uint64_t)v92))
          {
            objc_msgSend_assets(v9, v86, v87);
            v91 = v82;
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend_assetsEqual_(self, v89, (uint64_t)v88);

            if ((v66 & 1) != 0)
            {
              v64 = v93;
              v54 = v94;
LABEL_53:

              v69 = (void *)v98;
              v58 = v102;
              if (!v98)
                goto LABEL_54;
              goto LABEL_51;
            }
            v58 = v102;
LABEL_50:
            v69 = (void *)v98;
            if (!v98)
            {
LABEL_54:
              v70 = v58;
              v71 = v69;

              v58 = v70;
              goto LABEL_55;
            }
LABEL_51:

LABEL_55:
            if ((v100 & 1) != 0)
            {

            }
            v3 = v103;
            if (!v28)

            if ((v58 & 1) != 0)
            {

            }
            goto LABEL_40;
          }

        }
      }
      if ((v66 & 1) == 0)
      {
        v24 = v102;
        v90 = (void *)v98;
        if (!v98)
          v90 = v97;
        goto LABEL_74;
      }

LABEL_70:
      v24 = v102;
      v90 = (void *)v98;
      if (!v98)
      {

        v90 = 0;
      }
LABEL_74:

      goto LABEL_32;
    }
  }
  v24 = v102;
LABEL_32:
  if ((v100 & 1) != 0)
  {

    v3 = v103;
LABEL_34:
    v67 = v107;
    if (v28)
      goto LABEL_36;
    goto LABEL_35;
  }
  v67 = v107;
  v3 = v103;
  if (!v28)
LABEL_35:

LABEL_36:
  if ((v24 & 1) != 0)
  {
LABEL_37:

    goto LABEL_38;
  }
LABEL_39:
  v25 = 0;
LABEL_40:
  if (!v14)

LABEL_43:
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
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  unint64_t v37;

  objc_msgSend_objectID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);

  objc_msgSend_parentObjectID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;

  v16 = v13 ^ (2 * objc_msgSend_type(self, v14, v15));
  v19 = v16 ^ (4 * objc_msgSend_version(self, v17, v18));
  v22 = v19 ^ (8 * objc_msgSend_questionType(self, v20, v21));
  v25 = v22 ^ (16 * objc_msgSend_displayOrder(self, v23, v24));
  objc_msgSend_questionText(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_hash(v28, v29, v30);

  objc_msgSend_answerFormat(self, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v25 ^ v31 ^ objc_msgSend_hash(v34, v35, v36);

  return v37;
}

- (BOOL)assetsEqual:(id)a3
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
  objc_msgSend_assets(self, v5, v6);
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

- (NSArray)assets
{
  uint64_t v3;
  const char *v4;

  v3 = objc_opt_class();
  return (NSArray *)objc_msgSend_childrenOfClass_(self, v4, v3);
}

- (void)addAsset:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  id v8;

  v8 = a3;
  if (objc_msgSend_type(v8, v4, v5) != 3)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  objc_msgSend_becomeChildOf_(v8, v6, (uint64_t)self);

}

- (void)removeAsset:(id)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  id v7;
  id v8;

  v8 = a3;
  if (objc_msgSend_type(v8, v4, v5) != 3)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  objc_msgSend_removeChild_changedPropertyName_(self, v6, (uint64_t)v8, CFSTR("assets"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->assets, 0);
  objc_storeStrong((id *)&self->_questionText, 0);
}

@end
