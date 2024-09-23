@implementation NUIContainerStackView

uint64_t __56__NUIContainerStackView_layoutArrangedSubviewsInBounds___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUntransformedFrame:");
}

- (void)invalidateInternalStateForInvalidation:(int64_t)a3
{
  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, a3);
}

- (void)layoutArrangedSubviewsInBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NUIContainerStackView _calculateArrangedSizeFittingSize:forLayout:]((uint64_t)self, 1, a3.size.width, a3.size.height);
  _NUIGridArrangement::positionCells((uint64_t)&self->_arrangement, (uint64_t)&__block_literal_global_3, x, y, width, height);
}

- (double)_calculateArrangedSizeFittingSize:(CGFloat)a3 forLayout:(CGFloat)a4
{
  double v8;
  double v9;
  CGSize v11;

  if (!a1)
    return 0.0;
  do
  {
    _NUIGridArrangement::resetForInvalidation((_NUIGridArrangement *)(a1 + 552), 0);
    v11.width = a3;
    v11.height = a4;
    _NUIGridArrangement::measureCells((_NUIGridArrangement *)(a1 + 552), a2, v11);
    v9 = v8;
  }
  while ((objc_msgSend((id)a1, "mustRestartMeasurement") & 1) != 0);
  return v9;
}

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = -[NUIContainerStackView _calculateArrangedSizeFittingSize:forLayout:]((uint64_t)self, 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)populateGridArrangementDimension:(void *)a3 withCells:(const void *)a4 axis:(int64_t)a5
{
  NSArray *v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  uint64_t v12;
  __n128 v13;
  size_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  $ED191FA5279C67AC4BE6375188FD581F *p_responderFlags;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char *v39;
  _QWORD *v40;
  char *v41;
  unint64_t v42;
  BOOL v43;
  _QWORD *v44;
  double *p_spacing;
  double v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t *v51;
  uint64_t *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  double v67;
  uint64_t v68;
  unint64_t v69;
  double v70;
  unint64_t v71;
  double v72;
  uint64_t v73;
  unint64_t v74;
  double v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  char *v99;
  char *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  uint64_t **v105;
  int64_t v106;
  uint64_t v107;
  NSArray *v108;
  NUIContainerStackView *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  uint64_t *v114;
  unint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  char *v123;
  _QWORD v124[18];

  v105 = (uint64_t **)a4;
  v106 = a5;
  v124[16] = *MEMORY[0x1E0C80C00];
  v109 = self;
  v6 = -[NUIContainerView arrangedSubviews](self, "arrangedSubviews");
  v7 = -[NSArray count](v6, "count");
  -[NSArray count](v6, "count");
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v104 - v9;
  bzero((char *)&v104 - v9, v11);
  v122 = v7;
  v123 = v10;
  bzero(v10, (unint64_t)(8 * v7 + 504) >> 6);
  v112 = (uint64_t)v6;
  v12 = -[NSArray count](v6, "count");
  objc_msgSend((id)v112, "count");
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v104 - ((v14 + 15) & 0x7FFFFFFFFFFFFF0);
  bzero(v15, v14);
  v120 = v12;
  v121 = v15;
  bzero(v15, (unint64_t)(8 * v12 + 504) >> 6);
  if ((uint64_t)(int)(*(_DWORD *)&v109->_stackViewFlags << 12) >> 28 == v106)
  {
    v111 = objc_msgSend((id)v112, "count");
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v108 = -[NUIContainerView visibleArrangedSubviews](v109, "visibleArrangedSubviews");
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v108, "countByEnumeratingWithState:objects:count:", &v116, v124, 16);
    if (v16)
    {
      v17 = 0;
      v110 = *(_QWORD *)v117;
      p_responderFlags = &v109->super.super.super._responderFlags;
      v107 = (uint64_t)a3 + 16;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v117 != v110)
            objc_enumerationMutation(v108);
          v20 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * v19);
          v21 = objc_msgSend((id)v112, "indexOfObject:inRange:", v20, v17, v111 - v17);
          v23 = *((_QWORD *)a3 + 1);
          v22 = *((_QWORD *)a3 + 2);
          if (v23 >= v22)
          {
            v25 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v23 - *(_QWORD *)a3) >> 3);
            v26 = v25 + 1;
            if ((unint64_t)(v25 + 1) > 0x492492492492492)
              abort();
            v27 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v22 - *(_QWORD *)a3) >> 3);
            if (2 * v27 > v26)
              v26 = 2 * v27;
            if (v27 >= 0x249249249249249)
              v28 = 0x492492492492492;
            else
              v28 = v26;
            if (v28)
            {
              v29 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>(v107, v28);
              v31 = v30;
            }
            else
            {
              v29 = 0;
              v31 = 0;
            }
            _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v29[56 * v25], v21, 1.79769313e308);
            v34 = *(char **)a3;
            v33 = (char *)*((_QWORD *)a3 + 1);
            v35 = v32;
            if (v33 != *(char **)a3)
            {
              do
              {
                v36 = *(_OWORD *)(v33 - 56);
                v37 = *(_OWORD *)(v33 - 40);
                v38 = *(_OWORD *)(v33 - 24);
                *(_QWORD *)(v35 - 8) = *((_QWORD *)v33 - 1);
                *(_OWORD *)(v35 - 24) = v38;
                *(_OWORD *)(v35 - 40) = v37;
                *(_OWORD *)(v35 - 56) = v36;
                v35 -= 56;
                v33 -= 56;
              }
              while (v33 != v34);
              v33 = *(char **)a3;
            }
            v39 = &v29[56 * v31];
            v24 = v32 + 56;
            *(_QWORD *)a3 = v35;
            *((_QWORD *)a3 + 1) = v32 + 56;
            *((_QWORD *)a3 + 2) = v39;
            if (v33)
              operator delete(v33);
          }
          else
          {
            _NUIGridArrangementDimension::_NUIGridArrangementDimension(*((_NUIGridArrangementDimension **)a3 + 1), v21, 1.79769313e308);
            v24 = v23 + 56;
            *((_QWORD *)a3 + 1) = v24;
          }
          *((_QWORD *)a3 + 1) = v24;
          v40 = *(_QWORD **)&p_responderFlags[168];
          if (!v40)
            goto LABEL_34;
          v41 = (char *)&p_responderFlags[168];
          do
          {
            v42 = v40[4];
            v43 = v42 >= v20;
            if (v42 >= v20)
              v44 = v40;
            else
              v44 = v40 + 1;
            if (v43)
              v41 = (char *)v40;
            v40 = (_QWORD *)*v44;
          }
          while (*v44);
          if (v41 != (char *)&p_responderFlags[168] && v20 >= *((_QWORD *)v41 + 4))
            p_spacing = (double *)(v41 + 40);
          else
LABEL_34:
            p_spacing = &v109->_spacing;
          v46 = *p_spacing;
          *(double *)(v24 - 56) = *p_spacing;
          if (NUIContainerViewLengthIsSystem(0, v46))
            *(_QWORD *)&v123[(v21 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v21;
          v17 = v21 + 1;
          ++v19;
        }
        while (v19 != v16);
        v47 = -[NSArray countByEnumeratingWithState:objects:count:](v108, "countByEnumeratingWithState:objects:count:", &v116, v124, 16);
        v16 = v47;
      }
      while (v47);
      v10 = v123;
    }
    v48 = *(char **)a3;
    v49 = (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3;
    v112 = -1;
    v50 = 0x6DB6DB6DB6DB6DB7 * v49 - 1;
    *(_QWORD *)&v48[56 * v50] = 0;
    *(_QWORD *)&v10[(v50 >> 3) & 0x1FFFFFFFFFFFFFF8] &= ~(1 << v50);
    v51 = *v105;
    v52 = v105[1];
    if (*v105 != v52)
    {
      v53 = (char *)&v109->super.super.super.super.isa + 2;
      do
      {
        v54 = *v51;
        if (v106)
        {
          v55 = v51[9];
          v56 = v51[10];
          -[NUIContainerView minimumSpacingAdjacentToView:](v109, "minimumSpacingAdjacentToView:", v54);
          v59 = v58;
          if (v55)
          {
            v60 = v57;
            if (!NUIContainerViewLengthIsDefault(v57))
            {
              if (NUIContainerViewLengthIsSystem(0, v60))
              {
                v61 = 1 << (v55 - 1);
                v62 = ((unint64_t)(unsigned __int16)(v55 - 1) >> 3) & 0x1FF8;
                *(_QWORD *)&v121[v62] |= v61;
                *(_QWORD *)&v10[v62] &= ~v61;
              }
              else
              {
                v70 = *(double *)(*(_QWORD *)a3 + 56 * (unsigned __int16)(v55 - 1));
                if (v70 <= v60)
                  v70 = v60;
                *(double *)(*(_QWORD *)a3 + 56 * (unsigned __int16)(v55 - 1)) = v70;
              }
            }
          }
          v71 = v56 + v55;
          if (v71 >= *((unsigned __int16 *)v53 + 332) || NUIContainerViewLengthIsDefault(v59))
            goto LABEL_69;
        }
        else
        {
          v64 = v51[7];
          v63 = v51[8];
          -[NUIContainerView minimumSpacingAdjacentToView:](v109, "minimumSpacingAdjacentToView:", v54);
          v59 = v66;
          if (v64)
          {
            v67 = v65;
            if (!NUIContainerViewLengthIsDefault(v65))
            {
              if (NUIContainerViewLengthIsSystem(0, v67))
              {
                v68 = 1 << (v64 - 1);
                v69 = ((unint64_t)(unsigned __int16)(v64 - 1) >> 3) & 0x1FF8;
                *(_QWORD *)&v121[v69] |= v68;
                *(_QWORD *)&v10[v69] &= ~v68;
              }
              else
              {
                v72 = *(double *)(*(_QWORD *)a3 + 56 * (unsigned __int16)(v64 - 1));
                if (v72 <= v67)
                  v72 = v67;
                *(double *)(*(_QWORD *)a3 + 56 * (unsigned __int16)(v64 - 1)) = v72;
              }
            }
          }
          v71 = v63 + v64;
          if (v71 >= v109->_visibleCount.width || NUIContainerViewLengthIsDefault(v59))
            goto LABEL_69;
        }
        if (NUIContainerViewLengthIsSystem(0, v59))
        {
          v73 = 1 << (v71 - 1);
          v74 = ((unint64_t)(unsigned __int16)(v71 - 1) >> 3) & 0x1FF8;
          *(_QWORD *)&v121[v74] |= v73;
          *(_QWORD *)&v10[v74] &= ~v73;
        }
        else
        {
          v75 = *(double *)(*(_QWORD *)a3 + 56 * (unsigned __int16)(v71 - 1));
          if (v75 <= v59)
            v75 = v59;
          *(double *)(*(_QWORD *)a3 + 56 * (unsigned __int16)(v71 - 1)) = v75;
        }
LABEL_69:
        v51 += 14;
      }
      while (v51 != v52);
    }
    v76 = -[NUIContainerView isBaselineRelativeArrangement](v109, "isBaselineRelativeArrangement");
    nui::stack_bitset::begin((nui::stack_bitset *)&v122);
    v78 = v77;
    v114 = &v122;
    v115 = v77;
    v79 = v122;
    if (v77 != v122)
    {
      v80 = *MEMORY[0x1E0C99768];
      do
      {
        if (v78 < v112 + 0x6DB6DB6DB6DB6DB7 * (((char *)v105[1] - (char *)*v105) >> 4))
        {
          v113 = 0.0;
          if (!NUIContainerViewLengthIsSystem(&v113, *(double *)(*(_QWORD *)a3 + 56 * v78)))
            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v80, CFSTR("Invalid system spacing"));
          objc_msgSend((id)(*v105)[14 * v78], "systemSpacingToAdjecentSiblingView:axis:baselineRelative:multiplier:", (*v105)[14 * v78 + 14], v106, v76, v113);
          *(_QWORD *)(*(_QWORD *)a3 + 56 * v78) = v81;
        }
        nui::stack_bitset::iterator::operator++((uint64_t)&v114);
        v78 = v115;
      }
      while (v115 != v79 || v114 != &v122);
    }
    nui::stack_bitset::begin((nui::stack_bitset *)&v120);
    v83 = v82;
    v114 = &v120;
    v115 = v82;
    v84 = v120;
    if (v82 != v120)
    {
      v85 = *MEMORY[0x1E0C99768];
      do
      {
        v113 = 0.0;
        if (!NUIContainerViewLengthIsSystem(&v113, *(double *)(*(_QWORD *)a3 + 56 * v83)))
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v85, CFSTR("Invalid system spacing"));
        objc_msgSend((id)(*v105)[14 * v83], "systemSpacingToAdjecentSiblingView:axis:baselineRelative:multiplier:", (*v105)[14 * v83 + 14], v106, v76, v113);
        if (*(double *)(*(_QWORD *)a3 + 56 * v83) > v86)
          v86 = *(double *)(*(_QWORD *)a3 + 56 * v83);
        *(double *)(*(_QWORD *)a3 + 56 * v83) = v86;
        nui::stack_bitset::iterator::operator++((uint64_t)&v114);
        v83 = v115;
      }
      while (v115 != v84 || v114 != &v120);
    }
  }
  else
  {
    v87 = *((_QWORD *)a3 + 2);
    v88 = *((_QWORD *)a3 + 1);
    if (v88 >= v87)
    {
      v90 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v88 - *(_QWORD *)a3) >> 3);
      if ((unint64_t)(v90 + 1) > 0x492492492492492)
        abort();
      v91 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v87 - *(_QWORD *)a3) >> 3);
      v92 = 2 * v91;
      if (2 * v91 <= v90 + 1)
        v92 = v90 + 1;
      if (v91 >= 0x249249249249249)
        v93 = 0x492492492492492;
      else
        v93 = v92;
      if (v93)
      {
        v94 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>((uint64_t)a3 + 16, v93);
        v96 = v95;
      }
      else
      {
        v94 = 0;
        v96 = 0;
      }
      _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v94[56 * v90], 0, 1.79769313e308);
      v98 = &v94[56 * v96];
      v89 = v97 + 56;
      v100 = *(char **)a3;
      v99 = (char *)*((_QWORD *)a3 + 1);
      if (v99 != *(char **)a3)
      {
        do
        {
          v101 = *(_OWORD *)(v99 - 56);
          v102 = *(_OWORD *)(v99 - 40);
          v103 = *(_OWORD *)(v99 - 24);
          *(_QWORD *)(v97 - 8) = *((_QWORD *)v99 - 1);
          *(_OWORD *)(v97 - 24) = v103;
          *(_OWORD *)(v97 - 40) = v102;
          *(_OWORD *)(v97 - 56) = v101;
          v97 -= 56;
          v99 -= 56;
        }
        while (v99 != v100);
        v99 = *(char **)a3;
      }
      *(_QWORD *)a3 = v97;
      *((_QWORD *)a3 + 1) = v89;
      *((_QWORD *)a3 + 2) = v98;
      if (v99)
        operator delete(v99);
    }
    else
    {
      _NUIGridArrangementDimension::_NUIGridArrangementDimension(*((_NUIGridArrangementDimension **)a3 + 1), 0, 1.79769313e308);
      v89 = v88 + 56;
      *((_QWORD *)a3 + 1) = v88 + 56;
    }
    *((_QWORD *)a3 + 1) = v89;
    *(_QWORD *)(v89 - 56) = 0;
  }
}

- (void)populateGridArrangementCells:(void *)a3
{
  NSArray *v5;
  NSArray *v6;
  $16CB4399C9D3FC671DCB37404DE12009 stackViewFlags;
  BOOL v8;
  int v9;
  __int16 v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  _DWORD *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  _DWORD *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = -[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews");
  v6 = v5;
  stackViewFlags = self->_stackViewFlags;
  v9 = *(_DWORD *)&stackViewFlags & 0xF0000;
  v8 = (*(_DWORD *)&stackViewFlags & 0xF0000) == 0;
  v10 = *((unsigned __int8 *)&stackViewFlags + 1);
  if (!v8)
    v10 = 0;
  *((_BYTE *)&self->_arrangement + 8) = v10;
  if (v9)
    v11 = *((unsigned __int8 *)&self->_stackViewFlags + 1) << 8;
  else
    v11 = 0;
  *((_WORD *)&self->_arrangement + 4) = v11 | v10;
  *((_QWORD *)a3 + 1) = *(_QWORD *)a3;
  v29 = xmmword_1AA837710;
  v30 = xmmword_1AA837710;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v6);
        v28 = 0;
        v28 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v23 = 0;
        v15 = -[NUIContainerStackView _effectiveAlignmentForArrangedSubview:](self, v28);
        v23 = v15;
        if (v9)
        {
          v22 = 0;
          v16 = *((_QWORD *)a3 + 1);
          if (v16 >= *((_QWORD *)a3 + 2))
          {
            v18 = std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<UIView *&,_NSRange &,_NSRange &,NUIContainerAlignment &,NUIContainerAlignment>((void **)a3, &v28, (uint64_t *)&v30, (uint64_t *)&v29, &v23, &v22);
          }
          else
          {
            v17 = _NUIGridArrangementCell::_NUIGridArrangementCell(*((_QWORD *)a3 + 1), v28, v30, *((uint64_t *)&v30 + 1), v29, *((uint64_t *)&v29 + 1), v15, 0).n128_u64[0];
            v18 = (void *)(v16 + 112);
            *((_QWORD *)a3 + 1) = v16 + 112;
          }
          *((_QWORD *)a3 + 1) = v18;
          *(_QWORD *)&v29 = v29 + 1;
        }
        else
        {
          v22 = 0;
          v19 = *((_QWORD *)a3 + 1);
          if (v19 >= *((_QWORD *)a3 + 2))
          {
            v20 = std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<UIView *&,_NSRange &,_NSRange &,NUIContainerAlignment,NUIContainerAlignment&>((void **)a3, &v28, (uint64_t *)&v30, (uint64_t *)&v29, &v22, &v23);
          }
          else
          {
            v17 = _NUIGridArrangementCell::_NUIGridArrangementCell(*((_QWORD *)a3 + 1), v28, v30, *((uint64_t *)&v30 + 1), v29, *((uint64_t *)&v29 + 1), 0, (__int16)v15).n128_u64[0];
            v20 = (void *)(v19 + 112);
            *((_QWORD *)a3 + 1) = v19 + 112;
          }
          *((_QWORD *)a3 + 1) = v20;
          *(_QWORD *)&v30 = v30 + 1;
        }
      }
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v31, 16, *(double *)&v17, v22, v23);
    }
    while (v12);
    v21 = (unsigned __int16)v30 | ((_DWORD)v29 << 16);
  }
  else
  {
    v21 = 0;
  }
  self->_visibleCount = ($C125A01A7EEDA62CE9060793D5E4A593)v21;
}

- (id).cxx_construct
{
  _NUIGridArrangement::_NUIGridArrangement(&self->_arrangement);
  self->_customSpacings.__tree_.__pair3_.__value_ = 0;
  self->_customSpacings.__tree_.__pair1_.__value_.__left_ = 0;
  self->_customSpacings.__tree_.__begin_node_ = &self->_customSpacings.__tree_.__pair1_;
  return self;
}

- (_BYTE)_baselineViewVendForFirstBaseline:(_BYTE *)a1
{
  _BYTE *v2;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v2 = a1;
  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = (void *)objc_msgSend(a1, "visibleArrangedSubviews");
    v5 = v4;
    if ((v2[698] & 0xF) != 0)
    {
      if (a2)
      {
        v2 = (_BYTE *)objc_msgSend(v4, "firstObject");
        objc_msgSend(v2, "effectiveFirstBaselineOffsetFromTop");
      }
      else
      {
        v2 = (_BYTE *)objc_msgSend(v4, "lastObject");
        objc_msgSend(v2, "effectiveBaselineOffsetFromBottom");
      }
      if (v6 <= 0.0)
        return 0;
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (!v7)
        return 0;
      v8 = v7;
      v2 = 0;
      v9 = *(_QWORD *)v16;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (a2)
            objc_msgSend(v12, "effectiveFirstBaselineOffsetFromTop");
          else
            objc_msgSend(v12, "effectiveBaselineOffsetFromBottom");
          if (v13 > v10)
          {
            v2 = v12;
            v10 = v13;
          }
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }
  }
  return v2;
}

- (id)calculateViewForLastBaselineLayout
{
  id result;

  result = -[NUIContainerStackView _baselineViewVendForFirstBaseline:](self, 0);
  if (!result)
    return self;
  return result;
}

- (void)setAlignment:(int64_t)a3
{
  int64_t v5;
  $16CB4399C9D3FC671DCB37404DE12009 stackViewFlags;

  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1)
    v5 = 0;
  else
    v5 = a3;
  stackViewFlags = self->_stackViewFlags;
  if (v5 != stackViewFlags)
  {
    self->_stackViewFlags = ($16CB4399C9D3FC671DCB37404DE12009)(*(_DWORD *)&stackViewFlags & 0xFFFFFF00 | v5);
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
  }
}

+ (id)containerStackViewWithAxis:(int64_t)a3 arrangedSubviews:(id)a4
{
  void *v5;
  _QWORD v7[6];

  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithArrangedSubviews:", a4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__NUIContainerStackView_containerStackViewWithAxis_arrangedSubviews___block_invoke;
  v7[3] = &unk_1E57C6BF0;
  v7[4] = v5;
  v7[5] = a3;
  objc_msgSend(v5, "performBatchUpdates:", v7);
  return v5;
}

- (NUIContainerStackView)initWithArrangedSubviews:(id)a3
{
  NUIContainerStackView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUIContainerStackView;
  result = -[NUIContainerView initWithArrangedSubviews:](&v4, sel_initWithArrangedSubviews_, a3);
  if (result)
    result->_arrangement.container = (_NUIGridArrangementContainer *)result;
  return result;
}

- (NUIContainerStackView)initWithFrame:(CGRect)a3
{
  NUIContainerStackView *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NUIContainerStackView;
  result = -[NUIContainerView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_arrangement.container = (_NUIGridArrangementContainer *)result;
  return result;
}

- (void)setAxis:(int64_t)a3
{
  $16CB4399C9D3FC671DCB37404DE12009 stackViewFlags;

  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  stackViewFlags = self->_stackViewFlags;
  if ((uint64_t)(int)(*(_DWORD *)&stackViewFlags << 12) >> 28 != a3)
  {
    self->_stackViewFlags = ($16CB4399C9D3FC671DCB37404DE12009)(*(_DWORD *)&stackViewFlags & 0xFFF0FFFF | ((a3 & 0xF) << 16));
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 4);
  }
}

- (_DWORD)_effectiveAlignmentForArrangedSubview:(_DWORD *)result
{
  _DWORD *v2;

  if (result)
  {
    v2 = result;
    result = (_DWORD *)objc_msgSend(result, "alignmentForView:inAxis:", a2, (result[174] & 0xF0000) == 0);
    if (result == (_DWORD *)-1)
      return (_DWORD *)*((char *)v2 + 696);
  }
  return result;
}

uint64_t __69__NUIContainerStackView_containerStackViewWithAxis_arrangedSubviews___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBaselineRelativeArrangement:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setSpacing:", -1.79769313e308);
  objc_msgSend(*(id *)(a1 + 32), "setAxis:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setAlignment:", 2 * (*(_QWORD *)(a1 + 40) == 0));
}

- (void)setSpacing:(double)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (self->_spacing != a3)
  {
    self->_spacing = a3;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2);
  }
}

- (void)setBaselineRelativeArrangement:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NUIContainerStackView;
  -[NUIContainerView setBaselineRelativeArrangement:](&v5, sel_setBaselineRelativeArrangement_);
  self->_arrangement.baselineRelative = a3;
}

- (void)setDistribution:(int64_t)a3
{
  int64_t v5;
  $16CB4399C9D3FC671DCB37404DE12009 stackViewFlags;
  int v7;
  uint64_t v9;
  __int16 v10;
  __int16 v11;

  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1)
    v5 = 0;
  else
    v5 = a3;
  stackViewFlags = self->_stackViewFlags;
  v7 = *(_WORD *)&stackViewFlags >> 8;
  if (v5 != v7)
  {
    if (v7 == 1 || v5 == 1)
      v9 = 3;
    else
      v9 = 1;
    v10 = (_WORD)v5 << 8;
    self->_stackViewFlags = ($16CB4399C9D3FC671DCB37404DE12009)(*(_DWORD *)&stackViewFlags & 0xFFFF00FF | (v5 << 8));
    LOWORD(v5) = v5;
    if ((*(_DWORD *)&stackViewFlags & 0xF0000) != 0)
      v11 = 255;
    else
      v11 = -256;
    if ((*(_DWORD *)&stackViewFlags & 0xF0000) != 0)
      LOWORD(v5) = v10;
    *((_WORD *)&self->_arrangement + 4) = *((_WORD *)&self->_arrangement + 4) & v11 | v5;
    -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", v9);
  }
}

- (int64_t)axis
{
  return (uint64_t)(int)(*(_DWORD *)&self->_stackViewFlags << 12) >> 28;
}

- (void)dealloc
{
  objc_super v3;

  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, -1);
  v3.receiver = self;
  v3.super_class = (Class)NUIContainerStackView;
  -[NUIContainerView dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  _NUIGridArrangement *p_arrangement;
  CGRect *begin;
  _NUIGridArrangementDimension *v5;
  _NUIGridArrangementDimension *v6;
  _NUIGridArrangementCell *v7;

  std::__tree<UIView *>::destroy((uint64_t)&self->_customSpacings, (_QWORD *)self->_customSpacings.__tree_.__pair1_.__value_.__left_);
  p_arrangement = &self->_arrangement;
  begin = p_arrangement->viewFrames.__begin_;
  if (begin)
  {
    p_arrangement->viewFrames.__end_ = begin;
    operator delete(begin);
  }
  v5 = p_arrangement->rows.__begin_;
  if (v5)
  {
    p_arrangement->rows.__end_ = v5;
    operator delete(v5);
  }
  v6 = p_arrangement->columns.__begin_;
  if (v6)
  {
    p_arrangement->columns.__end_ = v6;
    operator delete(v6);
  }
  v7 = p_arrangement->cells.__begin_;
  if (v7)
  {
    p_arrangement->cells.__end_ = v7;
    operator delete(v7);
  }
}

+ (id)verticalContainerStackViewWithArrangedSubviews:(id)a3
{
  return (id)objc_msgSend(a1, "containerStackViewWithAxis:arrangedSubviews:", 1, a3);
}

- (void)didRemoveArrangedSubview:(id)a3 atIndex:(int64_t)a4
{
  objc_super v7;
  id v8;

  v8 = a3;
  std::__tree<UIView *>::__erase_unique<UIView *>((uint64_t)&self->_customSpacings, (unint64_t *)&v8);
  v7.receiver = self;
  v7.super_class = (Class)NUIContainerStackView;
  -[NUIContainerView didRemoveArrangedSubview:atIndex:](&v7, sel_didRemoveArrangedSubview_atIndex_, a3, a4);
}

+ (id)horizontalContainerStackViewWithArrangedSubviews:(id)a3
{
  return (id)objc_msgSend(a1, "containerStackViewWithAxis:arrangedSubviews:", 0, a3);
}

- (BOOL)needsBaselineDebugBoundingBoxesForArrangedSubview:(id)a3
{
  BOOL result;
  $16CB4399C9D3FC671DCB37404DE12009 stackViewFlags;
  _DWORD *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUIContainerStackView;
  if (-[NUIContainerView needsBaselineDebugBoundingBoxesForArrangedSubview:](&v8, sel_needsBaselineDebugBoundingBoxesForArrangedSubview_))
  {
    return 1;
  }
  stackViewFlags = self->_stackViewFlags;
  if ((*(_DWORD *)&stackViewFlags & 0xF0000) != 0)
    return (*(_DWORD *)&stackViewFlags & 0xF0000) == 0x10000
        && -[NUIContainerView isBaselineRelativeArrangement](self, "isBaselineRelativeArrangement");
  v7 = -[NUIContainerStackView _effectiveAlignmentForArrangedSubview:](self, (uint64_t)a3);
  result = 1;
  if (v7 != (_DWORD *)2 && v7 != (_DWORD *)5)
  {
    stackViewFlags = self->_stackViewFlags;
    return (*(_DWORD *)&stackViewFlags & 0xF0000) == 0x10000
        && -[NUIContainerView isBaselineRelativeArrangement](self, "isBaselineRelativeArrangement");
  }
  return result;
}

- (id)calculateViewForFirstBaselineLayout
{
  id result;

  result = -[NUIContainerStackView _baselineViewVendForFirstBaseline:](self, 1);
  if (!result)
    return self;
  return result;
}

- (int64_t)distribution
{
  return (uint64_t)(int)(*(_DWORD *)&self->_stackViewFlags << 16) >> 24;
}

- (int64_t)alignment
{
  return (int64_t)self->_stackViewFlags;
}

- (double)customSpacingAfterView:(id)a3
{
  char *left;
  NUIContainerStackView *p_pair1;
  unint64_t v5;
  BOOL v6;
  char **v7;
  double *v8;
  unint64_t cachedTraitCollection;
  double *p_animationInfo;

  left = (char *)self->_customSpacings.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = (NUIContainerStackView *)&self->_customSpacings.__tree_.__pair1_;
    do
    {
      v5 = *((_QWORD *)left + 4);
      v6 = v5 >= (unint64_t)a3;
      if (v5 >= (unint64_t)a3)
        v7 = (char **)left;
      else
        v7 = (char **)(left + 8);
      if (v6)
        p_pair1 = (NUIContainerStackView *)left;
      left = *v7;
    }
    while (*v7);
    v8 = (double *)&NUIContainerViewLengthUseDefault;
    if (p_pair1 != (NUIContainerStackView *)&self->_customSpacings.__tree_.__pair1_)
    {
      cachedTraitCollection = (unint64_t)p_pair1->super.super._cachedTraitCollection;
      p_animationInfo = (double *)&p_pair1->super.super._animationInfo;
      if (cachedTraitCollection <= (unint64_t)a3)
        v8 = p_animationInfo;
    }
  }
  else
  {
    v8 = (double *)&NUIContainerViewLengthUseDefault;
  }
  return *v8;
}

- (void)setCustomSpacing:(double)a3 afterView:(id)a4
{
  BOOL IsDefault;
  uint64_t **p_customSpacings;
  id v8;
  id *v9;

  v8 = a4;
  IsDefault = NUIContainerViewLengthIsDefault(a3);
  p_customSpacings = (uint64_t **)&self->_customSpacings;
  if (IsDefault)
  {
    std::__tree<UIView *>::__erase_unique<UIView *>((uint64_t)p_customSpacings, (unint64_t *)&v8);
  }
  else
  {
    v9 = &v8;
    *((double *)std::__tree<std::__value_type<UIView *,double>,std::__map_value_compare<UIView *,std::__value_type<UIView *,double>,std::less<UIView *>,true>,std::allocator<std::__value_type<UIView *,double>>>::__emplace_unique_key_args<UIView *,std::piecewise_construct_t const&,std::tuple<UIView * const&>,std::tuple<>>(p_customSpacings, (unint64_t *)&v8, (uint64_t)&std::piecewise_construct, (uint64_t **)&v9)+ 5) = a3;
  }
  -[NUIContainerView setNeedsInvalidation:](self, "setNeedsInvalidation:", 2);
}

- (void)setSpacing:(double)a3 afterArrangedSubviewAtIndex:(int64_t)a4
{
  -[NUIContainerStackView setCustomSpacing:afterView:](self, "setCustomSpacing:afterView:", -[NSArray objectAtIndex:](-[NUIContainerView arrangedSubviews](self, "arrangedSubviews"), "objectAtIndex:", a4), a3);
}

- (id)arrangedDebugDescription
{
  $16CB4399C9D3FC671DCB37404DE12009 stackViewFlags;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  NSArray *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  stackViewFlags = self->_stackViewFlags;
  v4 = (void *)MEMORY[0x1E0CB37A0];
  if ((*(_DWORD *)&stackViewFlags & 0xF0000) != 0)
    v5 = CFSTR("Vert");
  else
    v5 = CFSTR("Horz");
  v6 = (uint64_t)(int)(*(_DWORD *)&stackViewFlags << 16) >> 24;
  if (NUIStringFromDistribution(NUIContainerDistribution)::onceToken != -1)
    dispatch_once(&NUIStringFromDistribution(NUIContainerDistribution)::onceToken, &__block_literal_global_154);
  v7 = objc_msgSend((id)NUIStringFromDistribution(NUIContainerDistribution)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6));
  if (!v7)
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), v6);
  v21.receiver = self;
  v21.super_class = (Class)NUIContainerStackView;
  v8 = (void *)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ axis = %@: distribution = %@; alignments = "),
                 v5,
                 v7,
                 -[NUIContainerView arrangedDebugDescription](&v21, sel_arrangedDebugDescription));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = -[NUIContainerView visibleArrangedSubviews](self, "visibleArrangedSubviews");
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(obj);
        v13 = -[NUIContainerStackView _effectiveAlignmentForArrangedSubview:](self, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12));
        if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1)
          dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_189);
        v14 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13));
        if (!v14)
          v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), v13);
        objc_msgSend(v8, "appendFormat:", CFSTR("[%@]"), v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v10);
  }
  return (id)objc_msgSend(v8, "stringByAppendingString:", CFSTR(";"));
}

- (id)debugDictionary
{
  void *v3;
  const __CFString *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NUIContainerStackView;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[NUIContainerView debugDictionary](&v11, sel_debugDictionary));
  if (-[NUIContainerStackView axis](self, "axis"))
    v4 = CFSTR("vertical");
  else
    v4 = CFSTR("horizontal");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("axis"));
  v5 = -[NUIContainerStackView alignment](self, "alignment");
  if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1)
    dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_189);
  v6 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5));
  if (!v6)
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), v5);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("alignment"));
  v7 = -[NUIContainerStackView distribution](self, "distribution");
  if (NUIStringFromDistribution(NUIContainerDistribution)::onceToken != -1)
    dispatch_once(&NUIStringFromDistribution(NUIContainerDistribution)::onceToken, &__block_literal_global_154);
  v8 = objc_msgSend((id)NUIStringFromDistribution(NUIContainerDistribution)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7));
  if (!v8)
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), v7);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("distribution"));
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[NUIContainerStackView spacing](self, "spacing");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v9, "numberWithDouble:"), CFSTR("spacing"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", _NUIGridArrangement::debugDictionary(&self->_arrangement), CFSTR("arrangement"));
  return (id)objc_msgSend(v3, "copy");
}

- (double)spacing
{
  return self->_spacing;
}

@end
