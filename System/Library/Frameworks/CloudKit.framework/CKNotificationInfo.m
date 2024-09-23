@implementation CKNotificationInfo

+ (void)initialize
{
  objc_class *v2;
  uint64_t v3;

  v2 = (objc_class *)objc_opt_class();
  v3 = objc_opt_self();
  sub_18A5CEF4C(v3, v2, 0, 0, 0);
}

+ (id)notificationInfo
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (NSArray)alertLocalizationArgs
{
  CKNotificationInfo *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_alertLocalizationArgs;
  objc_sync_exit(v2);

  return v3;
}

- (void)setAlertLocalizationArgs:(NSArray *)alertLocalizationArgs
{
  CKNotificationInfo *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *v10;

  v10 = alertLocalizationArgs;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v4->_alertLocalizationArgs;
  v4->_alertLocalizationArgs = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (NSArray)titleLocalizationArgs
{
  CKNotificationInfo *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_titleLocalizationArgs;
  objc_sync_exit(v2);

  return v3;
}

- (void)setTitleLocalizationArgs:(NSArray *)titleLocalizationArgs
{
  CKNotificationInfo *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *v10;

  v10 = titleLocalizationArgs;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v4->_titleLocalizationArgs;
  v4->_titleLocalizationArgs = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (NSArray)subtitleLocalizationArgs
{
  CKNotificationInfo *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_subtitleLocalizationArgs;
  objc_sync_exit(v2);

  return v3;
}

- (void)setSubtitleLocalizationArgs:(NSArray *)subtitleLocalizationArgs
{
  CKNotificationInfo *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *v10;

  v10 = subtitleLocalizationArgs;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v4->_subtitleLocalizationArgs;
  v4->_subtitleLocalizationArgs = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (NSArray)desiredKeys
{
  CKNotificationInfo *v2;
  NSArray *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_desiredKeys;
  objc_sync_exit(v2);

  return v3;
}

- (void)setDesiredKeys:(NSArray *)desiredKeys
{
  CKNotificationInfo *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *v10;

  v10 = desiredKeys;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v4->_desiredKeys;
  v4->_desiredKeys = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (BOOL)isEqual:(id)a3
{
  CKNotificationInfo *v4;
  CKNotificationInfo *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  int v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  int v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  int v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  int v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  int v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  int v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  int v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  int v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  int shouldBadge;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  int shouldSendContentAvailable;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  int shouldSendMutableContent;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  int v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  char v161;

  v4 = (CKNotificationInfo *)a3;
  if (self == v4)
  {
    v161 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend_alertBody(self, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alertBody(v5, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CKObjectsAreBothNilOrEqual(v9, v13);

      if (!v14)
        goto LABEL_23;
      objc_msgSend_alertLocalizationKey(self, v15, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alertLocalizationKey(v5, v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CKObjectsAreBothNilOrEqual(v18, v22);

      if (!v23)
        goto LABEL_23;
      objc_msgSend_alertLocalizationArgs(self, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alertLocalizationArgs(v5, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CKObjectsAreBothNilOrEqual(v27, v31);

      if (!v32)
        goto LABEL_23;
      objc_msgSend_title(self, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_title(v5, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CKObjectsAreBothNilOrEqual(v36, v40);

      if (!v41)
        goto LABEL_23;
      objc_msgSend_titleLocalizationKey(self, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_titleLocalizationKey(v5, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CKObjectsAreBothNilOrEqual(v45, v49);

      if (!v50)
        goto LABEL_23;
      objc_msgSend_titleLocalizationArgs(self, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_titleLocalizationArgs(v5, v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = CKObjectsAreBothNilOrEqual(v54, v58);

      if (!v59)
        goto LABEL_23;
      objc_msgSend_subtitle(self, v60, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_subtitle(v5, v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CKObjectsAreBothNilOrEqual(v63, v67);

      if (!v68)
        goto LABEL_23;
      objc_msgSend_subtitleLocalizationKey(self, v69, v70, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_subtitleLocalizationKey(v5, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = CKObjectsAreBothNilOrEqual(v72, v76);

      if (!v77)
        goto LABEL_23;
      objc_msgSend_subtitleLocalizationArgs(self, v78, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_subtitleLocalizationArgs(v5, v82, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = CKObjectsAreBothNilOrEqual(v81, v85);

      if (!v86)
        goto LABEL_23;
      objc_msgSend_alertActionLocalizationKey(self, v87, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alertActionLocalizationKey(v5, v91, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = CKObjectsAreBothNilOrEqual(v90, v94);

      if (!v95)
        goto LABEL_23;
      objc_msgSend_alertLaunchImage(self, v96, v97, v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_alertLaunchImage(v5, v100, v101, v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = CKObjectsAreBothNilOrEqual(v99, v103);

      if (!v104)
        goto LABEL_23;
      objc_msgSend_soundName(self, v105, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_soundName(v5, v109, v110, v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = CKObjectsAreBothNilOrEqual(v108, v112);

      if (!v113)
        goto LABEL_23;
      objc_msgSend_desiredKeys(self, v114, v115, v116);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_desiredKeys(v5, v118, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = CKObjectsAreBothNilOrEqual(v117, v121);

      if (!v122)
        goto LABEL_23;
      shouldBadge = objc_msgSend_shouldBadge(self, v123, v124, v125);
      if (shouldBadge != objc_msgSend_shouldBadge(v5, v127, v128, v129))
        goto LABEL_23;
      shouldSendContentAvailable = objc_msgSend_shouldSendContentAvailable(self, v130, v131, v132);
      if (shouldSendContentAvailable != objc_msgSend_shouldSendContentAvailable(v5, v134, v135, v136))
        goto LABEL_23;
      shouldSendMutableContent = objc_msgSend_shouldSendMutableContent(self, v137, v138, v139);
      if (shouldSendMutableContent != objc_msgSend_shouldSendMutableContent(v5, v141, v142, v143))
        goto LABEL_23;
      objc_msgSend_category(self, v144, v145, v146);
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_category(v5, v148, v149, v150);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = CKObjectsAreBothNilOrEqual(v147, v151);

      if (v152)
      {
        objc_msgSend_collapseIDKey(self, v153, v154, v155);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_collapseIDKey(v5, v157, v158, v159);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = CKObjectsAreBothNilOrEqual(v156, v160);

      }
      else
      {
LABEL_23:
        v161 = 0;
      }

    }
    else
    {
      v161 = 0;
    }
  }

  return v161;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_alertBody(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKNotificationInfo *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSString *alertBody;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *alertLocalizationKey;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSArray *alertLocalizationArgs;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSString *title;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSString *titleLocalizationKey;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSArray *titleLocalizationArgs;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSString *subtitle;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSString *subtitleLocalizationKey;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  NSArray *subtitleLocalizationArgs;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  NSString *alertActionLocalizationKey;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSString *alertLaunchImage;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  NSString *soundName;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  NSString *category;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSArray *desiredKeys;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  NSString *collapseIDKey;

  v4 = objc_alloc_init(CKNotificationInfo);
  objc_msgSend_alertBody(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_copy(v8, v9, v10, v11);
  alertBody = v4->_alertBody;
  v4->_alertBody = (NSString *)v12;

  objc_msgSend_alertLocalizationKey(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_copy(v17, v18, v19, v20);
  alertLocalizationKey = v4->_alertLocalizationKey;
  v4->_alertLocalizationKey = (NSString *)v21;

  objc_msgSend_alertLocalizationArgs(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v26, v27, v28, v29);
  v30 = objc_claimAutoreleasedReturnValue();
  alertLocalizationArgs = v4->_alertLocalizationArgs;
  v4->_alertLocalizationArgs = (NSArray *)v30;

  objc_msgSend_title(self, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_copy(v35, v36, v37, v38);
  title = v4->_title;
  v4->_title = (NSString *)v39;

  objc_msgSend_titleLocalizationKey(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend_copy(v44, v45, v46, v47);
  titleLocalizationKey = v4->_titleLocalizationKey;
  v4->_titleLocalizationKey = (NSString *)v48;

  objc_msgSend_titleLocalizationArgs(self, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v53, v54, v55, v56);
  v57 = objc_claimAutoreleasedReturnValue();
  titleLocalizationArgs = v4->_titleLocalizationArgs;
  v4->_titleLocalizationArgs = (NSArray *)v57;

  objc_msgSend_subtitle(self, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend_copy(v62, v63, v64, v65);
  subtitle = v4->_subtitle;
  v4->_subtitle = (NSString *)v66;

  objc_msgSend_subtitleLocalizationKey(self, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend_copy(v71, v72, v73, v74);
  subtitleLocalizationKey = v4->_subtitleLocalizationKey;
  v4->_subtitleLocalizationKey = (NSString *)v75;

  objc_msgSend_subtitleLocalizationArgs(self, v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v80, v81, v82, v83);
  v84 = objc_claimAutoreleasedReturnValue();
  subtitleLocalizationArgs = v4->_subtitleLocalizationArgs;
  v4->_subtitleLocalizationArgs = (NSArray *)v84;

  objc_msgSend_alertActionLocalizationKey(self, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend_copy(v89, v90, v91, v92);
  alertActionLocalizationKey = v4->_alertActionLocalizationKey;
  v4->_alertActionLocalizationKey = (NSString *)v93;

  objc_msgSend_alertLaunchImage(self, v95, v96, v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend_copy(v98, v99, v100, v101);
  alertLaunchImage = v4->_alertLaunchImage;
  v4->_alertLaunchImage = (NSString *)v102;

  objc_msgSend_soundName(self, v104, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend_copy(v107, v108, v109, v110);
  soundName = v4->_soundName;
  v4->_soundName = (NSString *)v111;

  v4->_shouldBadge = objc_msgSend_shouldBadge(self, v113, v114, v115);
  v4->_shouldSendContentAvailable = objc_msgSend_shouldSendContentAvailable(self, v116, v117, v118);
  v4->_shouldSendMutableContent = objc_msgSend_shouldSendMutableContent(self, v119, v120, v121);
  objc_msgSend_category(self, v122, v123, v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend_copy(v125, v126, v127, v128);
  category = v4->_category;
  v4->_category = (NSString *)v129;

  objc_msgSend_desiredKeys(self, v131, v132, v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKDeepCopy(v134, v135, v136, v137);
  v138 = objc_claimAutoreleasedReturnValue();
  desiredKeys = v4->_desiredKeys;
  v4->_desiredKeys = (NSArray *)v138;

  objc_msgSend_collapseIDKey(self, v140, v141, v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = objc_msgSend_copy(v143, v144, v145, v146);
  collapseIDKey = v4->_collapseIDKey;
  v4->_collapseIDKey = (NSString *)v147;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t shouldBadge;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t shouldSendContentAvailable;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t shouldSendMutableContent;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  id v95;

  v95 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_alertBody(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v9, (uint64_t)v8, (uint64_t)CFSTR("alertString"));

  objc_msgSend_alertLocalizationKey(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v14, (uint64_t)v13, (uint64_t)CFSTR("localizedAlert"));

  objc_msgSend_alertLocalizationArgs(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v19, (uint64_t)v18, (uint64_t)CFSTR("localizedAlertArguments"));

  objc_msgSend_title(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v24, (uint64_t)v23, (uint64_t)CFSTR("title"));

  objc_msgSend_titleLocalizationKey(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v29, (uint64_t)v28, (uint64_t)CFSTR("localizedTitle"));

  objc_msgSend_titleLocalizationArgs(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v34, (uint64_t)v33, (uint64_t)CFSTR("localizedTitleArguments"));

  objc_msgSend_subtitle(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v39, (uint64_t)v38, (uint64_t)CFSTR("subtitle"));

  objc_msgSend_subtitleLocalizationKey(self, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v44, (uint64_t)v43, (uint64_t)CFSTR("localizedSubtitle"));

  objc_msgSend_subtitleLocalizationArgs(self, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v49, (uint64_t)v48, (uint64_t)CFSTR("localizedSubtitleArguments"));

  objc_msgSend_alertActionLocalizationKey(self, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v54, (uint64_t)v53, (uint64_t)CFSTR("localizedAlertAction"));

  objc_msgSend_alertLaunchImage(self, v55, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v59, (uint64_t)v58, (uint64_t)CFSTR("launchImage"));

  objc_msgSend_soundName(self, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v64, (uint64_t)v63, (uint64_t)CFSTR("soundName"));

  objc_msgSend_desiredKeys(self, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v69, (uint64_t)v68, (uint64_t)CFSTR("desiredKeys"));

  shouldBadge = objc_msgSend_shouldBadge(self, v70, v71, v72);
  objc_msgSend_encodeBool_forKey_(v95, v74, shouldBadge, (uint64_t)CFSTR("shouldBadge"));
  shouldSendContentAvailable = objc_msgSend_shouldSendContentAvailable(self, v75, v76, v77);
  objc_msgSend_encodeBool_forKey_(v95, v79, shouldSendContentAvailable, (uint64_t)CFSTR("shouldSendContentAvailable"));
  shouldSendMutableContent = objc_msgSend_shouldSendMutableContent(self, v80, v81, v82);
  objc_msgSend_encodeBool_forKey_(v95, v84, shouldSendMutableContent, (uint64_t)CFSTR("shouldSendMutableContent"));
  objc_msgSend_category(self, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v89, (uint64_t)v88, (uint64_t)CFSTR("category"));

  objc_msgSend_collapseIDKey(self, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v95, v94, (uint64_t)v93, (uint64_t)CFSTR("collapseID"));

  objc_autoreleasePoolPop(v4);
}

- (CKNotificationInfo)initWithCoder:(id)a3
{
  id v4;
  CKNotificationInfo *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *alertBody;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *alertLocalizationKey;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  NSArray *alertLocalizationArgs;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  NSString *title;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  NSString *titleLocalizationKey;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  NSArray *titleLocalizationArgs;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  NSString *subtitle;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  NSString *subtitleLocalizationKey;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  NSArray *subtitleLocalizationArgs;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  NSString *alertActionLocalizationKey;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  NSString *alertLaunchImage;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  NSString *soundName;
  void *v70;
  const char *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  NSArray *desiredKeys;
  const char *v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  NSString *category;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  NSString *collapseIDKey;
  objc_super v94;
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[3];

  v98[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v94.receiver = self;
  v94.super_class = (Class)CKNotificationInfo;
  v5 = -[CKNotificationInfo init](&v94, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("alertString"));
    v9 = objc_claimAutoreleasedReturnValue();
    alertBody = v5->_alertBody;
    v5->_alertBody = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("localizedAlert"));
    v13 = objc_claimAutoreleasedReturnValue();
    alertLocalizationKey = v5->_alertLocalizationKey;
    v5->_alertLocalizationKey = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v98[0] = objc_opt_class();
    v98[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v16, (uint64_t)v98, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v15, v18, (uint64_t)v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v21, (uint64_t)v20, (uint64_t)CFSTR("localizedAlertArguments"));
    v22 = objc_claimAutoreleasedReturnValue();
    alertLocalizationArgs = v5->_alertLocalizationArgs;
    v5->_alertLocalizationArgs = (NSArray *)v22;

    v24 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v24, (uint64_t)CFSTR("title"));
    v26 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v26;

    v28 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v29, v28, (uint64_t)CFSTR("localizedTitle"));
    v30 = objc_claimAutoreleasedReturnValue();
    titleLocalizationKey = v5->_titleLocalizationKey;
    v5->_titleLocalizationKey = (NSString *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v97[0] = objc_opt_class();
    v97[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v33, (uint64_t)v97, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v32, v35, (uint64_t)v34, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v38, (uint64_t)v37, (uint64_t)CFSTR("localizedTitleArguments"));
    v39 = objc_claimAutoreleasedReturnValue();
    titleLocalizationArgs = v5->_titleLocalizationArgs;
    v5->_titleLocalizationArgs = (NSArray *)v39;

    v41 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v42, v41, (uint64_t)CFSTR("subtitle"));
    v43 = objc_claimAutoreleasedReturnValue();
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v43;

    v45 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v46, v45, (uint64_t)CFSTR("localizedSubtitle"));
    v47 = objc_claimAutoreleasedReturnValue();
    subtitleLocalizationKey = v5->_subtitleLocalizationKey;
    v5->_subtitleLocalizationKey = (NSString *)v47;

    v49 = (void *)MEMORY[0x1E0C99E60];
    v96[0] = objc_opt_class();
    v96[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v50, (uint64_t)v96, 2);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v49, v52, (uint64_t)v51, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v55, (uint64_t)v54, (uint64_t)CFSTR("localizedSubtitleArguments"));
    v56 = objc_claimAutoreleasedReturnValue();
    subtitleLocalizationArgs = v5->_subtitleLocalizationArgs;
    v5->_subtitleLocalizationArgs = (NSArray *)v56;

    v58 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v59, v58, (uint64_t)CFSTR("localizedAlertAction"));
    v60 = objc_claimAutoreleasedReturnValue();
    alertActionLocalizationKey = v5->_alertActionLocalizationKey;
    v5->_alertActionLocalizationKey = (NSString *)v60;

    v62 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v63, v62, (uint64_t)CFSTR("launchImage"));
    v64 = objc_claimAutoreleasedReturnValue();
    alertLaunchImage = v5->_alertLaunchImage;
    v5->_alertLaunchImage = (NSString *)v64;

    v66 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, (uint64_t)CFSTR("soundName"));
    v68 = objc_claimAutoreleasedReturnValue();
    soundName = v5->_soundName;
    v5->_soundName = (NSString *)v68;

    v70 = (void *)MEMORY[0x1E0C99E60];
    v95[0] = objc_opt_class();
    v95[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v71, (uint64_t)v95, 2);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v70, v73, (uint64_t)v72, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v76, (uint64_t)v75, (uint64_t)CFSTR("desiredKeys"));
    v77 = objc_claimAutoreleasedReturnValue();
    desiredKeys = v5->_desiredKeys;
    v5->_desiredKeys = (NSArray *)v77;

    v5->_shouldBadge = objc_msgSend_decodeBoolForKey_(v4, v79, (uint64_t)CFSTR("shouldBadge"), v80);
    v5->_shouldSendContentAvailable = objc_msgSend_decodeBoolForKey_(v4, v81, (uint64_t)CFSTR("shouldSendContentAvailable"), v82);
    v5->_shouldSendMutableContent = objc_msgSend_decodeBoolForKey_(v4, v83, (uint64_t)CFSTR("shouldSendMutableContent"), v84);
    v85 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v86, v85, (uint64_t)CFSTR("category"));
    v87 = objc_claimAutoreleasedReturnValue();
    category = v5->_category;
    v5->_category = (NSString *)v87;

    v89 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v90, v89, (uint64_t)CFSTR("collapseID"));
    v91 = objc_claimAutoreleasedReturnValue();
    collapseIDKey = v5->_collapseIDKey;
    v5->_collapseIDKey = (NSString *)v91;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (id)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const __CFString *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const __CFString *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const __CFString *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
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

  v75 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_alertBody(self, a2, v2, v3);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_alertLocalizationKey(self, v5, v6, v7);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_alertLocalizationArgs(self, v8, v9, v10);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  CKStringWithArray(v78);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_title(self, v11, v12, v13);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_titleLocalizationKey(self, v14, v15, v16);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_titleLocalizationArgs(self, v17, v18, v19);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  CKStringWithArray(v77);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_subtitle(self, v20, v21, v22);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_subtitleLocalizationKey(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_subtitleLocalizationArgs(self, v27, v28, v29);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  CKStringWithArray(v74);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_alertActionLocalizationKey(self, v30, v31, v32);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_alertLaunchImage(self, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_soundName(self, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_desiredKeys(self, v41, v42, v43);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  CKStringWithArray(v70);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_shouldBadge(self, v45, v46, v47))
    v51 = CFSTR("true");
  else
    v51 = CFSTR("false");
  if (objc_msgSend_shouldSendContentAvailable(self, v48, v49, v50))
    v55 = CFSTR("true");
  else
    v55 = CFSTR("false");
  if (objc_msgSend_shouldSendMutableContent(self, v52, v53, v54))
    v59 = CFSTR("true");
  else
    v59 = CFSTR("false");
  objc_msgSend_category(self, v56, v57, v58);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_collapseIDKey(self, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v75, v65, (uint64_t)CFSTR("\talertBody -> %@\n\talertLocalizationKey -> \"%@\n\talertLocalizationArgs -> %@\n\ttitle -> %@\n\ttitleLocalizationKey -> \"%@\n\ttitleLocalizationArgs -> %@\n\tsubtitle -> %@\n\tsubtitleLocalizationKey -> \"%@\n\tsubtitleLocalizationArgs -> %@\n\talertActionLocalizationKey -> %@\n\talertLaunchImage -> %@\n\tsoundName -> %@\n\tdesiredKeys -> %@\n\tshouldBadge -> %@\n\tshouldSendContentAvailable -> %@\n\tshouldSendMutableContent -> %@\n\tcategory -> %@\n\tcollapseIDKey -> %@\n"), v66, v82, v81, v80, v73, v72, v79, v71, v26, v69, v68, v36, v40, v44, v51, v55,
    v59,
    v60,
    v64);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  return v76;
}

- (NSString)alertBody
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAlertBody:(NSString *)alertBody
{
  objc_setProperty_atomic_copy(self, a2, alertBody, 48);
}

- (NSString)alertLocalizationKey
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAlertLocalizationKey:(NSString *)alertLocalizationKey
{
  objc_setProperty_atomic_copy(self, a2, alertLocalizationKey, 56);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTitle:(NSString *)title
{
  objc_setProperty_atomic_copy(self, a2, title, 64);
}

- (NSString)titleLocalizationKey
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTitleLocalizationKey:(NSString *)titleLocalizationKey
{
  objc_setProperty_atomic_copy(self, a2, titleLocalizationKey, 72);
}

- (NSString)subtitle
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSubtitle:(NSString *)subtitle
{
  objc_setProperty_atomic_copy(self, a2, subtitle, 80);
}

- (NSString)subtitleLocalizationKey
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSubtitleLocalizationKey:(NSString *)subtitleLocalizationKey
{
  objc_setProperty_atomic_copy(self, a2, subtitleLocalizationKey, 88);
}

- (NSString)alertActionLocalizationKey
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAlertActionLocalizationKey:(NSString *)alertActionLocalizationKey
{
  objc_setProperty_atomic_copy(self, a2, alertActionLocalizationKey, 96);
}

- (NSString)alertLaunchImage
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAlertLaunchImage:(NSString *)alertLaunchImage
{
  objc_setProperty_atomic_copy(self, a2, alertLaunchImage, 104);
}

- (NSString)soundName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSoundName:(NSString *)soundName
{
  objc_setProperty_atomic_copy(self, a2, soundName, 112);
}

- (BOOL)shouldBadge
{
  return self->_shouldBadge;
}

- (void)setShouldBadge:(BOOL)shouldBadge
{
  self->_shouldBadge = shouldBadge;
}

- (BOOL)shouldSendContentAvailable
{
  return self->_shouldSendContentAvailable;
}

- (void)setShouldSendContentAvailable:(BOOL)shouldSendContentAvailable
{
  self->_shouldSendContentAvailable = shouldSendContentAvailable;
}

- (BOOL)shouldSendMutableContent
{
  return self->_shouldSendMutableContent;
}

- (void)setShouldSendMutableContent:(BOOL)shouldSendMutableContent
{
  self->_shouldSendMutableContent = shouldSendMutableContent;
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCategory:(NSString *)category
{
  objc_setProperty_atomic_copy(self, a2, category, 120);
}

- (NSString)collapseIDKey
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCollapseIDKey:(NSString *)collapseIDKey
{
  objc_setProperty_atomic_copy(self, a2, collapseIDKey, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collapseIDKey, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_soundName, 0);
  objc_storeStrong((id *)&self->_alertLaunchImage, 0);
  objc_storeStrong((id *)&self->_alertActionLocalizationKey, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_titleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_alertLocalizationKey, 0);
  objc_storeStrong((id *)&self->_alertBody, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizationArgs, 0);
  objc_storeStrong((id *)&self->_titleLocalizationArgs, 0);
  objc_storeStrong((id *)&self->_alertLocalizationArgs, 0);
}

@end
