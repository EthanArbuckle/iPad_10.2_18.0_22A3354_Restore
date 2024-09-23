@implementation ML3AlbumGroupingIdentifier

- (ML3AlbumGroupingIdentifier)initWithAlbumArtistPersistentID:(int64_t)a3 groupingKey:(id)a4 feedURL:(id)a5 seasonNumber:(int64_t)a6 compilation:(BOOL)a7
{
  id v13;
  id v14;
  ML3AlbumGroupingIdentifier *v15;
  ML3AlbumGroupingIdentifier *v16;
  void *v17;
  uint64_t v18;
  NSData *keyValue;
  objc_super v21;

  v13 = a4;
  v14 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ML3AlbumGroupingIdentifier;
  v15 = -[ML3AlbumGroupingIdentifier init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_albumArtistPersistentID = a3;
    objc_storeStrong((id *)&v15->_groupingKey, a4);
    objc_storeStrong((id *)&v16->_feedURL, a5);
    v16->_seasonNumber = a6;
    v16->_compilation = a7;
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendBytes:length:", "<<", 2);
    objc_msgSend(v17, "appendBytes:length:", &v16->_albumArtistPersistentID, 8);
    objc_msgSend(v17, "appendBytes:length:", "<<", 2);
    objc_msgSend(v17, "appendData:", v16->_groupingKey);
    objc_msgSend(v17, "appendBytes:length:", "<<", 2);
    objc_msgSend(v17, "appendBytes:length:", -[NSString UTF8String](v16->_feedURL, "UTF8String"), strlen(-[NSString UTF8String](v16->_feedURL, "UTF8String")));
    objc_msgSend(v17, "appendBytes:length:", "<<", 2);
    objc_msgSend(v17, "appendBytes:length:", &v16->_seasonNumber, 8);
    v18 = objc_msgSend(v17, "copy");
    keyValue = v16->_keyValue;
    v16->_keyValue = (NSData *)v18;

  }
  return v16;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ML3AlbumGroupingIdentifier;
  -[ML3AlbumGroupingIdentifier description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_compilation)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(", albumArtistPersistentID=%lld, groupingKey=%@, feedURL=%@, seasonNumber=%ld, compilation=%@"), *(_OWORD *)&self->_albumArtistPersistentID, self->_feedURL, self->_seasonNumber, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  int v9;
  void *v10;
  NSData *v11;
  NSData *v12;
  char v13;
  void *v14;
  NSData *v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[NSString length](self->_feedURL, "length"))
    {
      v5 = (void *)v4[4];
      v6 = self->_feedURL;
      v7 = v5;
      if (v6 == v7)
      {

        goto LABEL_12;
      }
      v8 = v7;
      v9 = -[NSString isEqual:](v6, "isEqual:", v7);

      if (v9)
      {
LABEL_12:
        v14 = (void *)v4[3];
        v11 = self->_groupingKey;
        v12 = v14;
        if (v11 != v12)
        {
LABEL_13:
          v15 = v12;
          v13 = -[NSData isEqual:](v11, "isEqual:", v12);
LABEL_15:

          goto LABEL_16;
        }
LABEL_14:
        v13 = 1;
        v15 = v11;
        goto LABEL_15;
      }
    }
    else if (self->_albumArtistPersistentID == v4[2] && self->_seasonNumber == v4[5])
    {
      v10 = (void *)v4[3];
      v11 = self->_groupingKey;
      v12 = v10;
      if (v11 != v12)
        goto LABEL_13;
      goto LABEL_14;
    }
  }
  v13 = 0;
LABEL_16:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  int64_t v5;

  v3 = -[NSString length](self->_feedURL, "length");
  v4 = -[NSData hash](self->_groupingKey, "hash");
  if (v3)
    v5 = -[NSString hash](self->_feedURL, "hash");
  else
    v5 = self->_seasonNumber ^ self->_albumArtistPersistentID;
  return v5 ^ v4;
}

- (NSData)keyValue
{
  return self->_keyValue;
}

- (int64_t)albumArtistPersistentID
{
  return self->_albumArtistPersistentID;
}

- (NSData)groupingKey
{
  return self->_groupingKey;
}

- (NSString)feedURL
{
  return self->_feedURL;
}

- (int64_t)seasonNumber
{
  return self->_seasonNumber;
}

- (BOOL)compilation
{
  return self->_compilation;
}

- (void)setKeyValue:(id)a3
{
  objc_storeStrong((id *)&self->_keyValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValue, 0);
  objc_storeStrong((id *)&self->_feedURL, 0);
  objc_storeStrong((id *)&self->_groupingKey, 0);
}

@end
