@implementation CLSSliderAnswerFormat

+ (id)relations
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D408CE7C;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB708 != -1)
    dispatch_once(&qword_1ED0FB708, block);
  return (id)qword_1ED0FB700;
}

- (CLSSliderAnswerFormat)init
{
  CLSSliderAnswerFormat *v2;
  const char *v3;
  CLSSliderAnswerFormat *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSSliderAnswerFormat;
  v2 = -[CLSAnswerFormat _init](&v6, sel__init);
  v4 = v2;
  if (v2)
  {
    v2->_type = 1;
    v2->_minimum = 0;
    v2->_maximum = 100;
    objc_msgSend_setAnswerFormatType_(v2, v3, 1);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSSliderAnswerFormat)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  CLSSliderAnswerFormat *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  NSString *leadingValueLabel;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSString *trailingValueLabel;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSString *midValueLabel;
  const char *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CLSSliderAnswerFormat;
  v6 = -[CLSAnswerFormat initWithCoder:](&v22, sel_initWithCoder_, v4);
  if (v6)
  {
    v6->_maximum = objc_msgSend_decodeIntegerForKey_(v4, v5, (uint64_t)CFSTR("maximum"));
    v6->_minimum = objc_msgSend_decodeIntegerForKey_(v4, v7, (uint64_t)CFSTR("minimum"));
    v8 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, CFSTR("leadingValueLabel"));
    v10 = objc_claimAutoreleasedReturnValue();
    leadingValueLabel = v6->_leadingValueLabel;
    v6->_leadingValueLabel = (NSString *)v10;

    v12 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, CFSTR("trailingValueLabel"));
    v14 = objc_claimAutoreleasedReturnValue();
    trailingValueLabel = v6->_trailingValueLabel;
    v6->_trailingValueLabel = (NSString *)v14;

    v16 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, CFSTR("midValueLabel"));
    v18 = objc_claimAutoreleasedReturnValue();
    midValueLabel = v6->_midValueLabel;
    v6->_midValueLabel = (NSString *)v18;

    v6->_type = objc_msgSend_decodeIntegerForKey_(v4, v20, (uint64_t)CFSTR("type"));
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
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;

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
  objc_msgSend_leadingValueLabel(self, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend_copy(v49, v50, v51);
  objc_msgSend_setLeadingValueLabel_(v10, v53, (uint64_t)v52);

  objc_msgSend_midValueLabel(self, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend_copy(v56, v57, v58);
  objc_msgSend_setMidValueLabel_(v10, v60, (uint64_t)v59);

  objc_msgSend_trailingValueLabel(self, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend_copy(v63, v64, v65);
  objc_msgSend_setTrailingValueLabel_(v10, v67, (uint64_t)v66);

  v70 = objc_msgSend_maximum(self, v68, v69);
  objc_msgSend_setMaximum_(v10, v71, v70);
  v74 = objc_msgSend_minimum(self, v72, v73);
  objc_msgSend_setMinimum_(v10, v75, v74);
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
  const char *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLSSliderAnswerFormat;
  v4 = a3;
  -[CLSAnswerFormat encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeInteger_forKey_(v4, v5, self->_maximum, CFSTR("maximum"), v11.receiver, v11.super_class);
  objc_msgSend_encodeInteger_forKey_(v4, v6, self->_minimum, CFSTR("minimum"));
  objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)self->_leadingValueLabel, CFSTR("leadingValueLabel"));
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)self->_trailingValueLabel, CFSTR("trailingValueLabel"));
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)self->_midValueLabel, CFSTR("midValueLabel"));
  objc_msgSend_encodeInteger_forKey_(v4, v10, self->_type, CFSTR("type"));

}

- (int64_t)maximum
{
  uint64_t v2;
  int64_t maximum;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  maximum = self->_maximum;
  objc_msgSend_unlock(self, v5, v6);
  return maximum;
}

- (void)setMaximum:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_maximum != a3)
  {
    self->_maximum = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (int64_t)minimum
{
  uint64_t v2;
  int64_t minimum;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  minimum = self->_minimum;
  objc_msgSend_unlock(self, v5, v6);
  return minimum;
}

- (void)setMinimum:(int64_t)a3
{
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, a3);
  if (self->_minimum != a3)
  {
    self->_minimum = a3;
    objc_msgSend_setModified_(self, v5, 1);
  }
  objc_msgSend_unlock(self, v5, v6);
}

- (NSString)leadingValueLabel
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_leadingValueLabel;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setLeadingValueLabel:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *leadingValueLabel;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  leadingValueLabel = self->_leadingValueLabel;
  v12 = (id)v8;
  if (v8 | (unint64_t)leadingValueLabel
    && (!v8 || !leadingValueLabel || (objc_msgSend_isEqualToString_(leadingValueLabel, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_leadingValueLabel, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)trailingValueLabel
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_trailingValueLabel;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setTrailingValueLabel:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *trailingValueLabel;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  trailingValueLabel = self->_trailingValueLabel;
  v12 = (id)v8;
  if (v8 | (unint64_t)trailingValueLabel
    && (!v8 || !trailingValueLabel || (objc_msgSend_isEqualToString_(trailingValueLabel, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_trailingValueLabel, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

}

- (NSString)midValueLabel
{
  uint64_t v2;
  NSString *v4;
  const char *v5;
  uint64_t v6;

  objc_msgSend_lock(self, a2, v2);
  v4 = self->_midValueLabel;
  objc_msgSend_unlock(self, v5, v6);
  return v4;
}

- (void)setMidValueLabel:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *midValueLabel;
  const char *v11;
  id v12;

  v5 = a3;
  objc_msgSend_lock(self, v6, v7);
  v8 = (uint64_t)v5;
  midValueLabel = self->_midValueLabel;
  v12 = (id)v8;
  if (v8 | (unint64_t)midValueLabel
    && (!v8 || !midValueLabel || (objc_msgSend_isEqualToString_(midValueLabel, (const char *)v8, v8) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_midValueLabel, a3);
    objc_msgSend_setModified_(self, v11, 1);
  }
  objc_msgSend_unlock(self, (const char *)v8, v9);

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
  _QWORD v22[7];

  v22[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CLSSliderAnswerFormat;
  -[CLSObject mergeWithObject:](&v20, sel_mergeWithObject_, v4);
  v22[0] = CFSTR("maximum");
  v22[1] = CFSTR("minimum");
  v22[2] = CFSTR("leadingValueLabel");
  v22[3] = CFSTR("trailingValueLabel");
  v22[4] = CFSTR("midValueLabel");
  v22[5] = CFSTR("type");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v22, 6);
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
  int64_t type;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CLSSliderAnswerFormat;
  v5 = -[CLSAnswerFormat validateObject:](&v22, sel_validateObject_);
  if (v5)
  {
    type = self->_type;
    if (!type)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v13 = (void *)MEMORY[0x1E0CB34D0];
      v14 = objc_opt_class();
      objc_msgSend_bundleForClass_(v13, v15, v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v11, v16, (uint64_t)CFSTR("ERROR_DESCRIPTION_UNKNOWN_SLIDER_TYPE"), &stru_1E974C8A0, CFSTR("ClassKit"));
      goto LABEL_8;
    }
    if (type == 1 && self->_minimum > self->_maximum)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = (void *)MEMORY[0x1E0CB34D0];
      v9 = objc_opt_class();
      objc_msgSend_bundleForClass_(v8, v10, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v11, v12, (uint64_t)CFSTR("ERROR_DESCRIPTION_SLIDER_MINMAX_INVALID_RANGE"), &stru_1E974C8A0, CFSTR("ClassKit"));
LABEL_8:
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v7, v18, (uint64_t)v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_cls_assignError_code_errorObject_description_(MEMORY[0x1E0CB35C8], v20, (uint64_t)a3, 6, self, v19);
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
  const char *v21;
  uint64_t v22;
  const char *v23;
  char v24;
  char isValueEqual;
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
  char v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    isValueEqual = 0;
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
  if (v16)
  {
    v4 = (void *)v16;
    objc_msgSend_objectID(v10, v17, v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend_objectID(self, v19, v20);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectID(v10, v21, v22);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToString_(v3, v23, (uint64_t)v7) & 1) != 0)
      {
        v58 = v7;
        v59 = v3;
        v24 = 1;
LABEL_17:
        v61 = v24;
        objc_msgSend_parentObjectID(self, v13, v14);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29
          || (objc_msgSend_parentObjectID(v10, v27, v28), (v60 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend_parentObjectID(self, v27, v28);
          v30 = objc_claimAutoreleasedReturnValue();
          if (!v30)
            goto LABEL_35;
          v3 = (void *)v30;
          objc_msgSend_parentObjectID(v10, v31, v32);
          v33 = objc_claimAutoreleasedReturnValue();
          if (!v33)
          {

            isValueEqual = 0;
            goto LABEL_30;
          }
          v57 = (void *)v33;
          objc_msgSend_parentObjectID(self, v34, v35);
          v36 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_parentObjectID(v10, v37, v38);
          v39 = objc_claimAutoreleasedReturnValue();
          v56 = (void *)v36;
          v40 = (void *)v36;
          v7 = (void *)v39;
          if (!objc_msgSend_isEqualToString_(v40, v41, v39))
          {
            isValueEqual = 0;
LABEL_29:

LABEL_30:
            v53 = v61;
            if (!v29)

LABEL_38:
            if ((v53 & 1) != 0)
            {

            }
            goto LABEL_12;
          }
          v55 = 1;
          v44 = objc_msgSend_type(self, v42, v43, v6);
        }
        else
        {
          v60 = 0;
          v55 = 0;
          v44 = objc_msgSend_type(self, v27, v28, v6);
        }
        if (v44 == objc_msgSend_type(v10, v45, v46))
        {
          v49 = objc_msgSend_answerFormatType(self, v47, v48);
          if (v49 == objc_msgSend_answerFormatType(v10, v50, v51))
          {
            isValueEqual = objc_msgSend_isValueEqual_(self, v52, (uint64_t)v10);
            v6 = v54;
            if ((v55 & 1) == 0)
              goto LABEL_30;
            goto LABEL_29;
          }
        }
        if ((v55 & 1) != 0)
        {

        }
        v6 = v54;
LABEL_35:
        v53 = v61;
        if (!v29)

        isValueEqual = 0;
        goto LABEL_38;
      }

    }
  }
  isValueEqual = 0;
LABEL_12:
  if (!v15)

LABEL_15:
  return isValueEqual;
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
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
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
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;

  objc_msgSend_objectID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);

  objc_msgSend_parentObjectID(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;

  objc_msgSend_leadingValueLabel(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_hash(v16, v17, v18);

  objc_msgSend_midValueLabel(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v13 ^ v19 ^ objc_msgSend_hash(v22, v23, v24);

  objc_msgSend_trailingValueLabel(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v25 ^ objc_msgSend_hash(v28, v29, v30);

  v34 = v31 ^ (2 * objc_msgSend_type(self, v32, v33));
  v37 = v34 ^ (4 * objc_msgSend_answerFormatType(self, v35, v36));
  v40 = v37 ^ (8 * objc_msgSend_maximum(self, v38, v39));
  return v40 ^ (16 * objc_msgSend_minimum(self, v41, v42));
}

- (BOOL)isValueEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  char isEqualToString;
  const char *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  char v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  char v61;
  void *v62;
  const char *v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  char v76;
  void *v77;

  v8 = a3;
  v11 = objc_msgSend_minimum(self, v9, v10);
  if (v11 != objc_msgSend_minimum(v8, v12, v13)
    || (v16 = objc_msgSend_maximum(self, v14, v15), v16 != objc_msgSend_maximum(v8, v17, v18)))
  {
    isEqualToString = 0;
    goto LABEL_37;
  }
  objc_msgSend_leadingValueLabel(self, v19, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 || (objc_msgSend_leadingValueLabel(v8, v21, v22), (v77 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend_leadingValueLabel(self, v21, v22);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
LABEL_33:
      isEqualToString = 0;
      goto LABEL_34;
    }
    v3 = (void *)v24;
    objc_msgSend_leadingValueLabel(v8, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
LABEL_32:

      goto LABEL_33;
    }
    v4 = (void *)v27;
    objc_msgSend_leadingValueLabel(self, v28, v29);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_leadingValueLabel(v8, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v5, v33, (uint64_t)v32) & 1) == 0)
    {

LABEL_31:
      goto LABEL_32;
    }
    v74 = v32;
    v34 = 1;
  }
  else
  {
    v77 = 0;
    v34 = 0;
  }
  objc_msgSend_midValueLabel(self, v21, v22);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v34;
  if (!v38)
  {
    objc_msgSend_midValueLabel(v8, v36, v37);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v75)
    {
      v75 = 0;
      v49 = 0;
      goto LABEL_23;
    }
  }
  objc_msgSend_midValueLabel(self, v36, v37);
  v39 = objc_claimAutoreleasedReturnValue();
  if (!v39)
  {
    isEqualToString = 0;
    goto LABEL_46;
  }
  v34 = v39;
  objc_msgSend_midValueLabel(v8, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
LABEL_20:

    if (v38)
    else

    if ((v76 & 1) == 0)
      goto LABEL_33;

    goto LABEL_31;
  }
  v73 = v42;
  objc_msgSend_midValueLabel(self, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_midValueLabel(v8, v46, v47);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v45, v48, (uint64_t)v6) & 1) == 0)
  {

    v42 = v73;
    goto LABEL_20;
  }
  v70 = v45;
  v49 = 1;
LABEL_23:
  objc_msgSend_trailingValueLabel(self, v36, v37);
  v72 = objc_claimAutoreleasedReturnValue();
  if (!v72)
  {
    objc_msgSend_trailingValueLabel(v8, v50, v51);
    v69 = objc_claimAutoreleasedReturnValue();
    if (!v69)
    {
      v69 = 0;
      isEqualToString = 1;
LABEL_43:
      v65 = (void *)v69;
      goto LABEL_44;
    }
  }
  v71 = v5;
  objc_msgSend_trailingValueLabel(self, v50, v51);
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v55 = (void *)v52;
    objc_msgSend_trailingValueLabel(v8, v53, v54);
    v56 = objc_claimAutoreleasedReturnValue();
    if (v56)
    {
      v67 = (void *)v56;
      objc_msgSend_trailingValueLabel(self, v57, v58);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_trailingValueLabel(v8, v59, v60);
      v68 = v6;
      v61 = v49;
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v66, v63, (uint64_t)v62);

      v49 = v61;
      v6 = v68;

      goto LABEL_40;
    }

  }
  isEqualToString = 0;
LABEL_40:
  v5 = v71;
  v65 = (void *)v72;
  if (!v72)
    goto LABEL_43;
LABEL_44:

  if ((v49 & 1) != 0)
  {

LABEL_46:
    if (!v38)

    if ((v76 & 1) == 0)
      goto LABEL_34;
    goto LABEL_54;
  }
  if (v38)

  else
  if ((v76 & 1) != 0)
  {
LABEL_54:

  }
LABEL_34:
  if (!v23)

LABEL_37:
  return isEqualToString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_midValueLabel, 0);
  objc_storeStrong((id *)&self->_trailingValueLabel, 0);
  objc_storeStrong((id *)&self->_leadingValueLabel, 0);
}

@end
