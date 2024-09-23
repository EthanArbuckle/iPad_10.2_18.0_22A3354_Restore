@implementation CHTransformedTextLine

- (CHTransformedTextLine)initWithStrokes:(id)a3 tokens:(id)a4 points:(const void *)a5 strokePoints:(const void *)a6 locale:(id)a7 strokeClassification:(int64_t)a8 principalLines:(PrincipalLines *)a9 transform:(CGAffineTransform *)a10
{
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CHTransformedTextLine *v22;
  CHTransformedTextSegment *v23;
  __int128 v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _OWORD v32[3];
  void *v33[3];
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *__p;
  void *v39;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  v22 = (CHTransformedTextLine *)objc_msgSend_init(self, v17, v18, v19, v20, v21);
  if (v22)
  {
    v23 = [CHTransformedTextSegment alloc];
    sub_1BE76136C(v33, (uint64_t)a9);
    v24 = *(_OWORD *)&a10->c;
    v32[0] = *(_OWORD *)&a10->a;
    v32[1] = v24;
    v32[2] = *(_OWORD *)&a10->tx;
    v30 = (void *)objc_msgSend_initWithStrokes_tokens_locale_strokeClassification_principalLines_transform_(v23, v25, (uint64_t)v14, (uint64_t)v15, (uint64_t)v16, a8, v33, v32);
    if (__p)
    {
      v39 = __p;
      operator delete(__p);
    }
    if (v36)
    {
      v37 = v36;
      operator delete(v36);
    }
    if (v34)
    {
      v35 = v34;
      operator delete(v34);
    }
    if (v33[0])
    {
      v33[1] = v33[0];
      operator delete(v33[0]);
    }
    v22 = (CHTransformedTextLine *)(id)objc_msgSend_initWithSegment_(v22, v26, (uint64_t)v30, v27, v28, v29);

  }
  return v22;
}

- (CHTransformedTextLine)initWithSegment:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  CGRect *v27;
  CGFloat MinX;
  CGFloat MaxX;
  CGFloat MinY;
  CGFloat MaxY;
  void *v33[2];
  void *v34[2];
  __int128 v35;
  void *v36[2];
  void *__p[2];
  __int128 v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = objc_msgSend_init(self, v5, v6, v7, v8, v9);
  if (!v13)
    goto LABEL_16;
  v39[0] = v4;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v10, (uint64_t)v39, 1, v11, v12);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(v13 + 424);
  *(_QWORD *)(v13 + 424) = v14;

  *(_QWORD *)(v13 + 408) = objc_msgSend_strokeClassification(v4, v16, v17, v18, v19, v20);
  if (v4)
  {
    objc_msgSend_principalLines(v4, v21, v22, v23, v24, v25);
    v26 = (_QWORD *)(v13 + 280);
    if ((void **)(v13 + 280) == v33)
      goto LABEL_7;
    goto LABEL_6;
  }
  *(_OWORD *)__p = 0u;
  v38 = 0u;
  v35 = 0u;
  *(_OWORD *)v36 = 0u;
  *(_OWORD *)v33 = 0u;
  *(_OWORD *)v34 = 0u;
  v26 = (_QWORD *)(v13 + 280);
  if ((void **)(v13 + 280) != v33)
  {
LABEL_6:
    sub_1BE6F5A88(v26, (char *)v33[0], (char *)v33[1], ((char *)v33[1] - (char *)v33[0]) >> 4);
    sub_1BE6F5A88(v26 + 3, (char *)v34[1], (char *)v35, (uint64_t)(v35 - (unint64_t)v34[1]) >> 4);
    sub_1BE6F5A88(v26 + 6, (char *)v36[0], (char *)v36[1], ((char *)v36[1] - (char *)v36[0]) >> 4);
    sub_1BE6F5A88(v26 + 9, (char *)__p[1], (char *)v38, (uint64_t)(v38 - (unint64_t)__p[1]) >> 4);
  }
LABEL_7:
  if (__p[1])
  {
    *(void **)&v38 = __p[1];
    operator delete(__p[1]);
  }
  if (v36[0])
  {
    v36[1] = v36[0];
    operator delete(v36[0]);
  }
  if (v34[1])
  {
    *(void **)&v35 = v34[1];
    operator delete(v34[1]);
  }
  if (v33[0])
  {
    v33[1] = v33[0];
    operator delete(v33[0]);
  }
  v27 = (CGRect *)MEMORY[0x1E0C9D648];
  MinX = CGRectGetMinX(*MEMORY[0x1E0C9D648]);
  MaxX = CGRectGetMaxX(*v27);
  MinY = CGRectGetMinY(*v27);
  MaxY = CGRectGetMaxY(*v27);
  *(CGFloat *)(v13 + 376) = MinX;
  *(CGFloat *)(v13 + 384) = MaxX;
  *(CGFloat *)(v13 + 392) = MinY;
  *(CGFloat *)(v13 + 400) = MaxY;
  *(_BYTE *)(v13 + 416) = 0;
LABEL_16:

  return (CHTransformedTextLine *)v13;
}

- (CHTransformedTextLine)initWithSegments:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CHTransformedTextLine *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PrincipalLines *p_principalLines;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  CGRect *v52;
  CGFloat MinX;
  CGFloat MaxX;
  CGFloat MinY;
  CGFloat MaxY;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  void *v62[2];
  void *v63[2];
  __int128 v64;
  void *v65[2];
  void *__p[2];
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = objc_msgSend_init(self, v6, v7, v8, v9, v10);
  v12 = (CHTransformedTextLine *)v11;
  if (!v11)
    goto LABEL_25;
  objc_storeStrong((id *)(v11 + 424), a3);
  v13 = (void *)objc_opt_class();
  if (v13)
  {
    objc_msgSend_principalLinesFromSegments_(v13, v14, (uint64_t)v5, v16, v17, v18);
    p_principalLines = &v12->_principalLines;
    if (&v12->_principalLines == (PrincipalLines *)v62)
      goto LABEL_7;
    goto LABEL_6;
  }
  *(_OWORD *)__p = 0u;
  v67 = 0u;
  v64 = 0u;
  *(_OWORD *)v65 = 0u;
  *(_OWORD *)v62 = 0u;
  *(_OWORD *)v63 = 0u;
  p_principalLines = &v12->_principalLines;
  if (&v12->_principalLines != (PrincipalLines *)v62)
  {
LABEL_6:
    sub_1BE6F5A88(p_principalLines, (char *)v62[0], (char *)v62[1], ((char *)v62[1] - (char *)v62[0]) >> 4);
    sub_1BE6F5A88(&p_principalLines->base.__begin_, (char *)v63[1], (char *)v64, (uint64_t)(v64 - (unint64_t)v63[1]) >> 4);
    sub_1BE6F5A88(&p_principalLines->median.__begin_, (char *)v65[0], (char *)v65[1], ((char *)v65[1] - (char *)v65[0]) >> 4);
    sub_1BE6F5A88(&p_principalLines->top.__begin_, (char *)__p[1], (char *)v67, (uint64_t)(v67 - (unint64_t)__p[1]) >> 4);
  }
LABEL_7:
  if (__p[1])
  {
    *(void **)&v67 = __p[1];
    operator delete(__p[1]);
  }
  if (v65[0])
  {
    v65[1] = v65[0];
    operator delete(v65[0]);
  }
  if (v63[1])
  {
    *(void **)&v64 = v63[1];
    operator delete(v63[1]);
  }
  if (v62[0])
  {
    v62[1] = v62[0];
    operator delete(v62[0]);
  }
  objc_msgSend_set(MEMORY[0x1E0CB3550], v14, v15, v16, v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v21 = v5;
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v58, (uint64_t)v68, 16, v23);
  if (v29)
  {
    v30 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v59 != v30)
          objc_enumerationMutation(v21);
        v32 = (void *)MEMORY[0x1E0CB37E8];
        v33 = objc_msgSend_strokeClassification(*(void **)(*((_QWORD *)&v58 + 1) + 8 * i), v24, v25, v26, v27, v28, (_QWORD)v58);
        objc_msgSend_numberWithInteger_(v32, v34, v33, v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v20, v39, (uint64_t)v38, v40, v41, v42);

      }
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v58, (uint64_t)v68, 16, v28);
    }
    while (v29);
  }

  v12->_strokeClassification = 1;
  v47 = objc_msgSend_countForObject_(v20, v43, (uint64_t)&unk_1E7828EC8, v44, v45, v46);
  if (v47 < objc_msgSend_countForObject_(v20, v48, (uint64_t)&unk_1E7828EE0, v49, v50, v51))
    v12->_strokeClassification = 2;
  v52 = (CGRect *)MEMORY[0x1E0C9D648];
  MinX = CGRectGetMinX(*MEMORY[0x1E0C9D648]);
  MaxX = CGRectGetMaxX(*v52);
  MinY = CGRectGetMinY(*v52);
  MaxY = CGRectGetMaxY(*v52);
  v12->_boundingBox.x_min = MinX;
  v12->_boundingBox.x_max = MaxX;
  v12->_boundingBox.y_min = MinY;
  v12->_boundingBox.y_max = MaxY;
  v12->_fromCachedTokens = 0;

LABEL_25:
  return v12;
}

- (id)string
{
  NSArray *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = self->_textSegments;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v21, (uint64_t)v25, 16, v4);
  if (v10)
  {
    v11 = *(_QWORD *)v22;
    v12 = &stru_1E77F6F28;
    do
    {
      v13 = 0;
      v14 = v12;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v2);
        objc_msgSend_string(*(void **)(*((_QWORD *)&v21 + 1) + 8 * v13), v5, v6, v7, v8, v9, (_QWORD)v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v14, v16, (uint64_t)v15, v17, v18, v19);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v12;
      }
      while (v10 != v13);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v21, (uint64_t)v25, 16, v9);
    }
    while (v10);
  }
  else
  {
    v12 = &stru_1E77F6F28;
  }

  return v12;
}

- (void)addSupportStroke:(id)a3 tokenRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *textSegments;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSUInteger v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSUInteger v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  void *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSArray *v72;
  NSArray *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  unint64_t v96;
  unint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  NSArray *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  NSArray *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  const char *v140;
  uint64_t v141;
  NSObject *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  NSUInteger v154;
  id v155;
  uint64_t v156;
  NSUInteger v157;
  uint8_t buf[4];
  NSUInteger v159;
  __int16 v160;
  uint64_t v161;
  __int16 v162;
  uint64_t v163;
  uint64_t v164;

  length = a4.length;
  location = a4.location;
  v164 = *MEMORY[0x1E0C80C00];
  v155 = a3;
  v156 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v154 = length;
  v157 = location;
  v15 = location + length;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  while (v12 < objc_msgSend_count(self->_textSegments, v7, v8, v9, v10, v11, v154))
  {
    textSegments = self->_textSegments;
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_objectAtIndexedSubscript_(textSegments, v17, v12, v19, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tokens(v23, v24, v25, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend_count(v29, v30, v31, v32, v33, v34) + v14;

      if (v35 <= v157)
      {
        v16 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v156 = v14;
        v13 = 1;
        v16 = v12;
      }
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(textSegments, v17, v12, v19, v20, v21);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tokens(v40, v41, v42, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend_count(v46, v47, v48, v49, v50, v51) + v14;

      if (v52 <= v15)
        ++v13;
    }
    objc_msgSend_objectAtIndexedSubscript_(self->_textSegments, v36, v12, v37, v38, v39);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokens(v53, v54, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v14 += objc_msgSend_count(v59, v60, v61, v62, v63, v64);

    ++v12;
  }
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v65 = v13 - 1;
    if (v13 > 1)
    {
      v66 = (void *)MEMORY[0x1E0C99DE8];
      v67 = objc_msgSend_count(self->_textSegments, v17, v18, v19, v20, v21);
      objc_msgSend_arrayWithCapacity_(v66, v68, v67 - v13 + 1, v69, v70, v71);
      v72 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v73 = self->_textSegments;
      objc_msgSend_indexSetWithIndexesInRange_(MEMORY[0x1E0CB36B8], v74, 0, v16, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectsAtIndexes_(v73, v78, (uint64_t)v77, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v72, v83, (uint64_t)v82, v84, v85, v86);

      objc_msgSend_objectAtIndex_(self->_textSegments, v87, v16, v88, v89, v90);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v16 + v13;
      v97 = v16 + 1;
      if (v97 < v96)
      {
        do
        {
          objc_msgSend_objectAtIndexedSubscript_(self->_textSegments, v91, v97, v92, v93, v94);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_mergeTransformedText_(v95, v99, (uint64_t)v98, v100, v101, v102);

          ++v97;
          --v65;
        }
        while (v65);
      }
      objc_msgSend_addObject_(v72, v91, (uint64_t)v95, v92, v93, v94);
      v103 = v95;
      v104 = self->_textSegments;
      v105 = (void *)MEMORY[0x1E0CB36B8];
      v111 = objc_msgSend_count(v104, v106, v107, v108, v109, v110);
      objc_msgSend_indexSetWithIndexesInRange_(v105, v112, v96, v111 - v96, v113, v114);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectsAtIndexes_(v104, v116, (uint64_t)v115, v117, v118, v119);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObjectsFromArray_(v72, v121, (uint64_t)v120, v122, v123, v124);

      v125 = self->_textSegments;
      self->_textSegments = v72;

      v131 = v154;
      v132 = v155;
      if (!v103)
        goto LABEL_27;
LABEL_19:
      objc_msgSend_tokens(v103, v126, v127, v128, v129, v130);
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = objc_msgSend_count(v133, v134, v135, v136, v137, v138);

      if (v157 - v156 + v131 > v139)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v142 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v142, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend_tokens(v103, v143, v144, v145, v146, v147);
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218496;
          v159 = v157 - v156;
          v160 = 2048;
          v161 = v131;
          v162 = 2048;
          v163 = objc_msgSend_count(v148, v149, v150, v151, v152, v153);
          _os_log_impl(&dword_1BE607000, v142, OS_LOG_TYPE_FAULT, "Token range in segment defined as (%ld, %ld), incompatible with segment containing %ld tokens.", buf, 0x20u);

        }
      }
      objc_msgSend_addSupportStroke_tokenRange_(v103, v140, (uint64_t)v132, v157 - v156, v131, v141);
      goto LABEL_27;
    }
  }
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v103 = 0;
    v132 = v155;
    goto LABEL_27;
  }
  v132 = v155;
  objc_msgSend_objectAtIndexedSubscript_(self->_textSegments, v17, v16, v19, v20, v21);
  v103 = (id)objc_claimAutoreleasedReturnValue();
  v131 = v154;
  if (v103)
    goto LABEL_19;
LABEL_27:

}

- (void)addSupportStroke:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  unint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  CGFloat v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  CGFloat v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  CGFloat v65;
  CGFloat v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v64 = a3;
  objc_msgSend_bounds(v64, v4, v5, v6, v7, v8);
  v65 = v15;
  v66 = v14;
  v17 = v16;
  v19 = v18;
  v20 = 0;
  v21 = v16 * v18 + 1.0e-10;
  v22 = 0.0;
  v23 = -1;
  while (v20 < objc_msgSend_count(self->_textSegments, v9, v10, v11, v12, v13))
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_textSegments, v24, v20, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_boundingBox(v28, v29, v30, v31, v32, v33);
    v35 = v34;
    objc_msgSend_boundingBox(v28, v36, v37, v38, v39, v40);
    v42 = v41;
    objc_msgSend_boundingBox(v28, v43, v44, v45, v46, v47);
    v49 = v48;
    v51 = v50;
    objc_msgSend_boundingBox(v28, v52, v53, v54, v55, v56);
    v67.size.height = v58 - v57;
    v67.origin.x = v35;
    v67.origin.y = v42;
    v67.size.width = v51 - v49;
    v69.origin.y = v65;
    v69.origin.x = v66;
    v69.size.width = v17;
    v69.size.height = v19;
    v68 = CGRectIntersection(v67, v69);
    if (v68.size.width * v68.size.height / v21 > v22)
    {
      v23 = v20;
      v22 = v68.size.width * v68.size.height / v21;
    }

    ++v20;
  }
  if (v23 != -1 && v22 >= 0.5)
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_textSegments, v24, v23, v25, v26, v27);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSupportStroke_(v59, v60, (uint64_t)v64, v61, v62, v63);

  }
}

- (id)splitIntoTokens
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CHTransformedTextLine *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  NSArray *obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = self->_textSegments;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v44, (uint64_t)v49, 16, v9);
  if (v15)
  {
    v16 = *(_QWORD *)v45;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v45 != v16)
          objc_enumerationMutation(obj);
        objc_msgSend_splitIntoTokens(*(void **)(*((_QWORD *)&v44 + 1) + 8 * v17), v10, v11, v12, v13, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v19 = v18;
        v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v40, (uint64_t)v48, 16, v21);
        if (v22)
        {
          v23 = *(_QWORD *)v41;
          do
          {
            v24 = 0;
            do
            {
              if (*(_QWORD *)v41 != v23)
                objc_enumerationMutation(v19);
              v25 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v24);
              v26 = [CHTransformedTextLine alloc];
              v31 = (void *)objc_msgSend_initWithSegment_(v26, v27, v25, v28, v29, v30);
              objc_msgSend_addObject_(v7, v32, (uint64_t)v31, v33, v34, v35);

              ++v24;
            }
            while (v22 != v24);
            v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v36, (uint64_t)&v40, (uint64_t)v48, 16, v37);
          }
          while (v22);
        }

        ++v17;
      }
      while (v17 != v15);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v44, (uint64_t)v49, 16, v14);
    }
    while (v15);
  }

  return v7;
}

- (void)mergeTransformedText:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend_textSegments(a3, a2, (uint64_t)a3, v3, v4, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, (uint64_t)v21, 16, v9);
  if (v14)
  {
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v7);
        objc_msgSend__addTextLineSegment_(self, v10, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), v11, v12, v13);
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, (uint64_t)v21, 16, v13);
    }
    while (v14);
  }

}

- (void)_addTextLineSegment:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSArray *textSegments;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSArray *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  CGRect *v50;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  void *v55[2];
  void *v56[2];
  __int128 v57;
  void *v58[2];
  void *v59[2];
  __int128 v60;
  void *v61[2];
  void *v62[2];
  __int128 v63;
  void *v64[2];
  void *v65[2];
  __int128 v66;
  void *v67;
  char *v68;
  void *v69;
  char *v70;
  void *v71;
  char *v72;
  void *__p;
  char *v74;
  CGAffineTransform t2;
  CGAffineTransform t1;

  v4 = a3;
  v10 = v4;
  if (v4)
    objc_msgSend_transform(v4, v5, v6, v7, v8, v9);
  else
    memset(&t1, 0, sizeof(t1));
  objc_msgSend_lastObject(self->_textSegments, v5, v6, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v11;
  if (v11)
    objc_msgSend_transform(v11, v12, v13, v14, v15, v16);
  else
    memset(&t2, 0, sizeof(t2));
  v18 = CGAffineTransformEqualToTransform(&t1, &t2);

  textSegments = self->_textSegments;
  if (v18)
  {
    objc_msgSend_lastObject(textSegments, v19, v20, v21, v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mergeTransformedText_(v25, v26, (uint64_t)v10, v27, v28, v29);
  }
  else
  {
    objc_msgSend_arrayByAddingObject_(textSegments, v19, (uint64_t)v10, v21, v22, v23);
    v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v25 = self->_textSegments;
    self->_textSegments = v30;
  }

  objc_msgSend_firstObject(self->_textSegments, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v36;
  if (v36)
  {
    objc_msgSend_principalLines(v36, v37, v38, v39, v40, v41);
  }
  else
  {
    *(_OWORD *)v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    *(_OWORD *)v64 = 0u;
    *(_OWORD *)v61 = 0u;
    *(_OWORD *)v62 = 0u;
  }
  objc_msgSend_lastObject(self->_textSegments, v37, v38, v39, v40, v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v43;
  if (v43)
  {
    objc_msgSend_principalLines(v43, v44, v45, v46, v47, v48);
  }
  else
  {
    *(_OWORD *)v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    *(_OWORD *)v58 = 0u;
    *(_OWORD *)v55 = 0u;
    *(_OWORD *)v56 = 0u;
  }
  CoreHandwriting::merge_lines((CoreHandwriting *)v61, (const CoreHandwriting::PrincipalLines *)v55, (uint64_t)&v67);
  if (&self->_principalLines != (PrincipalLines *)&v67)
  {
    sub_1BE6F5A88(&self->_principalLines.descender.__begin_, (char *)v67, v68, (v68 - (_BYTE *)v67) >> 4);
    sub_1BE6F5A88(&self->_principalLines.base.__begin_, (char *)v69, v70, (v70 - (_BYTE *)v69) >> 4);
    sub_1BE6F5A88(&self->_principalLines.median.__begin_, (char *)v71, v72, (v72 - (_BYTE *)v71) >> 4);
    sub_1BE6F5A88(&self->_principalLines.top.__begin_, (char *)__p, v74, (v74 - (_BYTE *)__p) >> 4);
  }
  if (__p)
  {
    v74 = (char *)__p;
    operator delete(__p);
  }
  if (v71)
  {
    v72 = (char *)v71;
    operator delete(v71);
  }
  if (v69)
  {
    v70 = (char *)v69;
    operator delete(v69);
  }
  if (v67)
  {
    v68 = (char *)v67;
    operator delete(v67);
  }
  if (v59[1])
  {
    *(void **)&v60 = v59[1];
    operator delete(v59[1]);
  }
  if (v58[0])
  {
    v58[1] = v58[0];
    operator delete(v58[0]);
  }
  if (v56[1])
  {
    *(void **)&v57 = v56[1];
    operator delete(v56[1]);
  }
  if (v55[0])
  {
    v55[1] = v55[0];
    operator delete(v55[0]);
  }

  if (v65[1])
  {
    *(void **)&v66 = v65[1];
    operator delete(v65[1]);
  }
  if (v64[0])
  {
    v64[1] = v64[0];
    operator delete(v64[0]);
  }
  if (v62[1])
  {
    *(void **)&v63 = v62[1];
    operator delete(v62[1]);
  }
  if (v61[0])
  {
    v61[1] = v61[0];
    operator delete(v61[0]);
  }

  v50 = (CGRect *)MEMORY[0x1E0C9D648];
  MinX = CGRectGetMinX(*MEMORY[0x1E0C9D648]);
  MaxX = CGRectGetMaxX(*v50);
  MinY = CGRectGetMinY(*v50);
  MaxY = CGRectGetMaxY(*v50);
  self->_boundingBox.x_min = MinX;
  self->_boundingBox.x_max = MaxX;
  self->_boundingBox.y_min = MinY;
  self->_boundingBox.y_max = MaxY;

}

+ (PrincipalLines)principalLinesFromSegments:(SEL)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  _OWORD *v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  _OWORD *v46;
  unint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  _OWORD *v72;
  unint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  uint64_t v85;
  unint64_t v86;
  char *v87;
  char *v88;
  char *v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  char *v95;
  char *v96;
  char *v97;
  _OWORD *v98;
  unint64_t v99;
  char *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  unint64_t v106;
  char *v107;
  char *v108;
  char *v109;
  char *v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  char *v121;
  char *v122;
  char *v123;
  char *v124;
  char *v125;
  char *v126;
  char *v127;
  char *v128;
  char *v129;
  char *v130;
  char *v131;
  char *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  double v144;
  uint64_t v145;
  unint64_t v146;
  double v147;
  double v148;
  double v149;
  double v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  double v170;
  double *v171;
  double v172;
  double v173;
  void *v174;
  double v175;
  double *v176;
  double v177;
  double v178;
  void *v179;
  double v180;
  double *v181;
  double v182;
  double v183;
  void *v184;
  double v185;
  double *v186;
  double v187;
  double v188;
  void *v189;
  PrincipalLines *result;
  PrincipalLines *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194[2];
  void *v195[2];
  void *v196;
  void *v197[2];
  __int128 v198;
  uint64_t v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  void *v204;
  char *v205;
  unint64_t v206;
  void *v207;
  char *v208;
  unint64_t v209;
  void *v210;
  char *v211;
  unint64_t v212;
  void *v213;
  char *v214;
  unint64_t v215;
  _BYTE v216[128];
  uint64_t v217;

  v217 = *MEMORY[0x1E0C80C00];
  v213 = 0;
  v214 = 0;
  v215 = 0;
  v210 = 0;
  v211 = 0;
  v212 = 0;
  v207 = 0;
  v208 = 0;
  v209 = 0;
  v204 = 0;
  v205 = 0;
  v206 = 0;
  v202 = 0u;
  v203 = 0u;
  v200 = 0u;
  v201 = 0u;
  v5 = a4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v200, (uint64_t)v216, 16, v7);
  v191 = retstr;
  v14 = v5;
  if (v8)
  {
    v192 = *(_QWORD *)v201;
    v15 = 0.0;
    while (1)
    {
      v193 = v8;
      v16 = 0;
      do
      {
        if (*(_QWORD *)v201 != v192)
          objc_enumerationMutation(v5);
        v17 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * v16);
        objc_msgSend_orientation(v17, v9, v10, v11, v12, v13);
        v19 = v18;
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          v20 = (_OWORD *)*((_QWORD *)&v198 + 1);
          v22 = v214;
          v21 = v215;
          if ((unint64_t)v214 < v215)
            goto LABEL_9;
        }
        else
        {
          v20 = 0;
          v198 = 0u;
          v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          v22 = v214;
          v21 = v215;
          if ((unint64_t)v214 < v215)
          {
LABEL_9:
            *(_OWORD *)v22 = *v20;
            v23 = v22 + 16;
            goto LABEL_22;
          }
        }
        v24 = (char *)v213;
        v25 = (v22 - (_BYTE *)v213) >> 4;
        v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 60)
          sub_1BE61F930();
        v27 = v21 - (_QWORD)v213;
        if (v27 >> 3 > v26)
          v26 = v27 >> 3;
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0)
          v28 = 0xFFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
        {
          if (v28 >> 60)
            sub_1BE61F100();
          v29 = (char *)operator new(16 * v28);
          v30 = &v29[16 * v25];
          *(_OWORD *)v30 = *v20;
          v31 = v30;
          if (v22 == v24)
          {
LABEL_20:
            v32 = &v29[16 * v28];
            v23 = v30 + 16;
            v213 = v31;
            v214 = v30 + 16;
            v215 = (unint64_t)v32;
            v5 = v14;
            if (!v22)
              goto LABEL_22;
LABEL_21:
            operator delete(v22);
            goto LABEL_22;
          }
        }
        else
        {
          v29 = 0;
          v30 = (char *)(16 * v25);
          *(_OWORD *)(16 * v25) = *v20;
          v31 = (char *)(16 * v25);
          if (v22 == v24)
            goto LABEL_20;
        }
        do
        {
          *((_OWORD *)v31 - 1) = *((_OWORD *)v22 - 1);
          v31 -= 16;
          v22 -= 16;
        }
        while (v22 != v24);
        v22 = (char *)v213;
        v125 = &v29[16 * v28];
        v23 = v30 + 16;
        v213 = v31;
        v214 = v30 + 16;
        v215 = (unint64_t)v125;
        v5 = v14;
        if (v22)
          goto LABEL_21;
LABEL_22:
        v214 = v23;
        if (*((_QWORD *)&v198 + 1))
        {
          v199 = *((_QWORD *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          v33 = v199 - 16;
          v35 = v214;
          v34 = v215;
          if ((unint64_t)v214 < v215)
            goto LABEL_32;
        }
        else
        {
          v198 = 0u;
          v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          v33 = -16;
          v35 = v214;
          v34 = v215;
          if ((unint64_t)v214 < v215)
          {
LABEL_32:
            *(_OWORD *)v35 = *(_OWORD *)v33;
            v36 = v35 + 16;
            goto LABEL_45;
          }
        }
        v37 = (char *)v213;
        v38 = (v35 - (_BYTE *)v213) >> 4;
        v39 = v38 + 1;
        if ((unint64_t)(v38 + 1) >> 60)
          sub_1BE61F930();
        v40 = v34 - (_QWORD)v213;
        if (v40 >> 3 > v39)
          v39 = v40 >> 3;
        if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF0)
          v41 = 0xFFFFFFFFFFFFFFFLL;
        else
          v41 = v39;
        if (v41)
        {
          if (v41 >> 60)
            sub_1BE61F100();
          v42 = (char *)operator new(16 * v41);
          v43 = &v42[16 * v38];
          *(_OWORD *)v43 = *(_OWORD *)v33;
          v44 = v43;
          if (v35 == v37)
          {
LABEL_43:
            v45 = &v42[16 * v41];
            v36 = v43 + 16;
            v213 = v44;
            v214 = v43 + 16;
            v215 = (unint64_t)v45;
            v5 = v14;
            if (!v35)
              goto LABEL_45;
LABEL_44:
            operator delete(v35);
            goto LABEL_45;
          }
        }
        else
        {
          v42 = 0;
          v43 = (char *)(16 * v38);
          *(_OWORD *)(16 * v38) = *(_OWORD *)v33;
          v44 = (char *)(16 * v38);
          if (v35 == v37)
            goto LABEL_43;
        }
        do
        {
          *((_OWORD *)v44 - 1) = *((_OWORD *)v35 - 1);
          v44 -= 16;
          v35 -= 16;
        }
        while (v35 != v37);
        v35 = (char *)v213;
        v126 = &v42[16 * v41];
        v36 = v43 + 16;
        v213 = v44;
        v214 = v43 + 16;
        v215 = (unint64_t)v126;
        v5 = v14;
        if (v35)
          goto LABEL_44;
LABEL_45:
        v214 = v36;
        if (*((_QWORD *)&v198 + 1))
        {
          v199 = *((_QWORD *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          v46 = v197[0];
          v48 = v211;
          v47 = v212;
          if ((unint64_t)v211 < v212)
            goto LABEL_55;
        }
        else
        {
          v46 = 0;
          v198 = 0u;
          v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          v48 = v211;
          v47 = v212;
          if ((unint64_t)v211 < v212)
          {
LABEL_55:
            *(_OWORD *)v48 = *v46;
            v49 = v48 + 16;
            goto LABEL_68;
          }
        }
        v50 = (char *)v210;
        v51 = (v48 - (_BYTE *)v210) >> 4;
        v52 = v51 + 1;
        if ((unint64_t)(v51 + 1) >> 60)
          sub_1BE61F930();
        v53 = v47 - (_QWORD)v210;
        if (v53 >> 3 > v52)
          v52 = v53 >> 3;
        if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF0)
          v54 = 0xFFFFFFFFFFFFFFFLL;
        else
          v54 = v52;
        if (v54)
        {
          if (v54 >> 60)
            sub_1BE61F100();
          v55 = (char *)operator new(16 * v54);
          v56 = &v55[16 * v51];
          *(_OWORD *)v56 = *v46;
          v57 = v56;
          if (v48 == v50)
          {
LABEL_66:
            v58 = &v55[16 * v54];
            v49 = v56 + 16;
            v210 = v57;
            v211 = v56 + 16;
            v212 = (unint64_t)v58;
            v5 = v14;
            if (!v48)
              goto LABEL_68;
LABEL_67:
            operator delete(v48);
            goto LABEL_68;
          }
        }
        else
        {
          v55 = 0;
          v56 = (char *)(16 * v51);
          *(_OWORD *)(16 * v51) = *v46;
          v57 = (char *)(16 * v51);
          if (v48 == v50)
            goto LABEL_66;
        }
        do
        {
          *((_OWORD *)v57 - 1) = *((_OWORD *)v48 - 1);
          v57 -= 16;
          v48 -= 16;
        }
        while (v48 != v50);
        v48 = (char *)v210;
        v127 = &v55[16 * v54];
        v49 = v56 + 16;
        v210 = v57;
        v211 = v56 + 16;
        v212 = (unint64_t)v127;
        v5 = v14;
        if (v48)
          goto LABEL_67;
LABEL_68:
        v211 = v49;
        if (*((_QWORD *)&v198 + 1))
        {
          v199 = *((_QWORD *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          v59 = (uint64_t)v197[1] - 16;
          v61 = v211;
          v60 = v212;
          if ((unint64_t)v211 < v212)
            goto LABEL_78;
        }
        else
        {
          v198 = 0u;
          v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          v59 = -16;
          v61 = v211;
          v60 = v212;
          if ((unint64_t)v211 < v212)
          {
LABEL_78:
            *(_OWORD *)v61 = *(_OWORD *)v59;
            v62 = v61 + 16;
            goto LABEL_91;
          }
        }
        v63 = (char *)v210;
        v64 = (v61 - (_BYTE *)v210) >> 4;
        v65 = v64 + 1;
        if ((unint64_t)(v64 + 1) >> 60)
          sub_1BE61F930();
        v66 = v60 - (_QWORD)v210;
        if (v66 >> 3 > v65)
          v65 = v66 >> 3;
        if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF0)
          v67 = 0xFFFFFFFFFFFFFFFLL;
        else
          v67 = v65;
        if (v67)
        {
          if (v67 >> 60)
            sub_1BE61F100();
          v68 = (char *)operator new(16 * v67);
          v69 = &v68[16 * v64];
          *(_OWORD *)v69 = *(_OWORD *)v59;
          v70 = v69;
          if (v61 == v63)
          {
LABEL_89:
            v71 = &v68[16 * v67];
            v62 = v69 + 16;
            v210 = v70;
            v211 = v69 + 16;
            v212 = (unint64_t)v71;
            v5 = v14;
            if (!v61)
              goto LABEL_91;
LABEL_90:
            operator delete(v61);
            goto LABEL_91;
          }
        }
        else
        {
          v68 = 0;
          v69 = (char *)(16 * v64);
          *(_OWORD *)(16 * v64) = *(_OWORD *)v59;
          v70 = (char *)(16 * v64);
          if (v61 == v63)
            goto LABEL_89;
        }
        do
        {
          *((_OWORD *)v70 - 1) = *((_OWORD *)v61 - 1);
          v70 -= 16;
          v61 -= 16;
        }
        while (v61 != v63);
        v61 = (char *)v210;
        v128 = &v68[16 * v67];
        v62 = v69 + 16;
        v210 = v70;
        v211 = v69 + 16;
        v212 = (unint64_t)v128;
        v5 = v14;
        if (v61)
          goto LABEL_90;
LABEL_91:
        v211 = v62;
        if (*((_QWORD *)&v198 + 1))
        {
          v199 = *((_QWORD *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          v72 = v195[1];
          v74 = v208;
          v73 = v209;
          if ((unint64_t)v208 < v209)
            goto LABEL_101;
        }
        else
        {
          v72 = 0;
          v198 = 0u;
          v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          v74 = v208;
          v73 = v209;
          if ((unint64_t)v208 < v209)
          {
LABEL_101:
            *(_OWORD *)v74 = *v72;
            v75 = v74 + 16;
            goto LABEL_114;
          }
        }
        v76 = (char *)v207;
        v77 = (v74 - (_BYTE *)v207) >> 4;
        v78 = v77 + 1;
        if ((unint64_t)(v77 + 1) >> 60)
          sub_1BE61F930();
        v79 = v73 - (_QWORD)v207;
        if (v79 >> 3 > v78)
          v78 = v79 >> 3;
        if ((unint64_t)v79 >= 0x7FFFFFFFFFFFFFF0)
          v80 = 0xFFFFFFFFFFFFFFFLL;
        else
          v80 = v78;
        if (v80)
        {
          if (v80 >> 60)
            sub_1BE61F100();
          v81 = (char *)operator new(16 * v80);
          v82 = &v81[16 * v77];
          *(_OWORD *)v82 = *v72;
          v83 = v82;
          if (v74 == v76)
          {
LABEL_112:
            v84 = &v81[16 * v80];
            v75 = v82 + 16;
            v207 = v83;
            v208 = v82 + 16;
            v209 = (unint64_t)v84;
            v5 = v14;
            if (!v74)
              goto LABEL_114;
LABEL_113:
            operator delete(v74);
            goto LABEL_114;
          }
        }
        else
        {
          v81 = 0;
          v82 = (char *)(16 * v77);
          *(_OWORD *)(16 * v77) = *v72;
          v83 = (char *)(16 * v77);
          if (v74 == v76)
            goto LABEL_112;
        }
        do
        {
          *((_OWORD *)v83 - 1) = *((_OWORD *)v74 - 1);
          v83 -= 16;
          v74 -= 16;
        }
        while (v74 != v76);
        v74 = (char *)v207;
        v129 = &v81[16 * v80];
        v75 = v82 + 16;
        v207 = v83;
        v208 = v82 + 16;
        v209 = (unint64_t)v129;
        v5 = v14;
        if (v74)
          goto LABEL_113;
LABEL_114:
        v208 = v75;
        if (*((_QWORD *)&v198 + 1))
        {
          v199 = *((_QWORD *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          v85 = (uint64_t)v196 - 16;
          v87 = v208;
          v86 = v209;
          if ((unint64_t)v208 < v209)
            goto LABEL_124;
        }
        else
        {
          v198 = 0u;
          v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          v85 = -16;
          v87 = v208;
          v86 = v209;
          if ((unint64_t)v208 < v209)
          {
LABEL_124:
            *(_OWORD *)v87 = *(_OWORD *)v85;
            v88 = v87 + 16;
            goto LABEL_137;
          }
        }
        v89 = (char *)v207;
        v90 = (v87 - (_BYTE *)v207) >> 4;
        v91 = v90 + 1;
        if ((unint64_t)(v90 + 1) >> 60)
          sub_1BE61F930();
        v92 = v86 - (_QWORD)v207;
        if (v92 >> 3 > v91)
          v91 = v92 >> 3;
        if ((unint64_t)v92 >= 0x7FFFFFFFFFFFFFF0)
          v93 = 0xFFFFFFFFFFFFFFFLL;
        else
          v93 = v91;
        if (v93)
        {
          if (v93 >> 60)
            sub_1BE61F100();
          v94 = (char *)operator new(16 * v93);
          v95 = &v94[16 * v90];
          *(_OWORD *)v95 = *(_OWORD *)v85;
          v96 = v95;
          if (v87 == v89)
          {
LABEL_135:
            v97 = &v94[16 * v93];
            v88 = v95 + 16;
            v207 = v96;
            v208 = v95 + 16;
            v209 = (unint64_t)v97;
            v5 = v14;
            if (!v87)
              goto LABEL_137;
LABEL_136:
            operator delete(v87);
            goto LABEL_137;
          }
        }
        else
        {
          v94 = 0;
          v95 = (char *)(16 * v90);
          *(_OWORD *)(16 * v90) = *(_OWORD *)v85;
          v96 = (char *)(16 * v90);
          if (v87 == v89)
            goto LABEL_135;
        }
        do
        {
          *((_OWORD *)v96 - 1) = *((_OWORD *)v87 - 1);
          v96 -= 16;
          v87 -= 16;
        }
        while (v87 != v89);
        v87 = (char *)v207;
        v130 = &v94[16 * v93];
        v88 = v95 + 16;
        v207 = v96;
        v208 = v95 + 16;
        v209 = (unint64_t)v130;
        v5 = v14;
        if (v87)
          goto LABEL_136;
LABEL_137:
        v208 = v88;
        if (*((_QWORD *)&v198 + 1))
        {
          v199 = *((_QWORD *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          v98 = v194[0];
          v100 = v205;
          v99 = v206;
          if ((unint64_t)v205 < v206)
            goto LABEL_147;
        }
        else
        {
          v98 = 0;
          v198 = 0u;
          v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          v100 = v205;
          v99 = v206;
          if ((unint64_t)v205 < v206)
          {
LABEL_147:
            *(_OWORD *)v100 = *v98;
            v101 = v100 + 16;
            goto LABEL_160;
          }
        }
        v102 = (char *)v204;
        v103 = (v100 - (_BYTE *)v204) >> 4;
        v104 = v103 + 1;
        if ((unint64_t)(v103 + 1) >> 60)
          sub_1BE61F930();
        v105 = v99 - (_QWORD)v204;
        if (v105 >> 3 > v104)
          v104 = v105 >> 3;
        if ((unint64_t)v105 >= 0x7FFFFFFFFFFFFFF0)
          v106 = 0xFFFFFFFFFFFFFFFLL;
        else
          v106 = v104;
        if (v106)
        {
          if (v106 >> 60)
            sub_1BE61F100();
          v107 = (char *)operator new(16 * v106);
          v108 = &v107[16 * v103];
          *(_OWORD *)v108 = *v98;
          v109 = v108;
          if (v100 == v102)
          {
LABEL_158:
            v110 = &v107[16 * v106];
            v101 = v108 + 16;
            v204 = v109;
            v205 = v108 + 16;
            v206 = (unint64_t)v110;
            v5 = v14;
            if (!v100)
              goto LABEL_160;
LABEL_159:
            operator delete(v100);
            goto LABEL_160;
          }
        }
        else
        {
          v107 = 0;
          v108 = (char *)(16 * v103);
          *(_OWORD *)(16 * v103) = *v98;
          v109 = (char *)(16 * v103);
          if (v100 == v102)
            goto LABEL_158;
        }
        do
        {
          *((_OWORD *)v109 - 1) = *((_OWORD *)v100 - 1);
          v109 -= 16;
          v100 -= 16;
        }
        while (v100 != v102);
        v100 = (char *)v204;
        v131 = &v107[16 * v106];
        v101 = v108 + 16;
        v204 = v109;
        v205 = v108 + 16;
        v206 = (unint64_t)v131;
        v5 = v14;
        if (v100)
          goto LABEL_159;
LABEL_160:
        v205 = v101;
        if (*((_QWORD *)&v198 + 1))
        {
          v199 = *((_QWORD *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        if (v17)
        {
          objc_msgSend_principalLines(v17, v9, v10, v11, v12, v13);
          v111 = (uint64_t)v194[1] - 16;
          v113 = v205;
          v112 = v206;
          if ((unint64_t)v205 < v206)
            goto LABEL_170;
        }
        else
        {
          v198 = 0u;
          v199 = 0;
          v196 = 0;
          *(_OWORD *)v197 = 0u;
          *(_OWORD *)v194 = 0u;
          *(_OWORD *)v195 = 0u;
          v111 = -16;
          v113 = v205;
          v112 = v206;
          if ((unint64_t)v205 < v206)
          {
LABEL_170:
            *(_OWORD *)v113 = *(_OWORD *)v111;
            v114 = v113 + 16;
            v115 = v193;
            goto LABEL_185;
          }
        }
        v116 = (char *)v204;
        v117 = (v113 - (_BYTE *)v204) >> 4;
        v118 = v117 + 1;
        if ((unint64_t)(v117 + 1) >> 60)
          sub_1BE61F930();
        v119 = v112 - (_QWORD)v204;
        if (v119 >> 3 > v118)
          v118 = v119 >> 3;
        if ((unint64_t)v119 >= 0x7FFFFFFFFFFFFFF0)
          v120 = 0xFFFFFFFFFFFFFFFLL;
        else
          v120 = v118;
        if (v120)
        {
          if (v120 >> 60)
            sub_1BE61F100();
          v121 = (char *)operator new(16 * v120);
          v122 = &v121[16 * v117];
          *(_OWORD *)v122 = *(_OWORD *)v111;
          v123 = v122;
          if (v113 == v116)
          {
LABEL_222:
            v115 = v193;
            v132 = &v121[16 * v120];
            v114 = v122 + 16;
            v204 = v123;
            v205 = v122 + 16;
            v206 = (unint64_t)v132;
            v5 = v14;
            if (v113)
              goto LABEL_184;
            goto LABEL_185;
          }
        }
        else
        {
          v121 = 0;
          v122 = (char *)(16 * v117);
          *(_OWORD *)(16 * v117) = *(_OWORD *)v111;
          v123 = (char *)(16 * v117);
          if (v113 == v116)
            goto LABEL_222;
        }
        v115 = v193;
        do
        {
          *((_OWORD *)v123 - 1) = *((_OWORD *)v113 - 1);
          v123 -= 16;
          v113 -= 16;
        }
        while (v113 != v116);
        v113 = (char *)v204;
        v124 = &v121[16 * v120];
        v114 = v122 + 16;
        v204 = v123;
        v205 = v122 + 16;
        v206 = (unint64_t)v124;
        v5 = v14;
        if (v113)
LABEL_184:
          operator delete(v113);
LABEL_185:
        v205 = v114;
        if (*((_QWORD *)&v198 + 1))
        {
          v199 = *((_QWORD *)&v198 + 1);
          operator delete(*((void **)&v198 + 1));
        }
        if (v197[0])
        {
          v197[1] = v197[0];
          operator delete(v197[0]);
        }
        if (v195[1])
        {
          v196 = v195[1];
          operator delete(v195[1]);
        }
        if (v194[0])
        {
          v194[1] = v194[0];
          operator delete(v194[0]);
        }
        v15 = v15 + v19;
        ++v16;
      }
      while (v16 != v115);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v9, (uint64_t)&v200, (uint64_t)v216, 16, v13);
      if (!v8)
        goto LABEL_227;
    }
  }
  v15 = 0.0;
LABEL_227:

  v138 = objc_msgSend_count(v5, v133, v134, v135, v136, v137);
  v144 = tan(-v15 / (double)(unint64_t)v138);
  v145 = 0;
  v146 = 0;
  v147 = 0.0;
  v148 = 0.0;
  v149 = 0.0;
  v150 = 0.0;
  while (v146 < 2 * objc_msgSend_count(v5, v139, v140, v141, v142, v143))
  {
    v147 = v147 + *(double *)((char *)v213 + v145 + 8) - *(double *)((char *)v213 + v145) * v144;
    v148 = v148 + *(double *)((char *)v210 + v145 + 8) - *(double *)((char *)v210 + v145) * v144;
    v149 = v149 + *(double *)((char *)v207 + v145 + 8) - *(double *)((char *)v207 + v145) * v144;
    v150 = v150 + *(double *)((char *)v204 + v145 + 8) - *(double *)((char *)v204 + v145) * v144;
    ++v146;
    v145 += 16;
  }
  v151 = objc_msgSend_count(v5, v139, v140, v141, v142, v143);
  v157 = objc_msgSend_count(v5, v152, v153, v154, v155, v156);
  v163 = objc_msgSend_count(v5, v158, v159, v160, v161, v162);
  v169 = objc_msgSend_count(v5, v164, v165, v166, v167, v168);
  *(_OWORD *)&v191->median.__end_cap_.__value_ = 0u;
  *(_OWORD *)&v191->top.__end_ = 0u;
  *(_OWORD *)&v191->base.__end_ = 0u;
  *(_OWORD *)&v191->median.__begin_ = 0u;
  *(_OWORD *)&v191->descender.__begin_ = 0u;
  *(_OWORD *)&v191->descender.__end_cap_.__value_ = 0u;
  v170 = *(double *)v213;
  v171 = (double *)operator new(0x10uLL);
  v172 = v147 / (double)(unint64_t)(2 * v151);
  *v171 = v170;
  v171[1] = v172 + v170 * v144;
  v173 = *((double *)v214 - 2);
  v174 = operator new(0x20uLL);
  *((double *)v174 + 2) = v173;
  *((double *)v174 + 3) = v172 + v173 * v144;
  *(_OWORD *)v174 = *(_OWORD *)v171;
  operator delete(v171);
  sub_1BE6F5A88(&v191->top.__begin_, (char *)v174, (char *)v174 + 32, 2uLL);
  v175 = *(double *)v210;
  v176 = (double *)operator new(0x10uLL);
  v177 = v148 / (double)(unint64_t)(2 * v157);
  *v176 = v175;
  v176[1] = v177 + v175 * v144;
  v178 = *((double *)v211 - 2);
  v179 = operator new(0x20uLL);
  *((double *)v179 + 2) = v178;
  *((double *)v179 + 3) = v177 + v178 * v144;
  *(_OWORD *)v179 = *(_OWORD *)v176;
  operator delete(v176);
  sub_1BE6F5A88(&v191->median.__begin_, (char *)v179, (char *)v179 + 32, 2uLL);
  v180 = *(double *)v207;
  v181 = (double *)operator new(0x10uLL);
  v182 = v149 / (double)(unint64_t)(2 * v163);
  *v181 = v180;
  v181[1] = v182 + v180 * v144;
  v183 = *((double *)v208 - 2);
  v184 = operator new(0x20uLL);
  *((double *)v184 + 2) = v183;
  *((double *)v184 + 3) = v182 + v183 * v144;
  *(_OWORD *)v184 = *(_OWORD *)v181;
  operator delete(v181);
  sub_1BE6F5A88(&v191->base.__begin_, (char *)v184, (char *)v184 + 32, 2uLL);
  v185 = *(double *)v204;
  v186 = (double *)operator new(0x10uLL);
  v187 = v150 / (double)(unint64_t)(2 * v169);
  *v186 = v185;
  v186[1] = v187 + v185 * v144;
  v188 = *((double *)v205 - 2);
  v189 = operator new(0x20uLL);
  *((double *)v189 + 2) = v188;
  *((double *)v189 + 3) = v187 + v188 * v144;
  *(_OWORD *)v189 = *(_OWORD *)v186;
  operator delete(v186);
  sub_1BE6F5A88(v191, (char *)v189, (char *)v189 + 32, 2uLL);
  operator delete(v189);
  operator delete(v184);
  operator delete(v179);
  operator delete(v174);
  if (v204)
  {
    v205 = (char *)v204;
    operator delete(v204);
  }
  if (v207)
  {
    v208 = (char *)v207;
    operator delete(v207);
  }
  if (v210)
  {
    v211 = (char *)v210;
    operator delete(v210);
  }
  if (v213)
  {
    v214 = (char *)v213;
    operator delete(v213);
  }

  return result;
}

- (id)tokenDistanceSizes:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSArray *textSegments;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  double *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _BYTE *v95;
  char *v96;
  size_t v97;
  unint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  unint64_t v104;
  char *v105;
  void *v106;
  size_t v107;
  unint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  unint64_t v114;
  _BYTE *v115;
  void *v116;
  size_t v117;
  unint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  unint64_t v122;
  char *v123;
  unint64_t v124;
  char *v125;
  void *v126;
  size_t v127;
  unint64_t v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  unint64_t v132;
  char *v133;
  unint64_t v134;
  _BYTE *v135;
  void *v136;
  id v137;
  void **v139;
  void *v140;
  uint64_t v141;
  void *v142;
  void *v143[2];
  __int128 v144;
  _BYTE *v145;
  void *v146[2];
  __int128 v147;
  _BYTE *v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  void *__dst[2];
  void *v154[2];
  __int128 v155;
  void *v156[2];
  void *v157[2];
  __int128 v158;
  _BYTE v159[128];
  uint64_t v160;

  v6 = a3;
  v160 = *MEMORY[0x1E0C80C00];
  objc_msgSend_firstObject(self->_textSegments, a2, a3, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenDistanceSizes_(v8, v9, v6, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = (void *)objc_msgSend_mutableCopy(v13, v14, v15, v16, v17, v18);

  objc_msgSend_firstObject(self->_textSegments, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v24;
  if (v24)
  {
    objc_msgSend_principalLines(v24, v25, v26, v27, v28, v29);
  }
  else
  {
    *(_OWORD *)v157 = 0u;
    v158 = 0u;
    v155 = 0u;
    *(_OWORD *)v156 = 0u;
    *(_OWORD *)__dst = 0u;
    *(_OWORD *)v154 = 0u;
  }

  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  textSegments = self->_textSegments;
  v37 = objc_msgSend_count(textSegments, v32, v33, v34, v35, v36);
  objc_msgSend_subarrayWithRange_(textSegments, v38, 1, v37 - 1, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v149, (uint64_t)v159, 16, v43);
  if (v49)
  {
    v140 = v41;
    v141 = *(_QWORD *)v150;
    v139 = &v157[1];
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v150 != v141)
          objc_enumerationMutation(v41);
        v51 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * i);
        objc_msgSend_tokens(v51, v44, v45, v46, v47, v48, v139);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v52, v53, v54, v55, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend_properties(v58, v59, v60, v61, v62, v63);

        if (!v6 || (v64 & 0x20) != 0)
        {
          v70 = (double *)v154[1];
          objc_msgSend_principalLines(v51, v65, v66, v67, v68, v69);
          v76 = v70[2];
          v77 = v70[3];
          v79 = **((double **)&v144 + 1);
          v78 = *(double *)(*((_QWORD *)&v144 + 1) + 8);
          if (*((_QWORD *)&v147 + 1))
          {
            v148 = (_BYTE *)*((_QWORD *)&v147 + 1);
            operator delete(*((void **)&v147 + 1));
          }
          if (v146[0])
          {
            v146[1] = v146[0];
            operator delete(v146[0]);
          }
          if (*((_QWORD *)&v144 + 1))
          {
            v145 = (_BYTE *)*((_QWORD *)&v144 + 1);
            operator delete(*((void **)&v144 + 1));
          }
          if (v143[0])
          {
            v143[1] = v143[0];
            operator delete(v143[0]);
          }
          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v71, v72, v73, v74, v75, sqrt((v77 - v78) * (v77 - v78) + (v76 - v79) * (v76 - v79)));
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v142, v81, (uint64_t)v80, v82, v83, v84);

        }
        objc_msgSend_tokenDistanceSizes_(v51, v65, v6, v67, v68, v69);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v142, v86, (uint64_t)v85, v87, v88, v89);
        if (v51)
        {
          objc_msgSend_principalLines(v51, v90, v91, v92, v93, v94);
          v95 = v143[1];
          v96 = (char *)v143[0];
        }
        else
        {
          v95 = 0;
          v96 = 0;
          v147 = 0u;
          v148 = 0;
          v145 = 0;
          *(_OWORD *)v146 = 0u;
          *(_OWORD *)v143 = 0u;
          v144 = 0u;
        }
        v97 = v95 - v96;
        v98 = (v95 - v96) >> 4;
        v99 = (uint64_t)v154[0];
        v100 = (char *)__dst[0];
        if (v98 <= ((char *)v154[0] - (char *)__dst[0]) >> 4)
        {
          v104 = ((char *)__dst[1] - (char *)__dst[0]) >> 4;
          if (v104 >= v98)
          {
            if (v95 == v96)
              goto LABEL_43;
            v106 = __dst[0];
            v105 = v96;
            goto LABEL_42;
          }
          if (__dst[1] != __dst[0])
          {
            memmove(__dst[0], v96, (char *)__dst[1] - (char *)__dst[0]);
            v100 = (char *)__dst[1];
          }
          v105 = &v96[16 * v104];
          v97 = v95 - v105;
          if (v95 != v105)
          {
            v106 = v100;
LABEL_42:
            memmove(v106, v105, v97);
          }
        }
        else
        {
          if (__dst[0])
          {
            __dst[1] = __dst[0];
            operator delete(__dst[0]);
            v99 = 0;
            __dst[0] = 0;
            __dst[1] = 0;
            v154[0] = 0;
          }
          if ((v97 & 0x8000000000000000) != 0)
            goto LABEL_122;
          v101 = v99 >> 3;
          if (v99 >> 3 <= v98)
            v101 = (v95 - v96) >> 4;
          v102 = (unint64_t)v99 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v101;
          if (v102 >> 60)
LABEL_122:
            sub_1BE61F930();
          v103 = (char *)operator new(16 * v102);
          v100 = v103;
          __dst[0] = v103;
          __dst[1] = v103;
          v154[0] = &v103[16 * v102];
          if (v95 != v96)
            memcpy(v103, v96, v95 - v96);
        }
LABEL_43:
        __dst[1] = &v100[v97];
        v107 = (size_t)&v145[-*((_QWORD *)&v144 + 1)];
        v108 = (uint64_t)&v145[-*((_QWORD *)&v144 + 1)] >> 4;
        v109 = *((_QWORD *)&v155 + 1);
        v110 = (char *)v154[1];
        if (v108 <= (uint64_t)(*((_QWORD *)&v155 + 1) - (unint64_t)v154[1]) >> 4)
        {
          v114 = (uint64_t)(v155 - (unint64_t)v154[1]) >> 4;
          if (v114 >= v108)
          {
            if (v145 == *((_BYTE **)&v144 + 1))
              goto LABEL_63;
            v116 = v154[1];
            v115 = (_BYTE *)*((_QWORD *)&v144 + 1);
            goto LABEL_62;
          }
          if ((void *)v155 != v154[1])
          {
            memmove(v154[1], *((const void **)&v144 + 1), v155 - (unint64_t)v154[1]);
            v110 = (char *)v155;
          }
          v115 = (_BYTE *)(*((_QWORD *)&v144 + 1) + 16 * v114);
          v107 = v145 - v115;
          if (v145 != v115)
          {
            v116 = v110;
LABEL_62:
            memmove(v116, v115, v107);
          }
        }
        else
        {
          if (v154[1])
          {
            *(void **)&v155 = v154[1];
            operator delete(v154[1]);
            v109 = 0;
            v154[1] = 0;
            v155 = 0uLL;
          }
          if ((v107 & 0x8000000000000000) != 0)
            goto LABEL_122;
          v111 = v109 >> 3;
          if (v109 >> 3 <= v108)
            v111 = (uint64_t)&v145[-*((_QWORD *)&v144 + 1)] >> 4;
          v112 = (unint64_t)v109 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v111;
          if (v112 >> 60)
            goto LABEL_122;
          v113 = (char *)operator new(16 * v112);
          v110 = v113;
          v154[1] = v113;
          *(_QWORD *)&v155 = v113;
          *((_QWORD *)&v155 + 1) = &v113[16 * v112];
          if (v145 != *((_BYTE **)&v144 + 1))
            memcpy(v113, *((const void **)&v144 + 1), v107);
        }
LABEL_63:
        *(_QWORD *)&v155 = &v110[v107];
        v117 = (char *)v146[1] - (char *)v146[0];
        v118 = ((char *)v146[1] - (char *)v146[0]) >> 4;
        v119 = (uint64_t)v157[0];
        v120 = (char *)v156[0];
        if (v118 <= ((char *)v157[0] - (char *)v156[0]) >> 4)
        {
          v124 = ((char *)v156[1] - (char *)v156[0]) >> 4;
          if (v124 >= v118)
          {
            if (v146[1] == v146[0])
              goto LABEL_83;
            v126 = v156[0];
            v125 = (char *)v146[0];
            goto LABEL_82;
          }
          if (v156[1] != v156[0])
          {
            memmove(v156[0], v146[0], (char *)v156[1] - (char *)v156[0]);
            v120 = (char *)v156[1];
          }
          v125 = (char *)v146[0] + 16 * v124;
          v117 = (char *)v146[1] - (char *)v125;
          if (v146[1] != v125)
          {
            v126 = v120;
LABEL_82:
            memmove(v126, v125, v117);
          }
        }
        else
        {
          if (v156[0])
          {
            v156[1] = v156[0];
            operator delete(v156[0]);
            v119 = 0;
            v156[0] = 0;
            v156[1] = 0;
            v157[0] = 0;
          }
          if ((v117 & 0x8000000000000000) != 0)
            goto LABEL_122;
          v121 = v119 >> 3;
          if (v119 >> 3 <= v118)
            v121 = ((char *)v146[1] - (char *)v146[0]) >> 4;
          v122 = (unint64_t)v119 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v121;
          if (v122 >> 60)
            goto LABEL_122;
          v123 = (char *)operator new(16 * v122);
          v120 = v123;
          v156[0] = v123;
          v156[1] = v123;
          v157[0] = &v123[16 * v122];
          if (v146[1] != v146[0])
            memcpy(v123, v146[0], v117);
        }
LABEL_83:
        v156[1] = &v120[v117];
        v127 = (size_t)&v148[-*((_QWORD *)&v147 + 1)];
        v128 = (uint64_t)&v148[-*((_QWORD *)&v147 + 1)] >> 4;
        v129 = *((_QWORD *)&v158 + 1);
        v130 = (char *)v157[1];
        if (v128 <= (uint64_t)(*((_QWORD *)&v158 + 1) - (unint64_t)v157[1]) >> 4)
        {
          v134 = (uint64_t)(v158 - (unint64_t)v157[1]) >> 4;
          if (v134 >= v128)
          {
            if (v148 == *((_BYTE **)&v147 + 1))
              goto LABEL_103;
            v136 = v157[1];
            v135 = (_BYTE *)*((_QWORD *)&v147 + 1);
            goto LABEL_102;
          }
          if ((void *)v158 != v157[1])
          {
            memmove(v157[1], *((const void **)&v147 + 1), v158 - (unint64_t)v157[1]);
            v130 = (char *)v158;
          }
          v135 = (_BYTE *)(*((_QWORD *)&v147 + 1) + 16 * v134);
          v127 = v148 - v135;
          if (v148 != v135)
          {
            v136 = v130;
LABEL_102:
            memmove(v136, v135, v127);
          }
        }
        else
        {
          if (v157[1])
          {
            *(void **)&v158 = v157[1];
            operator delete(v157[1]);
            v129 = 0;
            *v139 = 0;
            v139[1] = 0;
            v139[2] = 0;
          }
          if ((v127 & 0x8000000000000000) != 0)
            goto LABEL_122;
          v131 = v129 >> 3;
          if (v129 >> 3 <= v128)
            v131 = (uint64_t)&v148[-*((_QWORD *)&v147 + 1)] >> 4;
          v132 = (unint64_t)v129 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v131;
          if (v132 >> 60)
            goto LABEL_122;
          v133 = (char *)operator new(16 * v132);
          v130 = v133;
          v157[1] = v133;
          *(_QWORD *)&v158 = v133;
          *((_QWORD *)&v158 + 1) = &v133[16 * v132];
          if (v148 != *((_BYTE **)&v147 + 1))
            memcpy(v133, *((const void **)&v147 + 1), v127);
        }
LABEL_103:
        v41 = v140;
        *(_QWORD *)&v158 = &v130[v127];
        if (*((_QWORD *)&v147 + 1))
        {
          v148 = (_BYTE *)*((_QWORD *)&v147 + 1);
          operator delete(*((void **)&v147 + 1));
        }
        if (v146[0])
        {
          v146[1] = v146[0];
          operator delete(v146[0]);
        }
        if (*((_QWORD *)&v144 + 1))
        {
          v145 = (_BYTE *)*((_QWORD *)&v144 + 1);
          operator delete(*((void **)&v144 + 1));
        }
        if (v143[0])
        {
          v143[1] = v143[0];
          operator delete(v143[0]);
        }

      }
      v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v140, v44, (uint64_t)&v149, (uint64_t)v159, 16, v48);
    }
    while (v49);
  }

  v137 = v142;
  if (v157[1])
  {
    *(void **)&v158 = v157[1];
    operator delete(v157[1]);
  }
  if (v156[0])
  {
    v156[1] = v156[0];
    operator delete(v156[0]);
  }
  if (v154[1])
  {
    *(void **)&v155 = v154[1];
    operator delete(v154[1]);
  }
  if (__dst[0])
  {
    __dst[1] = __dst[0];
    operator delete(__dst[0]);
  }

  return v137;
}

- (void)addTransform:(CGAffineTransform *)a3
{
  NSArray *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double *v31;
  double v32;
  double v33;
  double *v34;
  double *v35;
  void *v36;
  char *v37;
  void *v38;
  char *v39;
  void *v40;
  char *v41;
  void *__p;
  char *v43;
  _OWORD v44[3];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v5 = self->_textSegments;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v45, (uint64_t)v49, 16, v7);
  if (v12)
  {
    v13 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v46 != v13)
          objc_enumerationMutation(v5);
        v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        v16 = *(_OWORD *)&a3->c;
        v44[0] = *(_OWORD *)&a3->a;
        v17 = *(_OWORD *)&a3->tx;
        v44[1] = v16;
        v44[2] = v17;
        objc_msgSend_addTransform_(v15, v8, (uint64_t)v44, v9, v10, v11);
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v45, (uint64_t)v49, 16, v11);
    }
    while (v12);
  }

  CoreHandwriting::transformPrincipalLines((double **)&self->_principalLines, (float64x2_t *)a3, (uint64_t)&v36);
  if (&self->_principalLines != (PrincipalLines *)&v36)
  {
    sub_1BE6F5A88(&self->_principalLines.descender.__begin_, (char *)v36, v37, (v37 - (_BYTE *)v36) >> 4);
    sub_1BE6F5A88(&self->_principalLines.base.__begin_, (char *)v38, v39, (v39 - (_BYTE *)v38) >> 4);
    sub_1BE6F5A88(&self->_principalLines.median.__begin_, (char *)v40, v41, (v41 - (_BYTE *)v40) >> 4);
    sub_1BE6F5A88(&self->_principalLines.top.__begin_, (char *)__p, v43, (v43 - (_BYTE *)__p) >> 4);
  }
  objc_msgSend_points(self, v18, v19, v20, v21, v22);
  if (v34 == v35)
  {
    v23 = 1.79769313e308;
    v24 = -1.79769313e308;
    v25 = -1.79769313e308;
    v26 = 1.79769313e308;
    if (v34)
LABEL_22:
      operator delete(v34);
  }
  else
  {
    v23 = 1.79769313e308;
    v24 = -1.79769313e308;
    v25 = -1.79769313e308;
    v26 = 1.79769313e308;
    v27 = -1.79769313e308;
    v28 = 1.79769313e308;
    v29 = -1.79769313e308;
    v30 = 1.79769313e308;
    v31 = v34;
    do
    {
      v32 = *v31;
      v33 = v31[1];
      v31 += 2;
      if (v30 > v32)
      {
        v26 = v32;
        v30 = v32;
      }
      if (v29 < v32)
      {
        v25 = v32;
        v29 = v32;
      }
      if (v28 > v33)
      {
        v23 = v33;
        v28 = v33;
      }
      if (v27 < v33)
      {
        v24 = v33;
        v27 = v33;
      }
    }
    while (v31 != v35);
    if (v34)
      goto LABEL_22;
  }
  self->_boundingBox.x_min = v26;
  self->_boundingBox.x_max = v25;
  self->_boundingBox.y_min = v23;
  self->_boundingBox.y_max = v24;
  if (__p)
  {
    v43 = (char *)__p;
    operator delete(__p);
  }
  if (v40)
  {
    v41 = (char *)v40;
    operator delete(v40);
  }
  if (v38)
  {
    v39 = (char *)v38;
    operator delete(v38);
  }
  if (v36)
  {
    v37 = (char *)v36;
    operator delete(v36);
  }
}

- (vector<CGPoint,)points
{
  vector<CGPoint, std::allocator<CGPoint>> *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGPoint *end;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 *v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  CGPoint *v21;
  CGPoint *value;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  CGPoint *v31;
  CGPoint *v32;
  CGPoint *i;
  CGPoint v34;
  CGPoint *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  __int128 v40;
  CGPoint *begin;
  CGPoint *v42;
  int64_t v43;
  CGPoint *v44;
  vector<CGPoint, std::allocator<CGPoint>> *result;
  uint64_t v46;
  NSArray *obj;
  vector<CGPoint, std::allocator<CGPoint>> *v48;
  char *__p;
  _BYTE *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v3 = retstr;
  v56 = *MEMORY[0x1E0C80C00];
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = self->_textSegments;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v51, (uint64_t)v55, 16, v5);
  if (v11)
  {
    end = 0;
    v13 = *(_QWORD *)v52;
    v48 = v3;
    do
    {
      v14 = 0;
      v46 = v11;
      do
      {
        if (*(_QWORD *)v52 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v14);
        if (!v15)
        {
          __p = 0;
          v50 = 0;
LABEL_9:
          v18 = __p;
          if (__p)
            goto LABEL_50;
          goto LABEL_4;
        }
        objc_msgSend_points(v15, v6, v7, v8, v9, v10);
        v16 = (__int128 *)__p;
        v17 = v50 - __p;
        if (v50 - __p < 1)
          goto LABEL_9;
        v19 = v17 >> 4;
        v20 = (char *)end - (char *)v3->__begin_;
        v21 = (CGPoint *)((char *)v3->__begin_ + (v20 & 0xFFFFFFFFFFFFFFF0));
        value = v3->__end_cap_.__value_;
        if (v17 >> 4 <= value - end)
        {
          v29 = end - v21;
          if (v29 >= v19)
          {
            v30 = &__p[16 * v19];
            v31 = end;
          }
          else
          {
            v30 = &__p[16 * v29];
            if (v50 != v30)
              memmove(end, &__p[16 * v29], v50 - v30);
            v31 = (CGPoint *)((char *)end + v50 - v30);
            v3 = v48;
            v48->__end_ = v31;
            if ((char *)end - (char *)v21 < 1)
            {
              end = (CGPoint *)((char *)end + v50 - v30);
              v18 = __p;
              if (__p)
                goto LABEL_50;
              goto LABEL_4;
            }
          }
          v32 = &v31[-v19];
          for (i = v31; v32 < end; ++i)
          {
            v34 = *v32++;
            *i = v34;
          }
          v35 = &v21[v19];
          v3->__end_ = i;
          if (v31 != v35)
            memmove(&v31[-(v31 - v35)], v21, (char *)v31 - (char *)v35);
          v7 = v30 - __p;
          if (v30 == __p)
          {
            end = i;
            v18 = __p;
            if (!__p)
              goto LABEL_4;
LABEL_50:
            v50 = v18;
            operator delete(v18);
            goto LABEL_4;
          }
          memmove(v21, __p, v7);
          end = i;
          v18 = __p;
          if (__p)
            goto LABEL_50;
        }
        else
        {
          v23 = v13;
          v24 = v20 >> 4;
          v25 = (v20 >> 4) + v19;
          if (v25 >> 60)
            sub_1BE61F930();
          v26 = (char *)value - (char *)v3->__begin_;
          if (v26 >> 3 > v25)
            v25 = v26 >> 3;
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0)
            v27 = 0xFFFFFFFFFFFFFFFLL;
          else
            v27 = v25;
          if (v27)
          {
            if (v27 >> 60)
              sub_1BE61F100();
            v28 = (char *)operator new(16 * v27);
          }
          else
          {
            v28 = 0;
          }
          v36 = &v28[16 * v24];
          v37 = 16 * v19;
          v38 = &v36[16 * v19];
          v39 = v36;
          do
          {
            v40 = *v16++;
            *(_OWORD *)v39 = v40;
            v39 += 16;
            v37 -= 16;
          }
          while (v37);
          begin = v48->__begin_;
          if (v48->__begin_ != v21)
          {
            v42 = v21;
            do
            {
              *((CGPoint *)v36 - 1) = v42[-1];
              v36 -= 16;
              --v42;
            }
            while (v42 != begin);
            end = v48->__end_;
          }
          v43 = (char *)end - (char *)v21;
          if (end != v21)
            memmove(v38, v21, (char *)end - (char *)v21);
          v44 = v48->__begin_;
          end = (CGPoint *)&v38[v43];
          v48->__begin_ = (CGPoint *)v36;
          v48->__end_ = (CGPoint *)&v38[v43];
          v3 = v48;
          v48->__end_cap_.__value_ = (CGPoint *)&v28[16 * v27];
          if (v44)
            operator delete(v44);
          v13 = v23;
          v11 = v46;
          v18 = __p;
          if (__p)
            goto LABEL_50;
        }
LABEL_4:
        ++v14;
      }
      while (v14 != v11);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v51, (uint64_t)v55, 16, v10);
    }
    while (v11);
  }

  return result;
}

- (vector<std::vector<CGPoint>,)strokePoints
{
  NSArray *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  char **v15;
  void *v16;
  char **v17;
  uint64_t v18;
  char **v19;
  char **v20;
  char *v21;
  char *v22;
  vector<std::vector<CGPoint>, std::allocator<std::vector<CGPoint>>> *result;
  char **__p;
  char **v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v4 = self->_textSegments;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v26, (uint64_t)v30, 16, v6);
  if (v12)
  {
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v4);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (v16)
        {
          objc_msgSend_strokePoints(v16, v7, v8, v9, v10, v11);
          v17 = __p;
          v18 = (uint64_t)v25;
        }
        else
        {
          v18 = 0;
          v17 = 0;
          __p = 0;
          v25 = 0;
        }
        sub_1BE761E68((char ***)retstr, (uint64_t)retstr->__end_, v17, v18, 0xAAAAAAAAAAAAAAABLL * ((v18 - (uint64_t)v17) >> 3));
        if (__p)
        {
          v19 = v25;
          v15 = __p;
          if (v25 != __p)
          {
            v20 = v25;
            do
            {
              v22 = *(v20 - 3);
              v20 -= 3;
              v21 = v22;
              if (v22)
              {
                *(v19 - 2) = v21;
                operator delete(v21);
              }
              v19 = v20;
            }
            while (v20 != __p);
            v15 = __p;
          }
          v25 = __p;
          operator delete(v15);
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v26, (uint64_t)v30, 16, v11);
    }
    while (v12);
  }

  return result;
}

- (vector<CGPoint,)filteredPoints:(CHTransformedTextLine *)self
{
  double height;
  double width;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char *v17;
  unint64_t v18;
  CGPoint *end;
  CGPoint *v20;
  CGPoint *v21;
  CGPoint *value;
  CGPoint *begin;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  CGPoint *v30;
  vector<CGPoint, std::allocator<CGPoint>> *result;
  NSArray *obj;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  height = a4.height;
  width = a4.width;
  v42 = *MEMORY[0x1E0C80C00];
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = self->_textSegments;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v37, (uint64_t)v41, 16, v8);
  if (v14)
  {
    v34 = *(_QWORD *)v38;
    do
    {
      v15 = 0;
      v33 = v14;
      do
      {
        if (*(_QWORD *)v38 != v34)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v15);
        if (v16)
        {
          objc_msgSend_filteredPoints_(v16, v9, v10, v11, v12, v13, width, height);
          v17 = v36;
          if (v36 != v35)
          {
            v18 = 0;
            end = retstr->__end_;
            v17 = v35;
            while (1)
            {
              v21 = (CGPoint *)&v17[16 * v18];
              value = retstr->__end_cap_.__value_;
              if (end >= value)
                break;
              *end = *v21;
              v20 = end + 1;
LABEL_11:
              retstr->__end_ = v20;
              ++v18;
              v17 = v35;
              end = v20;
              if (v18 >= (v36 - v35) >> 4)
                goto LABEL_28;
            }
            begin = retstr->__begin_;
            v24 = end - retstr->__begin_;
            v25 = v24 + 1;
            if ((unint64_t)(v24 + 1) >> 60)
              sub_1BE61F930();
            v26 = (char *)value - (char *)begin;
            if (v26 >> 3 > v25)
              v25 = v26 >> 3;
            if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0)
              v27 = 0xFFFFFFFFFFFFFFFLL;
            else
              v27 = v25;
            if (v27)
            {
              if (v27 >> 60)
                sub_1BE61F100();
              v28 = (char *)operator new(16 * v27);
              v29 = (uint64_t)&v28[16 * v24];
              *(CGPoint *)v29 = *v21;
              v30 = (CGPoint *)v29;
              if (end == begin)
                goto LABEL_22;
              do
              {
LABEL_25:
                v30[-1] = end[-1];
                --v30;
                --end;
              }
              while (end != begin);
              end = retstr->__begin_;
              v20 = (CGPoint *)(v29 + 16);
              retstr->__begin_ = v30;
              retstr->__end_ = (CGPoint *)(v29 + 16);
              retstr->__end_cap_.__value_ = (CGPoint *)&v28[16 * v27];
              if (!end)
                goto LABEL_11;
            }
            else
            {
              v28 = 0;
              v29 = 16 * v24;
              *(CGPoint *)(16 * v24) = *v21;
              v30 = (CGPoint *)(16 * v24);
              if (end != begin)
                goto LABEL_25;
LABEL_22:
              v20 = (CGPoint *)(v29 + 16);
              retstr->__begin_ = v30;
              retstr->__end_ = (CGPoint *)(v29 + 16);
              retstr->__end_cap_.__value_ = (CGPoint *)&v28[16 * v27];
              if (!end)
                goto LABEL_11;
            }
            operator delete(end);
            goto LABEL_11;
          }
LABEL_28:
          v14 = v33;
          if (v17)
          {
            v36 = v17;
            operator delete(v17);
          }
        }
        ++v15;
      }
      while (v15 != v14);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v37, (uint64_t)v41, 16, v13);
    }
    while (v14);
  }

  return result;
}

- (vector<CGPoint,)clippedPoints:(CHTransformedTextLine *)self min:(SEL)a3 max:(CGSize)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double height;
  double width;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char *v23;
  unint64_t v24;
  CGPoint *end;
  CGPoint *v26;
  CGPoint *v27;
  CGPoint *value;
  CGPoint *begin;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  CGPoint *v36;
  vector<CGPoint, std::allocator<CGPoint>> *result;
  NSArray *obj;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  y = a6.y;
  x = a6.x;
  v8 = a5.y;
  v9 = a5.x;
  height = a4.height;
  width = a4.width;
  v48 = *MEMORY[0x1E0C80C00];
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = self->_textSegments;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v43, (uint64_t)v47, 16, v14);
  if (v20)
  {
    v40 = *(_QWORD *)v44;
    do
    {
      v21 = 0;
      v39 = v20;
      do
      {
        if (*(_QWORD *)v44 != v40)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v21);
        if (v22)
        {
          objc_msgSend_clippedPoints_min_max_(v22, v15, v16, v17, v18, v19, width, height, v9, v8, x, y);
          v23 = v42;
          if (v42 != v41)
          {
            v24 = 0;
            end = retstr->__end_;
            v23 = v41;
            while (1)
            {
              v27 = (CGPoint *)&v23[16 * v24];
              value = retstr->__end_cap_.__value_;
              if (end >= value)
                break;
              *end = *v27;
              v26 = end + 1;
LABEL_11:
              retstr->__end_ = v26;
              ++v24;
              v23 = v41;
              end = v26;
              if (v24 >= (v42 - v41) >> 4)
                goto LABEL_28;
            }
            begin = retstr->__begin_;
            v30 = end - retstr->__begin_;
            v31 = v30 + 1;
            if ((unint64_t)(v30 + 1) >> 60)
              sub_1BE61F930();
            v32 = (char *)value - (char *)begin;
            if (v32 >> 3 > v31)
              v31 = v32 >> 3;
            if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFF0)
              v33 = 0xFFFFFFFFFFFFFFFLL;
            else
              v33 = v31;
            if (v33)
            {
              if (v33 >> 60)
                sub_1BE61F100();
              v34 = (char *)operator new(16 * v33);
              v35 = (uint64_t)&v34[16 * v30];
              *(CGPoint *)v35 = *v27;
              v36 = (CGPoint *)v35;
              if (end == begin)
                goto LABEL_22;
              do
              {
LABEL_25:
                v36[-1] = end[-1];
                --v36;
                --end;
              }
              while (end != begin);
              end = retstr->__begin_;
              v26 = (CGPoint *)(v35 + 16);
              retstr->__begin_ = v36;
              retstr->__end_ = (CGPoint *)(v35 + 16);
              retstr->__end_cap_.__value_ = (CGPoint *)&v34[16 * v33];
              if (!end)
                goto LABEL_11;
            }
            else
            {
              v34 = 0;
              v35 = 16 * v30;
              *(CGPoint *)(16 * v30) = *v27;
              v36 = (CGPoint *)(16 * v30);
              if (end != begin)
                goto LABEL_25;
LABEL_22:
              v26 = (CGPoint *)(v35 + 16);
              retstr->__begin_ = v36;
              retstr->__end_ = (CGPoint *)(v35 + 16);
              retstr->__end_cap_.__value_ = (CGPoint *)&v34[16 * v33];
              if (!end)
                goto LABEL_11;
            }
            operator delete(end);
            goto LABEL_11;
          }
LABEL_28:
          v20 = v39;
          if (v23)
          {
            v42 = v23;
            operator delete(v23);
          }
        }
        ++v21;
      }
      while (v21 != v20);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v43, (uint64_t)v47, 16, v19);
    }
    while (v20);
  }

  return result;
}

- (BoundingBox)boundingBox
{
  CHTransformedTextLine *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double *p_x_min;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  double x_max;
  double y_min;
  double y_max;
  double *v24;
  double *v25;
  BoundingBox result;

  v2 = self;
  objc_sync_enter(v2);
  p_x_min = &v2->_boundingBox.x_min;
  if (v2->_boundingBox.x_max - v2->_boundingBox.x_min == 0.0)
  {
    objc_msgSend_points(v2, v3, v4, v5, v6, v7);
    if (v24 == v25)
    {
      v9 = 1.79769313e308;
      v10 = -1.79769313e308;
      v11 = -1.79769313e308;
      v12 = 1.79769313e308;
      if (!v24)
        goto LABEL_15;
    }
    else
    {
      v9 = 1.79769313e308;
      v10 = -1.79769313e308;
      v11 = -1.79769313e308;
      v12 = 1.79769313e308;
      v13 = -1.79769313e308;
      v14 = 1.79769313e308;
      v15 = -1.79769313e308;
      v16 = 1.79769313e308;
      v17 = v24;
      do
      {
        v18 = *v17;
        v19 = v17[1];
        v17 += 2;
        if (v16 > v18)
        {
          v12 = v18;
          v16 = v18;
        }
        if (v15 < v18)
        {
          v11 = v18;
          v15 = v18;
        }
        if (v14 > v19)
        {
          v9 = v19;
          v14 = v19;
        }
        if (v13 < v19)
        {
          v10 = v19;
          v13 = v19;
        }
      }
      while (v17 != v25);
      if (!v24)
        goto LABEL_15;
    }
    operator delete(v24);
LABEL_15:
    *p_x_min = v12;
    v2->_boundingBox.x_max = v11;
    v2->_boundingBox.y_min = v9;
    v2->_boundingBox.y_max = v10;
  }
  objc_sync_exit(v2);

  v20 = *p_x_min;
  x_max = v2->_boundingBox.x_max;
  y_min = v2->_boundingBox.y_min;
  y_max = v2->_boundingBox.y_max;
  result.y_max = y_max;
  result.y_min = y_min;
  result.x_max = x_max;
  result.x_min = v20;
  return result;
}

- (PrincipalLines)principalLines
{
  return (PrincipalLines *)sub_1BE76136C(retstr, (uint64_t)&self->_principalLines);
}

- (int64_t)strokeClassification
{
  return self->_strokeClassification;
}

- (id)textStrokes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  NSArray *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_textSegments;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v25, (uint64_t)v29, 16, v10);
  if (v16)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v8);
        objc_msgSend_textStrokes(*(void **)(*((_QWORD *)&v25 + 1) + 8 * v18), v11, v12, v13, v14, v15, (_QWORD)v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v7, v20, (uint64_t)v19, v21, v22, v23);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v25, (uint64_t)v29, 16, v15);
    }
    while (v16);
  }

  return v7;
}

- (id)tokens
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  NSArray *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_textSegments;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v25, (uint64_t)v29, 16, v10);
  if (v16)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v8);
        objc_msgSend_tokens(*(void **)(*((_QWORD *)&v25 + 1) + 8 * v18), v11, v12, v13, v14, v15, (_QWORD)v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v7, v20, (uint64_t)v19, v21, v22, v23);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v25, (uint64_t)v29, 16, v15);
    }
    while (v16);
  }

  return v7;
}

- (id)locale
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  if (!objc_msgSend_count(self->_textSegments, a2, v2, v3, v4, v5))
    return 0;
  objc_msgSend_objectAtIndexedSubscript_(self->_textSegments, v7, 0, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_locale(v11, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSArray)textSegments
{
  return (NSArray *)objc_getProperty(self, a2, 424, 1);
}

- (BOOL)fromCachedTokens
{
  return self->_fromCachedTokens;
}

- (void)setFromCachedTokens:(BOOL)a3
{
  self->_fromCachedTokens = a3;
}

- (void).cxx_destruct
{
  PrincipalLines *p_principalLines;
  CGPoint *begin;
  CGPoint *v5;
  CGPoint *v6;
  CGPoint *v7;

  objc_storeStrong((id *)&self->_textSegments, 0);
  p_principalLines = &self->_principalLines;
  begin = p_principalLines->top.__begin_;
  if (begin)
  {
    p_principalLines->top.__end_ = begin;
    operator delete(begin);
  }
  v5 = p_principalLines->median.__begin_;
  if (v5)
  {
    p_principalLines->median.__end_ = v5;
    operator delete(v5);
  }
  v6 = p_principalLines->base.__begin_;
  if (v6)
  {
    p_principalLines->base.__end_ = v6;
    operator delete(v6);
  }
  v7 = p_principalLines->descender.__begin_;
  if (p_principalLines->descender.__begin_)
  {
    p_principalLines->descender.__end_ = v7;
    operator delete(v7);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = xmmword_1BE8D68A0;
  *(_OWORD *)((char *)self + 392) = xmmword_1BE8D68A0;
  return self;
}

@end
