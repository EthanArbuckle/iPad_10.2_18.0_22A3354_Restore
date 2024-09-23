@implementation SNNMILProgram

+ (void)loadContentsOfURL:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, _QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t *p_shared_owners;
  unint64_t v15;
  SNNMILProgram *v16;
  uint64_t v17;
  void *v18;
  SNNMILProgram *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  void (**v31)(id, void *, _QWORD);
  _QWORD v32[2];
  std::__shared_weak_count *v33;
  uint64_t v34;
  void *__p[2];
  uint64_t v36;
  uint64_t v37;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  v10 = (void *)MEMORY[0x2494ED8C0]();
  v11 = objc_msgSend(v7, "hasPathExtension:", CFSTR("mil"));
  if ((v11 & 1) != 0 || (v11 = objc_msgSend(v7, "hasPathExtension:", CFSTR("txt")), (_DWORD)v11))
  {
    MIL::ParserOptions::Make((MIL::ParserOptions *)v11);
    objc_msgSend(v7, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "cxxString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v36 = 0;
    }
    (*(void (**)(uint64_t, void **, uint64_t))(*(_QWORD *)v37 + 32))(v37, __p, 1);
    if (SHIBYTE(v36) < 0)
      operator delete(__p[0]);

    if (v8)
    {
      objc_msgSend(v8, "context");
    }
    else
    {
      v32[1] = 0;
      v33 = 0;
    }
    MIL::Text::ParseProgramFromFile();
    if (v33)
    {
      p_shared_owners = &v33->__shared_owners_;
      do
        v15 = __ldaxr((unint64_t *)p_shared_owners);
      while (__stlxr(v15 - 1, (unint64_t *)p_shared_owners));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }
    v16 = [SNNMILProgram alloc];
    v17 = v34;
    v34 = 0;
    v32[0] = v17;
    objc_msgSend(v7, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SNNMILProgram initWithProgram:sourceFilePath:](v16, "initWithProgram:sourceFilePath:", v32, v18);

    v20 = v32[0];
    v32[0] = 0;
    if (v20)
      (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
    v9[2](v9, v19, 0);

    v21 = v34;
    v34 = 0;
    if (v21)
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
    v22 = v37;
    v37 = 0;
    if (v22)
      (*(void (**)(uint64_t))(*(_QWORD *)v22 + 8))(v22);
  }
  else if (objc_msgSend(v7, "hasPathExtension:", CFSTR("mlpackage")))
  {
    v23 = (void *)MEMORY[0x24BDBFFC8];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __58__SNNMILProgram_loadContentsOfURL_withContext_completion___block_invoke;
    v29[3] = &unk_25137A978;
    v31 = v9;
    v30 = v8;
    objc_msgSend(v23, "compileModelAtURL:completionHandler:", v7, v29);

  }
  else
  {
    if (objc_msgSend(v7, "hasPathExtension:", CFSTR("mlmodelc")))
    {
      objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("model.mil"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "fileExistsAtPath:", v26);

      if ((v27 & 1) != 0)
      {
        +[SNNMILProgram loadContentsOfURL:withContext:completion:](SNNMILProgram, "loadContentsOfURL:withContext:completion:", v24, v8, v9);
      }
      else
      {
        +[SNNError errorWithCode:description:](SNNError, "errorWithCode:description:", -8, CFSTR("Model package must be exported as a MLProgram."));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, void *))v9)[2](v9, 0, v28);

      }
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v9)[2](v9, 0, v24);
    }

  }
  objc_autoreleasePoolPop(v10);

}

void __58__SNNMILProgram_loadContentsOfURL_withContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("model.mil"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

    if ((v9 & 1) != 0)
    {
      +[SNNMILProgram loadContentsOfURL:withContext:completion:](SNNMILProgram, "loadContentsOfURL:withContext:completion:", v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
    else
    {
      +[SNNError errorWithCode:description:](SNNError, "errorWithCode:description:", -8, CFSTR("Model package must be exported as a MLProgram."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }

}

- (SNNMILProgram)initWithProgram:()unique_ptr<MIL:(std:(id)a4 :default_delete<MIL::IRProgram>>)a3 :IRProgram sourceFilePath:
{
  NSString *v6;
  SNNMILProgram *v7;
  NSString *milFilePath;
  objc_super v10;

  v6 = (NSString *)a4;
  v10.receiver = self;
  v10.super_class = (Class)SNNMILProgram;
  v7 = -[SNNMILProgram init](&v10, sel_init);
  std::shared_ptr<MIL::IRProgram>::operator=[abi:ne180100]<MIL::IRProgram,std::default_delete<MIL::IRProgram>,void>(&v7->_program.__ptr_, (uint64_t *)a3.var0.var0);
  milFilePath = v7->_milFilePath;
  v7->_milFilePath = v6;

  return v7;
}

- (SNNMILProgram)initWithProgram:()unique_ptr<MIL:(std::default_delete<MIL::IRProgram>>)a3 :IRProgram
{
  uint64_t v3;
  SNNMILProgram *v4;
  uint64_t v5;
  uint64_t v7;

  v3 = *(_QWORD *)a3.var0.var0;
  *(_QWORD *)a3.var0.var0 = 0;
  v7 = v3;
  v4 = -[SNNMILProgram initWithProgram:sourceFilePath:](self, "initWithProgram:sourceFilePath:", &v7, 0);
  v5 = v7;
  v7 = 0;
  if (v5)
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  return v4;
}

- (shared_ptr<MIL::IRProgram>)milProgram
{
  IRProgram **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<MIL::IRProgram> result;

  cntrl = self->_program.__cntrl_;
  *v2 = self->_program.__ptr_;
  v2[1] = (IRProgram *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (IRProgram *)self;
  return result;
}

- (BOOL)isReferencingBlobFile
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  char isKindOfClass;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  char v17;
  BOOL v18;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (!self->_milFilePath)
    return 0;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[SNNMILProgram functionNames](self, "functionNames");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v3)
  {
    v20 = v3;
    v21 = *(_QWORD *)v36;
    do
    {
      v23 = 0;
      while (2)
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(obj);
        v22 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * v23);
        -[SNNMILProgram functionWithName:](self, "functionWithName:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; objc_msgSend(v25, "operationCount") > i; ++i)
        {
          objc_msgSend(v25, "operationAtIndex:");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          objc_msgSend(v4, "attributes");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          if (v6)
          {
            v7 = *(_QWORD *)v32;
LABEL_11:
            v8 = 0;
            while (1)
            {
              if (*(_QWORD *)v32 != v7)
                objc_enumerationMutation(v5);
              v9 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * v8);
              objc_msgSend(v9, "value");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
                goto LABEL_29;
              if (v6 == ++v8)
              {
                v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
                if (v6)
                  goto LABEL_11;
                break;
              }
            }
          }

          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v4, "inputs");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v28;
LABEL_19:
            v14 = 0;
            while (1)
            {
              if (*(_QWORD *)v28 != v13)
                objc_enumerationMutation(v5);
              v15 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * v14);
              objc_msgSend(v15, "value");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v17 = objc_opt_isKindOfClass();

              if ((v17 & 1) != 0)
                break;
              if (v12 == ++v14)
              {
                v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
                if (v12)
                  goto LABEL_19;
                goto LABEL_25;
              }
            }
LABEL_29:

            v18 = 1;
            goto LABEL_32;
          }
LABEL_25:

        }
        if (++v23 != v20)
          continue;
        break;
      }
      v18 = 0;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v20);
  }
  else
  {
    v18 = 0;
  }
LABEL_32:

  return v18;
}

- (NSArray)functionNames
{
  void *v3;
  _QWORD *i;
  void *v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  for (i = *(_QWORD **)((*(uint64_t (**)(IRProgram *))(*(_QWORD *)self->_program.__ptr_ + 72))(self->_program.__ptr_)
                       + 16); i; i = (_QWORD *)*i)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCXXString:", i + 2);
    objc_msgSend(v3, "addObject:", v5);

  }
  return (NSArray *)v3;
}

- (id)functionWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t **v6;
  uint64_t v7;
  __int128 v8;
  std::string::size_type size;
  uint64_t *v10;
  int v11;
  uint64_t **v12;
  std::string *v13;
  uint64_t v14;
  SNNMILFunction *v15;
  SNNMILFunction *v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::string __p;
  uint64_t *v25;
  std::__shared_weak_count *v26;
  std::string v27;

  v4 = a3;
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "cxxString");
  else
    memset(&v27, 0, sizeof(v27));
  v6 = *(uint64_t ***)((*(uint64_t (**)(IRProgram *))(*(_QWORD *)self->_program.__ptr_ + 72))(self->_program.__ptr_)
                    + 16);
  if (!v6)
  {
LABEL_22:
    v15 = 0;
    goto LABEL_36;
  }
  v7 = HIBYTE(v27.__r_.__value_.__r.__words[2]);
  v8 = *(_OWORD *)&v27.__r_.__value_.__l.__data_;
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v27.__r_.__value_.__r.__words[2]);
  else
    size = v27.__r_.__value_.__l.__size_;
  while (1)
  {
    v10 = (uint64_t *)*((unsigned __int8 *)v6 + 39);
    v11 = (char)v10;
    if ((char)v10 < 0)
      v10 = v6[3];
    if ((uint64_t *)size != v10)
      goto LABEL_21;
    v12 = v11 >= 0 ? v6 + 2 : (uint64_t **)v6[2];
    if ((v7 & 0x80) != 0)
      break;
    if (!(_DWORD)v7)
      goto LABEL_23;
    v13 = &v27;
    v14 = v7;
    while (v13->__r_.__value_.__s.__data_[0] == *(unsigned __int8 *)v12)
    {
      v13 = (std::string *)((char *)v13 + 1);
      v12 = (uint64_t **)((char *)v12 + 1);
      if (!--v14)
        goto LABEL_23;
    }
LABEL_21:
    v6 = (uint64_t **)*v6;
    if (!v6)
      goto LABEL_22;
  }
  if (memcmp((const void *)v8, v12, *((size_t *)&v8 + 1)))
    goto LABEL_21;
LABEL_23:
  v16 = [SNNMILFunction alloc];
  v17 = (std::__shared_weak_count *)v6[6];
  v25 = v6[5];
  v26 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v19 = __ldxr(p_shared_owners);
    while (__stxr(v19 + 1, p_shared_owners));
  }
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v27.__r_.__value_.__l.__data_, v27.__r_.__value_.__l.__size_);
  else
    __p = v27;
  v15 = -[SNNMILFunction initWithFunction:name:](v16, "initWithFunction:name:", &v25, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v20 = v26;
  if (v26)
  {
    v21 = (unint64_t *)&v26->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
LABEL_36:
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v27.__r_.__value_.__l.__data_);

  return v15;
}

- (void)writeToFile:(id)a3
{
  MIL::Text::SerializerOptions *v3;
  uint64_t v4;
  void *__p[2];
  uint64_t v6;
  uint64_t v7;

  v3 = (MIL::Text::SerializerOptions *)a3;
  MIL::Text::SerializerOptions::Make(v3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v7 + 88))(v7, 1);
  if (v3)
  {
    -[MIL::Text::SerializerOptions cxxString](v3, "cxxString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v6 = 0;
  }
  (*(void (**)(uint64_t, void **))(*(_QWORD *)v7 + 24))(v7, __p);
  if (SHIBYTE(v6) < 0)
    operator delete(__p[0]);
  MIL::Text::SerializeToFile();
  v4 = v7;
  v7 = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);

}

- (id)serializeToProtobufWithError:(id *)a3
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count_vtbl *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  id v10;
  void **v11;
  unint64_t v12;
  void *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void *__p[2];
  unsigned __int8 v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  _QWORD v22[11];
  char v23;
  _QWORD v24[20];
  std::__shared_weak_count *v25;

  MIL::Opsets::Common::CreateMILContext((MIL::Opsets::Common *)self);
  v3 = v22[0];
  v24[19] = v22[0];
  if (v22[0])
  {
    v4 = (std::__shared_weak_count *)operator new();
    v5 = (std::__shared_weak_count_vtbl *)v22[0];
    v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_25137AA68;
    v4->__shared_owners_ = 0;
    v4->__shared_weak_owners_ = 0;
    v4[1].__vftable = v5;
  }
  else
  {
    v4 = 0;
  }
  v25 = v4;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v22);
  v20 = v3;
  v21 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  MIL::Proto::SerializeProgram();
  if (v21)
  {
    v8 = &v21->__shared_owners_;
    do
      v9 = __ldaxr((unint64_t *)v8);
    while (__stlxr(v9 - 1, (unint64_t *)v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  std::stringbuf::str();
  v10 = objc_alloc(MEMORY[0x24BDBCE50]);
  if ((v19 & 0x80u) == 0)
    v11 = __p;
  else
    v11 = (void **)__p[0];
  if ((v19 & 0x80u) == 0)
    v12 = v19;
  else
    v12 = (unint64_t)__p[1];
  v13 = (void *)objc_msgSend(v10, "initWithBytes:length:", v11, v12);
  if ((char)v19 < 0)
    operator delete(__p[0]);
  v22[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v22 + *(_QWORD *)(v22[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v22[1] = MEMORY[0x24BEDB848] + 16;
  if (v23 < 0)
    operator delete((void *)v22[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2494ED644](v24);
  v14 = v25;
  if (v25)
  {
    v15 = (unint64_t *)&v25->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  return v13;
}

- (id)description
{
  void *v2;
  void *__p[2];
  char v5;

  (*(void (**)(void **__return_ptr))(*(_QWORD *)self->_program.__ptr_ + 16))(__p);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCXXString:", __p);
  if (v5 < 0)
    operator delete(__p[0]);
  return v2;
}

- (NSString)milFilePath
{
  return self->_milFilePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_milFilePath, 0);
  std::shared_ptr<MIL::MILContext>::~shared_ptr[abi:ne180100]((uint64_t)&self->_program);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
