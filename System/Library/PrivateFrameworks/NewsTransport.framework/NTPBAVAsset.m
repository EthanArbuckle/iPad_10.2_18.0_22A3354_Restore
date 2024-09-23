@implementation NTPBAVAsset

- (void)dealloc
{
  objc_super v3;

  -[NTPBAVAsset setIdentifier:](self, "setIdentifier:", 0);
  -[NTPBAVAsset setRemoteURL:](self, "setRemoteURL:", 0);
  -[NTPBAVAsset setBookmark:](self, "setBookmark:", 0);
  -[NTPBAVAsset setContentKeyIdentifiers:](self, "setContentKeyIdentifiers:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBAVAsset;
  -[NTPBAVAsset dealloc](&v3, sel_dealloc);
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasRemoteURL
{
  return self->_remoteURL != 0;
}

- (BOOL)hasBookmark
{
  return self->_bookmark != 0;
}

- (void)setSize:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSize
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearContentKeyIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_contentKeyIdentifiers, "removeAllObjects");
}

- (void)addContentKeyIdentifiers:(id)a3
{
  NSMutableArray *contentKeyIdentifiers;

  contentKeyIdentifiers = self->_contentKeyIdentifiers;
  if (!contentKeyIdentifiers)
  {
    contentKeyIdentifiers = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_contentKeyIdentifiers = contentKeyIdentifiers;
  }
  -[NSMutableArray addObject:](contentKeyIdentifiers, "addObject:", a3);
}

- (unint64_t)contentKeyIdentifiersCount
{
  return -[NSMutableArray count](self->_contentKeyIdentifiers, "count");
}

- (id)contentKeyIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_contentKeyIdentifiers, "objectAtIndex:", a3);
}

+ (Class)contentKeyIdentifiersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBAVAsset;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBAVAsset description](&v3, sel_description), -[NTPBAVAsset dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *remoteURL;
  NSData *bookmark;
  NSMutableArray *contentKeyIdentifiers;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  remoteURL = self->_remoteURL;
  if (remoteURL)
    objc_msgSend(v4, "setObject:forKey:", remoteURL, CFSTR("remote_URL"));
  bookmark = self->_bookmark;
  if (bookmark)
    objc_msgSend(v4, "setObject:forKey:", bookmark, CFSTR("bookmark"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_size), CFSTR("size"));
  contentKeyIdentifiers = self->_contentKeyIdentifiers;
  if (contentKeyIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", contentKeyIdentifiers, CFSTR("content_key_identifiers"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAVAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *contentKeyIdentifiers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_remoteURL)
    PBDataWriterWriteStringField();
  if (self->_bookmark)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  contentKeyIdentifiers = self->_contentKeyIdentifiers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](contentKeyIdentifiers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(contentKeyIdentifiers);
        PBDataWriterWriteStringField();
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](contentKeyIdentifiers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *contentKeyIdentifiers;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 32) = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 40) = -[NSString copyWithZone:](self->_remoteURL, "copyWithZone:", a3);

  *(_QWORD *)(v5 + 16) = -[NSData copyWithZone:](self->_bookmark, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_size;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  contentKeyIdentifiers = self->_contentKeyIdentifiers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](contentKeyIdentifiers, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(contentKeyIdentifiers);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addContentKeyIdentifiers:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](contentKeyIdentifiers, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *identifier;
  NSString *remoteURL;
  NSData *bookmark;
  NSMutableArray *contentKeyIdentifiers;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    identifier = self->_identifier;
    if (!((unint64_t)identifier | *((_QWORD *)a3 + 4))
      || (v5 = -[NSString isEqual:](identifier, "isEqual:")) != 0)
    {
      remoteURL = self->_remoteURL;
      if (!((unint64_t)remoteURL | *((_QWORD *)a3 + 5))
        || (v5 = -[NSString isEqual:](remoteURL, "isEqual:")) != 0)
      {
        bookmark = self->_bookmark;
        if (!((unint64_t)bookmark | *((_QWORD *)a3 + 2)) || (v5 = -[NSData isEqual:](bookmark, "isEqual:")) != 0)
        {
          if ((*(_BYTE *)&self->_has & 1) != 0)
          {
            if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_size != *((_QWORD *)a3 + 1))
              goto LABEL_15;
          }
          else if ((*((_BYTE *)a3 + 48) & 1) != 0)
          {
LABEL_15:
            LOBYTE(v5) = 0;
            return v5;
          }
          contentKeyIdentifiers = self->_contentKeyIdentifiers;
          if ((unint64_t)contentKeyIdentifiers | *((_QWORD *)a3 + 3))
            LOBYTE(v5) = -[NSMutableArray isEqual:](contentKeyIdentifiers, "isEqual:");
          else
            LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_remoteURL, "hash");
  v5 = -[NSData hash](self->_bookmark, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761u * self->_size;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSMutableArray hash](self->_contentKeyIdentifiers, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (*((_QWORD *)a3 + 4))
    -[NTPBAVAsset setIdentifier:](self, "setIdentifier:");
  if (*((_QWORD *)a3 + 5))
    -[NTPBAVAsset setRemoteURL:](self, "setRemoteURL:");
  if (*((_QWORD *)a3 + 2))
    -[NTPBAVAsset setBookmark:](self, "setBookmark:");
  if ((*((_BYTE *)a3 + 48) & 1) != 0)
  {
    self->_size = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NTPBAVAsset addContentKeyIdentifiers:](self, "addContentKeyIdentifiers:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)remoteURL
{
  return self->_remoteURL;
}

- (void)setRemoteURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSData)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)size
{
  return self->_size;
}

- (NSMutableArray)contentKeyIdentifiers
{
  return self->_contentKeyIdentifiers;
}

- (void)setContentKeyIdentifiers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
