@implementation FlexLocalDBSong

- (NSSet)tagIDs
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  double v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  double v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  _BYTE v169[128];
  _BYTE v170[128];
  uint64_t v171;

  v171 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_set(MEMORY[0x24BDBCEF0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v165 = 0u;
  v166 = 0u;
  v167 = 0u;
  v168 = 0u;
  objc_msgSend_genres(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v165, (uint64_t)v170, 16);
  if (v13)
  {
    v18 = v13;
    v19 = *(_QWORD *)v166;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v166 != v19)
          objc_enumerationMutation(v11);
        objc_msgSend_genreTag(*(void **)(*((_QWORD *)&v165 + 1) + 8 * v20), v14, v15, v16, v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v6, v22, (uint64_t)v21, v23, v24);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v165, (uint64_t)v170, 16);
    }
    while (v18);
  }

  objc_msgSend_mood(self, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_length(v29, v30, v31, v32, v33);

  if (v34)
  {
    v39 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_mood(self, v35, v36, v37, v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v39, v41, (uint64_t)CFSTR("%@%@"), v42, v43, CFSTR("Mood_"), v40);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v45, (uint64_t)v44, v46, v47);

  }
  objc_msgSend_moodAlt(self, v35, v36, v37, v38);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend_length(v48, v49, v50, v51, v52);

  if (v53)
  {
    v58 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_moodAlt(self, v54, v55, v56, v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v58, v60, (uint64_t)CFSTR("%@%@"), v61, v62, CFSTR("MoodAlt_"), v59);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v64, (uint64_t)v63, v65, v66);

  }
  objc_msgSend_pace(self, v54, v55, v56, v57);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend_length(v67, v68, v69, v70, v71);

  if (v72)
  {
    v77 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_pace(self, v73, v74, v75, v76);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v77, v79, (uint64_t)CFSTR("%@%@"), v80, v81, CFSTR("SongPace_"), v78);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v83, (uint64_t)v82, v84, v85);

  }
  v86 = (void *)MEMORY[0x24BDD17C8];
  v87 = objc_msgSend_style(self, v73, v74, v75, v76);
  objc_msgSend_stringWithFormat_(v86, v88, (uint64_t)CFSTR("%@%lld"), v89, v90, CFSTR("Style_"), v87);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v6, v92, (uint64_t)v91, v93, v94);

  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  objc_msgSend_regions(self, v95, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v100, (uint64_t)&v161, (uint64_t)v169, 16);
  if (v101)
  {
    v106 = v101;
    v107 = *(_QWORD *)v162;
    do
    {
      v108 = 0;
      do
      {
        if (*(_QWORD *)v162 != v107)
          objc_enumerationMutation(v99);
        objc_msgSend_countryCode(*(void **)(*((_QWORD *)&v161 + 1) + 8 * v108), v102, v103, v104, v105);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v6, v110, (uint64_t)v109, v111, v112);

        ++v108;
      }
      while (v106 != v108);
      v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v99, v102, (uint64_t)&v161, (uint64_t)v169, 16);
    }
    while (v106);
  }

  objc_msgSend_arousal(self, v113, v114, v115, v116);
  if (v121 > 0.0)
  {
    v122 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_arousal(self, v117, v118, v119, v120);
    objc_msgSend_stringWithFormat_(v122, v123, (uint64_t)CFSTR("%@%g"), v124, v125, CFSTR("Arousal_"), v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v128, (uint64_t)v127, v129, v130);

  }
  objc_msgSend_valence(self, v117, v118, v119, v120);
  if (v135 > 0.0)
  {
    v136 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_valence(self, v131, v132, v133, v134);
    objc_msgSend_stringWithFormat_(v136, v137, (uint64_t)CFSTR("%@%g"), v138, v139, CFSTR("Valence_"), v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v142, (uint64_t)v141, v143, v144);

  }
  objc_msgSend_visualTempo(self, v131, v132, v133, v134);
  if (v149 > 0.0)
  {
    v150 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_visualTempo(self, v145, v146, v147, v148);
    objc_msgSend_stringWithFormat_(v150, v151, (uint64_t)CFSTR("%@%g"), v152, v153, CFSTR("VisualTempo_"), v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v6, v156, (uint64_t)v155, v157, v158);

  }
  v159 = (void *)objc_msgSend_copy(v6, v145, v146, v147, v148);

  return (NSSet *)v159;
}

- (void)setRecordID:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x24BDD1618], a2, (uint64_t)a3, 1, (uint64_t)&v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (v8)
  {
    FlexLogForCategory(3uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_20D016000, v9, OS_LOG_TYPE_DEFAULT, "Error %@ archiving record ID", buf, 0xCu);
    }

  }
  objc_msgSend_setRecordData_(self, v5, (uint64_t)v4, v6, v7);

}

- (CKRecordID)recordID
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1620];
  v4 = objc_opt_class();
  objc_msgSend_recordData(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v3, v10, v4, (uint64_t)v9, (uint64_t)&v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v15;

  if (v12)
  {
    FlexLogForCategory(3uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_impl(&dword_20D016000, v13, OS_LOG_TYPE_DEFAULT, "Error %@ archiving record ID", buf, 0xCu);
    }

  }
  return (CKRecordID *)v11;
}

- (NSSet)genreStrings
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_set(MEMORY[0x24BDBCEF0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_managedObjectContext(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x24BDBB678], v12, (uint64_t)CFSTR("Genres"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v16, (uint64_t)CFSTR("song == %@"), v17, v18, self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPredicate_(v15, v20, (uint64_t)v19, v21, v22);

  v54 = 0;
  objc_msgSend_executeFetchRequest_error_(v11, v23, (uint64_t)v15, (uint64_t)&v54, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v54;
  v27 = v26;
  if (v25)
    v28 = v26 == 0;
  else
    v28 = 0;
  if (v28)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v29 = v25;
    v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v36, (uint64_t)&v50, (uint64_t)v55, 16);
    if (v37)
    {
      v42 = v37;
      v43 = *(_QWORD *)v51;
      do
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v51 != v43)
            objc_enumerationMutation(v29);
          objc_msgSend_genreTag(*(void **)(*((_QWORD *)&v50 + 1) + 8 * v44), v38, v39, v40, v41);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v6, v46, (uint64_t)v45, v47, v48);

          ++v44;
        }
        while (v42 != v44);
        v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v38, (uint64_t)&v50, (uint64_t)v55, 16);
      }
      while (v42);
    }
  }
  else
  {
    FlexLogForCategory(3uLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_20D041E80((uint64_t)v27, v29, v30, v31, v32, v33, v34, v35);
  }

  return (NSSet *)v6;
}

- (void)setGenreStrings:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  BOOL v45;
  NSObject *v46;
  NSObject *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id obj;
  FlexLocalDBSong *v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[4];
  void *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v76 = self;
  objc_msgSend_managedObjectContext(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCEF0];
  v15 = objc_msgSend_count(v4, v11, v12, v13, v14);
  objc_msgSend_setWithCapacity_(v10, v16, v15, v17, v18);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v4;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v78, (uint64_t)v84, 16);
  if (v20)
  {
    v24 = v20;
    v25 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v79 != v25)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x24BDBB678], v21, (uint64_t)CFSTR("Genres"), v22, v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v29, (uint64_t)CFSTR("(song == %@) AND (genreTag == %@)"), v30, v31, v76, v27);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPredicate_(v28, v33, (uint64_t)v32, v34, v35);

        v77 = 0;
        objc_msgSend_executeFetchRequest_error_(v9, v36, (uint64_t)v28, (uint64_t)&v77, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v77;
        v44 = v39;
        if (v38)
          v45 = v39 == 0;
        else
          v45 = 0;
        if (!v45)
        {
          FlexLogForCategory(3uLL);
          v46 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            goto LABEL_20;
          *(_DWORD *)buf = 138412290;
          v83 = v44;
          v47 = v46;
          v48 = "Failed to fetch genre:\n%@";
          goto LABEL_19;
        }
        if (objc_msgSend_count(v38, v40, v41, v42, v43))
        {
          if (objc_msgSend_count(v38, v49, v50, v51, v52) == 1)
          {
            objc_msgSend_firstObject(v38, v53, v54, v55, v56);
            v46 = objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v74, v57, (uint64_t)v46, v58, v59);
            goto LABEL_20;
          }
          FlexLogForCategory(3uLL);
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v83 = v38;
            v47 = v46;
            v48 = "Duplicate genres:\n%@";
LABEL_19:
            _os_log_error_impl(&dword_20D016000, v47, OS_LOG_TYPE_ERROR, v48, buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(MEMORY[0x24BDBB658], v49, (uint64_t)CFSTR("Genres"), (uint64_t)v9, v52);
          v46 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_setGenreTag_(v46, v60, v27, v61, v62);
          objc_msgSend_addObject_(v74, v63, (uint64_t)v46, v64, v65);
        }
LABEL_20:

      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v78, (uint64_t)v84, 16);
    }
    while (v24);
  }

  v70 = (void *)objc_msgSend_copy(v74, v66, v67, v68, v69);
  objc_msgSend_setGenres_(v76, v71, (uint64_t)v70, v72, v73);

}

- (NSSet)regionStrings
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_set(MEMORY[0x24BDBCEF0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_managedObjectContext(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x24BDBB678], v12, (uint64_t)CFSTR("Regions"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v16, (uint64_t)CFSTR("song == %@"), v17, v18, self);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPredicate_(v15, v20, (uint64_t)v19, v21, v22);

  v54 = 0;
  objc_msgSend_executeFetchRequest_error_(v11, v23, (uint64_t)v15, (uint64_t)&v54, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v54;
  v27 = v26;
  if (v25)
    v28 = v26 == 0;
  else
    v28 = 0;
  if (v28)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v29 = v25;
    v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v36, (uint64_t)&v50, (uint64_t)v55, 16);
    if (v37)
    {
      v42 = v37;
      v43 = *(_QWORD *)v51;
      do
      {
        v44 = 0;
        do
        {
          if (*(_QWORD *)v51 != v43)
            objc_enumerationMutation(v29);
          objc_msgSend_countryCode(*(void **)(*((_QWORD *)&v50 + 1) + 8 * v44), v38, v39, v40, v41);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v6, v46, (uint64_t)v45, v47, v48);

          ++v44;
        }
        while (v42 != v44);
        v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v38, (uint64_t)&v50, (uint64_t)v55, 16);
      }
      while (v42);
    }
  }
  else
  {
    FlexLogForCategory(3uLL);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_20D041EE8((uint64_t)v27, v29, v30, v31, v32, v33, v34, v35);
  }

  return (NSSet *)v6;
}

- (void)setRegionStrings:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  BOOL v45;
  NSObject *v46;
  NSObject *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id obj;
  FlexLocalDBSong *v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[4];
  void *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v76 = self;
  objc_msgSend_managedObjectContext(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCEF0];
  v15 = objc_msgSend_count(v4, v11, v12, v13, v14);
  objc_msgSend_setWithCapacity_(v10, v16, v15, v17, v18);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v4;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v78, (uint64_t)v84, 16);
  if (v20)
  {
    v24 = v20;
    v25 = *(_QWORD *)v79;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v79 != v25)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x24BDBB678], v21, (uint64_t)CFSTR("Regions"), v22, v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_predicateWithFormat_(MEMORY[0x24BDD1758], v29, (uint64_t)CFSTR("(song == %@) AND (countryCode == %@)"), v30, v31, v76, v27);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPredicate_(v28, v33, (uint64_t)v32, v34, v35);

        v77 = 0;
        objc_msgSend_executeFetchRequest_error_(v9, v36, (uint64_t)v28, (uint64_t)&v77, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v77;
        v44 = v39;
        if (v38)
          v45 = v39 == 0;
        else
          v45 = 0;
        if (!v45)
        {
          FlexLogForCategory(3uLL);
          v46 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            goto LABEL_20;
          *(_DWORD *)buf = 138412290;
          v83 = v44;
          v47 = v46;
          v48 = "Failed to fetch region:\n%@";
          goto LABEL_19;
        }
        if (objc_msgSend_count(v38, v40, v41, v42, v43))
        {
          if (objc_msgSend_count(v38, v49, v50, v51, v52) == 1)
          {
            objc_msgSend_firstObject(v38, v53, v54, v55, v56);
            v46 = objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v74, v57, (uint64_t)v46, v58, v59);
            goto LABEL_20;
          }
          FlexLogForCategory(3uLL);
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v83 = v38;
            v47 = v46;
            v48 = "Duplicate regions:\n%@";
LABEL_19:
            _os_log_error_impl(&dword_20D016000, v47, OS_LOG_TYPE_ERROR, v48, buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(MEMORY[0x24BDBB658], v49, (uint64_t)CFSTR("Regions"), (uint64_t)v9, v52);
          v46 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_setCountryCode_(v46, v60, v27, v61, v62);
          objc_msgSend_addObject_(v74, v63, (uint64_t)v46, v64, v65);
        }
LABEL_20:

      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v78, (uint64_t)v84, 16);
    }
    while (v24);
  }

  v70 = (void *)objc_msgSend_copy(v74, v66, v67, v68, v69);
  objc_msgSend_setRegions_(v76, v71, (uint64_t)v70, v72, v73);

}

- (BOOL)canPlay
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  objc_msgSend_songBundleURL(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

@end
