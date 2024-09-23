@implementation ZN16EURCoreDumpTrace4initENSt3

SAHEURCoreDumpTraceProtocol *___ZN16EURCoreDumpTrace4initENSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEENS0_8weak_ptrIN3abm19BasebandTracingTaskEEEN8dispatch5groupE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  SAHEURCoreDumpTraceProtocol *result;
  EURCoreDumpTraceProtocol *v5;
  void *v6[2];
  char v7;
  std::string v8;
  void *__p[2];
  char v10;
  std::string v11;
  std::string v12;

  v1 = *(_QWORD *)(a1 + 32);
  v7 = 7;
  strcpy((char *)v6, "Enabled");
  memset(&v8, 0, sizeof(v8));
  v10 = 8;
  strcpy((char *)__p, "CoreDump");
  memset(&v12, 0, sizeof(v12));
  v2 = defaults::get((char *)__p, (char *)v6, &v12);
  v3 = v2;
  if ((_DWORD)v2)
  {
    prop::file::get<std::string>((const void **)__p, (uint64_t)v6, (uint64_t)&v12, &v11);
    v8 = v11;
  }
  if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((v10 & 0x80000000) == 0)
      goto LABEL_5;
LABEL_8:
    operator delete(__p[0]);
    if (!v3)
      goto LABEL_10;
    goto LABEL_9;
  }
  operator delete(v12.__r_.__value_.__l.__data_);
  if (v10 < 0)
    goto LABEL_8;
LABEL_5:
  if (v3)
LABEL_9:
    v2 = util::convert<BOOL>(&v8, (BOOL *)(v1 + 160), 0);
LABEL_10:
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v8.__r_.__value_.__l.__data_);
    if ((v7 & 0x80000000) == 0)
      goto LABEL_12;
  }
  else if ((v7 & 0x80000000) == 0)
  {
LABEL_12:
    result = EURCoreDumpTraceProtocol::create((EURCoreDumpTraceProtocol *)v2);
    *(_QWORD *)(v1 + 152) = result;
    return result;
  }
  operator delete(v6[0]);
  result = EURCoreDumpTraceProtocol::create(v5);
  *(_QWORD *)(v1 + 152) = result;
  return result;
}

@end
