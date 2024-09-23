@implementation LPiTunesMediaOffer

- (LPiTunesMediaOffer)initWithDictionary:(id)a3
{
  id v4;
  LPiTunesMediaOffer *v5;
  uint64_t v6;
  NSString *type;
  uint64_t v8;
  NSURL *previewURL;
  LPiTunesMediaOffer *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPiTunesMediaOffer;
  v5 = -[LPiTunesMediaOffer init](&v12, sel_init);
  if (v5
    && (+[LPiTunesMediaOffer typeForOffer:](LPiTunesMediaOffer, "typeForOffer:", v4),
        v6 = objc_claimAutoreleasedReturnValue(),
        type = v5->_type,
        v5->_type = (NSString *)v6,
        type,
        v5->_type))
  {
    +[LPiTunesMediaOffer previewURLForOffer:](LPiTunesMediaOffer, "previewURLForOffer:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    previewURL = v5->_previewURL;
    v5->_previewURL = (NSURL *)v8;

    v5->_hasAudio = +[LPiTunesMediaOffer hasAudioForOffer:](LPiTunesMediaOffer, "hasAudioForOffer:", v4);
    v5->_hasVideo = +[LPiTunesMediaOffer hasVideoForOffer:](LPiTunesMediaOffer, "hasVideoForOffer:", v4);
    v10 = v5;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)hasAudioForOffer:(id)a3
{
  return hasAssetWithFlavorContainingCaseInsensitiveString(a3, CFSTR("audio"));
}

+ (BOOL)hasVideoForOffer:(id)a3
{
  return hasAssetWithFlavorContainingCaseInsensitiveString(a3, CFSTR("video"));
}

+ (id)previewURLForOffer:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("assets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v3, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    v6 = 0;
    if (v5)
    {
      v7 = *(_QWORD *)v22;
      v8 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v10;
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("flavor"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = objc_msgSend(&unk_1E44F0210, "indexOfObject:", v12);
              if (v13 < v8)
              {
                v14 = v11;
                v15 = v6;
                v6 = v14;

                v8 = v13;
              }
            }

          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v5);
    }

    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("preview"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("url"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)typeForOffer:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (NSURL)previewURL
{
  return self->_previewURL;
}

- (NSString)type
{
  return self->_type;
}

- (BOOL)hasAudio
{
  return self->_hasAudio;
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_previewURL, 0);
}

@end
