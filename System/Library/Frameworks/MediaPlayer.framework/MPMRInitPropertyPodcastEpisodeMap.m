@implementation MPMRInitPropertyPodcastEpisodeMap

void ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "deviceSpecificUserInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersistentID:", objc_msgSend(v4, "longLongValue"));

}

void ___MPMRInitPropertyPodcastEpisodeMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a2;
  v16 = a3;
  objc_msgSend(v4, "deviceSpecificUserInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("did"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_2;
    v19[3] = &unk_1E3162B80;
    v20 = v4;
    objc_msgSend(v16, "setLibraryIdentifiersWithDatabaseID:block:", v6, v19);

  }
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_3;
  v17[3] = &unk_1E3163A30;
  v18 = v4;
  v9 = v4;
  objc_msgSend(v16, "setUniversalStoreIdentifiersWithBlock:", v17);
  objc_msgSend(v9, "externalContentIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setVendorID:", v10);

  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContentItemID:", v11);

  objc_msgSend(v9, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("cntrUID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContainerUniqueID:", v13);

  objc_msgSend(v9, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("phold"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPlaceholder:", objc_msgSend(v15, "BOOLValue"));

}

void ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setAdamID:", objc_msgSend(v2, "storeID"));

}

id ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_9(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "deviceSpecificUserInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rating"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  objc_msgSend(v2, "numberWithFloat:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_8(uint64_t a1, void *a2)
{
  _BOOL8 v2;

  v2 = (objc_msgSend(a2, "mediaType") & 0xFF00) != 0;
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
}

uint64_t ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "mpTranscriptAlignment");
}

id ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("phold"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E3163D10, CFSTR("MediaPlayer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v2, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_14(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectForPropertySet:contentItem:context:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
}

id ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_13(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a2;
  +[MPBaseEntityTranslator translatorForMPModelClass:](MPMediaRemoteEntityTranslator, "translatorForMPModelClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = CFSTR("MPModelPropertyPodcastChapterTitle");
  v19[1] = CFSTR("MPModelPropertyPodcastChapterDuration");
  v19[2] = CFSTR("MPModelPropertyPodcastChapterStartTime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPPropertySet propertySetWithProperties:](MPPropertySet, "propertySetWithProperties:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_14;
  v15[3] = &unk_1E3156970;
  v16 = v6;
  v17 = v8;
  v18 = v4;
  v10 = v4;
  v11 = v8;
  v12 = v6;
  objc_msgSend(v9, "msv_map:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = objc_msgSend(a2, "episodeType") - 1;
  if (v3 > 5)
    v4 = 0;
  else
    v4 = qword_193F0A378[v3];
  return objc_msgSend(v2, "numberWithInteger:", v4);
}

id ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("podEpShURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_10(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("podEpStrURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "transcriptAlignments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "msv_map:", &__block_literal_global_151);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ___MPMRInitPropertyPodcastEpisodeMap_block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "releaseDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _MPMRDateComponentsFromDate(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
