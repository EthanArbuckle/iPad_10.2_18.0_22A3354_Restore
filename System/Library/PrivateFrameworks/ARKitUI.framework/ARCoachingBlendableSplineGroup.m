@implementation ARCoachingBlendableSplineGroup

- (NSArray)controlPoints
{
  return (NSArray *)self->_controlPoints;
}

- ($8EF4127CF77ECA3DDB612FCF233DC3A8)patchData
{
  if (self->_patchData.__begin_ == self->_patchData.__end_)
    return 0;
  else
    return self->_patchData.__begin_;
}

- (unsigned)patchDataLength
{
  return (unint64_t)(self->_patchData.__end_ - self->_patchData.__begin_) >> 3;
}

- (unsigned)indices
{
  if (self->_indices.__begin_ == self->_indices.__end_)
    return 0;
  else
    return self->_indices.__begin_;
}

- (unsigned)numIndices
{
  return (unint64_t)((char *)self->_indices.__end_ - (char *)self->_indices.__begin_) >> 1;
}

- (ARCoachingBlendableSplineGroup)initWithSplineGroups:(id)a3
{
  ARCoachingBlendableSplineGroup *v4;
  uint64_t v5;
  NSMutableArray *controlPoints;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  uint64_t v18;
  unint64_t j;
  void *v20;
  void *v21;
  ARCoachingControlPointContainer *v22;
  unint64_t v23;
  void **p_begin;
  void *v25;
  BOOL v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int16 *value;
  unsigned __int16 *end;
  unsigned __int16 *v32;
  unsigned __int16 *begin;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  unsigned __int16 *v40;
  unsigned __int16 v41;
  unint64_t v42;
  vector<ARCoachingPatchData, std::allocator<ARCoachingPatchData>> *p_patchData;
  void *v44;
  BOOL v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v49;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v50;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v57;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v58;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v59;
  uint64_t v60;
  id v62;
  float v63;
  float v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v62 = a3;
  v69.receiver = self;
  v69.super_class = (Class)ARCoachingBlendableSplineGroup;
  v4 = -[ARCoachingBlendableSplineGroup init](&v69, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    controlPoints = v4->_controlPoints;
    v4->_controlPoints = (NSMutableArray *)v5;

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v7 = v62;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v66 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "numControlPoints");
          if (v13 != objc_msgSend(v11, "numControlPoints"))
            __assert_rtn("-[ARCoachingBlendableSplineGroup initWithSplineGroups:]", "ARCoachingSpline.mm", 447, "splineGroups[0].numControlPoints == splineGroup.numControlPoints");

          objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "numIndices");
          if (v15 != objc_msgSend(v11, "numIndices"))
            __assert_rtn("-[ARCoachingBlendableSplineGroup initWithSplineGroups:]", "ARCoachingSpline.mm", 448, "splineGroups[0].numIndices == splineGroup.numIndices");

          objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "patchDataLength");
          if (v17 != objc_msgSend(v11, "patchDataLength"))
            __assert_rtn("-[ARCoachingBlendableSplineGroup initWithSplineGroups:]", "ARCoachingSpline.mm", 449, "splineGroups[0].patchDataLength == splineGroup.patchDataLength");

          v18 = 0;
          for (j = 0; j < objc_msgSend(v11, "patchDataLength"); ++j)
          {
            objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = COERCE_FLOAT(*(_QWORD *)(objc_msgSend(v20, "patchData") + v18));
            if (v63 != COERCE_FLOAT(*(_QWORD *)(objc_msgSend(v11, "patchData") + v18)))
              __assert_rtn("-[ARCoachingBlendableSplineGroup initWithSplineGroups:]", "ARCoachingSpline.mm", 452, "splineGroups[0].patchData[i].factorScale.x == splineGroup.patchData[i].factorScale.x");

            objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v64) = HIDWORD(*(_QWORD *)(objc_msgSend(v21, "patchData") + v18));
            if (v64 != *(float *)(objc_msgSend(v11, "patchData") + v18 + 4))
              __assert_rtn("-[ARCoachingBlendableSplineGroup initWithSplineGroups:]", "ARCoachingSpline.mm", 453, "splineGroups[0].patchData[i].factorScale.y == splineGroup.patchData[i].factorScale.y");

            v18 += 8;
          }
          v22 = -[ARCoachingControlPointContainer initWithControlPoints:numControlPoints:]([ARCoachingControlPointContainer alloc], "initWithControlPoints:numControlPoints:", objc_msgSend(v11, "controlPoints"), objc_msgSend(v11, "numControlPoints"));
          -[NSMutableArray addObject:](v4->_controlPoints, "addObject:", v22);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
      }
      while (v8);
    }

    v23 = 0;
    p_begin = (void **)&v4->_indices.__begin_;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v23 < objc_msgSend(v25, "numIndices");

      if (!v26)
        break;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "indices");
      v29 = v28;
      end = v4->_indices.__end_;
      value = v4->_indices.__end_cap_.__value_;
      if (end >= value)
      {
        begin = (unsigned __int16 *)*p_begin;
        v34 = (char *)end - (_BYTE *)*p_begin;
        if (v34 <= -3)
          _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
        v35 = v34 >> 1;
        v36 = (char *)value - (char *)begin;
        if (v36 <= (v34 >> 1) + 1)
          v37 = v35 + 1;
        else
          v37 = v36;
        if (v36 >= 0x7FFFFFFFFFFFFFFELL)
          v38 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v38 = v37;
        if (v38)
        {
          v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)&v4->_indices.__end_cap_, v38);
          begin = v4->_indices.__begin_;
          end = v4->_indices.__end_;
        }
        else
        {
          v39 = 0;
        }
        v40 = (unsigned __int16 *)&v39[2 * v35];
        *v40 = *(_WORD *)(v29 + 2 * v23);
        v32 = v40 + 1;
        while (end != begin)
        {
          v41 = *--end;
          *--v40 = v41;
        }
        v4->_indices.__begin_ = v40;
        v4->_indices.__end_ = v32;
        v4->_indices.__end_cap_.__value_ = (unsigned __int16 *)&v39[2 * v38];
        if (begin)
          operator delete(begin);
      }
      else
      {
        *end = *(_WORD *)(v28 + 2 * v23);
        v32 = end + 1;
      }
      v4->_indices.__end_ = v32;

      ++v23;
    }
    v42 = 0;
    p_patchData = &v4->_patchData;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v42 < objc_msgSend(v44, "patchDataLength");

      if (!v45)
        break;
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "patchData");
      v48 = v47;
      v50 = v4->_patchData.__end_;
      v49 = v4->_patchData.__end_cap_.__value_;
      if (v50 >= v49)
      {
        v52 = (v50 - p_patchData->__begin_) >> 3;
        if ((unint64_t)(v52 + 1) >> 61)
          _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
        v53 = v49 - p_patchData->__begin_;
        v54 = v53 >> 2;
        if (v53 >> 2 <= (unint64_t)(v52 + 1))
          v54 = v52 + 1;
        if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF8)
          v55 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v55 = v54;
        if (v55)
          v56 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v4->_patchData.__end_cap_, v55);
        else
          v56 = 0;
        v57 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v56[8 * v52];
        *(_QWORD *)v57 = *(_QWORD *)(v48 + 8 * v42);
        v51 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v57 + 8);
        v59 = v4->_patchData.__begin_;
        v58 = v4->_patchData.__end_;
        if (v58 != v59)
        {
          do
          {
            v60 = *((_QWORD *)v58 - 1);
            v58 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v58 - 8);
            *((_QWORD *)v57 - 1) = v60;
            v57 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v57 - 8);
          }
          while (v58 != v59);
          v58 = p_patchData->__begin_;
        }
        v4->_patchData.__begin_ = v57;
        v4->_patchData.__end_ = v51;
        v4->_patchData.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v56[8 * v55];
        if (v58)
          operator delete(v58);
      }
      else
      {
        *(_QWORD *)v50 = *(_QWORD *)(v47 + 8 * v42);
        v51 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v50 + 8);
      }
      v4->_patchData.__end_ = v51;

      ++v42;
    }
  }

  return v4;
}

- (void).cxx_destruct
{
  unsigned __int16 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v4;

  begin = self->_indices.__begin_;
  if (begin)
  {
    self->_indices.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_patchData.__begin_;
  if (v4)
  {
    self->_patchData.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_controlPoints, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end
