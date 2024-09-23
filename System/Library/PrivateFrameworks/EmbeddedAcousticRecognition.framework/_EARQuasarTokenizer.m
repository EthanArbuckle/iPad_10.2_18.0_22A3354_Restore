@implementation _EARQuasarTokenizer

+ (unique_ptr<quasar::TextTokenizer,)tokenizerWithNcsRoot:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unique_ptr<quasar::TextTokenizer, std::default_delete<quasar::TextTokenizer>> v9;
  void *__p[2];
  uint64_t v11;
  void *v12[2];
  uint64_t v13;
  void *v14[2];
  char v15;
  void *v16[2];
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  v5 = a3;
  *v4 = 0;
  if ((os_variant_is_darwinos() & 1) != 0)
    goto LABEL_19;
  +[EARSdapiHelper EnsureSDAPIInitialized](EARSdapiHelper, "EnsureSDAPIInitialized");
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("dispatch.voc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("lexicon.enh"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("token_s.enh"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    v16[0] = 0;
    v16[1] = 0;
    v17 = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(v14, "");
  if (!v7)
  {
    v12[0] = 0;
    v12[1] = 0;
    v13 = 0;
    if (v8)
      goto LABEL_7;
LABEL_9:
    __p[0] = 0;
    __p[1] = 0;
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v7, "ear_toString");
  if (!v8)
    goto LABEL_9;
LABEL_7:
  objc_msgSend(v8, "ear_toString");
LABEL_10:
  sdapi::SdapiTokenizer::createSdapiTokenizer((sdapi::SdapiUtil *)v16, (uint64_t)v14, (uint64_t)v12, (uint64_t *)__p, 0, &v18);
  *v4 = v18;
  v18 = 0;
  if (SHIBYTE(v11) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v13) < 0)
    operator delete(v12[0]);
  if (v15 < 0)
    operator delete(v14[0]);
  if (SHIBYTE(v17) < 0)
    operator delete(v16[0]);

LABEL_19:
  return v9;
}

+ (unique_ptr<quasar::TextTokenizer,)tokenizerWithTokenizerModelRoot:(id)a3
{
  _QWORD *v3;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  EARLogger *v12;
  NSObject *v13;
  _QWORD *v14;
  unique_ptr<quasar::TextTokenizer, std::default_delete<quasar::TextTokenizer>> v15;
  uint64_t v16;
  __int128 buf;
  uint64_t v18;
  uint64_t v19;

  v5 = v3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("token_s.enh"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

  if ((v9 & 1) != 0)
  {
    *v5 = 0;
    objc_msgSend(a1, "tokenizerWithNcsRoot:", v6);
    *v5 = buf;
  }
  else
  {
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("wordlist/token_infos.bin"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "fileExistsAtPath:", v10);

    if ((v11 & 1) != 0)
    {
      *v5 = 0;
      if (v6)
      {
        objc_msgSend(v6, "ear_toString");
      }
      else
      {
        buf = 0uLL;
        v18 = 0;
      }
      quasar::tennessee::TennesseeTokenizer::createTennesseeTokenizer((char *)&buf, 0, &v16);
      *v5 = v16;
      v16 = 0;
      if (SHIBYTE(v18) < 0)
        operator delete((void *)buf);
    }
    else
    {
      EARLogger::QuasarOSLogger(v12);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v6;
        _os_log_impl(&dword_1AD756000, v13, OS_LOG_TYPE_INFO, "Unable to infer text normalization model type at %@.", (uint8_t *)&buf, 0xCu);
      }

      *v5 = 0;
      v14 = (_QWORD *)operator new();
      std::string::basic_string[abi:ne180100]<0>(&buf, " \t\n");
      quasar::BasicTokenizer::BasicTokenizer(v14, &buf);
      if (SHIBYTE(v18) < 0)
        operator delete((void *)buf);
      *v5 = v14;
    }
  }

  return v15;
}

+ (unique_ptr<quasar::TextTokenizer,)tokenizerWithModelRoot:(id)a3
{
  _QWORD *v3;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  EARLogger *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  EARLogger *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  unique_ptr<quasar::TextTokenizer, std::default_delete<quasar::TextTokenizer>> v36;
  void *__p[2];
  char v38;

  v5 = v3;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("TP"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("tennessee"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("ncs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *v5 = 0;
  v11 = (EARLogger *)objc_msgSend(v7, "fileExistsAtPath:", v9);
  if ((_DWORD)v11)
  {
    EARLogger::QuasarOSLogger(v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[_EARQuasarTokenizer tokenizerWithModelRoot:].cold.2((uint64_t)v9, v12, v13, v14, v15, v16, v17, v18);

    v19 = (EARLogger *)objc_msgSend(a1, "tokenizerWithTokenizerModelRoot:", v9);
    goto LABEL_9;
  }
  v19 = (EARLogger *)objc_msgSend(v7, "fileExistsAtPath:", v10);
  if ((_DWORD)v19)
  {
    EARLogger::QuasarOSLogger(v19);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      +[_EARQuasarTokenizer tokenizerWithModelRoot:].cold.3((uint64_t)v10, v20, v21, v22, v23, v24, v25, v26);

    v19 = (EARLogger *)objc_msgSend(a1, "tokenizerWithTokenizerModelRoot:", v10);
LABEL_9:
    v27 = __p[0];
    *v5 = __p[0];
    if (v27)
      goto LABEL_15;
  }
  EARLogger::QuasarOSLogger(v19);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    +[_EARQuasarTokenizer tokenizerWithModelRoot:].cold.1((uint64_t)v6, v28, v29, v30, v31, v32, v33, v34);

  v35 = (_QWORD *)operator new();
  std::string::basic_string[abi:ne180100]<0>(__p, " \t\n");
  quasar::BasicTokenizer::BasicTokenizer(v35, (__int128 *)__p);
  if (v38 < 0)
    operator delete(__p[0]);
  *v5 = v35;
LABEL_15:

  return v36;
}

+ (unique_ptr<quasar::TextTokenizer,)tokenizerWithRecognizerConfigPath:(id)a3
{
  unique_ptr<quasar::TextTokenizer, std::default_delete<quasar::TextTokenizer>> v4;
  id v5;

  objc_msgSend(a3, "stringByDeletingLastPathComponent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tokenizerWithModelRoot:");

  return v4;
}

+ (id)extractModelRootFromNcsResourcePaths:(id)a3 lexiconEnh:(id)a4 tokenEnh:(id)a5 itnEnh:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "stringByDeletingLastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("ncs")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EARTokenizer.mm"), 175, CFSTR("General vocabulary %@ does not live in directory named 'ncs' (was: %@)."), v11, v16);

  }
  objc_msgSend(v11, "stringByDeletingLastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByDeletingLastPathComponent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToString:", v18);

  if ((v19 & 1) != 0)
  {
    if (!v13)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EARTokenizer.mm"), 178, CFSTR("lexicon.enh is not at the expected location."));

    if (!v13)
      goto LABEL_7;
  }
  objc_msgSend(v11, "stringByDeletingLastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByDeletingLastPathComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqualToString:", v21);

  if ((v22 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EARTokenizer.mm"), 183, CFSTR("token.enh is not at the expected location."));

  }
LABEL_7:
  if (v14)
  {
    objc_msgSend(v11, "stringByDeletingLastPathComponent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByDeletingLastPathComponent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqualToString:", v24);

    if ((v25 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EARTokenizer.mm"), 189, CFSTR("itn.enh is not at the expected location."));

    }
  }
  objc_msgSend(v11, "stringByDeletingLastPathComponent");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringByDeletingLastPathComponent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)extractModelRootFromNcsRoot:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ncs")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EARTokenizer.mm"), 200, CFSTR("NCS root %@ does not point to directory named 'ncs' (was: %@)."), v5, v6);

  }
  objc_msgSend(v5, "stringByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_EARQuasarTokenizer)initWithNcsRoot:(id)a3
{
  id v4;
  _EARQuasarTokenizer *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EARQuasarTokenizer;
  v5 = -[_EARQuasarTokenizer init](&v10, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    if (v6)
      objc_msgSend(v6, "tokenizerWithNcsRoot:", v4);
    else
      v9 = 0;
    std::shared_ptr<quasar::TextTokenizer>::operator=[abi:ne180100]<quasar::TextTokenizer,std::default_delete<quasar::TextTokenizer>,void>(&v5->_tokenizer.__ptr_, &v9);
    v7 = v9;
    v9 = 0;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }

  return v5;
}

- (_EARQuasarTokenizer)initWithModelRoot:(id)a3
{
  id v4;
  _EARQuasarTokenizer *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EARQuasarTokenizer;
  v5 = -[_EARQuasarTokenizer init](&v10, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    if (v6)
      objc_msgSend(v6, "tokenizerWithModelRoot:", v4);
    else
      v9 = 0;
    std::shared_ptr<quasar::TextTokenizer>::operator=[abi:ne180100]<quasar::TextTokenizer,std::default_delete<quasar::TextTokenizer>,void>(&v5->_tokenizer.__ptr_, &v9);
    v7 = v9;
    v9 = 0;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }

  return v5;
}

- (_EARQuasarTokenizer)initWithTokenizerModelRoot:(id)a3
{
  id v4;
  _EARQuasarTokenizer *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_EARQuasarTokenizer;
  v5 = -[_EARQuasarTokenizer init](&v10, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    if (v6)
      objc_msgSend(v6, "tokenizerWithTokenizerModelRoot:", v4);
    else
      v9 = 0;
    std::shared_ptr<quasar::TextTokenizer>::operator=[abi:ne180100]<quasar::TextTokenizer,std::default_delete<quasar::TextTokenizer>,void>(&v5->_tokenizer.__ptr_, &v9);
    v7 = v9;
    v9 = 0;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }

  return v5;
}

- (id)tokenize:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  std::string *v8;
  std::string *v9;
  uint64_t v10;
  std::string *v11;
  void *v12;
  void *v13;
  std::string v15;
  void *__p;
  void *v17;
  uint64_t v18;
  void *v19[2];
  uint64_t v20;

  v4 = a3;
  v5 = v4;
  v19[0] = 0;
  v19[1] = 0;
  v20 = 0;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p = 0;
    v17 = 0;
    v18 = 0;
  }
  quasar::TextSanitizer::sanitize((uint64_t)&self->_sanitizer, (uint64_t)&__p, (uint64_t)v19);
  if (SHIBYTE(v18) < 0)
    operator delete(__p);
  __p = 0;
  v17 = 0;
  v18 = 0;
  (*(void (**)(TextTokenizer *, void **, void **))(*(_QWORD *)self->_tokenizer.__ptr_ + 16))(self->_tokenizer.__ptr_, v19, &__p);
  if (__p == v17)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    memset(&v15, 0, sizeof(v15));
    v8 = *(std::string **)__p;
    v9 = (std::string *)*((_QWORD *)__p + 1);
    if (*(std::string **)__p != v9)
    {
      do
      {
        v10 = quasar::QsrText::SingletonInstance((quasar::QsrText *)v6);
        v6 = quasar::QsrText::encodeTokenQsrTextWithMetadata(v10, v8, &v15);
        if ((_DWORD)v6)
        {
          if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v11 = &v15;
          else
            v11 = (std::string *)v15.__r_.__value_.__r.__words[0];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v12);

        }
        v8 = (std::string *)((char *)v8 + 32);
      }
      while (v8 != v9);
    }
    v13 = (void *)objc_msgSend(v7, "copy");
    if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v15.__r_.__value_.__l.__data_);

  }
  v15.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
  std::vector<quasar::TextTokenizer::TokenString>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
  if (SHIBYTE(v20) < 0)
    operator delete(v19[0]);

  return v13;
}

- (id)tokenize:(id)a3 limit:(unint64_t)a4
{
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;

  -[_EARQuasarTokenizer tokenize:](self, "tokenize:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 <= a4)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v5, "subarrayWithRange:", v6 - a4, a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_tokenizer);
  quasar::BasicTextSanitizer::~BasicTextSanitizer((quasar::BasicTextSanitizer *)&self->_sanitizer);
}

- (id).cxx_construct
{
  BasicTextSanitizer *p_sanitizer;
  void *__p[2];
  char v6;

  p_sanitizer = &self->_sanitizer;
  std::string::basic_string[abi:ne180100]<0>(__p, "•|\\(|\\)|\"|\\[|\\]|\\{|\\}|®|,|;|\\?|\\!|\\\\");
  quasar::BasicTextSanitizer::BasicTextSanitizer((quasar::TextSanitizer *)p_sanitizer, (uint64_t *)__p);
  if (v6 < 0)
    operator delete(__p[0]);
  self->_tokenizer.__ptr_ = 0;
  self->_tokenizer.__cntrl_ = 0;
  return self;
}

+ (void)tokenizerWithModelRoot:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_12(&dword_1AD756000, a2, a3, "Unable to find TN model within %@, falling back to BasicTokenizer.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)tokenizerWithModelRoot:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_12(&dword_1AD756000, a2, a3, "Found Tennessee model at %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)tokenizerWithModelRoot:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_12(&dword_1AD756000, a2, a3, "Found NCS model at %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
