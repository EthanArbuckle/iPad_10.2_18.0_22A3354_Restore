@implementation ZN13BaseExceptionC2ERKNSt3

void *___ZN13BaseExceptionC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_PKci_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  const char *v4;
  const char *v5;
  std::string *v6;
  std::string v8;

  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  if (v2)
  {
    v4 = *(const char **)(a1 + 32);
    if (v4[23] < 0)
      v4 = *(const char **)v4;
    xpc_dictionary_set_string(v2, "errorMessage", v4);
    v5 = (const char *)(a1 + 40);
    if (*(char *)(a1 + 63) < 0)
      v5 = *(const char **)v5;
    xpc_dictionary_set_string(v3, "fileName", v5);
    std::to_string(&v8, *(_DWORD *)(a1 + 64));
    if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v6 = &v8;
    else
      v6 = (std::string *)v8.__r_.__value_.__r.__words[0];
    xpc_dictionary_set_string(v3, "line", (const char *)v6);
    if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v8.__r_.__value_.__l.__data_);
  }
  return v3;
}

@end
