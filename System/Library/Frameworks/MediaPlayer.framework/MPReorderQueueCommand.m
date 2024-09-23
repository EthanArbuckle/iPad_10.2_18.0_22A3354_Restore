@implementation MPReorderQueueCommand

- (id)newCommandEventWithInsertingContentItemID:(id)a3 afterContentItemID:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  MPReorderQueueCommandEvent *v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  MPReorderQueueCommandEvent *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  v7 = (__CFString *)a3;
  v8 = [MPReorderQueueCommandEvent alloc];
  v9 = -[MPRemoteCommand mediaRemoteCommandType](self, "mediaRemoteCommandType");
  v10 = &stru_1E3163D10;
  v11 = *MEMORY[0x1E0D4CC00];
  v16[0] = *MEMORY[0x1E0D4CBC8];
  v16[1] = v11;
  if (v7)
    v12 = v7;
  else
    v12 = &stru_1E3163D10;
  if (v6)
    v10 = v6;
  v17[0] = v12;
  v17[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[MPReorderQueueCommandEvent initWithCommand:mediaRemoteType:options:](v8, "initWithCommand:mediaRemoteType:options:", self, v9, v13);
  return v14;
}

@end
