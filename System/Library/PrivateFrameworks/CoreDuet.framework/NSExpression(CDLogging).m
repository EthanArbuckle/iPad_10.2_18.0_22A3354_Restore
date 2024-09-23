@implementation NSExpression(CDLogging)

- (uint64_t)cd_containsSensitiveKeyPath
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "expressionType");
  switch(v2)
  {
    case 4:
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      objc_msgSend(a1, "arguments", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v12;
LABEL_9:
        v7 = 0;
        while (1)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "cd_containsSensitiveKeyPath") & 1) != 0)
            goto LABEL_6;
          if (v5 == ++v7)
          {
            v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
            if (v5)
              goto LABEL_9;
            goto LABEL_15;
          }
        }
      }
      goto LABEL_15;
    case 3:
      objc_msgSend(a1, "keyPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = _DKStringContainsPrivacySensitiveMetadataKey(v8);

      if ((v9 & 1) != 0)
        return 1;
      break;
    case 0:
      objc_msgSend(a1, "constantValue");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (_DKStringContainsPrivacySensitiveMetadataKey(v3) & 1) != 0)
      {
LABEL_6:

        return 1;
      }
LABEL_15:

      break;
  }
  return 0;
}

@end
