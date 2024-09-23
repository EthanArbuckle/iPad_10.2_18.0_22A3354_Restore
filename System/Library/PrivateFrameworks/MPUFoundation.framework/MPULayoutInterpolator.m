@implementation MPULayoutInterpolator

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  EntriesContainer *begin;
  EntriesContainer *end;
  uint64_t v9;
  EntriesContainer *v10;
  EntriesContainer *v11;
  char v12;
  double v13;
  double *v14;
  double *v15;
  double v16;
  uint64_t v17;
  double *v19;
  double *v20;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  begin = self->_entriesContainers.__begin_;
  end = self->_entriesContainers.__end_;
  if (begin == end)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    do
    {
      v9 += MPU::LayoutInterpolator::EntriesContainer::entriesCount((MPU::LayoutInterpolator::EntriesContainer *)begin);
      begin = (EntriesContainer *)((char *)begin + 32);
    }
    while (begin != end);
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("; entries (%ld) = ["), v9);
  v10 = self->_entriesContainers.__begin_;
  v11 = self->_entriesContainers.__end_;
  if (v10 != v11)
  {
    v12 = 0;
    do
    {
      v13 = MPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MPU::LayoutInterpolator::EntriesContainer *)v10);
      MPU::LayoutInterpolator::EntriesContainer::copyEntriesVector((MPU::LayoutInterpolator::EntriesContainer *)v10, &v19);
      v14 = v19;
      v15 = v20;
      if (v19 != v20)
      {
        do
        {
          v16 = *v14;
          v17 = *((_QWORD *)v14 + 1);
          objc_msgSend(v6, "appendFormat:", CFSTR("\n    (referenceMetric: %f"), *(_QWORD *)&v13);
          if (!MPUFloatEqualToFloat(v16, -1.13427449e38))
            objc_msgSend(v6, "appendFormat:", CFSTR(", secondaryReferenceMetric: %f"), *(_QWORD *)&v16);
          objc_msgSend(v6, "appendFormat:", CFSTR(", value: %f), "), v17);
          v14 += 2;
        }
        while (v14 != v15);
        v12 = 1;
        v14 = v19;
      }
      if (v14)
      {
        v20 = v14;
        operator delete(v14);
      }
      v10 = (EntriesContainer *)((char *)v10 + 32);
    }
    while (v10 != v11);
    if ((v12 & 1) != 0)
      objc_msgSend(v6, "appendString:", CFSTR("\n"));
  }
  objc_msgSend(v6, "appendString:", CFSTR("]"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MPULayoutInterpolator *v4;
  MPULayoutInterpolator *v5;

  v4 = (MPULayoutInterpolator *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    if (v4 != self)
      std::vector<MPU::LayoutInterpolator::EntriesContainer>::__assign_with_size[abi:ne180100]<MPU::LayoutInterpolator::EntriesContainer*,MPU::LayoutInterpolator::EntriesContainer*>((uint64_t)&v4->_entriesContainers, (uint64_t)self->_entriesContainers.__begin_, (uint64_t)self->_entriesContainers.__end_, (self->_entriesContainers.__end_ - self->_entriesContainers.__begin_) >> 5);
    v5->_hasEntryWithSpecificSecondaryReferenceMetric = self->_hasEntryWithSpecificSecondaryReferenceMetric;
  }
  return v5;
}

- (void)addValue:(double)a3 forReferenceMetric:(double)a4
{
  -[MPULayoutInterpolator addValue:forReferenceMetric:secondaryReferenceMetric:](self, "addValue:forReferenceMetric:secondaryReferenceMetric:", a3, a4, -1.13427449e38);
}

- (void)addValue:(double)a3 forReferenceMetric:(double)a4 secondaryReferenceMetric:(double)a5
{
  EntriesContainer *end;
  EntriesContainer *begin;
  unint64_t v10;
  MPU::LayoutInterpolator::EntriesContainer *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  __int128 *v16;
  __int128 *p_p;
  int v18;
  __int128 v19;
  uint64_t v20;
  int v21;
  __int128 __p;
  uint64_t v23;
  void *v24[4];
  Entry v25;
  Entry v26;

  MPU::LayoutInterpolator::EntriesContainer::EntriesContainer((uint64_t)v24, a4);
  begin = self->_entriesContainers.__begin_;
  end = self->_entriesContainers.__end_;
  if (end != begin)
  {
    v10 = (end - begin) >> 5;
    do
    {
      v11 = (MPU::LayoutInterpolator::EntriesContainer *)((char *)begin + 32 * (v10 >> 1));
      v12 = MPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric(v11);
      v13 = MPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MPU::LayoutInterpolator::EntriesContainer *)v24);
      if (v12 >= v13)
        v10 >>= 1;
      else
        v10 += ~(v10 >> 1);
      if (v12 < v13)
        begin = (EntriesContainer *)((char *)v11 + 32);
    }
    while (v10);
    end = begin;
  }
  v21 = 0;
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  if (self->_entriesContainers.__end_ == end
    || (v14 = MPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MPU::LayoutInterpolator::EntriesContainer *)end),
        v15 = MPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MPU::LayoutInterpolator::EntriesContainer *)v24),
        !MPUFloatEqualToFloat(v14, v15)))
  {
    v26.var0 = a5;
    v26.var1 = a3;
    MPU::LayoutInterpolator::EntriesContainer::insertEntry((MPU::LayoutInterpolator::EntriesContainer *)v24, v26, (uint64_t)&v18);
    v21 = v18;
    if (SHIBYTE(v23) < 0)
      operator delete((void *)__p);
    __p = v19;
    v23 = v20;
    std::vector<MPU::LayoutInterpolator::EntriesContainer>::insert((uint64_t *)&self->_entriesContainers, (uint64_t)end, (unint64_t)v24);
  }
  else
  {
    v25.var0 = a5;
    v25.var1 = a3;
    MPU::LayoutInterpolator::EntriesContainer::insertEntry((MPU::LayoutInterpolator::EntriesContainer *)end, v25, (uint64_t)&v18);
    v21 = v18;
    if (SHIBYTE(v23) < 0)
      operator delete((void *)__p);
    __p = v19;
    v23 = v20;
  }
  if ((v21 - 2) >= 3)
  {
    if (v21 == 1)
    {
      if (v23 >= 0)
        p_p = &__p;
      else
        p_p = (__int128 *)__p;
      NSLog(CFSTR("%s"), p_p);
    }
    else if (!v21 && !self->_hasEntryWithSpecificSecondaryReferenceMetric && !MPUFloatEqualToFloat(a5, -1.13427449e38))
    {
      self->_hasEntryWithSpecificSecondaryReferenceMetric = 1;
    }
  }
  else
  {
    if (v23 >= 0)
      v16 = &__p;
    else
      v16 = (__int128 *)__p;
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("%s"), v16);
  }
  if (SHIBYTE(v23) < 0)
    operator delete((void *)__p);
  if (v24[0])
  {
    v24[1] = v24[0];
    operator delete(v24[0]);
  }
}

- (double)valueForReferenceMetric:(double)a3
{
  double result;

  -[MPULayoutInterpolator valueForReferenceMetric:secondaryReferenceMetric:](self, "valueForReferenceMetric:secondaryReferenceMetric:", a3, -1.13427449e38);
  return result;
}

- (double)valueForReferenceMetric:(double)a3 secondaryReferenceMetric:(double)a4
{
  EntriesContainer *end;
  EntriesContainer *begin;
  int64_t v8;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  double v24;
  EntriesContainer *v25;
  uint64_t v26;
  unint64_t v27;
  MPU::LayoutInterpolator::EntriesContainer *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *__p[4];

  begin = self->_entriesContainers.__begin_;
  end = self->_entriesContainers.__end_;
  v8 = end - begin;
  if (end == begin)
  {
    v18 = (void *)MEMORY[0x24BDBCE88];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_addValue_forReferenceMetric_);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Can't call -[%@ %@] before calling -[%@ %@] at least once."), v13, v20, v22, v23);

    goto LABEL_8;
  }
  if (!self->_hasEntryWithSpecificSecondaryReferenceMetric || !MPUFloatEqualToFloat(a4, -1.13427449e38))
  {
    if (v8 == 32)
      return MPU::LayoutInterpolator::EntriesContainer::valueForSecondaryReferenceMetric((double **)self->_entriesContainers.__begin_, a4);
    MPU::LayoutInterpolator::EntriesContainer::EntriesContainer((uint64_t)__p, a3);
    v25 = self->_entriesContainers.__begin_;
    v26 = self->_entriesContainers.__end_ - v25;
    if (v26)
    {
      v27 = v26 >> 5;
      do
      {
        v28 = (MPU::LayoutInterpolator::EntriesContainer *)((char *)v25 + 32 * (v27 >> 1));
        v29 = MPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric(v28);
        v30 = MPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MPU::LayoutInterpolator::EntriesContainer *)__p);
        if (v29 >= v30)
          v27 >>= 1;
        else
          v27 += ~(v27 >> 1);
        if (v29 < v30)
          v25 = (EntriesContainer *)((char *)v28 + 32);
      }
      while (v27);
      if (v25 != self->_entriesContainers.__end_)
      {
        v31 = MPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MPU::LayoutInterpolator::EntriesContainer *)v25);
        v32 = MPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MPU::LayoutInterpolator::EntriesContainer *)__p);
        if (MPUFloatEqualToFloat(v31, v32))
        {
          v33 = MPU::LayoutInterpolator::EntriesContainer::valueForSecondaryReferenceMetric((double **)v25, a4);
        }
        else if (v25 == self->_entriesContainers.__begin_)
        {
          -[MPULayoutInterpolator _interpolatedValueForPrimaryReferenceMetric:secondaryReferenceMetric:betweenFirstEntriesContainer:andSecondEntriesContainer:](self, "_interpolatedValueForPrimaryReferenceMetric:secondaryReferenceMetric:betweenFirstEntriesContainer:andSecondEntriesContainer:", v25, (char *)v25 + 32, a3, a4);
        }
        else
        {
          -[MPULayoutInterpolator _interpolatedValueForPrimaryReferenceMetric:secondaryReferenceMetric:betweenFirstEntriesContainer:andSecondEntriesContainer:](self, "_interpolatedValueForPrimaryReferenceMetric:secondaryReferenceMetric:betweenFirstEntriesContainer:andSecondEntriesContainer:", (char *)v25 - 32, v25, a3, a4);
        }
        goto LABEL_23;
      }
      v25 = self->_entriesContainers.__end_;
    }
    -[MPULayoutInterpolator _interpolatedValueForPrimaryReferenceMetric:secondaryReferenceMetric:betweenFirstEntriesContainer:andSecondEntriesContainer:](self, "_interpolatedValueForPrimaryReferenceMetric:secondaryReferenceMetric:betweenFirstEntriesContainer:andSecondEntriesContainer:", (char *)v25 - 64, (char *)v25 - 32, a3, a4);
LABEL_23:
    v24 = v33;
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    return v24;
  }
  v11 = (void *)MEMORY[0x24BDBCE88];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Can't call -[%@ valueForReferenceMetric:] without a valid secondary reference metric. Please use -[%@ %@] with a valid last argument."), v13, v15, v16);

LABEL_8:
  return 0.0;
}

- (double)_interpolatedValueForPrimaryReferenceMetric:(double)a3 secondaryReferenceMetric:(double)a4 betweenFirstEntriesContainer:(void *)a5 andSecondEntriesContainer:(void *)a6
{
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  __int128 v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  char *v29;
  char *v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  char *v35;
  char v36;
  _BOOL4 v37;
  uint64_t v38;
  double *v39;
  char *v40;
  double *v41;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  double *v50;
  uint64_t v51;
  void *__src;
  _BYTE *v53;
  uint64_t v54;
  void *v55;
  char *v56;
  void *v57;
  char *v58;
  void *__p;
  void *v60;
  double v61;
  __int128 v62;
  uint64_t v63;

  v11 = MPU::LayoutInterpolator::EntriesContainer::entriesCount((MPU::LayoutInterpolator::EntriesContainer *)a5);
  v12 = MPU::LayoutInterpolator::EntriesContainer::entriesCount((MPU::LayoutInterpolator::EntriesContainer *)a6);
  if (v11 == 1 && v12 == 1)
  {
    MPU::LayoutInterpolator::EntriesContainer::copyEntriesVector((MPU::LayoutInterpolator::EntriesContainer *)a5, &v62);
    v13 = *(double *)(v62 + 8);
    v14 = MPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MPU::LayoutInterpolator::EntriesContainer *)a5);
    MPU::LayoutInterpolator::EntriesContainer::copyEntriesVector((MPU::LayoutInterpolator::EntriesContainer *)a6, &__p);
    v15 = *((double *)__p + 1);
    v16 = MPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MPU::LayoutInterpolator::EntriesContainer *)a6);
    v17 = MPULayoutLinearRelationMake(v14, v13, v16, v15);
    v19 = MPULayoutLinearRelationEvaluate(v17, v18, a3);
    if (*(double *)&__p != 0.0)
    {
      v60 = __p;
      operator delete(__p);
    }
    v20 = (void *)v62;
    if ((_QWORD)v62)
    {
      *((_QWORD *)&v62 + 1) = v62;
LABEL_46:
      operator delete(v20);
    }
  }
  else
  {
    v19 = 0.0;
    MPU::Point3D::Point3D((double *)&__p, a3, a4, 0.0);
    -[MPULayoutInterpolator _sortedPointsFor3DInterpolationFromEntriesContainer:usingQueriedPoint:fallbackSecondaryReferenceMetric:](self, "_sortedPointsFor3DInterpolationFromEntriesContainer:usingQueriedPoint:fallbackSecondaryReferenceMetric:", a5, *(double *)&__p, *(double *)&v60, v61, a4);
    -[MPULayoutInterpolator _sortedPointsFor3DInterpolationFromEntriesContainer:usingQueriedPoint:fallbackSecondaryReferenceMetric:](self, "_sortedPointsFor3DInterpolationFromEntriesContainer:usingQueriedPoint:fallbackSecondaryReferenceMetric:", a6, *(double *)&__p, *(double *)&v60, v61, a4);
    __src = 0;
    v53 = 0;
    v54 = 0;
    v29 = (char *)v57;
    v30 = (char *)v55;
    do
    {
      v49 = 0;
      v50 = 0;
      v51 = 0;
      if (v58 != v29)
      {
        v31 = 0;
        do
        {
          v32 = *(_OWORD *)&v29[v31];
          v63 = *(_QWORD *)&v29[v31 + 16];
          v62 = v32;
          std::vector<MPU::Point3D>::insert((uint64_t)&__src, (char *)__src, (unint64_t)&v62);
          std::vector<MPU::Point3D>::insert((uint64_t)&v49, (char *)v49, (unint64_t)&v62);
          v31 += 24;
        }
        while (v31 != 48 && &v29[v31] != v58);
      }
      v46 = 0;
      v47 = 0;
      v48 = 0;
      if (v56 != v30)
      {
        v33 = 0;
        do
        {
          v34 = *(_OWORD *)&v30[v33];
          v63 = *(_QWORD *)&v30[v33 + 16];
          v62 = v34;
          std::vector<MPU::Point3D>::insert((uint64_t)&__src, (char *)__src, (unint64_t)&v62);
          std::vector<MPU::Point3D>::insert((uint64_t)&v46, (char *)v46, (unint64_t)&v62);
          v33 += 24;
        }
        while (v33 != 48 && &v30[v33] != v56);
      }
      v35 = (char *)__src;
      if (0xAAAAAAAAAAAAAAABLL * ((v53 - (_BYTE *)__src) >> 3) >= 3)
      {
        if (v53 - (_BYTE *)__src != 72)
          -[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:](self, "_sortPointsFor3DInterpolation:usingQueriedPoint:", &__src, *(double *)&__p, *(double *)&v60, v61);
        v44 = 0.0;
        v45 = 0.0;
        v43 = 0.0;
        v37 = MPU::Point3D::resolveEquationOfPlaneDefinedByFirstThreePointsInVector((double **)&__src, &v45, &v44, &v43, *(double *)&v21, v22, *(double *)&v23, v24, v25, v26, v27, v28);
        v36 = v37;
        if (v37)
        {
          v23 = __p;
          v24 = *(double *)&v60;
          *(double *)&v21 = v44 * *(double *)&v60 + v45 * *(double *)&__p;
          v22 = v43;
          v19 = v43 + *(double *)&v21;
          v35 = (char *)__src;
        }
        else
        {
          v38 = 0;
          v35 = (char *)__src;
          v39 = v50;
          v40 = (char *)__src;
          do
          {
            v21 = *(_OWORD *)v40;
            v63 = *((_QWORD *)v40 + 2);
            v62 = v21;
            v41 = (double *)v49;
            if (v49 == v39)
            {
              v41 = v39;
            }
            else
            {
              while (!MPU::Point3D::operator==(v41, (double *)&v62))
              {
                v41 += 3;
                if (v41 == v39)
                {
                  v41 = v39;
                  break;
                }
              }
              v39 = v50;
              v35 = (char *)__src;
            }
            if (v41 != v39)
              ++v38;
            v40 += 24;
          }
          while (v40 != v35 + 72);
          if (v38 == 2)
            v29 += 24;
          else
            v30 += 24;
        }
      }
      else
      {
        v36 = 1;
      }
      v53 = v35;
      if (v46)
      {
        v47 = v46;
        operator delete(v46);
      }
      if (v49)
      {
        v50 = (double *)v49;
        operator delete(v49);
      }
    }
    while ((v36 & 1) == 0);
    if (__src)
    {
      v53 = __src;
      operator delete(__src);
    }
    if (v55)
    {
      v56 = (char *)v55;
      operator delete(v55);
    }
    v20 = v57;
    if (v57)
    {
      v58 = (char *)v57;
      goto LABEL_46;
    }
  }
  return v19;
}

- (Point3D)_pointForEntry:(Entry)a3 andPrimaryReferenceMetric:(double)a4 usingFallbackSecondaryReferenceMetric:(double)a5
{
  double var1;
  double var0;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13[3];
  Point3D result;

  var1 = a3.var1;
  var0 = a3.var0;
  if (MPUFloatEqualToFloat(a3.var0, -1.13427449e38))
    v9 = a5;
  else
    v9 = var0;
  MPU::Point3D::Point3D(v13, a4, v9, var1);
  v10 = v13[0];
  v11 = v13[1];
  v12 = v13[2];
  result.var2 = v12;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (vector<MPU::Point3D,)_sortedPointsFor3DInterpolationFromEntriesContainer:(MPULayoutInterpolator *)self usingQueriedPoint:(SEL)a3 fallbackSecondaryReferenceMetric:(void *)a4
{
  double var2;
  double var1;
  double var0;
  double *v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  vector<MPU::Point3D, std::allocator<MPU::Point3D>> *result;
  _QWORD v19[3];
  void *__p;
  double *v21;

  var2 = a5.var2;
  var1 = a5.var1;
  var0 = a5.var0;
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  MPU::LayoutInterpolator::EntriesContainer::copyEntriesVector((MPU::LayoutInterpolator::EntriesContainer *)a4, &__p);
  v13 = (double *)__p;
  v14 = v21;
  while (v13 != v14)
  {
    -[MPULayoutInterpolator _pointForEntry:andPrimaryReferenceMetric:usingFallbackSecondaryReferenceMetric:](self, "_pointForEntry:andPrimaryReferenceMetric:usingFallbackSecondaryReferenceMetric:", *v13, v13[1], MPU::LayoutInterpolator::EntriesContainer::primaryReferenceMetric((MPU::LayoutInterpolator::EntriesContainer *)a4), a6);
    v19[0] = v15;
    v19[1] = v16;
    v19[2] = v17;
    std::vector<MPU::Point3D>::insert((uint64_t)retstr, (char *)retstr->var0, (unint64_t)v19);
    v13 += 2;
  }
  -[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:](self, "_sortPointsFor3DInterpolation:usingQueriedPoint:", retstr, var0, var1, var2);
  result = (vector<MPU::Point3D, std::allocator<MPU::Point3D>> *)__p;
  if (__p)
  {
    v21 = (double *)__p;
    operator delete(__p);
  }
  return result;
}

- (void)_sortPointsFor3DInterpolation:(void *)a3 usingQueriedPoint:(Point3D)a4
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  Point3D v9;

  v4 = *(_QWORD *)a3;
  v5 = *((_QWORD *)a3 + 1);
  v6 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *(_QWORD *)a3) >> 3);
  if (v6 >= 2)
  {
    v9 = a4;
    v7 = 126 - 2 * __clz(v6);
    if (v5 == v4)
      v8 = 0;
    else
      v8 = v7;
    std::__introsort<std::_ClassicAlgPolicy,-[MPULayoutInterpolator _sortPointsFor3DInterpolation:usingQueriedPoint:]::$_4 &,MPU::Point3D *,false>(v4, v5, &v9.var0, v8, 1);
  }
}

- (void).cxx_destruct
{
  vector<MPU::LayoutInterpolator::EntriesContainer, std::allocator<MPU::LayoutInterpolator::EntriesContainer>> *p_entriesContainers;

  p_entriesContainers = &self->_entriesContainers;
  std::vector<MPU::LayoutInterpolator::EntriesContainer>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_entriesContainers);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (void)_sortPointsFor3DInterpolation:(double *)a3 usingQueriedPoint:(uint64_t)a4
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  double *v16;
  double *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  unint64_t v27;
  unint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unint64_t v33;
  __int128 v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  __int128 v42;
  BOOL v43;
  double v44;
  double v45;
  double *v46;
  double v47;
  unint64_t v48;
  double v49;
  double v50;
  __int128 v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  __int128 v59;
  unint64_t v60;
  double v61;
  double v62;
  double v63;
  __int128 v64;
  unint64_t v65;
  uint64_t v66;
  double v67;
  unint64_t v68;
  unint64_t v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  uint64_t v76;
  int64_t v77;
  int64_t v78;
  int64_t v79;
  uint64_t v80;
  unint64_t v81;
  double v82;
  double v83;
  unint64_t v84;
  double v85;
  __int128 v86;
  unint64_t v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  double v91;
  double v92;
  int64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  int64_t v98;
  double v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  double v105;
  double v106;
  double v107;
  uint64_t v108;
  unint64_t v109;
  __int128 v110;
  double v111;
  unint64_t v113;
  double v114;
  uint64_t v115;
  double v116;
  double v117;
  uint64_t v118;
  double v119;
  double v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;

@end
