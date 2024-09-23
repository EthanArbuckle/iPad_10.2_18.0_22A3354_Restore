@implementation ZZN23EurekaCallCommandDriver4dialE8CallInfoENK3

uint8_t *___ZZN23EurekaCallCommandDriver4dialE8CallInfoENK3__1clEN3qmi12ResponseBaseE_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t *result;
  uint64_t v4;
  uint8_t v5[24];
  uint8_t *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = **(NSObject ***)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_216897000, v2, OS_LOG_TYPE_DEFAULT, "#I Delaying half a second and calling the dial response callback", v5, 2u);
  }
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v5, a1 + 56);
  if (!v6)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint8_t *, uint64_t))(*(_QWORD *)v6 + 48))(v6, a1 + 104);
  result = v6;
  if (v6 == v5)
  {
    v4 = 4;
    result = v5;
  }
  else
  {
    if (!v6)
      return result;
    v4 = 5;
  }
  return (uint8_t *)(*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v4))();
}

@end
