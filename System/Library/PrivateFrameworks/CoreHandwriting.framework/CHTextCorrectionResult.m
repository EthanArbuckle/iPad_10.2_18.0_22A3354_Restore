@implementation CHTextCorrectionResult

- (CHTextCorrectionResult)initWithInputTarget:(id)a3 affectedRange:(_NSRange)a4 textResult:(id)a5 resultType:(int64_t)a6 isCharacterLevel:(BOOL)a7 error:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  CHTextCorrectionResult *v17;
  CHTextCorrectionResult *v18;
  objc_super v21;

  length = a4.length;
  location = a4.location;
  v14 = a3;
  v15 = a5;
  v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)CHTextCorrectionResult;
  v17 = -[CHTextCorrectionResult init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_inputTarget, a3);
    v18->_affectedRange.location = location;
    v18->_affectedRange.length = length;
    objc_storeStrong((id *)&v18->_textResult, a5);
    v18->_resultType = a6;
    v18->_characterLevel = a7;
    objc_storeStrong((id *)&v18->_error, a8);
  }

  return v18;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const __CFString *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const __CFString *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  objc_super v84;
  NSRange v85;

  objc_msgSend_textResult(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend_textResult(self, v8, v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_textResult(self, v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_textResult(self, v23, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_topTranscription(v28, v29, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v13, v35, (uint64_t)CFSTR("<%@: %p> \"%@\"), v36, v37, v38, v16, v22, v34);
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = CFSTR("None");
  }
  v84.receiver = self;
  v84.super_class = (Class)CHTextCorrectionResult;
  -[CHTextCorrectionResult description](&v84, sel_description);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputTarget(self, v41, v42, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputTargetIdentifier(v46, v47, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v85.location = objc_msgSend_affectedRange(self, v53, v54, v55, v56, v57);
  NSStringFromRange(v85);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend_resultType(self, v59, v60, v61, v62, v63);
  if (v64 > 8)
    v70 = &stru_1E77F6F28;
  else
    v70 = off_1E77F5820[v64];
  if (objc_msgSend_isCharacterLevel(self, v65, v66, v67, v68, v69))
    v76 = CFSTR("Yes");
  else
    v76 = CFSTR("No");
  objc_msgSend_localizedDescription(self->_error, v71, v72, v73, v74, v75);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v40, v78, (uint64_t)CFSTR(" inputTargetID: %@, affectedRange: %@, resultType: %@, textResult: %@, isCharacterLevel: %@, error: %@"), v79, v80, v81, v52, v58, v70, v39, v76, v77);
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  return v82;
}

- (void)encodeWithCoder:(id)a3
{
  CHTextInputTarget *inputTarget;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  inputTarget = self->_inputTarget;
  v24 = a3;
  objc_msgSend_encodeObject_forKey_(v24, v5, (uint64_t)inputTarget, (uint64_t)CFSTR("inputTarget"), v6, v7);
  NSStringFromRange(self->_affectedRange);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v24, v9, (uint64_t)v8, (uint64_t)CFSTR("affectedRange"), v10, v11);

  objc_msgSend_encodeObject_forKey_(v24, v12, (uint64_t)self->_textResult, (uint64_t)CFSTR("textResult"), v13, v14);
  objc_msgSend_encodeInteger_forKey_(v24, v15, self->_resultType, (uint64_t)CFSTR("resultType"), v16, v17);
  objc_msgSend_encodeBool_forKey_(v24, v18, self->_characterLevel, (uint64_t)CFSTR("isCharacterLevel"), v19, v20);
  objc_msgSend_encodeObject_forKey_(v24, v21, (uint64_t)self->_error, (uint64_t)CFSTR("error"), v22, v23);

}

- (CHTextCorrectionResult)initWithCoder:(id)a3
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
  NSString *v14;
  NSRange v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("inputTarget"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("affectedRange"), v12, v13);
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  v15 = NSRangeFromString(v14);
  v16 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, (uint64_t)CFSTR("textResult"), v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_decodeIntegerForKey_(v4, v21, (uint64_t)CFSTR("resultType"), v22, v23, v24);
  v30 = objc_msgSend_decodeBoolForKey_(v4, v26, (uint64_t)CFSTR("isCharacterLevel"), v27, v28, v29);
  v31 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v32, v31, (uint64_t)CFSTR("error"), v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    self = (CHTextCorrectionResult *)objc_msgSend_initWithInputTarget_affectedRange_textResult_resultType_isCharacterLevel_error_(self, v36, (uint64_t)v9, v15.location, v15.length, (uint64_t)v20, v25, v30, v35);

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToTextCorrectionResult:(id)a3
{
  CHTextCorrectionResult *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHTextCorrectionResult *v10;
  CHTextInputTarget *inputTarget;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int isEqualToInputTarget;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSUInteger v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char isEqual;
  NSUInteger length;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSUInteger location;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CHTokenizedTextResult *textResult;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int isEqualToTokenizedTextResult;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int64_t resultType;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int characterLevel;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSError *error;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;

  v4 = (CHTextCorrectionResult *)a3;
  v10 = v4;
  if (self != v4)
  {
    inputTarget = self->_inputTarget;
    objc_msgSend_inputTarget(v4, v5, v6, v7, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue();
    if (inputTarget == (CHTextInputTarget *)v12)
    {

      length = self->_affectedRange.length;
      objc_msgSend_affectedRange(v10, v38, v39, v40, v41, v42);
      if ((const char *)length != v31)
        goto LABEL_20;
    }
    else
    {
      v18 = (void *)v12;
      if (!self->_inputTarget)
        goto LABEL_21;
      objc_msgSend_inputTarget(v10, v13, v14, v15, v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToInputTarget = objc_msgSend_isEqualToInputTarget_(v19, v20, (uint64_t)self->_inputTarget, v21, v22, v23);

      if (!isEqualToInputTarget)
        goto LABEL_20;
      v30 = self->_affectedRange.length;
      objc_msgSend_affectedRange(v10, v25, v26, v27, v28, v29);
      if ((const char *)v30 != v31)
        goto LABEL_20;
    }
    location = self->_affectedRange.location;
    if (location == objc_msgSend_affectedRange(v10, v31, v32, v33, v34, v35))
    {
      textResult = self->_textResult;
      objc_msgSend_textResult(v10, v44, v45, v46, v47, v48);
      v50 = objc_claimAutoreleasedReturnValue();
      if (textResult == (CHTokenizedTextResult *)v50)
      {

        goto LABEL_15;
      }
      v18 = (void *)v50;
      if (!self->_textResult)
        goto LABEL_21;
      objc_msgSend_textResult(v10, v51, v52, v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToTokenizedTextResult = objc_msgSend_isEqualToTokenizedTextResult_(v56, v57, (uint64_t)self->_textResult, v58, v59, v60);

      if (isEqualToTokenizedTextResult)
      {
LABEL_15:
        resultType = self->_resultType;
        if (resultType == objc_msgSend_resultType(v10, v62, v63, v64, v65, v66))
        {
          characterLevel = self->_characterLevel;
          if (characterLevel == objc_msgSend_isCharacterLevel(v10, v68, v69, v70, v71, v72))
          {
            error = self->_error;
            objc_msgSend_error(v10, v74, v75, v76, v77, v78);
            v80 = objc_claimAutoreleasedReturnValue();
            if (error == (NSError *)v80)
            {
              isEqual = 1;
              v18 = error;
              goto LABEL_22;
            }
            v18 = (void *)v80;
            if (self->_error)
            {
              objc_msgSend_error(v10, v81, v82, v83, v84, v85);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              isEqual = objc_msgSend_isEqual_(v86, v87, (uint64_t)self->_error, v88, v89, v90);

LABEL_22:
              goto LABEL_23;
            }
LABEL_21:
            isEqual = 0;
            goto LABEL_22;
          }
        }
      }
    }
LABEL_20:
    isEqual = 0;
    goto LABEL_23;
  }
  isEqual = 1;
LABEL_23:

  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToTextCorrectionResult;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToTextCorrectionResult = objc_msgSend_isEqualToTextCorrectionResult_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToTextCorrectionResult;
  }
  else
  {

    return 0;
  }
}

- (CHTextInputTarget)inputTarget
{
  return self->_inputTarget;
}

- (_NSRange)affectedRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_affectedRange.length;
  location = self->_affectedRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (CHTokenizedTextResult)textResult
{
  return self->_textResult;
}

- (int64_t)resultType
{
  return self->_resultType;
}

- (BOOL)isCharacterLevel
{
  return self->_characterLevel;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_textResult, 0);
  objc_storeStrong((id *)&self->_inputTarget, 0);
}

@end
