@implementation VCPMADServiceImageAsset

- (id)vcp_textAnnotation
{
  void *v2;
  void *v3;

  -[VCPMADServiceImageAsset documentObservations](self, "documentObservations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC6EB8], "textBlockWithDocumentObservations:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)vcp_scenenetAnnotation
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[VCPMADServiceImageAsset scenenetClassifications](self, "scenenetClassifications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v28 = v2;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v31 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0D75258], "vcp_sharedTaxonomy");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "nodeForExtendedSceneClassId:", objc_msgSend(v8, "extendedSceneIdentifier"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10
            && (objc_msgSend(v10, "name"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
          {
            v12 = objc_alloc(MEMORY[0x1E0DC6EA0]);
            objc_msgSend(v10, "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "boundingBox");
            v15 = v14;
            v17 = v16;
            v19 = v18;
            v21 = v20;
            objc_msgSend(v8, "confidence");
            *(float *)&v23 = v22;
            v24 = (void *)objc_msgSend(v12, "initWithLabel:normalizedBoundingBox:confidence:", v13, v15, v17, v19, v21, v23);
            objc_msgSend(v29, "addObject:", v24);

          }
          else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            v25 = objc_msgSend(v8, "extendedSceneIdentifier");
            *(_DWORD *)buf = 134217984;
            v35 = v25;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[SceneNet] Failed to find label for identifier %llu", buf, 0xCu);
          }

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v5);
    }

    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6EA8]), "initWithAnnotations:revision:", v29, 3737841665);
    v2 = v28;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)vcp_annotationWithTypes:(unint64_t)a3
{
  char v3;
  VCPMADServiceImageAsset *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  uint64_t v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t j;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  id v78;
  double v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  double v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t k;
  void *v102;
  void *v103;
  id v104;
  double v105;
  double v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v111;
  void *v112;
  char v113;
  char v114;
  VCPMADServiceImageAsset *v115;
  VCPMADServiceImageAsset *v116;
  void *v117;
  void *v118;
  os_signpost_id_t spid;
  void *v120;
  unint64_t v121;
  void *v122;
  id v123;
  void *type;
  void *v125;
  void *v126;
  void *v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  _BYTE v141[128];
  uint8_t v142[128];
  uint8_t buf[4];
  uint64_t v144;
  __int16 v145;
  uint64_t v146;
  __int16 v147;
  uint64_t v148;
  uint64_t v149;

  v3 = a3;
  v4 = self;
  v149 = *MEMORY[0x1E0C80C00];
  if ((a3 & 3) == 0)
  {
    v6 = 0;
    v122 = 0;
    v24 = 0;
    goto LABEL_79;
  }
  -[VCPMADServiceImageAsset faces](self, "faces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoLibrary");
    v8 = objc_claimAutoreleasedReturnValue();

    v125 = v6;
    v111 = v5;
    v112 = (void *)v8;
    v113 = v3;
    v115 = v4;
    if (v8)
      goto LABEL_4;
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[VCPMADServiceImageAsset identifier](v4, "identifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v144 = (uint64_t)v53;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VI][%@] -> face without photoLibrary", buf, 0xCu);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VCPMADServiceImageAsset photoLibrary](v4, "photoLibrary");
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = MediaAnalysisLogLevel();
      v112 = (void *)v54;
      if (v54)
      {
        if (v55 >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          -[VCPMADServiceImageAsset identifier](v4, "identifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v144 = (uint64_t)v56;
          v145 = 2112;
          v146 = v54;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VI][%@] -> asset's photoLibrary %@", buf, 0x16u);

        }
LABEL_4:
        VCPSignPostLog();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = os_signpost_id_generate(v9);

        VCPSignPostLog();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v121 = v10 - 1;
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "MADVIFetchVerifiedPeople", ", buf, 2u);
        }
        spid = v10;

        objc_msgSend(v112, "mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:", &unk_1E6B763C8, &unk_1E6B763E0);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD16C8], "fetchPersonsWithFaces:options:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          v14 = objc_msgSend(v13, "count");
          *(_DWORD *)buf = 134217984;
          v144 = v14;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VI][Identity] Fetched %lu verified identities", buf, 0xCu);
        }
        if (objc_msgSend(v13, "count"))
        {
          v15 = 0;
          v16 = MEMORY[0x1E0C81028];
          do
          {
            v17 = (void *)MEMORY[0x1BCCA1B2C]();
            objc_msgSend(v13, "objectAtIndexedSubscript:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "localIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "setObject:forKeyedSubscript:", v18, v19);

            if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v18, "localIdentifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v18, "verifiedType");
              *(_DWORD *)buf = 138412546;
              v144 = (uint64_t)v20;
              v145 = 2048;
              v146 = v21;
              _os_log_impl(&dword_1B6C4A000, v16, OS_LOG_TYPE_DEBUG, "[VI][Identity] -> identitity %@ with verified type %ld", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v17);
            ++v15;
          }
          while (v15 < objc_msgSend(v13, "count"));
        }
        VCPSignPostLog();
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v121 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v22))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v23, OS_SIGNPOST_INTERVAL_END, spid, "MADVIFetchVerifiedPeople", ", buf, 2u);
        }

        v4 = v115;
        if ((v3 & 1) == 0)
        {
LABEL_20:
          v24 = 0;
          if ((v3 & 2) != 0)
          {
LABEL_21:
            v117 = v24;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v132 = 0u;
            v133 = 0u;
            v134 = 0u;
            v135 = 0u;
            v26 = v5;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v132, v141, 16);
            v122 = v25;
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v133;
              do
              {
                for (i = 0; i != v28; ++i)
                {
                  if (*(_QWORD *)v133 != v29)
                    objc_enumerationMutation(v26);
                  v31 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * i);
                  v32 = (void *)MEMORY[0x1BCCA1B2C]();
                  if (objc_msgSend(v31, "vcp_hasBody"))
                  {
                    objc_msgSend(v31, "vcp_normalizedBodyBounds");
                    v34 = v33;
                    v36 = v35;
                    v38 = v37;
                    v40 = v39;
                    v41 = objc_alloc(MEMORY[0x1E0DC6EA0]);
                    LODWORD(v42) = 1.0;
                    v43 = (void *)objc_msgSend(v41, "initWithLabel:normalizedBoundingBox:confidence:", CFSTR("Human"), v34, v36, v38, v40, v42);
                    objc_msgSend(v25, "addObject:", v43);

                    objc_msgSend(v31, "personLocalIdentifier");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v127, "objectForKeyedSubscript:", v44);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v45 && objc_msgSend(v45, "faceCount"))
                    {
                      v46 = objc_msgSend(v45, "faceCount");
                      if ((int)MediaAnalysisLogLevel() >= 7
                        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                      {
                        objc_msgSend(v31, "personLocalIdentifier");
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v45, "name");
                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412802;
                        v144 = (uint64_t)v47;
                        v145 = 2112;
                        v146 = (uint64_t)v48;
                        v147 = 2048;
                        v148 = v46;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VI][Identity] Creating VIReducePersonOverTriggerRegionalAnnotation for human (torso) identity %@ (%@) with %ld faces in Photos library", buf, 0x20u);

                        v25 = v122;
                      }
                      v49 = objc_alloc(MEMORY[0x1E0DC6E90]);
                      objc_msgSend(v31, "personLocalIdentifier");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      LODWORD(v51) = 1.0;
                      v52 = (void *)objc_msgSend(v49, "initWithLabel:boundingBox:confidence:faceCount:", v50, v46, v34, v36, v38, v40, v51);

                      if ((int)MediaAnalysisLogLevel() >= 7
                        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v144 = (uint64_t)v52;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VI][Identity] Created VIReducePersonOverTriggerRegionalAnnotation %@", buf, 0xCu);
                      }
                      v6 = v125;
                      objc_msgSend(v125, "addObject:", v52);

                    }
                  }
                  objc_autoreleasePoolPop(v32);
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v132, v141, 16);
              }
              while (v28);
            }

            v3 = v113;
            v4 = v115;
            v5 = v111;
            v24 = v117;
            goto LABEL_77;
          }
LABEL_76:
          v122 = 0;
LABEL_77:

          goto LABEL_78;
        }
LABEL_57:
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = 0u;
        v137 = 0u;
        v138 = 0u;
        v139 = 0u;
        v63 = v5;
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v136, v142, 16);
        if (v64)
        {
          v65 = v64;
          v66 = *(_QWORD *)v137;
          v123 = v63;
          do
          {
            for (j = 0; j != v65; ++j)
            {
              if (*(_QWORD *)v137 != v66)
                objc_enumerationMutation(v63);
              v68 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * j);
              v69 = (void *)MEMORY[0x1BCCA1B2C]();
              if (objc_msgSend(v68, "vcp_hasFace"))
              {
                objc_msgSend(v68, "vcp_normalizedFaceBounds");
                v71 = v70;
                v73 = v72;
                v75 = v74;
                v77 = v76;
                v78 = objc_alloc(MEMORY[0x1E0DC6EA0]);
                LODWORD(v79) = 1.0;
                v80 = (void *)objc_msgSend(v78, "initWithLabel:normalizedBoundingBox:confidence:", CFSTR("Face"), v71, v73, v75, v77, v79);
                objc_msgSend(v24, "addObject:", v80);

                objc_msgSend(v68, "personLocalIdentifier");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v127, "objectForKeyedSubscript:", v81);
                v82 = (void *)objc_claimAutoreleasedReturnValue();

                if (v82 && objc_msgSend(v82, "faceCount"))
                {
                  v83 = v24;
                  v84 = objc_msgSend(v82, "faceCount");
                  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v68, "personLocalIdentifier");
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v82, "name");
                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v144 = (uint64_t)v85;
                    v145 = 2112;
                    v146 = (uint64_t)v86;
                    v147 = 2048;
                    v148 = v84;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VI][Identity] Creating VIReducePersonOverTriggerRegionalAnnotation for face identity %@ (%@) with %ld faces in Photos library", buf, 0x20u);

                  }
                  v87 = objc_alloc(MEMORY[0x1E0DC6E90]);
                  objc_msgSend(v68, "personLocalIdentifier");
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v89) = 1.0;
                  v90 = (void *)objc_msgSend(v87, "initWithLabel:boundingBox:confidence:faceCount:", v88, v84, v71, v73, v75, v77, v89);

                  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v144 = (uint64_t)v90;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VI][Identity] Created VIReducePersonOverTriggerRegionalAnnotation %@", buf, 0xCu);
                  }
                  v6 = v125;
                  objc_msgSend(v125, "addObject:", v90);

                  v24 = v83;
                  v63 = v123;
                }

              }
              objc_autoreleasePoolPop(v69);
            }
            v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v136, v142, 16);
          }
          while (v65);
        }

        v3 = v113;
        v4 = v115;
        v5 = v111;
        if ((v113 & 2) != 0)
          goto LABEL_21;
        goto LABEL_76;
      }
      if (v55 >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        -[VCPMADServiceImageAsset identifier](v4, "identifier");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v144 = (uint64_t)v62;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VI][%@] -> asset without photoLibrary", buf, 0xCu);

      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[VCPMADServiceImageAsset identifier](v4, "identifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)objc_opt_class();
      v59 = v58;
      v60 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v144 = (uint64_t)v57;
      v145 = 2112;
      v146 = (uint64_t)v58;
      v147 = 2112;
      v148 = (uint64_t)v60;
      v61 = v60;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VI][%@] -> faces from %@ (expected %@)", buf, 0x20u);

    }
    v112 = 0;
    if ((v3 & 1) == 0)
      goto LABEL_20;
    goto LABEL_57;
  }
  v6 = 0;
  v122 = 0;
  v24 = 0;
LABEL_78:

LABEL_79:
  if (objc_msgSend(v6, "count"))
  {
    v91 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6E88]), "initWithRegionsItems:", v6);
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v92 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 134218242;
      v144 = v92;
      v145 = 2112;
      v146 = (uint64_t)v91;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[VI][Identity] Packaged VIReducePersonOverTriggerAnnotation with %lu VIReducePersonOverTriggerRegionalAnnotation - %@", buf, 0x16u);
    }
  }
  else
  {
    v91 = 0;
  }
  v118 = v24;
  if ((v3 & 4) == 0)
  {
    v93 = 0;
    if ((v3 & 8) != 0)
      goto LABEL_86;
LABEL_104:
    v94 = 0;
    if ((v3 & 0x10) != 0)
      goto LABEL_87;
LABEL_105:
    v95 = 0;
    goto LABEL_106;
  }
  -[VCPMADServiceImageAsset nsfwClassifications](v4, "nsfwClassifications");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (v96)
  {
    type = v91;
    v114 = v3;
    v116 = v4;
    v126 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v131 = 0u;
    v97 = v96;
    v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v128, v140, 16);
    if (v98)
    {
      v99 = v98;
      v100 = *(_QWORD *)v129;
      do
      {
        for (k = 0; k != v99; ++k)
        {
          if (*(_QWORD *)v129 != v100)
            objc_enumerationMutation(v97);
          v102 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * k);
          VCPSpecialLabelFromExtendedSceneClassificationID(objc_msgSend(v102, "extendedSceneIdentifier"));
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          if (v103)
          {
            v104 = objc_alloc(MEMORY[0x1E0DC6EA0]);
            objc_msgSend(v102, "confidence");
            *(float *)&v106 = v105;
            v107 = (void *)objc_msgSend(v104, "initWithLabel:normalizedBoundingBox:confidence:", v103, 0.0, 0.0, 1.0, 1.0, v106);
            objc_msgSend(v93, "addObject:", v107);

          }
          else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            v108 = objc_msgSend(v102, "extendedSceneIdentifier");
            *(_DWORD *)buf = 134217984;
            v144 = v108;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[NSFW] Failed to find label for identifier %llu", buf, 0xCu);
          }

        }
        v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v128, v140, 16);
      }
      while (v99);
    }

    v6 = v126;
    v3 = v114;
    v4 = v116;
    v91 = type;
  }
  else
  {
    v93 = 0;
  }

  if ((v3 & 8) == 0)
    goto LABEL_104;
LABEL_86:
  -[VCPMADServiceImageAsset vcp_textAnnotation](v4, "vcp_textAnnotation");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 0x10) == 0)
    goto LABEL_105;
LABEL_87:
  -[VCPMADServiceImageAsset vcp_scenenetAnnotation](v4, "vcp_scenenetAnnotation");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_106:
  v109 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6E58]), "initWithReducePersonOverTriggerAnnotation:faceAnnotations:humanAnnotations:nsfwAnnotations:textBlockAnnotation:scenenetAnnotation:barcodeAnnotation:", v91, v118, v122, v93, v94, v95, 0);

  return v109;
}

- (VCPMADServiceImageAsset)initWithClientBundleID:(id)a3 clientTeamID:(id)a4
{
  id v7;
  id v8;
  VCPMADServiceImageAsset *v9;
  VCPMADServiceImageAsset *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VCPMADServiceImageAsset;
  v9 = -[VCPMADServiceImageAsset init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientBundleID, a3);
    objc_storeStrong((id *)&v10->_clientTeamID, a4);
  }

  return v10;
}

+ (VCPMADServiceImageAsset)assetWithPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int)a4 identifier:(id)a5 clientBundleID:(id)a6 clientTeamID:(id)a7
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  VCPMADServiceImagePixelBufferAsset *v14;

  v9 = *(_QWORD *)&a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = -[VCPMADServiceImagePixelBufferAsset initWithPixelBuffer:orientation:andIdentifier:clientBundleID:clientTeamID:]([VCPMADServiceImagePixelBufferAsset alloc], "initWithPixelBuffer:orientation:andIdentifier:clientBundleID:clientTeamID:", a3, v9, v11, v12, v13);

  return (VCPMADServiceImageAsset *)v14;
}

+ (VCPMADServiceImageAsset)assetWithURL:(id)a3 identifier:(id)a4 clientBundleID:(id)a5 clientTeamID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  VCPMADServiceImageURLAsset *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = -[VCPMADServiceImageURLAsset initWithURL:identifier:clientBundleID:clientTeamID:]([VCPMADServiceImageURLAsset alloc], "initWithURL:identifier:clientBundleID:clientTeamID:", v9, v10, v11, v12);

  return (VCPMADServiceImageAsset *)v13;
}

+ (VCPMADServiceImageAsset)assetWithImageData:(id)a3 uniformTypeIdentifier:(id)a4 identifier:(id)a5 clientBundleID:(id)a6 clientTeamID:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  VCPMADServiceImageDataAsset *v16;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = -[VCPMADServiceImageDataAsset initWithImageData:uniformTypeIdentifier:identifier:clientBundleID:clientTeamID:]([VCPMADServiceImageDataAsset alloc], "initWithImageData:uniformTypeIdentifier:identifier:clientBundleID:clientTeamID:", v11, v12, v13, v14, v15);

  return (VCPMADServiceImageAsset *)v16;
}

+ (VCPMADServiceImageAsset)assetWithPhotosAsset:(id)a3 clientBundleID:(id)a4 clientTeamID:(id)a5
{
  id v7;
  id v8;
  id v9;
  VCPMADServiceImagePhotosAsset *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[VCPMADServiceImagePhotosAsset initWithPhotosAsset:clientBundleID:clientTeamID:]([VCPMADServiceImagePhotosAsset alloc], "initWithPhotosAsset:clientBundleID:clientTeamID:", v7, v8, v9);

  return (VCPMADServiceImageAsset *)v10;
}

+ (VCPMADServiceImageAsset)assetWithPhotosAsset:(id)a3 pixelBuffer:(__CVBuffer *)a4 orientation:(unsigned int)a5 clientBundleID:(id)a6 clientTeamID:(id)a7
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  VCPMADServiceImagePhotosAsset *v14;

  v9 = *(_QWORD *)&a5;
  v11 = a3;
  v12 = a6;
  v13 = a7;
  v14 = -[VCPMADServiceImagePhotosAsset initWithPhotosAsset:pixelBuffer:orientation:clientBundleID:clientTeamID:]([VCPMADServiceImagePhotosAsset alloc], "initWithPhotosAsset:pixelBuffer:orientation:clientBundleID:clientTeamID:", v11, a4, v9, v12, v13);

  return (VCPMADServiceImageAsset *)v14;
}

- (NSString)identifier
{
  return 0;
}

- (CLLocation)location
{
  return 0;
}

- (BOOL)isScreenshot
{
  return 0;
}

- (NSArray)faces
{
  return 0;
}

- (NSArray)nsfwClassifications
{
  return 0;
}

- (NSArray)scenenetClassifications
{
  return 0;
}

- (NSArray)barcodeObservations
{
  return 0;
}

- (int)loadPixelBuffer:(__CVBuffer *)a3 orientation:(unsigned int *)a4
{
  return -4;
}

- (void)setCachedParseData:(id)a3
{
  -[VCPMADServiceImageAsset setCachedParseData:overwriteExisting:](self, "setCachedParseData:overwriteExisting:", a3, 0);
}

- (BOOL)hasValidSceneProcessing
{
  return 0;
}

- (NSNumber)isSensitive
{
  return 0;
}

- (BOOL)fromGenerativePlayground
{
  return 0;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (NSString)clientTeamID
{
  return self->_clientTeamID;
}

- (NSArray)documentObservations
{
  return self->_documentObservations;
}

- (void)setDocumentObservations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setBarcodeObservations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)hasCachedParseData
{
  return self->_hasCachedParseData;
}

- (NSData)cachedParseData
{
  return self->_cachedParseData;
}

- (NSString)signpostPayload
{
  return self->_signpostPayload;
}

- (void)setSignpostPayload:(id)a3
{
  objc_storeStrong((id *)&self->_signpostPayload, a3);
}

- (CGSize)resolution
{
  double width;
  double height;
  CGSize result;

  width = self->_resolution.width;
  height = self->_resolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (BOOL)isHighResDecoded
{
  return self->_isHighResDecoded;
}

- (BOOL)userSafetyEligible
{
  return self->_userSafetyEligible;
}

- (void)setUserSafetyEligible:(BOOL)a3
{
  self->_userSafetyEligible = a3;
}

- (NSNumber)animatedStickerScore
{
  return self->_animatedStickerScore;
}

- (unint64_t)assetType
{
  return self->_assetType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedStickerScore, 0);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_cachedParseData, 0);
  objc_storeStrong((id *)&self->_barcodeObservations, 0);
  objc_storeStrong((id *)&self->_documentObservations, 0);
  objc_storeStrong((id *)&self->_clientTeamID, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
}

@end
