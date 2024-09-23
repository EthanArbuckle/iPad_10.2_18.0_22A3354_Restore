@implementation BLHLSPlaylistState

- (BLHLSPlaylistState)init
{
  BLHLSPlaylistState *v2;
  uint64_t v3;
  NSMutableDictionary *mutableGroups;
  uint64_t v5;
  NSMutableArray *mutableSegments;
  uint64_t v7;
  NSMutableArray *mutableStreamInfs;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BLHLSPlaylistState;
  v2 = -[BLHLSPlaylistState init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    mutableGroups = v2->_mutableGroups;
    v2->_mutableGroups = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    mutableSegments = v2->_mutableSegments;
    v2->_mutableSegments = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    mutableStreamInfs = v2->_mutableStreamInfs;
    v2->_mutableStreamInfs = (NSMutableArray *)v7;

    v2->_currentDuration = -1.0;
  }
  return v2;
}

- (NSMutableDictionary)mutableGroups
{
  return self->_mutableGroups;
}

- (void)setMutableGroups:(id)a3
{
  objc_storeStrong((id *)&self->_mutableGroups, a3);
}

- (BLHLSMap)currentMap
{
  return self->_currentMap;
}

- (void)setCurrentMap:(id)a3
{
  objc_storeStrong((id *)&self->_currentMap, a3);
}

- (double)currentDuration
{
  return self->_currentDuration;
}

- (void)setCurrentDuration:(double)a3
{
  self->_currentDuration = a3;
}

- (NSMutableArray)mutableSegments
{
  return self->_mutableSegments;
}

- (void)setMutableSegments:(id)a3
{
  objc_storeStrong((id *)&self->_mutableSegments, a3);
}

- (BLHLSStreamInf)currentStreamInf
{
  return self->_currentStreamInf;
}

- (void)setCurrentStreamInf:(id)a3
{
  objc_storeStrong((id *)&self->_currentStreamInf, a3);
}

- (NSMutableArray)mutableStreamInfs
{
  return self->_mutableStreamInfs;
}

- (void)setMutableStreamInfs:(id)a3
{
  objc_storeStrong((id *)&self->_mutableStreamInfs, a3);
}

- (BLHLSKey)currentKey
{
  return self->_currentKey;
}

- (void)setCurrentKey:(id)a3
{
  objc_storeStrong((id *)&self->_currentKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentKey, 0);
  objc_storeStrong((id *)&self->_mutableStreamInfs, 0);
  objc_storeStrong((id *)&self->_currentStreamInf, 0);
  objc_storeStrong((id *)&self->_mutableSegments, 0);
  objc_storeStrong((id *)&self->_currentMap, 0);
  objc_storeStrong((id *)&self->_mutableGroups, 0);
}

@end
