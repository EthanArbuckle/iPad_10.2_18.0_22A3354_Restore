@implementation SecXPCDictionarySetCFString

void __SecXPCDictionarySetCFString_block_invoke(uint64_t a1, char *string)
{
  xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 32), *(const char **)(a1 + 40), string);
}

@end
