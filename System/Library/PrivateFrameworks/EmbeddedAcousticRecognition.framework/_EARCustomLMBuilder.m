@implementation _EARCustomLMBuilder

+ (void)initialize
{
  objc_opt_class();
}

- (_EARCustomLMBuilder)initWithConfiguration:(id)a3
{
  id v4;
  TextTokenizer *v5;
  TextTokenizer *value;
  void *v7;
  void *v8;
  void *v9;
  TextTokenizer *v10;
  quasar::CustomLMBuilder *v11;
  _EARCustomLMBuilder *v12;
  void *__p[2];
  uint64_t v15;

  v4 = a3;
  +[_EARQuasarTokenizer tokenizerWithModelRoot:](_EARQuasarTokenizer, "tokenizerWithModelRoot:", v4);
  v5 = (TextTokenizer *)__p[0];
  __p[0] = 0;
  value = self->_tokenizer.__ptr_.__value_;
  self->_tokenizer.__ptr_.__value_ = v5;
  if (value)
  {
    (*(void (**)(TextTokenizer *))(*(_QWORD *)value + 8))(value);
    v7 = __p[0];
    __p[0] = 0;
    if (v7)
      (*(void (**)(void *))(*(_QWORD *)v7 + 8))(v7);
  }
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("mini.json"), __p[0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v15 = 0;
  }
  v10 = self->_tokenizer.__ptr_.__value_;
  v11 = (quasar::CustomLMBuilder *)operator new();
  quasar::CustomLMBuilder::CustomLMBuilder(v11, __p, v10);
  std::unique_ptr<quasar::CustomLMBuilder>::reset[abi:ne180100]((quasar::CustomLMBuilder **)&self->_customLMBuilder, v11);
  if (SHIBYTE(v15) < 0)
    operator delete(__p[0]);
  v12 = self;

  return v12;
}

- (BOOL)getFstGrammar:(id)a3 overrideFolder:(id)a4 weight:(float)a5 errorOut:(id *)a6
{
  id v10;
  void *v11;
  CustomLMBuilder *value;
  unsigned __int8 **v13;
  char FstGrammar;
  char v15;
  CustomLMBuilder *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  CustomLMBuilder *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  BOOL v25;
  id v27;
  std::string __p;
  _QWORD v29[5];
  uint64_t v30;
  unsigned __int8 **v31;
  uint64_t v32;
  __n128 (*v33)(__n128 *, __n128 *);
  void (*v34)(uint64_t);
  void *v35;
  _QWORD v36[3];
  float v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v37 = a5;
  v11 = (void *)objc_msgSend(a3, "mutableCopy");
  v30 = 0;
  v31 = (unsigned __int8 **)&v30;
  v32 = 0x4812000000;
  v33 = __Block_byref_object_copy__9;
  v34 = __Block_byref_object_dispose__9;
  v35 = &unk_1AE30551B;
  memset(v36, 0, sizeof(v36));
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __68___EARCustomLMBuilder_getFstGrammar_overrideFolder_weight_errorOut___block_invoke;
  v29[3] = &unk_1E5D46F38;
  v29[4] = &v30;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v29);
  value = self->_customLMBuilder.__ptr_.__value_;
  v13 = v31;
  if (v10)
    objc_msgSend(v10, "ear_toString");
  else
    memset(&__p, 0, sizeof(__p));
  FstGrammar = quasar::CustomLMBuilder::getFstGrammar((uint64_t)value, v13 + 6, &__p, &v37);
  v15 = FstGrammar;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((v15 & 1) != 0)
      goto LABEL_6;
LABEL_9:
    if (!a6)
    {
      v25 = 0;
      goto LABEL_19;
    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    v20 = self->_customLMBuilder.__ptr_.__value_;
    if (*((char *)v20 + 23) < 0)
      v20 = *(CustomLMBuilder **)v20;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v20, objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("CustomLMBuilderErrorDomain"), 2, v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if ((FstGrammar & 1) == 0)
    goto LABEL_9;
LABEL_6:
  v16 = self->_customLMBuilder.__ptr_.__value_;
  if (*((char *)v16 + 47) < 0)
  {
    v17 = (char *)*((_QWORD *)v16 + 3);
    v18 = *((_QWORD *)v16 + 4);
  }
  else
  {
    v17 = (char *)v16 + 24;
    v18 = *((unsigned __int8 *)v16 + 47);
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/oovProfile.txt"), v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v21, "writeToFile:options:error:", v24, 1, &v27);
  v22 = v27;

  v25 = v22 == 0;
  if (!a6 || !v22)
    goto LABEL_18;
  v23 = objc_retainAutorelease(v22);
  v22 = v23;
LABEL_17:
  v25 = 0;
  *a6 = v23;
LABEL_18:

LABEL_19:
  _Block_object_dispose(&v30, 8);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v36;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);

  return v25;
}

- (void).cxx_destruct
{
  TextTokenizer *value;

  value = self->_tokenizer.__ptr_.__value_;
  self->_tokenizer.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(TextTokenizer *, SEL))(*(_QWORD *)value + 8))(value, a2);
  std::unique_ptr<quasar::CustomLMBuilder>::reset[abi:ne180100]((quasar::CustomLMBuilder **)&self->_customLMBuilder, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
