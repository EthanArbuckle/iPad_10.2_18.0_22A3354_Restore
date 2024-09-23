@implementation PKInkParser

+ (void)loadFunction:(void *)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __CFString *v9;
  NSObject *v10;
  uint64_t v11;
  void **v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  float v17;
  double v18;
  unint64_t v19;
  double *v20;
  double *v21;
  double *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  double *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void **v33;
  uint64_t k;
  float v35;
  double v36;
  unint64_t v37;
  double *v38;
  double *v39;
  double *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  double *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void **v51;
  uint64_t m;
  float v53;
  double v54;
  unint64_t v55;
  double *v56;
  double *v57;
  double *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  double *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t n;
  float v70;
  double v71;
  unint64_t v72;
  double *v73;
  double *v74;
  double *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  double *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void **v86;
  uint64_t ii;
  float v88;
  double v89;
  unint64_t v90;
  double *v91;
  double *v92;
  double *v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  char *v98;
  double *v99;
  uint64_t v100;
  void *v101;
  _BOOL4 v102;
  void *v103;
  float v104;
  float v105;
  double v106;
  void *v107;
  BOOL v108;
  void *v109;
  float v110;
  void *v111;
  float v112;
  id v113;
  __CFString *v115;
  void *v116;
  char *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
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
  __int128 v140;
  __int128 v141;
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  uint8_t v146[128];
  uint8_t buf[128];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  v113 = a3;
  objc_opt_self();
  v3 = v113;
  objc_opt_self();
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v138, buf, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v139;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v139 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * i);
        if ((objc_msgSend(&unk_1E77ECDF0, "containsObject:", v8) & 1) == 0)
          objc_msgSend(&unk_1E77ECE08, "containsObject:", v8);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v138, buf, 16);
    }
    while (v5);
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("type"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v9, "length"))
  {
    v10 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "No function type, assuming piecewise", buf, 2u);
    }

    v9 = CFSTR("piecewise");
  }
  v115 = v9;
  if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("piecewise")))
  {
    v11 = operator new();
    *(_OWORD *)(v11 + 32) = 0u;
    *(_OWORD *)(v11 + 48) = 0u;
    *(_OWORD *)v11 = 0u;
    *(_OWORD *)(v11 + 16) = 0u;
    *(_QWORD *)v11 = &unk_1E77743F0;
    *(_OWORD *)(v11 + 56) = 0u;
    v12 = (void **)(v11 + 56);
    *(_OWORD *)(v11 + 72) = 0u;
    *(_OWORD *)(v11 + 88) = 0u;
    *(_OWORD *)(v11 + 104) = 0u;
    *(_OWORD *)(v11 + 120) = 0u;
    *(_OWORD *)(v11 + 136) = 0u;
    *(_OWORD *)(v11 + 152) = 0u;
    *(_QWORD *)(v11 + 168) = 0;
    v134 = 0u;
    v135 = 0u;
    v136 = 0u;
    v137 = 0u;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("input"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v3;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v134, v146, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v135;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v135 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v134 + 1) + 8 * j), "floatValue");
          v18 = v17;
          v20 = *(double **)(v11 + 64);
          v19 = *(_QWORD *)(v11 + 72);
          if ((unint64_t)v20 >= v19)
          {
            v22 = (double *)*v12;
            v23 = ((char *)v20 - (_BYTE *)*v12) >> 3;
            v24 = v23 + 1;
            if ((unint64_t)(v23 + 1) >> 61)
              std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
            v25 = v19 - (_QWORD)v22;
            if (v25 >> 2 > v24)
              v24 = v25 >> 2;
            if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
              v26 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v26 = v24;
            if (v26)
            {
              v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v11 + 72, v26);
              v22 = *(double **)(v11 + 56);
              v20 = *(double **)(v11 + 64);
            }
            else
            {
              v27 = 0;
            }
            v28 = (double *)&v27[8 * v23];
            *v28 = v18;
            v21 = v28 + 1;
            while (v20 != v22)
            {
              v29 = *((_QWORD *)v20-- - 1);
              *((_QWORD *)v28-- - 1) = v29;
            }
            *(_QWORD *)(v11 + 56) = v28;
            *(_QWORD *)(v11 + 64) = v21;
            *(_QWORD *)(v11 + 72) = &v27[8 * v26];
            if (v22)
              operator delete(v22);
          }
          else
          {
            *v20 = v18;
            v21 = v20 + 1;
          }
          *(_QWORD *)(v11 + 64) = v21;
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v134, v146, 16);
      }
      while (v14);
    }

    v132 = 0u;
    v133 = 0u;
    v130 = 0u;
    v131 = 0u;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("output"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v130, v145, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v131;
      v33 = (void **)(v11 + 80);
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v131 != v32)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v130 + 1) + 8 * k), "floatValue");
          v36 = v35;
          v38 = *(double **)(v11 + 88);
          v37 = *(_QWORD *)(v11 + 96);
          if ((unint64_t)v38 >= v37)
          {
            v40 = (double *)*v33;
            v41 = ((char *)v38 - (_BYTE *)*v33) >> 3;
            v42 = v41 + 1;
            if ((unint64_t)(v41 + 1) >> 61)
              std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
            v43 = v37 - (_QWORD)v40;
            if (v43 >> 2 > v42)
              v42 = v43 >> 2;
            if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF8)
              v44 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v44 = v42;
            if (v44)
            {
              v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v11 + 96, v44);
              v40 = *(double **)(v11 + 80);
              v38 = *(double **)(v11 + 88);
            }
            else
            {
              v45 = 0;
            }
            v46 = (double *)&v45[8 * v41];
            *v46 = v36;
            v39 = v46 + 1;
            while (v38 != v40)
            {
              v47 = *((_QWORD *)v38-- - 1);
              *((_QWORD *)v46-- - 1) = v47;
            }
            *(_QWORD *)(v11 + 80) = v46;
            *(_QWORD *)(v11 + 88) = v39;
            *(_QWORD *)(v11 + 96) = &v45[8 * v44];
            if (v40)
              operator delete(v40);
          }
          else
          {
            *v38 = v36;
            v39 = v38 + 1;
          }
          *(_QWORD *)(v11 + 88) = v39;
        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v130, v145, 16);
      }
      while (v31);
    }

    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("controls"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v126, v144, 16);
    if (v49)
    {
      v50 = *(_QWORD *)v127;
      v51 = (void **)(v11 + 104);
      do
      {
        for (m = 0; m != v49; ++m)
        {
          if (*(_QWORD *)v127 != v50)
            objc_enumerationMutation(v48);
          objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * m), "floatValue");
          v54 = v53;
          v56 = *(double **)(v11 + 112);
          v55 = *(_QWORD *)(v11 + 120);
          if ((unint64_t)v56 >= v55)
          {
            v58 = (double *)*v51;
            v59 = ((char *)v56 - (_BYTE *)*v51) >> 3;
            v60 = v59 + 1;
            if ((unint64_t)(v59 + 1) >> 61)
              std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
            v61 = v55 - (_QWORD)v58;
            if (v61 >> 2 > v60)
              v60 = v61 >> 2;
            if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF8)
              v62 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v62 = v60;
            if (v62)
            {
              v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v11 + 120, v62);
              v58 = *(double **)(v11 + 104);
              v56 = *(double **)(v11 + 112);
            }
            else
            {
              v63 = 0;
            }
            v64 = (double *)&v63[8 * v59];
            *v64 = v54;
            v57 = v64 + 1;
            while (v56 != v58)
            {
              v65 = *((_QWORD *)v56-- - 1);
              *((_QWORD *)v64-- - 1) = v65;
            }
            *(_QWORD *)(v11 + 104) = v64;
            *(_QWORD *)(v11 + 112) = v57;
            *(_QWORD *)(v11 + 120) = &v63[8 * v62];
            if (v58)
              operator delete(v58);
          }
          else
          {
            *v56 = v54;
            v57 = v56 + 1;
          }
          *(_QWORD *)(v11 + 112) = v57;
        }
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v126, v144, 16);
      }
      while (v49);
    }

    v124 = 0u;
    v125 = 0u;
    v122 = 0u;
    v123 = 0u;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("minOutput"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v122, v143, 16);
    v117 = (char *)(v11 + 8);
    if (v67)
    {
      v68 = *(_QWORD *)v123;
      do
      {
        for (n = 0; n != v67; ++n)
        {
          if (*(_QWORD *)v123 != v68)
            objc_enumerationMutation(v66);
          objc_msgSend(*(id *)(*((_QWORD *)&v122 + 1) + 8 * n), "floatValue");
          v71 = v70;
          v73 = *(double **)(v11 + 16);
          v72 = *(_QWORD *)(v11 + 24);
          if ((unint64_t)v73 >= v72)
          {
            v75 = *(double **)v117;
            v76 = ((uint64_t)v73 - *(_QWORD *)v117) >> 3;
            v77 = v76 + 1;
            if ((unint64_t)(v76 + 1) >> 61)
              std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
            v78 = v72 - (_QWORD)v75;
            if (v78 >> 2 > v77)
              v77 = v78 >> 2;
            if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFF8)
              v79 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v79 = v77;
            if (v79)
            {
              v80 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v11 + 24, v79);
              v75 = *(double **)(v11 + 8);
              v73 = *(double **)(v11 + 16);
            }
            else
            {
              v80 = 0;
            }
            v81 = (double *)&v80[8 * v76];
            *v81 = v71;
            v74 = v81 + 1;
            while (v73 != v75)
            {
              v82 = *((_QWORD *)v73-- - 1);
              *((_QWORD *)v81-- - 1) = v82;
            }
            *(_QWORD *)(v11 + 8) = v81;
            *(_QWORD *)(v11 + 16) = v74;
            *(_QWORD *)(v11 + 24) = &v80[8 * v79];
            if (v75)
              operator delete(v75);
          }
          else
          {
            *v73 = v71;
            v74 = v73 + 1;
          }
          *(_QWORD *)(v11 + 16) = v74;
        }
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v122, v143, 16);
      }
      while (v67);
    }

    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxOutput"));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v118, v142, 16);
    if (v84)
    {
      v85 = *(_QWORD *)v119;
      v86 = (void **)(v11 + 32);
      do
      {
        for (ii = 0; ii != v84; ++ii)
        {
          if (*(_QWORD *)v119 != v85)
            objc_enumerationMutation(v83);
          objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * ii), "floatValue");
          v89 = v88;
          v91 = *(double **)(v11 + 40);
          v90 = *(_QWORD *)(v11 + 48);
          if ((unint64_t)v91 >= v90)
          {
            v93 = (double *)*v86;
            v94 = ((char *)v91 - (_BYTE *)*v86) >> 3;
            v95 = v94 + 1;
            if ((unint64_t)(v94 + 1) >> 61)
              std::vector<AttachmentTileInfo>::__throw_length_error[abi:ne180100]();
            v96 = v90 - (_QWORD)v93;
            if (v96 >> 2 > v95)
              v95 = v96 >> 2;
            if ((unint64_t)v96 >= 0x7FFFFFFFFFFFFFF8)
              v97 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v97 = v95;
            if (v97)
            {
              v98 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v11 + 48, v97);
              v93 = *(double **)(v11 + 32);
              v91 = *(double **)(v11 + 40);
            }
            else
            {
              v98 = 0;
            }
            v99 = (double *)&v98[8 * v94];
            *v99 = v89;
            v92 = v99 + 1;
            while (v91 != v93)
            {
              v100 = *((_QWORD *)v91-- - 1);
              *((_QWORD *)v99-- - 1) = v100;
            }
            *(_QWORD *)(v11 + 32) = v99;
            *(_QWORD *)(v11 + 40) = v92;
            *(_QWORD *)(v11 + 48) = &v98[8 * v97];
            if (v93)
              operator delete(v93);
          }
          else
          {
            *v91 = v89;
            v92 = v91 + 1;
          }
          *(_QWORD *)(v11 + 40) = v92;
        }
        v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v118, v142, 16);
      }
      while (v84);
    }

    v3 = v116;
    objc_msgSend(v116, "objectForKeyedSubscript:", CFSTR("minOutput"));
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v101 == 0;

    if (v102)
    {
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(v117, *(char **)(v11 + 80), *(_QWORD *)(v11 + 88), (uint64_t)(*(_QWORD *)(v11 + 88) - *(_QWORD *)(v11 + 80)) >> 3);
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)(v11 + 32), *(char **)(v11 + 80), *(_QWORD *)(v11 + 88), (uint64_t)(*(_QWORD *)(v11 + 88) - *(_QWORD *)(v11 + 80)) >> 3);
    }
    objc_opt_self();
    PKFunctionPiecewiseBezier::solve((PKFunctionPiecewiseBezier *)v11);
  }
  else if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("identity")))
  {
    v11 = operator new();
    *(_QWORD *)(v11 + 48) = 0;
    *(_OWORD *)(v11 + 16) = 0u;
    *(_OWORD *)(v11 + 32) = 0u;
    *(_OWORD *)v11 = 0u;
    *(_QWORD *)v11 = &off_1E7773E80;
  }
  else if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("constant")))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("defaultValue"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "floatValue");
    v105 = v104;

    v11 = operator new();
    v106 = v105;
    *(_OWORD *)(v11 + 40) = 0u;
    *(_OWORD *)(v11 + 24) = 0u;
    *(_OWORD *)(v11 + 8) = 0u;
    *(_QWORD *)v11 = &unk_1E7773E40;
    *(double *)(v11 + 56) = v106;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("minValue"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v107 == 0;

    if (v108)
    {
      *(double *)(v11 + 64) = v106;
      *(double *)(v11 + 72) = v106;
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("minValue"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "floatValue");
      *(double *)(v11 + 64) = v110;

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("maxValue"));
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "floatValue");
      *(double *)(v11 + 72) = v112;

    }
  }
  else
  {
    v11 = 0;
  }
  *a1 = v11;

}

+ (void)loadOutput:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id obj;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  objc_opt_self();
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  +[PKInkProperties inputNames](PKInkProperties, "inputNames");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v29;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v38;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v38 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v6);
        v36 = 0;
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("input-mask"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v8) = objc_msgSend(v9, "containsObject:", CFSTR("touch"));
        v10 = objc_msgSend(v9, "containsObject:", CFSTR("force-touch"));
        v11 = objc_msgSend(v9, "containsObject:", CFSTR("stylus"));
        v12 = 4;
        if (!(_DWORD)v8)
          v12 = 0;
        if (v10)
          v13 = 2;
        else
          v13 = 0;
        v14 = v13 | v12 | v11;
        if (!v14)
          v14 = 7;
        v33[0] = v14;
        v15 = objc_msgSend(v9, "containsObject:", CFSTR("phone"));
        if (objc_msgSend(v9, "containsObject:", CFSTR("pad")))
          v16 = 2;
        else
          v16 = 0;
        v17 = v16 | v15;
        if (!v17)
          v17 = 3;
        v33[1] = v17;
        v34 = 3;
        v18 = objc_msgSend(v9, "containsObject:", CFSTR("snapped"));
        if (objc_msgSend(v9, "containsObject:", CFSTR("unsnapped")))
          v19 = 2;
        else
          v19 = 0;
        v20 = v19 | v18;
        if (!v20)
          v20 = 3;
        v34 = v20;
        v35 = 0;
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("input"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(v31, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22)
            v35 = objc_msgSend(v22, "integerValue");

        }
        if (v35 != 5)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("function"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[PKInkParser loadFunction:](&v32, (uint64_t)PKInkParser, v24);
          v25 = v36;
          v36 = v32;
          if (v25)
            (*(void (**)(uint64_t))(*(_QWORD *)v25 + 40))(v25);

        }
        v26 = a1[1];
        if (v26 >= a1[2])
        {
          v27 = std::vector<PKOutputFunction>::__push_back_slow_path<PKOutputFunction>(a1, (const PKOutputFunction *)v33);
        }
        else
        {
          PKOutputFunction::PKOutputFunction((PKOutputFunction *)a1[1], (const PKOutputFunction *)v33);
          v27 = v26 + 40;
          a1[1] = v26 + 40;
        }
        a1[1] = v27;

        v28 = v36;
        v36 = 0;
        if (v28)
          (*(void (**)(uint64_t))(*(_QWORD *)v28 + 40))(v28);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v4);
  }

}

+ (PKInkBehavior)inkBehaviorVariantWithDictionary:(void *)a3 renderingDescriptor:(void *)a4 identifier:(uint64_t)a5 version:(void *)a6 variant:
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  float v21;
  double v22;
  void *v23;
  void *v24;
  float v25;
  double v26;
  void *v27;
  void *v28;
  float v29;
  double v30;
  void *v31;
  void *v32;
  float v33;
  double v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  float v39;
  double v40;
  void *v41;
  void *v42;
  float v43;
  double v44;
  void *v45;
  float v46;
  float v47;
  void *v48;
  float v49;
  float v50;
  void *v51;
  float v52;
  float v53;
  void *v54;
  float v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  float v60;
  float v61;
  void *v62;
  float v63;
  void *v64;
  float v65;
  float v66;
  void *v67;
  uint64_t v68;
  void *v69;
  char v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  PKOutputFunction *v92;
  void *v93;
  void *v94;
  float v95;
  float v96;
  void *v97;
  float v98;
  float v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  PKInkBehavior *v105;
  PKInkBehavior *v106;
  PKInkBehavior *v107;
  void *v108;
  _BOOL4 v109;
  void *v110;
  uint64_t v112;
  double v113;
  double v114;
  float v115;
  double v116;
  double v117;
  void *v118;
  PKInkAnimationDescriptor *v119;
  void *v120;
  PKInkSmoothingDescriptor *v121;
  id v122;
  id v123;
  void *v124;
  id v125;
  id v126;
  _QWORD v127[3];
  _QWORD v128[3];
  _QWORD v129[3];
  _QWORD v130[3];
  _QWORD v131[3];
  _QWORD v132[3];
  _QWORD v133[6];
  PKOutputFunction *v134;
  PKOutputFunction *v135;
  PKOutputFunction *v136;
  PKOutputFunction *v137;
  void ***v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  PKOutputFunction *v143;
  PKOutputFunction *v144;
  PKOutputFunction *v145;
  PKOutputFunction *v146;
  const __CFString *v147;
  const __CFString *v148;
  const __CFString *v149;
  const __CFString *v150;
  const __CFString *v151;
  const __CFString *v152;
  const __CFString *v153;
  const __CFString *v154;
  const __CFString *v155;
  const __CFString *v156;
  const __CFString *v157;
  const __CFString *v158;
  const __CFString *v159;
  const __CFString *v160;
  const __CFString *v161;
  const __CFString *v162;
  const __CFString *v163;
  const __CFString *v164;
  const __CFString *v165;
  const __CFString *v166;
  const __CFString *v167;
  const __CFString *v168;
  const __CFString *v169;
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v125 = a3;
  v122 = a4;
  v123 = a6;
  objc_opt_self();
  v126 = v10;
  objc_opt_self();
  v11 = (void *)MEMORY[0x1E0C99DE8];
  v145 = (PKOutputFunction *)CFSTR("stylusSmoothing");
  v146 = (PKOutputFunction *)CFSTR("touch-smoothing");
  v147 = CFSTR("velocitySmoothing");
  v148 = CFSTR("angleSmoothing");
  v149 = CFSTR("end-cap-fade");
  v150 = CFSTR("end-cap-time");
  v151 = CFSTR("start-cap-fade");
  v152 = CFSTR("start-cap-time");
  v153 = CFSTR("blendAlpha");
  v154 = CFSTR("targetMultiple");
  v155 = CFSTR("base-alpha");
  v156 = CFSTR("weight-function");
  v157 = CFSTR("unclamped-weight");
  v158 = CFSTR("supports-combining-strokes");
  v159 = CFSTR("radius");
  v160 = CFSTR("opacity");
  v161 = CFSTR("edge-width");
  v162 = CFSTR("aspect-ratio");
  v163 = CFSTR("ruler-offset-scale");
  v164 = CFSTR("ruler-offset-constant");
  v165 = CFSTR("variable-snapped-width");
  v166 = CFSTR("brush-opacity");
  v167 = CFSTR("show-brush-indicator");
  v168 = CFSTR("animation");
  v169 = CFSTR("ink-transform");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v145, 25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  objc_msgSend(v126, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v139, &v143, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v140;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v140 != v16)
          objc_enumerationMutation(v14);
        v18 = *(_QWORD *)(*((_QWORD *)&v139 + 1) + 8 * i);
        if (objc_msgSend(v13, "containsObject:", v18))
          objc_msgSend(v13, "removeObject:", v18);
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v139, &v143, 16);
    }
    while (v15);
  }

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("stylusSmoothing"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("stylusSmoothing"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v22 = v21;

  }
  else
  {
    v22 = 0.12;
  }

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("touch-smoothing"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("touch-smoothing"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    v26 = v25;

  }
  else
  {
    v26 = 0.16;
  }

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("velocitySmoothing"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("velocitySmoothing"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "floatValue");
    v30 = v29;

  }
  else
  {
    v30 = 0.05;
  }

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("angleSmoothing"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("angleSmoothing"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "floatValue");
    v34 = v33;

  }
  else
  {
    v34 = 0.0;
  }

  v121 = -[PKInkSmoothingDescriptor initWithStylusSmoothing:touch:velocity:angle:radius:]([PKInkSmoothingDescriptor alloc], "initWithStylusSmoothing:touch:velocity:angle:radius:", v22, v26, v30, v34, 0.0);
  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("show-brush-indicator"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "BOOLValue");

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("ruler-offset-scale"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("ruler-offset-scale"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "floatValue");
    v40 = v39;

  }
  else
  {
    v40 = 1.0;
  }

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("ruler-offset-constant"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("ruler-offset-constant"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "floatValue");
    v44 = v43;

  }
  else
  {
    v44 = 0.0;
  }

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("end-cap-fade"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "floatValue");
  v47 = v46;

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("end-cap-time"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "floatValue");
  v50 = v49;

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("start-cap-fade"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "floatValue");
  v53 = v52;

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("start-cap-time"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "floatValue");
  v56 = v55;

  +[PKInkFeatheringDescriptor descriptorWithStartCapTime:startCapFade:endCapTime:endCapFade:](PKInkFeatheringDescriptor, "descriptorWithStartCapTime:startCapFade:endCapTime:endCapFade:", v56, v53, v50, v47);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0.0;
  v58 = 0.0;
  if (objc_msgSend(v125, "blendMode") == 1)
  {
    objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("blendAlpha"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "floatValue");
    v61 = v60;

    objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("targetMultiple"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "floatValue");
    v57 = v61;
    v58 = v63;

  }
  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("base-alpha"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "floatValue");
  v66 = v65;

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("unclamped-weight"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "BOOLValue");

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("supports-combining-strokes"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "BOOLValue");
  v115 = v66;
  v113 = v58;
  v114 = v57;
  v116 = v44;
  v117 = v40;

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("ink-transform"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = *MEMORY[0x1E0C9BAA8];
  v73 = *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 8);
  v75 = *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v74 = *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 24);
  v76 = *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v77 = *(_QWORD *)(MEMORY[0x1E0C9BAA8] + 40);
  v124 = v71;
  if (v71 && objc_msgSend(v71, "count") == 6)
  {
    objc_msgSend(v124, "objectAtIndexedSubscript:", 0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "doubleValue");
    v72 = v79;

    objc_msgSend(v124, "objectAtIndexedSubscript:", 1);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "doubleValue");
    v73 = v81;

    objc_msgSend(v124, "objectAtIndexedSubscript:", 2);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "doubleValue");
    v75 = v83;

    objc_msgSend(v124, "objectAtIndexedSubscript:", 3);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "doubleValue");
    v74 = v85;

    objc_msgSend(v124, "objectAtIndexedSubscript:", 4);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "doubleValue");
    v76 = v87;

    objc_msgSend(v124, "objectAtIndexedSubscript:", 5);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "doubleValue");
    v77 = v89;

  }
  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("weight-function"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  if (v90)
  {
    objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("weight-function"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKInkParser loadFunction:]((uint64_t *)&v145, (uint64_t)PKInkParser, v91);
    v92 = v145;

  }
  else
  {
    v92 = 0;
  }
  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("animation"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = v93;
  if (v93)
  {
    objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("duration"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "floatValue");
    v96 = v95;

    objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("size-delta"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "floatValue");
    v99 = v98;

    v119 = -[PKInkAnimationDescriptor initWithDuration:sizeDelta:]([PKInkAnimationDescriptor alloc], "initWithDuration:sizeDelta:", v96, v99);
  }
  else
  {
    v119 = 0;
  }
  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("radius"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInkParser loadOutput:]((uint64_t *)&v145, (uint64_t)PKInkParser, v100);

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("opacity"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInkParser loadOutput:]((uint64_t *)&v143, (uint64_t)PKInkParser, v101);

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("edge-width"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInkParser loadOutput:]((uint64_t *)&v139, (uint64_t)PKInkParser, v102);

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("aspect-ratio"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInkParser loadOutput:]((uint64_t *)&v136, (uint64_t)PKInkParser, v103);

  objc_msgSend(v126, "objectForKeyedSubscript:", CFSTR("brush-opacity"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInkParser loadOutput:]((uint64_t *)&v134, (uint64_t)PKInkParser, v104);

  v105 = [PKInkBehavior alloc];
  v133[0] = v72;
  v133[1] = v73;
  v133[2] = v75;
  v133[3] = v74;
  v133[4] = v76;
  v133[5] = v77;
  memset(v132, 0, sizeof(v132));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v132, v145, v146, 0xCCCCCCCCCCCCCCCDLL * ((v146 - v145) >> 3));
  memset(v131, 0, sizeof(v131));
  memset(v130, 0, sizeof(v130));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v130, v143, v144, 0xCCCCCCCCCCCCCCCDLL * ((v144 - v143) >> 3));
  memset(v129, 0, sizeof(v129));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v129, (PKOutputFunction *)v139, *((PKOutputFunction **)&v139 + 1), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)&v139 + 1) - v139) >> 3));
  memset(v128, 0, sizeof(v128));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v128, v136, v137, 0xCCCCCCCCCCCCCCCDLL * ((v137 - v136) >> 3));
  memset(v127, 0, sizeof(v127));
  std::vector<PKOutputFunction>::__init_with_size[abi:ne180100]<PKOutputFunction*,PKOutputFunction*>((PKOutputFunction *)v127, v134, v135, 0xCCCCCCCCCCCCCCCDLL * ((v135 - v134) >> 3));
  BYTE1(v112) = v70;
  LOBYTE(v112) = v36;
  v106 = -[PKInkBehavior initWithRenderingDescriptor:blendAlpha:targetMultiple:baseAlpha:inkTransform:useUnclampedWeight:smoothingDescriptor:featheringDescriptor:pencilFeatheringDescriptor:animationDescriptor:identifier:version:variant:uiWidths:defaultWidth:showBrushIndicator:supportsCombiningStrokes:rulerOffsetScale:rulerOffsetConstant:weightFunction:radiusOutput:radius2Output:opacityOutput:edgeWidthOutput:aspectRatioOutput:brushOpacityOutput:](v105, "initWithRenderingDescriptor:blendAlpha:targetMultiple:baseAlpha:inkTransform:useUnclampedWeight:smoothingDescriptor:featheringDescriptor:pencilFeatheringDescriptor:animationDescriptor:identifier:version:variant:uiWidths:defaultWidth:showBrushIndicator:supportsCombiningStrokes:rulerOffsetScale:rulerOffsetConstant:weightFunction:radiusOutput:radius2Output:opacityOutput:edgeWidthOutput:aspectRatioOutput:brushOpacityOutput:", v125, v133, v68, v121, v120, 0, v114, v113, v115, 0.0, v117, v116, v119, v122,
           a5,
           v123,
           MEMORY[0x1E0C9AA60],
           v112,
           v92,
           v132,
           v131,
           v130,
           v129,
           v128,
           v127);
  v138 = (void ***)v127;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v138);
  v138 = (void ***)v128;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v138);
  v138 = (void ***)v129;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v138);
  v138 = (void ***)v130;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v138);
  v138 = (void ***)v131;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v138);
  v138 = (void ***)v132;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v138);
  v107 = v106;
  objc_opt_self();
  -[PKInkBehavior renderingDescriptor](v107, "renderingDescriptor");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = objc_msgSend(v108, "type") == 1;

  if (v109)
  {
    -[PKInkBehavior particleDescriptor](v107, "particleDescriptor");

  }
  -[PKInkBehavior renderingDescriptor](v107, "renderingDescriptor");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "blendMode");

  v138 = (void ***)&v134;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v138);
  v134 = (PKOutputFunction *)&v136;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v134);
  v136 = (PKOutputFunction *)&v139;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v136);
  *(_QWORD *)&v139 = &v143;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v139);
  v143 = (PKOutputFunction *)&v145;
  std::vector<PKOutputFunction>::__destroy_vector::operator()[abi:ne180100]((void ***)&v143);

  return v107;
}

+ (id)v2plistPathForIdentifier:(uint64_t)a1
{
  __CFString *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_opt_self();
  if (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("com.apple.ink.future")))
  {
    v3 = CFSTR("com.apple.ink.crayon");

    v2 = v3;
  }
  +[PKMetalResourceHandler inkBundle]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR(".v2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", v5, CFSTR("plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)plistPathForIdentifier:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_self();
  +[PKMetalResourceHandler inkBundle]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", v2, CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)plistDictionaryForInk:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  v3 = objc_opt_self();
  +[PKInkParser plistPathForIdentifier:](v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (PKInkRenderingDescriptor)inkRenderingDescriptorWithDictionary:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  char v17;
  void *v18;
  char v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  float v38;
  float v39;
  void *v40;
  float v41;
  float v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  PKInkRenderingDescriptor *v51;
  id v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _QWORD v60[4];
  _QWORD v61[5];
  _QWORD v62[4];

  v62[2] = *MEMORY[0x1E0C80C00];
  v53 = a2;
  objc_opt_self();
  v2 = v53;
  objc_opt_self();
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v62[0] = CFSTR("type");
  v62[1] = CFSTR("blend-mode");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99DE8];
  v61[0] = CFSTR("particle-spacing");
  v61[1] = CFSTR("particle-count");
  v61[2] = CFSTR("particle-width");
  v61[3] = CFSTR("particle-height");
  v61[4] = CFSTR("texture");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99DE8];
  v60[0] = CFSTR("particle-rotation");
  v60[1] = CFSTR("particle-spacing-function");
  v60[2] = CFSTR("particle-adjust-end-cap-alpha");
  v60[3] = CFSTR("is-object-eraser");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v2, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v56 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
        v17 = objc_msgSend(v5, "containsObject:", v16);
        v18 = v5;
        if ((v17 & 1) == 0)
        {
          v19 = objc_msgSend(v8, "containsObject:", v16);
          v18 = v8;
          if ((v19 & 1) == 0)
          {
            v20 = objc_msgSend(v11, "containsObject:", v16);
            v18 = v11;
            if (!v20)
              continue;
          }
        }
        objc_msgSend(v18, "removeObject:", v16);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v13);
  }

  objc_msgSend(v5, "count");
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("type"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "isEqual:", CFSTR("particle"));

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("blend-mode"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("blend-mode"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E77ED280, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "unsignedIntegerValue");

  }
  else
  {
    v25 = 0;
  }

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("type"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E77ED2A8, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "unsignedIntegerValue");

  if (v28 == 1)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("texture"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("particle-spacing"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");
    v32 = v31;

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("particle-count"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("particle-count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "unsignedIntegerValue");

    }
    else
    {
      v35 = 1;
    }

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("particle-width"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "floatValue");
    v39 = v38;
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("particle-height"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "floatValue");
    v42 = v41;

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("particle-rotation"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E77ED2D0, "objectForKeyedSubscript:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "unsignedIntegerValue");

    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("particle-adjust-end-cap-alpha"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "BOOLValue");

    +[PKInkParticleDescriptor particleDescriptorWithName:particleSpacing:particleCount:particleSize:particleRotation:](PKInkParticleDescriptor, "particleDescriptorWithName:particleSpacing:particleCount:particleSize:particleRotation:", v29, v35, v45, v32, v39, v42);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setAdjustEndCapParticleAlpha:", v47);
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("particle-spacing-function"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("particle-spacing-function"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKInkParser loadFunction:](&v54, (uint64_t)PKInkParser, v49);
      objc_msgSend(v36, "setParticleSpacingFunction:", &v54);
      v50 = v54;
      v54 = 0;
      if (v50)
        (*(void (**)(uint64_t))(*(_QWORD *)v50 + 40))(v50);

    }
  }
  else
  {
    v36 = 0;
  }
  v51 = -[PKInkRenderingDescriptor initWithType:blendMode:alternateMode:particleDescriptor:secondaryParticleDescriptor:]([PKInkRenderingDescriptor alloc], "initWithType:blendMode:alternateMode:particleDescriptor:secondaryParticleDescriptor:", v28, v25, 0, v36, 0);

  return v51;
}

+ (id)inkBehaviorsWithIdentifer:(uint64_t)a3 version:
{
  __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  PKInkKey *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD *v29;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  __CFString *v42;
  __int16 v43;
  __CFString *v44;
  NSObject *v45;
  _QWORD v46[4];

  v46[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%lu"), v3, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInkParser v2plistPathForIdentifier:](v4, v3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31
    && (objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v31),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        +[PKInkBehavior loadInkV2WithURL:](PKInkBehavior, "loadInkV2WithURL:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v7))
  {
    v34 = v7;
    if (objc_msgSend(v7, "version") == a3)
    {
      v8 = [PKInkKey alloc];
      v9 = objc_msgSend(v7, "version");
      objc_msgSend(v7, "variant");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PKInkKey initWithIdentifier:version:variant:](v8, v3, v9, v10);

      v45 = v11;
      v46[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v42 = (__CFString *)a3;
        v43 = 2112;
        v44 = v3;
        _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "Couldn't find version: %lu for V2 ink: %@", buf, 0x16u);
      }
      v12 = 0;
    }
  }
  else
  {
    +[PKInkParser plistDictionaryForInk:]((uint64_t)PKInkParser, v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = v3;
    }
    else
    {
      v15 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v3;
        _os_log_fault_impl(&dword_1BE213000, v15, OS_LOG_TYPE_FAULT, "Could not find ink for %@", buf, 0xCu);
      }

      v14 = CFSTR("com.apple.ink.pen");
      +[PKInkParser plistDictionaryForInk:]((uint64_t)PKInkParser, v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v34 = v13;
    objc_msgSend(v13, "objectForKeyedSubscript:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    if (v17)
    {
      v18 = os_log_create("com.apple.pencilkit", ");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v42 = (__CFString *)a3;
        v43 = 2112;
        v44 = v14;
        _os_log_impl(&dword_1BE213000, v18, OS_LOG_TYPE_DEFAULT, "Couldn't find version: %lu for ink: %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%lu"), v14, 0);
      v19 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v19;
    }
    objc_msgSend(v34, "objectForKeyedSubscript:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKInkParser inkRenderingDescriptorWithDictionary:]((uint64_t)PKInkParser, v20);
    v32 = objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v34, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if ((objc_msgSend(v25, "isEqualToString:", v5) & 1) == 0 && objc_msgSend(v25, "hasPrefix:", v5))
          {
            objc_msgSend(v25, "substringFromIndex:", objc_msgSend(v5, "length") + 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "objectForKeyedSubscript:", v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[PKInkParser inkBehaviorVariantWithDictionary:renderingDescriptor:identifier:version:variant:]((uint64_t)PKInkParser, v27, v32, v14, a3, v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[PKInkKey initWithIdentifier:version:variant:]([PKInkKey alloc], v14, a3, v26);
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v28, v29);

          }
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v22);
    }

    v12 = v33;
    v3 = v14;
    v11 = v32;
  }

  return v12;
}

+ (BOOL)hasDefinitionForIdentifier:(uint64_t)a1
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_opt_self();
  +[PKInkParser plistPathForIdentifier:]((uint64_t)PKInkParser, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    +[PKInkParser v2plistPathForIdentifier:]((uint64_t)PKInkParser, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

+ (id)inkBehaviorFromDictionary:(void *)a3 identifier:(uint64_t)a4 version:(void *)a5 variant:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a2;
  v9 = a3;
  v10 = a5;
  objc_opt_self();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInkParser inkRenderingDescriptorWithDictionary:]((uint64_t)PKInkParser, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKInkParser inkBehaviorVariantWithDictionary:renderingDescriptor:identifier:version:variant:]((uint64_t)PKInkParser, v13, v12, v9, a4, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
