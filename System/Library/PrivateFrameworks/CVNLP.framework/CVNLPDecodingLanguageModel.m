@implementation CVNLPDecodingLanguageModel

- (id)_initWithLanguageModel:(void *)a3 locale:(id)a4 decodingWeight:(id)a5 lowerBoundLogProbability:(id)a6 type:(int)a7
{
  id v13;
  id v14;
  id v15;
  CVNLPDecodingLanguageModel *v16;
  CVNLPDecodingLanguageModel *v17;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CVNLPDecodingLanguageModel;
  v16 = -[CVNLPInformationStream initWithDecodingWeight:lowerBoundLogProbability:](&v19, sel_initWithDecodingWeight_lowerBoundLogProbability_, v14, v15);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_locale, a4);
    v17->_lmSPIType = a7;
    if ((a7 - 1) < 2)
      v17->_languageModel = (void *)CFRetain(a3);
    v17->_tokenizer = (void *)LMStreamTokenizerCreate();
  }

  return v17;
}

- (CVNLPDecodingLanguageModel)initWithLMLanguageModel:(void *)a3 locale:(id)a4 decodingWeight:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  CVNLPDecodingLanguageModel *v15;

  v8 = a4;
  v9 = a5;
  objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (CVNLPDecodingLanguageModel *)objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(self, v14, (uint64_t)a3, (uint64_t)v8, v9, v13, 1);

  return v15;
}

- (CVNLPDecodingLanguageModel)initWithLMLanguageModel:(void *)a3 locale:(id)a4 decodingWeight:(id)a5 lowerBoundLogProbability:(id)a6
{
  return (CVNLPDecodingLanguageModel *)objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, 1);
}

- (CVNLPDecodingLanguageModel)initWithCVNLPLanguageModel:(CVNLPLanguageModel *)a3 locale:(id)a4 decodingWeight:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  CVNLPDecodingLanguageModel *v15;

  v8 = a4;
  v9 = a5;
  objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (CVNLPDecodingLanguageModel *)objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(self, v14, (uint64_t)a3, (uint64_t)v8, v9, v13, 2);

  return v15;
}

- (CVNLPDecodingLanguageModel)initWithCVNLPLanguageModel:(CVNLPLanguageModel *)a3 locale:(id)a4 decodingWeight:(id)a5 lowerBoundLogProbability:(id)a6
{
  return (CVNLPDecodingLanguageModel *)objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, 2);
}

- (CVNLPDecodingLanguageModel)initWithLanguageModel:(void *)a3 locale:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  CVNLPDecodingLanguageModel *v16;

  v6 = a4;
  objc_msgSend_defaultDecodingWeight(CVNLPInformationStream, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (CVNLPDecodingLanguageModel *)objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(self, v15, (uint64_t)a3, (uint64_t)v6, v10, v14, 1);

  return v16;
}

- (CVNLPDecodingLanguageModel)initWithLanguageModel:(void *)a3
{
  return (CVNLPDecodingLanguageModel *)MEMORY[0x1E0DE7D20](self, sel_initWithLanguageModel_locale_, a3, 0);
}

- (void)dealloc
{
  int lmSPIType;
  objc_super v4;

  lmSPIType = self->_lmSPIType;
  if (lmSPIType == 2)
  {
    CFRelease(self->_languageModel);
  }
  else if (lmSPIType == 1)
  {
    LMLanguageModelRelease();
  }
  if (self->_tokenizer)
    LMStreamTokenizerRelease();
  v4.receiver = self;
  v4.super_class = (Class)CVNLPDecodingLanguageModel;
  -[CVNLPDecodingLanguageModel dealloc](&v4, sel_dealloc);
}

- (int)lmSPIType
{
  return self->_lmSPIType;
}

+ (id)_decodingLanguageModelForLocale:(id)a3 modelType:(int)a4 decodingWeight:(id)a5 lowerBoundLogProbability:(id)a6 type:(int)a7
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  CVNLPDecodingLanguageModel *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const void *v32;
  CVNLPDecodingLanguageModel *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  uint64_t v59;
  CVNLPDecodingLanguageModel *v60;
  const char *v61;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[4];
  _QWORD v72[4];
  uint64_t v73;
  _QWORD v74[3];

  v74[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v16 = a6;
  if (a7 == 2)
  {
    v69[0] = CFSTR("CVNLPLocaleKey");
    objc_msgSend_localeIdentifier(v11, v13, v14, v15);
    v24 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v24;
    if (a4 == 2)
      v28 = 2;
    else
      v28 = 1;
    v70[0] = v24;
    v69[1] = CFSTR("CVNLPTokenTypeKey");
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v25, v28, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = v29;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v30, (uint64_t)v70, (uint64_t)v69, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (const void *)CVNLPLanguageModelCreate(v31);
    if (v32)
    {
      v33 = [CVNLPDecodingLanguageModel alloc];
      v23 = (void *)objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(v33, v34, (uint64_t)v32, (uint64_t)v11, v12, v16, 2);
      CFRelease(v32);
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    if (a7 != 1)
      goto LABEL_7;
    if (a4 != 1)
    {
      if (a4 == 2)
      {
        v73 = *MEMORY[0x1E0D434C8];
        objc_msgSend_localeIdentifier(v11, v13, v14, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v74[0] = v17;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v74, (uint64_t)&v73, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = LMLanguageModelCreate();
        if (v20)
        {
          v21 = [CVNLPDecodingLanguageModel alloc];
          v23 = (void *)objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(v21, v22, v20, (uint64_t)v11, v12, v16, 1);
          LMLanguageModelRelease();
        }
        else
        {
          v23 = 0;
        }

        goto LABEL_24;
      }
LABEL_7:
      v23 = 0;
      goto LABEL_24;
    }
    v63 = 0;
    v64 = &v63;
    v65 = 0x3032000000;
    v66 = sub_1B035EF2C;
    v67 = sub_1B035EF3C;
    v68 = 0;
    LDEnumerateAssetDataItems();
    v38 = (void *)v64[5];
    if (v38)
    {
      objc_msgSend_path(v38, v35, v36, v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastPathComponent(v39, v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByDeletingPathExtension(v43, v44, v45, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_stringByDeletingLastPathComponent(v39, v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = *MEMORY[0x1E0D434C8];
      objc_msgSend_languageCode(v11, v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = v55;
      v72[1] = MEMORY[0x1E0C9AAA0];
      v56 = *MEMORY[0x1E0D43478];
      v71[1] = *MEMORY[0x1E0D43450];
      v71[2] = v56;
      v71[3] = *MEMORY[0x1E0D43468];
      v72[2] = v51;
      v72[3] = v47;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v57, (uint64_t)v72, (uint64_t)v71, 4);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v59 = LMLanguageModelCreate();
      if (v59)
      {
        v60 = [CVNLPDecodingLanguageModel alloc];
        v23 = (void *)objc_msgSend__initWithLanguageModel_locale_decodingWeight_lowerBoundLogProbability_type_(v60, v61, v59, (uint64_t)v11, v12, v16, 1);
        LMLanguageModelRelease();
      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }
    _Block_object_dispose(&v63, 8);

  }
LABEL_24:

  return v23;
}

+ (id)decodingLMLanguageModelForLocale:(id)a3 modelType:(int)a4 decodingWeight:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_opt_class();
  objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__decodingLanguageModelForLocale_modelType_decodingWeight_lowerBoundLogProbability_type_(v9, v14, (uint64_t)v7, v6, v8, v13, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)decodingCVNLPLanguageModelForLocale:(id)a3 modelType:(int)a4 decodingWeight:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_opt_class();
  objc_msgSend_defaultLowerBoundLogProbability(CVNLPInformationStream, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__decodingLanguageModelForLocale_modelType_decodingWeight_lowerBoundLogProbability_type_(v9, v14, (uint64_t)v7, v6, v8, v13, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)pathForLanguageModelForLocale:(id)a3 modelType:(int)a4 resourceType:(int)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  std::string::size_type v18;
  char v19;
  std::string::size_type size;
  BOOL v21;
  std::string *v22;
  std::string::size_type v23;
  __CFString *v24;
  __CFString *v25;
  std::runtime_error *exception;
  void *v28[2];
  char v29;
  void *v30[2];
  char v31;
  BundleHelper *v32;
  _QWORD v33[2];
  char v34;
  _BYTE v35[8];
  std::string __p;
  void *v37[2];
  char v38;
  void *v39;
  std::string v40;

  v7 = a3;
  v11 = v7;
  v39 = &unk_1E60CCF80;
  memset(&v40, 0, sizeof(v40));
  if (a4 != 2 || a5 != 1)
  {
    if (a4 != 1 || a5 != 2)
      goto LABEL_18;
    objc_msgSend_languageCode(v7, v8, v9, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B0349558(v16, v37);

    v30[0] = (void *)0x736C65646F4DLL;
    v31 = 6;
    v32 = objc_alloc_init(BundleHelper);
    sub_1B035F610((uint64_t)v30, (uint64_t)v37, v28);
    sub_1B034B450((uint64_t)v35, (uint64_t)v28);
    std::string::operator=(&v40, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((v29 & 0x80000000) == 0)
        goto LABEL_16;
    }
    else if ((v29 & 0x80000000) == 0)
    {
      goto LABEL_16;
    }
    v17 = v28[0];
    goto LABEL_15;
  }
  objc_msgSend_languageCode(v7, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathExtension_(v12, v13, (uint64_t)CFSTR("lm"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B0349558(v15, v37);

  strcpy((char *)v30, "Models/word_lm");
  v31 = 14;
  v32 = objc_alloc_init(BundleHelper);
  sub_1B035F610((uint64_t)v30, (uint64_t)v37, v33);
  sub_1B034B450((uint64_t)v35, (uint64_t)v33);
  std::string::operator=(&v40, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v34 < 0)
    {
LABEL_12:
      v17 = (void *)v33[0];
LABEL_15:
      operator delete(v17);
    }
  }
  else if (v34 < 0)
  {
    goto LABEL_12;
  }
LABEL_16:

  if ((v31 & 0x80000000) == 0)
  {
    if ((v38 & 0x80000000) == 0)
      goto LABEL_18;
LABEL_23:
    operator delete(v37[0]);
    size = HIBYTE(v40.__r_.__value_.__r.__words[2]);
    v19 = HIBYTE(v40.__r_.__value_.__r.__words[2]);
    if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = v40.__r_.__value_.__l.__size_;
    if (!size)
      goto LABEL_36;
    goto LABEL_26;
  }
  operator delete(v30[0]);
  if (v38 < 0)
    goto LABEL_23;
LABEL_18:
  v18 = HIBYTE(v40.__r_.__value_.__r.__words[2]);
  v19 = HIBYTE(v40.__r_.__value_.__r.__words[2]);
  if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v18 = v40.__r_.__value_.__l.__size_;
  if (!v18)
    goto LABEL_36;
LABEL_26:
  v21 = sub_1B03177C0((uint64_t)&v39);
  v19 = HIBYTE(v40.__r_.__value_.__r.__words[2]);
  if (v21)
  {
    if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v22 = &v40;
    else
      v22 = (std::string *)v40.__r_.__value_.__r.__words[0];
    if ((v40.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v23 = HIBYTE(v40.__r_.__value_.__r.__words[2]);
    else
      v23 = v40.__r_.__value_.__l.__size_;
    v24 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)v22, v23, 0x8000100u, 0);
    if (!v24)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    v25 = v24;
    CFRelease(v25);
    if ((*((_BYTE *)&v40.__r_.__value_.__s + 23) & 0x80) != 0)
      goto LABEL_37;
    goto LABEL_38;
  }
LABEL_36:
  v25 = 0;
  if (v19 < 0)
LABEL_37:
    operator delete(v40.__r_.__value_.__l.__data_);
LABEL_38:

  return v25;
}

- (int64_t)requiredContextLengthForStringLength:(int64_t)a3
{
  int lmSPIType;

  lmSPIType = self->_lmSPIType;
  if (lmSPIType == 2)
    return a3;
  if (lmSPIType == 1)
    return 5;
  return 0;
}

- (vector<unsigned)characterTokenIDsForString:(CVNLPDecodingLanguageModel *)self
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  int v38;
  BOOL v39;
  uint64_t v40;
  unsigned int *v41;
  unsigned int *v42;
  vector<unsigned int, std::allocator<unsigned int>> *result;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;

  v6 = a4;
  v10 = objc_msgSend_length(v6, v7, v8, v9);
  v13 = objc_msgSend_requiredContextLengthForStringLength_(self, v11, v10, v12);
  v17 = v13;
  v45 = 0;
  v46 = 0;
  v47 = 0;
  if (v13)
  {
    if (v13 >> 62)
      sub_1B02D7758();
    v18 = (char *)operator new(4 * v13);
    v19 = &v18[4 * v17];
    v45 = v18;
    v47 = v19;
    memset_pattern16(v18, &unk_1B03B1000, 4 * v17);
    v46 = v19;
  }
  else
  {
    v19 = 0;
    v18 = 0;
  }
  if (objc_msgSend_length(v6, v14, v15, v16))
  {
    v23 = objc_msgSend_length(v6, v20, v21, v22) - 1;
    if (v23 >= 0)
    {
      if (v17)
      {
        do
        {
          sub_1B0361318(v6, v23, &v44);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v44;
          v26 = v24;
          if (objc_msgSend_length(v26, v27, v28, v29) == 1)
          {
            v33 = objc_msgSend_characterAtIndex_(v26, v30, 0, v32);
          }
          else if (objc_msgSend_length(v26, v30, v31, v32) == 2)
          {
            LODWORD(v33) = objc_msgSend_characterAtIndex_(v26, v34, 0, v35);
            v38 = objc_msgSend_characterAtIndex_(v26, v36, 1, v37);
            if ((v38 & 0xFFF0) == 0xFE00)
              v33 = v33;
            else
              v33 = (v38 + ((_DWORD)v33 << 10) - 56613888);
          }
          else
          {
            v33 = 0xFFFFFFFFLL;
          }

          *(_DWORD *)&v18[4 * v17 - 4] = sub_1B035E210(v33);
          v23 = v25 - 1;
          v39 = v17-- != 0;
        }
        while (((v25 - 1) & 0x8000000000000000) == 0 && v17 != 0 && v39);
      }
    }
  }
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  v40 = v19 - v18;
  if (v19 != v18)
  {
    if (v40 < 0)
      sub_1B02D7758();
    v41 = (unsigned int *)operator new(v19 - v18);
    retstr->__begin_ = v41;
    v42 = &v41[v40 >> 2];
    retstr->__end_cap_.__value_ = v42;
    memcpy(v41, v18, v19 - v18);
    retstr->__end_ = v42;
  }
  if (v18)
    operator delete(v18);

  return result;
}

- (vector<unsigned)wordTokenIDsForString:(CVNLPDecodingLanguageModel *)self outTokenRanges:(SEL)a3
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  id v38;
  id v39;
  id v40;
  uint64_t *v41;
  _BYTE *v42;
  _BYTE *v43;
  int64_t v44;
  unsigned int *v45;
  unsigned int *v46;
  vector<unsigned int, std::allocator<unsigned int>> *result;
  id v48;
  void *v49;
  _QWORD v50[4];
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  __n128 (*v55)(__n128 *, __n128 *);
  uint64_t (*v56)();
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[4];
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  __n128 (*v69)(__n128 *, __n128 *);
  void (*v70)(uint64_t);
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;

  v66 = 0;
  v67 = &v66;
  v68 = 0x4812000000;
  v69 = sub_1B035FEC8;
  v70 = sub_1B035FEEC;
  v71 = &unk_1B03B5E12;
  v72 = 0;
  v73 = 0;
  v74 = 0;
  v48 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v48, v10, (uint64_t)CFSTR(" "), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  sub_1B0360ED0(v12, &v65);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v65;

  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  v64[3] = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x4012000000;
  v55 = sub_1B035FF04;
  v56 = nullsub_17;
  v58 = 0;
  v59 = 0;
  v57 = &unk_1B03B5E12;
  v58 = objc_msgSend_length(v13, v15, v16, v17);
  v59 = 0;
  v18 = v61[3];
  if (v18 < objc_msgSend_count(v14, v19, v20, v21))
  {
    objc_msgSend_objectAtIndex_(v14, v22, v61[3], v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_rangeValue(v24, v25, v26, v27);
    v29 = v53;
    v53[6] = v28;
    v29[7] = v30;

    ++v61[3];
  }
  v31 = objc_msgSend_maximumLengthOfBytesUsingEncoding_(v13, v22, 4, v23);
  v35 = objc_msgSend_length(v13, v32, v33, v34);
  v36 = operator new[]();
  v51 = 0;
  objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(v13, v37, v36, v31, &v51, 4, 0, 0, v35, 0);
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0;
  v38 = v13;
  v39 = v14;
  v40 = v49;
  LMStreamTokenizerPushBytes();
  MEMORY[0x1B5E07CB4](v36, 0x1000C8077774924);
  if (a5)
    *a5 = objc_retainAutorelease(v40);
  v41 = v67;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  v43 = (_BYTE *)v41[6];
  v42 = (_BYTE *)v41[7];
  v44 = v42 - v43;
  if (v42 != v43)
  {
    if (v44 < 0)
      sub_1B02D7758();
    v45 = (unsigned int *)operator new(v42 - v43);
    retstr->__begin_ = v45;
    v46 = &v45[v44 >> 2];
    retstr->__end_cap_.__value_ = v46;
    memcpy(v45, v43, v44);
    retstr->__end_ = v46;
  }

  _Block_object_dispose(v50, 8);
  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(v64, 8);

  _Block_object_dispose(&v66, 8);
  if (v72)
  {
    v73 = v72;
    operator delete(v72);
  }

  return result;
}

+ (unsigned)_normalizedLMTokenIDForWord:(id)a3 withTokenID:(unsigned int)TokenIDForString sourceLanguageModel:(id)a5 outScore:(double *)a6
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;

  v8 = a3;
  objc_msgSend_languageModel(a5, v9, v10, v11);
  if (!TokenIDForString)
  {
    TokenIDForString = LMLanguageModelGetTokenIDForString();
    if (!TokenIDForString)
    {
      objc_msgSend_lowercaseString(v8, v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      TokenIDForString = LMLanguageModelGetTokenIDForString();

    }
  }
  if (TokenIDForString == 28)
    v16 = 6;
  else
    v16 = TokenIDForString;
  if ((v16 & 0xFFFFFFFE) == 0x82)
    v17 = 3;
  else
    v17 = v16;

  return v17;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)languageModel
{
  return self->_languageModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
