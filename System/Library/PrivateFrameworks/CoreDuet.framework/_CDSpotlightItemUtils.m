@implementation _CDSpotlightItemUtils

+ (id)interactionUUIDForSearchableItemWithUID:(id)a3 bundleID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x193FEE914]();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@:%@"), v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  return v10;
}

+ (id)_contactsForPersons:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];

  v2 = a2;
  v3 = objc_opt_self();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45___CDSpotlightItemUtils__contactsForPersons___block_invoke;
  v6[3] = &__block_descriptor_40_e30____CDContact_16__0__CSPerson_8l;
  v6[4] = v3;
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (_CDContact)_contactForPerson:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _CDContact *v25;
  void *v26;
  _CDContact *v27;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "handles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDSpotlightContactResolver resolveContactIfPossibleFromContactIdentifierString:](_CDSpotlightContactResolver, "resolveContactIfPossibleFromContactIdentifierString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(v5, "identifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        v7,
        (isKindOfClass & 1) == 0))
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      +[_CDSpotlightItemUtils _contactForPerson:].cold.2();

    v10 = 0;
  }
  else
  {
    objc_msgSend(v5, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  if (!-[NSObject length](v10, "length"))
  {
    objc_msgSend(v2, "contactIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12
      && (v13 = (void *)v12,
          objc_msgSend(v2, "contactIdentifier"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          v15 = objc_opt_isKindOfClass(),
          v14,
          v13,
          (v15 & 1) == 0))
    {
      +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        +[_CDSpotlightItemUtils _contactForPerson:].cold.1();
    }
    else
    {
      objc_msgSend(v2, "contactIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "length");

      if (!v17)
        goto LABEL_15;
      objc_msgSend(v2, "contactIdentifier");
      v18 = v10;
      v10 = objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_15:
  if (v10)
    v19 = 3;
  else
    v19 = 0;
  objc_msgSend(v2, "handleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = +[_CDContact typeFromString:](_CDContact, "typeFromString:", v20);

  objc_msgSend(v2, "handles");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContactResolver normalizedStringFromContactString:](_CDContactResolver, "normalizedStringFromContactString:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = [_CDContact alloc];
  objc_msgSend(v2, "displayName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[_CDContact initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:](v25, "initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:", v24, v21, 0, v26, 0, v10, v19);

  return v27;
}

+ (uint64_t)isSearchableItemInSubscribedCalendar:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeForKey:", CFSTR("com_apple_mobilecal_calendarIsSubscribedCalendar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      +[_CDSpotlightItemUtils isSearchableItemInSubscribedCalendar:].cold.1((uint64_t)v4, v2, v6);

    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "BOOLValue");
  }

  return v5;
}

+ (uint64_t)isAllowedSearchableItem:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  _BOOL4 v20;

  v2 = a2;
  v3 = objc_opt_self();
  objc_msgSend(v2, "domainIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("attachmentDomain")))
  {
    objc_msgSend(v2, "domainIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("chatDomain"));

    if ((v6 & 1) != 0)
      goto LABEL_4;
    +[_CDConstants mobileCalendarBundleId]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_10;
    objc_msgSend(v2, "attributeSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "contentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attributeSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentTypeTree");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[_CDSpotlightItemUtils getInteractionMechanismForContentUTI:typeTree:](_CDSpotlightItemUtils, "getInteractionMechanismForContentUTI:typeTree:", v12, v14);

    if (v15 != 5)
    {
LABEL_10:
      v7 = 1;
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v2, "attributeSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "calendarDelegateIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        +[_CDSpotlightItemUtils isAllowedSearchableItem:].cold.3();
    }
    else
    {
      v19 = +[_CDSpotlightItemUtils isSearchableItemInSubscribedCalendar:](v3, v2);
      +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
      v18 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
      if (!v19)
      {
        if (v20)
          +[_CDSpotlightItemUtils isAllowedSearchableItem:].cold.2();
        v7 = 1;
        goto LABEL_15;
      }
      if (v20)
        +[_CDSpotlightItemUtils isAllowedSearchableItem:].cold.1();
    }
    v7 = 0;
LABEL_15:

    goto LABEL_16;
  }

LABEL_4:
  v7 = 0;
LABEL_17:

  return v7;
}

+ (id)_contactsForHandles:(void *)a3 emailAddresses:(void *)a4 names:
{
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _CDContact *v29;
  void *v31;
  id v32;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  objc_opt_self();
  v9 = objc_msgSend(v6, "count");
  v10 = objc_msgSend(v7, "count");
  v11 = objc_msgSend(v8, "count");
  if (v10 <= v11)
    v12 = v11;
  else
    v12 = v10;
  if (v9 <= v12)
    v13 = v12;
  else
    v13 = v9;
  if (objc_msgSend(v7, "count") < v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "_pas_proxyArrayWithObject:repetitions:", &stru_1E26E9728, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v14;
  }
  if (objc_msgSend(v6, "count") < v13)
  {
    v15 = v7;

    v6 = v15;
  }
  if (objc_msgSend(v8, "count", v6) < v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "_pas_proxyArrayWithObject:repetitions:", &stru_1E26E9728, v13);
    v16 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v16;
  }
  v32 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v13);
  if (v13)
  {
    v17 = 0;
    v18 = v8;
    v19 = v13;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");

      if (v21)
        break;
      objc_msgSend(v31, "objectAtIndexedSubscript:", v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v26, "length");

      if (v23)
      {
        objc_msgSend(v31, "objectAtIndexedSubscript:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "containsString:", CFSTR("@")) & 1) != 0)
          goto LABEL_17;
        v23 = objc_msgSend(v22, "rangeOfString:options:", CFSTR("^\\+[-0-9]+$"), 1024) != 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v22 = 0;
      }
LABEL_18:
      objc_msgSend(v8, "objectAtIndexedSubscript:", v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "length"))
      {
        if (!v22)
          goto LABEL_25;
      }
      else
      {

        v24 = 0;
        if (!v22)
        {
LABEL_25:
          v25 = 0;
          goto LABEL_26;
        }
      }
      +[_CDSpotlightContactResolver resolveContactIfPossibleFromContactIdentifierString:](_CDSpotlightContactResolver, "resolveContactIfPossibleFromContactIdentifierString:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
      objc_msgSend(v25, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
        v28 = 3;
      else
        v28 = 0;
      v29 = -[_CDContact initWithIdentifier:type:displayName:personId:personIdType:]([_CDContact alloc], "initWithIdentifier:type:displayName:personId:personIdType:", v22, v23, v24, v27, v28);
      objc_msgSend(v32, "addObject:", v29);

      ++v17;
      v8 = v18;
      if (v19 == v17)
        goto LABEL_32;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
    v23 = 2;
    goto LABEL_18;
  }
LABEL_32:

  return v32;
}

+ (id)policies
{
  objc_opt_self();
  if (policies_onceToken != -1)
    dispatch_once(&policies_onceToken, &__block_literal_global_28);
  return (id)policies_policies;
}

+ (id)interactionForSearchableItem:(id)a3 nsUserName:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _CDInteraction *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  BOOL v35;
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
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  void *v64;
  BOOL v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t k;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  char v93;
  unsigned int v94;
  uint64_t v95;
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
  _BOOL4 v107;
  void *v108;
  void *v109;
  char v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  _BOOL4 v117;
  void *v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t m;
  void *v123;
  void *v124;
  int v125;
  void *v126;
  int v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  void *v137;
  char v138;
  void *v139;
  _BOOL4 v140;
  NSObject *v141;
  void *v142;
  BOOL v143;
  NSObject *v144;
  void *context;
  void *v147;
  uint64_t v148;
  void *v149;
  id v150;
  void *v151;
  id v152;
  void *v153;
  void *v154;
  void *v155;
  id obj;
  id obja;
  id v158;
  void *v159;
  void *v160;
  _CDInteraction *v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _QWORD v170[4];
  id v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _QWORD v176[4];
  id v177;
  id v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  _QWORD v183[4];
  id v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _QWORD v196[2];
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  id v200;
  _QWORD v201[5];

  v201[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v158 = a4;
  v159 = v6;
  if ((+[_CDSpotlightItemUtils isAllowedSearchableItem:]((uint64_t)a1, v6) & 1) == 0)
  {
    v9 = 0;
    goto LABEL_152;
  }
  v161 = objc_alloc_init(_CDInteraction);
  objc_msgSend(v6, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentType");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentTypeTree");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  v160 = v7;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[_CDSpotlightItemUtils interactionForSearchableItem:nsUserName:].cold.5();

  -[_CDInteraction setMechanism:](v161, "setMechanism:", objc_msgSend(a1, "getInteractionMechanismForContentUTI:typeTree:", v155, v154));
  if (-[_CDInteraction mechanism](v161, "mechanism") != 7)
  {
    if (-[_CDInteraction mechanism](v161, "mechanism") == 1)
    {
      getCSMailboxInbox();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v201[0] = v10;
      getCSMailboxSent();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v201[1] = v11;
      getCSMailboxArchive();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v201[2] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v201, 3);
      v153 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "mailboxIdentifiers");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v200 = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v200, 1);
        v14 = objc_claimAutoreleasedReturnValue();

        v13 = (id)v14;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_19:

          goto LABEL_138;
        }
      }
      v191 = 0u;
      v192 = 0u;
      v189 = 0u;
      v190 = 0u;
      v13 = v13;
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v189, v199, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v190;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v190 != v16)
              objc_enumerationMutation(v13);
            if ((objc_msgSend(v153, "containsObject:", *(_QWORD *)(*((_QWORD *)&v189 + 1) + 8 * i)) & 1) != 0)
            {

              v7 = v160;
              goto LABEL_21;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v189, v199, 16);
          if (v15)
            continue;
          break;
        }
      }

      goto LABEL_19;
    }
LABEL_21:
    objc_msgSend(v7, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setStartDate:](v161, "setStartDate:", v18);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setUpdateDate:](v161, "setUpdateDate:", v19);

    objc_msgSend(v160, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setEndDate:](v161, "setEndDate:", v20);

    -[_CDInteraction startDate](v161, "startDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = v21 == 0;

    if ((_DWORD)v20)
    {
      objc_msgSend(v160, "contentCreationDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDInteraction setStartDate:](v161, "setStartDate:", v22);

    }
    -[_CDInteraction endDate](v161, "endDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_25;
    -[_CDInteraction endDate](v161, "endDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction startDate](v161, "startDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "timeIntervalSinceDate:", v25);
    v27 = v26 < 0.0;

    if (v27)
    {
LABEL_25:
      -[_CDInteraction startDate](v161, "startDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDInteraction setEndDate:](v161, "setEndDate:", v28);

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v153, "BOOLForKey:", CFSTR("com.apple.coreduetd.recordpastevents")) & 1) == 0)
    {
      +[_CDSpotlightItemUtils policies]();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "dateOfOldestAllowedInteractionForMechanism:", -[_CDInteraction mechanism](v161, "mechanism"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDInteraction startDate](v161, "startDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "timeIntervalSinceReferenceDate");
      v33 = v32;
      objc_msgSend(v30, "timeIntervalSinceReferenceDate");
      v35 = v33 >= v34;

      if (!v35)
        goto LABEL_138;
    }
    objc_msgSend(v160, "accountIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setAccount:](v161, "setAccount:", v36);

    objc_msgSend(v159, "bundleID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setBundleId:](v161, "setBundleId:", v37);

    objc_msgSend(v159, "domainIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setDomainIdentifier:](v161, "setDomainIdentifier:", v38);

    objc_msgSend(v159, "uniqueIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v159, "bundleID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "interactionUUIDForSearchableItemWithUID:bundleID:", v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setUuid:](v161, "setUuid:", v41);

    -[_CDInteraction bundleId](v161, "bundleId");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDConstants mobileMessagesBundleId]();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v41) = objc_msgSend(v42, "isEqualToString:", v43);

    if ((_DWORD)v41)
    {
      -[_CDInteraction domainIdentifier](v161, "domainIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringByAddingPercentEncodingWithAllowedCharacters:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDInteraction setDerivedIntentIdentifier:](v161, "setDerivedIntentIdentifier:", v46);

      objc_msgSend(v160, "customAttributeDictionary");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("com_apple_mobilesms_groupPhotoPath"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = v160;
      if (v48)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v48);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[_CDInteraction setContentURL:](v161, "setContentURL:", v50);

          v49 = v160;
        }
      }
      objc_msgSend(v49, "customAttributeDictionary");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("com_apple_mobilesms_chatUniqueIdentifier"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[_CDInteraction setAccount:](v161, "setAccount:", v52);
      }

    }
    v151 = (void *)MEMORY[0x193FEE914](-[_CDInteraction setNsUserName:](v161, "setNsUserName:", v158));
    objc_msgSend(v160, "accountHandles");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_opt_new();
    v187 = 0u;
    v188 = 0u;
    v185 = 0u;
    v186 = 0u;
    v55 = v53;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v185, v198, 16);
    if (v56)
    {
      v57 = *(_QWORD *)v186;
      do
      {
        for (j = 0; j != v56; ++j)
        {
          if (*(_QWORD *)v186 != v57)
            objc_enumerationMutation(v55);
          +[_CDContactResolver normalizedStringFromContactString:](_CDContactResolver, "normalizedStringFromContactString:", *(_QWORD *)(*((_QWORD *)&v185 + 1) + 8 * j));
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "addObject:", v59);

        }
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v185, v198, 16);
      }
      while (v56);
    }

    if (-[_CDInteraction mechanism](v161, "mechanism") == 5)
    {
      objc_msgSend(v160, "attributeForKey:", CFSTR("com_apple_mobilecal_recipientParticipationStatuses"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v61 = v60;
        if (objc_msgSend(v61, "indexOfObjectPassingTest:", &__block_literal_global_450) == 0x7FFFFFFFFFFFFFFFLL)
          v62 = v61;
        else
          v62 = 0;

      }
      else
      {
        v62 = 0;
      }

    }
    else
    {
      v62 = 0;
    }
    v63 = v62;

    objc_msgSend(v160, "authors");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "count") == 0;

    if (v65)
    {
      objc_msgSend(v160, "authorAddresses");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "authorEmailAddresses");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "authorNames");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDSpotlightItemUtils _contactsForHandles:emailAddresses:names:]((uint64_t)a1, v66, v67, v68);
      obj = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v160, "authors");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDSpotlightItemUtils _contactsForPersons:]((uint64_t)a1, v66);
      obj = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v160, "primaryRecipients");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v183[0] = MEMORY[0x1E0C809B0];
    v183[1] = 3221225472;
    v183[2] = __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_2;
    v183[3] = &unk_1E26E45B8;
    v150 = v63;
    v184 = v150;
    objc_msgSend(v69, "_pas_mappedArrayWithIndexedTransform:", v183);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)objc_msgSend(v70, "mutableCopy");

    v181 = 0u;
    v182 = 0u;
    v179 = 0u;
    v180 = 0u;
    objc_msgSend(v160, "additionalRecipients");
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = (void *)v72;
    v74 = MEMORY[0x1E0C9AA60];
    if (v72)
      v75 = v72;
    else
      v75 = MEMORY[0x1E0C9AA60];
    v196[0] = v75;
    objc_msgSend(v160, "hiddenAdditionalRecipients");
    v76 = objc_claimAutoreleasedReturnValue();
    v77 = (void *)v76;
    if (v76)
      v78 = v76;
    else
      v78 = v74;
    v196[1] = v78;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v196, 2);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v179, v197, 16);
    if (v80)
    {
      v81 = *(_QWORD *)v180;
      do
      {
        for (k = 0; k != v80; ++k)
        {
          if (*(_QWORD *)v180 != v81)
            objc_enumerationMutation(v79);
          objc_msgSend(*(id *)(*((_QWORD *)&v179 + 1) + 8 * k), "_pas_mappedArrayWithTransform:", &__block_literal_global_454);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "addObjectsFromArray:", v83);

        }
        v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v179, v197, 16);
      }
      while (v80);
    }

    if (objc_msgSend(v71, "count"))
    {
      v176[0] = MEMORY[0x1E0C809B0];
      v176[1] = 3221225472;
      v176[2] = __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_4;
      v176[3] = &unk_1E26E4620;
      v178 = a1;
      v177 = obj;
      objc_msgSend(v71, "_pas_mappedArrayWithTransform:", v176);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v177;
    }
    else
    {
      objc_msgSend(v160, "recipientAddresses");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "recipientEmailAddresses");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v160, "recipientNames");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDSpotlightItemUtils _contactsForHandles:emailAddresses:names:]((uint64_t)a1, v85, v86, v87);
      v84 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v174 = 0u;
    v175 = 0u;
    v172 = 0u;
    v173 = 0u;
    obja = obj;
    v88 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v172, v195, 16);
    if (v88)
    {
      v89 = *(_QWORD *)v173;
LABEL_73:
      v90 = 0;
      while (1)
      {
        if (*(_QWORD *)v173 != v89)
          objc_enumerationMutation(obja);
        v91 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * v90);
        objc_msgSend(v91, "identifier");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = objc_msgSend(v54, "containsObject:", v92);

        if ((v93 & 1) != 0)
          break;
        if (v88 == ++v90)
        {
          v88 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v172, v195, 16);
          if (v88)
            goto LABEL_73;
          goto LABEL_79;
        }
      }
      v152 = v91;

      v170[0] = MEMORY[0x1E0C809B0];
      v170[1] = 3221225472;
      v170[2] = __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_5;
      v170[3] = &unk_1E26E4648;
      v171 = v54;
      objc_msgSend(v84, "_pas_filteredArrayWithTest:", v170);
      v95 = objc_claimAutoreleasedReturnValue();

      if (v152)
      {
        -[_CDInteraction setSender:](v161, "setSender:");
        v94 = 1;
        v96 = (void *)v95;
        goto LABEL_86;
      }
      v94 = 1;
      v84 = (void *)v95;
    }
    else
    {
LABEL_79:

      v94 = 0;
    }
    if (objc_msgSend(obja, "count"))
    {
      objc_msgSend(obja, "firstObject");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDInteraction setSender:](v161, "setSender:", v97);

    }
    v152 = 0;
    v96 = v84;
LABEL_86:
    v149 = v96;
    -[_CDInteraction setRecipients:](v161, "setRecipients:");
    objc_msgSend(v160, "displayName");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CDInteraction setGroupName:](v161, "setGroupName:", v98);

    -[_CDInteraction bundleId](v161, "bundleId");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CDConstants mobileMessagesBundleId]();
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v98) = objc_msgSend(v99, "isEqual:", v100);

    if ((_DWORD)v98)
    {
      -[_CDInteraction groupName](v161, "groupName");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      if (v101)
      {
LABEL_88:

        goto LABEL_89;
      }
      -[_CDInteraction recipients](v161, "recipients");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = (unint64_t)objc_msgSend(v106, "count") > 1;

      if (v107)
      {
        -[_CDInteraction domainIdentifier](v161, "domainIdentifier");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        sIMSPIGetDisplayNameAndParticipantsForChatWithGUID(v108);
        v101 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v101, "count"))
        {
          objc_msgSend(v101, "firstObject");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = objc_opt_respondsToSelector();

          if ((v110 & 1) != 0)
          {
            objc_msgSend(v101, "firstObject");
            v111 = objc_claimAutoreleasedReturnValue();
            -[NSObject displayName](v111, "displayName");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            -[_CDInteraction setGroupName:](v161, "setGroupName:", v112);

          }
          else
          {
            +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
            v111 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
              +[_CDSpotlightItemUtils interactionForSearchableItem:nsUserName:].cold.4(v111);
          }

          -[_CDInteraction groupName](v161, "groupName");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          v143 = v142 == 0;

          if (!v143)
          {
            +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
            v144 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v144, OS_LOG_TYPE_DEBUG))
            {
              -[_CDInteraction groupName](v161, "groupName");
              objc_claimAutoreleasedReturnValue();
              objc_msgSend(v159, "uniqueIdentifier");
              objc_claimAutoreleasedReturnValue();
              +[_CDSpotlightItemUtils interactionForSearchableItem:nsUserName:].cold.3();
            }

          }
        }
        goto LABEL_88;
      }
    }
LABEL_89:
    v148 = v94;
    -[_CDInteraction setDirection:](v161, "setDirection:");
    objc_msgSend(v160, "isExistingThread");
    v102 = (void *)objc_claimAutoreleasedReturnValue();

    if (v102)
    {
      objc_msgSend(v160, "isExistingThread");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDInteraction setIsResponse:](v161, "setIsResponse:", objc_msgSend(v103, "BOOLValue"));
    }
    else
    {
      if (-[_CDInteraction mechanism](v161, "mechanism") != 1)
        goto LABEL_101;
      objc_msgSend(v160, "emailHeaders");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = v104;
      if (v104)
      {
        objc_msgSend(v104, "objectForKeyedSubscript:", CFSTR("references"));
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDInteraction setIsResponse:](v161, "setIsResponse:", v105 != 0);
      }
      else
      {
        objc_msgSend(v160, "displayName");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDInteraction setIsResponse:](v161, "setIsResponse:", objc_msgSend(v105, "hasPrefix:", CFSTR("Re:")));
      }

    }
LABEL_101:
    if (-[_CDInteraction mechanism](v161, "mechanism") == 5)
    {
      context = (void *)MEMORY[0x193FEE914]();
      objc_msgSend(v160, "title");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDStringTokenizer extractNormalizedKeywords:](_CDStringTokenizer, "extractNormalizedKeywords:", v147);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "allObjects");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDInteraction setKeywords:](v161, "setKeywords:", v114);

      -[_CDInteraction sender](v161, "sender");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      if (v115)
      {
        -[_CDInteraction sender](v161, "sender");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = objc_msgSend(v116, "participantStatus") == 0;

        if (v117)
        {
          -[_CDInteraction sender](v161, "sender");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "setParticipantStatus:", 2);

        }
      }
      if (v94)
      {
        -[_CDInteraction sender](v161, "sender");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        -[_CDInteraction setSelfParticipantStatus:](v161, "setSelfParticipantStatus:", objc_msgSend(v119, "participantStatus"));
      }
      else
      {
        v168 = 0u;
        v169 = 0u;
        v166 = 0u;
        v167 = 0u;
        -[_CDInteraction recipients](v161, "recipients");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v166, v194, 16);
        if (v120)
        {
          v121 = *(_QWORD *)v167;
          while (2)
          {
            for (m = 0; m != v120; ++m)
            {
              if (*(_QWORD *)v167 != v121)
                objc_enumerationMutation(v119);
              v123 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * m);
              if (objc_msgSend(v123, "participantStatus"))
              {
                objc_msgSend(v123, "identifier");
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                v125 = objc_msgSend(v54, "containsObject:", v124);

                if (v125)
                {
                  -[_CDInteraction setSelfParticipantStatus:](v161, "setSelfParticipantStatus:", objc_msgSend(v123, "participantStatus"));
                  goto LABEL_118;
                }
              }
            }
            v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v166, v194, 16);
            if (v120)
              continue;
            break;
          }
        }
      }
LABEL_118:

      -[_CDInteraction setDirection:](v161, "setDirection:", v148);
      objc_autoreleasePoolPop(context);
    }
    if (-[_CDInteraction mechanism](v161, "mechanism") == 1)
    {
      -[_CDInteraction sender](v161, "sender");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      v127 = __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_460((uint64_t)v126, v126);

      if (v127)
        -[_CDInteraction setSender:](v161, "setSender:", 0);
      v128 = (void *)MEMORY[0x1E0C99DE8];
      -[_CDInteraction recipients](v161, "recipients");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "arrayWithCapacity:", objc_msgSend(v129, "count"));
      v130 = (void *)objc_claimAutoreleasedReturnValue();

      v164 = 0u;
      v165 = 0u;
      v162 = 0u;
      v163 = 0u;
      -[_CDInteraction recipients](v161, "recipients");
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v162, v193, 16);
      v133 = v132;
      if (v132)
      {
        v134 = *(_QWORD *)v163;
        do
        {
          v135 = 0;
          do
          {
            if (*(_QWORD *)v163 != v134)
              objc_enumerationMutation(v131);
            v136 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * v135);
            v132 = __65___CDSpotlightItemUtils_interactionForSearchableItem_nsUserName___block_invoke_460(v132, v136);
            if ((v132 & 1) == 0)
              v132 = objc_msgSend(v130, "addObject:", v136);
            ++v135;
          }
          while (v133 != v135);
          v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v162, v193, 16);
          v133 = v132;
        }
        while (v132);
      }

      -[_CDInteraction setRecipients:](v161, "setRecipients:", v130);
    }
    -[_CDInteraction sender](v161, "sender");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    if (v137)
    {
      v138 = 0;
    }
    else
    {
      -[_CDInteraction recipients](v161, "recipients");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = objc_msgSend(v139, "count") == 0;

      if (!v140)
      {
        v138 = 0;
LABEL_137:

        objc_autoreleasePoolPop(v151);
        if ((v138 & 1) == 0)
        {
          +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
          v141 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
            +[_CDSpotlightItemUtils interactionForSearchableItem:nsUserName:].cold.1();

          v9 = v161;
          v161 = v9;
          goto LABEL_142;
        }
LABEL_138:
        v9 = 0;
LABEL_142:

        goto LABEL_143;
      }
      v138 = 1;
      v137 = v161;
      v161 = 0;
    }

    goto LABEL_137;
  }
  v9 = 0;
LABEL_143:

LABEL_152:
  return v9;
}

+ (uint64_t)shouldFilterEmailAddress:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_self();
  if (shouldFilterEmailAddress__onceToken != -1)
    dispatch_once(&shouldFilterEmailAddress__onceToken, &__block_literal_global_486);
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("@"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend((id)shouldFilterEmailAddress___localPartBlackList, "containsObject:", v4);

  }
  return v5;
}

+ (id)_metadataForSearchableItem:(void *)a3 userAction:
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
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
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
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "uaIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKApplicationActivityMetadataKey userActivityUUID](_DKApplicationActivityMetadataKey, "userActivityUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v9);

  objc_msgSend(v4, "attributeSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "attributeSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKApplicationActivityMetadataKey contentDescription](_DKApplicationActivityMetadataKey, "contentDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v14);

  }
  objc_msgSend(v4, "attributeSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "suggestedInvocationPhrase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "attributeSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "suggestedInvocationPhrase");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKApplicationActivityMetadataKey suggestedInvocationPhrase](_DKApplicationActivityMetadataKey, "suggestedInvocationPhrase");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, v19);

  }
  objc_msgSend(v4, "attributeSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "attributeDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("kMDItemRelatedUniqueIdentifier"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    +[_DKApplicationActivityMetadataKey itemRelatedUniqueIdentifier](_DKApplicationActivityMetadataKey, "itemRelatedUniqueIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v22, v23);

  }
  objc_msgSend(v4, "attributeSet");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "attributeDictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("kMDItemContentURL"));
  v26 = objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    +[_DKApplicationActivityMetadataKey itemRelatedContentURL](_DKApplicationActivityMetadataKey, "itemRelatedContentURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, v27);

  }
  v68 = (void *)v26;
  objc_msgSend(v4, "attributeSet");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "shortcutAvailability");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v4, "attributeSet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "shortcutAvailability");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKApplicationActivityMetadataKey shortcutAvailability](_DKApplicationActivityMetadataKey, "shortcutAvailability");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, v32);

  }
  v33 = objc_msgSend(v5, "eligibility");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v33 >> 2) & 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKApplicationActivityMetadataKey isPubliclyIndexable](_DKApplicationActivityMetadataKey, "isPubliclyIndexable");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v34, v35);

  v36 = objc_msgSend(v5, "eligibility");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v36 >> 3) & 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKApplicationActivityMetadataKey isEligibleForPrediction](_DKApplicationActivityMetadataKey, "isEligibleForPrediction");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, v38);

  objc_msgSend(v4, "attributeSet");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "userActivityType");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    objc_msgSend(v4, "attributeSet");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "userActivityType");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKApplicationActivityMetadataKey activityType](_DKApplicationActivityMetadataKey, "activityType");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v42, v43);

    objc_msgSend(v4, "attributeSet");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "attributeDictionary");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("_kMDItemUserActivityRequiredString"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v67 = v22;
      v47 = (void *)objc_msgSend(v46, "copy");
      +[_DKApplicationActivityMetadataKey userActivityRequiredString](_DKApplicationActivityMetadataKey, "userActivityRequiredString");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v47, v48);

      v66 = v46;
      v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityStrings:secondaryString:optionalData:", v46, 0, 0);
      v50 = v49;
      if (v49)
      {
        objc_msgSend(v49, "userInfo");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v52 = objc_msgSend(&unk_1E272BBF0, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
          if (v52)
          {
            v53 = v52;
            v54 = *(_QWORD *)v70;
            do
            {
              for (i = 0; i != v53; ++i)
              {
                if (*(_QWORD *)v70 != v54)
                  objc_enumerationMutation(&unk_1E272BBF0);
                v56 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
                objc_msgSend(v50, "userInfo");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "objectForKeyedSubscript:", v56);
                v58 = (void *)objc_claimAutoreleasedReturnValue();

                if (v58)
                  objc_msgSend(v6, "setObject:forKeyedSubscript:", v58, v56);

              }
              v53 = objc_msgSend(&unk_1E272BBF0, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
            }
            while (v53);
          }
        }
      }

      v22 = v67;
      v46 = v66;
    }

  }
  objc_msgSend(v4, "expirationDate");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    objc_msgSend(v4, "expirationDate");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKApplicationActivityMetadataKey expirationDate](_DKApplicationActivityMetadataKey, "expirationDate");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v60, v61);

  }
  objc_msgSend(v5, "itemIdentifier");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    objc_msgSend(v5, "itemIdentifier");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKApplicationActivityMetadataKey itemIdentifier](_DKApplicationActivityMetadataKey, "itemIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v63, v64);

  }
  return v6;
}

+ (id)_locationMetadataForSearchableItem:(id)a3 userAction:(id)a4
{
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

  v5 = a3;
  +[_CDSpotlightItemUtils _metadataForSearchableItem:userAction:]((uint64_t)_CDSpotlightItemUtils, v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v5, "attributeSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "namedLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "attributeSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "namedLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKLocationApplicationActivityMetadataKey locationName](_DKLocationApplicationActivityMetadataKey, "locationName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v12);

  }
  objc_msgSend(v5, "attributeSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "latitude");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v5, "attributeSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "latitude");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKLocationApplicationActivityMetadataKey latitude](_DKLocationApplicationActivityMetadataKey, "latitude");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v17);

  }
  objc_msgSend(v5, "attributeSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "longitude");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v5, "attributeSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "longitude");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKLocationApplicationActivityMetadataKey longitude](_DKLocationApplicationActivityMetadataKey, "longitude");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, v22);

  }
  objc_msgSend(v5, "attributeSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "city");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v5, "attributeSet");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "city");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKLocationApplicationActivityMetadataKey city](_DKLocationApplicationActivityMetadataKey, "city");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, v27);

  }
  objc_msgSend(v5, "attributeSet");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stateOrProvince");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v5, "attributeSet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stateOrProvince");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKLocationApplicationActivityMetadataKey stateOrProvince](_DKLocationApplicationActivityMetadataKey, "stateOrProvince");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, v32);

  }
  objc_msgSend(v5, "attributeSet");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "country");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v5, "attributeSet");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "country");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKLocationApplicationActivityMetadataKey country](_DKLocationApplicationActivityMetadataKey, "country");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, v37);

  }
  objc_msgSend(v5, "attributeSet");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "thoroughfare");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(v5, "attributeSet");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "thoroughfare");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKLocationApplicationActivityMetadataKey thoroughfare](_DKLocationApplicationActivityMetadataKey, "thoroughfare");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v41, v42);

  }
  objc_msgSend(v5, "attributeSet");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "fullyFormattedAddress");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    objc_msgSend(v5, "attributeSet");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "fullyFormattedAddress");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKLocationApplicationActivityMetadataKey fullyFormattedAddress](_DKLocationApplicationActivityMetadataKey, "fullyFormattedAddress");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v46, v47);

  }
  objc_msgSend(v5, "attributeSet");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "subThoroughfare");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v5, "attributeSet");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "subThoroughfare");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKLocationApplicationActivityMetadataKey subThoroughfare](_DKLocationApplicationActivityMetadataKey, "subThoroughfare");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v51, v52);

  }
  objc_msgSend(v5, "attributeSet");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "postalCode");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    objc_msgSend(v5, "attributeSet");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "postalCode");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKLocationApplicationActivityMetadataKey postalCode](_DKLocationApplicationActivityMetadataKey, "postalCode");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v56, v57);

  }
  objc_msgSend(v5, "attributeSet");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "phoneNumbers");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    objc_msgSend(v5, "attributeSet");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "phoneNumbers");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKLocationApplicationActivityMetadataKey phoneNumbers](_DKLocationApplicationActivityMetadataKey, "phoneNumbers");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v61, v62);

  }
  objc_msgSend(v5, "attributeSet");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "displayName");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    objc_msgSend(v5, "attributeSet");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "displayName");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKLocationApplicationActivityMetadataKey displayName](_DKLocationApplicationActivityMetadataKey, "displayName");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v66, v67);

  }
  objc_msgSend(v5, "attributeSet");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "URL");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
  {
    objc_msgSend(v5, "attributeSet");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "URL");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "absoluteString");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DKLocationApplicationActivityMetadataKey URL](_DKLocationApplicationActivityMetadataKey, "URL");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v72, v73);

  }
  v74 = (void *)objc_msgSend(v7, "copy");

  return v74;
}

+ (BOOL)isLocationBasedItem:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "namedLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v2, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "city");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v2, "attributeSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stateOrProvince");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v5 = 1;
      }
      else
      {
        objc_msgSend(v2, "attributeSet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "country");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v5 = 1;
        }
        else
        {
          objc_msgSend(v2, "attributeSet");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "latitude");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v12;
          if (v13)
          {
            v5 = 1;
          }
          else
          {
            objc_msgSend(v2, "attributeSet");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "longitude");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v5 = 1;
            }
            else
            {
              objc_msgSend(v2, "attributeSet");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "thoroughfare");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                v5 = 1;
              }
              else
              {
                objc_msgSend(v2, "attributeSet");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "subThoroughfare");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (v16)
                {
                  v5 = 1;
                }
                else
                {
                  objc_msgSend(v2, "attributeSet");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "fullyFormattedAddress");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v17)
                  {
                    v5 = 1;
                  }
                  else
                  {
                    objc_msgSend(v2, "attributeSet");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "postalCode");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    v5 = v18 != 0;

                    v17 = 0;
                  }

                  v16 = 0;
                }

                v15 = 0;
              }

              v14 = 0;
            }

            v13 = 0;
          }

        }
      }

    }
  }

  return v5;
}

+ (id)knowledgeEventsForSearchableItem:(id)a3 userAction:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
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
  id obj;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  _QWORD v44[6];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v5 = a4;
  v40 = (void *)objc_opt_new();
  objc_msgSend(v5, "madeCurrentDates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v5;
  objc_msgSend(v5, "sentToIndexerDates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v8;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v38)
  {
    v36 = *(_QWORD *)v46;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v46 != v36)
          objc_enumerationMutation(obj);
        v43 = v9;
        v10 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v9);
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __69___CDSpotlightItemUtils_knowledgeEventsForSearchableItem_userAction___block_invoke;
        v44[3] = &unk_1E26E4670;
        v44[4] = v10;
        v44[5] = 0x4000000000000000;
        v11 = objc_msgSend(v37, "indexOfObjectPassingTest:", v44);
        objc_msgSend(v42, "bundleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKSource sourceForSearchableItem:bundleID:](_DKSource, "sourceForSearchableItem:bundleID:", v42, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        +[_CDSpotlightItemUtils _metadataForSearchableItem:userAction:]((uint64_t)a1, v42, v41);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "mutableCopy");

        v16 = v11 != 0x7FFFFFFFFFFFFFFFLL;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKApplicationActivityMetadataKey beginningOfActivity](_DKApplicationActivityMetadataKey, "beginningOfActivity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, v18);

        +[_DKSystemEventStreams appActivityStream](_DKSystemEventStreams, "appActivityStream");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "bundleID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[_DKBundleIdentifier withBundle:](_DKBundleIdentifier, "withBundle:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(v15, "copy");
        +[_DKEvent eventWithStream:source:startDate:endDate:value:confidence:metadata:](_DKEvent, "eventWithStream:source:startDate:endDate:value:confidence:metadata:", v19, v13, v10, v10, v21, v22, 1.0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObject:", v23);

        if (+[_CDSpotlightItemUtils isLocationBasedItem:]((uint64_t)_CDSpotlightItemUtils, v42))
        {
          objc_msgSend(a1, "_locationMetadataForSearchableItem:userAction:", v42, v41);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(v24, "mutableCopy");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKApplicationActivityMetadataKey beginningOfActivity](_DKApplicationActivityMetadataKey, "beginningOfActivity");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, v27);

          +[_DKSystemEventStreams appLocationActivityStream](_DKSystemEventStreams, "appLocationActivityStream");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "bundleID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[_DKBundleIdentifier withBundle:](_DKBundleIdentifier, "withBundle:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(v25, "copy");
          +[_DKEvent eventWithStream:source:startDate:endDate:value:confidence:metadata:](_DKEvent, "eventWithStream:source:startDate:endDate:value:confidence:metadata:", v28, v13, v10, v10, v30, v31, 1.0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v32);

        }
        ++v9;
      }
      while (v38 != v43 + 1);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v38);
  }

  v33 = (void *)objc_msgSend(v40, "copy");
  return v33;
}

+ (id)contextDictionaryForSearchableItem:(id)a3 userAction:(id)a4
{
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

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uaIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class userActivityUUID](get_CDContextQueriesClass(), "userActivityUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "eligibility"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class eligibility](get_CDContextQueriesClass(), "eligibility");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v12);

  objc_msgSend(v5, "attributeSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v5, "attributeSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class title](get_CDContextQueriesClass(), "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v17);

  }
  objc_msgSend(v5, "attributeSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "userActivityType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v5, "attributeSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "userActivityType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class userActivityType](get_CDContextQueriesClass(), "userActivityType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, v22);

  }
  objc_msgSend(v6, "itemIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v6, "itemIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class itemIdentifier](get_CDContextQueriesClass(), "itemIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, v25);

  }
  objc_msgSend(v5, "attributeSet");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "attributeDictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("_kMDItemUserActivityRequiredString"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v5, "attributeSet");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "attributeDictionary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("_kMDItemUserActivityRequiredString"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class userActivityRequiredString](get_CDContextQueriesClass(), "userActivityRequiredString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, v32);

  }
  return v7;
}

+ (id)messageContextDictionaryForSendMessageIntent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
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
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[objc_class incomingKey](get_CDContextQueriesClass(), "incomingKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v5);

  objc_msgSend(v3, "conversationIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[objc_class conversationIdentifierKey](get_CDContextQueriesClass(), "conversationIdentifierKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

  }
  objc_msgSend(v3, "sender");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handle");
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v41[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }
  v35 = (void *)v6;
  -[objc_class senderHandlesKey](get_CDContextQueriesClass(), "senderHandlesKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

  if (v9)
  v34 = (void *)v9;
  objc_msgSend(v3, "sender");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contactIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[objc_class senderContactIDKey](get_CDContextQueriesClass(), "senderContactIDKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v14);

  }
  v33 = (void *)v13;
  v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v3, "recipients");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v37 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v22, "handle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v15, "addObject:", v23);
        objc_msgSend(v22, "contactIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend(v16, "addObject:", v24);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v19);
  }

  objc_msgSend(v15, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class recipientsKey](get_CDContextQueriesClass(), "recipientsKey");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, v26);

  objc_msgSend(v16, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class recipientContactIDsKey](get_CDContextQueriesClass(), "recipientContactIDsKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v27, v28);

  objc_msgSend(v3, "content");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    -[objc_class contentKey](get_CDContextQueriesClass(), "contentKey");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, v30);

  }
  v31 = (void *)objc_msgSend(v4, "copy");

  return v31;
}

+ (id)querySpotlightItemsWithStartDate:(id)a3 endDate:(id)a4 getMail:(BOOL)a5 getMessages:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[3];

  v6 = a6;
  v7 = a5;
  v18[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v7 || !v6)
  {
    if (v7)
    {
      +[_CDSpotlightQuerier queryStringForMail]();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v6)
        goto LABEL_11;
      +[_CDSpotlightQuerier queryStringForMessages]();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v15;
    if (v15)
      goto LABEL_10;
LABEL_11:
    v16 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_12;
  }
  +[_CDSpotlightQuerier queryStringForMail]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  +[_CDSpotlightQuerier queryStringForMessages]();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDSpotlightQuerier orQueryStrings:]((uint64_t)_CDSpotlightQuerier, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_11;
LABEL_10:
  +[_CDSpotlightQuerier querySpotlightForPredicateString:startDate:endDate:]((uint64_t)_CDSpotlightQuerier, v14, v9, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v16;
}

+ (id)expectedSupportedUTIs
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___CDSpotlightItemUtils_UTI__expectedSupportedUTIs__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (expectedSupportedUTIs_token != -1)
    dispatch_once(&expectedSupportedUTIs_token, block);
  return (id)expectedSupportedUTIs_hardCodedUTIs;
}

+ (id)mechanismUtiMap
{
  objc_opt_self();
  if (mechanismUtiMap_onceToken != -1)
    dispatch_once(&mechanismUtiMap_onceToken, &__block_literal_global_38);
  return (id)mechanismUtiMap_mechanismUtiMap;
}

+ (id)expectedUTIsForMechanism:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[_CDSpotlightItemUtils mechanismUtiMap]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x1E0C9AA60];
  v8 = v7;

  return v8;
}

+ (BOOL)uncachedUtType:(void *)a3 conformsTo:
{
  id v4;
  id v5;
  _BOOL8 v6;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (v5)
    v6 = (objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0
      || cd_UTTypeConformsTo((uint64_t)v4, (uint64_t)v5) != 0;
  else
    v6 = 0;

  return v6;
}

+ (BOOL)contentTypeTree:(id)a3 conformsToUTIType:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if ((+[_CDSpotlightItemUtils utType:conformsTo:]((uint64_t)a1, *(void **)(*((_QWORD *)&v15 + 1) + 8 * i), v7) & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (uint64_t)utType:(void *)a3 conformsTo:
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  if (v5)
  {
    v7 = v6;
    +[_CDSpotlightItemUtils utiConformCache]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v4;
    v16[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    objc_sync_enter(v10);
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = objc_msgSend(v11, "BOOLValue");
    }
    else
    {
      v13 = +[_CDSpotlightItemUtils uncachedUtType:conformsTo:](v7, v4, v5);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v9);

    }
    objc_sync_exit(v10);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (uint64_t)contentTypeTree:(void *)a3 conformsToUTITypes:
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_opt_self();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(v6, "contentTypeTree:conformsToUTIType:", v4, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14) & 1) != 0)
        {
          v12 = 1;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)utiConformCache
{
  objc_opt_self();
  if (utiConformCache_onceToken != -1)
    dispatch_once(&utiConformCache_onceToken, &__block_literal_global_346);
  return (id)utiConformCache_utiConformCache;
}

+ (int64_t)getInteractionMechanismForContentUTI:(id)a3 typeTree:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  char v19;
  NSObject *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "addObject:", v6);
    if (v7)
      objc_msgSend(v9, "addObjectsFromArray:", v7);
    v22 = v7;
    +[_CDSpotlightItemUtils mechanismUtiMap]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v11;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "integerValue");
          objc_msgSend(a1, "expectedUTIsForMechanism:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = +[_CDSpotlightItemUtils contentTypeTree:conformsToUTITypes:]((uint64_t)a1, v9, v18);

          if ((v19 & 1) != 0)
          {
            v20 = v12;
            goto LABEL_16;
          }
          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v14)
          continue;
        break;
      }
    }

    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[_CDSpotlightItemUtils(UTI) getInteractionMechanismForContentUTI:typeTree:].cold.2((uint64_t)v6, v20);
    v17 = 7;
LABEL_16:
    v7 = v22;

  }
  else
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[_CDSpotlightItemUtils(UTI) getInteractionMechanismForContentUTI:typeTree:].cold.1(v12);
    v17 = 7;
  }

  return v17;
}

+ (void)_contactForPerson:.cold.1()
{
  id v0;
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_30();
  objc_msgSend(v0, "contactIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_18(&dword_18DDBE000, v4, v5, "person.contactIdentifier is %@ instead of NSString. CSPerson: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

+ (void)_contactForPerson:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_30();
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_18(&dword_18DDBE000, v2, v3, "contact.identifier is %@ instead of NSString. CNContact: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

+ (void)isSearchableItemInSubscribedCalendar:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_class();
  v7 = v6;
  objc_msgSend(a2, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543875;
  v10 = v6;
  v11 = 2113;
  v12 = v8;
  v13 = 2113;
  v14 = a1;
  _os_log_fault_impl(&dword_18DDBE000, a3, OS_LOG_TYPE_FAULT, "isSearchableItemInSubscribedCalendar: Unexpected attribute value type %{public}@ (uid: %{private}@, value: %{private}@)", (uint8_t *)&v9, 0x20u);

  OUTLINED_FUNCTION_0_7();
}

+ (void)isAllowedSearchableItem:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_30();
  objc_msgSend(v1, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_44(&dword_18DDBE000, v5, v6, "isAllowedSearchableItem: Ignoring calendar item %@ in subscribed calendar %{private}@: %{sensitive}@", v7, v8, v9, v10, 3u);

  OUTLINED_FUNCTION_0_7();
}

+ (void)isAllowedSearchableItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_30();
  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  v6 = 2117;
  v7 = v1;
  OUTLINED_FUNCTION_2(&dword_18DDBE000, v0, v4, "isAllowedSearchableItem: Allowing calendar item %@: %{sensitive}@", v5);

  OUTLINED_FUNCTION_7();
}

+ (void)isAllowedSearchableItem:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_30();
  objc_msgSend(v1, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendarDelegateIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_44(&dword_18DDBE000, v5, v6, "isAllowedSearchableItem: Ignoring calendar item %@ with calendar delegate identifier %@: %{sensitive}@", v7, v8, v9, v10, 3u);

  OUTLINED_FUNCTION_0_7();
}

+ (void)interactionForSearchableItem:nsUserName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, v0, v1, "Recording iteraction: %{sensitive}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)interactionForSearchableItem:nsUserName:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_18DDBE000, v0, OS_LOG_TYPE_FAULT, "While converting CSSearchableItem into _CDInteraction: %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

+ (void)interactionForSearchableItem:nsUserName:.cold.3()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_30();
  *(_DWORD *)v2 = 138412546;
  *(_QWORD *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2112;
  *(_QWORD *)(v2 + 14) = v4;
  OUTLINED_FUNCTION_2(&dword_18DDBE000, v6, v2, "Group name %@ not found on CSSi Id %@", v5);

}

+ (void)interactionForSearchableItem:(os_log_t)log nsUserName:.cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DDBE000, log, OS_LOG_TYPE_ERROR, "IMCoreSPI result does not respond to selector displayName", v1, 2u);
}

+ (void)interactionForSearchableItem:nsUserName:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, v0, v1, "Converting searchable item: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
