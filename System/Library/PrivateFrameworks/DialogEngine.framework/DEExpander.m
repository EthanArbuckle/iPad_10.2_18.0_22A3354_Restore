@implementation DEExpander

- (DEExpander)init
{
  DEExpander *v2;
  DEExpander *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DEExpander;
  v2 = -[DEExpander init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[DEExpander setShouldEvaluateConditions:](v2, "setShouldEvaluateConditions:", 0);
    -[DEExpander setShouldExpandOpts:](v3, "setShouldExpandOpts:", 0);
  }
  return v3;
}

- (id)expand:(id)a3 localeString:(id)a4 expansionType:(int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  id v15;
  id v16;
  siri::dialogengine::Context *v17;
  siri::dialogengine::File *v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  __CFString *v22;
  std::string *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  id v30;
  std::string __p;
  std::string v32;
  siri::dialogengine::Context *v33;
  std::__shared_weak_count *v34;
  std::string v35;
  std::string v36;
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  -[DEExpander parameters](self, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[DEExpander parameters](self, "parameters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v12, CFSTR("parameters"));

  }
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v10, 3, &v37);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v37;
  if (!v13)
  {
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"Failed to parse input parameters for CAT request", v14);
    v22 = 0;
    goto LABEL_45;
  }
  v16 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v13, 4));
  std::string::basic_string[abi:ne180100]<0>(&v36, (char *)objc_msgSend(v16, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(&v35, (char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(&v32, (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  siri::dialogengine::PrepareRequestFromJson((const char *)&v36, &v35, &v32, &__p, &v33);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v32.__r_.__value_.__l.__data_);
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v35.__r_.__value_.__l.__data_);
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v36.__r_.__value_.__l.__data_);
  v17 = v33;
  if (v33)
  {
    v30 = v8;
    v18 = (siri::dialogengine::File *)*((_QWORD *)v33 + 63);
    v19 = (std::__shared_weak_count *)*((_QWORD *)v33 + 64);
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v18;
    __p.__r_.__value_.__l.__size_ = (std::string::size_type)v19;
    if (v19)
    {
      p_shared_owners = (unint64_t *)&v19->__shared_owners_;
      do
        v21 = __ldxr(p_shared_owners);
      while (__stxr(v21 + 1, p_shared_owners));
    }
    if (!v18)
    {
      v22 = &stru_1E793AF80;
      goto LABEL_33;
    }
    memset(&v36, 0, sizeof(v36));
    if (a5 == 1)
    {
      siri::dialogengine::File::ExpandAsDAG(v17, (uint64_t)v18, -[DEExpander shouldEvaluateConditions](self, "shouldEvaluateConditions"), -[DEExpander shouldExpandOpts](self, "shouldExpandOpts"), 0, (uint64_t)&v35);
      siri::dialogengine::ConstructJSONString(&v35, &v32);
      v36 = v32;
      std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy((_QWORD *)v35.__r_.__value_.__l.__size_);
    }
    else if (!a5)
    {
      siri::dialogengine::File::Expand(v18, v17, -[DEExpander shouldEvaluateConditions](self, "shouldEvaluateConditions"), -[DEExpander shouldExpandOpts](self, "shouldExpandOpts"), &v35);
      v36 = v35;
    }
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
    {
      v23 = (std::string *)v36.__r_.__value_.__r.__words[0];
      if (!v36.__r_.__value_.__l.__size_)
      {
        v22 = 0;
LABEL_32:
        operator delete(v23);
LABEL_33:
        if (v19)
        {
          v24 = (unint64_t *)&v19->__shared_owners_;
          do
            v25 = __ldaxr(v24);
          while (__stlxr(v25 - 1, v24));
          if (!v25)
          {
            ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
            std::__shared_weak_count::__release_weak(v19);
          }
        }
        v8 = v30;
        goto LABEL_39;
      }
    }
    else
    {
      if (!*((_BYTE *)&v36.__r_.__value_.__s + 23))
      {
        v22 = 0;
        goto LABEL_33;
      }
      v23 = &v36;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v23, v30, *(_OWORD *)&__p.__r_.__value_.__l.__data_);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((SHIBYTE(v36.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_33;
    v23 = (std::string *)v36.__r_.__value_.__r.__words[0];
    goto LABEL_32;
  }
  v22 = 0;
LABEL_39:
  v26 = v34;
  if (v34)
  {
    v27 = (unint64_t *)&v34->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }

LABEL_45:
  return v22;
}

- (id)expandWithParamsString:(id)a3 localeString:(id)a4
{
  -[DEExpander expand:localeString:expansionType:](self, "expand:localeString:expansionType:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)expandWithParamsString:(id)a3 localeString:(id)a4 evaluateConditions:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[DEExpander setShouldEvaluateConditions:](self, "setShouldEvaluateConditions:", v5);
  -[DEExpander expandWithParamsString:localeString:](self, "expandWithParamsString:localeString:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)expandWithParamsStringAsDAG:(id)a3 localeString:(id)a4
{
  -[DEExpander expand:localeString:expansionType:](self, "expand:localeString:expansionType:", a3, a4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (BOOL)shouldEvaluateConditions
{
  return self->_shouldEvaluateConditions;
}

- (void)setShouldEvaluateConditions:(BOOL)a3
{
  self->_shouldEvaluateConditions = a3;
}

- (BOOL)shouldExpandOpts
{
  return self->_shouldExpandOpts;
}

- (void)setShouldExpandOpts:(BOOL)a3
{
  self->_shouldExpandOpts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
