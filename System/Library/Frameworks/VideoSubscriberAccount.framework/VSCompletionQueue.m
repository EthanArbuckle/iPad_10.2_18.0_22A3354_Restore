@implementation VSCompletionQueue

void __VSCompletionQueue_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  objc_msgSend(v0, "setName:", CFSTR("VSCompletionQueue"));
  v1 = (void *)VSCompletionQueue___vs_lazy_init_variable;
  VSCompletionQueue___vs_lazy_init_variable = (uint64_t)v0;

}

@end
