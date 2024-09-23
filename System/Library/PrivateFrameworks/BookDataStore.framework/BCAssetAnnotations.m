@implementation BCAssetAnnotations

- (id)mutableCopy
{
  BCMutableAssetAnnotations *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = [BCMutableAssetAnnotations alloc];
  return (id)MEMORY[0x24BEDD108](v3, sel_initWithCloudData_, self, v4, v5);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v5 = a4;
  BUProtocolCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend__configureFromAssetAnnotations_withMergers_(self, v6, (uint64_t)v8, (uint64_t)v5, v7);
  }
  else
  {
    BDSCloudKitLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_227E5B7AC();

  }
}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char isEqualToString;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v50;

  v4 = a4;
  v6 = a3;
  BUProtocolCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v50.receiver = self;
  v50.super_class = (Class)BCAssetAnnotations;
  LOBYTE(v4) = -[BCCloudData isEqualExceptForDate:ignoringEmptySalt:](&v50, sel_isEqualExceptForDate_ignoringEmptySalt_, v6, v4);

  objc_msgSend_assetID(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetID(v7, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v12, v18, (uint64_t)v17, v19, v20);

  objc_msgSend_assetVersion(self, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetVersion(v7, v27, v28, v29, v30);
  v31 = objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_isEqualToString_(v26, v32, v31, v33, v34);

  objc_msgSend_bookAnnotations(self, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bookAnnotations(v7, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v31) = objc_msgSend_isEqual_(v40, v46, (uint64_t)v45, v47, v48);

  return v4 & isEqualToString & v35 & v31;
}

- (void)_configureFromAssetAnnotations:(id)a3 withMergers:(id)a4
{
  id v6;
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
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  objc_super v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v55.receiver = self;
  v55.super_class = (Class)BCAssetAnnotations;
  -[BCCloudData configureFromCloudData:withMergers:](&v55, sel_configureFromCloudData_withMergers_, v6, a4);
  objc_msgSend_assetID(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentString_forKey_(self, v12, (uint64_t)v11, (uint64_t)CFSTR("assetID"), v13);

  objc_msgSend_assetID(v6, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetVersion(v6, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bookAnnotations(v6, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mergeInAssetID_assetVersion_serializedData_(self, v29, (uint64_t)v18, (uint64_t)v23, (uint64_t)v28);

  objc_msgSend_shared(MEMORY[0x24BE0FC08], v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = objc_msgSend_verboseLoggingEnabled(v34, v35, v36, v37, v38);

  if ((_DWORD)v23)
  {
    BDSCloudKitDevelopmentLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_assetID(self, v40, v41, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_debugDescription(self, v45, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_assetID(v6, v50, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v57 = v44;
      v58 = 2112;
      v59 = v49;
      v60 = 2114;
      v61 = v54;
      _os_log_impl(&dword_227D4F000, v39, OS_LOG_TYPE_DEFAULT, "\"\\\"BCAssetAnnotations configured: %{public}@ %@ from assetDetail:%{public}@\\\"\", buf, 0x20u);

    }
  }

}

- (void)_mergeInAssetID:(id)a3 assetVersion:(id)a4 serializedData:(id)a5
{
  char *v8;
  id v9;
  id v10;
  BCAnnotationsProtoBook *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char isEqualToString;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  BCAnnotationsProtoBook *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  _BOOL4 v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BCAnnotationsProtoBook *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  uint64_t i;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  NSObject *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t j;
  void *v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  BCProtoAnnotation *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  double v139;
  double v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  double v149;
  void *v150;
  int v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  int v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  NSObject *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  NSObject *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  int v192;
  NSObject *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  NSObject *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  id v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  BCAssetAnnotations *v220;
  int v221;
  void *v222;
  BCAnnotationsProtoBook *v223;
  id v224;
  uint64_t v225;
  char *v226;
  BCAnnotationsProtoBook *v227;
  void *v228;
  BCAnnotationsProtoBook *v229;
  void *v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  uint8_t v239[4];
  void *v240;
  uint8_t buf[4];
  void *v242;
  _BYTE v243[128];
  uint64_t v244;

  v244 = *MEMORY[0x24BDAC8D0];
  v8 = (char *)a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(BCAnnotationsProtoBook);
  v12 = objc_alloc(MEMORY[0x24BE7AEF8]);
  v16 = (void *)objc_msgSend_initWithData_(v12, v13, (uint64_t)v10, v14, v15);
  if (BCAnnotationsProtoBookReadFrom((char *)v11, (uint64_t)v16))
  {
    v222 = v16;
    v224 = v10;
    objc_msgSend_assetID(self, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v21, v22, (uint64_t)v8, v23, v24);

    if ((isEqualToString & 1) == 0)
    {
      BDSCloudKitLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_227E5B858(self, v8, v26, v27, v28);

      objc_msgSend_setAssetID_(self, v29, (uint64_t)v8, v30, v31);
    }
    v32 = objc_alloc_init(BCAnnotationsProtoBook);
    objc_msgSend_setAssetID_(v32, v33, (uint64_t)v8, v34, v35);
    objc_msgSend_appVersion(BDSAppVersion, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAppVersion_(v32, v41, (uint64_t)v40, v42, v43);

    objc_msgSend_bookAnnotations(self, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend_length(v48, v49, v50, v51, v52);

    if (v53)
    {
      v54 = objc_alloc(MEMORY[0x24BE7AEF8]);
      objc_msgSend_bookAnnotations(self, v55, v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = (void *)objc_msgSend_initWithData_(v54, v60, (uint64_t)v59, v61, v62);

      v64 = BCAnnotationsProtoBookReadFrom((char *)v32, (uint64_t)v63);
      if (!v64)
      {
        BDSCloudKitLog();
        v65 = (char *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
          sub_227E5B7D8(self, v65, v66, v67, v68);

      }
      v221 = !v64;

    }
    else
    {
      v221 = 1;
    }
    v225 = (uint64_t)v9;
    v226 = v8;
    v73 = v32;
    v223 = v11;
    v227 = v11;
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v74, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x24BDBCEB8], v79, v80, v81, v82);
    v229 = v73;
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    v235 = 0u;
    v236 = 0u;
    v237 = 0u;
    v238 = 0u;
    objc_msgSend_annotations(v73, v83, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v88, (uint64_t)&v235, (uint64_t)v243, 16);
    v220 = self;
    if (v89)
    {
      v90 = v89;
      v91 = 0;
      v92 = *(_QWORD *)v236;
      do
      {
        for (i = 0; i != v90; ++i)
        {
          if (*(_QWORD *)v236 != v92)
            objc_enumerationMutation(v87);
          v94 = *(void **)(*((_QWORD *)&v235 + 1) + 8 * i);
          if (sub_227D98F6C(v94))
          {
            objc_msgSend_uuid(v94, v95, v96, v97, v98);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v78, v100, (uint64_t)v94, (uint64_t)v99, v101);

          }
          else
          {
            BDSCloudKitLog();
            v103 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v242 = v94;
              _os_log_error_impl(&dword_227D4F000, v103, OS_LOG_TYPE_ERROR, "skipping annotation not valid for sync %@", buf, 0xCu);
            }

            objc_msgSend_addObject_(v230, v104, (uint64_t)v94, v105, v106);
            v91 = 1;
          }
        }
        v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v102, (uint64_t)&v235, (uint64_t)v243, 16);
      }
      while (v90);
    }
    else
    {
      v91 = 0;
    }

    objc_msgSend_annotations(v229, v107, v108, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeObjectsInArray_(v111, v112, (uint64_t)v230, v113, v114);

    v233 = 0u;
    v234 = 0u;
    v231 = 0u;
    v232 = 0u;
    objc_msgSend_annotations(v227, v115, v116, v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v120, (uint64_t)&v231, (uint64_t)buf, 16);
    if (v121)
    {
      v126 = v121;
      v127 = *(_QWORD *)v232;
      v228 = v78;
      do
      {
        for (j = 0; j != v126; ++j)
        {
          if (*(_QWORD *)v232 != v127)
            objc_enumerationMutation(v119);
          v129 = *(void **)(*((_QWORD *)&v231 + 1) + 8 * j);
          objc_msgSend_uuid(v129, v122, v123, v124, v125, v220);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v78, v131, (uint64_t)v130, v132, v133);
          v134 = (BCProtoAnnotation *)objc_claimAutoreleasedReturnValue();
          if ((sub_227D98F6C(v129) & 1) != 0)
          {
            if (v134)
            {
              objc_msgSend_modificationDate(v129, v135, v136, v137, v138);
              v140 = v139;
              objc_msgSend_modificationDate(v134, v141, v142, v143, v144);
              if (v140 > v149)
              {
                v150 = v119;
                v151 = objc_msgSend_deleted(v129, v145, v146, v147, v148);
                objc_msgSend_shared(MEMORY[0x24BE0FC08], v152, v153, v154, v155);
                v156 = (void *)objc_claimAutoreleasedReturnValue();
                v161 = objc_msgSend_verboseLoggingEnabled(v156, v157, v158, v159, v160);

                if (v151)
                {
                  v119 = v150;
                  if (v161)
                  {
                    BDSCloudKitDevelopmentLog();
                    v166 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend_uuid(v129, v167, v168, v169, v170);
                      v171 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v239 = 138412290;
                      v240 = v171;
                      _os_log_impl(&dword_227D4F000, v166, OS_LOG_TYPE_DEFAULT, "\"\\\"Annotation updated: annotation %@ is deleted, making a tombstone\\\"\", v239, 0xCu);

                      v119 = v150;
                    }

                  }
                  objc_msgSend_modificationDate(v129, v162, v163, v164, v165);
                  objc_msgSend_setModificationDate_(v134, v172, v173, v174, v175);
                  bc_turnProtoAnnotationIntoTombstone(v134);
                }
                else
                {
                  v119 = v150;
                  if (v161)
                  {
                    BDSCloudKitDevelopmentLog();
                    v199 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v199, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend_locationCFIString(v129, v200, v201, v202, v203);
                      v204 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v239 = 138412290;
                      v240 = v204;
                      _os_log_impl(&dword_227D4F000, v199, OS_LOG_TYPE_DEFAULT, "\"\\\"Annotation updated: annotation at location %@\\\"\", v239, 0xCu);

                      v119 = v150;
                    }

                  }
                  objc_msgSend_copyTo_(v129, v162, (uint64_t)v134, v164, v165);
                }
                v91 = 1;
                v78 = v228;
              }
            }
            else
            {
              v134 = objc_alloc_init(BCProtoAnnotation);
              objc_msgSend_copyTo_(v129, v177, (uint64_t)v134, v178, v179);
              objc_msgSend_addAnnotation_(v229, v180, (uint64_t)v134, v181, v182);
              objc_msgSend_shared(MEMORY[0x24BE0FC08], v183, v184, v185, v186);
              v187 = (void *)objc_claimAutoreleasedReturnValue();
              v192 = objc_msgSend_verboseLoggingEnabled(v187, v188, v189, v190, v191);

              if (v192)
              {
                BDSCloudKitDevelopmentLog();
                v193 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v193, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend_locationCFIString(v134, v194, v195, v196, v197);
                  v198 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v239 = 138412290;
                  v240 = v198;
                  _os_log_impl(&dword_227D4F000, v193, OS_LOG_TYPE_DEFAULT, "\"\\\"Annotations updated: new annotation synced down at %@\\\"\", v239, 0xCu);

                }
              }
              v91 = 1;
            }
          }
          else
          {
            BDSCloudKitLog();
            v176 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v239 = 138412290;
              v240 = v129;
              _os_log_error_impl(&dword_227D4F000, v176, OS_LOG_TYPE_ERROR, "skipping annotation not valid for sync %@.", v239, 0xCu);
            }

          }
        }
        v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v122, (uint64_t)&v231, (uint64_t)buf, 16);
      }
      while (v126);
    }

    v69 = (char *)v229;
    v9 = (id)v225;
    if (((v221 | v91) & 1) != 0)
    {
      objc_msgSend_setAssetVersion_(v220, v205, v225, v206, v207);
      v208 = objc_alloc_init(MEMORY[0x24BE7AF00]);
      objc_msgSend_writeTo_(v229, v209, (uint64_t)v208, v210, v211);
      objc_msgSend_immutableData(v208, v212, v213, v214, v215);
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setBookAnnotations_(v220, v217, (uint64_t)v216, v218, v219);

    }
    v8 = v226;
    v11 = v223;
    v10 = v224;
    v16 = v222;
  }
  else
  {
    BDSCloudKitLog();
    v69 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_ERROR))
      sub_227E5B900(self, v69, v70, v71, v72);
  }

}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int hasChanges;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  char *v85;
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
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  objc_super v126;
  uint8_t buf[4];
  void *v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  void *v132;
  uint64_t v133;

  v133 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v126.receiver = self;
  v126.super_class = (Class)BCAssetAnnotations;
  -[BCCloudData resolveConflictsFromRecord:withResolvers:](&v126, sel_resolveConflictsFromRecord_withResolvers_, v6, a4);
  if (v6)
  {
    objc_msgSend_localIdentifierFromRecord_(BCCloudData, v7, (uint64_t)v6, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_modificationDate(self, v11, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v20 = (void *)v15;
      objc_msgSend_modificationDate(self, v16, v17, v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v21, v22, v23, v24, v25);
      v27 = v26;
      objc_msgSend_modificationDate(v6, v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_timeIntervalSinceReferenceDate(v32, v33, v34, v35, v36);
      v38 = v37;

      if (v27 > v38)
      {
        objc_msgSend_incrementEditGeneration(self, v39, v40, v41, v42);
        goto LABEL_20;
      }
    }
    objc_opt_class();
    objc_msgSend_objectForKey_(v6, v43, (uint64_t)CFSTR("assetAnnotations"), v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURL(v47, v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      objc_msgSend_dataWithContentsOfURL_(MEMORY[0x24BDBCE50], v53, (uint64_t)v52, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = 0;
    }
    if (!objc_msgSend_length(v10, v53, v54, v55, v56) || !objc_msgSend_length(v57, v61, v62, v63, v64))
    {
      BDSCloudKitLog();
      v85 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v85, OS_LOG_TYPE_ERROR))
        sub_227E5BA00(self, v85, v107, v108, v109);
      goto LABEL_18;
    }
    objc_msgSend_objectForKeyedSubscript_(v6, v65, (uint64_t)CFSTR("assetVersion"), v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__mergeInAssetID_assetVersion_serializedData_(self, v69, (uint64_t)v10, (uint64_t)v68, (uint64_t)v57);

    hasChanges = objc_msgSend_hasChanges(self, v70, v71, v72, v73);
    objc_msgSend_shared(MEMORY[0x24BE0FC08], v75, v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend_verboseLoggingEnabled(v79, v80, v81, v82, v83);

    if (hasChanges)
    {
      if (!v84)
      {
LABEL_19:

        goto LABEL_20;
      }
      BDSCloudKitDevelopmentLog();
      v85 = (char *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v85, OS_LOG_TYPE_DEFAULT))
      {
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend_assetID(self, v86, v87, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v6, v91, v92, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordName(v95, v96, v97, v98, v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_debugDescription(self, v101, v102, v103, v104);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v128 = v90;
      v129 = 2112;
      v130 = v100;
      v131 = 2112;
      v132 = v105;
      v106 = "\"\\\"BCAssetAnnotations %@ Resolving: Adopted properties from record: %@ %@\\\"\";
    }
    else
    {
      if (!v84)
        goto LABEL_19;
      BDSCloudKitDevelopmentLog();
      v85 = (char *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v85, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      objc_msgSend_assetID(self, v110, v111, v112, v113);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v6, v114, v115, v116, v117);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordName(v95, v118, v119, v120, v121);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_debugDescription(self, v122, v123, v124, v125);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v128 = v90;
      v129 = 2112;
      v130 = v100;
      v131 = 2112;
      v132 = v105;
      v106 = "\"\\\"BCAssetAnnotations %@ Resolving: Identical properties from record: %@ %@\\\"\";
    }
    _os_log_impl(&dword_227D4F000, (os_log_t)v85, OS_LOG_TYPE_DEFAULT, v106, buf, 0x20u);

    goto LABEL_18;
  }
  BDSCloudKitLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_227E5B980(self, (char *)v10, v58, v59, v60);
LABEL_20:

}

- (id)recordType
{
  return CFSTR("assetAnnotations");
}

+ (id)propertyIDKey
{
  return CFSTR("assetID");
}

- (id)zoneName
{
  return CFSTR("AssetZone");
}

- (NSString)debugDescription
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_assetID(self, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetVersion(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bookAnnotations(self, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v18, (uint64_t)CFSTR("assetID: %@, assetVersion: %@, statistics: %@"), v19, v20, v7, v12, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

@end
