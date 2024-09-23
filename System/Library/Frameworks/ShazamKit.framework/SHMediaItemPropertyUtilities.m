@implementation SHMediaItemPropertyUtilities

+ (int64_t)categoryForShazamKitProperty:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  objc_msgSend(a1, "buildPropertySets");
  if ((objc_msgSend((id)stringProperties, "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else if ((objc_msgSend((id)URLProperties, "containsObject:", v4) & 1) != 0)
  {
    v5 = 4;
  }
  else if ((objc_msgSend((id)dateProperties, "containsObject:", v4) & 1) != 0)
  {
    v5 = 3;
  }
  else if ((objc_msgSend((id)numberProperties, "containsObject:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend((id)stringArrayProperties, "containsObject:", v4) & 1) != 0)
  {
    v5 = 5;
  }
  else if ((objc_msgSend((id)rangeArrayProperties, "containsObject:", v4) & 1) != 0)
  {
    v5 = 6;
  }
  else if ((objc_msgSend((id)BOOLeanProperties, "containsObject:", v4) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend((id)uuidProperties, "containsObject:", v4) & 1) != 0)
  {
    v5 = 7;
  }
  else if ((objc_msgSend((id)signatureAlignmentArrayProperties, "containsObject:", v4) & 1) != 0)
  {
    v5 = 8;
  }
  else if (objc_msgSend((id)locationProperties, "containsObject:", v4))
  {
    v5 = 9;
  }
  else
  {
    v5 = 10;
  }

  return v5;
}

+ (BOOL)isShazamKitDefinedMediaItemProperty:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "buildPropertySets");
  LOBYTE(a1) = objc_msgSend((id)allProperties, "containsObject:", v4);

  return (char)a1;
}

+ (Class)jsonRepresentationTypeForProperty:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(a1, "typeForShazamKitProperty:", a3);
  if (v3 == (void *)objc_opt_class() || v3 == (void *)objc_opt_class() || v3 == (void *)objc_opt_class())
  {
    objc_opt_class();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  return (Class)v4;
}

+ (Class)typeForShazamKitProperty:(id)a3
{
  id v4;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  switch(objc_msgSend(a1, "categoryForShazamKitProperty:", v4))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      objc_opt_class();
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      v6 = (void *)MEMORY[0x24BDBCE88];
      v7 = *MEMORY[0x24BDBCAB8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Encountered ShazamKit property that we did know the type of: %@"), v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v9);
    default:
      break;
  }

  return (Class)a1;
}

+ (void)buildPropertySets
{
  if (buildPropertySets_onceToken != -1)
    dispatch_once(&buildPropertySets_onceToken, &__block_literal_global_0);
}

void __49__SHMediaItemPropertyUtilities_buildPropertySets__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  _QWORD v47[4];
  _QWORD v48[2];
  _QWORD v49[6];
  _QWORD v50[3];
  _QWORD v51[4];
  _QWORD v52[12];

  v52[10] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v52[0] = CFSTR("sh_lyricsSnippet");
  v52[1] = CFSTR("sh_albumName");
  v52[2] = CFSTR("sh_isrc");
  v52[3] = CFSTR("sh_appleMusicID");
  v52[4] = CFSTR("sh_artist");
  v52[5] = CFSTR("sh_subtitle");
  v52[6] = CFSTR("sh_title");
  v52[7] = CFSTR("sh_shazamID");
  v52[8] = CFSTR("sh_syncedLyricsSnippet");
  v52[9] = CFSTR("sh_providerIdentifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)stringProperties;
  stringProperties = v2;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v51[0] = CFSTR("sh_webURL");
  v51[1] = CFSTR("sh_appleMusicURL");
  v51[2] = CFSTR("sh_artworkURL");
  v51[3] = CFSTR("sh_videoURL");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)URLProperties;
  URLProperties = v6;

  v8 = (void *)MEMORY[0x24BDBCF20];
  v50[0] = CFSTR("sh_releaseDate");
  v50[1] = CFSTR("sh_audioStartDate");
  v50[2] = CFSTR("sh_creationDate");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)dateProperties;
  dateProperties = v10;

  v12 = (void *)MEMORY[0x24BDBCF20];
  v49[0] = CFSTR("sh_matchOffset");
  v49[1] = CFSTR("sh_speedSkew");
  v49[2] = CFSTR("sh_frequencySkew");
  v49[3] = CFSTR("sh_score");
  v49[4] = CFSTR("sh_shazamCount");
  v49[5] = CFSTR("sh_duration");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)numberProperties;
  numberProperties = v14;

  v16 = (void *)MEMORY[0x24BDBCF20];
  v48[0] = CFSTR("sh_genres");
  v48[1] = CFSTR("sh_staticLyricLines");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)stringArrayProperties;
  stringArrayProperties = v18;

  v20 = (void *)MEMORY[0x24BDBCF20];
  v47[0] = CFSTR("sh_timeRanges");
  v47[1] = CFSTR("sh_timeRanges_Swift");
  v47[2] = CFSTR("sh_frequencySkewRanges");
  v47[3] = CFSTR("sh_frequencySkewRanges_Swift");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithArray:", v21);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)rangeArrayProperties;
  rangeArrayProperties = v22;

  v24 = (void *)MEMORY[0x24BDBCF20];
  v46 = CFSTR("sh_signatureAlignments");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWithArray:", v25);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)signatureAlignmentArrayProperties;
  signatureAlignmentArrayProperties = v26;

  v28 = (void *)MEMORY[0x24BDBCF20];
  v45 = CFSTR("sh_explicitContent");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v29);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)BOOLeanProperties;
  BOOLeanProperties = v30;

  v32 = (void *)MEMORY[0x24BDBCF20];
  v44 = CFSTR("sh_identifier");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setWithArray:", v33);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)uuidProperties;
  uuidProperties = v34;

  v36 = (void *)MEMORY[0x24BDBCF20];
  v43 = CFSTR("sh_matchLocation");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWithArray:", v37);
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)locationProperties;
  locationProperties = v38;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "unionSet:", stringProperties);
  objc_msgSend(v40, "unionSet:", URLProperties);
  objc_msgSend(v40, "unionSet:", dateProperties);
  objc_msgSend(v40, "unionSet:", numberProperties);
  objc_msgSend(v40, "unionSet:", stringArrayProperties);
  objc_msgSend(v40, "unionSet:", rangeArrayProperties);
  objc_msgSend(v40, "unionSet:", signatureAlignmentArrayProperties);
  objc_msgSend(v40, "unionSet:", BOOLeanProperties);
  objc_msgSend(v40, "unionSet:", uuidProperties);
  objc_msgSend(v40, "unionSet:", locationProperties);
  v41 = objc_msgSend(v40, "copy");
  v42 = (void *)allProperties;
  allProperties = v41;

}

@end
