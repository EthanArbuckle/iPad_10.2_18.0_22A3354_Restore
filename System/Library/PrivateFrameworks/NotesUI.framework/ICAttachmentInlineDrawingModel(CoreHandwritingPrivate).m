@implementation ICAttachmentInlineDrawingModel(CoreHandwritingPrivate)

+ (uint64_t)handwritingRecognitionSupported
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t i;
  void *v4;
  char v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v1)
  {
    v2 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v1; ++i)
      {
        if (*(_QWORD *)v8 != v2)
          objc_enumerationMutation(v0);
        objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * i));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(MEMORY[0x1E0D16830], "isLocaleSupported:withMode:", v4, 4);

        if ((v5 & 1) != 0)
        {
          v1 = 1;
          goto LABEL_11;
        }
      }
      v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v1)
        continue;
      break;
    }
  }
LABEL_11:

  return v1;
}

@end
