@implementation MDRemoteExtensionContext

void __40___MDRemoteExtensionContext_hostContext__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40___MDRemoteExtensionContext_hostContext__block_invoke_cold_1();

}

void __87___MDRemoteExtensionContext_handleSingleFileURLRequest_providerIdentifier_index_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.corespotlight.requests", v2);
  v1 = (void *)performJob_acknowledgementHandler__queue;
  performJob_acknowledgementHandler__queue = (uint64_t)v0;

}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2(id *a1)
{
  id *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  id v48;
  void *v49;
  CSSearchableIndex *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  id v55;
  CSSearchableIndex *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  CSDecoder *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t j;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t k;
  void *v91;
  void *v92;
  CSCoder *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  id v97;
  char v98;
  id v99;
  unint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  unint64_t n;
  void *v106;
  id v107;
  id v108;
  void *v109;
  void *v110;
  id v111;
  CSFileURLBatchResult *v112;
  void *v113;
  char v114;
  CSDecoder *v115;
  void *v116;
  void *v117;
  unint64_t v118;
  void *v119;
  void *v120;
  uint64_t ii;
  void *v122;
  void *v123;
  _BOOL4 v124;
  CSSearchableItemAttributeSet *v125;
  size_t v126;
  id v127;
  CSCoder *v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t jj;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  CSSearchableIndex *v137;
  id v138;
  id v139;
  id v140;
  id v141;
  void *v142;
  void *v143;
  NSObject *v144;
  uint64_t v145;
  void *v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t m;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  CSDecoder *v155;
  id v156;
  void *context;
  char v158;
  void *v159;
  id *v160;
  void *v161;
  CSSearchableIndex *v162;
  void *v163;
  _QWORD aBlock[4];
  id v165;
  CSSearchableIndex *v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  _BYTE *v172;
  BOOL v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  _QWORD block[4];
  id v179;
  id v180;
  id v181;
  _BYTE *v182;
  unint64_t v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  id v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  _QWORD v197[4];
  NSObject *v198;
  _BYTE *v199;
  id v200;
  id v201;
  id v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  _QWORD v207[4];
  NSObject *v208;
  CSSearchableIndex *v209;
  NSObject *v210;
  _QWORD v211[4];
  NSObject *v212;
  CSSearchableIndex *v213;
  NSObject *v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[12];
  __int16 v224;
  CSSearchableIndex *v225;
  _BYTE buf[24];
  uint64_t (*v227)(uint64_t, uint64_t);
  void (*v228)(uint64_t);
  id v229;
  _BYTE v230[128];
  _QWORD v231[4];

  v231[1] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x18D782104]();
  v160 = a1;
  v3 = a1[4];
  v2 = a1 + 4;
  v4 = objc_msgSend(v3, "jobType");
  switch(v4)
  {
    case 1:
      objc_msgSend(*v2, "extensionBundleID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      if (v13)
      {
        objc_msgSend(*v2, "extensionBundleID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(*v2, "identifiersToReindex");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v217 = 0u;
        v218 = 0u;
        v215 = 0u;
        v216 = 0u;
        objc_msgSend(*v2, "identifiersToReindex");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v215, v230, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v216;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v216 != v20)
                objc_enumerationMutation(v18);
              objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(":%@"), *(_QWORD *)(*((_QWORD *)&v215 + 1) + 8 * i));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObject:", v22);

            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v215, v230, 16);
          }
          while (v19);
        }

        objc_msgSend(*v2, "setIdentifiersToReindex:", v17);
      }
      goto LABEL_26;
    case 2:
      objc_msgSend(*v2, "extensionBundleID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");

      if (v24)
      {
        objc_msgSend(*v2, "extensionBundleID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v231[0] = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v231, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v2, "setIdentifiersToReindex:", v26);

LABEL_26:
        v4 = 1;
      }
      else
      {
        v4 = 2;
      }
      goto LABEL_37;
    case 6:
    case 7:
    case 8:
    case 14:
    case 15:
      objc_msgSend(*v2, "extensionBundleID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "length"))
        goto LABEL_5;
      objc_msgSend(*v2, "providerIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length");

      if (v7)
      {
        objc_msgSend(*v2, "extensionBundleID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v2, "providerIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(":%@"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*v2, "setProviderIdentifier:", v9);

LABEL_5:
      }
LABEL_37:
      objc_msgSend(v160[5], "requestHandler");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v163)
        goto LABEL_43;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v162 = -[CSSearchableIndex initWithName:options:]([CSSearchableIndex alloc], "initWithName:options:", CFSTR("CSSearchableIndexExtension"), objc_msgSend(*v2, "jobOptions"));
      }
      else
      {
        logForCSLogCategoryIndex();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2_cold_1();

LABEL_43:
        v162 = 0;
        v163 = 0;
      }
      logForCSLogCategoryIndex();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v45 = *v2;
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v162;
        *(_WORD *)&buf[22] = 2112;
        v227 = (uint64_t (*)(uint64_t, uint64_t))v163;
        _os_log_impl(&dword_18C42F000, v11, OS_LOG_TYPE_INFO, "[CSJob] Extension will perform job: %@, index: %@, handler: %@", buf, 0x20u);
      }
      v161 = 0;
      v158 = 0;
LABEL_47:

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v227 = __Block_byref_object_copy__5;
      v228 = __Block_byref_object_dispose__5;
      v229 = 0;
      if (!v163)
        goto LABEL_60;
      if (v4 == 1)
      {
        v46 = dispatch_group_create();
        dispatch_group_enter(v46);
        logForCSLogCategoryIndex();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          v48 = *v2;
          *(_DWORD *)v223 = 138412546;
          *(_QWORD *)&v223[4] = v48;
          v224 = 2112;
          v225 = v162;
          _os_log_impl(&dword_18C42F000, v47, OS_LOG_TYPE_DEFAULT, "[CSJob] reindexSearchableItemsWithIdentifiers for job: %@, index: %@", v223, 0x16u);
        }

        objc_msgSend(*v2, "identifiersToReindex");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v211[0] = MEMORY[0x1E0C809B0];
        v211[1] = 3221225472;
        v211[2] = __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_96;
        v211[3] = &unk_1E2401ED0;
        v212 = *v2;
        v50 = v162;
        v213 = v50;
        v51 = v46;
        v214 = v51;
        objc_msgSend(v163, "searchableIndex:reindexSearchableItemsWithIdentifiers:acknowledgementHandler:", v50, v49, v211);

        v156 = 0;
        v52 = v212;
        goto LABEL_115;
      }
      if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v53 = dispatch_group_create();
        dispatch_group_enter(v53);
        logForCSLogCategoryIndex();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          v55 = *v2;
          *(_DWORD *)v223 = 138412546;
          *(_QWORD *)&v223[4] = v55;
          v224 = 2112;
          v225 = v162;
          _os_log_impl(&dword_18C42F000, v54, OS_LOG_TYPE_DEFAULT, "[CSJob] reindexSearchableItems for job: %@, index: %@", v223, 0x16u);
        }

        v207[0] = MEMORY[0x1E0C809B0];
        v207[1] = 3221225472;
        v207[2] = __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_97;
        v207[3] = &unk_1E2401ED0;
        v208 = *v2;
        v56 = v162;
        v209 = v56;
        v51 = v53;
        v210 = v51;
        objc_msgSend(v163, "searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:", v56, v207);

        v156 = 0;
        v52 = v208;
        goto LABEL_115;
      }
      if (v4 == 5)
      {
        objc_msgSend(v163, "searchableIndexDidFinishThrottle:", v162);
        goto LABEL_60;
      }
      if (v4 == 4)
      {
        objc_msgSend(v163, "searchableIndexDidThrottle:", v162);
LABEL_60:
        v156 = 0;
        v51 = 0;
        goto LABEL_116;
      }
      if ((v4 & 0xFFFFFFFFFFFFFFF7) == 6)
      {
        v52 = v163;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v57 = objc_msgSend(*v2, "jobOptions");
          objc_msgSend(*v2, "providerIdentifier");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*v2, "providerType");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v206 = 0;
          -[NSObject dataForSearchableIndex:itemIdentifier:typeIdentifier:options:error:](v52, "dataForSearchableIndex:itemIdentifier:typeIdentifier:options:error:", v162, v58, v59, (v57 >> 11) & 0xD, &v206);
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = v206;
LABEL_68:
          v156 = v61;
          v67 = *(void **)(*(_QWORD *)&buf[8] + 40);
          *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v60;

          goto LABEL_114;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*v2, "providerIdentifier");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*v2, "providerType");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v205 = 0;
          -[NSObject dataForSearchableIndex:itemIdentifier:typeIdentifier:allowDownload:error:](v52, "dataForSearchableIndex:itemIdentifier:typeIdentifier:allowDownload:error:", v162, v58, v59, v4 != 14, &v205);
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = v205;
          goto LABEL_68;
        }
        if (v4 != 14)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(*v2, "providerIdentifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*v2, "providerType");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v204 = 0;
            -[NSObject dataForSearchableIndex:itemIdentifier:typeIdentifier:error:](v52, "dataForSearchableIndex:itemIdentifier:typeIdentifier:error:", v162, v58, v59, &v204);
            v60 = objc_claimAutoreleasedReturnValue();
            v61 = v204;
            goto LABEL_68;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(*v2, "providerIdentifier");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*v2, "providerType");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v203 = 0;
            -[NSObject searchableIndexProvideDataForIndex:identifier:type:error:](v52, "searchableIndexProvideDataForIndex:identifier:type:error:", v162, v58, v59, &v203);
            v60 = objc_claimAutoreleasedReturnValue();
            v61 = v203;
            goto LABEL_68;
          }
        }
      }
      else
      {
        switch(v4)
        {
          case 7:
          case 8:
          case 15:
            v63 = v160[4];
            v62 = v160[5];
            objc_msgSend(v63, "providerIdentifier");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v202 = 0;
            objc_msgSend(v62, "handleSingleFileURLRequest:providerIdentifier:index:error:", v63, v64, v162, &v202);
            v52 = objc_claimAutoreleasedReturnValue();
            v156 = v202;

            +[CSCoder encodeURLPreservingSecurityScope:](CSCoder, "encodeURLPreservingSecurityScope:", v52);
            v65 = objc_claimAutoreleasedReturnValue();
            v66 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v65;

            goto LABEL_114;
          case 9:
            v52 = v163;
            if ((objc_opt_respondsToSelector() & 1) == 0)
              break;
            v68 = dispatch_group_create();
            dispatch_group_enter(v68);
            objc_msgSend(*v2, "searchContext");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v197[0] = MEMORY[0x1E0C809B0];
            v197[1] = 3221225472;
            v197[2] = __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_114;
            v197[3] = &unk_1E2401EF8;
            v199 = buf;
            v51 = v68;
            v198 = v51;
            -[NSObject fetchSearchableItemsForSearchContext:completionHandler:](v52, "fetchSearchableItemsForSearchContext:completionHandler:", v69, v197);

            v156 = 0;
            goto LABEL_115;
          case 10:
            v52 = v163;
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(*v2, "searchContext");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject cancelQueryWithIdentifier:](v52, "cancelQueryWithIdentifier:", objc_msgSend(v70, "queryID"));

            }
            break;
          case 11:
            v52 = v163;
            *(_WORD *)v223 = (objc_opt_respondsToSelector() & 1) != 0;
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v223, 2);
            v71 = objc_claimAutoreleasedReturnValue();
            v72 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v71;

            break;
          case 12:
            v52 = v163;
            if ((objc_opt_respondsToSelector() & 1) == 0)
              break;
            objc_msgSend(*v2, "importData");
            v73 = objc_claimAutoreleasedReturnValue();
            v74 = -[CSDecoder initWithData:]([CSDecoder alloc], "initWithData:", v73);
            -[CSDecoder decode](v74, "decode");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v154 = (void *)v73;
            v155 = v74;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("FileExtensionArray"));
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = v77;
              v153 = v75;
              if (v77)
              {
                v195 = 0u;
                v196 = 0u;
                v193 = 0u;
                v194 = 0u;
                v79 = v77;
                v80 = v77;
                v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v193, v222, 16);
                if (v81)
                {
                  v82 = *(_QWORD *)v194;
                  do
                  {
                    for (j = 0; j != v81; ++j)
                    {
                      if (*(_QWORD *)v194 != v82)
                        objc_enumerationMutation(v80);
                      objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v193 + 1) + 8 * j)), "UTF8String");
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", sandbox_extension_consume());
                      v84 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v76, "addObject:", v84);

                    }
                    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v193, v222, 16);
                  }
                  while (v81);
                }

                v75 = v153;
                v78 = v79;
              }
              objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("PathArray"));
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v151 = v78;
              v152 = v85;
              if (v85)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                v191 = 0u;
                v192 = 0u;
                v189 = 0u;
                v190 = 0u;
                v87 = v85;
                v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v189, v221, 16);
                if (v88)
                {
                  v89 = *(_QWORD *)v190;
                  do
                  {
                    for (k = 0; k != v88; ++k)
                    {
                      if (*(_QWORD *)v190 != v89)
                        objc_enumerationMutation(v87);
                      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v189 + 1) + 8 * k));
                      v91 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v86, "addObject:", v91);

                    }
                    v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v189, v221, 16);
                  }
                  while (v88);
                }

                v188 = 0;
                -[NSObject importFilesForURLs:error:](v52, "importFilesForURLs:error:", v86, &v188);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                v156 = v188;
                if (objc_msgSend(v92, "count"))
                {
                  v93 = objc_alloc_init(CSCoder);
                  -[CSCoder encodeObject:](v93, "encodeObject:", v92);
                  -[CSCoder data](v93, "data");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  v95 = objc_msgSend(v94, "copy");
                  v96 = *(void **)(*(_QWORD *)&buf[8] + 40);
                  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v95;

                }
              }
              else
              {
                v156 = 0;
              }
              v186 = 0u;
              v187 = 0u;
              v184 = 0u;
              v185 = 0u;
              v147 = v76;
              v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v184, v220, 16);
              if (v148)
              {
                v149 = *(_QWORD *)v185;
                do
                {
                  for (m = 0; m != v148; ++m)
                  {
                    if (*(_QWORD *)v185 != v149)
                      objc_enumerationMutation(v147);
                    if (objc_msgSend(*(id *)(*((_QWORD *)&v184 + 1) + 8 * m), "longLongValue") != -1)
                      sandbox_extension_release();
                  }
                  v148 = objc_msgSend(v147, "countByEnumeratingWithState:objects:count:", &v184, v220, 16);
                }
                while (v148);
              }

              v75 = v153;
            }
            else
            {
              v156 = 0;
            }

            goto LABEL_114;
          case 16:
            v97 = v163;
            v98 = objc_opt_respondsToSelector();
            v99 = *v2;
            if ((v98 & 1) != 0)
            {
              v100 = objc_msgSend(v99, "jobOptions");
              objc_msgSend(*v2, "providerIdentifiers");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*v2, "providerType");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              v201 = 0;
              objc_msgSend(v97, "fileURLsForSearchableIndex:itemIdentifiers:typeIdentifier:options:error:", v162, v101, v102, (v100 >> 11) & 0xF, &v201);
              v52 = objc_claimAutoreleasedReturnValue();
              v156 = v201;
            }
            else
            {
              objc_msgSend(v99, "providerIdentifiers");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v101, "count"));
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              for (n = 0; objc_msgSend(v101, "count") > n; ++n)
              {
                v106 = (void *)objc_opt_new();
                v108 = v160[4];
                v107 = v160[5];
                objc_msgSend(v101, "objectAtIndexedSubscript:", n);
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                v200 = 0;
                objc_msgSend(v107, "handleSingleFileURLRequest:providerIdentifier:index:error:", v108, v109, v162, &v200);
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                v111 = v200;

                v112 = -[CSFileURLBatchResult initWithFileURL:andError:]([CSFileURLBatchResult alloc], "initWithFileURL:andError:", v110, v111);
                objc_msgSend(v102, "setObject:atIndexedSubscript:", v112, n);

              }
              v52 = objc_msgSend(v102, "copy");
              v156 = 0;
            }

            objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v52, 1, 0);
            v145 = objc_claimAutoreleasedReturnValue();
            v146 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v145;

            goto LABEL_114;
          case 17:
            v52 = v163;
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(*v2, "updatedItems");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject searchableItemsDidUpdate:mask:](v52, "searchableItemsDidUpdate:mask:", v103, objc_msgSend(*v2, "updatedItemsMask"));
            }
            else
            {
              if ((objc_opt_respondsToSelector() & 1) == 0)
                break;
              objc_msgSend(*v2, "updatedItems");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject searchableItemsDidUpdate:](v52, "searchableItemsDidUpdate:", v103);
            }

            break;
          default:
            logForCSLogCategoryIndex();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              v104 = *v2;
              *(_DWORD *)v223 = 138412546;
              *(_QWORD *)&v223[4] = v104;
              v224 = 2112;
              v225 = v162;
              _os_log_impl(&dword_18C42F000, v52, OS_LOG_TYPE_DEFAULT, "[CSJob] Ignoring job: %@, index: %@", v223, 0x16u);
            }
            break;
        }
      }
      v156 = 0;
LABEL_114:
      v51 = 0;
LABEL_115:

LABEL_116:
      v113 = v161;
      v114 = v158 ^ 1;
      if (!v161)
        v114 = 1;
      if ((v114 & 1) == 0)
      {
        objc_msgSend(*v2, "importData");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = -[CSDecoder initWithData:]([CSDecoder alloc], "initWithData:", v159);
        -[CSDecoder decode](v115, "decode");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v116 = 0;
        }
        objc_msgSend(*v2, "fileAttributeSets");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = objc_msgSend(v117, "count");

        objc_msgSend(*v2, "fileAttributeSets");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = (void *)objc_msgSend(v119, "mutableCopy");

        if (v118)
        {
          for (ii = 0; ii != v118; ++ii)
          {
            objc_msgSend(*v2, "fileAttributeSets");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "objectAtIndexedSubscript:", ii);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            v124 = v123 == 0;

            if (v124)
            {
              v125 = objc_alloc_init(CSSearchableItemAttributeSet);
              objc_msgSend(v120, "setObject:atIndexedSubscript:", v125, ii);

            }
          }
        }
        objc_msgSend(*v2, "setFileAttributeSets:", v120);
        *(_QWORD *)v223 = 0;
        if (v118 >= 4)
          v126 = 4;
        else
          v126 = v118;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_133;
        block[3] = &unk_1E2401F20;
        v182 = v223;
        v183 = v118;
        v127 = v116;
        v179 = v127;
        v180 = *v2;
        v181 = v161;
        dispatch_apply(v126, 0, block);
        v128 = objc_alloc_init(CSCoder);
        -[CSCoder beginArray](v128, "beginArray");
        v176 = 0u;
        v177 = 0u;
        v174 = 0u;
        v175 = 0u;
        objc_msgSend(*v2, "fileAttributeSets");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        v130 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v174, v219, 16);
        if (v130)
        {
          v131 = *(_QWORD *)v175;
          do
          {
            for (jj = 0; jj != v130; ++jj)
            {
              if (*(_QWORD *)v175 != v131)
                objc_enumerationMutation(v129);
              objc_msgSend(*(id *)(*((_QWORD *)&v174 + 1) + 8 * jj), "attributeDictionary");
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              -[CSCoder encodeObject:](v128, "encodeObject:", v133);

            }
            v130 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v174, v219, 16);
          }
          while (v130);
        }

        -[CSCoder endArray](v128, "endArray");
        -[CSCoder data](v128, "data");
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = objc_msgSend(v134, "copy");
        v136 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v135;

        v113 = v161;
      }
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_135;
      aBlock[3] = &unk_1E2401F48;
      v165 = v160[4];
      v137 = v162;
      v166 = v137;
      v138 = v163;
      v167 = v138;
      v139 = v113;
      v140 = v160[5];
      v168 = v139;
      v169 = v140;
      v173 = v51 != 0;
      v141 = v156;
      v170 = v141;
      v171 = v160[6];
      v172 = buf;
      v142 = _Block_copy(aBlock);
      v143 = v142;
      if (v51)
      {
        dispatch_suspend((dispatch_object_t)performJob_acknowledgementHandler__queue);
        dispatch_get_global_queue(9, 0);
        v144 = objc_claimAutoreleasedReturnValue();
        dispatch_group_notify(v51, v144, v143);

      }
      else
      {
        (*((void (**)(void *))v142 + 2))(v142);
      }

      _Block_object_dispose(buf, 8);
      objc_autoreleasePoolPop(context);
      return;
    case 13:
      objc_msgSend(v160[5], "importExtension");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v161)
        goto LABEL_11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        logForCSLogCategoryIndex();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2_cold_3();

LABEL_11:
        v161 = 0;
      }
      logForCSLogCategoryIndex();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2_cold_2((uint64_t)v161, v2, v11);
      v162 = 0;
      v163 = 0;
      v158 = 1;
      v4 = 13;
      goto LABEL_47;
    case 16:
      objc_msgSend(*v2, "extensionBundleID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "length");

      if (v28)
      {
        v29 = objc_alloc(MEMORY[0x1E0C99DE8]);
        objc_msgSend(*v2, "providerIdentifiers");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v29, "initWithCapacity:", objc_msgSend(v30, "count"));

        objc_msgSend(*v2, "providerIdentifiers");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "count");

        if (v33)
        {
          v34 = 0;
          do
          {
            objc_msgSend(*v2, "providerIdentifiers");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectAtIndexedSubscript:", v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "length");

            if (v37)
            {
              objc_msgSend(*v2, "extensionBundleID");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*v2, "providerIdentifiers");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "objectAtIndexedSubscript:", v34);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "stringByAppendingFormat:", CFSTR(":%@"), v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setObject:atIndexedSubscript:", v41, v34);

            }
            else
            {
              objc_msgSend(v31, "setObject:atIndexedSubscript:", &stru_1E2406B38, v34);
            }
            objc_msgSend(*v2, "providerIdentifiers");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            ++v34;
            v43 = objc_msgSend(v42, "count");

          }
          while (v43 > v34);
        }
        objc_msgSend(*v2, "setProviderIdentifiers:", v31);

      }
      v4 = 16;
      goto LABEL_37;
    default:
      goto LABEL_37;
  }
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_96(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_18C42F000, v2, OS_LOG_TYPE_DEFAULT, "[CSJob] Received ack for job: %@, index: %@", (uint8_t *)&v5, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_97(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_18C42F000, v2, OS_LOG_TYPE_DEFAULT, "[CSJob] Received ack for job: %@, index: %@", (uint8_t *)&v5, 0x16u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CSCoder *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    logForCSLogCategoryDefault();
    v7 = (CSCoder *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
      __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_114_cold_1(v6, &v7->super);
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v5, "count"))
  {
    v7 = objc_alloc_init(CSCoder);
    -[CSCoder beginArray](v7, "beginArray");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "attributeSet", (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[CSCoder encodeObject:](v7, "encodeObject:", v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    -[CSCoder endArray](v7, "endArray");
    -[CSCoder data](v7, "data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    goto LABEL_13;
  }
LABEL_14:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_133(uint64_t a1, __n128 a2)
{
  unint64_t *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  unint64_t *v15;
  uint64_t v16;
  __n128 v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = *(unint64_t **)(a1 + 56);
  do
    v4 = __ldxr(v3);
  while (__stxr(v4 + 1, v3));
  if (v4 < *(_QWORD *)(a1 + 64))
  {
    a2.n128_u64[0] = 134218242;
    v17 = a2;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v4, *(_OWORD *)&v17);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
        v7 = sandbox_extension_consume();
      }
      else
      {
        v7 = -1;
      }
      objc_msgSend(*(id *)(a1 + 40), "fileAttributeSets");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "contentURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x18D782104]();
      v12 = *(void **)(a1 + 48);
      v18 = 0;
      objc_msgSend(v12, "updateAttributes:forFileAtURL:error:", v9, v10, &v18);
      v13 = v18;
      objc_autoreleasePoolPop(v11);
      logForCSLogCategoryDefault();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v16 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
        *(_DWORD *)buf = v17.n128_u32[0];
        v20 = v7;
        v21 = 2080;
        v22 = v16;
        _os_log_debug_impl(&dword_18C42F000, v14, OS_LOG_TYPE_DEBUG, "===== sandbox_extension_consume %lld, %s", buf, 0x16u);
      }

      sandbox_extension_release();
      v15 = *(unint64_t **)(a1 + 56);
      do
        v4 = __ldxr(v15);
      while (__stxr(v4 + 1, v15));
    }
    while (v4 < *(_QWORD *)(a1 + 64));
  }
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_135(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x18D782104]();
  logForCSLogCategoryIndex();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    if (!v6)
      v6 = *(_QWORD *)(a1 + 56);
    v22 = 138412802;
    v23 = v5;
    v24 = 2112;
    v25 = v4;
    v26 = 2112;
    v27 = v6;
    _os_log_impl(&dword_18C42F000, v3, OS_LOG_TYPE_DEFAULT, "[CSJob] completed job: %@, index: %@, handler: %@", (uint8_t *)&v22, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 64), "setRequestHandler:", 0);
  if (*(_BYTE *)(a1 + 96))
    dispatch_resume((dispatch_object_t)performJob_acknowledgementHandler__queue);
  if (*(_QWORD *)(a1 + 72))
  {
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = *(void **)(a1 + 72);
    if (v7 != v8)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v9, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, objc_msgSend(*(id *)(a1 + 72), "code"), 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
  }
  else
  {
    v9 = 0;
  }
  v12 = v9;
LABEL_12:
  v13 = *(_QWORD *)(a1 + 80);
  if (v13)
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v12);
  logForCSLogCategoryIndex();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_135_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);

  objc_msgSend(*(id *)(a1 + 64), "completeRequestReturningItems:completionHandler:", MEMORY[0x1E0C9AA60], 0);
  objc_autoreleasePoolPop(v2);
}

void __40___MDRemoteExtensionContext_hostContext__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_18C42F000, v0, v1, "Error getting host context %@", v2);
  OUTLINED_FUNCTION_1();
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_18C42F000, v0, v1, "[CSJob] Invalid index request handler: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a2, "fileType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a2, "fileAttributeSets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_debug_impl(&dword_18C42F000, a3, OS_LOG_TYPE_DEBUG, "[CSJob] importExtension: %@, job.fileType: %@, job.fileAttributeSets: %@", (uint8_t *)&v8, 0x20u);

}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_18C42F000, v0, v1, "[CSJob] Invalid import extension request handler: %@", v2);
  OUTLINED_FUNCTION_1();
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_114_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_18C42F000, a2, v3, "[CSJob] Error occured in remote search: %ld", v4);
  OUTLINED_FUNCTION_2_0();
}

void __63___MDRemoteExtensionContext_performJob_acknowledgementHandler___block_invoke_135_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_13(&dword_18C42F000, a1, a3, "[CSJob] Calling completeRequestReturningItems", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

@end
