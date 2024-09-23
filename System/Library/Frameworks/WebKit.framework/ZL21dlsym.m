@implementation ZL21dlsym

void *___ZL21dlsym_callback_notifyPKc_block_invoke(uint64_t a1)
{
  xpc_object_t empty;
  void *v3;

  empty = xpc_dictionary_create_empty();
  v3 = empty;
  if (empty)
  {
    xpc_dictionary_set_string(empty, "symbol", *(const char **)(a1 + 32));
    xpc_dictionary_set_string(v3, "executable_path", byte_1ECE723F0);
  }
  else
  {
    WTFLogAlways();
  }
  return v3;
}

@end
