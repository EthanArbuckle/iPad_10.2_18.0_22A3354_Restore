@implementation BCMutableAssetDetail

- (BCMutableAssetDetail)initWithAssetID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  objc_super v13;

  v4 = a3;
  if (!v4)
  {
    BDSCloudKitLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_227E5E744();

    v9 = 0;
    goto LABEL_7;
  }
  v13.receiver = self;
  v13.super_class = (Class)BCMutableAssetDetail;
  v9 = -[BCMutableCloudData init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend_copy(v4, v5, v6, v7, v8);
    self = (BCMutableAssetDetail *)*((_QWORD *)v9 + 12);
    *((_QWORD *)v9 + 12) = v10;
LABEL_7:

  }
  return (BCMutableAssetDetail *)v9;
}

- (BCMutableAssetDetail)initWithCloudData:(id)a3
{
  id v4;
  BCMutableAssetDetail *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *assetID;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSDate *dateFinished;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSDate *lastOpenDate;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  float v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  float v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSString *readingPositionCFIString;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSString *readingPositionAnnotationVersion;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  NSString *readingPositionAssetVersion;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSData *readingPositionUserData;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  NSString *readingPositionStorageUUID;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  NSDate *readingPositionLocationUpdateDate;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  NSDate *datePlaybackTimeUpdated;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  double v164;
  NSObject *v165;
  objc_super v167;

  v4 = a3;
  v167.receiver = self;
  v167.super_class = (Class)BCMutableAssetDetail;
  v5 = -[BCMutableCloudData initWithCloudData:](&v167, sel_initWithCloudData_, v4);
  if (v5)
  {
    BUProtocolCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v6;
    if (v6)
    {
      objc_msgSend_assetID(v6, v7, v8, v9, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend_copy(v12, v13, v14, v15, v16);
      assetID = v5->_assetID;
      v5->_assetID = (NSString *)v17;

      v5->_isFinished = objc_msgSend_isFinished(v11, v19, v20, v21, v22);
      v5->_notFinished = objc_msgSend_notFinished(v11, v23, v24, v25, v26);
      v5->_taste = objc_msgSend_taste(v11, v27, v28, v29, v30);
      v5->_tasteSyncedToStore = objc_msgSend_tasteSyncedToStore(v11, v31, v32, v33, v34);
      objc_msgSend_dateFinished(v11, v35, v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_copy(v39, v40, v41, v42, v43);
      dateFinished = v5->_dateFinished;
      v5->_dateFinished = (NSDate *)v44;

      v5->_finishedDateKind = objc_msgSend_finishedDateKind(v11, v46, v47, v48, v49);
      objc_msgSend_lastOpenDate(v11, v50, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend_copy(v54, v55, v56, v57, v58);
      lastOpenDate = v5->_lastOpenDate;
      v5->_lastOpenDate = (NSDate *)v59;

      objc_msgSend_readingProgress(v11, v61, v62, v63, v64);
      v5->_readingProgress = v65;
      objc_msgSend_readingProgressHighWaterMark(v11, v66, v67, v68, v69);
      v5->_readingProgressHighWaterMark = v70;
      objc_msgSend_readingPositionCFIString(v11, v71, v72, v73, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend_copy(v75, v76, v77, v78, v79);
      readingPositionCFIString = v5->_readingPositionCFIString;
      v5->_readingPositionCFIString = (NSString *)v80;

      objc_msgSend_readingPositionAnnotationVersion(v11, v82, v83, v84, v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = objc_msgSend_copy(v86, v87, v88, v89, v90);
      readingPositionAnnotationVersion = v5->_readingPositionAnnotationVersion;
      v5->_readingPositionAnnotationVersion = (NSString *)v91;

      objc_msgSend_readingPositionAssetVersion(v11, v93, v94, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend_copy(v97, v98, v99, v100, v101);
      readingPositionAssetVersion = v5->_readingPositionAssetVersion;
      v5->_readingPositionAssetVersion = (NSString *)v102;

      objc_msgSend_readingPositionUserData(v11, v104, v105, v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = objc_msgSend_copy(v108, v109, v110, v111, v112);
      readingPositionUserData = v5->_readingPositionUserData;
      v5->_readingPositionUserData = (NSData *)v113;

      v5->_readingPositionLocationRangeStart = objc_msgSend_readingPositionLocationRangeStart(v11, v115, v116, v117, v118);
      v5->_readingPositionLocationRangeEnd = objc_msgSend_readingPositionLocationRangeEnd(v11, v119, v120, v121, v122);
      v5->_readingPositionAbsolutePhysicalLocation = objc_msgSend_readingPositionAbsolutePhysicalLocation(v11, v123, v124, v125, v126);
      objc_msgSend_readingPositionStorageUUID(v11, v127, v128, v129, v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = objc_msgSend_copy(v131, v132, v133, v134, v135);
      readingPositionStorageUUID = v5->_readingPositionStorageUUID;
      v5->_readingPositionStorageUUID = (NSString *)v136;

      objc_msgSend_readingPositionLocationUpdateDate(v11, v138, v139, v140, v141);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = objc_msgSend_copy(v142, v143, v144, v145, v146);
      readingPositionLocationUpdateDate = v5->_readingPositionLocationUpdateDate;
      v5->_readingPositionLocationUpdateDate = (NSDate *)v147;

      objc_msgSend_datePlaybackTimeUpdated(v11, v149, v150, v151, v152);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = objc_msgSend_copy(v153, v154, v155, v156, v157);
      datePlaybackTimeUpdated = v5->_datePlaybackTimeUpdated;
      v5->_datePlaybackTimeUpdated = (NSDate *)v158;

      objc_msgSend_bookmarkTime(v11, v160, v161, v162, v163);
      v5->_bookmarkTime = v164;
    }
    else
    {
      BDSCloudKitLog();
      v165 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
        sub_227E5E5D8();

      v5 = 0;
    }

  }
  return v5;
}

- (BCMutableAssetDetail)initWithRecord:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  BCMutableAssetDetail *v8;
  uint64_t v9;
  NSString *assetID;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSDate *dateFinished;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSDate *lastOpenDate;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  float v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  float v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSString *readingPositionCFIString;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSData *readingPositionUserData;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  NSString *readingPositionStorageUUID;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  NSDate *readingPositionLocationUpdateDate;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  NSDate *datePlaybackTimeUpdated;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  double v137;
  void *v139;
  void *v140;
  void *v141;
  objc_super v142;

  v4 = a3;
  if (!v4)
  {
    BDSCloudKitLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_227E5E770();
    v8 = 0;
    goto LABEL_7;
  }
  v142.receiver = self;
  v142.super_class = (Class)BCMutableAssetDetail;
  v8 = -[BCMutableCloudData initWithRecord:](&v142, sel_initWithRecord_, v4);
  if (v8)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v5, (uint64_t)v4, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    assetID = v8->_assetID;
    v8->_assetID = (NSString *)v9;

    objc_msgSend_objectForKey_(v4, v11, (uint64_t)CFSTR("isFinished"), v12, v13);
    self = (BCMutableAssetDetail *)objc_claimAutoreleasedReturnValue();
    v8->_isFinished = objc_msgSend_BOOLValue(self, v14, v15, v16, v17);
    objc_msgSend_objectForKey_(v4, v18, (uint64_t)CFSTR("notFinished"), v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v8->_notFinished = objc_msgSend_BOOLValue(v21, v22, v23, v24, v25);
    objc_msgSend_objectForKey_(v4, v26, (uint64_t)CFSTR("taste"), v27, v28);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_taste = objc_msgSend_integerValue(v141, v29, v30, v31, v32);
    objc_msgSend_objectForKey_(v4, v33, (uint64_t)CFSTR("tasteSyncedToStore"), v34, v35);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_tasteSyncedToStore = objc_msgSend_integerValue(v140, v36, v37, v38, v39);
    objc_msgSend_objectForKey_(v4, v40, (uint64_t)CFSTR("dateFinished"), v41, v42);
    v43 = objc_claimAutoreleasedReturnValue();
    dateFinished = v8->_dateFinished;
    v8->_dateFinished = (NSDate *)v43;

    objc_msgSend_encryptedValues(v4, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v49, v50, (uint64_t)CFSTR("finishedDateKind"), v51, v52);
    v139 = (void *)objc_claimAutoreleasedReturnValue();

    v8->_finishedDateKind = objc_msgSend_integerValue(v139, v53, v54, v55, v56);
    objc_msgSend_objectForKey_(v4, v57, (uint64_t)CFSTR("lastOpenDate"), v58, v59);
    v60 = objc_claimAutoreleasedReturnValue();
    lastOpenDate = v8->_lastOpenDate;
    v8->_lastOpenDate = (NSDate *)v60;

    objc_msgSend_objectForKey_(v4, v62, (uint64_t)CFSTR("readingProgress"), v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v65, v66, v67, v68, v69);
    v8->_readingProgress = v70;
    objc_msgSend_objectForKey_(v4, v71, (uint64_t)CFSTR("readingProgressHighWaterMark"), v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v74, v75, v76, v77, v78);
    v8->_readingProgressHighWaterMark = v79;
    objc_msgSend_objectForKey_(v4, v80, (uint64_t)CFSTR("readingPositionCFIString"), v81, v82);
    v83 = objc_claimAutoreleasedReturnValue();
    readingPositionCFIString = v8->_readingPositionCFIString;
    v8->_readingPositionCFIString = (NSString *)v83;

    objc_msgSend_objectForKey_(v4, v85, (uint64_t)CFSTR("readingPositionUserData"), v86, v87);
    v88 = objc_claimAutoreleasedReturnValue();
    readingPositionUserData = v8->_readingPositionUserData;
    v8->_readingPositionUserData = (NSData *)v88;

    objc_msgSend_objectForKey_(v4, v90, (uint64_t)CFSTR("readingPositionLocationRangeStart"), v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_readingPositionLocationRangeStart = objc_msgSend_intValue(v93, v94, v95, v96, v97);
    objc_msgSend_objectForKey_(v4, v98, (uint64_t)CFSTR("readingPositionLocationRangeEnd"), v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_readingPositionLocationRangeEnd = objc_msgSend_intValue(v101, v102, v103, v104, v105);
    objc_msgSend_objectForKey_(v4, v106, (uint64_t)CFSTR("readingPositionAbsolutePhysicalLocation"), v107, v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_readingPositionAbsolutePhysicalLocation = objc_msgSend_intValue(v109, v110, v111, v112, v113);
    objc_msgSend_objectForKey_(v4, v114, (uint64_t)CFSTR("readingPositionStorageUUID"), v115, v116);
    v117 = objc_claimAutoreleasedReturnValue();
    readingPositionStorageUUID = v8->_readingPositionStorageUUID;
    v8->_readingPositionStorageUUID = (NSString *)v117;

    objc_msgSend_objectForKey_(v4, v119, (uint64_t)CFSTR("readingPositionLocationUpdateDate"), v120, v121);
    v122 = objc_claimAutoreleasedReturnValue();
    readingPositionLocationUpdateDate = v8->_readingPositionLocationUpdateDate;
    v8->_readingPositionLocationUpdateDate = (NSDate *)v122;

    objc_msgSend_objectForKey_(v4, v124, (uint64_t)CFSTR("datePlaybackTimeUpdated"), v125, v126);
    v127 = objc_claimAutoreleasedReturnValue();
    datePlaybackTimeUpdated = v8->_datePlaybackTimeUpdated;
    v8->_datePlaybackTimeUpdated = (NSDate *)v127;

    objc_msgSend_objectForKey_(v4, v129, (uint64_t)CFSTR("bookmarkTime"), v130, v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v132, v133, v134, v135, v136);
    v8->_bookmarkTime = v137;

LABEL_7:
  }

  return v8;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  float v46;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v106;
  void *v107;
  int v108;
  int v109;
  void *v110;
  int v111;
  void *v112;
  const __CFString *v113;
  const __CFString *v114;
  void *v115;
  void *v116;

  v116 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_assetID(self, a2, v2, v3, v4);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isFinished(self, v6, v7, v8, v9))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v114 = v14;
  if (objc_msgSend_notFinished(self, v10, v11, v12, v13))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v113 = v19;
  objc_msgSend_dateFinished(self, v15, v16, v17, v18);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend_finishedDateKind(self, v20, v21, v22, v23);
  objc_msgSend_lastOpenDate(self, v24, v25, v26, v27);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend_taste(self, v28, v29, v30, v31);
  v108 = objc_msgSend_tasteSyncedToStore(self, v32, v33, v34, v35);
  objc_msgSend_readingProgress(self, v36, v37, v38, v39);
  v41 = v40;
  objc_msgSend_readingProgressHighWaterMark(self, v42, v43, v44, v45);
  v47 = v46;
  objc_msgSend_readingPositionCFIString(self, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingPositionAnnotationVersion(self, v53, v54, v55, v56);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingPositionAssetVersion(self, v57, v58, v59, v60);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingPositionUserData(self, v61, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend_readingPositionLocationRangeStart(self, v66, v67, v68, v69);
  v75 = objc_msgSend_readingPositionLocationRangeEnd(self, v71, v72, v73, v74);
  v80 = objc_msgSend_readingPositionAbsolutePhysicalLocation(self, v76, v77, v78, v79);
  objc_msgSend_readingPositionStorageUUID(self, v81, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readingPositionLocationUpdateDate(self, v86, v87, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_datePlaybackTimeUpdated(self, v91, v92, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bookmarkTime(self, v96, v97, v98, v99);
  objc_msgSend_stringWithFormat_(v116, v100, (uint64_t)CFSTR("BCMutableAssetDetail assetID: %@\n  (isFinished: %@, notFinished: %@, dateFinished: %@, finishedDateKind: %d, lastOpenDate: %@)  (taste: %x, tasteSyncedToStore: %d)  readingPosition=(\n    readingProgress:%.2f\n    readingProgressHighWaterMark:%.2f\n    cfi:%@\n    annotationVersion=%@\n    assetVersion=%@\n    userData=%@\n    locationRangeStart=%d    locationRangeEnd=%d    absolutePhysicalLocation=%d    storageUUID=%@\n    locationUpdateDate=%@)\n  playbackPosition=(\n    datePlaybackTimeUpdated=%@\n    bookmarkTime = %.2f)"), v101, v102, v115, v114, v113, v112, v111, v110, v109, v108, *(_QWORD *)&v41, *(_QWORD *)&v47, v52, v107, v106, v65,
    v70,
    v75,
    v80,
    v85,
    v90,
    v95,
    v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v104;
}

- (id)recordType
{
  return CFSTR("assetDetail");
}

- (id)zoneName
{
  return CFSTR("AssetZone");
}

- (void)setReadingProgressHighWaterMark:(float)a3
{
  float readingProgressHighWaterMark;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  int v13;
  void *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  readingProgressHighWaterMark = self->_readingProgressHighWaterMark;
  if (readingProgressHighWaterMark >= a3)
  {
    if (readingProgressHighWaterMark > a3)
    {
      BDSCloudKitLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_assetID(self, v7, v8, v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = self->_readingProgressHighWaterMark;
        v13 = 138412802;
        v14 = v11;
        v15 = 2048;
        v16 = v12;
        v17 = 2048;
        v18 = a3;
        _os_log_impl(&dword_227D4F000, v6, OS_LOG_TYPE_INFO, "BCMutableAssetDetail %@ attempt to move readingProgressHighWaterMark backwards from %f to %f", (uint8_t *)&v13, 0x20u);

      }
    }
  }
  else
  {
    self->_readingProgressHighWaterMark = a3;
  }
}

- (id)configuredRecordFromAttributes
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t isFinished;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  objc_super v201;

  v201.receiver = self;
  v201.super_class = (Class)BCMutableAssetDetail;
  -[BCMutableCloudData configuredRecordFromAttributes](&v201, sel_configuredRecordFromAttributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  isFinished = objc_msgSend_isFinished(self, v5, v6, v7, v8);
  objc_msgSend_numberWithBool_(v4, v10, isFinished, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("isFinished"), v15);

  v16 = (void *)MEMORY[0x24BDD16E0];
  v21 = objc_msgSend_notFinished(self, v17, v18, v19, v20);
  objc_msgSend_numberWithBool_(v16, v22, v21, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v26, (uint64_t)v25, (uint64_t)CFSTR("notFinished"), v27);

  v28 = (void *)MEMORY[0x24BDD16E0];
  v33 = objc_msgSend_taste(self, v29, v30, v31, v32);
  objc_msgSend_numberWithShort_(v28, v34, v33, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v38, (uint64_t)v37, (uint64_t)CFSTR("taste"), v39);

  v40 = (void *)MEMORY[0x24BDD16E0];
  v45 = objc_msgSend_tasteSyncedToStore(self, v41, v42, v43, v44);
  objc_msgSend_numberWithShort_(v40, v46, v45, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v50, (uint64_t)v49, (uint64_t)CFSTR("tasteSyncedToStore"), v51);

  objc_msgSend_lastOpenDate(self, v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v57, (uint64_t)v56, (uint64_t)CFSTR("lastOpenDate"), v58);

  objc_msgSend_dateFinished(self, v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v64, (uint64_t)v63, (uint64_t)CFSTR("dateFinished"), v65);

  if (_os_feature_enabled_impl())
  {
    v70 = (void *)MEMORY[0x24BDD16E0];
    v71 = objc_msgSend_finishedDateKind(self, v66, v67, v68, v69);
    objc_msgSend_numberWithShort_(v70, v72, v71, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encryptedValues(v3, v76, v77, v78, v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v80, v81, (uint64_t)v75, (uint64_t)CFSTR("finishedDateKind"), v82);

  }
  v83 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_readingProgress(self, v66, v67, v68, v69);
  objc_msgSend_numberWithFloat_(v83, v84, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v89, (uint64_t)v88, (uint64_t)CFSTR("readingProgress"), v90);

  v91 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_readingProgressHighWaterMark(self, v92, v93, v94, v95);
  objc_msgSend_numberWithFloat_(v91, v96, v97, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v101, (uint64_t)v100, (uint64_t)CFSTR("readingProgressHighWaterMark"), v102);

  objc_msgSend_readingPositionCFIString(self, v103, v104, v105, v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v108, (uint64_t)v107, (uint64_t)CFSTR("readingPositionCFIString"), v109);

  objc_msgSend_readingPositionAnnotationVersion(self, v110, v111, v112, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v115, (uint64_t)v114, (uint64_t)CFSTR("readingPositionAnnotationVersion"), v116);

  objc_msgSend_readingPositionAssetVersion(self, v117, v118, v119, v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v122, (uint64_t)v121, (uint64_t)CFSTR("readingPositionAssetVersion"), v123);

  objc_msgSend_readingPositionUserData(self, v124, v125, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v129, (uint64_t)v128, (uint64_t)CFSTR("readingPositionUserData"), v130);

  v131 = (void *)MEMORY[0x24BDD16E0];
  v136 = objc_msgSend_readingPositionLocationRangeStart(self, v132, v133, v134, v135);
  objc_msgSend_numberWithInt_(v131, v137, v136, v138, v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v141, (uint64_t)v140, (uint64_t)CFSTR("readingPositionLocationRangeStart"), v142);

  v143 = (void *)MEMORY[0x24BDD16E0];
  v148 = objc_msgSend_readingPositionLocationRangeEnd(self, v144, v145, v146, v147);
  objc_msgSend_numberWithInt_(v143, v149, v148, v150, v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v153, (uint64_t)v152, (uint64_t)CFSTR("readingPositionLocationRangeEnd"), v154);

  v155 = (void *)MEMORY[0x24BDD16E0];
  v160 = objc_msgSend_readingPositionAbsolutePhysicalLocation(self, v156, v157, v158, v159);
  objc_msgSend_numberWithInt_(v155, v161, v160, v162, v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v165, (uint64_t)v164, (uint64_t)CFSTR("readingPositionAbsolutePhysicalLocation"), v166);

  objc_msgSend_readingPositionStorageUUID(self, v167, v168, v169, v170);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v172, (uint64_t)v171, (uint64_t)CFSTR("readingPositionStorageUUID"), v173);

  objc_msgSend_readingPositionLocationUpdateDate(self, v174, v175, v176, v177);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v179, (uint64_t)v178, (uint64_t)CFSTR("readingPositionLocationUpdateDate"), v180);

  objc_msgSend_datePlaybackTimeUpdated(self, v181, v182, v183, v184);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v186, (uint64_t)v185, (uint64_t)CFSTR("datePlaybackTimeUpdated"), v187);

  v188 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_bookmarkTime(self, v189, v190, v191, v192);
  objc_msgSend_numberWithDouble_(v188, v193, v194, v195, v196);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v3, v198, (uint64_t)v197, (uint64_t)CFSTR("bookmarkTime"), v199);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t isFinished;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  float v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  float v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  objc_super v147;

  v147.receiver = self;
  v147.super_class = (Class)BCMutableAssetDetail;
  v4 = a3;
  -[BCMutableCloudData encodeWithCoder:](&v147, sel_encodeWithCoder_, v4);
  isFinished = objc_msgSend_isFinished(self, v5, v6, v7, v8, v147.receiver, v147.super_class);
  objc_msgSend_encodeBool_forKey_(v4, v10, isFinished, (uint64_t)CFSTR("isFinished"), v11);
  v16 = objc_msgSend_notFinished(self, v12, v13, v14, v15);
  objc_msgSend_encodeBool_forKey_(v4, v17, v16, (uint64_t)CFSTR("notFinished"), v18);
  v23 = objc_msgSend_taste(self, v19, v20, v21, v22);
  objc_msgSend_encodeInt32_forKey_(v4, v24, v23, (uint64_t)CFSTR("taste"), v25);
  v30 = objc_msgSend_tasteSyncedToStore(self, v26, v27, v28, v29);
  objc_msgSend_encodeInt32_forKey_(v4, v31, v30, (uint64_t)CFSTR("tasteSyncedToStore"), v32);
  objc_msgSend_dateFinished(self, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v38, (uint64_t)v37, (uint64_t)CFSTR("dateFinished"), v39);

  v44 = objc_msgSend_finishedDateKind(self, v40, v41, v42, v43);
  objc_msgSend_encodeInt32_forKey_(v4, v45, v44, (uint64_t)CFSTR("finishedDateKind"), v46);
  objc_msgSend_lastOpenDate(self, v47, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v52, (uint64_t)v51, (uint64_t)CFSTR("lastOpenDate"), v53);

  objc_msgSend_readingProgress(self, v54, v55, v56, v57);
  objc_msgSend_encodeDouble_forKey_(v4, v59, (uint64_t)CFSTR("readingProgress"), v60, v61, v58);
  objc_msgSend_readingProgressHighWaterMark(self, v62, v63, v64, v65);
  objc_msgSend_encodeDouble_forKey_(v4, v67, (uint64_t)CFSTR("readingProgressHighWaterMark"), v68, v69, v66);
  objc_msgSend_readingPositionCFIString(self, v70, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v75, (uint64_t)v74, (uint64_t)CFSTR("readingPositionCFIString"), v76);

  objc_msgSend_readingPositionAnnotationVersion(self, v77, v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v82, (uint64_t)v81, (uint64_t)CFSTR("readingPositionAnnotationVersion"), v83);

  objc_msgSend_readingPositionAssetVersion(self, v84, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v89, (uint64_t)v88, (uint64_t)CFSTR("readingPositionAssetVersion"), v90);

  objc_msgSend_readingPositionUserData(self, v91, v92, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v96, (uint64_t)v95, (uint64_t)CFSTR("readingPositionUserData"), v97);

  v102 = objc_msgSend_readingPositionLocationRangeStart(self, v98, v99, v100, v101);
  objc_msgSend_encodeInt32_forKey_(v4, v103, v102, (uint64_t)CFSTR("readingPositionLocationRangeStart"), v104);
  v109 = objc_msgSend_readingPositionLocationRangeEnd(self, v105, v106, v107, v108);
  objc_msgSend_encodeInt32_forKey_(v4, v110, v109, (uint64_t)CFSTR("readingPositionLocationRangeEnd"), v111);
  v116 = objc_msgSend_readingPositionAbsolutePhysicalLocation(self, v112, v113, v114, v115);
  objc_msgSend_encodeInt32_forKey_(v4, v117, v116, (uint64_t)CFSTR("readingPositionAbsolutePhysicalLocation"), v118);
  objc_msgSend_readingPositionStorageUUID(self, v119, v120, v121, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v124, (uint64_t)v123, (uint64_t)CFSTR("readingPositionStorageUUID"), v125);

  objc_msgSend_readingPositionLocationUpdateDate(self, v126, v127, v128, v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v131, (uint64_t)v130, (uint64_t)CFSTR("readingPositionLocationUpdateDate"), v132);

  objc_msgSend_datePlaybackTimeUpdated(self, v133, v134, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v138, (uint64_t)v137, (uint64_t)CFSTR("datePlaybackTimeUpdated"), v139);

  objc_msgSend_bookmarkTime(self, v140, v141, v142, v143);
  objc_msgSend_encodeDouble_forKey_(v4, v144, (uint64_t)CFSTR("bookmarkTime"), v145, v146);

}

- (BCMutableAssetDetail)initWithCoder:(id)a3
{
  id v4;
  BCMutableAssetDetail *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BCMutableAssetDetail *v10;
  uint64_t v11;
  NSString *assetID;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSDate *dateFinished;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSDate *lastOpenDate;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  NSString *readingPositionCFIString;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  NSString *readingPositionAnnotationVersion;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  NSString *readingPositionAssetVersion;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  NSData *readingPositionUserData;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  NSString *readingPositionStorageUUID;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  NSDate *readingPositionLocationUpdateDate;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  NSDate *datePlaybackTimeUpdated;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  objc_super v95;

  v4 = a3;
  v95.receiver = self;
  v95.super_class = (Class)BCMutableAssetDetail;
  v5 = -[BCMutableCloudData initWithCoder:](&v95, sel_initWithCoder_, v4);
  v10 = v5;
  if (v5)
  {
    objc_msgSend_localRecordID(v5, v6, v7, v8, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    assetID = v10->_assetID;
    v10->_assetID = (NSString *)v11;

    v10->_isFinished = objc_msgSend_decodeBoolForKey_(v4, v13, (uint64_t)CFSTR("isFinished"), v14, v15);
    v10->_notFinished = objc_msgSend_decodeBoolForKey_(v4, v16, (uint64_t)CFSTR("notFinished"), v17, v18);
    v10->_taste = objc_msgSend_decodeInt32ForKey_(v4, v19, (uint64_t)CFSTR("taste"), v20, v21);
    v10->_tasteSyncedToStore = objc_msgSend_decodeInt32ForKey_(v4, v22, (uint64_t)CFSTR("tasteSyncedToStore"), v23, v24);
    v25 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, (uint64_t)CFSTR("dateFinished"), v27);
    v28 = objc_claimAutoreleasedReturnValue();
    dateFinished = v10->_dateFinished;
    v10->_dateFinished = (NSDate *)v28;

    v10->_finishedDateKind = objc_msgSend_decodeInt32ForKey_(v4, v30, (uint64_t)CFSTR("finishedDateKind"), v31, v32);
    v33 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v33, (uint64_t)CFSTR("lastOpenDate"), v35);
    v36 = objc_claimAutoreleasedReturnValue();
    lastOpenDate = v10->_lastOpenDate;
    v10->_lastOpenDate = (NSDate *)v36;

    objc_msgSend_decodeDoubleForKey_(v4, v38, (uint64_t)CFSTR("readingProgress"), v39, v40);
    *(float *)&v41 = v41;
    v10->_readingProgress = *(float *)&v41;
    objc_msgSend_decodeDoubleForKey_(v4, v42, (uint64_t)CFSTR("readingProgressHighWaterMark"), v43, v44);
    *(float *)&v45 = v45;
    v10->_readingProgressHighWaterMark = *(float *)&v45;
    v46 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, (uint64_t)CFSTR("readingPositionCFIString"), v48);
    v49 = objc_claimAutoreleasedReturnValue();
    readingPositionCFIString = v10->_readingPositionCFIString;
    v10->_readingPositionCFIString = (NSString *)v49;

    v51 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v52, v51, (uint64_t)CFSTR("readingPositionAnnotationVersion"), v53);
    v54 = objc_claimAutoreleasedReturnValue();
    readingPositionAnnotationVersion = v10->_readingPositionAnnotationVersion;
    v10->_readingPositionAnnotationVersion = (NSString *)v54;

    v56 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v57, v56, (uint64_t)CFSTR("readingPositionAssetVersion"), v58);
    v59 = objc_claimAutoreleasedReturnValue();
    readingPositionAssetVersion = v10->_readingPositionAssetVersion;
    v10->_readingPositionAssetVersion = (NSString *)v59;

    v61 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v62, v61, (uint64_t)CFSTR("readingPositionUserData"), v63);
    v64 = objc_claimAutoreleasedReturnValue();
    readingPositionUserData = v10->_readingPositionUserData;
    v10->_readingPositionUserData = (NSData *)v64;

    v10->_readingPositionLocationRangeStart = objc_msgSend_decodeInt32ForKey_(v4, v66, (uint64_t)CFSTR("readingPositionLocationRangeStart"), v67, v68);
    v10->_readingPositionLocationRangeEnd = objc_msgSend_decodeInt32ForKey_(v4, v69, (uint64_t)CFSTR("readingPositionLocationRangeEnd"), v70, v71);
    v10->_readingPositionAbsolutePhysicalLocation = objc_msgSend_decodeInt32ForKey_(v4, v72, (uint64_t)CFSTR("readingPositionAbsolutePhysicalLocation"), v73, v74);
    v75 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v76, v75, (uint64_t)CFSTR("readingPositionStorageUUID"), v77);
    v78 = objc_claimAutoreleasedReturnValue();
    readingPositionStorageUUID = v10->_readingPositionStorageUUID;
    v10->_readingPositionStorageUUID = (NSString *)v78;

    v80 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v81, v80, (uint64_t)CFSTR("readingPositionLocationUpdateDate"), v82);
    v83 = objc_claimAutoreleasedReturnValue();
    readingPositionLocationUpdateDate = v10->_readingPositionLocationUpdateDate;
    v10->_readingPositionLocationUpdateDate = (NSDate *)v83;

    v85 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v86, v85, (uint64_t)CFSTR("datePlaybackTimeUpdated"), v87);
    v88 = objc_claimAutoreleasedReturnValue();
    datePlaybackTimeUpdated = v10->_datePlaybackTimeUpdated;
    v10->_datePlaybackTimeUpdated = (NSDate *)v88;

    objc_msgSend_decodeDoubleForKey_(v4, v90, (uint64_t)CFSTR("bookmarkTime"), v91, v92);
    v10->_bookmarkTime = v93;
  }

  return v10;
}

- (BOOL)isAudiobook
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  objc_msgSend_datePlaybackTimeUpdated(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (BOOL)notFinished
{
  return self->_notFinished;
}

- (void)setNotFinished:(BOOL)a3
{
  self->_notFinished = a3;
}

- (signed)taste
{
  return self->_taste;
}

- (void)setTaste:(signed __int16)a3
{
  self->_taste = a3;
}

- (signed)tasteSyncedToStore
{
  return self->_tasteSyncedToStore;
}

- (void)setTasteSyncedToStore:(signed __int16)a3
{
  self->_tasteSyncedToStore = a3;
}

- (NSDate)dateFinished
{
  return self->_dateFinished;
}

- (void)setDateFinished:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (signed)finishedDateKind
{
  return self->_finishedDateKind;
}

- (void)setFinishedDateKind:(signed __int16)a3
{
  self->_finishedDateKind = a3;
}

- (NSDate)lastOpenDate
{
  return self->_lastOpenDate;
}

- (void)setLastOpenDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (float)readingProgress
{
  return self->_readingProgress;
}

- (void)setReadingProgress:(float)a3
{
  self->_readingProgress = a3;
}

- (float)readingProgressHighWaterMark
{
  return self->_readingProgressHighWaterMark;
}

- (NSString)readingPositionCFIString
{
  return self->_readingPositionCFIString;
}

- (void)setReadingPositionCFIString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)readingPositionAnnotationVersion
{
  return self->_readingPositionAnnotationVersion;
}

- (void)setReadingPositionAnnotationVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)readingPositionAssetVersion
{
  return self->_readingPositionAssetVersion;
}

- (void)setReadingPositionAssetVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSData)readingPositionUserData
{
  return self->_readingPositionUserData;
}

- (void)setReadingPositionUserData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int)readingPositionLocationRangeStart
{
  return self->_readingPositionLocationRangeStart;
}

- (void)setReadingPositionLocationRangeStart:(int)a3
{
  self->_readingPositionLocationRangeStart = a3;
}

- (int)readingPositionLocationRangeEnd
{
  return self->_readingPositionLocationRangeEnd;
}

- (void)setReadingPositionLocationRangeEnd:(int)a3
{
  self->_readingPositionLocationRangeEnd = a3;
}

- (int)readingPositionAbsolutePhysicalLocation
{
  return self->_readingPositionAbsolutePhysicalLocation;
}

- (void)setReadingPositionAbsolutePhysicalLocation:(int)a3
{
  self->_readingPositionAbsolutePhysicalLocation = a3;
}

- (NSString)readingPositionStorageUUID
{
  return self->_readingPositionStorageUUID;
}

- (void)setReadingPositionStorageUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSDate)datePlaybackTimeUpdated
{
  return self->_datePlaybackTimeUpdated;
}

- (void)setDatePlaybackTimeUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (double)bookmarkTime
{
  return self->_bookmarkTime;
}

- (void)setBookmarkTime:(double)a3
{
  self->_bookmarkTime = a3;
}

- (NSDate)readingPositionLocationUpdateDate
{
  return self->_readingPositionLocationUpdateDate;
}

- (void)setReadingPositionLocationUpdateDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingPositionLocationUpdateDate, 0);
  objc_storeStrong((id *)&self->_datePlaybackTimeUpdated, 0);
  objc_storeStrong((id *)&self->_readingPositionStorageUUID, 0);
  objc_storeStrong((id *)&self->_readingPositionUserData, 0);
  objc_storeStrong((id *)&self->_readingPositionAssetVersion, 0);
  objc_storeStrong((id *)&self->_readingPositionAnnotationVersion, 0);
  objc_storeStrong((id *)&self->_readingPositionCFIString, 0);
  objc_storeStrong((id *)&self->_lastOpenDate, 0);
  objc_storeStrong((id *)&self->_dateFinished, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
