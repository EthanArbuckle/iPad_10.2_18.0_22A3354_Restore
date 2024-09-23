@implementation _EARRelevantTextContext

- (_EARRelevantTextContext)init
{
  _EARRelevantTextContext *v2;
  uint64_t v3;
  NSString *leftContext;
  uint64_t v5;
  NSString *rightContext;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_EARRelevantTextContext;
  v2 = -[_EARRelevantTextContext init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v3 = objc_claimAutoreleasedReturnValue();
    leftContext = v2->_leftContext;
    v2->_leftContext = (NSString *)v3;

    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v5 = objc_claimAutoreleasedReturnValue();
    rightContext = v2->_rightContext;
    v2->_rightContext = (NSString *)v5;

    v2->_contextUpdateLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)setLeftContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  std::string *p_p;
  std::string::size_type size;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  std::string __p;

  v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
  }
  quasar::keepLastNCodePoints((uint64_t)&v11, 0x2710uLL, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  objc_msgSend(v6, "ear_stringWithStringView:", p_p, size, v11, v12, v13);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v13) < 0)
    operator delete(v11);
  os_unfair_lock_lock(&self->_contextUpdateLock);
  if (v9)
    v10 = v9;
  else
    v10 = &stru_1E5D49530;
  objc_storeStrong((id *)&self->_leftContext, v10);
  os_unfair_lock_unlock(&self->_contextUpdateLock);

}

- (void)setRightContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  std::string *p_p;
  std::string::size_type size;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  std::string __p;

  v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
  }
  quasar::keepFirstNCodePoints((uint64_t)&v11, 0x2710uLL, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  objc_msgSend(v6, "ear_stringWithStringView:", p_p, size, v11, v12, v13);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v13) < 0)
    operator delete(v11);
  os_unfair_lock_lock(&self->_contextUpdateLock);
  if (v9)
    v10 = v9;
  else
    v10 = &stru_1E5D49530;
  objc_storeStrong((id *)&self->_rightContext, v10);
  os_unfair_lock_unlock(&self->_contextUpdateLock);

}

- (void)setLeftContext:(id)a3 rightContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  std::string *p_p;
  std::string::size_type size;
  __CFString *v11;
  void *v12;
  std::string *v13;
  std::string::size_type v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  std::string __p;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  if (v6)
  {
    objc_msgSend(v6, "ear_toString");
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
  }
  quasar::keepLastNCodePoints((uint64_t)&v18, 0x2710uLL, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  objc_msgSend(v8, "ear_stringWithStringView:", p_p, size, v18, v19, v20);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v20) < 0)
    operator delete(v18);
  v12 = (void *)MEMORY[0x1E0CB3940];
  if (v7)
  {
    objc_msgSend(v7, "ear_toString");
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
  }
  quasar::keepFirstNCodePoints((uint64_t)&v18, 0x2710uLL, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v13 = &__p;
  else
    v13 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v14 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v14 = __p.__r_.__value_.__l.__size_;
  objc_msgSend(v12, "ear_stringWithStringView:", v13, v14, v18, v19, v20);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v20) < 0)
    operator delete(v18);
  os_unfair_lock_lock(&self->_contextUpdateLock);
  if (v11)
    v16 = v11;
  else
    v16 = &stru_1E5D49530;
  objc_storeStrong((id *)&self->_leftContext, v16);
  if (v15)
    v17 = v15;
  else
    v17 = &stru_1E5D49530;
  objc_storeStrong((id *)&self->_rightContext, v17);
  os_unfair_lock_unlock(&self->_contextUpdateLock);

}

- (void)appendToLeftContext:(id)a3
{
  id v4;
  os_unfair_lock_s *p_contextUpdateLock;
  void *v6;
  NSString *leftContext;
  std::string *p_p;
  NSString *v9;
  NSString *v10;
  uint64_t i;
  std::string v12;
  std::string __p;
  std::string *v14;
  char v15;
  __int128 v16;
  uint64_t v17;
  _BYTE v18[24];
  __int128 v19;

  *(_QWORD *)&v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_contextUpdateLock = &self->_contextUpdateLock;
  os_unfair_lock_lock(&self->_contextUpdateLock);
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    leftContext = self->_leftContext;
    if (leftContext)
    {
      -[NSString ear_toString](leftContext, "ear_toString");
    }
    else
    {
      v16 = 0uLL;
      v17 = 0;
    }
    objc_msgSend(v4, "ear_toString");
    memset(&v12, 0, sizeof(v12));
    v14 = &v12;
    v15 = 0;
    v12.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x30uLL);
    v12.__r_.__value_.__l.__size_ = v12.__r_.__value_.__r.__words[0];
    v12.__r_.__value_.__r.__words[2] = v12.__r_.__value_.__r.__words[0] + 48;
    v12.__r_.__value_.__l.__size_ = (std::string::size_type)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v12.__r_.__value_.__r.__words[2], &v16, &v19, (std::string *)v12.__r_.__value_.__l.__data_);
    quasar::joinAndAutoSpace(&v12, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(v6, "stringWithUTF8String:", p_p);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_leftContext;
    self->_leftContext = v9;

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v14 = &v12;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
    for (i = 0; i != -48; i -= 24)
    {
      if ((char)v18[i + 23] < 0)
        operator delete(*(void **)&v18[i]);
    }
  }
  os_unfair_lock_unlock(p_contextUpdateLock);

}

- (void)notifyUndoEventFromClient
{
  os_unfair_lock_s *p_contextUpdateLock;

  p_contextUpdateLock = &self->_contextUpdateLock;
  os_unfair_lock_lock(&self->_contextUpdateLock);
  self->_undoEvent = 1;
  os_unfair_lock_unlock(p_contextUpdateLock);
}

- (void)getLeftAndRightContextWithCompletion:(id)a3
{
  os_unfair_lock_s *p_contextUpdateLock;
  void *v5;
  void *v6;
  void (**v7)(id, void *, void *);

  v7 = (void (**)(id, void *, void *))a3;
  p_contextUpdateLock = &self->_contextUpdateLock;
  os_unfair_lock_lock(&self->_contextUpdateLock);
  v5 = (void *)-[NSString copy](self->_leftContext, "copy");
  v6 = (void *)-[NSString copy](self->_rightContext, "copy");
  os_unfair_lock_unlock(p_contextUpdateLock);
  if (v7)
    v7[2](v7, v5, v6);

}

- (BOOL)getUndoEventAndReset
{
  os_unfair_lock_s *p_contextUpdateLock;
  BOOL undoEvent;

  p_contextUpdateLock = &self->_contextUpdateLock;
  os_unfair_lock_lock(&self->_contextUpdateLock);
  undoEvent = self->_undoEvent;
  self->_undoEvent = 0;
  os_unfair_lock_unlock(p_contextUpdateLock);
  return undoEvent;
}

- (void)reset
{
  os_unfair_lock_s *p_contextUpdateLock;
  NSString *leftContext;
  NSString *rightContext;

  p_contextUpdateLock = &self->_contextUpdateLock;
  os_unfair_lock_lock(&self->_contextUpdateLock);
  leftContext = self->_leftContext;
  self->_leftContext = (NSString *)&stru_1E5D49530;

  rightContext = self->_rightContext;
  self->_rightContext = (NSString *)&stru_1E5D49530;

  self->_undoEvent = 0;
  os_unfair_lock_unlock(p_contextUpdateLock);
  *(_DWORD *)&self->_disambiguationActive = 0;
}

- (BOOL)disambiguationActive
{
  return self->_disambiguationActive;
}

- (void)setDisambiguationActive:(BOOL)a3
{
  self->_disambiguationActive = a3;
}

- (BOOL)cursorInVisibleText
{
  return self->_cursorInVisibleText;
}

- (void)setCursorInVisibleText:(BOOL)a3
{
  self->_cursorInVisibleText = a3;
}

- (BOOL)favorCommandSuppression
{
  return self->_favorCommandSuppression;
}

- (void)setFavorCommandSuppression:(BOOL)a3
{
  self->_favorCommandSuppression = a3;
}

- (BOOL)abortCommandSuppression
{
  return self->_abortCommandSuppression;
}

- (void)setAbortCommandSuppression:(BOOL)a3
{
  self->_abortCommandSuppression = a3;
}

- (BOOL)undoEvent
{
  return self->_undoEvent;
}

- (void)setUndoEvent:(BOOL)a3
{
  self->_undoEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightContext, 0);
  objc_storeStrong((id *)&self->_leftContext, 0);
}

@end
