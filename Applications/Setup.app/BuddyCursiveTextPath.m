@implementation BuddyCursiveTextPath

- (BuddyCursiveTextPath)initWithURL:(id)a3
{
  id v3;
  BuddyCursiveTextPath *v4;
  id location[2];
  id v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v7;
  v7 = 0;
  v7 = objc_msgSend(v3, "initWithURL:resolution:", location[0], 40);
  v4 = (BuddyCursiveTextPath *)v7;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v7, 0);
  return v4;
}

- (BuddyCursiveTextPath)initWithURL:(id)a3 resolution:(int64_t)a4
{
  id v5;
  id v6;
  id v7;
  float v8;
  id v9;
  float v10;
  id v11;
  float v12;
  id v13;
  id v14;
  unsigned int v15;
  unsigned int v16;
  id v17;
  unsigned int v18;
  unsigned int v19;
  id v20;
  unsigned int v21;
  unsigned int v22;
  id v23;
  unsigned int v24;
  id v25;
  id v26;
  uint64_t v27;
  unint64_t i;
  id v29;
  id v30;
  uint64_t v31;
  unint64_t j;
  _OWORD *v33;
  float v34;
  float v35;
  float32x4_t v37;
  __int128 v38;
  __int128 v39;
  const CGPath *path;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  uint64_t v46[3];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  id v52;
  float32x4_t v53;
  id obj;
  id v55;
  id v56;
  int v57;
  id v58;
  objc_super v59;
  int64_t v60;
  id location[2];
  id v62;
  BuddyCursiveTextPath *v63;
  int v64;
  id v65;
  float32x4_t v66;
  int v67;
  int v68;
  float v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  float32x4_t v78;
  unsigned int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  int v83;
  float v84;
  int v85;
  float v86;
  int v87;
  float v88;
  int v89;
  float v90;
  _BYTE v91[128];
  _BYTE v92[128];
  CGRect PathBoundingBox;

  v62 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v60 = a4;
  v5 = v62;
  v62 = 0;
  v59.receiver = v5;
  v59.super_class = (Class)BuddyCursiveTextPath;
  v62 = -[BuddyCursiveTextPath init](&v59, "init");
  objc_storeStrong(&v62, v62);
  if (!v62)
    goto LABEL_27;
  *((_QWORD *)v62 + 1) = 0x3FE4CCCCC0000000;
  *((_QWORD *)v62 + 2) = 0x3FF0000000000000;
  *((_QWORD *)v62 + 3) = 0x3FD0000000000000;
  v58 = +[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", location[0]);
  if (v58)
  {
    v56 = 0;
    obj = 0;
    v6 = +[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v58, 0, 0, &obj);
    objc_storeStrong(&v56, obj);
    v55 = v6;
    if (v6)
    {
      v7 = objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("unitsPerEm"));
      objc_msgSend(v7, "floatValue");
      *((double *)v62 + 10) = v8;

      v9 = objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("ascender"));
      objc_msgSend(v9, "floatValue");
      *((double *)v62 + 11) = v10;

      v11 = objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("descender"));
      objc_msgSend(v11, "floatValue");
      *((double *)v62 + 12) = v12;

      v53 = 0uLL;
      v13 = objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("scale"));
      v65 = 0;
      objc_storeStrong(&v65, v13);
      if (v65 && objc_msgSend(v65, "count") == (id)4)
      {
        v14 = objc_msgSend(v65, "objectAtIndexedSubscript:", 0);
        objc_msgSend(v14, "floatValue");
        v16 = v15;
        v17 = objc_msgSend(v65, "objectAtIndexedSubscript:", 1);
        objc_msgSend(v17, "floatValue");
        v19 = v18;
        v20 = objc_msgSend(v65, "objectAtIndexedSubscript:", 2);
        objc_msgSend(v20, "floatValue");
        v22 = v21;
        v23 = objc_msgSend(v65, "objectAtIndexedSubscript:", 3);
        objc_msgSend(v23, "floatValue");
        v82 = v16;
        v81 = v19;
        v80 = v22;
        v79 = v24;
        v78.i64[0] = __PAIR64__(v19, v16);
        v78.i64[1] = __PAIR64__(v24, v22);
        v66 = v78;

        v64 = 1;
      }
      else
      {
        v77 = 0;
        v76 = 0;
        v75 = 0;
        v74 = 0;
        v70 = 0;
        v71 = 0;
        v72 = 0;
        v73 = 0;
        v66 = 0u;
        v64 = 1;
      }
      objc_storeStrong(&v65, 0);
      v37 = v66;

      v53 = v37;
      v52 = objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("strokes"));
      sub_10017D31C((uint64_t *)v62 + 13, (unint64_t)objc_msgSend(v52, "count"));
      v50 = 0u;
      v49 = 0u;
      v48 = 0u;
      v47 = 0u;
      v25 = v52;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v92, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i < (unint64_t)v26; ++i)
          {
            if (*(_QWORD *)v48 != v27)
              objc_enumerationMutation(v25);
            v51 = *(id *)(*((_QWORD *)&v47 + 1) + 8 * i);
            sub_10017D3E4(v46);
            sub_10017D418(v46, (unint64_t)objc_msgSend(v51, "count"));
            v44 = 0u;
            v43 = 0u;
            v42 = 0u;
            v41 = 0u;
            v29 = v51;
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v91, 16);
            if (v30)
            {
              v31 = *(_QWORD *)v42;
              do
              {
                for (j = 0; j < (unint64_t)v30; ++j)
                {
                  if (*(_QWORD *)v42 != v31)
                    objc_enumerationMutation(v29);
                  v45 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                  sub_10017D4E0(v46, &v45, &v53);
                }
                v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v91, 16);
              }
              while (v30);
            }

            sub_10017D56C((uint64_t *)v62 + 13, v46);
            sub_10017D5EC(v46);
          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v92, 16);
        }
        while (v26);
      }

      *((_QWORD *)v62 + 16) = v60;
      path = (const CGPath *)objc_msgSend(v62, "pathForFraction:calculateLength:", 1, 0.0);
      PathBoundingBox = CGPathGetPathBoundingBox(path);
      *(CGFloat *)&v38 = PathBoundingBox.origin.x;
      *((_QWORD *)&v38 + 1) = *(_QWORD *)&PathBoundingBox.origin.y;
      *(CGFloat *)&v39 = PathBoundingBox.size.width;
      *((_QWORD *)&v39 + 1) = *(_QWORD *)&PathBoundingBox.size.height;
      v33 = v62;
      *((_OWORD *)v62 + 4) = v39;
      v33[3] = v38;
      CGPathRelease(path);
      *((double *)v62 + 5) = *((double *)v62 + 4) / 300.0;
      v34 = *((double *)v62 + 5);
      v69 = v34;
      v68 = 0;
      v67 = 1092616192;
      v86 = v34;
      v85 = 0;
      v90 = v34;
      v89 = 0;
      v84 = fmaxf(v34, 0.0);
      v83 = 1092616192;
      v88 = v84;
      v87 = 1092616192;
      v35 = sub_10017D630((float)(fminf(v84, 10.0) / 10.0) - 1.0);
      *((double *)v62 + 5) = (float)((float)(v35 + 1.0) * 5.0);
      objc_storeStrong(&v52, 0);
      v57 = 0;
    }
    else
    {
      v63 = 0;
      v57 = 1;
    }
    objc_storeStrong(&v55, 0);
    objc_storeStrong(&v56, 0);
  }
  else
  {
    v63 = 0;
    v57 = 1;
  }
  objc_storeStrong(&v58, 0);
  if (!v57)
  {
LABEL_27:
    v63 = (BuddyCursiveTextPath *)v62;
    v57 = 1;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v62, 0);
  return v63;
}

- (CGAffineTransform)transformForRect:(SEL)a3 pointSize:(CGRect)a4 flipped:(double)a5
{
  double v7;
  CGPoint origin;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat v12;
  CGFloat v13;
  CGAffineTransform *Translation;
  NSObject *v15;
  os_log_type_t v16;
  __int128 v17;
  __int128 v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  CGFloat v26;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform __src;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v33;
  uint8_t buf[7];
  char v35;
  os_log_t oslog;
  double v37;
  CGFloat sx;
  CGRect rect;
  CGRect v40;
  CGRect v41;
  double v42;
  __int128 v43;
  __int128 v44;
  double v45;
  double v46;
  double v47;
  double v48;
  BOOL v49;
  double v50;
  SEL v51;
  BuddyCursiveTextPath *v52;
  __int128 v53;
  __int128 v54;

  *(CGFloat *)&v53 = a4.origin.x;
  *((_QWORD *)&v53 + 1) = *(_QWORD *)&a4.origin.y;
  *(CGFloat *)&v54 = a4.size.width;
  *((_QWORD *)&v54 + 1) = *(_QWORD *)&a4.size.height;
  v52 = self;
  v51 = a3;
  v50 = a5;
  v49 = a6;
  v48 = 0.0;
  v48 = v52->_ascender - v52->_descender;
  v47 = 0.0;
  v47 = -self->_descender / v48;
  v46 = 0.0;
  v46 = v48 / self->_unitsPerM * a5;
  v44 = v54;
  v43 = v53;
  v45 = (CGRectGetHeight(a4) - v46) * 0.5;
  v42 = 0.0;
  if (v49)
    v7 = 1.0 - v47;
  else
    v7 = v47;
  v42 = v45 + v7 * v46;
  origin = v52->_boundingBoxOfPath.origin;
  v41.size = v52->_boundingBoxOfPath.size;
  v41.origin = origin;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v40 = v41;
  height = v41.size.height;
  width = v41.size.width;
  y = v41.origin.y;
  origin.x = v41.origin.x;
  v12 = -CGRectGetMinX(*(CGRect *)&origin.x);
  rect = v41;
  v13 = CGRectGetWidth(v41);
  Translation = CGAffineTransformMakeTranslation(retstr, v12 + -v13 * 0.5, 0.0);
  sx = 0.0;
  sx = v50 / v52->_unitsPerM;
  v37 = v41.size.width * sx;
  if (v41.size.width * sx > *(double *)&v54 && v37 > 0.0 && *(double *)&v54 > 0.0)
  {
    oslog = (os_log_t)(id)_BYLoggingFacility(Translation);
    v35 = 2;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v15 = oslog;
      v16 = v35;
      sub_100038C3C(buf);
      _os_log_debug_impl((void *)&_mh_execute_header, v15, v16, "Scaling cursive text transform to fit within available width", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    sx = sx * (*(double *)&v54 / v37);
  }
  v17 = *(_OWORD *)&retstr->a;
  v18 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  *(_OWORD *)&t1.c = v18;
  *(_OWORD *)&t1.a = v17;
  v19 = 1.0;
  if (v49)
    v19 = -1.0;
  CGAffineTransformMakeScale(&t2, sx, sx * v19);
  CGAffineTransformConcat(&v33, &t1, &t2);
  v20 = *(_OWORD *)&v33.a;
  v21 = *(_OWORD *)&v33.c;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v33.tx;
  *(_OWORD *)&retstr->c = v21;
  *(_OWORD *)&retstr->a = v20;
  v22 = *(_OWORD *)&retstr->a;
  v23 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v29.tx = *(_OWORD *)&retstr->tx;
  *(_OWORD *)&v29.c = v23;
  *(_OWORD *)&v29.a = v22;
  *(_QWORD *)&v22 = v53;
  v24 = *((_QWORD *)&v54 + 1);
  v25 = v54;
  *(_QWORD *)&v23 = *((_QWORD *)&v53 + 1);
  v26 = CGRectGetWidth(*(CGRect *)&v22);
  CGAffineTransformMakeTranslation(&v28, v26 * 0.5, v42);
  CGAffineTransformConcat(&__src, &v29, &v28);
  return (CGAffineTransform *)memcpy(retstr, &__src, sizeof(CGAffineTransform));
}

- (double)duration
{
  return self->_duration;
}

- (CGPath)pathForTime:(double)a3
{
  return -[BuddyCursiveTextPath pathForFraction:calculateLength:](self, "pathForFraction:calculateLength:", 0, a3 / self->_duration);
}

- (CGPath)pathForFraction:(double)a3 calculateLength:(BOOL)a4
{
  float32x4_t v4;
  int64_t resolution;
  float v6;
  float32x4_t v7;
  __int128 v8;
  double v9;
  double v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float initialWeight;
  float finalWeight;
  float v17;
  float v18;
  float32x2_t v19;
  float v20;
  float32x2_t v22;
  float32x2_t *v23;
  uint64_t j;
  float32x2_t v25;
  float32x2_t *v26;
  unint64_t v27;
  unint64_t v28;
  float32x2_t v29;
  uint64_t v30;
  float32x2_t *v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD v34[2];
  CGMutablePathRef path;
  int v36;
  uint64_t v37;
  double v38;
  float v39;
  double v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x2_t v43;
  __int128 v44;
  float32x4_t v45;
  float32x4_t v46;
  double v47;
  uint64_t i;
  uint64_t v49;
  float32x4_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54[3];
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  vector<std::vector<BezierCurve>, std::allocator<std::vector<BezierCurve> > > *p_bezierArrays;
  char v59;
  char v60;
  float32x4_t v61;
  double v62;
  uint64_t v63[3];
  double v64;
  double v65;
  BOOL v66;
  double v67;
  SEL v68;
  BuddyCursiveTextPath *v69;
  CGPath *v70;
  int v71;
  int v72;
  float v73;
  float32x4_t v74;
  int v75;
  int v76;
  int v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x2_t v80;
  uint64_t v81;
  __int32 v82;
  __int32 v83;
  uint64_t v84;
  int v85;
  int v86;
  float32x2_t v87;
  float v88;
  int v89;
  float32x4_t v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  float32x4_t v95;
  float v96;
  float v97;
  float v98;
  int v99;
  float v100;
  int v101;
  float v102;
  int v103;
  float v104;
  int v105;
  float v106;
  uint32x4_t v107;
  unsigned int v108;
  uint32x4_t v109;
  float32x2_t v110;
  float32x2_t v111;
  float v112;
  float32x2_t v113;
  float32x2_t v114;
  uint64_t v115;
  uint64_t v116;
  float v117;
  float32x2_t v118;
  uint64_t v119;
  float32x2_t v120;
  float32x2_t v121;
  uint64_t v122;
  float32x2_t v123;
  float32x2_t v124;
  uint64_t v125;
  float32x2_t v126;
  uint64_t v127;
  float32x2_t v128;
  float32x2_t v129;
  float32x2_t v130;
  float32x4_t v131;
  float32x4_t v132;
  float32x4_t v133;
  float32x4_t v134;
  float32x4_t v135;
  float32x4_t v136;
  float32x4_t v137;
  float32x4_t v138;
  float32x4_t v139;
  float32x4_t v140;
  float32x4_t v141;
  float32x4_t v142;
  float32x4_t v143;
  float32x4_t v144;
  float32x4_t v145;
  float32x4_t v146;
  float32x4_t v147;
  float32x4_t v148;
  float32x4_t v149;

  v69 = self;
  v68 = a2;
  v67 = a3;
  v66 = a4;
  v65 = 0.0;
  v65 = self->_rampTime / self->_duration;
  v64 = -(v65 - (v65 + 1.0) * a3);
  sub_10017E488(v63);
  v62 = 0.0;
  v77 = 0;
  v76 = 0;
  v75 = 0;
  v74.i64[0] = 0;
  v74.i32[2] = 0;
  v61 = v74;
  v60 = 0;
  v59 = 0;
  p_bezierArrays = &v69->_bezierArrays;
  v57 = sub_10017E4BC((uint64_t *)&v69->_bezierArrays);
  v56 = sub_10017E4EC((uint64_t)p_bezierArrays);
  while (sub_10017E51C((uint64_t)&v57, (uint64_t)&v56))
  {
    v55 = (uint64_t *)sub_10017E550((uint64_t)&v57);
    sub_10017E568(v54);
    v53 = v55;
    v52 = sub_10017E59C(v55);
    v51 = sub_10017E5CC((uint64_t)v53);
    while (sub_10017E5FC((uint64_t)&v52, (uint64_t)&v51))
    {
      v50 = (float32x4_t *)sub_10017E630((uint64_t)&v52);
      v49 = 0;
      v4 = v50[3];
      v79 = *v50;
      v78 = v4;
      v107 = (uint32x4_t)vceqq_f32(v79, v4);
      v109 = v107;
      v108 = vminvq_u32(v107);
      if ((v108 & 0x80000000) != 0)
        resolution = 0;
      else
        resolution = v69->_resolution;
      v49 = resolution;
      for (i = 0; i <= v49; ++i)
      {
        v47 = 0.0;
        v47 = 1.0 / (double)v69->_resolution * (double)i;
        v46 = 0uLL;
        v6 = v47;
        *(double *)v7.i64 = sub_10017E648(v50, v6);
        v46 = v7;
        v45 = v7;
        v44 = 0uLL;
        v7.f32[0] = v47;
        *(double *)&v8 = sub_10017E720(v50, v7.f32[0]);
        v44 = v8;
        v89 = DWORD1(v8);
        v88 = -*(float *)&v8;
        v87.i32[0] = DWORD1(v8);
        v87.f32[1] = -*(float *)&v8;
        v80 = v87;
        v110 = v87;
        v113 = v87;
        v129 = v87;
        v128 = v87;
        v130 = vmul_f32(v87, v87);
        v112 = vaddv_f32(v130);
        v117 = v112;
        v116 = LODWORD(v112);
        v115 = LODWORD(v112);
        v119 = LODWORD(v112);
        v127 = LODWORD(v112);
        v126 = vrsqrte_f32((float32x2_t)LODWORD(v112));
        v118 = v126;
        v122 = LODWORD(v112);
        v121 = vmul_f32(v126, v126);
        v120 = vrsqrts_f32((float32x2_t)LODWORD(v112), v121);
        v114 = vmul_f32(v126, v120);
        v125 = LODWORD(v112);
        v124 = vmul_f32(v114, v114);
        v123 = vrsqrts_f32((float32x2_t)LODWORD(v112), v124);
        v111 = vmul_f32(v114, v123);
        v43 = vmul_n_f32(v87, v111.f32[0]);
        if ((sub_10017E844() & 1) != 0 || (sub_10017E844() & 1) != 0)
        {
          v86 = 0;
          v85 = 1065353216;
          v84 = 0x3F80000000000000;
          v43 = (float32x2_t)0x3F80000000000000;
        }
        if ((v60 & 1) != 0)
        {
          v42 = v45;
          v41 = v61;
          v95 = v45;
          v94 = v61;
          v93 = v45;
          v92 = v61;
          v91 = v45;
          v90 = v61;
          v135 = v45;
          v134 = v61;
          v133 = v45;
          v132 = v61;
          v131 = vsubq_f32(v45, v61);
          v138 = v131;
          v137 = v131;
          v136 = v131;
          v142 = v131;
          v141 = v131;
          v140 = v131;
          v139 = v131;
          v147 = v131;
          v146 = v131;
          v145 = v131;
          v144 = v131;
          v143 = vmulq_f32(v131, v131);
          v149 = v143;
          v148 = v143;
          v9 = sqrtf(vaddv_f32(*(float32x2_t *)v143.f32) + v143.f32[2]);
          v10 = 0.5;
          if ((v59 & 1) == 0)
            v10 = 1.0;
          v62 = v62 + v9 * v10;
          v59 = 0;
        }
        v61 = v45;
        v60 = 1;
        v40 = 0.0;
        v40 = v62 / v69->_length;
        v11 = v40;
        v12 = v64;
        v13 = v11 - v12;
        v14 = v65;
        v73 = v13 / v14;
        v72 = 0;
        v71 = 1065353216;
        v102 = v13 / v14;
        v101 = 0;
        v106 = v13 / v14;
        v105 = 0;
        v100 = fmaxf(v13 / v14, 0.0);
        v99 = 1065353216;
        v104 = v100;
        v103 = 1065353216;
        v39 = 1.0 - fminf(v100, 1.0);
        v38 = 0.0;
        initialWeight = v69->_initialWeight;
        finalWeight = v69->_finalWeight;
        v17 = powf(v39 - 1.0, 3.0);
        v98 = initialWeight;
        v97 = finalWeight;
        v96 = v17 + 1.0;
        v38 = (float)((float)(initialWeight + (float)((float)(v17 + 1.0) * (float)(finalWeight - initialWeight)))
                    * v46.f32[3]);
        if (!v66 && v40 > v64 + v65)
        {
          sub_10017E864(v63, v54);
          v36 = 9;
          goto LABEL_23;
        }
        v82 = v45.i32[1];
        v83 = v45.i32[0];
        v81 = v45.i64[0];
        v37 = v45.i64[0];
        sub_10017E8E4(v54, (double *)&v37, (double *)&v43, &v38, &v62);
      }
      v59 = 1;
      sub_10017E988(&v52);
    }
    sub_10017E864(v63, v54);
    v36 = 0;
LABEL_23:
    sub_10017E9A8(v54);
    if (v36)
      break;
    sub_10017E9DC(&v57);
  }
  if (v66)
    v69->_length = v62;
  path = CGPathCreateMutable();
  v34[1] = v63;
  v34[0] = sub_10017E9FC(v63);
  v33 = sub_10017EA2C((uint64_t)v63);
  while (sub_10017EA5C((uint64_t)v34, (uint64_t)&v33))
  {
    v32 = (_QWORD *)sub_10017EA90((uint64_t)v34);
    if (!sub_10017EAA8(v32))
    {
      v31 = (float32x2_t *)sub_10017EAD0((uint64_t)v32);
      v30 = sub_10017EAE8((uint64_t)v32);
      v29 = vmla_n_f32(*v31, v31[1], v31[2].f32[0]);
      CGPathMoveToPoint(path, 0, v29.f32[0], v29.f32[1]);
      v28 = 1;
      v27 = sub_10017EB04(v32) - 1;
      while (v28 < v27)
      {
        v26 = (float32x2_t *)sub_10017EB2C(v32, v28);
        v25 = vmla_n_f32(*v26, v26[1], v26[2].f32[0]);
        CGPathAddLineToPoint(path, 0, v25.f32[0], v25.f32[1]);
        ++v28;
      }
      v18 = sub_10017EB54(COERCE_FLOAT(HIDWORD(*(_QWORD *)(v30 + 8))), COERCE_FLOAT(*(_QWORD *)(v30 + 8)));
      CGPathAddArc(path, 0, COERCE_FLOAT(*(_QWORD *)v30), COERCE_FLOAT(HIDWORD(*(_QWORD *)v30)), *(float *)(v30 + 16), v18, v18 + 3.14159265, 0);
      for (j = sub_10017EB04(v32) - 2; j >= 1; --j)
      {
        v23 = (float32x2_t *)sub_10017EB2C(v32, j);
        v19.i32[0] = v23[2].i32[0];
        v22 = vmls_lane_f32(*v23, v23[1], v19, 0);
        CGPathAddLineToPoint(path, 0, v22.f32[0], v22.f32[1]);
      }
      v20 = sub_10017EB54(-COERCE_FLOAT(HIDWORD(*(_QWORD *)&v31[1])), -COERCE_FLOAT(*(_QWORD *)&v31[1]));
      CGPathAddArc(path, 0, COERCE_FLOAT(*v31), COERCE_FLOAT(HIDWORD(*(unint64_t *)v31)), v31[2].f32[0], v20, v20 + 3.14159265, 0);
    }
    sub_10017EB80(v34);
  }
  v70 = path;
  v36 = 1;
  sub_10017EBA0(v63);
  return v70;
}

- (void).cxx_destruct
{
  sub_10017EC00((uint64_t *)&self->_bezierArrays);
}

- (id).cxx_construct
{
  sub_10017EC64(&self->_bezierArrays.__begin_);
  return self;
}

@end
