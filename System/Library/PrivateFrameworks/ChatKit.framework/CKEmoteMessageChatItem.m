@implementation CKEmoteMessageChatItem

- (id)loadTranscriptText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transcriptRegularFontAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v5, v10);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  IMEmotePrefixes();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(v5, "rangeOfString:options:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), 8, (_QWORD)v26);
        if (v18)
        {
          v19 = v17;
          v20 = v18;
          v21 = *MEMORY[0x1E0DC1138];
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "transcriptBoldFont");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addAttribute:value:range:", v21, v23, v19, v20);

          objc_msgSend(v8, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "replaceCharactersInRange:withString:", v19, v20, v24);

          goto LABEL_11;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_11:

  return v11;
}

@end
