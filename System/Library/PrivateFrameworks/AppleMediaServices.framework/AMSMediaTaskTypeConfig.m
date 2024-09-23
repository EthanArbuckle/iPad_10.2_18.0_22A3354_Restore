@implementation AMSMediaTaskTypeConfig

- (AMSMediaTaskTypeConfig)initWithType:(int64_t)a3 typeString:(id)a4 hostBagKey:(id)a5 realm:(id)a6 includePlatform:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  AMSMediaTaskTypeConfig *v16;
  AMSMediaTaskTypeConfig *v17;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)AMSMediaTaskTypeConfig;
  v16 = -[AMSMediaTaskTypeConfig init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    objc_storeStrong((id *)&v16->_typeString, a4);
    objc_storeStrong((id *)&v17->_hostBagKey, a5);
    objc_storeStrong((id *)&v17->_realm, a6);
    v17->_includePlatform = a7;
  }

  return v17;
}

+ (id)configForType:(int64_t)a3
{
  AMSMediaTaskTypeConfig *v3;
  __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 <= 199)
  {
    switch(a3)
    {
      case 0:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("apps-media-api-host");
        v5 = CFSTR("apps");
        v6 = CFSTR("catalog");
        v7 = 0;
        goto LABEL_26;
      case 1:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("apps-media-api-host");
        v5 = CFSTR("app-bundles");
        v6 = CFSTR("catalog");
        v7 = 1;
        goto LABEL_26;
      case 2:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("apps-media-api-host");
        v5 = CFSTR("in-apps");
        v6 = CFSTR("catalog");
        v7 = 2;
        goto LABEL_26;
      case 3:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("apps-media-api-host");
        v5 = CFSTR("arcade-apps");
        v6 = CFSTR("catalog");
        v7 = 3;
        goto LABEL_26;
      case 4:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("apps-media-api-edge-host");
        v5 = CFSTR("personal-recommendations");
        v6 = CFSTR("recommendations");
        v7 = 4;
        goto LABEL_26;
      case 5:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("apps-media-api-host");
        v5 = CFSTR("editorial-items");
        v6 = CFSTR("editorial");
        v7 = 5;
        goto LABEL_26;
      case 6:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("apps-media-api-host");
        v5 = CFSTR("contingent-items");
        v6 = CFSTR("catalog");
        v7 = 6;
        goto LABEL_26;
      case 7:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("app-distribution-media-api-host");
        v5 = CFSTR("apps");
        v6 = CFSTR("listing");
        v7 = 7;
        goto LABEL_26;
      case 8:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("games-media-api-host");
        v5 = CFSTR("games");
        v6 = CFSTR("catalog");
        v7 = 8;
LABEL_26:
        v8 = 1;
        goto LABEL_43;
      default:
        switch(a3)
        {
          case 'd':
            v3 = [AMSMediaTaskTypeConfig alloc];
            v4 = CFSTR("books-media-api-host");
            v5 = CFSTR("audio-books");
            v6 = CFSTR("catalog");
            v7 = 100;
            goto LABEL_42;
          case 'e':
            v3 = [AMSMediaTaskTypeConfig alloc];
            v4 = CFSTR("books-media-api-host");
            v5 = CFSTR("books");
            v6 = CFSTR("catalog");
            v7 = 101;
            goto LABEL_42;
          case 'f':
            v3 = [AMSMediaTaskTypeConfig alloc];
            v4 = CFSTR("books-media-api-host");
            v5 = CFSTR("book-series");
            v6 = CFSTR("catalog");
            v7 = 102;
            goto LABEL_42;
          case 'g':
            v3 = [AMSMediaTaskTypeConfig alloc];
            v4 = CFSTR("books-media-api-host");
            v5 = CFSTR("authors");
            v6 = CFSTR("catalog");
            v7 = 103;
            goto LABEL_42;
          case 'h':
            v3 = [AMSMediaTaskTypeConfig alloc];
            v4 = CFSTR("books-media-api-host");
            v5 = CFSTR("audio-book-series");
            v6 = CFSTR("catalog");
            v7 = 104;
            goto LABEL_42;
          default:
            return a1;
        }
        return a1;
    }
  }
  if (a3 > 299)
  {
    if (a3 > 399)
    {
      switch(a3)
      {
        case 400:
          v3 = [AMSMediaTaskTypeConfig alloc];
          v4 = CFSTR("fit-media-api-host");
          v5 = CFSTR("contributors");
          v6 = CFSTR("catalog");
          v7 = 400;
          break;
        case 401:
          v3 = [AMSMediaTaskTypeConfig alloc];
          v4 = CFSTR("fit-media-api-host");
          v5 = CFSTR("modalities");
          v6 = CFSTR("catalog");
          v7 = 401;
          break;
        case 402:
          v3 = [AMSMediaTaskTypeConfig alloc];
          v4 = CFSTR("fit-media-api-host");
          v5 = CFSTR("workouts");
          v6 = CFSTR("catalog");
          v7 = 402;
          break;
        default:
          return a1;
      }
    }
    else
    {
      switch(a3)
      {
        case 300:
          v3 = [AMSMediaTaskTypeConfig alloc];
          v4 = CFSTR("podcasts-media-api-host");
          v5 = CFSTR("podcasts");
          v6 = CFSTR("catalog");
          v7 = 300;
          break;
        case 301:
          v3 = [AMSMediaTaskTypeConfig alloc];
          v4 = CFSTR("podcasts-media-api-host");
          v5 = CFSTR("podcast-episodes");
          v6 = CFSTR("catalog");
          v7 = 301;
          break;
        case 302:
          v3 = [AMSMediaTaskTypeConfig alloc];
          v4 = CFSTR("podcasts-media-api-host");
          v5 = CFSTR("podcast-channels");
          v6 = CFSTR("catalog");
          v7 = 302;
          break;
        default:
          return a1;
      }
    }
LABEL_42:
    v8 = 0;
LABEL_43:
    a1 = -[AMSMediaTaskTypeConfig initWithType:typeString:hostBagKey:realm:includePlatform:](v3, "initWithType:typeString:hostBagKey:realm:includePlatform:", v7, v5, v4, v6, v8);
  }
  else
  {
    switch(a3)
    {
      case 200:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("music-media-api-host");
        v5 = CFSTR("albums");
        v6 = CFSTR("catalog");
        v7 = 200;
        goto LABEL_42;
      case 201:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("music-media-api-host");
        v5 = CFSTR("music-videos");
        v6 = CFSTR("catalog");
        v7 = 201;
        goto LABEL_42;
      case 202:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("music-media-api-host");
        v5 = CFSTR("playlists");
        v6 = CFSTR("catalog");
        v7 = 202;
        goto LABEL_42;
      case 203:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("music-media-api-host");
        v5 = CFSTR("songs");
        v6 = CFSTR("catalog");
        v7 = 203;
        goto LABEL_42;
      case 204:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("music-media-api-host");
        v5 = CFSTR("stations");
        v6 = CFSTR("catalog");
        v7 = 204;
        goto LABEL_42;
      case 205:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("music-media-api-host");
        v5 = CFSTR("artists");
        v6 = CFSTR("catalog");
        v7 = 205;
        goto LABEL_42;
      case 206:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("music-media-api-host");
        v5 = CFSTR("apple-curators");
        v6 = CFSTR("catalog");
        v7 = 206;
        goto LABEL_42;
      case 207:
        v3 = [AMSMediaTaskTypeConfig alloc];
        v4 = CFSTR("music-media-api-host");
        v5 = CFSTR("uploaded-videos");
        v6 = CFSTR("catalog");
        v7 = 207;
        goto LABEL_42;
      default:
        return a1;
    }
  }
  return a1;
}

- (NSString)hostBagKey
{
  return self->_hostBagKey;
}

- (BOOL)includePlatform
{
  return self->_includePlatform;
}

- (NSString)realm
{
  return self->_realm;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)typeString
{
  return self->_typeString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_hostBagKey, 0);
}

@end
