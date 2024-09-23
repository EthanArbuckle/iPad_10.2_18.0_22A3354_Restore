@implementation SecXPCDictionarySetString

void __SecXPCDictionarySetString_block_invoke(uint64_t a1, char *string)
{
  if (string)
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 40), *(const char **)(a1 + 48), string);
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = SecError(-50, *(__CFString ***)(a1 + 56), CFSTR("failed to convert string for key %s to utf8"), *(_QWORD *)(a1 + 48));
}

@end
