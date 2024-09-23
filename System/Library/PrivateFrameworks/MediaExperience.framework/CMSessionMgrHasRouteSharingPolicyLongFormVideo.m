@implementation CMSessionMgrHasRouteSharingPolicyLongFormVideo

uint64_t __CMSessionMgrHasRouteSharingPolicyLongFormVideo_block_invoke(uint64_t a1)
{
  uint64_t result;
  NSPointerArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  result = -[MXSessionManager isLongFormVideoApp:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isLongFormVideoApp:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    **(_BYTE **)(a1 + 40) = 1;
  }
  else
  {
    -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance", 0), "mxCoreSessionList");
    v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          if (v8)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "displayID");
            if (FigCFEqual())
            {
              if (objc_msgSend(v8, "routeSharingPolicy") == 3)
              {
                **(_BYTE **)(a1 + 40) = 1;
                return -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
              }
            }
          }
        }
        v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }
    return -[MXSessionManager mxCoreSessionListEndIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListEndIteration");
  }
  return result;
}

@end
