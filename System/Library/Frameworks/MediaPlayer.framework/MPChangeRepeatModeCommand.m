@implementation MPChangeRepeatModeCommand

- (id)_mediaRemoteCommandInfoOptions
{
  int64_t currentRepeatType;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  _QWORD v26[3];

  v26[1] = *MEMORY[0x1E0C80C00];
  currentRepeatType = self->_currentRepeatType;
  if (currentRepeatType == 1)
    v4 = 2;
  else
    v4 = 1;
  if (currentRepeatType == 2)
    v5 = 3;
  else
    v5 = v4;
  v25 = *MEMORY[0x1E0D4C828];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (self->_supportedRepeatTypes)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = self->_supportedRepeatTypes;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "integerValue", (_QWORD)v20);
          if (v15 == 1)
            v16 = 2;
          else
            v16 = 1;
          if (v15 == 2)
            v17 = 3;
          else
            v17 = v16;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v18);

        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v12);
    }

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D4C890]);
  }
  return v8;
}

- (void)setCurrentRepeatType:(MPRepeatType)currentRepeatType
{
  if (self->_currentRepeatType != currentRepeatType)
  {
    self->_currentRepeatType = currentRepeatType;
    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }
}

- (void)setSupportedRepeatTypes:(id)a3
{
  NSArray *v4;
  NSArray *supportedRepeatTypes;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_supportedRepeatTypes, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    supportedRepeatTypes = self->_supportedRepeatTypes;
    self->_supportedRepeatTypes = v4;

    -[MPRemoteCommand notifyPropagatablePropertyChanged](self, "notifyPropagatablePropertyChanged");
  }

}

- (id)newCommandEventWithType:(int64_t)a3
{
  return -[MPChangeRepeatModeCommand newCommandEventWithType:preservesRepeatMode:](self, "newCommandEventWithType:preservesRepeatMode:", a3, 0);
}

- (id)newCommandEventWithType:(int64_t)a3 preservesRepeatMode:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v4 = a4;
  v16[2] = *MEMORY[0x1E0C80C00];
  v7 = -[MPRemoteCommand mediaRemoteCommandType](self, "mediaRemoteCommandType");
  v15[0] = *MEMORY[0x1E0D4CCC8];
  if (a3 == 1)
    v8 = 2;
  else
    v8 = 1;
  if (a3 == 2)
    v9 = 3;
  else
    v9 = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v15[1] = *MEMORY[0x1E0D4C810];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MPRemoteCommand newCommandEventWithCommandType:options:](self, "newCommandEventWithCommandType:options:", v7, v12);

  return v13;
}

- (MPRepeatType)currentRepeatType
{
  return self->_currentRepeatType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedRepeatTypes, 0);
}

@end
