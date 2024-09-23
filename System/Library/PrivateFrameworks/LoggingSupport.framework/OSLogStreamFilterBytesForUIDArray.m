@implementation OSLogStreamFilterBytesForUIDArray

uint64_t ___OSLogStreamFilterBytesForUIDArray_block_invoke(uint64_t a1, int a2, xpc_object_t xint)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_int64_get_value(xint));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addUserID:flags:returningDict:", v4, 0, 0);

  return 1;
}

@end
