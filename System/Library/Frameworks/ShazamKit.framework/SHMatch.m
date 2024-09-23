@implementation SHMatch

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHMatch)initWithMediaItems:(id)a3 forSignature:(id)a4
{
  id v7;
  id v8;
  SHMatch *v9;
  SHMatch *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SHMatch;
  v9 = -[SHMatch init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaItems, a3);
    objc_storeStrong((id *)&v10->_querySignature, a4);
  }

  return v10;
}

- (BOOL)containsMediaItemWithFuzzyTolerance:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[SHMatch mediaItems](self, "mediaItems", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v10, "shazamID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "shazamID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToString:", v12))
          {

LABEL_15:
            v16 = 1;
            goto LABEL_16;
          }
          objc_msgSend(v10, "fuzzyRepresentation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "fuzzyRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v13, "isEqualToString:", v14);

          if ((v15 & 1) != 0)
            goto LABEL_15;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v16 = 0;
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v16 = 0;
    }
LABEL_16:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  SHSignature *querySignature;
  id v5;

  querySignature = self->_querySignature;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", querySignature, CFSTR("signature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaItems, CFSTR("mediaItems"));

}

- (SHMatch)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SHMatch *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("mediaItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SHMatch initWithMediaItems:forSignature:](self, "initWithMediaItems:forSignature:", v8, v9);
  return v10;
}

- (NSArray)mediaItems
{
  return self->_mediaItems;
}

- (SHSignature)querySignature
{
  return self->_querySignature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_querySignature, 0);
  objc_storeStrong((id *)&self->_mediaItems, 0);
}

@end
