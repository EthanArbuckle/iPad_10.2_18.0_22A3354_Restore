@implementation CESRSpeechProfileTestData

+ (id)sampleItem_HealthMedicationWithSourceItemIdentifier:(id)a3 name:(id)a4 nickname:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E320];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithName:nickname:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E328]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_InstalledAppWithSourceItemIdentifier:(id)a3 bundleVersion:(id)a4 bundleIdentifier:(id)a5 bundleName:(id)a6 displayAppName:(id)a7 spokenName:(id)a8 alternativeAppNames:(id)a9 carPlayAlternativeDisplayName:(id)a10 spotlightName:(id)a11 providerName:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  objc_class *v30;
  void *v32;

  v30 = (objc_class *)MEMORY[0x1E0D3E380];
  v16 = a12;
  v17 = a11;
  v18 = a10;
  v19 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a4;
  v25 = a3;
  v32 = (void *)objc_msgSend([v30 alloc], "initWithBundleIdentifier:bundleName:displayAppName:spokenName:alternativeAppNames:carPlayAlternativeDisplayName:spotlightName:providerName:error:", v23, v22, v21, v20, v19, v18, v17, v16, 0);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E388]), "initWithSourceItemIdentifier:bundleVersion:error:", v25, v24, 0);
  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v32, v26, 0);

  return v27;
}

+ (id)sampleItem_RadioStationWithSourceItemIdentifier:(id)a3 name:(id)a4 callSign:(id)a5 frequency:(id)a6 channel:(id)a7 signalType:(unsigned int)a8
{
  uint64_t v8;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v8 = *(_QWORD *)&a8;
  v13 = (objc_class *)MEMORY[0x1E0D3E438];
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend([v13 alloc], "initWithName:callSign:frequency:channel:signalType:error:", v17, v16, v15, v14, v8, 0);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E440]), "initWithSourceItemIdentifier:error:", v18, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v19, v20, 0);

  return v21;
}

+ (id)sampleItem_AppCustomMediaShowTitleWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E158];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E160]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_AppCustomMediaAudiobookTitleWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E128];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E130]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_AppCustomMediaPlaylistTitleWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E148];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E150]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_PodcastShowWithSourceItemIdentifier:(id)a3 name:(id)a4 author:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (objc_class *)MEMORY[0x1E0D3E430];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithName:author:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E418]), "initWithEntity:entityType:error:", v11, 1, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E420]), "initWithSourceItemIdentifier:error:", v10, 0);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v12, v13, 0);
  return v14;
}

+ (id)sampleItem_PodcastPlaylistWithSourceItemIdentifier:(id)a3 name:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x1E0D3E428];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithName:error:", v6, 0);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E418]), "initWithEntity:entityType:error:", v8, 2, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E420]), "initWithSourceItemIdentifier:error:", v7, 0);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v9, v10, 0);
  return v11;
}

+ (id)sampleItem_MediaAlbumArtistWithSourceItemIdentifier:(id)a3 linkedIdentifiers:(id)a4 name:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (objc_class *)MEMORY[0x1E0D3E398];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithName:error:", v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v11, 1, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C8]), "initWithSourceItemIdentifier:linkedIdentifiers:error:", v10, v9, 0);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v12, v13, 0);
  return v14;
}

+ (id)sampleItem_MediaSongArtistWithSourceItemIdentifier:(id)a3 linkedIdentifiers:(id)a4 name:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (objc_class *)MEMORY[0x1E0D3E3F0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithName:error:", v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v11, 2, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C8]), "initWithSourceItemIdentifier:linkedIdentifiers:error:", v10, v9, 0);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v12, v13, 0);
  return v14;
}

+ (id)sampleItem_MediaAlbumWithSourceItemIdentifier:(id)a3 linkedIdentifiers:(id)a4 name:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (objc_class *)MEMORY[0x1E0D3E390];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithName:error:", v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v11, 3, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C8]), "initWithSourceItemIdentifier:linkedIdentifiers:error:", v10, v9, 0);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v12, v13, 0);
  return v14;
}

+ (id)sampleItem_MediaSongWithSourceItemIdentifier:(id)a3 linkedIdentifiers:(id)a4 name:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (objc_class *)MEMORY[0x1E0D3E3E8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithName:error:", v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v11, 5, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C8]), "initWithSourceItemIdentifier:linkedIdentifiers:error:", v10, v9, 0);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v12, v13, 0);
  return v14;
}

+ (id)sampleItem_MediaPlaylistWithSourceItemIdentifier:(id)a3 linkedIdentifiers:(id)a4 name:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (objc_class *)MEMORY[0x1E0D3E3E0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithName:error:", v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v11, 6, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C8]), "initWithSourceItemIdentifier:linkedIdentifiers:error:", v10, v9, 0);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v12, v13, 0);
  return v14;
}

+ (id)sampleItem_MediaAudiobookArtistWithSourceItemIdentifier:(id)a3 linkedIdentifiers:(id)a4 name:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (objc_class *)MEMORY[0x1E0D3E3A8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithName:error:", v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v11, 11, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C8]), "initWithSourceItemIdentifier:linkedIdentifiers:error:", v10, v9, 0);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v12, v13, 0);
  return v14;
}

+ (id)sampleItem_MediaAudiobookWithSourceItemIdentifier:(id)a3 linkedIdentifiers:(id)a4 name:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (objc_class *)MEMORY[0x1E0D3E3A0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithName:error:", v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v11, 12, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C8]), "initWithSourceItemIdentifier:linkedIdentifiers:error:", v10, v9, 0);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v12, v13, 0);
  return v14;
}

+ (id)sampleItem_AppCustomMediaMusicArtistNameWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E138];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E140]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_AppCustomMediaAudiobookAuthorNameWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E118];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E120]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_AppCustomCarNameWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E0D8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E0E0]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_HomeWithSourceItemIdentifier:(id)a3 assistantHomeKitIdentifier:(id)a4 name:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (objc_class *)MEMORY[0x1E0D3E330];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithName:error:", v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E340]), "initWithEntity:entityType:error:", v11, 1, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E348]), "initWithSourceItemIdentifier:assistantHomeKitIdentifier:error:", v10, v9, 0);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v12, v13, 0);
  return v14;
}

+ (id)sampleItem_HomeZoneWithSourceItemIdentifier:(id)a3 assistantHomeKitIdentifier:(id)a4 name:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (objc_class *)MEMORY[0x1E0D3E378];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithName:error:", v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E340]), "initWithEntity:entityType:error:", v11, 2, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E348]), "initWithSourceItemIdentifier:assistantHomeKitIdentifier:error:", v10, v9, 0);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v12, v13, 0);
  return v14;
}

+ (id)sampleItem_HomeRoomWithSourceItemIdentifier:(id)a3 assistantHomeKitIdentifier:(id)a4 name:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (objc_class *)MEMORY[0x1E0D3E350];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithName:error:", v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E340]), "initWithEntity:entityType:error:", v11, 3, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E348]), "initWithSourceItemIdentifier:assistantHomeKitIdentifier:error:", v10, v9, 0);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v12, v13, 0);
  return v14;
}

+ (id)sampleItem_HomeSceneWithSourceItemIdentifier:(id)a3 assistantHomeKitIdentifier:(id)a4 name:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (objc_class *)MEMORY[0x1E0D3E358];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithName:error:", v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E340]), "initWithEntity:entityType:error:", v11, 6, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E348]), "initWithSourceItemIdentifier:assistantHomeKitIdentifier:error:", v10, v9, 0);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v12, v13, 0);
  return v14;
}

+ (id)sampleItem_HomeServiceGroupWithSourceItemIdentifier:(id)a3 assistantHomeKitIdentifier:(id)a4 name:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (objc_class *)MEMORY[0x1E0D3E368];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithName:error:", v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E340]), "initWithEntity:entityType:error:", v11, 5, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E348]), "initWithSourceItemIdentifier:assistantHomeKitIdentifier:error:", v10, v9, 0);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v12, v13, 0);
  return v14;
}

+ (id)sampleItem_HomeAccessoryWithSourceItemIdentifier:(id)a3 assistantHomeKitIdentifier:(id)a4 deviceType:(unsigned int)a5 name:(id)a6
{
  uint64_t v6;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = *(_QWORD *)&a5;
  v9 = (objc_class *)MEMORY[0x1E0D3E338];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend([v9 alloc], "initWithName:deviceType:error:", v10, v6, 0);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E340]), "initWithEntity:entityType:error:", v13, 8, 0);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E348]), "initWithSourceItemIdentifier:assistantHomeKitIdentifier:error:", v12, v11, 0);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v14, v15, 0);
  return v16;
}

+ (id)sampleItem_AppCustomPhotoAlbumNameWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E1A8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1B0]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_AppCustomPhotoTagWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E1B8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1C0]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_AppCustomNotebookItemGroupNameWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E168];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E170]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_AppCustomNotebookItemTitleWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E178];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E180]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_AppCustomWorkoutActivityNameWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E1D8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1E0]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_AppCustomPaymentsOrganizationNameWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E198];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1A0]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_AppCustomPaymentsAccountNicknameWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E188];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E190]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_AppShortcutPhraseWithSourceItemIdentifier:(id)a3 phrase:(id)a4 baseTemplate:(id)a5 templateParameterValue:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = (objc_class *)MEMORY[0x1E0D3E290];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend([v9 alloc], "initWithPhrase:baseTemplate:templateParameterValue:error:", v12, v11, v10, 0);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E298]), "initWithSourceItemIdentifier:error:", v13, 0);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v14, v15, 0);

  return v16;
}

+ (id)sampleItem_AppCustomVoiceCommandNameWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E1C8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1D0]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_AppCustomContactGroupNameWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E0F8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E100]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_AppCustomContactNameWithSourceItemIdentifier:(id)a3 vocabularyString:(id)a4 vocabularyIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E108];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v9, v8, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E110]), "initWithSourceItemIdentifier:error:", v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)sampleItem_ContactWithSourceItemIdentifier:(id)a3 givenName:(id)a4 middleName:(id)a5 familyName:(id)a6 nickname:(id)a7 organizationName:(id)a8 phoneticGivenName:(id)a9 phoneticMiddleName:(id)a10 phoneticFamilyName:(id)a11 phoneticOrganizationName:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v30;
  id v32;

  v30 = (objc_class *)MEMORY[0x1E0D3E2B0];
  v17 = a12;
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a8;
  v22 = a7;
  v23 = a6;
  v24 = a5;
  v25 = a4;
  v32 = a3;
  v26 = (void *)objc_msgSend([v30 alloc], "initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:", v25, v24, v23, 0, v22, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                  v21,
                  0,
                  0,
                  v20,
                  v19,
                  v18,
                  v17,
                  0,
                  0,
                  0,
                  0,
                  0);

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2C8]), "initWithSourceItemIdentifier:error:", v32, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v26, v27, 0);

  return v28;
}

+ (id)CascadeSerializedSets_1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[3];
  _QWORD v26[2];
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D0D400]);
  +[CESRSpeechProfileTestData Contact](CESRSpeechProfileTestData, "Contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v3;
  +[CESRSpeechProfileTestData Contact](CESRSpeechProfileTestData, "Contact");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v4;
  +[CESRSpeechProfileTestData Contact](CESRSpeechProfileTestData, "Contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C9AA60];
  v8 = (void *)objc_msgSend(v2, "initWithItemType:descriptors:localInstances:error:", 19668, MEMORY[0x1E0C9AA60], v6, 0);

  v9 = objc_alloc(MEMORY[0x1E0D0D400]);
  +[CESRSpeechProfileTestData InstalledApp](CESRSpeechProfileTestData, "InstalledApp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  +[CESRSpeechProfileTestData InstalledApp](CESRSpeechProfileTestData, "InstalledApp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v11;
  +[CESRSpeechProfileTestData InstalledApp](CESRSpeechProfileTestData, "InstalledApp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithItemType:descriptors:localInstances:error:", 36434, v7, v13, 0);

  v15 = objc_alloc(MEMORY[0x1E0D0D400]);
  +[CESRSpeechProfileTestData Home](CESRSpeechProfileTestData, "Home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  +[CESRSpeechProfileTestData Home](CESRSpeechProfileTestData, "Home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithItemType:descriptors:localInstances:error:", 7690, v7, v18, 0);

  objc_msgSend(v8, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "data", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v21;
  objc_msgSend(v19, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)itemInstanceForItemType:(unsigned __int16)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if ((int)a3 > 27121)
  {
    if ((int)a3 > 47340)
    {
      if ((int)a3 > 54384)
      {
        if ((int)a3 <= 61508)
        {
          if (a3 == 54385)
          {
            +[CESRSpeechProfileTestData CalendarEvent](CESRSpeechProfileTestData, "CalendarEvent");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            return v4;
          }
          if (a3 == 61352)
          {
            +[CESRSpeechProfileTestData AppCustomContactName](CESRSpeechProfileTestData, "AppCustomContactName");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            return v4;
          }
        }
        else
        {
          switch(a3)
          {
            case 0xF045u:
              +[CESRSpeechProfileTestData UserAccountIdentity](CESRSpeechProfileTestData, "UserAccountIdentity");
              v4 = (void *)objc_claimAutoreleasedReturnValue();
              return v4;
            case 0xF2CEu:
              +[CESRSpeechProfileTestData SiriLearnedMedia](CESRSpeechProfileTestData, "SiriLearnedMedia");
              v4 = (void *)objc_claimAutoreleasedReturnValue();
              return v4;
            case 0xF789u:
              +[CESRSpeechProfileTestData AppCustomContactGroupName](CESRSpeechProfileTestData, "AppCustomContactGroupName");
              v4 = (void *)objc_claimAutoreleasedReturnValue();
              return v4;
          }
        }
      }
      else if ((int)a3 <= 53481)
      {
        if (a3 == 47341)
        {
          +[CESRSpeechProfileTestData AppIntentsIndexedEntity](CESRSpeechProfileTestData, "AppIntentsIndexedEntity");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          return v4;
        }
        if (a3 == 49066)
        {
          +[CESRSpeechProfileTestData RadioStation](CESRSpeechProfileTestData, "RadioStation");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          return v4;
        }
      }
      else
      {
        switch(a3)
        {
          case 0xD0EAu:
            +[CESRSpeechProfileTestData AppCustomPhotoAlbumName](CESRSpeechProfileTestData, "AppCustomPhotoAlbumName");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            return v4;
          case 0xD161u:
            +[CESRSpeechProfileTestData SiriLearnedContact](CESRSpeechProfileTestData, "SiriLearnedContact");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            return v4;
          case 0xD16Eu:
            +[CESRSpeechProfileTestData FitnessGuest](CESRSpeechProfileTestData, "FitnessGuest");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            return v4;
        }
      }
    }
    else if ((int)a3 > 36433)
    {
      if ((int)a3 <= 42183)
      {
        if (a3 == 36434)
        {
          +[CESRSpeechProfileTestData InstalledApp](CESRSpeechProfileTestData, "InstalledApp");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          return v4;
        }
        if (a3 == 38251)
        {
          +[CESRSpeechProfileTestData AppCustomMediaAudiobookAuthorName](CESRSpeechProfileTestData, "AppCustomMediaAudiobookAuthorName");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          return v4;
        }
      }
      else
      {
        switch(a3)
        {
          case 0xA4C8u:
            +[CESRSpeechProfileTestData Podcast](CESRSpeechProfileTestData, "Podcast");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            return v4;
          case 0xA673u:
            +[CESRSpeechProfileTestData AppIntentsIndexedEnum](CESRSpeechProfileTestData, "AppIntentsIndexedEnum");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            return v4;
          case 0xAF87u:
            +[CESRSpeechProfileTestData AppCustomWorkoutActivityName](CESRSpeechProfileTestData, "AppCustomWorkoutActivityName");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            return v4;
        }
      }
    }
    else if ((int)a3 <= 32964)
    {
      if (a3 == 27122)
      {
        +[CESRSpeechProfileTestData FindMyDevice](CESRSpeechProfileTestData, "FindMyDevice");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      if (a3 == 30598)
      {
        +[CESRSpeechProfileTestData AppCustomVoiceCommandName](CESRSpeechProfileTestData, "AppCustomVoiceCommandName");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x80C5u:
          +[CESRSpeechProfileTestData AppCustomMediaPlaylistTitle](CESRSpeechProfileTestData, "AppCustomMediaPlaylistTitle");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          return v4;
        case 0x8603u:
          +[CESRSpeechProfileTestData AppGlobalMediaPlaylistTitle](CESRSpeechProfileTestData, "AppGlobalMediaPlaylistTitle");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          return v4;
        case 0x8CDBu:
          +[CESRSpeechProfileTestData AppGlobalMediaShowTitle](CESRSpeechProfileTestData, "AppGlobalMediaShowTitle");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          return v4;
      }
    }
  }
  else if ((int)a3 > 14024)
  {
    if ((int)a3 > 16250)
    {
      if ((int)a3 <= 19667)
      {
        if (a3 == 16251)
        {
          +[CESRSpeechProfileTestData AppCustomPaymentsOrganizationName](CESRSpeechProfileTestData, "AppCustomPaymentsOrganizationName");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          return v4;
        }
        if (a3 == 18540)
        {
          +[CESRSpeechProfileTestData Media](CESRSpeechProfileTestData, "Media");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          return v4;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x4CD4u:
            +[CESRSpeechProfileTestData Contact](CESRSpeechProfileTestData, "Contact");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            return v4;
          case 0x651Bu:
            +[CESRSpeechProfileTestData AppCustomPaymentsAccountNickname](CESRSpeechProfileTestData, "AppCustomPaymentsAccountNickname");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            return v4;
          case 0x6790u:
            +[CESRSpeechProfileTestData AppCustomNotebookItemTitle](CESRSpeechProfileTestData, "AppCustomNotebookItemTitle");
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            return v4;
        }
      }
    }
    else if ((int)a3 <= 14815)
    {
      if (a3 == 14025)
      {
        +[CESRSpeechProfileTestData AppGlobalMediaAudiobookAuthor](CESRSpeechProfileTestData, "AppGlobalMediaAudiobookAuthor");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      if (a3 == 14706)
      {
        +[CESRSpeechProfileTestData AppCustomMediaAudiobookTitle](CESRSpeechProfileTestData, "AppCustomMediaAudiobookTitle");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x39E0u:
          +[CESRSpeechProfileTestData AppCustomCarProfileName](CESRSpeechProfileTestData, "AppCustomCarProfileName");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          return v4;
        case 0x3CD4u:
          +[CESRSpeechProfileTestData AppCustomMediaShowTitle](CESRSpeechProfileTestData, "AppCustomMediaShowTitle");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          return v4;
        case 0x3D8Du:
          +[CESRSpeechProfileTestData SignificantLocation](CESRSpeechProfileTestData, "SignificantLocation");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          return v4;
      }
    }
  }
  else if ((int)a3 > 7821)
  {
    if ((int)a3 <= 12009)
    {
      if (a3 == 7822)
      {
        +[CESRSpeechProfileTestData AppShortcutEntity](CESRSpeechProfileTestData, "AppShortcutEntity");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      if (a3 == 8194)
      {
        +[CESRSpeechProfileTestData AppGlobalMediaAudiobookTitle](CESRSpeechProfileTestData, "AppGlobalMediaAudiobookTitle");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x2EEAu:
          +[CESRSpeechProfileTestData AppShortcutPhrase](CESRSpeechProfileTestData, "AppShortcutPhrase");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          return v4;
        case 0x32C4u:
          +[CESRSpeechProfileTestData HealthMedication](CESRSpeechProfileTestData, "HealthMedication");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          return v4;
        case 0x363Cu:
          +[CESRSpeechProfileTestData AppCustomPhotoTag](CESRSpeechProfileTestData, "AppCustomPhotoTag");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          return v4;
      }
    }
  }
  else if ((int)a3 <= 5594)
  {
    if (a3 == 800)
    {
      +[CESRSpeechProfileTestData AppCustomCarName](CESRSpeechProfileTestData, "AppCustomCarName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    if (a3 == 3615)
    {
      +[CESRSpeechProfileTestData AppGlobalMediaMusicArtistName](CESRSpeechProfileTestData, "AppGlobalMediaMusicArtistName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x15DBu:
        +[CESRSpeechProfileTestData AppCustomNotebookItemGroupName](CESRSpeechProfileTestData, "AppCustomNotebookItemGroupName");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      case 0x1E0Au:
        +[CESRSpeechProfileTestData Home](CESRSpeechProfileTestData, "Home");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
      case 0x1E27u:
        +[CESRSpeechProfileTestData AppCustomMediaMusicArtistName](CESRSpeechProfileTestData, "AppCustomMediaMusicArtistName");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        return v4;
    }
  }
  v5 = (void *)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)MEMORY[0x1E0D3E4C0];
    v8 = v5;
    objc_msgSend(v7, "descriptionForTypeIdentifier:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "+[CESRSpeechProfileTestData itemInstanceForItemType:]";
    v12 = 2112;
    v13 = v9;
    _os_log_error_impl(&dword_1B3E5F000, v8, OS_LOG_TYPE_ERROR, "%s No case defined for itemType: %@", (uint8_t *)&v10, 0x16u);

  }
  v4 = 0;
  return v4;
}

+ (id)AppCustomContactName_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E108]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("Richard Lewis"), CFSTR("8068f727-c4a6-468b-991a-80a209b32226"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E110]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-1"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomContactName_vocabularyString:(id)a3 vocabularyIdentifier:(id)a4 sourceItemIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E108];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v10, v9, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E110]), "initWithSourceItemIdentifier:error:", v8, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)AppCustomContactGroupName_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E0F8]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("Ski Buddies"), CFSTR("23412323#98234"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E100]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-2"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomContactGroupName_vocabularyString:(id)a3 vocabularyIdentifier:(id)a4 sourceItemIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E0F8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithVocabularyString:vocabularyIdentifier:error:", v10, v9, 0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E100]), "initWithSourceItemIdentifier:error:", v8, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)AppCustomPhotoTag_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1B8]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("Cat"), CFSTR("photos-123"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1C0]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-3"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomPhotoAlbumName_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1A8]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("Lake Tahoe"), CFSTR("ffffeeee-00c2-e5f6-ff45-179ad53c6def"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1B0]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-4"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomWorkoutActivityName_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1D8]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("HIT"), CFSTR("xyz-123"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1E0]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-5"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomCarProfileName_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E0E8]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("Ferrari Profile"), CFSTR("car-manager-1"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E0F0]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-6"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomCarName_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E0D8]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("BMW iX xDrive50"), CFSTR("2068f727-c4a6-468b-991a-80a209b32227"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E0E0]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-7"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomPaymentsOrganizationName_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E198]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("Fidelity"), CFSTR("org-123"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1A0]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-8"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomPaymentsAccountNickname_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E188]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("Investments"), CFSTR("420.69"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E190]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-9"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomNotebookItemTitle_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E178]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("Weekend List"), CFSTR("ff78262a-c4a6-0000-991a-80a209b32999"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E180]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-10"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomNotebookItemGroupName_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E168]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("Around the house"), CFSTR("notes123"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E170]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-11"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomMediaPlaylistTitle_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E148]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("Summit House"), CFSTR("a923nfashfiqu36"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E150]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-12"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomMediaMusicArtistName_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E138]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("Kaskade"), CFSTR("1.23.23"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E140]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-13"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomMediaAudiobookTitle_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E128]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("Investing for Dummies"), CFSTR("content-1"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E130]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-14"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomMediaAudiobookAuthorName_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E118]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("Eric Tyson, MBA"), CFSTR("4ed"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E120]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-15"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomMediaShowTitle_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E158]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("Lost"), CFSTR("4815162342"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E160]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-16"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppCustomVoiceCommandName_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1C8]), "initWithVocabularyString:vocabularyIdentifier:error:", CFSTR("Where's my bus"), CFSTR("6a65b2c4-00c2-e5f6-ff45-179ad53c6def"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1D0]), "initWithSourceItemIdentifier:error:", CFSTR("sirikit-item-17"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppGlobalMediaPlaylistTitle_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E240]), "initWithVocabularyStrings:error:", &unk_1E67458B0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E248]), "initWithSourceItemIdentifier:error:", CFSTR("123#sampleIntentSlot"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppGlobalMediaMusicArtistName_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E230]), "initWithVocabularyStrings:error:", &unk_1E67458C8, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E238]), "initWithSourceItemIdentifier:error:", CFSTR("456#sampleIntentSlot"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppGlobalMediaAudiobookTitle_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E220]), "initWithVocabularyStrings:error:", &unk_1E67458E0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E228]), "initWithSourceItemIdentifier:error:", CFSTR("789#sampleIntentSlot"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppGlobalMediaAudiobookAuthor_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E210]), "initWithVocabularyStrings:error:", &unk_1E67458F8, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E218]), "initWithSourceItemIdentifier:error:", CFSTR("101#sampleIntentSlot"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppGlobalMediaShowTitle_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E250]), "initWithVocabularyStrings:error:", &unk_1E6745910, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E258]), "initWithSourceItemIdentifier:error:", CFSTR("202#sampleIntentSlot"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)Contact_givenName:(id)a3 familyName:(id)a4 sourceItemIdentifier:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0D3E2B0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:", v10, 0, v9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2C8]), "initWithSourceItemIdentifier:error:", v8, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)Contact_1
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2D8]), "initWithLabel:street:subLocality:city:subAdministrativeArea:state:postalCode:country:ISOCountryCode:error:", CFSTR("Castle"), 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2E0]), "initWithLabel:name:error:", CFSTR("Mother"), CFSTR("Catherine"), 0);
  v4 = objc_alloc(MEMORY[0x1E0D3E2B0]);
  v12[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:", CFSTR("James"), &stru_1E67359A8, CFSTR("Winchester"), &stru_1E67359A8, CFSTR("The Brave"), CFSTR("Sir"), CFSTR("IV"), 0, 0, v5, 0, 0, 0, v6,
                 CFSTR("Round Table"),
                 CFSTR("Operations"),
                 CFSTR("Knight"),
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2C8]), "initWithSourceItemIdentifier:error:", CFSTR("1324accb-09cc-264b-991a-5545c5ab5fe5"), 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v7, v8, 0);

  return v9;
}

+ (id)Contact_2
{
  uint64_t v2;
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
  void *v15;
  id v16;
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
  _QWORD v27[2];
  void *v28;
  _QWORD v29[3];
  void *v30;
  _QWORD v31[2];
  void *v32;
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2D0]), "initWithLabel:stringValue:error:", CFSTR("Mobile"), 0, 0);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2D0]), "initWithLabel:stringValue:error:", CFSTR("Main"), 0, 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2B8]), "initWithLabel:email:error:", CFSTR("School"), 0, 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2D8]), "initWithLabel:street:subLocality:city:subAdministrativeArea:state:postalCode:country:ISOCountryCode:error:", CFSTR("Castle"), 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2D8]), "initWithLabel:street:subLocality:city:subAdministrativeArea:state:postalCode:country:ISOCountryCode:error:", CFSTR("Library"), 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2F0]), "initWithLabel:url:error:", CFSTR("Portfolio"), 0, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2E8]), "initWithLabel:urlString:username:userIdentifier:serviceName:error:", CFSTR("twitter"), 0, 0, 0, 0, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2E8]), "initWithLabel:urlString:username:userIdentifier:serviceName:error:", CFSTR("fb"), 0, 0, 0, 0, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2E8]), "initWithLabel:urlString:username:userIdentifier:serviceName:error:", CFSTR("reddit"), 0, 0, 0, 0, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2C0]), "initWithLabel:username:serviceName:error:", CFSTR("Slack"), 0, 0, 0);
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2E0]), "initWithLabel:name:error:", CFSTR("Friend"), CFSTR("Bob"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2E0]), "initWithLabel:name:error:", CFSTR("Mother"), CFSTR("Alice"), 0);
  v16 = objc_alloc(MEMORY[0x1E0D3E2B0]);
  v33[0] = v26;
  v33[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v22;
  v31[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  v29[1] = v19;
  v29[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v2;
  v27[1] = v3;
  v9 = (void *)v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v16, "initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:", CFSTR("Dwayne"), CFSTR("T"), CFSTR("Johnson"), CFSTR("Carter"), CFSTR("The Rock"), &stru_1E67359A8, v15, v4, v5, v6, v7, v8, v10, CFSTR("Boston Red Sox"),
                  &stru_1E67359A8,
                  &stru_1E67359A8,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2C8]), "initWithSourceItemIdentifier:error:", CFSTR("2068f727-c4a6-468b-991a-80a209b32226"), 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)Contact_3
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2D0]), "initWithLabel:stringValue:error:", CFSTR("Mobile"), 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2B8]), "initWithLabel:email:error:", CFSTR("Bank"), 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2D8]), "initWithLabel:street:subLocality:city:subAdministrativeArea:state:postalCode:country:ISOCountryCode:error:", CFSTR("Apartment"), 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2E0]), "initWithLabel:name:error:", CFSTR("Mother"), CFSTR("Estelle"), 0);
  v6 = objc_alloc(MEMORY[0x1E0D3E2B0]);
  v18[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v6, "initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:", CFSTR("George"), &stru_1E67359A8, CFSTR("Costanza"), &stru_1E67359A8, CFSTR("George"), CFSTR("Mr."), &stru_1E67359A8, v7, v8, v9, 0, 0, 0, v10,
                  CFSTR("New York Yankees"),
                  &stru_1E67359A8,
                  &stru_1E67359A8,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0,
                  0);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2C8]), "initWithSourceItemIdentifier:error:", CFSTR("0324accb-09cc-264b-991a-5545c5ab5fe5"), 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v11, v12, 0);

  return v13;
}

+ (id)Contact_4
{
  uint64_t v2;
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
  id v16;
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
  _QWORD v27[2];
  void *v28;
  _QWORD v29[3];
  void *v30;
  _QWORD v31[2];
  void *v32;
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2D0]), "initWithLabel:stringValue:error:", CFSTR("Mobile"), CFSTR("5556479283"), 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2D0]), "initWithLabel:stringValue:error:", CFSTR("library"), CFSTR("5556479443"), 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2B8]), "initWithLabel:email:error:", CFSTR("Gym"), CFSTR("mail@mail.com"), 0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2D8]), "initWithLabel:street:subLocality:city:subAdministrativeArea:state:postalCode:country:ISOCountryCode:error:", CFSTR("Home"), CFSTR("1600 Pennsylvania Ave."), 0, 0, 0, 0, 0, 0, 0, 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2D8]), "initWithLabel:street:subLocality:city:subAdministrativeArea:state:postalCode:country:ISOCountryCode:error:", CFSTR("Church"), 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2F0]), "initWithLabel:url:error:", CFSTR("Portfolio"), CFSTR("sample.net"), 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2E8]), "initWithLabel:urlString:username:userIdentifier:serviceName:error:", CFSTR("twitter"), 0, CFSTR("@jfk"), 0, 0, 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2E8]), "initWithLabel:urlString:username:userIdentifier:serviceName:error:", CFSTR("fb"), 0, 0, 0, 0, 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2E8]), "initWithLabel:urlString:username:userIdentifier:serviceName:error:", CFSTR("reddit"), 0, 0, 0, 0, 0);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2C0]), "initWithLabel:username:serviceName:error:", CFSTR("Slack"), CFSTR("John F Kennedy"), 0, 0);
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2E0]), "initWithLabel:name:error:", CFSTR("Mother"), CFSTR("Rose"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2E0]), "initWithLabel:name:error:", CFSTR("Brother"), CFSTR("Bobby"), 0);
  v16 = objc_alloc(MEMORY[0x1E0D3E2B0]);
  v33[0] = v24;
  v33[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v26;
  v31[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  v29[1] = v19;
  v29[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v2;
  v27[1] = v3;
  v10 = (void *)v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v16, "initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:", CFSTR("John"), CFSTR("F"), CFSTR("Kennedy"), CFSTR("Kennedy"), CFSTR("Johnny"), CFSTR("Mr."), CFSTR("I"), v4, v5, v6, v7, v8, v9, v11,
                  CFSTR("USA"),
                  CFSTR("White House"),
                  CFSTR("President"),
                  CFSTR("phoneme1"),
                  CFSTR("phoneme2"),
                  CFSTR("phoneme3"),
                  CFSTR("phoneme4"),
                  0,
                  0,
                  0,
                  0,
                  0);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2C8]), "initWithSourceItemIdentifier:error:", CFSTR("6a65b2c4-00c2-e5f6-991a-80a209b32226"), 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v12, v13, 0);

  return v14;
}

+ (id)Contact_5
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("Mom"), CFSTR("work"), CFSTR("0000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_6
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("John's Mom"), 0, CFSTR("9000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_7
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("my home"), 0, CFSTR("7000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_8
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2B0]), "initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:", CFSTR("Paul Glenn Matthew George II"), CFSTR("Drew Tangerine"), CFSTR("Art Thompson"), CFSTR("Jennifer Strong"), CFSTR("Patrick Tyrone"), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2C8]), "initWithSourceItemIdentifier:error:", CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)Contact_9
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("An Wen"), CFSTR("Tang"), CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_10
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("Anna"), CFSTR("Tang"), CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_11
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("Tim 👼"), 0, CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_12
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("李祖阳"), 0, CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_13
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("冬梅"), 0, CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_14
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("慧芬"), 0, CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_15
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("诗云"), 0, CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_16
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2D0]), "initWithLabel:stringValue:error:", CFSTR("Mobile"), CFSTR("5556479283"), 0);
  v3 = objc_alloc(MEMORY[0x1E0D3E2B0]);
  v9[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:", CFSTR("John"), CFSTR("F"), CFSTR("Kennedy"), 0, CFSTR("Johnny"), 0, 0, v4, 0, 0, 0, 0, 0, 0,
                 0,
                 0,
                 0,
                 CFSTR("phoneme1"),
                 CFSTR("phoneme2"),
                 CFSTR("phoneme3"),
                 0,
                 0,
                 0,
                 0,
                 0,
                 0);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2C8]), "initWithSourceItemIdentifier:error:", CFSTR("60022c4-00c2-e5f6-991a-80a72382226"), 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v5, v6, 0);

  return v7;
}

+ (id)Contact_17
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2B0]), "initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:", CFSTR("John"), CFSTR("F"), CFSTR("Kennedy"), 0, CFSTR("Johnny"), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                 0,
                 0,
                 0,
                 CFSTR("phoneme1"),
                 CFSTR("phoneme2"),
                 CFSTR("phoneme3"),
                 0,
                 0,
                 0,
                 0,
                 0,
                 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2C8]), "initWithSourceItemIdentifier:error:", CFSTR("60022c4-00c2-e5f6-991a-80a72382226"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)Contact_18
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("Jérèmíàh"), CFSTR("Leduc"), CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_19
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("Begüm"), 0, CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_20
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("Tävsan"), 0, CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_21
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("Mehmet"), CFSTR("oğlum"), CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_22
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("Hanım"), 0, CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_23
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("Ева"), 0, CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_24
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("Alejandro"), 0, CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_25
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("María"), 0, CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_26
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2D0]), "initWithLabel:stringValue:error:", CFSTR("Mobile"), CFSTR("5551234567"), 0);
  v3 = objc_alloc(MEMORY[0x1E0D3E2B0]);
  v9[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:", CFSTR("Haley"), 0, CFSTR("Cox"), 0, 0, 0, 0, v4, 0, 0, 0, 0, 0, 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2C8]), "initWithSourceItemIdentifier:error:", CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe6"), 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v5, v6, 0);

  return v7;
}

+ (id)Contact_27
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2D0]), "initWithLabel:stringValue:error:", CFSTR("Mobile"), CFSTR("5551234567"), 0);
  v3 = objc_alloc(MEMORY[0x1E0D3E2B0]);
  v9[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:", CFSTR("Hayleigh"), 0, CFSTR("Kox"), 0, 0, 0, 0, v4, 0, 0, 0, 0, 0, 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2C8]), "initWithSourceItemIdentifier:error:", CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe7"), 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v5, v6, 0);

  return v7;
}

+ (id)Contact_28
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("拓也"), CFSTR("本多"), CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe7"));
}

+ (id)Contact_29
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("拓哉"), CFSTR("本田"), CFSTR("4000accb-09cc-264b-991a-5545c5ab5fe5"));
}

+ (id)Contact_30
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("عبد الرحمن"), 0, CFSTR("e7b2480e-9b7c-4b16-b578-34bc8bc16706"));
}

+ (id)Contact_31
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("ابو عبد الرحمن"), 0, CFSTR("a5ea540d-8fa1-4ede-8471-a3e566da83b8"));
}

+ (id)Contact_32
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("أبو حسين"), 0, CFSTR("ce16238a-007d-4394-b622-f61d640d88b4"));
}

+ (id)Contact_33
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("أبو حسين"), CFSTR("محسن"), CFSTR("fb0b9750-1f57-46a4-b46b-b0646fba49a3"));
}

+ (id)Contact_34
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("هدى أم محمد"), 0, CFSTR("7a6d500a-7bbf-4d89-80ac-799f4927d000"));
}

+ (id)Contact_35
{
  return +[CESRSpeechProfileTestData Contact_givenName:familyName:sourceItemIdentifier:](CESRSpeechProfileTestData, "Contact_givenName:familyName:sourceItemIdentifier:", CFSTR("محمد"), CFSTR("حسن"), CFSTR("0f69c466-1ce8-4ad0-aff2-e8f572994a3a"));
}

+ (id)Contact_36
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2B0]), "initWithGivenName:middleName:familyName:previousFamilyName:nickname:namePrefix:nameSuffix:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:socialProfiles:instantMessageAddresses:relations:organizationName:departmentName:jobTitle:phoneticGivenName:phoneticMiddleName:phoneticFamilyName:phoneticOrganizationName:note:birthday:nonGregorianBirthday:dates:error:", CFSTR("bob"), 0, 0, 0, CFSTR("bobby"), 0, 0, 0, 0, 0, 0, 0, 0, 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0,
                 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2C8]), "initWithSourceItemIdentifier:error:", CFSTR("10022c4-00c2-e5f6-991a-80a72382226"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)InstalledApp_displayAppName:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0D3E380];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:bundleName:displayAppName:spokenName:alternativeAppNames:carPlayAlternativeDisplayName:spotlightName:providerName:error:", CFSTR("sample.app"), 0, v4, 0, 0, 0, 0, 0, 0);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E388]), "initWithSourceItemIdentifier:bundleVersion:error:", CFSTR("sample.app"), CFSTR("1.0.1"), 0);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v5, v6, 0);

  return v7;
}

+ (id)InstalledApp_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E380]), "initWithBundleIdentifier:bundleName:displayAppName:spokenName:alternativeAppNames:carPlayAlternativeDisplayName:spotlightName:providerName:error:", CFSTR("sample.app.1"), 0, CFSTR("square cash"), 0, &unk_1E6745928, 0, 0, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E388]), "initWithSourceItemIdentifier:bundleVersion:error:", CFSTR("sample.app.1"), CFSTR("34.2.1"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)InstalledApp_2
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E380]), "initWithBundleIdentifier:bundleName:displayAppName:spokenName:alternativeAppNames:carPlayAlternativeDisplayName:spotlightName:providerName:error:", CFSTR("sample.app.2"), 0, CFSTR("photo manager"), 0, 0, 0, 0, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E388]), "initWithSourceItemIdentifier:bundleVersion:error:", CFSTR("sample.app.2"), CFSTR("2.4.2"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)InstalledApp_3
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E380]), "initWithBundleIdentifier:bundleName:displayAppName:spokenName:alternativeAppNames:carPlayAlternativeDisplayName:spotlightName:providerName:error:", 0, 0, CFSTR("Maps"), 0, 0, 0, 0, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E388]), "initWithSourceItemIdentifier:bundleVersion:error:", CFSTR("com.apple.Maps"), CFSTR("2.4.2"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)InstalledApp_4
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E380]), "initWithBundleIdentifier:bundleName:displayAppName:spokenName:alternativeAppNames:carPlayAlternativeDisplayName:spotlightName:providerName:error:", CFSTR("com.example.app"), 0, CFSTR("Private Chat"), 0, &unk_1E6745940, 0, 0, 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E388]), "initWithSourceItemIdentifier:bundleVersion:error:", CFSTR("com.example.app"), CFSTR("12.3.4.5"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)Home_withType:(unsigned int)a3 name:(id)a4 sourceItemIdentifier:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = a5;
  switch((int)v6)
  {
    case 1:
      v9 = (objc_class *)MEMORY[0x1E0D3E330];
      goto LABEL_10;
    case 2:
      v9 = (objc_class *)MEMORY[0x1E0D3E378];
      goto LABEL_10;
    case 3:
      v9 = (objc_class *)MEMORY[0x1E0D3E350];
      goto LABEL_10;
    case 4:
      v11 = (objc_class *)MEMORY[0x1E0D3E360];
      goto LABEL_12;
    case 5:
      v9 = (objc_class *)MEMORY[0x1E0D3E368];
      goto LABEL_10;
    case 6:
      v9 = (objc_class *)MEMORY[0x1E0D3E358];
      goto LABEL_10;
    case 7:
      v9 = (objc_class *)MEMORY[0x1E0D3E370];
LABEL_10:
      v12 = objc_msgSend([v9 alloc], "initWithName:error:", v7, 0);
      goto LABEL_13;
    case 8:
      v11 = (objc_class *)MEMORY[0x1E0D3E338];
LABEL_12:
      v12 = objc_msgSend([v11 alloc], "initWithName:deviceType:error:", v7, 0, 0);
LABEL_13:
      v13 = (void *)v12;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E340]), "initWithEntity:entityType:error:", v12, v6, 0);
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E348]), "initWithSourceItemIdentifier:assistantHomeKitIdentifier:error:", v8, CFSTR("U2tpIFdlYXRoZXIQzUtODBFOS02MTM1OTgzMUY5MEE"), 0);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v14, v15, 0);

      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

+ (id)Home_1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E360]), "initWithName:deviceType:error:", CFSTR("Backyard Lights"), 0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E340]), "initWithEntity:entityType:error:", v2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E348]), "initWithSourceItemIdentifier:assistantHomeKitIdentifier:error:", CFSTR("test://id=12345678-9012-3456-7890-123456789012"), CFSTR("X-HM://id=774DB160-4F9C-4D17-8F5A-222A279E4E0D"), 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v3, v4, 0);

  return v5;
}

+ (id)Home_2
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E350]), "initWithName:error:", CFSTR("Kitchen"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E340]), "initWithEntity:entityType:error:", v2, 3, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E348]), "initWithSourceItemIdentifier:assistantHomeKitIdentifier:error:", CFSTR("test://id=abcdefab-cdef-abcd-efab-cdefabcdefab"), CFSTR("X-HM://id=8EADA8FB-93EF-481B-A0CE-8FA7EFD64A4D"), 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v3, v4, 0);

  return v5;
}

+ (id)Home_3
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E378]), "initWithName:error:", CFSTR("Downstairs"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E340]), "initWithEntity:entityType:error:", v2, 2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E348]), "initWithSourceItemIdentifier:assistantHomeKitIdentifier:error:", CFSTR("test://id=qwertyui-opas-dfgh-jklz-xcvbnmqwerty"), CFSTR("X-HM://id=2bcf29c7-6118-4ec2-98fb-2f49e1894d88"), 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v3, v4, 0);

  return v5;
}

+ (id)Media_withType:(unsigned int)a3 name:(id)a4 sourceItemIdentifier:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v6 = *(_QWORD *)&a3;
  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C0]), "initWithSourceItemIdentifier:type:error:", CFSTR("myLinkedIdentifier"), v6, 0);
  v10 = 0;
  if ((v6 - 1) <= 0xB)
  {
    v11 = (void *)objc_msgSend(objc_alloc(**((Class **)&unk_1E6734348 + (v6 - 1))), "initWithName:error:", v7, 0);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v11, v6, 0);
    v13 = objc_alloc(MEMORY[0x1E0D3E3C8]);
    v17[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithSourceItemIdentifier:linkedIdentifiers:error:", v8, v14, 0);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v12, v15, 0);
  }

  return v10;
}

+ (id)Media_1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E398]), "initWithName:error:", CFSTR("Tame Impala"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v2, 1, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C8]), "initWithSourceItemIdentifier:linkedIdentifiers:error:", CFSTR("x-media-library://08F895E8-DE36-439C-ACA1-B7F734B25344/1/2289062476331755325"), 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v3, v4, 0);

  return v5;
}

+ (id)Media_2
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3E0]), "initWithName:error:", CFSTR("Best Electronic Alternative"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v2, 6, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C8]), "initWithSourceItemIdentifier:linkedIdentifiers:error:", CFSTR("x-media-library://18F895E8-DE36-439C-ACA1-B7F734B25344/1/2289062476331755325"), 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v3, v4, 0);

  return v5;
}

+ (id)Media_3
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B8]), "initWithName:error:", CFSTR("90s Rock"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C8]), "initWithSourceItemIdentifier:linkedIdentifiers:error:", CFSTR("x-media-library://28F895E8-DE36-439C-ACA1-B7F734B25344/1/2289062476331755325"), 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v3, v4, 0);

  return v5;
}

+ (id)Media_4
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B8]), "initWithName:error:", CFSTR("Classic 80's"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v2, 4, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C8]), "initWithSourceItemIdentifier:linkedIdentifiers:error:", CFSTR("x-media-library://38F895E8-DE36-439C-ACA1-B7F734B25344/1/2289062476331755325"), 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v3, v4, 0);

  return v5;
}

+ (id)Media_5
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3F0]), "initWithName:error:", CFSTR("S N U G"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v2, 2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C8]), "initWithSourceItemIdentifier:linkedIdentifiers:error:", CFSTR("x-media-library://48F895E8-DE36-439C-ACA1-B7F734B25344/1/2289062476331755325"), 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v3, v4, 0);

  return v5;
}

+ (id)Media_6
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3E0]), "initWithName:error:", CFSTR("Kiro Radio"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v2, 6, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C8]), "initWithSourceItemIdentifier:linkedIdentifiers:error:", CFSTR("x-media-library://58F895E8-DE36-439C-ACA1-B7F734B25344/1/2289062476331755325"), 0, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v3, v4, 0);

  return v5;
}

+ (id)Media_7
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C0]), "initWithSourceItemIdentifier:type:error:", CFSTR("0384r7334948"), 5, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C0]), "initWithSourceItemIdentifier:type:error:", CFSTR("03838475y30"), 2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3E8]), "initWithName:error:", CFSTR("Kiro Radio"), 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v4, 5, 0);
  v6 = objc_alloc(MEMORY[0x1E0D3E3C8]);
  v11[0] = v2;
  v11[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithSourceItemIdentifier:linkedIdentifiers:error:", CFSTR("x-media-library://48F895E8-DE36-439C-ACA1-B7F734B25344/1/2289062476331755325"), v7, 0);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v5, v8, 0);
  return v9;
}

+ (id)Media_8
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C0]), "initWithSourceItemIdentifier:type:error:", CFSTR("0384r7334948"), 12, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3C0]), "initWithSourceItemIdentifier:type:error:", CFSTR("03838475y30"), 11, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3A0]), "initWithName:error:", CFSTR("Kiro Radio"), 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E3B0]), "initWithEntity:entityType:error:", v4, 12, 0);
  v6 = objc_alloc(MEMORY[0x1E0D3E3C8]);
  v11[0] = v2;
  v11[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithSourceItemIdentifier:linkedIdentifiers:error:", CFSTR("x-media-library://58F895E8-DE36-439C-ACA1-B7F734B25344/1/2289062476331755325"), v7, 0);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v5, v8, 0);
  return v9;
}

+ (id)AppShortcutPhrase_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E290]), "initWithPhrase:baseTemplate:templateParameterValue:error:", CFSTR("coffee time"), CFSTR("BaseTemplate"), CFSTR("param"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E298]), "initWithSourceItemIdentifier:error:", CFSTR("12345"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppShortcutPhrase_2
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E290]), "initWithPhrase:baseTemplate:templateParameterValue:error:", CFSTR("S&S"), CFSTR("BaseTemplate"), CFSTR("param"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E298]), "initWithSourceItemIdentifier:error:", CFSTR("678"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppShortcutPhrase_3
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E290]), "initWithPhrase:baseTemplate:templateParameterValue:error:", CFSTR("Chillax"), CFSTR("BaseTemplate"), CFSTR("param"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E298]), "initWithSourceItemIdentifier:error:", CFSTR("92973"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppShortcutEntity_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E280]), "initWithEntityTitle:entityInstanceIdentifier:entityTypeIdentifier:providerClass:entitySynonyms:error:", CFSTR("Starbucks Coffee"), CFSTR("1"), 0, CFSTR("MyProvider"), &unk_1E6745958, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E288]), "initWithSourceItemIdentifier:error:", CFSTR("1234"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)RadioStation_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E438]), "initWithName:callSign:frequency:channel:signalType:error:", CFSTR("Jack FM"), CFSTR("KJAQ"), CFSTR("96.5"), 0, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E440]), "initWithSourceItemIdentifier:error:", CFSTR("1"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)RadioStation_2
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E438]), "initWithName:callSign:frequency:channel:signalType:error:", CFSTR("Jack XM"), CFSTR("KJAQ"), 0, CFSTR("100"), 3, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E440]), "initWithSourceItemIdentifier:error:", CFSTR("2"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)RadioStation_3
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E438]), "initWithName:callSign:frequency:channel:signalType:error:", CFSTR("Kiro Radio"), CFSTR("KJAQ"), CFSTR("96.5"), 0, 2, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E440]), "initWithSourceItemIdentifier:error:", CFSTR("3"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)SignificantLocation_1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E478]), "initWithThoroughfare:subLocality:locality:country:error:", CFSTR("Stevens Creek Blvd"), CFSTR("SCV"), CFSTR("Cupertino"), CFSTR("United States"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E480]), "initWithPreferredName:mapItemName:address:error:", CFSTR("Coffee Stop"), CFSTR("Starbucks"), v2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E488]), "initWithSourceItemIdentifier:error:", CFSTR("17BA6D2D-AD53-4130-A5F0-3FBC5F79AB37"), 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v3, v4, 0);

  return v5;
}

+ (id)CalendarEvent_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2A0]), "initWithTitle:locationName:error:", CFSTR("Breakfast"), CFSTR("Two Union Square, 601 Union St #4400, Seattle, WA 98101"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2A8]), "initWithSourceItemIdentifier:error:", CFSTR("1"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)Podcast_1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E430]), "initWithName:author:error:", CFSTR("Ten Percent Happier"), CFSTR("Dan Harris"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E418]), "initWithEntity:entityType:error:", v2, 1, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E420]), "initWithSourceItemIdentifier:error:", CFSTR("x-sampcollection-podcast://device/98D5808C-0BDD-47A1-AF25-CBE847221B68"), 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v3, v4, 0);

  return v5;
}

+ (id)Podcast_2
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E428]), "initWithName:error:", CFSTR("Zen Podcasts"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E418]), "initWithEntity:entityType:error:", v2, 2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E420]), "initWithSourceItemIdentifier:error:", CFSTR("x-sampcollection-podcast://device/00D5118F-FFDD-0000-AF25-6BE847222C79"), 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v3, v4, 0);

  return v5;
}

+ (id)FitnessGuest_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E310]), "initWithName:error:", CFSTR("Molly Fox"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E318]), "initWithSourceItemIdentifier:error:", CFSTR("x-fitness-guest://Molly+Fox"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)HealthMedication_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E320]), "initWithName:nickname:error:", CFSTR("lexapro"), CFSTR("happy gummies"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E328]), "initWithSourceItemIdentifier:error:", CFSTR("x-health-medicationName://lexapro"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)UserAccountIdentity_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4C8]), "initWithUserName:givenName:error:", CFSTR("Apple King"), CFSTR("John"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4D0]), "initWithSourceItemIdentifier:error:", CFSTR("123"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)FindMyDevice_1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E308]), "initWithFirstName:lastName:error:", 0, CFSTR("Williams Jr"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2F8]), "initWithName:owner:error:", CFSTR("My iPhone"), v2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E300]), "initWithSourceItemIdentifier:error:", CFSTR("1"), 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v3, v4, 0);

  return v5;
}

+ (id)FindMyDevice_2
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E308]), "initWithFirstName:lastName:error:", CFSTR("Dan Peter"), CFSTR("Harris"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E2F8]), "initWithName:owner:error:", CFSTR("My AirPods"), v2, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E300]), "initWithSourceItemIdentifier:error:", CFSTR("2"), 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v3, v4, 0);

  return v5;
}

+ (id)SiriLearnedContact_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E490]), "initWithUserPhrasedName:suggestedContactId:error:", CFSTR("Bob"), CFSTR("1000"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E498]), "initWithSourceItemIdentifier:error:", CFSTR("1"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)SiriLearnedMedia_1
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A0]), "initWithUserPhrasedSongName:userPhrasedArtistName:userPhrasedAlbumName:userPhrasedEntityName:userPhrasedVersion:suggestedAdamId:error:", CFSTR("Simple Man"), 0, 0, 0, CFSTR("live"), CFSTR("1054"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A8]), "initWithSourceItemIdentifier:error:", CFSTR("4"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)SiriLearnedMedia_2
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A0]), "initWithUserPhrasedSongName:userPhrasedArtistName:userPhrasedAlbumName:userPhrasedEntityName:userPhrasedVersion:suggestedAdamId:error:", 0, CFSTR("Lynyrd Skynyrd"), 0, 0, 0, CFSTR("1055"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A8]), "initWithSourceItemIdentifier:error:", CFSTR("5"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)SiriLearnedMedia_3
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A0]), "initWithUserPhrasedSongName:userPhrasedArtistName:userPhrasedAlbumName:userPhrasedEntityName:userPhrasedVersion:suggestedAdamId:error:", 0, 0, CFSTR("Pronounced'Leh-'Nerd'Skin-'Nerd,"), 0, 0, CFSTR("1056"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A8]), "initWithSourceItemIdentifier:error:", CFSTR("6"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)SiriLearnedMedia_4
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A0]), "initWithUserPhrasedSongName:userPhrasedArtistName:userPhrasedAlbumName:userPhrasedEntityName:userPhrasedVersion:suggestedAdamId:error:", 0, 0, 0, 0, CFSTR("live"), CFSTR("1057"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A8]), "initWithSourceItemIdentifier:error:", CFSTR("7"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)SiriLearnedMedia_5
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A0]), "initWithUserPhrasedSongName:userPhrasedArtistName:userPhrasedAlbumName:userPhrasedEntityName:userPhrasedVersion:suggestedAdamId:error:", 0, 0, 0, CFSTR("Live version of Hero"), 0, CFSTR("1058"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A8]), "initWithSourceItemIdentifier:error:", CFSTR("8"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)SiriLearnedMedia_6
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A0]), "initWithUserPhrasedSongName:userPhrasedArtistName:userPhrasedAlbumName:userPhrasedEntityName:userPhrasedVersion:suggestedAdamId:error:", CFSTR("Heroes"), CFSTR("Davis Bowie"), 0, 0, CFSTR("live"), CFSTR("1059"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A8]), "initWithSourceItemIdentifier:error:", CFSTR("9"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)SiriLearnedMedia_7
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A0]), "initWithUserPhrasedSongName:userPhrasedArtistName:userPhrasedAlbumName:userPhrasedEntityName:userPhrasedVersion:suggestedAdamId:error:", CFSTR("Simple Man"), CFSTR("Lynyrd Skynyrd"), 0, 0, CFSTR("live"), CFSTR("1060"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A8]), "initWithSourceItemIdentifier:error:", CFSTR("10"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)SiriLearnedMedia_8
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A0]), "initWithUserPhrasedSongName:userPhrasedArtistName:userPhrasedAlbumName:userPhrasedEntityName:userPhrasedVersion:suggestedAdamId:error:", CFSTR("Heroes"), CFSTR("Davis Bowie"), 0, 0, 0, CFSTR("1061"), 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E4A8]), "initWithSourceItemIdentifier:error:", CFSTR("11"), 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v2, v3, 0);

  return v4;
}

+ (id)AppIntentsIndexedEntity_1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1E8]), "initWithTitle:subtitle:synonyms:error:", CFSTR("Tacoliccio's"), CFSTR("Italian Foods"), &unk_1E6745970, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1F0]), "initWithName:synonyms:error:", CFSTR("Restaurant"), &unk_1E6745988, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E260]), "initWithTypeIdentifier:displayRepresentation:typeDisplayRepresentation:error:", CFSTR("GeoPOIRestaurant"), v2, v3, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E268]), "initWithSourceItemIdentifier:rank:error:", CFSTR("entity-1"), 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v4, v5, 0);

  return v6;
}

+ (id)AppIntentsIndexedEnum_1
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E208]), "initWithName:synonyms:error:", CFSTR("Car"), &unk_1E67459A0, 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E200]), "initWithTitle:subtitle:synonyms:error:", CFSTR("1500"), CFSTR("Ram"), &unk_1E67459B8, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1F8]), "initWithCaseIdentifier:displayRepresentation:error:", CFSTR("1"), v3, 0);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E200]), "initWithTitle:subtitle:synonyms:error:", CFSTR("Silverado"), CFSTR("Chevrolet"), &unk_1E67459D0, 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E1F8]), "initWithCaseIdentifier:displayRepresentation:error:", CFSTR("2"), v5, 0);
  v7 = objc_alloc(MEMORY[0x1E0D3E270]);
  v13[0] = v4;
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTypeIdentifier:typeDisplayRepresentation:cases:error:", CFSTR("UserCar"), v2, v8, 0);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3E278]), "initWithSourceItemIdentifier:error:", CFSTR("enum-1"), 0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0D3F0]), "initWithContent:metaContent:error:", v9, v10, 0);

  return v11;
}

@end
