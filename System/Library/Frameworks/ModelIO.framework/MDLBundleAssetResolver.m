@implementation MDLBundleAssetResolver

- (MDLBundleAssetResolver)initWithBundle:(NSString *)path
{
  NSString *v5;
  MDLBundleAssetResolver *v6;
  MDLBundleAssetResolver *v7;
  MDLBundleAssetResolver *v8;
  objc_super v10;

  v5 = path;
  v10.receiver = self;
  v10.super_class = (Class)MDLBundleAssetResolver;
  v6 = -[MDLBundleAssetResolver init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundle, path);
    v8 = v7;
  }

  return v7;
}

- (id)resolveAssetNamed:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  char *v8;
  std::string *p_str;
  std::string::size_type size;
  unsigned __int8 *v11;
  std::string *v12;
  std::string *v13;
  std::string *v14;
  unsigned __int8 *v15;
  int v16;
  void *v17;
  std::string::size_type v18;
  std::string::size_type v19;
  const char *v20;
  const char *v21;
  void *v22;
  void *v23;
  const char *v24;
  std::string v26;
  std::string v27;
  std::string __str;
  char v29;

  v4 = a3;
  v5 = v4;
  if (self->_bundle)
  {
    memset(&__str, 0, sizeof(__str));
    v6 = objc_retainAutorelease(v4);
    v8 = (char *)objc_msgSend_cStringUsingEncoding_(v6, v7, 4);
    sub_1DCB0345C(&__str, v8);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_str = &__str;
    else
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    else
      size = __str.__r_.__value_.__l.__size_;
    v11 = (unsigned __int8 *)p_str + size;
    if (size)
    {
      v12 = p_str;
      v13 = (std::string *)((char *)p_str + size);
      do
      {
        v14 = v12;
        v15 = (unsigned __int8 *)v12;
        while (1)
        {
          v16 = *v15++;
          if (v16 == 46)
            break;
          v14 = (std::string *)v15;
          if (v15 == v11)
          {
            v14 = v13;
            goto LABEL_18;
          }
        }
        v12 = (std::string *)((char *)&v14->__r_.__value_.__l.__data_ + 1);
        v13 = v14;
      }
      while (v15 != v11);
    }
    else
    {
      v14 = p_str;
    }
LABEL_18:
    v18 = (char *)v14 - (char *)p_str;
    if (v14 == (std::string *)v11)
      v19 = -1;
    else
      v19 = v18;
    memset(&v27, 0, sizeof(v27));
    std::string::basic_string(&v27, &__str, v19 + 1, size, (std::allocator<char> *)&v26);
    std::string::basic_string(&v26, &__str, 0, v19, (std::allocator<char> *)&v29);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
    __str = v26;
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v20, (uint64_t)&__str, 4);
    else
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v20, (uint64_t)v26.__r_.__value_.__l.__data_, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v21, (uint64_t)&v27, 4);
    else
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x1E0CB3940], v21, (uint64_t)v27.__r_.__value_.__l.__data_, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URLForResource_withExtension_(self->_bundle, v24, (uint64_t)v22, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v27.__r_.__value_.__l.__data_);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)canResolveAssetNamed:(id)a3
{
  const char *v4;
  id v5;
  void *v6;
  BOOL v7;

  v5 = a3;
  if (v5 && self->_path)
  {
    objc_msgSend_resolveAssetNamed_(self, v4, (uint64_t)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(NSString *)path
{
  objc_setProperty_nonatomic_copy(self, a2, path, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
