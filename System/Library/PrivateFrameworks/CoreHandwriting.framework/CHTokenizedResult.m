@implementation CHTokenizedResult

- (CHTokenizedResult)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (CHTokenizedResult *)objc_msgSend_initWithIsMinimalDrawingResult_(self, a2, 0, v2, v3, v4);
}

- (CHTokenizedResult)initWithIsMinimalDrawingResult:(BOOL)a3
{
  CHTokenizedResult *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CHTokenizedResult;
  result = -[CHTokenizedResult init](&v5, sel_init);
  if (result)
    result->_isMinimalDrawingResult = a3;
  return result;
}

- (CHTokenizedResult)initWithCoder:(id)a3
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
  CHTokenizedResult *IsMinimalDrawingResult;

  v4 = a3;
  v9 = objc_msgSend_decodeBoolForKey_(v4, v5, (uint64_t)CFSTR("isMinimalDrawingResult"), v6, v7, v8);
  IsMinimalDrawingResult = (CHTokenizedResult *)objc_msgSend_initWithIsMinimalDrawingResult_(self, v10, v9, v11, v12, v13);

  return IsMinimalDrawingResult;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_encodeBool_forKey_(a3, a2, self->_isMinimalDrawingResult, (uint64_t)CFSTR("isMinimalDrawingResult"), v3, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHTokenizedResult;
  -[CHTokenizedResult description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSIndexSet)strokeIndexes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return (NSIndexSet *)objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], a2, v2, v3, v4, v5);
}

- (NSString)topTranscription
{
  return (NSString *)&stru_1E77F6F28;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)isEqualToTokenizedResult:(id)a3
{
  CHTokenizedResult *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHTokenizedResult *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char isEqualToString;

  v4 = (CHTokenizedResult *)a3;
  v10 = v4;
  if (self == v4)
  {

    return 1;
  }
  else
  {
    objc_msgSend_topTranscription(self, v5, v6, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_topTranscription(v10, v12, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v11, v18, (uint64_t)v17, v19, v20, v21);

    return isEqualToString;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToTokenizedResult;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToTokenizedResult = objc_msgSend_isEqualToTokenizedResult_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToTokenizedResult;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  objc_msgSend_topTranscription(self, a2, v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_hash(v6, v7, v8, v9, v10, v11);

  return v12;
}

- (id)writeToFile
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;

  v3 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_(v3, v5, (uint64_t)v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend_setDateFormat_(v10, v11, (uint64_t)CFSTR("dd-MM-yyyy-HH-mm-ss-SSS"), v12, v13, v14);
  objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v20, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v26, v27, 4, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_now(MEMORY[0x1E0C99D68], v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringFromDate_(v10, v38, (uint64_t)v37, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v43, (uint64_t)CFSTR("/result_%@-%@.dat"), v44, v45, v46, v42, v31);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeToFileInFolder_basename_(self, v48, (uint64_t)v9, (uint64_t)v47, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  return v51;
}

- (id)writeToFileInFolder:(id)a3 basename:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char DirectoryAtURL_withIntermediateDirectories_attributes_error;
  id v26;
  id v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
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
  id v54;
  id v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend_absoluteString(v6, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_fileExistsAtPath_(v8, v15, (uint64_t)v14, v16, v17, v18);

  if ((v19 & 1) != 0)
  {
    v24 = 0;
LABEL_5:
    objc_msgSend_URLByAppendingPathComponent_(v6, v20, (uint64_t)v7, v21, v22, v23);
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v29, (uint64_t)self, 1, 0, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v24;
    objc_msgSend_writeToURL_options_error_(v31, v32, (uint64_t)v28, 1, (uint64_t)&v54, v33);
    v27 = v54;

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v34 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_absoluteString(v28, v35, v36, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v27, v41, v42, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v57 = v40;
      v58 = 2112;
      v59 = v46;
      _os_log_impl(&dword_1BE607000, v34, OS_LOG_TYPE_DEFAULT, "TokenizedResult writeToFile saving drawing at URL %@, error = %@", buf, 0x16u);

    }
    if (v27)
    {
      v52 = 0;
    }
    else
    {
      objc_msgSend_absoluteString(v28, v47, v48, v49, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_18;
  }
  v55 = 0;
  DirectoryAtURL_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v8, v20, (uint64_t)v6, 1, 0, (uint64_t)&v55);
  v26 = v55;
  v27 = v26;
  if ((DirectoryAtURL_withIntermediateDirectories_attributes_error & 1) != 0)
  {
    v24 = v26;
    goto LABEL_5;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v28 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v57 = v6;
    v58 = 2112;
    v59 = v27;
    _os_log_impl(&dword_1BE607000, v28, OS_LOG_TYPE_ERROR, "Drawing unable to create folder at URL %@: Error %@", buf, 0x16u);
  }
  v52 = 0;
LABEL_18:

  return v52;
}

+ (id)loadFromFile:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E0C99D50], a2, (uint64_t)a3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = objc_opt_class();
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, (uint64_t)v6, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isMinimalDrawingResult
{
  return self->_isMinimalDrawingResult;
}

- (double)score
{
  return self->_score;
}

- (NSString)recognizerDebugDescription
{
  return self->_recognizerDebugDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizerDebugDescription, 0);
}

@end
