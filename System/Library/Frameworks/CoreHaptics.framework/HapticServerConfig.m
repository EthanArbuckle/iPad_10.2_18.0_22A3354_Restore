@implementation HapticServerConfig

void __61__HapticServerConfig_initWithHapticPlayer_withOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  id v21;
  id v22;
  NSObject *v23;
  int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t *v32;
  unint64_t v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t *v41;
  uint64_t v42;
  id v43;
  id v44;
  NSObject *v45;
  int v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t *v54;
  unint64_t v55;
  _QWORD *v56;
  uint64_t *v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t *v63;
  uint64_t v64;
  id v65;
  id v66;
  NSObject *v67;
  int v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t k;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t *v76;
  unint64_t v77;
  _QWORD *v78;
  uint64_t *v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  char *v84;
  uint64_t *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id v91;
  id v92;
  NSObject *v93;
  int v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _BYTE v119[128];
  uint8_t v120[128];
  uint8_t buf[4];
  const char *v122;
  __int16 v123;
  int v124;
  __int16 v125;
  const char *v126;
  __int16 v127;
  _BYTE v128[10];
  __int16 v129;
  int v130;
  __int16 v131;
  int v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v105 = a2;
  v104 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(v105, "objectForKey:", CFSTR("SupportsHapticPlayback"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) = objc_msgSend(v99, "BOOLValue");
    objc_msgSend(v105, "objectForKey:", CFSTR("SupportsAudioPlayback"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = objc_msgSend(v98, "BOOLValue");
    objc_msgSend(v105, "objectForKey:", CFSTR("SupportsAdvancedPatternPlayers"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 19) = objc_msgSend(v97, "BOOLValue");
    objc_msgSend(v105, "objectForKey:", CFSTR("UsingInternalHaptics"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = objc_msgSend(v96, "BOOLValue");
    objc_msgSend(v105, "objectForKey:", CFSTR("HapticContinuousTimeLimit"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)(*(_QWORD *)(a1 + 32) + 20) = (float)objc_msgSend(v95, "unsignedIntValue");
    if (kHAPIScope)
    {
      v6 = *(id *)kHAPIScope;
      if (!v6)
        goto LABEL_16;
    }
    else
    {
      v6 = MEMORY[0x1E0C81028];
      v9 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(unsigned __int8 *)(v10 + 17);
      v12 = *(unsigned __int8 *)(v10 + 19);
      v13 = *(unsigned __int8 *)(v10 + 16);
      LODWORD(v10) = *(float *)(v10 + 20);
      *(_DWORD *)buf = 136316674;
      v122 = "HapticServerConfig.mm";
      v123 = 1024;
      v124 = 128;
      v125 = 2080;
      v126 = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]_block_invoke";
      v127 = 1024;
      *(_DWORD *)v128 = v11;
      *(_WORD *)&v128[4] = 1024;
      *(_DWORD *)&v128[6] = v12;
      v129 = 1024;
      v130 = v13;
      v131 = 1024;
      v132 = v10;
      _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Server returned: supports audio: %d adv players: %d internal: %d cont time limit: %us", buf, 0x34u);
    }

LABEL_16:
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
    objc_msgSend(v105, "objectForKey:", CFSTR("HapticTransientDefaultIntensity"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = v15;
    objc_msgSend(v105, "objectForKey:", CFSTR("HapticTransientDefaultSharpness"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "floatValue");
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24) = v17;
    objc_msgSend(v105, "objectForKey:", CFSTR("HapticContinuousDefaultIntensity"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "floatValue");
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36) = v19;
    objc_msgSend(v105, "objectForKey:", CFSTR("HapticContinuousDefaultSharpness"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v100, "floatValue");
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28) = v20;
    objc_msgSend(v105, "objectForKey:", CFSTR("HapticTransientEventIDs"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (kHAPIScope)
    {
      v21 = *(id *)kHAPIScope;
      if (!v21)
        goto LABEL_23;
    }
    else
    {
      v21 = (id)MEMORY[0x1E0C81028];
      v22 = MEMORY[0x1E0C81028];
    }
    v23 = v21;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = objc_msgSend(v103, "count");
      *(_DWORD *)buf = 136315906;
      v122 = "HapticServerConfig.mm";
      v123 = 1024;
      v124 = 141;
      v125 = 2080;
      v126 = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]_block_invoke";
      v127 = 1024;
      *(_DWORD *)v128 = v24;
      _os_log_impl(&dword_1B573F000, v23, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Received %u haptic transient IDs", buf, 0x22u);
    }

LABEL_23:
    if (objc_msgSend(v103, "count"))
    {
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v25 = v103;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v114, v120, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v115;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v115 != v27)
              objc_enumerationMutation(v25);
            v29 = objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * i), "unsignedIntegerValue");
            v30 = v29;
            v31 = *(_QWORD **)(a1 + 32);
            v32 = (uint64_t *)v31[7];
            v33 = v31[8];
            if ((unint64_t)v32 >= v33)
            {
              v35 = (uint64_t *)v31[6];
              v36 = v32 - v35;
              if ((unint64_t)(v36 + 1) >> 61)
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              v37 = v33 - (_QWORD)v35;
              v38 = (uint64_t)(v33 - (_QWORD)v35) >> 2;
              if (v38 <= v36 + 1)
                v38 = v36 + 1;
              if (v37 >= 0x7FFFFFFFFFFFFFF8)
                v39 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v39 = v38;
              if (v39)
              {
                v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v31 + 8), v39);
                v35 = (uint64_t *)v31[6];
                v32 = (uint64_t *)v31[7];
              }
              else
              {
                v40 = 0;
              }
              v41 = (uint64_t *)&v40[8 * v36];
              *v41 = v30;
              v34 = v41 + 1;
              while (v32 != v35)
              {
                v42 = *--v32;
                *--v41 = v42;
              }
              v31[6] = v41;
              v31[7] = v34;
              v31[8] = &v40[8 * v39];
              if (v35)
                operator delete(v35);
            }
            else
            {
              *v32 = v29;
              v34 = v32 + 1;
            }
            v31[7] = v34;
          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v114, v120, 16);
        }
        while (v26);
      }

    }
    objc_msgSend(v105, "objectForKey:", CFSTR("HapticContinuousSustainedEventIDs"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (kHAPIScope)
    {
      v43 = *(id *)kHAPIScope;
      if (!v43)
        goto LABEL_55;
    }
    else
    {
      v43 = (id)MEMORY[0x1E0C81028];
      v44 = MEMORY[0x1E0C81028];
    }
    v45 = v43;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      v46 = objc_msgSend(v102, "count");
      *(_DWORD *)buf = 136315906;
      v122 = "HapticServerConfig.mm";
      v123 = 1024;
      v124 = 150;
      v125 = 2080;
      v126 = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]_block_invoke";
      v127 = 1024;
      *(_DWORD *)v128 = v46;
      _os_log_impl(&dword_1B573F000, v45, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Received %u haptic continuous sustained IDs", buf, 0x22u);
    }

LABEL_55:
    if (objc_msgSend(v102, "count"))
    {
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v47 = v102;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
      if (v48)
      {
        v49 = *(_QWORD *)v111;
        do
        {
          for (j = 0; j != v48; ++j)
          {
            if (*(_QWORD *)v111 != v49)
              objc_enumerationMutation(v47);
            v51 = objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * j), "unsignedIntegerValue");
            v52 = v51;
            v53 = *(_QWORD **)(a1 + 32);
            v54 = (uint64_t *)v53[10];
            v55 = v53[11];
            if ((unint64_t)v54 >= v55)
            {
              v57 = (uint64_t *)v53[9];
              v58 = v54 - v57;
              if ((unint64_t)(v58 + 1) >> 61)
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              v59 = v55 - (_QWORD)v57;
              v60 = (uint64_t)(v55 - (_QWORD)v57) >> 2;
              if (v60 <= v58 + 1)
                v60 = v58 + 1;
              if (v59 >= 0x7FFFFFFFFFFFFFF8)
                v61 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v61 = v60;
              if (v61)
              {
                v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v53 + 11), v61);
                v57 = (uint64_t *)v53[9];
                v54 = (uint64_t *)v53[10];
              }
              else
              {
                v62 = 0;
              }
              v63 = (uint64_t *)&v62[8 * v58];
              *v63 = v52;
              v56 = v63 + 1;
              while (v54 != v57)
              {
                v64 = *--v54;
                *--v63 = v64;
              }
              v53[9] = v63;
              v53[10] = v56;
              v53[11] = &v62[8 * v61];
              if (v57)
                operator delete(v57);
            }
            else
            {
              *v54 = v51;
              v56 = v54 + 1;
            }
            v53[10] = v56;
          }
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v110, v119, 16);
        }
        while (v48);
      }

    }
    objc_msgSend(v105, "objectForKey:", CFSTR("HapticContinuousNonsustainedEventIDs"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (kHAPIScope)
    {
      v65 = *(id *)kHAPIScope;
      if (!v65)
        goto LABEL_87;
    }
    else
    {
      v65 = (id)MEMORY[0x1E0C81028];
      v66 = MEMORY[0x1E0C81028];
    }
    v67 = v65;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      v68 = objc_msgSend(v101, "count");
      *(_DWORD *)buf = 136315906;
      v122 = "HapticServerConfig.mm";
      v123 = 1024;
      v124 = 159;
      v125 = 2080;
      v126 = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]_block_invoke";
      v127 = 1024;
      *(_DWORD *)v128 = v68;
      _os_log_impl(&dword_1B573F000, v67, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Received %u haptic continuous nonsustained IDs", buf, 0x22u);
    }

LABEL_87:
    if (objc_msgSend(v101, "count"))
    {
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v69 = v101;
      v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
      if (v70)
      {
        v71 = *(_QWORD *)v107;
        do
        {
          for (k = 0; k != v70; ++k)
          {
            if (*(_QWORD *)v107 != v71)
              objc_enumerationMutation(v69);
            v73 = objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * k), "unsignedIntegerValue");
            v74 = v73;
            v75 = *(_QWORD **)(a1 + 32);
            v76 = (uint64_t *)v75[13];
            v77 = v75[14];
            if ((unint64_t)v76 >= v77)
            {
              v79 = (uint64_t *)v75[12];
              v80 = v76 - v79;
              if ((unint64_t)(v80 + 1) >> 61)
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              v81 = v77 - (_QWORD)v79;
              v82 = (uint64_t)(v77 - (_QWORD)v79) >> 2;
              if (v82 <= v80 + 1)
                v82 = v80 + 1;
              if (v81 >= 0x7FFFFFFFFFFFFFF8)
                v83 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v83 = v82;
              if (v83)
              {
                v84 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v75 + 14), v83);
                v79 = (uint64_t *)v75[12];
                v76 = (uint64_t *)v75[13];
              }
              else
              {
                v84 = 0;
              }
              v85 = (uint64_t *)&v84[8 * v80];
              *v85 = v74;
              v78 = v85 + 1;
              while (v76 != v79)
              {
                v86 = *--v76;
                *--v85 = v86;
              }
              v75[12] = v85;
              v75[13] = v78;
              v75[14] = &v84[8 * v83];
              if (v79)
                operator delete(v79);
            }
            else
            {
              *v76 = v73;
              v78 = v76 + 1;
            }
            v75[13] = v78;
          }
          v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
        }
        while (v70);
      }

    }
    objc_msgSend(v105, "objectForKey:", CFSTR("BuiltInAudioEventIDs"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v87, "count"))
      goto LABEL_120;
    v88 = objc_msgSend(v87, "copy");
    v89 = *(_QWORD *)(a1 + 32);
    v90 = *(void **)(v89 + 40);
    *(_QWORD *)(v89 + 40) = v88;

    if (kHAPIScope)
    {
      v91 = *(id *)kHAPIScope;
      if (!v91)
      {
LABEL_120:

        goto LABEL_121;
      }
    }
    else
    {
      v91 = (id)MEMORY[0x1E0C81028];
      v92 = MEMORY[0x1E0C81028];
    }
    v93 = v91;
    if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
    {
      v94 = objc_msgSend(v87, "count");
      *(_DWORD *)buf = 136315906;
      v122 = "HapticServerConfig.mm";
      v123 = 1024;
      v124 = 170;
      v125 = 2080;
      v126 = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]_block_invoke";
      v127 = 1024;
      *(_DWORD *)v128 = v94;
      _os_log_impl(&dword_1B573F000, v93, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Received %u built-in audio event IDs", buf, 0x22u);
    }

    goto LABEL_120;
  }
  if (kHAPIScope)
  {
    v5 = *(id *)kHAPIScope;
    if (!v5)
      goto LABEL_121;
  }
  else
  {
    v5 = MEMORY[0x1E0C81028];
    v7 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 136315906;
    v122 = "HapticServerConfig.mm";
    v123 = 1024;
    v124 = 179;
    v125 = 2080;
    v126 = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]_block_invoke";
    v127 = 2112;
    *(_QWORD *)v128 = v8;
    _os_log_impl(&dword_1B573F000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Server query returned error '%@'", buf, 0x26u);
  }

LABEL_121:
}

- (id).cxx_construct
{
  *((_QWORD *)self + 14) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  return self;
}

- (BOOL)supportsAudioPlayback
{
  return self->_supportsAudioPlayback;
}

- (BOOL)supportsHapticPlayback
{
  return self->_supportsHapticPlayback;
}

- (HapticServerConfig)initWithHapticPlayer:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  HapticServerConfig *v10;
  id v11;
  const char *v12;
  id v13;
  void *v14;
  __SecTask *v15;
  __SecTask *v16;
  const __CFBoolean *v17;
  const __CFBoolean *v18;
  CFTypeID v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  NSObject *v47;
  id v48;
  int v49;
  HapticServerConfig *v50;
  NSObject *v52;
  id v53;
  NSObject *v54;
  id v55;
  HapticServerConfig *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  __CFString *v63;
  id v64;
  id v65;
  _QWORD v66[4];
  HapticServerConfig *v67;
  __CFString *v68;
  _BYTE *v69;
  objc_super v70;
  _BYTE buf[40];
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v64 = a3;
  v65 = a4;
  v70.receiver = self;
  v70.super_class = (Class)HapticServerConfig;
  v56 = -[HapticServerConfig init](&v70, sel_init);
  if (!v56)
  {
    v10 = 0;
LABEL_74:
    v10 = v10;
    v50 = v10;
    goto LABEL_75;
  }
  objc_msgSend(v65, "objectForKey:", CFSTR("Locality"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    if (kHAPIScope)
    {
      v9 = *(id *)kHAPIScope;
      if (!v9)
      {
        v63 = CFSTR("Default");
        goto LABEL_18;
      }
    }
    else
    {
      v9 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    v63 = CFSTR("Default");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "HapticServerConfig.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 37;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]";
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = CFSTR("Default");
    v12 = "%25s:%-5d %s: Engine not configured with a Locality - querying using '%@'";
    goto LABEL_16;
  }
  v63 = (__CFString *)v7;
  if (!kHAPIScope)
  {
    v9 = MEMORY[0x1E0C81028];
    v11 = MEMORY[0x1E0C81028];
    goto LABEL_11;
  }
  v9 = *(id *)kHAPIScope;
  if (v9)
  {
LABEL_11:
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
LABEL_17:

      goto LABEL_18;
    }
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "HapticServerConfig.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 40;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]";
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v8;
    v12 = "%25s:%-5d %s: Querying server for capabilities with '%@' Locality";
LABEL_16:
    _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEFAULT, v12, buf, 0x26u);
    goto LABEL_17;
  }
LABEL_18:
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = SecTaskCreateFromSelf(0);
  v16 = v15;
  if (v15)
  {
    v17 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v15, CFSTR("com.apple.private.allow-background-haptics"), 0);
    v18 = v17;
    if (v17)
    {
      v19 = CFGetTypeID(v17);
      v20 = v19 == CFBooleanGetTypeID() && CFBooleanGetValue(v18) != 0;
      CFRelease(v18);
    }
    else
    {
      v20 = 0;
    }
    CFRelease(v16);
  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v14, "numberWithBool:", v20);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dictionaryWithObjectsAndKeys:", v63, CFSTR("RequestedLocality"), v57, CFSTR("AllowBackgroundHaptics"), v60, CFSTR("SupportsAudioPlayback"), v59, CFSTR("SupportsHapticPlayback"), v61, CFSTR("SupportsAdvancedPatternPlayers"), v58, CFSTR("UsingInternalHaptics"), v22, CFSTR("HapticContinuousTimeLimit"), v24, CFSTR("HapticTransientDefaultIntensity"), v26,
    CFSTR("HapticTransientDefaultSharpness"),
    v28,
    CFSTR("HapticContinuousDefaultIntensity"),
    v30,
    CFSTR("HapticContinuousDefaultSharpness"),
    v31,
    CFSTR("HapticTransientEventIDs"),
    v32,
    CFSTR("HapticContinuousSustainedEventIDs"),
    v33,
    CFSTR("HapticContinuousNonsustainedEventIDs"),
    v34,
    CFSTR("BuiltInAudioEventIDs"),
    0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v65, "objectForKey:", CFSTR("Priority"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36)
  {
LABEL_44:
    objc_msgSend(v65, "objectForKey:", CFSTR("HapticPowerUsage"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v41)
      goto LABEL_57;
    if (kHAPIScope)
    {
      v42 = *(id *)kHAPIScope;
      if (!v42)
        goto LABEL_52;
    }
    else
    {
      v42 = MEMORY[0x1E0C81028];
      v43 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "HapticServerConfig.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 88;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]";
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v41;
      _os_log_impl(&dword_1B573F000, v42, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Querying server for capabilities with HapticPowerUsage '%@'", buf, 0x26u);
    }

LABEL_52:
    if ((objc_msgSend(v41, "containsString:", CFSTR("LowPower")) & 1) != 0)
    {
      v44 = 10;
LABEL_56:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setObject:forKey:", v45, CFSTR("RequestedPowerUsage"));

LABEL_57:
      objc_msgSend(v65, "objectForKey:", CFSTR("UsageCategory"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v46)
      {
LABEL_66:
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        *(_QWORD *)&buf[24] = __Block_byref_object_copy_;
        *(_QWORD *)&buf[32] = __Block_byref_object_dispose_;
        v72 = 0;
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __61__HapticServerConfig_initWithHapticPlayer_withOptions_error___block_invoke;
        v66[3] = &unk_1E695FE88;
        v69 = buf;
        v10 = v56;
        v67 = v10;
        v68 = v63;
        objc_msgSend(v64, "queryServerCapabilities:reply:", v35, v66);
        if (a5)
          *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {

          v10 = 0;
        }

        _Block_object_dispose(buf, 8);
        v49 = 0;
        goto LABEL_71;
      }
      if (kHAPIScope)
      {
        v47 = *(id *)kHAPIScope;
        if (!v47)
        {
LABEL_65:
          objc_msgSend(v35, "setObject:forKey:", v46, CFSTR("RequestedUsageCategory"));
          goto LABEL_66;
        }
      }
      else
      {
        v47 = MEMORY[0x1E0C81028];
        v48 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "HapticServerConfig.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 106;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]";
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v46;
        _os_log_impl(&dword_1B573F000, v47, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Querying server for UsageCategory of '%@'", buf, 0x26u);
      }

      goto LABEL_65;
    }
    if ((objc_msgSend(v41, "containsString:", CFSTR("HighPower")) & 1) != 0)
    {
      v44 = 11;
      goto LABEL_56;
    }
    if (kHAPIScope)
    {
      v52 = *(id *)kHAPIScope;
      if (!v52)
      {
LABEL_83:
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4816, 0);
          v10 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }
        v49 = 1;
        v46 = v56;
LABEL_71:

        goto LABEL_72;
      }
    }
    else
    {
      v52 = MEMORY[0x1E0C81028];
      v53 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "HapticServerConfig.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 97;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]";
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v41;
      _os_log_impl(&dword_1B573F000, v52, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Illegal power usage: %@", buf, 0x26u);
    }

    goto LABEL_83;
  }
  if (kHAPIScope)
  {
    v37 = *(id *)kHAPIScope;
    if (!v37)
      goto LABEL_35;
  }
  else
  {
    v37 = MEMORY[0x1E0C81028];
    v38 = MEMORY[0x1E0C81028];
  }
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "HapticServerConfig.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 64;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]";
    *(_WORD *)&buf[28] = 2112;
    *(_QWORD *)&buf[30] = v36;
    _os_log_impl(&dword_1B573F000, v37, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: Querying server for capabilities with Priority '%@'", buf, 0x26u);
  }

LABEL_35:
  if ((objc_msgSend(v36, "containsString:", CFSTR("LowPriority")) & 1) != 0)
  {
    v39 = 1;
LABEL_43:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKey:", v40, CFSTR("RequestedPriority"));

    goto LABEL_44;
  }
  if ((objc_msgSend(v36, "containsString:", CFSTR("HighPriority")) & 1) != 0)
  {
    v39 = 2;
    goto LABEL_43;
  }
  if ((objc_msgSend(v36, "containsString:", CFSTR("ExclusivePriority")) & 1) != 0)
  {
    v39 = 4;
    goto LABEL_43;
  }
  if ((objc_msgSend(v36, "containsString:", CFSTR("HighestPriority")) & 1) != 0)
  {
    v39 = 3;
    goto LABEL_43;
  }
  if (!kHAPIScope)
  {
    v54 = MEMORY[0x1E0C81028];
    v55 = MEMORY[0x1E0C81028];
    goto LABEL_91;
  }
  v54 = *(id *)kHAPIScope;
  if (v54)
  {
LABEL_91:
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "HapticServerConfig.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 79;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "-[HapticServerConfig initWithHapticPlayer:withOptions:error:]";
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v36;
      _os_log_impl(&dword_1B573F000, v54, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Illegal priority: %@", buf, 0x26u);
    }

  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreHaptics"), -4816, 0);
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v49 = 1;
  v41 = v56;
LABEL_72:

  if (!v49)
    goto LABEL_74;
  v50 = 0;
LABEL_75:

  return v50;
}

- (vector<unsigned)hapticTransientIDs
{
  vector<unsigned long, std::allocator<unsigned long>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_hapticTransientIDs, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (vector<unsigned)hapticContinuousSustainedIDs
{
  vector<unsigned long, std::allocator<unsigned long>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_hapticContinuousSustainedIDs, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__46);
  return result;
}

- (vector<unsigned)hapticContinuousNonsustainedIDs
{
  vector<unsigned long, std::allocator<unsigned long>> *result;

  objc_copyCppObjectAtomic(retstr, &self->_hapticContinuousNonsustainedIDs, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__47);
  return result;
}

- (float)hapticContinuousTimeLimit
{
  return self->_hapticContinuousTimeLimit;
}

- (float)defaultHapticTransientEventIntensity
{
  return self->_defaultHapticTransientEventIntensity;
}

- (BOOL)usingInternalHaptics
{
  return self->_usingInternalHaptics;
}

- (BOOL)supportsAdvancedPatternPlayers
{
  return self->_supportsAdvancedPatternPlayers;
}

- (NSString)currentLocality
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (float)defaultHapticTransientEventSharpness
{
  return self->_defaultHapticTransientEventSharpness;
}

- (float)defaultHapticContinuousEventSharpness
{
  return self->_defaultHapticContinuousEventSharpness;
}

- (float)defaultHapticContinuousEventIntensity
{
  return self->_defaultHapticContinuousEventIntensity;
}

- (NSDictionary)builtInAudioEventIDs
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  unint64_t *begin;
  unint64_t *v4;
  unint64_t *v5;

  begin = self->_hapticContinuousNonsustainedIDs.__begin_;
  if (begin)
  {
    self->_hapticContinuousNonsustainedIDs.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_hapticContinuousSustainedIDs.__begin_;
  if (v4)
  {
    self->_hapticContinuousSustainedIDs.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_hapticTransientIDs.__begin_;
  if (v5)
  {
    self->_hapticTransientIDs.__end_ = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_builtInAudioEventIDs, 0);
  objc_storeStrong((id *)&self->_currentLocality, 0);
}

@end
