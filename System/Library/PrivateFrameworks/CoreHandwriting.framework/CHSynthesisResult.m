@implementation CHSynthesisResult

- (CHSynthesisResult)initWithContent:(id)a3 drawing:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  CHSynthesisResult *v34;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = (void *)objc_msgSend_copy(v6, v8, v9, v10, v11, v12);
  v37[0] = v13;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v14, (uint64_t)v37, 1, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB36B8];
  v24 = objc_msgSend_strokeCount(v7, v19, v20, v21, v22, v23);
  objc_msgSend_indexSetWithIndexesInRange_(v18, v25, 0, v24, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v28;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v29, (uint64_t)&v36, 1, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (CHSynthesisResult *)objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_numberOfNotSynthesizedCharacters_(self, v33, (uint64_t)v6, (uint64_t)v7, (uint64_t)v17, (uint64_t)v32, 0);

  return v34;
}

- (CHSynthesisResult)initWithContent:(id)a3 drawing:(id)a4 segmentContents:(id)a5 segmentStrokeIndexes:(id)a6 numberOfNotSynthesizedCharacters:(unint64_t)a7
{
  return (CHSynthesisResult *)objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_inventoryDebuggingStyleDrawing_inventoryDebuggingStyleContent_numberOfNotSynthesizedCharacters_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, 0, 0, a7);
}

- (CHSynthesisResult)initWithContent:(id)a3 drawing:(id)a4 segmentContents:(id)a5 segmentStrokeIndexes:(id)a6 inventoryDebuggingStyleDrawing:(id)a7 inventoryDebuggingStyleContent:(id)a8 numberOfNotSynthesizedCharacters:(unint64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  objc_super v89;
  uint8_t buf[4];
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v89.receiver = self;
  v89.super_class = (Class)CHSynthesisResult;
  v26 = -[CHSynthesisResult init](&v89, sel_init);
  if (v26)
  {
    v27 = objc_msgSend_copy(v15, v21, v22, v23, v24, v25);
    v28 = (void *)*((_QWORD *)v26 + 2);
    *((_QWORD *)v26 + 2) = v27;

    v34 = objc_msgSend_copy(v16, v29, v30, v31, v32, v33);
    v35 = (void *)*((_QWORD *)v26 + 1);
    *((_QWORD *)v26 + 1) = v34;

    v41 = objc_msgSend_copy(v17, v36, v37, v38, v39, v40);
    v42 = (void *)*((_QWORD *)v26 + 3);
    *((_QWORD *)v26 + 3) = v41;

    v48 = objc_msgSend_copy(v18, v43, v44, v45, v46, v47);
    v49 = (void *)*((_QWORD *)v26 + 4);
    *((_QWORD *)v26 + 4) = v48;

    v55 = objc_msgSend_copy(v19, v50, v51, v52, v53, v54);
    v56 = (void *)*((_QWORD *)v26 + 6);
    *((_QWORD *)v26 + 6) = v55;

    v62 = objc_msgSend_copy(v20, v57, v58, v59, v60, v61);
    v63 = (void *)*((_QWORD *)v26 + 7);
    *((_QWORD *)v26 + 7) = v62;

    *(_OWORD *)(v26 + 184) = 0u;
    *(_OWORD *)(v26 + 168) = 0u;
    *(_OWORD *)(v26 + 152) = 0u;
    *(_OWORD *)(v26 + 136) = 0u;
    *(_OWORD *)(v26 + 120) = 0u;
    *(_OWORD *)(v26 + 104) = 0u;
    *(_OWORD *)(v26 + 88) = 0u;
    *(_OWORD *)(v26 + 72) = 0u;
    v69 = objc_msgSend_count(*((void **)v26 + 3), v64, v65, v66, v67, v68);
    if (v69 != objc_msgSend_count(*((void **)v26 + 4), v70, v71, v72, v73, v74))
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v75 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
      {
        v81 = objc_msgSend_count(*((void **)v26 + 3), v76, v77, v78, v79, v80);
        v87 = objc_msgSend_count(*((void **)v26 + 4), v82, v83, v84, v85, v86);
        *(_DWORD *)buf = 134218240;
        v91 = v81;
        v92 = 2048;
        v93 = v87;
        _os_log_impl(&dword_1BE607000, v75, OS_LOG_TYPE_FAULT, "Expected an equal number of segments (%lu) and segmentStrokeIndexes (%lu)", buf, 0x16u);
      }

    }
    *((_QWORD *)v26 + 5) = a9;
  }

  return (CHSynthesisResult *)v26;
}

- (CHSynthesisResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  CHSynthesisResult *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  _OWORD v52[8];
  _BYTE __dst[128];
  uint64_t v54;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("content"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, (uint64_t)CFSTR("drawing"), v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v16, v15, (uint64_t)CFSTR("segmentContents"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_opt_class();
  objc_msgSend_decodeArrayOfObjectsOfClass_forKey_(v4, v21, v20, (uint64_t)CFSTR("segmentStrokeIndexes"), v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, (uint64_t)CFSTR("inventoryDebuggingStyleDrawing"), v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, (uint64_t)CFSTR("inventoryDebuggingStyleContent"), v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_decodeIntegerForKey_(v4, v35, (uint64_t)CFSTR("numberOfNotSynthesizedCharacters"), v36, v37, v38);
  v41 = (CHSynthesisResult *)objc_msgSend_initWithContent_drawing_segmentContents_segmentStrokeIndexes_inventoryDebuggingStyleDrawing_inventoryDebuggingStyleContent_numberOfNotSynthesizedCharacters_(self, v40, (uint64_t)v9, (uint64_t)v14, (uint64_t)v19, (uint64_t)v24, v29, v34, v39);
  v54 = 0;
  v42 = objc_retainAutorelease(v4);
  v46 = (const void *)objc_msgSend_decodeBytesForKey_returnedLength_(v42, v43, (uint64_t)CFSTR("principalLines"), (uint64_t)&v54, v44, v45);
  if (v46 && v54 == 128)
  {
    v50 = __dst;
    memmove(__dst, v46, 0x80uLL);
  }
  else
  {
    v50 = v52;
    memset(v52, 0, sizeof(v52));
  }
  objc_msgSend_setPrincipalLines_(v41, (const char *)v46, (uint64_t)v50, v47, v48, v49);

  return v41;
}

- (void)applyDesiredDistanceBetweenDigitCenters:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double Height;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  unint64_t v24;
  double v25;
  double MidX;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double MaxX;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double MinX;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  double v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  CHDrawing *v97;
  CHDrawing *drawing;
  unint64_t v99;
  uint64_t v100;
  CHDrawing *v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  objc_msgSend_bounds(self->_drawing, a2, v3, v4, v5, v6);
  Height = CGRectGetHeight(v102);
  v101 = objc_alloc_init(CHDrawing);
  v20 = objc_msgSend_count(self->_segmentContents, v10, v11, v12, v13, v14);
  if (v20 >= 1)
  {
    v21 = 0;
    v22 = Height * 0.05;
    v23 = a3 * 0.5;
    v24 = 0x8000000000000000;
    v25 = 0.0;
    v99 = 0x8000000000000000;
    MidX = 0.0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_segmentStrokeIndexes, v15, v21, v17, v18, v19, v99);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_drawingWithStrokesFromIndexSet_(self->_drawing, v28, (uint64_t)v27, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(self->_segmentContents, v33, v21, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bounds(v101, v38, v39, v40, v41, v42);
      MaxX = CGRectGetMaxX(v103);
      objc_msgSend_bounds(v32, v44, v45, v46, v47, v48);
      MinX = CGRectGetMinX(v104);
      objc_msgSend_ch_mathDigitsCharSet(MEMORY[0x1E0CB3500], v50, v51, v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v37, v56, (uint64_t)v55, 1, v57, v58);
      v60 = v25 + MinX;

      if (!v59)
      {
        objc_msgSend_ch_mathDecimalSeparatorCharSet(MEMORY[0x1E0CB3500], v61, v62, v63, v64, v65);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v37, v69, (uint64_t)v68, 1, v70, v71);

        if (!v72)
          goto LABEL_11;
        if (v21 - 1 != v24)
          goto LABEL_11;
        v62 = v21 + 1;
        if (v21 + 1 >= v20)
          goto LABEL_11;
        objc_msgSend_objectAtIndexedSubscript_(self->_segmentContents, v61, v62, v63, v64, v65);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ch_mathDigitsCharSet(MEMORY[0x1E0CB3500], v74, v75, v76, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend_ch_occurrencesOfCharactersInSet_maxCount_(v73, v80, (uint64_t)v79, 1, v81, v82);

        if (v83)
        {
          objc_msgSend_bounds(v32, v61, v62, v63, v64, v65);
          v85 = MaxX + fmax(v23 + MidX - MaxX + v84 * -0.5, v22);
          v100 = v21;
        }
        else
        {
LABEL_11:
          v85 = v60;
        }
        goto LABEL_17;
      }
      if (v21 - 1 == v24)
      {
        objc_msgSend_bounds(v32, v61, v62, v63, v64, v65);
        v67 = fmax(MidX + a3 - MaxX + v66 * -0.5, 0.0);
      }
      else
      {
        if (v21 - 2 != v24 || v21 - 1 != v100)
        {
          v85 = v60;
          v24 = v21;
          goto LABEL_17;
        }
        objc_msgSend_bounds(v32, v61, v62, v63, v64, v65);
        v67 = fmax(v23 + MidX - MaxX + v86 * -0.5, v22);
      }
      v85 = MaxX + v67;
      v24 = v21;
LABEL_17:
      v25 = v25 + v85 - v60;
      objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v32, v61, v62, v63, v64, v65, v25, 0.0, 1.0, v100);
      v87 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_bounds(v87, v88, v89, v90, v91, v92);
      MidX = CGRectGetMidX(v105);
      objc_msgSend_appendDrawing_(v101, v93, (uint64_t)v87, v94, v95, v96);

      ++v21;
    }
    while (v20 != v21);
  }
  v97 = (CHDrawing *)objc_msgSend_copy(v101, v15, v16, v17, v18, v19);
  drawing = self->_drawing;
  self->_drawing = v97;

}

- (void)scaleDrawingWithWidth:(double)a3 height:(double)a4 desiredDistanceBetweenDigitCenters:(double)a5
{
  CHDrawing *drawing;
  CHDrawing *v10;
  double x;
  double y;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  CHDrawing *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  CHDrawing *v84;
  CHDrawing *v85;
  double v86;
  double v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  CHDrawing *v99;
  CHDrawing *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  double v106;
  double v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  double v114;
  double v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  double v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  CHDrawing *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  double v153;
  double v154;
  unint64_t v155;
  double v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  double v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  double v189;
  double v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  double v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  CHDrawing *v202;
  CHDrawing *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  double v209;
  double v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  double v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  CGPoint v222;
  CGPoint v223;
  CGPoint v224;
  CGPoint v225;
  NSObject *v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  $52684A533F9881AC3B923BCCCF5A9B81 base;
  double v233;
  double v234;
  $52684A533F9881AC3B923BCCCF5A9B81 median;
  double v236;
  double v237;
  double v238;
  $52684A533F9881AC3B923BCCCF5A9B81 top;
  double v240;
  double v241;
  double v242;
  double v243[4];
  $52684A533F9881AC3B923BCCCF5A9B81 v244;
  $52684A533F9881AC3B923BCCCF5A9B81 v245;
  $52684A533F9881AC3B923BCCCF5A9B81 v246;
  uint8_t buf[16];
  CGPoint v248;
  CGPoint v249;
  CGPoint v250;
  CGPoint v251;
  CGPoint v252;
  CGPoint v253;
  CGPoint v254;
  uint64_t v255;

  v255 = *MEMORY[0x1E0C80C00];
  drawing = self->_drawing;
  if (drawing)
  {
    v10 = drawing;
    x = self->_principalLines.descender.start.x;
    y = self->_principalLines.descender.start.y;
    v13 = self->_principalLines.descender.end.x;
    v230 = self->_principalLines.descender.end.y;
    base = self->_principalLines.base;
    median = self->_principalLines.median;
    top = self->_principalLines.top;
    objc_msgSend_bounds(v10, v14, v15, v16, v17, v18);
    v20 = v19;
    objc_msgSend_bounds(v10, v21, v22, v23, v24, v25);
    if (v20 < 0.001 || v31 < 0.001 || a3 < 0.001 && a4 < 0.001)
      goto LABEL_33;
    v32 = a3 / v20;
    v33 = a4 / v31;
    if (a3 < 0.001 || a4 < 0.001)
    {
      if (a3 < 0.001)
      {
        if (a4 >= 0.001)
        {
          objc_msgSend_bounds(v10, v26, v27, v28, v29, v30);
          v190 = v189;
          objc_msgSend_bounds(v10, v191, v192, v193, v194, v195);
          objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v10, v197, v198, v199, v200, v201, -v190, -v196, v33);
          v202 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
          v203 = self->_drawing;
          self->_drawing = v202;

          v243[0] = x;
          v243[1] = y;
          v243[2] = v13;
          v243[3] = v230;
          v244 = base;
          v245 = median;
          v246 = top;
          objc_msgSend_bounds(v10, v204, v205, v206, v207, v208);
          v210 = v209;
          objc_msgSend_bounds(v10, v211, v212, v213, v214, v215);
          sub_1BE8019C8((double *)buf, v243, v210, v216, 1.0 / v33, 1.0 / v33);
          v222 = v252;
          self->_principalLines.median.start = v251;
          self->_principalLines.median.end = v222;
          v223 = v254;
          self->_principalLines.top.start = v253;
          self->_principalLines.top.end = v223;
          v224 = v248;
          self->_principalLines.descender.start = *(CGPoint *)buf;
          self->_principalLines.descender.end = v224;
          v225 = v250;
          self->_principalLines.base.start = v249;
          self->_principalLines.base.end = v225;
          if (a5 > 0.0)
            objc_msgSend_applyDesiredDistanceBetweenDigitCenters_(self, v217, v218, v219, v220, v221, a5);
        }
      }
      else
      {
        objc_msgSend_bounds(v10, v26, v27, v28, v29, v30);
        v87 = v86;
        objc_msgSend_bounds(v10, v88, v89, v90, v91, v92);
        objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v10, v94, v95, v96, v97, v98, -v87, -v93, v32);
        v99 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
        v100 = self->_drawing;
        self->_drawing = v99;

        objc_msgSend_bounds(v10, v101, v102, v103, v104, v105);
        v107 = v106;
        objc_msgSend_bounds(v10, v108, v109, v110, v111, v112);
        v114 = 1.0;
        if (1.0 / v32 != 0.0)
          v114 = 1.0 / v32;
        self->_principalLines.descender.start.x = (x - v107) / v114;
        self->_principalLines.descender.start.y = (y - v113) / v114;
        self->_principalLines.descender.end.x = (v13 - v107) / v114;
        self->_principalLines.descender.end.y = (v230 - v113) / v114;
        self->_principalLines.base.start.x = (base.start.x - v107) / v114;
        self->_principalLines.base.start.y = (base.start.y - v113) / v114;
        self->_principalLines.base.end.x = (base.end.x - v107) / v114;
        self->_principalLines.base.end.y = (base.end.y - v113) / v114;
        self->_principalLines.median.start.x = (median.start.x - v107) / v114;
        self->_principalLines.median.start.y = (median.start.y - v113) / v114;
        self->_principalLines.median.end.x = (median.end.x - v107) / v114;
        self->_principalLines.median.end.y = (median.end.y - v113) / v114;
        self->_principalLines.top.start.x = (top.start.x - v107) / v114;
        self->_principalLines.top.start.y = (top.start.y - v113) / v114;
        self->_principalLines.top.end.x = (top.end.x - v107) / v114;
        self->_principalLines.top.end.y = (top.end.y - v113) / v114;
      }
      goto LABEL_33;
    }
    if (v33 <= v32)
    {
      objc_msgSend_bounds(v10, v26, v27, v28, v29, v30);
      v229 = v115;
      objc_msgSend_bounds(v10, v116, v117, v118, v119, v120);
      v127 = v126;
      if (1.0 / v33 == 0.0)
        v128 = 1.0;
      else
        v128 = 1.0 / v33;
      objc_msgSend_bounds(v10, v121, v122, v123, v124, v125);
      v130 = v129;
      objc_msgSend_bounds(v10, v131, v132, v133, v134, v135);
      objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v10, v137, v138, v139, v140, v141, -v130, -v136, v33);
      v142 = (CHDrawing *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_bounds(v142, v143, v144, v145, v146, v147);
      v154 = a3 - v153;
      if (a3 - v153 < 0.0)
      {
        CHOSLogForCategory(9);
        v226 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v226, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v154;
          _os_log_impl(&dword_1BE607000, v226, OS_LOG_TYPE_ERROR, "Synthesizer: Error in scaleDrawingFromResult: needToAddSpaces=%f < 0", buf, 0xCu);
        }

        v10 = v142;
        goto LABEL_33;
      }
      v155 = objc_msgSend_count(self->_segmentContents, v148, v149, v150, v151, v152);
      v227 = (x - v229) / v128;
      v156 = (y - v127) / v128;
      v75 = (v13 - v229) / v128;
      v76 = (v230 - v127) / v128;
      v77 = (base.start.x - v229) / v128;
      v78 = (base.start.y - v127) / v128;
      v65 = (base.end.x - v229) / v128;
      v66 = (base.end.y - v127) / v128;
      v79 = (median.start.x - v229) / v128;
      v67 = (median.start.y - v127) / v128;
      v80 = (median.end.x - v229) / v128;
      v81 = (median.end.y - v127) / v128;
      v82 = (top.start.x - v229) / v128;
      v83 = (top.start.y - v127) / v128;
      v242 = (top.end.x - v229) / v128;
      v69 = (top.end.y - v127) / v128;
      if (v155 < 2)
      {
        v10 = v142;
        v63 = v227;
        v64 = v156;
        v68 = v242;
        goto LABEL_14;
      }
      v240 = (top.start.x - v229) / v128;
      v241 = (top.start.y - v127) / v128;
      v237 = (median.end.x - v229) / v128;
      v238 = (median.end.y - v127) / v128;
      v236 = (median.start.x - v229) / v128;
      v233 = (base.start.x - v229) / v128;
      v234 = (base.start.y - v127) / v128;
      v228 = v75;
      v231 = (v230 - v127) / v128;
      v62 = objc_alloc_init(CHDrawing);
      v162 = 0;
      v163 = 0.0;
      v64 = v156;
      while (v162 < objc_msgSend_count(self->_segmentContents, v157, v158, v159, v160, v161))
      {
        objc_msgSend_objectAtIndexedSubscript_(self->_segmentStrokeIndexes, v164, v162, v165, v166, v167);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_drawingWithStrokesFromIndexSet_(v142, v169, (uint64_t)v168, v170, v171, v172);
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v173, v174, v175, v176, v177, v178, v163, 0.0, 1.0);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendDrawing_(v62, v180, (uint64_t)v179, v181, v182, v183);

        v163 = v163
             + v154
             / (double)(unint64_t)(objc_msgSend_count(self->_segmentContents, v184, v185, v186, v187, v188) - 1);

        ++v162;
      }
      v10 = v142;
      v63 = v227;
      v68 = v242;
    }
    else
    {
      objc_msgSend_bounds(v10, v26, v27, v28, v29, v30);
      v35 = v34;
      objc_msgSend_bounds(v10, v36, v37, v38, v39, v40);
      v47 = v46;
      if (1.0 / v32 == 0.0)
        v48 = 1.0;
      else
        v48 = 1.0 / v32;
      objc_msgSend_bounds(v10, v41, v42, v43, v44, v45);
      v50 = v49;
      objc_msgSend_bounds(v10, v51, v52, v53, v54, v55);
      objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(v10, v57, v58, v59, v60, v61, -v50, -v56, v32);
      v62 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
      v63 = (x - v35) / v48;
      v64 = (y - v47) / v48;
      v228 = (v13 - v35) / v48;
      v231 = (v230 - v47) / v48;
      v233 = (base.start.x - v35) / v48;
      v234 = (base.start.y - v47) / v48;
      v65 = (base.end.x - v35) / v48;
      v66 = (base.end.y - v47) / v48;
      v236 = (median.start.x - v35) / v48;
      v67 = (median.start.y - v47) / v48;
      v237 = (median.end.x - v35) / v48;
      v238 = (median.end.y - v47) / v48;
      v240 = (top.start.x - v35) / v48;
      v241 = (top.start.y - v47) / v48;
      v68 = (top.end.x - v35) / v48;
      v69 = (top.end.y - v47) / v48;
    }

    v10 = v62;
    v75 = v228;
    v76 = v231;
    v77 = v233;
    v78 = v234;
    v79 = v236;
    v80 = v237;
    v81 = v238;
    v82 = v240;
    v83 = v241;
LABEL_14:
    self->_principalLines.descender.start.x = v63;
    self->_principalLines.descender.start.y = v64;
    self->_principalLines.descender.end.x = v75;
    self->_principalLines.descender.end.y = v76;
    self->_principalLines.base.start.x = v77;
    self->_principalLines.base.start.y = v78;
    self->_principalLines.base.end.x = v65;
    self->_principalLines.base.end.y = v66;
    self->_principalLines.median.start.x = v79;
    self->_principalLines.median.start.y = v67;
    self->_principalLines.median.end.x = v80;
    self->_principalLines.median.end.y = v81;
    self->_principalLines.top.start.x = v82;
    self->_principalLines.top.start.y = v83;
    self->_principalLines.top.end.x = v68;
    self->_principalLines.top.end.y = v69;
    v84 = (CHDrawing *)objc_msgSend_copy(v10, v70, v71, v72, v73, v74);
    v85 = self->_drawing;
    self->_drawing = v84;

LABEL_33:
  }
}

- (void)resampleDrawing
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CHDrawing *drawing;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  float v20;
  float v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CHDrawing *v27;
  CHDrawing *v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  _DWORD v36[2];
  __int16 v37;
  double v38;
  __int16 v39;
  int v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  drawing = self->_drawing;
  if (drawing)
  {
    if (objc_msgSend_strokeCount(drawing, a2, v2, v3, v4, v5))
    {
      v13 = objc_msgSend_pointCount(self->_drawing, v8, v9, v10, v11, v12);
      if (v13 >= 2)
      {
        v19 = v13;
        objc_msgSend_cumulativePointToPointDistance(self->_drawing, v14, v15, v16, v17, v18);
        v21 = v20 / (float)(v19 - 1);
        objc_msgSend_drawingResampledWithCatmullRomSplineInterpolation_(self->_drawing, v22, v23, v24, v25, v26, (float)(v21 / 5.0));
        v27 = (CHDrawing *)objc_claimAutoreleasedReturnValue();
        v28 = self->_drawing;
        self->_drawing = v27;

        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v29 = (id)qword_1EF568E60;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v35 = objc_msgSend_pointCount(self->_drawing, v30, v31, v32, v33, v34);
          v36[0] = 67109888;
          v36[1] = v19;
          v37 = 2048;
          v38 = v21;
          v39 = 1024;
          v40 = v35;
          v41 = 2048;
          v42 = (float)(v21 / 5.0);
          _os_log_impl(&dword_1BE607000, v29, OS_LOG_TYPE_DEFAULT, "Synthesizer: resample drawing with %d points and %f average distance to %d points with sampling rate %f", (uint8_t *)v36, 0x22u);
        }

      }
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;

  v40 = a3;
  objc_msgSend_encodeObject_forKey_(v40, v4, (uint64_t)self->_content, (uint64_t)CFSTR("content"), v5, v6);
  objc_msgSend_encodeObject_forKey_(v40, v7, (uint64_t)self->_drawing, (uint64_t)CFSTR("drawing"), v8, v9);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v10, (uint64_t)&self->_principalLines, 128, v11, v12);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v19 = objc_msgSend_bytes(v13, v14, v15, v16, v17, v18);
  v25 = objc_msgSend_length(v13, v20, v21, v22, v23, v24);
  objc_msgSend_encodeBytes_length_forKey_(v40, v26, v19, v25, (uint64_t)CFSTR("principalLines"), v27);
  objc_msgSend_encodeObject_forKey_(v40, v28, (uint64_t)self->_segmentContents, (uint64_t)CFSTR("segmentContents"), v29, v30);
  objc_msgSend_encodeObject_forKey_(v40, v31, (uint64_t)self->_segmentStrokeIndexes, (uint64_t)CFSTR("segmentStrokeIndexes"), v32, v33);
  if (os_variant_has_internal_diagnostics())
  {
    objc_msgSend_encodeObject_forKey_(v40, v34, (uint64_t)self->_inventoryDebuggingStyleDrawing, (uint64_t)CFSTR("inventoryDebuggingStyleDrawing"), v35, v36);
    objc_msgSend_encodeObject_forKey_(v40, v37, (uint64_t)self->_inventoryDebuggingStyleContent, (uint64_t)CFSTR("inventoryDebuggingStyleContent"), v38, v39);
  }
  objc_msgSend_encodeInteger_forKey_(v40, v34, self->_numberOfNotSynthesizedCharacters, (uint64_t)CFSTR("numberOfNotSynthesizedCharacters"), v35, v36);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHDrawing)drawing
{
  return (CHDrawing *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)content
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)segmentContents
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)segmentStrokeIndexes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)numberOfNotSynthesizedCharacters
{
  return self->_numberOfNotSynthesizedCharacters;
}

- (void)setNumberOfNotSynthesizedCharacters:(unint64_t)a3
{
  self->_numberOfNotSynthesizedCharacters = a3;
}

- (CHDrawing)inventoryDebuggingStyleDrawing
{
  return self->_inventoryDebuggingStyleDrawing;
}

- (NSString)inventoryDebuggingStyleContent
{
  return self->_inventoryDebuggingStyleContent;
}

- ($6DEFAE59D8B0B490C28D581BBA01C329)principalLines
{
  CGPoint v3;
  CGPoint v4;
  CGPoint v5;
  CGPoint v6;

  v3 = *(CGPoint *)&self[1].var0.var1.y;
  retstr->var2.var0 = *(CGPoint *)&self[1].var0.var0.y;
  retstr->var2.var1 = v3;
  v4 = *(CGPoint *)&self[1].var1.var1.y;
  retstr->var3.var0 = *(CGPoint *)&self[1].var1.var0.y;
  retstr->var3.var1 = v4;
  v5 = *(CGPoint *)&self->var2.var1.y;
  retstr->var0.var0 = *(CGPoint *)&self->var2.var0.y;
  retstr->var0.var1 = v5;
  v6 = *(CGPoint *)&self->var3.var1.y;
  retstr->var1.var0 = *(CGPoint *)&self->var3.var0.y;
  retstr->var1.var1 = v6;
  return self;
}

- (void)setPrincipalLines:(id *)a3
{
  CGPoint var0;
  CGPoint var1;
  CGPoint v5;
  CGPoint v6;
  CGPoint v7;
  CGPoint v8;

  var0 = a3->var0.var0;
  var1 = a3->var0.var1;
  v5 = a3->var1.var0;
  self->_principalLines.base.end = a3->var1.var1;
  self->_principalLines.base.start = v5;
  self->_principalLines.descender.end = var1;
  self->_principalLines.descender.start = var0;
  v6 = a3->var2.var0;
  v7 = a3->var2.var1;
  v8 = a3->var3.var0;
  self->_principalLines.top.end = a3->var3.var1;
  self->_principalLines.top.start = v8;
  self->_principalLines.median.end = v7;
  self->_principalLines.median.start = v6;
}

- (NSArray)contractViolations
{
  return self->_contractViolations;
}

- (void)setContractViolations:(id)a3
{
  objc_storeStrong((id *)&self->_contractViolations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contractViolations, 0);
  objc_storeStrong((id *)&self->_inventoryDebuggingStyleContent, 0);
  objc_storeStrong((id *)&self->_inventoryDebuggingStyleDrawing, 0);
  objc_storeStrong((id *)&self->_segmentStrokeIndexes, 0);
  objc_storeStrong((id *)&self->_segmentContents, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
}

@end
