@implementation MPCPlayerRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)middlewareClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDDC7F0], "authorizationStatus", v5, v6) == 3)
  {
    objc_msgSend(v2, "arrayByAddingObject:", objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return v2;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (MPCPlayerPath)playerPath
{
  return self->_playerPath;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPCPlayerRequest;
  -[MPRequest description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" playerPath=%@"), self->_playerPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v3, "length") - 1, 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setPlayingItemProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)tracklistRange
{
  $EDD789FAE14CB1383AECE2BCA1AA9AB0 *p_tracklistRange;
  int64_t reverseCount;
  int64_t forwardCount;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_tracklistRange = &self->_tracklistRange;
  reverseCount = self->_tracklistRange.reverseCount;
  forwardCount = p_tracklistRange->forwardCount;
  result.var1 = forwardCount;
  result.var0 = reverseCount;
  return result;
}

- (MPPropertySet)queueItemProperties
{
  return self->_queueItemProperties;
}

- (NSString)preferredFallbackItemRelationship
{
  return self->_preferredFallbackItemRelationship;
}

- (MPPropertySet)queueSectionProperties
{
  return self->_queueSectionProperties;
}

- (MPPropertySet)playingItemProperties
{
  return self->_playingItemProperties;
}

- (BOOL)disablePlaybackStateValidation
{
  return self->_disablePlaybackStateValidation;
}

- (void)setPlayerPath:(id)a3
{
  MPCPlayerPath *v4;
  MPCPlayerPath **p_playerPath;
  MPCPlayerPath *obj;

  v4 = (MPCPlayerPath *)a3;
  p_playerPath = &self->_playerPath;
  if (*p_playerPath != v4)
  {
    if (!v4)
    {
      +[MPCPlayerPath deviceActivePlayerPath](MPCPlayerPath, "deviceActivePlayerPath");
      v4 = (MPCPlayerPath *)objc_claimAutoreleasedReturnValue();
    }
    obj = v4;
    objc_storeStrong((id *)p_playerPath, v4);
    v4 = obj;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPCPlayerRequest;
  v4 = -[MPRequest copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 10, self->_playerPath);
  objc_storeStrong(v4 + 11, self->_playingItemProperties);
  objc_storeStrong(v4 + 13, self->_queueItemProperties);
  objc_storeStrong(v4 + 12, self->_queueSectionProperties);
  *((_OWORD *)v4 + 8) = self->_tracklistRange;
  *((_BYTE *)v4 + 72) = self->_disablePlaybackStateValidation;
  *((_BYTE *)v4 + 73) = self->_disablePlaybackRateValidation;
  objc_storeStrong(v4 + 14, self->_preferredFallbackItemRelationship);
  return v4;
}

- (MPCPlayerRequest)init
{
  MPCPlayerRequest *v2;
  uint64_t v3;
  MPCPlayerPath *playerPath;
  uint64_t v5;
  ICUserIdentity *userIdentity;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MPCPlayerRequest;
  v2 = -[MPRequest init](&v8, sel_init);
  if (v2)
  {
    +[MPCPlayerPath deviceActivePlayerPath](MPCPlayerPath, "deviceActivePlayerPath");
    v3 = objc_claimAutoreleasedReturnValue();
    playerPath = v2->_playerPath;
    v2->_playerPath = (MPCPlayerPath *)v3;

    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v5 = objc_claimAutoreleasedReturnValue();
    userIdentity = v2->_userIdentity;
    v2->_userIdentity = (ICUserIdentity *)v5;

  }
  return v2;
}

- (void)setQueueItemProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setTracklistRange:(id)a3
{
  self->_tracklistRange = ($EDD789FAE14CB1383AECE2BCA1AA9AB0)a3;
}

- (void)setQueueSectionProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_preferredFallbackItemRelationship, 0);
  objc_storeStrong((id *)&self->_queueItemProperties, 0);
  objc_storeStrong((id *)&self->_queueSectionProperties, 0);
  objc_storeStrong((id *)&self->_playingItemProperties, 0);
  objc_storeStrong((id *)&self->_playerPath, 0);
}

- (void)setUserIdentity:(id)a3
{
  ICUserIdentity *v4;
  ICUserIdentity *v5;

  v4 = (ICUserIdentity *)a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEC8A58], "activeAccount");
    v4 = (ICUserIdentity *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_userIdentity != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&self->_userIdentity, v4);
    v4 = v5;
  }

}

- (id)_stateDumpObject
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPCPlayerRequest;
  -[MPRequest _stateDumpObject](&v7, sel__stateDumpObject);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{-%ld, +%ld}"), self->_tracklistRange.reverseCount, self->_tracklistRange.forwardCount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("tracklistRange"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_playerPath, CFSTR("playerPath"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_playingItemProperties, CFSTR("playingItemProperties"));
  return v4;
}

- (void)setDisablePlaybackStateValidation:(BOOL)a3
{
  self->_disablePlaybackStateValidation = a3;
}

- (BOOL)disablePlaybackRateValidation
{
  return self->_disablePlaybackRateValidation;
}

- (void)setDisablePlaybackRateValidation:(BOOL)a3
{
  self->_disablePlaybackRateValidation = a3;
}

- (void)setPreferredFallbackItemRelationship:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

@end
