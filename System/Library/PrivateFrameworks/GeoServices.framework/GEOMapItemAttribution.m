@implementation GEOMapItemAttribution

+ (GEOMapItemAttribution)attributionWithDataAttribution:(id)a3 searchInfo:(id)a4 class:(Class)a5
{
  id *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;

  v7 = (id *)a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    if (objc_msgSend(v8, "supportsActionURLs"))
    {
      v11 = [a5 alloc];
      -[GEOPDAttribution attributionUrls](v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDAttribution externalItemId](v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v11, "initWithSearchAttributionInfo:attributionURLs:poiID:", v9, v12, v13);
    }
    else
    {
      v15 = objc_msgSend(v7, "_isYelp");
      v16 = [a5 alloc];
      -[GEOPDAttribution attributionUrls](v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v10 = (void *)objc_msgSend(v16, "initWithSearchAttributionInfo:attributionURLs:", v9, v12);
        goto LABEL_9;
      }
      -[GEOPDAttribution externalItemId](v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v16, "initWithSearchAttributionInfo:attributionURLs:yelpID:", v9, v12, v13);
    }
    v10 = (void *)v14;

LABEL_9:
  }

  return (GEOMapItemAttribution *)v10;
}

- (GEOMapItemAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4
{
  id v7;
  id v8;
  GEOMapItemAttribution *v9;
  GEOMapItemAttribution *v10;
  uint64_t v11;
  NSArray *attributionURLs;
  GEOMapItemAttribution *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapItemAttribution;
  v9 = -[GEOMapItemAttribution init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_info, a3);
    v11 = objc_msgSend(v8, "copy");
    attributionURLs = v10->_attributionURLs;
    v10->_attributionURLs = (NSArray *)v11;

    v13 = v10;
  }

  return v10;
}

- (GEOMapItemAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 yelpID:(id)a5
{
  id v8;
  GEOMapItemAttribution *v9;
  uint64_t v10;
  NSString *yelpID;
  GEOMapItemAttribution *v12;

  v8 = a5;
  v9 = -[GEOMapItemAttribution initWithSearchAttributionInfo:attributionURLs:](self, "initWithSearchAttributionInfo:attributionURLs:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    yelpID = v9->_yelpID;
    v9->_yelpID = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

- (GEOMapItemAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 poiID:(id)a5
{
  id v8;
  GEOMapItemAttribution *v9;
  uint64_t v10;
  NSString *poiID;

  v8 = a5;
  v9 = -[GEOMapItemAttribution initWithSearchAttributionInfo:attributionURLs:](self, "initWithSearchAttributionInfo:attributionURLs:", a3, a4);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    poiID = v9->_poiID;
    v9->_poiID = (NSString *)v10;

  }
  return v9;
}

- (BOOL)shouldOpenInAppStore
{
  return -[GEOSearchAttributionInfo shouldOpenInAppStore](self->_info, "shouldOpenInAppStore");
}

- (NSString)providerName
{
  return -[GEOSearchAttributionInfo displayName](self->_info, "displayName");
}

- (NSString)providerID
{
  return -[GEOSearchAttributionInfo identifier](self->_info, "identifier");
}

- (NSString)captionDisplayName
{
  void *v3;
  uint64_t v4;

  -[GEOSearchAttributionInfo captionDisplayName](self->_info, "captionDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    -[GEOSearchAttributionInfo captionDisplayName](self->_info, "captionDisplayName");
  else
    -[GEOMapItemAttribution providerName](self, "providerName");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)attributionApps
{
  return -[GEOSearchAttributionInfo attributionApps](self->_info, "attributionApps");
}

- (NSString)webBaseActionURL
{
  return -[GEOSearchAttributionInfo webBaseActionURL](self->_info, "webBaseActionURL");
}

- (id)providerLogoPathForScale:(double)a3
{
  return -[GEOSearchAttributionInfo logoPathForScale:](self->_info, "logoPathForScale:", a3);
}

- (id)providerSnippetLogoPathForScale:(double)a3
{
  return -[GEOSearchAttributionInfo snippetLogoPathForScale:](self->_info, "snippetLogoPathForScale:", a3);
}

- (BOOL)requiresAttributionInCallout
{
  return -[GEOSearchAttributionInfo hasAttributionRequirement:](self->_info, "hasAttributionRequirement:", 5);
}

- (BOOL)requiresAttributionInDeveloperPlaceCard
{
  _BYTE *v2;
  BOOL v3;

  -[GEOSearchAttributionInfo source](self->_info, "source");
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[136] != 0;
  else
    v3 = 0;

  return v3;
}

- (NSString)appAdamID
{
  return -[GEOSearchAttributionInfo appAdamID](self->_info, "appAdamID");
}

- (id)_yelpHTTPURLForRequirement:(int)a3 withUID:(id)a4 writeAReview:(BOOL)a5
{
  id v8;
  GEOSearchAttributionInfo *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void **v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  BOOL v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = self->_info;
  if (!v9)
  {
    v17 = 0;
    goto LABEL_38;
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[GEOMapItemAttribution attributionURLs](self, "attributionURLs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (!v11)
  {
    v17 = 0;
    v18 = v10;
    goto LABEL_37;
  }
  v12 = v11;
  v45 = a5;
  v13 = v8;
  v14 = *(_QWORD *)v47;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v47 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
      if ((objc_msgSend(v16, "hasPrefix:", CFSTR("http://")) & 1) != 0
        || (objc_msgSend(v16, "hasPrefix:", CFSTR("https://")) & 1) != 0)
      {
        v19 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v16, "stringByAddingPercentEscapesUsingEncoding:", 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URLWithString:", v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
        {
          v17 = 0;
          v8 = v13;
          goto LABEL_38;
        }
        objc_msgSend(v18, "host");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v13;
        if (!v21)
          goto LABEL_35;
        objc_msgSend(v18, "scheme");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v22)
          goto LABEL_35;
        v23 = v22;
        if (v45)
        {

        }
        else
        {
          objc_msgSend(v18, "pathComponents");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "count");

          if (v25 < 3)
            goto LABEL_35;
        }
        if ((objc_msgSend(v21, "hasPrefix:", CFSTR("www.")) & 1) == 0)
        {
          objc_msgSend(CFSTR("www."), "stringByAppendingString:", v21);
          v26 = objc_claimAutoreleasedReturnValue();

          v21 = (void *)v26;
        }
        switch(a3)
        {
          case 1:
            goto LABEL_35;
          case 2:
            v34 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v18, "pathComponents");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v35;
            if (v45)
            {
              objc_msgSend(v35, "objectAtIndex:", 2);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "stringWithFormat:", CFSTR("writeareview/biz/%@"), v36);
              v30 = objc_claimAutoreleasedReturnValue();

              v37 = 0;
LABEL_32:

LABEL_33:
              if (v30 | v37)
              {
                v41 = objc_alloc_init(MEMORY[0x1E0CB3998]);
                objc_msgSend(v18, "scheme");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "setScheme:", v42);

                objc_msgSend(v41, "setHost:", v21);
                objc_msgSend(v41, "setPath:", v30);
                objc_msgSend(v41, "setQueryItems:", v37);
                objc_msgSend(v41, "URL");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "absoluteString");
                v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_36:
                goto LABEL_37;
              }
LABEL_35:
              objc_msgSend(v18, "absoluteString");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_36;
            }
            objc_msgSend(v35, "objectAtIndex:", 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "pathComponents");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "objectAtIndex:", 2);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "stringWithFormat:", CFSTR("%@/%@"), v38, v40);
            v30 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("hrid"), v8);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v31;
            v32 = (void *)MEMORY[0x1E0C99D20];
            v33 = &v50;
            break;
          case 3:
            v27 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v18, "pathComponents");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "objectAtIndex:", 2);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringWithFormat:", CFSTR("biz_photos/%@"), v29);
            v30 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("select"), v8);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v31;
            v32 = (void *)MEMORY[0x1E0C99D20];
            v33 = &v51;
            break;
          default:
            v30 = 0;
            v37 = 0;
            goto LABEL_33;
        }
        objc_msgSend(v32, "arrayWithObjects:count:", v33, 1);
        v37 = objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    if (v12)
      continue;
    break;
  }
  v17 = 0;
  v18 = v10;
  v8 = v13;
LABEL_37:

LABEL_38:
  return v17;
}

- (NSArray)attributionURLs
{
  return self->_attributionURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiID, 0);
  objc_storeStrong((id *)&self->_yelpID, 0);
  objc_storeStrong((id *)&self->_attributionURLs, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end
