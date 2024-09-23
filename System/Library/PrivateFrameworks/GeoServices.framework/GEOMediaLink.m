@implementation GEOMediaLink

+ (id)mediaLinkFromProto:(id)a3
{
  id v3;
  uint64_t v4;
  _BOOL4 v5;
  unsigned int v6;
  int v7;
  int v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  GEOMediaLink *v16;
  uint64_t v17;
  GEOMediaLink *v18;
  NSObject *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (uint64_t)v3;
  if (v3)
  {
    -[GEOPDMediaLink _readAdamId]((uint64_t)v3);
    if (*(_QWORD *)(v4 + 24))
    {
      v5 = 1;
    }
    else
    {
      -[GEOPDMediaLink _readSubId](v4);
      v5 = *(_QWORD *)(v4 + 40) != 0;
    }
    v6 = *(unsigned __int8 *)(v4 + 76);
    v7 = (v6 >> 1) & 1;
    v8 = v6 & 1;
    if (v5 && (v6 & 2) != 0 && v8 != 0)
    {
      -[GEOPDMediaLink thirdPartyLinks]((id *)v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_geo_compactMap:", &__block_literal_global_79);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[GEOPDMediaLink _readSubId](v4);
      if (*(_QWORD *)(v4 + 40))
        -[GEOPDMediaLink subId]((id *)v4);
      else
        -[GEOPDMediaLink adamId]((id *)v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDMediaLink _readMediaLinkPositionMetaData](v4);
      if (!*(_QWORD *)(v4 + 32))
      {
        v15 = 0;
        v14 = 1;
        goto LABEL_23;
      }
      -[GEOPDMediaLink mediaLinkPositionMetaData]((id *)v4);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v14 = 0;
        v15 = 0;
        goto LABEL_21;
      }
      if ((*(_BYTE *)(v13 + 24) & 2) != 0)
      {
        v14 = *(unsigned int *)(v13 + 20);
        if (v14 < 2)
        {
LABEL_20:
          v15 = *(int *)(v13 + 16);
LABEL_21:

LABEL_23:
          v16 = [GEOMediaLink alloc];
          v17 = -[GEOPDMediaLink mediaType](v4);
          v18 = -[GEOMediaLink initWithAdamID:mediaType:mediaSubType:thirdPartyLinks:relatedCollectionItemIndex:position:](v16, "initWithAdamID:mediaType:mediaSubType:thirdPartyLinks:relatedCollectionItemIndex:position:", v12, v17, -[GEOPDMediaLink mediaSubType](v4), v11, v15, v14);

          goto LABEL_36;
        }
        if ((_DWORD)v14 == 2)
        {
          v14 = 2;
          goto LABEL_20;
        }
      }
      v14 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    v8 = 0;
    v5 = 0;
    v7 = 0;
  }
  GEOGetCuratedCollectionsLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = "NO";
    if (v5)
      v21 = "YES";
    else
      v21 = "NO";
    if (v7)
      v22 = "YES";
    else
      v22 = "NO";
    v24 = 136315650;
    v25 = v21;
    v26 = 2080;
    v27 = v22;
    if (v8)
      v20 = "YES";
    v28 = 2080;
    v29 = v20;
    _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "Media Link could not be initialized because some data is missing.\nMedia Link hasAdamID: %s, hasMediaType: %s, hasMediaSubType: %s", (uint8_t *)&v24, 0x20u);
  }

  v18 = 0;
LABEL_36:

  return v18;
}

id __35__GEOMediaLink_mediaLinkFromProto___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[GEOThirdPartyLink thirdPartyLinkFromProto:](GEOThirdPartyLink, "thirdPartyLinkFromProto:", a2);
}

- (GEOMediaLink)initWithAdamID:(id)a3 mediaType:(int)a4 mediaSubType:(int)a5 thirdPartyLinks:(id)a6 relatedCollectionItemIndex:(int64_t)a7 position:(unint64_t)a8
{
  id v14;
  id v15;
  GEOMediaLink *v16;
  uint64_t v17;
  NSString *adamID;
  uint64_t v19;
  NSArray *thirdPartyLinks;
  objc_super v22;

  v14 = a3;
  v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)GEOMediaLink;
  v16 = -[GEOMediaLink init](&v22, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    adamID = v16->_adamID;
    v16->_adamID = (NSString *)v17;

    v16->_mediaType = a4;
    v16->_mediaSubType = a5;
    v19 = objc_msgSend(v15, "copy");
    thirdPartyLinks = v16->_thirdPartyLinks;
    v16->_thirdPartyLinks = (NSArray *)v19;

    v16->_relatedCollectionItemIndex = a7;
    v16->_position = a8;
  }

  return v16;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (int)mediaSubType
{
  return self->_mediaSubType;
}

- (NSArray)thirdPartyLinks
{
  return self->_thirdPartyLinks;
}

- (int64_t)relatedCollectionItemIndex
{
  return self->_relatedCollectionItemIndex;
}

- (unint64_t)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thirdPartyLinks, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end
