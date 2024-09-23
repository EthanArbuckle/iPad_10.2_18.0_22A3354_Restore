@implementation LPiTunesMediaMetadataProviderSpecialization

+ (unint64_t)specialization
{
  return 8;
}

+ (id)specializedMetadataProviderForURLWithContext:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  BOOL v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  LPiTunesMediaMetadataProviderSpecialization *v13;
  LPiTunesMediaURLComponents *v15;
  void *v16;
  LPiTunesMediaURLComponents *v17;
  LPiTunesMediaMetadataProviderSpecialization *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = a3;
  if (+[LPSettings disableLegacyStoreLookups](LPSettings, "disableLegacyStoreLookups"))
    goto LABEL_8;
  objc_msgSend(v3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[LPPresentationSpecializations isiTunesStoreURLThatUsesWebMetadata:](LPPresentationSpecializations, "isiTunesStoreURLThatUsesWebMetadata:", v4);

  if (v5
    || (objc_msgSend(v3, "URL"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = +[LPPresentationSpecializations isiTunesStoreOrAdjacentURL:](LPPresentationSpecializations, "isiTunesStoreOrAdjacentURL:", v6), v6, !v7))
  {
LABEL_8:
    v13 = 0;
  }
  else
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v8 = (void *)getMPStoreLyricsSnippetURLComponentsClass_softClass_0;
    v25 = getMPStoreLyricsSnippetURLComponentsClass_softClass_0;
    if (!getMPStoreLyricsSnippetURLComponentsClass_softClass_0)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __getMPStoreLyricsSnippetURLComponentsClass_block_invoke_0;
      v21[3] = &unk_1E44A7DB0;
      v21[4] = &v22;
      __getMPStoreLyricsSnippetURLComponentsClass_block_invoke_0((uint64_t)v21);
      v8 = (void *)v23[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v22, 8);
    v10 = [v9 alloc];
    objc_msgSend(v3, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithURL:", v11);

    if (v12)
    {
      v13 = -[LPiTunesMediaMetadataProviderSpecialization initWithLyricComponents:withContext:]([LPiTunesMediaMetadataProviderSpecialization alloc], "initWithLyricComponents:withContext:", v12, v3);
    }
    else
    {
      v15 = [LPiTunesMediaURLComponents alloc];
      objc_msgSend(v3, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[LPiTunesMediaURLComponents initWithURL:](v15, "initWithURL:", v16);

      if (v17)
      {
        v18 = [LPiTunesMediaMetadataProviderSpecialization alloc];
        -[LPiTunesMediaURLComponents identifier](v17, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPiTunesMediaURLComponents storefrontCountryCode](v17, "storefrontCountryCode");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[LPiTunesMediaMetadataProviderSpecialization initWithIdentifier:storefrontCountryCode:withContext:](v18, "initWithIdentifier:storefrontCountryCode:withContext:", v19, v20, v3);

      }
      else
      {
        v13 = 0;
      }

    }
  }

  return v13;
}

+ (id)specializedMetadataProviderForMetadata:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  LPiTunesMediaMetadataProviderSpecialization *v9;
  void *v10;
  LPiTunesMediaMetadataProviderSpecialization *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[LPPresentationSpecializations isiTunesStoreURLThatUsesWebMetadata:](LPPresentationSpecializations, "isiTunesStoreURLThatUsesWebMetadata:", v7);

  if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v5, "appleContentID");
    v9 = (LPiTunesMediaMetadataProviderSpecialization *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "appleContentID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (LPiTunesMediaMetadataProviderSpecialization *)objc_msgSend(v10, "length");

      if (v9)
      {
        v11 = [LPiTunesMediaMetadataProviderSpecialization alloc];
        objc_msgSend(v5, "appleContentID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[LPiTunesMediaMetadataProviderSpecialization initWithIdentifier:storefrontCountryCode:withContext:](v11, "initWithIdentifier:storefrontCountryCode:withContext:", v12, 0, v6);

      }
    }
  }

  return v9;
}

- (LPiTunesMediaMetadataProviderSpecialization)initWithIdentifier:(id)a3 storefrontCountryCode:(id)a4 withContext:(id)a5
{
  id v9;
  id v10;
  LPiTunesMediaMetadataProviderSpecialization *v11;
  LPiTunesMediaMetadataProviderSpecialization *v12;
  LPiTunesMediaMetadataProviderSpecialization *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LPiTunesMediaMetadataProviderSpecialization;
  v11 = -[LPMetadataProviderSpecialization initWithContext:](&v15, sel_initWithContext_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    objc_storeStrong((id *)&v12->_storefrontCountryCode, a4);
    v13 = v12;
  }

  return v12;
}

- (LPiTunesMediaMetadataProviderSpecialization)initWithLyricComponents:(id)a3 withContext:(id)a4
{
  id v7;
  id v8;
  LPiTunesMediaMetadataProviderSpecialization *v9;
  void *v10;
  uint64_t v11;
  NSString *identifier;
  LPiTunesMediaMetadataProviderSpecialization *v13;

  v7 = a3;
  v8 = a4;
  v9 = -[LPMetadataProviderSpecialization initWithContext:](self, "initWithContext:", v8);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v7, "songAdamID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v11;

    objc_storeStrong((id *)&v9->_lyricComponents, a3);
    v13 = v9;
  }

  return v9;
}

+ (int64_t)determineOrientationOfScreenshotsInArray:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t v8;

  objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("height"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("width"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(v5, "integerValue");
        if (v7 <= objc_msgSend(v6, "integerValue"))
          v8 = 1;
        else
          v8 = 2;
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)assetArrayScreenshotArray:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        mediaAsset(*(void **)(*((_QWORD *)&v12 + 1) + 8 * i), CFSTR("screenshots"), 1000, 1000, CFSTR("bb"), CFSTR("png"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

          v10 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v4, "addObject:", v9, (_QWORD)v12);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }

  v10 = v4;
LABEL_11:

  return v10;
}

+ (id)assetArrayFromScreenshotArray:(id)a3
{
  id v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = +[LPiTunesMediaMetadataProviderSpecialization determineOrientationOfScreenshotsInArray:](LPiTunesMediaMetadataProviderSpecialization, "determineOrientationOfScreenshotsInArray:", v3);
  if (v4 == 1)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    mediaAsset(v6, CFSTR("screenshots"), 1000, 1000, CFSTR("bb"), CFSTR("png"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v9[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else if (v4 == 2)
  {
    +[LPiTunesMediaMetadataProviderSpecialization assetArrayScreenshotArray:](LPiTunesMediaMetadataProviderSpecialization, "assetArrayScreenshotArray:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)assetArrayFromScreenshotDictionary:(id)a3 usingPreferredPlatformArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v10, "count"))
        {
          +[LPiTunesMediaMetadataProviderSpecialization assetArrayFromScreenshotArray:](LPiTunesMediaMetadataProviderSpecialization, "assetArrayFromScreenshotArray:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            goto LABEL_15;
        }
        else
        {

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  v11 = 0;
LABEL_15:

  return v11;
}

+ (id)assetFromVideoPreviewDictionary:(id)a3 usingPreferredPlatformArray:(id)a4
{
  id v5;
  id v6;
  LPiTunesMediaAsset *v7;
  uint64_t v8;
  LPiTunesMediaAsset *i;
  void *v10;
  LPiTunesMediaAsset *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = a4;
  v7 = (LPiTunesMediaAsset *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (LPiTunesMediaAsset *)((char *)i + 1))
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v10, "count"))
            {
              v11 = [LPiTunesMediaAsset alloc];
              v12 = (void *)MEMORY[0x1E0C99E98];
              objc_msgSend(v10, "firstObject");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "objectForKey:", CFSTR("video"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "URLWithString:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v7 = -[LPiTunesMediaAsset initWithVideoURL:name:](v11, "initWithVideoURL:name:", v15, CFSTR("previewVideo"));

              goto LABEL_13;
            }
          }
        }

      }
      v7 = (LPiTunesMediaAsset *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

+ (id)extractOffers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  LPiTunesMediaOffer *v10;
  LPiTunesMediaOffer *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = [LPiTunesMediaOffer alloc];
          v11 = -[LPiTunesMediaOffer initWithDictionary:](v10, "initWithDictionary:", v9, (_QWORD)v14);
          if (v11)
            objc_msgSend(v4, "addObject:", v11);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v4, "count"))
    v12 = v4;
  else
    v12 = 0;

  return v12;
}

- (id)schema
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
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
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  _QWORD v139[4];
  id v140;
  _QWORD aBlock[4];
  id v142;
  _QWORD v143[4];
  _QWORD v144[4];
  _QWORD v145[3];
  _QWORD v146[3];
  _QWORD v147[4];
  _QWORD v148[4];
  _QWORD v149[2];
  _QWORD v150[2];
  _QWORD v151[4];
  _QWORD v152[2];
  _QWORD v153[2];
  _QWORD v154[4];
  _QWORD v155[4];
  _QWORD v156[3];
  _QWORD v157[3];
  _QWORD v158[4];
  _QWORD v159[4];
  _QWORD v160[2];
  _QWORD v161[2];
  _QWORD v162[4];
  _QWORD v163[2];
  _QWORD v164[2];
  _QWORD v165[3];
  _QWORD v166[3];
  _QWORD v167[2];
  _QWORD v168[2];
  _QWORD v169[2];
  _QWORD v170[2];
  _QWORD v171[2];
  _QWORD v172[3];
  _QWORD v173[3];
  _QWORD v174[4];
  _QWORD v175[4];
  _QWORD v176[2];
  _QWORD v177[2];
  _QWORD v178[3];
  _QWORD v179[2];
  _QWORD v180[2];
  _QWORD v181[3];
  _QWORD v182[3];
  _QWORD v183[3];
  _QWORD v184[3];
  _QWORD v185[4];
  _QWORD v186[4];
  _QWORD v187[3];
  _QWORD v188[3];
  _QWORD v189[4];
  _QWORD v190[2];
  _QWORD v191[2];
  _QWORD v192[3];
  _QWORD v193[3];
  _QWORD v194[3];
  _QWORD v195[3];
  _QWORD v196[2];
  _QWORD v197[2];
  _QWORD v198[3];
  _QWORD v199[2];
  _QWORD v200[2];
  _QWORD v201[4];
  _QWORD v202[4];
  _QWORD v203[3];
  _QWORD v204[3];
  _QWORD v205[2];
  _QWORD v206[2];
  _QWORD v207[3];
  _QWORD v208[3];
  _QWORD v209[2];
  _QWORD v210[2];
  _QWORD v211[5];
  _QWORD v212[2];
  _QWORD v213[2];
  _QWORD v214[3];
  _QWORD v215[3];
  _QWORD v216[3];
  _QWORD v217[3];
  _QWORD v218[2];
  _QWORD v219[2];
  _QWORD v220[3];
  _QWORD v221[2];
  _QWORD v222[2];
  _QWORD v223[5];
  _QWORD v224[5];
  _QWORD v225[5];
  _QWORD v226[5];
  _QWORD v227[4];
  _QWORD v228[4];
  _QWORD v229[4];
  _QWORD v230[4];
  _QWORD v231[3];
  _QWORD v232[3];
  _QWORD v233[2];
  _QWORD v234[2];
  _QWORD v235[6];
  _QWORD v236[3];
  _QWORD v237[3];
  _QWORD v238[5];
  _QWORD v239[5];
  _QWORD v240[5];
  _QWORD v241[5];
  _QWORD v242[5];
  _QWORD v243[5];
  _QWORD v244[4];
  _QWORD v245[4];
  _QWORD v246[4];
  _QWORD v247[4];
  _QWORD v248[3];
  _QWORD v249[3];
  _QWORD v250[3];
  _QWORD v251[3];
  _QWORD v252[3];
  _QWORD v253[3];
  _QWORD v254[2];
  _QWORD v255[2];
  _QWORD v256[9];
  _QWORD v257[3];
  _QWORD v258[3];
  _QWORD v259[4];
  _QWORD v260[4];
  _QWORD v261[4];
  _QWORD v262[4];
  _QWORD v263[4];
  _QWORD v264[4];
  _QWORD v265[3];
  _QWORD v266[3];
  _QWORD v267[2];
  _QWORD v268[2];
  _QWORD v269[5];
  _QWORD v270[2];
  _QWORD v271[2];
  _QWORD v272[5];
  _QWORD v273[5];
  _QWORD v274[5];
  _QWORD v275[5];
  _QWORD v276[2];
  _QWORD v277[2];
  _QWORD v278[3];
  _QWORD v279[2];
  _QWORD v280[2];
  _QWORD v281[3];
  _QWORD v282[3];
  _QWORD v283[2];
  _QWORD v284[2];
  _QWORD v285[2];
  _QWORD v286[2];
  _QWORD v287[2];
  _QWORD v288[3];
  _QWORD v289[3];
  _QWORD v290[4];
  _QWORD v291[4];
  _QWORD v292[2];
  _QWORD v293[2];
  _QWORD v294[3];
  _QWORD v295[2];
  _QWORD v296[2];
  _QWORD v297[3];
  _QWORD v298[3];
  _QWORD v299[3];
  _QWORD v300[3];
  _QWORD v301[2];
  _QWORD v302[2];
  _QWORD v303[3];
  _QWORD v304[2];
  _QWORD v305[2];
  _QWORD v306[4];
  _QWORD v307[4];
  _QWORD v308[3];
  _QWORD v309[3];
  _QWORD v310[3];
  _QWORD v311[3];
  _QWORD v312[2];
  _QWORD v313[2];
  _QWORD v314[4];
  _QWORD v315[2];
  _QWORD v316[2];
  _QWORD v317[3];
  _QWORD v318[3];
  _QWORD v319[3];
  _QWORD v320[3];
  _QWORD v321[3];
  _QWORD v322[3];
  _QWORD v323[2];
  _QWORD v324[2];
  _QWORD v325[3];
  _QWORD v326[3];
  _QWORD v327[3];
  _QWORD v328[3];
  _QWORD v329[6];
  _QWORD v330[2];
  _QWORD v331[2];
  _QWORD v332[3];
  _QWORD v333[3];
  _QWORD v334[3];
  _QWORD v335[3];
  _QWORD v336[3];
  _QWORD v337[3];
  _QWORD v338[2];
  _QWORD v339[2];
  _QWORD v340[4];
  _QWORD v341[2];
  _QWORD v342[2];
  _QWORD v343[3];
  _QWORD v344[3];
  _QWORD v345[3];
  _QWORD v346[3];
  _QWORD v347[3];
  _QWORD v348[3];
  _QWORD v349[3];
  _QWORD v350[3];
  _QWORD v351[2];
  _QWORD v352[2];
  _QWORD v353[5];
  _QWORD v354[2];
  _QWORD v355[2];
  _QWORD v356[19];
  _QWORD v357[21];

  v357[19] = *MEMORY[0x1E0C80C00];
  v356[0] = CFSTR("song");
  v354[0] = CFSTR("metadataClass");
  v355[0] = objc_opt_class();
  v354[1] = CFSTR("entries");
  v352[0] = CFSTR("name");
  v351[0] = CFSTR("entryName");
  v351[1] = CFSTR("entryType");
  v352[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v352, v351, 2);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v353[0] = v138;
  v350[0] = CFSTR("artistName");
  v349[0] = CFSTR("entryName");
  v349[1] = CFSTR("entryType");
  v349[2] = CFSTR("entryMetadataName");
  v350[1] = objc_opt_class();
  v350[2] = CFSTR("artist");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v350, v349, 3);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v353[1] = v133;
  v348[0] = CFSTR("collectionName");
  v347[0] = CFSTR("entryName");
  v347[1] = CFSTR("entryType");
  v347[2] = CFSTR("entryMetadataName");
  v348[1] = objc_opt_class();
  v348[2] = CFSTR("album");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v348, v347, 3);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v353[2] = v132;
  v346[0] = CFSTR("artwork");
  v345[0] = CFSTR("entryName");
  v345[1] = CFSTR("entryType");
  v345[2] = CFSTR("entryExtractor");
  v346[1] = objc_opt_class();
  v346[2] = &__block_literal_global_8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v346, v345, 3);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v353[3] = v130;
  v344[0] = CFSTR("offers");
  v343[0] = CFSTR("entryName");
  v343[1] = CFSTR("entryType");
  v343[2] = CFSTR("entryExtractor");
  v344[1] = objc_opt_class();
  v344[2] = &__block_literal_global_80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v344, v343, 3);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v353[4] = v128;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v353, 5);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v355[1] = v129;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v355, v354, 2);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v357[0] = v131;
  v356[1] = CFSTR("album");
  v341[0] = CFSTR("metadataClass");
  v342[0] = objc_opt_class();
  v341[1] = CFSTR("entries");
  v339[0] = CFSTR("name");
  v338[0] = CFSTR("entryName");
  v338[1] = CFSTR("entryType");
  v339[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v339, v338, 2);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v340[0] = v127;
  v337[0] = CFSTR("artistName");
  v336[0] = CFSTR("entryName");
  v336[1] = CFSTR("entryType");
  v336[2] = CFSTR("entryMetadataName");
  v337[1] = objc_opt_class();
  v337[2] = CFSTR("artist");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v337, v336, 3);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v340[1] = v126;
  v335[0] = CFSTR("artwork");
  v334[0] = CFSTR("entryName");
  v334[1] = CFSTR("entryType");
  v334[2] = CFSTR("entryExtractor");
  v335[1] = objc_opt_class();
  v335[2] = &__block_literal_global_82;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v335, v334, 3);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v340[2] = v124;
  v333[0] = CFSTR("offers");
  v332[0] = CFSTR("entryName");
  v332[1] = CFSTR("entryType");
  v332[2] = CFSTR("entryExtractor");
  v333[1] = objc_opt_class();
  v333[2] = &__block_literal_global_83;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v333, v332, 3);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v340[3] = v122;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v340, 4);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v342[1] = v123;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v342, v341, 2);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v357[1] = v125;
  v356[2] = CFSTR("podcastEpisode");
  v330[0] = CFSTR("metadataClass");
  v331[0] = objc_opt_class();
  v330[1] = CFSTR("entries");
  v328[0] = CFSTR("name");
  v327[0] = CFSTR("entryName");
  v327[1] = CFSTR("entryType");
  v327[2] = CFSTR("entryMetadataName");
  v328[1] = objc_opt_class();
  v328[2] = CFSTR("episodeName");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v328, v327, 3);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v329[0] = v121;
  v326[0] = CFSTR("artistName");
  v325[0] = CFSTR("entryName");
  v325[1] = CFSTR("entryType");
  v325[2] = CFSTR("entryMetadataName");
  v326[1] = objc_opt_class();
  v326[2] = CFSTR("artist");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v326, v325, 3);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v329[1] = v120;
  v324[0] = CFSTR("releaseDate");
  v323[0] = CFSTR("entryName");
  v323[1] = CFSTR("entryType");
  v324[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v324, v323, 2);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v329[2] = v119;
  v322[0] = CFSTR("collectionName");
  v321[0] = CFSTR("entryName");
  v321[1] = CFSTR("entryType");
  v321[2] = CFSTR("entryMetadataName");
  v322[1] = objc_opt_class();
  v322[2] = CFSTR("podcastName");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v322, v321, 3);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v329[3] = v118;
  v320[0] = CFSTR("artwork");
  v319[0] = CFSTR("entryName");
  v319[1] = CFSTR("entryType");
  v319[2] = CFSTR("entryExtractor");
  v320[1] = objc_opt_class();
  v320[2] = &__block_literal_global_93;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v320, v319, 3);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v329[4] = v116;
  v318[0] = CFSTR("offers");
  v317[0] = CFSTR("entryName");
  v317[1] = CFSTR("entryType");
  v317[2] = CFSTR("entryExtractor");
  v318[1] = objc_opt_class();
  v318[2] = &__block_literal_global_94;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v318, v317, 3);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v329[5] = v114;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v329, 6);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v331[1] = v115;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v331, v330, 2);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v357[2] = v117;
  v356[3] = CFSTR("podcast");
  v315[0] = CFSTR("metadataClass");
  v316[0] = objc_opt_class();
  v315[1] = CFSTR("entries");
  v313[0] = CFSTR("name");
  v312[0] = CFSTR("entryName");
  v312[1] = CFSTR("entryType");
  v313[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v313, v312, 2);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v314[0] = v113;
  v311[0] = CFSTR("artistName");
  v310[0] = CFSTR("entryName");
  v310[1] = CFSTR("entryType");
  v310[2] = CFSTR("entryMetadataName");
  v311[1] = objc_opt_class();
  v311[2] = CFSTR("artist");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v311, v310, 3);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v314[1] = v112;
  v309[0] = CFSTR("artwork");
  v308[0] = CFSTR("entryName");
  v308[1] = CFSTR("entryType");
  v308[2] = CFSTR("entryExtractor");
  v309[1] = objc_opt_class();
  v309[2] = &__block_literal_global_98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v309, v308, 3);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v314[2] = v110;
  v307[0] = CFSTR("children");
  v306[0] = CFSTR("entryName");
  v306[1] = CFSTR("entryType");
  v307[1] = objc_opt_class();
  v307[2] = CFSTR("offers");
  v306[2] = CFSTR("entryMetadataName");
  v306[3] = CFSTR("entryExtractor");
  v307[3] = &__block_literal_global_102;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v307, v306, 4);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v314[3] = v108;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v314, 4);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v316[1] = v109;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v316, v315, 2);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v357[3] = v111;
  v356[4] = CFSTR("musicVideo");
  v304[0] = CFSTR("metadataClass");
  v305[0] = objc_opt_class();
  v304[1] = CFSTR("entries");
  v302[0] = CFSTR("name");
  v301[0] = CFSTR("entryName");
  v301[1] = CFSTR("entryType");
  v302[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v302, v301, 2);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v303[0] = v107;
  v300[0] = CFSTR("artistName");
  v299[0] = CFSTR("entryName");
  v299[1] = CFSTR("entryType");
  v299[2] = CFSTR("entryMetadataName");
  v300[1] = objc_opt_class();
  v300[2] = CFSTR("artist");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v300, v299, 3);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v303[1] = v105;
  v298[0] = CFSTR("artwork");
  v297[0] = CFSTR("entryName");
  v297[1] = CFSTR("entryType");
  v297[2] = CFSTR("entryExtractor");
  v298[1] = objc_opt_class();
  v298[2] = &__block_literal_global_107;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v298, v297, 3);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v303[2] = v103;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v303, 3);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v305[1] = v104;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v305, v304, 2);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v357[4] = v106;
  v356[5] = CFSTR("artist");
  v295[0] = CFSTR("metadataClass");
  v296[0] = objc_opt_class();
  v295[1] = CFSTR("entries");
  v293[0] = CFSTR("name");
  v292[0] = CFSTR("entryName");
  v292[1] = CFSTR("entryType");
  v293[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v293, v292, 2);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v294[0] = v102;
  v291[0] = CFSTR("genreNames");
  v290[0] = CFSTR("entryName");
  v290[1] = CFSTR("entryType");
  v291[1] = objc_opt_class();
  v291[2] = CFSTR("genre");
  v290[2] = CFSTR("entryMetadataName");
  v290[3] = CFSTR("entryExtractor");
  v291[3] = &__block_literal_global_114;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v291, v290, 4);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v294[1] = v100;
  v289[0] = CFSTR("artwork");
  v288[0] = CFSTR("entryName");
  v288[1] = CFSTR("entryType");
  v288[2] = CFSTR("entryExtractor");
  v289[1] = objc_opt_class();
  v289[2] = &__block_literal_global_115;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v289, v288, 3);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v294[2] = v98;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v294, 3);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v296[1] = v99;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v296, v295, 2);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v357[5] = v101;
  v356[6] = CFSTR("iTunesBrand");
  v286[0] = CFSTR("metadataClass");
  v287[0] = objc_opt_class();
  v286[1] = CFSTR("entries");
  v284[0] = CFSTR("name");
  v283[0] = CFSTR("entryName");
  v283[1] = CFSTR("entryType");
  v284[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v284, v283, 2);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v285[0] = v96;
  v282[0] = CFSTR("artwork");
  v281[0] = CFSTR("entryName");
  v281[1] = CFSTR("entryType");
  v281[2] = CFSTR("entryExtractor");
  v282[1] = objc_opt_class();
  v282[2] = &__block_literal_global_119;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v282, v281, 3);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v285[1] = v94;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v285, 2);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v287[1] = v95;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v287, v286, 2);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v357[6] = v97;
  v356[7] = CFSTR("radioStation");
  v279[0] = CFSTR("metadataClass");
  v280[0] = objc_opt_class();
  v279[1] = CFSTR("entries");
  v277[0] = CFSTR("name");
  v276[0] = CFSTR("entryName");
  v276[1] = CFSTR("entryType");
  v277[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v277, v276, 2);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v278[0] = v93;
  v275[0] = CFSTR("editorialArtwork");
  v274[0] = CFSTR("entryName");
  v274[1] = CFSTR("entryType");
  v275[1] = objc_opt_class();
  v275[2] = MEMORY[0x1E0C9AAB0];
  v274[2] = CFSTR("entryIsOptional");
  v274[3] = CFSTR("entryMetadataName");
  v274[4] = CFSTR("entryExtractor");
  v275[3] = CFSTR("artwork");
  v275[4] = &__block_literal_global_124;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v275, v274, 5);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v278[1] = v91;
  v273[0] = CFSTR("artwork");
  v272[0] = CFSTR("entryName");
  v272[1] = CFSTR("entryType");
  v273[1] = objc_opt_class();
  v273[2] = MEMORY[0x1E0C9AAB0];
  v272[2] = CFSTR("entryIsOptional");
  v272[3] = CFSTR("entryMetadataName");
  v272[4] = CFSTR("entryExtractor");
  v273[3] = CFSTR("artwork");
  v273[4] = &__block_literal_global_129;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v273, v272, 5);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v278[2] = v89;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v278, 3);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v280[1] = v90;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v280, v279, 2);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v357[7] = v92;
  v356[8] = CFSTR("playlist");
  v270[0] = CFSTR("metadataClass");
  v271[0] = objc_opt_class();
  v270[1] = CFSTR("entries");
  v268[0] = CFSTR("name");
  v267[0] = CFSTR("entryName");
  v267[1] = CFSTR("entryType");
  v268[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v268, v267, 2);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v269[0] = v88;
  v266[0] = CFSTR("curatorName");
  v265[0] = CFSTR("entryName");
  v265[1] = CFSTR("entryType");
  v265[2] = CFSTR("entryMetadataName");
  v266[1] = objc_opt_class();
  v266[2] = CFSTR("curator");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v266, v265, 3);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v269[1] = v87;
  v264[0] = CFSTR("socialProfileId");
  v263[0] = CFSTR("entryName");
  v263[1] = CFSTR("entryType");
  v264[1] = objc_opt_class();
  v264[2] = CFSTR("curatorID");
  v263[2] = CFSTR("entryMetadataName");
  v263[3] = CFSTR("entryIsOptional");
  v264[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v264, v263, 4);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v269[2] = v86;
  v262[0] = CFSTR("username");
  v261[0] = CFSTR("entryName");
  v261[1] = CFSTR("entryType");
  v262[1] = objc_opt_class();
  v262[2] = CFSTR("curatorHandle");
  v261[2] = CFSTR("entryMetadataName");
  v261[3] = CFSTR("entryIsOptional");
  v262[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v262, v261, 4);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v269[3] = v84;
  v260[0] = CFSTR("artwork");
  v259[0] = CFSTR("entryName");
  v259[1] = CFSTR("entryType");
  v260[1] = objc_opt_class();
  v260[2] = &__block_literal_global_145;
  v259[2] = CFSTR("entryExtractor");
  v259[3] = CFSTR("entryIsOptional");
  v260[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v260, v259, 4);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v269[4] = v82;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v269, 5);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v271[1] = v83;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v271, v270, 2);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v357[8] = v85;
  v356[9] = CFSTR("iosSoftware");
  v257[0] = CFSTR("metadataClass");
  v258[0] = objc_opt_class();
  v257[1] = CFSTR("entries");
  v255[0] = CFSTR("name");
  v254[0] = CFSTR("entryName");
  v254[1] = CFSTR("entryType");
  v255[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v255, v254, 2);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v256[0] = v81;
  v253[0] = CFSTR("subtitle");
  v252[0] = CFSTR("entryName");
  v252[1] = CFSTR("entryType");
  v252[2] = CFSTR("entryIsOptional");
  v253[1] = objc_opt_class();
  v253[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v253, v252, 3);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v256[1] = v80;
  v251[0] = CFSTR("hasMessagesExtension");
  v250[0] = CFSTR("entryName");
  v250[1] = CFSTR("entryType");
  v250[2] = CFSTR("entryIsOptional");
  v251[1] = objc_opt_class();
  v251[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v251, v250, 3);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v256[2] = v79;
  v249[0] = CFSTR("isHiddenFromSpringboard");
  v248[0] = CFSTR("entryName");
  v248[1] = CFSTR("entryType");
  v248[2] = CFSTR("entryIsOptional");
  v249[1] = objc_opt_class();
  v249[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v249, v248, 3);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v256[3] = v78;
  v247[0] = CFSTR("genreNames");
  v246[0] = CFSTR("entryName");
  v246[1] = CFSTR("entryType");
  v247[1] = objc_opt_class();
  v247[2] = CFSTR("genre");
  v246[2] = CFSTR("entryMetadataName");
  v246[3] = CFSTR("entryExtractor");
  v247[3] = &__block_literal_global_155;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v247, v246, 4);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v256[4] = v77;
  v245[0] = CFSTR("artwork");
  v244[0] = CFSTR("entryName");
  v244[1] = CFSTR("entryType");
  v245[1] = objc_opt_class();
  v245[2] = CFSTR("icon");
  v244[2] = CFSTR("entryMetadataName");
  v244[3] = CFSTR("entryExtractor");
  v245[3] = &__block_literal_global_158;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v245, v244, 4);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v256[5] = v75;
  v243[0] = CFSTR("ovalArtwork");
  v242[0] = CFSTR("entryName");
  v242[1] = CFSTR("entryType");
  v243[1] = objc_opt_class();
  v243[2] = CFSTR("messagesAppIcon");
  v242[2] = CFSTR("entryMetadataName");
  v242[3] = CFSTR("entryIsOptional");
  v242[4] = CFSTR("entryExtractor");
  v243[3] = MEMORY[0x1E0C9AAB0];
  v243[4] = &__block_literal_global_163;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v243, v242, 5);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v256[6] = v72;
  v241[0] = CFSTR("screenshotsByType");
  v240[0] = CFSTR("entryName");
  v240[1] = CFSTR("entryType");
  v241[1] = objc_opt_class();
  v241[2] = CFSTR("screenshots");
  v240[2] = CFSTR("entryMetadataName");
  v240[3] = CFSTR("entryIsOptional");
  v241[3] = MEMORY[0x1E0C9AAB0];
  v240[4] = CFSTR("entryExtractor");
  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_19;
  aBlock[3] = &unk_1E44A8760;
  v142 = &unk_1E44F01C8;
  v137 = _Block_copy(aBlock);
  v241[4] = v137;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v241, v240, 5);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v256[7] = v73;
  v239[0] = CFSTR("videoPreviewsByType");
  v238[0] = CFSTR("entryName");
  v238[1] = CFSTR("entryType");
  v239[1] = objc_opt_class();
  v239[2] = CFSTR("previewVideo");
  v238[2] = CFSTR("entryMetadataName");
  v238[3] = CFSTR("entryIsOptional");
  v239[3] = MEMORY[0x1E0C9AAB0];
  v238[4] = CFSTR("entryExtractor");
  v139[0] = v2;
  v139[1] = 3221225472;
  v139[2] = __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_20;
  v139[3] = &unk_1E44A8788;
  v140 = &unk_1E44F01C8;
  v136 = _Block_copy(v139);
  v239[4] = v136;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v239, v238, 5);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v256[8] = v135;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v256, 9);
  v3 = objc_claimAutoreleasedReturnValue();
  v257[2] = CFSTR("additionalProperties");
  v134 = (void *)v3;
  v258[1] = v3;
  v258[2] = &unk_1E44F05F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v258, v257, 3);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v357[9] = v76;
  v356[10] = CFSTR("desktopApp");
  v236[0] = CFSTR("metadataClass");
  v237[0] = objc_opt_class();
  v236[1] = CFSTR("entries");
  v234[0] = CFSTR("name");
  v233[0] = CFSTR("entryName");
  v233[1] = CFSTR("entryType");
  v234[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v234, v233, 2);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v235[0] = v74;
  v232[0] = CFSTR("subtitle");
  v231[0] = CFSTR("entryName");
  v231[1] = CFSTR("entryType");
  v4 = objc_opt_class();
  v231[2] = CFSTR("entryIsOptional");
  v232[1] = v4;
  v232[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v232, v231, 3);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v235[1] = v71;
  v230[0] = CFSTR("genreNames");
  v229[0] = CFSTR("entryName");
  v229[1] = CFSTR("entryType");
  v230[1] = objc_opt_class();
  v230[2] = CFSTR("genre");
  v229[2] = CFSTR("entryMetadataName");
  v229[3] = CFSTR("entryExtractor");
  v230[3] = &__block_literal_global_177;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v230, v229, 4);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v235[2] = v70;
  v228[0] = CFSTR("artwork");
  v227[0] = CFSTR("entryName");
  v227[1] = CFSTR("entryType");
  v228[1] = objc_opt_class();
  v228[2] = CFSTR("icon");
  v227[2] = CFSTR("entryMetadataName");
  v227[3] = CFSTR("entryExtractor");
  v228[3] = &__block_literal_global_178;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v228, v227, 4);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v235[3] = v69;
  v226[0] = CFSTR("screenshotsByType");
  v225[0] = CFSTR("entryName");
  v225[1] = CFSTR("entryType");
  v226[1] = objc_opt_class();
  v226[2] = CFSTR("screenshots");
  v225[2] = CFSTR("entryMetadataName");
  v225[3] = CFSTR("entryIsOptional");
  v225[4] = CFSTR("entryExtractor");
  v226[3] = MEMORY[0x1E0C9AAB0];
  v226[4] = &__block_literal_global_179;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v226, v225, 5);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v235[4] = v67;
  v224[0] = CFSTR("videoPreviewsByType");
  v223[0] = CFSTR("entryName");
  v223[1] = CFSTR("entryType");
  v224[1] = objc_opt_class();
  v224[2] = CFSTR("previewVideo");
  v223[2] = CFSTR("entryMetadataName");
  v223[3] = CFSTR("entryIsOptional");
  v223[4] = CFSTR("entryExtractor");
  v224[3] = MEMORY[0x1E0C9AAB0];
  v224[4] = &__block_literal_global_184;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v224, v223, 5);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v235[5] = v65;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v235, 6);
  v5 = objc_claimAutoreleasedReturnValue();
  v236[2] = CFSTR("additionalProperties");
  v66 = (void *)v5;
  v237[1] = v5;
  v237[2] = &unk_1E44F0618;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v237, v236, 3);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v357[10] = v68;
  v356[11] = CFSTR("epubBook");
  v221[0] = CFSTR("metadataClass");
  v222[0] = objc_opt_class();
  v221[1] = CFSTR("entries");
  v219[0] = CFSTR("name");
  v218[0] = CFSTR("entryName");
  v218[1] = CFSTR("entryType");
  v219[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v219, v218, 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v220[0] = v64;
  v217[0] = CFSTR("artistName");
  v216[0] = CFSTR("entryName");
  v216[1] = CFSTR("entryType");
  v6 = objc_opt_class();
  v216[2] = CFSTR("entryMetadataName");
  v217[1] = v6;
  v217[2] = CFSTR("author");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v217, v216, 3);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v220[1] = v62;
  v215[0] = CFSTR("artwork");
  v214[0] = CFSTR("entryName");
  v214[1] = CFSTR("entryType");
  v7 = objc_opt_class();
  v214[2] = CFSTR("entryExtractor");
  v215[1] = v7;
  v215[2] = &__block_literal_global_197;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v215, v214, 3);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v220[2] = v60;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v220, 3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v222[1] = v61;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v222, v221, 2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v357[11] = v63;
  v356[12] = CFSTR("book");
  v212[0] = CFSTR("metadataClass");
  v213[0] = objc_opt_class();
  v212[1] = CFSTR("entries");
  v210[0] = CFSTR("name");
  v209[0] = CFSTR("entryName");
  v209[1] = CFSTR("entryType");
  v210[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v210, v209, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v211[0] = v59;
  v208[0] = CFSTR("artistName");
  v207[0] = CFSTR("entryName");
  v207[1] = CFSTR("entryType");
  v8 = objc_opt_class();
  v207[2] = CFSTR("entryMetadataName");
  v208[1] = v8;
  v208[2] = CFSTR("author");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v208, v207, 3);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v211[1] = v58;
  v206[0] = CFSTR("narrator");
  v205[0] = CFSTR("entryName");
  v205[1] = CFSTR("entryType");
  v206[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v206, v205, 2);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v211[2] = v57;
  v204[0] = CFSTR("artwork");
  v203[0] = CFSTR("entryName");
  v203[1] = CFSTR("entryType");
  v9 = objc_opt_class();
  v203[2] = CFSTR("entryExtractor");
  v204[1] = v9;
  v204[2] = &__block_literal_global_203;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v204, v203, 3);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v211[3] = v55;
  v202[0] = CFSTR("offers");
  v201[0] = CFSTR("entryName");
  v201[1] = CFSTR("entryType");
  v202[1] = objc_opt_class();
  v202[2] = MEMORY[0x1E0C9AAB0];
  v201[2] = CFSTR("entryIsOptional");
  v201[3] = CFSTR("entryExtractor");
  v202[3] = &__block_literal_global_204;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v202, v201, 4);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v211[4] = v53;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v211, 5);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v213[1] = v54;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v213, v212, 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v357[12] = v56;
  v356[13] = CFSTR("ibook");
  v199[0] = CFSTR("metadataClass");
  v200[0] = objc_opt_class();
  v199[1] = CFSTR("entries");
  v197[0] = CFSTR("name");
  v196[0] = CFSTR("entryName");
  v196[1] = CFSTR("entryType");
  v197[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v197, v196, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v198[0] = v52;
  v195[0] = CFSTR("artistName");
  v194[0] = CFSTR("entryName");
  v194[1] = CFSTR("entryType");
  v10 = objc_opt_class();
  v194[2] = CFSTR("entryMetadataName");
  v195[1] = v10;
  v195[2] = CFSTR("author");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v195, v194, 3);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v198[1] = v50;
  v193[0] = CFSTR("artwork");
  v192[0] = CFSTR("entryName");
  v192[1] = CFSTR("entryType");
  v11 = objc_opt_class();
  v192[2] = CFSTR("entryExtractor");
  v193[1] = v11;
  v193[2] = &__block_literal_global_207;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v193, v192, 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v198[2] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v198, 3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v200[1] = v49;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v200, v199, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v357[13] = v51;
  v356[14] = CFSTR("tvEpisode");
  v190[0] = CFSTR("metadataClass");
  v191[0] = objc_opt_class();
  v190[1] = CFSTR("entries");
  v188[0] = CFSTR("name");
  v187[0] = CFSTR("entryName");
  v187[1] = CFSTR("entryType");
  v12 = objc_opt_class();
  v187[2] = CFSTR("entryMetadataName");
  v188[1] = v12;
  v188[2] = CFSTR("episodeName");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v188, v187, 3);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v189[0] = v47;
  v186[0] = CFSTR("genreNames");
  v185[0] = CFSTR("entryName");
  v185[1] = CFSTR("entryType");
  v186[1] = objc_opt_class();
  v186[2] = CFSTR("genre");
  v185[2] = CFSTR("entryMetadataName");
  v185[3] = CFSTR("entryExtractor");
  v186[3] = &__block_literal_global_211;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v186, v185, 4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v189[1] = v46;
  v184[0] = CFSTR("collectionName");
  v183[0] = CFSTR("entryName");
  v183[1] = CFSTR("entryType");
  v13 = objc_opt_class();
  v183[2] = CFSTR("entryMetadataName");
  v184[1] = v13;
  v184[2] = CFSTR("seasonName");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v184, v183, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v189[2] = v44;
  v182[0] = CFSTR("artwork");
  v181[0] = CFSTR("entryName");
  v181[1] = CFSTR("entryType");
  v14 = objc_opt_class();
  v181[2] = CFSTR("entryExtractor");
  v182[1] = v14;
  v182[2] = &__block_literal_global_214;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v182, v181, 3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v189[3] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v189, 4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v191[1] = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v191, v190, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v357[14] = v45;
  v356[15] = CFSTR("tvSeason");
  v179[0] = CFSTR("metadataClass");
  v180[0] = objc_opt_class();
  v179[1] = CFSTR("entries");
  v177[0] = CFSTR("name");
  v176[0] = CFSTR("entryName");
  v176[1] = CFSTR("entryType");
  v177[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v177, v176, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v178[0] = v41;
  v175[0] = CFSTR("genreNames");
  v174[0] = CFSTR("entryName");
  v174[1] = CFSTR("entryType");
  v175[1] = objc_opt_class();
  v175[2] = CFSTR("genre");
  v174[2] = CFSTR("entryMetadataName");
  v174[3] = CFSTR("entryExtractor");
  v175[3] = &__block_literal_global_218;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v175, v174, 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v178[1] = v39;
  v173[0] = CFSTR("artwork");
  v172[0] = CFSTR("entryName");
  v172[1] = CFSTR("entryType");
  v15 = objc_opt_class();
  v172[2] = CFSTR("entryExtractor");
  v173[1] = v15;
  v173[2] = &__block_literal_global_219;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v173, v172, 3);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v178[2] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v178, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v180[1] = v38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v180, v179, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v357[15] = v40;
  v356[16] = CFSTR("showBrand");
  v170[0] = CFSTR("metadataClass");
  v171[0] = objc_opt_class();
  v170[1] = CFSTR("entries");
  v168[0] = CFSTR("name");
  v167[0] = CFSTR("entryName");
  v167[1] = CFSTR("entryType");
  v168[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v168, v167, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v169[0] = v35;
  v166[0] = CFSTR("artwork");
  v165[0] = CFSTR("entryName");
  v165[1] = CFSTR("entryType");
  v16 = objc_opt_class();
  v165[2] = CFSTR("entryExtractor");
  v166[1] = v16;
  v166[2] = &__block_literal_global_223;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v166, v165, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v169[1] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v169, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v171[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v171, v170, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v357[16] = v36;
  v356[17] = CFSTR("movie");
  v163[0] = CFSTR("metadataClass");
  v164[0] = objc_opt_class();
  v163[1] = CFSTR("entries");
  v161[0] = CFSTR("name");
  v160[0] = CFSTR("entryName");
  v160[1] = CFSTR("entryType");
  v161[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v161, v160, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v162[0] = v32;
  v159[0] = CFSTR("genreNames");
  v158[0] = CFSTR("entryName");
  v158[1] = CFSTR("entryType");
  v159[1] = objc_opt_class();
  v159[2] = CFSTR("genre");
  v158[2] = CFSTR("entryMetadataName");
  v158[3] = CFSTR("entryExtractor");
  v159[3] = &__block_literal_global_227;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v159, v158, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v162[1] = v31;
  v157[0] = CFSTR("artwork");
  v156[0] = CFSTR("entryName");
  v156[1] = CFSTR("entryType");
  v17 = objc_opt_class();
  v156[2] = CFSTR("entryExtractor");
  v157[1] = v17;
  v157[2] = &__block_literal_global_228;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v157, v156, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v162[2] = v30;
  v155[0] = CFSTR("offers");
  v154[0] = CFSTR("entryName");
  v154[1] = CFSTR("entryType");
  v155[1] = objc_opt_class();
  v155[2] = MEMORY[0x1E0C9AAB0];
  v154[2] = CFSTR("entryIsOptional");
  v154[3] = CFSTR("entryExtractor");
  v155[3] = &__block_literal_global_229;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v155, v154, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v162[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v162, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v164[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v164, v163, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v357[17] = v20;
  v356[18] = CFSTR("movieBundle");
  v152[0] = CFSTR("metadataClass");
  v153[0] = objc_opt_class();
  v152[1] = CFSTR("entries");
  v150[0] = CFSTR("name");
  v149[0] = CFSTR("entryName");
  v149[1] = CFSTR("entryType");
  v150[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v150, v149, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v151[0] = v21;
  v148[0] = CFSTR("genreNames");
  v147[0] = CFSTR("entryName");
  v147[1] = CFSTR("entryType");
  v148[1] = objc_opt_class();
  v148[2] = CFSTR("genre");
  v147[2] = CFSTR("entryMetadataName");
  v147[3] = CFSTR("entryExtractor");
  v148[3] = &__block_literal_global_233;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v148, v147, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v151[1] = v22;
  v146[0] = CFSTR("artwork");
  v145[0] = CFSTR("entryName");
  v145[1] = CFSTR("entryType");
  v23 = objc_opt_class();
  v145[2] = CFSTR("entryExtractor");
  v146[1] = v23;
  v146[2] = &__block_literal_global_234;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v146, v145, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v151[2] = v24;
  v144[0] = CFSTR("offers");
  v143[0] = CFSTR("entryName");
  v143[1] = CFSTR("entryType");
  v144[1] = objc_opt_class();
  v144[2] = MEMORY[0x1E0C9AAB0];
  v143[2] = CFSTR("entryIsOptional");
  v143[3] = CFSTR("entryExtractor");
  v144[3] = &__block_literal_global_235;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v144, v143, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v151[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v151, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v153[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v153, v152, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v357[18] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v357, v356, 19);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 300, 300, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_2(uint64_t a1, uint64_t a2)
{
  +[LPiTunesMediaMetadataProviderSpecialization extractOffers:](LPiTunesMediaMetadataProviderSpecialization, "extractOffers:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_3(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 900, 900, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_4(uint64_t a1, uint64_t a2)
{
  +[LPiTunesMediaMetadataProviderSpecialization extractOffers:](LPiTunesMediaMetadataProviderSpecialization, "extractOffers:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_5(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 300, 300, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_6(uint64_t a1, uint64_t a2)
{
  +[LPiTunesMediaMetadataProviderSpecialization extractOffers:](LPiTunesMediaMetadataProviderSpecialization, "extractOffers:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_7(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 900, 900, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("offers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[LPiTunesMediaMetadataProviderSpecialization extractOffers:](LPiTunesMediaMetadataProviderSpecialization, "extractOffers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_9(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 900, 900, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_11(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 900, 900, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_12(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 900, 900, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("subscriptionCover"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    mediaAsset(v3, CFSTR("artwork"), 900, 900, CFSTR("cc"), CFSTR("png"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("subscriptionHero"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      mediaAsset(v5, CFSTR("artwork"), 900, 900, CFSTR("cc"), CFSTR("png"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_14(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 900, 900, CFSTR("cc"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_15(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 900, 900, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_17(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("icon"), 300, 300, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_18(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("messagesAppIcon"), 400, 300, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_19(uint64_t a1, uint64_t a2)
{
  +[LPiTunesMediaMetadataProviderSpecialization assetArrayFromScreenshotDictionary:usingPreferredPlatformArray:](LPiTunesMediaMetadataProviderSpecialization, "assetArrayFromScreenshotDictionary:usingPreferredPlatformArray:", a2, *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_20(uint64_t a1, uint64_t a2)
{
  +[LPiTunesMediaMetadataProviderSpecialization assetFromVideoPreviewDictionary:usingPreferredPlatformArray:](LPiTunesMediaMetadataProviderSpecialization, "assetFromVideoPreviewDictionary:usingPreferredPlatformArray:", a2, *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_21(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_22(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("icon"), 300, 300, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_23(uint64_t a1, uint64_t a2)
{
  +[LPiTunesMediaMetadataProviderSpecialization assetArrayFromScreenshotDictionary:usingPreferredPlatformArray:](LPiTunesMediaMetadataProviderSpecialization, "assetArrayFromScreenshotDictionary:usingPreferredPlatformArray:", a2, &unk_1E44F01E0);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_24(uint64_t a1, uint64_t a2)
{
  +[LPiTunesMediaMetadataProviderSpecialization assetFromVideoPreviewDictionary:usingPreferredPlatformArray:](LPiTunesMediaMetadataProviderSpecialization, "assetFromVideoPreviewDictionary:usingPreferredPlatformArray:", a2, &unk_1E44F01F8);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_25(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 900, 900, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_26(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 900, 900, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_27(uint64_t a1, uint64_t a2)
{
  +[LPiTunesMediaMetadataProviderSpecialization extractOffers:](LPiTunesMediaMetadataProviderSpecialization, "extractOffers:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_28(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 900, 900, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_29(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_30(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 300, 300, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_31(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_32(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 900, 900, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_33(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 900, 900, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_34(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_35(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 900, 900, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_36(uint64_t a1, uint64_t a2)
{
  +[LPiTunesMediaMetadataProviderSpecialization extractOffers:](LPiTunesMediaMetadataProviderSpecialization, "extractOffers:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_37(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_38(uint64_t a1, void *a2)
{
  mediaAsset(a2, CFSTR("artwork"), 900, 900, CFSTR("bb"), CFSTR("png"));
  return (id)objc_claimAutoreleasedReturnValue();
}

id __53__LPiTunesMediaMetadataProviderSpecialization_schema__block_invoke_39(uint64_t a1, uint64_t a2)
{
  +[LPiTunesMediaMetadataProviderSpecialization extractOffers:](LPiTunesMediaMetadataProviderSpecialization, "extractOffers:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)processResponseDictionary:(id)a3 withStorefrontIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  LPiTunesMediaMetadataProviderSpecialization *v15;
  LPiTunesMediaMetadataProviderSpecialization *v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t identifier;
  void *v23;
  LPiTunesMediaMetadataProviderSpecialization *v25;
  void *v26;
  id v27;
  void *v28;
  id obj;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[32];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = a4;
  v31 = v6;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kind"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[LPiTunesMediaMetadataProviderSpecialization schema](self, "schema");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v28);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v8;
    if (v8)
    {
      v30 = objc_alloc_init((Class)(id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("metadataClass")));
      objc_msgSend(v30, "setValue:forKey:", self->_identifier, CFSTR("storeIdentifier"));
      objc_msgSend(v30, "setValue:forKey:", v27, CFSTR("storeFrontIdentifier"));
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entries"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = self;
      obj = v9;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v38;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v38 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            v34[0] = MEMORY[0x1E0C809B0];
            v34[1] = 3221225472;
            v34[2] = __98__LPiTunesMediaMetadataProviderSpecialization_processResponseDictionary_withStorefrontIdentifier___block_invoke;
            v34[3] = &unk_1E44A89D0;
            v35 = v31;
            v36 = v13;
            __98__LPiTunesMediaMetadataProviderSpecialization_processResponseDictionary_withStorefrontIdentifier___block_invoke((uint64_t)v34);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("entryMetadataName"));
              v15 = (LPiTunesMediaMetadataProviderSpecialization *)objc_claimAutoreleasedReturnValue();
              v16 = v15;
              if (!v15)
              {
                objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("entryName"));
                self = (LPiTunesMediaMetadataProviderSpecialization *)objc_claimAutoreleasedReturnValue();
                v16 = self;
              }
              objc_msgSend(v30, "setValue:forKey:", v14, v16);
              if (!v15)

            }
            else
            {
              objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("entryIsOptional"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "BOOLValue");

              if ((v18 & 1) == 0)
              {
                v21 = (id)LPLogChannelFetching();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
                {
                  identifier = (uint64_t)v25->_identifier;
                  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("entryName"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  -[LPiTunesMediaMetadataProviderSpecialization processResponseDictionary:withStorefrontIdentifier:].cold.1(identifier, v23, (uint64_t)v41, v21);
                }

                v20 = 0;
                v19 = obj;
                goto LABEL_26;
              }
            }

          }
          v9 = obj;
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
          if (v10)
            continue;
          break;
        }
      }

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("additionalProperties"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __98__LPiTunesMediaMetadataProviderSpecialization_processResponseDictionary_withStorefrontIdentifier___block_invoke_243;
        v32[3] = &unk_1E44A89F8;
        v33 = v30;
        objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v32);

      }
      v20 = v30;
LABEL_26:

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

id __98__LPiTunesMediaMetadataProviderSpecialization_processResponseDictionary_withStorefrontIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("entryName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("entryType")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("entryExtractor"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (!v7
      || ((*(void (**)(uint64_t, id))(v7 + 16))(v7, v4),
          v9 = objc_claimAutoreleasedReturnValue(),
          v4,
          (v4 = (id)v9) != 0))
    {
      v4 = v4;
    }

    v10 = v4;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __98__LPiTunesMediaMetadataProviderSpecialization_processResponseDictionary_withStorefrontIdentifier___block_invoke_243(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", a3, a2);
}

- (void)resolve
{
  LPiTunesMediaUnresolvedMetadata **p_unresolvedMetadata;
  LPSpecializationMetadata *v4;
  LPSpecializationMetadata *resolvedMetadata;
  void *v6;
  LPFetcherConfiguration *v7;
  void *v8;
  void *v9;
  LPFetcherGroup *v10;
  LPFetcherGroup *v11;
  LPFetcherGroup *fetcherGroup;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  LPFetcherGroup *v17;
  void *v18;
  LPiTunesMediaAsset *v19;
  LPFetcherGroup *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_unresolvedMetadata = &self->_unresolvedMetadata;
  -[LPiTunesMediaUnresolvedMetadata resolve](self->_unresolvedMetadata, "resolve");
  v4 = (LPSpecializationMetadata *)objc_claimAutoreleasedReturnValue();
  resolvedMetadata = self->_resolvedMetadata;
  self->_resolvedMetadata = v4;

  -[LPiTunesMediaUnresolvedMetadata assetsToFetch](*p_unresolvedMetadata, "assetsToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(LPFetcherConfiguration);
  -[LPMetadataProviderSpecialization context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPFetcherConfiguration setRootEvent:](v7, "setRootEvent:", v9);

  v10 = [LPFetcherGroup alloc];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __54__LPiTunesMediaMetadataProviderSpecialization_resolve__block_invoke;
  v26[3] = &unk_1E44A8A20;
  v26[4] = self;
  v11 = -[LPFetcherGroup initWithPolicy:configuration:description:completionHandler:](v10, "initWithPolicy:configuration:description:completionHandler:", 0, v7, CFSTR("iTunes Assets"), v26);
  fetcherGroup = self->_fetcherGroup;
  self->_fetcherGroup = v11;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v23;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v13);
        v17 = self->_fetcherGroup;
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v16), "fetcher", (_QWORD)v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[LPFetcherGroup appendFetcher:](v17, "appendFetcher:", v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v14);
  }

  if (self->_lyricComponents)
  {
    v19 = -[LPiTunesMediaAsset initWithName:lyricComponents:]([LPiTunesMediaAsset alloc], "initWithName:lyricComponents:", CFSTR("lyricExcerpt"), self->_lyricComponents);
    v20 = self->_fetcherGroup;
    -[LPiTunesMediaAsset fetcher](v19, "fetcher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[LPFetcherGroup appendFetcher:](v20, "appendFetcher:", v21);

  }
  -[LPFetcherGroup doneAddingFetchers](self->_fetcherGroup, "doneAddingFetchers", (_QWORD)v22);

}

void __54__LPiTunesMediaMetadataProviderSpecialization_resolve__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "userData");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "image");
          v8 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v6, "string");
            v8 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v6, "URL");
              v8 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v6, "lyrics");
                v8 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_22;
                objc_msgSend(v6, "video");
                v8 = objc_claimAutoreleasedReturnValue();
              }
            }
          }
        }
        v9 = (void *)v8;
        v10 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
        objc_msgSend(v7, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "valueForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v16 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
          objc_msgSend(v7, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setValue:forKey:", v9, v13);
          goto LABEL_20;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "arrayByAddingObject:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
          objc_msgSend(v7, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setValue:forKey:", v13, v15);

LABEL_20:
        }

LABEL_22:
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v3);
  }

  objc_msgSend(*(id *)(a1 + 32), "done");
}

- (void)start
{
  LPiTunesMediaLookupTask *v3;
  LPiTunesMediaLookupTask *lookupTask;
  LPiTunesMediaLookupTask *v5;
  _QWORD v6[5];

  v3 = -[LPiTunesMediaLookupTask initWithIdentifier:storefrontCountryCode:]([LPiTunesMediaLookupTask alloc], "initWithIdentifier:storefrontCountryCode:", self->_identifier, self->_storefrontCountryCode);
  lookupTask = self->_lookupTask;
  self->_lookupTask = v3;

  v5 = self->_lookupTask;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__LPiTunesMediaMetadataProviderSpecialization_start__block_invoke;
  v6[3] = &unk_1E44A8A48;
  v6[4] = self;
  -[LPiTunesMediaLookupTask start:](v5, "start:", v6);
}

void __52__LPiTunesMediaMetadataProviderSpecialization_start__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__LPiTunesMediaMetadataProviderSpecialization_start__block_invoke_2;
  v13[3] = &unk_1E44A8388;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v9;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  v12 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

}

uint64_t __52__LPiTunesMediaMetadataProviderSpecialization_start__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  id *v2;
  uint64_t v3;
  void *v4;
  uint64_t *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = (id *)(result + 32);
  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    v3 = result;
    v4 = *(void **)(v1 + 48);
    *(_QWORD *)(v1 + 48) = 0;

    v5 = (uint64_t *)(v3 + 40);
    if (*(_QWORD *)(v3 + 40))
    {
      v6 = LPLogChannelFetching();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        __52__LPiTunesMediaMetadataProviderSpecialization_start__block_invoke_2_cold_3((uint64_t)v2, v5, v6);
    }
    else
    {
      v7 = *(_QWORD *)(v3 + 48);
      if (v7)
      {
        objc_msgSend(*(id *)(v3 + 32), "processResponseDictionary:withStorefrontIdentifier:", v7, *(_QWORD *)(v3 + 56));
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(v3 + 32);
        v10 = *(void **)(v9 + 64);
        *(_QWORD *)(v9 + 64) = v8;

        v11 = *(_QWORD **)(v3 + 32);
        if (v11[8])
          return objc_msgSend(v11, "resolve");
        v19 = LPLogChannelFetching();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          __52__LPiTunesMediaMetadataProviderSpecialization_start__block_invoke_2_cold_2((uint64_t)v2, v19, v20, v21, v22, v23, v24, v25);
      }
      else
      {
        v12 = LPLogChannelFetching();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          __52__LPiTunesMediaMetadataProviderSpecialization_start__block_invoke_2_cold_1((uint64_t)v2, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    return objc_msgSend(*v2, "fail");
  }
  return result;
}

+ (void)requestSourceApplicationMetadataForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  LPSourceApplicationMetadata *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  LPSourceApplicationMetadata *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  LPiTunesMediaLookupTask *v16;
  id v17;
  LPiTunesMediaLookupTask *v18;
  _QWORD v19[4];
  LPSourceApplicationMetadata *v20;
  LPiTunesMediaLookupTask *v21;
  id v22;
  id v23;
  _QWORD aBlock[4];
  id v25;
  _QWORD v26[4];
  id v27;
  LPSourceApplicationMetadata *v28;
  id v29;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(LPSourceApplicationMetadata);
  -[LPSourceApplicationMetadata setBundleIdentifier:](v7, "setBundleIdentifier:", v5);
  v8 = LPLogChannelFetching();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0C41000, v8, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider requestSourceApplication trying local fetch", buf, 2u);
  }
  v9 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke;
  v26[3] = &unk_1E44A8A70;
  v10 = v5;
  v27 = v10;
  v11 = v7;
  v28 = v11;
  v12 = v6;
  v29 = v12;
  if (__117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke((uint64_t)v26))
  {
    v13 = LPLogChannelFetching();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0C41000, v13, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider requestSourceApplication local fetch succeeded", buf, 2u);
    }
  }
  else
  {
    aBlock[0] = v9;
    aBlock[1] = 3221225472;
    aBlock[2] = __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke_267;
    aBlock[3] = &unk_1E44A8A98;
    v14 = v12;
    v25 = v14;
    v15 = _Block_copy(aBlock);
    v16 = -[LPiTunesMediaLookupTask initWithBundleIdentifier:]([LPiTunesMediaLookupTask alloc], "initWithBundleIdentifier:", v10);
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke_269;
    v19[3] = &unk_1E44A8B10;
    v17 = v15;
    v22 = v17;
    v20 = v11;
    v21 = v16;
    v23 = v14;
    v18 = v16;
    -[LPiTunesMediaLookupTask start:](v18, "start:", v19);

  }
}

uint64_t __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CA5870]);
  v3 = *(_QWORD *)(a1 + 32);
  v19 = 0;
  v4 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, &v19);
  v5 = v19;
  if (v5)
  {
    v6 = LPLogChannelFetching();
    v7 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_impl(&dword_1A0C41000, v6, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider requestSourceApplication local fetch failed: %@", buf, 0xCu);
      v7 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setName:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", 48.0, 48.0, 1.0);
    objc_msgSend(v10, "setShouldApplyMask:", 0);
    objc_msgSend(v9, "prepareImageForDescriptor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "CGImage");
    if (v12)
    {
      v13 = -[LPImage _initWithCGImage:]([LPImage alloc], "_initWithCGImage:", v12);
      objc_msgSend(*(id *)(a1 + 40), "setIcon:", v13);

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke_265;
      block[3] = &unk_1E44A7E78;
      v18 = *(id *)(a1 + 48);
      v17 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v7 = 1;
    }
    else
    {
      v14 = LPLogChannelFetching();
      v7 = 0;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0C41000, v14, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider requestSourceApplication local fetch failed: no icon", buf, 2u);
        v7 = 0;
      }
    }

  }
  return v7;
}

uint64_t __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke_265(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke_267(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke_2;
  v5[3] = &unk_1E44A7F60;
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = LPLogChannelFetching();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1A0C41000, v2, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider requestSourceApplication remote fetch failed: %@", (uint8_t *)&v6, 0xCu);
  }
  v4 = *(_QWORD *)(a1 + 40);
  makeLPError(2, *(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

}

void __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke_269(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  LPFetcherConfiguration *v11;
  LPFetcherConfiguration *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  LPFetcherConfiguration *v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v6 = a2;
  v7 = a4;
  if (v7)
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(a1[4], "setName:", v8);
      objc_msgSend(v6, "objectForKey:", CFSTR("artwork"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        mediaAsset(v9, CFSTR("artwork"), 48, 48, CFSTR("bb"), CFSTR("png"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_alloc_init(LPFetcherConfiguration);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke_2_270;
        v14[3] = &unk_1E44A8AE8;
        v15 = v10;
        v16 = v11;
        v19 = a1[6];
        v17 = a1[5];
        v18 = a1[4];
        v20 = a1[7];
        v12 = v11;
        v13 = v10;
        dispatch_async(MEMORY[0x1E0C80D38], v14);

      }
      else
      {
        (*((void (**)(void))a1[6] + 2))();
      }

    }
    else
    {
      (*((void (**)(void))a1[6] + 2))();
    }

  }
}

void __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke_2_270(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "fetcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke_3;
  v5[3] = &unk_1E44A8AC0;
  v9 = *(id *)(a1 + 64);
  v6 = *(id *)(a1 + 48);
  v7 = v2;
  v8 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 72);
  v4 = v2;
  objc_msgSend(v4, "fetchWithConfiguration:completionHandler:", v3, v5);

}

void __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (objc_msgSend(v3, "state") == 2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = *(id *)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v3, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setIcon:", v6);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke_4;
    v7[3] = &unk_1E44A7E78;
    v9 = *(id *)(a1 + 64);
    v8 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __117__LPiTunesMediaMetadataProviderSpecialization_requestSourceApplicationMetadataForBundleIdentifier_completionHandler___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = LPLogChannelFetching();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A0C41000, v2, OS_LOG_TYPE_DEFAULT, "LPMetadataProvider requestSourceApplication remote fetch succeeded", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)completed
{
  -[LPFetcherGroup cancel](self->_fetcherGroup, "cancel");
}

- (void)cancel
{
  -[LPiTunesMediaMetadataProviderSpecialization completed](self, "completed");
  self->_canceled = 1;
}

- (void)fail
{
  id v3;

  -[LPiTunesMediaMetadataProviderSpecialization cancel](self, "cancel");
  -[LPMetadataProviderSpecialization delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataProviderSpecializationDidFail:", self);

}

- (void)done
{
  void *v3;
  void *v4;
  LPLinkMetadata *v5;

  -[LPiTunesMediaMetadataProviderSpecialization completed](self, "completed");
  v5 = objc_alloc_init(LPLinkMetadata);
  -[LPMetadataProviderSpecialization URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPLinkMetadata setURL:](v5, "setURL:", v3);

  -[LPLinkMetadata setSpecialization:](v5, "setSpecialization:", self->_resolvedMetadata);
  -[LPMetadataProviderSpecialization delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadataProviderSpecialization:didCompleteWithMetadata:", self, v5);

}

- (void)_internalPostProcessResolvedMetadataWithCompletionHandler:(id)a3
{
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[LPSpecializationMetadata artwork](self->_resolvedMetadata, "artwork");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_computeDominantColorForProperties");

  }
  v5[2]();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetcherGroup, 0);
  objc_storeStrong((id *)&self->_lyricComponents, 0);
  objc_storeStrong((id *)&self->_unresolvedMetadata, 0);
  objc_storeStrong((id *)&self->_resolvedMetadata, 0);
  objc_storeStrong((id *)&self->_lookupTask, 0);
  objc_storeStrong((id *)&self->_storefrontCountryCode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)processResponseDictionary:(uint64_t)a3 withStorefrontIdentifier:(NSObject *)a4 .cold.1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_1_1(&dword_1A0C41000, a4, a3, "LPiTunesMediaMetadataProviderSpecialization (ID: %@) - Missing value for non-optional entry '%@'.", (uint8_t *)a3);

}

void __52__LPiTunesMediaMetadataProviderSpecialization_start__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A0C41000, a2, a3, "LPiTunesMediaMetadataProviderSpecialization (ID: %@) - Response from the iTunes store was null.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __52__LPiTunesMediaMetadataProviderSpecialization_start__block_invoke_2_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A0C41000, a2, a3, "LPiTunesMediaMetadataProviderSpecialization (ID: %@) - Failed parsing response dictionary.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __52__LPiTunesMediaMetadataProviderSpecialization_start__block_invoke_2_cold_3(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_1_1(&dword_1A0C41000, a3, (uint64_t)a3, "LPiTunesMediaMetadataProviderSpecialization (ID: %@) - Error looking up identifier from the iTunes store - %@.", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1_0();
}

@end
