@implementation CMSessionMgrCopyDeviceRouteForRouteConfiguration

void __CMSessionMgrCopyDeviceRouteForRouteConfiguration_block_invoke(uint64_t a1)
{
  NSPointerArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  int v9;
  CFTypeRef *v10;
  CFTypeRef *v11;
  CFTypeRef *v12;
  CFTypeRef v13;
  CFTypeRef v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CFTypeRef v19;
  CFTypeRef v20;
  CFTypeRef cf;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  cf = 0;
  v19 = 0;
  -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionList");
  v3 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
      if ((objc_msgSend(v7, "currentlyControllingFlags") & 2) != 0)
        break;
      if (v4 == ++v6)
      {
        v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v7 = 0;
  }
  -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
  if (!v7
    || !objc_msgSend(v7, "audioCategory")
    || !CFEqual((CFTypeRef)objc_msgSend(v7, "audioCategory"), *(CFTypeRef *)(a1 + 40)))
  {
    goto LABEL_30;
  }
  v13 = 0;
  v14 = 0;
  v8 = -[MXSessionManager getUncustomizedCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getUncustomizedCategory:", *(_QWORD *)(a1 + 40));
  if (!PVMCopyCurrentState(0, &v14, &v13, &cf, &v20, &v19))
  {
    if (*(_QWORD *)(a1 + 40) && v14 && PVMCategoriesAreEquivalent(v8, 0, (const __CFString *)v14, v13))
    {
      v9 = 0;
      goto LABEL_25;
    }
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    if (v20)
    {
      CFRelease(v20);
      v20 = 0;
    }
    if (v19)
    {
      CFRelease(v19);
      v19 = 0;
    }
  }
  v9 = 1;
LABEL_25:
  if (v14)
    CFRelease(v14);
  if (v13)
    CFRelease(v13);
  if (v9)
LABEL_30:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CMSMUtility_CopyDeviceRouteAtIndexForInactiveRouteConfiguration(*(NSDictionary **)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0, &cf, &v20, &v19);
  v10 = *(CFTypeRef **)(a1 + 56);
  if (v10)
  {
    *v10 = cf;
    cf = 0;
  }
  v11 = *(CFTypeRef **)(a1 + 64);
  if (v11)
  {
    *v11 = v20;
    v20 = 0;
  }
  v12 = *(CFTypeRef **)(a1 + 72);
  if (v12)
  {
    *v12 = v20;
    v20 = 0;
  }
  if (cf)
    CFRelease(cf);
  if (v20)
    CFRelease(v20);
  if (v19)
    CFRelease(v19);
}

@end
