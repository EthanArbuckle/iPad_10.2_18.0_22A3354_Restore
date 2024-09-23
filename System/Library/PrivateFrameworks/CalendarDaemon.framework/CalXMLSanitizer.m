@implementation CalXMLSanitizer

- (CalXMLSanitizer)init
{
  CalXMLSanitizer *v2;
  uint64_t v3;
  NSMutableString *xml;
  uint64_t v5;
  NSMutableArray *cachedIndents;
  NSMutableDictionary *v7;
  NSMutableDictionary *namespaceURIToLevelOfFirstElementInNamespace;
  NSMutableArray *v9;
  NSMutableArray *elementNames;
  NSMutableArray *v11;
  NSMutableArray *elementNamespaces;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CalXMLSanitizer;
  v2 = -[CalXMLSanitizer init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    xml = v2->_xml;
    v2->_xml = (NSMutableString *)v3;

    v5 = objc_opt_new();
    cachedIndents = v2->_cachedIndents;
    v2->_cachedIndents = (NSMutableArray *)v5;

    -[NSMutableArray addObject:](v2->_cachedIndents, "addObject:", &stru_1E6A39768);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    namespaceURIToLevelOfFirstElementInNamespace = v2->namespaceURIToLevelOfFirstElementInNamespace;
    v2->namespaceURIToLevelOfFirstElementInNamespace = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    elementNames = v2->elementNames;
    v2->elementNames = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    elementNamespaces = v2->elementNamespaces;
    v2->elementNamespaces = v11;

  }
  return v2;
}

- (id)getIndentation
{
  unint64_t v3;
  unint64_t nestingLevel;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[NSMutableArray count](self->_cachedIndents, "count");
  nestingLevel = self->_nestingLevel;
  if (v3 <= nestingLevel)
  {
    -[NSMutableArray lastObject](self->_cachedIndents, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSMutableArray count](self->_cachedIndents, "count");
    if (v6 <= self->_nestingLevel)
    {
      v8 = v6;
      do
      {
        objc_msgSend(v5, "stringByAppendingString:", CFSTR("  "));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableArray addObject:](self->_cachedIndents, "addObject:", v7);
        ++v8;
        v5 = v7;
      }
      while (v8 <= self->_nestingLevel);
    }
    else
    {
      v7 = v5;
    }

    nestingLevel = self->_nestingLevel;
  }
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_cachedIndents, "objectAtIndexedSubscript:", nestingLevel);
}

- (id)currentRedactionRule
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;

  -[NSMutableArray lastObject](self->elementNames, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSMutableArray lastObject](self->elementNamespaces, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (currentRedactionRule_onceToken != -1)
      dispatch_once(&currentRedactionRule_onceToken, &__block_literal_global_100);
    objc_msgSend((id)currentRedactionRule_redactionRules, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v8 = v7;
        v9 = v8;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@>%@"), v4, v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = currentRedactionRule_logDedupingQueue;
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __39__CalXMLSanitizer_currentRedactionRule__block_invoke_105;
        v15[3] = &unk_1E6A378B0;
        v16 = v11;
        v17 = v4;
        v18 = v3;
        v13 = v11;
        dispatch_sync(v12, v15);
        v9 = (id)kUnknownElementRedactionRule;

      }
    }
    else
    {
      v10 = currentRedactionRule_logDedupingQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__CalXMLSanitizer_currentRedactionRule__block_invoke_2;
      block[3] = &unk_1E6A37420;
      v20 = v4;
      v21 = v3;
      dispatch_sync(v10, block);
      v9 = (id)kUnknownElementRedactionRule;

      v8 = v20;
    }

  }
  else
  {
    v9 = (id)kUnknownElementRedactionRule;
  }

  return v9;
}

void __39__CalXMLSanitizer_currentRedactionRule__block_invoke()
{
  id v0;
  uint64_t (**v1)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
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
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  void *v191;
  id v192;
  id v193;
  void *v194;
  id v195;
  void *v196;
  id v197;
  id v198;
  void *v199;
  id v200;
  void *v201;
  id v202;
  void *v203;
  id v204;
  void *v205;
  id v206;
  void *v207;
  id v208;
  CalXMLElementRedactionRule *v209;
  void *v210;
  id v211;
  void *v212;
  id v213;
  void *v214;
  id v215;
  void *v216;
  dispatch_queue_t v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  id v223;
  _QWORD v224[4];
  id v225;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v224[0] = MEMORY[0x1E0C809B0];
  v224[1] = 3221225472;
  v224[2] = ___createRedactionRules_block_invoke;
  v224[3] = &unk_1E6A379A8;
  v223 = v0;
  v225 = v223;
  v1 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1BCC9D8DC](v224);
  v2 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("propfind"), 0);
  v3 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("prop"), 0);
  v4 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("current-user-principal"), 0);
  v5 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("DAV:"), CFSTR("displayname"), 2);
  v6 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("principal-collection-set"), 0);
  v7 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("principal-URL"), 0);
  v8 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("resource-id"), 0);
  v9 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("supported-report-set"), 0);
  v10 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("supported-report"), 0);
  v11 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("report"), 0);
  v12 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("acl-principal-prop-set"), 0);
  v13 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("principal-match"), 0);
  v14 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("principal-property-search"), 0);
  v15 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("expand-property"), 0);
  v16 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("sync-collection"), 0);
  v17 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("multistatus"), 0);
  v18 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("response"), 0);
  v19 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("DAV:"), CFSTR("responsedescription"), 5);
  v20 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("propstat"), 0);
  v21 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("DAV:"), CFSTR("status"), 5);
  v22 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("DAV:"), CFSTR("sync-token"), 5);
  v23 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("DAV:"), CFSTR("sync-level"), 5);
  v24 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("owner"), 0);
  v25 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("add-member"), 0);
  v26 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("DAV:"), CFSTR("quota-used-bytes"), 5);
  v27 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("DAV:"), CFSTR("quota-available-bytes"), 5);
  v28 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("current-user-privilege-set"), 0);
  v29 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("all"), 0);
  v30 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("bind"), 0);
  v31 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("collection"), 0);
  v32 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("error"), 0);
  v33 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("DAV:"), CFSTR("getcontenttype"), 5);
  v34 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("DAV:"), CFSTR("getetag"), 5);
  v35 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("group-member-set"), 0);
  v36 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("number-of-matches-within-limits"), 0);
  v37 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("principal-search-property-set"), 0);
  v38 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("principal-search-property"), 0);
  v39 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("privilege"), 0);
  v40 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("propertyupdate"), 0);
  v41 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("read-acl"), 0);
  v42 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("read-current-user-privilege-set"), 0);
  v43 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("read"), 0);
  v44 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("resourcetype"), 0);
  v45 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("set"), 0);
  v46 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("unbind"), 0);
  v47 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("unlock"), 0);
  v48 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("write-acl"), 0);
  v49 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("write-content"), 0);
  v50 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("write-properties"), 0);
  v51 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("write"), 0);
  v52 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("calendar-home-set"), 0);
  v53 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("calendar-user-address-set"), 0);
  v54 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("schedule-inbox-URL"), 0);
  v55 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("schedule-outbox-URL"), 0);
  v56 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("calendar-alarm"), 0);
  v57 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("supported-calendar-component-set"), 0);
  v58 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("default-alarm-vevent-date"), 4);
  v59 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("default-alarm-vevent-datetime"), 4);
  v60 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("calendar-description"), 0);
  v61 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("calendar-timezone"), 3);
  v62 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("supported-calendar-component-sets"), 0);
  v63 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("schedule-calendar-transp"), 0);
  v64 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("calendar-data"), 3);
  v65 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("calendar-free-busy-set"), 0);
  v66 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("calendar-multiget"), 0);
  v67 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("calendar-query"), 0);
  v68 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("calendar-user-type"), 0);
  v69 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("calendar"), 0);
  v70 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("default-alarm-vevent-date"), 4);
  v71 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("filter"), 0);
  v72 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("free-busy-query"), 0);
  v73 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("opaque"), 0);
  v74 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("read-free-busy"), 0);
  v75 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("recipient"), 0);
  v76 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("response"), 0);
  v77 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("request-status"), 5);
  v78 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("schedule-default-calendar-URL"), 0);
  v79 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("schedule-deliver"), 0);
  v80 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("schedule-inbox"), 0);
  v81 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("schedule-outbox"), 0);
  v82 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("schedule-response"), 0);
  v83 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("schedule-send"), 0);
  v84 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("schedule-tag"), 5);
  v85 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("schedule"), 0);
  v86 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("transparent"), 0);
  v87 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("dropbox-home-URL"), 0);
  v88 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("email-address-set"), 0);
  v89 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("email-address"), 2);
  v90 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("notification-URL"), 0);
  v91 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("push-transports"), 0);
  v92 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("token-url"), 0);
  v93 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("subscription-url"), 0);
  v94 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("courierserver"), 1);
  v95 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("refresh-interval"), 5);
  v96 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("pushkey"), 5);
  v97 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("pre-publish-url"), 0);
  v98 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("invite"), 0);
  v99 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("subscribed-strip-alarms"), 0);
  v100 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("allowed-sharing-modes"), 0);
  v101 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("access"), 0);
  v102 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("action"), 0);
  v103 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("apsbundleid"), 5);
  v104 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("attendee"), 1);
  v105 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("calendar-proxy-read-for"), 0);
  v106 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("calendar-proxy-write-for"), 0);
  v107 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("calendar-search"), 0);
  v108 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("can-be-published"), 0);
  v109 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("can-be-shared"), 0);
  v110 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("cancel"), 0);
  v111 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("changed-by"), 0);
  v112 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("changes"), 0);
  v113 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("common-name"), 2);
  v114 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("create"), 0);
  v115 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("created-by"), 0);
  v116 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("created"), 0);
  v117 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("dropbox-home"), 0);
  v118 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("dtstamp"), 5);
  v119 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("env"), 5);
  v120 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("first-name"), 2);
  v121 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("firstName"), 2);
  v122 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("free-busy-url"), 0);
  v123 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("getctag"), 5);
  v124 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("hosturl"), 0);
  v125 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("in-reply-to"), 5);
  v126 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("invite-accepted"), 0);
  v127 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("invite-declined"), 0);
  v128 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("invite-deleted"), 0);
  v129 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("invite-noresponse"), 0);
  v130 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("invite-reply"), 0);
  v131 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("last-name"), 2);
  v132 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("lastName"), 2);
  v133 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("master"), 0);
  v134 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("name"), 2);
  v135 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("never-publish"), 0);
  v136 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("never-shared"), 0);
  v137 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("notification"), 0);
  v138 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("notificationtype"), 0);
  v139 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("organizer-cn"), 2);
  v140 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("organizer-first"), 0);
  v141 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("organizer-last"), 0);
  v142 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("organizer"), 0);
  v143 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("publish-url"), 0);
  v144 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("read-write"), 0);
  v145 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("read"), 0);
  v146 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("record-type"), 5);
  v147 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("recurrence"), 0);
  v148 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("recurrenceid"), 5);
  v149 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("remove"), 0);
  v150 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("reply"), 0);
  v151 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("resource-changed"), 0);
  v152 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("schedule-changes"), 0);
  v153 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("search-token"), 0);
  v154 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("set"), 0);
  v155 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("shared-owner"), 0);
  v156 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("shared"), 0);
  v157 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("share"), 0);
  v158 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("source"), 0);
  v159 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("subscribed-strip-attachments"), 0);
  v160 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("subscribed-strip-todos"), 0);
  v161 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("subscribed"), 0);
  v162 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("summary"), 2);
  v163 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("time"), 5);
  v164 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("uid"), 5);
  v165 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("update"), 0);
  v166 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("updated-by"), 0);
  v167 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("user"), 0);
  v168 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://cal.me.com/_namespace/"), CFSTR("apsbundleid"), 5);
  v169 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://me.com/_namespace/"), CFSTR("verify-calendar-user"), 0);
  v170 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://me.com/_namespace/"), CFSTR("apsbundleid"), 5);
  v171 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://me.com/_namespace/"), CFSTR("bulk-requests"), 0);
  v172 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://me.com/_namespace/"), CFSTR("crud"), 0);
  v173 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://me.com/_namespace/"), CFSTR("delete"), 0);
  v174 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://me.com/_namespace/"), CFSTR("insert"), 0);
  v175 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://me.com/_namespace/"), CFSTR("max-bytes"), 5);
  v176 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://me.com/_namespace/"), CFSTR("max-resources"), 5);
  v177 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://me.com/_namespace/"), CFSTR("max-size"), 5);
  v178 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://me.com/_namespace/"), CFSTR("simple"), 0);
  v179 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://me.com/_namespace/"), CFSTR("supported"), 0);
  v180 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://me.com/_namespace/"), CFSTR("update"), 0);
  v181 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("urn:mobileme:davservices"), CFSTR("env"), 5);
  v182 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://apple.com/ns/ical/"), CFSTR("location-code"), 0);
  v183 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://apple.com/ns/ical/"), CFSTR("calendar-order"), 5);
  v184 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://apple.com/ns/ical/"), CFSTR("refreshrate"), 5);
  v185 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://apple.com/ns/ical/"), CFSTR("autoprovisioned"), 0);
  v186 = (id)((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://apple.com/ns/ical/"), CFSTR("language-code"), 0);
  ((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("DAV:"), CFSTR("href"), 1);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = ___createRedactionRules_block_invoke_2((uint64_t)v222, v222, CFSTR("preferred"), 5);
  ((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("transport"), 0);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = ___createRedactionRules_block_invoke_2((uint64_t)v221, v221, CFSTR("type"), 5);
  ((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("comp"), 0);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  v189 = ___createRedactionRules_block_invoke_2((uint64_t)v220, v220, CFSTR("name"), 5);
  ((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("comp-filter"), 0);
  v219 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = ___createRedactionRules_block_invoke_2((uint64_t)v219, v219, CFSTR("name"), 5);
  ((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("DAV:"), CFSTR("property"), 0);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = ___createRedactionRules_block_invoke_2((uint64_t)v191, v191, CFSTR("name"), 5);
  v193 = ___createRedactionRules_block_invoke_2((uint64_t)v192, v191, CFSTR("namespace"), 5);
  ((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("invite-notification"), 0);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  v195 = ___createRedactionRules_block_invoke_2((uint64_t)v194, v194, CFSTR("shared-type"), 5);
  ((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("urn:ietf:params:xml:ns:caldav"), CFSTR("time-range"), 0);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = ___createRedactionRules_block_invoke_2((uint64_t)v196, v196, CFSTR("start"), 5);
  v198 = ___createRedactionRules_block_invoke_2((uint64_t)v197, v196, CFSTR("end"), 5);
  ((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("http://apple.com/ns/ical/"), CFSTR("calendar-color"), 5);
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  v200 = ___createRedactionRules_block_invoke_2((uint64_t)v199, v199, CFSTR("symbolic-color"), 5);
  ((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, uint64_t))v1)[2](v1, CFSTR("DAV:"), CFSTR("description"), 5);
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  v202 = ___createRedactionRules_block_invoke_2((uint64_t)v201, v201, CFSTR("xml:lang"), 5);
  ((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("changed-property"), 0);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = ___createRedactionRules_block_invoke_2((uint64_t)v203, v203, CFSTR("name"), 5);
  ((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("changed-parameter"), 0);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = ___createRedactionRules_block_invoke_2((uint64_t)v205, v205, CFSTR("name"), 5);
  ((uint64_t (**)(_QWORD, const __CFString *, const __CFString *, _QWORD))v1)[2](v1, CFSTR("http://calendarserver.org/ns/"), CFSTR("calendarserver-principal-search"), 0);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  v208 = ___createRedactionRules_block_invoke_2((uint64_t)v207, v207, CFSTR("context"), 5);
  v209 = objc_alloc_init(CalXMLElementRedactionRule);
  v210 = (void *)kUnknownElementRedactionRule;
  kUnknownElementRedactionRule = (uint64_t)v209;

  objc_msgSend((id)kUnknownElementRedactionRule, "setElementName:", 5);
  objc_msgSend((id)kUnknownElementRedactionRule, "setContent:", 0);
  objc_msgSend((id)kUnknownElementRedactionRule, "setCdata:", 3);
  objc_msgSend(0, "setAttributeName:", 5);
  objc_msgSend(0, "setAttributeValue:", 0);
  v211 = v223;

  v212 = (void *)currentRedactionRule_redactionRules;
  currentRedactionRule_redactionRules = (uint64_t)v211;

  v213 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v214 = (void *)currentRedactionRule_loggedNamespaces;
  currentRedactionRule_loggedNamespaces = (uint64_t)v213;

  v215 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v216 = (void *)currentRedactionRule_loggedElementNames;
  currentRedactionRule_loggedElementNames = (uint64_t)v215;

  v217 = dispatch_queue_create("com.apple.mobilecal.CalDAVTrafficLogScrubber.elementDedupingQueue", 0);
  v218 = (void *)currentRedactionRule_logDedupingQueue;
  currentRedactionRule_logDedupingQueue = (uint64_t)v217;

}

void __39__CalXMLSanitizer_currentRedactionRule__block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  NSObject *v2;

  v1 = (_QWORD *)(a1 + 32);
  if ((objc_msgSend((id)currentRedactionRule_loggedNamespaces, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend((id)currentRedactionRule_loggedNamespaces, "addObject:", *v1);
    +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __39__CalXMLSanitizer_currentRedactionRule__block_invoke_2_cold_1();

  }
}

void __39__CalXMLSanitizer_currentRedactionRule__block_invoke_105(uint64_t a1)
{
  NSObject *v2;

  if ((objc_msgSend((id)currentRedactionRule_loggedElementNames, "containsObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend((id)currentRedactionRule_loggedElementNames, "addObject:", *(_QWORD *)(a1 + 32));
    +[CalDAVTrafficLogScrubber log](CalDAVTrafficLogScrubber, "log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __39__CalXMLSanitizer_currentRedactionRule__block_invoke_105_cold_1();

  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSMutableArray *elementNamespaces;
  void *v16;
  uint64_t v17;
  NSMutableString *xml;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CalXMLSanitizer *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  NSMutableString *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[CalXMLSanitizer flushContents](self, "flushContents");
  -[NSMutableArray addObject:](self->elementNames, "addObject:", v11);
  elementNamespaces = self->elementNamespaces;
  if (v12)
  {
    -[NSMutableArray addObject:](self->elementNamespaces, "addObject:", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](elementNamespaces, "addObject:", v16);

  }
  -[CalXMLSanitizer currentRedactionRule](self, "currentRedactionRule");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_currentElementHasNestedTags && self->_nestingLevel >= 1)
    -[NSMutableString appendString:](self->_xml, "appendString:", CFSTR("\n"));
  -[CalXMLSanitizer getIndentation](self, "getIndentation");
  v17 = objc_claimAutoreleasedReturnValue();
  xml = self->_xml;
  v19 = objc_msgSend(v41, "elementName");
  if (v13)
    v20 = v13;
  else
    v20 = v11;
  CalRedactString(v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)v17;
  -[NSMutableString appendFormat:](xml, "appendFormat:", CFSTR("%@<%@"), v17, v21);

  if (objc_msgSend(v12, "length"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->namespaceURIToLevelOfFirstElementInNamespace, "objectForKeyedSubscript:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      -[CalXMLSanitizer _appendNamespaceURI:forElementName:qualifiedName:](self, "_appendNamespaceURI:forElementName:qualifiedName:", v12, v11, v13);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_nestingLevel);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->namespaceURIToLevelOfFirstElementInNamespace, "setObject:forKeyedSubscript:", v23, v12);

    }
  }
  v38 = v13;
  v39 = v12;
  v24 = self;
  v40 = v11;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v25 = v14;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v43 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v41, "redactionRuleForAttribute:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v24->_xml;
        CalRedactString(objc_msgSend(v31, "attributeName"), v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v31, "attributeValue");
        objc_msgSend(v25, "objectForKeyedSubscript:", v30);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        CalRedactString(v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableString appendFormat:](v32, "appendFormat:", CFSTR(" %@=\"%@\"), v33, v36);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v27);
  }

  *(_WORD *)&v24->_currentElementStartTagNeedsClosing = 1;
  ++v24->_nestingLevel;

}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t nestingLevel;
  NSMutableString *xml;
  NSMutableString *v18;
  void *v19;
  NSMutableString *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (*(_OWORD *)&self->_textContents != 0 || self->_mutableCDATAContents)
    -[CalXMLSanitizer flushContents](self, "flushContents");
  -[CalXMLSanitizer currentRedactionRule](self, "currentRedactionRule");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->elementNames, "removeLastObject");
  -[NSMutableArray removeLastObject](self->elementNamespaces, "removeLastObject");
  --self->_nestingLevel;
  if (v11)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->namespaceURIToLevelOfFirstElementInNamespace, "objectForKeyedSubscript:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");
    nestingLevel = self->_nestingLevel;

    if (v15 == nestingLevel)
      -[NSMutableDictionary removeObjectForKey:](self->namespaceURIToLevelOfFirstElementInNamespace, "removeObjectForKey:", v11);
  }
  xml = self->_xml;
  if (self->_currentElementStartTagNeedsClosing)
  {
    -[NSMutableString appendString:](xml, "appendString:", CFSTR("/>\n"));
  }
  else
  {
    if (-[NSMutableString hasSuffix:](xml, "hasSuffix:", CFSTR("\n")))
    {
      v18 = self->_xml;
      -[CalXMLSanitizer getIndentation](self, "getIndentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableString appendString:](v18, "appendString:", v19);

    }
    v20 = self->_xml;
    v21 = objc_msgSend(v13, "elementName");
    if (v12)
      v22 = v12;
    else
      v22 = v10;
    CalRedactString(v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendFormat:](v20, "appendFormat:", CFSTR("</%@>\n"), v23, v24);

  }
  *(_WORD *)&self->_currentElementStartTagNeedsClosing = 256;

}

- (void)_appendNamespaceURI:(id)a3 forElementName:(id)a4 qualifiedName:(id)a5
{
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (v8 && v13 && v9)
  {
    v10 = objc_msgSend(v9, "length");
    if (v10 > objc_msgSend(v8, "length")
      && (objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") + ~objc_msgSend(v8, "length")),
          (v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = (void *)v11;
      -[NSMutableString appendFormat:](self->_xml, "appendFormat:", CFSTR(" xmlns:%@=\"%@\"), v11, v13);

    }
    else
    {
      -[NSMutableString appendFormat:](self->_xml, "appendFormat:", CFSTR(" xmlns=\"%@\"), v13);
    }
  }

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5;
  NSString *textContents;
  NSString *v7;
  NSString *v8;
  id v9;

  v5 = a4;
  textContents = self->_textContents;
  v9 = v5;
  if (textContents)
  {
    -[NSString stringByAppendingString:](textContents, "stringByAppendingString:", v5);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (NSString *)v5;
  }
  v8 = self->_textContents;
  self->_textContents = v7;

}

- (void)parser:(id)a3 foundComment:(id)a4
{
  id v5;

  v5 = a4;
  -[CalXMLSanitizer flushContents](self, "flushContents");
  -[NSMutableString appendFormat:](self->_xml, "appendFormat:", CFSTR("<!--%@-->"), v5);

}

- (void)parser:(id)a3 foundCDATA:(id)a4
{
  id v6;
  NSMutableData *mutableCDATAContents;
  NSMutableData *v8;
  NSMutableData *v9;
  NSData *cdataContents;
  NSMutableData *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  mutableCDATAContents = self->_mutableCDATAContents;
  if (!self->_cdataContents)
  {
    if (!mutableCDATAContents)
    {
      objc_storeStrong((id *)&self->_cdataContents, a4);
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (mutableCDATAContents)
  {
LABEL_5:
    v11 = self->_mutableCDATAContents;
    goto LABEL_6;
  }
  v8 = (NSMutableData *)-[NSData mutableCopy](self->_cdataContents, "mutableCopy");
  v9 = self->_mutableCDATAContents;
  self->_mutableCDATAContents = v8;

  cdataContents = self->_cdataContents;
  self->_cdataContents = 0;

  v11 = self->_mutableCDATAContents;
LABEL_6:
  -[NSMutableData appendData:](v11, "appendData:", v6);
LABEL_7:

}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "redactedDescription");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v9)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@:%@]"), v7, v8);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("(null)");
  }
  -[NSMutableString appendFormat:](self->_xml, "appendFormat:", CFSTR("[Parse failure: XML parse error=%@]\n"), v5);

}

- (void)flushContents
{
  NSMutableString *xml;
  void *v4;
  NSString *textContents;
  NSMutableData *mutableCDATAContents;
  NSMutableData *v7;
  void *v8;
  NSMutableString *v9;
  void *v10;
  NSData *cdataContents;
  id v12;

  -[CalXMLSanitizer currentRedactionRule](self, "currentRedactionRule");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_currentElementStartTagNeedsClosing)
  {
    -[NSMutableString appendString:](self->_xml, "appendString:", CFSTR(">"));
    self->_currentElementStartTagNeedsClosing = 0;
  }
  if (self->_textContents)
  {
    if (flushContents_onceToken != -1)
      dispatch_once(&flushContents_onceToken, &__block_literal_global_134);
    if (-[NSString rangeOfCharacterFromSet:options:](self->_textContents, "rangeOfCharacterFromSet:options:", flushContents_notWhitespaceSet, 0) != 0x7FFFFFFFFFFFFFFFLL)
    {
      xml = self->_xml;
      CalRedactString(objc_msgSend(v12, "content"), self->_textContents);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableString appendString:](xml, "appendString:", v4);

    }
    textContents = self->_textContents;
    self->_textContents = 0;

  }
  mutableCDATAContents = self->_mutableCDATAContents;
  if (self->_cdataContents)
  {
    if (!mutableCDATAContents)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (mutableCDATAContents)
  {
LABEL_13:
    objc_storeStrong((id *)&self->_cdataContents, mutableCDATAContents);
    v7 = self->_mutableCDATAContents;
    self->_mutableCDATAContents = 0;

LABEL_14:
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_cdataContents, 4);
    v9 = self->_xml;
    CalRedactString(objc_msgSend(v12, "cdata"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString appendFormat:](v9, "appendFormat:", CFSTR("<![CDATA[%@]]>"), v10);

    cdataContents = self->_cdataContents;
    self->_cdataContents = 0;

  }
}

void __32__CalXMLSanitizer_flushContents__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)flushContents_notWhitespaceSet;
  flushContents_notWhitespaceSet = v0;

}

- (NSString)scrubbedXML
{
  return (NSString *)self->_xml;
}

- (__sFILE)output
{
  return self->_output;
}

- (void)setOutput:(__sFILE *)a3
{
  self->_output = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xml, 0);
  objc_storeStrong((id *)&self->elementNamespaces, 0);
  objc_storeStrong((id *)&self->elementNames, 0);
  objc_storeStrong((id *)&self->namespaceURIToLevelOfFirstElementInNamespace, 0);
  objc_storeStrong((id *)&self->_mutableCDATAContents, 0);
  objc_storeStrong((id *)&self->_cdataContents, 0);
  objc_storeStrong((id *)&self->_textContents, 0);
  objc_storeStrong((id *)&self->_cachedIndents, 0);
}

void __39__CalXMLSanitizer_currentRedactionRule__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8_0(&dword_1B6A18000, v0, (uint64_t)v0, "Unknown namespace: \"%@\" for element \"%@\", v1);
  OUTLINED_FUNCTION_5();
}

void __39__CalXMLSanitizer_currentRedactionRule__block_invoke_105_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8_0(&dword_1B6A18000, v0, v1, "Unknown element name in namespace \"%@\": \"%@\", v2);
  OUTLINED_FUNCTION_5();
}

@end
