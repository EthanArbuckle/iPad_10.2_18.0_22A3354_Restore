@implementation EstablishSecondaryConnectionManagement

void __figXPCServer_EstablishSecondaryConnectionManagement_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *CStringPtrMaybeUsingPreallocatedBuffer;
  const char *v10;
  int v11;
  NSObject *v12;
  void *v13;
  _QWORD handler[7];
  CFTypeRef cf;
  void *context;
  char *v17;
  _OWORD v18[8];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x193FFCDCC](a2);
  if (v4 == MEMORY[0x1E0C812E0])
  {
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    context = 0;
    v17 = 0;
    cf = 0;
    memset(v18, 0, sizeof(v18));
    FigServer_CopyProcessName(*(unsigned int *)(v7 + 16), (CFStringRef *)&cf);
    CStringPtrMaybeUsingPreallocatedBuffer = FigCFStringGetCStringPtrMaybeUsingPreallocatedBuffer((const char *)cf, (char *)v18, 128, 0x600u);
    v10 = *(const char **)(v8 + 88);
    v11 = *(_DWORD *)(v7 + 152) + 1;
    *(_DWORD *)(v7 + 152) = v11;
    asprintf(&v17, "%s(%s-%d.%d)-secondary-messages", v10, CStringPtrMaybeUsingPreallocatedBuffer, *(_DWORD *)(v7 + 16), v11);
    v12 = FigDispatchQueueCreateWithPriority(v17, 0, *(_DWORD *)(v8 + 120));
    FigThreadMakeDispatchQueueAbortable(v12);
    free(v17);
    FigSimpleMutexLock(*(pthread_mutex_t **)(v7 + 80));
    CFArrayAppendValue(*(CFMutableArrayRef *)(v7 + 144), a2);
    FigSimpleMutexUnlock(*(pthread_mutex_t **)(v7 + 80));
    xpc_retain(a2);
    xpc_connection_set_target_queue((xpc_connection_t)a2, v12);
    figXPC_CreateNewConnectionInfo(v7, v12, (uint64_t *)&context);
    v13 = context;
    xpc_connection_set_context((xpc_connection_t)a2, context);
    xpc_connection_set_finalizer_f((xpc_connection_t)a2, (xpc_finalizer_t)figXPC_ConnectionInfoFinalizer);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 0x40000000;
    handler[2] = __figXPC_HandleNewSecondaryConnection_block_invoke;
    handler[3] = &__block_descriptor_tmp_148;
    handler[4] = v13;
    handler[5] = v8;
    handler[6] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_activate((xpc_connection_t)a2);
    if (cf)
      CFRelease(cf);
    if (v12)
      dispatch_release(v12);
  }
  else if (a2 == (void *)MEMORY[0x1E0C81260] && v4 == MEMORY[0x1E0C81310])
  {
    v6 = (void *)xpc_connection_copy_invalidation_reason();
    free(v6);
  }
}

@end
