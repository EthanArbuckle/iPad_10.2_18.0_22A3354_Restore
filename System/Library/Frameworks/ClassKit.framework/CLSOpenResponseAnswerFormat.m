@implementation CLSOpenResponseAnswerFormat

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D40563E8;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB388 != -1)
    dispatch_once(&qword_1ED0FB388, block);
  return (id)qword_1ED0FB380;
}

- (CLSOpenResponseAnswerFormat)initWithType:(int64_t)a3
{
  CLSOpenResponseAnswerFormat *v4;
  const char *v5;
  CLSOpenResponseAnswerFormat *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSOpenResponseAnswerFormat;
  v4 = -[CLSAnswerFormat _init](&v8, sel__init);
  v6 = v4;
  if (v4)
  {
    v4->_type = a3;
    v4->_minimumTextLength = 0;
    v4->_maximumTextLength = 1600;
    objc_msgSend_setAnswerFormatType_(v4, v5, 3);
  }
  return v6;
}

- (CLSOpenResponseAnswerFormat)initWithType:(int64_t)a3 starterText:(id)a4 minimumLength:(int64_t)a5 maximumLength:(int64_t)a6
{
  id v11;
  const char *v12;
  uint64_t v13;
  CLSOpenResponseAnswerFormat *v14;

  v11 = a4;
  v13 = objc_msgSend_initWithType_(self, v12, a3);
  v14 = (CLSOpenResponseAnswerFormat *)v13;
  if (v13)
  {
    objc_storeStrong((id *)(v13 + 128), a4);
    v14->_minimumTextLength = a5;
    v14->_maximumTextLength = a6;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSOpenResponseAnswerFormat)initWithCoder:(id)a3
{
  id v4;
  CLSOpenResponseAnswerFormat *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSString *teacherProvidedText;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CLSOpenResponseAnswerFormat;
  v5 = -[CLSAnswerFormat initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("teacherProvidedText"));
    v8 = objc_claimAutoreleasedReturnValue();
    teacherProvidedText = v5->_teacherProvidedText;
    v5->_teacherProvidedText = (NSString *)v8;

    v5->_minimumTextLength = objc_msgSend_decodeIntegerForKey_(v4, v10, (uint64_t)CFSTR("minimumTextLength"));
    v5->_maximumTextLength = objc_msgSend_decodeIntegerForKey_(v4, v11, (uint64_t)CFSTR("maximumTextLength"));
    v5->_type = objc_msgSend_decodeIntegerForKey_(v4, v12, (uint64_t)CFSTR("type"));
    v5->_allowsMultimedia = objc_msgSend_decodeBoolForKey_(v4, v13, (uint64_t)CFSTR("allowsMultimedia"));
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
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;

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
  objc_msgSend_teacherProvidedText(self, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend_copy(v49, v50, v51);
  objc_msgSend_setTeacherProvidedText_(v10, v53, (uint64_t)v52);

  v56 = objc_msgSend_maximumTextLength(self, v54, v55);
  objc_msgSend_setMaximumTextLength_(v10, v57, v56);
  v60 = objc_msgSend_minimumTextLength(self, v58, v59);
  objc_msgSend_setMinimumTextLength_(v10, v61, v60);
  v64 = objc_msgSend_allowsMultimedia(self, v62, v63);
  objc_msgSend_setAllowsMultimedia_(v10, v65, v64);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLSOpenResponseAnswerFormat;
  v4 = a3;
  -[CLSAnswerFormat encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_minimumTextLength, CFSTR("minimumTextLength"), v10.receiver, v10.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_maximumTextLength, CFSTR("maximumTextLength"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_teacherProvidedText, CFSTR("teacherProvidedText"));
  objc_msgSend_encodeInteger_forKey_(v4, v8, self->_type, CFSTR("type"));
  objc_msgSend_encodeBool_forKey_(v4, v9, self->_allowsMultimedia, CFSTR("allowsMultimedia"));

}

- (int64_t)maximumTextLength
{
  uint64_t v2;
  int64_t maximumTextLength;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  maximumTextLength = self->_maximumTextLength;
  objc_msgSend_unlock(self, v5, v6);
  return maximumTextLength;
}

- (void)setMaximumTextLength:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_maximumTextLength != a3)
  {
    self->_maximumTextLength = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (int64_t)minimumTextLength
{
  uint64_t v2;
  int64_t minimumTextLength;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  minimumTextLength = self->_minimumTextLength;
  objc_msgSend_unlock(self, v5, v6);
  return minimumTextLength;
}

- (void)setMinimum:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_minimumTextLength != a3)
  {
    self->_minimumTextLength = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (NSString)teacherProvidedText
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_teacherProvidedText;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setTeacherProvidedText:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *teacherProvidedText;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  teacherProvidedText = self->_teacherProvidedText;
  v12 = (id)v8;
  if (v8 | (unint64_t)teacherProvidedText
    && (!v8
     || !teacherProvidedText
     || (objc_msgSend_isEqualToString_(teacherProvidedText, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_teacherProvidedText, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (void)setAllowsMultimedia:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend_lock(self, a2, a3);
  if (self->_allowsMultimedia != v3)
  {
    self->_allowsMultimedia = v3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (BOOL)allowsMultimedia
{
  uint64_t v2;
  BOOL allowsMultimedia;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  allowsMultimedia = self->_allowsMultimedia;
  objc_msgSend_unlock(self, v5, v6);
  return allowsMultimedia;
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
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSOpenResponseAnswerFormat;
  -[CLSObject mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("maximumTextLength");
  v22[1] = CFSTR("minimumTextLength");
  v22[2] = CFSTR("teacherProvidedText");
  v22[3] = CFSTR("type");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 4);
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

- (BOOL)validateObject:(id *)a3
{
  _BOOL4 v5;
  uint64_t maximumTextLength;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CLSOpenResponseAnswerFormat;
  v5 = -[CLSAnswerFormat validateObject:](&v31, sel_validateObject_);
  if (v5)
  {
    maximumTextLength = self->_maximumTextLength;
    if (maximumTextLength >= 5001)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = (void *)MEMORY[0x1E0CB34D0];
      v9 = objc_opt_class();
      objc_msgSend_bundleForClass_(v8, v10, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v11, v12, (uint64_t)CFSTR("ERROR_DESCRIPTION_OPEN_RESPONSE_EXCEED_MAX_LENGTH_VALUE_FORMAT"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v7, v14, (uint64_t)v13, 5000);
LABEL_8:
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v29, (uint64_t)a3, 6, self, v19);
      goto LABEL_9;
    }
    if (!self->_type)
    {
      v23 = (void *)MEMORY[0x1E0CB3940];
      v24 = (void *)MEMORY[0x1E0CB34D0];
      v25 = objc_opt_class();
      objc_msgSend_bundleForClass_(v24, v26, v25);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v11, v27, (uint64_t)CFSTR("ERROR_DESCRIPTION_UNKNOWN_OPEN_RESPONSE_TYPE"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v23, v28, (uint64_t)v13);
      goto LABEL_8;
    }
    if (self->_minimumTextLength > maximumTextLength)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = (void *)MEMORY[0x1E0CB34D0];
      v17 = objc_opt_class();
      objc_msgSend_bundleForClass_(v16, v18, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v19, v20, (uint64_t)CFSTR("ERROR_DESCRIPTION_OPEN_RESPONSE_ANSWER_INVALID_MINMAX_TEXT_LENGTH"), &stru_1E974C8A0, CFSTR("ClassKit"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_cls_assignError_code_errorObject_description_(v15, v22, (uint64_t)a3, 2, self, v21);

LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
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
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  BOOL v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
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
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  void *v63;
  void *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  int v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  char v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  char v94;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = 0;
    goto LABEL_52;
  }
  v10 = v9;
  objc_msgSend_objectID(self, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 || (objc_msgSend_objectID(v10, v13, v14), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_objectID(self, v13, v14);
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_48;
    v4 = (void *)v16;
    objc_msgSend_objectID(v10, v17, v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend_objectID(self, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectID(v10, v22, v23);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToString_(v21, v24, (uint64_t)v6) & 1) != 0)
      {
        v92 = v21;
        v94 = 1;
        goto LABEL_11;
      }

    }
LABEL_47:

    goto LABEL_48;
  }
  v94 = 0;
LABEL_11:
  objc_msgSend_parentObjectID(self, v13, v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    objc_msgSend_parentObjectID(v10, v26, v27);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v93)
    {
      v91 = v6;
      v88 = v3;
      v93 = 0;
      v87 = 0;
      goto LABEL_23;
    }
  }
  objc_msgSend_parentObjectID(self, v26, v27);
  v29 = objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    v25 = 0;
LABEL_34:
    v63 = v93;
    if (v28)
      goto LABEL_38;
    goto LABEL_37;
  }
  v32 = (void *)v29;
  objc_msgSend_parentObjectID(v10, v30, v31);
  v33 = objc_claimAutoreleasedReturnValue();
  if (!v33)
  {

    if (v28)
    else

    if ((v94 & 1) == 0)
      goto LABEL_48;

    goto LABEL_46;
  }
  v90 = (void *)v33;
  v91 = v6;
  v89 = v32;
  objc_msgSend_parentObjectID(self, v34, v35);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parentObjectID(v10, v36, v37);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v7, v38, (uint64_t)v6) & 1) != 0)
  {
    v86 = v7;
    v88 = v3;
    v87 = 1;
LABEL_23:
    v39 = objc_msgSend_type(self, v26, v27);
    if (v39 != objc_msgSend_type(v10, v40, v41)
      || (v44 = objc_msgSend_answerFormatType(self, v42, v43), v44 != objc_msgSend_answerFormatType(v10, v45, v46)))
    {
      v25 = 0;
      v3 = v88;
LABEL_32:
      if ((v87 & 1) == 0)
      {
        v63 = v93;
        v6 = v91;
        if (v28)
          goto LABEL_38;
        goto LABEL_37;
      }

      v6 = v91;
      goto LABEL_34;
    }
    objc_msgSend_teacherProvidedText(self, v47, v48);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (v85
      || (objc_msgSend_teacherProvidedText(v10, v49, v50), (v84 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend_teacherProvidedText(self, v49, v50);
      v51 = objc_claimAutoreleasedReturnValue();
      v3 = v88;
      if (!v51)
      {
LABEL_64:
        v65 = v85;
        if (!v85)
        {

          v65 = 0;
        }
        v25 = 0;
        goto LABEL_67;
      }
      v83 = (void *)v51;
      objc_msgSend_teacherProvidedText(v10, v52, v53);
      v54 = objc_claimAutoreleasedReturnValue();
      if (!v54)
      {

        v25 = 0;
        goto LABEL_56;
      }
      v82 = (void *)v54;
      objc_msgSend_teacherProvidedText(self, v55, v56);
      v57 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_teacherProvidedText(v10, v58, v59);
      v60 = objc_claimAutoreleasedReturnValue();
      v81 = (void *)v57;
      v61 = (void *)v57;
      v7 = (void *)v60;
      if (!objc_msgSend_isEqualToString_(v61, v62, v60))
      {
        v25 = 0;
LABEL_55:

LABEL_56:
        v65 = v85;
        if (v85)
        {

LABEL_72:
          if ((v87 & 1) != 0)
          {

          }
          v6 = v91;
          if (v28)
            goto LABEL_38;
          v63 = v93;
LABEL_37:

LABEL_38:
          if ((v94 & 1) != 0)
          {

          }
          goto LABEL_49;
        }
LABEL_71:
        v79 = v65;

        goto LABEL_72;
      }
      v80 = 1;
    }
    else
    {
      v84 = 0;
      v80 = 0;
    }
    v66 = objc_msgSend_maximumTextLength(self, v49, v50);
    if (v66 != objc_msgSend_maximumTextLength(v10, v67, v68)
      || (v71 = objc_msgSend_allowsMultimedia(self, v69, v70),
          v71 != objc_msgSend_allowsMultimedia(v10, v72, v73)))
    {
      if ((v80 & 1) != 0)
      {

      }
      v3 = v88;
      goto LABEL_64;
    }
    v76 = objc_msgSend_minimumTextLength(self, v74, v75);
    v25 = v76 == objc_msgSend_minimumTextLength(v10, v77, v78);
    if ((v80 & 1) == 0)
    {
      v3 = v88;
      v65 = v85;
      if (v85)
      {
LABEL_67:

        goto LABEL_32;
      }
      goto LABEL_71;
    }
    v3 = v88;
    goto LABEL_55;
  }

  if (v28)
  else

  if ((v94 & 1) != 0)
  {

LABEL_46:
    goto LABEL_47;
  }
LABEL_48:
  v25 = 0;
LABEL_49:
  if (!v15)

LABEL_52:
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
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;

  objc_msgSend_objectID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);

  objc_msgSend_parentObjectID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;

  v16 = v13 ^ (2 * objc_msgSend_type(self, v14, v15));
  objc_msgSend_teacherProvidedText(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v16 ^ objc_msgSend_hash(v19, v20, v21);

  v25 = v22 ^ (4 * objc_msgSend_answerFormatType(self, v23, v24));
  v28 = v25 ^ (8 * objc_msgSend_maximumTextLength(self, v26, v27));
  v31 = v28 ^ (16 * objc_msgSend_minimumTextLength(self, v29, v30));
  v34 = objc_msgSend_allowsMultimedia(self, v32, v33);
  v35 = 32;
  if (!v34)
    v35 = 0;
  return v31 ^ v35;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setMinimumTextLength:(int64_t)a3
{
  self->_minimumTextLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teacherProvidedText, 0);
}

@end
