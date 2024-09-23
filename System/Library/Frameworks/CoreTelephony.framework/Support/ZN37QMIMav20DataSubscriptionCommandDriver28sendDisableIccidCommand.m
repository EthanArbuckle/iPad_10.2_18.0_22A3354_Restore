@implementation ZN37QMIMav20DataSubscriptionCommandDriver28sendDisableIccidCommand

_QWORD *___ZN37QMIMav20DataSubscriptionCommandDriver28sendDisableIccidCommand_syncERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEENS0_8functionIFvNS0_8optionalIS6_EEEEE_block_invoke(_QWORD *result, uint64_t a2)
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *__p;
  char v8;
  char v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a2 + 4);
  if (v2)
  {
    v3 = result[4];
    v4 = *(NSObject **)(v3 + 40);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v11 = v2;
      v12 = 2080;
      v13 = qmi::asString();
      _os_log_error_impl(&dword_216897000, v4, OS_LOG_TYPE_ERROR, "Disable ICCID request failed, error %d (%s)", buf, 0x12u);
    }
    LOBYTE(__p) = 0;
    v9 = 0;
    v5 = *(_QWORD *)(v3 + 296);
    if (!v5)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, void **))(*(_QWORD *)v5 + 48))(v5, &__p);
    if (v9)
    {
      if (v8 < 0)
        operator delete(__p);
    }
    result = *(_QWORD **)(v3 + 296);
    *(_QWORD *)(v3 + 296) = 0;
    if (result == (_QWORD *)(v3 + 272))
    {
      v6 = 4;
      result = (_QWORD *)(v3 + 272);
    }
    else
    {
      if (!result)
        return result;
      v6 = 5;
    }
    return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v6))();
  }
  return result;
}

@end
