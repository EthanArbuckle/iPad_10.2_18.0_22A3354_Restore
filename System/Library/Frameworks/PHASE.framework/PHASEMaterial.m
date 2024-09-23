@implementation PHASEMaterial

- (PHASEMaterial)init
{
  -[PHASEMaterial doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEMaterial)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEMaterial)initWithEngine:(PHASEEngine *)engine preset:(PHASEMaterialPreset)preset
{
  void *v5;
  Phase::Logger *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  id v61;
  Phase::Logger *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  PHASEMaterial *v68;
  NSObject *v69;
  uint64_t v70;
  Phase::Logger *v71;
  Phase::Logger *v72;
  PHASEAbsorptionData *v73;
  void *v74;
  void *v75;
  void *v76;
  PHASEAbsorptionData *v77;
  void *v78;
  Phase::Logger *v79;
  PHASEScatteringData *v80;
  void *v81;
  PHASEScatteringData *v82;
  void *v83;
  _BOOL4 v84;
  Phase::Logger *v85;
  PHASESoundReductionIndex *v86;
  void *v87;
  void *v88;
  PHASESoundReductionIndex *v89;
  void *v90;
  Phase::Logger *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  void *v97;
  NSObject *v98;
  NSObject *v99;
  void *v100;
  NSObject *v101;
  NSObject *v102;
  void *v103;
  NSObject *v104;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  PHASEEngine *v111;
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
  uint8_t buf[4];
  const char *v138;
  __int16 v139;
  int v140;
  __int16 v141;
  void *v142;
  uint64_t v143;

  v143 = *MEMORY[0x24BDAC8D0];
  v111 = engine;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (Phase::Logger *)objc_opt_class();
  if (!v6)
  {
    v16 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v138 = "PHASEMaterial.mm";
      v139 = 1024;
      v140 = 729;
      _os_log_impl(&dword_2164CC000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [Database not found] - Returning default material.", buf, 0x12u);
    }
    +[PHASESoundReductionIndex objectForDefault](PHASESoundReductionIndex, "objectForDefault");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHASEAbsorptionData objectForDefault](PHASEAbsorptionData, "objectForDefault");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHASEScatteringData objectForDefault](PHASEScatteringData, "objectForDefault");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[PHASEMaterial initWithEngine:preset:soundReductionIndex:absorptionData:scatteringData:](self, "initWithEngine:preset:soundReductionIndex:absorptionData:scatteringData:", v111, preset, v17, v18, v19);

    goto LABEL_26;
  }
  if (preset <= 1833071210)
  {
    switch(preset)
    {
      case 0:
        v7 = *MEMORY[0x24BE00F08];
        v136 = 0;
        v110 = v7;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v136;
        objc_msgSend(v5, "addEntriesFromDictionary:", v8);

        v10 = *MEMORY[0x24BE00F10];
        v135 = 0;
        v109 = v10;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v135;

        objc_msgSend(v5, "addEntriesFromDictionary:", v11);
        v13 = *MEMORY[0x24BE00F18];
        v134 = 0;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:", v13, CFSTR("Default"), &v134);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v134;

        objc_msgSend(v5, "addEntriesFromDictionary:", v14);
        goto LABEL_22;
      case 2:
        goto LABEL_12;
      case 3:
        goto LABEL_20;
      case 4:
        goto LABEL_17;
      case 5:
        goto LABEL_18;
      case 6:
        v56 = *MEMORY[0x24BE00F08];
        v121 = 0;
        v110 = v56;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v121;
        objc_msgSend(v5, "addEntriesFromDictionary:", v57);

        v59 = *MEMORY[0x24BE00F10];
        v120 = 0;
        v109 = v59;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v120;

        objc_msgSend(v5, "addEntriesFromDictionary:", v60);
        v13 = *MEMORY[0x24BE00F18];
        v119 = 0;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:", v13, CFSTR("Drywall_SingleSheet"), &v119);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v119;

        objc_msgSend(v5, "addEntriesFromDictionary:", v14);
        goto LABEL_22;
      case 7:
        goto LABEL_19;
      case 10:
        goto LABEL_16;
      default:
        goto LABEL_40;
    }
  }
  if (preset > 1833202294)
  {
    switch(preset)
    {
      case PHASEMaterialPresetDrywall:
LABEL_19:
        v44 = *MEMORY[0x24BE00F08];
        v118 = 0;
        v110 = v44;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = v118;
        objc_msgSend(v5, "addEntriesFromDictionary:", v45);

        v47 = *MEMORY[0x24BE00F10];
        v117 = 0;
        v109 = v47;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v117;

        objc_msgSend(v5, "addEntriesFromDictionary:", v48);
        v13 = *MEMORY[0x24BE00F18];
        v116 = 0;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:", v13, CFSTR("Drywall_DoubleSheet"), &v116);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v116;

        objc_msgSend(v5, "addEntriesFromDictionary:", v14);
        break;
      case PHASEMaterialPresetGlass:
LABEL_20:
        v50 = *MEMORY[0x24BE00F08];
        v130 = 0;
        v110 = v50;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v130;
        objc_msgSend(v5, "addEntriesFromDictionary:", v51);

        v53 = *MEMORY[0x24BE00F10];
        v129 = 0;
        v109 = v53;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v129;

        objc_msgSend(v5, "addEntriesFromDictionary:", v54);
        v13 = *MEMORY[0x24BE00F18];
        v128 = 0;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:", v13, CFSTR("Window_SinglePane"), &v128);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v128;

        objc_msgSend(v5, "addEntriesFromDictionary:", v14);
        break;
      case PHASEMaterialPresetWood:
LABEL_16:
        v26 = *MEMORY[0x24BE00F08];
        v115 = 0;
        v110 = v26;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v115;
        objc_msgSend(v5, "addEntriesFromDictionary:", v27);

        v29 = *MEMORY[0x24BE00F10];
        v114 = 0;
        v109 = v29;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v114;

        objc_msgSend(v5, "addEntriesFromDictionary:", v30);
        v13 = *MEMORY[0x24BE00F18];
        v113 = 0;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:", v13, CFSTR("Wall_Wood_Medium_BT15 mm_150mm"), &v113);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v113;

        objc_msgSend(v5, "addEntriesFromDictionary:", v14);
        break;
      default:
        goto LABEL_40;
    }
  }
  else
  {
    switch(preset)
    {
      case PHASEMaterialPresetBrick:
LABEL_17:
        v32 = *MEMORY[0x24BE00F08];
        v127 = 0;
        v110 = v32;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v127;
        objc_msgSend(v5, "addEntriesFromDictionary:", v33);

        v35 = *MEMORY[0x24BE00F10];
        v126 = 0;
        v109 = v35;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v126;

        objc_msgSend(v5, "addEntriesFromDictionary:", v36);
        v13 = *MEMORY[0x24BE00F18];
        v125 = 0;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:", v13, CFSTR("Brickwork_General"), &v125);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v125;

        objc_msgSend(v5, "addEntriesFromDictionary:", v14);
        break;
      case PHASEMaterialPresetConcrete:
LABEL_18:
        v38 = *MEMORY[0x24BE00F08];
        v124 = 0;
        v110 = v38;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v124;
        objc_msgSend(v5, "addEntriesFromDictionary:", v39);

        v41 = *MEMORY[0x24BE00F10];
        v123 = 0;
        v109 = v41;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v123;

        objc_msgSend(v5, "addEntriesFromDictionary:", v42);
        v13 = *MEMORY[0x24BE00F18];
        v122 = 0;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:", v13, CFSTR("Wall_Concrete_Thickness_GT200mm"), &v122);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v122;

        objc_msgSend(v5, "addEntriesFromDictionary:", v14);
        break;
      case PHASEMaterialPresetCardboard:
LABEL_12:
        v20 = *MEMORY[0x24BE00F08];
        v133 = 0;
        v110 = v20;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v133;
        objc_msgSend(v5, "addEntriesFromDictionary:", v21);

        v23 = *MEMORY[0x24BE00F10];
        v132 = 0;
        v109 = v23;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v132;

        objc_msgSend(v5, "addEntriesFromDictionary:", v24);
        v13 = *MEMORY[0x24BE00F18];
        v131 = 0;
        objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forMaterialName:error:", v13, CFSTR("Cardboard_3mm"), &v131);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v131;

        objc_msgSend(v5, "addEntriesFromDictionary:", v14);
        break;
      default:
LABEL_40:
        v98 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v6) + 432));
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v138 = "PHASEMaterial.mm";
          v139 = 1024;
          v140 = 642;
          _os_log_impl(&dword_2164CC000, v98, OS_LOG_TYPE_ERROR, "%25s:%-5d Preset enumeration not found. Would only be caused by invalid use of API.", buf, 0x12u);
        }
        goto LABEL_58;
    }
  }
LABEL_22:

  if (v15)
  {
    v63 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v62)
                                                                                        + 432)));
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "localizedDescription");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v138 = "PHASEMaterial.mm";
      v139 = 1024;
      v140 = 719;
      v141 = 2112;
      v142 = v64;
      _os_log_impl(&dword_2164CC000, v63, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [%@] - Returning default material.", buf, 0x1Cu);

    }
    +[PHASESoundReductionIndex objectForDefault](PHASESoundReductionIndex, "objectForDefault");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHASEAbsorptionData objectForDefault](PHASEAbsorptionData, "objectForDefault");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHASEScatteringData objectForDefault](PHASEScatteringData, "objectForDefault");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[PHASEMaterial initWithEngine:preset:soundReductionIndex:absorptionData:scatteringData:](self, "initWithEngine:preset:soundReductionIndex:absorptionData:scatteringData:", v111, preset, v65, v66, v67);

    goto LABEL_26;
  }
  if (!v5)
  {
    v69 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v62)
                                                                                        + 432)));
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(0, "localizedDescription");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v138 = "PHASEMaterial.mm";
      v139 = 1024;
      v140 = 661;
      v141 = 2112;
      v142 = v95;
      _os_log_impl(&dword_2164CC000, v69, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [%@]", buf, 0x1Cu);

    }
    goto LABEL_57;
  }
  objc_msgSend(v5, "objectForKey:", v110);
  v69 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v109);
  v70 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v13);
  v71 = (Phase::Logger *)objc_claimAutoreleasedReturnValue();
  v72 = v71;
  v108 = (void *)v70;
  if (!v69)
  {
    v69 = v70;
    v96 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v71)
                                                                                        + 432)));
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(0, "localizedDescription");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v138 = "PHASEMaterial.mm";
      v139 = 1024;
      v140 = 678;
      v141 = 2112;
      v142 = v97;
      _os_log_impl(&dword_2164CC000, v96, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [%@]", buf, 0x1Cu);

    }
    goto LABEL_39;
  }
  v73 = [PHASEAbsorptionData alloc];
  -[NSObject absorptionReferenceData](v69, "absorptionReferenceData");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject frequencyBands](v69, "frequencyBands");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v108;
  v77 = -[PHASEAbsorptionData initWithAbsorptionCoefficients:frequencyBands:](v73, "initWithAbsorptionCoefficients:frequencyBands:", v74, v75);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v77, v110);

  objc_msgSend(v5, "objectForKeyedSubscript:", v110);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v74) = v78 == 0;

  if ((_DWORD)v74)
  {
    v99 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v79) + 432));
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v138 = "PHASEMaterial.mm";
      v139 = 1024;
      v140 = 672;
      _os_log_impl(&dword_2164CC000, v99, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Could not create PHASEAbsorptionData.", buf, 0x12u);
    }
    goto LABEL_56;
  }
  if (!v108)
  {
    v96 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v79)
                                                                                        + 432)));
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(0, "localizedDescription");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v138 = "PHASEMaterial.mm";
      v139 = 1024;
      v140 = 695;
      v141 = 2112;
      v142 = v100;
      _os_log_impl(&dword_2164CC000, v96, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [%@]", buf, 0x1Cu);

    }
LABEL_39:

LABEL_57:
LABEL_58:
    v68 = 0;
    goto LABEL_59;
  }
  v80 = [PHASEScatteringData alloc];
  objc_msgSend(v108, "scatteringReferenceData");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "frequencyBands");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = -[PHASEScatteringData initWithScatteringCoefficients:frequencyBands:](v80, "initWithScatteringCoefficients:frequencyBands:", v106, v81);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v82, v109);

  objc_msgSend(v5, "objectForKeyedSubscript:", v109);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v83 == 0;

  if (v84)
  {
    v101 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v85) + 432));
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v138 = "PHASEMaterial.mm";
      v139 = 1024;
      v140 = 689;
      _os_log_impl(&dword_2164CC000, v101, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Could not create PHASEScatteringData.", buf, 0x12u);
    }
    goto LABEL_56;
  }
  if (!v72)
  {
    v102 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v85)
                                                                                         + 432)));
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(0, "localizedDescription");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v138 = "PHASEMaterial.mm";
      v139 = 1024;
      v140 = 713;
      v141 = 2112;
      v142 = v103;
      _os_log_impl(&dword_2164CC000, v102, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [%@]", buf, 0x1Cu);

    }
    goto LABEL_57;
  }
  v86 = [PHASESoundReductionIndex alloc];
  -[Phase::Logger soundReductionIndexReferenceData](v72, "soundReductionIndexReferenceData");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[Phase::Logger frequencyBands](v72, "frequencyBands");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v108;
  -[Phase::Logger materialDepth](v72, "materialDepth");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "floatValue");
  v89 = -[PHASESoundReductionIndex initWithSoundReductionIndices:frequencyBands:measuredDepth:](v86, "initWithSoundReductionIndices:frequencyBands:measuredDepth:", v107, v87);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v89, v13);

  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v88) = v90 == 0;

  if ((_DWORD)v88)
  {
    v104 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v91) + 432));
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v138 = "PHASEMaterial.mm";
      v139 = 1024;
      v140 = 707;
      _os_log_impl(&dword_2164CC000, v104, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Could not create PHASESoundReductionIndex.", buf, 0x12u);
    }
LABEL_56:

    goto LABEL_57;
  }

  objc_msgSend(v5, "objectForKey:", v13);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v110);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v109);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[PHASEMaterial initWithEngine:preset:soundReductionIndex:absorptionData:scatteringData:](self, "initWithEngine:preset:soundReductionIndex:absorptionData:scatteringData:", v111, preset, v92, v93, v94);

LABEL_26:
  v68 = self;
LABEL_59:

  return v68;
}

- (PHASEMaterial)initWithEngine:(id)a3 preset:(int64_t)a4 soundReductionIndex:(id)a5 absorptionData:(id)a6 scatteringData:(id)a7
{
  id v12;
  id v13;
  id v14;
  Phase::Logger *v15;
  Phase::Logger *v16;
  PHASEMaterial *v17;
  PHASEMaterial *v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = (Phase::Logger *)a7;
  v16 = v15;
  if (v13 && v14 && v15)
  {
    v21.receiver = self;
    v21.super_class = (Class)PHASEMaterial;
    v17 = -[PHASEMaterial init](&v21, sel_init);
    v18 = v17;
    if (v17)
    {
      objc_storeWeak((id *)&v17->_engine, v12);
      v18->_preset = a4;
      objc_storeStrong((id *)&v18->_soundReductionIndex, a5);
      objc_storeStrong((id *)&v18->_absorptionData, a6);
      objc_storeStrong((id *)&v18->_scatteringData, a7);
      *(_QWORD *)&v18->_attenuationScale = 1065353216;
      v18->_attenuationTilt = 0.0;
      -[PHASEMaterial writeMaterialCoefs:](v18, "writeMaterialCoefs:", 1);
    }
  }
  else
  {
    v19 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v15) + 432));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "PHASEMaterial.mm";
      v24 = 1024;
      v25 = 753;
      _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Cannot initialize a PHASEMaterial without valid SRI, absorption and scattering data!", buf, 0x12u);
    }

    v18 = 0;
  }

  return v18;
}

- (PHASEMaterial)initWithEngine:(id)a3 soundReductionIndex:(id)a4 absorptionData:(id)a5 scatteringData:(id)a6
{
  id v10;
  PHASESoundReductionIndex *v11;
  PHASEAbsorptionData *v12;
  PHASEScatteringData *v13;
  PHASEScatteringData *v14;
  void *v15;
  uint64_t j;
  PHASESubband *v17;
  double v18;
  double v19;
  PHASESubband *v20;
  PHASESoundReductionIndex *v21;
  double v22;
  void *v23;
  uint64_t i;
  PHASESubband *v25;
  double v26;
  double v27;
  PHASESubband *v28;
  void *v29;
  uint64_t k;
  PHASESubband *v31;
  double v32;
  double v33;
  PHASESubband *v34;
  PHASEScatteringData *v35;
  PHASEMaterial *v36;
  void *__p[3];

  v10 = a3;
  v11 = (PHASESoundReductionIndex *)a4;
  v12 = (PHASEAbsorptionData *)a5;
  v13 = (PHASEScatteringData *)a6;
  v14 = v13;
  if (v11 && v12 && v13)
    goto LABEL_22;
  sGetFrequencies((uint64_t)__p);
  if (v11)
  {
    if (v12)
      goto LABEL_6;
LABEL_11:
    v23 = (void *)objc_opt_new();
    for (i = 0; i != 124; i += 4)
    {
      v25 = [PHASESubband alloc];
      LODWORD(v26) = *(_DWORD *)((char *)__p[0] + i);
      LODWORD(v27) = 0;
      v28 = -[PHASESubband initWithFrequency:value:](v25, "initWithFrequency:value:", v26, v27);
      objc_msgSend(v23, "addObject:", v28);

    }
    v12 = -[PHASEAbsorptionData initWithAbsorptionCoefficients:]([PHASEAbsorptionData alloc], "initWithAbsorptionCoefficients:", v23);

    if (v14)
      goto LABEL_17;
    goto LABEL_14;
  }
  v15 = (void *)objc_opt_new();
  for (j = 0; j != 124; j += 4)
  {
    v17 = [PHASESubband alloc];
    LODWORD(v18) = *(_DWORD *)((char *)__p[0] + j);
    LODWORD(v19) = 1.0;
    v20 = -[PHASESubband initWithFrequency:value:](v17, "initWithFrequency:value:", v18, v19);
    objc_msgSend(v15, "addObject:", v20);

  }
  v21 = [PHASESoundReductionIndex alloc];
  LODWORD(v22) = 1041865114;
  v11 = -[PHASESoundReductionIndex initWithAttenuationCoefficients:measuredDepth:](v21, "initWithAttenuationCoefficients:measuredDepth:", v15, v22);

  if (!v12)
    goto LABEL_11;
LABEL_6:
  if (!v14)
  {
LABEL_14:
    v29 = (void *)objc_opt_new();
    for (k = 0; k != 124; k += 4)
    {
      v31 = [PHASESubband alloc];
      LODWORD(v32) = *(_DWORD *)((char *)__p[0] + k);
      LODWORD(v33) = 0;
      v34 = -[PHASESubband initWithFrequency:value:](v31, "initWithFrequency:value:", v32, v33);
      objc_msgSend(v29, "addObject:", v34);

    }
    v35 = -[PHASEScatteringData initWithScatteringCoefficients:]([PHASEScatteringData alloc], "initWithScatteringCoefficients:", v29);

    v14 = v35;
  }
LABEL_17:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (!v11 || !v12 || !v14)
    std::terminate();
LABEL_22:
  v36 = -[PHASEMaterial initWithEngine:preset:soundReductionIndex:absorptionData:scatteringData:](self, "initWithEngine:preset:soundReductionIndex:absorptionData:scatteringData:", v10, 1833136740, v11, v12, v14);

  return v36;
}

- (PHASEMaterial)initWithEngine:(id)a3 parameterTypes:(unint64_t)a4 semantics:(id)a5
{
  return -[PHASEMaterial initWithEngine:semantics:](self, "initWithEngine:semantics:", a3, a5);
}

- (PHASEMaterial)initWithEngine:(id)a3 semantics:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  Phase::Logger *v14;
  void *v15;
  Phase::Logger *v16;
  void *v17;
  PHASEMaterial *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t j;
  void *v27;
  BOOL v28;
  PHASESubband *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  double v37;
  double v38;
  PHASESubband *v39;
  unint64_t k;
  void *v41;
  BOOL v42;
  PHASESubband *v43;
  void *v44;
  void *v45;
  int v46;
  int v47;
  void *v48;
  void *v49;
  int v50;
  double v51;
  double v52;
  PHASESubband *v53;
  void *v54;
  Phase::Logger *v55;
  unint64_t m;
  void *v57;
  BOOL v58;
  void *v59;
  void *v60;
  float v61;
  PHASESubband *v62;
  void *v63;
  void *v64;
  PHASESubband *v65;
  PHASESoundReductionIndex *v66;
  uint64_t v67;
  NSObject *v68;
  const char *v69;
  void *v71;
  PHASEScatteringData *v72;
  id v73;
  id v74;
  uint64_t v75;
  void *v76;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  PHASEAbsorptionData *log;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  id obj;
  id v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint8_t v97[128];
  uint8_t buf[4];
  const char *v99;
  __int16 v100;
  int v101;
  __int16 v102;
  void *v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v74 = a3;
  v86 = a4;
  if (!objc_opt_class())
  {
    v19 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v99 = "PHASEMaterial.mm";
      v100 = 1024;
      v101 = 996;
      _os_log_impl(&dword_2164CC000, v19, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [Database not found] - Falling back to default material.", buf, 0x12u);
    }
    +[PHASESoundReductionIndex objectForDefault](PHASESoundReductionIndex, "objectForDefault");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHASEAbsorptionData objectForDefault](PHASEAbsorptionData, "objectForDefault");
    v87 = (id)objc_claimAutoreleasedReturnValue();
    +[PHASEScatteringData objectForDefault](PHASEScatteringData, "objectForDefault");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = -[PHASEMaterial initWithEngine:soundReductionIndex:absorptionData:scatteringData:](self, "initWithEngine:soundReductionIndex:absorptionData:scatteringData:", v74, v76, v87);
    self = v18;
    goto LABEL_67;
  }
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v82 = *MEMORY[0x24BE00F08];
  v76 = v5;
  objc_msgSend(v5, "addObject:");
  v78 = *MEMORY[0x24BE00F10];
  objc_msgSend(v5, "addObject:");
  v75 = *MEMORY[0x24BE00F18];
  objc_msgSend(v5, "addObject:");
  v87 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  objc_msgSend(v86, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v94;
    v83 = *MEMORY[0x24BE00F28];
    v8 = *MEMORY[0x24BE00F20];
    v9 = *MEMORY[0x24BE00F38];
    v10 = *MEMORY[0x24BE00F30];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v94 != v7)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("SurfaceMaterial")))
        {
          objc_msgSend(v86, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "setObject:forKey:", v13, v10);
        }
        else if (objc_msgSend(v12, "isEqualToString:", CFSTR("ARMeshMaterialID")))
        {
          objc_msgSend(v86, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "setObject:forKey:", v13, v9);
        }
        else if (objc_msgSend(v12, "isEqualToString:", CFSTR("Object")))
        {
          objc_msgSend(v86, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "setObject:forKey:", v13, v8);
        }
        else
        {
          v14 = (Phase::Logger *)objc_msgSend(v12, "isEqualToString:", CFSTR("ARMeshClassificationID"));
          if (!(_DWORD)v14)
          {
            v20 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v14) + 432));
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v99 = "PHASEMaterial.mm";
              v100 = 1024;
              v101 = 872;
              v102 = 2112;
              v103 = v12;
              _os_log_impl(&dword_2164CC000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Query contains unrecognized key [%@].", buf, 0x1Cu);
            }
            v18 = 0;
            goto LABEL_67;
          }
          objc_msgSend(v86, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "setObject:forKey:", v13, v83);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v104, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0;
  objc_msgSend(MEMORY[0x24BE00F40], "acousticParameters:forSemanticLabels:error:", v5, v87, &v92);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v92;

  if (obj)
  {
    log = (PHASEAbsorptionData *)objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v16) + 432));
    if (os_log_type_enabled(&log->super, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(obj, "localizedDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v99 = "PHASEMaterial.mm";
      v100 = 1024;
      v101 = 990;
      v102 = 2112;
      v103 = v17;
      _os_log_impl(&dword_2164CC000, &log->super, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: [%@]", buf, 0x1Cu);

    }
    v18 = 0;
    goto LABEL_66;
  }
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  objc_msgSend(v84, "allKeys");
  v73 = (id)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
  if (!v21)
  {

    goto LABEL_69;
  }
  v71 = 0;
  v72 = 0;
  v80 = *(_QWORD *)v89;
  log = 0;
LABEL_29:
  v79 = v21;
  v22 = 0;
  while (1)
  {
    if (*(_QWORD *)v89 != v80)
      objc_enumerationMutation(v73);
    v23 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v22);
    if (objc_msgSend(v23, "isEqualToString:", v82, v71))
    {
      objc_msgSend(v84, "objectForKey:", v82);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        v68 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
        if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          goto LABEL_64;
        *(_DWORD *)buf = 136315394;
        v99 = "PHASEMaterial.mm";
        v100 = 1024;
        v101 = 913;
        v69 = "%25s:%-5d Error: Empty result for AMAcousticParameterTypeAbsorption.";
        goto LABEL_63;
      }
      v25 = (void *)objc_opt_new();
      for (j = 0; ; ++j)
      {
        objc_msgSend(v24, "frequencyBands");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count") > j;

        if (!v28)
          break;
        v29 = [PHASESubband alloc];
        objc_msgSend(v24, "frequencyBands");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectAtIndexedSubscript:", j);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "floatValue");
        v33 = v32;
        objc_msgSend(v24, "absorptionUserData");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectAtIndexedSubscript:", j);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "floatValue");
        LODWORD(v37) = v36;
        LODWORD(v38) = v33;
        v39 = -[PHASESubband initWithFrequency:value:](v29, "initWithFrequency:value:", v38, v37);
        objc_msgSend(v25, "addObject:", v39);

      }
      v54 = log;
      log = -[PHASEAbsorptionData initWithAbsorptionCoefficients:]([PHASEAbsorptionData alloc], "initWithAbsorptionCoefficients:", v25);
      goto LABEL_50;
    }
    if (objc_msgSend(v23, "isEqualToString:", v78))
    {
      objc_msgSend(v84, "objectForKey:", v78);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        v68 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(0) + 432));
        if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          goto LABEL_64;
        *(_DWORD *)buf = 136315394;
        v99 = "PHASEMaterial.mm";
        v100 = 1024;
        v101 = 940;
        v69 = "%25s:%-5d Error: Empty result for AMAcousticParameterTypeScattering.";
        goto LABEL_63;
      }
      v25 = (void *)objc_opt_new();
      for (k = 0; ; ++k)
      {
        objc_msgSend(v24, "frequencyBands");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "count") > k;

        if (!v42)
          break;
        v43 = [PHASESubband alloc];
        objc_msgSend(v24, "frequencyBands");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectAtIndexedSubscript:", k);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "floatValue");
        v47 = v46;
        objc_msgSend(v24, "scatteringUserData");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectAtIndexedSubscript:", k);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "floatValue");
        LODWORD(v51) = v50;
        LODWORD(v52) = v47;
        v53 = -[PHASESubband initWithFrequency:value:](v43, "initWithFrequency:value:", v52, v51);
        objc_msgSend(v25, "addObject:", v53);

      }
      v54 = v72;
      v72 = -[PHASEScatteringData initWithScatteringCoefficients:]([PHASEScatteringData alloc], "initWithScatteringCoefficients:", v25);
      goto LABEL_50;
    }
    v55 = (Phase::Logger *)objc_msgSend(v23, "isEqualToString:", v75);
    if (!(_DWORD)v55)
      break;
    objc_msgSend(v84, "objectForKey:", v75);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)objc_opt_new();
      for (m = 0; ; ++m)
      {
        objc_msgSend(v24, "frequencyBands");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "count") > m;

        if (!v58)
          break;
        objc_msgSend(v24, "soundReductionIndexUserData");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectAtIndexedSubscript:", m);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "floatValue");
        expf((float)((float)(fmaxf(v61, 0.0) * -10.0) / 10.0) * 0.11513);

        v62 = [PHASESubband alloc];
        objc_msgSend(v24, "frequencyBands");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "objectAtIndexedSubscript:", m);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "floatValue");
        v65 = -[PHASESubband initWithFrequency:value:](v62, "initWithFrequency:value:");
        objc_msgSend(v25, "addObject:", v65);

      }
      v66 = [PHASESoundReductionIndex alloc];
      objc_msgSend(v24, "materialDepth");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "floatValue");
      v67 = -[PHASESoundReductionIndex initWithAttenuationCoefficients:measuredDepth:](v66, "initWithAttenuationCoefficients:measuredDepth:", v25);

      v71 = (void *)v67;
LABEL_50:

    }
    if (++v22 == v79)
    {
      v21 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
      if (!v21)
      {

        if (log && v72 && v71)
        {
          v18 = -[PHASEMaterial initWithEngine:soundReductionIndex:absorptionData:scatteringData:](self, "initWithEngine:soundReductionIndex:absorptionData:scatteringData:", v74, v71, log, v72);
          self = v18;
          goto LABEL_65;
        }
LABEL_69:
        std::terminate();
      }
      goto LABEL_29;
    }
  }
  v68 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v55) + 432));
  if (!os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    goto LABEL_64;
  *(_DWORD *)buf = 136315394;
  v99 = "PHASEMaterial.mm";
  v100 = 1024;
  v101 = 974;
  v69 = "%25s:%-5d Error: Empty result for AMAcousticParameterTypeSoundReductionIndex.";
LABEL_63:
  _os_log_impl(&dword_2164CC000, v68, OS_LOG_TYPE_ERROR, v69, buf, 0x12u);
LABEL_64:

  v18 = 0;
LABEL_65:

LABEL_66:
LABEL_67:

  return v18;
}

- (void)writeMaterialCoefs:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  PHASESoundReductionIndex *soundReductionIndex;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  float v12;
  PHASESubband *v13;
  PHASESubband *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  Phase::Logger *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  id WeakRetained;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE buf[32];
  _BYTE v29[128];
  uint64_t v30;
  _QWORD v31[3];

  v3 = a3;
  v31[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  if (WeakRetained)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    soundReductionIndex = self->_soundReductionIndex;
    if (soundReductionIndex)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[PHASESoundReductionIndex attenuationCoefficients](soundReductionIndex, "attenuationCoefficients");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v25 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v11, "value");
            objc_msgSend(v11, "frequency");
            log2f(v12 / 632.46);
            v13 = [PHASESubband alloc];
            objc_msgSend(v11, "frequency");
            v14 = -[PHASESubband initWithFrequency:value:](v13, "initWithFrequency:value:");
            objc_msgSend(v5, "addObject:", v14);

          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v8);
      }

    }
    v15 = v5;
    *(_QWORD *)buf = v15;
    *(_QWORD *)&buf[8] = self->_soundReductionIndex;
    *(_QWORD *)&buf[16] = self->_absorptionData;
    *(_QWORD *)&buf[24] = self->_scatteringData;
    if (v3)
    {
      v16 = objc_msgSend(WeakRetained, "implementation");
      -[PHASEMaterial setGeoMaterialHandle:](self, "setGeoMaterialHandle:", (*(uint64_t (**)(_QWORD, _BYTE *))(**(_QWORD **)(v16 + 368) + 32))(*(_QWORD *)(v16 + 368), buf));
    }
    else
    {
      v22 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
      (*(void (**)(uint64_t, uint64_t, _BYTE *))(*(_QWORD *)v22 + 88))(v22, -[PHASEMaterial geoMaterialHandle](self, "geoMaterialHandle"), buf);
    }

  }
  else
  {
    v17 = *MEMORY[0x24BDD0FC8];
    v30 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid PHASEEngine"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v20 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v19)
                                                                                        + 432)));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", v17);
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "PHASEMaterial.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1012;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = objc_msgSend(v21, "UTF8String");
      _os_log_impl(&dword_2164CC000, v20, OS_LOG_TYPE_ERROR, "%25s:%-5d %s", buf, 0x1Cu);

    }
  }

}

- (void)setAttenuationScale:(float)a3
{
  float v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  if (a3 < 0.0)
  {
    v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = 136315650;
      v7 = "PHASEMaterial.mm";
      v8 = 1024;
      v9 = 1049;
      v10 = 2048;
      v11 = v3;
      _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Input multipler %2.2f for setattenuationScale must be non-negative. Clamping.", (uint8_t *)&v6, 0x1Cu);
    }
    v3 = fmaxf(v3, 0.0);
  }
  if (self->_attenuationScale != v3)
  {
    self->_attenuationScale = v3;
    -[PHASEMaterial writeMaterialCoefs:](self, "writeMaterialCoefs:", 0);
  }
}

- (void)setAttenuationShift:(float)a3
{
  float v3;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  if (a3 < -1.0 || a3 > 1.0)
  {
    v6 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315650;
      v8 = "PHASEMaterial.mm";
      v9 = 1024;
      v10 = 1065;
      v11 = 2048;
      v12 = v3;
      _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d Input offset %2.2f for setattenuationShift is out-of-range. Clamping to [-1, 1].", (uint8_t *)&v7, 0x1Cu);
    }
    v3 = fminf(fmaxf(v3, -1.0), 1.0);
  }
  if (self->_attenuationShift != v3)
  {
    self->_attenuationShift = v3;
    -[PHASEMaterial writeMaterialCoefs:](self, "writeMaterialCoefs:", 0);
  }
}

- (void)setAttenuationTilt:(float)a3
{
  float v3;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  if (a3 < -1.0 || a3 > 1.0)
  {
    v6 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315650;
      v8 = "PHASEMaterial.mm";
      v9 = 1024;
      v10 = 1080;
      v11 = 2048;
      v12 = v3;
      _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d Input slope %2.2f for setattenuationTilt is out-of-range. Clamping to [-1, 1].", (uint8_t *)&v7, 0x1Cu);
    }
    v3 = fminf(fmaxf(v3, -1.0), 1.0);
  }
  if (self->_attenuationTilt != v3)
  {
    self->_attenuationTilt = v3;
    -[PHASEMaterial writeMaterialCoefs:](self, "writeMaterialCoefs:", 0);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id WeakRetained;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v6 = -[PHASEMaterial preset](self, "preset");
  -[PHASEMaterial soundReductionIndex](self, "soundReductionIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASEMaterial absorptionData](self, "absorptionData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASEMaterial scatteringData](self, "scatteringData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithEngine:preset:soundReductionIndex:absorptionData:scatteringData:", WeakRetained, v6, v7, v8, v9);

  -[PHASEMaterial attenuationScale](self, "attenuationScale");
  objc_msgSend(v10, "setAttenuationScale:");
  -[PHASEMaterial attenuationShift](self, "attenuationShift");
  objc_msgSend(v10, "setAttenuationShift:");
  -[PHASEMaterial attenuationTilt](self, "attenuationTilt");
  objc_msgSend(v10, "setAttenuationTilt:");
  return v10;
}

- (void)dealloc
{
  PHASEEngine **p_engine;
  id WeakRetained;
  id v5;
  uint64_t v6;
  objc_super v7;

  p_engine = &self->_engine;
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_engine);
    v6 = *(_QWORD *)(objc_msgSend(v5, "implementation") + 368);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v6 + 296))(v6, -[PHASEMaterial geoMaterialHandle](self, "geoMaterialHandle"));

  }
  v7.receiver = self;
  v7.super_class = (Class)PHASEMaterial;
  -[PHASEMaterial dealloc](&v7, sel_dealloc);
}

- (Handle64)geoMaterialHandle
{
  return self->_geoMaterialHandle;
}

- (void)setGeoMaterialHandle:(Handle64)a3
{
  self->_geoMaterialHandle = a3;
}

- (int64_t)preset
{
  return self->_preset;
}

- (PHASESoundReductionIndex)soundReductionIndex
{
  return self->_soundReductionIndex;
}

- (PHASEAbsorptionData)absorptionData
{
  return self->_absorptionData;
}

- (PHASEScatteringData)scatteringData
{
  return self->_scatteringData;
}

- (float)attenuationScale
{
  return self->_attenuationScale;
}

- (float)attenuationShift
{
  return self->_attenuationShift;
}

- (float)attenuationTilt
{
  return self->_attenuationTilt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scatteringData, 0);
  objc_storeStrong((id *)&self->_absorptionData, 0);
  objc_storeStrong((id *)&self->_soundReductionIndex, 0);
  objc_destroyWeak((id *)&self->_engine);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
