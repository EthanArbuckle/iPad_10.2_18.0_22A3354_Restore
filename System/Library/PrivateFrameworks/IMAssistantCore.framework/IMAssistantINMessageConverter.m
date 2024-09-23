@implementation IMAssistantINMessageConverter

+ (id)messageEffectTypeToExpressiveSendIdDictionary
{
  if (qword_25548BA68 != -1)
    dispatch_once(&qword_25548BA68, &unk_24E396160);
  return (id)qword_25548BA60;
}

+ (int64_t)messageEffectTypeFromExpressiveSendId:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  +[IMAssistantINMessageConverter messageEffectTypeToExpressiveSendIdDictionary](IMAssistantINMessageConverter, "messageEffectTypeToExpressiveSendIdDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v3;
        _os_log_impl(&dword_21ED90000, v8, OS_LOG_TYPE_INFO, "No effect for effect identifier: %@", (uint8_t *)&v10, 0xCu);
      }

    }
    goto LABEL_9;
  }
  v7 = objc_msgSend(v5, "integerValue");

LABEL_10:
  return v7;
}

+ (id)expressiveSendIdFromMessageEffectType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    +[IMAssistantINMessageConverter messageEffectTypeToExpressiveSendIdDictionary](IMAssistantINMessageConverter, "messageEffectTypeToExpressiveSendIdDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeysForObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)__INMessageLinkMetadataForLPLinkMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
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

  v3 = a3;
  objc_msgSend(v3, "images");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__imArrayByApplyingBlock:", &unk_24E3961A0);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "icons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__imArrayByApplyingBlock:", &unk_24E3961E0);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v3;
  objc_msgSend(v3, "specialization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2207BE210](CFSTR("LPiTunesMediaSongMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPiTunesMediaAlbumMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPiTunesMediaMusicVideoMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPiTunesMediaArtistMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPiTunesMediaPlaylistMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPiTunesMediaRadioMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPiTunesMediaSoftwareMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPiTunesMediaBookMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPiTunesMediaAudioBookMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPiTunesMediaPodcastEpisodeMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPiTunesMediaPodcastMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPiTunesMediaTVEpisodeMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPiTunesMediaTVSeasonMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPiTunesMediaMovieMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPiTunesMediaMovieBundleMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPAppleTVMetadata"), CFSTR("LinkPresentation"));
  MEMORY[0x2207BE210](CFSTR("LPAppleMusicTVShowMetadata"), CFSTR("LinkPresentation"));
  v37 = v6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v6;
      objc_msgSend(v12, "storeFrontIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "storeIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "artist");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = 0;
      v75 = 0;
      v72 = 0;
      v73 = 0;
      v70 = 0;
      v71 = 0;
      v68 = 0;
      v69 = 0;
      v66 = 0;
      v67 = 0;
      v64 = 0;
      v65 = 0;
      v62 = 0;
      v63 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0;
      v46 = 0;
      v47 = 0;
      v55 = 0;
      v54 = 0;
      v8 = 0;
      v9 = 0;
      v40 = 0;
      v41 = 0;
      v10 = 0;
      v58 = 0;
      v56 = 0;
      v57 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v11 = 2;
      goto LABEL_29;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v6;
      objc_msgSend(v13, "storeFrontIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "storeIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "artist");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = 0;
      v75 = 0;
      v72 = 0;
      v73 = 0;
      v70 = 0;
      v71 = 0;
      v68 = 0;
      v69 = 0;
      v66 = 0;
      v67 = 0;
      v64 = 0;
      v65 = 0;
      v62 = 0;
      v63 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0;
      v46 = 0;
      v47 = 0;
      v55 = 0;
      v54 = 0;
      v8 = 0;
      v9 = 0;
      v40 = 0;
      v41 = 0;
      v10 = 0;
      v58 = 0;
      v56 = 0;
      v57 = 0;
      v52 = 0;
      v53 = 0;
      v48 = 0;
      v49 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v11 = 3;
      goto LABEL_29;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v6;
      objc_msgSend(v14, "storeFrontIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "storeIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "genre");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = 0;
      v75 = 0;
      v72 = 0;
      v73 = 0;
      v70 = 0;
      v71 = 0;
      v68 = 0;
      v69 = 0;
      v66 = 0;
      v67 = 0;
      v64 = 0;
      v65 = 0;
      v62 = 0;
      v63 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0;
      v46 = 0;
      v47 = 0;
      v55 = 0;
      v54 = 0;
      v8 = 0;
      v9 = 0;
      v40 = 0;
      v41 = 0;
      v10 = 0;
      v58 = 0;
      v56 = 0;
      v57 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v11 = 4;
      goto LABEL_29;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v6;
      objc_msgSend(v15, "storeFrontIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "storeIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "curator");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = 0;
      v75 = 0;
      v72 = 0;
      v73 = 0;
      v70 = 0;
      v71 = 0;
      v68 = 0;
      v69 = 0;
      v66 = 0;
      v67 = 0;
      v64 = 0;
      v65 = 0;
      v62 = 0;
      v63 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0;
      v46 = 0;
      v47 = 0;
      v55 = 0;
      v54 = 0;
      v8 = 0;
      v9 = 0;
      v40 = 0;
      v41 = 0;
      v10 = 0;
      v58 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v11 = 5;
      goto LABEL_29;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v6;
      objc_msgSend(v16, "storeFrontIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "storeIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "curator");
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      v73 = 0;
      v74 = 0;
      v71 = 0;
      v72 = 0;
      v69 = 0;
      v70 = 0;
      v67 = 0;
      v68 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v62 = 0;
      v63 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0;
      v46 = 0;
      v47 = 0;
      v55 = 0;
      v54 = 0;
      v8 = 0;
      v9 = 0;
      v40 = 0;
      v41 = 0;
      v10 = 0;
      v56 = 0;
      v57 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v11 = 6;
      goto LABEL_29;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v6;
      objc_msgSend(v17, "storeFrontIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "storeIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "name");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "genre");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "platform");
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      v75 = 0;
      v70 = 0;
      v71 = 0;
      v68 = 0;
      v69 = 0;
      v66 = 0;
      v67 = 0;
      v64 = 0;
      v65 = 0;
      v62 = 0;
      v63 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0;
      v46 = 0;
      v47 = 0;
      v55 = 0;
      v54 = 0;
      v8 = 0;
      v9 = 0;
      v40 = 0;
      v41 = 0;
      v10 = 0;
      v58 = 0;
      v56 = 0;
      v57 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v11 = 7;
      goto LABEL_29;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = v6;
      objc_msgSend(v18, "storeFrontIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "storeIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "name");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "author");
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = 0;
      v75 = 0;
      v72 = 0;
      v73 = 0;
      v70 = 0;
      v67 = 0;
      v68 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v62 = 0;
      v63 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0;
      v46 = 0;
      v47 = 0;
      v55 = 0;
      v54 = 0;
      v8 = 0;
      v9 = 0;
      v40 = 0;
      v41 = 0;
      v10 = 0;
      v58 = 0;
      v56 = 0;
      v57 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v11 = 8;
      goto LABEL_29;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v6;
      objc_msgSend(v19, "storeFrontIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "storeIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "name");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "author");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "narrator");
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = 0;
      v75 = 0;
      v72 = 0;
      v73 = 0;
      v71 = 0;
      v69 = 0;
      v64 = 0;
      v65 = 0;
      v66 = 0;
      v62 = 0;
      v63 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0;
      v46 = 0;
      v47 = 0;
      v55 = 0;
      v54 = 0;
      v8 = 0;
      v9 = 0;
      v40 = 0;
      v41 = 0;
      v10 = 0;
      v58 = 0;
      v56 = 0;
      v57 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v11 = 9;
      goto LABEL_29;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v6;
      objc_msgSend(v20, "storeFrontIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "storeIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "episodeName");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "podcastName");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "artist");
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = 0;
      v75 = 0;
      v72 = 0;
      v73 = 0;
      v70 = 0;
      v71 = 0;
      v68 = 0;
      v69 = 0;
      v67 = 0;
      v64 = 0;
      v65 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0;
      v46 = 0;
      v47 = 0;
      v55 = 0;
      v54 = 0;
      v8 = 0;
      v9 = 0;
      v40 = 0;
      v41 = 0;
      v10 = 0;
      v58 = 0;
      v56 = 0;
      v57 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v11 = 11;
      goto LABEL_29;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v6;
      objc_msgSend(v21, "storeFrontIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "storeIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "name");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "artist");
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = 0;
      v75 = 0;
      v72 = 0;
      v73 = 0;
      v70 = 0;
      v71 = 0;
      v68 = 0;
      v69 = 0;
      v66 = 0;
      v67 = 0;
      v62 = 0;
      v63 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0;
      v46 = 0;
      v47 = 0;
      v55 = 0;
      v54 = 0;
      v8 = 0;
      v9 = 0;
      v40 = 0;
      v41 = 0;
      v10 = 0;
      v58 = 0;
      v56 = 0;
      v57 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v11 = 10;
      goto LABEL_29;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v6;
      objc_msgSend(v22, "storeFrontIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "storeIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "episodeName");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "seasonName");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "genre");
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = 0;
      v75 = 0;
      v72 = 0;
      v73 = 0;
      v70 = 0;
      v71 = 0;
      v68 = 0;
      v69 = 0;
      v66 = 0;
      v67 = 0;
      v64 = 0;
      v65 = 0;
      v62 = 0;
      v63 = 0;
      v46 = 0;
      v47 = 0;
      v55 = 0;
      v54 = 0;
      v8 = 0;
      v9 = 0;
      v40 = 0;
      v41 = 0;
      v10 = 0;
      v58 = 0;
      v56 = 0;
      v57 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v11 = 12;
      goto LABEL_29;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v6;
      objc_msgSend(v23, "storeFrontIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "storeIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "name");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "genre");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = 0;
      v75 = 0;
      v72 = 0;
      v73 = 0;
      v70 = 0;
      v71 = 0;
      v68 = 0;
      v69 = 0;
      v66 = 0;
      v67 = 0;
      v64 = 0;
      v65 = 0;
      v62 = 0;
      v63 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0;
      v54 = 0;
      v8 = 0;
      v47 = 0;
      v48 = 0;
      v9 = 0;
      v40 = 0;
      v41 = 0;
      v10 = 0;
      v58 = 0;
      v56 = 0;
      v57 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v49 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v11 = 13;
      goto LABEL_29;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v6;
      objc_msgSend(v24, "storeFrontIdentifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "storeIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "name");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "genre");
      v25 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v25;
      v74 = 0;
      v75 = 0;
      v72 = 0;
      v73 = 0;
      v70 = 0;
      v71 = 0;
      v68 = 0;
      v69 = 0;
      v66 = 0;
      v67 = 0;
      v64 = 0;
      v65 = 0;
      v62 = 0;
      v63 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0;
      v46 = 0;
      v47 = 0;
      v55 = 0;
      v9 = 0;
      v40 = 0;
      v41 = 0;
      v10 = 0;
      v58 = 0;
      v56 = 0;
      v57 = 0;
      v52 = 0;
      v53 = 0;
      v50 = 0;
      v51 = 0;
      v48 = 0;
      v49 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v11 = 14;
      goto LABEL_29;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "name");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = 0;
      v75 = 0;
      v72 = 0;
      v73 = 0;
      v70 = 0;
      v71 = 0;
      v68 = 0;
      v69 = 0;
      v66 = 0;
      v67 = 0;
      v64 = 0;
      v65 = 0;
      v62 = 0;
      v63 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0;
      v46 = 0;
      v55 = 0;
      v54 = 0;
      v8 = 0;
      v9 = 0;
      v41 = 0;
    }
    else
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v74 = 0;
          v75 = 0;
          v72 = 0;
          v73 = 0;
          v70 = 0;
          v71 = 0;
          v68 = 0;
          v69 = 0;
          v66 = 0;
          v67 = 0;
          v64 = 0;
          v65 = 0;
          v62 = 0;
          v63 = 0;
          v59 = 0;
          v60 = 0;
          v61 = 0;
          v46 = 0;
          v47 = 0;
          v55 = 0;
          v54 = 0;
          v9 = 0;
          v40 = 0;
          v41 = 0;
          v10 = 0;
          v58 = 0;
          v56 = 0;
          v57 = 0;
          v52 = 0;
          v53 = 0;
          v50 = 0;
          v51 = 0;
          v48 = 0;
          v49 = 0;
          v43 = 0;
          v44 = 0;
          v45 = 0;
          v76 = 0;
          v77 = 0;
          v38 = 0;
          v8 = 0;
          goto LABEL_30;
        }
        v33 = v6;
        objc_msgSend(v33, "title");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "subtitle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v74 = 0;
        v75 = 0;
        v72 = 0;
        v73 = 0;
        v70 = 0;
        v71 = 0;
        v68 = 0;
        v69 = 0;
        v66 = 0;
        v67 = 0;
        v64 = 0;
        v65 = 0;
        v62 = 0;
        v63 = 0;
        v59 = 0;
        v60 = 0;
        v61 = 0;
        v46 = 0;
        v47 = 0;
        v55 = 0;
        v54 = 0;
        v8 = 0;
        v9 = 0;
        v41 = 0;
        goto LABEL_36;
      }
      v32 = v6;
      objc_msgSend(v32, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "genre");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v74 = 0;
      v75 = 0;
      v72 = 0;
      v73 = 0;
      v70 = 0;
      v71 = 0;
      v68 = 0;
      v69 = 0;
      v66 = 0;
      v67 = 0;
      v64 = 0;
      v65 = 0;
      v62 = 0;
      v63 = 0;
      v59 = 0;
      v60 = 0;
      v61 = 0;
      v46 = 0;
      v47 = 0;
      v55 = 0;
      v54 = 0;
      v8 = 0;
    }
    v40 = 0;
    v10 = 0;
LABEL_36:
    v58 = 0;
    v56 = 0;
    v57 = 0;
    v52 = 0;
    v53 = 0;
    v50 = 0;
    v51 = 0;
    v48 = 0;
    v49 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    v76 = 0;
    v77 = 0;
    v38 = 0;
    goto LABEL_30;
  }
  v7 = v6;
  objc_msgSend(v7, "storeFrontIdentifier");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storeIdentifier");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "artist");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "album");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v74 = 0;
  v75 = 0;
  v72 = 0;
  v73 = 0;
  v70 = 0;
  v71 = 0;
  v68 = 0;
  v69 = 0;
  v66 = 0;
  v67 = 0;
  v64 = 0;
  v65 = 0;
  v62 = 0;
  v63 = 0;
  v59 = 0;
  v60 = 0;
  v61 = 0;
  v46 = 0;
  v47 = 0;
  v55 = 0;
  v54 = 0;
  v8 = 0;
  v9 = 0;
  v40 = 0;
  v41 = 0;
  v10 = 0;
  v58 = 0;
  v56 = 0;
  v57 = 0;
  v52 = 0;
  v53 = 0;
  v50 = 0;
  v51 = 0;
  v48 = 0;
  v49 = 0;
  v11 = 1;
LABEL_29:
  v38 = (id)v11;
LABEL_30:
  v34 = objc_alloc(MEMORY[0x24BDD9E90]);
  objc_msgSend(v42, "siteName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "summary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "title");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "itemType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "originalURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "absoluteString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "creator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (id)objc_msgSend(v34, "initWithSiteName:summary:title:itemType:originalURL:imageURLs:iconURLs:creator:linkMediaType:iTunesStoreIdentifier:iTunesStoreFrontIdentifier:songTitle:songArtist:songAlbum:albumName:albumArtist:musicVideoName:musicVideoArtist:artistName:artistGenre:playlistName:playlistCurator:radioName:radioCurator:softwareName:softwareGenre:softwarePlatform:bookName:bookAuthor:audioBookName:audioBookAuthor:audioBookNarrator:podcastName:podcastArtist:podcastEpisodeName:podcastEpisodePodcastName:podcastEpisodeArtist:podcastEpisodeReleaseDate:tvEpisodeEpisodeName:tvEpisodeSeasonName:tvEpisodeGenre:tvSeasonName:tvSeasonGenre:movieName:movieGenre:tvShowName:movieBundleName:movieBundleGenre:appleTvTitle:appleTvSubtitle:", v36, v35, v26, v27, v29, v79, v78, v30, v38, v77, v76,
              v45,
              v44,
              v43,
              v49,
              v48,
              v51,
              v50,
              v53,
              v52,
              v57,
              v56,
              v58,
              v75,
              v74,
              v73,
              v72,
              v71,
              v69,
              v70,
              v67,
              v68,
              v64,
              v65,
              v66,
              v62,
              v63,
              0,
              v59,
              v61,
              v60,
              v46,
              v55,
              v54,
              v8,
              v47,
              v9,
              v41,
              v40,
              v10);

  return v39;
}

+ (id)__INSpeakableStringForMessage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  v3 = a3;
  if (objc_msgSend(v3, "isGroupChat"))
  {
    objc_msgSend(v3, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v5 = objc_alloc(MEMORY[0x24BDDA1A0]);
      objc_msgSend(v3, "chatIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "displayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v5, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v6, v7, 0);

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_21ED90000, v9, OS_LOG_TYPE_INFO, "Could not create INSpeakableString, chat did not have a display name", v11, 2u);
        }

      }
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)__INSpeakableStringForChat:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = a3;
  if (objc_msgSend(v3, "isGroupChat"))
  {
    objc_msgSend(v3, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      v5 = objc_alloc(MEMORY[0x24BDDA1A0]);
      objc_msgSend(v3, "chatIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v6, v4, 0);

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_21ED90000, v8, OS_LOG_TYPE_INFO, "Could not create INSpeakableString, chat did not have a display name", v10, 2u);
        }

      }
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)spiHandleForIMHandle:(id)a3 isMe:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "originalID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v5, "ID");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v5, "countryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE50358]), "initWithAddress:countryCode:isMe:", v9, v10, v4);

  return v11;
}

+ (id)INPersonsForSPIHandles:(id)a3 personProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = sub_21EDB12EC;
  v9[3] = &unk_24E396208;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "__imArrayByApplyingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)prepareAttachments:(int64_t)a3 message:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  void *v34;
  id v35;
  id obj;
  uint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = v4;
  objc_msgSend(v4, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCF48];
    NSTemporaryDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v4, "attachments");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    if (v11)
    {
      v37 = *(_QWORD *)v40;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v40 != v37)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v12);
          objc_msgSend(v13, "fileUrl");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == 0;

          if (v15)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21ED90000, v29, OS_LOG_TYPE_INFO, "Error: Attachment fileURL is nil. Skipping copy", buf, 2u);
              }

            }
          }
          else
          {
            objc_msgSend(v13, "fileUrl");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "lastPathComponent");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v9, "URLByAppendingPathComponent:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, 0);

            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "fileUrl");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v10;
            objc_msgSend(v20, "copyItemAtURL:toURL:error:", v21, v18, &v38);
            v22 = v38;

            if (v22 && objc_msgSend(v22, "code") != 516)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v44 = v22;
                  _os_log_impl(&dword_21ED90000, v30, OS_LOG_TYPE_INFO, "Failed to copy attachment file to temp directory error %@", buf, 0xCu);
                }

              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v13, "fileUrl");
                  v24 = (id)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v22, "code");
                  *(_DWORD *)buf = 138412802;
                  v44 = v24;
                  v45 = 2112;
                  v46 = v18;
                  v47 = 2048;
                  v48 = v25;
                  _os_log_impl(&dword_21ED90000, v23, OS_LOG_TYPE_INFO, "File URL: %@ temp URL: %@, overwrite = %ld", buf, 0x20u);

                }
              }
              v26 = (void *)MEMORY[0x24BDD9D30];
              objc_msgSend(v13, "uti");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "fileWithFileURL:filename:typeIdentifier:", v18, v17, v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "addObject:", v28);

            }
            v10 = v22;
          }
          ++v12;
        }
        while (v11 != v12);
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
        v11 = v31;
      }
      while (v31);
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED90000, v32, OS_LOG_TYPE_INFO, "Error: Message does not have attachments!", buf, 2u);
    }

  }
  return v35;
}

+ (int64_t)INMessageReactionTypeForIMSPIMessageType:(int64_t)a3
{
  NSObject *v3;
  int64_t result;
  int64_t *v5;
  uint8_t v6[16];

  if ((unint64_t)(a3 - 200) >= 0x17)
  {
    result = 1;
    switch(a3)
    {
      case 'd':
      case 'e':
      case 'f':
      case 'g':
      case 'h':
        goto LABEL_2;
      case 'i':
        v5 = (int64_t *)MEMORY[0x24BDDA438];
        goto LABEL_16;
      case 'j':
        v5 = (int64_t *)MEMORY[0x24BDDA418];
        goto LABEL_16;
      case 'k':
        v5 = (int64_t *)MEMORY[0x24BDDA420];
        goto LABEL_16;
      case 'l':
        v5 = (int64_t *)MEMORY[0x24BDDA440];
        goto LABEL_16;
      case 'm':
        v5 = (int64_t *)MEMORY[0x24BDDA448];
        goto LABEL_16;
      case 'n':
        v5 = (int64_t *)MEMORY[0x24BDDA430];
        goto LABEL_16;
      case 'p':
        v5 = (int64_t *)MEMORY[0x24BDDA450];
        goto LABEL_16;
      case 'q':
        v5 = (int64_t *)MEMORY[0x24BDDA410];
LABEL_16:
        result = *v5;
        break;
      default:
        return result;
    }
  }
  else
  {
LABEL_2:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_21ED90000, v3, OS_LOG_TYPE_INFO, "Error: This should only be called on a set of INMessageReaction subtypes. Returning INMessageReactionTypeGeneric.", v6, 2u);
      }

    }
    return 2;
  }
  return result;
}

+ (id)makeINMessage:(int64_t)a3 message:(id)a4 numberOfAttachments:(int64_t)a5 personProvider:(id)a6 referencedINMessage:(id)a7 content:(id)a8 reaction:(id)a9
{
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v58;
  id v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v61 = a6;
  v55 = a7;
  v60 = a8;
  v56 = a9;
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a7) = objc_msgSend(v14, "isZelkovaEnabled");

  if ((_DWORD)a7 && objc_msgSend(v13, "messageType") == 215)
  {
    objc_msgSend(v13, "extensionPayloadURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = objc_claimAutoreleasedReturnValue();

    v60 = (id)v16;
  }
  if (a3 == 15
    && (objc_msgSend(v13, "attachments"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "count"),
        v17,
        v18 == 1))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21ED90000, v19, OS_LOG_TYPE_INFO, "IMAssistantINMessageConverter: Image type attachments", buf, 2u);
      }

    }
    objc_msgSend(a1, "prepareAttachments:message:", 15, v13);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x24BDD9E80]);
    objc_msgSend(v13, "guid");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "chatIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sender");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "personFromSPIHandle:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recipients");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "INPersonsForSPIHandles:personProvider:", v25, v61);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMAssistantINMessageConverter __INSpeakableStringForMessage:](IMAssistantINMessageConverter, "__INSpeakableStringForMessage:", v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "service");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v20, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:messageType:serviceName:attachmentFiles:", v53, v21, v60, v22, v24, v26, v27, 15, v28, v58);

  }
  else
  {
    v30 = objc_alloc(MEMORY[0x24BDD9E80]);
    objc_msgSend(v13, "guid");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "chatIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "date");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sender");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "personFromSPIHandle:", v31);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recipients");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "INPersonsForSPIHandles:personProvider:", v32, v61);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMAssistantINMessageConverter __INSpeakableStringForMessage:](IMAssistantINMessageConverter, "__INSpeakableStringForMessage:", v13);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateForLastReadMessageInChat");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "effect");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = +[IMAssistantINMessageConverter messageEffectTypeFromExpressiveSendId:](IMAssistantINMessageConverter, "messageEffectTypeFromExpressiveSendId:", v36);
    objc_msgSend(v13, "service");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v30, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:reaction:attachmentFiles:location:linkMetadata:", v54, v52, v60, v51, v50, v49, v33, v34, v35, a3, v37, v55, v38, v56, 0,
            0,
            0);

    v29 = (void *)v48;
  }
  objc_msgSend(v13, "richLinkMetadata");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    objc_msgSend(a1, "__INMessageLinkMetadataForLPLinkMetadata:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setLinkMetadata:", v40);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v40;
        _os_log_impl(&dword_21ED90000, v41, OS_LOG_TYPE_INFO, "Link Metadata: %@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v13, "peerPaymentAmount");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    v43 = objc_alloc(MEMORY[0x24BDD9C80]);
    objc_msgSend(v42, "amount");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "currency");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v43, "initWithAmount:currencyCode:", v44, v45);

    objc_msgSend(v29, "setPaymentAmount:", v46);
  }

  return v29;
}

+ (id)INMessagesForSPIMessage:(id)a3 personProvider:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v43;
  __CFString *v44;
  os_signpost_id_t spid;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  id v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v48 = a4;
  _IMAssistantCoreGeneralSignpostLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v6);

  _IMAssistantCoreGeneralSignpostLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v8, OS_SIGNPOST_INTERVAL_BEGIN, spid, "INMessagesForSPIMessage", (const char *)&unk_21EDC1733, buf, 2u);
  }

  objc_msgSend(v5, "guid");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v67 = v49;
      _os_log_impl(&dword_21ED90000, v9, OS_LOG_TYPE_INFO, "Converting IMSPIMessage to INMessages. Message to be converted: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v5, "referencedMessage");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "guid");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Yes, a reference to: %@"), v50);
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = CFSTR("No");
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v67 = v49;
      v68 = 2112;
      v69 = (uint64_t)v44;
      _os_log_impl(&dword_21ED90000, v10, OS_LOG_TYPE_INFO, "Message (guid: %@) has a referenced message? %@", buf, 0x16u);
    }

  }
  if (!v51)
  {
    v43 = 0;
    goto LABEL_35;
  }
  objc_msgSend(a1, "INMessagesForSPIMessage:personProvider:", v51, v48);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "count") < 2)
  {
    v13 = objc_msgSend(v11, "count") == 0;
    v14 = IMOSLoggingEnabled();
    if (v13)
    {
      if (v14)
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v67 = v49;
          v68 = 2112;
          v69 = (uint64_t)v50;
          _os_log_impl(&dword_21ED90000, v16, OS_LOG_TYPE_INFO, "Message %@ has a reference to a message %@ that could not be converted to an INMessage.", buf, 0x16u);
        }

      }
      v43 = 0;
      goto LABEL_34;
    }
    if (v14)
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v67 = v49;
        v68 = 2112;
        v69 = (uint64_t)v50;
        _os_log_impl(&dword_21ED90000, v15, OS_LOG_TYPE_INFO, "Message %@ has a reference to a single message %@.", buf, 0x16u);
      }

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v67 = v49;
      v68 = 2112;
      v69 = (uint64_t)v50;
      _os_log_impl(&dword_21ED90000, v12, OS_LOG_TYPE_INFO, "Message %@ has a reference to multi-part message %@. Reference should be to a single part, e.g. a tapback on a photo in a group of photos, but we do not have the infomration to resolve which part. Naively choosing the first part.", buf, 0x16u);
    }

  }
  objc_msgSend(v11, "firstObject");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:

LABEL_35:
  objc_msgSend(v5, "attributedText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(v5, "body");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = &stru_24E396530;
    if (v18)
      v20 = (__CFString *)v18;
    v21 = v20;

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v21);
  }
  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v5, "attachments");
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v62 != v26)
          objc_enumerationMutation(v24);
        v28 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v28, "guid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "length"))
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v28, v29);

      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v25);
  }

  v52[0] = MEMORY[0x24BDAC760];
  v52[1] = 3221225472;
  v52[2] = sub_21EDB2698;
  v52[3] = &unk_24E396298;
  v30 = v23;
  v53 = v30;
  v60 = a1;
  v47 = v5;
  v54 = v47;
  v31 = v43;
  v55 = v31;
  v32 = v50;
  v56 = v32;
  v33 = v49;
  v57 = v33;
  v34 = v48;
  v58 = v34;
  v35 = v22;
  v59 = v35;
  objc_msgSend(v17, "__im_visitMessageParts:", v52);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = objc_msgSend(v35, "count");
      *(_DWORD *)buf = 138412546;
      v67 = v33;
      v68 = 2048;
      v69 = v37;
      _os_log_impl(&dword_21ED90000, v36, OS_LOG_TYPE_INFO, "Message %@ converted to %ld INMessages", buf, 0x16u);
    }

  }
  _IMAssistantCoreGeneralSignpostLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = v38;
  if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v39, OS_SIGNPOST_INTERVAL_END, spid, "INMessagesForSPIMessage", (const char *)&unk_21EDC1733, buf, 2u);
  }

  v40 = v59;
  v41 = v35;

  return v41;
}

+ (id)INStickerForIMSPIAttachment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  int v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stickerUserInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", *MEMORY[0x24BE51060]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v31 = 138412290;
        v32 = v6;
        _os_log_impl(&dword_21ED90000, v7, OS_LOG_TYPE_INFO, "Sticker externalURI: %@", (uint8_t *)&v31, 0xCu);
      }

    }
    if (v6)
    {
      objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("sticker:///"), &stru_24E396530);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("/"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count") == 3)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("memoji"));

        if (v11)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "length"))
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
            v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = CFSTR("memoji");
          }

          objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", v13, &stru_24E396530);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_msgSend(v15, "hasPrefix:", CFSTR("_"));
          v17 = *MEMORY[0x24BDDA4C0];
          if (v23)
          {
            objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", 0, 1, &stru_24E396530);
            v24 = objc_claimAutoreleasedReturnValue();

            v16 = 0;
            v15 = (void *)v24;
          }
          else
          {
            v16 = 0;
          }
        }
        else
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("emoji"));

          if (v19)
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = 0;
            v15 = 0;
            v17 = 1;
          }
          else
          {
            objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("user"));

            v13 = 0;
            v15 = 0;
            v16 = 0;
            if (v21)
              v17 = *MEMORY[0x24BDDA4B8];
            else
              v17 = 2;
          }
        }
      }
      else
      {
        v13 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 2;
      }

      v14 = 0;
    }
    else
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stickerUserInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "valueForKey:", *MEMORY[0x24BE51070]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(":"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v13 = 0;
        v15 = 0;
        v16 = 0;
        if (objc_msgSend(v14, "length"))
          v17 = *MEMORY[0x24BDDA4B0];
        else
          v17 = 2;
      }
      else
      {
        v13 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 2;
      }
    }

  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 2;
  }
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA1F8]), "initWithType:avatarDescriptor:appBundleID:stickerDescription:emoji:", v17, v13, v14, v15, v16);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v31 = 138412290;
      v32 = v28;
      _os_log_impl(&dword_21ED90000, v29, OS_LOG_TYPE_INFO, "INStickerForIMSPIAttachment sticker: %@", (uint8_t *)&v31, 0xCu);
    }

  }
  return v28;
}

+ (id)_stringByRemovingMessagesControlCharactersFromString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", *MEMORY[0x24BE500C8], &stru_24E396530);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", *MEMORY[0x24BE500D0], &stru_24E396530);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)INMessageForOutgoingIMMessage:(id)a3 toChat:(id)a4 messageType:(int64_t)a5 personProvider:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  os_signpost_id_t spid;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[16];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  _IMAssistantCoreGeneralSignpostLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  _IMAssistantCoreGeneralSignpostLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v48 = v11 - 1;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "INMessageForOutgoingIMMessage", (const char *)&unk_21EDC1733, buf, 2u);
  }
  spid = v11;

  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v51 = v9;
  objc_msgSend(v9, "participantsWithState:", 16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v53 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(a1, "spiHandleForIMHandle:isMe:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i), 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD9F30], "__im_personFromSPIHandle:contact:", v20, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v17);
  }

  objc_msgSend(v9, "lastAddressedHandleID");
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "account");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "countryCode");
  v24 = objc_claimAutoreleasedReturnValue();

  v44 = (void *)v24;
  v45 = (void *)v22;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE50358]), "initWithAddress:countryCode:isMe:", v22, v24, 1);
  objc_msgSend(MEMORY[0x24BDD9F30], "__im_personFromSPIHandle:contact:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "plainBody");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v42 = v25;
  }
  else
  {
    objc_msgSend(v8, "text");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "string");
    v42 = (id)objc_claimAutoreleasedReturnValue();

  }
  v41 = objc_alloc(MEMORY[0x24BDD9E80]);
  objc_msgSend(v8, "guid");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "chatIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "time");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v14, "copy");
  +[IMAssistantINMessageConverter __INSpeakableStringForChat:](IMAssistantINMessageConverter, "__INSpeakableStringForChat:", v9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v8;
  objc_msgSend(v8, "expressiveSendStyleID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = +[IMAssistantINMessageConverter messageEffectTypeFromExpressiveSendId:](IMAssistantINMessageConverter, "messageEffectTypeFromExpressiveSendId:", v33);
  objc_msgSend(v51, "account");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "serviceName");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (id)objc_msgSend(v41, "initWithIdentifier:conversationIdentifier:content:dateSent:sender:recipients:groupName:dateMessageWasLastRead:numberOfAttachments:messageType:messageEffectType:referencedMessage:serviceName:", v28, v29, v32, 0, 0, a5, v34, 0, v36);

  _IMAssistantCoreGeneralSignpostLogHandle();
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v48 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ED90000, v38, OS_SIGNPOST_INTERVAL_END, spid, "INMessageForOutgoingIMMessage", (const char *)&unk_21EDC1733, buf, 2u);
  }

  return v47;
}

@end
