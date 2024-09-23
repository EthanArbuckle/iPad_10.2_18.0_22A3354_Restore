@implementation MLPSeqDataBatch

- (MLPSeqDataBatch)initWithDataBatch:(id)a3 batchSize:(unint64_t)a4 network:(id)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  MLPSeqDataBatch *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
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
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  unint64_t v75;
  uint64_t *v76;
  float *v77;
  float *v78;
  uint64_t *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  float v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  _BYTE *v102;
  float *v103;
  unint64_t v104;
  float *v105;
  int v106;
  unint64_t v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  float v115;
  float *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  float *v120;
  int64_t v121;
  uint64_t v122;
  unint64_t v123;
  uint64_t v124;
  unint64_t v125;
  unint64_t v126;
  char *v127;
  float *v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  _OWORD *v132;
  float *v133;
  uint64_t v134;
  __int128 v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  float *v139;
  char *v140;
  float *v141;
  uint64_t v142;
  __int128 v143;
  int v144;
  void *v145;
  float *v146;
  double v147;
  const char *v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  const __CFArray *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  NSArray *matrix;
  MLPNDArrayLossLabels *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  MLPNDArrayLossLabels *combinedLossLabels;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  id v170;
  uint64_t *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  id v175;
  MLPSeqDataBatch *v176;
  unint64_t v177;
  uint64_t *v178;
  void *v179;
  float *v180;
  void *v181;
  void *v182;
  float *v183;
  void *__p;
  float *v185;
  float *v186;
  float *v187;
  uint64_t v188;
  float *v189;
  uint64_t *v190;
  uint64_t *v191;
  uint64_t *v192;
  objc_super v193;

  v170 = a3;
  v175 = a5;
  v193.receiver = self;
  v193.super_class = (Class)MLPSeqDataBatch;
  v11 = -[MLPSeqDataBatch init](&v193, sel_init);
  if (v11)
  {
    objc_msgSend_deviceHandler(v175, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_device(v12, v13, v14, v15);
    v168 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_layers(v175, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v19, v20, v21, v22);
    v167 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_layers(v175, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v26, v27, v28, v29);
    v169 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKeyedSubscript_(v170, v30, (uint64_t)MLPModelSampleDataBatchOfSequencesKey[0], v31);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v32, v33, v34);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v35, v36, v37);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x1E0CC6E38];
    v42 = objc_msgSend_outputChannels(v169, v39, v40, v41);
    objc_msgSend_imageDescriptorWithChannelFormat_width_height_featureChannels_(v38, v43, 4, 1, 1, v42);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = 0;
    v191 = 0;
    v192 = 0;
    v176 = v11;
    v46 = 0;
    if (a4)
    {
      v47 = 0;
      objc_msgSend_objectAtIndexedSubscript_(v181, v44, 0, v45);
      while (1)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v50, v51, (uint64_t)MLPModelSampleDataSequenceValuesKey[0], v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend_count(v53, v54, v55, v56);
        v58 = v57;
        if (v46 < v192)
        {
          *v46 = v47;
          v46[1] = v57;
          v46 += 2;
          goto LABEL_5;
        }
        v59 = v190;
        v60 = ((char *)v46 - (char *)v190) >> 4;
        v61 = v60 + 1;
        if ((unint64_t)(v60 + 1) >> 60)
          sub_19C07DA0C();
        v62 = (char *)v192 - (char *)v190;
        if (v192 - v190 > v61)
          v61 = v62 >> 3;
        if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF0)
          v63 = 0xFFFFFFFFFFFFFFFLL;
        else
          v63 = v61;
        if (v63)
        {
          if (v63 >> 60)
            sub_19C07C7FC();
          v64 = (char *)operator new(16 * v63);
          v65 = (uint64_t *)&v64[16 * v60];
          *v65 = v47;
          v65[1] = v58;
          if (v46 == v59)
          {
LABEL_22:
            v67 = v46;
            v46 = v65 + 2;
            v190 = v65;
            v191 = v65 + 2;
            v192 = (uint64_t *)&v64[16 * v63];
            if (!v67)
              goto LABEL_5;
LABEL_23:
            operator delete(v67);
            goto LABEL_5;
          }
        }
        else
        {
          v64 = 0;
          v65 = (uint64_t *)(16 * v60);
          *v65 = v47;
          v65[1] = v58;
          if (v46 == v59)
            goto LABEL_22;
        }
        v66 = v65;
        do
        {
          *((_OWORD *)v66 - 1) = *((_OWORD *)v46 - 1);
          v66 -= 2;
          v46 -= 2;
        }
        while (v46 != v59);
        v67 = v190;
        v46 = v65 + 2;
        v190 = v66;
        v191 = v65 + 2;
        v192 = (uint64_t *)&v64[16 * v63];
        if (v67)
          goto LABEL_23;
LABEL_5:
        v11 = v176;
        v191 = v46;

        if (++v47 == a4)
        {
          v68 = (unint64_t)v190;
          goto LABEL_26;
        }
        objc_msgSend_objectAtIndexedSubscript_(v181, v48, v47, v49);
      }
    }
    v68 = 0;
LABEL_26:
    v69 = 126 - 2 * __clz((uint64_t)((uint64_t)v46 - v68) >> 4);
    if (v46 == (uint64_t *)v68)
      v70 = 0;
    else
      v70 = v69;
    sub_19C1977E4(v68, v46, v70, 1);
    v74 = v190;
    v172 = v190[1];
    if (v172)
    {
      v75 = 0;
      v76 = v191;
      v171 = v190;
      v178 = v191;
      while (1)
      {
        v187 = 0;
        v188 = 0;
        v189 = 0;
        __p = 0;
        v185 = 0;
        v186 = 0;
        if (v74 != v76)
          break;
        v183 = 0;
LABEL_89:
        objc_msgSend_deviceHandler(v175, v71, v72, v73);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v146 = v187;
        LODWORD(v147) = 0;
        v11 = v176;
        objc_msgSend_weightMatrixWithRows_columns_stdDev_initialValues_columnMajor_(v145, v148, v183 - v187, 1, v187, 0, v147);
        v149 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_addObject_(v174, v150, (uint64_t)v149, v151);
        v176->_labelsCount += ((char *)v185 - (_BYTE *)__p) >> 2;
        v74 = v171;
        v152 = sub_19C194904((int **)&__p);
        objc_msgSend_addObjectsFromArray_(v173, v153, (uint64_t)v152, v154);

        if (v152)
          CFRelease(v152);

        if (__p)
        {
          v185 = (float *)__p;
          operator delete(__p);
        }
        if (v146)
          operator delete(v146);
        if (++v75 == v172)
          goto LABEL_95;
      }
      v77 = 0;
      v180 = 0;
      v78 = 0;
      v79 = v74;
      v177 = v75;
      while (1)
      {
        while (1)
        {
          objc_msgSend_objectAtIndexedSubscript_(v181, v71, *v79, v73);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v80, v81, (uint64_t)MLPModelSampleDataSequenceValuesKey[0], v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v80, v84, (uint64_t)MLPModelSampleDataSequenceLabelsKey, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v83, v87, v88, v89) > v75)
            break;
          v183 = v78;

          v79 += 2;
          if (v79 == v76)
            goto LABEL_89;
        }
        objc_msgSend_objectAtIndexedSubscript_(v83, v90, v75, v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v182 = v86;
        v179 = v80;
        v96 = (float)(unint64_t)objc_msgSend_unsignedIntegerValue(v92, v93, v94, v95);
        if (v78 < v180)
        {
          *v78 = v96;
          v97 = (uint64_t)(v78 + 1);
          goto LABEL_53;
        }
        v98 = v78 - v77;
        v99 = v98 + 1;
        if ((unint64_t)(v98 + 1) >> 62)
          sub_19C07DA0C();
        if (((char *)v180 - (char *)v77) >> 1 > v99)
          v99 = ((char *)v180 - (char *)v77) >> 1;
        v100 = (unint64_t)((char *)v180 - (char *)v77) >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v99;
        if (v100)
        {
          if (v100 >> 62)
            sub_19C07C7FC();
          v101 = v100;
          v102 = operator new(4 * v100);
          v100 = v101;
          v103 = (float *)&v102[4 * v98];
          *v103 = v96;
          v97 = (uint64_t)(v103 + 1);
          if (v78 == v77)
          {
LABEL_67:
            v187 = v103;
            v188 = v97;
            v180 = (float *)&v102[4 * v100];
            v189 = v180;
            if (!v77)
              goto LABEL_52;
LABEL_51:
            operator delete(v77);
            goto LABEL_52;
          }
        }
        else
        {
          v102 = 0;
          v103 = (float *)(4 * v98);
          *(float *)(4 * v98) = v96;
          v97 = 4 * v98 + 4;
          if (v78 == v77)
            goto LABEL_67;
        }
        v104 = (char *)(v78 - 1) - (char *)v77;
        if (v104 < 0xBC
          || &v102[(char *)v78 - (char *)v77 - 4 - (v104 & 0xFFFFFFFFFFFFFFFCLL)] > &v102[(char *)v78 - (char *)v77 - 4]
          || (float *)((char *)v78 - (v104 & 0xFFFFFFFFFFFFFFFCLL) - 4) > v78 - 1
          || (unint64_t)((char *)v77 - v102) < 0x20)
        {
          break;
        }
        v130 = (v104 >> 2) + 1;
        v131 = 4 * (v130 & 0x7FFFFFFFFFFFFFF8);
        v105 = &v78[v131 / 0xFFFFFFFFFFFFFFFCLL];
        v103 = (float *)((char *)v103 - v131);
        v132 = &v102[4 * v98 - 16];
        v133 = v78 - 4;
        v134 = v130 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          v135 = *(_OWORD *)v133;
          *(v132 - 1) = *((_OWORD *)v133 - 1);
          *v132 = v135;
          v132 -= 2;
          v133 -= 8;
          v134 -= 8;
        }
        while (v134);
        if (v130 != (v130 & 0x7FFFFFFFFFFFFFF8))
          goto LABEL_49;
LABEL_50:
        v187 = v103;
        v188 = v97;
        v180 = (float *)&v102[4 * v100];
        v189 = v180;
        if (v77)
          goto LABEL_51;
LABEL_52:
        v77 = v103;
LABEL_53:
        v183 = (float *)v97;
        v188 = v97;

        v107 = v75;
        objc_msgSend_objectAtIndexedSubscript_(v86, v108, v75, v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = v83;
        v115 = (float)(unint64_t)objc_msgSend_unsignedIntegerValue(v110, v112, v113, v114);
        v116 = v185;
        if (v185 >= v186)
        {
          v120 = (float *)__p;
          v121 = (char *)v185 - (_BYTE *)__p;
          v122 = ((char *)v185 - (_BYTE *)__p) >> 2;
          v123 = v122 + 1;
          if ((unint64_t)(v122 + 1) >> 62)
            sub_19C07DA0C();
          v124 = (char *)v186 - (_BYTE *)__p;
          if (((char *)v186 - (_BYTE *)__p) >> 1 > v123)
            v123 = v124 >> 1;
          if ((unint64_t)v124 >= 0x7FFFFFFFFFFFFFFCLL)
            v125 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v125 = v123;
          if (v125)
          {
            if (v125 >> 62)
              sub_19C07C7FC();
            v126 = v125;
            v127 = (char *)operator new(4 * v125);
            v125 = v126;
            v128 = (float *)&v127[4 * v122];
            *v128 = v115;
            v117 = (uint64_t)(v128 + 1);
            if (v116 != v120)
            {
LABEL_64:
              v129 = (char *)(v116 - 1) - (char *)v120;
              if (v129 < 0x2C)
              {
                v83 = v111;
                goto LABEL_82;
              }
              v136 = (char *)v116 - &v127[v121];
              v83 = v111;
              if (v136 < 0x20)
                goto LABEL_107;
              v137 = (v129 >> 2) + 1;
              v138 = 4 * (v137 & 0x7FFFFFFFFFFFFFF8);
              v139 = &v116[v138 / 0xFFFFFFFFFFFFFFFCLL];
              v128 = (float *)((char *)v128 - v138);
              v140 = &v127[4 * v122 - 16];
              v141 = v116 - 4;
              v142 = v137 & 0x7FFFFFFFFFFFFFF8;
              do
              {
                v143 = *(_OWORD *)v141;
                *((_OWORD *)v140 - 1) = *((_OWORD *)v141 - 1);
                *(_OWORD *)v140 = v143;
                v140 -= 32;
                v141 -= 8;
                v142 -= 8;
              }
              while (v142);
              v116 = v139;
              if (v137 != (v137 & 0x7FFFFFFFFFFFFFF8))
              {
LABEL_107:
                do
                {
LABEL_82:
                  v144 = *((_DWORD *)v116-- - 1);
                  *((_DWORD *)v128-- - 1) = v144;
                }
                while (v116 != v120);
              }
LABEL_83:
              __p = v128;
              v185 = (float *)v117;
              v186 = (float *)&v127[4 * v125];
              if (v120)
                operator delete(v120);
              v118 = v179;
              v119 = v182;
              v75 = v177;
              goto LABEL_86;
            }
          }
          else
          {
            v127 = 0;
            v128 = (float *)(4 * v122);
            *(float *)(4 * v122) = v115;
            v117 = 4 * v122 + 4;
            if (v116 != v120)
              goto LABEL_64;
          }
          v83 = v111;
          goto LABEL_83;
        }
        *v185 = v115;
        v117 = (uint64_t)(v116 + 1);
        v75 = v107;
        v118 = v179;
        v119 = v182;
LABEL_86:
        v185 = (float *)v117;

        v78 = v183;
        v76 = v178;

        v79 += 2;
        if (v79 == v178)
          goto LABEL_89;
      }
      v105 = v78;
      do
      {
LABEL_49:
        v106 = *((_DWORD *)v105-- - 1);
        *((_DWORD *)v103-- - 1) = v106;
      }
      while (v105 != v77);
      goto LABEL_50;
    }
LABEL_95:
    v155 = objc_msgSend_copy(v174, v71, v72, v73);
    matrix = v11->_matrix;
    v11->_matrix = (NSArray *)v155;

    v157 = objc_alloc_init(MLPNDArrayLossLabels);
    v161 = (void *)objc_msgSend_copy(v173, v158, v159, v160);
    objc_msgSend_setLabels_(v157, v162, (uint64_t)v161, v163);

    combinedLossLabels = v11->_combinedLossLabels;
    v11->_combinedLossLabels = v157;

    if (v74)
      operator delete(v74);

  }
  return v11;
}

- (NSArray)matrix
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMatrix:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MLPNDArrayLossLabels)combinedLossLabels
{
  return (MLPNDArrayLossLabels *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCombinedLossLabels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)labelsCount
{
  return self->_labelsCount;
}

- (void)setLabelsCount:(unint64_t)a3
{
  self->_labelsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_combinedLossLabels, 0);
  objc_storeStrong((id *)&self->_matrix, 0);
}

@end
