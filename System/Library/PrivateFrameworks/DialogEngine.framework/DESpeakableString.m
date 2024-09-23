@implementation DESpeakableString

- (DESpeakableString)init
{
  DESpeakableString *v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DESpeakableString;
  v2 = -[DESpeakableString init](&v5, sel_init);
  if (v2)
  {
    v3 = operator new();
    *(_QWORD *)(v3 + 160) = 0;
    *(_OWORD *)(v3 + 128) = 0u;
    *(_OWORD *)(v3 + 144) = 0u;
    *(_OWORD *)(v3 + 96) = 0u;
    *(_OWORD *)(v3 + 112) = 0u;
    *(_OWORD *)(v3 + 64) = 0u;
    *(_OWORD *)(v3 + 80) = 0u;
    *(_OWORD *)(v3 + 32) = 0u;
    *(_OWORD *)(v3 + 48) = 0u;
    *(_OWORD *)v3 = 0u;
    *(_OWORD *)(v3 + 16) = 0u;
    -[DESpeakableString setThis:](v2, "setThis:", v3);
  }
  return v2;
}

- (DESpeakableString)initWithPrint:(id)a3 speak:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  std::string __p;
  std::string v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DESpeakableString;
  if (-[DESpeakableString init](&v12, sel_init))
  {
    v8 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&v11, (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    siri::dialogengine::SpeakableString::SpeakableString(v8, &v11, &__p);
  }

  return 0;
}

- (void)dealloc
{
  void **v3;
  objc_super v4;

  v3 = -[DESpeakableString This](self, "This");
  if (v3)
  {
    siri::dialogengine::SpeakableString::~SpeakableString(v3);
    MEMORY[0x1C3B8D890]();
  }
  v4.receiver = self;
  v4.super_class = (Class)DESpeakableString;
  -[DESpeakableString dealloc](&v4, sel_dealloc);
}

- (NSString)print
{
  void *v2;
  const std::string::value_type **v3;
  __int128 v4;
  std::string *p_p;
  void *v6;
  std::string __p;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[DESpeakableString This](self, "This");
  if (*((char *)v3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *v3, (std::string::size_type)v3[1]);
  }
  else
  {
    v4 = *(_OWORD *)v3;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)v3[2];
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v4;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v2, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return (NSString *)v6;
}

- (void)setPrint:(id)a3
{
  id v4;
  std::string *v5;
  id v6;
  std::string __str;

  v4 = a3;
  v5 = -[DESpeakableString This](self, "This");
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v6, "UTF8String"));
  std::string::operator=(v5, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);

}

- (NSString)speak
{
  void *v2;
  char *v3;
  std::string *p_p;
  void *v5;
  std::string __p;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[DESpeakableString This](self, "This");
  if (v3[47] < 0)
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)v3 + 3), *((_QWORD *)v3 + 4));
  else
    __p = *(std::string *)(v3 + 1);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v2, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return (NSString *)v5;
}

- (void)setSpeak:(id)a3
{
  id v4;
  std::string *v5;
  id v6;
  std::string __str;

  v4 = a3;
  v5 = -[DESpeakableString This](self, "This");
  v6 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v6, "UTF8String"));
  std::string::operator=(v5 + 1, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);

}

- (BOOL)isEqual:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = siri::dialogengine::SpeakableString::operator==((unsigned __int8 *)-[DESpeakableString This](self, "This"), (unsigned __int8 *)objc_msgSend(v4, "This"));

  return (char)self;
}

- (void)This
{
  return self->_This;
}

- (void)setThis:(void *)a3
{
  self->_This = a3;
}

@end
