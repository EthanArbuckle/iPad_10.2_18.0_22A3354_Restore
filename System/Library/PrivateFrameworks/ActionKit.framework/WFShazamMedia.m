@implementation WFShazamMedia

- (WFShazamMedia)initWithMediaItem:(id)a3
{
  id v4;
  WFShazamMedia *v5;
  void *v6;
  uint64_t v7;
  NSString *appleMusicID;
  void *v9;
  uint64_t v10;
  NSString *artist;
  void *v12;
  uint64_t v13;
  NSString *title;
  void *v15;
  uint64_t v16;
  NSURL *artworkURL;
  void *v18;
  uint64_t v19;
  NSURL *shazamURL;
  void *v21;
  uint64_t v22;
  NSURL *appleMusicURL;
  void *v24;
  uint64_t v25;
  NSURL *videoURL;
  void *v27;
  uint64_t v28;
  NSString *lyricsSnippet;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  NSString *lyricsSnippetSynced;
  WFShazamMedia *v38;
  objc_super v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)WFShazamMedia;
  v5 = -[WFShazamMedia init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "appleMusicID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    appleMusicID = v5->_appleMusicID;
    v5->_appleMusicID = (NSString *)v7;

    objc_msgSend(v4, "artist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    artist = v5->_artist;
    v5->_artist = (NSString *)v10;

    objc_msgSend(v4, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v13;

    objc_msgSend(v4, "artworkURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    artworkURL = v5->_artworkURL;
    v5->_artworkURL = (NSURL *)v16;

    objc_msgSend(v4, "webURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    shazamURL = v5->_shazamURL;
    v5->_shazamURL = (NSURL *)v19;

    objc_msgSend(v4, "appleMusicURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    appleMusicURL = v5->_appleMusicURL;
    v5->_appleMusicURL = (NSURL *)v22;

    v5->_isExplicit = objc_msgSend(v4, "explicitContent");
    objc_msgSend(v4, "videoURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    videoURL = v5->_videoURL;
    v5->_videoURL = (NSURL *)v25;

    objc_msgSend(v4, "lyricsSnippet");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "copy");
    lyricsSnippet = v5->_lyricsSnippet;
    v5->_lyricsSnippet = (NSString *)v28;

    v30 = v4;
    if (v30)
    {
      v42 = 0;
      v43 = &v42;
      v44 = 0x2050000000;
      v31 = (void *)getSHMatchedMediaItemClass_softClass;
      v45 = getSHMatchedMediaItemClass_softClass;
      if (!getSHMatchedMediaItemClass_softClass)
      {
        v41[0] = MEMORY[0x24BDAC760];
        v41[1] = 3221225472;
        v41[2] = __getSHMatchedMediaItemClass_block_invoke;
        v41[3] = &unk_24F8BB430;
        v41[4] = &v42;
        __getSHMatchedMediaItemClass_block_invoke((uint64_t)v41);
        v31 = (void *)v43[3];
      }
      v32 = objc_retainAutorelease(v31);
      _Block_object_dispose(&v42, 8);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v33 = v30;
      else
        v33 = 0;
    }
    else
    {
      v33 = 0;
    }
    v34 = v33;

    objc_msgSend(v34, "syncedLyricsSnippet");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_msgSend(v35, "copy");
    lyricsSnippetSynced = v5->_lyricsSnippetSynced;
    v5->_lyricsSnippetSynced = (NSString *)v36;

    v38 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShazamMedia wfName](self, "wfName");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("match undefined");
  if (v6)
    v8 = (const __CFString *)v6;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, name: %@>"), v5, self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)wfName
{
  NSString *artist;
  NSString *title;
  void *v4;

  artist = self->_artist;
  title = self->_title;
  if (title)
  {
    if (!artist)
      return title;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %@"), artist, title);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (artist)
      return artist;
    v4 = 0;
  }
  return (NSString *)v4;
}

- (WFShazamMedia)initWithCoder:(id)a3
{
  id v4;
  WFShazamMedia *v5;
  uint64_t v6;
  NSString *appleMusicID;
  uint64_t v8;
  NSString *artist;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSURL *artworkURL;
  uint64_t v14;
  NSURL *shazamURL;
  uint64_t v16;
  NSURL *appleMusicURL;
  uint64_t v18;
  NSURL *videoURL;
  uint64_t v20;
  NSString *lyricsSnippet;
  uint64_t v22;
  NSString *lyricsSnippetSynced;

  v4 = a3;
  v5 = -[WFShazamMedia init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleMusicID"));
  v6 = objc_claimAutoreleasedReturnValue();
  appleMusicID = v5->_appleMusicID;
  v5->_appleMusicID = (NSString *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artist"));
  v8 = objc_claimAutoreleasedReturnValue();
  artist = v5->_artist;
  v5->_artist = (NSString *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v10 = objc_claimAutoreleasedReturnValue();
  title = v5->_title;
  v5->_title = (NSString *)v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("artworkURL"));
  v12 = objc_claimAutoreleasedReturnValue();
  artworkURL = v5->_artworkURL;
  v5->_artworkURL = (NSURL *)v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shazamURL"));
  v14 = objc_claimAutoreleasedReturnValue();
  shazamURL = v5->_shazamURL;
  v5->_shazamURL = (NSURL *)v14;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appleMusicURL"));
  v16 = objc_claimAutoreleasedReturnValue();
  appleMusicURL = v5->_appleMusicURL;
  v5->_appleMusicURL = (NSURL *)v16;

  v5->_isExplicit = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isExplicit"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("videoURL"));
  v18 = objc_claimAutoreleasedReturnValue();
  videoURL = v5->_videoURL;
  v5->_videoURL = (NSURL *)v18;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lyricsSnippet"));
  v20 = objc_claimAutoreleasedReturnValue();
  lyricsSnippet = v5->_lyricsSnippet;
  v5->_lyricsSnippet = (NSString *)v20;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lyricsSnippetSynced"));
  v22 = objc_claimAutoreleasedReturnValue();

  lyricsSnippetSynced = v5->_lyricsSnippetSynced;
  v5->_lyricsSnippetSynced = (NSString *)v22;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *appleMusicID;
  id v5;

  appleMusicID = self->_appleMusicID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appleMusicID, CFSTR("appleMusicID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artist, CFSTR("artist"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_artworkURL, CFSTR("artworkURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shazamURL, CFSTR("shazamURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appleMusicURL, CFSTR("appleMusicURL"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isExplicit, CFSTR("isExplicit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_videoURL, CFSTR("videoURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lyricsSnippet, CFSTR("lyricsSnippet"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lyricsSnippetSynced, CFSTR("lyricsSnippetSynced"));

}

- (NSString)appleMusicID
{
  return self->_appleMusicID;
}

- (NSString)artist
{
  return self->_artist;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (NSURL)shazamURL
{
  return self->_shazamURL;
}

- (NSURL)appleMusicURL
{
  return self->_appleMusicURL;
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (NSString)lyricsSnippet
{
  return self->_lyricsSnippet;
}

- (NSString)lyricsSnippetSynced
{
  return self->_lyricsSnippetSynced;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricsSnippetSynced, 0);
  objc_storeStrong((id *)&self->_lyricsSnippet, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_appleMusicURL, 0);
  objc_storeStrong((id *)&self->_shazamURL, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_appleMusicID, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
