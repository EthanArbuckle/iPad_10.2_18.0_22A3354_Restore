@implementation CHTransformedTextSegment

- (CHTransformedTextSegment)initWithStrokes:(id)a3 tokens:(id)a4 locale:(id)a5 strokeClassification:(int64_t)a6 principalLines:(PrincipalLines *)a7 transform:(CGAffineTransform *)a8
{
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  void **v31;
  char *v32;
  char *v33;
  void *v34;
  char *v35;
  void *v36;
  void *v37;
  CGRect *v38;
  CGFloat MinX;
  CGFloat MaxX;
  CGFloat MinY;
  CGFloat MaxY;
  id v44;

  v44 = a3;
  v15 = a4;
  v16 = a5;
  v22 = objc_msgSend_init(self, v17, v18, v19, v20, v21);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)(v22 + 184), a3);
    objc_storeStrong((id *)(v23 + 192), a4);
    objc_storeStrong((id *)(v23 + 216), a5);
    *(_QWORD *)(v23 + 224) = a6;
    if ((PrincipalLines *)(v23 + 8) != a7)
    {
      sub_1BE6F5A88((_QWORD *)(v23 + 8), (char *)a7->descender.__begin_, (char *)a7->descender.__end_, a7->descender.__end_ - a7->descender.__begin_);
      sub_1BE6F5A88((_QWORD *)(v23 + 32), (char *)a7->base.__begin_, (char *)a7->base.__end_, a7->base.__end_ - a7->base.__begin_);
      sub_1BE6F5A88((_QWORD *)(v23 + 56), (char *)a7->median.__begin_, (char *)a7->median.__end_, a7->median.__end_ - a7->median.__begin_);
      sub_1BE6F5A88((_QWORD *)(v23 + 80), (char *)a7->top.__begin_, (char *)a7->top.__end_, a7->top.__end_ - a7->top.__begin_);
    }
    v24 = *(_OWORD *)&a8->a;
    v25 = *(_OWORD *)&a8->c;
    *(_OWORD *)(v23 + 264) = *(_OWORD *)&a8->tx;
    *(_OWORD *)(v23 + 248) = v25;
    *(_OWORD *)(v23 + 232) = v24;
    v26 = *(void **)(v23 + 200);
    v27 = MEMORY[0x1E0C9AA60];
    *(_QWORD *)(v23 + 200) = MEMORY[0x1E0C9AA60];

    v28 = *(void **)(v23 + 208);
    *(_QWORD *)(v23 + 208) = v27;

    v30 = (_QWORD *)(v23 + 136);
    v29 = *(void **)(v23 + 136);
    if (v29)
    {
      *(_QWORD *)(v23 + 144) = v29;
      operator delete(v29);
      *v30 = 0;
      *(_QWORD *)(v23 + 144) = 0;
      *(_QWORD *)(v23 + 152) = 0;
    }
    v31 = (void **)(v23 + 160);
    v32 = *(char **)(v23 + 160);
    *v30 = 0;
    *(_QWORD *)(v23 + 144) = 0;
    *(_QWORD *)(v23 + 152) = 0;
    if (v32)
    {
      v33 = *(char **)(v23 + 168);
      v34 = v32;
      if (v33 != v32)
      {
        v35 = *(char **)(v23 + 168);
        do
        {
          v37 = (void *)*((_QWORD *)v35 - 3);
          v35 -= 24;
          v36 = v37;
          if (v37)
          {
            *((_QWORD *)v33 - 2) = v36;
            operator delete(v36);
          }
          v33 = v35;
        }
        while (v35 != v32);
        v34 = *v31;
      }
      *(_QWORD *)(v23 + 168) = v32;
      operator delete(v34);
      *v31 = 0;
      *(_QWORD *)(v23 + 168) = 0;
      *(_QWORD *)(v23 + 176) = 0;
    }
    *v31 = 0;
    *(_QWORD *)(v23 + 168) = 0;
    *(_QWORD *)(v23 + 176) = 0;
    v38 = (CGRect *)MEMORY[0x1E0C9D648];
    MinX = CGRectGetMinX(*MEMORY[0x1E0C9D648]);
    MaxX = CGRectGetMaxX(*v38);
    MinY = CGRectGetMinY(*v38);
    MaxY = CGRectGetMaxY(*v38);
    *(CGFloat *)(v23 + 104) = MinX;
    *(CGFloat *)(v23 + 112) = MaxX;
    *(CGFloat *)(v23 + 120) = MinY;
    *(CGFloat *)(v23 + 128) = MaxY;
  }

  return (CHTransformedTextSegment *)v23;
}

- (CHTransformedTextSegment)initWithStrokes:(id)a3 tokens:(id)a4 points:(const void *)a5 strokePoints:(const void *)a6 locale:(id)a7 strokeClassification:(int64_t)a8 principalLines:(PrincipalLines *)a9 transform:(CGAffineTransform *)a10
{
  id v16;
  id v17;
  id v18;
  __int128 v19;
  const char *v20;
  CHTransformedTextSegment *v21;
  double *p_x;
  CGPoint *end;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _OWORD v35[3];
  void *v36[3];
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *__p;
  void *v42;

  v16 = a3;
  v17 = a4;
  v18 = a7;
  sub_1BE76136C(v36, (uint64_t)a9);
  v19 = *(_OWORD *)&a10->c;
  v35[0] = *(_OWORD *)&a10->a;
  v35[1] = v19;
  v35[2] = *(_OWORD *)&a10->tx;
  v21 = (CHTransformedTextSegment *)objc_msgSend_initWithStrokes_tokens_locale_strokeClassification_principalLines_transform_(self, v20, (uint64_t)v16, (uint64_t)v17, (uint64_t)v18, a8, v36, v35);
  if (__p)
  {
    v42 = __p;
    operator delete(__p);
  }
  if (v39)
  {
    v40 = v39;
    operator delete(v39);
  }
  if (v37)
  {
    v38 = v37;
    operator delete(v37);
  }
  if (v36[0])
  {
    v36[1] = v36[0];
    operator delete(v36[0]);
  }
  if (v21)
  {
    if (&v21->_points != a5)
      sub_1BE6F5A88(&v21->_points.__begin_, *(char **)a5, *((char **)a5 + 1), (uint64_t)(*((_QWORD *)a5 + 1) - *(_QWORD *)a5) >> 4);
    if (&v21->_strokePoints != a6)
      sub_1BE76157C((uint64_t)&v21->_strokePoints, *(char ***)a6, *((_QWORD *)a6 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a6 + 1) - *(_QWORD *)a6) >> 3));
    p_x = &v21->_points.__begin_->x;
    end = v21->_points.__end_;
    if (p_x == (double *)end)
    {
      v24 = 1.79769313e308;
      v25 = -1.79769313e308;
      v26 = -1.79769313e308;
      v27 = 1.79769313e308;
    }
    else
    {
      v24 = 1.79769313e308;
      v25 = -1.79769313e308;
      v26 = -1.79769313e308;
      v27 = 1.79769313e308;
      v28 = -1.79769313e308;
      v29 = 1.79769313e308;
      v30 = -1.79769313e308;
      v31 = 1.79769313e308;
      do
      {
        v32 = *p_x;
        v33 = p_x[1];
        p_x += 2;
        if (v31 > v32)
        {
          v27 = v32;
          v31 = v32;
        }
        if (v30 < v32)
        {
          v26 = v32;
          v30 = v32;
        }
        if (v29 > v33)
        {
          v24 = v33;
          v29 = v33;
        }
        if (v28 < v33)
        {
          v25 = v33;
          v28 = v33;
        }
      }
      while (p_x != (double *)end);
    }
    v21->_boundingBox.x_min = v27;
    v21->_boundingBox.x_max = v26;
    v21->_boundingBox.y_min = v24;
    v21->_boundingBox.y_max = v25;
  }

  return v21;
}

- (void)addTransform:(CGAffineTransform *)a3
{
  PrincipalLines *p_principalLines;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CGPoint *begin;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  CGPoint *v21;
  CGPoint *end;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double x;
  double y;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char *v36;
  char *v37;
  void *v38;
  char *v39;
  void *v40;
  void *v41;
  char *v42;
  char *v43;
  void *v44;
  char *v45;
  void *v46;
  void *v47;
  CGAffineTransform v48;
  CGAffineTransform t1;
  CGAffineTransform v50;
  void *v51;
  char *v52;
  unint64_t v53;
  void *__p;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;

  p_principalLines = &self->_principalLines;
  CoreHandwriting::transformPrincipalLines((double **)&self->_principalLines, (float64x2_t *)a3, (uint64_t)&v56);
  if (p_principalLines != (PrincipalLines *)&v56)
  {
    sub_1BE6F5A88(p_principalLines, v56, v57, (v57 - v56) >> 4);
    sub_1BE6F5A88(&self->_principalLines.base.__begin_, v58, v59, (v59 - v58) >> 4);
    sub_1BE6F5A88(&self->_principalLines.median.__begin_, v60, v61, (v61 - v60) >> 4);
    sub_1BE6F5A88(&self->_principalLines.top.__begin_, v62, v63, (v63 - v62) >> 4);
  }
  objc_msgSend_points(self, v6, v7, v8, v9, v10);
  sub_1BE7F8D14((double **)&__p, (float64x2_t *)a3, (float64x2_t **)&v50);
  begin = self->_points.__begin_;
  if (begin)
  {
    self->_points.__end_ = begin;
    operator delete(begin);
    self->_points.__begin_ = 0;
    self->_points.__end_ = 0;
    self->_points.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&self->_points.__begin_ = *(_OWORD *)&v50.a;
  self->_points.__end_cap_.__value_ = *(CGPoint **)&v50.c;
  memset(&v50, 0, 24);
  if (__p)
  {
    v55 = (char *)__p;
    operator delete(__p);
  }
  objc_msgSend_strokePoints(self, v11, v12, v13, v14, v15);
  v51 = 0;
  v52 = 0;
  v53 = 0;
  v17 = (char *)__p;
  if (v55 != __p)
  {
    v18 = 0;
    v19 = 0;
    do
    {
      sub_1BE7F8D14((double **)&v17[v18], (float64x2_t *)a3, (float64x2_t **)&v50);
      v20 = v52;
      if ((unint64_t)v52 < v53)
      {
        *(_QWORD *)v52 = 0;
        *((_QWORD *)v20 + 1) = 0;
        *((_QWORD *)v20 + 2) = 0;
        *(_OWORD *)v20 = *(_OWORD *)&v50.a;
        *((_QWORD *)v20 + 2) = *(_QWORD *)&v50.c;
        v52 = v20 + 24;
      }
      else
      {
        v52 = sub_1BE7618F0((char **)&v51, (uint64_t)&v50);
        if (*(_QWORD *)&v50.a)
        {
          v50.b = v50.a;
          operator delete(*(void **)&v50.a);
        }
      }
      ++v19;
      v17 = (char *)__p;
      v18 += 24;
    }
    while (v19 < 0xAAAAAAAAAAAAAAABLL * ((v55 - (_BYTE *)__p) >> 3));
  }
  if (&self->_strokePoints != (vector<std::vector<CGPoint>, std::allocator<std::vector<CGPoint>>> *)&v51)
    sub_1BE76157C((uint64_t)&self->_strokePoints, (char **)v51, (uint64_t)v52, 0xAAAAAAAAAAAAAAABLL * ((v52 - (_BYTE *)v51) >> 3));
  v21 = self->_points.__begin_;
  end = self->_points.__end_;
  if (v21 == end)
  {
    v23 = 1.79769313e308;
    v24 = -1.79769313e308;
    v25 = -1.79769313e308;
    v26 = 1.79769313e308;
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
    do
    {
      x = v21->x;
      y = v21->y;
      ++v21;
      if (v30 > x)
      {
        v26 = x;
        v30 = x;
      }
      if (v29 < x)
      {
        v25 = x;
        v29 = x;
      }
      if (v28 > y)
      {
        v23 = y;
        v28 = y;
      }
      if (v27 < y)
      {
        v24 = y;
        v27 = y;
      }
    }
    while (v21 != end);
  }
  self->_boundingBox.x_min = v26;
  self->_boundingBox.x_max = v25;
  self->_boundingBox.y_min = v23;
  self->_boundingBox.y_max = v24;
  v33 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t1.c = v33;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_transform.tx;
  v34 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v48.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v48.c = v34;
  *(_OWORD *)&v48.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v50, &t1, &v48);
  v35 = *(_OWORD *)&v50.c;
  *(_OWORD *)&self->_transform.a = *(_OWORD *)&v50.a;
  *(_OWORD *)&self->_transform.c = v35;
  *(_OWORD *)&self->_transform.tx = *(_OWORD *)&v50.tx;
  v36 = (char *)v51;
  if (v51)
  {
    v37 = v52;
    v38 = v51;
    if (v52 != v51)
    {
      v39 = v52;
      do
      {
        v41 = (void *)*((_QWORD *)v39 - 3);
        v39 -= 24;
        v40 = v41;
        if (v41)
        {
          *((_QWORD *)v37 - 2) = v40;
          operator delete(v40);
        }
        v37 = v39;
      }
      while (v39 != v36);
      v38 = v51;
    }
    v52 = v36;
    operator delete(v38);
  }
  v42 = (char *)__p;
  if (__p)
  {
    v43 = v55;
    v44 = __p;
    if (v55 != __p)
    {
      v45 = v55;
      do
      {
        v47 = (void *)*((_QWORD *)v45 - 3);
        v45 -= 24;
        v46 = v47;
        if (v47)
        {
          *((_QWORD *)v43 - 2) = v46;
          operator delete(v46);
        }
        v43 = v45;
      }
      while (v45 != v42);
      v44 = __p;
    }
    v55 = v42;
    operator delete(v44);
  }
  if (v62)
  {
    v63 = v62;
    operator delete(v62);
  }
  if (v60)
  {
    v61 = v60;
    operator delete(v60);
  }
  if (v58)
  {
    v59 = v58;
    operator delete(v58);
  }
  if (v56)
  {
    v57 = v56;
    operator delete(v56);
  }
}

- (void)addSupportStroke:(id)a3
{
  uint64_t v3;

  objc_msgSend_addSupportStroke_tokenRange_(self, a2, (uint64_t)a3, 0x7FFFFFFFFFFFFFFFLL, 0, v3);
}

- (void)addSupportStroke:(id)a3 tokenRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  NSArray *supportStrokes;
  NSArray *supportStrokeTokenRanges;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSArray *v33;
  NSArray *v34;
  _QWORD v35[3];

  length = a4.length;
  location = a4.location;
  v35[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend_arrayByAddingObject_(self->_supportStrokes, v8, (uint64_t)v7, v9, v10, v11);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  supportStrokes = self->_supportStrokes;
  self->_supportStrokes = v12;

  supportStrokeTokenRanges = self->_supportStrokeTokenRanges;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v15, location, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v19;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v20, length, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v24;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v25, (uint64_t)v35, 2, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObject_(supportStrokeTokenRanges, v29, (uint64_t)v28, v30, v31, v32);
  v33 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v34 = self->_supportStrokeTokenRanges;
  self->_supportStrokeTokenRanges = v33;

}

- (id)tokenSupportRangeForTokenIndex:(int64_t)a3 supportStrokes:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t i;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;

  objc_msgSend_indexSetWithIndex_(MEMORY[0x1E0CB3788], a2, a3, (uint64_t)a4, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v10, v11, v12, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend_count(self->_supportStrokes, v14, v15, v16, v17, v18); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_supportStrokeTokenRanges, v21, i, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v25, v26, 0, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_intValue(v30, v31, v32, v33, v34, v35);
    objc_msgSend_objectAtIndexedSubscript_(v25, v37, 1, v38, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_intValue(v41, v42, v43, v44, v45, v46);
    v51 = objc_msgSend_intersectsIndexesInRange_(v8, v48, v36, v47, v49, v50);

    if (v51)
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_supportStrokes, v52, i, v53, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v19, v57, (uint64_t)v56, v58, v59, v60);

      objc_msgSend_objectAtIndexedSubscript_(v25, v61, 0, v62, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend_intValue(v65, v66, v67, v68, v69, v70);
      objc_msgSend_objectAtIndexedSubscript_(v25, v72, 1, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend_intValue(v76, v77, v78, v79, v80, v81);
      objc_msgSend_addIndexesInRange_(v8, v83, v71, v82, v84, v85);

    }
  }
  if (a4)
    *a4 = objc_retainAutorelease(v19);

  return v8;
}

- (id)splitIntoTokens
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSArray *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
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
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t k;
  void *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  CHTransformedTextSegment *v126;
  double **v127;
  uint64_t *v128;
  NSLocale *locale;
  int64_t strokeClassification;
  __int128 v131;
  const char *v132;
  void *v133;
  id v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t m;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  char *v153;
  char *v154;
  void *v155;
  char *v156;
  void *v157;
  void *v158;
  void *v160;
  uint64_t v161;
  void *v162;
  id v163;
  void *v164;
  unint64_t j;
  void *v166;
  id v167;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  _OWORD v173[3];
  void *v174[3];
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *__p;
  void *v180;
  void *v181[3];
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  _QWORD v188[4];
  id v189;
  CHTransformedTextSegment *v190;
  id v191;
  uint64_t *v192;
  uint64_t *v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  uint64_t v198;
  double **v199;
  uint64_t v200;
  __n128 (*v201)(__n128 *, __n128 *);
  void (*v202)(uint64_t);
  void *v203;
  void *v204;
  void *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t *v208;
  uint64_t v209;
  __n128 (*v210)(__n128 *, __n128 *);
  void (*v211)(uint64_t);
  void *v212;
  void *v213;
  char *v214;
  uint64_t v215;
  id v216;
  _QWORD v217[4];
  id v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _QWORD v226[3];

  v226[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4, v5);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_count(self->_tokens, v6, v7, v8, v9, v10) > 1)
  {
    objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v11, v12, v13, v14, v15);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    v221 = 0u;
    v222 = 0u;
    v219 = 0u;
    v220 = 0u;
    v17 = self->_tokens;
    v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v219, (uint64_t)v225, 16, v19);
    if (v25)
    {
      v26 = *(_QWORD *)v220;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v220 != v26)
            objc_enumerationMutation(v17);
          objc_msgSend_strokeIndexes(*(void **)(*((_QWORD *)&v219 + 1) + 8 * i), v20, v21, v22, v23, v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addIndexes_(v166, v29, (uint64_t)v28, v30, v31, v32);

        }
        v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v219, (uint64_t)v225, 16, v24);
      }
      while (v25);
    }

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v33, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v217[0] = MEMORY[0x1E0C809B0];
    v217[1] = 3221225472;
    v217[2] = sub_1BE75A248;
    v217[3] = &unk_1E77F2CB8;
    v167 = v38;
    v218 = v167;
    objc_msgSend_enumerateIndexesUsingBlock_(v166, v39, (uint64_t)v217, v40, v41, v42);
    for (j = 0; j < objc_msgSend_count(self->_tokens, v43, v44, v45, v46, v47); j += v161)
    {
      v216 = 0;
      objc_msgSend_tokenSupportRangeForTokenIndex_supportStrokes_(self, v48, j, (uint64_t)&v216, v49, v50);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = v216;
      v161 = objc_msgSend_count(v162, v51, v52, v53, v54, v55);
      objc_msgSend_objectsAtIndexes_(self->_tokens, v56, (uint64_t)v162, v57, v58, v59);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v60, v61, v62, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v66, v67, v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v207 = 0;
      v208 = &v207;
      v209 = 0x4812000000;
      v210 = sub_1BE75A2A8;
      v211 = sub_1BE75A2CC;
      v212 = &unk_1BE94989A;
      v214 = 0;
      v215 = 0;
      v213 = 0;
      v198 = 0;
      v199 = (double **)&v198;
      v200 = 0x4812000000;
      v201 = sub_1BE75A348;
      v202 = sub_1BE75A36C;
      v203 = &unk_1BE94989A;
      v205 = 0;
      v206 = 0;
      v204 = 0;
      v196 = 0u;
      v197 = 0u;
      v194 = 0u;
      v195 = 0u;
      v72 = v164;
      v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v194, (uint64_t)v224, 16, v74);
      if (v80)
      {
        v81 = *(_QWORD *)v195;
        do
        {
          for (k = 0; k != v80; ++k)
          {
            if (*(_QWORD *)v195 != v81)
              objc_enumerationMutation(v72);
            v83 = *(void **)(*((_QWORD *)&v194 + 1) + 8 * k);
            v84 = objc_msgSend_count(v65, v75, v76, v77, v78, v79);
            objc_msgSend_strokeIndexes(v83, v85, v86, v87, v88, v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v188[0] = MEMORY[0x1E0C809B0];
            v188[1] = 3221225472;
            v188[2] = sub_1BE75A384;
            v188[3] = &unk_1E77F4AD8;
            v189 = v167;
            v190 = self;
            v191 = v65;
            v192 = &v207;
            v193 = &v198;
            objc_msgSend_enumerateIndexesUsingBlock_(v90, v91, (uint64_t)v188, v92, v93, v94);

            v100 = (void *)objc_msgSend_mutableCopy(v83, v95, v96, v97, v98, v99);
            v101 = (void *)MEMORY[0x1E0CB36B8];
            objc_msgSend_strokeIndexes(v83, v102, v103, v104, v105, v106);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = objc_msgSend_count(v107, v108, v109, v110, v111, v112);
            objc_msgSend_indexSetWithIndexesInRange_(v101, v114, v84, v113, v115, v116);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setStrokeIndexes_(v100, v118, (uint64_t)v117, v119, v120, v121);

            objc_msgSend_addObject_(v71, v122, (uint64_t)v100, v123, v124, v125);
          }
          v80 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v75, (uint64_t)&v194, (uint64_t)v224, 16, v79);
        }
        while (v80);
      }

      sub_1BE7FE3E0((double **)&self->_principalLines, v199 + 6, (uint64_t)v181);
      v126 = [CHTransformedTextSegment alloc];
      v127 = v199;
      v128 = v208;
      locale = self->_locale;
      strokeClassification = self->_strokeClassification;
      sub_1BE76136C(v174, (uint64_t)v181);
      v131 = *(_OWORD *)&self->_transform.c;
      v173[0] = *(_OWORD *)&self->_transform.a;
      v173[1] = v131;
      v173[2] = *(_OWORD *)&self->_transform.tx;
      v133 = (void *)objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v126, v132, (uint64_t)v65, (uint64_t)v71, (uint64_t)(v127 + 6), (uint64_t)(v128 + 6), locale, strokeClassification, v174, v173);
      if (__p)
      {
        v180 = __p;
        operator delete(__p);
      }
      if (v177)
      {
        v178 = v177;
        operator delete(v177);
      }
      if (v175)
      {
        v176 = v175;
        operator delete(v175);
      }
      if (v174[0])
      {
        v174[1] = v174[0];
        operator delete(v174[0]);
      }
      v171 = 0u;
      v172 = 0u;
      v169 = 0u;
      v170 = 0u;
      v134 = v163;
      v142 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v169, (uint64_t)v223, 16, v136);
      if (v142)
      {
        v143 = *(_QWORD *)v170;
        do
        {
          for (m = 0; m != v142; ++m)
          {
            if (*(_QWORD *)v170 != v143)
              objc_enumerationMutation(v134);
            v145 = *(_QWORD *)(*((_QWORD *)&v169 + 1) + 8 * m);
            v146 = objc_msgSend_count(v72, v137, v138, v139, v140, v141);
            objc_msgSend_addSupportStroke_tokenRange_(v133, v147, v145, 0, v146, v148);
          }
          v142 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v137, (uint64_t)&v169, (uint64_t)v223, 16, v141);
        }
        while (v142);
      }

      objc_msgSend_addObject_(v160, v149, (uint64_t)v133, v150, v151, v152);
      if (v186)
      {
        v187 = v186;
        operator delete(v186);
      }
      if (v184)
      {
        v185 = v184;
        operator delete(v184);
      }
      if (v182)
      {
        v183 = v182;
        operator delete(v182);
      }
      if (v181[0])
      {
        v181[1] = v181[0];
        operator delete(v181[0]);
      }
      _Block_object_dispose(&v198, 8);
      if (v204)
      {
        v205 = v204;
        operator delete(v204);
      }
      _Block_object_dispose(&v207, 8);
      v153 = (char *)v213;
      if (v213)
      {
        v154 = v214;
        v155 = v213;
        if (v214 != v213)
        {
          v156 = v214;
          do
          {
            v158 = (void *)*((_QWORD *)v156 - 3);
            v156 -= 24;
            v157 = v158;
            if (v158)
            {
              *((_QWORD *)v154 - 2) = v157;
              operator delete(v157);
            }
            v154 = v156;
          }
          while (v156 != v153);
          v155 = v213;
        }
        v214 = v153;
        operator delete(v155);
      }

    }
    v16 = v160;

  }
  else
  {
    v226[0] = self;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)v226, 1, v14, v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

- (void)mergeTransformedText:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *textStrokes;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSArray *v21;
  NSArray *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSArray *v69;
  NSArray *tokens;
  NSArray *supportStrokes;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  NSArray *v82;
  NSArray *v83;
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
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t j;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  NSArray *v136;
  NSArray *supportStrokeTokenRanges;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  char *v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  char **v160;
  uint64_t v161;
  CGRect *v162;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  CGPoint *begin;
  double x;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  double v179;
  PrincipalLines *p_principalLines;
  char *v181;
  char *v182;
  void *v183;
  char *v184;
  void *v185;
  void *v186;
  char *v187;
  char *v188;
  void *v189;
  char *v190;
  void *v191;
  void *v192;
  id v193;
  uint64_t v194;
  void *v195[3];
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  char *v203;
  void *v204;
  char *v205;
  void *v206;
  char *v207;
  void *__p;
  char *v209;
  void *v210;
  char *v211;
  uint64_t v212;
  void *v213;
  char *v214;
  void *v215;
  char *v216;
  uint64_t v217;
  void *v218;
  int v219[2];
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  _QWORD v224[2];
  _BYTE v225[128];
  uint64_t v226;

  v226 = *MEMORY[0x1E0C80C00];
  v193 = a3;
  v9 = objc_msgSend_count(self->_textStrokes, v4, v5, v6, v7, v8);
  textStrokes = self->_textStrokes;
  objc_msgSend_textStrokes(v193, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(textStrokes, v17, (uint64_t)v16, v18, v19, v20);
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v22 = self->_textStrokes;
  self->_textStrokes = v21;

  v194 = objc_msgSend_count(self->_tokens, v23, v24, v25, v26, v27);
  v222 = 0u;
  v223 = 0u;
  v220 = 0u;
  v221 = 0u;
  objc_msgSend_tokens(v193, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v220, (uint64_t)v225, 16, v35);
  if (v41)
  {
    v42 = *(_QWORD *)v221;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v221 != v42)
          objc_enumerationMutation(v33);
        v44 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * i);
        objc_msgSend_strokeIndexes(v44, v36, v37, v38, v39, v40);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend_mutableCopy(v45, v46, v47, v48, v49, v50);

        objc_msgSend_shiftIndexesStartingAtIndex_by_(v51, v52, 0, v9, v53, v54);
        v60 = (void *)objc_msgSend_mutableCopy(v44, v55, v56, v57, v58, v59);
        objc_msgSend_setStrokeIndexes_(v60, v61, (uint64_t)v51, v62, v63, v64);
        objc_msgSend_arrayByAddingObject_(self->_tokens, v65, (uint64_t)v60, v66, v67, v68);
        v69 = (NSArray *)objc_claimAutoreleasedReturnValue();
        tokens = self->_tokens;
        self->_tokens = v69;

      }
      v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v220, (uint64_t)v225, 16, v40);
    }
    while (v41);
  }

  supportStrokes = self->_supportStrokes;
  objc_msgSend_supportStrokes(v193, v72, v73, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(supportStrokes, v78, (uint64_t)v77, v79, v80, v81);
  v82 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v83 = self->_supportStrokes;
  self->_supportStrokes = v82;

  objc_msgSend_supportStrokeTokenRanges(v193, v84, v85, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = (void *)objc_msgSend_mutableCopy(v89, v90, v91, v92, v93, v94);

  for (j = 0; j < objc_msgSend_count(v95, v96, v97, v98, v99, v100); ++j)
  {
    objc_msgSend_objectAtIndexedSubscript_(v95, v102, j, v103, v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_objectAtIndexedSubscript_(v106, v108, 0, v109, v110, v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend_intValue(v112, v113, v114, v115, v116, v117);
    objc_msgSend_numberWithInteger_(v107, v119, v194 + v118, v120, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v224[0] = v123;
    objc_msgSend_objectAtIndexedSubscript_(v106, v124, 1, v125, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v224[1] = v128;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v129, (uint64_t)v224, 2, v130, v131);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_atIndexedSubscript_(v95, v133, (uint64_t)v132, j, v134, v135);

  }
  objc_msgSend_arrayByAddingObjectsFromArray_(self->_supportStrokeTokenRanges, v102, (uint64_t)v95, v103, v104, v105);
  v136 = (NSArray *)objc_claimAutoreleasedReturnValue();
  supportStrokeTokenRanges = self->_supportStrokeTokenRanges;
  self->_supportStrokeTokenRanges = v136;

  objc_msgSend_points(self, v138, v139, v140, v141, v142);
  if (v193)
  {
    objc_msgSend_points(v193, v143, v144, v145, v146, v147);
    v148 = (char *)v215;
    v149 = v216;
  }
  else
  {
    v149 = 0;
    v148 = 0;
    v215 = 0;
    v216 = 0;
    v217 = 0;
  }
  sub_1BE761C38((uint64_t)&v218, *(uint64_t *)v219, v148, v149, (v149 - v148) >> 4);
  if (&self->_points != (vector<CGPoint, std::allocator<CGPoint>> *)&v218)
    sub_1BE6F5A88(&self->_points.__begin_, (char *)v218, *(char **)v219, (uint64_t)(*(_QWORD *)v219 - (_QWORD)v218) >> 4);
  objc_msgSend_strokePoints(self, v150, v151, v152, v153, v154);
  if (v193)
  {
    objc_msgSend_strokePoints(v193, v155, v156, v157, v158, v159);
    v160 = (char **)v210;
    v161 = (uint64_t)v211;
  }
  else
  {
    v161 = 0;
    v160 = 0;
    v210 = 0;
    v211 = 0;
    v212 = 0;
  }
  sub_1BE761E68((char ***)&v213, (uint64_t)v214, v160, v161, 0xAAAAAAAAAAAAAAABLL * ((v161 - (uint64_t)v160) >> 3));
  if (&self->_strokePoints != (vector<std::vector<CGPoint>, std::allocator<std::vector<CGPoint>>> *)&v213)
    sub_1BE76157C((uint64_t)&self->_strokePoints, (char **)v213, (uint64_t)v214, 0xAAAAAAAAAAAAAAABLL * ((v214 - (_BYTE *)v213) >> 3));
  v162 = (CGRect *)MEMORY[0x1E0C9D648];
  MinX = CGRectGetMinX(*MEMORY[0x1E0C9D648]);
  MaxX = CGRectGetMaxX(*v162);
  MinY = CGRectGetMinY(*v162);
  MaxY = CGRectGetMaxY(*v162);
  begin = self->_principalLines.base.__begin_;
  self->_boundingBox.x_min = MinX;
  self->_boundingBox.x_max = MaxX;
  self->_boundingBox.y_min = MinY;
  self->_boundingBox.y_max = MaxY;
  x = begin->x;
  objc_msgSend_principalLines(v193, v169, v170, v171, v172, v173);
  v179 = *(double *)v204;
  if (__p)
  {
    v209 = (char *)__p;
    operator delete(__p);
  }
  if (v206)
  {
    v207 = (char *)v206;
    operator delete(v206);
  }
  if (v204)
  {
    v205 = (char *)v204;
    operator delete(v204);
  }
  p_principalLines = &self->_principalLines;
  if (v202)
  {
    v203 = (char *)v202;
    operator delete(v202);
  }
  if (x >= v179)
  {
    objc_msgSend_principalLines(v193, v174, v175, v176, v177, v178);
    CoreHandwriting::merge_lines((CoreHandwriting *)v195, (const CoreHandwriting::PrincipalLines *)&self->_principalLines, (uint64_t)&v202);
    if (p_principalLines == (PrincipalLines *)&v202)
      goto LABEL_34;
  }
  else
  {
    objc_msgSend_principalLines(v193, v174, v175, v176, v177, v178);
    CoreHandwriting::merge_lines((CoreHandwriting *)&self->_principalLines, (const CoreHandwriting::PrincipalLines *)v195, (uint64_t)&v202);
    if (p_principalLines == (PrincipalLines *)&v202)
      goto LABEL_34;
  }
  sub_1BE6F5A88(&self->_principalLines.descender.__begin_, (char *)v202, v203, (v203 - (_BYTE *)v202) >> 4);
  sub_1BE6F5A88(&self->_principalLines.base.__begin_, (char *)v204, v205, (v205 - (_BYTE *)v204) >> 4);
  sub_1BE6F5A88(&self->_principalLines.median.__begin_, (char *)v206, v207, (v207 - (_BYTE *)v206) >> 4);
  sub_1BE6F5A88(&self->_principalLines.top.__begin_, (char *)__p, v209, (v209 - (_BYTE *)__p) >> 4);
LABEL_34:
  if (__p)
  {
    v209 = (char *)__p;
    operator delete(__p);
  }
  if (v206)
  {
    v207 = (char *)v206;
    operator delete(v206);
  }
  if (v204)
  {
    v205 = (char *)v204;
    operator delete(v204);
  }
  if (v202)
  {
    v203 = (char *)v202;
    operator delete(v202);
  }
  if (v200)
  {
    v201 = v200;
    operator delete(v200);
  }
  if (v198)
  {
    v199 = v198;
    operator delete(v198);
  }
  if (v196)
  {
    v197 = v196;
    operator delete(v196);
  }
  if (v195[0])
  {
    v195[1] = v195[0];
    operator delete(v195[0]);
  }
  v181 = (char *)v210;
  if (v210)
  {
    v182 = v211;
    v183 = v210;
    if (v211 != v210)
    {
      v184 = v211;
      do
      {
        v186 = (void *)*((_QWORD *)v184 - 3);
        v184 -= 24;
        v185 = v186;
        if (v186)
        {
          *((_QWORD *)v182 - 2) = v185;
          operator delete(v185);
        }
        v182 = v184;
      }
      while (v184 != v181);
      v183 = v210;
    }
    v211 = v181;
    operator delete(v183);
  }
  v187 = (char *)v213;
  if (v213)
  {
    v188 = v214;
    v189 = v213;
    if (v214 != v213)
    {
      v190 = v214;
      do
      {
        v192 = (void *)*((_QWORD *)v190 - 3);
        v190 -= 24;
        v191 = v192;
        if (v192)
        {
          *((_QWORD *)v188 - 2) = v191;
          operator delete(v191);
        }
        v188 = v190;
      }
      while (v190 != v187);
      v189 = v213;
    }
    v214 = v187;
    operator delete(v189);
  }
  if (v215)
  {
    v216 = (char *)v215;
    operator delete(v215);
  }
  if (v218)
  {
    *(_QWORD *)v219 = v218;
    operator delete(v218);
  }

}

- (id)tokenDistanceSizes:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
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
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  size_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t i;
  void *v50;
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
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  double *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  size_t v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  unint64_t v89;
  void *v90;
  size_t v91;
  unint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  unint64_t v98;
  void *v99;
  size_t v100;
  unint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  unint64_t v105;
  char *v106;
  unint64_t v107;
  void *v108;
  size_t v109;
  unint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  unint64_t v114;
  char *v115;
  unint64_t v116;
  void *v117;
  id v118;
  void *v120;
  id obj;
  uint64_t v122;
  _BOOL4 v123;
  void *v124[2];
  void *v125[2];
  const char *v126;
  void *v127[2];
  void *__p[2];
  const char *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  void *__dst[2];
  void *v135[2];
  __int128 v136;
  void *v137[2];
  void *v138[2];
  __int128 v139;
  _BYTE v140[128];
  uint64_t v141;

  v123 = a3;
  v141 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, a3, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_count(self->_tokens, v8, v9, v10, v11, v12) <= 1)
  {
    v18 = v7;
    goto LABEL_125;
  }
  objc_msgSend_splitIntoTokens(self, v13, v14, v15, v16, v17);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v120, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v24;
  if (v24)
  {
    objc_msgSend_principalLines(v24, v25, v26, v27, v28, v29);
  }
  else
  {
    *(_OWORD *)v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    *(_OWORD *)v137 = 0u;
    *(_OWORD *)__dst = 0u;
    *(_OWORD *)v135 = 0u;
  }

  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v36 = objc_msgSend_count(v120, v31, v32, v33, v34, v35);
  objc_msgSend_subarrayWithRange_(v120, v37, 1, v36 - 1, v38, v39);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v130, (uint64_t)v140, 16, v41);
  if (v47)
  {
    v122 = *(_QWORD *)v131;
    v48 = v7;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v131 != v122)
          objc_enumerationMutation(obj);
        v50 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * i);
        objc_msgSend_tokens(v50, v42, v43, v44, v45, v46);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v51, v52, v53, v54, v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend_properties(v57, v58, v59, v60, v61, v62);

        if (!v123 || (v63 & 0x20) != 0)
        {
          v67 = (double *)v135[1];
          objc_msgSend_principalLines(v50, v42, v64, v44, v45, v46);
          v73 = v67[2];
          v74 = v67[3];
          v76 = *(double *)v125[1];
          v75 = *((double *)v125[1] + 1);
          if (__p[1])
          {
            v129 = (const char *)__p[1];
            operator delete(__p[1]);
          }
          if (v127[0])
          {
            v127[1] = v127[0];
            operator delete(v127[0]);
          }
          if (v125[1])
          {
            v126 = (const char *)v125[1];
            operator delete(v125[1]);
          }
          if (v124[0])
          {
            v124[1] = v124[0];
            operator delete(v124[0]);
          }
          objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v68, v69, v70, v71, v72, sqrt((v74 - v75) * (v74 - v75) + (v73 - v76) * (v73 - v76)));
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v48, v78, (uint64_t)v77, v79, v80, v81);

        }
        else if (!v50)
        {
          v65 = 0;
          v66 = 0;
          *(_OWORD *)__p = 0u;
          v129 = 0;
          v126 = 0;
          *(_OWORD *)v127 = 0u;
          *(_OWORD *)v124 = 0u;
          *(_OWORD *)v125 = 0u;
          goto LABEL_26;
        }
        objc_msgSend_principalLines(v50, v42, v64, v44, v45, v46);
        v65 = (const char *)v124[1];
        v66 = (const char *)v124[0];
LABEL_26:
        v82 = v65 - v66;
        v83 = (v65 - v66) >> 4;
        v84 = (uint64_t)v135[0];
        v85 = (char *)__dst[0];
        if (v83 <= ((char *)v135[0] - (char *)__dst[0]) >> 4)
        {
          v89 = ((char *)__dst[1] - (char *)__dst[0]) >> 4;
          if (v89 >= v83)
          {
            if (v65 == v66)
              goto LABEL_46;
            v90 = __dst[0];
            v42 = v66;
            goto LABEL_45;
          }
          if (__dst[1] != __dst[0])
          {
            memmove(__dst[0], v66, (char *)__dst[1] - (char *)__dst[0]);
            v85 = (char *)__dst[1];
          }
          v42 = &v66[16 * v89];
          v82 = v65 - v42;
          if (v65 != v42)
          {
            v90 = v85;
LABEL_45:
            memmove(v90, v42, v82);
          }
        }
        else
        {
          if (__dst[0])
          {
            __dst[1] = __dst[0];
            operator delete(__dst[0]);
            v84 = 0;
            __dst[0] = 0;
            __dst[1] = 0;
            v135[0] = 0;
          }
          if ((v82 & 0x8000000000000000) != 0)
            goto LABEL_126;
          v86 = v84 >> 3;
          if (v84 >> 3 <= v83)
            v86 = (v65 - v66) >> 4;
          v87 = (unint64_t)v84 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v86;
          if (v87 >> 60)
LABEL_126:
            sub_1BE61F930();
          v88 = (char *)operator new(16 * v87);
          v85 = v88;
          __dst[0] = v88;
          __dst[1] = v88;
          v135[0] = &v88[16 * v87];
          if (v65 != v66)
            memcpy(v88, v66, v65 - v66);
        }
LABEL_46:
        __dst[1] = &v85[v82];
        v91 = (char *)v126 - (char *)v125[1];
        v92 = ((char *)v126 - (char *)v125[1]) >> 4;
        v93 = *((_QWORD *)&v136 + 1);
        v94 = (char *)v135[1];
        if (v92 <= (uint64_t)(*((_QWORD *)&v136 + 1) - (unint64_t)v135[1]) >> 4)
        {
          v98 = (uint64_t)(v136 - (unint64_t)v135[1]) >> 4;
          if (v98 >= v92)
          {
            if (v126 == v125[1])
              goto LABEL_66;
            v99 = v135[1];
            v42 = (const char *)v125[1];
            goto LABEL_65;
          }
          if ((void *)v136 != v135[1])
          {
            memmove(v135[1], v125[1], v136 - (unint64_t)v135[1]);
            v94 = (char *)v136;
          }
          v42 = (char *)v125[1] + 16 * v98;
          v91 = v126 - v42;
          if (v126 != v42)
          {
            v99 = v94;
LABEL_65:
            memmove(v99, v42, v91);
          }
        }
        else
        {
          if (v135[1])
          {
            *(void **)&v136 = v135[1];
            operator delete(v135[1]);
            v93 = 0;
            v135[1] = 0;
            v136 = 0uLL;
          }
          if ((v91 & 0x8000000000000000) != 0)
            goto LABEL_126;
          v95 = v93 >> 3;
          if (v93 >> 3 <= v92)
            v95 = ((char *)v126 - (char *)v125[1]) >> 4;
          v96 = (unint64_t)v93 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v95;
          if (v96 >> 60)
            goto LABEL_126;
          v97 = (char *)operator new(16 * v96);
          v94 = v97;
          v135[1] = v97;
          *(_QWORD *)&v136 = v97;
          *((_QWORD *)&v136 + 1) = &v97[16 * v96];
          if (v126 != v125[1])
            memcpy(v97, v125[1], v91);
        }
LABEL_66:
        *(_QWORD *)&v136 = &v94[v91];
        v100 = (char *)v127[1] - (char *)v127[0];
        v101 = ((char *)v127[1] - (char *)v127[0]) >> 4;
        v102 = (uint64_t)v138[0];
        v103 = (char *)v137[0];
        if (v101 <= ((char *)v138[0] - (char *)v137[0]) >> 4)
        {
          v107 = ((char *)v137[1] - (char *)v137[0]) >> 4;
          if (v107 >= v101)
          {
            if (v127[1] == v127[0])
              goto LABEL_86;
            v108 = v137[0];
            v42 = (const char *)v127[0];
            goto LABEL_85;
          }
          if (v137[1] != v137[0])
          {
            memmove(v137[0], v127[0], (char *)v137[1] - (char *)v137[0]);
            v103 = (char *)v137[1];
          }
          v42 = (char *)v127[0] + 16 * v107;
          v100 = (char *)v127[1] - (char *)v42;
          if (v127[1] != v42)
          {
            v108 = v103;
LABEL_85:
            memmove(v108, v42, v100);
          }
        }
        else
        {
          if (v137[0])
          {
            v137[1] = v137[0];
            operator delete(v137[0]);
            v102 = 0;
            v137[0] = 0;
            v137[1] = 0;
            v138[0] = 0;
          }
          if ((v100 & 0x8000000000000000) != 0)
            goto LABEL_126;
          v104 = v102 >> 3;
          if (v102 >> 3 <= v101)
            v104 = ((char *)v127[1] - (char *)v127[0]) >> 4;
          v105 = (unint64_t)v102 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v104;
          if (v105 >> 60)
            goto LABEL_126;
          v106 = (char *)operator new(16 * v105);
          v103 = v106;
          v137[0] = v106;
          v137[1] = v106;
          v138[0] = &v106[16 * v105];
          if (v127[1] != v127[0])
            memcpy(v106, v127[0], v100);
        }
LABEL_86:
        v137[1] = &v103[v100];
        v109 = (char *)v129 - (char *)__p[1];
        v110 = ((char *)v129 - (char *)__p[1]) >> 4;
        v111 = *((_QWORD *)&v139 + 1);
        v112 = (char *)v138[1];
        if (v110 <= (uint64_t)(*((_QWORD *)&v139 + 1) - (unint64_t)v138[1]) >> 4)
        {
          v43 = v139 - (unint64_t)v138[1];
          v116 = (uint64_t)(v139 - (unint64_t)v138[1]) >> 4;
          if (v116 >= v110)
          {
            v7 = v48;
            if (v129 == __p[1])
              goto LABEL_107;
            v117 = v138[1];
            v42 = (const char *)__p[1];
            goto LABEL_106;
          }
          v7 = v48;
          if ((void *)v139 != v138[1])
          {
            memmove(v138[1], __p[1], v43);
            v112 = (char *)v139;
          }
          v42 = (char *)__p[1] + 16 * v116;
          v109 = v129 - v42;
          if (v129 != v42)
          {
            v117 = v112;
LABEL_106:
            memmove(v117, v42, v109);
          }
        }
        else
        {
          if (v138[1])
          {
            *(void **)&v139 = v138[1];
            operator delete(v138[1]);
            v111 = 0;
            v138[1] = 0;
            v139 = 0uLL;
          }
          if ((v109 & 0x8000000000000000) != 0)
            goto LABEL_126;
          v113 = v111 >> 3;
          if (v111 >> 3 <= v110)
            v113 = ((char *)v129 - (char *)__p[1]) >> 4;
          v114 = (unint64_t)v111 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v113;
          if (v114 >> 60)
            goto LABEL_126;
          v115 = (char *)operator new(16 * v114);
          v112 = v115;
          v138[1] = v115;
          *(_QWORD *)&v139 = v115;
          *((_QWORD *)&v139 + 1) = &v115[16 * v114];
          if (v129 != __p[1])
            memcpy(v115, __p[1], v109);
          v7 = v48;
        }
LABEL_107:
        *(_QWORD *)&v139 = &v112[v109];
        if (__p[1])
        {
          v129 = (const char *)__p[1];
          operator delete(__p[1]);
        }
        if (v127[0])
        {
          v127[1] = v127[0];
          operator delete(v127[0]);
        }
        if (v125[1])
        {
          v126 = (const char *)v125[1];
          operator delete(v125[1]);
        }
        if (v124[0])
        {
          v124[1] = v124[0];
          operator delete(v124[0]);
        }
      }
      v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v130, (uint64_t)v140, 16, v46);
    }
    while (v47);
  }

  v118 = v7;
  if (v138[1])
  {
    *(void **)&v139 = v138[1];
    operator delete(v138[1]);
  }
  if (v137[0])
  {
    v137[1] = v137[0];
    operator delete(v137[0]);
  }
  if (v135[1])
  {
    *(void **)&v136 = v135[1];
    operator delete(v135[1]);
  }
  if (__dst[0])
  {
    __dst[1] = __dst[0];
    operator delete(__dst[0]);
  }

LABEL_125:
  return v7;
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
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = self->_tokens;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v28, (uint64_t)v32, 16, v4);
  if (v10)
  {
    v11 = *(_QWORD *)v29;
    v12 = &stru_1E77F6F28;
    do
    {
      v13 = 0;
      v14 = v12;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v2);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
        if ((objc_msgSend_properties(v15, v5, v6, v7, v8, v9, (_QWORD)v28) & 0x20) != 0)
        {
          objc_msgSend_stringByAppendingString_(v14, v16, (uint64_t)CFSTR(" "), v18, v19, v20);
          v21 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v21;
        }
        objc_msgSend_string(v15, v16, v17, v18, v19, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v14, v23, (uint64_t)v22, v24, v25, v26);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v12;
      }
      while (v10 != v13);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v28, (uint64_t)v32, 16, v9);
    }
    while (v10);
  }
  else
  {
    v12 = &stru_1E77F6F28;
  }

  return v12;
}

- (double)lineHeight
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
  double *v12;
  BOOL v13;
  double *v14;
  double *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v26;
  void *v27;
  double *v28;
  double *v29;
  void *__p;
  void *v31;
  double *v32;
  double *v33;
  void *v34;
  void *v35;

  objc_msgSend_principalLines(self, a2, v2, v3, v4, v5);
  objc_msgSend_principalLines(self, v7, v8, v9, v10, v11);
  v12 = v28;
  if ((char *)v33 - (char *)v32 == (char *)v29 - (char *)v28)
  {
    v13 = v32 == v33 || v28 == v29;
    v14 = v28;
    v15 = v32;
    if (v13)
    {
LABEL_7:
      if (v15 == v33)
      {
        v16 = 0.0;
        if (v14 == v29)
          goto LABEL_12;
      }
    }
    else
    {
      v15 = v32;
      v14 = v28;
      while (*v15 == *v14 && v15[1] == v14[1])
      {
        v15 += 2;
        v14 += 2;
        if (v15 == v33 || v14 == v29)
          goto LABEL_7;
      }
    }
  }
  v18 = *v32;
  v17 = v32[1];
  v19 = (v32[3] - v17) / (v32[2] - *v32);
  v20 = v28[1];
  v21 = (v28[3] - v20) / (v28[2] - *v28);
  v22 = v20 - v21 * *v28;
  v23 = *v32;
  if (v19 != 0.0)
    v23 = (v17 - -1.0 / v19 * v18 - v22) / (v21 - -1.0 / v19);
  v16 = sqrt((v17 - (v22 + v21 * v23)) * (v17 - (v22 + v21 * v23)) + (v18 - v23) * (v18 - v23));
LABEL_12:
  if (__p)
  {
    operator delete(__p);
    v12 = v28;
  }
  if (v12)
    operator delete(v12);
  if (v27)
    operator delete(v27);
  if (v26)
    operator delete(v26);
  if (v35)
    operator delete(v35);
  if (v34)
    operator delete(v34);
  if (v32)
    operator delete(v32);
  if (v31)
    operator delete(v31);
  return v16;
}

- (CGPoint)anchorPoint
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
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  double *v22;
  void *v23;
  void *__p;
  CGPoint result;

  objc_msgSend_principalLines(self, a2, v2, v3, v4, v5);
  v13 = *v22;
  v12 = v22[1];
  if (__p)
    operator delete(__p);
  if (v23)
    operator delete(v23);
  if (v22)
    operator delete(v22);
  if (v21)
    operator delete(v21);
  if (objc_msgSend_strokeClassification(self, v7, v8, v9, v10, v11) == 2)
  {
    objc_msgSend_principalLines(self, v14, v15, v16, v17, v18);
    v13 = v22[2];
    v12 = v22[3];
    if (__p)
      operator delete(__p);
    if (v23)
      operator delete(v23);
    if (v22)
      operator delete(v22);
    if (v21)
      operator delete(v21);
  }
  v19 = v13;
  v20 = v12;
  result.y = v20;
  result.x = v19;
  return result;
}

- (CGPoint)insertionPoint
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
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  double *v22;
  void *v23;
  void *__p;
  CGPoint result;

  objc_msgSend_principalLines(self, a2, v2, v3, v4, v5);
  v13 = v22[2];
  v12 = v22[3];
  if (__p)
    operator delete(__p);
  if (v23)
    operator delete(v23);
  if (v22)
    operator delete(v22);
  if (v21)
    operator delete(v21);
  if (objc_msgSend_strokeClassification(self, v7, v8, v9, v10, v11) == 2)
  {
    objc_msgSend_principalLines(self, v14, v15, v16, v17, v18);
    v13 = *v22;
    v12 = v22[1];
    if (__p)
      operator delete(__p);
    if (v23)
      operator delete(v23);
    if (v22)
      operator delete(v22);
    if (v21)
      operator delete(v21);
  }
  v19 = v13;
  v20 = v12;
  result.y = v20;
  result.x = v19;
  return result;
}

- (double)orientation
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
  double v12;
  double v13;
  double v14;
  double v15;
  void *v17;
  double *v18;
  void *v19;
  void *__p;
  void *v21;
  double *v22;
  void *v23;
  void *v24;

  objc_msgSend_principalLines(self, a2, v2, v3, v4, v5);
  objc_msgSend_principalLines(self, v7, v8, v9, v10, v11);
  v12 = v18[2];
  v13 = v18[3];
  v14 = *v22;
  v15 = v22[1];
  if (__p)
    operator delete(__p);
  if (v19)
    operator delete(v19);
  if (v18)
    operator delete(v18);
  if (v17)
    operator delete(v17);
  if (v24)
    operator delete(v24);
  if (v23)
    operator delete(v23);
  if (v22)
    operator delete(v22);
  if (v21)
    operator delete(v21);
  return -atan2(v13 - v15, v12 - v14);
}

- (vector<CGPoint,)points
{
  CHTransformedTextSegment *v4;
  vector<CGPoint, std::allocator<CGPoint>> *result;
  CGPoint *end;
  CGPoint *begin;
  int64_t v8;
  CGPoint *v9;
  CGPoint *v10;
  void *__p;
  char *v12;
  void *v13[3];

  v4 = self;
  objc_sync_enter(v4);
  if (v4->_points.__end_ == v4->_points.__begin_)
  {
    CoreHandwriting::getPointSet(v4->_textStrokes, v13);
    sub_1BE7F8D14((double **)v13, (float64x2_t *)&v4->_transform, (float64x2_t **)&__p);
    if (&v4->_points != (vector<CGPoint, std::allocator<CGPoint>> *)&__p)
      sub_1BE6F5A88(&v4->_points.__begin_, (char *)__p, v12, (v12 - (_BYTE *)__p) >> 4);
    if (__p)
    {
      v12 = (char *)__p;
      operator delete(__p);
    }
    if (v13[0])
    {
      v13[1] = v13[0];
      operator delete(v13[0]);
    }
  }
  objc_sync_exit(v4);

  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  begin = v4->_points.__begin_;
  end = v4->_points.__end_;
  v8 = (char *)end - (char *)begin;
  if (end != begin)
  {
    if (v8 < 0)
      sub_1BE61F930();
    v9 = (CGPoint *)operator new((char *)end - (char *)begin);
    retstr->__begin_ = v9;
    v10 = &v9[v8 >> 4];
    retstr->__end_cap_.__value_ = v10;
    result = (vector<CGPoint, std::allocator<CGPoint>> *)memcpy(v9, begin, v8);
    retstr->__end_ = v10;
  }
  return result;
}

- (vector<std::vector<CGPoint>,)strokePoints
{
  CHTransformedTextSegment *v4;
  char **p_strokePoints;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float64x2_t *p_transform;
  uint64_t i;
  void *v15;
  _QWORD *end;
  uint64_t v17;
  float64x2_t *v18;
  uint64_t v19;
  char **v20;
  void *v21;
  int64_t v22;
  char *v23;
  char *v24;
  char *v25;
  __compressed_pair<std::vector<CGPoint> *, std::allocator<std::vector<CGPoint>>> *p_end_cap;
  uint64_t v27;
  uint64_t begin;
  vector<std::vector<CGPoint>, std::allocator<std::vector<CGPoint>>> *result;
  unint64_t v30;
  _QWORD *v31;
  vector<std::vector<CGPoint>, std::allocator<std::vector<CGPoint>>> *v32;
  CHTransformedTextSegment *v33;
  NSArray *obj;
  void *__p;
  _BYTE *v36;
  void *v37[3];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  p_strokePoints = (char **)&v4->_strokePoints;
  v32 = retstr;
  if (v4->_strokePoints.__end_ == v4->_strokePoints.__begin_)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v4->_textStrokes;
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v38, (uint64_t)v43, 16, v7);
    if (v11)
    {
      v12 = *(_QWORD *)v39;
      p_transform = (float64x2_t *)&v4->_transform;
      v33 = v4;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(obj);
          v42 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v8, (uint64_t)&v42, 1, v9, v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          CoreHandwriting::getPointSet(v15, v37);

          sub_1BE7F8D14((double **)v37, p_transform, (float64x2_t **)&__p);
          end = v4->_strokePoints.__end_;
          if (end >= v4->_strokePoints.__end_cap_.__value_)
          {
            v25 = sub_1BE761A3C(p_strokePoints, (uint64_t)&__p);
          }
          else
          {
            v17 = v11;
            v18 = p_transform;
            v19 = v12;
            v20 = p_strokePoints;
            *end = 0;
            end[1] = 0;
            end[2] = 0;
            v21 = __p;
            v22 = v36 - (_BYTE *)__p;
            if (v36 != __p)
            {
              if (v22 < 0)
                sub_1BE61F930();
              v23 = (char *)operator new(v36 - (_BYTE *)__p);
              *end = v23;
              end[1] = v23;
              v24 = &v23[16 * (v22 >> 4)];
              end[2] = v24;
              memcpy(v23, v21, v22);
              end[1] = v24;
              retstr = v32;
            }
            v25 = (char *)(end + 3);
            v33->_strokePoints.__end_ = end + 3;
            p_strokePoints = v20;
            v12 = v19;
            p_transform = v18;
            v11 = v17;
            v4 = v33;
          }
          v4->_strokePoints.__end_ = v25;
          if (__p)
          {
            v36 = __p;
            operator delete(__p);
          }
          if (v37[0])
          {
            v37[1] = v37[0];
            operator delete(v37[0]);
          }
        }
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v38, (uint64_t)v43, 16, v10);
      }
      while (v11);
    }

  }
  objc_sync_exit(v4);

  retstr->__end_cap_.__value_ = 0;
  p_end_cap = &retstr->__end_cap_;
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  begin = (uint64_t)v4->_strokePoints.__begin_;
  v27 = (uint64_t)v4->_strokePoints.__end_;
  result = (vector<std::vector<CGPoint>, std::allocator<std::vector<CGPoint>>> *)(v27 - begin);
  if (v27 != begin)
  {
    v30 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)result >> 3);
    if (v30 >= 0xAAAAAAAAAAAAAABLL)
      sub_1BE61F930();
    v31 = operator new((size_t)result);
    v32->__begin_ = v31;
    v32->__end_ = v31;
    v32->__end_cap_.__value_ = &v31[3 * v30];
    result = (vector<std::vector<CGPoint>, std::allocator<std::vector<CGPoint>>> *)sub_1BE7617F0((uint64_t)p_end_cap, begin, v27, v31);
    v32->__end_ = result;
  }
  return result;
}

- (vector<CGPoint,)filteredPoints:(CHTransformedTextSegment *)self
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSArray *textStrokes;
  uint64_t v10;
  void *v11;
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
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  _BYTE *v29;
  _BYTE *v30;
  int64_t v31;
  CGPoint *v32;
  CGPoint *v33;
  vector<CGPoint, std::allocator<CGPoint>> *result;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  __n128 (*v39)(__n128 *, __n128 *);
  void (*v40)(uint64_t);
  void *v41;
  void *__p;
  void *v43;
  uint64_t v44;
  _QWORD v45[5];
  CGSize v46;

  textStrokes = self->_textStrokes;
  v10 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = sub_1BE75C438;
  v45[3] = &unk_1E77F4B00;
  v45[4] = self;
  v46 = a4;
  objc_msgSend_indexesOfObjectsPassingTest_(textStrokes, a3, (uint64_t)v45, v4, v5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v11, v12, v13, v14, v15, v16))
  {
    v22 = (void *)MEMORY[0x1E0CB36B8];
    v23 = objc_msgSend_count(self->_textStrokes, v17, v18, v19, v20, v21);
    objc_msgSend_indexSetWithIndexesInRange_(v22, v24, 0, v23, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v27;
  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x4812000000;
  v39 = sub_1BE75A348;
  v40 = sub_1BE75A36C;
  v41 = &unk_1BE94989A;
  __p = 0;
  v43 = 0;
  v44 = 0;
  v35[0] = v10;
  v35[1] = 3221225472;
  v35[2] = sub_1BE75C4D8;
  v35[3] = &unk_1E77F2EF8;
  v35[4] = self;
  v35[5] = &v36;
  objc_msgSend_enumerateIndexesUsingBlock_(v11, v17, (uint64_t)v35, v19, v20, v21);
  v28 = v37;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  v30 = (_BYTE *)v28[6];
  v29 = (_BYTE *)v28[7];
  v31 = v29 - v30;
  if (v29 != v30)
  {
    if (v31 < 0)
      sub_1BE61F930();
    v32 = (CGPoint *)operator new(v29 - v30);
    retstr->__begin_ = v32;
    v33 = &v32[v31 >> 4];
    retstr->__end_cap_.__value_ = v33;
    memcpy(v32, v30, v31);
    retstr->__end_ = v33;
  }
  _Block_object_dispose(&v36, 8);
  if (__p)
  {
    v43 = __p;
    operator delete(__p);
  }

  return result;
}

- (vector<CGPoint,)clippedPoints:(CHTransformedTextSegment *)self min:(SEL)a3 max:(CGSize)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double y;
  double x;
  double v12;
  double v13;
  double width;
  CGPoint *v17;
  unint64_t v18;
  vector<CGPoint, std::allocator<CGPoint>> *result;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double *v30;
  char *v31;
  _BYTE *v32;
  _BYTE *v33;
  int64_t v34;
  char *v35;
  double *v36;
  void *v37;
  double *v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  long double v53;
  long double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  long double v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double *v72;
  double *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  long double v80;
  double v81;
  BOOL v82;
  unint64_t v84;
  CGPoint *v85;
  CGPoint *v86;
  CGPoint *value;
  CGPoint *begin;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  uint64_t v94;
  CGPoint *v95;
  CGPoint *v96;
  CGPoint *v97;
  double v98;
  double height;
  void *__p;
  double *v101;
  void *v102;
  void *v103;
  char *v104;

  y = a6.y;
  x = a6.x;
  v12 = a5.y;
  v13 = a5.x;
  height = a4.height;
  width = a4.width;
  v17 = 0;
  v18 = 0;
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  v98 = sqrt((a5.y - a6.y) * (a5.y - a6.y) + (a5.x - a6.x) * (a5.x - a6.x));
  while (1)
  {
    result = (vector<CGPoint, std::allocator<CGPoint>> *)objc_msgSend_count(self->_textStrokes, a3, v6, v7, v8, v9);
    if (v18 >= (unint64_t)result)
      return result;
    objc_msgSend_objectAtIndexedSubscript_(self->_textStrokes, v20, v18, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokePoints(self, v25, v26, v27, v28, v29);
    v30 = (double *)__p;
    v31 = (char *)__p + 24 * v18;
    v103 = 0;
    v104 = 0;
    v102 = 0;
    v33 = *(_BYTE **)v31;
    v32 = (_BYTE *)*((_QWORD *)v31 + 1);
    v34 = v32 - v33;
    if (v32 != v33)
    {
      if (v34 < 0)
        sub_1BE61F930();
      v102 = operator new(v32 - v33);
      v103 = v102;
      v35 = (char *)v102 + 16 * (v34 >> 4);
      v104 = v35;
      memcpy(v102, v33, v34);
      v103 = v35;
    }
    v36 = v101;
    v37 = v30;
    if (v101 != v30)
    {
      v38 = v101;
      do
      {
        v40 = (void *)*((_QWORD *)v38 - 3);
        v38 -= 3;
        v39 = v40;
        if (v40)
        {
          *((_QWORD *)v36 - 2) = v39;
          operator delete(v39);
        }
        v36 = v38;
      }
      while (v38 != v30);
      v37 = __p;
    }
    v101 = v30;
    operator delete(v37);
    objc_msgSend_bounds(v24, v41, v42, v43, v44, v45);
    if (v51 * self->_transform.a > width
      || (objc_msgSend_bounds(v24, v46, v47, v48, v49, v50), v52 * self->_transform.d > height))
    {
      objc_msgSend_orientation(self, v46, v47, v48, v49, v50);
      v54 = tan(v53);
      sub_1BE7F4A5C((double **)&v102, (uint64_t *)&__p, -v54, v13, v12, x, y);
      v60 = (double *)v102;
      if (v102 == v103)
      {
        v62 = -1.79769313e308;
        v61 = 1.79769313e308;
      }
      else
      {
        v61 = 1.79769313e308;
        v62 = -1.79769313e308;
        do
        {
          v63 = *v60;
          v60 += 2;
          v64 = v63;
          if (v61 > v63)
            v61 = v64;
          if (v62 < v64)
            v62 = v64;
        }
        while (v60 != v103);
      }
      objc_msgSend_orientation(self, v55, v56, v57, v58, v59);
      v71 = cos(v65);
      v73 = (double *)__p;
      v72 = v101;
      if (v101 != __p)
      {
        v74 = v62 - v61;
        v75 = 1.79769313e308;
        v76 = -1.79769313e308;
        v77 = v74 / v71;
        do
        {
          v78 = *v73;
          v73 += 2;
          v79 = v78;
          if (v75 > v78)
            v75 = v79;
          if (v76 < v79)
            v76 = v79;
        }
        while (v73 != v101);
        objc_msgSend_orientation(self, v66, v67, v68, v69, v70);
        v81 = (v76 - v75) / cos(v80);
        if (v81 <= 0.0)
        {
          v72 = (double *)__p;
        }
        else
        {
          v82 = v81 / v77 < 0.8 && v81 / v98 < 0.5;
          v72 = (double *)__p;
          if (!v82 && v101 != __p)
          {
            v84 = 0;
            v85 = v17;
            while (1)
            {
              v86 = (CGPoint *)&v72[2 * v84];
              value = retstr->__end_cap_.__value_;
              if (v85 >= value)
                break;
              *v85 = *v86;
              v17 = v85 + 1;
LABEL_41:
              retstr->__end_ = v17;
              ++v84;
              v72 = (double *)__p;
              v85 = v17;
              if (v84 >= ((char *)v101 - (_BYTE *)__p) >> 4)
                goto LABEL_59;
            }
            begin = retstr->__begin_;
            v89 = v85 - retstr->__begin_;
            v90 = v89 + 1;
            if ((unint64_t)(v89 + 1) >> 60)
              sub_1BE61F930();
            v91 = (char *)value - (char *)begin;
            if (v91 >> 3 > v90)
              v90 = v91 >> 3;
            if ((unint64_t)v91 >= 0x7FFFFFFFFFFFFFF0)
              v92 = 0xFFFFFFFFFFFFFFFLL;
            else
              v92 = v90;
            if (v92)
            {
              if (v92 >> 60)
                sub_1BE61F100();
              v93 = (char *)operator new(16 * v92);
              v94 = (uint64_t)&v93[16 * v89];
              *(CGPoint *)v94 = *v86;
              v95 = (CGPoint *)v94;
              if (v85 == begin)
                goto LABEL_52;
              do
              {
LABEL_55:
                v95[-1] = v85[-1];
                --v95;
                --v85;
              }
              while (v85 != begin);
              v85 = retstr->__begin_;
              v97 = (CGPoint *)&v93[16 * v92];
              v17 = (CGPoint *)(v94 + 16);
              retstr->__begin_ = v95;
              retstr->__end_ = (CGPoint *)(v94 + 16);
              retstr->__end_cap_.__value_ = v97;
              if (!v85)
                goto LABEL_41;
            }
            else
            {
              v93 = 0;
              v94 = 16 * v89;
              *(CGPoint *)(16 * v89) = *v86;
              v95 = (CGPoint *)(16 * v89);
              if (v85 != begin)
                goto LABEL_55;
LABEL_52:
              v96 = (CGPoint *)&v93[16 * v92];
              v17 = (CGPoint *)(v94 + 16);
              retstr->__begin_ = v95;
              retstr->__end_ = (CGPoint *)(v94 + 16);
              retstr->__end_cap_.__value_ = v96;
              if (!v85)
                goto LABEL_41;
            }
            operator delete(v85);
            goto LABEL_41;
          }
        }
      }
LABEL_59:
      if (v72)
      {
        v101 = v72;
        operator delete(v72);
      }
    }
    if (v102)
    {
      v103 = v102;
      operator delete(v102);
    }

    ++v18;
  }
}

- (BoundingBox)boundingBox
{
  CHTransformedTextSegment *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  double x_min;
  double x_max;
  double y_min;
  double y_max;
  double *v23;
  double *v24;
  BoundingBox result;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_boundingBox.x_max - v2->_boundingBox.x_min == 0.0)
  {
    objc_msgSend_points(v2, v3, v4, v5, v6, v7);
    if (v23 == v24)
    {
      v8 = 1.79769313e308;
      v9 = -1.79769313e308;
      v10 = -1.79769313e308;
      v11 = 1.79769313e308;
      if (!v23)
        goto LABEL_15;
    }
    else
    {
      v8 = 1.79769313e308;
      v9 = -1.79769313e308;
      v10 = -1.79769313e308;
      v11 = 1.79769313e308;
      v12 = -1.79769313e308;
      v13 = 1.79769313e308;
      v14 = -1.79769313e308;
      v15 = 1.79769313e308;
      v16 = v23;
      do
      {
        v17 = *v16;
        v18 = v16[1];
        v16 += 2;
        if (v15 > v17)
        {
          v11 = v17;
          v15 = v17;
        }
        if (v14 < v17)
        {
          v10 = v17;
          v14 = v17;
        }
        if (v13 > v18)
        {
          v8 = v18;
          v13 = v18;
        }
        if (v12 < v18)
        {
          v9 = v18;
          v12 = v18;
        }
      }
      while (v16 != v24);
      if (!v23)
        goto LABEL_15;
    }
    operator delete(v23);
LABEL_15:
    v2->_boundingBox.x_min = v11;
    v2->_boundingBox.x_max = v10;
    v2->_boundingBox.y_min = v8;
    v2->_boundingBox.y_max = v9;
  }
  objc_sync_exit(v2);

  x_min = v2->_boundingBox.x_min;
  x_max = v2->_boundingBox.x_max;
  y_min = v2->_boundingBox.y_min;
  y_max = v2->_boundingBox.y_max;
  result.y_max = y_max;
  result.y_min = y_min;
  result.x_max = x_max;
  result.x_min = x_min;
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

- (NSArray)textStrokes
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (NSArray)tokens
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (NSArray)supportStrokes
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (NSArray)supportStrokeTokenRanges
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 216, 1);
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[5].d;
  return self;
}

- (void).cxx_destruct
{
  char *begin;
  char *end;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  CGPoint *v9;
  CGPoint *v10;
  CGPoint *v11;
  CGPoint *v12;
  CGPoint *v13;

  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_supportStrokeTokenRanges, 0);
  objc_storeStrong((id *)&self->_supportStrokes, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_textStrokes, 0);
  begin = (char *)self->_strokePoints.__begin_;
  if (begin)
  {
    end = (char *)self->_strokePoints.__end_;
    v5 = self->_strokePoints.__begin_;
    if (end != begin)
    {
      v6 = (char *)self->_strokePoints.__end_;
      do
      {
        v8 = (void *)*((_QWORD *)v6 - 3);
        v6 -= 24;
        v7 = v8;
        if (v8)
        {
          *((_QWORD *)end - 2) = v7;
          operator delete(v7);
        }
        end = v6;
      }
      while (v6 != begin);
      v5 = self->_strokePoints.__begin_;
    }
    self->_strokePoints.__end_ = begin;
    operator delete(v5);
  }
  v9 = self->_points.__begin_;
  if (v9)
  {
    self->_points.__end_ = v9;
    operator delete(v9);
  }
  v10 = self->_principalLines.top.__begin_;
  if (v10)
  {
    self->_principalLines.top.__end_ = v10;
    operator delete(v10);
  }
  v11 = self->_principalLines.median.__begin_;
  if (v11)
  {
    self->_principalLines.median.__end_ = v11;
    operator delete(v11);
  }
  v12 = self->_principalLines.base.__begin_;
  if (v12)
  {
    self->_principalLines.base.__end_ = v12;
    operator delete(v12);
  }
  v13 = self->_principalLines.descender.__begin_;
  if (v13)
  {
    self->_principalLines.descender.__end_ = v13;
    operator delete(v13);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 104) = xmmword_1BE8D68A0;
  *(_OWORD *)((char *)self + 120) = xmmword_1BE8D68A0;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  return self;
}

@end
