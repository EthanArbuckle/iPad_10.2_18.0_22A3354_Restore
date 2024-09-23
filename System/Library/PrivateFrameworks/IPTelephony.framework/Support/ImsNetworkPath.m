@implementation ImsNetworkPath

- (basic_string<char,)ifaceName
{
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;

  if (result[1].__r_.__value_.var0.var0.__data_[7] < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)retstr, *(const std::string::value_type **)&result->__r_.var0, result->var0);
  }
  else
  {
    *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result->__r_.var0;
    *((_QWORD *)&retstr->__r_.__value_.var0.var1 + 2) = result[1].__r_.__value_.var0.var1.__data_;
  }
  return result;
}

- (ImsNetworkPath)initWithInterface:()basic_string<char delegate:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  ImsNetworkPathDelegate *v3;
  ImsNetworkPathDelegate *v4;
  ImsNetworkPath *v6;
  ImsNetworkPath *v7;
  NWPathEvaluator *pathEvaluator;
  objc_super v10;

  v4 = v3;
  v10.receiver = self;
  v10.super_class = (Class)ImsNetworkPath;
  v6 = -[ImsNetworkPath init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    pathEvaluator = v6->_pathEvaluator;
    v6->_pathEvaluator = 0;

    std::string::operator=((std::string *)&v7->_ifaceName, (const std::string *)a3);
    v7->_delegate = v4;
    LOBYTE(v7->_ifaceName.__r_.var0) = 0;
  }
  return v7;
}

- (void)evaluateInterface
{
  id v3;
  id v4;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *p_ifaceName;
  void *v6;
  void *v7;
  NWPathEvaluator *v8;
  NWPathEvaluator *pathEvaluator;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  ImsNetworkPathDelegate *delegate;
  void *__p[2];
  char v15;
  void *v16[2];
  char v17;

  if (!self->_pathEvaluator)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CCECA0]);
    v4 = objc_alloc(MEMORY[0x1E0CCEC88]);
    p_ifaceName = &self->_ifaceName;
    if (*((char *)&self->_ifaceName.__r_.__value_.var0.var1 + 23) < 0)
      p_ifaceName = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_ifaceName->__r_.__value_.var0.var1.__data_;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_ifaceName);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithInterfaceName:", v6);
    objc_msgSend(v3, "setRequiredInterface:", v7);

    v8 = (NWPathEvaluator *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCECB0]), "initWithEndpoint:parameters:", 0, v3);
    pathEvaluator = self->_pathEvaluator;
    self->_pathEvaluator = v8;

  }
  std::string::basic_string[abi:ne180100]<0>(v16, "net");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  pthread_once(&ims::_driverInit, (void (*)(void))ims::createInstance);
  v10 = ImsLogger::debug(ims::_logger, (uint64_t)v16, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(_QWORD **)(v10 + 8), (uint64_t)"Adding observer for path on interface ", 38);
  *(_BYTE *)(v10 + 17) = 0;
  (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(_QWORD *)v10 + 32))(v10, &self->_ifaceName);
  (*(void (**)(uint64_t, _QWORD *(*)(_QWORD *)))(*(_QWORD *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(_BYTE *)(v10 + 17) = 0;
  if (v15 < 0)
    operator delete(__p[0]);
  if (v17 < 0)
    operator delete(v16[0]);
  -[NWPathEvaluator path](self->_pathEvaluator, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "status");

  if (v12 == 1)
  {
    delegate = self->_delegate;
    if (delegate)
      (*(void (**)(ImsNetworkPathDelegate *))delegate->var0)(delegate);
  }
  else
  {
    LOBYTE(self->_ifaceName.__r_.var0) = 1;
    -[NWPathEvaluator addObserver:forKeyPath:options:context:](self->_pathEvaluator, "addObserver:forKeyPath:options:context:", self, CFSTR("path"), 5, 0);
  }
}

- (void)dealloc
{
  NWPathEvaluator *pathEvaluator;
  objc_super v4;

  self->_delegate = 0;
  pathEvaluator = self->_pathEvaluator;
  if (pathEvaluator && LOBYTE(self->_ifaceName.__r_.var0))
  {
    -[NWPathEvaluator removeObserver:forKeyPath:](pathEvaluator, "removeObserver:forKeyPath:", self, CFSTR("path"));
    LOBYTE(self->_ifaceName.__r_.var0) = 0;
    pathEvaluator = self->_pathEvaluator;
  }
  self->_pathEvaluator = 0;

  v4.receiver = self;
  v4.super_class = (Class)ImsNetworkPath;
  -[ImsNetworkPath dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  NWPathEvaluator *pathEvaluator;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v9 = a4;
  v10 = a5;
  pathEvaluator = self->_pathEvaluator;
  if (pathEvaluator)
  {
    if (self->_delegate)
    {
      -[NWPathEvaluator path](pathEvaluator, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "status");

      if (v13 == 1)
        ((void (*)(ImsNetworkPathDelegate *))*self->_delegate->var0)(self->_delegate);
    }
  }

}

- (void).cxx_destruct
{
  if (*((char *)&self->_ifaceName.__r_.__value_.var0.var1 + 23) < 0)
    operator delete(self->_ifaceName.__r_.__value_.var0.var1.__data_);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0uLL;
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
