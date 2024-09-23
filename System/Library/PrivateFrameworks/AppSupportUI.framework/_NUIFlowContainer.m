@implementation _NUIFlowContainer

- (uint64_t)initWithFlowArrangement:(uint64_t)result
{
  if (result)
  {
    result = objc_msgSend((id)result, "init");
    if (result)
    {
      *(_QWORD *)(result + 120) = a2;
      *(_BYTE *)(result + 17) = *(_BYTE *)(a2 + 9);
      *(_QWORD *)(result + 8) = result;
    }
  }
  return result;
}

- (uint64_t)canUseSimpleGrid
{
  if (result)
    return (*(_QWORD *)(*(_QWORD *)(result + 120) + 16) != 0) & (objc_opt_respondsToSelector() ^ 1);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  _NUIGridArrangement::resetForInvalidation(&self->_gridArrangement, -1);
  v3.receiver = self;
  v3.super_class = (Class)_NUIFlowContainer;
  -[_NUIFlowContainer dealloc](&v3, sel_dealloc);
}

- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4
{
  double height;
  double width;
  double v8;
  double v9;
  _NUIGridArrangement *v10;
  CGSize v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[_NUIFlowContainer canUseSimpleGrid]((uint64_t)self))
  {
    if ((id)+[_NUIFlowArrangementDummyItem sharedDummyItem]() == a4)
    {
      v8 = *MEMORY[0x1E0C9D820];
      v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    else
    {
      objc_msgSend(*(id *)self->_flowArrangement, "contentLayoutSizeFittingSize:forArrangedSubview:", a4, width, height);
    }
  }
  else
  {
    v10 = (_NUIGridArrangement *)((char *)a4 + 8);
    _NUIGridArrangement::resetForInvalidation(v10, 0);
    v11.width = width;
    v11.height = height;
    _NUIGridArrangement::measureCells(v10, 0, v11);
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)populateGridArrangementCells:(void *)a3
{
  int v5;
  const void *flowArrangement;
  unint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v5 = -[_NUIFlowContainer canUseSimpleGrid]((uint64_t)self);
  flowArrangement = self->_flowArrangement;
  if (v5)
  {
    v7 = *((_QWORD *)flowArrangement + 2);
    v8 = (uint64_t *)*((_QWORD *)flowArrangement + 7);
    v9 = (uint64_t *)*((_QWORD *)flowArrangement + 8);
    if (v8 == v9)
    {
      v10 = 0;
    }
    else
    {
      v10 = 0;
      v11 = *(void **)flowArrangement;
      do
      {
        v30 = *v8;
        *(_QWORD *)&v29 = v10 % v7;
        *((_QWORD *)&v29 + 1) = 1;
        v27 = v10 / v7;
        v28 = 1;
        v26 = objc_msgSend(v11, "alignmentForCell:inAxis:", v8, 0);
        v12 = objc_msgSend(v11, "alignmentForCell:inAxis:", v8, 1);
        v25 = v12;
        v13 = *((_QWORD *)a3 + 1);
        if (v13 >= *((_QWORD *)a3 + 2))
        {
          v14 = std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<objc_object  {objcproto18NUIArrangementItem}*,_NSRange,objc_object  {objcproto18NUIArrangementItem}*,NUIContainerAlignment,_NSRange>((void **)a3, &v30, (uint64_t *)&v29, &v27, &v26, &v25);
        }
        else
        {
          _NUIGridArrangementCell::_NUIGridArrangementCell(*((_QWORD *)a3 + 1), v30, v29, *((uint64_t *)&v29 + 1), v27, v28, v26, v12);
          v14 = (void *)(v13 + 112);
          *((_QWORD *)a3 + 1) = v13 + 112;
        }
        *((_QWORD *)a3 + 1) = v14;
        ++v10;
        v8 += 8;
      }
      while (v8 != v9);
    }
    v19 = v10 / v7;
    v20 = v10 % v7;
    v21 = (v7 - v10 % v7) % v7;
    if (v21)
    {
      v22 = +[_NUIFlowArrangementDummyItem sharedDummyItem]();
      v30 = v22;
      *(_QWORD *)&v29 = v10 % v7;
      *((_QWORD *)&v29 + 1) = (v7 - v10 % v7) % v7;
      v27 = v10 / v7;
      v28 = 1;
      v25 = 0;
      v26 = 0;
      v23 = *((_QWORD *)a3 + 1);
      if (v23 >= *((_QWORD *)a3 + 2))
      {
        v24 = std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<_NUIFlowArrangementDummyItem *,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>((void **)a3, &v30, (uint64_t *)&v29, &v27, &v26, &v25);
      }
      else
      {
        _NUIGridArrangementCell::_NUIGridArrangementCell(*((_QWORD *)a3 + 1), v22, v20, v21, v19, 1, 0, 0);
        v24 = (void *)(v23 + 112);
        *((_QWORD *)a3 + 1) = v23 + 112;
      }
      *((_QWORD *)a3 + 1) = v24;
    }
  }
  else
  {
    v15 = (uint64_t *)*((_QWORD *)flowArrangement + 10);
    v16 = (uint64_t *)*((_QWORD *)flowArrangement + 11);
    if (v15 != v16)
    {
      v17 = 0;
      v18 = (char *)*((_QWORD *)a3 + 1);
      do
      {
        v29 = xmmword_1AA837710;
        v27 = v17;
        v28 = 1;
        v30 = 0;
        v26 = 3;
        if ((unint64_t)v18 >= *((_QWORD *)a3 + 2))
        {
          v18 = (char *)std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<_NUIFlowRowContainer * const&,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>((void **)a3, v15, (uint64_t *)&v29, &v27, &v30, &v26);
        }
        else
        {
          std::vector<_NUIGridArrangementCell>::__construct_one_at_end[abi:nn180100]<_NUIFlowRowContainer * const&,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>((uint64_t)a3, v15, (uint64_t *)&v29, &v27, &v30, &v26);
          v18 += 112;
        }
        *((_QWORD *)a3 + 1) = v18;
        ++v17;
        ++v15;
      }
      while (v15 != v16);
    }
  }
}

- (void)populateGridArrangementDimension:(void *)a3 withCells:(const void *)a4 axis:(int64_t)a5
{
  _NUIFlowContainer *v8;
  int v9;
  _QWORD *flowArrangement;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  _NUIGridArrangementDimension *v14;
  double *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _NUIGridArrangementDimension *v23;
  _NUIGridArrangementDimension *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _NUIGridArrangementDimension *v33;
  double *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  _NUIGridArrangementDimension *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  __int16 v51;
  _QWORD *v52;
  _NUIGridArrangementDimension *v53;
  double *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  _NUIGridArrangementDimension *v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  char *v68;
  _NUIGridArrangementDimension *v69;
  _NUIGridArrangementDimension *v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  _NUIGridArrangementDimension *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  _NUIGridArrangementDimension *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _NUIFlowContainer *v91;

  v8 = self;
  v9 = -[_NUIFlowContainer canUseSimpleGrid]((uint64_t)self);
  v91 = v8;
  if (a5)
  {
    flowArrangement = v8->_flowArrangement;
    if (v9)
    {
      v11 = flowArrangement[2];
      if (v11 <= v11 - 1 + 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 4))
      {
        v12 = 0;
        v13 = (char *)a3 + 16;
        v14 = (_NUIGridArrangementDimension *)*((_QWORD *)a3 + 1);
        do
        {
          v15 = (double *)v8->_flowArrangement;
          if ((unint64_t)v14 >= *v13)
          {
            v16 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v14 - *(_QWORD *)a3) >> 3);
            v17 = v16 + 1;
            if ((unint64_t)(v16 + 1) > 0x492492492492492)
              goto LABEL_89;
            if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v13 - *(_QWORD *)a3) >> 3) > v17)
              v17 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v13 - *(_QWORD *)a3) >> 3);
            if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*v13 - *(_QWORD *)a3) >> 3)) >= 0x249249249249249)
              v18 = 0x492492492492492;
            else
              v18 = v17;
            if (v18)
            {
              v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>((uint64_t)a3 + 16, v18);
              v21 = v20;
            }
            else
            {
              v19 = 0;
              v21 = 0;
            }
            _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v19[56 * v16], v12, v15[5]);
            v24 = *(_NUIGridArrangementDimension **)a3;
            v23 = (_NUIGridArrangementDimension *)*((_QWORD *)a3 + 1);
            v8 = v91;
            v25 = v22;
            if (v23 != *(_NUIGridArrangementDimension **)a3)
            {
              do
              {
                v26 = *(_OWORD *)((char *)v23 - 56);
                v27 = *(_OWORD *)((char *)v23 - 40);
                v28 = *(_OWORD *)((char *)v23 - 24);
                *(_QWORD *)(v25 - 8) = *((_QWORD *)v23 - 1);
                *(_OWORD *)(v25 - 24) = v28;
                *(_OWORD *)(v25 - 40) = v27;
                *(_OWORD *)(v25 - 56) = v26;
                v25 -= 56;
                v23 = (_NUIGridArrangementDimension *)((char *)v23 - 56);
              }
              while (v23 != v24);
              v23 = *(_NUIGridArrangementDimension **)a3;
            }
            v29 = &v19[56 * v21];
            v14 = (_NUIGridArrangementDimension *)(v22 + 56);
            *(_QWORD *)a3 = v25;
            *((_QWORD *)a3 + 1) = v22 + 56;
            *((_QWORD *)a3 + 2) = v29;
            if (v23)
              operator delete(v23);
          }
          else
          {
            _NUIGridArrangementDimension::_NUIGridArrangementDimension(v14, v12, v15[5]);
            v14 = (_NUIGridArrangementDimension *)((char *)v14 + 56);
            *((_QWORD *)a3 + 1) = v14;
          }
          *((_QWORD *)a3 + 1) = v14;
          ++v12;
        }
        while (v12 < (v11 - 1 + 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)a4 + 1) - *(_QWORD *)a4) >> 4)) / v11);
      }
    }
    else
    {
      v49 = flowArrangement[10];
      v50 = flowArrangement[11];
      if (v49 != v50)
      {
        v51 = 0;
        v52 = (char *)a3 + 16;
        v53 = (_NUIGridArrangementDimension *)*((_QWORD *)a3 + 1);
        do
        {
          v54 = (double *)v8->_flowArrangement;
          if ((unint64_t)v53 >= *v52)
          {
            v55 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v53 - *(_QWORD *)a3) >> 3);
            v56 = v55 + 1;
            if ((unint64_t)(v55 + 1) > 0x492492492492492)
              goto LABEL_89;
            if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v52 - *(_QWORD *)a3) >> 3) > v56)
              v56 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v52 - *(_QWORD *)a3) >> 3);
            if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*v52 - *(_QWORD *)a3) >> 3)) >= 0x249249249249249)
              v57 = 0x492492492492492;
            else
              v57 = v56;
            if (v57)
            {
              v58 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>((uint64_t)a3 + 16, v57);
              v60 = v59;
            }
            else
            {
              v58 = 0;
              v60 = 0;
            }
            _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v58[56 * v55], v51, v54[5]);
            v63 = *(_NUIGridArrangementDimension **)a3;
            v62 = (char *)*((_QWORD *)a3 + 1);
            v8 = v91;
            v64 = v61;
            if (v62 != *(char **)a3)
            {
              do
              {
                v65 = *(_OWORD *)(v62 - 56);
                v66 = *(_OWORD *)(v62 - 40);
                v67 = *(_OWORD *)(v62 - 24);
                *(_QWORD *)(v64 - 8) = *((_QWORD *)v62 - 1);
                *(_OWORD *)(v64 - 24) = v67;
                *(_OWORD *)(v64 - 40) = v66;
                *(_OWORD *)(v64 - 56) = v65;
                v64 -= 56;
                v62 -= 56;
              }
              while (v62 != (char *)v63);
              v62 = *(char **)a3;
            }
            v68 = &v58[56 * v60];
            v53 = (_NUIGridArrangementDimension *)(v61 + 56);
            *(_QWORD *)a3 = v64;
            *((_QWORD *)a3 + 1) = v61 + 56;
            *((_QWORD *)a3 + 2) = v68;
            if (v62)
              operator delete(v62);
          }
          else
          {
            _NUIGridArrangementDimension::_NUIGridArrangementDimension(v53, v51, v54[5]);
            v53 = (_NUIGridArrangementDimension *)((char *)v53 + 56);
            *((_QWORD *)a3 + 1) = v53;
          }
          *((_QWORD *)a3 + 1) = v53;
          ++v51;
          v49 += 8;
        }
        while (v49 != v50);
      }
    }
    v70 = *(_NUIGridArrangementDimension **)a3;
    v69 = (_NUIGridArrangementDimension *)*((_QWORD *)a3 + 1);
    if (*(_NUIGridArrangementDimension **)a3 != v69)
    {
      v71 = *((_QWORD *)v8->_flowArrangement + 3);
      do
      {
        *(_QWORD *)v70 = v71;
        v70 = (_NUIGridArrangementDimension *)((char *)v70 + 56);
      }
      while (v70 != v69);
    }
    *((_QWORD *)v69 - 7) = 0;
  }
  else if (v9)
  {
    v30 = *((_QWORD *)v8->_flowArrangement + 2);
    if (v30)
    {
      v31 = 0;
      v32 = (char *)a3 + 16;
      v33 = (_NUIGridArrangementDimension *)*((_QWORD *)a3 + 1);
      do
      {
        v34 = (double *)v8->_flowArrangement;
        if ((unint64_t)v33 >= *v32)
        {
          v35 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v33 - *(_QWORD *)a3) >> 3);
          v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) > 0x492492492492492)
            goto LABEL_89;
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v32 - *(_QWORD *)a3) >> 3) > v36)
            v36 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v32 - *(_QWORD *)a3) >> 3);
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*v32 - *(_QWORD *)a3) >> 3)) >= 0x249249249249249)
            v37 = 0x492492492492492;
          else
            v37 = v36;
          if (v37)
          {
            v38 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>((uint64_t)a3 + 16, v37);
            v40 = v39;
          }
          else
          {
            v38 = 0;
            v40 = 0;
          }
          _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v38[56 * v35], v31, v34[6]);
          v43 = *(_NUIGridArrangementDimension **)a3;
          v42 = (char *)*((_QWORD *)a3 + 1);
          v44 = v41;
          if (v42 != *(char **)a3)
          {
            do
            {
              v45 = *(_OWORD *)(v42 - 56);
              v46 = *(_OWORD *)(v42 - 40);
              v47 = *(_OWORD *)(v42 - 24);
              *(_QWORD *)(v44 - 8) = *((_QWORD *)v42 - 1);
              *(_OWORD *)(v44 - 24) = v47;
              *(_OWORD *)(v44 - 40) = v46;
              *(_OWORD *)(v44 - 56) = v45;
              v44 -= 56;
              v42 -= 56;
            }
            while (v42 != (char *)v43);
            v42 = *(char **)a3;
          }
          v48 = &v38[56 * v40];
          v33 = (_NUIGridArrangementDimension *)(v41 + 56);
          *(_QWORD *)a3 = v44;
          *((_QWORD *)a3 + 1) = v41 + 56;
          *((_QWORD *)a3 + 2) = v48;
          if (v42)
            operator delete(v42);
        }
        else
        {
          _NUIGridArrangementDimension::_NUIGridArrangementDimension(v33, v31, v34[6]);
          v33 = (_NUIGridArrangementDimension *)((char *)v33 + 56);
          *((_QWORD *)a3 + 1) = v33;
        }
        *((_QWORD *)a3 + 1) = v33;
        ++v31;
      }
      while (v31 != v30);
    }
    else
    {
      v33 = (_NUIGridArrangementDimension *)*((_QWORD *)a3 + 1);
    }
    v82 = *(_NUIGridArrangementDimension **)a3;
    if (*(_NUIGridArrangementDimension **)a3 != v33)
    {
      v83 = *((_QWORD *)v8->_flowArrangement + 4);
      do
      {
        *(_QWORD *)v82 = v83;
        v82 = (_NUIGridArrangementDimension *)((char *)v82 + 56);
      }
      while (v82 != v33);
    }
    *((_QWORD *)v33 - 7) = 0;
  }
  else
  {
    v72 = *((_QWORD *)a3 + 2);
    v73 = *((_QWORD *)a3 + 1);
    if (v73 >= v72)
    {
      v75 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v73 - *(_QWORD *)a3) >> 3);
      if ((unint64_t)(v75 + 1) > 0x492492492492492)
LABEL_89:
        abort();
      v76 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v72 - *(_QWORD *)a3) >> 3);
      v77 = 2 * v76;
      if (2 * v76 <= v75 + 1)
        v77 = v75 + 1;
      if (v76 >= 0x249249249249249)
        v78 = 0x492492492492492;
      else
        v78 = v77;
      if (v78)
      {
        v79 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>((uint64_t)a3 + 16, v78);
        v81 = v80;
      }
      else
      {
        v79 = 0;
        v81 = 0;
      }
      _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v79[56 * v75], 0, 1.79769313e308);
      v85 = &v79[56 * v81];
      v74 = v84 + 56;
      v87 = *(_NUIGridArrangementDimension **)a3;
      v86 = (char *)*((_QWORD *)a3 + 1);
      if (v86 != *(char **)a3)
      {
        do
        {
          v88 = *(_OWORD *)(v86 - 56);
          v89 = *(_OWORD *)(v86 - 40);
          v90 = *(_OWORD *)(v86 - 24);
          *(_QWORD *)(v84 - 8) = *((_QWORD *)v86 - 1);
          *(_OWORD *)(v84 - 24) = v90;
          *(_OWORD *)(v84 - 40) = v89;
          *(_OWORD *)(v84 - 56) = v88;
          v84 -= 56;
          v86 -= 56;
        }
        while (v86 != (char *)v87);
        v86 = *(char **)a3;
      }
      *(_QWORD *)a3 = v84;
      *((_QWORD *)a3 + 1) = v74;
      *((_QWORD *)a3 + 2) = v85;
      if (v86)
        operator delete(v86);
    }
    else
    {
      _NUIGridArrangementDimension::_NUIGridArrangementDimension(*((_NUIGridArrangementDimension **)a3 + 1), 0, 1.79769313e308);
      v74 = v73 + 56;
      *((_QWORD *)a3 + 1) = v73 + 56;
    }
    *((_QWORD *)a3 + 1) = v74;
  }
}

- (BOOL)canCancelMeasurementForCompression
{
  return objc_msgSend(*(id *)self->_flowArrangement, "canCancelMeasurementForCompression");
}

- (BOOL)shouldCancelMeasurementForCompressionInAxis:(int64_t)a3
{
  return objc_msgSend(*(id *)self->_flowArrangement, "shouldCancelMeasurementForCompressionInAxis:", a3);
}

- (void).cxx_destruct
{
  CGRect *begin;
  _NUIGridArrangementDimension *v4;
  _NUIGridArrangementDimension *v5;
  _NUIGridArrangementCell *v6;

  begin = self->_gridArrangement.viewFrames.__begin_;
  if (begin)
  {
    self->_gridArrangement.viewFrames.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_gridArrangement.rows.__begin_;
  if (v4)
  {
    self->_gridArrangement.rows.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_gridArrangement.columns.__begin_;
  if (v5)
  {
    self->_gridArrangement.columns.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_gridArrangement.cells.__begin_;
  if (v6)
  {
    self->_gridArrangement.cells.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  _NUIGridArrangement::_NUIGridArrangement(&self->_gridArrangement);
  return self;
}

@end
