@implementation CADSpotlightMockDefaults

- (CADSpotlightMockDefaults)init
{
  CADSpotlightMockDefaults *v2;
  uint64_t v3;
  NSMutableDictionary *dict;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CADSpotlightMockDefaults;
  v2 = -[CADSpotlightMockDefaults init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    dict = v2->_dict;
    v2->_dict = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_dict, "objectForKey:", a3);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _BOOL4 reindexStarted;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("LastUnfinishedSpotlightReindex")))
  {
    v7 = v9;
    if (v9)
      goto LABEL_5;
LABEL_9:
    -[NSMutableDictionary removeObjectForKey:](self->_dict, "removeObjectForKey:", v6);
    goto LABEL_10;
  }
  if (!v9)
  {
    reindexStarted = self->_reindexStarted;
    if (self->_reindexStarted)
      self->_reindexStarted = 0;
    -[CADSpotlightMockDefaults setSuccessfullyReindexed:](self, "setSuccessfullyReindexed:", reindexStarted);
    goto LABEL_9;
  }
  self->_reindexStarted = 1;
  -[CADSpotlightMockDefaults setSuccessfullyReindexed:](self, "setSuccessfullyReindexed:", 0);
  v7 = v9;
LABEL_5:
  -[NSMutableDictionary setObject:forKey:](self->_dict, "setObject:forKey:", v7, v6);
LABEL_10:

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSMutableDictionary description](self->_dict, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)successfullyReindexed
{
  return self->_successfullyReindexed;
}

- (void)setSuccessfullyReindexed:(BOOL)a3
{
  self->_successfullyReindexed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dict, 0);
}

@end
