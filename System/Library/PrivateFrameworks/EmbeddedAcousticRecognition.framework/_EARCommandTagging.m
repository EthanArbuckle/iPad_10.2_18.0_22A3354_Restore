@implementation _EARCommandTagging

- (id)_initWithQuasarCommandTagging:(const void *)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  void *v9;
  std::string *p_p;
  uint64_t v11;
  void *v12;
  __int128 **TagSequence;
  uint64_t v14;
  void *v15;
  std::string v17;
  objc_super v18;
  _QWORD v19[3];
  std::string __p;
  void **v21;

  v18.receiver = self;
  v18.super_class = (Class)_EARCommandTagging;
  v4 = -[_EARCommandTagging init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    quasar::CommandTagging::getCommandId((quasar::CommandTagging *)a3, &v17);
    quasar::Bitmap::~Bitmap((quasar::Bitmap *)a3);
    v7 = v6;
    v8 = (void **)operator new();
    __p = v17;
    memset(&v17, 0, sizeof(v17));
    memset(v19, 0, sizeof(v19));
    quasar::CommandTagging::CommandTagging(v8, &__p, v7, v19);
    v21 = (void **)v19;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v21);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    std::unique_ptr<quasar::CommandTagging>::reset[abi:ne180100]((void ***)v4 + 1, v8);
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v17.__r_.__value_.__l.__data_);
    v9 = (void *)MEMORY[0x1E0CB3940];
    quasar::CommandTagging::getCommandId((quasar::CommandTagging *)a3, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(v9, "stringWithUTF8String:", p_p);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v5[2];
    v5[2] = v11;

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    TagSequence = (__int128 **)quasar::CommandTagging::getTagSequence((quasar::CommandTagging *)a3);
    EARHelpers::NSArrayOfStringFromVectorOfString(TagSequence);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v5[3];
    v5[3] = v14;

  }
  return v5;
}

- (id)tokensForTag:(id)a3
{
  id v4;
  void *v5;
  CommandTagging *value;
  uint64_t *TokensFromTag;
  void *v8;
  void *__p[2];
  uint64_t v11;
  const quasar::Token *v12[3];
  const quasar::Token **v13;

  v4 = a3;
  v5 = v4;
  value = self->_tagging.__ptr_.__value_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v11 = 0;
  }
  TokensFromTag = (uint64_t *)quasar::CommandTagging::getTokensFromTag((uint64_t)value, (const void **)__p);
  memset(v12, 0, sizeof(v12));
  std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v12, *TokensFromTag, TokensFromTag[1], 0x6DB6DB6DB6DB6DB7 * ((TokensFromTag[1] - *TokensFromTag) >> 5));
  if (SHIBYTE(v11) < 0)
    operator delete(__p[0]);
  EARHelpers::EARSpeechRecognitionTokensFromQuasarTokens(v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);

  return v8;
}

- (NSString)commandId
{
  return self->_commandId;
}

- (NSArray)tagSequence
{
  return self->_tagSequence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagSequence, 0);
  objc_storeStrong((id *)&self->_commandId, 0);
  std::unique_ptr<quasar::CommandTagging>::reset[abi:ne180100]((void ***)&self->_tagging, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
