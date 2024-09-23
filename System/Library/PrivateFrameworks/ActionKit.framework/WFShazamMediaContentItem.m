@implementation WFShazamMediaContentItem

- (WFShazamMedia)media
{
  return (WFShazamMedia *)-[WFShazamMediaContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (id)appleMusicID
{
  void *v2;
  void *v3;

  -[WFShazamMediaContentItem media](self, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleMusicID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)artist
{
  void *v2;
  void *v3;

  -[WFShazamMediaContentItem media](self, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)title
{
  void *v2;
  void *v3;

  -[WFShazamMediaContentItem media](self, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)artworkURL
{
  void *v2;
  void *v3;

  -[WFShazamMediaContentItem media](self, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "artworkURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)shazamURL
{
  void *v2;
  void *v3;

  -[WFShazamMediaContentItem media](self, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shazamURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)appleMusicURL
{
  void *v2;
  void *v3;

  -[WFShazamMediaContentItem media](self, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleMusicURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)isExplicit
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[WFShazamMediaContentItem media](self, "media");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isExplicit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)videoURL
{
  void *v2;
  void *v3;

  -[WFShazamMediaContentItem media](self, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lyricsSnippet
{
  void *v2;
  void *v3;

  -[WFShazamMediaContentItem media](self, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lyricsSnippet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lyricsSnippetSynced
{
  void *v2;
  void *v3;

  -[WFShazamMediaContentItem media](self, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lyricsSnippetSynced");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[5];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "conformsToUTType:", *MEMORY[0x24BDF8410]))
  {
    -[WFShazamMediaContentItem artworkURL](self, "artworkURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[WFShazamMediaContentItem artworkURL](self, "artworkURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __71__WFShazamMediaContentItem_generateFileRepresentation_options_forType___block_invoke;
      v15[3] = &unk_24F8B6E10;
      v15[4] = self;
      v16 = v8;
      -[WFShazamMediaContentItem getArtworkDataWithURL:completionHandler:](self, "getArtworkDataWithURL:completionHandler:", v12, v15);

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "badCoercionErrorForType:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v13);

    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)WFShazamMediaContentItem;
    -[WFShazamMediaContentItem generateFileRepresentation:options:forType:](&v14, sel_generateFileRepresentation_options_forType_, v8, v9, v10);
  }

}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  Class v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  NSStringFromClass(a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(CFSTR("WFiTunesMediaTrackObject"), "isEqualToString:", v8);

  if (v9)
  {
    -[WFShazamMediaContentItem appleMusicID](self, "appleMusicID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      v12 = (void *)objc_opt_new();
      -[WFShazamMediaContentItem appleMusicID](self, "appleMusicID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "countryCode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __74__WFShazamMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke;
      v23[3] = &unk_24F8B65B0;
      v23[4] = self;
      v24 = v7;
      v25 = a5;
      objc_msgSend(v12, "lookupMediaWithIdentifiers:countryCode:completion:", v14, v16, v23);

    }
    else
    {
      v18 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("'%@' was not found in Apple Music"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFShazamMediaContentItem name](self, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringWithFormat:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "badCoercionErrorWithReasonString:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v22);

    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v17);

  }
}

- (WFFileType)preferredFileType
{
  return (WFFileType *)objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
}

- (void)getArtworkDataWithURL:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x24BDB74B0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "wf_sharedSession");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataTaskWithURL:completionHandler:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "resume");
}

void __74__WFShazamMediaContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  objc_msgSend(a2, "firstObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    (*(void (**)(_QWORD, id, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v4, 0, 0);
  }
  else
  {

    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend((id)objc_opt_class(), "badCoercionErrorForObjectClass:", *(_QWORD *)(a1 + 48));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v3 + 16))(v3, 0, 0, v4);
  }

}

void __71__WFShazamMediaContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BE194F8];
    v8 = (void *)MEMORY[0x24BEC14A0];
    v9 = *MEMORY[0x24BDF8438];
    v10 = a4;
    objc_msgSend(v8, "typeWithUTType:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileWithData:ofType:proposedFilename:", v6, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v14 = a4;
    getWFWorkflowExecutionLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315138;
      v17 = "-[WFShazamMediaContentItem generateFileRepresentation:options:forType:]_block_invoke";
      _os_log_impl(&dword_22D353000, v15, OS_LOG_TYPE_ERROR, "%s Coercion of WFShazamMediaContentItem to image failed because Shazam returned nil artworkData", (uint8_t *)&v16, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8410]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BE196F0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Shazam media (Single)"), CFSTR("Shazam media"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Shazam media (Plural)"), CFSTR("Shazam media"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Shazam media"));
}

+ (id)propertyBuilders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[12];

  v37[10] = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() != a1)
    return 0;
  v3 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Apple Music ID"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath:name:class:", CFSTR("appleMusicID"), v36, objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v35;
  v4 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Artist"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath:name:class:", CFSTR("artist"), v34, objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v33;
  v5 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Title"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyPath:name:class:", CFSTR("title"), v32, objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v31;
  v6 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Explicit"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyPath:name:class:", CFSTR("isExplicit"), v29, objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not Explicit"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "negativeName:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v26;
  v7 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Lyrics Snippet"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyPath:name:class:", CFSTR("lyricsSnippet"), v25, objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37[4] = v24;
  v8 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Lyric Snippet Synced"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyPath:name:class:", CFSTR("lyricsSnippetSynced"), v23, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v37[5] = v9;
  v10 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Artwork"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "block:name:class:", &__block_literal_global_32675, v11, objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37[6] = v12;
  v13 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Video URL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyPath:name:class:", CFSTR("videoURL"), v14, objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[7] = v15;
  v16 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Shazam URL"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "keyPath:name:class:", CFSTR("shazamURL"), v17, objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[8] = v18;
  v19 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Apple Music URL"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "keyPath:name:class:", CFSTR("appleMusicURL"), v20, objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37[9] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (BOOL)canLowercaseTypeDescription
{
  return 0;
}

void __44__WFShazamMediaContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  v6 = a4;
  objc_msgSend(v5, "artworkURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__WFShazamMediaContentItem_propertyBuilders__block_invoke_2;
    v8[3] = &unk_24F8BADB8;
    v9 = v6;
    objc_msgSend(v5, "getObjectRepresentation:forClass:", v8, objc_opt_class());

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

uint64_t __44__WFShazamMediaContentItem_propertyBuilders__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
