@implementation NMSSyncStatesDict

- (NMSSyncStatesDict)init
{
  NMSSyncStatesDict *v2;
  uint64_t v3;
  NSMutableDictionary *syncStatesDict;
  uint64_t v5;
  NSMutableDictionary *waitingSubstatesDict;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NMSSyncStatesDict;
  v2 = -[NMSSyncStatesDict init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
    v3 = objc_claimAutoreleasedReturnValue();
    syncStatesDict = v2->_syncStatesDict;
    v2->_syncStatesDict = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
    v5 = objc_claimAutoreleasedReturnValue();
    waitingSubstatesDict = v2->_waitingSubstatesDict;
    v2->_waitingSubstatesDict = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)setSyncState:(unint64_t)a3 forMediaType:(unint64_t)a4
{
  void *v7;
  id v8;

  objc_msgSend((id)objc_opt_class(), "assetTypeForMediaType:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 != 3)
    -[NMSSyncStatesDict setWaitingSubstate:forMediaType:](self, "setWaitingSubstate:forMediaType:", 0, a4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_syncStatesDict, "setObject:forKeyedSubscript:", v7, v8);

}

- (void)setSyncStateForAllMediaTypes:(unint64_t)a3
{
  uint64_t i;

  for (i = 1; i != 4; ++i)
    -[NMSSyncStatesDict setSyncState:forMediaType:](self, "setSyncState:forMediaType:", a3, i);
}

- (void)setWaitingSubstate:(unint64_t)a3 forMediaType:(unint64_t)a4
{
  void *v6;
  id v7;

  objc_msgSend((id)objc_opt_class(), "assetTypeForMediaType:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_waitingSubstatesDict, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setWaitingSubstateForAllMediaTypes:(unint64_t)a3
{
  uint64_t i;

  for (i = 1; i != 4; ++i)
    -[NMSSyncStatesDict setWaitingSubstate:forMediaType:](self, "setWaitingSubstate:forMediaType:", a3, i);
}

- (unint64_t)syncStateForMediaType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend((id)objc_opt_class(), "assetTypeForMediaType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_syncStatesDict, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v7 = 0;

  return v7;
}

- (unint64_t)waitingSubstateForMediaType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend((id)objc_opt_class(), "assetTypeForMediaType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_waitingSubstatesDict, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v7 = 0;

  return v7;
}

- (id)syncStateDictionaryRepresentation
{
  return (id)-[NSMutableDictionary copy](self->_syncStatesDict, "copy");
}

- (id)waitingSubstateDictionaryRepresentation
{
  return (id)-[NSMutableDictionary copy](self->_waitingSubstatesDict, "copy");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SyncStates: %@, WaitingSubstates: %@"), self->_syncStatesDict, self->_waitingSubstatesDict);
}

+ (id)assetTypeForMediaType:(unint64_t)a3
{
  if (a3 > 3)
    return 0;
  else
    return off_24D648228[a3];
}

+ (unint64_t)mediaTypeForAssetType:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Music")) & 1) != 0)
    {
      v4 = 1;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Podcast")) & 1) != 0)
    {
      v4 = 2;
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Audiobook")))
    {
      v4 = 3;
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSMutableDictionary mutableCopyWithZone:](self->_syncStatesDict, "mutableCopyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = -[NSMutableDictionary mutableCopyWithZone:](self->_waitingSubstatesDict, "mutableCopyWithZone:", a3);
    v9 = (void *)v5[2];
    v5[2] = v8;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitingSubstatesDict, 0);
  objc_storeStrong((id *)&self->_syncStatesDict, 0);
}

@end
