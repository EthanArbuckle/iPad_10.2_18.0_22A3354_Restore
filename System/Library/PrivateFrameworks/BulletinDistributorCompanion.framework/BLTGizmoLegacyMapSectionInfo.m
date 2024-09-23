@implementation BLTGizmoLegacyMapSectionInfo

- (BLTGizmoLegacyMapSectionInfo)initWithNotificationMap:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BLTGizmoLegacyMapSectionInfo *v9;
  uint64_t v10;
  NSDictionary *notificationMap;
  objc_super v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (BLTGizmoLegacyMapSectionInfoKeySet_onceToken != -1)
    dispatch_once(&BLTGizmoLegacyMapSectionInfoKeySet_onceToken, &__block_literal_global_9);
  v8 = objc_msgSend(v7, "intersectsSet:", BLTGizmoLegacyMapSectionInfoKeySet___BLTGizmoLegacyMapSectionInfoKeySet);

  if (v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)BLTGizmoLegacyMapSectionInfo;
    v9 = -[BLTGizmoLegacyMapSectionInfo init](&v13, sel_init);
    if (v9)
    {
      v10 = objc_msgSend(v4, "copy");
      notificationMap = v9->_notificationMap;
      v9->_notificationMap = (NSDictionary *)v10;

    }
  }
  else
  {

    v9 = 0;
  }

  return v9;
}

- (NSString)mappedSectionID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_notificationMap, "objectForKeyedSubscript:", CFSTR("sectionID"));
}

- (NSString)mappedParentSectionID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_notificationMap, "objectForKeyedSubscript:", CFSTR("parentSectionID"));
}

- (BBSectionIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_notificationMap, 0);
}

@end
