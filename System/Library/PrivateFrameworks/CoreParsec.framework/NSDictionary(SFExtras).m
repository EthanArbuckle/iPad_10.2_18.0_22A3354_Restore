@implementation NSDictionary(SFExtras)

- (id)sf_asSearchResult:()SFExtras factory:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  id v24;
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
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
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
  id v102;
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
  _QWORD v132[4];
  id v133;
  uint64_t v134;
  _QWORD v135[3];

  v135[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a1;
  objc_msgSend(a4, "createResultObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v9);

  objc_msgSend(v7, "parsec_numberForKey:", CFSTR("_type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setType:", 1);
  if (v10 && objc_msgSend(v10, "intValue"))
    objc_msgSend(v8, "setType:", objc_msgSend(v10, "intValue"));
  v129 = v10;
  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDomainName:", v11);

  objc_msgSend(v7, "sf_imageForKey:reply:", CFSTR("thumbnail"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setThumbnail:", v12);

  v13 = objc_msgSend(v7, "parsec_BOOLForKey:", CFSTR("thumbnail_crop_circle"));
  objc_msgSend(v8, "thumbnail");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShouldCropToCircle:", v13);

  objc_msgSend(v8, "setPreventThumbnailImageScaling:", 1);
  v15 = objc_alloc_init(MEMORY[0x1E0D8C7A8]);
  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("title"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v16);

  objc_msgSend(v7, "parsec_numberForKey:", CFSTR("title_maxlines"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMaxLines:", objc_msgSend(v17, "integerValue"));

  v128 = v15;
  objc_msgSend(v8, "setTitle:", v15);
  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("secondary_title"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecondaryTitle:", v18);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("description"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v7, "parsec_stringForKey:", CFSTR("description"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSecondaryTitle:", v20);

    objc_msgSend(v7, "parsec_stringForKey:", CFSTR("description_alignment"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIsSecondaryTitleDetached:", objc_msgSend(v21, "isEqualToString:", CFSTR("right")));

  }
  objc_msgSend(v7, "sf_imageForKey:reply:", CFSTR("secondary_image"), v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecondaryTitleImage:", v22);

  objc_msgSend(v7, "parsec_arrayForKey:", CFSTR("descriptions"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v132[0] = MEMORY[0x1E0C809B0];
  v132[1] = 3221225472;
  v132[2] = __52__NSDictionary_SFExtras__sf_asSearchResult_factory___block_invoke;
  v132[3] = &unk_1E3921F60;
  v24 = v6;
  v133 = v24;
  objc_msgSend(v23, "parsec_mapAndFilterObjectsUsingBlock:", v132);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDescriptions:", v25);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("footnote"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFootnote:", v26);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("publish_date"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPublishDate:", v27);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("source"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceName:", v28);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("completion"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompletion:", v29);

  objc_msgSend(v7, "sf_imageForKey:reply:", CFSTR("completion_icon"), v24);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompletionImage:", v30);

  objc_msgSend(v7, "parsec_dictionaryForKey:", CFSTR("auxiliary_info"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "parsec_stringForKey:", CFSTR("top_text"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAuxiliaryTopText:", v32);

  objc_msgSend(v31, "parsec_stringForKey:", CFSTR("middle_text"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAuxiliaryMiddleText:", v33);

  objc_msgSend(v31, "parsec_stringForKey:", CFSTR("bottom_text"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAuxiliaryBottomText:", v34);

  v127 = v31;
  objc_msgSend(v8, "setAuxiliaryBottomTextColor:", objc_msgSend(v31, "sf_textColorForKey:", CFSTR("bottom_text_color")));
  objc_msgSend(v7, "parsec_dictionaryForKey:", CFSTR("action_button"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "sf_asActionItem:", v24);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAction:", v36);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("adam_id"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStoreIdentifier:", v37);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("entity_identifier"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEntityIdentifier:", v38);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("bundle_id"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResultBundleId:", v39);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("maps_result_type"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMapsResultType:", v40);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("maps_data"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v41, "length"))
  {
    objc_msgSend(v41, "parsec_base64DecodedData");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMapsData:", v42);

  }
  v126 = v41;
  v43 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("more_url"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "URLWithString:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMapsMoreURL:", v45);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("more"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMapsMoreString:", v46);

  objc_msgSend(v7, "sf_imageForKey:reply:", CFSTR("more_icon"), v24);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMapsMoreIcon:", v47);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("nearby_businesses"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNearbyBusinessesString:", v48);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("apple_referrer"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAppleReferrer:", v49);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("section_bundle_id"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSectionBundleIdentifier:", v50);

  objc_msgSend(v7, "parsec_numberForKey:", CFSTR("tophit"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTopHit:", objc_msgSend(v51, "sf_asTopHit"));

  objc_msgSend(v7, "parsec_numberForKey:", CFSTR("score"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "doubleValue");
  objc_msgSend(v8, "setRankingScore:");

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("card_title"));
  v53 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("card_url"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parsec_arrayForKey:", CFSTR("card_sections"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parsec_arrayForKey:", CFSTR("row_sections"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parsec_dictionaryForKey:", CFSTR("zkw_topic"));
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v121, "objectForKeyedSubscript:", CFSTR("topic"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "sf_asTopic");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNormalizedTopic:", v58);

  if (objc_msgSend(v56, "count"))
  {
    v59 = objc_alloc_init(MEMORY[0x1E0D8C210]);
    objc_msgSend(v59, "setType:", 1);
    objc_msgSend(v59, "setSource:", 1);
    objc_msgSend(v59, "setTitle:", v53);
    objc_msgSend(v56, "sf_asCardSections:", v24);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setCardSections:", v60);

    objc_msgSend(v8, "setInlineCard:", v59);
  }
  if (objc_msgSend(v55, "count"))
  {
    v61 = objc_alloc_init(MEMORY[0x1E0D8C210]);
    objc_msgSend(v61, "setType:", 1);
    objc_msgSend(v61, "setSource:", 1);
    objc_msgSend(v61, "setTitle:", v53);
    objc_msgSend(v7, "parsec_stringForKey:", CFSTR("fbr"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setFbr:", v62);

    objc_msgSend(v55, "sf_asCardSections:", v24);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setCardSections:", v63);

    objc_msgSend(v8, "setCard:", v61);
LABEL_12:

    goto LABEL_13;
  }
  if (objc_msgSend(v54, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v54);
    v61 = (id)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      v84 = objc_alloc_init(MEMORY[0x1E0D8C210]);
      objc_msgSend(v84, "setType:", 2);
      objc_msgSend(v84, "setSource:", 1);
      objc_msgSend(v84, "setTitle:", v53);
      objc_msgSend(v84, "setUrlValue:", v61);
      objc_msgSend(v8, "setCard:", v84);

    }
    goto LABEL_12;
  }
LABEL_13:
  v125 = (void *)v53;
  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("pb_compact_tophit"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "parsec_base64DecodedData");
  v65 = objc_claimAutoreleasedReturnValue();

  v131 = (void *)v65;
  if (v65)
  {
    v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C880]), "initWithData:", v65);
    if (v66)
    {
      v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C210]), "initWithProtobuf:", v66);
      objc_msgSend(v8, "setCompactCard:", v67);

    }
  }
  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("pb_tophit"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "parsec_base64DecodedData");
  v69 = objc_claimAutoreleasedReturnValue();

  v130 = (void *)v69;
  if (v69)
  {
    v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C880]), "initWithData:", v69);
    if (v70)
    {
      v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C210]), "initWithProtobuf:", v70);
      objc_msgSend(v8, "setTophitCard:", v71);

    }
  }
  v124 = v54;
  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("more_results_punchout"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v72, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (v73)
    {
      objc_msgSend(MEMORY[0x1E0D8C5E0], "punchoutWithURL:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "parsec_stringForKey:", CFSTR("more_results_label"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v75, "length"))
        objc_msgSend(v74, "setLabel:", v75);
      objc_msgSend(v8, "setMoreResultsPunchout:", v74);

    }
  }
  v122 = v56;
  v123 = v55;
  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("url"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parsec_dictionaryForKey:", CFSTR("app"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v76, "length"))
  {
    v78 = v76;
    if ((objc_msgSend(v78, "hasPrefix:", CFSTR("ical:")) & 1) != 0
      || objc_msgSend(v78, "hasPrefix:", CFSTR("calshow")))
    {
      v134 = 0;
      objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("X-APPLE-UNIVERSAL-ID=([^&]*)"), 1, &v134);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "firstMatchInString:options:range:", v78, 0, 0, objc_msgSend(v78, "length"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 0;
      if ((unint64_t)objc_msgSend(v80, "numberOfRanges") >= 2)
      {
        v82 = objc_msgSend(v80, "rangeAtIndex:", 1);
        objc_msgSend(v78, "substringWithRange:", v82, v83);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v81 = 0;
    }

    objc_msgSend(v8, "setCalendarIdentifier:", v81);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v78);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (v85)
      objc_msgSend(v8, "setUrl:", v85);

  }
  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("application_bundle_id"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setApplicationBundleIdentifier:", v86);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("placement"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlacement:", objc_msgSend(v87, "sf_asResultPlacement"));

  objc_msgSend(v7, "parsec_numberForKey:", CFSTR("hide_rank"));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMinimumRankOfTopHitToSuppressResult:", objc_msgSend(v88, "unsignedIntegerValue"));

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("section_header"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSectionHeader:", v89);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("section_header_more"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSectionHeaderMore:", v90);

  objc_msgSend(v7, "parsec_URLForKey:", CFSTR("section_header_more_url"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSectionHeaderMoreURL:", v91);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("type"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResultType:", v92);
  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("template"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResultTemplate:", v93);

  objc_msgSend(v8, "setIsQuickGlance:", objc_msgSend(v7, "parsec_BOOLForKey:", CFSTR("is_quick_glance")));
  objc_msgSend(v8, "setRenderHorizontallyWithOtherResultsInCategory:", objc_msgSend(v7, "parsec_BOOLForKey:", CFSTR("render_horizontally")));
  objc_msgSend(v8, "setIsStreaming:", objc_msgSend(v7, "parsec_BOOLForKey:", CFSTR("streaming")));
  objc_msgSend(v7, "parsec_numberForKey:", CFSTR("engagement_score"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEngagementScore:", v94);

  objc_msgSend(v7, "parsec_numberForKey:", CFSTR("qi_engagement_score"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setQueryIndependentScore:", v95);

  objc_msgSend(v7, "parsec_numberForKey:", CFSTR("max_age"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMaxAge:", v96);

  objc_msgSend(v7, "sf_imageForKey:reply:", CFSTR("icon"), v24);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIcon:", v97);

  objc_msgSend(v8, "setDoNotFold:", objc_msgSend(v7, "parsec_BOOLForKey:", CFSTR("do_not_fold")));
  objc_msgSend(v7, "parsec_numberForKey:", CFSTR("block_id"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBlockId:", objc_msgSend(v98, "unsignedLongLongValue"));

  objc_msgSend(v8, "url");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v99;
  if (v77)
  {
    objc_msgSend(v77, "sf_asPunchout:", v99);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPunchout:", v101);

    objc_msgSend(v8, "punchout");
    v102 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "bundleIdentifier");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setApplicationBundleIdentifier:", v103);

  }
  else
  {

    if (!v100)
      goto LABEL_45;
    v102 = objc_alloc_init(MEMORY[0x1E0D8C5E0]);
    objc_msgSend(v8, "url");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v135[0] = v104;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v135, 1);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setUrls:", v105);

    objc_msgSend(v8, "setPunchout:", v102);
  }

LABEL_45:
  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("title_note"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleNote:", v106);

  objc_msgSend(v7, "parsec_numberForKey:", CFSTR("title_note_size"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleNoteSize:", v107);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("query"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompletedQuery:", v108);

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("align"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsCentered:", objc_msgSend(v109, "isEqualToString:", CFSTR("center")));

  objc_msgSend(v7, "parsec_stringForKey:", CFSTR("pb"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "parsec_base64DecodedData");
  v111 = (void *)objc_claimAutoreleasedReturnValue();

  if (v111)
    +[ProtobufHelper processProtobuf:result:data:](_TtC10CoreParsec14ProtobufHelper, "processProtobuf:result:data:", v24, v8, v111);
  objc_msgSend(v7, "parsec_arrayForKey:", CFSTR("entities"));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  CoreParsec_fakeEntityData(v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEntityData:", v113);

  objc_msgSend(v8, "setIsInstantAnswer:", objc_msgSend(v7, "parsec_BOOLForKey:", CFSTR("is_instant_answer")));
  objc_msgSend(v8, "setShouldAutoNavigate:", objc_msgSend(v7, "parsec_BOOLForKey:", CFSTR("auto_navigate")));
  objc_msgSend(v7, "parsec_dictionaryForKey:", CFSTR("server_features"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setServerFeatures:", v114);

  objc_msgSend(v8, "setNoGoTakeover:", objc_msgSend(v7, "parsec_BOOLForKey:", CFSTR("no_go_takeover")));
  objc_msgSend(v8, "setShouldUseCompactDisplay:", objc_msgSend(v7, "parsec_BOOLForKey:", CFSTR("should_use_compact_display")));
  objc_msgSend(v8, "setPreferTopPlatter:", objc_msgSend(v7, "parsec_BOOLForKey:", CFSTR("prefer_top_platter")));
  objc_msgSend(v7, "parsec_arrayForKey:", CFSTR("alternative_urls"));
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "parsec_mapObjectsUsingBlock:", &__block_literal_global_431);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlternativeURLs:", v116);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "processVisualCATResultSynchronously");
  objc_msgSend(v7, "parsec_dictionaryForKey:", CFSTR("result_entity"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v117;
  if (v117)
  {
    objc_msgSend(v117, "sf_asResultEntity");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setResultEntity:", v119);

  }
  return v8;
}

- (id)sf_asImage:()SFExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  float v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  float v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parsec_base64DecodedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "parsec_URLForKey:", CFSTR("url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("mono"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    goto LABEL_2;
  if (v7)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D8C7F8]);
    objc_msgSend(v10, "setUrlValue:", v7);
  }
  else
  {
    if (!objc_msgSend(v8, "length"))
    {
LABEL_2:
      v10 = objc_alloc_init(MEMORY[0x1E0D8C418]);
      goto LABEL_7;
    }
    v10 = objc_alloc_init(MEMORY[0x1E0D8C540]);
    objc_msgSend(v10, "setMonogramLetters:", v9);
  }
LABEL_7:
  objc_msgSend(v10, "setSource:", 1);
  objc_msgSend(v10, "setImageData:", v6);
  objc_msgSend(v10, "setIsTemplate:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("is_template")));
  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("round_corner_pt"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  objc_msgSend(v10, "setCornerRadius:", v12);

  objc_msgSend(v10, "setShouldCropToCircle:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("crop_circle")));
  objc_msgSend(v4, "scale");
  if (v13 == 0.0)
  {
    v15 = 1.0;
  }
  else
  {
    objc_msgSend(v4, "scale");
    v15 = v14;
  }
  objc_msgSend(v10, "setScale:", v15);
  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("w"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  v18 = v17 / v15;

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("h"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  v21 = v20 / v15;

  objc_msgSend(v10, "setSize:", v18, v21);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("id"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIdentifier:", v22);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("content_type"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentType:", v23);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("key_color"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setKeyColor:", v24);

  return v10;
}

- (id)sf_imageForKey:()SFExtras reply:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a1, "parsec_dictionaryForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "sf_asImage:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)sf_textColorForKey:()SFExtras
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "parsec_stringForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("red")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("green")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("orange")))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)sf_asFormattedText:()SFExtras
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0D8C3D0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("text"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v7);

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("text_maxlines"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "unsignedIntegerValue");
  else
    v10 = 1;
  objc_msgSend(v6, "setMaxLines:", v10);
  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("glyph"), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setGlyph:", v11);
  objc_msgSend(v6, "setIsEmphasized:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("emphasized")));
  objc_msgSend(v6, "setIsBold:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("bold")));
  objc_msgSend(v6, "setTextColor:", objc_msgSend(a1, "sf_textColorForKey:", CFSTR("text_color")));

  return v6;
}

- (id)sf_asRichText:()SFExtras
{
  id v4;
  id v5;
  void *v6;
  float v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D8C660]);
  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("star_rating"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  objc_msgSend(v5, "setStarRating:", v7);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("content_advisory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentAdvisory:", v8);

  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("more_glyphs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __40__NSDictionary_SFExtras__sf_asRichText___block_invoke;
  v23[3] = &unk_1E3921F60;
  v11 = v4;
  v24 = v11;
  objc_msgSend(v9, "parsec_mapAndFilterObjectsUsingBlock:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIcons:", v12);

  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("formatted_text"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10;
  v19 = 3221225472;
  v20 = __40__NSDictionary_SFExtras__sf_asRichText___block_invoke_2;
  v21 = &unk_1E3921F60;
  v22 = v11;
  v14 = v11;
  objc_msgSend(v13, "parsec_mapAndFilterObjectsUsingBlock:", &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFormattedTextPieces:", v15, v18, v19, v20, v21);

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("text_maxlines"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaxLines:", objc_msgSend(v16, "unsignedIntegerValue"));

  return v5;
}

- (id)sf_asPunchout:()SFExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D8C5E0]);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("bundle_id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleIdentifier:", v7);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("label"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLabel:", v8);

  objc_msgSend(a1, "parsec_URLForKey:", CFSTR("punchout_uri"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parsec_URLForKey:", CFSTR("install_url"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = v11;
  if (v9)
    objc_msgSend(v11, "addObject:", v9);
  if (v4)
    objc_msgSend(v12, "addObject:", v4);
  if (v10)
    objc_msgSend(v12, "addObject:", v10);
  objc_msgSend(v5, "setUrls:", v12);

  return v5;
}

- (uint64_t)sf_asPunchout
{
  return objc_msgSend(a1, "sf_asPunchout:", 0);
}

- (id)sf_asActionItem:()SFExtras
{
  objc_class *v4;
  id v5;
  id v6;
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
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D8C178];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLabel:", v7);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("label_itunes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLabelForLocalMedia:", v8);

  objc_msgSend(v6, "setIsOverlay:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("is_overlay")));
  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("adam_ids"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStoreIdentifiers:", v9);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("phone_number"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPhoneNumber:", v10);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("email"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEmail:", v11);

  objc_msgSend(v6, "setRequiresLocalMedia:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("streaming")) ^ 1);
  objc_msgSend(a1, "parsec_URLForKey:", CFSTR("url"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parsec_dictionaryForKey:", CFSTR("punchout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "sf_asPunchout:", v12);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "parsec_stringForKey:", CFSTR("action_target_id"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActionTarget:", v16);
  }
  else
  {
    if (!v12)
      goto LABEL_6;
    v15 = objc_alloc_init(MEMORY[0x1E0D8C5E0]);
    objc_msgSend(a1, "parsec_stringForKey:", CFSTR("action_target_id"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActionTarget:", v17);

    v30[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUrls:", v16);
  }

  objc_msgSend(v6, "setPunchout:", v15);
LABEL_6:
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("provider"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProvider:", v18);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("offer_type"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOfferType:", v19);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("type"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setType:", v20);

  objc_msgSend(v6, "type");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "isEqualToString:", CFSTR("app")) & 1) != 0)
  {
    objc_msgSend(v6, "punchout");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setApplicationBundleIdentifier:", v23);

  }
  else
  {
    objc_msgSend(v6, "setApplicationBundleIdentifier:", 0);
  }

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("label_itunes"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLabelITunes:", v24);

  objc_msgSend(v6, "setIsITunes:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("is_itunes")));
  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("icon"), v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIcon:", v25);

  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("base_icon"), v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setBaseIcon:", v26);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("message_identifier"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessageIdentifier:", v27);

  objc_msgSend(a1, "parsec_URLForKey:", CFSTR("message_url"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessageURL:", v28);

  return v6;
}

- (id)sf_asAirport
{
  id v2;
  void *v3;
  void *v4;
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
  void *v15;
  void *v16;

  v2 = objc_alloc_init(MEMORY[0x1E0D8C180]);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("code"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCode:", v3);

  v4 = (void *)MEMORY[0x1E0C99E80];
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("timezone"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZoneWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimezone:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0D8C478]);
  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("latitude"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v7, "setLat:");

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("longitude"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v7, "setLng:");

  objc_msgSend(v2, "setLocation:", v7);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("city"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCity:", v10);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("street"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStreet:", v11);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("district"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDistrict:", v12);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("state"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setState:", v13);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("postal_code"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPostalCode:", v14);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("country_code"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCountryCode:", v15);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("country"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCountry:", v16);

  return v2;
}

- (id)sf_asTopic
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
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  id v21;
  void *v22;

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("query"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "intValue") != 1)
  {
    if (objc_msgSend(v3, "intValue") == 2)
    {
      v11 = objc_alloc(MEMORY[0x1E0D8C5E8]);
      v12 = 1;
    }
    else
    {
      if (objc_msgSend(v3, "intValue") == 3)
      {
        objc_msgSend(a1, "parsec_dictionaryForKey:", CFSTR("Detail"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "parsec_dictionaryForKey:", CFSTR("weather"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_alloc_init(MEMORY[0x1E0D8C478]);
        objc_msgSend(v14, "parsec_numberForKey:", CFSTR("lat"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        objc_msgSend(v15, "setLat:");

        objc_msgSend(v14, "parsec_numberForKey:", CFSTR("long"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        objc_msgSend(v15, "setLng:");

        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C860]), "initWithQuery:location:identifier:", v2, v15, v4);
        goto LABEL_16;
      }
      if (objc_msgSend(v3, "intValue") == 4)
      {
        v11 = objc_alloc(MEMORY[0x1E0D8C5E8]);
        v12 = 2;
      }
      else if (objc_msgSend(v3, "intValue") == 6)
      {
        v11 = objc_alloc(MEMORY[0x1E0D8C5E8]);
        v12 = 6;
      }
      else
      {
        if (objc_msgSend(v3, "intValue") != 7)
        {
          if (objc_msgSend(v3, "intValue") == 8)
          {
            objc_msgSend(a1, "parsec_dictionaryForKey:", CFSTR("Detail"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "parsec_dictionaryForKey:", CFSTR("sports"));
            v6 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = objc_alloc(MEMORY[0x1E0D8C730]);
            objc_msgSend(v6, "parsec_stringForKey:", CFSTR("requested_entity_type"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = (void *)objc_msgSend(v21, "initWithQuery:requestedEntityType:identifier:", v2, v22, v4);

            goto LABEL_3;
          }
          v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8C5E8]), "initWithType:query:", 7, v2);
LABEL_15:
          v10 = (void *)v18;
          goto LABEL_16;
        }
        v11 = objc_alloc(MEMORY[0x1E0D8C5E8]);
        v12 = 8;
      }
    }
    v18 = objc_msgSend(v11, "initWithType:query:identifier:", v12, v2, v4);
    goto LABEL_15;
  }
  objc_msgSend(a1, "parsec_dictionaryForKey:", CFSTR("Detail"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "parsec_dictionaryForKey:", CFSTR("flight"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v6, "parsec_numberForKey:", CFSTR("timestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v8, "intValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C3C8]), "initWithQuery:date:identifier:", v2, v9, v4);
LABEL_3:

LABEL_16:
  return v10;
}

- (id)sf_asFlight
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = objc_alloc_init(MEMORY[0x1E0D8C3B0]);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFlightID:", v3);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("carrier_code"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCarrierCode:", v4);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("carrier_name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCarrierName:", v5);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("carrier_phone_number"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCarrierPhoneNumber:", v6);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("flight_number"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFlightNumber:", v7);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("operator_carrier_code"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOperatorCarrierCode:", v8);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("operator_flight_number"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOperatorFlightNumber:", v9);

  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("legs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parsec_mapObjectsUsingBlock:", &__block_literal_global_316);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setLegs:", v11);
  return v2;
}

- (id)sf_asSuggestion:()SFExtras
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "task");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "task");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "request");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queryString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "parsec_stringForKey:", CFSTR("query"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v10 = objc_alloc(MEMORY[0x1E0D8C6B0]);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("suggestion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");
  if (v13 <= 1)
    v14 = 1;
  else
    v14 = v13;
  v15 = (void *)objc_msgSend(v10, "initWithSuggestion:query:score:type:", v11, v9, v14, 0.0);

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("score"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  objc_msgSend(v15, "setScore:", v17);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("utterance_text"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUtteranceText:", v18);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("bundle_id"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBundleIdentifier:", v19);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("fbr"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFbr:", v20);

  objc_msgSend(v15, "setPreviouslyEngaged:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("ice")));
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("detail_text"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDetailText:", v21);

  objc_msgSend(a1, "parsec_dictionaryForKey:", CFSTR("server_features"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");
  objc_msgSend(v15, "setServerFeatures:", v23);

  return v15;
}

- (void)sf_baseCardSection:()SFExtras reply:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  __CFString *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[6];
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "parsec_URLForKey:", CFSTR("url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("punchouts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __51__NSDictionary_SFExtras__sf_baseCardSection_reply___block_invoke;
  v31[3] = &unk_1E3921FE8;
  v31[4] = v8;
  v31[5] = a1;
  objc_msgSend(v9, "parsec_mapObjectsUsingBlock:", v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPunchoutOptions:", v10);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("punchout_picker_label"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPunchoutPickerTitle:", v11);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("punchout_picker_dismiss_label"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPunchoutPickerDismissText:", v12);

  objc_msgSend(v6, "punchoutOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14 && v8)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0D8C5E0]);
    v33[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUrls:", v16);

    objc_msgSend(a1, "parsec_stringForKey:", CFSTR("action_target_id"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v17, "length"))
      v18 = v17;
    else
      v18 = CFSTR("open");
    objc_msgSend(v15, "setActionTarget:", v18);
    v32 = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPunchoutOptions:", v19);

  }
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("card_section_id"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCardSectionId:", v20);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("result_id"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResultIdentifier:", v21);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("type"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setType:", v22);

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("separator_style"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "integerValue");

  objc_msgSend(v6, "setHideDivider:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("hide_divider")));
  if (!(_DWORD)v24)
  {
    if (!objc_msgSend(v6, "hideDivider"))
      goto LABEL_11;
    v24 = 1;
  }
  objc_msgSend(v6, "setSeparatorStyle:", v24);
LABEL_11:
  objc_msgSend(v6, "setCanBeHidden:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("can_be_hidden")));
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("card_url"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(a1, "parsec_stringForKey:", CFSTR("card_title"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_alloc_init(MEMORY[0x1E0D8C210]);
      objc_msgSend(v28, "setType:", 2);
      objc_msgSend(v28, "setSource:", 1);
      objc_msgSend(v28, "setTitle:", v27);
      objc_msgSend(v28, "setUrlValue:", v26);
      objc_msgSend(v7, "task");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "request");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setQueryId:", objc_msgSend(v30, "queryId"));

      objc_msgSend(v6, "setNextCard:", v28);
    }

  }
}

- (id)sf_asRowCardSection:()SFExtras
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D8C670]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("value"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v6;
  else
    v9 = (void *)v7;
  if (v6)
    v10 = (void *)v7;
  else
    v10 = 0;
  v11 = v9;
  v12 = v10;
  if (v11)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0D8C660]);
    objc_msgSend(v13, "setText:", v11);
    objc_msgSend(v5, "setLeadingText:", v13);
    v14 = objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("key_nowrap")) ^ 1;
    objc_msgSend(v5, "leadingText");
    v15 = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMaxLines:", v14);

    v11 = v15;
  }
  if (v12)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0D8C660]);
    objc_msgSend(v17, "setText:", v12);
    objc_msgSend(v5, "setTrailingText:", v17);

  }
  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("value_image"), v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v18);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("value_image_align"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("left"));

  if ((v20 & 1) == 0)
    objc_msgSend(v5, "setImageIsRightAligned:", 1);
  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("attribution_image"), v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributionImage:", v21);

  objc_msgSend(v5, "setKey:", v6);
  objc_msgSend(v5, "setKeyNoWrap:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("key_nowrap")));
  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("key_weight"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyWeight:", v22);

  objc_msgSend(v5, "setCardPaddingBottom:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("card_padding_bottom")));
  objc_msgSend(v5, "setValue:", v8);
  objc_msgSend(v5, "setValueNoWrap:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("value_nowrap")));
  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("value_weight"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValueWeight:", v23);

  return v5;
}

- (id)sf_asRichTitleCardSection:()SFExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, void *);
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D8C668]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("title_align"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsCentered:", objc_msgSend(v7, "isEqualToString:", CFSTR("center")));

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("subtitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubtitle:", v8);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("content_rating_text"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentAdvisory:", v9);

  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("image"), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleImage:", v10);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("description"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDescriptionText:", v11);

  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("rt_glyph"), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReviewGlyph:", v12);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("rt_text"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReviewText:", v13);

  objc_msgSend(v5, "setReviewNewLine:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("rt_newline")));
  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("more_glyphs"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __52__NSDictionary_SFExtras__sf_asRichTitleCardSection___block_invoke;
  v40[3] = &unk_1E3921F60;
  v16 = v4;
  v41 = v16;
  objc_msgSend(v14, "parsec_mapAndFilterObjectsUsingBlock:", v40);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMoreGlyphs:", v17);

  objc_msgSend(a1, "parsec_dictionaryForKey:", CFSTR("auxiliary_info"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "parsec_stringForKey:", CFSTR("top_text"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuxiliaryTopText:", v19);

  objc_msgSend(v18, "parsec_stringForKey:", CFSTR("middle_text"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuxiliaryMiddleText:", v20);

  objc_msgSend(v18, "parsec_stringForKey:", CFSTR("bottom_text"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuxiliaryBottomText:", v21);

  objc_msgSend(v5, "setAuxiliaryBottomTextColor:", objc_msgSend(v18, "sf_textColorForKey:", CFSTR("bottom_text_color")));
  objc_msgSend(v18, "parsec_numberForKey:", CFSTR("align"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAuxiliaryAlignment:", v22);

  objc_msgSend(v5, "setHideVerticalDivider:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("hide_vertical_divider")));
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("title_align"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleAlign:", objc_msgSend(v23, "sf_asTextAlignment"));

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("title_weight"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleWeight:", v24);

  objc_msgSend(v5, "setThumbnailCropCircle:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("thumbnail_crop_circle")));
  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("image_overlay"), v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageOverlay:", v25);

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("rating"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRating:", v26);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("rating_text"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRatingText:", v27);

  objc_msgSend(a1, "parsec_dictionaryForKey:", CFSTR("action_button"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "sf_asActionItem:", v16);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlayAction:", v29);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("action_button_align"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlayActionAlign:", objc_msgSend(v30, "sf_asButtonAlignment"));

  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("buy_button_sections"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v15;
  v36 = 3221225472;
  v37 = __52__NSDictionary_SFExtras__sf_asRichTitleCardSection___block_invoke_2;
  v38 = &unk_1E3921F60;
  v39 = v16;
  v32 = v16;
  objc_msgSend(v31, "parsec_mapObjectsUsingBlock:", &v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOffers:", v33, v35, v36, v37, v38);

  return v5;
}

- (id)sf_asTitleCardSection:()SFExtras
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D8C7D0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  return v6;
}

- (id)sf_asAppLinkCardSection:()SFExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D8C1B8]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("sections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__NSDictionary_SFExtras__sf_asAppLinkCardSection___block_invoke;
  v11[3] = &unk_1E3921F60;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "parsec_mapObjectsUsingBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppLinks:", v9);

  return v5;
}

- (id)sf_asTrackListCardSection:()SFExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D8C7F0]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("tracks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__NSDictionary_SFExtras__sf_asTrackListCardSection___block_invoke;
  v11[3] = &unk_1E3921F60;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "parsec_mapObjectsUsingBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTracks:", v9);

  return v5;
}

- (id)sf_asDescriptionCardSection:()SFExtras
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
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

  v4 = (objc_class *)MEMORY[0x1E0D8C328];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0D8C7A8]);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("description"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("description_maxlines"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMaxLines:", objc_msgSend(v10, "unsignedIntegerValue"));

  objc_msgSend(v6, "setDescriptionText:", v8);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("description_expand_text"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExpandText:", v11);

  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("image"), v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v12);

  objc_msgSend(v6, "setTitleNoWrap:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("title_nowrap")));
  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("title_weight"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitleWeight:", v13);

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("description_size"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDescriptionSize:", v14);

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("description_weight"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDescriptionWeight:", v15);

  objc_msgSend(v6, "setDescriptionExpand:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("description_expand")));
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("image_align"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageAlign:", objc_msgSend(v16, "sf_asImageAlignment"));

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("text_align"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextAlign:", objc_msgSend(v17, "sf_asTextAlignment"));

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("attribution_text"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributionText:", v18);

  objc_msgSend(a1, "parsec_URLForKey:", CFSTR("attribution_url"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributionURL:", v19);

  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("attribution_glyph"), v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAttributionGlyph:", v20);
  return v6;
}

- (id)sf_asMediaItem:()SFExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[5];

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D8C510]);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  v7 = (void *)MEMORY[0x1E0D8C7A8];
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("subtitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubtitleText:", v9);

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("subtitle_maxlines"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");
  objc_msgSend(v5, "subtitleText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMaxLines:", v11);

  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("image"), v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setThumbnail:", v13);

  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("rt_glyph"), v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReviewGlyph:", v14);

  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("image_overlay"), v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverlayImage:", v15);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("rt_text"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReviewText:", v16);

  v17 = MEMORY[0x1E0C809B0];
  v18 = (void *)MEMORY[0x1E0D8C5E0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __41__NSDictionary_SFExtras__sf_asMediaItem___block_invoke;
  v39[3] = &unk_1E3922010;
  v39[4] = a1;
  objc_msgSend(&unk_1E3959560, "parsec_mapAndFilterObjectsUsingBlock:", v39);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "punchoutWithURLs:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPunchout:", v20);

  objc_msgSend(a1, "objectForKey:", CFSTR("trailer_url"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(a1, "parsec_stringForKey:", CFSTR("caption"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v22);

    objc_msgSend(a1, "parsec_URLForKey:", CFSTR("trailer_url"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sf_asPunchout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setActionTarget:", CFSTR("trailer"));
    objc_msgSend(v5, "setPunchout:", v24);

  }
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("content_rating_text"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentAdvisory:", v25);

  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("more_glyphs"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v17;
  v37[1] = 3221225472;
  v37[2] = __41__NSDictionary_SFExtras__sf_asMediaItem___block_invoke_2;
  v37[3] = &unk_1E3921F60;
  v27 = v4;
  v38 = v27;
  objc_msgSend(v26, "parsec_mapAndFilterObjectsUsingBlock:", v37);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("subtitle_custom_line_breaking"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubtitleCustomLineBreaking:", v29);

  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("buy_button_sections"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v17;
  v35[1] = 3221225472;
  v35[2] = __41__NSDictionary_SFExtras__sf_asMediaItem___block_invoke_3;
  v35[3] = &unk_1E3921F60;
  v36 = v27;
  v31 = v27;
  objc_msgSend(v30, "parsec_mapObjectsUsingBlock:", v35);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBuyOptions:", v32);

  objc_msgSend(v28, "firstObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentAdvisoryImage:", v33);

  return v5;
}

- (id)sf_asMediaDetail:()SFExtras
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0D8C500]);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v3);

  v4 = objc_alloc_init(MEMORY[0x1E0D8C7A8]);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("description"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("description_maxlines"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxLines:", objc_msgSend(v6, "unsignedIntegerValue"));

  objc_msgSend(v2, "setContent:", v4);
  return v2;
}

- (id)sf_asWatchListItem:()SFExtras
{
  id v2;
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

  v2 = objc_alloc_init(MEMORY[0x1E0D8C850]);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("watchlist_identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWatchListIdentifier:", v3);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("added_to_upnext_text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAddedToUpNextText:", v4);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("add_to_upnext_text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAddToUpNextText:", v5);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("in_upnext_text"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInUpNextText:", v6);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("season_episode_format"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSeasonEpisodeTextFormat:", v7);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("continue_in_format"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContinueInTextFormat:", v8);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("open_button"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOpenButtonTitle:", v9);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("install_button"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInstallButtonTitle:", v10);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("purchase_offer_format"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPurchaseOfferTextFormat:", v11);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("watch_live_in_format"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWatchLiveTextFormat:", v12);

  return v2;
}

- (id)sf_asAppLink:()SFExtras
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0D8C1B0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  objc_msgSend(a1, "parsec_URLForKey:", CFSTR("url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8C5E0], "punchoutWithURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAppPunchout:", v9);

  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("image"), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setImage:", v10);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("image_align"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageAlign:", objc_msgSend(v11, "sf_asImageAlignment"));

  return v6;
}

- (id)sf_asTrack:()SFExtras
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x1E0D8C7E8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  objc_msgSend(a1, "parsec_URLForKey:", CFSTR("preview_url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreview:", v8);
  objc_msgSend(v6, "setHighlighted:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("highlighted")));
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("number"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumber:", v9);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("length"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDuration:", v10);

  objc_msgSend(a1, "parsec_dictionaryForKey:", CFSTR("action_button"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sf_asActionItem:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setPlayAction:", v12);
  return v6;
}

- (id)sf_asMediaOffer:()SFExtras
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D8C520];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLabel:", v7);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("subtitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSublabel:", v8);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("offer_type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOfferIdentifier:", v9);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("adam_id"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v21[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStoreIdentifiers:", v12);

  }
  else
  {
    objc_msgSend(v6, "setStoreIdentifiers:", 0);
  }
  objc_msgSend(a1, "parsec_URLForKey:", CFSTR("url"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0D8C5E0]);
    v20 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setUrls:", v15);

    objc_msgSend(v6, "offerIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v14, "setActionTarget:", v16);
    }
    else
    {
      objc_msgSend(a1, "parsec_stringForKey:", CFSTR("action_target_id"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setActionTarget:", v17);

    }
    objc_msgSend(v6, "setPunchout:", v14);

  }
  objc_msgSend(v6, "setIsEnabled:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("enabled")));
  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("image"), v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setImage:", v18);
  return v6;
}

- (id)sf_asMediaInfoCardSection:()SFExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D8C508]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  objc_msgSend(a1, "sf_asMediaItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaItem:", v6);

  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("sections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __52__NSDictionary_SFExtras__sf_asMediaInfoCardSection___block_invoke;
  v28[3] = &unk_1E3921F60;
  v9 = v4;
  v29 = v9;
  objc_msgSend(v7, "parsec_mapObjectsUsingBlock:", v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetails:", v10);

  objc_msgSend(a1, "parsec_dictionaryForKey:", CFSTR("action_button"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sf_asActionItem:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlayAction:", v12);

  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("buy_button_sections"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v8;
  v24 = 3221225472;
  v25 = __52__NSDictionary_SFExtras__sf_asMediaInfoCardSection___block_invoke_2;
  v26 = &unk_1E3921F60;
  v27 = v9;
  v14 = v9;
  objc_msgSend(v13, "parsec_mapObjectsUsingBlock:", &v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOffers:", v15, v23, v24, v25, v26);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("watchlist_identifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWatchListIdentifier:", v16);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("watchlist_button_label"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWatchListButtonLabel:", v17);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("watchlist_confirmation_text"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWatchListConfirmationText:", v18);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("watchlist_continuation_text"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWatchListContinuationText:", v19);

  objc_msgSend(v5, "setIsMediaContainer:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("is_media_container")));
  objc_msgSend(a1, "objectForKey:", CFSTR("special_offer"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sf_asRichText:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSpecialOfferButtonLabel:", v21);

  return v5;
}

- (id)sf_asMediaPlayerCardSection:()SFExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D8C528]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("trailers"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__NSDictionary_SFExtras__sf_asMediaPlayerCardSection___block_invoke;
  v11[3] = &unk_1E3922038;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v7, "parsec_mapAndFilterObjectsUsingBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMediaItems:", v9);

  return v5;
}

- (id)sf_asSocialMediaPostCardSection:()SFExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D8C718]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  objc_msgSend(v5, "setNameNoWrap:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("title_nowrap")));
  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("title_maxlines"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNameMaxLines:", v7);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("subtitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHandle:", v8);

  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("title_glyph"), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVerifiedGlyph:", v9);

  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("thumbnail"), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProfilePicture:", v10);

  v11 = objc_alloc_init(MEMORY[0x1E0D8C660]);
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("formatted_text"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__NSDictionary_SFExtras__sf_asSocialMediaPostCardSection___block_invoke;
  v19[3] = &unk_1E3921F60;
  v20 = v4;
  v13 = v4;
  objc_msgSend(v12, "parsec_mapAndFilterObjectsUsingBlock:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFormattedTextPieces:", v14);

  objc_msgSend(v5, "setPost:", v11);
  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("image"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPicture:", v15);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("date"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimestamp:", v16);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("footnote"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFootnote:", v17);

  return v5;
}

- (id)sf_asMetaInfoCardSection:()SFExtras
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0D8C530];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setTrending:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("trending")));
  objc_msgSend(a1, "parsec_URLForKey:", CFSTR("host_page_url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHostPageURL:", v7);

  objc_msgSend(a1, "parsec_URLForKey:", CFSTR("content_url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentURL:", v8);

  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("badge_image"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setBadge:", v9);
  return v6;
}

- (id)sf_asScoreboardCardSection:()SFExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D8C698]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("sub_title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubtitle:", v7);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("readable_string"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityDescription:", v8);

  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("images"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __53__NSDictionary_SFExtras__sf_asScoreboardCardSection___block_invoke;
  v21[3] = &unk_1E3922060;
  v22 = v4;
  v10 = v4;
  objc_msgSend(v9, "parsec_mapAndFilterObjectsUsingBlock:", v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count") == 2)
  {
    objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("scores"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") == 2)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setScore:", v13);

      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setScore:", v15);

    }
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTeam1:", v17);

    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTeam2:", v18);

    objc_msgSend(a1, "parsec_stringForKey:", CFSTR("event_status"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEventStatus:", v19);

  }
  return v5;
}

- (id)sf_asNowPlayingCardSection:()SFExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D8C550]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("subtitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSubtitle:", v7);

  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("movies"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__NSDictionary_SFExtras__sf_asNowPlayingCardSection___block_invoke;
  v12[3] = &unk_1E3921F60;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v8, "parsec_mapObjectsUsingBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMovies:", v10);

  return v5;
}

- (id)sf_asKeyValueDataCardSection:()SFExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D8C460]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("keys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("values"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") && (v8 = objc_msgSend(v6, "count"), v8 == objc_msgSend(v7, "count")))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__NSDictionary_SFExtras__sf_asKeyValueDataCardSection___block_invoke;
    v13[3] = &unk_1E3922088;
    v14 = v7;
    objc_msgSend(v6, "parsec_mapAndFilterObjectsUsingBlock:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setData:", v9);

    objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("image"), v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessoryImage:", v10);

    v11 = v5;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)sf_asTableAlignmentSchema
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *, unint64_t);
  void *v14;
  id v15;
  id v16;

  v2 = objc_alloc_init(MEMORY[0x1E0D8C788]);
  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("column_align"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("within_column_align"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("equal_width"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __51__NSDictionary_SFExtras__sf_asTableAlignmentSchema__block_invoke;
  v14 = &unk_1E39220B0;
  v15 = v4;
  v16 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v3, "parsec_mapObjectsUsingBlock:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTableColumnAlignment:", v8, v11, v12, v13, v14);

  objc_msgSend(a1, "parsec_dictionaryForKey:", CFSTR("metadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMetadata:", v9);

  return v2;
}

- (id)sf_asTableRowCardSection:()SFExtras
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("row_type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  switch(v6)
  {
    case 0:
      v7 = (objc_class *)MEMORY[0x1E0D8C7A0];
      goto LABEL_9;
    case 1:
      v12 = objc_alloc_init(MEMORY[0x1E0D8C7A0]);
      objc_msgSend(v12, "setIsSubHeader:", 1);
      goto LABEL_10;
    case 2:
      v7 = (objc_class *)MEMORY[0x1E0D8C798];
LABEL_9:
      v12 = objc_alloc_init(v7);
LABEL_10:
      objc_msgSend(a1, "sf_baseCardSection:reply:", v12, v4);
      objc_msgSend(a1, "parsec_stringForKey:", CFSTR("table_id"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTableIdentifier:", v13);

      objc_msgSend(a1, "parsec_dictionaryForKey:", CFSTR("alignment_schema"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sf_asTableAlignmentSchema");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAlignmentSchema:", v15);

      objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("value"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __51__NSDictionary_SFExtras__sf_asTableRowCardSection___block_invoke;
      v26[3] = &unk_1E3921F60;
      v27 = v4;
      objc_msgSend(v16, "parsec_mapObjectsUsingBlock:", v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setData:", v17);

      objc_msgSend(a1, "parsec_stringForKey:", CFSTR("tab_group_id"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTabGroupIdentifier:", v18);

      objc_msgSend(v12, "setReducedRowHeight:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("reduced_row_height")));
      objc_msgSend(a1, "parsec_numberForKey:", CFSTR("vertical_align"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setVerticalAlign:", objc_msgSend(v19, "sf_asRowAlignment"));

      objc_msgSend(v12, "setHasTopPadding:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("card_padding_top")));
      objc_msgSend(a1, "parsec_numberForKey:", CFSTR("align_rows_to_header"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
        v22 = objc_msgSend(v20, "BOOLValue");
      else
        v22 = 1;
      objc_msgSend(v12, "setAlignRowsToHeader:", v22);
      v23 = v12;

      goto LABEL_18;
    case 3:
      if (PARLogHandleForCategory_onceToken_274 != -1)
        dispatch_once(&PARLogHandleForCategory_onceToken_274, &__block_literal_global_767);
      v24 = PARLogHandleForCategory_logHandles_1_275;
      if (!os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_275, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_WORD *)buf = 0;
      v9 = "table row card section footer unsupported";
      v10 = v24;
      v11 = 2;
      break;
    default:
      if (PARLogHandleForCategory_onceToken_274 != -1)
        dispatch_once(&PARLogHandleForCategory_onceToken_274, &__block_literal_global_767);
      v8 = PARLogHandleForCategory_logHandles_1_275;
      if (!os_log_type_enabled((os_log_t)PARLogHandleForCategory_logHandles_1_275, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_DWORD *)buf = 134217984;
      v29 = v6;
      v9 = "unknown table row card section row type: %ld";
      v10 = v8;
      v11 = 12;
      break;
  }
  _os_log_error_impl(&dword_19A825000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
LABEL_17:
  v23 = 0;
LABEL_18:

  return v23;
}

- (id)sf_asButton:()SFExtras
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0D8C1D0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("image"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v7);

  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("selected_image"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSelectedImage:", v8);
  return v6;
}

- (id)sf_asColor:()SFExtras
{
  id v2;
  void *v3;
  float v4;
  void *v5;
  float v6;
  void *v7;
  float v8;
  void *v9;
  float v10;

  v2 = objc_alloc_init(MEMORY[0x1E0D8C288]);
  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("red_component"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  objc_msgSend(v2, "setRedComponent:", v4);

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("green_component"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  objc_msgSend(v2, "setGreenComponent:", v6);

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("blue_component"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  objc_msgSend(v2, "setBlueComponent:", v8);

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("alpha_component"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  objc_msgSend(v2, "setAlphaComponent:", v10);

  return v2;
}

- (id)sf_asDetailedRowCardSection:()SFExtras
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
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
  _QWORD v32[4];
  id v33;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D8C330]);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v5, v4);
  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("thumbnail"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setThumbnail:", v6);

  objc_msgSend(v5, "setPreventThumbnailImageScaling:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("thumbnail_image_scaling")));
  objc_msgSend(a1, "objectForKey:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sf_asRichText:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v8);

  objc_msgSend(a1, "objectForKey:", CFSTR("secondary_title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sf_asFormattedText:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryTitle:", v10);

  objc_msgSend(a1, "sf_imageForKey:reply:", CFSTR("secondary_image"), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryTitleImage:", v11);

  objc_msgSend(v5, "setIsSecondaryTitleDetached:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("secondary_title_detached")));
  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("descriptions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __54__NSDictionary_SFExtras__sf_asDetailedRowCardSection___block_invoke;
  v32[3] = &unk_1E3921F60;
  v33 = v4;
  v13 = v4;
  objc_msgSend(v12, "parsec_mapObjectsUsingBlock:", v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDescriptions:", v14);

  objc_msgSend(a1, "objectForKey:", CFSTR("footnote"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sf_asRichText:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFootnote:", v16);

  objc_msgSend(a1, "objectForKey:", CFSTR("trailing_top_text"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sf_asFormattedText:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrailingTopText:", v18);

  objc_msgSend(a1, "objectForKey:", CFSTR("trailing_middle_text"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sf_asFormattedText:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrailingMiddleText:", v20);

  objc_msgSend(a1, "objectForKey:", CFSTR("trailing_bottom_text"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sf_asFormattedText:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrailingBottomText:", v22);

  objc_msgSend(a1, "parsec_dictionaryForKey:", CFSTR("action_item"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sf_asActionItem:", v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAction:", v24);

  objc_msgSend(a1, "objectForKey:", CFSTR("button"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sf_asButton:", v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setButton:", v26);

  objc_msgSend(a1, "objectForKey:", CFSTR("background_color"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sf_asColor:", v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v28);

  objc_msgSend(a1, "objectForKey:", CFSTR("top_text"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sf_asRichText:", v13);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTopText:", v30);

  return v5;
}

- (id)sf_asTextColumnsCardSection:()SFExtras
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0D8C7C0];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);

  objc_msgSend(a1, "parsec_arrayForKey:", CFSTR("columns"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parsec_mapAndFilterObjectsUsingBlock:", &__block_literal_global_626);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColumns:", v8);

  return v6;
}

- (id)sf_asStockChartCardSection:()SFExtras
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D8C750];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);

  objc_msgSend(a1, "parsec_URLForKey:", CFSTR("third_party_content"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "setThirdPartyContentURL:", v7);

  return v6;
}

- (id)sf_asWebCardSection:()SFExtras
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0D8C868];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("html"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "setHtmlString:", v7);

  return v6;
}

- (id)sf_asFlightCardSection:()SFExtras
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0D8C3B8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);

  objc_msgSend(a1, "parsec_numberForKey:", CFSTR("selected_leg_index"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v6, "setSelectedLegIndex:", objc_msgSend(v7, "unsignedIntegerValue"));
  objc_msgSend(a1, "parsec_dictionaryForKey:", CFSTR("flight"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sf_asFlight");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFlight:", v10);

  return v6;
}

- (id)sf_asSuggestionCardSection:()SFExtras
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0D8C770];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("suggestion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSuggestionText:", v8);

  objc_msgSend(v6, "setIsContact:", objc_msgSend(a1, "parsec_BOOLForKey:", CFSTR("is_contact")));
  v9 = (void *)MEMORY[0x1E0D8C660];
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("detail_text"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDetailText:", v11);

  return v6;
}

- (id)sf_asWatchListCardSection:()SFExtras
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0D8C848];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "sf_baseCardSection:reply:", v6, v5);
  objc_msgSend(a1, "objectForKey:", CFSTR("watch_list_item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sf_asWatchListItem:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setWatchListItem:", v8);
  return v6;
}

- (id)sf_asResultEntity
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0D8C630]);
  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", v3);

  objc_msgSend(a1, "parsec_stringForKey:", CFSTR("maps_encrypted_muid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMaps_encrypted_muid:", v4);

  v5 = objc_alloc_init(MEMORY[0x1E0D8C4B8]);
  objc_msgSend(a1, "parsec_dictionaryForKey:", CFSTR("location_type_info"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parsec_stringForKey:", CFSTR("address"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAddress:", v7);

  objc_msgSend(v2, "setLocation_type_info:", v5);
  return v2;
}

@end
