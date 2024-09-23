@implementation WFPodcastEpisodeContentItem

- (id)episode
{
  return (id)-[WFPodcastEpisodeContentItem objectForClass:](self, "objectForClass:", objc_opt_class());
}

- (BOOL)getListSubtitle:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v5 = a3;
    -[WFPodcastEpisodeContentItem episode](self, "episode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "author");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))a3 + 2))(v5, v7);

  }
  return 1;
}

- (BOOL)loadsListThumbnailAsynchronously
{
  return 1;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83E8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPodcastEpisodeContentItem getArtworkURLForSize:type:](self, "getArtworkURLForSize:type:", v8, width, height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __56__WFPodcastEpisodeContentItem_getListThumbnail_forSize___block_invoke;
    v11[3] = &unk_24F8BB3E0;
    v12 = v7;
    -[WFPodcastEpisodeContentItem getArtworkDataWithURL:completionHandler:](self, "getArtworkDataWithURL:completionHandler:", v9, v11);

  }
  return 1;
}

- (id)getArtworkURLForSize:(CGSize)a3 type:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[WFPodcastEpisodeContentItem episode](self, "episode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "artworkURLTemplate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v11 = height * 3.0;
  *(float *)&v11 = height * 3.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{h}"), v13, 0, 0, objc_msgSend(v10, "length"));

  v14 = width * 3.0;
  *(float *)&v14 = width * 3.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{w}"), v16, 0, 0, objc_msgSend(v10, "length"));

  objc_msgSend(v7, "fileExtension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{f}"), v17, 0, 0, objc_msgSend(v10, "length"));
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
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

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "conformsToUTType:", *MEMORY[0x24BDF8410]))
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__19488;
    v17[4] = __Block_byref_object_dispose__19489;
    v18 = 0;
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83E8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPodcastEpisodeContentItem getArtworkURLForSize:type:](self, "getArtworkURLForSize:type:", v11, 512.0, 512.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __74__WFPodcastEpisodeContentItem_generateFileRepresentation_options_forType___block_invoke;
    v14[3] = &unk_24F8BAF58;
    v16 = v17;
    v14[4] = self;
    v15 = v8;
    -[WFPodcastEpisodeContentItem getArtworkDataWithURL:completionHandler:](self, "getArtworkDataWithURL:completionHandler:", v12, v14);

    _Block_object_dispose(v17, 8);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFPodcastEpisodeContentItem;
    -[WFPodcastEpisodeContentItem generateFileRepresentation:options:forType:](&v13, sel_generateFileRepresentation_options_forType_, v8, v9, v10);
  }

}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  objc_super v28;

  v8 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    -[WFPodcastEpisodeContentItem episode](self, "episode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "author");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("%1$@ by %2$@"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithFormat:", v13, v14, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v16 = objc_msgSend(v15, "length");
    objc_msgSend(v10, "viewURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16)
    {
      if (v17)
      {
        v19 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("%1$@ (%2$@)"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "viewURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "absoluteString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringWithFormat:", v20, v15, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
        v25 = (void *)MEMORY[0x24BE19590];
        -[WFPodcastEpisodeContentItem name](self, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "object:named:", v23, v26);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
      v24 = v15;
    }
    else
    {
      objc_msgSend(v17, "absoluteString");
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v24;
    goto LABEL_12;
  }
  v28.receiver = self;
  v28.super_class = (Class)WFPodcastEpisodeContentItem;
  -[WFPodcastEpisodeContentItem generateObjectRepresentationForClass:options:error:](&v28, sel_generateObjectRepresentationForClass_options_error_, a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v9;
}

- (WFFileType)preferredFileType
{
  return (WFFileType *)objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
}

void __74__WFPodcastEpisodeContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v6 = (void *)MEMORY[0x24BE194F8];
  v7 = (void *)MEMORY[0x24BEC14A0];
  v8 = *MEMORY[0x24BDF83E8];
  v15 = a4;
  v9 = a2;
  objc_msgSend(v7, "typeWithUTType:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileWithData:ofType:proposedFilename:", v9, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __56__WFPodcastEpisodeContentItem_getListThumbnail_forSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__WFPodcastEpisodeContentItem_getListThumbnail_forSize___block_invoke_2;
  v6[3] = &unk_24F8BB5E0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __56__WFPodcastEpisodeContentItem_getListThumbnail_forSize___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BEC14E0], "imageWithData:scale:allowAnimated:", v1, 0, 1.0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
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
  _QWORD v35[12];

  v35[10] = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() != a1)
    return 0;
  v3 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Store ID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath:name:class:", CFSTR("episode.identifier"), v34, objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v33;
  v4 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Store URL"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath:name:class:", CFSTR("episode.viewURL"), v32, objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v31;
  v5 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Title"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyPath:name:class:", CFSTR("episode.title"), v30, objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v29;
  v6 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Author"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyPath:name:class:", CFSTR("episode.author"), v28, objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v27;
  v7 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Description"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyPath:name:class:", CFSTR("episode.descriptionText"), v26, objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v25;
  v8 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Release Date"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyPath:name:class:", CFSTR("episode.releaseDate"), v24, objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v23;
  v9 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Genres"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyPath:name:class:", CFSTR("episode.genres"), v22, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "multipleValues:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v11;
  v12 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Duration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyPath:name:class:", CFSTR("episode.duration"), v13, objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v14;
  v15 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Artwork"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "block:name:class:", &__block_literal_global_19545, v16, objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v17;
  v18 = (void *)MEMORY[0x24BE19490];
  WFLocalizedContentPropertyNameMarker(CFSTR("Artwork URL"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "block:name:class:", &__block_literal_global_175, v19, objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDBCF00];
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8410]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19598], "typeWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Podcast episode"), CFSTR("Podcast episode"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Podcast episodes"), CFSTR("Podcast episodes"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d podcast episodes"));
}

void __47__WFPodcastEpisodeContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD))
{
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;
  void *v10;
  id v11;

  v6 = (void *)MEMORY[0x24BEC14A0];
  v7 = *MEMORY[0x24BDF83E8];
  v8 = a4;
  v9 = a2;
  objc_msgSend(v6, "typeWithUTType:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getArtworkURLForSize:type:", v11, 512.0, 512.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *))a4)[2](v8, v10);
}

void __47__WFPodcastEpisodeContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__WFPodcastEpisodeContentItem_propertyBuilders__block_invoke_2;
  v8[3] = &unk_24F8BADB8;
  v9 = v5;
  v6 = v5;
  v7 = a2;
  objc_msgSend(v7, "getObjectRepresentation:forClass:", v8, objc_opt_class());

}

uint64_t __47__WFPodcastEpisodeContentItem_propertyBuilders__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
