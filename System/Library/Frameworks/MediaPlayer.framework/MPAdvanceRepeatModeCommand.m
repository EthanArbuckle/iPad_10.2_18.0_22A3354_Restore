@implementation MPAdvanceRepeatModeCommand

- (id)newCommandEventWithPreservesRepeatMode:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v10;
  _QWORD v11[2];

  v3 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = -[MPRemoteCommand mediaRemoteCommandType](self, "mediaRemoteCommandType");
  v10 = *MEMORY[0x1E0D4C810];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MPRemoteCommand newCommandEventWithCommandType:options:](self, "newCommandEventWithCommandType:options:", v5, v7);

  return v8;
}

@end
