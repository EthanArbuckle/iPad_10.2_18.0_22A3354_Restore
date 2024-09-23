@implementation CHRemoteRecognitionTextRequest

- (CHRemoteRecognitionTextRequest)initWithLocales:(id)a3 recognitionMode:(int)a4 drawing:(id)a5 options:(id)a6 priority:(int64_t)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  CHRemoteRecognitionTextRequest *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  objc_super v47;
  uint8_t buf[16];

  v10 = *(_QWORD *)&a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (!objc_msgSend_count(v12, v15, v16, v17, v18, v19))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v20 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v20, OS_LOG_TYPE_FAULT, "CHRemoteRecognitionTextRequest must be initialized with at least one locale", buf, 2u);
    }

  }
  v47.receiver = self;
  v47.super_class = (Class)CHRemoteRecognitionTextRequest;
  v21 = -[CHRemoteRecognitionRequest initWithDrawing:options:priority:](&v47, sel_initWithDrawing_options_priority_, v13, v14, a7);
  objc_msgSend_setLocales_(v21, v22, (uint64_t)v12, v23, v24, v25);
  objc_msgSend_setRecognitionMode_(v21, v26, v10, v27, v28, v29);
  objc_msgSend_parametersOverride(CHRecognizerConfiguration, v30, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend_copy(v35, v36, v37, v38, v39, v40);
  objc_msgSend_setParametersOverride_(v21, v42, (uint64_t)v41, v43, v44, v45);

  return v21;
}

- (CHRemoteRecognitionTextRequest)initWithCoder:(id)a3
{
  id v4;
  CHRemoteRecognitionTextRequest *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSDictionary *activeCharacterSetPerLocale;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  NSDictionary *parametersOverride;
  __int16 v92;
  objc_super v93;
  _QWORD v94[3];
  _QWORD v95[3];
  _QWORD v96[3];

  v96[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v93.receiver = self;
  v93.super_class = (Class)CHRemoteRecognitionTextRequest;
  v5 = -[CHRemoteRecognitionRequest initWithCoder:](&v93, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v96[0] = objc_opt_class();
    v96[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v96, 2, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v6, v11, (uint64_t)v10, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v16, (uint64_t)v15, (uint64_t)CFSTR("locales"), v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    if (v19 && objc_msgSend_count(v19, v20, v21, v22, v23, v24))
    {
      objc_storeStrong((id *)&v5->_locales, v19);
      v5->_recognitionMode = objc_msgSend_decodeIntegerForKey_(v4, v25, (uint64_t)CFSTR("recognitionMode"), v26, v27, v28);
      v5->_contentType = objc_msgSend_decodeIntegerForKey_(v4, v29, (uint64_t)CFSTR("contentType"), v30, v31, v32);
      v5->_autoCapitalizationMode = objc_msgSend_decodeIntegerForKey_(v4, v33, (uint64_t)CFSTR("autoCapitalizationMode"), v34, v35, v36);
      v5->_autoCorrectionMode = objc_msgSend_decodeIntegerForKey_(v4, v37, (uint64_t)CFSTR("autoCorrectionMode"), v38, v39, v40);
      *(_QWORD *)&v5->_baseWritingDirection = objc_msgSend_decodeIntegerForKey_(v4, v41, (uint64_t)CFSTR("baseWritingDirection"), v42, v43, v44);
      v45 = (void *)MEMORY[0x1E0C99E60];
      v95[0] = objc_opt_class();
      v95[1] = objc_opt_class();
      v95[2] = objc_opt_class();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v46, (uint64_t)v95, 3, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(v45, v50, (uint64_t)v49, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClasses_forKey_(v4, v55, (uint64_t)v54, (uint64_t)CFSTR("activeCharacterSetPerLocale"), v56, v57);
      v58 = objc_claimAutoreleasedReturnValue();
      activeCharacterSetPerLocale = v5->_activeCharacterSetPerLocale;
      v5->_activeCharacterSetPerLocale = (NSDictionary *)v58;

      v5->_shouldUseTextReplacements = objc_msgSend_decodeBoolForKey_(v4, v60, (uint64_t)CFSTR("shouldUseTextReplacements"), v61, v62, v63);
      v5->_enableGen2ModelIfAvailable = objc_msgSend_decodeBoolForKey_(v4, v64, (uint64_t)CFSTR("enableGen2ModelIfAvailable"), v65, v66, v67);
      v5->_enableGen2CharacterLMIfAvailable = objc_msgSend_decodeBoolForKey_(v4, v68, (uint64_t)CFSTR("enableGen2CharacterLMIfAvailable"), v69, v70, v71);
      v5->_enableStrokeReordering = objc_msgSend_decodeBoolForKey_(v4, v72, (uint64_t)CFSTR("enableStrokeReordering"), v73, v74, v75);
      v76 = (void *)MEMORY[0x1E0C99E60];
      v94[0] = objc_opt_class();
      v94[1] = objc_opt_class();
      v94[2] = objc_opt_class();
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v77, (uint64_t)v94, 3, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(v76, v81, (uint64_t)v80, v82, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_decodeObjectOfClasses_forKey_(v4, v86, (uint64_t)v85, (uint64_t)CFSTR("parameterOverride"), v87, v88);
      v89 = objc_claimAutoreleasedReturnValue();
      parametersOverride = v5->_parametersOverride;
      v5->_parametersOverride = (NSDictionary *)v89;

      goto LABEL_11;
    }

  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v19 = (id)qword_1EF568E38;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v92 = 0;
    _os_log_impl(&dword_1BE607000, v19, OS_LOG_TYPE_ERROR, "CHRemoteRecognitionTextRequest decoding failed. Locale is required to be non-null.", (uint8_t *)&v92, 2u);
  }
  v5 = 0;
LABEL_11:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
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
  uint64_t v28;
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
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)CHRemoteRecognitionTextRequest;
  -[CHRemoteRecognitionRequest encodeWithCoder:](&v41, sel_encodeWithCoder_, v4);
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)self->_locales, (uint64_t)CFSTR("locales"), v6, v7);
  objc_msgSend_encodeInteger_forKey_(v4, v8, self->_recognitionMode, (uint64_t)CFSTR("recognitionMode"), v9, v10);
  objc_msgSend_encodeInteger_forKey_(v4, v11, self->_contentType, (uint64_t)CFSTR("contentType"), v12, v13);
  objc_msgSend_encodeInteger_forKey_(v4, v14, self->_autoCapitalizationMode, (uint64_t)CFSTR("autoCapitalizationMode"), v15, v16);
  objc_msgSend_encodeInteger_forKey_(v4, v17, self->_autoCorrectionMode, (uint64_t)CFSTR("autoCorrectionMode"), v18, v19);
  objc_msgSend_encodeInteger_forKey_(v4, v20, *(_QWORD *)&self->_baseWritingDirection, (uint64_t)CFSTR("baseWritingDirection"), v21, v22);
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)self->_activeCharacterSetPerLocale, (uint64_t)CFSTR("activeCharacterSetPerLocale"), v24, v25);
  objc_msgSend_encodeBool_forKey_(v4, v26, self->_shouldUseTextReplacements, (uint64_t)CFSTR("shouldUseTextReplacements"), v27, v28);
  objc_msgSend_encodeBool_forKey_(v4, v29, self->_enableGen2ModelIfAvailable, (uint64_t)CFSTR("enableGen2ModelIfAvailable"), v30, v31);
  objc_msgSend_encodeBool_forKey_(v4, v32, self->_enableGen2CharacterLMIfAvailable, (uint64_t)CFSTR("enableGen2CharacterLMIfAvailable"), v33, v34);
  objc_msgSend_encodeBool_forKey_(v4, v35, self->_enableStrokeReordering, (uint64_t)CFSTR("enableStrokeReordering"), v36, v37);
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)self->_parametersOverride, (uint64_t)CFSTR("parameterOverride"), v39, v40);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (BOOL)shouldRemoveUnnaturalGaps
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return objc_msgSend_recognitionMode(self, a2, v2, v3, v4, v5) == 2;
}

- (id)recognizerConfigurationKeyWithLocale:(id)a3
{
  id v4;
  CHRecognizerConfiguration *v5;
  uint64_t recognitionMode;
  uint64_t autoCapitalizationMode;
  uint64_t autoCorrectionMode;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v25;

  v4 = a3;
  v5 = [CHRecognizerConfiguration alloc];
  recognitionMode = self->_recognitionMode;
  autoCapitalizationMode = self->_autoCapitalizationMode;
  autoCorrectionMode = self->_autoCorrectionMode;
  v9 = *(_QWORD *)&self->_baseWritingDirection;
  v15 = objc_msgSend_enableCachingIfAvailable(self, v10, v11, v12, v13, v14);
  BYTE2(v25) = self->_enableGen2CharacterLMIfAvailable;
  BYTE1(v25) = self->_enableGen2ModelIfAvailable;
  LOBYTE(v25) = v15;
  v17 = (void *)objc_msgSend_initWithMode_locale_contentType_autoCapitalizationMode_autoCorrectionMode_baseWritingDirection_enableCachingIfAvailable_enableGen2ModelIfAvailable_enableGen2CharacterLMIfAvailable_(v5, v16, recognitionMode, (uint64_t)v4, 0, autoCapitalizationMode, autoCorrectionMode, v9, v25);
  objc_msgSend_configurationKey(v17, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)setLocales:(id)a3
{
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSArray *v16;
  NSArray *locales;
  uint8_t v18[16];

  v4 = (NSArray *)a3;
  if (objc_msgSend_hasBeenSubmitted(self, v5, v6, v7, v8, v9))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v15 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1BE607000, v15, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v18, 2u);
    }

  }
  if (self->_locales != v4)
  {
    v16 = (NSArray *)objc_msgSend_copy(v4, v10, v11, v12, v13, v14);
    locales = self->_locales;
    self->_locales = v16;

  }
}

- (void)setRecognitionMode:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v8;
  uint8_t v9[16];

  if (!objc_msgSend_hasBeenSubmitted(self, a2, *(uint64_t *)&a3, v3, v4, v5))
  {
    if (self->_recognitionMode == a3)
      return;
LABEL_9:
    self->_recognitionMode = a3;
    return;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v8 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BE607000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
  }

  if (self->_recognitionMode != a3)
    goto LABEL_9;
}

- (void)setContentType:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v8;
  uint8_t v9[16];

  if (!objc_msgSend_hasBeenSubmitted(self, a2, *(uint64_t *)&a3, v3, v4, v5))
  {
    if (self->_contentType == a3)
      return;
LABEL_9:
    self->_contentType = a3;
    return;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v8 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BE607000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
  }

  if (self->_contentType != a3)
    goto LABEL_9;
}

- (void)setAutoCapitalizationMode:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v8;
  uint8_t v9[16];

  if (!objc_msgSend_hasBeenSubmitted(self, a2, *(uint64_t *)&a3, v3, v4, v5))
  {
    if (self->_autoCapitalizationMode == a3)
      return;
LABEL_9:
    self->_autoCapitalizationMode = a3;
    return;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v8 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BE607000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
  }

  if (self->_autoCapitalizationMode != a3)
    goto LABEL_9;
}

- (void)setAutoCorrectionMode:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v8;
  uint8_t v9[16];

  if (!objc_msgSend_hasBeenSubmitted(self, a2, *(uint64_t *)&a3, v3, v4, v5))
  {
    if (self->_autoCorrectionMode == a3)
      return;
LABEL_9:
    self->_autoCorrectionMode = a3;
    return;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v8 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BE607000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
  }

  if (self->_autoCorrectionMode != a3)
    goto LABEL_9;
}

- (void)setBaseWritingDirection:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v8;
  uint8_t v9[16];

  v6 = *(_QWORD *)&a3;
  if (!objc_msgSend_hasBeenSubmitted(self, a2, *(uint64_t *)&a3, v3, v4, v5))
  {
    if (*(_QWORD *)&self->_baseWritingDirection == v6)
      return;
LABEL_9:
    *(_QWORD *)&self->_baseWritingDirection = v6;
    return;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v8 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BE607000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
  }

  if (*(_QWORD *)&self->_baseWritingDirection != v6)
    goto LABEL_9;
}

- (void)setActiveCharacterSetPerLocale:(id)a3
{
  NSDictionary *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSDictionary *v16;
  NSDictionary *activeCharacterSetPerLocale;
  uint8_t v18[16];

  v4 = (NSDictionary *)a3;
  if (objc_msgSend_hasBeenSubmitted(self, v5, v6, v7, v8, v9))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v15 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1BE607000, v15, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v18, 2u);
    }

  }
  if (self->_activeCharacterSetPerLocale != v4)
  {
    v16 = (NSDictionary *)objc_msgSend_copy(v4, v10, v11, v12, v13, v14);
    activeCharacterSetPerLocale = self->_activeCharacterSetPerLocale;
    self->_activeCharacterSetPerLocale = v16;

  }
}

- (void)setShouldUseTextReplacements:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v8;
  uint8_t v9[16];

  if (objc_msgSend_hasBeenSubmitted(self, a2, a3, v3, v4, v5))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v8 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1BE607000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
    }

  }
  self->_shouldUseTextReplacements = a3;
}

- (void)setEnableGen2ModelIfAvailable:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v8;
  uint8_t v9[16];

  if (objc_msgSend_hasBeenSubmitted(self, a2, a3, v3, v4, v5))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v8 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1BE607000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
    }

  }
  self->_enableGen2ModelIfAvailable = a3;
}

- (void)setEnableGen2CharacterLMIfAvailable:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v8;
  uint8_t v9[16];

  if (objc_msgSend_hasBeenSubmitted(self, a2, a3, v3, v4, v5))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v8 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1BE607000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
    }

  }
  self->_enableGen2CharacterLMIfAvailable = a3;
}

- (void)setEnableStrokeReordering:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v8;
  uint8_t v9[16];

  if (objc_msgSend_hasBeenSubmitted(self, a2, a3, v3, v4, v5))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v8 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1BE607000, v8, OS_LOG_TYPE_FAULT, "The CHRemoteRecognitionTextRequest cannot be mutated after being submitted", v9, 2u);
    }

  }
  self->_enableStrokeReordering = a3;
}

- (BOOL)isEqualToRemoteRecognitionTextRequest:(id)a3
{
  CHRemoteRecognitionTextRequest *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
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
  int v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int shouldUseTextReplacements;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int isEqualToArray;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char isEqualToDictionary;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  objc_super v152;

  v4 = (CHRemoteRecognitionTextRequest *)a3;
  if (self == v4)
  {
    isEqualToDictionary = 1;
    goto LABEL_15;
  }
  v152.receiver = self;
  v152.super_class = (Class)CHRemoteRecognitionTextRequest;
  if (!-[CHRemoteRecognitionRequest isEqualToRemoteRecognitionRequest:](&v152, sel_isEqualToRemoteRecognitionRequest_, v4))goto LABEL_13;
  v10 = objc_msgSend_recognitionMode(self, v5, v6, v7, v8, v9);
  if (v10 != objc_msgSend_recognitionMode(v4, v11, v12, v13, v14, v15))
    goto LABEL_13;
  v21 = objc_msgSend_contentType(self, v16, v17, v18, v19, v20);
  if (v21 != objc_msgSend_contentType(v4, v22, v23, v24, v25, v26))
    goto LABEL_13;
  v32 = objc_msgSend_autoCapitalizationMode(self, v27, v28, v29, v30, v31);
  if (v32 != objc_msgSend_autoCapitalizationMode(v4, v33, v34, v35, v36, v37))
    goto LABEL_13;
  v43 = objc_msgSend_autoCorrectionMode(self, v38, v39, v40, v41, v42);
  if (v43 != objc_msgSend_autoCorrectionMode(v4, v44, v45, v46, v47, v48))
    goto LABEL_13;
  v54 = objc_msgSend_baseWritingDirection(self, v49, v50, v51, v52, v53);
  if (v54 != objc_msgSend_baseWritingDirection(v4, v55, v56, v57, v58, v59))
    goto LABEL_13;
  shouldUseTextReplacements = objc_msgSend_shouldUseTextReplacements(self, v60, v61, v62, v63, v64);
  if (shouldUseTextReplacements != objc_msgSend_shouldUseTextReplacements(v4, v66, v67, v68, v69, v70))
    goto LABEL_13;
  v76 = objc_msgSend_enableGen2ModelIfAvailable(self, v71, v72, v73, v74, v75);
  if (v76 != objc_msgSend_enableGen2ModelIfAvailable(v4, v77, v78, v79, v80, v81))
    goto LABEL_13;
  v87 = objc_msgSend_enableGen2CharacterLMIfAvailable(self, v82, v83, v84, v85, v86);
  if (v87 != objc_msgSend_enableGen2CharacterLMIfAvailable(v4, v88, v89, v90, v91, v92))
    goto LABEL_13;
  objc_msgSend_locales(self, v93, v94, v95, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_locales(v4, v99, v100, v101, v102, v103);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  if (v98 == v109)
  {

  }
  else
  {
    objc_msgSend_locales(self, v104, v105, v106, v107, v108);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_locales(v4, v111, v112, v113, v114, v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToArray = objc_msgSend_isEqualToArray_(v110, v117, (uint64_t)v116, v118, v119, v120);

    if (!isEqualToArray)
    {
LABEL_13:
      isEqualToDictionary = 0;
      goto LABEL_15;
    }
  }
  objc_msgSend_activeCharacterSetPerLocale(self, v122, v123, v124, v125, v126);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activeCharacterSetPerLocale(v4, v130, v131, v132, v133, v134);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  if (v129 == v140)
  {
    isEqualToDictionary = 1;
  }
  else
  {
    objc_msgSend_activeCharacterSetPerLocale(self, v135, v136, v137, v138, v139);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_activeCharacterSetPerLocale(v4, v142, v143, v144, v145, v146);
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToDictionary = objc_msgSend_isEqualToDictionary_(v141, v148, (uint64_t)v147, v149, v150, v151);

  }
LABEL_15:

  return isEqualToDictionary;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isEqualToRemoteRecognitionTextRequest;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isEqualToRemoteRecognitionTextRequest = objc_msgSend_isEqualToRemoteRecognitionTextRequest_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteRecognitionTextRequest;
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
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  objc_super v68;

  v7 = 0;
  v8 = 0;
  v9 = 0;
  objc_msgSend_locales(self, a2, v2, v3, v4, v5);
  while (1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_count(v15, v16, v17, v18, v19, v20);

    if (v7 >= v21)
      break;
    objc_msgSend_locales(self, v22, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v27, v28, v7, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_activeCharacterSetPerLocale(self, v33, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v38, v39, (uint64_t)v32, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = objc_msgSend_hash(v32, v44, v45, v46, v47, v48);
    if (v43)
      v8 ^= objc_msgSend_hash(v43, v49, v50, v51, v52, v53);
    v9 ^= v54 << v7;

    ++v7;
    objc_msgSend_locales(self, v10, v11, v12, v13, v14);
  }
  v68.receiver = self;
  v68.super_class = (Class)CHRemoteRecognitionTextRequest;
  v55 = -[CHRemoteRecognitionRequest hash](&v68, sel_hash);
  v61 = objc_msgSend_recognitionMode(self, v56, v57, v58, v59, v60);
  return v55 ^ v61 ^ objc_msgSend_contentType(self, v62, v63, v64, v65, v66) ^ v8 ^ v9;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const __CFString *v105;
  const __CFString *v106;
  const __CFString *v107;
  const __CFString *v108;
  void *v109;
  void *v111;
  objc_super v112;
  objc_super v113;

  v3 = (void *)objc_opt_class();
  v9 = objc_msgSend_recognitionMode(self, v4, v5, v6, v7, v8);
  objc_msgSend_stringForRecognitionMode_(v3, v10, v9, v11, v12, v13);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_class();
  v20 = objc_msgSend_contentType(self, v15, v16, v17, v18, v19);
  objc_msgSend_stringForRecognitionContentType_(v14, v21, v20, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_opt_class();
  v32 = objc_msgSend_autoCapitalizationMode(self, v27, v28, v29, v30, v31);
  objc_msgSend_stringForAutoCapitalizationMode_(v26, v33, v32, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_opt_class();
  v44 = objc_msgSend_autoCorrectionMode(self, v39, v40, v41, v42, v43);
  objc_msgSend_stringForAutoCorrectionMode_(v38, v45, v44, v46, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_opt_class();
  v56 = objc_msgSend_baseWritingDirection(self, v51, v52, v53, v54, v55);
  objc_msgSend_stringForBaseWritingDirection_(v50, v57, v56, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_locales(self, v62, v63, v64, v65, v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v67, v68, (uint64_t)CFSTR(", "), (uint64_t)&unk_1E77F1670, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_activeCharacterSetPerLocale(self, v72, v73, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v77, v78, v79, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v83, v84, (uint64_t)CFSTR(", "), (uint64_t)&unk_1E77EFEB8, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  v113.receiver = self;
  v113.super_class = (Class)CHRemoteRecognitionTextRequest;
  -[CHRemoteRecognitionRequest description](&v113, sel_description);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v112.receiver = self;
  v112.super_class = (Class)CHRemoteRecognitionTextRequest;
  -[CHRemoteRecognitionRequest description](&v112, sel_description);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend_length(v89, v90, v91, v92, v93, v94);
  objc_msgSend_substringToIndex_(v88, v96, v95 - 1, v97, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_shouldUseTextReplacements)
    v105 = CFSTR("Y");
  else
    v105 = CFSTR("N");
  if (self->_enableGen2ModelIfAvailable)
    v106 = CFSTR("Y");
  else
    v106 = CFSTR("N");
  if (self->_enableGen2CharacterLMIfAvailable)
    v107 = CFSTR("Y");
  else
    v107 = CFSTR("N");
  if (self->_enableStrokeReordering)
    v108 = CFSTR("Y");
  else
    v108 = CFSTR("N");
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v101, (uint64_t)CFSTR("%@, locales=[%@], mode=%@, content type=%@, autocapitalization mode=%@, autocorrection mode=%@, baseWritingDirection=%@, active character sets=[%@], shouldUseTextReplacements=%@, enableGen2ModelIfAvailable=%@, enableGen2CharacterLMIfAvailable=%@, enableStrokeReordering=%@)"), v102, v103, v104, v100, v71, v111, v25, v37, v49, v61, v87, v105, v106, v107, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  return v109;
}

- (NSArray)locales
{
  return self->_locales;
}

- (NSDictionary)activeCharacterSetPerLocale
{
  return self->_activeCharacterSetPerLocale;
}

- (int)recognitionMode
{
  return self->_recognitionMode;
}

- (int)contentType
{
  return self->_contentType;
}

- (int)autoCapitalizationMode
{
  return self->_autoCapitalizationMode;
}

- (int)autoCorrectionMode
{
  return self->_autoCorrectionMode;
}

- (int)baseWritingDirection
{
  return *(_QWORD *)&self->_baseWritingDirection;
}

- (BOOL)shouldUseTextReplacements
{
  return self->_shouldUseTextReplacements;
}

- (BOOL)enableGen2ModelIfAvailable
{
  return self->_enableGen2ModelIfAvailable;
}

- (BOOL)enableGen2CharacterLMIfAvailable
{
  return self->_enableGen2CharacterLMIfAvailable;
}

- (BOOL)enableStrokeReordering
{
  return self->_enableStrokeReordering;
}

- (NSDictionary)parametersOverride
{
  return self->_parametersOverride;
}

- (void)setParametersOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parametersOverride, 0);
  objc_storeStrong((id *)&self->_activeCharacterSetPerLocale, 0);
  objc_storeStrong((id *)&self->_locales, 0);
}

@end
