@implementation CRCardMocks

+ (id)mockCardsDeserialized
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "mockCards", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[CRPBSerialization cardForData:messageName:](CRPBSerialization, "cardForData:messageName:", v9, CFSTR("searchfoundation.Card"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v3, "addObject:", v10);
          objc_msgSend(a1, "mockAsyncCardWithCard:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

+ (id)mockCards
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  +[CRCardMocks movieCard](CRCardMocks, "movieCard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCardMocks translationCard](CRCardMocks, "translationCard", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(a1, "rosterCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)translationCard
{
  void *v2;
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
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setMaxLines:", 0);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "setText:", v6);

  objc_msgSend(v5, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", CFSTR("Hello"));

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setMaxLines:", 0);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(v8, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", CFSTR("你好"));

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setMaxLines:", 0);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v11, "setText:", v12);

  objc_msgSend(v11, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", CFSTR("Nǐ hǎo"));

  objc_msgSend(v4, "setDetailText:", v5);
  objc_msgSend(v4, "setTitle:", v8);
  objc_msgSend(v4, "setSubtitle:", v11);
  objc_msgSend(v2, "setType:", 18);
  objc_msgSend(v3, "setAudioPlaybackCardSection:", v4);
  objc_msgSend(v2, "setValue:", v3);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setTitle:", CFSTR("Translation"));
  v15 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v19[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithArray:", v16);
  objc_msgSend(v14, "setCardSections:", v17);

  return v14;
}

+ (id)movieCard
{
  UIImage *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
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
  void *v37;
  UIImage *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  UIImage *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  UIImage *v54;
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
  UIImage *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  UIImage *v78;
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
  UIImage *v91;
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
  id v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t i;
  uint64_t v113;
  void *v114;
  void *v115;
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
  id v135;
  void *v136;
  void *v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _BYTE v142[128];
  _QWORD v143[13];

  v143[11] = *MEMORY[0x24BDAC8D0];
  v136 = (void *)objc_opt_new();
  objc_msgSend(v136, "setTitle:", CFSTR("Marvel’s the Avengers"));
  objc_msgSend(v136, "setSubtitle:", CFSTR("Marvel Studios (2012)"));
  objc_msgSend(v136, "setContentAdvisory:", CFSTR("PG-13"));
  v135 = objc_alloc_init(MEMORY[0x24BE850D0]);
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("tomato"));
  v2 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v135, "setImageData:", v3);

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTitle:", CFSTR("Runtime"));
  v5 = objc_alloc_init(MEMORY[0x24BE85148]);
  objc_msgSend(v4, "setContent:", v5);

  v129 = v4;
  objc_msgSend(v4, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", CFSTR("2h 23m"));

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setTitle:", CFSTR("Director"));
  v8 = objc_alloc_init(MEMORY[0x24BE85148]);
  objc_msgSend(v7, "setContent:", v8);

  v128 = v7;
  objc_msgSend(v7, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", CFSTR("Joss Whedon"));

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setTitle:", CFSTR("Starring"));
  v11 = objc_alloc_init(MEMORY[0x24BE85148]);
  objc_msgSend(v10, "setContent:", v11);

  v127 = v10;
  objc_msgSend(v10, "content");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", CFSTR("Robert Downey Jr.\nChris Evans\nMark Ruffalo\nChris Hemsworth\nScarlett Johansson"));

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setLabel:", CFSTR("ShowTime"));
  v14 = (void *)MEMORY[0x24BE85100];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://www.showtime.com"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "punchoutWithURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v13;
  objc_msgSend(v13, "setPunchout:", v16);

  v17 = (void *)objc_opt_new();
  v18 = (void *)objc_opt_new();
  objc_msgSend(v17, "setActionItem:", v18);

  objc_msgSend(v17, "actionItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLabel:", CFSTR("$3.99"));

  objc_msgSend(v17, "setSublabel:", CFSTR("Rent on iTunes"));
  v20 = (void *)MEMORY[0x24BE85100];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://www.apple.com/itunes"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "punchoutWithURL:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "actionItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPunchout:", v22);

  objc_msgSend(v17, "actionItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setApplicationBundleIdentifier:", CFSTR("533654020"));

  v125 = v17;
  objc_msgSend(v17, "setOfferIdentifier:", CFSTR("HDVOD"));
  v25 = (void *)objc_opt_new();
  v26 = (void *)objc_opt_new();
  objc_msgSend(v25, "setActionItem:", v26);

  objc_msgSend(v25, "actionItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLabel:", CFSTR("$19.99"));

  objc_msgSend(v25, "setSublabel:", CFSTR("Buy with iTunes Extras"));
  v28 = (void *)MEMORY[0x24BE85100];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://www.apple.com/itunes"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "punchoutWithURL:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "actionItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setPunchout:", v30);

  objc_msgSend(v25, "actionItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setApplicationBundleIdentifier:", CFSTR("533654020"));

  v124 = v25;
  objc_msgSend(v25, "setOfferIdentifier:", CFSTR("HDBUY"));
  v33 = (void *)objc_opt_new();
  objc_msgSend(v33, "setTitle:", CFSTR("Description"));
  objc_msgSend(MEMORY[0x24BE85148], "textWithString:", CFSTR("When Thor's evil brother, Loki (Tom Hiddleston), gains access to the unlimited power of the energy cube called the Tesseract, Nick Fury (Samuel L. Jackson), director of SHIELD, initiates a superhero recruitment effort to defeat the unprecedented threat to Earth."));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDescriptionText:", v34);

  v134 = v33;
  objc_msgSend(v33, "descriptionText");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setMaxLines:", 3);

  objc_msgSend(v33, "setExpandText:", CFSTR("more"));
  v137 = (void *)objc_opt_new();
  objc_msgSend(v137, "setTitle:", CFSTR("Trailers"));
  v36 = (void *)objc_opt_new();
  objc_msgSend(v36, "setTitle:", CFSTR("Trailer"));
  v37 = (void *)MEMORY[0x24BE850D0];
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("trailer1"));
  v38 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "imageWithData:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setThumbnail:", v40);

  v41 = (void *)MEMORY[0x24BE85100];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://movietrailers.apple.com/movies/wb/dolphintale2/dolphintale2-fte1_a720p.m4v"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "punchoutWithURL:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setPunchout:", v43);

  v44 = (void *)objc_opt_new();
  objc_msgSend(v44, "setTitle:", CFSTR("Trailer 2"));
  v45 = (void *)MEMORY[0x24BE850D0];
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("trailer2"));
  v46 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "imageWithData:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setThumbnail:", v48);

  v49 = (void *)MEMORY[0x24BE85100];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://movietrailers.apple.com/movies/wb/dolphintale2/dolphintale2-tlr2_a720p.m4v"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "punchoutWithURL:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setPunchout:", v51);

  v52 = (void *)objc_opt_new();
  objc_msgSend(v52, "setTitle:", CFSTR("Trailer 3"));
  v53 = objc_alloc_init(MEMORY[0x24BE850D0]);
  objc_msgSend(v52, "setThumbnail:", v53);

  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("trailer3"));
  v54 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "thumbnail");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setImageData:", v55);

  v57 = (void *)MEMORY[0x24BE85100];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://movietrailers.apple.com/movies/wb/dolphintale2/dolphintale2-tlr1_a720p.m4v"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "punchoutWithURL:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setPunchout:", v59);

  v121 = v52;
  v122 = v44;
  v123 = v36;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v36, v44, v52, 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v137, "setMediaItems:", v60);

  v133 = (void *)objc_opt_new();
  objc_msgSend(v133, "setTitle:", CFSTR("Top Critics' Reviews"));
  v132 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE85110], "textWithString:", CFSTR("A lot of fun."));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "setLeadingText:", v61);

  objc_msgSend(v132, "setImage:", v135);
  v131 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE85110], "textWithString:", CFSTR("Downey's Stark/Iron Man steals the show because the actor is capable of making the tritest dialogue sound wonderfully witty, but the CGI effects are amazing and, despite its length, the film is very enjoyable."));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setLeadingText:", v62);

  objc_msgSend(v131, "setImage:", v135);
  v130 = (void *)objc_opt_new();
  objc_msgSend(v130, "setTitle:", CFSTR("Available on:"));
  v63 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE85110], "textWithString:", CFSTR("iTunes Store"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setLeadingText:", v64);

  objc_msgSend(v63, "leadingText");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "text");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setMaxLines:", 1);

  v67 = (void *)MEMORY[0x24BE850D0];
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("iTunes"));
  v68 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "imageWithData:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setImage:", v70);

  v71 = objc_alloc_init(MEMORY[0x24BE85100]);
  objc_msgSend(v71, "setBundleIdentifier:", CFSTR("com.apple.mobilenotes"));
  v119 = v71;
  v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v71, 0);
  objc_msgSend(v63, "setPunchoutOptions:", v72);

  v73 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE85110], "textWithString:", CFSTR("Netflix"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setLeadingText:", v74);

  objc_msgSend(v73, "leadingText");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "text");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setMaxLines:", 1);

  v77 = (void *)MEMORY[0x24BE850D0];
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("netflix"));
  v78 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "imageWithData:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setImage:", v80);

  v81 = (void *)MEMORY[0x24BDBCEB8];
  v82 = (void *)MEMORY[0x24BE85100];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://www.netflix.com"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "punchoutWithURL:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "arrayWithObjects:", v84, 0);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setPunchoutOptions:", v85);

  v86 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE85110], "textWithString:", CFSTR("Hulu Plus"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setLeadingText:", v87);

  objc_msgSend(v86, "leadingText");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "text");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setMaxLines:", 1);

  v90 = (void *)MEMORY[0x24BE850D0];
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("hulu"));
  v91 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "imageWithData:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setImage:", v93);

  v94 = (void *)MEMORY[0x24BDBCEB8];
  v95 = (void *)MEMORY[0x24BE85100];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://www.hulu.com"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "punchoutWithURL:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "arrayWithObjects:", v97, 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "setPunchoutOptions:", v98);

  v99 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE85110], "textWithString:", CFSTR("More Info on Wikipedia…"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setLeadingText:", v100);

  v101 = (void *)MEMORY[0x24BDBCEB8];
  v102 = (void *)MEMORY[0x24BE85100];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://en.wikipedia.org/wiki/Main_Page"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "punchoutWithURL:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "arrayWithObjects:", v104, 0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setPunchoutOptions:", v105);

  v118 = (void *)objc_opt_new();
  objc_msgSend(v118, "setTitle:", CFSTR("Movie"));
  v143[0] = v136;
  v143[1] = v134;
  v143[2] = v137;
  v143[3] = v133;
  v143[4] = v132;
  v143[5] = v131;
  v143[6] = v130;
  v143[7] = v63;
  v120 = v63;
  v143[8] = v73;
  v143[9] = v86;
  v117 = v99;
  v143[10] = v99;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v143, 11);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v108 = v106;
  v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v138, v142, 16);
  if (v109)
  {
    v110 = v109;
    v111 = *(_QWORD *)v139;
    do
    {
      for (i = 0; i != v110; ++i)
      {
        if (*(_QWORD *)v139 != v111)
          objc_enumerationMutation(v108);
        v113 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * i);
        v114 = (void *)objc_opt_new();
        v115 = (void *)objc_opt_new();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v114, "setType:", 8);
          objc_msgSend(v115, "setRichTitleCardSection:", v113);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v114, "setType:", 5);
            objc_msgSend(v115, "setMediaInfoCardSection:", v113);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v114, "setType:", 2);
              objc_msgSend(v115, "setDescriptionCardSection:", v113);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v114, "setType:", 6);
                objc_msgSend(v115, "setMediaPlayerCardSection:", v113);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v114, "setType:", 16);
                  objc_msgSend(v115, "setTitleCardSection:", v113);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v114, "setType:", 9);
                    objc_msgSend(v115, "setRowCardSection:", v113);
                  }
                }
              }
            }
          }
        }
        objc_msgSend(v114, "setValue:", v115);
        objc_msgSend(v107, "addObject:", v114);

      }
      v110 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v138, v142, 16);
    }
    while (v110);
  }

  objc_msgSend(v118, "setCardSections:", v107);
  return v118;
}

+ (id)responseCard
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[5];

  v30[3] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BE85108]);
  v3 = objc_alloc_init(MEMORY[0x24BE85098]);
  objc_msgSend(v3, "setCatIdentifier:", CFSTR("success#happyCat"));
  v23 = v3;
  objc_msgSend(v2, "setCatModel:", v3);
  v4 = objc_alloc_init(MEMORY[0x24BE85108]);
  v5 = objc_alloc_init(MEMORY[0x24BE85098]);
  objc_msgSend(v5, "setCatIdentifier:", CFSTR("success#happyCat"));
  v22 = v5;
  objc_msgSend(v4, "setCatModel:", v5);
  v6 = objc_alloc_init(MEMORY[0x24BE85108]);
  v7 = objc_alloc_init(MEMORY[0x24BE85098]);
  objc_msgSend(v7, "setCatIdentifier:", CFSTR("fail#sadCat"));
  v20 = v7;
  objc_msgSend(v6, "setCatModel:", v7);
  v24 = v2;
  v30[0] = v2;
  v30[1] = v4;
  v21 = v6;
  v30[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v16 = (void *)objc_opt_new();
        v17 = (void *)objc_opt_new();
        objc_msgSend(v16, "setType:", 53);
        objc_msgSend(v17, "setResponseWrapperCardSection:", v15);
        objc_msgSend(v16, "setValue:", v17);
        objc_msgSend(v9, "addObject:", v16);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  v18 = objc_alloc_init(MEMORY[0x24BE850A0]);
  objc_msgSend(v18, "setTitle:", CFSTR("Response"));
  objc_msgSend(v18, "setCardSections:", v9);

  return v18;
}

+ (id)basicMovieCard
{
  void *v2;
  UIImage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIImage *v8;
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
  UIImage *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  UIImage *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  UIImage *v51;
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
  UIImage *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  UIImage *v72;
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
  UIImage *v83;
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
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
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
  CRBasicCard *v124;
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
  _QWORD v135[12];
  void *v136;
  void *v137;
  void *v138;
  id v139;
  _QWORD v140[3];
  _QWORD v141[2];
  _QWORD v142[5];

  v142[3] = *MEMORY[0x24BDAC8D0];
  v124 = objc_alloc_init(CRBasicCard);
  v133 = (void *)objc_opt_new();
  objc_msgSend(v133, "setTitle:", CFSTR("Marvel’s the Avengers"));
  objc_msgSend(v133, "setSubtitle:", CFSTR("Marvel Studios (2012)"));
  objc_msgSend(v133, "setContentAdvisory:", CFSTR("PG-13"));
  v2 = (void *)MEMORY[0x24BE84E60];
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("tomato"));
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithData:", v4);
  v129 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)MEMORY[0x24BE84E60];
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("avengers-big"));
  v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithData:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setThumbnail:", v10);

  v123 = v6;
  objc_msgSend(v6, "setReviewGlyph:", v129);
  objc_msgSend(v6, "setReviewText:", CFSTR("92%"));
  objc_msgSend(v5, "setMediaItem:", v6);
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setTitle:", CFSTR("Runtime"));
  objc_msgSend(MEMORY[0x24BE85018], "textWithString:", CFSTR("2h 23m"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v11;
  objc_msgSend(v11, "setContent:", v12);

  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setTitle:", CFSTR("Director"));
  objc_msgSend(MEMORY[0x24BE85018], "textWithString:", CFSTR("Joss Whedon"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v13;
  objc_msgSend(v13, "setContent:", v14);

  v120 = (void *)objc_opt_new();
  objc_msgSend(v120, "setTitle:", CFSTR("Starring"));
  objc_msgSend(MEMORY[0x24BE85018], "textWithString:", CFSTR("Robert Downey Jr.\nChris Evans\nMark Ruffalo\nChris Hemsworth\nScarlett Johansson"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "setContent:", v15);

  v142[0] = v11;
  v142[1] = v13;
  v142[2] = v120;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v142, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetails:", v16);

  v119 = (void *)objc_opt_new();
  objc_msgSend(v119, "setLabel:", CFSTR("ShowTime"));
  v17 = (void *)MEMORY[0x24BE84F38];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://www.showtime.com"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "punchoutWithURL:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setPunchout:", v19);

  v132 = v5;
  objc_msgSend(v5, "setPlayAction:", v119);
  v20 = (void *)objc_opt_new();
  objc_msgSend(v20, "setLabel:", CFSTR("$3.99"));
  objc_msgSend(v20, "setSublabel:", CFSTR("Rent on iTunes"));
  v21 = (void *)MEMORY[0x24BE84F38];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://www.apple.com/itunes"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "punchoutWithURL:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPunchout:", v23);

  objc_msgSend(v20, "setApplicationBundleIdentifier:", CFSTR("533654020"));
  v24 = v20;
  v118 = v20;
  objc_msgSend(v20, "setOfferIdentifier:", CFSTR("HDVOD"));
  v25 = (void *)objc_opt_new();
  objc_msgSend(v25, "setLabel:", CFSTR("$19.99"));
  v117 = v25;
  objc_msgSend(v25, "setSublabel:", CFSTR("Buy with iTunes Extras"));
  v26 = (void *)MEMORY[0x24BE84F38];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://www.apple.com/itunes"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "punchoutWithURL:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setPunchout:", v28);

  objc_msgSend(v25, "setApplicationBundleIdentifier:", CFSTR("533654020"));
  objc_msgSend(v25, "setOfferIdentifier:", CFSTR("HDBUY"));
  v141[0] = v24;
  v141[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v141, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOffers:", v29);

  v30 = (void *)objc_opt_new();
  objc_msgSend(v30, "setTitle:", CFSTR("Description"));
  objc_msgSend(MEMORY[0x24BE85018], "textWithString:", CFSTR("When Thor's evil brother, Loki (Tom Hiddleston), gains access to the unlimited power of the energy cube called the Tesseract, Nick Fury (Samuel L. Jackson), director of SHIELD, initiates a superhero recruitment effort to defeat the unprecedented threat to Earth."));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setDescriptionText:", v31);

  v131 = v30;
  objc_msgSend(v30, "descriptionText");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setMaxLines:", 3);

  objc_msgSend(v30, "setExpandText:", CFSTR("more"));
  v134 = (void *)objc_opt_new();
  objc_msgSend(v134, "setTitle:", CFSTR("Trailers"));
  v33 = (void *)objc_opt_new();
  objc_msgSend(v33, "setTitle:", CFSTR("Trailer"));
  v34 = (void *)MEMORY[0x24BE84E60];
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("trailer1"));
  v35 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "imageWithData:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setThumbnail:", v37);

  v38 = (void *)MEMORY[0x24BE84F38];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://movietrailers.apple.com/movies/wb/dolphintale2/dolphintale2-fte1_a720p.m4v"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "punchoutWithURL:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v33;
  objc_msgSend(v33, "setPunchout:", v40);

  v41 = (void *)objc_opt_new();
  objc_msgSend(v41, "setTitle:", CFSTR("Trailer 2"));
  v42 = (void *)MEMORY[0x24BE84E60];
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("trailer2"));
  v43 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "imageWithData:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setThumbnail:", v45);

  v46 = (void *)MEMORY[0x24BE84F38];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://movietrailers.apple.com/movies/wb/dolphintale2/dolphintale2-tlr2_a720p.m4v"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "punchoutWithURL:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v41;
  objc_msgSend(v41, "setPunchout:", v48);

  v49 = (void *)objc_opt_new();
  objc_msgSend(v49, "setTitle:", CFSTR("Trailer 3"));
  v50 = (void *)MEMORY[0x24BE84E60];
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("trailer3"));
  v51 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "imageWithData:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setThumbnail:", v53);

  v54 = (void *)MEMORY[0x24BE84F38];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://movietrailers.apple.com/movies/wb/dolphintale2/dolphintale2-tlr1_a720p.m4v"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "punchoutWithURL:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v49;
  objc_msgSend(v49, "setPunchout:", v56);

  v140[0] = v33;
  v140[1] = v41;
  v140[2] = v49;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v140, 3);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "setMediaItems:", v57);

  v130 = (void *)objc_opt_new();
  objc_msgSend(v130, "setTitle:", CFSTR("Top Critics' Reviews"));
  v128 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", CFSTR("A lot of fun."));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "setLeadingText:", v58);

  objc_msgSend(v128, "setImage:", v129);
  v127 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", CFSTR("Downey's Stark/Iron Man steals the show because the actor is capable of making the tritest dialogue sound wonderfully witty, but the CGI effects are amazing and, despite its length, the film is very enjoyable."));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "setLeadingText:", v59);

  objc_msgSend(v127, "setImage:", v129);
  v126 = (void *)objc_opt_new();
  objc_msgSend(v126, "setTitle:", CFSTR("Available on:"));
  v60 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", CFSTR("iTunes Store"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setLeadingText:", v61);

  objc_msgSend(v60, "leadingText");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setMaxLines:", 1);

  v63 = (void *)MEMORY[0x24BE84E60];
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("iTunes"));
  v64 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "imageWithData:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = v60;
  objc_msgSend(v60, "setImage:", v66);

  v113 = objc_alloc_init(MEMORY[0x24BE84F38]);
  objc_msgSend(v113, "setBundleIdentifier:", CFSTR("com.apple.mobilesafari"));
  v139 = v113;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v139, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setPunchoutOptions:", v67);

  v68 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", CFSTR("Netflix"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setLeadingText:", v69);

  objc_msgSend(v68, "leadingText");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setMaxLines:", 1);

  v71 = (void *)MEMORY[0x24BE84E60];
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("netflix"));
  v72 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "imageWithData:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v68;
  objc_msgSend(v68, "setImage:", v74);

  v75 = (void *)MEMORY[0x24BE84F38];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://www.netflix.com"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "punchoutWithURL:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = v77;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v138, 1);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setPunchoutOptions:", v78);

  v79 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", CFSTR("Hulu Plus"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setLeadingText:", v80);

  objc_msgSend(v79, "leadingText");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setMaxLines:", 1);

  v82 = (void *)MEMORY[0x24BE84E60];
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("hulu"));
  v83 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "imageWithData:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setImage:", v85);

  v86 = (void *)MEMORY[0x24BE84F38];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://www.hulu.com"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v86, "punchoutWithURL:", v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = v88;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v137, 1);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = v79;
  objc_msgSend(v79, "setPunchoutOptions:", v89);

  v91 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", CFSTR("More Info on Wikipedia…"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setLeadingText:", v92);

  v93 = (void *)MEMORY[0x24BE84F38];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://en.wikipedia.org/wiki/Main_Page"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "punchoutWithURL:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = v95;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v136, 1);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v91;
  objc_msgSend(v91, "setPunchoutOptions:", v96);

  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v133);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v135[0] = v111;
  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v132);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v135[1] = v110;
  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v131);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v135[2] = v109;
  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v134);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v135[3] = v108;
  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v130);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v135[4] = v107;
  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v128);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v135[5] = v97;
  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v127);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v135[6] = v98;
  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v126);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v135[7] = v99;
  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v125);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v135[8] = v100;
  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v112);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v135[9] = v101;
  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v90);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v135[10] = v102;
  +[CRBasicCardSection basicCardSectionWithBackingCardSection:](CRBasicCardSection, "basicCardSectionWithBackingCardSection:", v91);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v135[11] = v103;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v135, 12);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRBasicCard setCardSections:](v124, "setCardSections:", v104);

  return v124;
}

+ (id)rosterCard
{
  void *v3;
  void *v4;
  void *v5;
  UIImage *v6;
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
  _QWORD v43[16];

  v43[14] = *MEMORY[0x24BDAC8D0];
  v40 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v40, "setText:", v3);

  objc_msgSend(v40, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", CFSTR("2014-2015 Season"));

  v37 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setTitle:", CFSTR("Seahawks Roster"));
  objc_msgSend(v5, "setIsCentered:", 1);
  v39 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("Seahawks"));
  v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setImageData:", v7);

  v38 = v5;
  objc_msgSend(v5, "setTitleImage:", v39);
  v42 = (void *)objc_opt_new();
  v36 = (void *)objc_opt_new();
  objc_msgSend(v42, "setType:", 8);
  objc_msgSend(v36, "setRichTitleCardSection:", v5);
  objc_msgSend(v42, "setValue:", v36);
  v8 = (void *)objc_opt_new();
  objc_msgSend(a1, "tableAlignmentSchemaFromTextAlignments:columnsAreEqualWidth:", &unk_24DDE3F48, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlignmentSchema:", v9);

  objc_msgSend(a1, "formattedTextsForStringsAndImages:", &unk_24DDE3F60);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v8, "setDatas:", v11);

  v35 = v8;
  objc_msgSend(v8, "setTableIdentifier:");
  v41 = (void *)objc_opt_new();
  v34 = (void *)objc_opt_new();
  objc_msgSend(v41, "setType:", 13);
  objc_msgSend(v34, "setTableHeaderRowCardSection:", v8);
  objc_msgSend(v41, "setValue:", v34);
  v12 = (void *)objc_opt_new();
  objc_msgSend(a1, "formattedTextsForStringsAndImages:", &unk_24DDE3F78);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDatas:", v13);

  v33 = v12;
  objc_msgSend(v12, "setTableIdentifier:", CFSTR("Roster"));
  v14 = (void *)objc_opt_new();
  v32 = (void *)objc_opt_new();
  objc_msgSend(v14, "setType:", 14);
  objc_msgSend(v32, "setTableRowCardSection:", v12);
  objc_msgSend(v14, "setValue:", v32);
  v15 = (void *)objc_opt_new();
  objc_msgSend(a1, "formattedTextsForStringsAndImages:", &unk_24DDE3F90);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDatas:", v16);

  v17 = v15;
  v31 = v15;
  objc_msgSend(v15, "setTableIdentifier:", CFSTR("Roster"));
  v18 = (void *)objc_opt_new();
  v30 = (void *)objc_opt_new();
  objc_msgSend(v18, "setType:", 14);
  objc_msgSend(v30, "setTableRowCardSection:", v17);
  objc_msgSend(v18, "setValue:", v30);
  v19 = (void *)objc_opt_new();
  objc_msgSend(a1, "formattedTextsForStringsAndImages:", &unk_24DDE3FA8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDatas:", v20);

  objc_msgSend(v19, "setTableIdentifier:", CFSTR("Roster"));
  v21 = (void *)objc_opt_new();
  v22 = (void *)objc_opt_new();
  objc_msgSend(v21, "setType:", 14);
  objc_msgSend(v22, "setTableRowCardSection:", v19);
  objc_msgSend(v21, "setValue:", v22);
  v23 = (void *)objc_opt_new();
  objc_msgSend(a1, "formattedTextsForStringsAndImages:", &unk_24DDE3FC0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDatas:", v24);

  objc_msgSend(v23, "setTableIdentifier:", CFSTR("Roster"));
  v25 = (void *)objc_opt_new();
  v26 = (void *)objc_opt_new();
  objc_msgSend(v25, "setType:", 14);
  objc_msgSend(v26, "setTableRowCardSection:", v23);
  objc_msgSend(v25, "setValue:", v26);
  v43[0] = v42;
  v43[1] = v41;
  v43[2] = v14;
  v43[3] = v18;
  v43[4] = v21;
  v43[5] = v25;
  v43[6] = v14;
  v43[7] = v18;
  v43[8] = v21;
  v43[9] = v25;
  v43[10] = v14;
  v43[11] = v18;
  v43[12] = v21;
  v43[13] = v25;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 14);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "mutableCopy");
  objc_msgSend(v37, "setCardSections:", v28);

  objc_msgSend(v37, "setTitle:", CFSTR("Roster"));
  return v37;
}

+ (id)tableAlignmentSchemaFromTextAlignments:(id)a3 columnsAreEqualWidth:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  _BOOL4 v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v19;

  v5 = a3;
  v6 = a4;
  v19 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = (void *)objc_opt_new();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

      objc_msgSend(v10, "setDataAlignment:", v12);
      v13 = (_DWORD)v12 == 0;
      v14 = v12 == 0;
      v15 = !v13;
      if ((v8 & v15) != 0)
        v16 = 2;
      else
        v16 = 0;
      objc_msgSend(v10, "setColumnAlignment:", v16);
      if (objc_msgSend(v6, "count") <= v9)
      {
        objc_msgSend(v10, "setIsEqualWidth:", 0);
      }
      else
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setIsEqualWidth:", objc_msgSend(v17, "BOOLValue"));

      }
      v8 |= v14;
      objc_msgSend(v7, "addObject:", v10);

      ++v9;
    }
    while (v9 < objc_msgSend(v5, "count"));
  }
  objc_msgSend(v19, "setTableColumnAlignments:", v7);

  return v19;
}

+ (id)mockAsyncCardWithCard:(id)a3
{
  id v3;
  CRMockAsyncCard *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CRBasicCardSection *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(CRMockAsyncCard);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "cardSections", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = objc_alloc_init(CRBasicCardSection);
        -[CRBasicCardSection setBackingCardSection:](v12, "setBackingCardSection:", v11);
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[CRBasicCard setCardSections:](v4, "setCardSections:", v5);
  return v4;
}

+ (id)formattedTextsForStringsAndImages:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend((id)objc_opt_class(), "formattedTextWithString:", v10, (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend((id)objc_opt_class(), "formattedTextWithImage:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)formattedTextWithString:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE85148], "textWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setText:", v5);
  return v4;
}

+ (id)formattedTextWithImage:(id)a3
{
  void *v3;
  void *v4;
  UIImage *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:", CFSTR("Seahawks"));
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageData:", v6);

  objc_msgSend(v3, "setGlyph:", v4);
  return v3;
}

@end
