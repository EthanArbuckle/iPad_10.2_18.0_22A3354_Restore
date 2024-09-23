@implementation MFUserScriptLibrary

void __34__MFUserScriptLibrary_userScripts__block_invoke()
{
  id v0;
  id v1;
  id v2;
  void *v3;
  uint64_t i;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t j;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9[0] = objc_msgSend(v0, "initWithBytes:length:encoding:", kAttachmentViewSupportSource, kAttachmentViewSupportSourceLength, 4);
  v1 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9[1] = objc_msgSend(v1, "initWithBytes:length:encoding:", kMessageReformattingSource, kMessageReformattingSourceLength, 4);
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9[2] = objc_msgSend(v2, "initWithBytes:length:encoding:", kMessageContentViewSource, kMessageContentViewSourceLength, 4);
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
    objc_msgSend(v3, "appendString:", v9[i]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEF610]), "initWithSource:injectionTime:forMainFrameOnly:", v3, 1, 0);
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v5, 0);
  v7 = (void *)userScripts_userScripts;
  userScripts_userScripts = v6;

  for (j = 2; j != -1; --j)
}

+ (id)userScripts
{
  if (userScripts_onceToken != -1)
    dispatch_once(&userScripts_onceToken, &__block_literal_global_9);
  return (id)userScripts_userScripts;
}

@end
