@implementation FigMemoryOriginBeginTransactionMakingRegistrationsContingentOnIt

uint64_t __FigMemoryOriginBeginTransactionMakingRegistrationsContingentOnIt_block_invoke()
{
  return pthread_key_create((pthread_key_t *)&sFigMemoryOriginTransactionThreadKey, (void (__cdecl *)(void *))transactionThreadDestructor);
}

@end
