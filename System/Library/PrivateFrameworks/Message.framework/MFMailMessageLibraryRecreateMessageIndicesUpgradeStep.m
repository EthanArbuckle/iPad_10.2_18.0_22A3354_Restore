@implementation MFMailMessageLibraryRecreateMessageIndicesUpgradeStep

+ (BOOL)runWithConnection:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(&unk_1E4F69790, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(&unk_1E4F69790);
        if ((objc_msgSend(v3, "executeStatementString:errorMessage:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), CFSTR("Adding index")) & 1) == 0)
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(&unk_1E4F69790, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

@end
