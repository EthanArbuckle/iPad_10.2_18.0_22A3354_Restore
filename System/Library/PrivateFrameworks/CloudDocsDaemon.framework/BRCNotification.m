@implementation BRCNotification

- (id)subclassDescription
{
  id v3;
  void *v4;
  void *v5;
  NSMutableSet *appLibraryIDsWithReverseAliases;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = v3;
  if (self->_itemGlobalID)
    objc_msgSend(v3, "appendFormat:", CFSTR(" i:%@"), self->_itemGlobalID);
  if (self->_parentGlobalID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" parent-id:%@"), self->_parentGlobalID);
  if (self->_isInDataScope)
    objc_msgSend(v4, "appendFormat:", CFSTR(" sc:data"));
  if (self->_isInDocumentScope)
    objc_msgSend(v4, "appendFormat:", CFSTR(" sc:docs"));
  if (self->_isInTrashScope)
    objc_msgSend(v4, "appendFormat:", CFSTR(" sc:trash"));
  v5 = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D10F90]);
  if (v5 && (objc_msgSend(v5, "isEqualToFileObjectID:", self->_oldParentFileObjectID) & 1) == 0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" old-pino:%@"), self->_oldParentFileObjectID);
  if (self->_aliasSourceAppLibraryID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" alias-container:%@"), self->_aliasSourceAppLibraryID);
  if (self->_unsaltedBookmarkData)
    objc_msgSend(v4, "appendFormat:", CFSTR(" unsalted-bookmark-data:%@"), self->_unsaltedBookmarkData);
  appLibraryIDsWithReverseAliases = self->_appLibraryIDsWithReverseAliases;
  if (appLibraryIDsWithReverseAliases)
  {
    -[NSMutableSet allObjects](appLibraryIDsWithReverseAliases, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" reverse-alias-containers:{%@}"), v8);

  }
  if (self->_oldAppLibraryID)
    objc_msgSend(v4, "appendFormat:", CFSTR(" old-ct:%@"), self->_oldAppLibraryID);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRCNotification;
  v4 = -[BRCNotification copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 43, self->_itemGlobalID);
    objc_storeStrong(v5 + 37, self->_oldParentFileObjectID);
    objc_storeStrong(v5 + 44, self->_parentGlobalIDs);
    objc_storeStrong(v5 + 35, self->_appLibrary);
    objc_storeStrong(v5 + 36, self->_parentGlobalID);
    objc_storeStrong(v5 + 38, self->_aliasSourceAppLibraryID);
    objc_storeStrong(v5 + 40, self->_appLibraryIDsWithReverseAliases);
    objc_storeStrong(v5 + 41, self->_unsaltedBookmarkData);
  }
  return v5;
}

- (BRCNotification)initWithLocalItem:(id)a3 itemDiffs:(unint64_t)a4
{
  void *v4;
  id v7;
  BRCNotification *v8;
  void *v9;
  id v10;
  int v11;
  uint64_t v12;
  BRCAppLibrary *appLibrary;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  BRCItemGlobalID *itemGlobalID;
  uint64_t v19;
  BRCItemGlobalID *parentGlobalID;
  void *v21;
  id *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  BRFileObjectID *oldParentFileObjectID;
  void *v33;
  BRCAppLibrary *v34;
  BRCAppLibrary *v35;
  BRCAppLibrary *v36;
  BRCAppLibrary *v37;
  BOOL v38;
  NSString *p_isa;
  uint64_t v40;
  int v41;
  unsigned int *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  int *v63;
  uint64_t v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  int *v74;
  void *v75;
  ssize_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  ssize_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  NSObject *v87;
  unint64_t v88;
  void *v89;
  NSObject *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  BRFieldFinderTags *v94;
  void *v95;
  BRFieldFinderTags *v96;
  void *v97;
  char v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  int v105;
  int v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  char v118;
  unint64_t v119;
  void *v120;
  int v121;
  uint64_t v122;
  void *v123;
  NSObject *v124;
  uint64_t v125;
  id v126;
  unsigned int v127;
  void *v128;
  NSObject *v129;
  int v130;
  char v131;
  unint64_t v132;
  int v133;
  uint64_t v134;
  unint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  int v139;
  int v140;
  int v141;
  void *v142;
  char v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  int v156;
  unint64_t v157;
  int v158;
  int v159;
  unint64_t v160;
  uint64_t v161;
  unint64_t v162;
  uint64_t v163;
  unint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  int v171;
  int v172;
  unint64_t v173;
  void *v174;
  int v175;
  unint64_t v176;
  void *v177;
  int v178;
  int v179;
  unint64_t v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  char v187;
  void *v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  int v193;
  int v194;
  unint64_t v195;
  int v196;
  int v197;
  unint64_t v198;
  int v199;
  int v200;
  unint64_t v201;
  void *v202;
  int v203;
  unsigned int v204;
  unint64_t v205;
  void *v206;
  int v207;
  uint64_t v208;
  unint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  void *v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  void *v217;
  void *v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  uint64_t v222;
  objc_class *v223;
  void *v224;
  int v225;
  unint64_t v226;
  void *v227;
  int v228;
  int v229;
  unint64_t v230;
  void *v231;
  int v232;
  int v233;
  unint64_t v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  int v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  unint64_t v244;
  int v245;
  uint64_t v246;
  int v247;
  int v248;
  unint64_t v249;
  void *v250;
  int v251;
  void *v252;
  int v253;
  BRCNotification *v254;
  unsigned int v256;
  void *v257;
  NSObject *v258;
  void *v259;
  NSObject *v260;
  void *v261;
  void *v262;
  uint64_t v263;
  void *v264;
  _BOOL4 v265;
  BRCAppLibrary *v266;
  void *v267;
  unint64_t v268;
  void *v269;
  void *v270;
  fsid_t v271;
  objc_super v272;
  uint8_t buf[4];
  void *v274;
  __int16 v275;
  id v276;
  __int16 v277;
  uint64_t v278;
  __int16 v279;
  id v280;
  __int16 v281;
  void *v282;
  uint64_t v283;

  v283 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (objc_msgSend(v7, "isBRAlias"))
  {
    brc_bread_crumbs();
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT))
      -[BRCNotification initWithLocalItem:itemDiffs:].cold.7();

  }
  v272.receiver = self;
  v272.super_class = (Class)BRCNotification;
  v8 = -[BRCNotification init](&v272, sel_init);

  if (v8)
  {
    objc_msgSend(v7, "orig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isZoneRoot") & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v7, "st");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v268 = a4;
    objc_msgSend(v7, "session");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "isOnDisk");
    *(Class *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E0D10F78]) = (Class)-1;
    *(Class *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E0D10FA8]) = (Class)-1;
    objc_msgSend(v7, "appLibrary");
    v12 = objc_claimAutoreleasedReturnValue();
    appLibrary = v8->_appLibrary;
    v8->_appLibrary = (BRCAppLibrary *)v12;

    -[BRCAppLibrary appLibraryID](v8->_appLibrary, "appLibraryID");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (int)*MEMORY[0x1E0D10F28];
    v16 = *(Class *)((char *)&v8->super.super.isa + v15);
    *(Class *)((char *)&v8->super.super.isa + v15) = (Class)v14;

    objc_msgSend(v7, "itemGlobalID");
    v17 = objc_claimAutoreleasedReturnValue();
    itemGlobalID = v8->_itemGlobalID;
    v8->_itemGlobalID = (BRCItemGlobalID *)v17;

    objc_msgSend(v7, "itemParentGlobalID");
    v19 = objc_claimAutoreleasedReturnValue();
    parentGlobalID = v8->_parentGlobalID;
    v8->_parentGlobalID = (BRCItemGlobalID *)v19;

    if (v10)
    {
      objc_msgSend(v10, "logicalName");
    }
    else
    {
      -[BRCAppLibrary mangledID](v8->_appLibrary, "mangledID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mangledIDString");
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E0D10F80]);
    objc_storeStrong(v22, v21);
    if (!v10)
    {

      v21 = v4;
    }

    if (!*v22)
    {
      brc_bread_crumbs();
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_FAULT))
        -[BRCNotification initWithLocalItem:itemDiffs:].cold.6();

    }
    v8->_isInDocumentScope = objc_msgSend(v7, "isInDocumentScope");
    v8->_isInDataScope = objc_msgSend(v7, "isInDataScope");
    v8->_isInTrashScope = objc_msgSend(v7, "isInTrashScope");
    objc_msgSend(v7, "parentClientZone");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dbRowID");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (int)*MEMORY[0x1E0D10FA0];
    v26 = *(Class *)((char *)&v8->super.super.isa + v25);
    *(Class *)((char *)&v8->super.super.isa + v25) = (Class)v24;

    objc_msgSend(v7, "clientZone");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dbRowID");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (int)*MEMORY[0x1E0D10FD0];
    v30 = *(Class *)((char *)&v8->super.super.isa + v29);
    *(Class *)((char *)&v8->super.super.isa + v29) = (Class)v28;

    if ((objc_msgSend(v9, "isFSRoot") & 1) == 0)
    {
      objc_msgSend(v9, "parentFileObjectID");
      v31 = objc_claimAutoreleasedReturnValue();
      oldParentFileObjectID = v8->_oldParentFileObjectID;
      v8->_oldParentFileObjectID = (BRFileObjectID *)v31;

    }
    objc_msgSend(v9, "appLibrary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v8->_appLibrary;
    v35 = v33;
    v36 = v34;
    if (v35 == v36)
    {

      p_isa = (NSString *)&v35->super.isa;
    }
    else
    {
      v37 = v36;
      if (v36)
      {
        v38 = -[BRCAppLibrary isEqual:](v35, "isEqual:", v36);

        if (v38)
        {
LABEL_22:
          v266 = v35;
          v41 = objc_msgSend(v7, "fromReadOnlyDB");
          v42 = (unsigned int *)((char *)v8 + (int)*MEMORY[0x1E0D10F68]);
          v43 = 0x100000;
          if (!v41)
            v43 = 0;
          v44 = *v42 & 0xFFEFFFCF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32) | v43;
          v270 = v10;
          if ((v11 & 1) != 0)
          {
            *v42 = *v42 & 0xFFEFFFCF | v43;
            *((_BYTE *)v42 + 4) = BYTE4(v44);
            objc_msgSend(v7, "fileObjectID");
            v45 = objc_claimAutoreleasedReturnValue();
            v46 = (int)*MEMORY[0x1E0D10F60];
            v47 = *(Class *)((char *)&v8->super.super.isa + v46);
            *(Class *)((char *)&v8->super.super.isa + v46) = (Class)v45;

            if ((objc_msgSend(v7, "isFSRoot") & 1) != 0
              || (objc_msgSend(v7, "parentFileObjectID"),
                  v48 = objc_claimAutoreleasedReturnValue(),
                  v49 = (int)*MEMORY[0x1E0D10F90],
                  v50 = *(Class *)((char *)&v8->super.super.isa + v49),
                  *(Class *)((char *)&v8->super.super.isa + v49) = (Class)v48,
                  v50,
                  (objc_msgSend(v7, "sharingOptions") & 0x48) == 0))
            {
LABEL_36:
              v65 = objc_msgSend(v7, "isDocument");
              v66 = *(Class *)((char *)&v8->super.super.isa + (int)v46);
              if (v65)
              {
                objc_msgSend(v66, "documentID");
                v67 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v67)
                {
                  brc_bread_crumbs();
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v69 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
                  {
                    v70 = *(Class *)((char *)&v8->super.super.isa + (int)v46);
                    *(_DWORD *)buf = 138412802;
                    v274 = v70;
                    v275 = 2112;
                    v276 = v7;
                    v277 = 2112;
                    v278 = (uint64_t)v68;
                    _os_log_fault_impl(&dword_1CBD43000, v69, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: got a document without a document fileObjectID:%@ %@%@", buf, 0x20u);
                  }
                  goto LABEL_60;
                }
              }
              else if (objc_msgSend(v66, "type") == 2)
              {
                brc_bread_crumbs();
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
                  -[BRCNotification initWithLocalItem:itemDiffs:].cold.4();
LABEL_60:

                if (!v11)
                  goto LABEL_61;
                goto LABEL_42;
              }
              if (!v11)
              {
LABEL_61:
                v265 = 0;
                goto LABEL_62;
              }
LABEL_42:
              objc_msgSend(v7, "appLibrary");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "root");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              v271.val[0] = objc_msgSend(v72, "deviceID");
              v271.val[1] = 0;

              v73 = objc_msgSend(v7, "isFSRoot");
              v74 = (int *)MEMORY[0x1E0D10F98];
              if (v73)
              {
                objc_msgSend(v7, "fileID");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                v76 = fsgetpath((char *)buf, 0x400uLL, &v271, objc_msgSend(v75, "unsignedLongLongValue"));

                if (v76 < 0)
                  goto LABEL_48;
                objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", buf);
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "stringByDeletingLastPathComponent");
                v78 = objc_claimAutoreleasedReturnValue();
                v79 = *v74;
                v80 = *(Class *)((char *)&v8->super.super.isa + v79);
                *(Class *)((char *)&v8->super.super.isa + v79) = (Class)v78;

              }
              else
              {
                objc_msgSend(v7, "parentFileID");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v82 = fsgetpath((char *)buf, 0x400uLL, &v271, objc_msgSend(v81, "unsignedLongLongValue"));

                if (v82 < 0)
                  goto LABEL_48;
                objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", buf);
                v83 = objc_claimAutoreleasedReturnValue();
                v84 = *v74;
                v77 = *(Class *)((char *)&v8->super.super.isa + v84);
                *(Class *)((char *)&v8->super.super.isa + v84) = (Class)v83;
              }

LABEL_48:
              v85 = *(uint64_t *)((char *)&v8->super.super.isa + *v74);
              v265 = v85 != 0;
              if (!v85)
              {
                brc_bread_crumbs();
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                brc_notifications_log();
                v87 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
                  -[BRCNotification initWithLocalItem:itemDiffs:].cold.3();

                v88 = *v42 & 0xFFFFFFDF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                *v42 = *v42 & 0xFFFFFFCF | 0x10;
                *((_BYTE *)v42 + 4) = BYTE4(v88);
              }
LABEL_62:
              objc_msgSend(v10, "finderTags");
              v93 = (void *)objc_claimAutoreleasedReturnValue();

              if (v93)
              {
                v94 = [BRFieldFinderTags alloc];
                objc_msgSend(v10, "finderTags");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                v96 = -[BRFieldFinderTags initWithData:](v94, "initWithData:", v95);

                if (!-[BRFieldFinderTags tagsCount](v96, "tagsCount"))
                {
                  brc_bread_crumbs();
                  v257 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v258 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v258, OS_LOG_TYPE_FAULT))
                    -[BRCNotification initWithLocalItem:itemDiffs:].cold.2();

                }
                -[BRFieldFinderTags tags](v96, "tags");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                -[BRCNotification setAttribute:forKey:](v8, "setAttribute:forKey:", v97, *MEMORY[0x1E0D11140]);

              }
              if (v10)
                v98 = objc_msgSend(v10, "mode");
              else
                v98 = 1;
              v99 = *v42;
              v100 = v99 & 0xFFFFFFFFFFF1FFFFLL | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
              *v42 = v99 & 0xFFF1FFFF | ((v98 & 7) << 17);
              *((_BYTE *)v42 + 4) = BYTE4(v100);
              if (objc_msgSend(v7, "isDirectory"))
              {
                v101 = *v42 & 0xFFF1FFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32) | ((unint64_t)((*v42 >> 17) & 5 | 2) << 17);
                *v42 = *v42 & 0xFFF1FFFF | (((*v42 >> 17) & 5 | 2) << 17);
                *((_BYTE *)v42 + 4) = BYTE4(v101);
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "birthtime"));
              v102 = objc_claimAutoreleasedReturnValue();
              v103 = (int)*MEMORY[0x1E0D10F38];
              v104 = *(Class *)((char *)&v8->super.super.isa + v103);
              v263 = v103;
              *(Class *)((char *)&v8->super.super.isa + v103) = (Class)v102;

              if (objc_msgSend(v7, "isInTrashScope"))
              {
                v105 = objc_msgSend(v7, "isUserVisible");
                v106 = 0x10000;
                if (!v105)
                  v106 = 0;
              }
              else
              {
                v106 = 0;
              }
              v107 = *v42;
              v108 = v107 & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
              *v42 = v107 & 0xFFFEFFFF | v106;
              *((_BYTE *)v42 + 4) = BYTE4(v108);
              v109 = objc_msgSend(v10, "lastUsedTime");
              if (v109)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "lastUsedTime"));
                v110 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v110 = 0;
              }
              objc_storeStrong((id *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E0D10F70]), v110);
              if (v109)

              v111 = objc_msgSend(v10, "favoriteRank");
              if (v111)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v10, "favoriteRank"));
                v112 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v112 = 0;
              }
              objc_storeStrong((id *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E0D10F58]), v112);
              if (v111)

              objc_msgSend(v10, "creatorRowID");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              v114 = objc_msgSend(v113, "integerValue");

              if (v114)
              {
                objc_msgSend(v10, "creatorRowID");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "db");
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                +[BRCAccountSession nameComponentsForKey:db:](BRCAccountSession, "nameComponentsForKey:db:", v115, v116);
                v117 = (void *)objc_claimAutoreleasedReturnValue();

                -[BRCNotification setAttribute:forKey:](v8, "setAttribute:forKey:", v117, *MEMORY[0x1E0D11100]);
              }
              else
              {
                -[BRCNotification setAttribute:forKey:](v8, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D110F8]);
              }
              v118 = objc_msgSend(v7, "uploadStatus");
              v119 = *v42 & 0xFFFFFFF3 | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
              *v42 = *v42 & 0xFFFFFFF3 | (4 * (v118 & 3));
              *((_BYTE *)v42 + 4) = BYTE4(v119);
              objc_msgSend(v7, "clientZone");
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              v121 = objc_msgSend(v120, "isSharedZone");

              v122 = objc_msgSend(v7, "sharingOptions") & 0x48;
              if (v121)
              {
                if (!v122 && (objc_msgSend(v7, "isDead") & 1) == 0)
                {
                  brc_bread_crumbs();
                  v123 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v124 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v7, "digestDescription");
                    v262 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v7, "appLibrary");
                    v261 = (void *)objc_claimAutoreleasedReturnValue();
                    v125 = objc_msgSend(v7, "sharingOptions");
                    objc_msgSend(v7, "sharingOptions");
                    BRCPrettyPrintBitmap();
                    v126 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138413314;
                    v274 = v262;
                    v275 = 2112;
                    v276 = v261;
                    v277 = 2048;
                    v278 = v125;
                    v279 = 2112;
                    v280 = v126;
                    v281 = 2112;
                    v282 = v123;
                    _os_log_impl(&dword_1CBD43000, v124, OS_LOG_TYPE_DEFAULT, "[WARNING] item %@ in shared zone \"%@\" should have share-options set (actual:%lu %@)%@", buf, 0x34u);

                    v10 = v270;
                  }

                }
                if ((objc_msgSend(v7, "isShareAcceptationFault") & 1) == 0)
                {
                  v127 = objc_msgSend(v7, "sharingOptions");
                  if ((((objc_msgSend(v7, "sharingOptions") >> 3) ^ (v127 >> 6)) & 1) == 0
                    && (objc_msgSend(v7, "isDead") & 1) == 0)
                  {
                    brc_bread_crumbs();
                    v128 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v129 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v129, (os_log_type_t)0x90u))
                      -[BRCNotification initWithLocalItem:itemDiffs:].cold.1();

                  }
                }
                if ((objc_msgSend(v7, "sharingOptions") & 0x20) == 0)
                {
                  v130 = 0x2000;
LABEL_108:
                  v134 = *v42;
                  v135 = v134 & 0xFFFFFFFFFFFFC7FFLL | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                  *v42 = v134 & 0xFFFFC7FF | v130;
                  *((_BYTE *)v42 + 4) = BYTE4(v135);
                  objc_msgSend(v7, "ownerKey");
                  v136 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "db");
                  v137 = (void *)objc_claimAutoreleasedReturnValue();
                  +[BRCAccountSession nameComponentsForKey:db:](BRCAccountSession, "nameComponentsForKey:db:", v136, v137);
                  v138 = (void *)objc_claimAutoreleasedReturnValue();

                  -[BRCNotification setAttribute:forKey:](v8, "setAttribute:forKey:", v138, *MEMORY[0x1E0D11130]);
                  goto LABEL_109;
                }
                if (objc_msgSend(v7, "isKnownByServer"))
                {
                  v130 = 6144;
                  goto LABEL_108;
                }
              }
              else
              {
                v131 = objc_msgSend(v7, "sharingOptions");
                if (!v122)
                {
                  if ((v131 & 1) != 0)
                  {
                    v140 = 0;
                    v139 = 0;
                    if ((objc_msgSend(v7, "sharingOptions") & 2) != 0)
                      v256 = *v42 & 0xFFFFC7FF | 0x800;
                    else
                      v256 = *v42 & 0xFFFFC7FF | 0x1000;
                    *((_BYTE *)v42 + 4) = *((_BYTE *)v42 + 4);
                    *v42 = v256;
                  }
                  else
                  {
                    v140 = 0;
                    v139 = 0;
                    v161 = *v42;
                    v162 = v161 & 0xFFFFFFFFFFFFC7FFLL | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                    *v42 = v161 & 0xFFFFC7FF;
                    *((_BYTE *)v42 + 4) = BYTE4(v162);
                  }
                  goto LABEL_110;
                }
                v132 = *v42 & 0xFFFFC7FF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                v133 = 2048;
                if ((v131 & 0x10) == 0)
                  v133 = 4096;
                *v42 = *v42 & 0xFFFFC7FF | v133;
                *((_BYTE *)v42 + 4) = BYTE4(v132);
              }
LABEL_109:
              v139 = objc_msgSend(v7, "isDocument");
              v140 = 1;
LABEL_110:
              v267 = v9;
              if (objc_msgSend(v7, "isShared") && (objc_msgSend(v7, "sharingOptions") & 4) != 0)
              {
                objc_msgSend(v7, "collaborationIdentifierIfComputable");
                v142 = (void *)objc_claimAutoreleasedReturnValue();
                v141 = 1;
              }
              else
              {
                v141 = 0;
                v142 = 0;
              }
              objc_storeStrong((id *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E0D10F48]), v142);
              if (v141)
              {

                if (!v140)
                {
LABEL_116:
                  if (!v139)
                    goto LABEL_124;
                  goto LABEL_120;
                }
              }
              else if (!v140)
              {
                goto LABEL_116;
              }
              v143 = objc_msgSend(v7, "sharingOptions");
              v144 = *v42;
              *((_BYTE *)v42 + 4) = (v144 & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32)) >> 32;
              *v42 = (v144 & 0xFFDFFFFF | ((v143 & 4) << 19)) ^ 0x200000;
              if (!v139)
                goto LABEL_124;
LABEL_120:
              objc_msgSend(v7, "asDocument");
              v145 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v145, "currentVersion");
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v146, "lastEditorRowID");
              v147 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v147, "br_isEqualToNumber:", &unk_1E87D70B8))
              {
                -[BRCNotification setAttribute:forKey:](v8, "setAttribute:forKey:", 0, *MEMORY[0x1E0D11110]);
              }
              else
              {
                objc_msgSend(v145, "currentVersion");
                v148 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v148, "lastEditorRowID");
                v149 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v145, "db");
                v150 = (void *)objc_claimAutoreleasedReturnValue();
                +[BRCAccountSession nameComponentsForKey:db:](BRCAccountSession, "nameComponentsForKey:db:", v149, v150);
                v151 = (void *)objc_claimAutoreleasedReturnValue();

                v10 = v270;
                -[BRCNotification setAttribute:forKey:](v8, "setAttribute:forKey:", v151, *MEMORY[0x1E0D11110]);

              }
LABEL_124:
              if ((objc_msgSend(v7, "isInTrashScope") & 1) != 0)
              {
                objc_msgSend(v7, "st");
                v152 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v152, "logicalName");
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v153, "length"))
                {
                  objc_msgSend(v7, "st");
                  v154 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v154, "logicalName");
                  v155 = (void *)objc_claimAutoreleasedReturnValue();
                  v156 = objc_msgSend(v155, "characterAtIndex:", 0) == 46;
                  v157 = *v42 & 0xFBFFFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                  *v42 = *v42 & 0xFBFFFFFF | (v156 << 26);
                  *((_BYTE *)v42 + 4) = BYTE4(v157);

                }
                else
                {
                  v163 = *v42;
                  v164 = v163 & 0xFFFFFFFFFBFFFFFFLL | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                  *v42 = v163 & 0xFBFFFFFF;
                  *((_BYTE *)v42 + 4) = BYTE4(v164);
                }

              }
              else
              {
                v158 = objc_msgSend(v7, "isUserVisible");
                v159 = 0x4000000;
                if (v158)
                  v159 = 0;
                v160 = *v42 & 0xFBFFFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                *v42 = *v42 & 0xFBFFFFFF | v159;
                *((_BYTE *)v42 + 4) = BYTE4(v160);
              }
              objc_msgSend(v10, "physicalName");
              v165 = objc_claimAutoreleasedReturnValue();
              v166 = (int)*MEMORY[0x1E0D10FB0];
              v167 = *(Class *)((char *)&v8->super.super.isa + v166);
              *(Class *)((char *)&v8->super.super.isa + v166) = (Class)v165;

              if (objc_msgSend(v7, "isDocument"))
              {
                objc_msgSend(v7, "asDocument");
                v168 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v168, "currentVersion");
                v169 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "st");
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                v171 = objc_msgSend(v170, "isHiddenExt");
                v172 = 0x4000;
                if (!v171)
                  v172 = 0;
                v173 = *v42 & 0xFFFFBFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                *v42 = *v42 & 0xFFFFBFFF | v172;
                *((_BYTE *)v42 + 4) = BYTE4(v173);

                if ((objc_msgSend(v168, "isFault") & v265) == 1)
                {
                  objc_msgSend(v168, "desiredVersion");
                  v174 = (void *)objc_claimAutoreleasedReturnValue();
                  v175 = objc_msgSend(v174, "wantsContent");

                  v176 = *v42 | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32) | 0x30;
                  if (v175)
                    v176 = *v42 & 0xFFFFFFCF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32) | 0x20;
                  *v42 = v176;
                  *((_BYTE *)v42 + 4) = BYTE4(v176);
                }
                if (v169)
                {
                  objc_msgSend(v169, "editedSinceShared");
                  v177 = (void *)objc_claimAutoreleasedReturnValue();
                  v178 = objc_msgSend(v177, "BOOLValue");
                  v179 = 0x1000000;
                  if (!v178)
                    v179 = 0;
                  v180 = *v42 & 0xFEFFFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                  *v42 = *v42 & 0xFEFFFFFF | v179;
                  *((_BYTE *)v42 + 4) = BYTE4(v180);

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v169, "size"));
                  v181 = objc_claimAutoreleasedReturnValue();
                  v182 = (int)*MEMORY[0x1E0D10FC0];
                  v183 = *(Class *)((char *)&v8->super.super.isa + v182);
                  *(Class *)((char *)&v8->super.super.isa + v182) = (Class)v181;

                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v169, "mtime"));
                  v184 = objc_claimAutoreleasedReturnValue();
                  v185 = (int)*MEMORY[0x1E0D10F88];
                  v186 = *(Class *)((char *)&v8->super.super.isa + v185);
                  *(Class *)((char *)&v8->super.super.isa + v185) = (Class)v184;

                }
                if (objc_msgSend(v7, "isFinderBookmark"))
                {
                  v187 = 3;
                }
                else if (objc_msgSend(v169, "isPackage"))
                {
                  v187 = 2;
                }
                else
                {
                  v187 = 1;
                }
                *((_BYTE *)v42 + 5) = v187;
                objc_msgSend(v168, "liveConflictLoserEtags");
                v224 = (void *)objc_claimAutoreleasedReturnValue();
                v225 = objc_msgSend(v224, "count") != 0;
                v226 = *v42 & 0xFFFFFFBF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                *v42 = *v42 & 0xFFFFFFBF | (v225 << 6);
                *((_BYTE *)v42 + 4) = BYTE4(v226);

                if ((objc_msgSend(v168, "isDead") & 1) == 0)
                {
                  objc_msgSend(v269, "fsDownloader");
                  v227 = (void *)objc_claimAutoreleasedReturnValue();
                  v228 = objc_msgSend(v227, "isDownloadingItem:", v168);
                  v229 = 512;
                  if (!v228)
                    v229 = 0;
                  v230 = *v42 & 0xFFFFFDFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                  *v42 = *v42 & 0xFFFFFDFF | v229;
                  *((_BYTE *)v42 + 4) = BYTE4(v230);

                  objc_msgSend(v269, "fsUploader");
                  v231 = (void *)objc_claimAutoreleasedReturnValue();
                  v232 = objc_msgSend(v231, "isUploadingItem:", v168);
                  v233 = 256;
                  if (!v232)
                    v233 = 0;
                  v234 = *v42 & 0xFFFFFEFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                  *v42 = *v42 & 0xFFFFFEFF | v233;
                  *((_BYTE *)v42 + 4) = BYTE4(v234);

                }
                *v42 = *v42 & 0xFFFFFFFC | objc_msgSend(v168, "downloadStatus") & 3;
                objc_msgSend(v168, "desiredVersion");
                v235 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v235, "downloadError");
                v236 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v236, "brc_wrappedError");
                v237 = (void *)objc_claimAutoreleasedReturnValue();

                if (v237)
                  -[BRCNotification setAttribute:forKey:](v8, "setAttribute:forKey:", v237, *MEMORY[0x1E0D11108]);
                objc_msgSend(v168, "desiredVersion");
                v238 = (void *)objc_claimAutoreleasedReturnValue();
                v239 = objc_msgSend(v238, "wantsContent");

                if (v239)
                {
                  v240 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v168, "desiredVersion");
                  v241 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v240, "numberWithLongLong:", objc_msgSend(v241, "size"));
                  v242 = (void *)objc_claimAutoreleasedReturnValue();
                  -[BRCNotification setAttribute:forKey:](v8, "setAttribute:forKey:", v242, *MEMORY[0x1E0D11120]);

                }
                objc_msgSend(v168, "uploadError");
                v243 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v243, "brc_wrappedError");
                v189 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v168, "downloadStatus") == 1
                  && objc_msgSend(v168, "isDownloadRequestedForThumbnail"))
                {
                  v244 = *v42 & 0xFFFFFBFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                }
                else
                {
                  v245 = objc_msgSend(v168, "isDownloadRequested");
                  v246 = 1024;
                  if (!v245)
                    v246 = 0;
                  v244 = *v42 & 0xFFFFFBFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32) | v246;
                }
                *v42 = v244;
                *((_BYTE *)v42 + 4) = BYTE4(v244);
                v247 = objc_msgSend(v168, "isEvictable");
                v248 = 0x10000000;
                if (!v247)
                  v248 = 0;
                v249 = *v42 & 0xEFFFFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                *v42 = *v42 & 0xEFFFFFFF | v248;
                *((_BYTE *)v42 + 4) = BYTE4(v249);

              }
              else if (objc_msgSend(v7, "isDirectory"))
              {
                objc_msgSend(v7, "syncUpError");
                v188 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v188, "brc_wrappedError");
                v189 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v7, "asDirectory");
                v168 = (void *)objc_claimAutoreleasedReturnValue();
                *((_BYTE *)v42 + 5) = 0;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v168, "mtime"));
                v190 = objc_claimAutoreleasedReturnValue();
                v191 = (int)*MEMORY[0x1E0D10F88];
                v192 = *(Class *)((char *)&v8->super.super.isa + v191);
                *(Class *)((char *)&v8->super.super.isa + v191) = (Class)v190;

                v193 = objc_msgSend(v168, "isSharedByMeOrContainsSharedByMeItem");
                v194 = 0x800000;
                if (!v193)
                  v194 = 0;
                v195 = *v42 & 0xFF7FFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                *v42 = *v42 & 0xFF7FFFFF | v194;
                *((_BYTE *)v42 + 4) = BYTE4(v195);
                v196 = objc_msgSend(v168, "isSharedToMeOrContainsSharedToMeItem");
                v197 = 0x400000;
                if (!v196)
                  v197 = 0;
                v198 = *v42 & 0xFFBFFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                *v42 = *v42 & 0xFFBFFFFF | v197;
                *((_BYTE *)v42 + 4) = BYTE4(v198);
                v199 = objc_msgSend(v168, "isAppLibraryTrashFolder");
                v200 = 0x40000000;
                if (!v199)
                  v200 = 0;
                v201 = *v42 & 0xBFFFFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                *v42 = *v42 & 0xBFFFFFFF | v200;
                *((_BYTE *)v42 + 4) = BYTE4(v201);
                objc_msgSend(v7, "itemID");
                v202 = (void *)objc_claimAutoreleasedReturnValue();
                v203 = objc_msgSend(v202, "isNonDesktopRoot");
                v204 = 0x80000000;
                if (!v203)
                  v204 = 0;
                v205 = *v42 & 0x7FFFFFFF | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32);
                *v42 = *v42 & 0x7FFFFFFF | v204;
                *((_BYTE *)v42 + 4) = BYTE4(v205);

                objc_msgSend(v7, "itemID");
                v206 = (void *)objc_claimAutoreleasedReturnValue();
                v207 = objc_msgSend(v206, "isDocumentsFolder");
                v208 = 0x100000000;
                if (!v207)
                  v208 = 0;
                v209 = (*v42 | ((unint64_t)*((unsigned __int8 *)v42 + 4) << 32)) & 0xFFFFFFFEFFFFFFFFLL;
                *v42 = *v42;
                *((_BYTE *)v42 + 4) = (v209 | v208) >> 32;

                if (objc_msgSend(v168, "isDirectoryFault"))
                {
                  objc_msgSend(v168, "serverQuotaUsage");
                  v210 = objc_claimAutoreleasedReturnValue();
                  v211 = (int)*MEMORY[0x1E0D10FC0];
                  v212 = *(Class *)((char *)&v8->super.super.isa + v211);
                  *(Class *)((char *)&v8->super.super.isa + v211) = (Class)v210;

                }
                objc_msgSend(v7, "asDirectory");
                v213 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v213, "childItemCount");
                v214 = objc_claimAutoreleasedReturnValue();
                v215 = (int)*MEMORY[0x1E0D10F40];
                v216 = *(Class *)((char *)&v8->super.super.isa + v215);
                *(Class *)((char *)&v8->super.super.isa + v215) = (Class)v214;

                *v42 |= 3u;
              }
              else
              {
                if (!objc_msgSend(v7, "isSymLink"))
                {
                  v189 = 0;
                  goto LABEL_186;
                }
                objc_msgSend(v7, "syncUpError");
                v217 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v217, "brc_wrappedError");
                v189 = (void *)objc_claimAutoreleasedReturnValue();

                *((_BYTE *)v42 + 5) = 4;
                *v42 |= 3u;
                objc_msgSend(v7, "asSymlink");
                v218 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v218, "symlinkTarget");
                v219 = objc_claimAutoreleasedReturnValue();
                v220 = (int)*MEMORY[0x1E0D10FC8];
                v221 = *(Class *)((char *)&v8->super.super.isa + v220);
                *(Class *)((char *)&v8->super.super.isa + v220) = (Class)v219;

                v222 = (int)*MEMORY[0x1E0D10F88];
                v223 = (objc_class *)*(id *)((char *)&v8->super.super.isa + v263);
                v168 = *(Class *)((char *)&v8->super.super.isa + v222);
                *(Class *)((char *)&v8->super.super.isa + v222) = v223;
              }

LABEL_186:
              objc_msgSend(v270, "parentID");
              v250 = (void *)objc_claimAutoreleasedReturnValue();
              v251 = objc_msgSend(v250, "isNonDesktopRoot");

              if (v251)
                *v42 |= 0x8000000u;
              if (v189)
                -[BRCNotification setAttribute:forKey:](v8, "setAttribute:forKey:", v189, *MEMORY[0x1E0D11148]);
              if ((v268 & 0x100000000) != 0)
              {
                objc_msgSend(v7, "orig");
                v252 = (void *)objc_claimAutoreleasedReturnValue();
                v253 = objc_msgSend(v252, "isLost");

                if (v253)
                  *(_WORD *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E0D10F50]) |= 0x4000u;
              }
              if ((v268 & 0x20) != 0)
                *(_WORD *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E0D10F50]) |= 0x10u;
              if ((v268 & 0x1000000040) != 0)
                *(_WORD *)((char *)&v8->super.super.isa + (int)*MEMORY[0x1E0D10F50]) |= 0x20u;

              goto LABEL_198;
            }
            if ((objc_msgSend(v7, "sharingOptions") & 4) == 0)
            {
              objc_msgSend(MEMORY[0x1E0C95070], "brc_fetchShareIDWithSharedItem:", v7);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v51;
              if (v51)
              {
                objc_msgSend(v51, "brc_shareItemID");
                v53 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "clientZone");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "db");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v264 = (void *)v53;
                objc_msgSend(v54, "itemByItemID:db:", v53, v55);
                v56 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v56)
                {
                  brc_bread_crumbs();
                  v259 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v260 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v260, OS_LOG_TYPE_FAULT))
                    -[BRCNotification initWithLocalItem:itemDiffs:].cold.5();

                }
                objc_msgSend(v56, "fileObjectID");
                v57 = objc_claimAutoreleasedReturnValue();
                v58 = (int)*MEMORY[0x1E0D10FB8];
                v59 = *(Class *)((char *)&v8->super.super.isa + v58);
                *(Class *)((char *)&v8->super.super.isa + v58) = (Class)v57;

                v10 = v270;
              }
              goto LABEL_35;
            }
            objc_msgSend(v7, "fileObjectID");
            v62 = objc_claimAutoreleasedReturnValue();
            v63 = (int *)MEMORY[0x1E0D10FB8];
          }
          else
          {
            *((_BYTE *)v42 + 4) = BYTE4(v44);
            *v42 = v44 | 0x10;
            objc_msgSend(v9, "fileObjectID");
            v60 = objc_claimAutoreleasedReturnValue();
            v46 = (int)*MEMORY[0x1E0D10F60];
            v61 = *(Class *)((char *)&v8->super.super.isa + v46);
            *(Class *)((char *)&v8->super.super.isa + v46) = (Class)v60;

            if ((objc_msgSend(v9, "isFSRoot") & 1) != 0)
              goto LABEL_36;
            objc_msgSend(v9, "parentFileObjectID");
            v62 = objc_claimAutoreleasedReturnValue();
            v63 = (int *)MEMORY[0x1E0D10F90];
          }
          v64 = *v63;
          v52 = *(Class *)((char *)&v8->super.super.isa + v64);
          *(Class *)((char *)&v8->super.super.isa + v64) = (Class)v62;
LABEL_35:

          goto LABEL_36;
        }
      }
      else
      {

      }
      -[BRCAppLibrary appLibraryID](v35, "appLibraryID");
      v40 = objc_claimAutoreleasedReturnValue();
      p_isa = v8->_oldAppLibraryID;
      v8->_oldAppLibraryID = (NSString *)v40;
    }

    goto LABEL_22;
  }
LABEL_198:
  v254 = v8;

  return v254;
}

+ (id)notificationGatheredFromItem:(id)a3
{
  id result;

  result = (id)objc_msgSend(a1, "notificationFromItem:", a3);
  if (result)
    *(_WORD *)((char *)result + (int)*MEMORY[0x1E0D10F50]) |= 0x8000u;
  return result;
}

+ (id)notificationFromItem:(id)a3
{
  id v3;
  int v4;
  BRCNotification *v5;
  BRCNotification *v6;
  uint64_t v7;
  BRCNotification *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "isBRAlias");
  v5 = [BRCNotification alloc];
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v3, "asBRAlias");
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = -[BRCNotification initWithAliasItem:itemDiffs:](v6, "initWithAliasItem:itemDiffs:", v7, 0);
    v3 = (id)v7;
  }
  else
  {
    v8 = -[BRCNotification initWithLocalItem:itemDiffs:](v5, "initWithLocalItem:itemDiffs:", v3, 0);
  }

  return v8;
}

- (void)setNumberAttribute:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "longLongValue"))
    v7 = v8;
  else
    v7 = 0;
  -[BRCNotification setAttribute:forKey:](self, "setAttribute:forKey:", v7, v6);

}

- (id)notificationByStrippingSharingInfoIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;

  v3 = (int)*MEMORY[0x1E0D10F30];
  v4 = *MEMORY[0x1E0D11130];
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v3), "objectForKey:", *MEMORY[0x1E0D11130]);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x1E0D11110];
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v3), "objectForKey:", *MEMORY[0x1E0D11110]);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v7 | v5)
  {
    v8 = (char *)-[BRCNotification copy](self, "copy");
    objc_msgSend(*(id *)&v8[v3], "removeObjectForKey:", v4);
    objc_msgSend(*(id *)&v8[v3], "removeObjectForKey:", v6);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)canMerge:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  if (-[BRCItemGlobalID isEqualToItemGlobalID:](self->_itemGlobalID, "isEqualToItemGlobalID:", v4[43]))
    v5 = objc_msgSend(*(id *)((char *)&self->super.super.isa + (int)*MEMORY[0x1E0D10F60]), "isEqualToFileObjectID:", *(_QWORD *)((char *)v4 + (int)*MEMORY[0x1E0D10F60]));
  else
    v5 = 0;

  return v5;
}

- (void)merge:(id)a3
{
  id v4;
  NSUInteger v5;
  void *v6;
  NSSet *v7;
  NSSet *parentGlobalIDs;
  NSMutableSet *appLibraryIDsWithReverseAliases;
  NSMutableSet *v10;
  NSMutableSet *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCNotification;
  -[BRCNotification merge:](&v13, sel_merge_, v4);
  if (objc_msgSend(*((id *)v4 + 44), "count"))
  {
    v5 = -[NSSet count](self->_parentGlobalIDs, "count");
    v6 = (void *)*((_QWORD *)v4 + 44);
    if (v5)
    {
      v7 = (NSSet *)objc_msgSend(v6, "mutableCopy");
      -[NSSet unionSet:](v7, "unionSet:", self->_parentGlobalIDs);
    }
    else
    {
      v7 = v6;
    }
    parentGlobalIDs = self->_parentGlobalIDs;
    self->_parentGlobalIDs = v7;

  }
  if (*((_QWORD *)v4 + 40))
  {
    appLibraryIDsWithReverseAliases = self->_appLibraryIDsWithReverseAliases;
    if (appLibraryIDsWithReverseAliases)
    {
      -[NSMutableSet unionSet:](appLibraryIDsWithReverseAliases, "unionSet:");
    }
    else
    {
      v10 = (NSMutableSet *)objc_msgSend(*((id *)v4 + 40), "mutableCopy");
      v11 = self->_appLibraryIDsWithReverseAliases;
      self->_appLibraryIDsWithReverseAliases = v10;

    }
    objc_storeStrong((id *)&self->_unsaltedBookmarkData, *((id *)v4 + 41));
  }
  v12 = (void *)*((_QWORD *)v4 + 45);
  if (v12)
    objc_storeStrong((id *)&self->_oldAppLibraryID, v12);

}

- (void)generateLogicalExtension:(id)a3 physicalExtension:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  BRCNotification *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __int16 v15;
  char v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27[3];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  BRCNotification *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  memset(v27, 0, sizeof(v27));
  __brc_create_section(0, (uint64_t)"-[BRCNotification generateLogicalExtension:physicalExtension:]", 841, v27);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v29 = v27[0];
    v30 = 2112;
    v31 = self;
    v32 = 2112;
    v33 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[NOTIF] ┏%llx generating sandbox extensions for %@%@", buf, 0x20u);
  }

  v10 = self;
  objc_sync_enter(v10);
  v11 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x1E0D10F98]);
  v12 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x1E0D10FB0]);
  v13 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x1E0D10F80]);
  v14 = *(id *)((char *)&v10->super.super.isa + (int)*MEMORY[0x1E0D10F60]);
  v15 = *(_WORD *)((char *)&v10->super.super.isa + (int)*MEMORY[0x1E0D10F50]);
  objc_sync_exit(v10);

  v16 = -[BRCNotification isDead](v10, "isDead");
  if (v11)
    v17 = v16;
  else
    v17 = 1;
  if ((v17 & 1) == 0 && (v15 & 0xC030) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_msgSend(v12, "br_isSideFaultName") & 1) == 0)
    {
      objc_msgSend(v18, "URLByAppendingPathComponent:", v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      _issueReadWriteSandboxExtensionForURL(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, v14);
      goto LABEL_23;
    }
    if (v13)
    {
      objc_msgSend(v18, "URLByAppendingPathComponent:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _issueReadWriteSandboxExtensionForURL(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, v14);
      if (v12)
      {
LABEL_14:
        if ((objc_msgSend(v12, "br_isSideFaultName") & 1) == 0)
        {
          brc_bread_crumbs();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
            -[BRCNotification generateLogicalExtension:physicalExtension:].cold.1();

        }
        objc_msgSend(v18, "URLByAppendingPathComponent:", v12, v26);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        _issueReadWriteSandboxExtensionForURL(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, v14);
        goto LABEL_23;
      }
    }
    else
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[BRCNotification generateLogicalExtension:physicalExtension:].cold.2();

      v19 = 0;
      v20 = 0;
      if (v12)
        goto LABEL_14;
    }
    v21 = v19;
    v22 = v20;
LABEL_23:

  }
  __brc_leave_section(v27);

}

- (BOOL)isDocumentsFolder
{
  void *v2;
  void *v3;
  char v4;

  -[BRCNotification itemGlobalID](self, "itemGlobalID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDocumentsFolder");

  return v4;
}

- (BRCItemGlobalID)itemGlobalID
{
  return self->_itemGlobalID;
}

- (BRCItemGlobalID)parentGlobalID
{
  return self->_parentGlobalID;
}

- (BRFileObjectID)oldParentFileObjectID
{
  return self->_oldParentFileObjectID;
}

- (NSSet)parentGlobalIDs
{
  return self->_parentGlobalIDs;
}

- (void)setParentGlobalIDs:(id)a3
{
  objc_storeStrong((id *)&self->_parentGlobalIDs, a3);
}

- (BRCAppLibrary)appLibrary
{
  return self->_appLibrary;
}

- (NSString)oldAppLibraryID
{
  return self->_oldAppLibraryID;
}

- (NSString)aliasSourceAppLibraryID
{
  return self->_aliasSourceAppLibraryID;
}

- (BOOL)isInDocumentScope
{
  return self->_isInDocumentScope;
}

- (BOOL)isInDataScope
{
  return self->_isInDataScope;
}

- (BOOL)isInTrashScope
{
  return self->_isInTrashScope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldAppLibraryID, 0);
  objc_storeStrong((id *)&self->_parentGlobalIDs, 0);
  objc_storeStrong((id *)&self->_itemGlobalID, 0);
  objc_storeStrong((id *)&self->_unsaltedBookmarkData, 0);
  objc_storeStrong((id *)&self->_appLibraryIDsWithReverseAliases, 0);
  objc_storeStrong((id *)&self->_aliasSourceAppLibraryID, 0);
  objc_storeStrong((id *)&self->_oldParentFileObjectID, 0);
  objc_storeStrong((id *)&self->_parentGlobalID, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
}

- (void)setAppLibraryIDsWithReverseAliases:(id)a3
{
  objc_storeStrong((id *)&self->_appLibraryIDsWithReverseAliases, a3);
}

- (void)setUnsaltedBookmarkData:(id)a3
{
  objc_storeStrong((id *)&self->_unsaltedBookmarkData, a3);
}

- (NSMutableSet)appLibraryIDsWithReverseAliases
{
  return self->_appLibraryIDsWithReverseAliases;
}

- (NSString)unsaltedBookmarkData
{
  return self->_unsaltedBookmarkData;
}

+ (id)notificationFromItem:(id)a3 relpath:(id)a4
{
  id v5;
  id v6;
  char *v7;
  int *v8;
  char *v9;
  unint64_t v10;
  int *v11;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isZoneRoot"))
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      +[BRCNotification(LegacyAdditions) notificationFromItem:relpath:].cold.2((uint64_t)v26, v27, v28, v29, v30, v31, v32, v33);

  }
  +[BRCNotification notificationFromItem:](BRCNotification, "notificationFromItem:", v5);
  v7 = (char *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_msgSend(v6, "exists") & 1) != 0)
    {
      if (objc_msgSend(v6, "isDocument"))
      {
        if (objc_msgSend(v5, "changedAtRelativePath:scanPackage:", v6, 0))
        {
          v8 = (int *)MEMORY[0x1E0D10F68];
          *(_DWORD *)&v7[*MEMORY[0x1E0D10F68]] |= 3u;
          v9 = &v7[*v8];
          v10 = *(_DWORD *)v9 & 0xFFFFFFF7 | ((unint64_t)v9[4] << 32);
          *(_DWORD *)v9 = *(_DWORD *)v9 & 0xFFFFFFF3 | 4;
LABEL_10:
          v9[4] = BYTE4(v10);
          goto LABEL_11;
        }
        if (!objc_msgSend(v5, "fromReadOnlyDB"))
          goto LABEL_11;
        objc_msgSend(v5, "st");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stagedFileID");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          objc_msgSend(v5, "st");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stagedFileID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "unsignedLongLongValue");
          if (v18 == objc_msgSend(v6, "fileID"))
          {
            v19 = objc_msgSend(v6, "isFault");

            if ((v19 & 1) != 0)
              goto LABEL_11;
            objc_msgSend(v5, "st");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "stagedGenerationID");
            objc_msgSend(v6, "generationID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "fsGenerationID");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "longValue");

            if (v24 != v21)
            {
              brc_bread_crumbs();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
                +[BRCNotification(LegacyAdditions) notificationFromItem:relpath:].cold.1((uint64_t)v34, v35, v36, v37, v38, v39, v40, v41);

            }
            v25 = (int *)MEMORY[0x1E0D10F68];
            *(_DWORD *)&v7[*MEMORY[0x1E0D10F68]] |= 3u;
            v9 = &v7[*v25];
            v10 = *(_DWORD *)v9 & 0xFFFFFDFF | ((unint64_t)v9[4] << 32);
            goto LABEL_9;
          }

        }
      }
    }
    else if ((objc_msgSend(v5, "isFault") & 1) == 0)
    {
      v11 = (int *)MEMORY[0x1E0D10F68];
      *(_DWORD *)&v7[*MEMORY[0x1E0D10F68]] &= 0xFFFFFFFC;
      v9 = &v7[*v11];
      v10 = *(_DWORD *)v9 & 0xFFFFFFF3 | ((unint64_t)v9[4] << 32);
LABEL_9:
      *(_DWORD *)v9 = v10;
      goto LABEL_10;
    }
  }
LABEL_11:

  return v7;
}

- (void)_addAliasDecoration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BRCItemGlobalID *v8;
  BRCItemGlobalID *parentGlobalID;
  void *v10;
  BRFileObjectID *v11;
  BRFileObjectID *oldParentFileObjectID;
  void *v13;
  NSString *v14;
  NSString *aliasSourceAppLibraryID;
  void *v16;
  objc_class *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  objc_class *v25;
  uint64_t v26;
  void *v27;
  char *v28;
  unint64_t v29;
  objc_class *v30;
  uint64_t v31;
  void *v32;
  objc_class *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  ssize_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char *v42;
  unint64_t v43;
  void *v44;
  NSObject *v45;
  fsid_t v46;
  uint8_t buf[4];
  BRCNotification *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  char v53[1024];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCAppLibrary session](self->_appLibrary, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "volume");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46.val[0] = objc_msgSend(v6, "deviceID");
  v46.val[1] = 0;

  v7 = (int)*MEMORY[0x1E0D10F68];
  *(_DWORD *)((char *)&self->super.super.isa + v7) |= 0x8000u;
  objc_msgSend(v4, "itemParentGlobalID");
  v8 = (BRCItemGlobalID *)objc_claimAutoreleasedReturnValue();
  parentGlobalID = self->_parentGlobalID;
  self->_parentGlobalID = v8;

  objc_msgSend(v4, "orig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parentFileObjectID");
  v11 = (BRFileObjectID *)objc_claimAutoreleasedReturnValue();
  oldParentFileObjectID = self->_oldParentFileObjectID;
  self->_oldParentFileObjectID = v11;

  objc_msgSend(v4, "appLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appLibraryID");
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  aliasSourceAppLibraryID = self->_aliasSourceAppLibraryID;
  self->_aliasSourceAppLibraryID = v14;

  self->_isInDocumentScope = objc_msgSend(v4, "isInDocumentScope");
  objc_msgSend(v4, "parentClientZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dbRowID");
  v17 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v18 = (int)*MEMORY[0x1E0D10FA0];
  v19 = *(Class *)((char *)&self->super.super.isa + v18);
  *(Class *)((char *)&self->super.super.isa + v18) = v17;

  if (objc_msgSend(v4, "isDead"))
  {
    objc_msgSend(v4, "orig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fileObjectID");
    v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v22 = (int)*MEMORY[0x1E0D10F60];
    v23 = *(Class *)((char *)&self->super.super.isa + v22);
    *(Class *)((char *)&self->super.super.isa + v22) = v21;

    objc_msgSend(v4, "orig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "parentFileObjectID");
    v25 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v26 = (int)*MEMORY[0x1E0D10F90];
    v27 = *(Class *)((char *)&self->super.super.isa + v26);
    *(Class *)((char *)&self->super.super.isa + v26) = v25;

    v28 = (char *)self + v7;
    v29 = *(_DWORD *)((_BYTE *)&self->super.super.isa + v7) & 0xFFFFFFDF | ((unint64_t)*((unsigned __int8 *)&self->super.super.isa
                                                                                              + v7
                                                                                              + 4) << 32);
    *(_DWORD *)v28 = *(_DWORD *)((_BYTE *)&self->super.super.isa + v7) & 0xFFFFFFCF | 0x10;
    v28[4] = BYTE4(v29);
  }
  else
  {
    objc_msgSend(v4, "fileObjectID");
    v30 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v31 = (int)*MEMORY[0x1E0D10F60];
    v32 = *(Class *)((char *)&self->super.super.isa + v31);
    *(Class *)((char *)&self->super.super.isa + v31) = v30;

    objc_msgSend(v4, "parentFileObjectID");
    v33 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v34 = (int)*MEMORY[0x1E0D10F90];
    v35 = *(Class *)((char *)&self->super.super.isa + v34);
    *(Class *)((char *)&self->super.super.isa + v34) = v33;

    objc_msgSend(v4, "parentFileID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = fsgetpath(v53, 0x400uLL, &v46, objc_msgSend(v36, "unsignedLongLongValue"));

    if (v37 < 0)
    {
      v42 = (char *)self + v7;
      v43 = *(_DWORD *)((_BYTE *)&self->super.super.isa + v7) & 0xFFFFFFDF | ((unint64_t)*((unsigned __int8 *)&self->super.super.isa
                                                                                                + v7
                                                                                                + 4) << 32);
      *(_DWORD *)v42 = *(_DWORD *)((_BYTE *)&self->super.super.isa + v7) & 0xFFFFFFCF | 0x10;
      v42[4] = BYTE4(v43);
      brc_bread_crumbs();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v48 = self;
        v49 = 2112;
        v50 = v4;
        v51 = 2112;
        v52 = v44;
        _os_log_debug_impl(&dword_1CBD43000, v45, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: can't resolve the alias on disk for %@, marking it dead%@", buf, 0x20u);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", v53);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "st");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "filename");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringByAppendingPathComponent:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      -[BRCNotification setAttribute:forKey:](self, "setAttribute:forKey:", v41, *MEMORY[0x1E0D11118]);
    }
  }

}

- (BRCNotification)initWithAliasItem:(id)a3 itemDiffs:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BRCNotification *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  char *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  objc_super v28;

  v6 = a3;
  objc_msgSend(v6, "targetItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "targetClientZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "db");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemByItemID:db:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asShareableItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && (objc_msgSend(v11, "isDead") & 1) == 0 && !objc_msgSend(v11, "isReserved"))
    {
      v12 = -[BRCNotification initWithLocalItem:itemDiffs:](self, "initWithLocalItem:itemDiffs:", v11, a4);
      v13 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v11 = 0;
  }
  v28.receiver = self;
  v28.super_class = (Class)BRCNotification;
  v12 = -[BRCNotification init](&v28, sel_init);
  v13 = 1;
LABEL_8:
  objc_msgSend(v6, "st");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "parentID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isNonDesktopRoot");

  if (v16)
  {
    *(_DWORD *)((char *)&v12->super.super.isa + (int)*MEMORY[0x1E0D10F68]) |= 0x8000000u;
  }
  else if (!v12)
  {
    goto LABEL_14;
  }
  if (v13)
  {
    v17 = (char *)v12 + (int)*MEMORY[0x1E0D10F68];
    v18 = *(_DWORD *)v17 & 0xFFFFFFDF | ((unint64_t)v17[4] << 32);
    *(_DWORD *)v17 = *(_DWORD *)v17 & 0xFFFFFFCF | 0x10;
    v17[4] = BYTE4(v18);
    objc_msgSend(v6, "targetAppLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appLibraryID");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (int)*MEMORY[0x1E0D10F28];
    v22 = *(Class *)((char *)&v12->super.super.isa + v21);
    *(Class *)((char *)&v12->super.super.isa + v21) = (Class)v20;

    objc_msgSend(v6, "clientZone");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dbRowID");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (int)*MEMORY[0x1E0D10FD0];
    v26 = *(Class *)((char *)&v12->super.super.isa + v25);
    *(Class *)((char *)&v12->super.super.isa + v25) = (Class)v24;

  }
  -[BRCNotification _addAliasDecoration:](v12, "_addAliasDecoration:", v6);
LABEL_14:

  return v12;
}

+ (id)notificationWithAliasItem:(id)a3 targetItemNotification:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_msgSend(a4, "copy");
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "_addAliasDecoration:", v5);

  return v7;
}

- (void)initWithLocalItem:itemDiffs:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] item has both or neither a public and private share %@%@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)initWithLocalItem:itemDiffs:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: finderTags.tagsCount > 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithLocalItem:itemDiffs:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] Changing update for item %@ to be dead because the parent path can't be computed%@");
  OUTLINED_FUNCTION_2();
}

- (void)initWithLocalItem:itemDiffs:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _fileObjectID.type != BRFileObjectIDTypeDocument%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithLocalItem:itemDiffs:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: shareRoot%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithLocalItem:itemDiffs:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _logicalName != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithLocalItem:itemDiffs:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !item.isBRAlias%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)generateLogicalExtension:physicalExtension:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: physicalName.br_isSideFaultName%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)generateLogicalExtension:physicalExtension:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: logicalName%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
