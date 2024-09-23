@implementation FCAVWorkOperationQueue

uint64_t __FCAVWorkOperationQueue_block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)qword_1ED0F87F8;
  qword_1ED0F87F8 = (uint64_t)v0;

  objc_msgSend((id)qword_1ED0F87F8, "setMaxConcurrentOperationCount:", 1);
  FCAVWorkQueue();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ED0F87F8, "setUnderlyingQueue:", v2);

  return objc_msgSend((id)qword_1ED0F87F8, "setName:", CFSTR("NewsCore.AV.work"));
}

@end
