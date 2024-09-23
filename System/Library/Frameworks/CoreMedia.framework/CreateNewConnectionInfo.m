@implementation CreateNewConnectionInfo

void __figXPC_CreateNewConnectionInfo_block_invoke(uint64_t a1)
{
  uint64_t uint64;
  uint64_t v3;
  void *v4;
  unsigned int v5;
  const char *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  char *v11;
  uint64_t v12;
  void *context;
  void *v14;
  _xpc_connection_s *remote_connection;
  uint64_t v16;
  pid_t v17;
  CFStringRef theString;
  char *v19;
  char buffer[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(*(_QWORD *)(a1 + 32) + 216), ".Operation");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 216);
  theString = 0;
  v19 = 0;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  *(_OWORD *)buffer = 0u;
  v21 = 0u;
  v5 = xpc_dictionary_get_uint64(v4, ".Operation");
  FigXPCMessageCopyCFString(v4, ".PropertyName", &theString);
  if (theString)
    CFStringGetCString(theString, buffer, 128, 0);
  v6 = (const char *)(v3 + 32);
  v7 = OpCodeChar(v5, 3u);
  v8 = OpCodeChar(v5, 2u);
  v9 = OpCodeChar(v5, 1u);
  v10 = OpCodeChar(v5, 0);
  asprintf(&v19, "Server %s Opcode '%c%c%c%c' %s", v6, v7, v8, v9, v10, buffer);
  v11 = v19;
  if ((uint64 & 0x200000000) == 0)
  {
    v12 = *(_QWORD *)(a1 + 32);
    context = dispatch_get_context(*(dispatch_object_t *)(v12 + 192));
    if (context)
    {
      v14 = context;
      remote_connection = xpc_dictionary_get_remote_connection(context);
      xpc_connection_send_message(remote_connection, v14);
      xpc_release(v14);
      dispatch_set_context(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 192), 0);
      v12 = *(_QWORD *)(a1 + 32);
    }
    if (*(_QWORD *)(v12 + 224))
    {
      v16 = *(unsigned int *)(v12 + 160);
      v17 = getpid();
      *(_QWORD *)buffer = 0;
      FigSimpleMutexLock((pthread_mutex_t *)gSelfTerminationLock);
      FigServer_CopyProcessName(v16, (CFStringRef *)buffer);
      if (*(_QWORD *)buffer)
      {
        CFRelease(*(CFTypeRef *)buffer);
        *(_QWORD *)buffer = 0;
      }
      FigRPCServer_TimeoutCrashReport(v16, v11);
      kill(v17, 9);
    }
  }
  free(v11);
}

@end
