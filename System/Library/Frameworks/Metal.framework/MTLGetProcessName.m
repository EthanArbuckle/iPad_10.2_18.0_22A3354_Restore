@implementation MTLGetProcessName

void __MTLGetProcessName_block_invoke()
{
  pid_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  char *v7;
  void *v8;
  std::string v9;
  char __str[8];
  uint64_t v11;
  _OWORD buffer[8];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v0 = getpid();
  std::string::basic_string[abi:ne180100]<0>(&v9, "");
  memset(buffer, 0, sizeof(buffer));
  v1 = proc_name(v0, buffer, 0x80u);
  if (v1 >= 1)
  {
    v2 = 0;
    v3 = MEMORY[0x1E0C80978];
    v4 = v1;
    do
    {
      v5 = *((char *)buffer + v2);
      if ((v5 & 0x80000000) != 0)
        v6 = __maskrune(v5, 0x500uLL);
      else
        v6 = *(_DWORD *)(v3 + 4 * v5 + 60) & 0x500;
      if (!v6)
        *((_BYTE *)buffer + v2) = 95;
      ++v2;
    }
    while (v4 != v2);
    std::string::append(&v9, (const std::string::value_type *)buffer);
  }
  *(_QWORD *)__str = 0;
  v11 = 0;
  snprintf(__str, 0x10uLL, "_%d", v0);
  std::string::append(&v9, __str);
  v7 = (char *)operator new[]();
  MTLGetProcessName::tmp = (uint64_t)v7;
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
  {
    v8 = (void *)v9.__r_.__value_.__r.__words[0];
    strcpy(v7, v9.__r_.__value_.__l.__data_);
    operator delete(v8);
  }
  else
  {
    strcpy(v7, (const char *)&v9);
  }
}

@end
