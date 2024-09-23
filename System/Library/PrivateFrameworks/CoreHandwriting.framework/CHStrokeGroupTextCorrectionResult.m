@implementation CHStrokeGroupTextCorrectionResult

- (CHStrokeGroupTextCorrectionResult)init
{
  NSObject *v3;
  uint8_t v5[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_FAULT, "Use the designated initializer instead", v5, 2u);
  }

  return 0;
}

- (CHStrokeGroupTextCorrectionResult)initWithTextCorrectionResult:(id)a3 inputStrokeIdentifiers:(id)a4
{
  id v7;
  id v8;
  CHStrokeGroupTextCorrectionResult *v9;
  CHStrokeGroupTextCorrectionResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHStrokeGroupTextCorrectionResult;
  v9 = -[CHStrokeGroupTextCorrectionResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textCorrectionResult, a3);
    objc_storeStrong((id *)&v10->_inputStrokeIdentifiers, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CHStrokeGroupTextCorrectionResult;
  -[CHStrokeGroupTextCorrectionResult description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textCorrectionResult(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v10, (uint64_t)CFSTR(" %@"), v11, v12, v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend_encodeObject_forKey_(v10, v4, (uint64_t)self->_textCorrectionResult, (uint64_t)CFSTR("textCorrectionResult"), v5, v6);
  objc_msgSend_encodeObject_forKey_(v10, v7, (uint64_t)self->_inputStrokeIdentifiers, (uint64_t)CFSTR("inputStrokeIdentifiers"), v8, v9);

}

- (CHStrokeGroupTextCorrectionResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  CHStrokeGroupTextCorrectionResult *v18;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("textCorrectionResult"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("inputStrokeIdentifiers"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (CHStrokeGroupTextCorrectionResult *)objc_msgSend_initWithTextCorrectionResult_inputStrokeIdentifiers_(self, v15, (uint64_t)v9, (uint64_t)v14, v16, v17);

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToStrokeGroupTextCorrectionResult:(id)a3
{
  CHStrokeGroupTextCorrectionResult *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHStrokeGroupTextCorrectionResult *v10;
  CHTextCorrectionResult *textCorrectionResult;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CHTextCorrectionResult *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int isEqual;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  NSArray *inputStrokeIdentifiers;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSArray *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v4 = (CHStrokeGroupTextCorrectionResult *)a3;
  v10 = v4;
  if (self == v4)
  {
    v29 = 1;
    goto LABEL_11;
  }
  textCorrectionResult = self->_textCorrectionResult;
  objc_msgSend_textCorrectionResult(v4, v5, v6, v7, v8, v9);
  v17 = (CHTextCorrectionResult *)objc_claimAutoreleasedReturnValue();
  if (textCorrectionResult == v17)
  {

  }
  else
  {
    objc_msgSend_textCorrectionResult(v10, v12, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v18, v19, (uint64_t)self->_textCorrectionResult, v20, v21, v22);

    if (!isEqual)
    {
      v29 = 0;
      goto LABEL_11;
    }
  }
  inputStrokeIdentifiers = self->_inputStrokeIdentifiers;
  objc_msgSend_inputStrokeIdentifiers(v10, v24, v25, v26, v27, v28);
  v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (inputStrokeIdentifiers == v36)
  {
    v29 = 1;
  }
  else
  {
    objc_msgSend_inputStrokeIdentifiers(v10, v31, v32, v33, v34, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_isEqual_(v37, v38, (uint64_t)self->_inputStrokeIdentifiers, v39, v40, v41);

  }
LABEL_11:

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToStrokeGroupTextCorrectionResult;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToStrokeGroupTextCorrectionResult = objc_msgSend_isEqualToStrokeGroupTextCorrectionResult_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToStrokeGroupTextCorrectionResult;
  }
  else
  {

    return 0;
  }
}

- (NSArray)inputStrokeIdentifiers
{
  return self->_inputStrokeIdentifiers;
}

- (CHTextCorrectionResult)textCorrectionResult
{
  return self->_textCorrectionResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textCorrectionResult, 0);
  objc_storeStrong((id *)&self->_inputStrokeIdentifiers, 0);
}

@end
