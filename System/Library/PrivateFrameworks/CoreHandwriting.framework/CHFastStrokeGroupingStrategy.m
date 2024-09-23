@implementation CHFastStrokeGroupingStrategy

- (CHFastStrokeGroupingStrategy)initWithStrokeProvider:(id)a3 locales:(id)a4 clutterFilter:(id)a5
{
  id v9;
  id v10;
  CHFastStrokeGroupingStrategy *v11;
  CHFastStrokeGroupingStrategy *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CHFastStrokeGroupingStrategy;
  v11 = -[CHStrokeGroupingStrategy initWithStrokeProvider:](&v14, sel_initWithStrokeProvider_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_locales, a4);
    objc_storeStrong((id *)&v12->_clutterFilter, a5);
  }

  return v12;
}

- (id)strategyIdentifier
{
  return CFSTR("com.apple.corehandwriting.fast_stroke_grouping");
}

- (id)lineGroupingResultUsingStrokes:(id)a3 shouldCancel:(id)a4
{
  objc_msgSend_groupingResultUsingStrokes_distanceMetric_mergingDistanceThreshold_clusteringLinkage_anchorPoints_shouldCancel_(self, a2, (uint64_t)a3, 3, 1, 1, a4, 30.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)fastGroupingResultWithFastGroupingClusters:(void *)a3 clusteredStrokes:(id)a4
{
  id v6;
  CHStrokeFastGroupingResult *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;

  v6 = a4;
  v7 = [CHStrokeFastGroupingResult alloc];
  objc_msgSend_strokeProvider(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strategyIdentifier(self, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend_initWithFastGroupingClusters_clusteredStrokes_strokeProvider_strategyIdentifier_clutterFilter_(v7, v20, (uint64_t)a3, (uint64_t)v6, (uint64_t)v13, (uint64_t)v19, self->_clutterFilter);

  return v21;
}

- (id)groupingResultUsingStrokes:(id)a3 distanceMetric:(int)a4 mergingDistanceThreshold:(double)a5 clusteringLinkage:(int)a6 anchorPoints:(unint64_t)a7 shouldCancel:(id)a8
{
  id v12;
  unsigned int (**v13)(_QWORD);
  const char *v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  double v21;
  size_t v22;
  size_t v23;
  uint64_t v24;
  unint64_t v25;
  float v26;
  size_t v27;
  _OWORD *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  size_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD **v71;
  _QWORD *v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  _QWORD **v77;
  _QWORD *v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  char *v86;
  __int128 v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  char *v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  _BYTE *v119;
  void *v120;
  uint64_t v121;
  _BYTE *v122;
  char *v123;
  void *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  float v133;
  NSObject *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  NSObject *v138;
  char *v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  _BYTE *v143;
  void *v144;
  uint64_t v145;
  _BYTE *v146;
  _QWORD *v148;
  char *v149;
  char *v150;
  uint64_t v151;
  size_t __sz;
  uint64_t v154;
  uint64_t v155;
  unsigned int (**v156)(_QWORD);
  unint64_t v157;
  unint64_t v158;
  CHFastStrokeGroupingStrategy *v160;
  size_t v161;
  size_t v162;
  uint64_t v163;
  unint64_t v164;
  void *v165;
  _BYTE *v166;
  void *__p;
  char *v168;
  char *v169;
  void *v170;
  _BYTE *v171;
  uint8_t buf[8];
  char *v173;
  char *v174;
  char *v175;
  _QWORD *v176;
  __int128 v177;
  _QWORD v178[4];

  v178[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (unsigned int (**)(_QWORD))a8;
  v160 = self;
  __sz = (size_t)v12;
  objc_msgSend_clustersForStrokes_shouldMakeSingleCluster_anchorPoints_(self, v14, (uint64_t)v12, 0, a7, v15);
  v16 = v12;
  v17 = a6;
  if (v13 && v13[2](v13))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v18 = (id)qword_1EF568E30;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v18, OS_LOG_TYPE_DEBUG, "Canceling line cluster results computation", buf, 2u);
    }

    v19 = 0;
    goto LABEL_134;
  }
  v156 = v13;
  if (a6 == 1)
  {
    v20 = 0x8E38E38E38E38E39 * ((v171 - (_BYTE *)v170) >> 3);
    if (v20 >= 0x2711)
    {
      v177 = 0uLL;
      v178[0] = 0;
      v21 = (double)v20 / 10000.0;
      v158 = vcvtpd_u64_f64(v21);
      if (v158)
      {
        v22 = 0;
        v23 = 0;
        v24 = 0;
        v25 = vcvtpd_u64_f64((double)v20 / (double)(unint64_t)ceil(v21));
        v27 = 72 * v25;
        v148 = v178;
        v28 = (_OWORD *)MEMORY[0x1E0C9D538];
        v164 = v25;
        v157 = v25;
        while (1)
        {
          __p = 0;
          v168 = 0;
          v169 = 0;
          if (v25)
          {
            if (v25 > 0x38E38E38E38E38ELL)
              sub_1BE61F930();
            v29 = (char *)operator new(v27);
            v30 = v29;
            v31 = 0;
            __p = v29;
            v169 = &v29[72 * v25];
            do
            {
              v32 = &v29[v31];
              *(_QWORD *)&v29[v31 + 48] = 0;
              *((_QWORD *)v32 + 5) = &v29[v31 + 48];
              *((_QWORD *)v32 + 2) = 0;
              *(_QWORD *)&v29[v31 + 8] = 0;
              *(_QWORD *)v32 = &v29[v31 + 8];
              *(_OWORD *)(v32 + 24) = *v28;
              *((_QWORD *)v32 + 7) = 0;
              *((_QWORD *)v32 + 8) = 0;
              v31 += 72;
            }
            while (v27 != v31);
            v168 = &v29[72 * v25];
          }
          else
          {
            v30 = 0;
          }
          v33 = (v171 - (_BYTE *)v170) / 72;
          v163 = v24 + 1;
          v34 = (v24 + 1) * v25;
          if (v34 >= v33)
            v34 = (v171 - (_BYTE *)v170) / 72;
          if (v24 * v25 != v34)
          {
            v45 = 0;
            v46 = (char *)v170 + v23;
            v47 = v164;
            if (v33 < v164)
              v47 = (v171 - (_BYTE *)v170) / 72;
            v48 = v22 + 72 * v47;
            do
            {
              v49 = &v46[v45];
              if (v46 != v30)
              {
                sub_1BE88BCC4((uint64_t **)&v30[v45], *(uint64_t **)v49, (uint64_t *)v49 + 1);
                *(_OWORD *)&v30[v45 + 24] = *(_OWORD *)&v46[v45 + 24];
                sub_1BE66B2E4((uint64_t)&v30[v45 + 40], *(_QWORD **)&v46[v45 + 40], &v46[v45 + 48]);
              }
              *(_QWORD *)&v30[v45 + 64] = *((_QWORD *)v49 + 8);
              v45 += 72;
            }
            while (v48 != v45);
          }
          v161 = v23;
          v162 = v22;
          v26 = a5;
          sub_1BE886CD8((uint64_t **)&v165, (uint64_t)v160, (uint64_t *)&__p, a4, 1, v13, v26);
          v35 = (char *)v165;
          if (v166 - (_BYTE *)v165 < 1)
            goto LABEL_97;
          v36 = (v166 - (_BYTE *)v165) / 72;
          v38 = *((_QWORD *)&v177 + 1);
          v37 = v177;
          v39 = (*((_QWORD *)&v177 + 1) - (_QWORD)v177) / 72;
          v40 = v177 + 72 * v39;
          if ((uint64_t)(0x8E38E38E38E38E39 * ((uint64_t)(v178[0] - *((_QWORD *)&v177 + 1)) >> 3)) < v36)
            break;
          v50 = *((_QWORD *)&v177 + 1) - v40;
          if ((uint64_t)(0x8E38E38E38E38E39 * ((*((_QWORD *)&v177 + 1) - v40) >> 3)) >= v36)
          {
            v150 = (char *)v165 + 72 * v36;
            v52 = *((_QWORD *)&v177 + 1);
            goto LABEL_44;
          }
          v154 = (v166 - (_BYTE *)v165) / 72;
          v51 = (char *)v165 + 8 * ((*((_QWORD *)&v177 + 1) - v40) >> 3);
          v52 = sub_1BE88C044((uint64_t)v178, (uint64_t)v51, (uint64_t)v166, *((uint64_t *)&v177 + 1));
          *((_QWORD *)&v177 + 1) = v52;
          if (v50 >= 1)
          {
            v150 = v51;
            v36 = v154;
LABEL_44:
            v53 = v40 + 72 * v36;
            v54 = v52 - 72 * v36;
            v55 = v52;
            if (v54 < v38)
            {
              v56 = 0;
              v57 = v37 + 8 * ((v52 - v53) >> 3) + 72 * v39;
              do
              {
                v58 = (_QWORD *)(v52 + v56);
                *v58 = *(_QWORD *)(v57 + v56);
                v59 = (uint64_t *)(v57 + v56 + 8);
                v60 = *v59;
                v58[1] = *v59;
                v61 = v52 + v56 + 8;
                v62 = *(_QWORD *)(v57 + v56 + 16);
                *(_QWORD *)(v52 + v56 + 16) = v62;
                if (v62)
                {
                  *(_QWORD *)(v60 + 16) = v61;
                  *(_QWORD *)(v57 + v56) = v59;
                  *v59 = 0;
                  *(_QWORD *)(v57 + v56 + 16) = 0;
                }
                else
                {
                  *(_QWORD *)(v52 + v56) = v61;
                }
                v63 = v52 + v56;
                *(_OWORD *)(v63 + 24) = *(_OWORD *)(v57 + v56 + 24);
                *(_QWORD *)(v63 + 40) = *(_QWORD *)(v57 + v56 + 40);
                v64 = (uint64_t *)(v57 + v56 + 48);
                v65 = *v64;
                *(_QWORD *)(v52 + v56 + 48) = *v64;
                v66 = v52 + v56 + 48;
                v67 = *(_QWORD *)(v57 + v56 + 56);
                *(_QWORD *)(v63 + 56) = v67;
                if (v67)
                {
                  *(_QWORD *)(v65 + 16) = v66;
                  *(_QWORD *)(v57 + v56 + 40) = v64;
                  *v64 = 0;
                  *(_QWORD *)(v57 + v56 + 56) = 0;
                }
                else
                {
                  *(_QWORD *)(v63 + 40) = v66;
                }
                *(_QWORD *)(v52 + v56 + 64) = *(_QWORD *)(v57 + v56 + 64);
                v56 += 72;
              }
              while (v57 + v56 < v38);
              v55 = v52 + v56;
            }
            *((_QWORD *)&v177 + 1) = v55;
            if (v52 != v53)
            {
              v68 = 0;
              v69 = -8 * ((v52 - v53) >> 3);
              do
              {
                v70 = v54 + v68;
                v71 = (_QWORD **)(v52 + v68 - 64);
                sub_1BE67AC7C(v52 + v68 - 72, *v71);
                *(_QWORD *)(v52 + v68 - 72) = *(_QWORD *)(v54 + v68 - 72);
                v72 = (_QWORD *)(v54 + v68 - 64);
                v73 = (_QWORD *)*v72;
                *v71 = (_QWORD *)*v72;
                v74 = *(_QWORD *)(v54 + v68 - 56);
                *(_QWORD *)(v52 + v68 - 56) = v74;
                if (v74)
                {
                  v73[2] = v71;
                  *(_QWORD *)(v70 - 72) = v72;
                  *v72 = 0;
                  *(_QWORD *)(v70 - 56) = 0;
                }
                else
                {
                  *(_QWORD *)(v52 + v68 - 72) = v71;
                }
                v75 = v54 + v68;
                v77 = (_QWORD **)(v52 + v68 - 24);
                v76 = *v77;
                *(_OWORD *)(v52 + v68 - 48) = *(_OWORD *)(v54 + v68 - 48);
                sub_1BE62033C(v52 + v68 - 32, v76);
                *(_QWORD *)(v52 + v68 - 32) = *(_QWORD *)(v54 + v68 - 32);
                v78 = (_QWORD *)(v54 + v68 - 24);
                v79 = (_QWORD *)*v78;
                *v77 = (_QWORD *)*v78;
                v80 = *(_QWORD *)(v54 + v68 - 16);
                *(_QWORD *)(v52 + v68 - 16) = v80;
                if (v80)
                {
                  v79[2] = v77;
                  *(_QWORD *)(v75 - 32) = v78;
                  *v78 = 0;
                  *(_QWORD *)(v75 - 16) = 0;
                }
                else
                {
                  *(_QWORD *)(v52 + v68 - 32) = v77;
                }
                *(_QWORD *)(v52 + v68 - 8) = *(_QWORD *)(v54 + v68 - 8);
                v68 -= 72;
              }
              while (v69 != v68);
            }
            v13 = v156;
            if (v150 != v35)
            {
              v81 = 0;
              do
              {
                if (v35 != (char *)v40)
                {
                  sub_1BE88BCC4((uint64_t **)(v40 + v81), *(uint64_t **)&v35[v81], (uint64_t *)&v35[v81 + 8]);
                  *(_OWORD *)(v40 + v81 + 24) = *(_OWORD *)&v35[v81 + 24];
                  sub_1BE66B2E4(v40 + v81 + 40, *(_QWORD **)&v35[v81 + 40], &v35[v81 + 48]);
                }
                *(_QWORD *)(v40 + v81 + 64) = *(_QWORD *)&v35[v81 + 64];
                v81 += 72;
              }
              while (&v35[v81] != v150);
            }
          }
LABEL_97:
          v119 = v165;
          v25 = v157;
          v28 = (_OWORD *)MEMORY[0x1E0C9D538];
          if (v165)
          {
            v120 = v165;
            if (v166 != v165)
            {
              v121 = (uint64_t)(v166 - 32);
              do
              {
                v122 = (_BYTE *)(v121 - 40);
                sub_1BE62033C(v121, *(_QWORD **)(v121 + 8));
                sub_1BE67AC7C(v121 - 40, *(_QWORD **)(v121 - 32));
                v121 -= 72;
              }
              while (v122 != v119);
              v120 = v165;
            }
            v166 = v119;
            operator delete(v120);
          }
          v123 = (char *)__p;
          if (__p)
          {
            v124 = __p;
            if (v168 != __p)
            {
              v125 = (uint64_t)(v168 - 32);
              do
              {
                v126 = (char *)(v125 - 40);
                sub_1BE62033C(v125, *(_QWORD **)(v125 + 8));
                sub_1BE67AC7C(v125 - 40, *(_QWORD **)(v125 - 32));
                v125 -= 72;
              }
              while (v126 != v123);
              v124 = __p;
            }
            v168 = v123;
            operator delete(v124);
          }
          v23 = v161 + v27;
          v22 = v162 - v27;
          v164 += v157;
          v24 = v163;
          if (v163 == v158)
          {
            v128 = *((_QWORD *)&v177 + 1);
            v127 = v177;
            v16 = (void *)__sz;
            goto LABEL_110;
          }
        }
        v41 = v39 + v36;
        if ((unint64_t)(v39 + v36) > 0x38E38E38E38E38ELL)
          sub_1BE61F930();
        if (0x1C71C71C71C71C72 * ((uint64_t)(v178[0] - v177) >> 3) > v41)
          v41 = 0x1C71C71C71C71C72 * ((uint64_t)(v178[0] - v177) >> 3);
        if (0x8E38E38E38E38E39 * ((uint64_t)(v178[0] - v177) >> 3) >= 0x1C71C71C71C71C7)
          v42 = 0x38E38E38E38E38ELL;
        else
          v42 = v41;
        v176 = v178;
        if (v42)
        {
          if (v42 > 0x38E38E38E38E38ELL)
            sub_1BE61F100();
          v43 = (v166 - (_BYTE *)v165) / 72;
          v44 = (char *)operator new(72 * v42);
          v36 = v43;
        }
        else
        {
          v44 = 0;
        }
        v82 = 0;
        v149 = v44;
        v151 = v39;
        v83 = &v44[72 * v39];
        *(_QWORD *)buf = v44;
        v173 = v83;
        v174 = v83;
        v175 = &v44[72 * v42];
        v155 = v36;
        v84 = 72 * v36;
        v85 = &v83[72 * v36];
        do
        {
          v86 = &v83[v82];
          *((_QWORD *)v86 + 2) = 0;
          *(_QWORD *)&v83[v82 + 8] = 0;
          *(_QWORD *)v86 = &v83[v82 + 8];
          sub_1BE67ACCC(&v83[v82], *(_QWORD **)&v35[v82], &v35[v82 + 8]);
          v87 = *(_OWORD *)&v35[v82 + 24];
          *((_QWORD *)v86 + 6) = 0;
          *((_QWORD *)v86 + 5) = v86 + 48;
          v88 = &v83[v82 + 40];
          *((_OWORD *)v88 - 1) = v87;
          *((_QWORD *)v88 + 2) = 0;
          sub_1BE66AAE8(v88, *(_QWORD **)&v35[v82 + 40], &v35[v82 + 48]);
          *(_QWORD *)&v83[v82 + 64] = *(_QWORD *)&v35[v82 + 64];
          v82 += 72;
        }
        while (v84 != v82);
        v89 = v173;
        v90 = v177;
        if ((_QWORD)v177 == v40)
        {
          v13 = v156;
          v92 = v151;
          v103 = *((_QWORD *)&v177 + 1);
          if (*((_QWORD *)&v177 + 1) == v40)
          {
LABEL_92:
            v116 = (void *)v177;
            *(_QWORD *)&v177 = v89;
            *((_QWORD *)&v177 + 1) = v85;
            v178[0] = v175;
            if ((void *)v40 != v116)
            {
              v117 = v40 - 32;
              do
              {
                v118 = (void *)(v117 - 40);
                sub_1BE62033C(v117, *(_QWORD **)(v117 + 8));
                sub_1BE67AC7C(v117 - 40, *(_QWORD **)(v117 - 32));
                v117 -= 72;
              }
              while (v118 != v116);
            }
            if (v116)
              operator delete(v116);
            goto LABEL_97;
          }
        }
        else
        {
          v91 = 0;
          v13 = v156;
          v92 = v151;
          do
          {
            v93 = &v89[v91];
            *((_QWORD *)v93 - 9) = *(_QWORD *)(v40 + v91 - 72);
            v94 = (uint64_t *)(v40 + v91 - 64);
            v95 = *v94;
            *(_QWORD *)&v89[v91 - 64] = *v94;
            v96 = (uint64_t)&v89[v91 - 64];
            v97 = *(_QWORD *)(v40 + v91 - 56);
            *((_QWORD *)v93 - 7) = v97;
            if (v97)
            {
              *(_QWORD *)(v95 + 16) = v96;
              *(_QWORD *)(v40 + v91 - 72) = v94;
              *v94 = 0;
              *(_QWORD *)(v40 + v91 - 56) = 0;
            }
            else
            {
              *((_QWORD *)v93 - 9) = v96;
            }
            v98 = &v89[v91];
            *((_OWORD *)v98 - 3) = *(_OWORD *)(v40 + v91 - 48);
            *((_QWORD *)v98 - 4) = *(_QWORD *)(v40 + v91 - 32);
            v99 = (uint64_t *)(v40 + v91 - 24);
            v100 = *v99;
            *(_QWORD *)&v89[v91 - 24] = *v99;
            v101 = (uint64_t)&v89[v91 - 24];
            v102 = *(_QWORD *)(v40 + v91 - 16);
            *((_QWORD *)v98 - 2) = v102;
            if (v102)
            {
              *(_QWORD *)(v100 + 16) = v101;
              *(_QWORD *)(v40 + v91 - 32) = v99;
              *v99 = 0;
              *(_QWORD *)(v40 + v91 - 16) = 0;
            }
            else
            {
              *((_QWORD *)v98 - 4) = v101;
            }
            *(_QWORD *)&v89[v91 - 8] = *(_QWORD *)(v40 + v91 - 8);
            v91 -= 72;
          }
          while (v40 + v91 != v90);
          v89 += v91;
          v173 = v89;
          v103 = *((_QWORD *)&v177 + 1);
          if (*((_QWORD *)&v177 + 1) == v40)
            goto LABEL_92;
        }
        v104 = 72 * v92;
        v105 = &v149[72 * v155];
        do
        {
          v106 = &v105[v104];
          *(_QWORD *)v106 = *(_QWORD *)(v37 + 72 * v92);
          v107 = (uint64_t *)(v37 + v104 + 8);
          v108 = *v107;
          *((_QWORD *)v106 + 1) = *v107;
          v109 = (uint64_t)&v105[v104 + 8];
          v110 = *(_QWORD *)(v37 + v104 + 16);
          *(_QWORD *)&v105[v104 + 16] = v110;
          if (v110)
          {
            *(_QWORD *)(v108 + 16) = v109;
            *(_QWORD *)(v37 + 72 * v92) = v107;
            *v107 = 0;
            *(_QWORD *)(v37 + v104 + 16) = 0;
          }
          else
          {
            *(_QWORD *)&v105[72 * v92] = v109;
          }
          v111 = &v105[v104];
          *(_OWORD *)(v111 + 24) = *(_OWORD *)(v37 + v104 + 24);
          *((_QWORD *)v111 + 5) = *(_QWORD *)(v37 + v104 + 40);
          v112 = (uint64_t *)(v37 + v104 + 48);
          v113 = *v112;
          *(_QWORD *)&v105[v104 + 48] = *v112;
          v114 = (uint64_t)&v105[v104 + 48];
          v115 = *(_QWORD *)(v37 + v104 + 56);
          *((_QWORD *)v111 + 7) = v115;
          if (v115)
          {
            *(_QWORD *)(v113 + 16) = v114;
            *(_QWORD *)(v37 + v104 + 40) = v112;
            *v112 = 0;
            *(_QWORD *)(v37 + v104 + 56) = 0;
          }
          else
          {
            *((_QWORD *)v111 + 5) = v114;
          }
          *(_QWORD *)&v105[v104 + 64] = *(_QWORD *)(v37 + v104 + 64);
          v37 += 72;
          v105 += 72;
        }
        while (v37 + v104 != v103);
        v89 = v173;
        v40 = *((_QWORD *)&v177 + 1);
        v85 = &v105[72 * v92];
        goto LABEL_92;
      }
      v128 = 0;
      v127 = 0;
LABEL_110:
      sub_1BE88C1BC((uint64_t *)&v170, v127, v128, 0x8E38E38E38E38E39 * ((v128 - v127) >> 3));
      v129 = v177;
      if ((_QWORD)v177)
      {
        v130 = (void *)v177;
        if (*((_QWORD *)&v177 + 1) != (_QWORD)v177)
        {
          v131 = *((_QWORD *)&v177 + 1) - 32;
          do
          {
            v132 = v131 - 40;
            sub_1BE62033C(v131, *(_QWORD **)(v131 + 8));
            sub_1BE67AC7C(v131 - 40, *(_QWORD **)(v131 - 32));
            v131 -= 72;
          }
          while (v132 != v129);
          v130 = (void *)v177;
          v16 = (void *)__sz;
          v13 = v156;
        }
        *((_QWORD *)&v177 + 1) = v129;
        operator delete(v130);
      }
      v17 = a6;
    }
  }
  v133 = a5;
  sub_1BE886CD8((uint64_t **)buf, (uint64_t)v160, (uint64_t *)&v170, a4, v17, v13, v133);
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v134 = (id)qword_1EF568E30;
  if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v177) = 134217984;
    *(_QWORD *)((char *)&v177 + 4) = 0x8E38E38E38E38E39 * ((uint64_t)&v173[-*(_QWORD *)buf] >> 3);
    _os_log_impl(&dword_1BE607000, v134, OS_LOG_TYPE_DEBUG, "%lu clusters found by the fast grouping algorithm", (uint8_t *)&v177, 0xCu);
  }

  if (v13 && v13[2](v13))
  {
    if (qword_1EF568E88 == -1)
    {
      v138 = (id)qword_1EF568E30;
      if (!os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
        goto LABEL_126;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v138 = (id)qword_1EF568E30;
      if (!os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
      {
LABEL_126:

        v19 = 0;
        v139 = *(char **)buf;
        if (!*(_QWORD *)buf)
          goto LABEL_134;
        goto LABEL_129;
      }
    }
    LOWORD(v177) = 0;
    _os_log_impl(&dword_1BE607000, v138, OS_LOG_TYPE_DEBUG, "Canceling line cluster results computation", (uint8_t *)&v177, 2u);
    goto LABEL_126;
  }
  objc_msgSend_fastGroupingResultWithFastGroupingClusters_clusteredStrokes_(v160, v135, (uint64_t)buf, (uint64_t)v16, v136, v137, v148);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = *(char **)buf;
  if (!*(_QWORD *)buf)
    goto LABEL_134;
LABEL_129:
  v140 = v139;
  if (v173 != v139)
  {
    v141 = (uint64_t)(v173 - 32);
    do
    {
      v142 = v141 - 40;
      sub_1BE62033C(v141, *(_QWORD **)(v141 + 8));
      sub_1BE67AC7C(v141 - 40, *(_QWORD **)(v141 - 32));
      v141 -= 72;
    }
    while ((char *)v142 != v139);
    v140 = *(char **)buf;
  }
  v173 = v139;
  operator delete(v140);
LABEL_134:
  v143 = v170;
  if (v170)
  {
    v144 = v170;
    if (v171 != v170)
    {
      v145 = (uint64_t)(v171 - 32);
      do
      {
        v146 = (_BYTE *)(v145 - 40);
        sub_1BE62033C(v145, *(_QWORD **)(v145 + 8));
        sub_1BE67AC7C(v145 - 40, *(_QWORD **)(v145 - 32));
        v145 -= 72;
      }
      while (v146 != v143);
      v144 = v170;
    }
    v171 = v143;
    operator delete(v144);
  }

  return v19;
}

- (vector<CHFastGroupingCluster,)clustersForStrokes:(CHFastStrokeGroupingStrategy *)self shouldMakeSingleCluster:(SEL)a3 anchorPoints:(id)a4
{
  _BOOL4 v7;
  id v9;
  _QWORD *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t i;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  CHStrokeClutterFilter *clutterFilter;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char isHighDensityStroke;
  CGFloat MidX;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  CGFloat MidY;
  CGFloat *v51;
  CGFloat *v52;
  uint64_t **v53;
  uint64_t **v54;
  uint64_t *v55;
  unint64_t v56;
  uint64_t *v57;
  _QWORD *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  CHDrawing *v69;
  double *v70;
  double *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  double v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  double v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  double v96;
  void *v97;
  unint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  _QWORD *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char *v118;
  char *v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  unint64_t v123;
  char *v124;
  char *v125;
  uint64_t v126;
  _BYTE *v127;
  _BYTE *v128;
  int64_t v129;
  char *v130;
  char *v131;
  _QWORD *v132;
  CHFastGroupingCluster *end;
  __int128 v134;
  char *v135;
  CHFastGroupingCluster *v136;
  __int128 v137;
  char *v138;
  vector<CHFastGroupingCluster, std::allocator<CHFastGroupingCluster>> *result;
  uint64_t v140;
  _BOOL4 v141;
  id v142;
  vector<CHFastGroupingCluster, std::allocator<CHFastGroupingCluster>> *v143;
  void *v144;
  void *__p;
  double *v147;
  uint64_t v148;
  _QWORD v149[5];
  _QWORD *v150;
  _QWORD *v151;
  uint64_t v152;
  __int128 v153;
  _QWORD *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  _QWORD v158[5];
  _QWORD *v159;
  _QWORD *v160[2];
  __int128 v161;
  _QWORD *v162;
  _QWORD *v163;
  _QWORD *v164;
  _QWORD *v165;
  uint64_t **v166;
  uint64_t *v167;
  uint64_t v168;
  CGRect v169;
  CGRect v170;

  v7 = a5;
  v9 = a4;
  v10 = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  v167 = 0;
  v168 = 0;
  v166 = &v167;
  v142 = v9;
  v143 = retstr;
  v141 = v7;
  for (i = objc_msgSend_count(v9, v11, v12, v13, v14, v15, a6);
        (unint64_t)v10 < i;
        i = objc_msgSend_count(v9, v21, v22, v23, v24, v25, v140))
  {
    objc_msgSend_objectAtIndexedSubscript_(v9, v17, (uint64_t)v10, v18, v19, v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v26;
    clutterFilter = self->_clutterFilter;
    if (!clutterFilter
      || (objc_msgSend_encodedStrokeIdentifier(v26, v27, v28, v29, v30, v31),
          v34 = (void *)objc_claimAutoreleasedReturnValue(),
          isHighDensityStroke = objc_msgSend_isHighDensityStroke_(clutterFilter, v35, (uint64_t)v34, v36, v37, v38),
          v34,
          (isHighDensityStroke & 1) == 0))
    {
      objc_msgSend_bounds(v32, v27, v28, v29, v30, v31);
      MidX = CGRectGetMidX(v169);
      objc_msgSend_bounds(v32, v41, v42, v43, v44, v45);
      MidY = CGRectGetMidY(v170);
      v159 = 0;
      v160[0] = &v159;
      v160[1] = (_QWORD *)0x4812000000;
      *(_QWORD *)&v161 = sub_1BE889494;
      *((_QWORD *)&v161 + 1) = sub_1BE8894B8;
      v162 = &unk_1BE94989A;
      v164 = 0;
      v165 = 0;
      v163 = 0;
      if (v7)
      {
        v51 = (CGFloat *)operator new(0x10uLL);
        v52 = v51;
        *v51 = MidX;
        v51[1] = MidY;
        v53 = &v167;
        v54 = &v167;
        v55 = v167;
        if (v167)
        {
          while (1)
          {
            while (1)
            {
              v53 = (uint64_t **)v55;
              v56 = v55[4];
              if ((unint64_t)v10 >= v56)
                break;
              v55 = *v53;
              v54 = v53;
              if (!*v53)
                goto LABEL_14;
            }
            if (v56 >= (unint64_t)v10)
              break;
            v55 = v53[1];
            if (!v55)
            {
              v54 = v53 + 1;
              goto LABEL_14;
            }
          }
          operator delete(v51);
        }
        else
        {
LABEL_14:
          v57 = (uint64_t *)operator new(0x40uLL);
          v57[4] = (uint64_t)v10;
          v57[5] = (uint64_t)v52;
          v57[6] = (uint64_t)(v52 + 2);
          v57[7] = (uint64_t)(v52 + 2);
          *v57 = 0;
          v57[1] = 0;
          v57[2] = (uint64_t)v53;
          *v54 = v57;
          if (*v166)
          {
            v166 = (uint64_t **)*v166;
            v57 = *v54;
          }
          sub_1BE61F5C0(v167, v57);
          ++v168;
        }
      }
      else
      {
        if ((a6 & 1) != 0)
        {
          v58 = operator new(0x10uLL);
          *(CGFloat *)v58 = MidX;
          *((CGFloat *)v58 + 1) = MidY;
          v164 = v58 + 2;
          v165 = v58 + 2;
          v163 = v58;
        }
        if ((a6 & 2) != 0)
        {
          v158[0] = MEMORY[0x1E0C809B0];
          v158[1] = 3221225472;
          v158[2] = sub_1BE8894D0;
          v158[3] = &unk_1E77F2B80;
          v158[4] = &v159;
          objc_msgSend_enumeratePointsWithDistanceStep_usingBlock_(v32, v46, (uint64_t)v158, v47, v48, v49, 1.79769313e308);
        }
        if ((a6 & 4) != 0)
        {
          v150 = 0;
          v151 = &v150;
          v152 = 0x4812000000;
          *(_QWORD *)&v153 = sub_1BE889494;
          *((_QWORD *)&v153 + 1) = sub_1BE8894B8;
          v154 = &unk_1BE94989A;
          v156 = 0;
          v157 = 0;
          v155 = 0;
          v149[0] = MEMORY[0x1E0C809B0];
          v149[1] = 3221225472;
          v149[2] = sub_1BE8895F4;
          v149[3] = &unk_1E77F2B80;
          v149[4] = &v150;
          objc_msgSend_enumeratePointsWithDistanceStep_usingBlock_(v32, v46, (uint64_t)v149, v47, v48, v49, 1.0);
          v59 = (void *)objc_opt_class();
          if (v59)
          {
            objc_msgSend_convexHullForPoints_(v59, v60, (uint64_t)(v151 + 6), v61, v62, v63);
          }
          else
          {
            __p = 0;
            v147 = 0;
            v148 = 0;
          }
          v144 = v32;
          v69 = objc_alloc_init(CHDrawing);
          v70 = (double *)__p;
          v71 = v147;
          if (__p != v147)
          {
            do
            {
              objc_msgSend_addPoint_(v69, v64, v65, v66, v67, v68, *v70, v70[1]);
              v70 += 2;
            }
            while (v70 != v71);
          }
          objc_msgSend_endStroke(v69, v64, v65, v66, v67, v68);
          objc_msgSend_bounds(v32, v72, v73, v74, v75, v76);
          v78 = v77;
          objc_msgSend_bounds(v32, v79, v80, v81, v82, v83);
          if (v78 <= v89)
          {
            objc_msgSend_bounds(v32, v84, v85, v86, v87, v88);
            v95 = v96;
          }
          else
          {
            objc_msgSend_bounds(v32, v84, v85, v86, v87, v88);
          }
          objc_msgSend_drawingSpatiallyResampled_(v69, v90, v91, v92, v93, v94, v95 / 10.0);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = 0;
          v103 = objc_msgSend_pointCountForStrokeIndex_(v97, v99, 0, v100, v101, v102);
          while (2)
          {
            if (v98 >= v103)
            {

              if (__p)
              {
                v147 = (double *)__p;
                operator delete(__p);
              }
              _Block_object_dispose(&v150, 8);
              v9 = v142;
              retstr = v143;
              v32 = v144;
              v7 = v141;
              LOBYTE(a6) = v140;
              if (v155)
              {
                v156 = v155;
                operator delete(v155);
              }
              break;
            }
            v108 = v160[0];
            objc_msgSend_pointForStrokeIndex_pointIndex_(v97, v104, 0, v98, v105, v106);
            v115 = v113;
            v116 = v114;
            v118 = (char *)v108[7];
            v117 = v108[8];
            if ((unint64_t)v118 < v117)
            {
              *(_QWORD *)v118 = v113;
              *((_QWORD *)v118 + 1) = v114;
              v107 = v118 + 16;
              goto LABEL_33;
            }
            v119 = (char *)v108[6];
            v120 = (v118 - v119) >> 4;
            v121 = v120 + 1;
            if ((unint64_t)(v120 + 1) >> 60)
              sub_1BE61F930();
            v122 = v117 - (_QWORD)v119;
            if (v122 >> 3 > v121)
              v121 = v122 >> 3;
            if ((unint64_t)v122 >= 0x7FFFFFFFFFFFFFF0)
              v123 = 0xFFFFFFFFFFFFFFFLL;
            else
              v123 = v121;
            if (v123)
            {
              if (v123 >> 60)
                sub_1BE61F100();
              v124 = (char *)operator new(16 * v123);
              v125 = &v124[16 * v120];
              *(_QWORD *)v125 = v115;
              *((_QWORD *)v125 + 1) = v116;
              v126 = (uint64_t)v125;
              if (v118 == v119)
              {
LABEL_50:
                v107 = v125 + 16;
                v108[6] = v126;
                v108[7] = v125 + 16;
                v108[8] = &v124[16 * v123];
                if (v118)
                  goto LABEL_51;
                goto LABEL_33;
              }
            }
            else
            {
              v124 = 0;
              v125 = (char *)(16 * v120);
              *(_QWORD *)v125 = v113;
              *((_QWORD *)v125 + 1) = v114;
              v126 = 16 * v120;
              if (v118 == v119)
                goto LABEL_50;
            }
            do
            {
              *(_OWORD *)(v126 - 16) = *((_OWORD *)v118 - 1);
              v126 -= 16;
              v118 -= 16;
            }
            while (v118 != v119);
            v118 = (char *)v108[6];
            v107 = v125 + 16;
            v108[6] = v126;
            v108[7] = v125 + 16;
            v108[8] = &v124[16 * v123];
            if (v118)
LABEL_51:
              operator delete(v118);
LABEL_33:
            v108[7] = v107;
            ++v98;
            v103 = objc_msgSend_pointCountForStrokeIndex_(v97, v109, 0, v110, v111, v112);
            continue;
          }
        }
        v147 = 0;
        v148 = 0;
        __p = &v147;
        v150 = v10;
        v152 = 0;
        *(_QWORD *)&v153 = 0;
        v151 = 0;
        v128 = (_BYTE *)v160[0][6];
        v127 = (_BYTE *)v160[0][7];
        v129 = v127 - v128;
        if (v127 == v128)
        {
          v131 = 0;
          v130 = 0;
        }
        else
        {
          if (v129 < 0)
            sub_1BE61F930();
          v130 = (char *)operator new(v127 - v128);
          v131 = &v130[16 * (v129 >> 4)];
          memcpy(v130, v128, v129);
        }
        v132 = operator new(0x40uLL);
        v132[4] = v10;
        v132[5] = v130;
        v132[6] = v131;
        v132[7] = v131;
        *v132 = 0;
        v132[1] = 0;
        v132[2] = &v147;
        __p = v132;
        v147 = (double *)v132;
        *((_BYTE *)v132 + 24) = 1;
        v148 = 1;
        sub_1BE677C14((uint64_t)&v150, &__p);
        end = retstr->__end_;
        if (end >= retstr->__end_cap_.__value_)
        {
          v135 = sub_1BE67AEEC((void **)&retstr->__begin_, (uint64_t)&v150);
        }
        else
        {
          *((_QWORD *)end + 2) = 0;
          *((_QWORD *)end + 1) = 0;
          *(_QWORD *)end = (char *)end + 8;
          sub_1BE67ACCC(end, v150, &v151);
          v134 = v153;
          *((_QWORD *)end + 6) = 0;
          *((_QWORD *)end + 5) = (char *)end + 48;
          *(_OWORD *)((char *)end + 24) = v134;
          *((_QWORD *)end + 7) = 0;
          sub_1BE66AAE8((_QWORD *)end + 5, v154, &v155);
          *((_QWORD *)end + 8) = v157;
          v135 = (char *)end + 72;
          retstr->__end_ = (CHFastGroupingCluster *)((char *)end + 72);
        }
        retstr->__end_ = (CHFastGroupingCluster *)v135;
        sub_1BE62033C((uint64_t)&v154, v155);
        sub_1BE67AC7C((uint64_t)&v150, v151);
        sub_1BE67AC7C((uint64_t)&__p, v147);
      }
      _Block_object_dispose(&v159, 8);
      if (v163)
      {
        v164 = v163;
        operator delete(v163);
      }
    }

    v10 = (_QWORD *)((char *)v10 + 1);
  }
  if (v7)
  {
    sub_1BE677C14((uint64_t)&v159, &v166);
    v136 = retstr->__end_;
    if (v136 >= retstr->__end_cap_.__value_)
    {
      v138 = sub_1BE67AEEC((void **)&retstr->__begin_, (uint64_t)&v159);
    }
    else
    {
      *((_QWORD *)v136 + 2) = 0;
      *((_QWORD *)v136 + 1) = 0;
      *(_QWORD *)v136 = (char *)v136 + 8;
      sub_1BE67ACCC(v136, v159, v160);
      v137 = v161;
      *((_QWORD *)v136 + 6) = 0;
      *((_QWORD *)v136 + 5) = (char *)v136 + 48;
      *(_OWORD *)((char *)v136 + 24) = v137;
      *((_QWORD *)v136 + 7) = 0;
      sub_1BE66AAE8((_QWORD *)v136 + 5, v162, &v163);
      *((_QWORD *)v136 + 8) = v165;
      v138 = (char *)v136 + 72;
      retstr->__end_ = (CHFastGroupingCluster *)((char *)v136 + 72);
    }
    retstr->__end_ = (CHFastGroupingCluster *)v138;
    sub_1BE62033C((uint64_t)&v162, v163);
    sub_1BE67AC7C((uint64_t)&v159, v160[0]);
  }
  sub_1BE67AC7C((uint64_t)&v166, v167);

  return result;
}

- (id)groupingResultForContextStrokes:(id)a3 clusteredStrokes:(id)a4 fastGroupingResult:(id)a5 point:(CGPoint)a6 tokenizationLevel:(int64_t)a7
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  id v23;
  _QWORD *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  _QWORD *v47;
  unint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  void *v51;
  uint64_t v52;
  _QWORD *v53;
  void *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  id v65;
  NSObject *v66;
  unint64_t v67;
  uint64_t v68;
  char *v69;
  unint64_t v70;
  char *v71;
  char *v72;
  unint64_t v73;
  char *v74;
  char *v75;
  _QWORD *v76;
  _QWORD *v77;
  _QWORD *v78;
  _QWORD *v79;
  char *v80;
  __int128 v81;
  _QWORD *v82;
  _QWORD **v83;
  char *v84;
  char *v85;
  _QWORD *v86;
  _QWORD *v87;
  _QWORD *v88;
  _QWORD *v89;
  BOOL v90;
  unint64_t v91;
  _QWORD *v92;
  _QWORD *v93;
  unint64_t v94;
  _QWORD *v95;
  _QWORD *v96;
  uint64_t v97;
  _BYTE *v98;
  _BYTE *v99;
  int64_t v100;
  char *v101;
  char *v102;
  uint64_t v103;
  _BYTE *v104;
  uint64_t v105;
  _BYTE *v106;
  uint64_t v107;
  _BYTE *v108;
  int v109;
  uint64_t v110;
  int v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD *v115;
  _QWORD *v116;
  _QWORD *v117;
  uint64_t v118;
  _QWORD *v119;
  _QWORD *v120;
  _QWORD *v121;
  _QWORD *v122;
  unint64_t v123;
  _QWORD *v124;
  _QWORD *v125;
  unint64_t v126;
  _QWORD *v127;
  _QWORD *v128;
  _QWORD *v129;
  uint64_t v130;
  _BYTE *v131;
  uint64_t v132;
  _BYTE *v133;
  int v134;
  uint64_t v135;
  int v136;
  uint64_t *v137;
  uint64_t v138;
  uint64_t v139;
  _QWORD *v140;
  char *v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  char *v147;
  void *v148;
  char *v149;
  char *v150;
  char *v151;
  char *v152;
  char *v153;
  NSObject *v154;
  id v155;
  id v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  void *v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  float64x2_t v181;
  float32x2_t v182;
  float v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  char *v190;
  char *v191;
  char *v192;
  CGFloat x;
  CGFloat v194;
  CGFloat width;
  CGFloat height;
  void *v197;
  id v198;
  const char *v199;
  uint64_t v200;
  _BOOL4 v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  float v209;
  uint64_t i;
  void *v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  CGFloat v222;
  CGFloat v223;
  CGFloat v224;
  CGFloat v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  _BOOL4 v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  CGFloat MidY;
  float64x2_t v243;
  float32x2_t v244;
  float v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  char *v251;
  char *v252;
  _BOOL4 v253;
  _BOOL4 v254;
  id v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  void *v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  void *v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  unint64_t v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  void *v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  char v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  _BYTE *v306;
  _QWORD *v307;
  uint64_t v308;
  _QWORD *v309;
  unint64_t v310;
  char *v311;
  char *v312;
  char *v313;
  void *v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  void *v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  char *v325;
  char *v326;
  void *v327;
  const char *v328;
  char *v329;
  void *v330;
  char *v331;
  char *v332;
  id v334;
  int64_t v335;
  void *v336;
  id v337;
  void *v338;
  void *v339;
  unint64_t v340;
  _BOOL4 v341;
  _BOOL4 v343;
  unint64_t v344;
  void *v345;
  unint64_t v346;
  char *v347;
  id v348;
  id v349;
  float64_t obj;
  id obja;
  float64_t y;
  uint64_t v353;
  id v354;
  char *v355;
  CGFloat MidX;
  uint64_t v357;
  __int128 v358;
  unint64_t v359;
  void *v360[2];
  unint64_t v361;
  void *v362;
  char *v363;
  void *__p[2];
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 buf;
  char v369;
  uint64_t v370;
  CGPoint v371;
  CGPoint v372;
  CGRect v373;
  CGRect v374;
  CGRect v375;
  CGRect v376;
  CGRect v377;
  CGRect v378;
  CGRect v379;

  obj = a6.x;
  y = a6.y;
  v370 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v337 = a4;
  v11 = a5;
  v335 = a7;
  v336 = v11;
  v338 = v10;
  if (!a7)
  {
    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v12, (uint64_t)v10, v14, v15, v16);
    v65 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_299;
  }
  if (v11)
  {
    objc_msgSend_fastGroupingClusters(v11, v12, v13, v14, v15, v16);
    v22 = a7;
    if (a7 == 1)
    {
LABEL_4:
      if (objc_msgSend_count(v10, v17, v18, v19, v20, v21))
      {
        v354 = v10;
        v23 = v337;
        if (self)
        {
          v24 = v360[0];
          if (v360[1] != v360[0])
          {
            while (1)
            {
              while (1)
              {
                v366 = 0u;
                v367 = 0u;
                *(_OWORD *)__p = 0u;
                v365 = 0u;
                v25 = v354;
                v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)__p, (uint64_t)&buf, 16, v27);
                if (!v33)
                  break;
                v34 = *(_QWORD *)v365;
                while (1)
                {
                  v35 = 0;
LABEL_12:
                  if (*(_QWORD *)v365 != v34)
                    objc_enumerationMutation(v25);
                  v36 = *((_QWORD *)__p[1] + v35);
                  objc_msgSend_strokeProvider(self, v28, v29, v30, v31, v32);
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v38, v36, (uint64_t)v37, v39, v40);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();

                  v46 = objc_msgSend_indexOfObject_(v23, v42, (uint64_t)v41, v43, v44, v45);
                  v47 = (_QWORD *)v24[6];
                  if (v47)
                    break;
LABEL_15:

                  if (++v35 != v33)
                    goto LABEL_12;
                  v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)__p, (uint64_t)&buf, 16, v32);
                  v33 = v49;
                  if (!v49)
                    goto LABEL_22;
                }
                while (1)
                {
                  v48 = v47[4];
                  if (v46 >= v48)
                    break;
LABEL_17:
                  v47 = (_QWORD *)*v47;
                  if (!v47)
                    goto LABEL_15;
                }
                if (v48 < v46)
                {
                  ++v47;
                  goto LABEL_17;
                }

                v24 += 9;
                if (v360[1] == v24)
                  goto LABEL_50;
              }
LABEL_22:

              v50 = v24 + 9;
              v51 = v360[1];
              if (v24 + 9 != v360[1])
                break;
              v53 = v24;
              if (v50 != v24)
                goto LABEL_36;
LABEL_8:
              v360[1] = v53;
              if (v53 == v24)
                goto LABEL_50;
            }
            v52 = (uint64_t)v24;
            do
            {
              v55 = v52 + 8;
              sub_1BE67AC7C(v52, *(_QWORD **)(v52 + 8));
              *(_QWORD *)v52 = *(_QWORD *)(v52 + 72);
              v56 = (_QWORD *)(v52 + 80);
              v57 = *(_QWORD *)(v52 + 80);
              *(_QWORD *)(v52 + 8) = v57;
              v58 = *(_QWORD *)(v52 + 88);
              *(_QWORD *)(v52 + 16) = v58;
              if (v58)
              {
                *(_QWORD *)(v57 + 16) = v55;
                *(_QWORD *)(v52 + 72) = v56;
                *v56 = 0;
                *(_QWORD *)(v52 + 88) = 0;
              }
              else
              {
                *(_QWORD *)v52 = v55;
              }
              *(_OWORD *)(v52 + 24) = *(_OWORD *)(v52 + 96);
              v59 = v52 + 48;
              sub_1BE62033C(v52 + 40, *(_QWORD **)(v52 + 48));
              v60 = (_QWORD *)(v52 + 120);
              v61 = *(_QWORD *)(v52 + 120);
              *(_QWORD *)(v52 + 40) = *(_QWORD *)(v52 + 112);
              *(_QWORD *)(v52 + 48) = v61;
              v62 = *(_QWORD *)(v52 + 128);
              *(_QWORD *)(v52 + 56) = v62;
              if (v62)
              {
                *(_QWORD *)(v61 + 16) = v59;
                *(_QWORD *)(v52 + 112) = v60;
                *v60 = 0;
                *(_QWORD *)(v52 + 128) = 0;
              }
              else
              {
                *(_QWORD *)(v52 + 40) = v59;
              }
              *(_QWORD *)(v52 + 64) = *(_QWORD *)(v52 + 136);
              v53 = (_QWORD *)(v52 + 72);
              v54 = (void *)(v52 + 144);
              v52 += 72;
            }
            while (v54 != v51);
            v50 = v360[1];
            if (v360[1] == v53)
              goto LABEL_8;
LABEL_36:
            v63 = (uint64_t)(v50 - 4);
            do
            {
              v64 = (_QWORD *)(v63 - 40);
              sub_1BE62033C(v63, *(_QWORD **)(v63 + 8));
              sub_1BE67AC7C(v63 - 40, *(_QWORD **)(v63 - 32));
              v63 -= 72;
            }
            while (v64 != v53);
            goto LABEL_8;
          }
        }
LABEL_50:

      }
      v358 = 0uLL;
      v359 = 0;
      v69 = (char *)v360[0];
      if (!self || v360[1] == v360[0])
        goto LABEL_199;
      v70 = 0;
      while (1)
      {
        CHFastGroupingCluster::explode((CHFastGroupingCluster *)&v69[72 * v70], (uint64_t)__p);
        sub_1BE886CD8((uint64_t **)&v362, (uint64_t)self, (uint64_t *)__p, 2u, 1, 0, 50.0);
        v72 = (char *)v362;
        v71 = v363;
        if (v363 != v362)
          break;
        v72 = v363;
        if (v363)
          goto LABEL_189;
LABEL_194:
        v147 = (char *)__p[0];
        if (__p[0])
        {
          v148 = __p[0];
          if (__p[1] != __p[0])
          {
            v149 = (char *)__p[1] - 32;
            do
            {
              v150 = v149 - 40;
              sub_1BE62033C((uint64_t)v149, *((_QWORD **)v149 + 1));
              sub_1BE67AC7C((uint64_t)(v149 - 40), *((_QWORD **)v149 - 4));
              v149 -= 72;
            }
            while (v150 != v147);
            v148 = __p[0];
          }
          __p[1] = v147;
          operator delete(v148);
        }
        ++v70;
        v69 = (char *)v360[0];
        if (v70 >= 0x8E38E38E38E38E39 * (((char *)v360[1] - (char *)v360[0]) >> 3))
        {
LABEL_199:
          if (v69)
          {
            v151 = v69;
            if (v360[1] != v69)
            {
              v152 = (char *)v360[1] - 32;
              do
              {
                v153 = v152 - 40;
                sub_1BE62033C((uint64_t)v152, *((_QWORD **)v152 + 1));
                sub_1BE67AC7C((uint64_t)(v152 - 40), *((_QWORD **)v152 - 4));
                v152 -= 72;
              }
              while (v153 != v69);
              v151 = (char *)v360[0];
            }
            v360[1] = v69;
            operator delete(v151);
          }
          *(_OWORD *)v360 = v358;
          v361 = v359;
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v154 = (id)qword_1EF568E30;
          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(buf) = 134217984;
            *(_QWORD *)((char *)&buf + 4) = 0x8E38E38E38E38E39 * (((char *)v360[1] - (char *)v360[0]) >> 3);
            _os_log_impl(&dword_1BE607000, v154, OS_LOG_TYPE_DEBUG, "groupingResultForContextStrokes: %lu words found", (uint8_t *)&buf, 0xCu);
          }

          goto LABEL_210;
        }
      }
      v340 = v70;
      v73 = 0;
      v74 = (char *)*((_QWORD *)&v358 + 1);
      while (1)
      {
        v75 = &v72[72 * v73];
        if ((unint64_t)v74 >= v359)
        {
          v74 = sub_1BE67AEEC((void **)&v358, (uint64_t)&v72[72 * v73]);
          goto LABEL_59;
        }
        v344 = v73;
        v347 = v72;
        *((_QWORD *)v74 + 1) = 0;
        v76 = v74 + 8;
        *((_QWORD *)v74 + 2) = 0;
        v355 = v74;
        *(_QWORD *)v74 = v74 + 8;
        v79 = *(_QWORD **)v75;
        v77 = v75 + 8;
        v78 = v79;
        if (v79 != v77)
          break;
LABEL_62:
        v80 = &v347[72 * v344];
        v81 = *(_OWORD *)(v80 + 24);
        *((_QWORD *)v355 + 6) = 0;
        v82 = v355 + 48;
        *((_QWORD *)v355 + 5) = v355 + 48;
        v83 = (_QWORD **)(v355 + 40);
        *(_OWORD *)(v355 + 24) = v81;
        *((_QWORD *)v355 + 7) = 0;
        v84 = (char *)*((_QWORD *)v80 + 5);
        v85 = v80 + 48;
        if (v84 != v80 + 48)
        {
          while (1)
          {
            v119 = (_QWORD *)*v82;
            v120 = v355 + 48;
            if (*v83 != v82)
            {
              v121 = (_QWORD *)*v82;
              v122 = v355 + 48;
              if (v119)
              {
                do
                {
                  v120 = v121;
                  v121 = (_QWORD *)v121[1];
                }
                while (v121);
              }
              else
              {
                do
                {
                  v120 = (_QWORD *)v122[2];
                  v90 = *v120 == (_QWORD)v122;
                  v122 = v120;
                }
                while (v90);
              }
              v123 = *((_QWORD *)v84 + 4);
              if (v120[4] >= v123)
                break;
            }
            if (v119)
              v124 = v120;
            else
              v124 = v355 + 48;
            if (v119)
              v125 = v120 + 1;
            else
              v125 = v355 + 48;
            if (!*v125)
              goto LABEL_148;
LABEL_173:
            v141 = (char *)*((_QWORD *)v84 + 1);
            if (v141)
            {
              do
              {
                v142 = v141;
                v141 = *(char **)v141;
              }
              while (v141);
            }
            else
            {
              do
              {
                v142 = (char *)*((_QWORD *)v84 + 2);
                v90 = *(_QWORD *)v142 == (_QWORD)v84;
                v84 = v142;
              }
              while (!v90);
            }
            v84 = v142;
            if (v142 == v85)
              goto LABEL_58;
          }
          v125 = v355 + 48;
          v124 = v355 + 48;
          if (v119)
          {
            while (1)
            {
              while (1)
              {
                v124 = v119;
                v126 = v119[4];
                if (v123 >= v126)
                  break;
                v119 = (_QWORD *)*v124;
                v125 = v124;
                if (!*v124)
                  goto LABEL_148;
              }
              if (v126 >= v123)
                goto LABEL_173;
              v119 = (_QWORD *)v124[1];
              if (!v119)
              {
                v125 = v124 + 1;
                break;
              }
            }
          }
LABEL_148:
          v127 = operator new(0x28uLL);
          v127[4] = *((_QWORD *)v84 + 4);
          *v127 = 0;
          v127[1] = 0;
          v127[2] = v124;
          *v125 = v127;
          v128 = (_QWORD *)**v83;
          if (v128)
          {
            *v83 = v128;
            v127 = (_QWORD *)*v125;
          }
          v129 = (_QWORD *)*v82;
          v90 = v127 == (_QWORD *)*v82;
          *((_BYTE *)v127 + 24) = v90;
          if (!v90)
          {
            do
            {
              v130 = v127[2];
              if (*(_BYTE *)(v130 + 24))
                break;
              v131 = *(_BYTE **)(v130 + 16);
              v132 = *(_QWORD *)v131;
              if (*(_QWORD *)v131 == v130)
              {
                v135 = *((_QWORD *)v131 + 1);
                if (!v135 || (v136 = *(unsigned __int8 *)(v135 + 24), v133 = (_BYTE *)(v135 + 24), v136))
                {
                  if (*(_QWORD **)v130 == v127)
                  {
                    *(_BYTE *)(v130 + 24) = 1;
                    v131[24] = 0;
                    v139 = *(_QWORD *)(v130 + 8);
                    *(_QWORD *)v131 = v139;
                    if (v139)
                      goto LABEL_165;
                  }
                  else
                  {
                    v137 = *(uint64_t **)(v130 + 8);
                    v138 = *v137;
                    *(_QWORD *)(v130 + 8) = *v137;
                    if (v138)
                    {
                      *(_QWORD *)(v138 + 16) = v130;
                      v131 = *(_BYTE **)(v130 + 16);
                    }
                    v137[2] = (uint64_t)v131;
                    *(_QWORD *)(*(_QWORD *)(v130 + 16) + 8 * (**(_QWORD **)(v130 + 16) != v130)) = v137;
                    *v137 = v130;
                    *(_QWORD *)(v130 + 16) = v137;
                    v131 = (_BYTE *)v137[2];
                    v130 = *(_QWORD *)v131;
                    *((_BYTE *)v137 + 24) = 1;
                    v131[24] = 0;
                    v139 = *(_QWORD *)(v130 + 8);
                    *(_QWORD *)v131 = v139;
                    if (v139)
LABEL_165:
                      *(_QWORD *)(v139 + 16) = v131;
                  }
                  *(_QWORD *)(v130 + 16) = *((_QWORD *)v131 + 2);
                  *(_QWORD *)(*((_QWORD *)v131 + 2) + 8 * (**((_QWORD **)v131 + 2) != (_QWORD)v131)) = v130;
                  *(_QWORD *)(v130 + 8) = v131;
LABEL_171:
                  *((_QWORD *)v131 + 2) = v130;
                  break;
                }
              }
              else if (!v132 || (v134 = *(unsigned __int8 *)(v132 + 24), v133 = (_BYTE *)(v132 + 24), v134))
              {
                if (*(_QWORD **)v130 == v127)
                {
                  v143 = v127[1];
                  *(_QWORD *)v130 = v143;
                  if (v143)
                  {
                    *(_QWORD *)(v143 + 16) = v130;
                    v131 = *(_BYTE **)(v130 + 16);
                  }
                  v127[2] = v131;
                  *(_QWORD *)(*(_QWORD *)(v130 + 16) + 8 * (**(_QWORD **)(v130 + 16) != v130)) = v127;
                  v127[1] = v130;
                  *(_QWORD *)(v130 + 16) = v127;
                  v131 = (_BYTE *)v127[2];
                  *((_BYTE *)v127 + 24) = 1;
                  v131[24] = 0;
                  v130 = *((_QWORD *)v131 + 1);
                  v140 = *(_QWORD **)v130;
                  *((_QWORD *)v131 + 1) = *(_QWORD *)v130;
                  if (v140)
LABEL_169:
                    v140[2] = v131;
                }
                else
                {
                  *(_BYTE *)(v130 + 24) = 1;
                  v131[24] = 0;
                  v130 = *((_QWORD *)v131 + 1);
                  v140 = *(_QWORD **)v130;
                  *((_QWORD *)v131 + 1) = *(_QWORD *)v130;
                  if (v140)
                    goto LABEL_169;
                }
                *(_QWORD *)(v130 + 16) = *((_QWORD *)v131 + 2);
                *(_QWORD *)(*((_QWORD *)v131 + 2) + 8 * (**((_QWORD **)v131 + 2) != (_QWORD)v131)) = v130;
                *(_QWORD *)v130 = v131;
                goto LABEL_171;
              }
              *(_BYTE *)(v130 + 24) = 1;
              v127 = v131;
              v131[24] = v131 == (_BYTE *)v129;
              *v133 = 1;
            }
            while (v131 != (_BYTE *)v129);
          }
          ++*((_QWORD *)v355 + 7);
          goto LABEL_173;
        }
LABEL_58:
        v73 = v344;
        *((_QWORD *)v355 + 8) = *(_QWORD *)&v347[72 * v344 + 64];
        v74 = v355 + 72;
LABEL_59:
        *((_QWORD *)&v358 + 1) = v74;
        ++v73;
        v72 = (char *)v362;
        v71 = v363;
        if (v73 >= 0x8E38E38E38E38E39 * ((v363 - (_BYTE *)v362) >> 3))
        {
          v70 = v340;
          if (!v362)
            goto LABEL_194;
LABEL_189:
          if (v71 != v72)
          {
            v144 = (uint64_t)(v71 - 32);
            do
            {
              v145 = v144 - 40;
              v146 = v72;
              sub_1BE62033C(v144, *(_QWORD **)(v144 + 8));
              sub_1BE67AC7C(v144 - 40, *(_QWORD **)(v144 - 32));
              v72 = v146;
              v144 -= 72;
            }
            while ((char *)v145 != v146);
            v71 = (char *)v362;
          }
          v363 = v72;
          operator delete(v71);
          goto LABEL_194;
        }
      }
      while (1)
      {
        v86 = (_QWORD *)*((_QWORD *)v355 + 1);
        v87 = v76;
        if (*(_QWORD **)v355 != v76)
        {
          v88 = (_QWORD *)*((_QWORD *)v355 + 1);
          v89 = v76;
          if (v86)
          {
            do
            {
              v87 = v88;
              v88 = (_QWORD *)v88[1];
            }
            while (v88);
          }
          else
          {
            do
            {
              v87 = (_QWORD *)v89[2];
              v90 = *v87 == (_QWORD)v89;
              v89 = v87;
            }
            while (v90);
          }
          v91 = v78[4];
          if (v87[4] >= v91)
            break;
        }
        if (v86)
          v92 = v87;
        else
          v92 = v76;
        if (v86)
          v93 = v87 + 1;
        else
          v93 = v76;
        if (!*v93)
          goto LABEL_86;
LABEL_114:
        v116 = (_QWORD *)v78[1];
        if (v116)
        {
          do
          {
            v117 = v116;
            v116 = (_QWORD *)*v116;
          }
          while (v116);
        }
        else
        {
          do
          {
            v117 = (_QWORD *)v78[2];
            v90 = *v117 == (_QWORD)v78;
            v78 = v117;
          }
          while (!v90);
        }
        v78 = v117;
        if (v117 == v77)
          goto LABEL_62;
      }
      v93 = v76;
      v92 = v76;
      if (v86)
      {
        while (1)
        {
          while (1)
          {
            v92 = v86;
            v94 = v86[4];
            if (v91 >= v94)
              break;
            v86 = (_QWORD *)*v92;
            v93 = v92;
            if (!*v92)
              goto LABEL_86;
          }
          if (v94 >= v91)
            goto LABEL_114;
          v86 = (_QWORD *)v92[1];
          if (!v86)
          {
            v93 = v92 + 1;
            break;
          }
        }
      }
LABEL_86:
      v95 = operator new(0x40uLL);
      v96 = v77;
      *(_QWORD *)&buf = v95;
      *((_QWORD *)&buf + 1) = v76;
      v369 = 0;
      v97 = v78[4];
      v95[5] = 0;
      v95[4] = v97;
      v95[6] = 0;
      v95[7] = 0;
      v99 = (_BYTE *)v78[5];
      v98 = (_BYTE *)v78[6];
      v100 = v98 - v99;
      if (v98 != v99)
      {
        if (v100 < 0)
          sub_1BE61F930();
        v101 = (char *)operator new(v98 - v99);
        v95[5] = v101;
        v95[6] = v101;
        v102 = &v101[16 * (v100 >> 4)];
        v95[7] = v102;
        memcpy(v101, v99, v100);
        v95[6] = v102;
      }
      v369 = 1;
      *v95 = 0;
      v95[1] = 0;
      v95[2] = v92;
      *v93 = v95;
      v103 = **(_QWORD **)v355;
      v77 = v96;
      if (v103)
      {
        *(_QWORD *)v355 = v103;
        v95 = (_QWORD *)*v93;
      }
      v104 = (_BYTE *)*v76;
      v90 = v95 == (_QWORD *)*v76;
      *((_BYTE *)v95 + 24) = v90;
      if (!v90)
      {
        do
        {
          v105 = v95[2];
          if (*(_BYTE *)(v105 + 24))
            break;
          v106 = *(_BYTE **)(v105 + 16);
          v107 = *(_QWORD *)v106;
          if (*(_QWORD *)v106 == v105)
          {
            v110 = *((_QWORD *)v106 + 1);
            if (!v110 || (v111 = *(unsigned __int8 *)(v110 + 24), v108 = (_BYTE *)(v110 + 24), v111))
            {
              if (*(_QWORD **)v105 == v95)
              {
                *(_BYTE *)(v105 + 24) = 1;
                v106[24] = 0;
                v114 = *(_QWORD *)(v105 + 8);
                *(_QWORD *)v106 = v114;
                if (v114)
                  goto LABEL_106;
              }
              else
              {
                v112 = *(uint64_t **)(v105 + 8);
                v113 = *v112;
                *(_QWORD *)(v105 + 8) = *v112;
                if (v113)
                {
                  *(_QWORD *)(v113 + 16) = v105;
                  v106 = *(_BYTE **)(v105 + 16);
                }
                v112[2] = (uint64_t)v106;
                *(_QWORD *)(*(_QWORD *)(v105 + 16) + 8 * (**(_QWORD **)(v105 + 16) != v105)) = v112;
                *v112 = v105;
                *(_QWORD *)(v105 + 16) = v112;
                v106 = (_BYTE *)v112[2];
                v105 = *(_QWORD *)v106;
                *((_BYTE *)v112 + 24) = 1;
                v106[24] = 0;
                v114 = *(_QWORD *)(v105 + 8);
                *(_QWORD *)v106 = v114;
                if (v114)
LABEL_106:
                  *(_QWORD *)(v114 + 16) = v106;
              }
              *(_QWORD *)(v105 + 16) = *((_QWORD *)v106 + 2);
              *(_QWORD *)(*((_QWORD *)v106 + 2) + 8 * (**((_QWORD **)v106 + 2) != (_QWORD)v106)) = v105;
              *(_QWORD *)(v105 + 8) = v106;
LABEL_112:
              *((_QWORD *)v106 + 2) = v105;
              break;
            }
          }
          else if (!v107 || (v109 = *(unsigned __int8 *)(v107 + 24), v108 = (_BYTE *)(v107 + 24), v109))
          {
            if (*(_QWORD **)v105 == v95)
            {
              v118 = v95[1];
              *(_QWORD *)v105 = v118;
              if (v118)
              {
                *(_QWORD *)(v118 + 16) = v105;
                v106 = *(_BYTE **)(v105 + 16);
              }
              v95[2] = v106;
              *(_QWORD *)(*(_QWORD *)(v105 + 16) + 8 * (**(_QWORD **)(v105 + 16) != v105)) = v95;
              v95[1] = v105;
              *(_QWORD *)(v105 + 16) = v95;
              v106 = (_BYTE *)v95[2];
              *((_BYTE *)v95 + 24) = 1;
              v106[24] = 0;
              v105 = *((_QWORD *)v106 + 1);
              v115 = *(_QWORD **)v105;
              *((_QWORD *)v106 + 1) = *(_QWORD *)v105;
              if (v115)
LABEL_110:
                v115[2] = v106;
            }
            else
            {
              *(_BYTE *)(v105 + 24) = 1;
              v106[24] = 0;
              v105 = *((_QWORD *)v106 + 1);
              v115 = *(_QWORD **)v105;
              *((_QWORD *)v106 + 1) = *(_QWORD *)v105;
              if (v115)
                goto LABEL_110;
            }
            *(_QWORD *)(v105 + 16) = *((_QWORD *)v106 + 2);
            *(_QWORD *)(*((_QWORD *)v106 + 2) + 8 * (**((_QWORD **)v106 + 2) != (_QWORD)v106)) = v105;
            *(_QWORD *)v105 = v106;
            goto LABEL_112;
          }
          *(_BYTE *)(v105 + 24) = 1;
          v95 = v106;
          v106[24] = v106 == v104;
          *v108 = 1;
        }
        while (v106 != v104);
      }
      ++*((_QWORD *)v355 + 2);
      goto LABEL_114;
    }
  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v66 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BE607000, v66, OS_LOG_TYPE_FAULT, "Fast grouping result must exist for the requested tokenization type", (uint8_t *)&buf, 2u);
    }

    v360[0] = 0;
    v360[1] = 0;
    v361 = 0;
    v22 = a7;
    if (a7 == 1)
      goto LABEL_4;
  }
  if ((unint64_t)(v22 - 3) <= 1)
  {
    v67 = 126 - 2 * __clz(0x8E38E38E38E38E39 * (((char *)v360[1] - (char *)v360[0]) >> 3));
    if (v360[1] == v360[0])
      v68 = 0;
    else
      v68 = v67;
    sub_1BE88C48C((uint64_t)v360[0], (double *)v360[1], v68, 1);
  }
LABEL_210:
  if (objc_msgSend_count(v338, v17, v18, v19, v20, v21))
  {
    v348 = v338;
    v155 = v337;
    v156 = v336;
    v345 = v156;
    if (self)
    {
      if ((unint64_t)(v335 - 3) <= 1)
      {
        v162 = v156;
        objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v156, v157, 0, 0, v160, v161);
        obja = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeGroupClusters(v162, v163, v164, v165, v166, v167);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        if (v335 == 4)
        {
          objc_msgSend_strokeIdentifiersInFullContextForStrokeIdentifiers_sortedStrokeGroups_clusteredStrokeGroups_unusedStrokeIdentifiers_(CHRecognitionSession, v168, (uint64_t)v348, (uint64_t)obja, (uint64_t)v169, 0);
          v170 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v335 != 3)
          {
            v65 = 0;
            goto LABEL_284;
          }
          objc_msgSend_strokeIdentifiersInProximalGroupsForStrokeIdentifiers_sortedStrokeGroups_clusteredStrokeGroups_unusedStrokeIdentifiers_(CHRecognitionSession, v168, (uint64_t)v348, (uint64_t)obja, (uint64_t)v169, 0);
          v170 = objc_claimAutoreleasedReturnValue();
        }
        v65 = (id)v170;
LABEL_284:

        goto LABEL_285;
      }
      objc_msgSend_set(MEMORY[0x1E0C99E20], v157, v158, v159, v160, v161);
      v65 = (id)objc_claimAutoreleasedReturnValue();
      v366 = 0u;
      v367 = 0u;
      *(_OWORD *)__p = 0u;
      v365 = 0u;
      obja = v348;
      v273 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v271, (uint64_t)__p, (uint64_t)&buf, 16, v272);
      if (!v273)
        goto LABEL_285;
      v353 = *(_QWORD *)v365;
LABEL_254:
      v357 = v273;
      v279 = 0;
      while (1)
      {
        if (*(_QWORD *)v365 != v353)
          objc_enumerationMutation(obja);
        v280 = *((_QWORD *)__p[1] + v279);
        objc_msgSend_strokeProvider(self, v274, v275, v276, v277, v278);
        v281 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v282, v280, (uint64_t)v281, v283, v284);
        v285 = (void *)objc_claimAutoreleasedReturnValue();

        v290 = objc_msgSend_indexOfObject_(v155, v286, (uint64_t)v285, v287, v288, v289);
        objc_msgSend_encodedStrokeIdentifier(v285, v291, v292, v293, v294, v295);
        v296 = (void *)objc_claimAutoreleasedReturnValue();
        v301 = objc_msgSend_containsObject_(v65, v297, (uint64_t)v296, v298, v299, v300);

        if ((v301 & 1) == 0)
        {
          v307 = v360[0];
          v306 = v360[1];
          if (v360[1] != v360[0])
            break;
        }
LABEL_277:

        if (++v279 == v357)
        {
          v273 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v274, (uint64_t)__p, (uint64_t)&buf, 16, v278);
          if (!v273)
          {
LABEL_285:

            goto LABEL_286;
          }
          goto LABEL_254;
        }
      }
      v308 = 0;
LABEL_262:
      v309 = (_QWORD *)v307[9 * v308 + 1];
      if (!v309)
        goto LABEL_261;
      while (1)
      {
        v310 = v309[4];
        if (v310 <= v290)
        {
          if (v310 >= v290)
          {
            v311 = (char *)&v307[9 * v308];
            v312 = (char *)*((_QWORD *)v311 + 5);
            v313 = v311 + 48;
            if (v312 != v311 + 48)
            {
              do
              {
                objc_msgSend_objectAtIndexedSubscript_(v155, v302, *((_QWORD *)v312 + 4), v303, v304, v305);
                v314 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_encodedStrokeIdentifier(v314, v315, v316, v317, v318, v319);
                v320 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v65, v321, (uint64_t)v320, v322, v323, v324);

                v325 = (char *)*((_QWORD *)v312 + 1);
                if (v325)
                {
                  do
                  {
                    v326 = v325;
                    v325 = *(char **)v325;
                  }
                  while (v325);
                }
                else
                {
                  do
                  {
                    v326 = (char *)*((_QWORD *)v312 + 2);
                    v90 = *(_QWORD *)v326 == (_QWORD)v312;
                    v312 = v326;
                  }
                  while (!v90);
                }
                v312 = v326;
              }
              while (v326 != v313);
              v307 = v360[0];
              v306 = v360[1];
            }
LABEL_261:
            if (++v308 >= 0x8E38E38E38E38E39 * ((v306 - (_BYTE *)v307) >> 3))
              goto LABEL_277;
            goto LABEL_262;
          }
          ++v309;
        }
        v309 = (_QWORD *)*v309;
        if (!v309)
          goto LABEL_261;
      }
    }
    v65 = 0;
LABEL_286:

    goto LABEL_293;
  }
  v349 = v337;
  v334 = v336;
  if (!self)
  {
    v65 = 0;
    goto LABEL_292;
  }
  objc_msgSend_set(MEMORY[0x1E0C99E60], v171, v172, v173, v174, v175);
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  if (v360[1] != v360[0])
  {
    v343 = 0;
    v341 = 0;
    v346 = 0;
    v181.f64[0] = obj;
    v181.f64[1] = y;
    v182 = vcvt_f32_f64(v181);
    v183 = 3.4028e38;
    do
    {
      objc_msgSend_set(MEMORY[0x1E0C99E20], v176, v177, v178, v179, v180, v334);
      v189 = (void *)objc_claimAutoreleasedReturnValue();
      v190 = (char *)v360[0] + 72 * v346;
      v191 = (char *)*((_QWORD *)v190 + 5);
      v192 = v190 + 48;
      if (v191 != v190 + 48)
      {
        do
        {
          objc_msgSend_objectAtIndexedSubscript_(v349, v184, *((_QWORD *)v191 + 4), v186, v187, v188);
          v246 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v189, v247, (uint64_t)v246, v248, v249, v250);

          v251 = (char *)*((_QWORD *)v191 + 1);
          if (v251)
          {
            do
            {
              v252 = v251;
              v251 = *(char **)v251;
            }
            while (v251);
          }
          else
          {
            do
            {
              v252 = (char *)*((_QWORD *)v191 + 2);
              v90 = *(_QWORD *)v252 == (_QWORD)v191;
              v191 = v252;
            }
            while (!v90);
          }
          v191 = v252;
        }
        while (v252 != v192);
      }
      x = *MEMORY[0x1E0C9D628];
      v194 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      width = *(double *)(MEMORY[0x1E0C9D628] + 16);
      height = *(double *)(MEMORY[0x1E0C9D628] + 24);
      objc_msgSend_set(MEMORY[0x1E0C99E20], v184, v185, v186, v187, v188);
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      v366 = 0u;
      v367 = 0u;
      *(_OWORD *)__p = 0u;
      v365 = 0u;
      v198 = v189;
      v201 = 0;
      v207 = objc_msgSend_countByEnumeratingWithState_objects_count_(v198, v199, (uint64_t)__p, (uint64_t)&buf, 16, v200);
      if (v207)
      {
        v208 = *(_QWORD *)v365;
        v209 = 3.4028e38;
        do
        {
          for (i = 0; i != v207; ++i)
          {
            if (*(_QWORD *)v365 != v208)
              objc_enumerationMutation(v198);
            v211 = (void *)*((_QWORD *)__p[1] + i);
            objc_msgSend_encodedStrokeIdentifier(v211, v202, v203, v204, v205, v206);
            v212 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v197, v213, (uint64_t)v212, v214, v215, v216);

            objc_msgSend_bounds(v211, v217, v218, v219, v220, v221);
            v379.origin.x = v222;
            v379.origin.y = v223;
            v379.size.width = v224;
            v379.size.height = v225;
            v373.origin.x = x;
            v373.origin.y = v194;
            v373.size.width = width;
            v373.size.height = height;
            v374 = CGRectUnion(v373, v379);
            x = v374.origin.x;
            v194 = v374.origin.y;
            width = v374.size.width;
            height = v374.size.height;
            objc_msgSend_bounds(v211, v226, v227, v228, v229, v230);
            v371.x = obj;
            v371.y = y;
            v231 = CGRectContainsPoint(v375, v371);
            objc_msgSend_bounds(v211, v232, v233, v234, v235, v236);
            MidX = CGRectGetMidX(v376);
            objc_msgSend_bounds(v211, v237, v238, v239, v240, v241);
            MidY = CGRectGetMidY(v377);
            v243.f64[0] = MidX;
            v243.f64[1] = MidY;
            v244 = vsub_f32(vcvt_f32_f64(v243), v182);
            v245 = sqrtf(vaddv_f32(vmul_f32(v244, v244)));
            if (!v201 && v231 || ((v201 ^ v231) & 1) == 0 && v245 < v209)
            {
              v201 = v231;
              v209 = v245;
            }
          }
          v207 = objc_msgSend_countByEnumeratingWithState_objects_count_(v198, v202, (uint64_t)__p, (uint64_t)&buf, 16, v206);
        }
        while (v207);
      }
      else
      {
        v209 = 3.4028e38;
      }

      v378.origin.x = x;
      v378.origin.y = v194;
      v378.size.width = width;
      v378.size.height = height;
      v372.x = obj;
      v372.y = y;
      v253 = CGRectContainsPoint(v378, v372);
      v254 = v253;
      if (!v343 && v253 || !v341 && v201 || ((v209 < v183) & ~(v343 ^ v253 | v341 ^ v201)) != 0)
      {
        v255 = v197;

        v341 = v201;
        v343 = v254;
        v183 = v209;
        v339 = v255;
      }

      ++v346;
    }
    while (v346 < 0x8E38E38E38E38E39 * (((char *)v360[1] - (char *)v360[0]) >> 3));
  }
  if ((unint64_t)(v335 - 3) < 2)
  {
    objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v334, v176, 0, 0, v179, v180);
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeGroupClusters(v334, v257, v258, v259, v260, v261);
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    if (v335 == 4)
    {
      objc_msgSend_allObjects(v339, v262, v263, v264, v265, v266);
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeIdentifiersInFullContextForStrokeIdentifiers_sortedStrokeGroups_clusteredStrokeGroups_unusedStrokeIdentifiers_(CHRecognitionSession, v328, (uint64_t)v268, (uint64_t)v256, (uint64_t)v267, 0);
      v270 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v335 != 3)
      {
        v65 = 0;
        goto LABEL_290;
      }
      objc_msgSend_allObjects(v339, v262, v263, v264, v265, v266);
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokeIdentifiersInProximalGroupsForStrokeIdentifiers_sortedStrokeGroups_clusteredStrokeGroups_unusedStrokeIdentifiers_(CHRecognitionSession, v269, (uint64_t)v268, (uint64_t)v256, (uint64_t)v267, 0);
      v270 = objc_claimAutoreleasedReturnValue();
    }
    v65 = (id)v270;

LABEL_290:
    v327 = v339;
    goto LABEL_291;
  }
  v327 = v339;
  v65 = v339;
LABEL_291:

LABEL_292:
LABEL_293:
  v329 = (char *)v360[0];
  if (v360[0])
  {
    v330 = v360[0];
    if (v360[1] != v360[0])
    {
      v331 = (char *)v360[1] - 32;
      do
      {
        v332 = v331 - 40;
        sub_1BE62033C((uint64_t)v331, *((_QWORD **)v331 + 1));
        sub_1BE67AC7C((uint64_t)(v331 - 40), *((_QWORD **)v331 - 4));
        v331 -= 72;
      }
      while (v332 != v329);
      v330 = v360[0];
    }
    v360[1] = v329;
    operator delete(v330);
  }
LABEL_299:

  return v65;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clutterFilter, 0);
  objc_storeStrong((id *)&self->_locales, 0);
}

@end
