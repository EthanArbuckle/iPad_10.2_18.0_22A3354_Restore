@implementation CHNonTextCandidateStroke

- (CHNonTextCandidateStroke)initWithStroke:(id)a3 consistingOfSubstrokes:(id)a4 classificationAsNonText:(int64_t)a5 lineOrientation:(double)a6 lineError:(double)a7 containerScore:(double)a8 fallbackClassification:(int64_t)a9
{
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  CGFloat width;
  CGFloat height;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const void *v72;
  int64_t v73;
  char *v74;
  char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t i;
  char *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _OWORD *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  char *v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  double v138;
  double v139;
  double v140;
  double v141;
  CHNonTextCandidateStroke *v142;
  CGFloat y;
  CGFloat x;
  void *__p;
  char *v152;
  char *v153;
  CGRect v154;
  CGRect v155;

  v11 = a3;
  v12 = a4;
  objc_msgSend_bounds(v11, v13, v14, v15, v16, v17);
  v19 = v18;
  objc_msgSend_bounds(v11, v20, v21, v22, v23, v24);
  v26 = v25;
  objc_msgSend_bounds(v11, v27, v28, v29, v30, v31);
  v33 = v32;
  objc_msgSend_bounds(v11, v34, v35, v36, v37, v38);
  v40 = v39;
  objc_msgSend_bounds(v11, v41, v42, v43, v44, v45);
  v46 = sqrt(v33 * v40 + v19 * v26);
  v155 = CGRectInset(v154, v46 * -0.5, v46 * -0.5);
  y = v155.origin.y;
  x = v155.origin.x;
  width = v155.size.width;
  height = v155.size.height;
  objc_msgSend_bounds(v11, v49, v50, v51, v52, v53);
  if (a5 == 6)
  {
    objc_msgSend_firstObject(v12, v54, v55, v56, v57, v58);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v11;
    v70 = objc_msgSend_convexHull(v63, v65, v66, v67, v68, v69);
    __p = 0;
    v152 = 0;
    v153 = 0;
    v72 = *(const void **)v70;
    v71 = *(_QWORD *)(v70 + 8);
    v73 = v71 - *(_QWORD *)v70;
    if (v71 != *(_QWORD *)v70)
    {
      if (v73 < 0)
        sub_1BE61F930();
      v74 = (char *)operator new(v71 - *(_QWORD *)v70);
      v75 = &v74[16 * (v73 >> 4)];
      __p = v74;
      v153 = v75;
      memcpy(v74, v72, v73);
      v152 = v75;
    }

    v81 = 1;
LABEL_7:
    if (v81 < objc_msgSend_count(v12, v76, v77, v78, v79, v80))
    {
      for (i = 0; ; ++i)
      {
        objc_msgSend_objectAtIndexedSubscript_(v12, v82, v81, v83, v84, v85);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = (_QWORD *)objc_msgSend_convexHull(v88, v89, v90, v91, v92, v93);
        v95 = v94[1] - *v94;

        if (i >= v95 >> 4)
        {
          ++v81;
          goto LABEL_7;
        }
        objc_msgSend_objectAtIndexedSubscript_(v12, v76, v81, v78, v79, v80);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = (_OWORD *)(*(_QWORD *)objc_msgSend_convexHull(v96, v97, v98, v99, v100, v101) + 16 * i);
        v103 = v152;
        if (v152 < v153)
        {
          *(_OWORD *)v152 = *v102;
          v87 = v103 + 16;
          v11 = v64;
          goto LABEL_10;
        }
        v104 = (char *)__p;
        v105 = (v152 - (_BYTE *)__p) >> 4;
        v106 = v105 + 1;
        if ((unint64_t)(v105 + 1) >> 60)
          sub_1BE61F930();
        v107 = v153 - (_BYTE *)__p;
        if ((v153 - (_BYTE *)__p) >> 3 > v106)
          v106 = v107 >> 3;
        if ((unint64_t)v107 >= 0x7FFFFFFFFFFFFFF0)
          v108 = 0xFFFFFFFFFFFFFFFLL;
        else
          v108 = v106;
        if (v108)
        {
          if (v108 >> 60)
            sub_1BE61F100();
          v109 = (char *)operator new(16 * v108);
          v110 = &v109[16 * v105];
          *(_OWORD *)v110 = *v102;
          v111 = v110;
          if (v103 == v104)
          {
LABEL_27:
            v87 = v110 + 16;
            __p = v111;
            v153 = &v109[16 * v108];
            v11 = v64;
            if (!v103)
              goto LABEL_10;
LABEL_28:
            operator delete(v103);
            goto LABEL_10;
          }
        }
        else
        {
          v109 = 0;
          v110 = (char *)(16 * v105);
          *(_OWORD *)(16 * v105) = *v102;
          v111 = (char *)(16 * v105);
          if (v103 == v104)
            goto LABEL_27;
        }
        do
        {
          *((_OWORD *)v111 - 1) = *((_OWORD *)v103 - 1);
          v111 -= 16;
          v103 -= 16;
        }
        while (v103 != v104);
        v103 = v104;
        v87 = v110 + 16;
        __p = v111;
        v153 = &v109[16 * v108];
        v11 = v64;
        if (v103)
          goto LABEL_28;
LABEL_10:
        v152 = v87;

      }
    }
    v116 = (void *)objc_opt_class();
    objc_msgSend_boundingBoxOfPoints_rotatedAroundPoint_byAngle_(v116, v117, (uint64_t)&__p, v118, v119, v120, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), -a6);
    v112 = v121;
    v113 = v122;
    v114 = v123;
    v115 = v124;
    if (__p)
    {
      v152 = (char *)__p;
      operator delete(__p);
    }
  }
  else
  {
    v112 = v59;
    v113 = v60;
    v114 = v61;
    v115 = v62;
  }
  objc_msgSend_encodedStrokeIdentifier(v11, v54, v55, v56, v57, v58);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = objc_msgSend_count(v12, v126, v127, v128, v129, v130);
  objc_msgSend_bounds(v11, v132, v133, v134, v135, v136);
  v142 = (CHNonTextCandidateStroke *)objc_msgSend_initWithStrokeIdentifier_substrokesCount_classificationAsNonText_lineOrientation_lineError_containerScore_fallbackClassification_bounds_boundsDiagonal_enlargedBounds_rotatedBounds_supportByStrokeIdentifier_sizeRatioByStrokeIdentifier_support_(self, v137, (uint64_t)v125, v131, a5, a9, 0, 0, a6, a7, a8, v138, v139, v140, v141, v46, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width,
                                       *(_QWORD *)&height,
                                       v112,
                                       v113,
                                       v114,
                                       v115,
                                       0);

  return v142;
}

- (id)initWithStrokeIdentifier:(double)a3 substrokesCount:(double)a4 classificationAsNonText:(double)a5 lineOrientation:(double)a6 lineError:(double)a7 containerScore:(double)a8 fallbackClassification:(double)a9 bounds:(uint64_t)a10 boundsDiagonal:(void *)a11 enlargedBounds:(void *)a12 rotatedBounds:(void *)a13 supportByStrokeIdentifier:(void *)a14 sizeRatioByStrokeIdentifier:(void *)a15 support:(void *)a16
{
  id v40;
  id v41;
  id v42;
  id *v43;
  id *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  objc_super v60;

  v40 = a11;
  v41 = a15;
  v42 = a16;
  v60.receiver = a1;
  v60.super_class = (Class)CHNonTextCandidateStroke;
  v43 = (id *)objc_msgSendSuper2(&v60, sel_init);
  v44 = v43;
  if (v43)
  {
    objc_storeStrong(v43 + 5, a11);
    v44[6] = a13;
    v44[7] = a12;
    v44[4] = a14;
    *((double *)v44 + 8) = a3;
    *((double *)v44 + 9) = a4;
    *((double *)v44 + 12) = a5;
    *((double *)v44 + 13) = a6;
    *((double *)v44 + 14) = a7;
    *((double *)v44 + 15) = a8;
    *((double *)v44 + 10) = a2;
    *((double *)v44 + 11) = a9;
    v44[16] = a17;
    v44[17] = a18;
    v44[18] = a19;
    v44[19] = a20;
    v44[20] = a21;
    v44[21] = a22;
    v44[22] = a23;
    v44[23] = a24;
    if (v41)
      v50 = (id)objc_msgSend_mutableCopy(v41, v45, v46, v47, v48, v49);
    else
      v50 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v51 = v44[1];
    v44[1] = v50;

    if (v42)
      v57 = (id)objc_msgSend_mutableCopy(v42, v52, v53, v54, v55, v56);
    else
      v57 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v58 = v44[2];
    v44[2] = v57;

    v44[3] = a25;
  }

  return v44;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;

  v7 = (void *)objc_msgSend_allocWithZone_(CHNonTextCandidateStroke, a2, (uint64_t)a3, v3, v4, v5);
  return (id)objc_msgSend_initWithStrokeIdentifier_substrokesCount_classificationAsNonText_lineOrientation_lineError_containerScore_fallbackClassification_bounds_boundsDiagonal_enlargedBounds_rotatedBounds_supportByStrokeIdentifier_sizeRatioByStrokeIdentifier_support_(v7, v8, (uint64_t)self->_strokeIdentifier, self->_substrokesCount, self->_classificationAsNonText, self->_fallbackClassification, self->_supportByStrokeIdentifier, self->_sizeRatioByStrokeIdentifier, self->_lineOrientationAngle, self->_lineError, self->_containerScore, self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height, self->_boundsDiagonal, *(_QWORD *)&self->_enlargedBounds.origin.x, *(_QWORD *)&self->_enlargedBounds.origin.y, *(_QWORD *)&self->_enlargedBounds.size.width,
               *(_QWORD *)&self->_enlargedBounds.size.height,
               *(_QWORD *)&self->_rotatedBounds.origin.x,
               *(_QWORD *)&self->_rotatedBounds.origin.y,
               *(_QWORD *)&self->_rotatedBounds.size.width,
               *(_QWORD *)&self->_rotatedBounds.size.height,
               *(_QWORD *)&self->_support);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;

  v7 = (void *)objc_msgSend_allocWithZone_(CHMutableNonTextCandidateStroke, a2, (uint64_t)a3, v3, v4, v5);
  return (id)objc_msgSend_initWithStrokeIdentifier_substrokesCount_classificationAsNonText_lineOrientation_lineError_containerScore_fallbackClassification_bounds_boundsDiagonal_enlargedBounds_rotatedBounds_supportByStrokeIdentifier_sizeRatioByStrokeIdentifier_support_(v7, v8, (uint64_t)self->_strokeIdentifier, self->_substrokesCount, self->_classificationAsNonText, self->_fallbackClassification, self->_supportByStrokeIdentifier, self->_sizeRatioByStrokeIdentifier, self->_lineOrientationAngle, self->_lineError, self->_containerScore, self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height, self->_boundsDiagonal, *(_QWORD *)&self->_enlargedBounds.origin.x, *(_QWORD *)&self->_enlargedBounds.origin.y, *(_QWORD *)&self->_enlargedBounds.size.width,
               *(_QWORD *)&self->_enlargedBounds.size.height,
               *(_QWORD *)&self->_rotatedBounds.origin.x,
               *(_QWORD *)&self->_rotatedBounds.origin.y,
               *(_QWORD *)&self->_rotatedBounds.size.width,
               *(_QWORD *)&self->_rotatedBounds.size.height,
               *(_QWORD *)&self->_support);
}

- (int64_t)effectiveClassification
{
  int64_t result;
  double v4;

  result = self->_classificationAsNonText;
  v4 = 0.22;
  if (result == 6)
    v4 = 0.7;
  if (self->_support < v4)
    return self->_fallbackClassification;
  return result;
}

- (NSArray)supportingStrokeIdentifiers
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  return (NSArray *)objc_msgSend_allKeys(self->_supportByStrokeIdentifier, a2, v2, v3, v4, v5);
}

- (BOOL)isVerticalMathHorizontalLine
{
  return self->_lineError < 0.2 && fabs(self->_lineOrientationAngle) < 0.196349541;
}

- (BOOL)isLongHorizontalNonTextLine
{
  if (self)
    LOBYTE(self) = self->_classificationAsNonText == 6
                && fabs(self->_lineOrientationAngle) <= 0.785398163
                && self->_boundsDiagonal > 105.0;
  return (char)self;
}

- (BOOL)isHorizontalAlignedWithStroke:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double MinX;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double MaxX;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGRect v26;
  CGRect v27;

  v4 = a3;
  objc_msgSend_bounds(v4, v5, v6, v7, v8, v9);
  MinX = CGRectGetMinX(v26);
  if (self)
  {
    x = self->_bounds.origin.x;
    y = self->_bounds.origin.y;
    width = self->_bounds.size.width;
    height = self->_bounds.size.height;
  }
  else
  {
    y = 0.0;
    width = 0.0;
    height = 0.0;
    x = 0.0;
  }
  if (MinX < CGRectGetMinX(*(CGRect *)&x))
    goto LABEL_7;
  objc_msgSend_bounds(v4, v15, v16, v17, v18, v19);
  MaxX = CGRectGetMaxX(v27);
  if (self)
  {
    v21 = self->_bounds.origin.x;
    v22 = self->_bounds.origin.y;
    v23 = self->_bounds.size.width;
    v24 = self->_bounds.size.height;
  }
  else
  {
    v22 = 0.0;
    v23 = 0.0;
    v24 = 0.0;
    v21 = 0.0;
  }
  if (MaxX <= CGRectGetMaxX(*(CGRect *)&v21))
  {

    return 1;
  }
  else
  {
LABEL_7:

    return 0;
  }
}

- (double)supportFromStrokes:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BE6A7728;
  v8[3] = &unk_1E77F2E80;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend_enumerateObjectsUsingBlock_(a3, a2, (uint64_t)v8, v3, v4, v5);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (double)sizeRatioFromStrokes:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  _QWORD v22[6];
  uint64_t v23;
  double *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v23 = 0;
  v24 = (double *)&v23;
  v25 = 0x2020000000;
  v26 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1BE6A78A0;
  v22[3] = &unk_1E77F2E80;
  v22[4] = self;
  v22[5] = &v23;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v5, (uint64_t)v22, v6, v7, v8);
  v14 = objc_msgSend_count(v4, v9, v10, v11, v12, v13);
  v20 = v24[3];
  if (v14)
    v20 = v20 / (double)(unint64_t)objc_msgSend_count(v4, v15, v16, v17, v18, v19);
  _Block_object_dispose(&v23, 8);

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
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
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;

  v86 = a3;
  objc_msgSend_strokeIdentifier(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v86, v10, (uint64_t)v9, (uint64_t)CFSTR("strokeIdentifier"), v11, v12);

  if (self)
    objc_msgSend_encodeInteger_forKey_(v86, v13, self->_substrokesCount, (uint64_t)CFSTR("substrokesCount"), v14, v15);
  else
    objc_msgSend_encodeInteger_forKey_(v86, v13, 0, (uint64_t)CFSTR("substrokesCount"), v14, v15);
  if (self)
    objc_msgSend_encodeInteger_forKey_(v86, v16, self->_classificationAsNonText, (uint64_t)CFSTR("classificationAsNonText"), v17, v18);
  else
    objc_msgSend_encodeInteger_forKey_(v86, v16, 0, (uint64_t)CFSTR("classificationAsNonText"), v17, v18);
  if (self)
    objc_msgSend_encodeInteger_forKey_(v86, v19, self->_fallbackClassification, (uint64_t)CFSTR("fallbackClassification"), v20, v21);
  else
    objc_msgSend_encodeInteger_forKey_(v86, v19, 0, (uint64_t)CFSTR("fallbackClassification"), v20, v21);
  if (self)
    objc_msgSend_encodeDouble_forKey_(v86, v22, (uint64_t)CFSTR("lineOrientation"), v23, v24, v25, self->_lineOrientationAngle);
  else
    objc_msgSend_encodeDouble_forKey_(v86, v22, (uint64_t)CFSTR("lineOrientation"), v23, v24, v25, 0.0);
  if (self)
    objc_msgSend_encodeDouble_forKey_(v86, v26, (uint64_t)CFSTR("lineError"), v27, v28, v29, self->_lineError);
  else
    objc_msgSend_encodeDouble_forKey_(v86, v26, (uint64_t)CFSTR("lineError"), v27, v28, v29, 0.0);
  if (self)
    objc_msgSend_encodeDouble_forKey_(v86, v30, (uint64_t)CFSTR("containerScore"), v31, v32, v33, self->_containerScore);
  else
    objc_msgSend_encodeDouble_forKey_(v86, v30, (uint64_t)CFSTR("containerScore"), v31, v32, v33, 0.0);
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E0CB3B18], v34, (uint64_t)&self->_bounds, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v86, v38, (uint64_t)v37, (uint64_t)CFSTR("bounds"), v39, v40);
  if (self)
    objc_msgSend_encodeDouble_forKey_(v86, v41, (uint64_t)CFSTR("boundsDiagonal"), v42, v43, v44, self->_boundsDiagonal);
  else
    objc_msgSend_encodeDouble_forKey_(v86, v41, (uint64_t)CFSTR("boundsDiagonal"), v42, v43, v44, 0.0);
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E0CB3B18], v45, (uint64_t)&self->_enlargedBounds, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v86, v49, (uint64_t)v48, (uint64_t)CFSTR("enlargedBounds"), v50, v51);
  objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E0CB3B18], v52, (uint64_t)&self->_rotatedBounds, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v86, v56, (uint64_t)v55, (uint64_t)CFSTR("rotatedBounds"), v57, v58);
  objc_msgSend_supportByStrokeIdentifier(self, v59, v60, v61, v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v86, v65, (uint64_t)v64, (uint64_t)CFSTR("supportByStrokeIdentifier"), v66, v67);

  objc_msgSend_sizeRatioByStrokeIdentifier(self, v68, v69, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v86, v74, (uint64_t)v73, (uint64_t)CFSTR("sizeRatioByStrokeIdentifier"), v75, v76);

  objc_msgSend_support(self, v77, v78, v79, v80, v81);
  objc_msgSend_encodeDouble_forKey_(v86, v82, (uint64_t)CFSTR("support"), v83, v84, v85);

}

- (CHNonTextCandidateStroke)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  double v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  CHNonTextCandidateStroke *v104;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v111;
  uint64_t v112;
  __int128 v113;
  uint64_t v114;
  uint64_t v115;
  __int128 v116;
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[3];
  _QWORD v121[5];

  v121[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v5, v4, (uint64_t)CFSTR("strokeIdentifier"), v6, v7);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_decodeIntegerForKey_(v3, v8, (uint64_t)CFSTR("substrokesCount"), v9, v10, v11);
  v109 = objc_msgSend_decodeIntegerForKey_(v3, v13, (uint64_t)CFSTR("classificationAsNonText"), v14, v15, v16);
  v108 = objc_msgSend_decodeIntegerForKey_(v3, v17, (uint64_t)CFSTR("fallbackClassification"), v18, v19, v20);
  objc_msgSend_decodeDoubleForKey_(v3, v21, (uint64_t)CFSTR("lineOrientation"), v22, v23, v24);
  v26 = v25;
  objc_msgSend_decodeDoubleForKey_(v3, v27, (uint64_t)CFSTR("lineError"), v28, v29, v30);
  v32 = v31;
  v107 = v12;
  objc_msgSend_decodeDoubleForKey_(v3, v33, (uint64_t)CFSTR("containerScore"), v34, v35, v36);
  v38 = v37;
  v39 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v40, v39, (uint64_t)CFSTR("bounds"), v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v118 = *MEMORY[0x1E0C9D628];
  v119 = v44;
  v106 = v43;
  objc_msgSend_getValue_size_(v43, v45, (uint64_t)&v118, 32, v46, v47);
  objc_msgSend_decodeDoubleForKey_(v3, v48, (uint64_t)CFSTR("boundsDiagonal"), v49, v50, v51);
  v53 = v52;
  v54 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v55, v54, (uint64_t)CFSTR("enlargedBounds"), v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getValue_size_(v58, v59, (uint64_t)&v115, 32, v60, v61);
  v62 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v63, v62, (uint64_t)CFSTR("rotatedBounds"), v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getValue_size_(v66, v67, (uint64_t)&v112, 32, v68, v69);
  v70 = (void *)MEMORY[0x1E0C99E60];
  v121[0] = objc_opt_class();
  v121[1] = objc_opt_class();
  v121[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v71, (uint64_t)v121, 3, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v70, v75, (uint64_t)v74, v76, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v80, (uint64_t)v79, (uint64_t)CFSTR("supportByStrokeIdentifier"), v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = (void *)MEMORY[0x1E0C99E60];
  v120[0] = objc_opt_class();
  v120[1] = objc_opt_class();
  v120[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v85, (uint64_t)v120, 3, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v84, v89, (uint64_t)v88, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v94, (uint64_t)v93, (uint64_t)CFSTR("sizeRatioByStrokeIdentifier"), v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_decodeDoubleForKey_(v3, v98, (uint64_t)CFSTR("support"), v99, v100, v101);
  v104 = (CHNonTextCandidateStroke *)objc_msgSend_initWithStrokeIdentifier_substrokesCount_classificationAsNonText_lineOrientation_lineError_containerScore_fallbackClassification_bounds_boundsDiagonal_enlargedBounds_rotatedBounds_supportByStrokeIdentifier_sizeRatioByStrokeIdentifier_support_(self, v102, (uint64_t)v111, v107, v109, v108, v83, v97, v26, v32, v38, v118, v119, v53, v115, v116, v117, v112, v113,
                                       v114,
                                       v103);

  return v104;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CHNonTextCandidateStroke *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CHNonTextCandidateStroke *v11;
  CHEncodedStrokeIdentifier *strokeIdentifier;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CHEncodedStrokeIdentifier *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int isEqual;
  int64_t substrokesCount;
  double containerScore;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double boundsDiagonal;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSMutableDictionary *supportByStrokeIdentifier;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSMutableDictionary *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSMutableDictionary *sizeRatioByStrokeIdentifier;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSMutableDictionary *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double support;
  double v83;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (CHNonTextCandidateStroke *)v4;
    v11 = v5;
    if (self)
    {
      if (self != v5)
      {
        strokeIdentifier = self->_strokeIdentifier;
        objc_msgSend_strokeIdentifier(v5, v6, v7, v8, v9, v10);
        v18 = (CHEncodedStrokeIdentifier *)objc_claimAutoreleasedReturnValue();
        if (strokeIdentifier == v18)
        {

        }
        else
        {
          objc_msgSend_strokeIdentifier(v11, v13, v14, v15, v16, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v19, v20, (uint64_t)self->_strokeIdentifier, v21, v22, v23);

          if (!isEqual)
            goto LABEL_35;
        }
        substrokesCount = self->_substrokesCount;
        if (v11)
        {
          if (substrokesCount != v11->_substrokesCount
            || self->_classificationAsNonText != v11->_classificationAsNonText
            || self->_fallbackClassification != v11->_fallbackClassification
            || vabdd_f64(self->_lineOrientationAngle, v11->_lineOrientationAngle) >= 2.22044605e-16
            || vabdd_f64(self->_lineError, v11->_lineError) >= 2.22044605e-16)
          {
            goto LABEL_35;
          }
          containerScore = v11->_containerScore;
        }
        else
        {
          if (substrokesCount)
            goto LABEL_35;
          if (self->_classificationAsNonText)
            goto LABEL_35;
          if (self->_fallbackClassification)
            goto LABEL_35;
          if (fabs(self->_lineOrientationAngle) >= 2.22044605e-16)
            goto LABEL_35;
          containerScore = 0.0;
          if (fabs(self->_lineError) >= 2.22044605e-16)
            goto LABEL_35;
        }
        if (vabdd_f64(self->_containerScore, containerScore) >= 2.22044605e-16)
          goto LABEL_35;
        if (v11)
        {
          x = v11->_bounds.origin.x;
          y = v11->_bounds.origin.y;
          width = v11->_bounds.size.width;
          height = v11->_bounds.size.height;
        }
        else
        {
          y = 0.0;
          width = 0.0;
          height = 0.0;
          x = 0.0;
        }
        if (!CGRectEqualToRect(self->_bounds, *(CGRect *)&x))
          goto LABEL_35;
        boundsDiagonal = self->_boundsDiagonal;
        if (v11)
        {
          if (vabdd_f64(boundsDiagonal, v11->_boundsDiagonal) >= 2.22044605e-16)
          {
LABEL_35:
            LOBYTE(self) = 0;
            goto LABEL_36;
          }
        }
        else if (vabdd_f64(boundsDiagonal, 0.0) >= 2.22044605e-16)
        {
          goto LABEL_35;
        }
        if (v11)
        {
          v32 = v11->_enlargedBounds.origin.x;
          v33 = v11->_enlargedBounds.origin.y;
          v34 = v11->_enlargedBounds.size.width;
          v35 = v11->_enlargedBounds.size.height;
        }
        else
        {
          v33 = 0.0;
          v34 = 0.0;
          v35 = 0.0;
          v32 = 0.0;
        }
        if (!CGRectEqualToRect(self->_enlargedBounds, *(CGRect *)&v32))
          goto LABEL_35;
        if (v11)
        {
          v36 = v11->_rotatedBounds.origin.x;
          v37 = v11->_rotatedBounds.origin.y;
          v38 = v11->_rotatedBounds.size.width;
          v39 = v11->_rotatedBounds.size.height;
        }
        else
        {
          v37 = 0.0;
          v38 = 0.0;
          v39 = 0.0;
          v36 = 0.0;
        }
        if (!CGRectEqualToRect(self->_rotatedBounds, *(CGRect *)&v36))
          goto LABEL_35;
        supportByStrokeIdentifier = self->_supportByStrokeIdentifier;
        objc_msgSend_supportByStrokeIdentifier(v11, v40, v41, v42, v43, v44);
        v51 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        if (supportByStrokeIdentifier == v51)
        {

        }
        else
        {
          objc_msgSend_supportByStrokeIdentifier(v11, v46, v47, v48, v49, v50);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend_isEqual_(v52, v53, (uint64_t)self->_supportByStrokeIdentifier, v54, v55, v56);

          if (!v57)
            goto LABEL_35;
        }
        sizeRatioByStrokeIdentifier = self->_sizeRatioByStrokeIdentifier;
        objc_msgSend_sizeRatioByStrokeIdentifier(v11, v58, v59, v60, v61, v62);
        v69 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        if (sizeRatioByStrokeIdentifier == v69)
        {

        }
        else
        {
          objc_msgSend_sizeRatioByStrokeIdentifier(v11, v64, v65, v66, v67, v68);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_msgSend_isEqual_(v70, v71, (uint64_t)self->_sizeRatioByStrokeIdentifier, v72, v73, v74);

          if (!v75)
            goto LABEL_35;
        }
        support = self->_support;
        objc_msgSend_support(v11, v76, v77, v78, v79, v80);
        LOBYTE(self) = vabdd_f64(support, v83) < 2.22044605e-16;
        goto LABEL_36;
      }
      LOBYTE(self) = 1;
    }
LABEL_36:

    goto LABEL_37;
  }
  LOBYTE(self) = 0;
LABEL_37:

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
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
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
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
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;

  v224 = objc_msgSend_hash(self->_strokeIdentifier, a2, v2, v3, v4, v5);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v7, v8, v9, v10, v11, self->_lineOrientationAngle);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v223 = objc_msgSend_hash(v12, v13, v14, v15, v16, v17);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v18, v19, v20, v21, v22, self->_lineError);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v222 = objc_msgSend_hash(v23, v24, v25, v26, v27, v28);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v29, v30, v31, v32, v33, self->_containerScore);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v221 = objc_msgSend_hash(v34, v35, v36, v37, v38, v39);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v40, v41, v42, v43, v44, self->_bounds.origin.x);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v220 = objc_msgSend_hash(v45, v46, v47, v48, v49, v50);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v51, v52, v53, v54, v55, self->_bounds.origin.y);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v219 = objc_msgSend_hash(v56, v57, v58, v59, v60, v61);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v62, v63, v64, v65, v66, self->_bounds.size.width);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v218 = objc_msgSend_hash(v67, v68, v69, v70, v71, v72);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v73, v74, v75, v76, v77, self->_bounds.size.height);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = objc_msgSend_hash(v78, v79, v80, v81, v82, v83);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v84, v85, v86, v87, v88, self->_boundsDiagonal);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v216 = objc_msgSend_hash(v89, v90, v91, v92, v93, v94);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v95, v96, v97, v98, v99, self->_enlargedBounds.origin.x);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v215 = objc_msgSend_hash(v100, v101, v102, v103, v104, v105);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v106, v107, v108, v109, v110, self->_enlargedBounds.origin.y);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = objc_msgSend_hash(v111, v112, v113, v114, v115, v116);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v117, v118, v119, v120, v121, self->_enlargedBounds.size.width);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v213 = objc_msgSend_hash(v122, v123, v124, v125, v126, v127);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v128, v129, v130, v131, v132, self->_enlargedBounds.size.height);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v212 = objc_msgSend_hash(v133, v134, v135, v136, v137, v138);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v139, v140, v141, v142, v143, self->_rotatedBounds.origin.x);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = objc_msgSend_hash(v144, v145, v146, v147, v148, v149);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v151, v152, v153, v154, v155, self->_rotatedBounds.origin.y);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = objc_msgSend_hash(v156, v157, v158, v159, v160, v161);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v163, v164, v165, v166, v167, self->_rotatedBounds.size.width);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = objc_msgSend_hash(v168, v169, v170, v171, v172, v173);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v175, v176, v177, v178, v179, self->_rotatedBounds.size.height);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = objc_msgSend_hash(v180, v181, v182, v183, v184, v185);

  v192 = objc_msgSend_hash(self->_supportByStrokeIdentifier, v187, v188, v189, v190, v191);
  v198 = objc_msgSend_hash(self->_sizeRatioByStrokeIdentifier, v193, v194, v195, v196, v197);
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v199, v200, v201, v202, v203, self->_support);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  v210 = objc_msgSend_hash(v204, v205, v206, v207, v208, v209);

  return v223 ^ v224 ^ v222 ^ v221 ^ v220 ^ v219 ^ v218 ^ v217 ^ v216 ^ v215 ^ v214 ^ v213 ^ v212 ^ v150 ^ v162 ^ v174 ^ v186 ^ v192 ^ v198 ^ v210 ^ self->_substrokesCount ^ self->_classificationAsNonText ^ self->_fallbackClassification;
}

- (CHEncodedStrokeIdentifier)strokeIdentifier
{
  return self->_strokeIdentifier;
}

- (double)support
{
  return self->_support;
}

- (NSDictionary)supportByStrokeIdentifier
{
  return &self->_supportByStrokeIdentifier->super;
}

- (NSDictionary)sizeRatioByStrokeIdentifier
{
  return &self->_sizeRatioByStrokeIdentifier->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIdentifier, 0);
  objc_storeStrong((id *)&self->_sizeRatioByStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_supportByStrokeIdentifier, 0);
}

@end
