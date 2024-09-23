@implementation AVWorkaroundNSBlockOperation

- (BOOL)isReady
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)-[AVWorkaroundNSBlockOperation dependencies](self, "dependencies", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "isFinished");
      if (!v7)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

@end
