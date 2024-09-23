@implementation NEVirtualInterfaceConnectSocket

uint64_t __NEVirtualInterfaceConnectSocket_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_object_t v6;

  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v6, a2, a3);
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v6);
  xpc_release(v6);
  return 1;
}

@end
