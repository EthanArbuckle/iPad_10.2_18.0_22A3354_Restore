@implementation NMSPodcastsDownloadSettings

- (NMSPodcastsDownloadSettings)initWithCollectionType:(int64_t)a3
{
  return -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:](self, "initWithCollectionType:dictionary:", a3, MEMORY[0x24BDBD1B8]);
}

- (NMSPodcastsDownloadSettings)initWithCollectionType:(int64_t)a3 dictionary:(id)a4
{
  id v6;
  NMSPodcastsDownloadSettings *v7;
  NMSPodcastsDownloadSettings *v8;
  uint64_t v9;
  NSMutableDictionary *dictionary;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NMSPodcastsDownloadSettings;
  v7 = -[NMSPodcastsDownloadSettings init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_collectionType = a3;
    v9 = objc_msgSend(v6, "mutableCopy");
    dictionary = v8->_dictionary;
    v8->_dictionary = (NSMutableDictionary *)v9;

  }
  return v8;
}

- (int64_t)numberOfEpisodes
{
  NSMutableDictionary *dictionary;
  unint64_t collectionType;
  int64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;

  dictionary = self->_dictionary;
  if (!dictionary)
  {
    collectionType = self->_collectionType;
    if (collectionType < 4)
      return qword_216E74518[collectionType];
  }
  -[NSMutableDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", CFSTR("NumberOfEpisodes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 || (v8 = self->_collectionType, v8 >= 4))
    v5 = objc_msgSend(v6, "integerValue");
  else
    v5 = qword_216E74538[v8];

  return v5;
}

- (void)setNumberOfEpisodes:(int64_t)a3
{
  NSMutableDictionary *v5;
  NSMutableDictionary *dictionary;
  id v7;

  if (!self->_dictionary)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    dictionary = self->_dictionary;
    self->_dictionary = v5;

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dictionary, "setObject:forKeyedSubscript:", v7, CFSTR("NumberOfEpisodes"));

}

- (BOOL)isEnabled
{
  return -[NMSPodcastsDownloadSettings numberOfEpisodes](self, "numberOfEpisodes") != 0;
}

- (id)dictionaryRepresentation
{
  return (id)-[NSMutableDictionary copy](self->_dictionary, "copy");
}

- (BOOL)isEqual:(id)a3
{
  NMSPodcastsDownloadSettings *v4;
  NMSPodcastsDownloadSettings *v5;
  NMSPodcastsDownloadSettings *v6;
  NSMutableDictionary *dictionary;
  char v8;

  v4 = (NMSPodcastsDownloadSettings *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self->_collectionType != v6->_collectionType
      || (dictionary = self->_dictionary, (dictionary != 0) == (v6->_dictionary == 0)))
    {
      v8 = 0;
    }
    else
    {
      v8 = -[NSMutableDictionary isEqualToDictionary:](dictionary, "isEqualToDictionary:");
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  __CFString *v3;
  void *v4;

  if (-[NMSPodcastsDownloadSettings isEnabled](self, "isEnabled"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld episodes"), -[NMSPodcastsDownloadSettings numberOfEpisodes](self, "numberOfEpisodes"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("Disabled");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)-[NSMutableDictionary copy](self->_dictionary, "copy");
  v6 = (void *)objc_msgSend(v4, "initWithDictionary:", v5);

  return v6;
}

- (NMSPodcastsDownloadSettings)initWithCollectionType:(int64_t)a3 legacyDownloadSettingsDictionary:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NMSPodcastsDownloadSettings *v13;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("NumberOfEpisodes"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8
      || (v9 = (void *)v8,
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NumberOfEpisodes")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "integerValue"),
          v10,
          v9,
          v11 == -1))
    {
      v12 = (id)MEMORY[0x24BDBD1B8];
    }
    else
    {
      v12 = v7;
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:](self, "initWithCollectionType:dictionary:", a3, v12);

  return v13;
}

- (NMSPodcastsDownloadSettings)initWithDictionary:(id)a3
{
  return -[NMSPodcastsDownloadSettings initWithCollectionType:dictionary:](self, "initWithCollectionType:dictionary:", 3, a3);
}

- (NMSPodcastsDownloadSettings)init
{
  return -[NMSPodcastsDownloadSettings initWithDictionary:](self, "initWithDictionary:", MEMORY[0x24BDBD1B8]);
}

- (NMSPodcastsDownloadSettings)initWithCollectionType:(int64_t)a3 legacyDownloadSettings:(id)a4
{
  id v6;
  NMSPodcastsDownloadSettings *v7;

  v6 = a4;
  v7 = -[NMSPodcastsDownloadSettings initWithCollectionType:](self, "initWithCollectionType:", a3);
  if (v7 && objc_msgSend(v6, "numberOfEpisodes") != -1)
    -[NMSPodcastsDownloadSettings setNumberOfEpisodes:](v7, "setNumberOfEpisodes:", objc_msgSend(v6, "numberOfEpisodes"));

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
