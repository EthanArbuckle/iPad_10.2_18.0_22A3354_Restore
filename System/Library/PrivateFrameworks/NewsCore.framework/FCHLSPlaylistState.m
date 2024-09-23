@implementation FCHLSPlaylistState

- (void)setCurrentStreamInf:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (FCHLSPlaylistState)init
{
  FCHLSPlaylistState *v2;
  uint64_t v3;
  NSMutableDictionary *mutableGroups;
  uint64_t v5;
  NSMutableArray *mutableSegments;
  uint64_t v7;
  NSMutableArray *mutableStreamInfs;
  uint64_t v9;
  NSMutableDictionary *mutableSessionData;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FCHLSPlaylistState;
  v2 = -[FCHLSPlaylistState init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    mutableGroups = v2->_mutableGroups;
    v2->_mutableGroups = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    mutableSegments = v2->_mutableSegments;
    v2->_mutableSegments = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    mutableStreamInfs = v2->_mutableStreamInfs;
    v2->_mutableStreamInfs = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    mutableSessionData = v2->_mutableSessionData;
    v2->_mutableSessionData = (NSMutableDictionary *)v9;

    v2->_currentDuration = -1.0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSessionData, 0);
  objc_storeStrong((id *)&self->_currentKey, 0);
  objc_storeStrong((id *)&self->_mutableStreamInfs, 0);
  objc_storeStrong((id *)&self->_currentStreamInf, 0);
  objc_storeStrong((id *)&self->_mutableSegments, 0);
  objc_storeStrong((id *)&self->_currentMap, 0);
  objc_storeStrong((id *)&self->_mutableGroups, 0);
}

@end
