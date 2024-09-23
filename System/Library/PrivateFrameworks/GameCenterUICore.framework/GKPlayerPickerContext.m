@implementation GKPlayerPickerContext

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken, &__block_literal_global_5);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys;
}

void __48__GKPlayerPickerContext_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("maxPlayers");
  v6[0] = objc_opt_class();
  v5[1] = CFSTR("excludedPlayers");
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v2;
  v5[2] = CFSTR("pickerOrigin");
  v6[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys;
  secureCodedPropertyKeys_sSecureCodedKeys = v3;

}

- (GKMatch)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
  objc_storeStrong((id *)&self->_match, a3);
}

- (int64_t)maxPlayers
{
  return self->_maxPlayers;
}

- (void)setMaxPlayers:(int64_t)a3
{
  self->_maxPlayers = a3;
}

- (NSArray)excludedPlayers
{
  return self->_excludedPlayers;
}

- (void)setExcludedPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_excludedPlayers, a3);
}

- (int64_t)pickerOrigin
{
  return self->_pickerOrigin;
}

- (void)setPickerOrigin:(int64_t)a3
{
  self->_pickerOrigin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedPlayers, 0);
  objc_storeStrong((id *)&self->_match, 0);
}

@end
