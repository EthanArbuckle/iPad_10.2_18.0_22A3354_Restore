@implementation BLPurchaseDAAPItem

+ (id)item
{
  return objc_alloc_init((Class)a1);
}

+ (id)itemWithItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateItemWithItem:", v4);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *ClassName;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  int v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  const __CFString *v33;
  const __CFString *v34;
  const char *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_super v42;

  -[BLPurchaseDAAPItem valueForKey:](self, "valueForKey:", CFSTR("macAddress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  if (v3)
  {
    ClassName = object_getClassName(self);
    -[BLPurchaseDAAPItem valueForKey:](self, "valueForKey:", CFSTR("supportsVideo"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = CFSTR("AirPlay Video");
    else
      v7 = CFSTR("AirPlay");
    -[BLPurchaseDAAPItem name](self, "name");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseDAAPItem valueForKey:](self, "valueForKey:", CFSTR("isPlaying"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");
    v10 = &stru_24CE8D258;
    v11 = CFSTR("isPlaying, ");
    if (!v9)
      v11 = &stru_24CE8D258;
    v33 = v11;
    -[BLPurchaseDAAPItem valueForKey:](self, "valueForKey:", CFSTR("selected"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");
    v40 = (void *)v6;
    v35 = ClassName;
    v36 = v8;
    v34 = v7;
    if (v13)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      -[BLPurchaseDAAPItem valueForKey:](self, "valueForKey:", CFSTR("volume"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "floatValue");
      objc_msgSend(v14, "stringWithFormat:", CFSTR("selected v:%f "), v15);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    -[BLPurchaseDAAPItem valueForKey:](self, "valueForKey:", CFSTR("volume"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "BOOLValue");
    -[BLPurchaseDAAPItem valueForKey:](self, "valueForKey:", CFSTR("hasPassword"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLValue");
    -[BLPurchaseDAAPItem valueForKey:](self, "valueForKey:", CFSTR("macAddress"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%s: %p> %@: %@, %@%@supportsVolume:%d, locked:%d, macAddress:%@"), v35, self, v34, v38, v33, v10, v25, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {

    }
  }
  else
  {
    v41 = (void *)MEMORY[0x24BDD17C8];
    v42.receiver = self;
    v42.super_class = (Class)BLPurchaseDAAPItem;
    -[BLPurchaseDAAPItem description](&v42, sel_description);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseDAAPItem name](self, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[BLPurchaseDAAPItem itemID](self, "itemID");
    -[BLPurchaseDAAPItem songalbum](self, "songalbum");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseDAAPItem songartist](self, "songartist");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[BLPurchaseDAAPItem containerItemID](self, "containerItemID");
    -[BLPurchaseDAAPItem expectedDate](self, "expectedDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseDAAPItem objectForKey:](self, "objectForKey:", CFSTR("dmap.itemhidden"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseDAAPItem valueForKey:](self, "valueForKey:", CFSTR("booklets"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[BLPurchaseDAAPItem valueForKey:](self, "valueForKey:", CFSTR("booklets"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = (void *)MEMORY[0x24BDBD1A8];
    }
    -[BLPurchaseDAAPItem additionalInfo](self, "additionalInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringWithFormat:", CFSTR("%@ %@, %llu, %@, %@, containerItemID = %u, isPreorder = %u, isHidden = %@, Booklets = %@, additionalInfo = %@"), v39, v16, v37, v17, v18, v19, v20 != 0, v21, v23, v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
  }
  return v29;
}

- (NSDictionary)additionalInfo
{
  if (self->_isFrozen)
    -[BLPurchaseDAAPItem frozenInfo](self, "frozenInfo");
  else
    -[BLPurchaseDAAPItem mutableInfo](self, "mutableInfo");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)freeze
{
  void *v3;
  void *v4;
  void *v5;

  if (!self->_isFrozen)
  {
    self->_isFrozen = 1;
    v3 = (void *)MEMORY[0x24BDBCE70];
    -[BLPurchaseDAAPItem mutableInfo](self, "mutableInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithDictionary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseDAAPItem setFrozenInfo:](self, "setFrozenInfo:", v5);

    -[BLPurchaseDAAPItem setMutableInfo:](self, "setMutableInfo:", 0);
  }
}

- (void)thaw
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_isFrozen)
  {
    self->_isFrozen = 0;
    v3 = (void *)MEMORY[0x24BDBCED8];
    -[BLPurchaseDAAPItem frozenInfo](self, "frozenInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dictionaryWithDictionary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseDAAPItem setMutableInfo:](self, "setMutableInfo:", v5);

    -[BLPurchaseDAAPItem setFrozenInfo:](self, "setFrozenInfo:", 0);
  }
}

- (NSNumber)hasVideo
{
  if ((*(_BYTE *)&self->_itemFlags & 1) == 0)
    return (NSNumber *)0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  return (NSNumber *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setHasVideo:(id)a3
{
  *(_BYTE *)&self->_itemFlags = *(_BYTE *)&self->_itemFlags & 0xFE | objc_msgSend(a3, "BOOLValue");
}

- (int)mediaKind
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[BLPurchaseDAAPItem additionalInfo](self, "additionalInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("mediaKind"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[BLPurchaseDAAPItem additionalInfo](self, "additionalInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("com.apple.itunes.mediakind"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = objc_msgSend(v4, "intValue");

  return v6;
}

- (unint64_t)itemID
{
  unint64_t result;
  void *v4;
  void *v5;

  result = self->_itemID;
  if (!result)
  {
    -[BLPurchaseDAAPItem additionalInfo](self, "additionalInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForKey:", CFSTR("dmap.longitemid"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_itemID = objc_msgSend(v5, "unsignedLongLongValue");

    return self->_itemID;
  }
  return result;
}

- (NSDate)expectedDate
{
  void *v2;
  void *v3;

  -[BLPurchaseDAAPItem additionalInfo](self, "additionalInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", CFSTR("com.apple.itunes.preorder-expected-date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[BLPurchaseDAAPItem additionalInfo](self, "additionalInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "mutableCopy");

  if (!v4)
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[BLPurchaseDAAPItem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BLPurchaseDAAPItem name](self, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v6, CFSTR("name"));

  }
  -[BLPurchaseDAAPItem songalbum](self, "songalbum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[BLPurchaseDAAPItem songalbum](self, "songalbum");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v8, CFSTR("daap.songalbum"));

  }
  -[BLPurchaseDAAPItem songartist](self, "songartist");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[BLPurchaseDAAPItem songartist](self, "songartist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v10, CFSTR("daap.songartist"));

  }
  -[BLPurchaseDAAPItem songalbumartist](self, "songalbumartist");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[BLPurchaseDAAPItem songalbumartist](self, "songalbumartist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v12, CFSTR("daap.songalbumartist"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[BLPurchaseDAAPItem itemID](self, "itemID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v13, CFSTR("dmap.itemid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[BLPurchaseDAAPItem songalbumid](self, "songalbumid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v14, CFSTR("daap.songalbumid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[BLPurchaseDAAPItem containerItemID](self, "containerItemID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v15, CFSTR("dmap.containeritemid"));

  -[BLPurchaseDAAPItem hasVideo](self, "hasVideo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v16, CFSTR("hasVideo"));

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[BLPurchaseDAAPItem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setName:", v6);

  -[BLPurchaseDAAPItem additionalInfo](self, "additionalInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateItemWithDictionary:", v7);

  return v4;
}

- (BLPurchaseDAAPItem)initWithCoder:(id)a3
{
  id v4;
  BLPurchaseDAAPItem *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = -[BLPurchaseDAAPItem init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("additionalInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseDAAPItem updateItemWithDictionary:](v5, "updateItemWithDictionary:", v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BLPurchaseDAAPItem name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[BLPurchaseDAAPItem additionalInfo](self, "additionalInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("additionalInfo"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)objectForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("daap.songartist")))
  {
    -[BLPurchaseDAAPItem songartist](self, "songartist");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("daap.songalbumid")))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), -[BLPurchaseDAAPItem songalbumid](self, "songalbumid"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("daap.songalbum")))
    {
      -[BLPurchaseDAAPItem additionalInfo](self, "additionalInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    -[BLPurchaseDAAPItem songalbum](self, "songalbum");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_8:

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!self->_isFrozen)
  {
    -[BLPurchaseDAAPItem mutableInfo](self, "mutableInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

      if (!v7)
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[BLPurchaseDAAPItem setMutableInfo:](self, "setMutableInfo:", v8);

      }
      -[BLPurchaseDAAPItem mutableInfo](self, "mutableInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v9, v6);
    }
    else
    {
      objc_msgSend(v7, "removeObjectForKey:", v6);
    }

  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a3;
  -[BLPurchaseDAAPItem willChangeValueForKey:](self, "willChangeValueForKey:", v7);
  -[BLPurchaseDAAPItem setObject:forKey:](self, "setObject:forKey:", v6, v7);

  -[BLPurchaseDAAPItem didChangeValueForKey:](self, "didChangeValueForKey:", v7);
}

- (void)updateItemWithItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (!self->_isFrozen)
  {
    v8 = v4;
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v8, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLPurchaseDAAPItem setName:](self, "setName:", v6);

    }
    objc_msgSend(v8, "additionalInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLPurchaseDAAPItem updateItemWithDictionary:](self, "updateItemWithDictionary:", v7);

    v4 = v8;
  }

}

- (void)updateItemWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!self->_isFrozen)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "allKeys", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[BLPurchaseDAAPItem setValue:forKey:](self, "setValue:forKey:", v12, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)songalbum
{
  return self->_songalbum;
}

- (void)setSongalbum:(id)a3
{
  objc_storeStrong((id *)&self->_songalbum, a3);
}

- (NSString)songartist
{
  return self->_songartist;
}

- (void)setSongartist:(id)a3
{
  objc_storeStrong((id *)&self->_songartist, a3);
}

- (NSString)songalbumartist
{
  return self->_songalbumartist;
}

- (void)setSongalbumartist:(id)a3
{
  objc_storeStrong((id *)&self->_songalbumartist, a3);
}

- (void)setItemID:(unint64_t)a3
{
  self->_itemID = a3;
}

- (unsigned)downloadStatus
{
  return self->_downloadStatus;
}

- (void)setDownloadStatus:(unsigned __int8)a3
{
  self->_downloadStatus = a3;
}

- (unint64_t)songalbumid
{
  return self->_songalbumid;
}

- (void)setSongalbumid:(unint64_t)a3
{
  self->_songalbumid = a3;
}

- (unsigned)containerItemID
{
  return self->_containerItemID;
}

- (void)setContainerItemID:(unsigned int)a3
{
  self->_containerItemID = a3;
}

- (NSDictionary)frozenInfo
{
  return self->_frozenInfo;
}

- (void)setFrozenInfo:(id)a3
{
  objc_storeStrong((id *)&self->_frozenInfo, a3);
}

- (NSMutableDictionary)mutableInfo
{
  return self->_mutableInfo;
}

- (void)setMutableInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mutableInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableInfo, 0);
  objc_storeStrong((id *)&self->_frozenInfo, 0);
  objc_storeStrong((id *)&self->_songalbumartist, 0);
  objc_storeStrong((id *)&self->_songartist, 0);
  objc_storeStrong((id *)&self->_songalbum, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
