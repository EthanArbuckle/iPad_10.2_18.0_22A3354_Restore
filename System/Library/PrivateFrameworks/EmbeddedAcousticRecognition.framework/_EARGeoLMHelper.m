@implementation _EARGeoLMHelper

- (_EARGeoLMHelper)initWithLocale:(id)a3 config:(id)a4
{
  __CFString *v7;
  __CFString *v8;
  _EARGeoLMHelper *v9;
  NSObject *v10;
  quasar::Geography *v11;
  uint64_t value;
  NSObject *v13;
  _EARGeoLMHelper *v14;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  objc_super v21;
  void *__p[4];

  __p[3] = *(void **)MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a3;
  v8 = (__CFString *)a4;
  if (-[__CFString length](v7, "length") && -[__CFString length](v8, "length"))
  {
    v21.receiver = self;
    v21.super_class = (Class)_EARGeoLMHelper;
    v9 = -[_EARGeoLMHelper init](&v21, sel_init);
    if (v9)
    {
      EarGeoLMHelperLogger();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[_EARGeoLMHelper initWithLocale:config:].cold.3();

      objc_storeStrong((id *)&v9->_locale, a3);
      v20 = &unk_1E5D35C68;
      v11 = (quasar::Geography *)operator new();
      quasar::Geography::Geography(v11);
      value = (uint64_t)v9->_geography.__ptr_.__value_;
      v9->_geography.__ptr_.__value_ = (Geography *)v11;
      if (value)
      {
        std::default_delete<quasar::Geography>::operator()[abi:ne180100]((uint64_t)&v9->_geography, value);
        v11 = (quasar::Geography *)v9->_geography.__ptr_.__value_;
      }
      if (v8)
        -[__CFString ear_toString](v8, "ear_toString");
      else
        memset(__p, 0, 24);
      quasar::Geography::loadFromFile(v11, (__int128 *)__p, (uint64_t)&v20);
      if (SHIBYTE(__p[2]) < 0)
        operator delete(__p[0]);
      quasar::BitmapLoaderImpl::~BitmapLoaderImpl((quasar::BitmapLoaderImpl *)&v20);
    }
    self = v9;
    v14 = self;
  }
  else
  {
    EarGeoLMHelperLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = -[__CFString length](v7, "length");
      v17 = -[__CFString length](v8, "length");
      v18 = CFSTR("(none)");
      if (v16)
        v19 = v7;
      else
        v19 = CFSTR("(none)");
      if (v17)
        v18 = v8;
      LODWORD(__p[0]) = 138412546;
      *(void **)((char *)__p + 4) = (void *)v19;
      WORD2(__p[1]) = 2112;
      *(void **)((char *)&__p[1] + 6) = (void *)v18;
      _os_log_error_impl(&dword_1AD756000, v13, OS_LOG_TYPE_ERROR, "GeoLM: Cannot initialize helper with locale: %@, config: %@", (uint8_t *)__p, 0x16u);
    }

    v14 = 0;
  }

  return v14;
}

- (id)regionIdForLocale:(id)a3 latitude:(double)a4 longitude:(double)a5
{
  __CFString *v8;
  quasar::Location *v9;
  uint64_t v10;
  uint64_t v11;
  Geography *value;
  std::vector<std::string>::pointer begin;
  std::string::size_type size;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  NSString *locale;
  uint64_t v23;
  const __CFString *v24;
  void *__p[2];
  char v26;
  std::vector<std::string> *v27;
  std::__shared_weak_count *v28;
  _QWORD v29[2];
  uint8_t buf[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = (quasar::Location *)-[__CFString isEqualToString:](v8, "isEqualToString:", self->_locale);
  if ((v9 & 1) != 0)
  {
    quasar::Location::makeAny(v9, a4, a5);
    v29[0] = v10;
    v29[1] = v11;
    memset(buf, 0, sizeof(buf));
    value = self->_geography.__ptr_.__value_;
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    quasar::Geography::getGeoContext((uint64_t)value, (quasar::Location *)v29, (uint64_t)buf, (uint64_t)__p, &v27);
    if (v26 < 0)
      operator delete(__p[0]);
    begin = v27[3].__begin_;
    if (begin == v27[3].__end_)
    {
      v16 = 0;
    }
    else
    {
      if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
      {
        begin = (std::vector<std::string>::pointer)begin->__r_.__value_.__r.__words[0];
        size = v27[3].__begin_->__r_.__value_.__l.__size_;
      }
      else
      {
        size = HIBYTE(begin->__r_.__value_.__r.__words[2]);
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", begin, size);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      EarGeoLMHelperLogger();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[_EARGeoLMHelper regionIdForLocale:latitude:longitude:].cold.1();

    }
    v18 = v28;
    if (v28)
    {
      p_shared_owners = (unint64_t *)&v28->__shared_owners_;
      do
        v20 = __ldaxr(p_shared_owners);
      while (__stlxr(v20 - 1, p_shared_owners));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    if ((char)buf[23] < 0)
      operator delete(*(void **)buf);
  }
  else
  {
    EarGeoLMHelperLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      locale = self->_locale;
      v23 = -[__CFString length](v8, "length");
      v24 = CFSTR("(none)");
      if (v23)
        v24 = v8;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = locale;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v24;
      _os_log_error_impl(&dword_1AD756000, v15, OS_LOG_TYPE_ERROR, "GeoLM: This helper only supports %@, not %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

- (id)locale
{
  return self->_locale;
}

- (_EARGeoLMHelper)initWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  _EARGeoLMHelper *v6;
  NSObject *v7;
  quasar::Geography *v8;
  uint64_t value;
  _EARGeoLMHelper *v10;
  __int128 __p;
  char v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v15.receiver = self;
    v15.super_class = (Class)_EARGeoLMHelper;
    v6 = -[_EARGeoLMHelper init](&v15, sel_init);
    if (v6)
    {
      EarGeoLMHelperLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[_EARGeoLMHelper initWithConfiguration:].cold.3();

      v14 = &unk_1E5D35C68;
      v8 = (quasar::Geography *)operator new();
      quasar::Geography::Geography(v8);
      value = (uint64_t)v6->_geography.__ptr_.__value_;
      v6->_geography.__ptr_.__value_ = (Geography *)v8;
      if (value)
      {
        std::default_delete<quasar::Geography>::operator()[abi:ne180100]((uint64_t)&v6->_geography, value);
        v8 = (quasar::Geography *)v6->_geography.__ptr_.__value_;
      }
      objc_msgSend(v5, "ear_toString");
      quasar::Geography::loadFromFile(v8, &__p, (uint64_t)&v14);
      if (v13 < 0)
        operator delete((void *)__p);
      quasar::BitmapLoaderImpl::~BitmapLoaderImpl((quasar::BitmapLoaderImpl *)&v14);
    }
    self = v6;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)regionIdForLatitude:(double)a3 longitude:(double)a4
{
  uint64_t v5;
  uint64_t v6;
  Geography *value;
  std::vector<std::string>::pointer begin;
  __int128 v9;
  void *v10;
  NSObject *v11;
  std::string *p_p;
  std::string::size_type size;
  void *v14;
  std::string *v15;
  std::string::size_type v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::string __p;
  std::vector<std::string> *v22;
  std::__shared_weak_count *v23;
  void *v24[2];
  uint64_t v25;
  _QWORD v26[2];
  _BYTE v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  quasar::Location::makeAny((quasar::Location *)self, a3, a4);
  v26[0] = v5;
  v26[1] = v6;
  v24[0] = 0;
  v24[1] = 0;
  v25 = 0;
  value = self->_geography.__ptr_.__value_;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  quasar::Geography::getGeoContext((uint64_t)value, (quasar::Location *)v26, (uint64_t)v24, (uint64_t)&__p, &v22);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  begin = v22[3].__begin_;
  if (begin == v22[3].__end_)
  {
    v10 = 0;
  }
  else
  {
    if (SHIBYTE(begin->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, begin->__r_.__value_.__l.__data_, begin->__r_.__value_.__l.__size_);
    }
    else
    {
      v9 = *(_OWORD *)&begin->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = begin->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
    }
    EarGeoLMHelperLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        size = __p.__r_.__value_.__l.__size_;
      objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", p_p, size, __p.__r_.__value_.__r.__words[0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_EARGeoLMHelper regionIdForLatitude:longitude:].cold.3(v14, (uint64_t)v27, v11);
    }

    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v15 = &__p;
    else
      v15 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v16 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v16 = __p.__r_.__value_.__l.__size_;
    objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", v15, v16, __p.__r_.__value_.__r.__words[0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  v17 = v23;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (SHIBYTE(v25) < 0)
    operator delete(v24[0]);
  return v10;
}

- (void).cxx_destruct
{
  uint64_t v3;
  unique_ptr<quasar::Geography, std::default_delete<quasar::Geography>> *p_geography;
  Geography *value;

  objc_storeStrong((id *)&self->_locale, 0);
  value = self->_geography.__ptr_.__value_;
  p_geography = &self->_geography;
  v3 = (uint64_t)value;
  p_geography->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<quasar::Geography>::operator()[abi:ne180100]((uint64_t)p_geography, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (void)initWithLocale:(uint64_t)a1 config:.cold.1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_2(a1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1AD756000, v1, v2, "GeoLM: Internal C++ exception: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)initWithLocale:config:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_1AD756000, v0, v1, "GeoLM: Internal unknown exception", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithLocale:config:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1AD756000, v1, OS_LOG_TYPE_DEBUG, "GeoLM: Initializing helper with locale: %@, config: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)regionIdForLocale:latitude:longitude:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5_0(&dword_1AD756000, v0, v1, "GeoLM: Resolved regionId: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)initWithConfiguration:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5_0(&dword_1AD756000, v0, v1, "GeoLM: geo config path: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)regionIdForLatitude:(NSObject *)a3 longitude:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5_0(&dword_1AD756000, a3, (uint64_t)a3, "GeoLM: selected regionId: %@", (uint8_t *)a2);

}

@end
