@implementation MTLIOCommandQueue

void __43___MTLIOCommandQueue_launchIOWorkerThreads__block_invoke(uint64_t a1)
{
  while (1)
    MTLIOCommandQueueCommandListProcessCommands((MTLIOCommandQueueCommandList *)(*(_QWORD *)(a1 + 32) + 232));
}

uint64_t __29___MTLIOCommandQueue_dealloc__block_invoke(uint64_t a1)
{
  pthread_cond_destroy((pthread_cond_t *)(*(_QWORD *)(a1 + 32) + 72));
  return pthread_mutex_destroy((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 120));
}

@end
