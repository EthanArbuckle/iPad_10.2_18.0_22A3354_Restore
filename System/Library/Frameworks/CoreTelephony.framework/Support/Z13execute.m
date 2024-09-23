@implementation Z13execute

uint64_t *___Z13execute_blockP16dispatch_queue_sRKN5boost8functionIFvvEEE_block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t *result;
  std::runtime_error v4;

  v1 = *(_QWORD **)(a1 + 32);
  if (!*v1)
  {
    std::runtime_error::runtime_error(&v4, "call to empty boost::function");
    v4.__vftable = (std::runtime_error_vtbl *)&unk_24D5DBC20;
    boost::throw_exception<boost::bad_function_call>(&v4);
  }
  (*(void (**)(_QWORD *))((*v1 & 0xFFFFFFFFFFFFFFFELL) + 8))(v1 + 1);
  result = *(uint64_t **)(a1 + 32);
  if (result)
  {
    boost::function0<void>::~function0(result);
    JUMPOUT(0x2199FEAC4);
  }
  return result;
}

@end
