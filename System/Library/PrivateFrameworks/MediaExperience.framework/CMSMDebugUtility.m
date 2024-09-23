@implementation CMSMDebugUtility

void __CMSMDebugUtility_RegisterForCACentralStateDumping_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  _QWORD v4[5];

  v3 = MXGetSerialQueue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __CMSMDebugUtility_RegisterForCACentralStateDumping_block_invoke_2;
  v4[3] = &__block_descriptor_40_e5_v8__0l;
  v4[4] = a2;
  MXDispatchAsyncAndWait((uint64_t)"CMSMDebugUtility_RegisterForCACentralStateDumping_block_invoke", (uint64_t)"MXSessionManagerDebugUtilitiesCommon.m", 742, 0, 0, v3, (uint64_t)v4);
}

uint64_t __CMSMDebugUtility_RegisterForCACentralStateDumping_block_invoke_2(uint64_t result)
{
  FILE *v1;
  NSPointerArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  const char *CStringPtrAndBufferToFree;
  NSPointerArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  const char *v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v1 = *(FILE **)(result + 32);
  if (v1)
  {
    -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
    fwrite("CMSESSION STATE\n", 0x10uLL, 1uLL, v1);
    fwrite("Playing Sessions\n", 0x11uLL, 1uLL, v1);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v2 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionList");
    v3 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v22 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v7, "isPlaying"))
          {
            v25[0] = 0;
            objc_msgSend(v7, "clientName");
            CStringPtrAndBufferToFree = (const char *)FigCFStringGetCStringPtrAndBufferToFree();
            fprintf(v1, "Name: %s\n", CStringPtrAndBufferToFree);
            free(v25[0]);
          }
        }
        v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v4);
    }
    fwrite("\nActive Sessions\n", 0x11uLL, 1uLL, v1);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionList");
    v10 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
          if (objc_msgSend(v14, "isActive"))
          {
            objc_msgSend(v14, "clientName");
            v15 = (const char *)FigCFStringGetCStringPtrAndBufferToFree();
            if (objc_msgSend(v14, "displayID"))
              objc_msgSend(v14, "displayID");
            v16 = (const char *)FigCFStringGetCStringPtrAndBufferToFree();
            fprintf(v1, "Name: %s DisplayID %s \n", v15, v16);
            free(0);
            free(0);
          }
        }
        v11 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v11);
    }
    fwrite("\n\n", 2uLL, 1uLL, v1);
    return -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
  }
  return result;
}

@end
