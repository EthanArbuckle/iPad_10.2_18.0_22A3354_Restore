@implementation MSVLyricsTTMLParser

- (MSVLyricsTTMLParser)initWithTTMLData:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  MSVLyricsTTMLParser *v7;

  v4 = (objc_class *)MEMORY[0x1E0C99DB0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithData:", v5);

  v7 = -[MSVLyricsTTMLParser initWithTTMLStream:](self, "initWithTTMLStream:", v6);
  return v7;
}

- (MSVLyricsTTMLParser)initWithTTMLStream:(id)a3
{
  id v5;
  MSVLyricsTTMLParser *v6;
  MSVLyricsTTMLParser *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *parseQueue;
  uint64_t v11;
  NSMutableArray *elementStack;
  uint64_t v13;
  NSMutableArray *lyricLines;
  uint64_t v15;
  NSMutableArray *agents;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MSVLyricsTTMLParser;
  v6 = -[MSVLyricsTTMLParser init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inputStream, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.MediaServices.MSVLyricsTTMLParser", v8);
    parseQueue = v7->_parseQueue;
    v7->_parseQueue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
    v11 = objc_claimAutoreleasedReturnValue();
    elementStack = v7->_elementStack;
    v7->_elementStack = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 100);
    v13 = objc_claimAutoreleasedReturnValue();
    lyricLines = v7->_lyricLines;
    v7->_lyricLines = (NSMutableArray *)v13;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v15 = objc_claimAutoreleasedReturnValue();
    agents = v7->_agents;
    v7->_agents = (NSMutableArray *)v15;

  }
  return v7;
}

- (id)parseWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[MSVLyricsTTMLParser setLinesAreSortedByStartTime:](self, "setLinesAreSortedByStartTime:", 1);
  -[MSVLyricsTTMLParser setCurrentStartTime:](self, "setCurrentStartTime:", 0.0);
  -[MSVLyricsTTMLParser elementStack](self, "elementStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[MSVLyricsTTMLParser lyricLines](self, "lyricLines");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  v7 = objc_alloc(MEMORY[0x1E0CB3B28]);
  -[MSVLyricsTTMLParser inputStream](self, "inputStream");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithStream:", v8);

  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "setShouldProcessNamespaces:", 1);
  objc_msgSend(v9, "parse");
  -[MSVLyricsTTMLParser translationsMap](self, "translationsMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MSVLyricsTTMLParser translationsMap](self, "translationsMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTranslationsMap:", v11);

  }
  if (a3)
  {
    -[MSVLyricsTTMLParser parserError](self, "parserError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[MSVLyricsTTMLParser parserError](self, "parserError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)parseWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MSVLyricsTTMLParser parseQueue](self, "parseQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__MSVLyricsTTMLParser_parseWithCompletion___block_invoke;
  v7[3] = &unk_1E43E9EF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  MSVLyricsTTMLParser *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  char isKindOfClass;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  char v64;
  NSObject *v65;
  const char *v66;
  NSObject *v67;
  void *v68;
  char v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  char v84;
  NSObject *v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  int v96;
  NSObject *v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  char v102;
  NSObject *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  int v108;
  void *v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  id v116;
  _QWORD v117[4];
  id v118;
  uint8_t buf[4];
  id v120;
  __int16 v121;
  id v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a7;
  -[MSVLyricsTTMLParser elementStack](self, "elementStack");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "msvl_isElementType:", CFSTR("span")))
  {
    v14 = (void *)objc_opt_new();
    -[MSVLyricsTTMLParser _parentTextElement](self, "_parentTextElement");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "type") == 1 || objc_msgSend(v15, "type") == 3)
    {
      objc_msgSend(v14, "setParentLine:", v15);
    }
    else
    {
      if (objc_msgSend(v15, "type") == 2)
      {
        v17 = v15;
        objc_msgSend(v14, "setParentWord:", v17);
        objc_msgSend(v17, "parentLine");
        v18 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "setParentLine:", v18);
      }
      else
      {
        v18 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A077D000, v18, OS_LOG_TYPE_DEFAULT, "Warning: <span> must be a descendent of <p> or <span>.", buf, 2u);
        }
      }

    }
    goto LABEL_20;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", CFSTR("p")))
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("itunes:key"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslationKey:", v16);
LABEL_10:

LABEL_20:
    v24 = 0;
    goto LABEL_21;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", CFSTR("div")))
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("itunes:songPart"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v14, "setSongPartText:", v16);
    goto LABEL_10;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", CFSTR("body")))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dur"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "msvl_timeValue");
      v22 = v21;
      -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setSongDuration:", v22);

LABEL_80:
      goto LABEL_81;
    }
    v67 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A077D000, v67, OS_LOG_TYPE_DEFAULT, "Warning: Document body element must specify song duration", buf, 2u);
    }
LABEL_79:

    goto LABEL_80;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", CFSTR("tt")))
  {
    v52 = (void *)objc_opt_new();
    -[MSVLyricsTTMLParser setLyricsInfo:](self, "setLyricsInfo:", v52);

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("itunes:lyricGenId"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setLyricGenId:", v53);

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("xml:lang"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setLanguage:", v55);

    -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "songwriters");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v58)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVLyricsTTMLParser.m"), 209, CFSTR("songwriters array must not be nil"));

    }
    -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "lyricsSections");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v60)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVLyricsTTMLParser.m"), 210, CFSTR("lyricsSections array must not be nil"));

    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("itunes:timing"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v61;
    if (v61)
    {
      if (objc_msgSend(v61, "caseInsensitiveCompare:", CFSTR("line")))
        v62 = 2 * (objc_msgSend(v20, "caseInsensitiveCompare:", CFSTR("word")) == 0);
      else
        v62 = 1;
    }
    else
    {
      v62 = 0;
    }
    -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
    v67 = objc_claimAutoreleasedReturnValue();
    -[NSObject setType:](v67, "setType:", v62);
    goto LABEL_79;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", CFSTR("songwriters")))
  {
    objc_msgSend(v13, "elementName");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "msvl_isElementType:", CFSTR("iTunesMetadata"));

    if ((v64 & 1) == 0)
    {
      _MSVLogCategoryLyricsTTMLParser();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v66 = "Warning: <songwriters> element should be inside <iTunesMetadata>";
LABEL_102:
        _os_log_impl(&dword_1A077D000, v65, OS_LOG_TYPE_DEFAULT, v66, buf, 2u);
        goto LABEL_103;
      }
      goto LABEL_103;
    }
LABEL_81:
    v14 = 0;
    goto LABEL_20;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", CFSTR("audio")))
  {
    objc_msgSend(v13, "elementName");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "msvl_isElementType:", CFSTR("iTunesMetadata"));

    if ((v69 & 1) == 0)
    {
      _MSVLogCategoryLyricsTTMLParser();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A077D000, v70, OS_LOG_TYPE_DEFAULT, "Warning: <audio> element should be inside <iTunesMetadata>", buf, 2u);
      }

    }
    v20 = (void *)objc_opt_new();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("lyricOffset"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v71;
    if (v71)
    {
      objc_msgSend(v71, "msvl_timeValue");
      objc_msgSend(v20, "setLyricsOffset:");
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("role"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setRole:", v73);

    objc_msgSend(v20, "role");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSpatialRole:", objc_msgSend(v74, "isEqualToString:", CFSTR("spatial")));

    -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setAudioAttributes:", v20);

    goto LABEL_80;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", CFSTR("songwriter")))
  {
    objc_msgSend(v13, "elementName");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v76, "msvl_isElementType:", CFSTR("songwriters"));

    if (!v77)
    {
      _MSVLogCategoryLyricsTTMLParser();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v66 = "Warning: <songwriter> element must be inside <songwriters>";
        goto LABEL_102;
      }
LABEL_103:

      goto LABEL_81;
    }
    v24 = (id)objc_opt_new();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("artistId"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setArtistID:", v78);

    -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "songwriters");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "arrayByAddingObject:", v24);
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setSongwriters:", v81);

    goto LABEL_75;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", CFSTR("translations")))
  {
    objc_msgSend(v13, "elementName");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v83, "msvl_isElementType:", CFSTR("iTunesMetadata"));

    if ((v84 & 1) == 0)
    {
      _MSVLogCategoryLyricsTTMLParser();
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A077D000, v85, OS_LOG_TYPE_DEFAULT, "Warning: <translations> element should be inside <iTunesMetadata>", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSVLyricsTTMLParser setTranslationsMap:](self, "setTranslationsMap:", v86);

    goto LABEL_81;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", CFSTR("translation")))
  {
    objc_msgSend(v13, "elementName");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "msvl_isElementType:", CFSTR("translations"));

    if (!v88)
    {
      _MSVLogCategoryLyricsTTMLParser();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v66 = "Warning: <translation> element must be inside <translations>";
        goto LABEL_102;
      }
      goto LABEL_103;
    }
    -[MSVLyricsTTMLParser translationsMap](self, "translationsMap");
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v89)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVLyricsTTMLParser.m"), 265, CFSTR("<translation> end element expects translationsMap to be set by start of <translations> element"));

    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("xml:lang"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (v90)
    {
      v24 = (id)objc_opt_new();
      objc_msgSend(v24, "setLanguage:", v90);
      -[MSVLyricsTTMLParser translationsMap](self, "translationsMap");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "objectForKeyedSubscript:", v90);
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v92)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        -[MSVLyricsTTMLParser translationsMap](self, "translationsMap");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "setObject:forKeyedSubscript:", v93, v90);

      }
    }
    else
    {
      _MSVLogCategoryLyricsTTMLParser();
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A077D000, v106, OS_LOG_TYPE_DEFAULT, "<translation> element must specify a language with <xml:lang> attribute", buf, 2u);
      }

      v24 = 0;
    }

    goto LABEL_76;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", CFSTR("text")))
  {
    objc_msgSend(v13, "elementName");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "msvl_isElementType:", CFSTR("translation"));

    if (v96)
    {
      v14 = (void *)objc_opt_new();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("for"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLyricsLineKey:", v16);
      goto LABEL_10;
    }
    goto LABEL_81;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", CFSTR("iTunesMetadata")))
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("leadingSilence"));
    v97 = objc_claimAutoreleasedReturnValue();
    v65 = v97;
    if (v97)
    {
      -[NSObject msvl_timeValue](v97, "msvl_timeValue");
      v99 = v98;
      -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "setLeadingSilence:", v99);

    }
    goto LABEL_103;
  }
  if (objc_msgSend(v10, "msvl_isElementType:", CFSTR("agent")))
  {
    objc_msgSend(v13, "elementName");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v101, "msvl_isElementType:", CFSTR("metadata"));

    if ((v102 & 1) == 0)
    {
      _MSVLogCategoryLyricsTTMLParser();
      v103 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A077D000, v103, OS_LOG_TYPE_DEFAULT, "Warning: <ttm:agent> element should be inside <metadata>", buf, 2u);
      }

    }
    v24 = (id)objc_opt_new();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("type"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setType:", v104);

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("itunes:artistId"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setArtistID:", v105);

    -[MSVLyricsTTMLParser agents](self, "agents");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addObject:", v24);
LABEL_75:

LABEL_76:
    v14 = 0;
    goto LABEL_21;
  }
  if (!objc_msgSend(v10, "msvl_isElementType:", CFSTR("name")))
    goto LABEL_81;
  objc_msgSend(v13, "elementName");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = objc_msgSend(v107, "msvl_isElementType:", CFSTR("agent"));

  if (v108)
  {
    v24 = (id)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMutableText:", v109);

    v14 = 0;
  }
  else
  {
    _MSVLogCategoryLyricsTTMLParser();
    v110 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A077D000, v110, OS_LOG_TYPE_DEFAULT, "<ttm:name> element should be inside <ttm:agent>", buf, 2u);
    }

    v14 = 0;
    v24 = 0;
  }
LABEL_21:
  -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    if (v14)
    {
LABEL_23:
      v115 = v13;
      v26 = v14;

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("begin"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        objc_msgSend(v27, "msvl_timeValue");
        objc_msgSend(v26, "setStartTime:");
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("end"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        objc_msgSend(v29, "msvl_timeValue");
        objc_msgSend(v26, "setEndTime:");
      }
      objc_msgSend(v26, "endTime");
      if (v31 != 0.0)
      {
        objc_msgSend(v26, "startTime");
        v33 = v32;
        -[MSVLyricsTTMLParser currentStartTime](self, "currentStartTime");
        if (v33 < v34)
          -[MSVLyricsTTMLParser setLinesAreSortedByStartTime:](self, "setLinesAreSortedByStartTime:", 0);
        objc_msgSend(v26, "startTime");
        -[MSVLyricsTTMLParser setCurrentStartTime:](self, "setCurrentStartTime:");
      }
      v116 = v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[MSVLyricsTTMLParser setCurrentTextElement:](self, "setCurrentTextElement:", v26);
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ttm:agent"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v114 = v11;
        -[MSVLyricsTTMLParser agents](self, "agents");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v117[0] = MEMORY[0x1E0C809B0];
        v117[1] = 3221225472;
        v117[2] = __84__MSVLyricsTTMLParser_parser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke;
        v117[3] = &unk_1E43E8630;
        v37 = v35;
        v118 = v37;
        v38 = objc_msgSend(v36, "indexOfObjectPassingTest:", v117);

        if (v38 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v39 = self;
          v40 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v120 = v37;
            v121 = 2112;
            v122 = v26;
            _os_log_impl(&dword_1A077D000, v40, OS_LOG_TYPE_DEFAULT, "No agent exists for identifier \"%@\" in element: %@", buf, 0x16u);
          }
        }
        else
        {
          v39 = self;
          -[MSVLyricsTTMLParser agents](self, "agents");
          v40 = objc_claimAutoreleasedReturnValue();
          -[NSObject objectAtIndexedSubscript:](v40, "objectAtIndexedSubscript:", v38);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setAgent:", v42);

        }
        v11 = v114;
        self = v39;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ttm:role"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setRole:", v43);

      objc_msgSend(v26, "role");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setIsBackgroundVocal:", objc_msgSend(v44, "isEqualToString:", CFSTR("x-bg")));

      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("itunes:parenthesis"));
      v45 = objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        v46 = (void *)v45;
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("itunes:parenthesis"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("keep"));

          objc_msgSend(v26, "setKeepParentheses:", v49);
        }
      }

      v13 = v115;
      v10 = v116;
      goto LABEL_48;
    }
  }
  else
  {
    v41 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A077D000, v41, OS_LOG_TYPE_ERROR, "PARSE ERROR: Top-level element must be <tt> for TTML documents", buf, 2u);
    }

    if (v14)
      goto LABEL_23;
  }
  v26 = v24;
  if (!v24)
    v26 = (id)objc_opt_new();
LABEL_48:
  objc_msgSend(v26, "setElementName:", v10);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("xml:id"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setIdentifier:", v50);

  -[MSVLyricsTTMLParser elementStack](self, "elementStack");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObject:", v26);

}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char isKindOfClass;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  void *v96;
  void *v97;
  NSObject *log;
  void *v99;
  NSObject *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint8_t buf[4];
  uint64_t v108;
  __int16 v109;
  id v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  -[MSVLyricsTTMLParser elementStack](self, "elementStack");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;
  objc_msgSend(v12, "elementName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v10, "caseInsensitiveCompare:", v15);

  if (!v16)
  {
    -[MSVLyricsTTMLParser elementStack](self, "elementStack");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeLastObject");

    -[MSVLyricsTTMLParser elementStack](self, "elementStack");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lastObject");
    v17 = objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "msvl_isElementType:", CFSTR("body")))
    {
      -[MSVLyricsTTMLParser lyricLines](self, "lyricLines");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSVLyricsTTMLParser _translatedLyrics:forLanguage:](self, "_translatedLyrics:forLanguage:", v25, v27);
      v28 = objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v29 = v28;
      }
      else
      {
        -[MSVLyricsTTMLParser lyricLines](self, "lyricLines");
        v29 = objc_claimAutoreleasedReturnValue();
      }
      v31 = v29;
      if (-[MSVLyricsTTMLParser linesAreSortedByStartTime](self, "linesAreSortedByStartTime"))
      {
        -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setLyricsLinesSortedByStartTime:", v31);
      }
      else
      {
        v33 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A077D000, v33, OS_LOG_TYPE_DEFAULT, "Lyrics lines are out of order: they should be ordered by start time", buf, 2u);
        }

        -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setLyricsLines:", v31);
      }

      -[MSVLyricsTTMLParser agents](self, "agents");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v34, "copy");
      -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setAgents:", v35);

      goto LABEL_22;
    }
    if ((objc_msgSend(v10, "msvl_isElementType:", CFSTR("tt")) & 1) != 0)
      goto LABEL_23;
    if (objc_msgSend(v10, "msvl_isElementType:", CFSTR("songwriter")))
    {
      v18 = v12;
      -[NSObject mutableText](v18, "mutableText");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setName:](v18, "setName:", v30);

      -[NSObject setMutableText:](v18, "setMutableText:", 0);
      goto LABEL_8;
    }
    if (!v14)
    {
      if (!objc_msgSend(v10, "msvl_isElementType:", CFSTR("name")))
        goto LABEL_23;
      -[NSObject elementName](v17, "elementName");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "msvl_isElementType:", CFSTR("agent"));

      if (!v50)
      {
        _MSVLogCategoryLyricsTTMLParser();
        v18 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_8;
        *(_WORD *)buf = 0;
        v19 = "Element ignored: <ttm:name> element must be inside <ttm:agent>";
        v20 = v18;
        v21 = OS_LOG_TYPE_DEFAULT;
        v22 = 2;
        goto LABEL_7;
      }
      -[MSVLyricsTTMLParser agents](self, "agents");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "lastObject");
      v28 = objc_claimAutoreleasedReturnValue();

      if (v28 != v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVLyricsTTMLParser.m"), 530, CFSTR("Unexpected agent element"));

      }
      objc_msgSend(v12, "mutableText");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setName:](v28, "setName:", v52);

      objc_msgSend(v12, "setMutableText:", 0);
LABEL_22:

      goto LABEL_23;
    }
    -[MSVLyricsTTMLParser _parentTextElement](self, "_parentTextElement");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v37;
    if (objc_msgSend(v14, "type"))
    {
      if (objc_msgSend(v14, "type") == 1 || objc_msgSend(v14, "type") == 3)
      {
        v38 = v14;
        -[MSVLyricsTTMLParser lyricLines](self, "lyricLines");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setLineIndex:", objc_msgSend(v39, "count"));

        objc_msgSend(v38, "setOriginalLineIndex:", objc_msgSend(v38, "lineIndex"));
        -[MSVLyricsTTMLParser lyricLines](self, "lyricLines");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "lastObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
          objc_msgSend(v41, "setNextLine:", v38);
        v104 = v41;
        if (objc_msgSend(v38, "type") == 3)
        {
          -[NSObject elementName](v17, "elementName");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v42, "msvl_isElementType:", CFSTR("translation")))
          {
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              v44 = v17;
              -[MSVLyricsTTMLParser translationsMap](self, "translationsMap");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = v44;
              -[NSObject language](v44, "language");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "objectForKeyedSubscript:", v46);
              v99 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVLyricsTTMLParser.m"), 445, CFSTR("At end of <text> element, an MSVLyricsTranslationText object should be top of stack"));

              }
              v101 = v12;
              objc_msgSend(v101, "lyricsLineKey");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              if (v47)
              {
                v48 = v99;
                objc_msgSend(v99, "setObject:forKeyedSubscript:", v38, v47);
              }
              else
              {
                _MSVLogCategoryLyricsTTMLParser();
                log = objc_claimAutoreleasedReturnValue();
                v48 = v99;
                if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134218242;
                  v108 = objc_msgSend(v9, "lineNumber");
                  v109 = 2112;
                  v110 = v101;
                  _os_log_impl(&dword_1A077D000, log, OS_LOG_TYPE_DEFAULT, "Invalid translation text element at line %ld: %@", buf, 0x16u);
                }

              }
            }
            goto LABEL_45;
          }
        }
        else
        {
          -[MSVLyricsTTMLParser lyricLines](self, "lyricLines");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v38);
        }

LABEL_45:
        objc_msgSend(v38, "backgroundVocals", log);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (v57)
        {
          objc_msgSend(v38, "mutableText");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = (void *)objc_msgSend(v58, "mutableCopy");

          objc_msgSend(v38, "backgroundVocals");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "characterRange");
          objc_msgSend(v59, "deleteCharactersInRange:", v61, v62);

          v102 = v59;
          objc_msgSend(v59, "replaceOccurrencesOfString:withString:options:range:", CFSTR("()"), &stru_1E43EA7B0, 0, 0, objc_msgSend(v59, "length"));
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "stringByTrimmingCharactersInSet:", v63);
          v64 = v38;
          v65 = (void *)objc_claimAutoreleasedReturnValue();

          v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v65);
          objc_msgSend(v64, "setPrimaryVocalText:", v66);

          v38 = v64;
        }
        objc_opt_class();
        v37 = v106;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v67 = v38;
          v68 = v17;
          -[NSObject lines](v68, "lines");
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v69)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVLyricsTTMLParser.m"), 474, CFSTR("-[MSVLyricsSection lines] should never be nil"));

          }
          -[NSObject lines](v68, "lines");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "arrayByAddingObject:", v67);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setLines:](v68, "setLines:", v71);

          v38 = v67;
          objc_msgSend(v67, "setParentSection:", v68);

          v37 = v106;
        }

        goto LABEL_52;
      }
      if (objc_msgSend(v14, "type") == 2)
      {
        v81 = v14;
        objc_msgSend(v81, "parentLine");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        if (v103 == v37)
        {
          objc_msgSend(v37, "words");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "mutableText");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSVLyricsTTMLParser _updateWords:withWord:parentText:](self, "_updateWords:withWord:parentText:", v82, v81, v83);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "setWords:", v84);

          v37 = v106;
        }
        objc_msgSend(v81, "parentWord");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        if (v105)
        {
          objc_msgSend(v105, "subwords");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "mutableText");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSVLyricsTTMLParser _updateWords:withWord:parentText:](self, "_updateWords:withWord:parentText:", v85, v81, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "setSubwords:", v87);

          v37 = v106;
          if (objc_msgSend(v105, "isBackgroundVocal"))
            objc_msgSend(v81, "setIsBackgroundVocal:", 1);
        }
        if (!objc_msgSend(v81, "isBackgroundVocal"))
          goto LABEL_78;
        objc_msgSend(v81, "subwords");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend(v88, "count");

        if (!v89)
          goto LABEL_78;
        if (objc_msgSend(v103, "hasBackgroundVocal"))
        {
          _MSVLogCategoryLyricsTTMLParser();
          v90 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v103, "lyricsText");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "string");
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v108 = (uint64_t)v92;
            _os_log_impl(&dword_1A077D000, v90, OS_LOG_TYPE_DEFAULT, "Warning: Ignoring additional background vocals for lyrics line \"%@\", buf, 0xCu);

            v37 = v106;
          }
        }
        else
        {
          objc_msgSend(v103, "setHasBackgroundVocal:", 1);
          objc_msgSend(v103, "setBackgroundVocals:", v81);
          if ((objc_msgSend(v81, "keepParentheses") & 1) != 0)
            goto LABEL_78;
          objc_msgSend(v81, "mutableText");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = objc_msgSend(v93, "hasPrefix:", CFSTR("("));

          if (!v94)
            goto LABEL_78;
          objc_msgSend(v81, "mutableText");
          v90 = objc_claimAutoreleasedReturnValue();
          -[MSVLyricsTTMLParser _stripParenthesesFromBackgroundVocalWord:backgroundVocalText:](self, "_stripParenthesesFromBackgroundVocalWord:backgroundVocalText:", v81, v90);
        }

LABEL_78:
      }
    }
    else
    {
      -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "lyricsSections");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "arrayByAddingObject:", v14);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[MSVLyricsTTMLParser lyricsInfo](self, "lyricsInfo");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setLyricsSections:", v55);

      v37 = v106;
    }
LABEL_52:
    -[MSVLyricsTTMLParser currentTextElement](self, "currentTextElement");
    v72 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 == v72)
    {
      -[MSVLyricsTTMLParser currentTextElement](self, "currentTextElement");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "lyricsText");
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v74)
      {
        v75 = objc_alloc(MEMORY[0x1E0CB3498]);
        -[MSVLyricsTTMLParser currentTextElement](self, "currentTextElement");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "mutableText");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = (void *)objc_msgSend(v75, "initWithString:", v77);
        -[MSVLyricsTTMLParser currentTextElement](self, "currentTextElement");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setLyricsText:", v78);

        v37 = v106;
      }
      -[MSVLyricsTTMLParser currentTextElement](self, "currentTextElement");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "setMutableText:", 0);

      -[MSVLyricsTTMLParser setCurrentTextElement:](self, "setCurrentTextElement:", v37);
    }

    goto LABEL_23;
  }
  v17 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v12, "elementName");
    v18 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v108 = (uint64_t)v18;
    v109 = 2112;
    v110 = v10;
    v19 = "Mismatched element names! start:%@, end:%@";
    v20 = v17;
    v21 = OS_LOG_TYPE_ERROR;
    v22 = 22;
LABEL_7:
    _os_log_impl(&dword_1A077D000, v20, v21, v19, buf, v22);
LABEL_8:

  }
LABEL_23:

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  -[MSVLyricsTTMLParser currentTextElement](self, "currentTextElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[MSVLyricsTTMLParser elementStack](self, "elementStack");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "mutableText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v11, "appendString:", v18);
    goto LABEL_6;
  }
  -[MSVLyricsTTMLParser currentTextElement](self, "currentTextElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutableText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v18);

  -[MSVLyricsTTMLParser currentTextElement](self, "currentTextElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");

  v10 = v18;
  if (v9 == 2)
  {
    -[MSVLyricsTTMLParser currentTextElement](self, "currentTextElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "parentLine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mutableText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendString:", v18);

    objc_msgSend(v11, "parentWord");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mutableText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendString:", v18);

LABEL_6:
    v10 = v18;
  }

}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1A077D000, v6, OS_LOG_TYPE_ERROR, "Parse error: %@", (uint8_t *)&v7, 0xCu);
  }

  -[MSVLyricsTTMLParser setParserError:](self, "setParserError:", v5);
}

- (id)_parentTextElement
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MSVLyricsTTMLParser elementStack](self, "elementStack", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reverseObjectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_translatedLyrics:(id)a3 forLanguage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MSVLyricsTTMLParser translationsMap](self, "translationsMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_20;
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("zh-Hant")))
  {
    -[MSVLyricsTTMLParser translationsMap](self, "translationsMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("zh-Hant");
  }
  else
  {
    if (!objc_msgSend(v7, "hasPrefix:", CFSTR("zh-Hans")))
    {
LABEL_19:
      v8 = 0;
      goto LABEL_20;
    }
    -[MSVLyricsTTMLParser translationsMap](self, "translationsMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("zh-Hans");
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_19;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v25 = v6;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v18, "translationKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19
          && (objc_msgSend(v18, "translationKey"),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v12, "objectForKeyedSubscript:", v20),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v20,
              v21))
        {
          objc_msgSend(v18, "startTime");
          objc_msgSend(v21, "setStartTime:");
          objc_msgSend(v18, "endTime");
          objc_msgSend(v21, "setEndTime:");
          objc_msgSend(v18, "agent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setAgent:", v22);

          objc_msgSend(v18, "translationKey");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setTranslationKey:", v23);

          objc_msgSend(v8, "addObject:", v21);
        }
        else
        {
          objc_msgSend(v8, "addObject:", v18);
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

  v6 = v25;
LABEL_20:

  return v8;
}

- (id)_updateWords:(id)a3 withWord:(id)a4 parentText:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    objc_msgSend(v7, "arrayByAddingObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  objc_msgSend(v8, "setWordIndex:", objc_msgSend(v10, "count") - 1);
  if (objc_msgSend(v8, "wordIndex") >= 1)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v8, "wordIndex") - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNextWord:", v8);

  }
  objc_msgSend(v8, "mutableText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  objc_msgSend(v8, "setCharacterRange:", objc_msgSend(v9, "length") - v14, v14);
  return v11;
}

- (void)_stripParenthesesFromBackgroundVocalWord:(id)a3 backgroundVocalText:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id obj;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "isBackgroundVocal") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVLyricsTTMLParser.m"), 667, CFSTR("MSVLyricsWord must be background vocal"));

  }
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "msvl_trimTrailingWhitespace");
  if (objc_msgSend(v9, "hasSuffix:", CFSTR(")")))
  {
    objc_msgSend(v9, "deleteCharactersInRange:", objc_msgSend(v9, "length") - 1, 1);
    objc_msgSend(v9, "deleteCharactersInRange:", 0, 1);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v9);
    objc_msgSend(v7, "setLyricsText:", v10);

    v11 = objc_msgSend(v8, "rangeOfString:", v9);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      __assert_rtn("-[MSVLyricsTTMLParser _stripParenthesesFromBackgroundVocalWord:backgroundVocalText:]", "MSVLyricsTTMLParser.m", 683, "relativeRange.location != NSNotFound");
    v51 = v9;
    objc_msgSend(v7, "setCharacterRange:", objc_msgSend(v7, "characterRange") + v11, v12);
    objc_msgSend(v7, "subwords");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "lyricsText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "string");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hasPrefix:", CFSTR("("));

    if (v17)
    {
      objc_msgSend(v14, "lyricsText");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lyricsText");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "attributedSubstringFromRange:", 1, objc_msgSend(v19, "length") - 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLyricsText:", v20);

    }
    v50 = v14;
    objc_msgSend(v7, "subwords");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "lyricsText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "string");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "hasSuffix:", CFSTR(")"));

    if (v25)
    {
      objc_msgSend(v22, "lyricsText");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lyricsText");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "attributedSubstringFromRange:", 0, objc_msgSend(v27, "length") - 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setLyricsText:", v28);

    }
    v49 = v22;
    v52 = v8;
    v29 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v7, "subwords");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "arrayWithCapacity:", objc_msgSend(v30, "count"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "lyricsText");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "string");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v53 = v7;
    objc_msgSend(v7, "subwords");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v33)
    {
      v34 = v33;
      v35 = 0;
      v36 = 0;
      v37 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v57 != v37)
            objc_enumerationMutation(obj);
          v39 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
          objc_msgSend(v39, "lyricsText");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "length");

          if (v41)
          {
            v42 = v36 + v35;
            v43 = objc_msgSend(v32, "length") - (v36 + v35);
            objc_msgSend(v39, "lyricsText");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "string");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v32, "rangeOfString:options:range:locale:", v45, 0, v42, v43, 0);
            v35 = v46;

            objc_msgSend(v39, "setCharacterRange:", v36, v35);
            objc_msgSend(v39, "setWordIndex:", objc_msgSend(v55, "count"));
            objc_msgSend(v55, "addObject:", v39);
          }
        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v34);
    }

    v47 = (void *)objc_msgSend(v55, "copy");
    v7 = v53;
    objc_msgSend(v53, "setSubwords:", v47);

    v9 = v51;
    v8 = v52;
  }

}

- (NSData)ttmlData
{
  return self->_ttmlData;
}

- (void)setTtmlData:(id)a3
{
  objc_storeStrong((id *)&self->_ttmlData, a3);
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (void)setInputStream:(id)a3
{
  objc_storeStrong((id *)&self->_inputStream, a3);
}

- (OS_dispatch_queue)parseQueue
{
  return self->_parseQueue;
}

- (void)setParseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_parseQueue, a3);
}

- (MSVLyricsSongInfo)lyricsInfo
{
  return self->_lyricsInfo;
}

- (void)setLyricsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_lyricsInfo, a3);
}

- (NSError)parserError
{
  return self->_parserError;
}

- (void)setParserError:(id)a3
{
  objc_storeStrong((id *)&self->_parserError, a3);
}

- (NSMutableArray)elementStack
{
  return self->_elementStack;
}

- (void)setElementStack:(id)a3
{
  objc_storeStrong((id *)&self->_elementStack, a3);
}

- (NSMutableArray)lyricLines
{
  return self->_lyricLines;
}

- (void)setLyricLines:(id)a3
{
  objc_storeStrong((id *)&self->_lyricLines, a3);
}

- (MSVLyricsTextElement)currentTextElement
{
  return self->_currentTextElement;
}

- (void)setCurrentTextElement:(id)a3
{
  objc_storeStrong((id *)&self->_currentTextElement, a3);
}

- (NSMutableDictionary)translationsMap
{
  return self->_translationsMap;
}

- (void)setTranslationsMap:(id)a3
{
  objc_storeStrong((id *)&self->_translationsMap, a3);
}

- (double)currentStartTime
{
  return self->_currentStartTime;
}

- (void)setCurrentStartTime:(double)a3
{
  self->_currentStartTime = a3;
}

- (BOOL)linesAreSortedByStartTime
{
  return self->_linesAreSortedByStartTime;
}

- (void)setLinesAreSortedByStartTime:(BOOL)a3
{
  self->_linesAreSortedByStartTime = a3;
}

- (NSMutableArray)agents
{
  return self->_agents;
}

- (void)setAgents:(id)a3
{
  objc_storeStrong((id *)&self->_agents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agents, 0);
  objc_storeStrong((id *)&self->_translationsMap, 0);
  objc_storeStrong((id *)&self->_currentTextElement, 0);
  objc_storeStrong((id *)&self->_lyricLines, 0);
  objc_storeStrong((id *)&self->_elementStack, 0);
  objc_storeStrong((id *)&self->_parserError, 0);
  objc_storeStrong((id *)&self->_lyricsInfo, 0);
  objc_storeStrong((id *)&self->_parseQueue, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_ttmlData, 0);
}

uint64_t __84__MSVLyricsTTMLParser_parser_didStartElement_namespaceURI_qualifiedName_attributes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __43__MSVLyricsTTMLParser_parseWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v7 = 0;
  v3 = (id)objc_msgSend(v2, "parseWithError:", &v7);
  v4 = v7;
  v5 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    (*(void (**)(_QWORD, _QWORD, id))(v5 + 16))(*(_QWORD *)(a1 + 40), 0, v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "lyricsInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v6, 0);

  }
}

@end
