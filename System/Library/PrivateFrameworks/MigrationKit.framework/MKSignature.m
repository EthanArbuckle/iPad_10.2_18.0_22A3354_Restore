@implementation MKSignature

+ (id)identifier:(const char *)a3 length:(unint64_t)a4
{
  id v4;
  std::string *p_p;
  void *v6;
  std::string __p;

  migrationkit::signature::get_identifier((migrationkit::signature *)a3, &__p);
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v6 = (void *)objc_msgSend(v4, "initWithCString:encoding:", p_p, 4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v6;
}

@end
