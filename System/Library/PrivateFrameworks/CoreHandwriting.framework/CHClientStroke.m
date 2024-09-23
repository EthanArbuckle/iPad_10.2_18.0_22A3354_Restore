@implementation CHClientStroke

- (CHClientStroke)initWithArray:(id)a3 channels:(id)a4 withTimeOffset:(double)a5 type:(int64_t)a6
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  size_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  uint64_t i;
  double *v114;
  void *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  float v129;
  float v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  float v141;
  float v142;
  double v143;
  double v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  float v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  float v158;
  double v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  float v166;
  CHClientStroke *v167;
  const char *v168;
  uint64_t v169;
  CHClientStroke *v170;
  void *v172;
  id obj;
  unint64_t v176;
  unint64_t v177;
  uint64_t v178;
  int v179;
  int v180;
  char *v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  _BYTE v186[128];
  uint64_t v187;

  v187 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v14 = v9;
    objc_msgSend_valueForKey_(v9, v10, (uint64_t)CFSTR("x"), v11, v12, v13);
  }
  else
  {
    v14 = &unk_1E7827268;
    objc_msgSend_valueForKey_(&unk_1E7827268, v10, (uint64_t)CFSTR("x"), v11, v12, v13);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_intValue(v15, v16, v17, v18, v19, v20);

  objc_msgSend_valueForKey_(v14, v22, (uint64_t)CFSTR("y"), v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_intValue(v26, v27, v28, v29, v30, v31);

  objc_msgSend_valueForKey_(v14, v33, (uint64_t)CFSTR("t"), v34, v35, v36);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    objc_msgSend_valueForKey_(v14, v37, (uint64_t)CFSTR("t"), v38, v39, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = objc_msgSend_intValue(v42, v43, v44, v45, v46, v47);
    v177 = v180;

  }
  else
  {
    v180 = -1;
    v177 = -1;
  }

  objc_msgSend_valueForKey_(v14, v48, (uint64_t)CFSTR("azimuth"), v49, v50, v51);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (v56)
  {
    objc_msgSend_valueForKey_(v14, v52, (uint64_t)CFSTR("azimuth"), v53, v54, v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = objc_msgSend_intValue(v57, v58, v59, v60, v61, v62);
    v176 = v179;

  }
  else
  {
    v179 = -1;
    v176 = -1;
  }

  objc_msgSend_valueForKey_(v14, v63, (uint64_t)CFSTR("altitude"), v64, v65, v66);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    objc_msgSend_valueForKey_(v14, v67, (uint64_t)CFSTR("altitude"), v68, v69, v70);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = (int)objc_msgSend_intValue(v72, v73, v74, v75, v76, v77);

  }
  else
  {
    v78 = -1;
  }

  objc_msgSend_valueForKey_(v14, v79, (uint64_t)CFSTR("force"), v80, v81, v82);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = v14;
  if (v87)
  {
    objc_msgSend_valueForKey_(v14, v83, (uint64_t)CFSTR("force"), v84, v85, v86, v14);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = (int)objc_msgSend_intValue(v88, v89, v90, v91, v92, v93);

  }
  else
  {
    v94 = -1;
  }

  v100 = objc_msgSend_count(v8, v95, v96, v97, v98, v99);
  v181 = (char *)malloc_type_calloc(v100, 0x30uLL, 0x1000040EED21634uLL);
  v182 = 0u;
  v183 = 0u;
  v184 = 0u;
  v185 = 0u;
  obj = v8;
  v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v101, (uint64_t)&v182, (uint64_t)v186, 16, v102);
  if (v103)
  {
    v109 = v103;
    v110 = 0;
    v178 = v21;
    v111 = *(_QWORD *)v183;
    v112 = 0.0;
    do
    {
      for (i = 0; i != v109; ++i)
      {
        if (*(_QWORD *)v183 != v111)
          objc_enumerationMutation(obj);
        v115 = *(void **)(*((_QWORD *)&v182 + 1) + 8 * i);
        if (objc_msgSend_count(v115, v104, v105, v106, v107, v108, v172))
        {
          if ((v180 & 0x80000000) == 0 && objc_msgSend_count(v115, v104, v105, v106, v107, v108) > v177)
          {
            objc_msgSend_objectAtIndex_(v115, v104, v177, v106, v107, v108);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_doubleValue(v116, v117, v118, v119, v120, v121);
            v112 = v122;

          }
          objc_msgSend_objectAtIndex_(v115, v104, v178, v106, v107, v108);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_floatValue(v123, v124, v125, v126, v127, v128);
          v130 = v129;
          objc_msgSend_objectAtIndex_(v115, v131, v32, v132, v133, v134);
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_floatValue(v135, v136, v137, v138, v139, v140);
          v142 = v141;

          v143 = 0.0;
          v144 = 0.0;
          if ((v179 & 0x80000000) == 0 && objc_msgSend_count(v115, v104, v105, v106, v107, v108) > v176)
          {
            objc_msgSend_objectAtIndex_(v115, v104, v176, v106, v107, v108);
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_floatValue(v145, v146, v147, v148, v149, v150);
            v144 = v151;

          }
          if ((v78 & 0x8000000000000000) == 0 && objc_msgSend_count(v115, v104, v105, v106, v107, v108) > v78)
          {
            objc_msgSend_objectAtIndex_(v115, v104, v78, v106, v107, v108);
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_floatValue(v152, v153, v154, v155, v156, v157);
            v143 = v158;

          }
          v159 = 0.0;
          if ((v94 & 0x8000000000000000) == 0 && objc_msgSend_count(v115, v104, v105, v106, v107, v108) > v94)
          {
            objc_msgSend_objectAtIndex_(v115, v104, v94, v106, v107, v108);
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_floatValue(v160, v161, v162, v163, v164, v165);
            v159 = v166;

          }
          v114 = (double *)&v181[48 * v110];
          *v114 = v130;
          v114[1] = v142;
          v114[2] = v112 + a5;
          v114[3] = v144;
          v114[4] = v143;
          v114[5] = v159;
          ++v110;
          v112 = v112 + 0.00416666667;
        }
      }
      v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v104, (uint64_t)&v182, (uint64_t)v186, 16, v108);
    }
    while (v109);
  }
  else
  {
    v110 = 0;
  }

  v167 = [CHClientStroke alloc];
  v170 = (CHClientStroke *)objc_msgSend_initWithAllPoints_pointCount_type_(v167, v168, (uint64_t)v181, v110, a6, v169);
  free(v181);

  return v170;
}

- (CHClientStroke)initWithAllPoints:(CHClientStrokePoint *)a3 pointCount:(int64_t)a4 type:(int64_t)a5
{
  char *v9;
  CHClientStroke *v10;
  __int128 v11;
  void *v12;
  NSObject *v13;
  CHClientStroke *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[4];
  CHClientStroke *v20;
  objc_super v21;

  if (qword_1EF567FA8 != -1)
    dispatch_once(&qword_1EF567FA8, &unk_1E77F14F0);
  v21.receiver = self;
  v21.super_class = (Class)CHClientStroke;
  v9 = -[CHClientStroke init](&v21, sel_init);
  v10 = (CHClientStroke *)v9;
  if (v9)
  {
    v11 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v9 + 88) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v9 + 104) = v11;
    *((_QWORD *)v9 + 6) = a5;
    *((_QWORD *)v9 + 7) = 1;
    v12 = (void *)*((_QWORD *)v9 + 10);
    *((_QWORD *)v9 + 10) = 0;

    v10->_isFinished = 1;
    v13 = qword_1EF567FB0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BE67379C;
    block[3] = &unk_1E77F29A0;
    v14 = v10;
    v20 = v14;
    dispatch_sync(v13, block);
    objc_msgSend_addAllPoints_count_(v14, v15, (uint64_t)a3, a4, v16, v17);

  }
  return v10;
}

- (NSString)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CHClientStroke;
  -[CHClientStroke description](&v22, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIdentifier(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_pointsCount(self, v10, v11, v12, v13, v14);
  objc_msgSend_stringByAppendingFormat_(v3, v16, (uint64_t)CFSTR(" Identifier: %@, Points: %ld"), v17, v18, v19, v9, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v20;
}

- (void)dealloc
{
  CHClientStrokePoint *points;
  objc_super v4;

  points = self->_points;
  if (points)
    free(points);
  v4.receiver = self;
  v4.super_class = (Class)CHClientStroke;
  -[CHClientStroke dealloc](&v4, sel_dealloc);
}

+ (int64_t)strokeIdentifierOffset
{
  return qword_1EF568C28;
}

+ (void)setStrokeIdentifierOffset:(int64_t)a3
{
  qword_1EF568C28 = a3;
}

+ (id)strokesFromDrawing:(id)a3 classification:(int64_t)a4
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  CHClientStroke *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  double v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int64_t v71;
  _QWORD v72[3];

  v71 = a4;
  v72[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_strokeCount(v4, v11, v12, v13, v14, v15))
  {
    v21 = 0;
    do
    {
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v16, v17, v18, v19, v20, v71);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_pointCountForStrokeIndex_(v4, v36, v21, v37, v38, v39))
      {
        v43 = 0;
        do
        {
          objc_msgSend_pointForStrokeIndex_pointIndex_(v4, v40, v21, v43, v41, v42);
          v45 = v44;
          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v46, v47, v48, v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v72[0] = v51;
          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v52, v53, v54, v55, v56, v45);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v72[1] = v57;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v58, (uint64_t)v72, 2, v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v35, v62, (uint64_t)v61, v63, v64, v65);

          ++v43;
        }
        while (v43 < objc_msgSend_pointCountForStrokeIndex_(v4, v66, v21, v67, v68, v69));
      }
      v22 = [CHClientStroke alloc];
      v25 = (void *)objc_msgSend_initWithArray_channels_withTimeOffset_type_(v22, v23, (uint64_t)v35, 0, v71, v24, 0.0);
      objc_msgSend_addObject_(v10, v26, (uint64_t)v25, v27, v28, v29);

      ++v21;
    }
    while (v21 < objc_msgSend_strokeCount(v4, v30, v31, v32, v33, v34));
  }

  return v10;
}

- (CHClientStrokePoint)pointAtIndex:(SEL)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CHClientStrokePoint *result;
  CHClientStrokePoint *v10;
  __int128 v11;

  *(_OWORD *)&retstr->var1 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  retstr->var0 = 0u;
  result = (CHClientStrokePoint *)objc_msgSend_points(self, a3, a4, v4, v5, v6);
  v10 = &result[a4];
  v11 = *(_OWORD *)&v10->var1;
  retstr->var0 = v10->var0;
  *(_OWORD *)&retstr->var1 = v11;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&v10->var3;
  return result;
}

- (void)addAllPoints:(CHClientStrokePoint *)a3 count:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  __int128 v11;
  _OWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  if (a4 >= 1)
  {
    v13 = v6;
    v14 = v7;
    v8 = a4;
    do
    {
      v11 = *(_OWORD *)&a3->var1;
      v12[0] = a3->var0;
      v12[1] = v11;
      v12[2] = *(_OWORD *)&a3->var3;
      objc_msgSend_addPoint_(self, a2, (uint64_t)v12, a4, v4, v5);
      ++a3;
      --v8;
    }
    while (v8);
  }
}

- (void)addPoint:(CHClientStrokePoint *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t pointsCount;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CGRect v31;

  objc_msgSend_boundingBox(self, a2, (uint64_t)a3, v3, v4, v5);
  if (CGRectIsNull(v31))
    v13 = 16;
  else
    v13 = 24;
  *(Class *)((char *)&self->super.isa + v13) = *(Class *)&a3->var1;
  objc_msgSend__expandPointsArrayIfNeeded(self, v8, v9, v10, v11, v12);
  pointsCount = self->_pointsCount;
  objc_msgSend_setPointsCount_(self, v15, pointsCount + 1, v16, v17, v18);
  v24 = objc_msgSend_points(self, v19, v20, v21, v22, v23) + 48 * pointsCount;
  v26 = *(_OWORD *)&a3->var1;
  v25 = *(_OWORD *)&a3->var3;
  *(CGPoint *)v24 = a3->var0;
  *(_OWORD *)(v24 + 16) = v26;
  *(_OWORD *)(v24 + 32) = v25;
  MEMORY[0x1E0DE7D20](self, sel_setBoundingBox_, v27, v28, v29, v30);
}

- (void)_expandPointsArrayIfNeeded
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
  unint64_t v12;
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
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  size_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CHClientStroke *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  if (!objc_msgSend_points(self, a2, v2, v3, v4, v5))
  {
    objc_msgSend_setPointsCapacity_(self, v7, 200, v9, v10, v11);
    v28 = objc_msgSend_pointsCapacity(self, v23, v24, v25, v26, v27);
    v29 = malloc_type_calloc(v28, 0x30uLL, 0x1000040EED21634uLL);
    v33 = self;
_objc_msgSend$setPoints_:
    MEMORY[0x1E0DE7D20](v33, sel_setPoints_, v29, v30, v31, v32);
    return;
  }
  v12 = objc_msgSend_pointsCount(self, v7, v8, v9, v10, v11);
  if (v12 >= objc_msgSend_pointsCapacity(self, v13, v14, v15, v16, v17))
  {
    v34 = objc_msgSend_pointsCapacity(self, v18, v19, v20, v21, v22);
    objc_msgSend_setPointsCapacity_(self, v35, v34 + 200, v36, v37, v38);
    v44 = (void *)objc_msgSend_points(self, v39, v40, v41, v42, v43);
    v50 = objc_msgSend_pointsCapacity(self, v45, v46, v47, v48, v49);
    v29 = malloc_type_realloc(v44, 48 * v50, 0x1000040EED21634uLL);
    v33 = self;
    goto _objc_msgSend$setPoints_;
  }
}

- (CHStrokeIdentifier)strokeIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (CHStrokeIdentifier *)objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, self->_identifier, v2, v3, v4);
}

- (CHEncodedStrokeIdentifier)encodedStrokeIdentifier
{
  CHEncodedStrokeIdentifier *encodedStrokeIdentifier;
  CHEncodedStrokeIdentifier *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CHEncodedStrokeIdentifier *v19;
  CHEncodedStrokeIdentifier *v20;

  encodedStrokeIdentifier = self->_encodedStrokeIdentifier;
  if (!encodedStrokeIdentifier)
  {
    v4 = [CHEncodedStrokeIdentifier alloc];
    v5 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend_strokeIdentifier(self, v6, v7, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v5, v12, (uint64_t)v11, 1, 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (CHEncodedStrokeIdentifier *)objc_msgSend_initWithData_(v4, v15, (uint64_t)v14, v16, v17, v18);
    v20 = self->_encodedStrokeIdentifier;
    self->_encodedStrokeIdentifier = v19;

    encodedStrokeIdentifier = self->_encodedStrokeIdentifier;
  }
  return encodedStrokeIdentifier;
}

- (void)enumeratePointsWithTimestep:(double)a3 usingBlock:(id)a4
{
  void (**v6)(id, _BYTE *, double, double, double);
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  double v23;
  double v24;
  double v25;
  char v26;

  v6 = (void (**)(id, _BYTE *, double, double, double))a4;
  v12 = objc_msgSend_pointsCount(self, v7, v8, v9, v10, v11);
  if (v12 >= 1)
  {
    v17 = v12;
    v26 = 0;
    objc_msgSend_pointAtIndex_(self, v13, 0, v14, v15, v16);
    v6[2](v6, &v26, 0.0, 0.0, 0.0);
    if (v17 != 1 && !v26)
    {
      for (i = 1; i != v17; ++i)
      {
        v26 = 0;
        if (i == v17 - 1 || i == i / (uint64_t)(a3 / 0.00416666667) * (uint64_t)(a3 / 0.00416666667))
        {
          objc_msgSend_pointAtIndex_(self, v18, i, v19, v20, v21, 0, 0, 0, 0, 0, 0);
          v6[2](v6, &v26, v23, v24, v25);
          if (v26)
            break;
        }
      }
    }
  }

}

- (double)_strokePathLength
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t i;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float32x2_t v19;

  v7 = objc_msgSend_pointsCount(self, a2, v2, v3, v4, v5);
  v12 = 0.0;
  if (v7 >= 2)
  {
    v13 = v7;
    for (i = 1; i != v13; ++i)
    {
      objc_msgSend_pointAtIndex_(self, v8, i - 1, v9, v10, v11);
      objc_msgSend_pointAtIndex_(self, v15, i, v16, v17, v18);
      v19 = vsub_f32(vcvt_f32_f64((float64x2_t)0), vcvt_f32_f64((float64x2_t)0));
      v12 = v12 + sqrtf(vaddv_f32(vmul_f32(v19, v19)));
    }
  }
  return v12;
}

- (void)enumeratePointsWithDistanceStep:(double)a3 usingBlock:(id)a4
{
  _QWORD *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __n128 v28;
  double v29;
  int v30;
  double v31;
  uint64_t i;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  float32x2_t v37;
  float32x2_t v38;
  float32x2_t v39;
  double v40;
  _BOOL4 v41;
  double v42;
  double v43;
  float v44;
  float64x2_t v45;
  float32x2_t v46;
  float v47;
  __n128 v49;
  unsigned __int8 v50;

  v6 = a4;
  v12 = objc_msgSend_pointsCount(self, v7, v8, v9, v10, v11);
  v50 = 0;
  objc_msgSend__strokePathLength(self, v13, v14, v15, v16, v17);
  v19 = v18;
  objc_msgSend_pointAtIndex_(self, v20, 0, v21, v22, v23);
  v28 = ((__n128 (*)(_QWORD *, unsigned __int8 *, double, double, double))v6[2])(v6, &v50, 0.0, 0.0, 0.0);
  v29 = 0.0;
  v28.n128_u64[0] = 0;
  v49 = v28;
  v30 = v50;
  if (!v50 && v19 >= a3 && v12 >= 2)
  {
    v31 = 0.0;
    for (i = 1; i != v12; ++i)
    {
      objc_msgSend_pointAtIndex_(self, v24, i - 1, v25, v26, v27, *(_OWORD *)&v49);
      objc_msgSend_pointAtIndex_(self, v33, i, v34, v35, v36);
      v37 = vcvt_f32_f64((float64x2_t)0);
      v38 = v37;
      v39 = vsub_f32(v37, v37);
      v40 = sqrtf(vaddv_f32(vmul_f32(v39, v39)));
      v31 = v31 + v40;
      v30 = v50;
      v41 = v50 == 0;
      if (!v50 && v31 >= a3)
      {
        v42 = 0.0;
        do
        {
          v43 = (v40 - (v31 - a3)) / v40;
          v44 = v43;
          v37 = vmla_n_f32(v37, vsub_f32(v38, v37), v44);
          v45 = vcvtq_f64_f32(v37);
          v42 = v42 + v43 * (0.0 - v42);
          v29 = v45.f64[1];
          v49 = (__n128)v45;
          ((void (*)(_QWORD *, unsigned __int8 *))v6[2])(v6, &v50);
          v46 = vsub_f32(v37, v38);
          v47 = sqrtf(vaddv_f32(vmul_f32(v46, v46)));
          v31 = v47;
          v30 = v50;
          v41 = v50 == 0;
          if (v50)
            break;
          v40 = v47;
        }
        while (v31 >= a3);
      }
      if (!v41)
        break;
    }
  }
  if (!v30 && v12 >= 2)
  {
    objc_msgSend_pointAtIndex_(self, v24, v12 - 1, v25, v26, v27);
    if (v49.n128_f64[0] != 0.0 || v29 != 0.0)
      ((void (*)(_QWORD *, unsigned __int8 *))v6[2])(v6, &v50);
  }

}

- (unint64_t)hash
{
  return (unint64_t)((self->_startTimestamp - (double)(unint64_t)self->_startTimestamp) * 1000.0)
       + ((unint64_t)((self->_endTimestamp - (double)(unint64_t)self->_endTimestamp) * 1000.0) << 10);
}

- (id)newStrokeWithTransformation:(id)a3
{
  double (**v4)(_QWORD, double, double);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  CHClientStrokePoint *v14;
  double var3;
  double var4;
  double v17;
  char *v18;
  uint64_t v19;
  CHClientStroke *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  __int128 v25;

  v4 = (double (**)(_QWORD, double, double))a3;
  v10 = objc_msgSend_pointsCount(self, v5, v6, v7, v8, v9);
  v11 = (char *)malloc_type_calloc(v10, 0x30uLL, 0x1000040EED21634uLL);
  if (self->_pointsCount)
  {
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = &self->_points[v12];
      v25 = *(_OWORD *)&v14->var1;
      var3 = v14->var3;
      var4 = v14->var4;
      v17 = v4[2](v4, v14->var0.x, v14->var0.y);
      v18 = &v11[v12 * 48];
      *(double *)v18 = v17;
      *((_QWORD *)v18 + 1) = v19;
      *((_OWORD *)v18 + 1) = v25;
      *((double *)v18 + 4) = var3;
      *((double *)v18 + 5) = var4;
      ++v13;
      ++v12;
    }
    while (v13 < self->_pointsCount);
  }
  v20 = [CHClientStroke alloc];
  v23 = (void *)objc_msgSend_initWithAllPoints_pointCount_type_(v20, v21, (uint64_t)v11, self->_pointsCount, self->_type, v22);
  free(v11);

  return v23;
}

- (id)newStrokeWithoutTransformation
{
  CHClientStroke *v3;
  const char *v4;
  uint64_t v5;

  v3 = [CHClientStroke alloc];
  return (id)objc_msgSend_initWithAllPoints_pointCount_type_(v3, v4, (uint64_t)self->_points, self->_pointsCount, self->_type, v5);
}

- (double)startTimestamp
{
  return self->_startTimestamp;
}

- (double)endTimestamp
{
  return self->_endTimestamp;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (unint64_t)pointsCount
{
  return self->_pointsCount;
}

- (void)setPointsCount:(unint64_t)a3
{
  self->_pointsCount = a3;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBox = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)strokeAttributes
{
  return self->_strokeAttributes;
}

- (void)setStrokeAttributes:(unint64_t)a3
{
  self->_strokeAttributes = a3;
}

- (CHClientStrokePoint)points
{
  return self->_points;
}

- (void)setPoints:(CHClientStrokePoint *)a3
{
  self->_points = a3;
}

- (unint64_t)pointsCapacity
{
  return self->_pointsCapacity;
}

- (void)setPointsCapacity:(unint64_t)a3
{
  self->_pointsCapacity = a3;
}

- (void)setEncodedStrokeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_encodedStrokeIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encodedStrokeIdentifier, 0);
}

@end
