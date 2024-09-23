@implementation SGPipelineEnrichment

- (id)toCloudKitRecordWithId:(id)a3 parentEntityType:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  void *v50;
  uint64_t v51;
  void *v52;
  int v53;
  void *v54;
  int v55;
  void *v56;
  int v57;
  void *v58;
  int v59;
  void *v60;
  int v61;
  void *v62;
  int v63;
  void *v64;
  int v65;
  void *v66;
  int v67;
  void *v68;
  int v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  NSObject *v112;
  id v113;
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
  id v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  SGPipelineEnrichment *v133;
  void *v134;
  id v135;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  uint8_t buf[4];
  NSObject *v146;
  _BYTE v147[128];
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  v127 = a3;
  v7 = (void *)objc_opt_new();
  -[SGEntity duplicateKey](self, "duplicateKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entityKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity+CloudKitRecord.m"), 251, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self.duplicateKey.entityKey isKindOfClass:[SGPseudoEventKey class]]"));

  }
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0x10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity+CloudKitRecord.m"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentEntityType == SGEntityTypeWebPage || parentEntityType == SGEntityTypeInteraction"));

  }
  objc_msgSend(v7, "setParentEntityType:", a4);
  -[SGEntity duplicateKey](self, "duplicateKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entityKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "groupId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGroupId:", v13);

  -[SGEntity sourceKey](self, "sourceKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSourceKey:", v14);

  -[SGEntity content](self, "content");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContent:", v15);

  -[SGEntity title](self, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v16);

  -[SGEntity creationTimestamp](self, "creationTimestamp");
  objc_msgSend(v7, "setCreationTimestamp:");
  -[SGEntity lastModifiedTimestamp](self, "lastModifiedTimestamp");
  objc_msgSend(v7, "setLastModifiedTimestamp:");
  -[SGEntity tags](self, "tags");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "allDay");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "containsObject:", v18);

  objc_msgSend(v7, "setAllDay:", v19);
  -[SGEntity timeRange](self, "timeRange");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if ((v19 & 1) == 0 && objc_msgSend(v20, "isFloating"))
  {
    objc_msgSend(v21, "absoluteRange");
    v22 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v22;
  }
  v23 = (void *)objc_opt_new();
  objc_msgSend(v21, "start");
  objc_msgSend(v23, "setStart:");
  objc_msgSend(v21, "end");
  objc_msgSend(v23, "setEnd:");
  v126 = v21;
  if (objc_msgSend(v21, "isFloating"))
  {
    if ((v19 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity+CloudKitRecord.m"), 284, CFSTR("Only all-day events should be floating. Other events should have a timezone set before being synced up."));

    }
  }
  else
  {
    objc_msgSend(v23, "setStartUTCOffsetSeconds:", objc_msgSend(v21, "startUTCOffsetSeconds"));
    objc_msgSend(v23, "setEndUTCOffsetSeconds:", objc_msgSend(v21, "endUTCOffsetSeconds"));
  }
  v125 = v23;
  objc_msgSend(v7, "setWhen:", v23);
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  v133 = self;
  -[SGEntity locations](self, "locations");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v141, v148, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v142;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v142 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
        v31 = (void *)MEMORY[0x1C3BD4F6C]();
        v32 = (void *)objc_opt_new();
        objc_msgSend(v32, "setLocationType:", objc_msgSend(v30, "locationType"));
        objc_msgSend(v30, "label");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setLabel:", v33);

        objc_msgSend(v30, "address");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setAddress:", v34);

        objc_msgSend(v30, "airportCode");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setAirportCode:", v35);

        objc_msgSend(v30, "latitude");
        objc_msgSend(v30, "latitude");
        objc_msgSend(v32, "setLatitude:");
        objc_msgSend(v30, "longitude");
        objc_msgSend(v30, "longitude");
        objc_msgSend(v32, "setLongitude:");
        objc_msgSend(v30, "accuracy");
        objc_msgSend(v32, "setAccuracy:");
        objc_msgSend(v30, "quality");
        objc_msgSend(v32, "setQuality:");
        objc_msgSend(v30, "handle");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setHandle:", v36);

        objc_msgSend(v7, "addLocations:", v32);
        objc_autoreleasePoolPop(v31);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v141, v148, 16);
    }
    while (v27);
  }

  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  -[SGEntity tags](v133, "tags");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v137, v147, 16);
  if (!v38)
  {
    v129 = 0;
    v130 = 0;
    v90 = 0;
    v132 = 0;
    v134 = 0;
    v128 = 0;
    v131 = 0;
    v79 = 0;
    v40 = 0;
    v80 = v127;
    goto LABEL_98;
  }
  v39 = v38;
  v129 = 0;
  v130 = 0;
  v123 = 0;
  v124 = 0;
  v132 = 0;
  v134 = 0;
  v128 = 0;
  v131 = 0;
  v40 = 0;
  v41 = *(_QWORD *)v138;
  do
  {
    v42 = 0;
    do
    {
      if (*(_QWORD *)v138 != v41)
        objc_enumerationMutation(v37);
      v43 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * v42);
      if (objc_msgSend(v43, "isExtraKey"))
      {
        objc_msgSend(v43, "value");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setExtraKey:", v44);
LABEL_30:

        goto LABEL_31;
      }
      if (objc_msgSend(v43, "isDomain"))
      {
        objc_msgSend(v43, "value");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setDomain:", v44);
        goto LABEL_30;
      }
      if (objc_msgSend(v43, "isTemplateName"))
      {
        objc_msgSend(v43, "value");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTemplateName:", v44);
        goto LABEL_30;
      }
      if (objc_msgSend(v43, "isSchemaOrg"))
      {
        v45 = v43;

        v40 = v45;
        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E0D197F0], "extractedEventCancellation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v43, "isEqualToEntityTag:", v46);

      if (v47)
      {
        objc_msgSend(v7, "setCancelled:", 1);
        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E0D197F0], "extractedFlight");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v43, "isEqualToEntityTag:", v48);

      if (v49)
      {
        v50 = v7;
        v51 = 1;
LABEL_57:
        objc_msgSend(v50, "setCategoryType:", v51);
        goto LABEL_31;
      }
      objc_msgSend(MEMORY[0x1E0D197F0], "extractedBus");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v43, "isEqualToEntityTag:", v52);

      if (v53)
      {
        v50 = v7;
        v51 = 2;
        goto LABEL_57;
      }
      objc_msgSend(MEMORY[0x1E0D197F0], "extractedTrain");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v43, "isEqualToEntityTag:", v54);

      if (v55)
      {
        v50 = v7;
        v51 = 3;
        goto LABEL_57;
      }
      objc_msgSend(MEMORY[0x1E0D197F0], "extractedBoat");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v43, "isEqualToEntityTag:", v56);

      if (v57)
      {
        v50 = v7;
        v51 = 10;
        goto LABEL_57;
      }
      objc_msgSend(MEMORY[0x1E0D197F0], "extractedHotel");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v43, "isEqualToEntityTag:", v58);

      if (v59)
      {
        v50 = v7;
        v51 = 4;
        goto LABEL_57;
      }
      objc_msgSend(MEMORY[0x1E0D197F0], "extractedCarRental");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v43, "isEqualToEntityTag:", v60);

      if (v61)
      {
        v50 = v7;
        v51 = 5;
        goto LABEL_57;
      }
      objc_msgSend(MEMORY[0x1E0D197F0], "extractedTicket");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v43, "isEqualToEntityTag:", v62);

      if (v63)
      {
        v50 = v7;
        v51 = 6;
        goto LABEL_57;
      }
      objc_msgSend(MEMORY[0x1E0D197F0], "extractedMovie");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v43, "isEqualToEntityTag:", v64);

      if (v65)
      {
        v50 = v7;
        v51 = 7;
        goto LABEL_57;
      }
      objc_msgSend(MEMORY[0x1E0D197F0], "extractedFood");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v43, "isEqualToEntityTag:", v66);

      if (v67)
      {
        v50 = v7;
        v51 = 8;
        goto LABEL_57;
      }
      objc_msgSend(MEMORY[0x1E0D197F0], "extractedSocial");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v43, "isEqualToEntityTag:", v68);

      if (v69)
      {
        v50 = v7;
        v51 = 9;
        goto LABEL_57;
      }
      if (objc_msgSend(v43, "isInteractionId"))
      {
        v70 = v43;

        v124 = v70;
      }
      else if (objc_msgSend(v43, "isInteractionGroupId"))
      {
        v71 = v43;

        v132 = v71;
      }
      else if (objc_msgSend(v43, "isInteractionTeamId"))
      {
        v72 = v43;

        v131 = v72;
      }
      else if (objc_msgSend(v43, "isInteractionBundleId"))
      {
        v73 = v43;

        v130 = v73;
      }
      else if (objc_msgSend(v43, "isReservationItemReferences"))
      {
        v74 = v43;

        v123 = v74;
      }
      else if (objc_msgSend(v43, "isReservationContainerReference"))
      {
        v75 = v43;

        v129 = v75;
      }
      else if (objc_msgSend(v43, "isEventMetadata"))
      {
        v76 = v43;

        v134 = v76;
      }
      else if (objc_msgSend(v43, "isIntentResponseUserActivityString"))
      {
        v77 = v43;

        v128 = v77;
      }
LABEL_31:
      ++v42;
    }
    while (v39 != v42);
    v78 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v137, v147, 16);
    v39 = v78;
  }
  while (v78);
  v79 = v124;

  v80 = v127;
  if (v40)
  {
    v81 = (void *)MEMORY[0x1C3BD4F6C]();
    v82 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend(v40, "value");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "dataUsingEncoding:", 4);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "JSONObjectWithData:options:error:", v84, 0, 0);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v81);
    if (v85)
    {
      v86 = (void *)MEMORY[0x1C3BD4F6C]();
      v136 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v85, 200, 0, &v136);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v136;
      objc_autoreleasePoolPop(v86);
      if (!v87)
      {
        sgLogHandle();
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v146 = v88;
          _os_log_error_impl(&dword_1C3607000, v89, OS_LOG_TYPE_ERROR, "SGCK Error serializing schema.org to plist: %@", buf, 0xCu);
        }

      }
      objc_msgSend(v7, "setSchemaOrg:", v87);

    }
    else
    {
      sgLogHandle();
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v88, OS_LOG_TYPE_ERROR, "SGCK error converting schema.org to plist.", buf, 2u);
      }
    }

  }
  if (v134)
  {
    v91 = (void *)MEMORY[0x1C3BD4F6C]();
    v92 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend(v134, "value");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "dataUsingEncoding:", 4);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "JSONObjectWithData:options:error:", v94, 0, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v91);
    if (v37)
    {
      v95 = (void *)MEMORY[0x1C3BD4F6C]();
      v135 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v37, 200, 0, &v135);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v135;
      objc_autoreleasePoolPop(v95);
      if (v96)
      {
        objc_msgSend(v7, "setMetadata:", v96);
        v90 = v123;
      }
      else
      {
        sgLogHandle();
        v98 = objc_claimAutoreleasedReturnValue();
        v90 = v123;
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v146 = v97;
          _os_log_error_impl(&dword_1C3607000, v98, OS_LOG_TYPE_ERROR, "SGCK Error serializing event metadata to plist: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      sgLogHandle();
      v97 = objc_claimAutoreleasedReturnValue();
      v90 = v123;
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v97, OS_LOG_TYPE_ERROR, "SGCK Error converting event metadata to plist.", buf, 2u);
      }
    }

LABEL_98:
  }
  else
  {
    v134 = 0;
    v90 = v123;
  }
  if (objc_msgSend(v7, "parentEntityType") == 16)
  {
    v99 = (void *)objc_opt_new();
    objc_msgSend(v79, "value");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setInteractionId:", v100);

    objc_msgSend(v132, "value");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setInteractionGroupId:", v101);

    objc_msgSend(v131, "value");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setInteractionTeamId:", v102);

    objc_msgSend(v130, "value");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setInteractionBundleId:", v103);

    objc_msgSend(v128, "value");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setIntentResponseUserActivityString:", v104);

    objc_msgSend(v129, "value");
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    if (v105)
    {
      v106 = objc_alloc(MEMORY[0x1E0C99D50]);
      objc_msgSend(v129, "value");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = (void *)objc_msgSend(v106, "initWithBase64EncodedString:options:", v107, 0);

      objc_msgSend(v99, "setReservationContainerReference:", v108);
    }
    objc_msgSend(v90, "value");
    v109 = (void *)objc_claimAutoreleasedReturnValue();

    if (v109)
    {
      v110 = objc_alloc(MEMORY[0x1E0C99D50]);
      objc_msgSend(v90, "value");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = objc_msgSend(v110, "initWithBase64EncodedString:options:", v111, 0);

      objc_msgSend(v99, "setReservationItemReferences:", v112);
      objc_msgSend(v7, "setInteractionInfo:", v99);
    }
    else
    {
      sgLogHandle();
      v112 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v112, OS_LOG_TYPE_ERROR, "SGCK Reservation item reference value was nil for interaction entity", buf, 2u);
      }
    }

  }
  v113 = objc_alloc(MEMORY[0x1E0C95048]);
  if (v80)
    v114 = (void *)objc_msgSend(v113, "initWithRecordType:recordID:", CFSTR("com_apple_suggestions_ck_event"), v80);
  else
    v114 = (void *)objc_msgSend(v113, "initWithRecordType:", CFSTR("com_apple_suggestions_ck_event"));
  v115 = v114;
  objc_msgSend(v114, "setObject:forKeyedSubscript:", &unk_1E7E0C5D8, CFSTR("v"));
  objc_msgSend(v115, "setObject:forKeyedSubscript:", &unk_1E7E0C5D8, CFSTR("m"));
  v116 = (void *)MEMORY[0x1E0D81560];
  objc_msgSend(v7, "data");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "compress:lowMemory:", v117, 1);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "encryptedValues");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "setObject:forKeyedSubscript:", v118, CFSTR("pe"));

  return v115;
}

- (SGPipelineEnrichment)initWithDuplicateKey:(id)a3 title:(id)a4 parent:(id)a5
{
  id v8;
  id v9;
  id v10;
  SGPipelineEnrichment *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  SGPipelineEnrichment *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SGPipelineEnrichment;
  v11 = -[SGEntity init](&v17, sel_init);
  if (v11)
  {
    objc_msgSend(v10, "creationTimestamp");
    -[SGPipelineEnrichment setCreationTimestamp:](v11, "setCreationTimestamp:");
    objc_msgSend(v10, "lastModifiedTimestamp");
    -[SGPipelineEnrichment setLastModifiedTimestamp:](v11, "setLastModifiedTimestamp:");
    objc_msgSend(v10, "sourceKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGEntity setSourceKey:](v11, "setSourceKey:", v12);

    -[SGEntity setDuplicateKey:](v11, "setDuplicateKey:", v8);
    -[SGEntity setTitle:](v11, "setTitle:", v9);
    if (v10)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __58__SGPipelineEnrichment_initWithDuplicateKey_title_parent___block_invoke;
      v14[3] = &unk_1E7DB6A30;
      v15 = v10;
      v16 = v11;
      objc_msgSend(v15, "runWithDissectorLock:", v14);

    }
  }

  return v11;
}

- (SGPipelineEnrichment)initWithPseudoContactWithKey:(id)a3 parent:(id)a4 name:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  SGPipelineEnrichment *v14;
  void *v16;
  void *v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEnrichment.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identityKey"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEnrichment.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parent"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v10, "duplicateKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDuplicateKey duplicateKeyForPseudoContactWithIdentity:parentKey:](SGDuplicateKey, "duplicateKeyForPseudoContactWithIdentity:parentKey:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SGPipelineEnrichment initWithDuplicateKey:title:parent:](self, "initWithDuplicateKey:title:parent:", v13, v11, v10);

  return v14;
}

- (SGPipelineEnrichment)initWithIntentPersonAtDate:(id)a3 bundleId:(id)a4 handle:(id)a5 displayName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  SGPipelineEnrichment *v16;
  void *v18;
  void *v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEnrichment.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEnrichment.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handle"));

LABEL_3:
  +[SGDuplicateKey duplicateKeyForInteractionWithBundleId:personHandle:](SGDuplicateKey, "duplicateKeyForInteractionWithBundleId:personHandle:", v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SGPipelineEnrichment initWithDuplicateKey:title:parent:](self, "initWithDuplicateKey:title:parent:", v15, v14, 0);
  if (v16)
  {
    objc_msgSend(v11, "timeIntervalSince1970");
    -[SGPipelineEnrichment setCreationTimestamp:](v16, "setCreationTimestamp:");
  }

  return v16;
}

- (SGPipelineEnrichment)initWithContactDetailWithKey:(id)a3 type:(unint64_t)a4 extractionInfo:(id)a5 curated:(BOOL)a6 parent:(id)a7 value:(id)a8 context:(id)a9 contextRangeOfInterest:(_NSRange)a10
{
  _BOOL4 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  int IsContact;
  uint64_t v23;
  uint64_t v24;
  SGDuplicateKey *v25;
  uint64_t v26;
  void *v27;
  SGDuplicateKey *v28;
  SGPipelineEnrichment *v29;
  void *v31;

  v12 = a6;
  v16 = a5;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a3;
  objc_msgSend(v19, "duplicateKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "entityType");
  IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEnrichment.m"), 81, CFSTR("The parent entity cannot be a contact"));

  }
  if (a4 > 6)
  {
    v23 = 0;
    v24 = 0;
  }
  else
  {
    v23 = qword_1C3858BC8[a4];
    v24 = qword_1C3858C00[a4];
  }
  v25 = [SGDuplicateKey alloc];
  if (v12)
    v26 = v23;
  else
    v26 = v24;
  objc_msgSend(v19, "duplicateKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[SGDuplicateKey initWithEntityKey:entityType:parentKey:](v25, "initWithEntityKey:entityType:parentKey:", v20, v26, v27);

  v29 = -[SGPipelineEnrichment initWithDuplicateKey:title:parent:](self, "initWithDuplicateKey:title:parent:", v28, v18, v19);
  if (v29)
  {
    -[SGEntity setExtractionInfo:](v29, "setExtractionInfo:", v16);
    -[SGEntity setContent:](v29, "setContent:", v17);
    -[SGEntity setContentRangeOfInterest:](v29, "setContentRangeOfInterest:", a10.location, a10.length);
  }

  return v29;
}

- (void)setCreationTimestamp:(SGUnixTimestamp_)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SGPipelineEnrichment;
  -[SGEntity setCreationTimestamp:](&v3, sel_setCreationTimestamp_, a3.secondsFromUnixEpoch);
}

- (void)setLastModifiedTimestamp:(SGUnixTimestamp_)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SGPipelineEnrichment;
  -[SGEntity setLastModifiedTimestamp:](&v3, sel_setLastModifiedTimestamp_, a3.secondsFromUnixEpoch);
}

- (BOOL)isEvent
{
  void *v2;
  char IsEvent;

  -[SGEntity duplicateKey](self, "duplicateKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entityType");
  IsEvent = SGEntityTypeIsEvent();

  return IsEvent;
}

- (BOOL)isPerson
{
  void *v2;
  char IsContact;

  -[SGEntity duplicateKey](self, "duplicateKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entityType");
  IsContact = SGEntityTypeIsContact();

  return IsContact;
}

- (id)loggingIdentifier
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  -[SGEntity duplicateKey](self, "duplicateKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SGEntity duplicateKey](self, "duplicateKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFString *)objc_msgSend(v4, "initWithFormat:", CFSTR("%tu"), objc_msgSend(v5, "hash"));

  }
  else
  {
    v6 = &stru_1E7DB83A8;
  }
  if ((unint64_t)-[__CFString length](v6, "length") > 0xC)
  {
    -[__CFString substringWithRange:](v6, "substringWithRange:", 0, 12);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (NSData)contentHash
{
  return self->_contentHash;
}

- (void)setContentHash:(id)a3
{
  objc_storeStrong((id *)&self->_contentHash, a3);
}

- (BOOL)pendingGeocode
{
  return self->_pendingGeocode;
}

- (void)setPendingGeocode:(BOOL)a3
{
  self->_pendingGeocode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentHash, 0);
}

void __58__SGPipelineEnrichment_initWithDuplicateKey_title_parent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "tags", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0D197F0], "isSent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0 || (objc_msgSend(v7, "isAppleMailMessageId") & 1) != 0)
        {

LABEL_9:
          objc_msgSend(*(id *)(a1 + 40), "addTag:", v7);
          goto LABEL_10;
        }
        v9 = objc_msgSend(v7, "isMailboxIdentifier");

        if ((v9 & 1) != 0)
          goto LABEL_9;
LABEL_10:
        ++v6;
      }
      while (v4 != v6);
      v10 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v4 = v10;
    }
    while (v10);
  }

}

+ (id)address:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SGContactDetailKey *v18;
  void *v19;
  void *v20;
  void *v21;
  SGContactDetailKey *v22;
  SGPipelineEnrichment *v23;
  void *v24;
  SGPipelineEnrichment *v25;
  _BOOL4 v27;

  v27 = a6;
  v13 = a9;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = [SGContactDetailKey alloc];
  objc_msgSend(v17, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeAddress(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SGContactDetailKey initWithIdentityKey:label:normalizedValue:](v18, "initWithIdentityKey:label:normalizedValue:", v16, v19, v21);

  v23 = [SGPipelineEnrichment alloc];
  objc_msgSend(v17, "value");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[SGPipelineEnrichment initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:](v23, "initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:", v22, 1, v13, v27, v15, v24, v14, a8.location, a8.length);
  return v25;
}

+ (id)phoneNumber:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SGContactDetailKey *v18;
  void *v19;
  void *v20;
  void *v21;
  SGContactDetailKey *v22;
  SGPipelineEnrichment *v23;
  void *v24;
  void *v25;
  SGPipelineEnrichment *v26;
  _BOOL4 v28;

  v28 = a6;
  v13 = a9;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = [SGContactDetailKey alloc];
  objc_msgSend(v17, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizePhoneNumber();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SGContactDetailKey initWithIdentityKey:label:normalizedValue:](v18, "initWithIdentityKey:label:normalizedValue:", v16, v19, v21);

  v23 = [SGPipelineEnrichment alloc];
  objc_msgSend(v17, "value");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x1C3BD44E0](v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SGPipelineEnrichment initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:](v23, "initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:", v22, 0, v13, v28, v15, v25, v14, a8.location, a8.length);

  return v26;
}

+ (id)emailAddress:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SGContactDetailKey *v18;
  void *v19;
  void *v20;
  void *v21;
  SGContactDetailKey *v22;
  SGPipelineEnrichment *v23;
  void *v24;
  SGPipelineEnrichment *v25;
  _BOOL4 v27;

  v27 = a6;
  v13 = a9;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = [SGContactDetailKey alloc];
  objc_msgSend(v17, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeEmailAddress();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SGContactDetailKey initWithIdentityKey:label:normalizedValue:](v18, "initWithIdentityKey:label:normalizedValue:", v16, v19, v21);

  v23 = [SGPipelineEnrichment alloc];
  objc_msgSend(v17, "value");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[SGPipelineEnrichment initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:](v23, "initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:", v22, 2, v13, v27, v15, v24, v14, a8.location, a8.length);
  return v25;
}

+ (id)birthday:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SGContactDetailKey *v18;
  void *v19;
  void *v20;
  void *v21;
  SGContactDetailKey *v22;
  SGPipelineEnrichment *v23;
  void *v24;
  SGPipelineEnrichment *v25;
  _BOOL4 v27;

  v27 = a6;
  v13 = a9;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = [SGContactDetailKey alloc];
  objc_msgSend(v17, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeBirthday(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SGContactDetailKey initWithIdentityKey:label:normalizedValue:](v18, "initWithIdentityKey:label:normalizedValue:", v16, v19, v21);

  v23 = [SGPipelineEnrichment alloc];
  objc_msgSend(v17, "value");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[SGPipelineEnrichment initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:](v23, "initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:", v22, 6, v13, v27, v15, v24, v14, a8.location, a8.length);
  return v25;
}

+ (id)instantMessageAddress:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SGContactDetailKey *v18;
  void *v19;
  void *v20;
  void *v21;
  SGContactDetailKey *v22;
  SGPipelineEnrichment *v23;
  void *v24;
  SGPipelineEnrichment *v25;
  _BOOL4 v27;

  v27 = a6;
  v13 = a9;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = [SGContactDetailKey alloc];
  objc_msgSend(v17, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeInstantMessageAddress(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SGContactDetailKey initWithIdentityKey:label:normalizedValue:](v18, "initWithIdentityKey:label:normalizedValue:", v16, v19, v21);

  v23 = [SGPipelineEnrichment alloc];
  objc_msgSend(v17, "value");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[SGPipelineEnrichment initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:](v23, "initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:", v22, 3, v13, v27, v15, v24, v14, a8.location, a8.length);
  return v25;
}

+ (id)socialProfile:(id)a3 forIdentity:(id)a4 parent:(id)a5 curated:(BOOL)a6 context:(id)a7 contextRangeOfInterest:(_NSRange)a8 extractionInfo:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SGContactDetailKey *v18;
  void *v19;
  void *v20;
  SGContactDetailKey *v21;
  SGPipelineEnrichment *v22;
  void *v23;
  SGPipelineEnrichment *v24;
  _BOOL4 v26;

  v26 = a6;
  v13 = a9;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = [SGContactDetailKey alloc];
  objc_msgSend(v17, "label");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeSocialProfile(v20);
  objc_claimAutoreleasedReturnValue();
  v21 = -[SGContactDetailKey initWithIdentityKey:label:normalizedValue:](v18, "initWithIdentityKey:label:normalizedValue:", v16, v19, v20);

  v22 = [SGPipelineEnrichment alloc];
  objc_msgSend(v17, "value");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = -[SGPipelineEnrichment initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:](v22, "initWithContactDetailWithKey:type:extractionInfo:curated:parent:value:context:contextRangeOfInterest:", v21, 4, v13, v26, v15, v23, v14, a8.location, a8.length);
  return v24;
}

@end
