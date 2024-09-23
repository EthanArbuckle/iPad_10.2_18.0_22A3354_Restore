@implementation SAGKSnippet

- (BOOL)_sr_objects:(id)a3 matchClassOrder:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _QWORD v19[4];

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006FEBC;
  v10[3] = &unk_100123CE0;
  v8 = v6;
  v11 = v8;
  v12 = v19;
  v13 = &v15;
  v14 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  LOBYTE(v7) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);

  return (char)v7;
}

- (BOOL)_isWikiSnippet
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  objc_opt_class(SAGKMapPod, a2);
  v14[0] = v3;
  objc_opt_class(SAGKSummaryPod, v4);
  v14[1] = v5;
  objc_opt_class(SAGKPropertyPod, v6);
  v14[2] = v7;
  *(_QWORD *)&v9 = objc_opt_class(SAGKSourceLinkPod, v8).n128_u64[0];
  v14[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 4, v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet pods](self, "pods"));
  LOBYTE(self) = sub_10005B0EC(v12, v11);

  return (char)self;
}

- (id)sr_sirilandShim
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  SAGKSnippet *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  id v33;
  void *v34;
  void *v35;
  void **v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *);
  void *v40;
  id v41;
  _QWORD *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _QWORD v48[4];
  uint64_t v49;

  if (-[SAGKSnippet _isWikiSnippet](self, "_isWikiSnippet"))
  {
    v3 = objc_alloc_init((Class)SFCard);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet title](self, "title"));
    objc_msgSend(v3, "setTitle:", v4);

    objc_msgSend(v3, "setType:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet aceId](self, "aceId"));
    objc_msgSend(v3, "setCardId:", v5);

    objc_msgSend(v3, "setSource:", 2);
    v6 = objc_alloc_init((Class)NSMutableArray);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet title](self, "title"));

    if (v7)
    {
      v8 = objc_alloc_init((Class)SFRichTitleCardSection);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet title](self, "title"));
      objc_msgSend(v8, "setTitle:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet subtitle](self, "subtitle"));
      objc_msgSend(v8, "setSubtitle:", v10);

      objc_msgSend(v8, "setIsCentered:", 1);
      objc_msgSend(v8, "setSeparatorStyle:", 5);
      objc_msgSend(v6, "addObject:", v8);

    }
    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x2020000000;
    v48[3] = 0;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet pods](self, "pods"));
    v37 = _NSConcreteStackBlock;
    v38 = 3221225472;
    v39 = sub_10007054C;
    v40 = &unk_1001240A0;
    v12 = v6;
    v41 = v12;
    v42 = v48;
    v43 = &v44;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v37);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSnippet appPunchOut](self, "appPunchOut"));
    if (v13 && !*((_BYTE *)v45 + 24))
    {
      v14 = objc_alloc_init((Class)SFRowCardSection);
      v15 = objc_alloc((Class)SFURLImage);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appIcon"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "resourceUrl"));
      v18 = objc_msgSend(v15, "initWithURL:", v17);

      objc_msgSend(v14, "setImage:", v18);
      objc_msgSend(v18, "setIsTemplate:", 1);
      v19 = objc_alloc_init((Class)SFRichText);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "punchOutName"));
      objc_msgSend(v19, "setText:", v20);

      objc_msgSend(v14, "setLeadingText:", v19);
      objc_msgSend(v14, "setImageIsRightAligned:", 1);
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_convertedPunchout"));
      v22 = (void *)v21;
      if (v21)
      {
        v49 = v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v49, 1));
        objc_msgSend(v14, "setPunchoutOptions:", v23);

      }
      objc_msgSend(v12, "addObject:", v14);

    }
    v24 = objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setCardSections:", v24);

    v25 = (SAGKSnippet *)objc_alloc_init((Class)SACardSnippet);
    v26 = objc_msgSend(objc_alloc((Class)_SFPBCard), "initWithFacade:", v3);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "data"));
    -[SAGKSnippet setCardData:](v25, "setCardData:", v27);

    v28 = objc_alloc_init((Class)SAUISash);
    v29 = objc_msgSend(v28, "setApplicationBundleIdentifier:", CFSTR("com.apple.siri"));
    if (AFIsInternalInstall(v29, v30))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
      v32 = objc_msgSend(v31, "debugButtonIsEnabled");

      if (v32)
      {
        v33 = sub_10005B08C(CFSTR("KNOWLEDGE"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (INTERNAL ONLY: LEGACY FLOW)"), v34, v37, v38, v39, v40));
        objc_msgSend(v28, "setTitle:", v35);

      }
    }
    -[SAGKSnippet setSash:](v25, "setSash:", v28);
    -[SAGKSnippet sr_applySnippetProperties:](v25, "sr_applySnippetProperties:", self);
    -[SAGKSnippet setTitle:](v25, "setTitle:", 0);

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(v48, 8);

  }
  else
  {
    v25 = self;
  }
  return v25;
}

@end
