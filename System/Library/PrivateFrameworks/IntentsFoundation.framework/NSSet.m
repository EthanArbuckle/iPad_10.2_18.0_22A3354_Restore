@implementation NSSet

id __35__NSSet_IntentsFoundation__if_map___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

@end
