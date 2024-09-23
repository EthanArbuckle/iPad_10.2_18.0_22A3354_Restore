@implementation MKSpatialCollider

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

- (void).cxx_destruct
{
  __end_ **begin;

  begin = self->_sortedAnnotationViews.__begin_;
  if (begin)
  {
    self->_sortedAnnotationViews.var0 = begin;
    operator delete(begin);
  }
}

- (id)registeredCollissions
{
  return self->_registeredCollisonPairs;
}

- (MKSpatialCollider)initWithAnnotationViews:(id)a3 previousCollissions:(id)a4 options:(int64_t)a5
{
  MKSpatialCollider *v8;
  MKSpatialCollider *v9;
  _MKSpatialColliderPairSet *v10;
  double v11;
  double v12;
  unint64_t v13;
  __end_ **begin;
  __end_cap_ **var0;
  char *v16;
  __end_cap_ **v17;
  uint64_t v18;
  id *v19;
  __end_cap_ **v20;
  __end_ **v21;
  __end_ **v22;
  __end_ *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  double *v27;
  double v28;
  double v29;
  id *value;
  __end_cap_ **v31;
  __end_cap_ **v32;
  __end_ **v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  __end_ **v39;
  __end_cap_ **v40;
  __end_ **v41;
  __end_ *v42;
  double maxLength;
  double v44;
  uint64_t v45;
  uint64_t *v46;
  unint64_t v47;
  uint64_t v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v54.receiver = self;
  v54.super_class = (Class)MKSpatialCollider;
  v8 = -[MKSpatialCollider init](&v54, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_options = a5;
    if (a4)
      v10 = (_MKSpatialColliderPairSet *)a4;
    else
      v10 = (_MKSpatialColliderPairSet *)objc_opt_new();
    v9->_previousCollisionPairs = v10;
    v9->_registeredCollisonPairs = -[_MKSpatialColliderPairSet initWithCapacity:]([_MKSpatialColliderPairSet alloc], "initWithCapacity:", objc_msgSend(a3, "count"));
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "anyObject"), "superview"), "bounds");
    v9->_isVertical = v12 < v11;
    v13 = objc_msgSend(a3, "count");
    begin = v9->_sortedAnnotationViews.__begin_;
    if (v13 > ((char *)v9->_sortedAnnotationViews.var1.__value_ - (char *)begin) >> 3)
    {
      if (v13 >> 61)
        std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
      var0 = v9->_sortedAnnotationViews.var0;
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MKAnnotationView *>>(v13);
      v17 = (__end_cap_ **)&v16[8 * (var0 - begin)];
      v19 = (id *)&v16[8 * v18];
      v20 = v9->_sortedAnnotationViews.var0;
      v21 = v9->_sortedAnnotationViews.__begin_;
      v22 = v17;
      if (v20 != v21)
      {
        do
        {
          v23 = *--v20;
          *--v22 = v23;
        }
        while (v20 != v21);
        v20 = v9->_sortedAnnotationViews.__begin_;
      }
      v9->_sortedAnnotationViews.__begin_ = v22;
      v9->_sortedAnnotationViews.var0 = v17;
      v9->_sortedAnnotationViews.var1.__value_ = v19;
      if (v20)
        operator delete(v20);
    }
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v24 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v51 != v25)
            objc_enumerationMutation(a3);
          v27 = *(double **)(*((_QWORD *)&v50 + 1) + 8 * i);
          v28 = v27[85];
          v29 = v27[86];
          v31 = v9->_sortedAnnotationViews.var0;
          value = v9->_sortedAnnotationViews.var1.__value_;
          if (v31 >= (__end_cap_ **)value)
          {
            v33 = v9->_sortedAnnotationViews.__begin_;
            v34 = v31 - v33;
            if ((unint64_t)(v34 + 1) >> 61)
              std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
            v35 = (char *)value - (char *)v33;
            v36 = v35 >> 2;
            if (v35 >> 2 <= (unint64_t)(v34 + 1))
              v36 = v34 + 1;
            if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8)
              v37 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v37 = v36;
            if (v37)
              v37 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<MKAnnotationView *>>(v37);
            else
              v38 = 0;
            v39 = (__end_ **)(v37 + 8 * v34);
            *v39 = (__end_ *)v27;
            v32 = v39 + 1;
            v41 = v9->_sortedAnnotationViews.__begin_;
            v40 = v9->_sortedAnnotationViews.var0;
            if (v40 != v41)
            {
              do
              {
                v42 = *--v40;
                *--v39 = v42;
              }
              while (v40 != v41);
              v40 = v9->_sortedAnnotationViews.__begin_;
            }
            v9->_sortedAnnotationViews.__begin_ = v39;
            v9->_sortedAnnotationViews.var0 = v32;
            v9->_sortedAnnotationViews.var1.__value_ = (id *)(v37 + 8 * v38);
            if (v40)
              operator delete(v40);
          }
          else
          {
            *v31 = (__end_cap_ *)v27;
            v32 = v31 + 1;
          }
          v9->_sortedAnnotationViews.var0 = v32;
          maxLength = v9->_maxLength;
          if (v9->_isVertical)
            v44 = v29;
          else
            v44 = v28;
          if (maxLength < v44)
            maxLength = v44;
          v9->_maxLength = maxLength;
        }
        v24 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      }
      while (v24);
    }
    v45 = (uint64_t)v9->_sortedAnnotationViews.__begin_;
    v46 = (uint64_t *)v9->_sortedAnnotationViews.var0;
    v47 = 126 - 2 * __clz(((uint64_t)v46 - v45) >> 3);
    if (v46 == (uint64_t *)v45)
      v48 = 0;
    else
      v48 = v47;
    if (v9->_isVertical)
      std::__introsort<std::_ClassicAlgPolicy,_MKSpatialVertComp &,MKAnnotationView **,false>(v45, v46, v48, 1);
    else
      std::__introsort<std::_ClassicAlgPolicy,_MKSpatialHorzComp &,MKAnnotationView **,false>(v45, v46, v48, 1);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKSpatialCollider;
  -[MKSpatialCollider dealloc](&v3, sel_dealloc);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  __end_ **begin;
  __end_cap_ **var0;

  if (a3->var0)
    return 0;
  begin = self->_sortedAnnotationViews.__begin_;
  var0 = self->_sortedAnnotationViews.var0;
  a3->var0 = 1;
  a3->var1 = (id *)begin;
  a3->var2 = &self->mutator;
  return var0 - begin;
}

- (unint64_t)viewCount
{
  return self->_sortedAnnotationViews.var0 - self->_sortedAnnotationViews.__begin_;
}

- (id)annotationViewAtIndex:(unint64_t)a3
{
  return self->_sortedAnnotationViews.__begin_[a3];
}

- (unint64_t)insertAnnotationView:(id)a3
{
  __end_cap_ **var0;
  __end_ **begin;
  unint64_t v7;
  double v8;
  __end_ **v9;
  unint64_t v10;
  __end_ **v11;
  double v12;
  BOOL v13;
  unint64_t v14;
  double v15;
  unint64_t v16;
  __end_ **v17;
  double v18;
  BOOL v19;
  uint64_t v20;
  int64_t v21;
  __end_ **v22;
  id *value;
  __end_cap_ **v24;
  __end_cap_ **v25;
  __end_cap_ **v26;
  __end_cap_ *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  __end_ *v33;
  __end_ **v34;
  id *v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  __end_ **v41;
  __end_ **v42;
  __end_ *v43;
  __end_cap_ **v44;
  int64_t v45;
  __end_ **v46;
  double *v47;
  double maxLength;
  double *v50;

  v50 = (double *)a3;
  ++self->mutator;
  begin = self->_sortedAnnotationViews.__begin_;
  var0 = self->_sortedAnnotationViews.var0;
  if (self->_isVertical)
  {
    if (var0 != begin)
    {
      v7 = var0 - begin;
      v8 = *((double *)a3 + 84);
      v9 = self->_sortedAnnotationViews.__begin_;
      do
      {
        v10 = v7 >> 1;
        v11 = &v9[v7 >> 1];
        v12 = *((double *)*v11 + 84);
        if (v12 < v8 || ((uint64_t)*v11 < (uint64_t)a3 ? (v13 = v12 == v8) : (v13 = 0), v13))
        {
          v9 = v11 + 1;
          v10 = v7 + ~v10;
        }
        v7 = v10;
      }
      while (v10);
      goto LABEL_25;
    }
LABEL_24:
    v9 = self->_sortedAnnotationViews.__begin_;
    goto LABEL_25;
  }
  if (var0 == begin)
    goto LABEL_24;
  v14 = var0 - begin;
  v15 = *((double *)a3 + 83);
  v9 = self->_sortedAnnotationViews.__begin_;
  do
  {
    v16 = v14 >> 1;
    v17 = &v9[v14 >> 1];
    v18 = *((double *)*v17 + 83);
    if (v18 < v15 || ((uint64_t)*v17 < (uint64_t)a3 ? (v19 = v18 == v15) : (v19 = 0), v19))
    {
      v9 = v17 + 1;
      v16 = v14 + ~v16;
    }
    v14 = v16;
  }
  while (v16);
LABEL_25:
  v20 = (char *)v9 - (char *)begin;
  v21 = v9 - begin;
  v22 = (__end_ **)((char *)begin + (((char *)v9 - (char *)begin) & 0xFFFFFFFFFFFFFFF8));
  value = self->_sortedAnnotationViews.var1.__value_;
  if (var0 >= (__end_cap_ **)value)
  {
    v28 = var0 - begin + 1;
    if (v28 >> 61)
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    v29 = (char *)value - (char *)begin;
    if (v29 >> 2 > v28)
      v28 = v29 >> 2;
    if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
      v30 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v30 = v28;
    if (v30)
    {
      v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MKAnnotationView *>>(v30);
    }
    else
    {
      v32 = 0;
      v31 = 0;
    }
    v34 = (__end_ **)&v32[8 * v21];
    v35 = (id *)&v32[8 * v31];
    if (v21 == v31)
    {
      if (v20 < 1)
      {
        if (begin == v9)
          v37 = 1;
        else
          v37 = v20 >> 2;
        v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MKAnnotationView *>>(v37);
        v34 = (__end_ **)&v38[8 * (v37 >> 2)];
        v35 = (id *)&v38[8 * v39];
        if (v32)
          operator delete(v32);
      }
      else
      {
        v36 = v21 + 2;
        if (v21 >= -1)
          v36 = v21 + 1;
        v34 -= v36 >> 1;
      }
    }
    *v34 = (__end_ *)a3;
    v40 = (char *)(v34 + 1);
    v41 = self->_sortedAnnotationViews.__begin_;
    if (v41 != v22)
    {
      v42 = v22;
      do
      {
        v43 = *--v42;
        *--v34 = v43;
      }
      while (v42 != v41);
    }
    v44 = self->_sortedAnnotationViews.var0;
    v45 = (char *)v44 - (char *)v22;
    if (v44 != v22)
      memmove(v40, v22, (char *)v44 - (char *)v22);
    v46 = self->_sortedAnnotationViews.__begin_;
    self->_sortedAnnotationViews.__begin_ = v34;
    self->_sortedAnnotationViews.var0 = (__end_cap_ **)&v40[v45];
    self->_sortedAnnotationViews.var1.__value_ = v35;
    if (v46)
      operator delete(v46);
  }
  else if (v22 == var0)
  {
    *var0 = (__end_cap_ *)a3;
    self->_sortedAnnotationViews.var0 = var0 + 1;
  }
  else
  {
    v24 = v22 + 1;
    v25 = var0 - 1;
    v26 = self->_sortedAnnotationViews.var0;
    while (v25 < var0)
    {
      v27 = *v25++;
      *v26++ = v27;
    }
    self->_sortedAnnotationViews.var0 = v26;
    if (var0 != v24)
      memmove(&var0[-(var0 - v24)], (char *)begin + (((char *)v9 - (char *)begin) & 0xFFFFFFFFFFFFFFF8), (char *)var0 - (char *)v24);
    v33 = (__end_ *)v50;
    if (v22 > (__end_ **)&v50)
      v33 = (__end_ *)a3;
    *v22 = v33;
  }
  v47 = v50 + 86;
  maxLength = self->_maxLength;
  if (!self->_isVertical)
    v47 = v50 + 85;
  if (maxLength < *v47)
    maxLength = *v47;
  self->_maxLength = maxLength;
  return v21;
}

- (id)viewsCollidingWithAnnotationView:(id)a3 inCollidableList:(BOOL)a4
{
  _BOOL8 v4;
  double (*v7)(uint64_t);
  double (*v8)(uint64_t);
  __int128 v9;
  double v10;
  __int128 v11;
  double v12;
  double maxLength;
  double v14;
  __end_ **begin;
  __end_cap_ **var0;
  unint64_t v17;
  __end_ **v18;
  unint64_t v19;
  __end_ **v20;
  __end_ **v21;
  __end_ *v22;
  unint64_t v23;
  unint64_t v24;
  __end_ **v25;
  __end_ **v26;
  __end_ *v27;
  __int128 v29;
  __int128 v30;

  v4 = a4;
  if (self->_isVertical)
    v7 = -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:]::$_0::__invoke;
  else
    v7 = -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:]::$_1::__invoke;
  v8 = -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:]::$_2::__invoke;
  if (!self->_isVertical)
    v8 = -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:]::$_3::__invoke;
  v9 = *(_OWORD *)((char *)a3 + 680);
  v29 = *(_OWORD *)((char *)a3 + 664);
  v30 = v9;
  v10 = ((double (*)(__int128 *, SEL))v8)(&v30, a2);
  v11 = *(_OWORD *)((char *)a3 + 680);
  v29 = *(_OWORD *)((char *)a3 + 664);
  v30 = v11;
  v12 = v7((uint64_t)&v29);
  maxLength = self->_maxLength;
  v14 = v12 - maxLength;
  begin = self->_sortedAnnotationViews.__begin_;
  var0 = self->_sortedAnnotationViews.var0;
  if (self->_isVertical)
  {
    if (var0 != begin)
    {
      v17 = var0 - begin;
      v18 = self->_sortedAnnotationViews.__begin_;
      do
      {
        v19 = v17 >> 1;
        v20 = &v18[v17 >> 1];
        v22 = *v20;
        v21 = v20 + 1;
        v17 += ~(v17 >> 1);
        if (*((double *)v22 + 84) < v14)
          v18 = v21;
        else
          v17 = v19;
      }
      while (v17);
      goto LABEL_22;
    }
LABEL_21:
    v18 = self->_sortedAnnotationViews.var0;
    var0 = self->_sortedAnnotationViews.__begin_;
    goto LABEL_22;
  }
  if (var0 == begin)
    goto LABEL_21;
  v23 = var0 - begin;
  v18 = self->_sortedAnnotationViews.__begin_;
  do
  {
    v24 = v23 >> 1;
    v25 = &v18[v23 >> 1];
    v27 = *v25;
    v26 = v25 + 1;
    v23 += ~(v23 >> 1);
    if (*((double *)v27 + 83) < v14)
      v18 = v26;
    else
      v23 = v24;
  }
  while (v23);
LABEL_22:
  if (var0 == v18)
    return 0;
  else
    return -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:fromIndex:length:](self, "viewsCollidingWithAnnotationView:inCollidableList:fromIndex:length:", a3, v4, v18 - begin, v10 + maxLength);
}

- (id)viewsCollidingWithAnnotationViewAtIndex:(unint64_t)a3
{
  double (*v5)(uint64_t);
  __end_ *v6;
  __int128 v8;

  if (self->_isVertical)
    v5 = -[MKSpatialCollider viewsCollidingWithAnnotationViewAtIndex:]::$_4::__invoke;
  else
    v5 = -[MKSpatialCollider viewsCollidingWithAnnotationViewAtIndex:]::$_5::__invoke;
  v6 = self->_sortedAnnotationViews.__begin_[a3];
  v8 = *(_OWORD *)((char *)v6 + 680);
  ((void (*)(__int128 *, SEL))v5)(&v8, a2);
  return -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:fromIndex:length:](self, "viewsCollidingWithAnnotationView:inCollidableList:fromIndex:length:", v6, 1, a3);
}

- (id)viewsCollidingWithAnnotationView:(id)a3 inCollidableList:(BOOL)a4 fromIndex:(int64_t)a5 length:(double)a6
{
  unint64_t v8;
  MKSpatialCollider *v9;
  double (*v10)(uint64_t);
  int *v11;
  CGSize v12;
  double v13;
  __end_cap_ **v14;
  unint64_t *v15;
  unint64_t *v16;
  unint64_t *v17;
  uint64_t v18;
  double v19;
  _MKSpatialColliderPairSet *registeredCollisonPairs;
  unint64_t v21;
  unint64_t v22;
  CGSize v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int8x8_t v28;
  uint8x8_t v29;
  unint64_t v30;
  unint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _QWORD *i;
  unint64_t v37;
  BOOL v38;
  unint64_t value;
  uint8x8_t v40;
  unint64_t *v41;
  unint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *j;
  unint64_t v46;
  _QWORD *v48;
  float v49;
  float v50;
  _BOOL8 v51;
  unint64_t v52;
  unint64_t v53;
  size_t v54;
  void **v55;
  void **v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t *v65;
  unint64_t v66;
  uint64_t v67;
  int64_t options;
  __end_ **begin;
  __end_ **v70;
  __end_ **v71;
  __end_ **v72;
  uint64_t v73;
  __end_ **v74;
  __end_cap_ **v75;
  __end_ **v76;
  char *v77;
  void *v78;
  uint64_t v80;
  __end_ **v81;
  uint64_t v82;
  __end_ **v83;
  __end_ *v84;
  __end_cap_ **v85;
  __end_cap_ **var0;
  int64_t v87;
  int64_t v88;
  __compressed_pair<std::__hash_node_base<std::__hash_node<_MKAnnotationViewPair, void *> *>, std::allocator<std::__hash_node<_MKAnnotationViewPair, void *>>> *p_p1;
  _BOOL4 v90;
  unordered_set<_MKAnnotationViewPair, std::hash<_MKAnnotationViewPair>, std::equal_to<_MKAnnotationViewPair>, std::allocator<_MKAnnotationViewPair>> *p_pairs;
  MKSpatialCollider *v92;
  int8x8_t *previousCollisionPairs;
  _MKSpatialColliderPairSet *v94;
  unint64_t v95;
  void *v96;
  double (*v97)(uint64_t);
  char v98;
  uint64_t v99;
  CGRect v100;
  CGRect v101;

  v90 = a4;
  v8 = (unint64_t)a3;
  v9 = self;
  ++self->mutator;
  v10 = -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:fromIndex:length:]::$_6::__invoke;
  v11 = &OBJC_IVAR____MKUIViewControllerClickableRootView__gestureRecognizer;
  v12 = *(CGSize *)((char *)a3 + 680);
  if (!self->_isVertical)
    v10 = -[MKSpatialCollider viewsCollidingWithAnnotationView:inCollidableList:fromIndex:length:]::$_7::__invoke;
  v101.origin = *(CGPoint *)((char *)a3 + 664);
  v101.size = v12;
  v97 = v10;
  ((void (*)(CGRect *, SEL))v10)(&v101, a2);
  v88 = a5;
  v14 = &v9->_sortedAnnotationViews.__begin_[a5];
  if (v14 != v9->_sortedAnnotationViews.var0)
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v98 = 0;
    v99 = 0;
    v18 = 0;
    v19 = v13 + a6;
    registeredCollisonPairs = v9->_registeredCollisonPairs;
    p_pairs = &registeredCollisonPairs->_pairs;
    v92 = v9;
    previousCollisionPairs = (int8x8_t *)v9->_previousCollisionPairs;
    v94 = registeredCollisonPairs;
    p_p1 = &registeredCollisonPairs->_pairs.__table_.__p1_;
    v96 = (void *)v8;
    while (1)
    {
      v21 = (unint64_t)*v14;
      if (*v14 == (__end_cap_ *)v8)
      {
        if (v16 >= v15)
        {
          v32 = v16 - v17;
          v33 = v32 + 1;
          if ((unint64_t)(v32 + 1) >> 61)
            std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
          if (((char *)v15 - (char *)v17) >> 2 > v33)
            v33 = ((char *)v15 - (char *)v17) >> 2;
          if ((unint64_t)((char *)v15 - (char *)v17) >= 0x7FFFFFFFFFFFFFF8)
            v34 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v34 = v33;
          if (v34)
            v34 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<MKAnnotationView *>>(v34);
          else
            v35 = 0;
          v41 = (unint64_t *)(v34 + 8 * v32);
          *v41 = v8;
          v31 = v41 + 1;
          if (v16 != v17)
          {
            do
            {
              v42 = *--v16;
              *--v41 = v42;
            }
            while (v16 != v17);
            v16 = v17;
          }
          v17 = v41;
          v15 = (unint64_t *)(v34 + 8 * v35);
          if (v16)
            operator delete(v16);
        }
        else
        {
          *v16 = v8;
          v31 = v16 + 1;
        }
        v43 = v14 - v9->_sortedAnnotationViews.__begin_;
        goto LABEL_58;
      }
      memset(&v100, 0, sizeof(v100));
      v22 = v21 + v11[320];
      v23 = *(CGSize *)(v22 + 16);
      v100.origin = *(CGPoint *)v22;
      v100.size = v23;
      if (v97((uint64_t)&v100) > v19)
        goto LABEL_123;
      if (!CGRectIntersectsRect(v101, v100))
        goto LABEL_103;
      v95 = (unint64_t)v15;
      if (v21 <= v8)
        v24 = v21;
      else
        v24 = v8;
      if (v21 <= v8)
        v25 = v8;
      else
        v25 = v21;
      v26 = std::hash<_MKAnnotationViewPair>::operator()(v24, v25);
      v27 = v26;
      v28 = previousCollisionPairs[2];
      if (v28)
      {
        v29 = (uint8x8_t)vcnt_s8(v28);
        v29.i16[0] = vaddlv_u8(v29);
        if (v29.u32[0] > 1uLL)
        {
          v30 = v26;
          if (v26 >= *(_QWORD *)&v28)
            v30 = v26 % *(_QWORD *)&v28;
        }
        else
        {
          v30 = (*(_QWORD *)&v28 - 1) & v26;
        }
        i = *(_QWORD **)(*(_QWORD *)&previousCollisionPairs[1] + 8 * v30);
        if (i)
        {
          for (i = (_QWORD *)*i; i; i = (_QWORD *)*i)
          {
            v37 = i[1];
            if (v37 == v26)
            {
              v38 = i[2] == v24 && i[3] == v25;
              if (v38)
                break;
            }
            else
            {
              if (v29.u32[0] > 1uLL)
              {
                if (v37 >= *(_QWORD *)&v28)
                  v37 %= *(_QWORD *)&v28;
              }
              else
              {
                v37 &= *(_QWORD *)&v28 - 1;
              }
              if (v37 != v30)
                goto LABEL_45;
            }
          }
        }
      }
      else
      {
LABEL_45:
        i = 0;
      }
      if ((objc_msgSend(v96, "isCollidingWithAnnotationView:previouslyCollided:", v21, i != 0) & 1) == 0)
      {
        v9 = v92;
        v15 = (unint64_t *)v95;
        v8 = (unint64_t)v96;
LABEL_102:
        v11 = &OBJC_IVAR____MKUIViewControllerClickableRootView__gestureRecognizer;
        goto LABEL_103;
      }
      value = v94->_pairs.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (value)
      {
        v40 = (uint8x8_t)vcnt_s8((int8x8_t)value);
        v40.i16[0] = vaddlv_u8(v40);
        if (v40.u32[0] > 1uLL)
        {
          v8 = v27;
          if (v27 >= value)
            v8 = v27 % value;
        }
        else
        {
          v8 = (value - 1) & v27;
        }
        v44 = p_pairs->__table_.__bucket_list_.__ptr_.__value_[v8];
        if (v44)
        {
          for (j = (_QWORD *)*v44; j; j = (_QWORD *)*j)
          {
            v46 = j[1];
            if (v46 == v27)
            {
              if (j[2] == v24 && j[3] == v25)
                goto LABEL_98;
            }
            else
            {
              if (v40.u32[0] > 1uLL)
              {
                if (v46 >= value)
                  v46 %= value;
              }
              else
              {
                v46 &= value - 1;
              }
              if (v46 != v8)
                break;
            }
          }
        }
      }
      v48 = operator new(0x20uLL);
      *v48 = 0;
      v48[1] = v27;
      v48[2] = v24;
      v48[3] = v25;
      v49 = (float)(v94->_pairs.__table_.__p2_.__value_ + 1);
      v50 = v94->_pairs.__table_.__p3_.__value_;
      if (!value || (float)(v50 * (float)value) < v49)
      {
        v51 = (value & (value - 1)) != 0;
        if (value < 3)
          v51 = 1;
        v52 = v51 | (2 * value);
        v53 = vcvtps_u32_f32(v49 / v50);
        if (v52 <= v53)
          v54 = v53;
        else
          v54 = v52;
        std::__hash_table<_MKAnnotationViewPair,std::hash<_MKAnnotationViewPair>,std::equal_to<_MKAnnotationViewPair>,std::allocator<_MKAnnotationViewPair>>::__rehash<true>((uint64_t)p_pairs, v54);
        value = v94->_pairs.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
        if ((value & (value - 1)) != 0)
        {
          if (v27 >= value)
            v8 = v27 % value;
          else
            v8 = v27;
        }
        else
        {
          v8 = (value - 1) & v27;
        }
      }
      v55 = p_pairs->__table_.__bucket_list_.__ptr_.__value_;
      v56 = (void **)p_pairs->__table_.__bucket_list_.__ptr_.__value_[v8];
      if (v56)
      {
        *v48 = *v56;
      }
      else
      {
        *v48 = p_p1->__value_.__next_;
        p_p1->__value_.__next_ = v48;
        v55[v8] = p_p1;
        if (!*v48)
          goto LABEL_97;
        v57 = *(_QWORD *)(*v48 + 8);
        if ((value & (value - 1)) != 0)
        {
          if (v57 >= value)
            v57 %= value;
        }
        else
        {
          v57 &= value - 1;
        }
        v56 = &p_pairs->__table_.__bucket_list_.__ptr_.__value_[v57];
      }
      *v56 = v48;
LABEL_97:
      ++v94->_pairs.__table_.__p2_.__value_;
LABEL_98:
      v15 = (unint64_t *)v95;
      if ((unint64_t)v16 < v95)
      {
        *v16++ = v21;
        v9 = v92;
        v18 = v14 - v92->_sortedAnnotationViews.__begin_;
        v58 = v99;
        if ((v98 & 1) == 0)
          v58 = v14 - v92->_sortedAnnotationViews.__begin_;
        v99 = v58;
        v98 = 1;
        v8 = (unint64_t)v96;
        goto LABEL_102;
      }
      v59 = v16 - v17;
      v60 = v59 + 1;
      v9 = v92;
      v8 = (unint64_t)v96;
      v11 = &OBJC_IVAR____MKUIViewControllerClickableRootView__gestureRecognizer;
      if ((unint64_t)(v59 + 1) >> 61)
        std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
      if ((uint64_t)(v95 - (_QWORD)v17) >> 2 > v60)
        v60 = (uint64_t)(v95 - (_QWORD)v17) >> 2;
      if (v95 - (unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
        v61 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v61 = v60;
      if (v61)
      {
        v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<MKAnnotationView *>>(v61);
        v64 = v63;
        v9 = v92;
        v8 = (unint64_t)v96;
      }
      else
      {
        v62 = 0;
        v64 = 0;
      }
      v65 = (unint64_t *)&v62[8 * v59];
      *v65 = v21;
      v31 = v65 + 1;
      if (v16 != v17)
      {
        do
        {
          v66 = *--v16;
          *--v65 = v66;
        }
        while (v16 != v17);
        v16 = v17;
      }
      v17 = v65;
      if (v16)
        operator delete(v16);
      v15 = (unint64_t *)&v62[8 * v64];
      v18 = v14 - v9->_sortedAnnotationViews.__begin_;
      v43 = v99;
      if ((v98 & 1) == 0)
        v43 = v14 - v9->_sortedAnnotationViews.__begin_;
LABEL_58:
      v99 = v43;
      v98 = 1;
      v16 = v31;
LABEL_103:
      if (++v14 == v9->_sortedAnnotationViews.var0)
        goto LABEL_123;
    }
  }
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v99 = 0;
LABEL_123:
  v67 = v16 - v17;
  if (v67)
  {
    if (v67 != 1)
    {
      if ((v9->_options & 1) != 0)
      {
        begin = v9->_sortedAnnotationViews.__begin_;
        v70 = &begin[v88];
        v71 = &begin[v18];
        v72 = v71 + 1;
        if (v70 != v71 + 1)
        {
          v73 = 8 * v18 - 8 * v88;
          while (*v70 != (__end_ *)*v17)
          {
            v73 -= 8;
            v38 = v70++ == v71;
            if (v38)
              goto LABEL_156;
          }
          if (v70 == v72 || v70 == v71)
          {
            v83 = v70;
          }
          else
          {
            v81 = (__end_ **)(v17 + 1);
            v82 = 1;
            v83 = v70;
            do
            {
              v84 = v70[v82];
              if (v84 == *v81)
                ++v81;
              else
                *v83++ = v84;
              ++v82;
              v73 -= 8;
            }
            while (v73);
          }
          if (v83 != v72)
          {
            v85 = v72;
            var0 = v9->_sortedAnnotationViews.var0;
            v87 = (char *)var0 - (char *)v85;
            if (var0 != v85)
              memmove(v83, v85, (char *)var0 - (char *)v85);
            v9->_sortedAnnotationViews.var0 = (__end_ **)((char *)v83 + v87);
          }
        }
      }
LABEL_156:
      v80 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, v16 - v17, v88);
LABEL_157:
      v78 = (void *)v80;
      if (!v17)
        return v78;
      goto LABEL_140;
    }
    options = v9->_options;
    if (v90)
    {
      if ((options & 2) == 0)
        goto LABEL_139;
    }
    else if ((options & 1) == 0)
    {
LABEL_142:
      v80 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1, v88);
      goto LABEL_157;
    }
    v74 = v9->_sortedAnnotationViews.__begin_;
    v75 = v9->_sortedAnnotationViews.var0;
    v76 = &v74[v99];
    v77 = (char *)((char *)v75 - (char *)(v76 + 1));
    if (v75 != v76 + 1)
      memmove(&v74[v99], v76 + 1, (char *)v75 - (char *)(v76 + 1));
    v9->_sortedAnnotationViews.var0 = (__end_cap_ **)&v77[(_QWORD)v76];
    if (v90)
      goto LABEL_139;
    goto LABEL_142;
  }
LABEL_139:
  v78 = 0;
  if (v17)
LABEL_140:
    operator delete(v17);
  return v78;
}

- (double)viewsCollidingWithAnnotationView:(uint64_t)a1 inCollidableList:
{
  return *(double *)a1;
}

- (double)viewsCollidingWithAnnotationViewAtIndex:(uint64_t)a1
{
  return *(double *)a1;
}

- (double)viewsCollidingWithAnnotationView:(uint64_t)a1 inCollidableList:fromIndex:length:
{
  return *(double *)a1;
}

@end
