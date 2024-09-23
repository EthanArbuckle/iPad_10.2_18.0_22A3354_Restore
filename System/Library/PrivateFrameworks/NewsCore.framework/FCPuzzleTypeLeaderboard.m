@implementation FCPuzzleTypeLeaderboard

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leaderboards, 0);
}

- (FCPuzzleTypeLeaderboard)initWithDictionary:(id)a3
{
  id v4;
  FCPuzzleTypeLeaderboard *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  FCPuzzleLeaderboard *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FCPuzzleTypeLeaderboard;
  v5 = -[FCPuzzleTypeLeaderboard init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("leaderboards"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = -[FCPuzzleLeaderboard initWithDictionary:]([FCPuzzleLeaderboard alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v9);
    }
    -[FCPuzzleTypeLeaderboard setLeaderboards:](v5, "setLeaderboards:", v6);

  }
  return v5;
}

- (void)setLeaderboards:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)leaderboards
{
  return self->_leaderboards;
}

@end
