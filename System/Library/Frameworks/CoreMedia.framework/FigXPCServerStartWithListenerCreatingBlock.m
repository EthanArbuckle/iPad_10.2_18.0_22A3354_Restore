@implementation FigXPCServerStartWithListenerCreatingBlock

void __FigXPCServerStartWithListenerCreatingBlock_block_invoke(uint64_t a1, _xpc_connection_s *a2)
{
  uint64_t v4;
  void *v6;

  v4 = MEMORY[0x193FFCDCC](a2);
  if (v4 == MEMORY[0x1E0C812E0])
  {
    FigSimpleMutexLock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 112));
    figXPC_HandleNewClientConnection(*(_QWORD *)(a1 + 32), a2);
    FigSimpleMutexUnlock(*(pthread_mutex_t **)(*(_QWORD *)(a1 + 32) + 112));
  }
  else if (a2 == (_xpc_connection_s *)MEMORY[0x1E0C81260] && v4 == MEMORY[0x1E0C81310])
  {
    v6 = (void *)xpc_connection_copy_invalidation_reason();
    free(v6);
  }
}

@end
