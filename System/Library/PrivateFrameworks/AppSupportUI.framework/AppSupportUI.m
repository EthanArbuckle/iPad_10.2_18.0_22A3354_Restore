void _NUIGridArrangement::positionSubsetCells(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8, double a9, double a10)
{
  BOOL v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t (*__ptr32 *v23)();
  int v28;
  double *v29;
  double v30;
  double v31;
  double *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  int v38;
  NSObject *v39;
  NSObject *v40;
  double *v41;
  double v42;
  double v43;
  double *v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  double v48;
  double *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[2];
  uint64_t (*v53)(uint64_t, uint64_t, uint64_t);
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  _QWORD v62[2];
  void (*v63)(uint64_t, double *, uint64_t);
  void *v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;

  if (*(_BYTE *)(a1 + 11))
  {
    v17 = a2 == 0x7FFFFFFFFFFFFFFFLL || a4 == 0x7FFFFFFFFFFFFFFFLL;
    v18 = a1 + 88;
    v20 = *(_QWORD *)(a1 + 16);
    v19 = *(double **)(a1 + 24);
    v21 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v19 - v20) >> 4);
    v22 = MEMORY[0x1E0C809B0];
    v23 = &off_1AA837000;
    if (v21 != (uint64_t)(*(_QWORD *)(a1 + 96) - *(_QWORD *)(a1 + 88)) >> 5)
    {
      std::vector<CGRect>::resize(v18, v21);
      v28 = *(__int16 *)(a1 + 8);
      if ((__int16)(*(_WORD *)(a1 + 8) << 8) < 1537)
      {
        v37 = *MEMORY[0x1E0C9D820];
      }
      else
      {
        v29 = *(double **)(a1 + 40);
        v30 = 0.0;
        v31 = 0.0;
        if (*(double **)(a1 + 48) != v29)
        {
          v32 = v29 + 1;
          v33 = (*(_QWORD *)(a1 + 48) - (_QWORD)v29) / 56;
          do
          {
            v34 = *v32;
            v32 += 7;
            v31 = v31 + v34;
            --v33;
          }
          while (v33);
        }
        v35 = (*(_QWORD *)(a1 + 48) - (_QWORD)v29) / 56 - 1;
        if ((*(_QWORD *)(a1 + 48) - (_QWORD)v29) / 56 != 1)
        {
          v30 = 0.0;
          do
          {
            v36 = *v29;
            v29 += 7;
            v30 = v30 + v36;
            --v35;
          }
          while (v35);
        }
        v37 = a9 - (v31 + v30);
        if (*(_WORD *)(a1 + 8) == 7)
          v37 = v37 * 0.5;
      }
      if (v28 < 1792)
      {
        v48 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      }
      else
      {
        v41 = *(double **)(a1 + 64);
        v42 = 0.0;
        v43 = 0.0;
        if (*(double **)(a1 + 72) != v41)
        {
          v44 = v41 + 1;
          v45 = (*(_QWORD *)(a1 + 72) - (_QWORD)v41) / 56;
          do
          {
            v46 = *v44;
            v44 += 7;
            v43 = v43 + v46;
            --v45;
          }
          while (v45);
        }
        v47 = (*(_QWORD *)(a1 + 72) - (_QWORD)v41) / 56 - 1;
        if ((*(_QWORD *)(a1 + 72) - (_QWORD)v41) / 56 != 1)
        {
          v42 = 0.0;
          do
          {
            v42 = v42 + *v41;
            if (*(_BYTE *)(a1 + 10))
              v42 = v42 - v41[11] - v41[5];
            v41 += 7;
            --v47;
          }
          while (v47);
        }
        v48 = a10 - (v43 + v42);
        if ((v28 & 0xFFFFFF00) == 0x700)
          v48 = v48 * 0.5;
      }
      v23 = &off_1AA837000;
      v62[0] = v22;
      v62[1] = 3221225472;
      v63 = ___ZN19_NUIGridArrangement19positionSubsetCellsE8_NSRangeS0_6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS1_E_block_invoke;
      v64 = &__block_descriptor_88_e108_v24__0___NUIGridArrangementCell_____ff____ff__CGSize_dd__CGSize_dd___NSRange_QQ___NSRange_QQ____dd_b8b8_8Q16l;
      v65 = a1;
      v66 = a7;
      v67 = a8;
      v68 = a9;
      v69 = a10;
      v70 = v37;
      v71 = v48;
      v19 = *(double **)(a1 + 16);
      v49 = *(double **)(a1 + 24);
      if (v19 == v49)
      {
        v20 = *(_QWORD *)(a1 + 16);
        v22 = MEMORY[0x1E0C809B0];
      }
      else
      {
        v50 = 0;
        do
        {
          v63((uint64_t)v62, v19, v50++);
          v19 += 14;
        }
        while (v19 != v49);
        v20 = *(_QWORD *)(a1 + 16);
        v19 = *(double **)(a1 + 24);
        v22 = MEMORY[0x1E0C809B0];
        v23 = &off_1AA837000;
      }
    }
    v52[0] = v22;
    v52[1] = *((_QWORD *)v23 + 225);
    v53 = ___ZN19_NUIGridArrangement19positionSubsetCellsE8_NSRangeS0_6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS1_E_block_invoke_2;
    v54 = &unk_1E57C6938;
    v61 = v17;
    v57 = a2;
    v58 = a3;
    v59 = a4;
    v60 = a5;
    v55 = a6;
    v56 = a1;
    if ((double *)v20 != v19)
    {
      v51 = 0;
      do
      {
        v53((uint64_t)v52, v20, v51++);
        v20 += 112;
      }
      while ((double *)v20 != v19);
    }
  }
  else
  {
    v38 = _NUIIsDebuggerAttached();
    v39 = _NUILog();
    v40 = v39;
    if (v38)
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        _NUIGridArrangement::positionSubsetCells((uint64_t *)a1, v40);
    }
    else if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      _NUIGridArrangement::positionSubsetCells((uint64_t *)a1, v40);
    }
  }
}

uint64_t ___ZN19_NUIGridArrangement19positionSubsetCellsE8_NSRangeS0_6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS1_E_block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;

  if (*(_BYTE *)(result + 80))
    goto LABEL_13;
  v4 = *(_QWORD *)(a2 + 56);
  v5 = *(_QWORD *)(result + 48);
  v7 = v4 >= v5;
  v6 = v4 - v5;
  v7 = !v7 || v6 >= *(_QWORD *)(result + 56);
  if (!v7
    || ((v8 = *(_QWORD *)(a2 + 72), v9 = *(_QWORD *)(result + 64), v7 = v8 >= v9, v10 = v8 - v9, v7)
      ? (v11 = v10 >= *(_QWORD *)(result + 72))
      : (v11 = 1),
        !v11))
  {
LABEL_13:
    v3 = *(_QWORD *)(result + 40);
    return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(result + 32) + 16))(*(double *)(*(_QWORD *)(v3 + 88) + 32 * a3), *(double *)(*(_QWORD *)(v3 + 88) + 32 * a3 + 8), *(double *)(*(_QWORD *)(v3 + 88) + 32 * a3 + 16), *(double *)(*(_QWORD *)(v3 + 88) + 32 * a3 + 24));
  }
  return result;
}

void ___ZN19_NUIGridArrangement19positionSubsetCellsE8_NSRangeS0_6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS1_E_block_invoke(uint64_t a1, double *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double *v10;
  uint64_t v11;
  double v12;
  double *v13;
  double v14;
  double MinX;
  uint64_t v16;
  double v17;
  double v18;
  double *v19;
  uint64_t v20;
  double v21;
  double *v22;
  double v23;
  double MinY;
  unint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  double *v33;
  double v34;
  uint64_t v35;
  unint64_t v36;
  double v37;
  double v38;
  double *v39;
  uint64_t v40;
  double v41;
  double v42;
  double *v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  unsigned int v49;
  int v51;
  uint64_t v52;
  id v53;
  double v54;
  double v55;
  double v56;
  double Width;
  double Height;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  char v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  double MaxX;
  CGFloat v71;
  double v72;
  double v73;
  double MidY;
  double v75;
  double MaxY;
  double v77;
  double MidX;
  double v79;
  double v80;
  double v81;
  CGFloat rect;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *((_QWORD *)a2 + 7);
  v8 = 0.0;
  v9 = 0.0;
  if (v7 >= 1)
  {
    v10 = (double *)(*(_QWORD *)(v6 + 40) + 8);
    v11 = *((_QWORD *)a2 + 7);
    do
    {
      v12 = *v10;
      v10 += 7;
      v9 = v9 + v12;
      --v11;
    }
    while (v11);
  }
  if (v7)
  {
    v13 = *(double **)(v6 + 40);
    v8 = 0.0;
    do
    {
      v14 = *v13;
      v13 += 7;
      v8 = v8 + v14;
      --v7;
    }
    while (v7);
  }
  MinX = CGRectGetMinX(*(CGRect *)(a1 + 40));
  v16 = *((_QWORD *)a2 + 9);
  v17 = 0.0;
  v18 = 0.0;
  if (v16 >= 1)
  {
    v19 = (double *)(*(_QWORD *)(v6 + 64) + 8);
    v20 = *((_QWORD *)a2 + 9);
    do
    {
      v21 = *v19;
      v19 += 7;
      v18 = v18 + v21;
      --v20;
    }
    while (v20);
  }
  if (v16)
  {
    v22 = *(double **)(v6 + 64);
    v17 = 0.0;
    do
    {
      v17 = v17 + *v22;
      if (*(_BYTE *)(v6 + 10))
        v17 = v17 - v22[11] - v22[5];
      v22 += 7;
      --v16;
    }
    while (v16);
  }
  v23 = *(double *)(a1 + 72);
  MinY = CGRectGetMinY(*(CGRect *)(a1 + 40));
  v25 = *((_QWORD *)a2 + 7);
  v26 = *((_QWORD *)a2 + 8);
  v27 = 0.0;
  v28 = 0.0;
  if (v25 < v26 + v25)
  {
    v29 = (double *)(*(_QWORD *)(v6 + 40) + 56 * v25 + 8);
    v30 = *((_QWORD *)a2 + 8);
    do
    {
      v31 = *v29;
      v29 += 7;
      v28 = v28 + v31;
      --v30;
    }
    while (v30);
  }
  if (v25 < v26 + v25 - 1)
  {
    v32 = v26 - 1;
    v33 = (double *)(*(_QWORD *)(v6 + 40) + 56 * v25);
    v27 = 0.0;
    do
    {
      v34 = *v33;
      v33 += 7;
      v27 = v27 + v34;
      --v32;
    }
    while (v32);
  }
  v36 = *((_QWORD *)a2 + 9);
  v35 = *((_QWORD *)a2 + 10);
  v37 = 0.0;
  v38 = 0.0;
  if (v36 < v35 + v36)
  {
    v39 = (double *)(*(_QWORD *)(v6 + 64) + 56 * v36 + 8);
    v40 = *((_QWORD *)a2 + 10);
    do
    {
      v41 = *v39;
      v39 += 7;
      v38 = v38 + v41;
      --v40;
    }
    while (v40);
  }
  v42 = v18 + v17 + MinY;
  if (v36 < v35 + v36 - 1)
  {
    v43 = (double *)(*(_QWORD *)(v6 + 64) + 56 * v36);
    v44 = v35 - 1;
    v37 = 0.0;
    do
    {
      v37 = v37 + *v43;
      if (*(_BYTE *)(v6 + 10))
        v37 = v37 - v43[11] - v43[5];
      v43 += 7;
      --v44;
    }
    while (v44);
  }
  v45 = v9 + v8 + MinX + v23;
  v46 = v42 + *(double *)(a1 + 80);
  v47 = v28 + v27;
  v48 = v38 + v37;
  v49 = *((unsigned __int16 *)a2 + 52);
  if (v49 <= 0xFF && (unsigned __int16)((_WORD)v49 << 8) == 0)
  {
    v56 = v45;
    Width = v28 + v27;
    Height = v38 + v37;
    goto LABEL_39;
  }
  v51 = (__int16)v49;
  v52 = (uint64_t)(__int16)((_WORD)v49 << 8) >> 8;
  v53 = *(id *)v6;
  v54 = a2[5];
  if (vabdd_f64(v54, *MEMORY[0x1E0C9D820]) >= 0.001
    || vabdd_f64(a2[6], *(double *)(MEMORY[0x1E0C9D820] + 8)) >= 0.001)
  {
    if (vabdd_f64(v54, v47) < 0.001)
    {
      if (vabdd_f64(a2[6], v48) < 0.001)
      {
        v55 = a2[4];
        goto LABEL_46;
      }
LABEL_44:
      v55 = a2[4];
      if (v48 - v55 >= -0.001)
        goto LABEL_46;
      goto LABEL_45;
    }
    v64 = v47 - a2[3];
    v65 = objc_msgSend(*(id *)a2, "isLayoutSizeDependentOnPerpendicularAxis");
    if (v64 < -0.001)
      v66 = 1;
    else
      v66 = v65;
    if ((v66 & 1) == 0)
      goto LABEL_44;
  }
LABEL_45:
  objc_msgSend(v53, "contentLayoutSizeFittingSize:forArrangedSubview:", *(_QWORD *)a2, v47, v48);
  *((_QWORD *)a2 + 3) = v67;
  a2[4] = v55;
  a2[5] = v47;
  a2[6] = v48;
LABEL_46:
  v68 = *(_QWORD *)(v6 + 64) + 56 * *((_QWORD *)a2 + 9);
  v69 = *(double *)(v68 + 40);
  v79 = *(double *)(v68 + 32);
  v80 = a2[11];
  v81 = a2[12];
  v56 = *MEMORY[0x1E0C9D648];
  rect = *(double *)(MEMORY[0x1E0C9D648] + 8);
  if (a2[3] >= v47)
    Width = v47;
  else
    Width = a2[3];
  if (v55 >= v48)
    Height = v48;
  else
    Height = v55;
  switch(v52)
  {
    case 0:
      v86.origin.x = v45;
      v86.origin.y = v46;
      v86.size.width = v47;
      v86.size.height = v48;
      v56 = CGRectGetMinX(v86);
      v87.origin.x = v45;
      v87.origin.y = v46;
      v87.size.width = v47;
      v87.size.height = v48;
      Width = CGRectGetWidth(v87);
      break;
    case 1:
    case 2:
      v83.origin.x = v45;
      v83.origin.y = v46;
      v83.size.width = v47;
      v83.size.height = v48;
      v56 = CGRectGetMinX(v83);
      break;
    case 3:
      v88.origin.x = v45;
      v88.origin.y = v46;
      v88.size.width = v47;
      v88.size.height = v48;
      MidX = CGRectGetMidX(v88);
      v89.origin.x = v56;
      v89.origin.y = rect;
      v89.size.width = Width;
      v89.size.height = Height;
      v56 = MidX + CGRectGetWidth(v89) * -0.5;
      break;
    case 4:
    case 5:
      v84.origin.x = v45;
      v84.origin.y = v46;
      v84.size.width = v47;
      v84.size.height = v48;
      v77 = *(double *)(v68 + 40);
      MaxX = CGRectGetMaxX(v84);
      v85.origin.x = v56;
      v85.origin.y = rect;
      v85.size.width = Width;
      v85.size.height = Height;
      v56 = MaxX - CGRectGetWidth(v85);
      v69 = v77;
      break;
    default:
      break;
  }
  switch((uint64_t)v51 >> 8)
  {
    case 0:
      v90.origin.x = v45;
      v90.origin.y = v46;
      v90.size.width = v47;
      v90.size.height = v48;
      v71 = CGRectGetMinY(v90);
      v91.origin.x = v45;
      v91.origin.y = v46;
      v91.size.width = v47;
      v91.size.height = v48;
      Height = CGRectGetHeight(v91);
      v46 = v71;
      break;
    case 1:
      goto LABEL_62;
    case 2:
      if (v80 != 2.22507386e-308)
      {
        v92.origin.x = v45;
        v92.origin.y = v46;
        v92.size.width = v47;
        v92.size.height = v48;
        v72 = v79 + CGRectGetMinY(v92);
        v73 = v80;
        goto LABEL_66;
      }
LABEL_62:
      v93.origin.x = v45;
      v93.origin.y = v46;
      v93.size.width = v47;
      v93.size.height = v48;
      v46 = CGRectGetMinY(v93);
      break;
    case 3:
      v94.origin.x = v45;
      v94.origin.y = v46;
      v94.size.width = v47;
      v94.size.height = v48;
      MidY = CGRectGetMidY(v94);
      v95.origin.x = v56;
      v95.origin.y = rect;
      v95.size.width = Width;
      v95.size.height = Height;
      v46 = MidY + CGRectGetHeight(v95) * -0.5;
      break;
    case 4:
      goto LABEL_67;
    case 5:
      if (v81 == 2.22507386e-308)
      {
LABEL_67:
        v98.origin.x = v45;
        v98.origin.y = v46;
        v98.size.width = v47;
        v98.size.height = v48;
        MaxY = CGRectGetMaxY(v98);
        v99.origin.x = v56;
        v99.origin.y = rect;
        v99.size.width = Width;
        v99.size.height = Height;
        v46 = MaxY - CGRectGetHeight(v99);
      }
      else
      {
        v96.origin.x = v45;
        v96.origin.y = v46;
        v96.size.width = v47;
        v96.size.height = v48;
        v75 = CGRectGetMaxY(v96);
        v97.origin.x = v56;
        v97.origin.y = rect;
        v97.size.width = Width;
        v97.size.height = Height;
        v72 = v75 - CGRectGetHeight(v97);
        v73 = v69 - v81;
LABEL_66:
        v46 = v72 - v73;
      }
      break;
    default:
      v46 = rect;
      break;
  }
LABEL_39:
  objc_msgSend(*(id *)v6, "layoutFrameForArrangedSubview:withProposedContentFrame:", *(_QWORD *)a2, v56, v46, Width, Height);
  v59 = (_QWORD *)(*(_QWORD *)(v6 + 88) + 32 * a3);
  *v59 = v60;
  v59[1] = v61;
  v59[2] = v62;
  v59[3] = v63;
}

double NUIRectRoundToScale(CGRect a1, double a2)
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinX;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  height = a1.size.height;
  width = a1.size.width;
  y = a1.origin.y;
  x = a1.origin.x;
  MinX = CGRectGetMinX(a1);
  if (a2 == 1.0)
  {
    v8 = ceil(MinX);
    v9 = v8 - MinX;
    v10 = floor(MinX);
    if (v9 >= 0.001)
      v11 = v10;
    else
      v11 = v8;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    CGRectGetMinY(v18);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    CGRectGetWidth(v19);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    CGRectGetHeight(v20);
  }
  else
  {
    v12 = MinX * a2;
    v13 = ceil(v12);
    v14 = v13 - v12;
    v15 = floor(v12);
    if (v14 < 0.001)
      v15 = v13;
    v17 = v15 / a2;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    CGRectGetMinY(v21);
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    CGRectGetWidth(v22);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    CGRectGetHeight(v23);
    return v17;
  }
  return v11;
}

void std::vector<CGRect>::__append(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 5)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 32 * a2);
      v7 += 32 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 5);
    if (v9 >> 59)
      abort();
    v10 = v8 >> 5;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 4 > v9)
      v9 = v11 >> 4;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0)
      v12 = 0x7FFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<CGSize,CGSize>>>(v4, v12);
    else
      v13 = 0;
    v14 = &v13[32 * v10];
    v15 = &v13[32 * v12];
    bzero(v14, 32 * a2);
    v16 = &v14[32 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        v19 = *((_OWORD *)v17 - 1);
        *((_OWORD *)v14 - 2) = *((_OWORD *)v17 - 2);
        *((_OWORD *)v14 - 1) = v19;
        v14 -= 32;
        v17 -= 32;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
      operator delete(v17);
  }
}

void std::vector<CGRect>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 5;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 32 * a2;
  }
  else
  {
    std::vector<CGRect>::__append((void **)a1, a2 - v2);
  }
}

void _NUIGridArrangement::positionCells(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  _NUIGridArrangement::positionSubsetCells(a1, 0x7FFFFFFFFFFFFFFFLL, 0, 0x7FFFFFFFFFFFFFFFLL, 0, a2, a3, a4, a5, a6);
}

_NUIGridArrangement *_NUIGridArrangement::resetForInvalidation(_NUIGridArrangement *this, char a2)
{
  _NUIGridArrangementCell *begin;
  _NUIGridArrangementCell *end;
  _OWORD *v4;

  if ((a2 & 4) != 0)
  {
    this->cells.__end_ = this->cells.__begin_;
  }
  else
  {
    begin = this->cells.__begin_;
    end = this->cells.__end_;
    if (begin != end)
    {
      v4 = (_OWORD *)MEMORY[0x1E0C9D820];
      do
      {
        *(_OWORD *)((char *)begin + 24) = *v4;
        *(_OWORD *)((char *)begin + 40) = *v4;
        *((_QWORD *)begin + 11) = 0;
        *((_QWORD *)begin + 12) = 0;
        begin = (_NUIGridArrangementCell *)((char *)begin + 112);
      }
      while (begin != end);
    }
  }
  this->hasValidMeasurement = 0;
  this->columns.__end_ = this->columns.__begin_;
  this->rows.__end_ = this->rows.__begin_;
  this->viewFrames.__end_ = this->viewFrames.__begin_;
  return this;
}

_NUIViewContainerViewInfo *_NUIContainerViewInfoCreateIfNeeded(objc_object *a1, int a2)
{
  _NUIViewContainerViewInfo *AssociatedObject;
  _NUIViewContainerViewInfo *v5;

  AssociatedObject = (_NUIViewContainerViewInfo *)objc_getAssociatedObject(a1, "containerViewInfoKey");
  if (!AssociatedObject
    || (v5 = AssociatedObject, a2)
    && AssociatedObject == (_NUIViewContainerViewInfo *)_NUIContainerViewInfoCreateIfNeeded(objc_object *,BOOL)::defaultInfo)
  {
    if (a2)
    {
      v5 = objc_alloc_init(_NUIViewContainerViewInfo);
      objc_setAssociatedObject(a1, "containerViewInfoKey", v5, (void *)1);

    }
    else
    {
      if (_NUIContainerViewInfoCreateIfNeeded(objc_object *,BOOL)::onceToken != -1)
        dispatch_once(&_NUIContainerViewInfoCreateIfNeeded(objc_object *,BOOL)::onceToken, &__block_literal_global);
      return (_NUIViewContainerViewInfo *)_NUIContainerViewInfoCreateIfNeeded(objc_object *,BOOL)::defaultInfo;
    }
  }
  return v5;
}

uint64_t _NUIIsDebuggerAttached()
{
  if (_NUIIsDebuggerAttached::onceToken != -1)
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  return _NUIIsDebuggerAttached::isDebugged;
}

uint64_t **std::__tree<std::__value_type<UIView *,_NUIContainerViewArrangedSubview>,std::__map_value_compare<UIView *,std::__value_type<UIView *,_NUIContainerViewArrangedSubview>,std::less<UIView *>,true>,std::allocator<std::__value_type<UIView *,_NUIContainerViewArrangedSubview>>>::__emplace_unique_key_args<UIView *,std::piecewise_construct_t const&,std::tuple<UIView * const&>,std::tuple<>>(uint64_t **a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unint64_t v8;
  uint64_t **v9;
  unint64_t v10;
  char *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = v6[4];
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = (char *)operator new(0x60uLL);
    *((_QWORD *)v11 + 4) = **a4;
    *(_OWORD *)(v11 + 40) = *MEMORY[0x1E0C9D538];
    *(_OWORD *)(v11 + 72) = unk_1AA8377D0;
    *(_OWORD *)(v11 + 56) = NUIContainerViewInsetsUseDefault;
    *((_WORD *)v11 + 44) = -1;
    std::__tree<UIView *>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t *std::__tree<UIView *>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

_NUIBoxArrangement *_NUIBoxArrangement::resetForInvalidation(_NUIBoxArrangement *this, char a2)
{
  _NUIBoxArrangementCell *end;
  _NUIBoxArrangementCell *begin;
  _OWORD *v4;

  if ((a2 & 5) != 0)
  {
    this->cells.__end_ = this->cells.__begin_;
  }
  else
  {
    begin = this->cells.__begin_;
    end = this->cells.__end_;
    if (begin != end)
    {
      v4 = (_OWORD *)MEMORY[0x1E0C9D820];
      do
      {
        *(_OWORD *)((char *)begin + 8) = *v4;
        *(_OWORD *)((char *)begin + 24) = *v4;
        *((_QWORD *)begin + 5) = 0;
        *((_QWORD *)begin + 6) = 0;
        begin = (_NUIBoxArrangementCell *)((char *)begin + 64);
      }
      while (begin != end);
    }
  }
  this->viewFrames.__end_ = this->viewFrames.__begin_;
  this->hasValidMeasurement = 0;
  return this;
}

void std::__tree<UIView *>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<UIView *>::destroy(a1, *a2);
    std::__tree<UIView *>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t _NUILog()
{
  if (_NUILog::onceToken != -1)
    dispatch_once(&_NUILog::onceToken, &__block_literal_global_1);
  return _NUILog::log;
}

void sub_1AA81C438(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(exception_object);
}

void _NUIGridArrangement::measureCells(_NUIGridArrangement *this, int a2, CGSize a3)
{
  double height;
  double width;
  uint64_t *p_cells;
  _NUIGridArrangementCell *end;
  _NUIGridArrangementCell *begin;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  _NUIGridArrangementDimension *v16;
  _NUIGridArrangementDimension *v17;
  vector<_NUIGridArrangementDimension, std::allocator<_NUIGridArrangementDimension>> *p_rows;
  uint64_t v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  _NUIGridArrangementCell *v23;
  _NUIGridArrangementCell *i;
  BOOL v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  unint64_t v32;
  _NUIGridArrangementDimension *v33;
  unint64_t v34;
  double *v35;
  double v36;
  double v37;
  __n128 v38;
  int v39;
  int v40;
  __n128 v41;
  int v42;
  _NUIGridArrangementDimension *v43;
  _NUIGridArrangementDimension *v44;
  double v45;
  _NUIGridArrangementDimension *v46;
  double v47;
  unint64_t v48;
  __n128 v49;
  __n128 v50;
  __int16 v51;
  _NUIGridArrangementDimension *v52;
  _NUIGridArrangementDimension *v53;
  double v54;
  _NUIGridArrangementDimension *v55;
  double v56;
  __n128 v57;
  int v58;

  height = a3.height;
  width = a3.width;
  p_cells = (uint64_t *)&this->cells;
  if (this->cells.__end_ == this->cells.__begin_)
  {
    -[_NUIGridArrangementContainer populateGridArrangementCells:](this->container, "populateGridArrangementCells:", p_cells);
    begin = this->cells.__begin_;
    end = this->cells.__end_;
    if (end == begin)
      return;
    do
    {
      objc_msgSend(*(id *)begin, "contentCompressionResistancePriorityForAxis:", 0);
      v11 = v10;
      objc_msgSend(*(id *)begin, "contentCompressionResistancePriorityForAxis:", 1);
      *((_DWORD *)begin + 2) = v11;
      *((_DWORD *)begin + 3) = v12;
      objc_msgSend(*(id *)begin, "contentHuggingPriorityForAxis:", 0);
      v14 = v13;
      objc_msgSend(*(id *)begin, "contentHuggingPriorityForAxis:", 1);
      *((_DWORD *)begin + 4) = v14;
      *((_DWORD *)begin + 5) = v15;
      begin = (_NUIGridArrangementCell *)((char *)begin + 112);
    }
    while (begin != end);
  }
  if (this->columns.__end_ == this->columns.__begin_)
    -[_NUIGridArrangementContainer populateGridArrangementDimension:withCells:axis:](this->container, "populateGridArrangementDimension:withCells:axis:", &this->columns, p_cells, 0);
  v16 = this->rows.__begin_;
  v17 = this->rows.__end_;
  p_rows = &this->rows;
  v58 = a2;
  if (v17 == v16)
  {
    -[_NUIGridArrangementContainer populateGridArrangementDimension:withCells:axis:](this->container, "populateGridArrangementDimension:withCells:axis:", &this->rows, p_cells, 1);
    v16 = this->rows.__begin_;
    v17 = this->rows.__end_;
  }
  v19 = (v17 - v16) >> 3;
  v20 = -1227133513 * v19;
  v21 = (unsigned __int16)(28087 * ((LODWORD(this->columns.__end_) - LODWORD(this->columns.__begin_)) >> 3));
  v22 = (unsigned __int16)(28087 * v19);
  v23 = this->cells.__begin_;
  for (i = this->cells.__end_; v23 != i; v23 = (_NUIGridArrangementCell *)((char *)v23 + 112))
  {
    v25 = !this->baselineRelative || *((_QWORD *)v23 + 9) == 0;
    if (!v25 || *((unsigned __int8 *)v23 + 105) << 8 == 512)
    {
      objc_msgSend(*(id *)v23, "effectiveFirstBaselineOffsetFromContentTop");
      *((double *)v23 + 11) = v26;
      if (v26 != 2.22507386e-308)
      {
        v27 = (uint64_t)p_rows->__begin_ + 56 * *((_QWORD *)v23 + 9);
        if (*(double *)(v27 + 32) > v26)
          v26 = *(double *)(v27 + 32);
        *(double *)(v27 + 32) = v26;
      }
    }
    if (this->baselineRelative && *((_QWORD *)v23 + 10) + *((_QWORD *)v23 + 9) < v22
      || *((unsigned __int8 *)v23 + 105) << 8 == 1280)
    {
      objc_msgSend(*(id *)v23, "effectiveBaselineOffsetFromContentBottom");
      *((double *)v23 + 12) = v28;
      if (v28 != 2.22507386e-308)
      {
        v29 = (uint64_t)p_rows->__begin_ + 56 * *((_QWORD *)v23 + 9) + 56 * *((_QWORD *)v23 + 10);
        if (*(double *)(v29 - 16) > v28)
          v28 = *(double *)(v29 - 16);
        *(double *)(v29 - 16) = v28;
      }
    }
  }
  v30 = 0.0;
  v31 = 0.0;
  v32 = v21 - 1;
  if (v21 != 1)
  {
    v33 = this->columns.__begin_;
    do
    {
      v31 = v31 + *(double *)v33;
      if (this->baselineRelative)
        v31 = v31 - *((double *)v33 + 11) - *((double *)v33 + 5);
      v33 = (_NUIGridArrangementDimension *)((char *)v33 + 56);
      --v32;
    }
    while (v32);
  }
  v34 = v22 - 1;
  if (v22 != 1)
  {
    v35 = (double *)p_rows->__begin_;
    v30 = 0.0;
    do
    {
      v30 = v30 + *v35;
      if (this->baselineRelative)
        v30 = v30 - v35[11] - v35[5];
      v35 += 7;
      --v34;
    }
    while (v34);
  }
  v36 = width - v31;
  if (v36 > 0.0)
  {
    v37 = height - v30;
    if (v37 > 0.0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v39 = -[_NUIGridArrangementContainer canCancelMeasurementForCompression](this->container, "canCancelMeasurementForCompression");
      else
        v39 = 0;
      v40 = v20 << 16;
      v38.n128_f64[0] = v36;
      v41.n128_f64[0] = _NUIGridArrangementHelper::calculateDimensionMinMax((uint64_t)this->container, v39, 1, p_cells, (uint64_t *)&this->rows, (uint64_t *)&this->columns, this->baselineRelative, v38, v37);
      v42 = *((unsigned __int8 *)this + 8);
      if (v42 == 1)
      {
        v43 = this->columns.__begin_;
        v44 = this->columns.__end_;
        if (v43 == v44)
        {
          v41.n128_u64[0] = 0;
        }
        else
        {
          v45 = 0.0;
          v46 = this->columns.__begin_;
          do
          {
            if (v45 <= *((double *)v46 + 1))
              v45 = *((double *)v46 + 1);
            v46 = (_NUIGridArrangementDimension *)((char *)v46 + 56);
          }
          while (v46 != v44);
          v41.n128_u64[0] = 0;
          do
          {
            if (*((float *)v43 + 7) >= 1000.0)
            {
              v47 = *((double *)v43 + 1);
            }
            else
            {
              *((double *)v43 + 1) = v45;
              v47 = v45;
            }
            v41.n128_f64[0] = v41.n128_f64[0] + v47;
            v43 = (_NUIGridArrangementDimension *)((char *)v43 + 56);
          }
          while (v43 != v44);
          LOWORD(v42) = *((_WORD *)this + 4);
        }
      }
      v48 = v40 & 0xFFFF0000 | v21;
      _NUIGridArrangementHelper::compressDimensionIfNeeded(this->container, v39, 1, (char)v42, v48, &this->columns.__begin_, v41, v36, v37);
      if (v49.n128_f64[0] >= 0.0)
      {
        if (v58)
          _NUIGridArrangementHelper::expandDimensionIfNeeded(1, *((char *)this + 8), v48, (double **)&this->columns, v49, v36, v37);
        v49.n128_f64[0] = v36;
        v50.n128_f64[0] = _NUIGridArrangementHelper::calculateDimensionMinMax((uint64_t)this->container, v39, 0, p_cells, (uint64_t *)&this->rows, (uint64_t *)&this->columns, this->baselineRelative, v49, v37);
        v51 = *((_WORD *)this + 4);
        if ((v51 & 0xFF00) == 0x100)
        {
          v52 = this->rows.__begin_;
          v53 = this->rows.__end_;
          if (v52 == v53)
          {
            v50.n128_u64[0] = 0;
          }
          else
          {
            v54 = 0.0;
            v55 = this->rows.__begin_;
            do
            {
              if (v54 <= *((double *)v55 + 1))
                v54 = *((double *)v55 + 1);
              v55 = (_NUIGridArrangementDimension *)((char *)v55 + 56);
            }
            while (v55 != v53);
            v50.n128_u64[0] = 0;
            do
            {
              if (*((float *)v52 + 7) >= 1000.0)
              {
                v56 = *((double *)v52 + 1);
              }
              else
              {
                *((double *)v52 + 1) = v54;
                v56 = v54;
              }
              v50.n128_f64[0] = v50.n128_f64[0] + v56;
              v52 = (_NUIGridArrangementDimension *)((char *)v52 + 56);
            }
            while (v52 != v53);
            v51 = *((_WORD *)this + 4);
          }
        }
        _NUIGridArrangementHelper::compressDimensionIfNeeded(this->container, v39, 0, (char)v51, v48, &this->rows.__begin_, v50, v36, v37);
        if (v57.n128_f64[0] >= 0.0)
        {
          if (v58)
            _NUIGridArrangementHelper::expandDimensionIfNeeded(0, *((char *)this + 9), v48, (double **)&this->rows, v57, v36, v37);
          this->hasValidMeasurement = 1;
        }
      }
    }
  }
}

void _NUIGridArrangementHelper::compressDimensionIfNeeded(void *a1, int a2, int a3, uint64_t a4, unint64_t a5, _QWORD *a6, __n128 a7, double a8, double a9)
{
  double v9;
  char v15;
  double v16;
  unint64_t v17;
  uint64_t v18;
  int8x8_t *v19;
  __n128 v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  int8x8_t *v26;
  uint64_t v27;
  unint64_t v28;
  int8x8_t *v29;
  int8x8_t v30;
  uint8x8_t v31;
  __n128 v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  float v36;
  float v37;
  int8x8_t *v38;
  unint64_t v39;
  int8x8_t *v40;
  int8x8_t *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  int8x8_t *v45;
  int8x8_t v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  unint64_t v50;
  double v51;
  unint64_t *v52;
  unint64_t v53;
  unint64_t v54;
  double v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  int8x8_t *v59;
  int8x8_t v60;
  uint8x8_t v61;
  unint64_t v62;
  unint64_t *v63;
  unint64_t v64;
  double v65;
  double v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  double v70;
  uint64_t v71;
  unint64_t *v72;
  unint64_t v73;
  unint64_t v74;
  int8x8_t *v75;
  unint64_t v76;
  int8x8_t *v77;
  uint64_t v78;

  v9 = a7.n128_f64[0];
  v78 = *MEMORY[0x1E0C80C00];
  if (!a3)
    a8 = a9;
  a7.n128_f64[0] = a8 - a7.n128_f64[0];
  if (a7.n128_f64[0] < -0.001)
  {
    if (!a2
      || (v15 = objc_msgSend(a1, "shouldCancelMeasurementForCompressionInAxis:", a3 ^ 1u),
          a7.n128_u64[0] = -1.0,
          (v15 & 1) == 0))
    {
      v16 = v9 - a8;
      if (a3)
        LOWORD(v17) = a5;
      else
        v17 = a5 >> 16;
      MEMORY[0x1E0C80A78](a7);
      v19 = (int8x8_t *)((char *)&v71 - v18);
      bzero((char *)&v71 - v18, (8 * (unint64_t)(unsigned __int16)v17 + 504) >> 6);
      v76 = (unsigned __int16)v17;
      v77 = v19;
      bzero(v19, (8 * (unint64_t)(unsigned __int16)v17 + 504) >> 6);
      v21 = (unsigned __int16)v17 - 64;
      if ((unsigned __int16)v17 < 0x40uLL)
      {
        v23 = 0;
        v24 = v17;
      }
      else
      {
        v22 = v21 >> 6;
        memset(v19, 255, 8 * (v21 >> 6) + 8);
        v23 = v22 + 1;
        v24 = v17 & 0x3F;
      }
      *(_QWORD *)&v19[v23] |= ~(-1 << v24);
      MEMORY[0x1E0C80A78](v20);
      v26 = (int8x8_t *)((char *)&v71 - v25);
      bzero((char *)&v71 - v25, (8 * (unint64_t)(unsigned __int16)v17 + 504) >> 6);
      v74 = (unsigned __int16)v17;
      v75 = v26;
      bzero(v26, (8 * (unint64_t)(unsigned __int16)v17 + 504) >> 6);
      while (v16 > 0.001)
      {
        if (v76 + 63 < 0x40)
          break;
        v27 = 0;
        v28 = (v76 + 63) >> 6;
        v29 = v77;
        do
        {
          v30 = *v29++;
          v31 = (uint8x8_t)vcnt_s8(v30);
          v31.i16[0] = vaddlv_u8(v31);
          v27 += v31.u32[0];
          --v28;
        }
        while (v28);
        if (!v27)
          break;
        nui::stack_bitset::begin((nui::stack_bitset *)&v76);
        v34 = v33;
        v72 = &v76;
        v73 = v33;
        v35 = v76;
        if (v33 != v76)
        {
          v36 = 2000.0;
          do
          {
            v37 = *(float *)(*a6 + 56 * v34 + 24);
            if (v37 <= v36)
            {
              if (v37 < v36)
              {
                v38 = v75;
                if (v74 + 63 >= 0x40)
                  bzero(v75, ((v74 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                v36 = v37;
              }
              else
              {
                v38 = v75;
              }
              *(_QWORD *)((char *)v38 + ((v34 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v34;
            }
            nui::stack_bitset::iterator::operator++((uint64_t)&v72);
            v34 = v73;
          }
          while (v73 != v35 || v72 != &v76);
          v34 = v76;
        }
        if (v34 + 63 >= 0x40)
        {
          v39 = (v34 + 63) >> 6;
          v40 = v75;
          v41 = v77;
          do
          {
            v42 = (uint64_t)*v40++;
            *(_QWORD *)v41++ &= ~v42;
            --v39;
          }
          while (v39);
        }
        while (v16 > 0.001)
        {
          if (v74 + 63 < 0x40)
            break;
          v43 = 0;
          v44 = (v74 + 63) >> 6;
          v45 = v75;
          do
          {
            v46 = *v45++;
            v32.n128_u64[0] = (unint64_t)vcnt_s8(v46);
            v32.n128_u16[0] = vaddlv_u8((uint8x8_t)v32.n128_u64[0]);
            v43 += v32.n128_u32[0];
            --v44;
          }
          while (v44);
          if (!v43)
            break;
          MEMORY[0x1E0C80A78](v32);
          v48 = (char *)&v71 - v47;
          if (a4 == 2)
          {
            nui::stack_bitset::begin((nui::stack_bitset *)&v74);
            v72 = &v74;
            v73 = v49;
            v50 = v74;
            if (v49 == v74)
            {
              v51 = 0.0;
            }
            else
            {
              v51 = 0.0;
              do
              {
                do
                {
                  v51 = v51 + *(double *)(*a6 + 56 * v49 + 16);
                  nui::stack_bitset::iterator::operator++((uint64_t)&v72);
                  v49 = v73;
                }
                while (v73 != v50);
              }
              while (v72 != &v74);
            }
            nui::stack_bitset::begin((nui::stack_bitset *)&v74);
            v52 = &v74;
            v54 = v53;
            v72 = &v74;
            v73 = v53;
            if (v53 != v74)
            {
              do
              {
                v55 = *(double *)(*a6 + 56 * v54 + 8);
                if (v55 <= 0.001)
                {
                  v52 = (unint64_t *)nui::stack_bitset::erase(&v74, (uint64_t)v52, v54);
                  v54 = v56;
                  v72 = v52;
                  v73 = v56;
                }
                else
                {
                  if (v16 * (v55 / v51) < v55)
                    v55 = v16 * (v55 / v51);
                  *(double *)&v48[8 * v54] = v55;
                  nui::stack_bitset::iterator::operator++((uint64_t)&v72);
                  v52 = v72;
                  v54 = v73;
                }
              }
              while (v54 != v74 || v52 != &v74);
            }
          }
          else
          {
            if (v74 + 63 >= 0x40)
            {
              v57 = 0;
              v58 = (v74 + 63) >> 6;
              v59 = v75;
              do
              {
                v60 = *v59++;
                v61 = (uint8x8_t)vcnt_s8(v60);
                v61.i16[0] = vaddlv_u8(v61);
                v57 += v61.u32[0];
                --v58;
              }
              while (v58);
            }
            else
            {
              v57 = 0;
            }
            nui::stack_bitset::begin((nui::stack_bitset *)&v74);
            v72 = &v74;
            v73 = v62;
            if (v62 != v74)
            {
              v63 = &v74;
              v64 = v62;
              v65 = v16 / (double)v57;
              do
              {
                v66 = *(double *)(*a6 + 56 * v64 + 8);
                if (v66 <= 0.001)
                {
                  v63 = (unint64_t *)nui::stack_bitset::erase(&v74, (uint64_t)v63, v64);
                  v64 = v67;
                  v72 = v63;
                  v73 = v67;
                }
                else
                {
                  if (v65 >= v66)
                    v65 = *(double *)(*a6 + 56 * v64 + 8);
                  *(double *)&v48[8 * v64] = v65;
                  nui::stack_bitset::iterator::operator++((uint64_t)&v72);
                  v63 = v72;
                  v64 = v73;
                }
              }
              while (v64 != v74 || v63 != &v74);
            }
          }
          nui::stack_bitset::begin((nui::stack_bitset *)&v74);
          v72 = &v74;
          v73 = v68;
          v69 = v74;
          if (v68 != v74)
          {
            do
            {
              do
              {
                v70 = *(double *)&v48[8 * v68];
                v16 = v16 - v70;
                *(double *)(*a6 + 56 * v68 + 8) = *(double *)(*a6 + 56 * v68 + 8) - v70;
                nui::stack_bitset::iterator::operator++((uint64_t)&v72);
                v68 = v73;
              }
              while (v73 != v69);
            }
            while (v72 != &v74);
          }
        }
      }
    }
  }
}

double _NUIGridArrangementHelper::calculateDimensionMinMax(uint64_t a1, int a2, int a3, uint64_t *a4, uint64_t *a5, uint64_t *a6, int a7, __n128 a8, double a9)
{
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  __n128 v18;
  __n128 v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  _BYTE v25[12];
  int v26;
  double v27;
  int v28;
  uint64_t *v29;
  double v30[12];
  char v31;
  char v32;
  char v33;
  _QWORD v34[8];
  _QWORD v35[9];

  v28 = a7;
  v29 = a4;
  v13 = a8.n128_u64[0];
  v26 = a2;
  v27 = *(double *)&a1;
  v35[8] = *MEMORY[0x1E0C80C00];
  if (a3)
    v14 = a6;
  else
    v14 = a5;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x4012000000;
  v35[3] = __Block_byref_object_copy__102;
  v35[4] = __Block_byref_object_dispose__103;
  v35[5] = &unk_1AA8398D5;
  v15 = 0x6DB6DB6DB6DB6DB7 * ((v14[1] - *v14) >> 3);
  v16 = (unint64_t)(0x6DB6DB6DB6DB6DB8 * ((v14[1] - *v14) >> 3) + 504) >> 6;
  MEMORY[0x1E0C80A78](a8);
  v17 = (v16 + 15) & 0x7FFFFFFFFFFFFF0;
  v35[6] = v15;
  v35[7] = &v25[-v17];
  bzero(&v25[-v17], v16);
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x4012000000;
  v34[3] = __Block_byref_object_copy__102;
  v34[4] = __Block_byref_object_dispose__103;
  v34[5] = &unk_1AA8398D5;
  MEMORY[0x1E0C80A78](v18);
  v34[6] = v15;
  v34[7] = &v25[-v17];
  bzero(&v25[-v17], v16);
  *(_QWORD *)&v30[0] = MEMORY[0x1E0C809B0];
  v19.n128_u64[0] = 3221225472;
  *(_QWORD *)&v30[1] = 3221225472;
  *(_QWORD *)&v30[2] = ___ZN25_NUIGridArrangementHelper24calculateDimensionMinMaxEPU39objcproto28_NUIGridArrangementContainer11objc_objectbbRNSt3__16vectorI23_NUIGridArrangementCellNS2_9allocatorIS4_EEEERNS3_I28_NUIGridArrangementDimensionNS5_IS9_EEEESC_6CGSizeb_block_invoke;
  *(_QWORD *)&v30[3] = &unk_1E57C6988;
  v31 = a3;
  v32 = v28;
  *(_QWORD *)&v30[8] = v13;
  v30[9] = a9;
  v33 = a3 & ~(_BYTE)v26;
  *(_QWORD *)&v30[10] = a5;
  *(_QWORD *)&v30[11] = a6;
  v30[4] = v27;
  *(_QWORD *)&v30[5] = v35;
  *(_QWORD *)&v30[7] = v14;
  *(_QWORD *)&v30[6] = v34;
  _NUIGridArrangementHelper::enumerateCellRanges(v29, a3, a3 & ~v26, (uint64_t)v30, v19);
  v20 = *v14;
  v21 = v14[1];
  v22 = 0.0;
  while (v20 != v21)
  {
    if (NUIContainerViewLengthIsDefault(*(double *)(v20 + 8)))
    {
      v23 = *(double *)(v20 + 16);
      *(double *)(v20 + 8) = v23;
    }
    else
    {
      v23 = *(double *)(v20 + 8);
    }
    v22 = v22 + v23;
    v20 += 56;
  }
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v35, 8);
  return v22;
}

void sub_1AA81D290(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t _NUIGridArrangementHelper::enumerateCellRanges(uint64_t *a1, int a2, int a3, uint64_t a4, __n128 a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  size_t v12;
  unint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  __int128 v16;
  _QWORD *v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t result;
  _BYTE v22[22];
  __int16 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = *a1;
  v8 = a1[1];
  MEMORY[0x1E0C80A78](a5);
  v11 = &v22[-v10];
  bzero(&v22[-v10], v12);
  if (v8 == v9)
  {
    v13 = 0;
  }
  else
  {
    v13 = 0;
    v14 = v11 + 1;
    do
    {
      if (a2)
        v15 = 56;
      else
        v15 = 72;
      v16 = *(_OWORD *)(v9 + v15);
      *((_QWORD *)v14 - 1) = v9;
      *v14 = v16;
      v14 = (_OWORD *)((char *)v14 + 24);
      ++v13;
      v9 += 112;
    }
    while (v9 != v8);
  }
  v17 = &v11[3 * v13];
  if (a3)
    v18 = 256;
  else
    v18 = 0;
  v23 = v18 | a2;
  v19 = 126 - 2 * __clz(v13);
  if (v13)
    v20 = v19;
  else
    v20 = 0;
  result = std::__introsort<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*,false>((uint64_t)v11, (__n128 *)&v11[3 * v13], (unsigned __int8 *)&v23, v20, 1);
  if (v13)
  {
    do
    {
      result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(a4 + 16))(a4, *v11, v11[1], v11[2]);
      v11 += 3;
    }
    while (v11 != v17);
  }
  return result;
}

void ___ZN25_NUIGridArrangementHelper24calculateDimensionMinMaxEPU39objcproto28_NUIGridArrangementContainer11objc_objectbbRNSt3__16vectorI23_NUIGridArrangementCellNS2_9allocatorIS4_EEEERNS3_I28_NUIGridArrangementDimensionNS5_IS9_EEEESC_6CGSizeb_block_invoke(uint64_t a1, _QWORD *a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4;
  int v8;
  float *v9;
  float v10;
  float *v11;
  float v12;
  unint64_t v13;
  _BOOL4 v14;
  uint64_t *v15;
  double v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  BOOL v26;
  unint64_t v27;
  uint64_t v28;
  double v29;
  double *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  double v35;
  double v36;
  double *v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  double *v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  BOOL v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  char v54;
  char v55;
  double v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  nui::stack_bitset *v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  float v75;
  float v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v81;
  nui::stack_bitset *v82;
  uint64_t v83;
  unint64_t v84;
  double v85;
  unint64_t v86;
  unint64_t v87;
  int8x8_t *v88;
  int8x8_t v89;
  uint8x8_t v90;
  double v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  float *v96;
  float v97;
  float v98;
  int v99;
  double v100;
  double v101;
  nui::stack_bitset *v102;
  unint64_t v103;

  v4 = a4;
  v8 = *(unsigned __int8 *)(a1 + 96);
  v9 = (float *)(a2 + 1);
  if (!*(_BYTE *)(a1 + 96))
    v9 = (float *)a2 + 3;
  v10 = *v9;
  v11 = (float *)(a2 + 2);
  if (!*(_BYTE *)(a1 + 96))
    v11 = (float *)a2 + 5;
  v12 = *v11;
  v13 = a4 - 1;
  if (a4 == 1)
  {
    if (!NUIContainerViewLengthIsDefault(*(double *)(**(_QWORD **)(a1 + 56) + 56 * a3 + 8)))
    {
      v56 = *(double *)(**(_QWORD **)(a1 + 56) + 56 * a3 + 8);
      goto LABEL_80;
    }
    v8 = *(unsigned __int8 *)(a1 + 96);
  }
  if (v8)
    v14 = 0;
  else
    v14 = *(_BYTE *)(a1 + 97) != 0;
  v15 = *(uint64_t **)(a1 + 56);
  v16 = 0.0;
  if (a3 < a3 + v4 - 1)
  {
    v17 = (double *)(*v15 + 56 * a3);
    do
    {
      v16 = v16 + *v17;
      if (v14)
        v16 = v16 - v17[11] - v17[5];
      v17 += 7;
      --v13;
    }
    while (v13);
  }
  v19 = *(double *)(a1 + 64);
  v18 = *(double *)(a1 + 72);
  if (v8)
  {
    if (v19 < 1.70141173e38)
    {
      v20 = v16 + v19;
      v21 = 0.0;
      if (*(_BYTE *)(a1 + 98))
      {
        v22 = *v15;
        v23 = v15[1];
        if (*v15 != v23)
        {
          v24 = 0;
          do
          {
            v26 = v24 - a3 < v4 && a3 <= v24 || *(float *)(v22 + 24) <= v10;
            if (!v26 && !NUIContainerViewLengthIsDefault(*(double *)(v22 + 16)))
              v21 = v21 + *(double *)(v22 + 16);
            ++v24;
            v22 += 56;
          }
          while (v22 != v23);
        }
      }
      v19 = v20 - v21;
    }
    if (v18 < 1.70141173e38)
    {
      v27 = a2[9];
      v28 = a2[10];
      v29 = 0.0;
      if (v27 < v27 + v28 - 1)
      {
        v30 = (double *)(**(_QWORD **)(a1 + 80) + 56 * v27);
        v31 = v28 - 1;
        do
        {
          v29 = v29 + *v30;
          if (*(_BYTE *)(a1 + 97))
            v29 = v29 - v30[11] - v30[5];
          v30 += 7;
          --v31;
        }
        while (v31);
      }
      v18 = v18 + v29;
    }
  }
  else
  {
    if (v19 < 1.70141173e38)
    {
      v32 = a2[7];
      v33 = a2[8];
      v34 = *(_QWORD **)(a1 + 88);
      v35 = 0.0;
      v36 = 0.0;
      if (v32 < v33 + v32)
      {
        v37 = (double *)(*v34 + 56 * v32 + 8);
        v38 = a2[8];
        do
        {
          v39 = *v37;
          v37 += 7;
          v36 = v36 + v39;
          --v38;
        }
        while (v38);
      }
      if (v32 < v33 + v32 - 1)
      {
        v40 = v33 - 1;
        v41 = (double *)(*v34 + 56 * v32);
        v35 = 0.0;
        do
        {
          v42 = *v41;
          v41 += 7;
          v35 = v35 + v42;
          --v40;
        }
        while (v40);
      }
      v19 = v36 + v35;
    }
    if (v18 < 1.70141173e38)
    {
      v43 = v16 + v18;
      v44 = 0.0;
      if (*(_BYTE *)(a1 + 98))
      {
        v45 = *v15;
        v46 = v15[1];
        if (*v15 != v46)
        {
          v47 = 0;
          do
          {
            v49 = v47 - a3 < v4 && a3 <= v47 || *(float *)(v45 + 24) <= v10;
            if (!v49 && !NUIContainerViewLengthIsDefault(*(double *)(v45 + 16)))
              v44 = v44 + *(double *)(v45 + 16);
            ++v47;
            v45 += 56;
          }
          while (v45 != v46);
        }
      }
      v18 = v43 - v44;
    }
  }
  v50 = *(void **)(a1 + 32);
  v51 = *((double *)a2 + 5);
  if (vabdd_f64(v51, *MEMORY[0x1E0C9D820]) >= 0.001
    || vabdd_f64(*((double *)a2 + 6), *(double *)(MEMORY[0x1E0C9D820] + 8)) >= 0.001)
  {
    if (vabdd_f64(v51, v19) < 0.001)
    {
      if (vabdd_f64(*((double *)a2 + 6), v18) < 0.001)
      {
        v52 = *((double *)a2 + 4);
        goto LABEL_75;
      }
LABEL_73:
      v52 = *((double *)a2 + 4);
      if (v18 - v52 >= -0.001)
        goto LABEL_75;
      goto LABEL_74;
    }
    v53 = v19 - *((double *)a2 + 3);
    v54 = objc_msgSend((id)*a2, "isLayoutSizeDependentOnPerpendicularAxis");
    if (v53 < -0.001)
      v55 = 1;
    else
      v55 = v54;
    if ((v55 & 1) == 0)
      goto LABEL_73;
  }
LABEL_74:
  objc_msgSend(v50, "contentLayoutSizeFittingSize:forArrangedSubview:", *a2, v19, v18);
  a2[3] = v57;
  *((double *)a2 + 4) = v52;
  *((double *)a2 + 5) = v19;
  *((double *)a2 + 6) = v18;
LABEL_75:
  v58 = *((double *)a2 + 3);
  if (!*(_BYTE *)(a1 + 96))
    v58 = v52;
  v59 = 0.0;
  if (!*(_BYTE *)(a1 + 96))
  {
    v99 = *((unsigned __int8 *)a2 + 105) << 8;
    if (v99 == 1280)
    {
      v101 = *((double *)a2 + 12);
      if (v101 != 2.22507386e-308)
        v59 = *(double *)(**(_QWORD **)(a1 + 80) + 56 * (a2[9] + a2[10]) - 16) - v101;
    }
    else if (v99 == 512)
    {
      v100 = *((double *)a2 + 11);
      if (v100 != 2.22507386e-308)
      {
        v60 = *(double *)(**(_QWORD **)(a1 + 80) + 56 * a2[9] + 32) - v100;
        goto LABEL_79;
      }
    }
  }
  v60 = 0.0;
LABEL_79:
  v56 = v58 + v60 + v59 - v16;
LABEL_80:
  v61 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v62 = *(_QWORD *)(v61 + 48) + 63;
  if (v62 >= 0x40)
    bzero(*(void **)(v61 + 56), (v62 >> 3) & 0x1FFFFFFFFFFFFFF8);
  if (a3 < a3 + v4)
  {
    v63 = 56 * a3;
    v64 = v4;
    v65 = a3;
    do
    {
      v66 = **(_QWORD **)(a1 + 56) + v63;
      if (*(double *)(v66 + 16) >= v56)
        v67 = v56;
      else
        v67 = *(double *)(v66 + 16);
      if (NUIContainerViewLengthIsDefault(*(double *)(v66 + 8)))
      {
        v68 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56);
        *(_QWORD *)(v68 + ((v65 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v65;
      }
      v56 = v56 - v67;
      ++v65;
      v63 += 56;
      --v64;
    }
    while (v64);
  }
  if (v56 > 0.001)
  {
    v69 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v70 = *(_QWORD *)(v69 + 48) + 63;
    if (v70 >= 0x40)
      bzero(*(void **)(v69 + 56), (v70 >> 3) & 0x1FFFFFFFFFFFFFF8);
    v71 = (nui::stack_bitset *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
    nui::stack_bitset::begin(v71);
    v102 = v71;
    v103 = v72;
    v73 = *(_QWORD *)v71;
    if (v72 != *(_QWORD *)v71)
    {
      v74 = v72;
      v75 = 2000.0;
      do
      {
        v76 = *(float *)(**(_QWORD **)(a1 + 56) + 56 * v74 + 28);
        if (v76 <= v75)
        {
          v77 = *(_QWORD *)(a1 + 48);
          if (v76 < v75)
          {
            v78 = *(_QWORD *)(v77 + 8);
            v79 = *(_QWORD *)(v78 + 48) + 63;
            if (v79 >= 0x40)
            {
              bzero(*(void **)(v78 + 56), (v79 >> 3) & 0x1FFFFFFFFFFFFFF8);
              v77 = *(_QWORD *)(a1 + 48);
            }
          }
          else
          {
            v76 = v75;
          }
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v77 + 8) + 56) + ((v74 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v74;
          v75 = v76;
        }
        nui::stack_bitset::iterator::operator++((uint64_t)&v102);
        v74 = v103;
      }
      while (v103 != v73 || v102 != v71);
    }
    v81 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v83 = *(_QWORD *)(v81 + 48);
    v82 = (nui::stack_bitset *)(v81 + 48);
    v84 = v83 + 63;
    v85 = 0.0;
    if ((unint64_t)(v83 + 63) >= 0x40)
    {
      v86 = 0;
      v87 = v84 >> 6;
      v88 = *(int8x8_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56);
      do
      {
        v89 = *v88++;
        v90 = (uint8x8_t)vcnt_s8(v89);
        v90.i16[0] = vaddlv_u8(v90);
        v86 += v90.u32[0];
        --v87;
      }
      while (v87);
      v85 = (double)v86;
    }
    v91 = v56 / v85;
    nui::stack_bitset::begin(v82);
    v102 = v82;
    v103 = v92;
    v93 = *(_QWORD *)v82;
    if (v92 != *(_QWORD *)v82)
    {
      do
      {
        v94 = **(_QWORD **)(a1 + 56) + 56 * v92;
        *(double *)(v94 + 16) = v91 + *(double *)(v94 + 16);
        nui::stack_bitset::iterator::operator++((uint64_t)&v102);
        v92 = v103;
      }
      while (v103 != v93 || v102 != v82);
    }
  }
  if (a3 < a3 + v4)
  {
    v96 = (float *)(**(_QWORD **)(a1 + 56) + 56 * a3 + 28);
    do
    {
      if (*(v96 - 1) <= v10)
        v97 = v10;
      else
        v97 = *(v96 - 1);
      v98 = *v96;
      if (*v96 <= v12)
        v98 = v12;
      *(v96 - 1) = v97;
      *v96 = v98;
      v96 += 14;
      --v4;
    }
    while (v4);
  }
}

BOOL NUIContainerViewLengthIsDefault(double a1)
{
  return a1 >= 1.79769313e308;
}

unint64_t *nui::stack_bitset::iterator::operator++(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v1 = *(unint64_t **)a1;
  v2 = *(_QWORD *)(a1 + 8) + 1;
  v3 = **(_QWORD **)a1;
  if (v2 < v3)
  {
    v4 = v1[1];
    while ((*(_QWORD *)(v4 + ((v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) & (-1 << v2)) == 0)
    {
      v2 = (v2 & 0xFFFFFFFFFFFFFFC0) + 64;
      if (v2 >= v3)
        goto LABEL_7;
    }
    v2 = __clz(__rbit64(*(_QWORD *)(v4 + ((v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) & (-1 << v2))) | v2 & 0xFFFFFFFFFFFFFFC0;
  }
LABEL_7:
  if (v2 >= v3)
    v5 = **(_QWORD **)a1;
  else
    v5 = v2;
  *(_QWORD *)(a1 + 8) = v5;
  return v1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> nui::stack_bitset::begin(nui::stack_bitset *this)
{
  _QWORD v1[2];

  v1[1] = 0;
  if ((**((_BYTE **)this + 1) & 1) == 0)
    nui::stack_bitset::iterator::operator++((uint64_t)v1);
}

uint64_t nui_size_cache::find_size(nui_size_cache *this, CGSize a2, char a3, CGSize *a4)
{
  double *begin;
  void *end;
  double v6;
  char v7;
  double v8;
  double v9;
  double v10;

  begin = (double *)this->__begin_;
  end = this->__end_;
  if (this->__begin_ == end)
    return 0;
  while (1)
  {
    v6 = *begin;
    if (vabdd_f64(*begin, a2.width) < 0.001
      || (v6 - a2.width < -0.001 ? (v7 = a3) : (v7 = 0),
          (v7 & 1) == 0 && (v8 = begin[2], v8 - v6 < -0.001) && v8 - a2.width < 0.001))
    {
      v9 = begin[1];
      if (vabdd_f64(v9, a2.height) < 0.001)
        break;
      v10 = begin[3];
      if (v10 - v9 < -0.001 && v10 - a2.height < 0.001)
        break;
    }
    begin += 4;
    if (begin == end)
      return 0;
  }
  *a4 = *(CGSize *)(begin + 2);
  return 1;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*,false>(uint64_t result, __n128 *a2, unsigned __int8 *a3, uint64_t a4, char a5)
{
  uint64_t *v8;
  __n128 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t *v15;
  uint64_t v16;
  _QWORD *v17;
  __n128 *v18;
  unint64_t *v19;
  __int128 v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  BOOL v27;
  BOOL v28;
  _QWORD *v29;
  char v30;
  BOOL v31;
  unint64_t v32;
  __int8 *v33;
  unint64_t v34;
  uint64_t v35;
  float v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  BOOL v40;
  _BOOL4 v41;
  _BOOL4 v42;
  __n128 v43;
  __int128 v44;
  __n128 v45;
  uint64_t v46;
  unint64_t v47;

  v8 = (uint64_t *)result;
LABEL_2:
  v9 = (__n128 *)v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = (uint64_t *)v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v9) >> 3);
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v34 = a2[-2].n128_u64[1];
        v33 = &a2[-2].n128_i8[8];
        v32 = v34;
        v35 = 8;
        if (!*a3)
          v35 = 12;
        v36 = *(float *)(v32 + v35) - *(float *)(v9->n128_u64[0] + v35);
        v37 = *((_QWORD *)v33 + 2);
        v38 = v9[1].n128_u64[0];
        v39 = v37 - v38;
        if (a3[1])
        {
          v40 = v39 < 0;
          if (v36 != 0.0)
            v40 = v36 > 0.0;
          if (v40)
          {
LABEL_51:
            v47 = v9[1].n128_u64[0];
            v45 = *v9;
            v43 = *(__n128 *)v33;
            v9[1].n128_u64[0] = *((_QWORD *)v33 + 2);
            *v9 = v43;
            *(__n128 *)v33 = v45;
            *((_QWORD *)v33 + 2) = v47;
            return result;
          }
        }
        else
        {
          v41 = v39 < 0;
          if (v37 == v38)
            v42 = v36 > 0.0;
          else
            v42 = v41;
          if (v42)
            goto LABEL_51;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v9, &v9[1].n128_u64[1], &a2[-2].n128_u64[1], a3);
      case 4uLL:
        return std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v9, &v9[1].n128_u64[1], (__n128 *)v9[3].n128_u64, &a2[-2].n128_u64[1], a3);
      case 5uLL:
        return std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v9, &v9[1].n128_u64[1], (__n128 *)v9[3].n128_u64, &v9[4].n128_u64[1], &a2[-2].n128_u64[1], a3);
      default:
        if (v12 <= 575)
        {
          if ((a5 & 1) != 0)
            return (uint64_t)std::__insertion_sort[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v9, a2, a3);
          else
            return (uint64_t)std::__insertion_sort_unguarded[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v9, a2, a3);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9->n128_u64[3 * (v13 >> 1)];
          if ((unint64_t)v12 < 0xC01)
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(&v9->n128_u64[3 * v14], v9, &a2[-2].n128_u64[1], a3);
            if ((a5 & 1) != 0)
              goto LABEL_22;
          }
          else
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v9, &v9->n128_u64[3 * v14], &a2[-2].n128_u64[1], a3);
            v16 = 3 * v14;
            v17 = (_QWORD *)&v9[-1] + 3 * v14 - 1;
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(&v9[1].n128_u64[1], v17, (__n128 *)a2[-3].n128_u64, a3);
            v18 = v9 + 3;
            v19 = &v9[1].n128_u64[v16 + 1];
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v18, v19, &a2[-5].n128_u64[1], a3);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v17, v15, v19, a3);
            v46 = v8[2];
            v44 = *(_OWORD *)v8;
            v20 = *(_OWORD *)v15;
            v8[2] = v15[2];
            *(_OWORD *)v8 = v20;
            v15[2] = v46;
            *(_OWORD *)v15 = v44;
            if ((a5 & 1) != 0)
              goto LABEL_22;
          }
          v21 = 8;
          if (!*a3)
            v21 = 12;
          v22 = *(float *)(*(v8 - 3) + v21) - *(float *)(*v8 + v21);
          v23 = *(v8 - 1);
          v24 = v8[2];
          v25 = v23 - v24;
          if (a3[1])
          {
            v26 = v25 < 0;
            if (v22 != 0.0)
              v26 = v22 > 0.0;
            if (!v26)
            {
LABEL_26:
              result = (uint64_t)std::__partition_with_equals_on_left[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell *,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &>(v8, a2, a3);
              v9 = (__n128 *)result;
              goto LABEL_27;
            }
          }
          else
          {
            v27 = v25 < 0;
            if (v23 == v24)
              v28 = v22 > 0.0;
            else
              v28 = v27;
            if (!v28)
              goto LABEL_26;
          }
LABEL_22:
          v29 = (_QWORD *)std::__partition_with_equals_on_right[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell *,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &>(v8, a2, a3);
          if ((v30 & 1) == 0)
            goto LABEL_25;
          v31 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v8, v29, a3);
          v9 = (__n128 *)(v29 + 3);
          result = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v29 + 3, a2, a3);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v31)
              continue;
LABEL_25:
            result = std::__introsort<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*,false>(v8, v29, a3, -v11, a5 & 1);
            v9 = (__n128 *)(v29 + 3);
LABEL_27:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = (__n128 *)v29;
          if (v31)
            return result;
          goto LABEL_2;
        }
        if (v9 != a2)
          return (uint64_t)std::__partial_sort_impl[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v9, a2, a2, a3);
        return result;
    }
  }
}

void sub_1AA81F034(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void _NUIGridArrangementDimension::_NUIGridArrangementDimension(_NUIGridArrangementDimension *this, __int16 a2, double a3)
{
  *(_QWORD *)this = 0;
  *((double *)this + 1) = a3;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_WORD *)this + 24) = a2;
}

BOOL NUIContainerViewLengthIsSystem(double *a1, double a2)
{
  double v3;

  if (a2 <= -1048576.0 && a1 != 0)
  {
    v3 = (a2 + 1048576.0) * -0.00390625;
    if (a2 == -1.79769313e308)
      v3 = 1.0;
    *a1 = v3;
  }
  return a2 <= -1048576.0;
}

double _NUIGridArrangementHelper::expandDimensionIfNeeded(int a1, uint64_t a2, unint64_t a3, double **a4, __n128 a5, double a6, double a7)
{
  double v7;
  double v10;
  double *v11;
  int64_t v12;
  uint64_t v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  size_t v17;
  uint64_t v18;
  int8x8_t *v19;
  size_t v20;
  __n128 v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  int v26;
  uint64_t v27;
  int v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  double *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  int8x8_t *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int8x8_t v45;
  uint8x8_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  float v50;
  float v51;
  unint64_t v52;
  int8x8_t *v53;
  int8x8_t *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  double v58;
  unint64_t v59;
  uint64_t v60;
  double v61;
  double v62;
  double *v63;
  uint64_t v64;
  double v65;
  int v66;
  uint64_t v67;
  double *v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double *v75;
  double v76;
  double *v77;
  uint64_t v78;
  double v79;
  double v80;
  uint64_t v81;
  double *v82;
  uint64_t v83;
  double *v84;
  double v85;
  double v86;
  uint64_t v87;
  double *v88;
  double v89;
  double v90;
  unint64_t v92;
  int8x8_t v93;
  uint8x8_t v94;
  double v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t *v99;
  unint64_t v100;
  _QWORD v101[2];
  unint64_t v102;
  int8x8_t *v103;
  uint64_t v104;

  v7 = a5.n128_f64[0];
  v104 = *MEMORY[0x1E0C80C00];
  if (a1)
    a5.n128_f64[0] = a6;
  else
    a5.n128_f64[0] = a7;
  if (v7 - a5.n128_f64[0] < -0.001 && (unint64_t)(a2 - 6) >= 3)
  {
    v10 = a5.n128_f64[0] - v7;
    if ((unint64_t)(a2 - 3) <= 2)
    {
      v11 = *a4;
      v12 = (char *)a4[1] - (char *)*a4;
      if (v12 == 56)
      {
        v11[1] = v10 + v11[1];
      }
      else
      {
        v13 = v12 / 56 - 1;
        if (a2 != 3)
        {
          v26 = MEMORY[0x1E0C80A78](a5);
          v34 = (char *)&v98 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
          v35 = *a4;
          v36 = (*a4)[1];
          v37 = (*a4)[7 * v29 + 1];
          if (a2 == 5)
          {
            v38 = v37 - v36;
            if (v37 - v36 < 0.0)
              v38 = 0.0;
            v10 = v10 - v38;
            if (v36 < v37)
              v37 = (*a4)[1];
            v39 = v37;
          }
          else
          {
            v39 = (*a4)[1];
          }
          v61 = 0.0;
          v62 = 0.0;
          if (v27 >= 1)
          {
            v63 = v35 + 1;
            v64 = v31;
            do
            {
              v65 = *v63;
              v63 += 7;
              v62 = v62 + v65;
              --v64;
            }
            while (v64);
          }
          v66 = v28 & ~v26;
          if (v32 != v30)
          {
            v61 = 0.0;
            v67 = v31;
            v68 = *a4;
            do
            {
              v61 = v61 + *v68;
              if (v66)
                v61 = v61 - v68[11] - v68[5];
              v68 += 7;
              --v67;
            }
            while (v67);
          }
          if (v29)
          {
            v69 = 0;
            v70 = v31 - 2;
            v71 = (v10 + v62 + v61 - (v37 * 0.5 + v39 * 0.5)) / (double)v29;
            v72 = v36 - v39;
            do
            {
              v73 = v39;
              if (v69)
                v73 = v35[7 * v69 + 1];
              v74 = v37;
              if (v69 != v70)
                v74 = v35[7 * v69 + 8];
              v75 = &v35[7 * v69];
              *(double *)&v34[8 * v69] = *v75;
              v76 = 0.0;
              if (v69 >= 1)
              {
                v77 = v35 + 1;
                v78 = v69;
                do
                {
                  v79 = *v77;
                  v77 += 7;
                  v76 = v76 + v79;
                  --v78;
                }
                while (v78);
              }
              if (v69)
              {
                v80 = 0.0;
                v81 = v69;
                v82 = v35;
                do
                {
                  v80 = v80 + *v82;
                  if (v66)
                    v80 = v80 - v82[11] - v82[5];
                  v82 += 7;
                  --v81;
                }
                while (v81);
                *v75 = v71 + v73 * 0.5 + v76 + v80 - (v73 * 0.5 + v76 + v80) - (v73 * 0.5 + v74 * 0.5);
              }
              else
              {
                *v75 = v71 + v73 * 0.5 + v76 + 0.0 - (v73 * 0.5 + v76 + 0.0) - (v73 * 0.5 + v74 * 0.5);
                *v35 = *v35 - v72;
              }
              ++v69;
            }
            while (v69 != v29);
            if (v31 == 2)
              return v10 + v7;
          }
          else
          {
            v70 = -1;
          }
          v83 = v70;
          do
          {
            while (1)
            {
              v84 = &v35[7 * v83];
              v85 = *(double *)&v34[8 * v83];
              v86 = *v84 - v85;
              if (v86 >= 0.001)
                break;
              *v84 = v85;
              --v83;
              v35[7 * v83] = v86 + v35[7 * v83];
              if (!v83)
                goto LABEL_85;
            }
            --v83;
          }
          while (v83);
LABEL_85:
          v87 = 0;
          do
          {
            v88 = &v35[7 * v87];
            v89 = *(double *)&v34[8 * v87];
            v90 = *v88 - v89;
            if (v90 >= 0.001)
            {
              ++v87;
            }
            else
            {
              *v88 = v89;
              ++v87;
              v35[7 * v87] = v90 + v35[7 * v87];
            }
          }
          while (v87 != v70);
          return v10 + v7;
        }
        if (v12 / 56 != 1)
        {
          v14 = v10 / (double)(unint64_t)v13;
          do
          {
            *v11 = v14 + *v11;
            v11 += 7;
            --v13;
          }
          while (v13);
        }
      }
      return v10 + v7;
    }
    if (a1)
      LOWORD(v15) = a3;
    else
      v15 = a3 >> 16;
    v16 = (unsigned __int16)v15;
    v17 = (8 * (unint64_t)(unsigned __int16)v15 + 504) >> 6;
    MEMORY[0x1E0C80A78](a5);
    v19 = (int8x8_t *)((char *)&v98 - v18);
    bzero((char *)&v98 - v18, v17);
    v102 = (unsigned __int16)v15;
    v103 = v19;
    v20 = v17;
    bzero(v19, v20);
    v22 = (unsigned __int16)v15 - 64;
    if ((unsigned __int16)v15 < 0x40uLL)
    {
      v24 = 0;
      v25 = v15;
    }
    else
    {
      v23 = v22 >> 6;
      memset(v19, 255, 8 * (v22 >> 6) + 8);
      v24 = v23 + 1;
      v25 = v15 & 0x3F;
    }
    *(_QWORD *)&v19[v24] |= ~(-1 << v25);
    MEMORY[0x1E0C80A78](v21);
    v41 = (int8x8_t *)((char *)&v98 - v40);
    bzero((char *)&v98 - v40, v17);
    v101[0] = v16;
    v101[1] = v41;
    bzero(v41, v20);
    if (v10 > 0.001)
    {
      if (v16)
      {
        v42 = 0;
        v43 = (unint64_t)(v16 + 63) >> 6;
        v44 = v43;
        do
        {
          v45 = *v19++;
          v46 = (uint8x8_t)vcnt_s8(v45);
          v46.i16[0] = vaddlv_u8(v46);
          v42 += v46.u32[0];
          --v44;
        }
        while (v44);
        if (v42)
        {
          nui::stack_bitset::begin((nui::stack_bitset *)&v102);
          v48 = v47;
          v99 = &v102;
          v100 = v47;
          v49 = v102;
          if (v47 != v102)
          {
            v50 = 2000.0;
            do
            {
              v51 = *((float *)&(*a4)[7 * v48 + 3] + 1);
              if (v51 <= v50)
              {
                if (v51 < v50)
                {
                  bzero(v41, ((unint64_t)(v16 + 63) >> 3) & 0x3FF8);
                  v50 = v51;
                }
                *(_QWORD *)((char *)v41 + ((v48 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v48;
              }
              nui::stack_bitset::iterator::operator++((uint64_t)&v99);
              v48 = v100;
            }
            while (v100 != v49 || v99 != &v102);
            v48 = v102;
          }
          if (v48 + 63 >= 0x40)
          {
            v52 = (v48 + 63) >> 6;
            v53 = v103;
            v54 = v41;
            do
            {
              v55 = (uint64_t)*v54++;
              *(_QWORD *)v53++ &= ~v55;
              --v52;
            }
            while (v52);
          }
          if (a2 == 2)
          {
            nui::stack_bitset::begin((nui::stack_bitset *)v101);
            v99 = v101;
            v100 = v56;
            v57 = v101[0];
            v58 = 0.0;
            if (v56 != v101[0])
            {
              do
              {
                do
                {
                  v58 = v58 + (*a4)[7 * v56 + 2];
                  nui::stack_bitset::iterator::operator++((uint64_t)&v99);
                  v56 = v100;
                }
                while (v100 != v57);
              }
              while (v99 != v101);
            }
            nui::stack_bitset::begin((nui::stack_bitset *)v101);
            v99 = v101;
            v100 = v59;
            v60 = v101[0];
            if (v59 != v101[0])
            {
              do
              {
                do
                {
                  (*a4)[7 * v59 + 1] = (*a4)[7 * v59 + 1] + v10 * ((*a4)[7 * v59 + 1] / v58);
                  nui::stack_bitset::iterator::operator++((uint64_t)&v99);
                  v59 = v100;
                }
                while (v100 != v60);
              }
              while (v99 != v101);
            }
          }
          else
          {
            v92 = 0;
            do
            {
              v93 = *v41++;
              v94 = (uint8x8_t)vcnt_s8(v93);
              v94.i16[0] = vaddlv_u8(v94);
              v92 += v94.u32[0];
              --v43;
            }
            while (v43);
            v95 = v10 / (double)v92;
            nui::stack_bitset::begin((nui::stack_bitset *)v101);
            v99 = v101;
            v100 = v96;
            v97 = v101[0];
            if (v96 != v101[0])
            {
              do
              {
                do
                {
                  (*a4)[7 * v96 + 1] = v95 + (*a4)[7 * v96 + 1];
                  nui::stack_bitset::iterator::operator++((uint64_t)&v99);
                  v96 = v100;
                }
                while (v100 != v97);
              }
              while (v99 != v101);
            }
          }
          return v10 + v7;
        }
      }
    }
  }
  return v7;
}

void std::vector<_NUIGridArrangementDimension>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x492492492492493)
      abort();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 56;
    v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>(v3, a2);
    v7 = &v6[56 * v5];
    v9 = &v6[56 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_OWORD *)(v10 - 56);
        v14 = *(_OWORD *)(v10 - 40);
        v15 = *(_OWORD *)(v10 - 24);
        *((_QWORD *)v12 - 1) = *((_QWORD *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v15;
        *(_OWORD *)(v12 - 40) = v14;
        *(_OWORD *)(v12 - 56) = v13;
        v12 -= 56;
        v10 -= 56;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void sub_1AA8201D0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void _NUIGridArrangement::_NUIGridArrangement(_NUIGridArrangement *this)
{
  this->container = 0;
  *((_WORD *)this + 4) = 0;
  this->baselineRelative = 0;
  *(_OWORD *)&this->cells.__begin_ = 0u;
  *(_OWORD *)&this->cells.__end_cap_.__value_ = 0u;
  *(_OWORD *)&this->columns.__end_ = 0u;
  *(_OWORD *)&this->rows.__begin_ = 0u;
  *(_OWORD *)&this->rows.__end_cap_.__value_ = 0u;
  *(_OWORD *)&this->viewFrames.__end_ = 0u;
}

char *nui_size_cache::insert_size(nui_size_cache *this, CGSize a2, CGSize a3)
{
  char *end;
  char *begin;
  unint64_t v6;
  double *v7;
  _BOOL4 v8;
  CGSize v10[2];
  char v11;

  v10[0] = a2;
  v10[1] = a3;
  begin = (char *)this->__begin_;
  end = (char *)this->__end_;
  if (end != this->__begin_)
  {
    v6 = (end - (char *)this->__begin_) >> 5;
    do
    {
      v7 = (double *)&begin[32 * (v6 >> 1)];
      v8 = std::__less<void,void>::operator()[abi:nn180100]<std::pair<CGSize,CGSize>,std::pair<CGSize,CGSize>>((uint64_t)&v11, v7, &v10[0].width);
      if (v8)
        v6 += ~(v6 >> 1);
      else
        v6 >>= 1;
      if (v8)
        begin = (char *)(v7 + 4);
    }
    while (v6);
    end = begin;
  }
  return std::vector<std::pair<CGSize,CGSize>>::insert((char **)this, end, v10);
}

char *std::vector<std::pair<CGSize,CGSize>>::insert(char **a1, char *a2, _OWORD *a3)
{
  _OWORD *v3;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  unint64_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  __int128 v25;
  char *v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  __int128 v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  __int128 v39;
  char *i;
  __int128 v41;
  __int128 v42;
  char *v43;

  v3 = a3;
  v6 = *a1;
  v5 = a1[1];
  v7 = a2 - *a1;
  v8 = v7 >> 5;
  v9 = &(*a1)[v7 & 0xFFFFFFFFFFFFFFE0];
  v11 = (uint64_t)(a1 + 2);
  v10 = (unint64_t)a1[2];
  if ((unint64_t)v5 >= v10)
  {
    v17 = ((v5 - v6) >> 5) + 1;
    if (v17 >> 59)
      abort();
    v19 = v10 - (_QWORD)v6;
    if (v19 >> 4 > v17)
      v17 = v19 >> 4;
    if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFE0)
      v20 = 0x7FFFFFFFFFFFFFFLL;
    else
      v20 = v17;
    if (v20)
      v21 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<CGSize,CGSize>>>((uint64_t)(a1 + 2), v20);
    else
      v21 = 0;
    v26 = &v21[32 * v8];
    v27 = &v21[32 * v20];
    if (v8 == v20)
    {
      if (v7 < 1)
      {
        if (v6 == a2)
          v29 = 1;
        else
          v29 = v7 >> 4;
        v30 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<CGSize,CGSize>>>(v11, v29);
        v26 = &v30[32 * (v29 >> 2)];
        v27 = &v30[32 * v31];
        if (v21)
        {
          v32 = &v30[32 * v31];
          operator delete(v21);
          v27 = v32;
        }
      }
      else
      {
        v28 = v8 + 2;
        if (v8 >= -1)
          v28 = v8 + 1;
        v26 -= 32 * (v28 >> 1);
      }
    }
    v33 = v3[1];
    *(_OWORD *)v26 = *v3;
    *((_OWORD *)v26 + 1) = v33;
    v34 = v26 + 32;
    v35 = *a1;
    v36 = v26;
    if (*a1 != v9)
    {
      v37 = v9;
      v38 = v26;
      do
      {
        v36 = v38 - 32;
        v39 = *((_OWORD *)v37 - 1);
        *((_OWORD *)v38 - 2) = *((_OWORD *)v37 - 2);
        *((_OWORD *)v38 - 1) = v39;
        v37 -= 32;
        v38 -= 32;
      }
      while (v37 != v35);
    }
    for (i = a1[1]; v9 != i; v34 += 32)
    {
      v41 = *(_OWORD *)v9;
      v42 = *((_OWORD *)v9 + 1);
      v9 += 32;
      *(_OWORD *)v34 = v41;
      *((_OWORD *)v34 + 1) = v42;
    }
    v43 = *a1;
    *a1 = v36;
    a1[1] = v34;
    a1[2] = v27;
    if (v43)
      operator delete(v43);
    return v26;
  }
  else if (v9 == v5)
  {
    v25 = a3[1];
    *(_OWORD *)v9 = *a3;
    *((_OWORD *)v9 + 1) = v25;
    a1[1] = v9 + 32;
  }
  else
  {
    v12 = v9 + 32;
    v13 = v5 - 32;
    v14 = a1[1];
    while (v13 < v5)
    {
      v15 = *(_OWORD *)v13;
      v16 = *((_OWORD *)v13 + 1);
      v13 += 32;
      *(_OWORD *)v14 = v15;
      *((_OWORD *)v14 + 1) = v16;
      v14 += 32;
    }
    a1[1] = v14;
    if (v5 != v12)
    {
      v22 = 32 * ((v5 - v12) >> 5);
      v23 = v5 - 16;
      v24 = (uint64_t)&v6[32 * v8 - 16];
      do
      {
        *((_OWORD *)v23 - 1) = *(_OWORD *)(v24 + v22 - 16);
        *(_OWORD *)v23 = *(_OWORD *)(v24 + v22);
        v23 -= 32;
        v22 -= 32;
      }
      while (v22);
    }
    if (v9 <= (char *)a3)
      v3 = &a3[2 * (a1[1] > (char *)a3)];
    *(_OWORD *)v9 = *v3;
    *(_OWORD *)&v6[32 * v8 + 16] = v3[1];
  }
  return v9;
}

void sub_1AA8207D8(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::__tree<UIView *>::__erase_unique<UIView *>(uint64_t a1, unint64_t *a2)
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  BOOL v6;
  _QWORD *v7;

  v2 = *(_QWORD **)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = (uint64_t *)(a1 + 8);
  do
  {
    v5 = v2[4];
    v6 = v5 >= v3;
    if (v5 >= v3)
      v7 = v2;
    else
      v7 = v2 + 1;
    if (v6)
      v4 = v2;
    v2 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4])
    return 0;
  std::__tree<UIView *>::__remove_node_pointer((uint64_t **)a1, v4);
  operator delete(v4);
  return 1;
}

NSMutableArray *_NUIContainerViewCommonInit(NUIContainerView *a1)
{
  NSMutableArray *result;

  -[NUIContainerView setDebugBoundingBoxesEnabled:](a1, "setDebugBoundingBoxesEnabled:", objc_msgSend((id)objc_opt_class(), "isDebugBoundingBoxesEnabled"));
  result = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  a1->_arrangedSubviews = result;
  return result;
}

NSMutableArray *_NUIContainerGridViewCommonInit(NUIContainerGridView *a1)
{
  NSMutableArray *result;

  a1->_viewRows = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  a1->_arrangement.container = (_NUIGridArrangementContainer *)a1;
  a1->_columnWidth = 1.79769313e308;
  a1->_rowHeight = 1.79769313e308;
  __asm { FMOV            V0.2D, #6.0 }
  a1->_spacing = _Q0;
  *(_BYTE *)&a1->_gridViewFlags = 1;
  *((_BYTE *)&a1->_gridViewFlags + 1) = 1;
  a1->_columns = (NSMutableArray *)objc_opt_new();
  result = (NSMutableArray *)objc_opt_new();
  a1->_rows = result;
  return result;
}

void sub_1AA822C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,_QWORD *a32)
{
  uint64_t v32;

  _Block_object_dispose(&a25, 8);
  std::__tree<UIView *>::destroy(v32, a32);
  _Unwind_Resume(a1);
}

void sub_1AA822FC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t **std::__tree<std::__value_type<UIView *,std::pair<_NSRange,_NSRange> const>,std::__map_value_compare<UIView *,std::__value_type<UIView *,std::pair<_NSRange,_NSRange> const>,std::less<UIView *>,true>,std::allocator<std::__value_type<UIView *,std::pair<_NSRange,_NSRange> const>>>::__emplace_unique_key_args<UIView *,UIView * const&,std::pair<_NSRange,_NSRange>>(uint64_t **a1, unint64_t *a2, _QWORD *a3, _OWORD *a4)
{
  uint64_t *v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t **v10;
  unint64_t v11;
  char *v12;
  __int128 v13;

  v8 = a1 + 1;
  v7 = a1[1];
  if (v7)
  {
    v9 = *a2;
    while (1)
    {
      while (1)
      {
        v10 = (uint64_t **)v7;
        v11 = v7[4];
        if (v9 >= v11)
          break;
        v7 = *v10;
        v8 = v10;
        if (!*v10)
          goto LABEL_10;
      }
      if (v11 >= v9)
        break;
      v7 = v10[1];
      if (!v7)
      {
        v8 = v10 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v10 = a1 + 1;
LABEL_10:
    v12 = (char *)operator new(0x48uLL);
    *((_QWORD *)v12 + 4) = *a3;
    v13 = a4[1];
    *(_OWORD *)(v12 + 40) = *a4;
    *(_OWORD *)(v12 + 56) = v13;
    std::__tree<UIView *>::__insert_node_at(a1, (uint64_t)v10, v8, (uint64_t *)v12);
    return (uint64_t **)v12;
  }
  return v10;
}

double _NUIBoxArrangement::measureCells(_NUIBoxArrangement *this, CGSize a2)
{
  double width;
  vector<_NUIBoxArrangementCell, std::allocator<_NUIBoxArrangementCell>> *p_cells;
  _NUIBoxArrangementCell *end;
  _NUIBoxArrangementCell *begin;
  uint64_t v7;
  $9F875601C13A2EF903FF8A3268628107 *i;
  uint64_t v9;
  double baseLineFromTop;
  double baseLineFromBottom;
  char v12;
  _NUIBoxArrangementCell *v13;
  _NUIBoxArrangementCell *v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  _NUIBoxArrangementContainer *container;
  double v26;
  double v27;
  _NUIBoxArrangementContainer *v28;
  uint64_t v29;
  double v30;
  double height;

  height = a2.height;
  width = a2.width;
  begin = this->cells.__begin_;
  end = this->cells.__end_;
  p_cells = &this->cells;
  if (end == begin)
  {
    v7 = MEMORY[0x1E0C9D820];
    this->measureSize = (CGSize)*MEMORY[0x1E0C9D820];
    -[_NUIBoxArrangementContainer populateBoxArrangementCells:](this->container, "populateBoxArrangementCells:", p_cells);
    begin = this->cells.__begin_;
    end = this->cells.__end_;
    if (end == begin)
      return *(double *)v7;
  }
  this->maxBaseLinePair.baseLineFromTop = 0.0;
  this->maxBaseLinePair.baseLineFromBottom = 0.0;
  for (i = &this->maxBaseLinePair; begin != end; begin = (_NUIBoxArrangementCell *)((char *)begin + 64))
  {
    v9 = *((char *)begin + 57);
    if (v9 == 5)
    {
      objc_msgSend(*(id *)begin, "effectiveBaselineOffsetFromContentBottom", p_cells);
      *((double *)begin + 6) = baseLineFromBottom;
      if (baseLineFromBottom != 2.22507386e-308)
      {
        if (this->maxBaseLinePair.baseLineFromBottom > baseLineFromBottom)
          baseLineFromBottom = this->maxBaseLinePair.baseLineFromBottom;
        this->maxBaseLinePair.baseLineFromBottom = baseLineFromBottom;
      }
    }
    else if (v9 == 2)
    {
      objc_msgSend(*(id *)begin, "effectiveFirstBaselineOffsetFromContentTop", p_cells);
      *((double *)begin + 5) = baseLineFromTop;
      if (baseLineFromTop != 2.22507386e-308)
      {
        if (i->baseLineFromTop > baseLineFromTop)
          baseLineFromTop = i->baseLineFromTop;
        i->baseLineFromTop = baseLineFromTop;
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = -[_NUIBoxArrangementContainer canCancelMeasurementForCompression](this->container, "canCancelMeasurementForCompression");
  else
    v12 = 0;
  v13 = this->cells.__begin_;
  v14 = this->cells.__end_;
  if (v13 != v14)
  {
    v15 = -0.0;
    v16 = (double *)MEMORY[0x1E0C9D820];
    v17 = -0.0;
    while (1)
    {
      v18 = *((double *)v13 + 5);
      v19 = *((double *)v13 + 6);
      v20 = this->maxBaseLinePair.baseLineFromTop - v18 + 0.0;
      if (v18 == 2.22507386e-308)
        v20 = 0.0;
      v21 = this->maxBaseLinePair.baseLineFromBottom - v19;
      if (v19 == 2.22507386e-308)
        v21 = -0.0;
      v22 = v20 + v21;
      v23 = height - (v20 + v21);
      v24 = *(_QWORD *)v13;
      container = this->container;
      if ((v12 & 1) == 0)
        goto LABEL_31;
      -[_NUIBoxArrangementContainer contentLayoutSizeFittingSize:forArrangedSubview:](container, "contentLayoutSizeFittingSize:forArrangedSubview:", *(_QWORD *)v13, 10000.0, 10000.0);
      *((double *)v13 + 1) = v26;
      *((double *)v13 + 2) = v27;
      if (v26 > width)
        break;
      if (v27 > v23)
      {
        v28 = this->container;
        v29 = 1;
        goto LABEL_29;
      }
LABEL_32:
      v30 = v22 + v27;
      if (v26 > v15)
        v15 = v26;
      if (v30 > v17)
        v17 = v30;
      v13 = (_NUIBoxArrangementCell *)((char *)v13 + 64);
      if (v13 == v14)
        goto LABEL_39;
    }
    v28 = this->container;
    v29 = 0;
LABEL_29:
    if (-[_NUIBoxArrangementContainer shouldCancelMeasurementForCompressionInAxis:](v28, "shouldCancelMeasurementForCompressionInAxis:", v29))return *v16;
    v24 = *(_QWORD *)v13;
    container = this->container;
LABEL_31:
    -[_NUIBoxArrangementContainer contentLayoutSizeFittingSize:forArrangedSubview:](container, "contentLayoutSizeFittingSize:forArrangedSubview:", v24, width, v23);
    *((double *)v13 + 1) = v26;
    *((double *)v13 + 2) = v27;
    goto LABEL_32;
  }
  v15 = -0.0;
LABEL_39:
  this->hasValidMeasurement = 1;
  return v15;
}

void sub_1AA823EDC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 8) = v1;
  _Unwind_Resume(a1);
}

__n128 _NUIGridArrangementCell::_NUIGridArrangementCell(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 a7, __int16 a8)
{
  __n128 result;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 56) = a3;
  *(_QWORD *)(a1 + 64) = a4;
  *(_QWORD *)(a1 + 72) = a5;
  *(_QWORD *)(a1 + 80) = a6;
  *(_WORD *)(a1 + 104) = a7 | (unsigned __int16)(a8 << 8);
  result = *(__n128 *)MEMORY[0x1E0C9D820];
  *(_OWORD *)(a1 + 24) = *MEMORY[0x1E0C9D820];
  *(__n128 *)(a1 + 40) = result;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  return result;
}

void std::vector<_NUIGridArrangementCell>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((v4 - (_BYTE *)*a1) >> 4) < a2)
  {
    if (a2 >= 0x24924924924924ALL)
      abort();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 112;
    v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v3, a2);
    v7 = &v6[112 * v5];
    v9 = &v6[112 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_OWORD *)v10 - 7);
        v14 = *((_OWORD *)v10 - 5);
        *((_OWORD *)v12 - 6) = *((_OWORD *)v10 - 6);
        *((_OWORD *)v12 - 5) = v14;
        *((_OWORD *)v12 - 7) = v13;
        v15 = *((_OWORD *)v10 - 4);
        v16 = *((_OWORD *)v10 - 3);
        v17 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v17;
        *((_OWORD *)v12 - 4) = v15;
        *((_OWORD *)v12 - 3) = v16;
        v12 -= 112;
        v10 -= 112;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void std::vector<_NUIBoxArrangementCell>::emplace_back<UIView *&,NUIContainerAlignment &,NUIContainerAlignment &>(void **a1, uint64_t *a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v10 = a1[2];
  v8 = (uint64_t)(a1 + 2);
  v9 = v10;
  v11 = *(_QWORD *)(v8 - 8);
  if (v11 >= (unint64_t)v10)
  {
    v13 = (uint64_t)(v11 - (_QWORD)*a1) >> 6;
    if ((unint64_t)(v13 + 1) >> 58)
      abort();
    v14 = v9 - (_BYTE *)*a1;
    v15 = v14 >> 5;
    if (v14 >> 5 <= (unint64_t)(v13 + 1))
      v15 = v13 + 1;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFC0)
      v16 = 0x3FFFFFFFFFFFFFFLL;
    else
      v16 = v15;
    if (v16)
    {
      v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowArrangementCell>>(v8, v16);
      v19 = v18;
    }
    else
    {
      v17 = 0;
      v19 = 0;
    }
    _NUIFlowArrangementCell::_NUIFlowArrangementCell((uint64_t)&v17[64 * v13], *a2, *a3, *a4);
    v12 = v20 + 64;
    v22 = (char *)*a1;
    v21 = (char *)a1[1];
    if (v21 != *a1)
    {
      do
      {
        v23 = *((_OWORD *)v21 - 4);
        v24 = *((_OWORD *)v21 - 3);
        v25 = *((_OWORD *)v21 - 1);
        *((_OWORD *)v20 - 2) = *((_OWORD *)v21 - 2);
        *((_OWORD *)v20 - 1) = v25;
        *((_OWORD *)v20 - 4) = v23;
        *((_OWORD *)v20 - 3) = v24;
        v20 -= 64;
        v21 -= 64;
      }
      while (v21 != v22);
      v21 = (char *)*a1;
    }
    *a1 = v20;
    a1[1] = v12;
    a1[2] = &v17[64 * v19];
    if (v21)
      operator delete(v21);
  }
  else
  {
    _NUIFlowArrangementCell::_NUIFlowArrangementCell(*(_QWORD *)(v8 - 8), *a2, *a3, *a4);
    v12 = (void *)(v11 + 64);
    a1[1] = (void *)(v11 + 64);
  }
  a1[1] = v12;
}

void sub_1AA824330(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

__n128 _NUIFlowArrangementCell::_NUIFlowArrangementCell(uint64_t a1, uint64_t a2, unsigned __int8 a3, __int16 a4)
{
  __n128 *v4;
  __n128 result;

  *(_QWORD *)a1 = a2;
  v4 = (__n128 *)MEMORY[0x1E0C9D820];
  *(_OWORD *)(a1 + 8) = *MEMORY[0x1E0C9D820];
  result = *v4;
  *(__n128 *)(a1 + 24) = *v4;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 56) = a3 | (unsigned __int16)(a4 << 8);
  return result;
}

void _NUIBoxArrangement::_NUIBoxArrangement(_NUIBoxArrangement *this)
{
  this->cells.__begin_ = 0;
  this->cells.__end_ = 0;
  this->cells.__end_cap_.__value_ = 0;
  this->viewFrames.__end_ = 0;
  this->viewFrames.__end_cap_.__value_ = 0;
  this->viewFrames.__begin_ = 0;
  this->horzDist = 0;
  this->vertDist = 0;
  this->container = 0;
}

void _NUIBoxArrangement::positionCells(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[2];
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  void (*v29)(uint64_t, uint64_t, uint64_t);
  void *v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;

  if (*(_BYTE *)(a1 + 24))
  {
    v8 = a1 + 72;
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = (v9 - v10) >> 6;
    v12 = MEMORY[0x1E0C809B0];
    if (v11 != (uint64_t)(*(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72)) >> 5)
    {
      std::vector<CGRect>::resize(v8, v11);
      v28[0] = v12;
      v28[1] = 3221225472;
      v29 = ___ZN18_NUIBoxArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke;
      v30 = &__block_descriptor_72_e69_v24__0___NUIBoxArrangementCell___CGSize_dd__CGSize_dd____dd_b8b8_8Q16l;
      v31 = a1;
      v32 = a3;
      v33 = a4;
      v34 = a5;
      v35 = a6;
      v9 = *(_QWORD *)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      if (v9 == v17)
      {
        v10 = *(_QWORD *)(a1 + 32);
      }
      else
      {
        v18 = 0;
        do
        {
          v29((uint64_t)v28, v9, v18++);
          v9 += 64;
        }
        while (v9 != v17);
        v10 = *(_QWORD *)(a1 + 32);
        v9 = *(_QWORD *)(a1 + 40);
      }
    }
    v23[0] = v12;
    v23[1] = 3221225472;
    v24 = ___ZN18_NUIBoxArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke_2;
    v25 = &unk_1E57C6C78;
    v26 = a2;
    v27 = a1;
    if (v10 != v9)
    {
      v22 = 0;
      do
      {
        v24((uint64_t)v23, v10, v22++);
        v10 += 64;
      }
      while (v10 != v9);
    }
  }
  else
  {
    v19 = _NUIIsDebuggerAttached();
    v20 = _NUILog();
    v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        _NUIBoxArrangement::positionCells((uint64_t *)a1, v21);
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      _NUIBoxArrangement::positionCells((uint64_t *)a1, v21);
    }
  }
}

uint64_t ___ZN18_NUIBoxArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double *v3;

  v3 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) + 32 * a3);
  return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*v3, v3[1], v3[2], v3[3]);
}

void ___ZN18_NUIBoxArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  uint64_t v10;
  double MinX;
  double MinY;
  double Width;
  CGFloat v14;
  CGFloat MaxX;
  double v16;
  double Height;
  CGFloat v18;
  double MidY;
  CGFloat v20;
  double v21;
  double v22;
  double MaxY;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double MidX;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(double *)(a1 + 40);
  v6 = *(double *)(a1 + 48);
  v9 = *(double *)(a1 + 56);
  v8 = *(double *)(a1 + 64);
  v10 = (uint64_t)*(__int16 *)(a2 + 56) >> 8;
  v30 = *(double *)(v5 + 96);
  v31 = *(double *)(v5 + 104);
  v32 = *(double *)(a2 + 40);
  v33 = *(double *)(a2 + 48);
  MinX = *MEMORY[0x1E0C9D648];
  MinY = *(double *)(MEMORY[0x1E0C9D648] + 8);
  if (*(double *)(a2 + 8) >= v9)
    Width = *(double *)(a1 + 56);
  else
    Width = *(double *)(a2 + 8);
  if (*(double *)(a2 + 16) >= v8)
    v14 = *(double *)(a1 + 64);
  else
    v14 = *(double *)(a2 + 16);
  v34 = v14;
  switch(*(_WORD *)(a2 + 56))
  {
    case 0u:
      MinX = CGRectGetMinX(*(CGRect *)(a1 + 40));
      v36.origin.x = v7;
      v36.origin.y = v6;
      v36.size.width = v9;
      v36.size.height = v8;
      Width = CGRectGetWidth(v36);
      break;
    case 1u:
    case 2u:
      MinX = CGRectGetMinX(*(CGRect *)(a1 + 40));
      break;
    case 3u:
      MidX = CGRectGetMidX(*(CGRect *)(a1 + 40));
      v37.origin.x = MinX;
      v37.origin.y = MinY;
      v37.size.width = Width;
      v37.size.height = v14;
      MinX = MidX + CGRectGetWidth(v37) * -0.5;
      break;
    case 4u:
    case 5u:
      MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 40));
      v35.size.height = v14;
      v16 = MaxX;
      v35.origin.x = MinX;
      v35.origin.y = MinY;
      v35.size.width = Width;
      MinX = v16 - CGRectGetWidth(v35);
      break;
    default:
      break;
  }
  switch(v10)
  {
    case 0:
      v38.origin.x = v7;
      v38.origin.y = v6;
      v38.size.width = v9;
      v38.size.height = v8;
      MinY = CGRectGetMinY(v38);
      v39.origin.x = v7;
      v39.origin.y = v6;
      v39.size.width = v9;
      v39.size.height = v8;
      Height = CGRectGetHeight(v39);
      break;
    case 1:
      goto LABEL_16;
    case 2:
      if (v32 == 2.22507386e-308)
      {
LABEL_16:
        v41.origin.x = v7;
        v41.origin.y = v6;
        v41.size.width = v9;
        v41.size.height = v8;
        MinY = CGRectGetMinY(v41);
      }
      else
      {
        v40.origin.x = v7;
        v40.origin.y = v6;
        v40.size.width = v9;
        v40.size.height = v8;
        MinY = v30 + CGRectGetMinY(v40) - v32;
      }
      goto LABEL_17;
    case 3:
      v42.origin.x = v7;
      v42.origin.y = v6;
      v42.size.width = v9;
      v42.size.height = v8;
      v18 = Width;
      MidY = CGRectGetMidY(v42);
      v43.origin.x = MinX;
      v43.origin.y = MinY;
      v43.size.width = v18;
      Height = v34;
      v43.size.height = v34;
      MinY = MidY + CGRectGetHeight(v43) * -0.5;
      goto LABEL_22;
    case 4:
      goto LABEL_21;
    case 5:
      if (v33 == 2.22507386e-308)
      {
LABEL_21:
        v46.origin.x = v7;
        v46.origin.y = v6;
        v46.size.width = v9;
        v46.size.height = v8;
        v18 = Width;
        MaxY = CGRectGetMaxY(v46);
        v47.origin.x = MinX;
        v47.origin.y = MinY;
        v47.size.width = v18;
        Height = v34;
        v47.size.height = v34;
        MinY = MaxY - CGRectGetHeight(v47);
LABEL_22:
        Width = v18;
      }
      else
      {
        v44.origin.x = v7;
        v44.origin.y = v6;
        v44.size.width = v9;
        v44.size.height = v8;
        v20 = Width;
        v21 = CGRectGetMaxY(v44);
        v45.origin.x = MinX;
        v45.origin.y = MinY;
        v45.size.width = v20;
        Height = v34;
        v45.size.height = v34;
        v22 = v21 - CGRectGetHeight(v45);
        Width = v20;
        MinY = v22 - (v31 - v33);
      }
      break;
    default:
LABEL_17:
      Height = v34;
      break;
  }
  objc_msgSend(*(id *)v5, "layoutFrameForArrangedSubview:withProposedContentFrame:", *(_QWORD *)a2, MinX, MinY, Width, Height, *(_QWORD *)&MidX);
  v24 = (_QWORD *)(*(_QWORD *)(v5 + 72) + 32 * a3);
  *v24 = v25;
  v24[1] = v26;
  v24[2] = v27;
  v24[3] = v28;
}

uint64_t ___ZL30_NUIViewIsSwiftUISPICompatibleP6UIView_block_invoke()
{
  uint64_t result;

  _NUIViewIsSwiftUISPICompatible(UIView *)::checkedSet = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  result = objc_msgSend(MEMORY[0x1E0CEABB0], "instanceMethodForSelector:", sel__layoutSizeThatFits_fixedAxes_);
  _NUIViewIsSwiftUISPICompatible(UIView *)::baseLayoutSizeImp = result;
  return result;
}

BOOL std::__less<void,void>::operator()[abi:nn180100]<std::pair<CGSize,CGSize>,std::pair<CGSize,CGSize>>(uint64_t a1, double *a2, double *a3)
{
  double v3;
  double v4;
  double v6;

  v3 = *a2 - *a3;
  if (v3 < -0.001 || fabs(v3) < 0.001 && a2[1] - a3[1] < -0.001)
    return 1;
  v4 = *a3 - *a2;
  if (v4 < -0.001 || fabs(v4) < 0.001 && a3[1] - a2[1] < -0.001)
    return 0;
  v6 = a2[2] - a3[2];
  if (v6 < -0.001)
    return 1;
  if (fabs(v6) >= 0.001)
    return 0;
  return a2[3] - a3[3] < -0.001;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<CGSize,CGSize>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(32 * a2);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

void _NUIFlowArrangement::_NUIFlowArrangement(_NUIFlowArrangement *this)
{
  _NUIFlowContainer *v7;

  this->container = 0;
  *((_WORD *)this + 4) = 6;
  this->columns = 0;
  __asm { FMOV            V0.2D, #6.0 }
  *(_OWORD *)&this->rowSpacing = _Q0;
  this->rowHeight = 1.79769313e308;
  this->itemWidth = 1.79769313e308;
  *(_OWORD *)&this->cells.__begin_ = 0u;
  this->viewFrames.__begin_ = 0;
  this->viewFrames.__end_ = 0;
  this->viewFrames.__end_cap_.__value_ = 0;
  *(_OWORD *)&this->cells.__end_cap_.__value_ = 0u;
  *(_OWORD *)&this->rows.var0 = 0u;
  v7 = [_NUIFlowContainer alloc];
  if (v7)
  {
    v7 = -[_NUIFlowContainer init](v7, "init");
    if (v7)
    {
      v7->_flowArrangement = this;
      *((_BYTE *)&v7->_gridArrangement + 9) = *((_BYTE *)this + 9);
      v7->_gridArrangement.container = (_NUIGridArrangementContainer *)v7;
    }
  }
  this->flowContainer = v7;
}

void sub_1AA8268FC(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void **v4;
  void **v5;
  void *v7;

  v5 = v4;
  v7 = *v5;
  if (*v5)
  {
    *(_QWORD *)(v1 + 128) = v7;
    operator delete(v7);
  }
  _NUIFlowArrangement::_NUIFlowArrangement(v3, v2, v1);
  _Unwind_Resume(a1);
}

void _NUIFlowArrangement::~_NUIFlowArrangement(_NUIFlowArrangement *this)
{
  CGRect *begin;
  __end_ **v3;
  _NUIFlowArrangementCell *v4;

  _NUIFlowArrangement::resetForInvalidation(this, -1);

  begin = this->viewFrames.__begin_;
  if (begin)
  {
    this->viewFrames.__end_ = begin;
    operator delete(begin);
  }
  v3 = this->rows.__begin_;
  if (v3)
  {
    this->rows.var0 = v3;
    operator delete(v3);
  }
  v4 = this->cells.__begin_;
  if (v4)
  {
    this->cells.__end_ = v4;
    operator delete(v4);
  }
}

void sub_1AA8269C8(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v3;

  v3 = (void *)v1[15];
  if (v3)
  {
    v1[16] = v3;
    operator delete(v3);
  }
  _NUIFlowArrangement::~_NUIFlowArrangement(v1);
  _Unwind_Resume(a1);
}

_NUIGridArrangement *_NUIFlowArrangement::resetForInvalidation(_NUIFlowArrangement *this, uint64_t a2)
{
  __end_ **begin;
  __end_cap_ **var0;
  __end_cap_ *v5;
  _NUIGridArrangement *result;
  _NUIFlowArrangementCell *end;
  _NUIFlowArrangementCell *v8;
  CGSize *v9;

  if ((a2 & 7) != 0)
  {
    begin = this->rows.__begin_;
    var0 = this->rows.var0;
    if (begin != var0)
    {
      do
      {
        v5 = *begin++;

      }
      while (begin != var0);
      begin = this->rows.__begin_;
    }
    this->rows.var0 = begin;
    this->cells.__end_ = this->cells.__begin_;
    LOBYTE(a2) = -1;
  }
  else if (a2)
  {
    v8 = this->cells.__begin_;
    end = this->cells.__end_;
    if (v8 != end)
    {
      v9 = (CGSize *)MEMORY[0x1E0C9D820];
      do
      {
        v8->var1 = *v9;
        v8->var2 = *v9;
        v8->var3.var0 = 0.0;
        v8->var3.var1 = 0.0;
        ++v8;
      }
      while (v8 != end);
    }
  }
  result = _NUIGridArrangement::resetForInvalidation(&this->flowContainer->_gridArrangement, a2);
  this->viewFrames.__end_ = this->viewFrames.__begin_;
  return result;
}

void _NUIFlowArrangement::measureCells(_NUIFlowArrangement *this, int a2, CGSize a3)
{
  double height;
  CGFloat width;
  unint64_t columns;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _NUIFlowRowContainer *v13;
  _NUIFlowRowContainer *v14;
  __end_ *v15;
  id *value;
  __end_cap_ **var0;
  __end_cap_ **v18;
  __end_ **begin;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  __end_ **v25;
  __end_cap_ **v26;
  __end_ **v27;
  __end_ *v28;
  char v29;
  _NUIFlowArrangementCell *v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  double v34;
  double *v35;
  double v36;
  double v37;
  double itemWidth;
  id *p_var0;
  _NUIFlowArrangementContainer *container;
  double v41;
  double v42;
  double v43;
  double v44;
  _NUIFlowArrangementCell *v45;
  double *p_width;
  double v47;
  double v48;
  _NUIFlowArrangementCell *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  char v56;
  BOOL v57;
  char v58;
  _NUIFlowArrangementCell *v59;
  CGFloat v60;
  CGFloat v61;
  uint64_t v62;
  _NUIFlowRowContainer *v63;
  _NUIFlowRowContainer *v64;
  __end_ *v65;
  id *v66;
  __end_cap_ **v67;
  __end_cap_ **v68;
  _NUIFlowRowContainer *v69;
  _NUIFlowRowContainer *v70;
  __end_ *v71;
  id *v72;
  __end_cap_ **v73;
  __end_cap_ **v74;
  __end_ **v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  __end_ **v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char *v86;
  __end_ **v87;
  __end_cap_ **v88;
  __end_ **v89;
  __end_ *v90;
  __end_ **v91;
  __end_cap_ **v92;
  __end_ **v93;
  __end_ *v94;
  __end_ **v95;
  __end_cap_ **v96;
  uint64_t v97;
  uint64_t v98;
  _NUIFlowArrangementCell *v99;
  __end_ *v100;
  unint64_t v101;
  uint64_t v102;
  __end_ **v103;
  __end_cap_ **v104;
  uint64_t v105;
  __compressed_pair<_NUIFlowRowContainer **, std::allocator<_NUIFlowRowContainer *>> *p_var1;
  double v107;
  void *__p;
  void *v109;
  uint64_t v110;
  CGSize v111;

  height = a3.height;
  width = a3.width;
  if (a3.width != this->measuredWidth)
  {
    _NUIFlowArrangement::resetForInvalidation(this, 2);
    this->measuredWidth = width;
  }
  if (this->cells.__end_ != this->cells.__begin_
    || (-[_NUIFlowArrangementContainer populateFlowArrangementCells:](this->container, "populateFlowArrangementCells:", &this->cells), this->cells.__end_ != this->cells.__begin_))
  {
    if (this->rows.var0 != this->rows.__begin_)
    {
LABEL_116:
      _NUIGridArrangement::resetForInvalidation(&this->flowContainer->_gridArrangement, 0);
      *((_BYTE *)&this->flowContainer->_gridArrangement + 9) = *((_BYTE *)this + 9);
      v111.width = width;
      v111.height = height;
      _NUIGridArrangement::measureCells(&this->flowContainer->_gridArrangement, a2, v111);
      return;
    }
    if ((-[_NUIFlowContainer canUseSimpleGrid]((uint64_t)this->flowContainer) & 1) != 0)
    {
      *((_BYTE *)&this->flowContainer->_gridArrangement + 8) = *((_BYTE *)this + 8);
      *((_BYTE *)&this->flowContainer->_gridArrangement + 9) = *((_BYTE *)this + 9);
      goto LABEL_116;
    }
    columns = this->columns;
    if (columns)
    {
      v8 = (char *)this->cells.__end_ - (char *)this->cells.__begin_;
      if (v8)
      {
        v9 = 0;
        v10 = v8 >> 6;
        do
        {
          v11 = columns + v9;
          if (v10 >= v11)
            v12 = v11;
          else
            v12 = v10;
          v13 = [_NUIFlowRowContainer alloc];
          if (v13)
          {
            v14 = -[_NUIFlowRowContainer init](v13, "init");
            v15 = (__end_ *)v14;
            if (v14)
            {
              v14->_range.length = v12 - v9;
              v14->_flowArrangement = this;
              v14->_range.location = v9;
              v14->_gridArrangement.container = (_NUIGridArrangementContainer *)v14;
            }
          }
          else
          {
            v15 = 0;
          }
          var0 = this->rows.var0;
          value = this->rows.var1.__value_;
          if (var0 >= (__end_cap_ **)value)
          {
            begin = this->rows.__begin_;
            v20 = var0 - begin;
            if ((unint64_t)(v20 + 1) >> 61)
              goto LABEL_120;
            v21 = (char *)value - (char *)begin;
            v22 = v21 >> 2;
            if (v21 >> 2 <= (unint64_t)(v20 + 1))
              v22 = v20 + 1;
            if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8)
              v23 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v23 = v22;
            if (v23)
              v24 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>((uint64_t)&this->rows.var1, v23);
            else
              v24 = 0;
            v25 = (__end_ **)&v24[8 * v20];
            *v25 = v15;
            v18 = v25 + 1;
            v27 = this->rows.__begin_;
            v26 = this->rows.var0;
            if (v26 != v27)
            {
              do
              {
                v28 = *--v26;
                *--v25 = v28;
              }
              while (v26 != v27);
              v26 = this->rows.__begin_;
            }
            this->rows.__begin_ = v25;
            this->rows.var0 = v18;
            this->rows.var1.__value_ = (id *)&v24[8 * v23];
            if (v26)
              operator delete(v26);
          }
          else
          {
            *var0 = v15;
            v18 = var0 + 1;
          }
          this->rows.var0 = v18;
          columns = this->columns;
          v9 += columns;
          v10 = this->cells.__end_ - this->cells.__begin_;
        }
        while (v9 < v10);
      }
      goto LABEL_108;
    }
    v29 = objc_opt_respondsToSelector();
    v30 = this->cells.__begin_;
    if (this->cells.__end_ == v30)
    {
LABEL_108:
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v95 = this->rows.__begin_;
        v96 = this->rows.var0;
        if (v95 != v96)
        {
          v97 = 0;
          v98 = 0;
          do
          {
            v99 = this->cells.__begin_;
            v100 = v95[v98];
            v102 = *((_QWORD *)v100 + 15);
            v101 = *((_QWORD *)v100 + 16);
            v109 = 0;
            v110 = 0;
            __p = 0;
            std::vector<_NUIFlowArrangementCell>::__init_with_size[abi:nn180100]<std::__wrap_iter<_NUIFlowArrangementCell*>,std::__wrap_iter<_NUIFlowArrangementCell*>>((char *)&__p, (__int128 *)&v99[v102], (__int128 *)&v99[v101 + v102], v101);
            *((_BYTE *)v95[v98] + 16) = -[_NUIFlowArrangementContainer distributionForRowAtIndex:ofTotalRowCount:withCells:](this->container, "distributionForRowAtIndex:ofTotalRowCount:withCells:", v98, this->rows.var0 - this->rows.__begin_, &__p);
            if (__p)
            {
              v109 = __p;
              operator delete(__p);
            }
            ++v97;
            ++v98;
          }
          while (&v95[v97] != v96);
        }
      }
      else if (!this->columns)
      {
        v103 = this->rows.__begin_;
        v104 = this->rows.var0;
        while (v103 != v104)
        {
          v105 = (uint64_t)*v103++;
          *(_BYTE *)(v105 + 16) = *((_BYTE *)this + 8);
        }
      }
      goto LABEL_116;
    }
    v31 = v29;
    v32 = 0;
    v33 = 0;
    v34 = 1.79769313e308;
    p_var1 = &this->rows.var1;
    v35 = (double *)MEMORY[0x1E0C9D820];
    v36 = 0.001;
    v37 = width;
    while (1)
    {
      itemWidth = this->itemWidth;
      if (itemWidth != v34)
        goto LABEL_55;
      p_var0 = &v30[v33].var0;
      container = this->container;
      if ((v31 & 1) != 0)
      {
        -[_NUIFlowArrangementContainer fittingSizeForCell:withProposedSize:](this->container, "fittingSizeForCell:withProposedSize:", &v30[v33], width, height);
        v42 = v41;
        v44 = v43;
        container = this->container;
      }
      else
      {
        v44 = height;
        v42 = width;
      }
      v45 = &v30[v33];
      v47 = v45->var2.width;
      p_width = &v45->var2.width;
      v48 = v47;
      if (vabdd_f64(v47, *v35) < v36 && vabdd_f64(v30[v33].var2.height, v35[1]) < v36)
      {
LABEL_53:
        -[_NUIFlowArrangementContainer contentLayoutSizeFittingSize:forArrangedSubview:](container, "contentLayoutSizeFittingSize:forArrangedSubview:", *p_var0, v42, v44);
        v59 = &v30[v33];
        v59->var1.width = v60;
        v59->var1.height = v61;
        *p_width = v42;
        v59->var2.height = v44;
        goto LABEL_54;
      }
      v49 = &v30[v33];
      if (vabdd_f64(v48, v42) >= v36)
      {
        v107 = v44;
        v50 = v37;
        v51 = width;
        v52 = v36;
        v53 = height;
        v54 = v34;
        v55 = v42 - v49->var1.width;
        v56 = objc_msgSend(*p_var0, "isLayoutSizeDependentOnPerpendicularAxis");
        v57 = v55 < -0.001;
        v34 = v54;
        height = v53;
        v36 = v52;
        width = v51;
        v37 = v50;
        v44 = v107;
        if (v57)
          v58 = 1;
        else
          v58 = v56;
        if ((v58 & 1) != 0)
          goto LABEL_53;
      }
      else if (vabdd_f64(v49->var2.height, v44) < v36)
      {
        goto LABEL_54;
      }
      if (v44 - v30[v33].var1.height < -0.001)
        goto LABEL_53;
LABEL_54:
      itemWidth = v30[v33].var1.width;
LABEL_55:
      if (v33 > v32)
        itemWidth = itemWidth + this->itemSpacing;
      if (itemWidth > v37)
      {
        if (v33 == v32)
          v62 = 1;
        else
          v62 = v33 - v32;
        v63 = [_NUIFlowRowContainer alloc];
        if (v63)
        {
          v64 = -[_NUIFlowRowContainer init](v63, "init");
          v65 = (__end_ *)v64;
          if (v64)
          {
            v64->_range.length = v62;
            v64->_flowArrangement = this;
            v64->_range.location = v32;
            v64->_gridArrangement.container = (_NUIGridArrangementContainer *)v64;
          }
        }
        else
        {
          v65 = 0;
        }
        v67 = this->rows.var0;
        v66 = this->rows.var1.__value_;
        if (v67 >= (__end_cap_ **)v66)
        {
          v75 = this->rows.__begin_;
          v76 = v67 - v75;
          if ((unint64_t)(v76 + 1) >> 61)
            goto LABEL_120;
          v77 = (char *)v66 - (char *)v75;
          v78 = v77 >> 2;
          if (v77 >> 2 <= (unint64_t)(v76 + 1))
            v78 = v76 + 1;
          if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF8)
            v79 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v79 = v78;
          if (v79)
            v80 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>((uint64_t)p_var1, v79);
          else
            v80 = 0;
          v87 = (__end_ **)&v80[8 * v76];
          *v87 = v65;
          v68 = v87 + 1;
          v89 = this->rows.__begin_;
          v88 = this->rows.var0;
          if (v88 != v89)
          {
            do
            {
              v90 = *--v88;
              *--v87 = v90;
            }
            while (v88 != v89);
            v88 = this->rows.__begin_;
          }
          this->rows.__begin_ = v87;
          this->rows.var0 = v68;
          this->rows.var1.__value_ = (id *)&v80[8 * v79];
          if (v88)
            operator delete(v88);
        }
        else
        {
          *v67 = v65;
          v68 = v67 + 1;
        }
        this->rows.var0 = v68;
        v33 = v62 + v32;
LABEL_103:
        v37 = width;
        v32 = v33;
        goto LABEL_104;
      }
      if (v33 == this->cells.__end_ - this->cells.__begin_ - 1)
      {
        ++v33;
        v69 = [_NUIFlowRowContainer alloc];
        if (v69)
        {
          v70 = -[_NUIFlowRowContainer init](v69, "init");
          v71 = (__end_ *)v70;
          if (v70)
          {
            v70->_range.length = v33 - v32;
            v70->_flowArrangement = this;
            v70->_range.location = v32;
            v70->_gridArrangement.container = (_NUIGridArrangementContainer *)v70;
          }
        }
        else
        {
          v71 = 0;
        }
        v73 = this->rows.var0;
        v72 = this->rows.var1.__value_;
        if (v73 >= (__end_cap_ **)v72)
        {
          v81 = this->rows.__begin_;
          v82 = v73 - v81;
          if ((unint64_t)(v82 + 1) >> 61)
LABEL_120:
            abort();
          v83 = (char *)v72 - (char *)v81;
          v84 = v83 >> 2;
          if (v83 >> 2 <= (unint64_t)(v82 + 1))
            v84 = v82 + 1;
          if ((unint64_t)v83 >= 0x7FFFFFFFFFFFFFF8)
            v85 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v85 = v84;
          if (v85)
            v86 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>((uint64_t)p_var1, v85);
          else
            v86 = 0;
          v91 = (__end_ **)&v86[8 * v82];
          *v91 = v71;
          v74 = v91 + 1;
          v93 = this->rows.__begin_;
          v92 = this->rows.var0;
          if (v92 != v93)
          {
            do
            {
              v94 = *--v92;
              *--v91 = v94;
            }
            while (v92 != v93);
            v92 = this->rows.__begin_;
          }
          this->rows.__begin_ = v91;
          this->rows.var0 = v74;
          this->rows.var1.__value_ = (id *)&v86[8 * v85];
          if (v92)
            operator delete(v92);
        }
        else
        {
          *v73 = v71;
          v74 = v73 + 1;
        }
        this->rows.var0 = v74;
        goto LABEL_103;
      }
      v37 = v37 - itemWidth;
      ++v33;
LABEL_104:
      v30 = this->cells.__begin_;
      if (v33 >= this->cells.__end_ - v30)
        goto LABEL_108;
    }
  }
}

void sub_1AA827174(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void _NUIFlowArrangement::positionCells(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6;
  _QWORD v7[10];

  v6 = *(_QWORD *)(a1 + 104);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___ZN19_NUIFlowArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke;
  v7[3] = &unk_1E57C68A0;
  *(double *)&v7[6] = a3;
  *(double *)&v7[7] = a4;
  *(double *)&v7[8] = a5;
  *(double *)&v7[9] = a6;
  v7[4] = a2;
  v7[5] = a1;
  _NUIGridArrangement::positionCells(v6 + 8, (uint64_t)v7, a3, a4, a5, a6);
}

void ___ZN19_NUIFlowArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke(uint64_t *a1, uint64_t a2, double a3, double a4, CGFloat a5, CGFloat a6)
{
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  CGSize v21;

  v12 = a1[5];
  if (-[_NUIFlowContainer canUseSimpleGrid](*(_QWORD *)(v12 + 104)))
  {
    v13 = *(_QWORD *)(v12 + 104) + 8;
    v14 = *((double *)a1 + 6);
    v15 = *((double *)a1 + 7);
    v16 = *((double *)a1 + 8);
    v17 = *((double *)a1 + 9);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = ___ZN19_NUIFlowArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke_2;
    v20[3] = &unk_1E57C6878;
    v20[4] = a1[4];
    v18 = v20;
LABEL_5:
    _NUIGridArrangement::positionCells(v13, (uint64_t)v18, v14, v15, v16, v17);
    return;
  }
  _NUIGridArrangement::resetForInvalidation((_NUIGridArrangement *)(a2 + 8), 0);
  v21.width = a5;
  v21.height = a6;
  _NUIGridArrangement::measureCells((_NUIGridArrangement *)(a2 + 8), 1, v21);
  if (*(_BYTE *)(a2 + 16) == 1)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = ___ZN19_NUIFlowArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke_3;
    v19[3] = &unk_1E57C6878;
    v19[4] = a1[4];
    v18 = v19;
    v13 = a2 + 8;
    v14 = a3;
    v15 = a4;
    v16 = a5;
    v17 = a6;
    goto LABEL_5;
  }
  _NUIGridArrangement::positionCells(a2 + 8, a1[4], a3, a4, a5, a6);
}

uint64_t ___ZN19_NUIFlowArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t result;

  result = +[_NUIFlowArrangementDummyItem sharedDummyItem]();
  if (result != a2)
    return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(a3, a4, a5, a6);
  return result;
}

uint64_t ___ZN19_NUIFlowArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke_3(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t result;

  result = +[_NUIFlowArrangementDummyItem sharedDummyItem]();
  if (result != a2)
    return (*(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(a3, a4, a5, a6);
  return result;
}

void *_NUIFlowArrangementCell::debugDictionary(_NUIFlowArrangementCell *this)
{
  void *v2;
  double var0;
  double var1;
  void *v8;
  uint64_t *v9;
  const __CFString **v10;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", this->var0, CFSTR("item"));
  if (this->var1.width != *MEMORY[0x1E0C9D820] || this->var1.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
    objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &this->var1, "{CGSize=dd}"), CFSTR("size"));
  var0 = this->var3.var0;
  var1 = this->var3.var1;
  if (var0 != 0.0 && var0 != 2.22507386e-308)
  {
    if (var1 != 0.0 && var1 != 2.22507386e-308)
    {
      v19[0] = CFSTR("topOffset");
      v19[1] = CFSTR("bottomOffset");
      v20[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v20[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", var1);
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = v20;
      v10 = (const __CFString **)v19;
      v12 = 2;
      goto LABEL_23;
    }
    v17 = CFSTR("topOffset");
    v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v18;
    v10 = &v17;
LABEL_22:
    v12 = 1;
LABEL_23:
    v13 = objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, v12);
    if (v13)
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("baselines"));
    return v2;
  }
  if (var1 != 0.0 && var1 != 2.22507386e-308)
  {
    v15 = CFSTR("bottomOffset");
    v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", var1);
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v16;
    v10 = &v15;
    goto LABEL_22;
  }
  return v2;
}

void *_NUIFlowArrangement::debugDictionary(_NUIFlowArrangement *this)
{
  uint64_t v2;
  void *v3;
  double baseLineFromTop;
  double baseLineFromBottom;
  void *v8;
  uint64_t *v9;
  const __CFString **v10;
  uint64_t v12;
  void *v13;
  _NUIFlowArrangementCell *end;
  _NUIFlowArrangementCell *begin;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", CFSTR("_NUIFlowArrangement"), CFSTR("class"));
  baseLineFromTop = this->maxBaseLinePair.baseLineFromTop;
  baseLineFromBottom = this->maxBaseLinePair.baseLineFromBottom;
  if (baseLineFromTop == 0.0 || baseLineFromTop == 2.22507386e-308)
  {
    if (baseLineFromBottom == 0.0 || baseLineFromBottom == 2.22507386e-308)
      goto LABEL_20;
    v17 = CFSTR("bottomOffset");
    v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", baseLineFromBottom);
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v18;
    v10 = &v17;
  }
  else
  {
    if (baseLineFromBottom != 0.0 && baseLineFromBottom != 2.22507386e-308)
    {
      v21[0] = CFSTR("topOffset");
      v21[1] = CFSTR("bottomOffset");
      v22[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v22[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", baseLineFromBottom);
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = v22;
      v10 = (const __CFString **)v21;
      v12 = 2;
      goto LABEL_18;
    }
    v19 = CFSTR("topOffset");
    v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v20;
    v10 = &v19;
  }
  v12 = 1;
LABEL_18:
  v2 = objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, v12);
  if (v2)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("maxBaselines"));
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2, this->rowSpacing), CFSTR("rowSpacing"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", this->itemSpacing), CFSTR("itemSpacing"));
  if (this->cells.__end_ != this->cells.__begin_)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    begin = this->cells.__begin_;
    end = this->cells.__end_;
    while (begin != end)
      objc_msgSend(v13, "addObject:", _NUIFlowArrangementCell::debugDictionary(begin++));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("cells"));
  }
  return v3;
}

void sub_1AA827C24(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1AA827C2C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1AA827F80(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void sub_1AA828678(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1AA828680(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1AA828D0C(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(8 * a2);
}

char *std::vector<_NUIFlowArrangementCell>::__init_with_size[abi:nn180100]<std::__wrap_iter<_NUIFlowArrangementCell*>,std::__wrap_iter<_NUIFlowArrangementCell*>>(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  if (a4)
  {
    v6 = result;
    result = std::vector<_NUIFlowArrangementCell>::__vallocate[abi:nn180100](result, a4);
    v7 = (_OWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2;
      v9 = a2[1];
      v10 = a2[3];
      v7[2] = a2[2];
      v7[3] = v10;
      *v7 = v8;
      v7[1] = v9;
      v7 += 4;
      a2 += 4;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

char *std::vector<_NUIFlowArrangementCell>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 58)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowArrangementCell>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[64 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowArrangementCell>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(a2 << 6);
}

void *std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<objc_object  {objcproto18NUIArrangementItem}*,_NSRange,objc_object  {objcproto18NUIArrangementItem}*,NUIContainerAlignment,_NSRange>(void **a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, _QWORD *a5, _QWORD *a6)
{
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v15;
  _BYTE *v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void *v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v6 = (char *)*a1;
  v7 = 0x6DB6DB6DB6DB6DB7 * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 4);
  v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x249249249249249)
    abort();
  v16 = a1[2];
  v15 = (uint64_t)(a1 + 2);
  v17 = 0x6DB6DB6DB6DB6DB7 * ((v16 - v6) >> 4);
  if (2 * v17 > v8)
    v8 = 2 * v17;
  if (v17 >= 0x124924924924924)
    v18 = 0x249249249249249;
  else
    v18 = v8;
  if (v18)
  {
    v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v15, v18);
    v21 = v20;
  }
  else
  {
    v19 = 0;
    v21 = 0;
  }
  _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)&v19[112 * v7], *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  v23 = v22 + 112;
  v25 = (char *)*a1;
  v24 = (char *)a1[1];
  if (v24 != *a1)
  {
    do
    {
      v26 = *((_OWORD *)v24 - 7);
      v27 = *((_OWORD *)v24 - 5);
      *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
      *((_OWORD *)v22 - 5) = v27;
      *((_OWORD *)v22 - 7) = v26;
      v28 = *((_OWORD *)v24 - 4);
      v29 = *((_OWORD *)v24 - 3);
      v30 = *((_OWORD *)v24 - 1);
      *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
      *((_OWORD *)v22 - 1) = v30;
      *((_OWORD *)v22 - 4) = v28;
      *((_OWORD *)v22 - 3) = v29;
      v22 -= 112;
      v24 -= 112;
    }
    while (v24 != v25);
    v24 = (char *)*a1;
  }
  *a1 = v22;
  a1[1] = v23;
  a1[2] = &v19[112 * v21];
  if (v24)
    operator delete(v24);
  return v23;
}

void sub_1AA82907C(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x24924924924924ALL)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(112 * a2);
}

void *std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<_NUIFlowArrangementDummyItem *,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>(void **a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, _QWORD *a5, _QWORD *a6)
{
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v15;
  _BYTE *v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void *v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v6 = (char *)*a1;
  v7 = 0x6DB6DB6DB6DB6DB7 * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 4);
  v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x249249249249249)
    abort();
  v16 = a1[2];
  v15 = (uint64_t)(a1 + 2);
  v17 = 0x6DB6DB6DB6DB6DB7 * ((v16 - v6) >> 4);
  if (2 * v17 > v8)
    v8 = 2 * v17;
  if (v17 >= 0x124924924924924)
    v18 = 0x249249249249249;
  else
    v18 = v8;
  if (v18)
  {
    v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v15, v18);
    v21 = v20;
  }
  else
  {
    v19 = 0;
    v21 = 0;
  }
  _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)&v19[112 * v7], *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  v23 = v22 + 112;
  v25 = (char *)*a1;
  v24 = (char *)a1[1];
  if (v24 != *a1)
  {
    do
    {
      v26 = *((_OWORD *)v24 - 7);
      v27 = *((_OWORD *)v24 - 5);
      *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
      *((_OWORD *)v22 - 5) = v27;
      *((_OWORD *)v22 - 7) = v26;
      v28 = *((_OWORD *)v24 - 4);
      v29 = *((_OWORD *)v24 - 3);
      v30 = *((_OWORD *)v24 - 1);
      *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
      *((_OWORD *)v22 - 1) = v30;
      *((_OWORD *)v22 - 4) = v28;
      *((_OWORD *)v22 - 3) = v29;
      v22 -= 112;
      v24 -= 112;
    }
    while (v24 != v25);
    v24 = (char *)*a1;
  }
  *a1 = v22;
  a1[1] = v23;
  a1[2] = &v19[112 * v21];
  if (v24)
    operator delete(v24);
  return v23;
}

void sub_1AA829240(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(56 * a2);
}

void std::vector<_NUIGridArrangementCell>::__construct_one_at_end[abi:nn180100]<_NUIFlowRowContainer * const&,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t v7;

  v7 = *(_QWORD *)(a1 + 8);
  _NUIGridArrangementCell::_NUIGridArrangementCell(v7, *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  *(_QWORD *)(a1 + 8) = v7 + 112;
}

void sub_1AA8292F4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void *std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<_NUIFlowRowContainer * const&,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>(void **a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, _QWORD *a5, _QWORD *a6)
{
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v15;
  _BYTE *v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void *v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v6 = (char *)*a1;
  v7 = 0x6DB6DB6DB6DB6DB7 * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 4);
  v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x249249249249249)
    abort();
  v16 = a1[2];
  v15 = (uint64_t)(a1 + 2);
  v17 = 0x6DB6DB6DB6DB6DB7 * ((v16 - v6) >> 4);
  if (2 * v17 > v8)
    v8 = 2 * v17;
  if (v17 >= 0x124924924924924)
    v18 = 0x249249249249249;
  else
    v18 = v8;
  if (v18)
  {
    v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v15, v18);
    v21 = v20;
  }
  else
  {
    v19 = 0;
    v21 = 0;
  }
  _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)&v19[112 * v7], *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  v23 = v22 + 112;
  v25 = (char *)*a1;
  v24 = (char *)a1[1];
  if (v24 != *a1)
  {
    do
    {
      v26 = *((_OWORD *)v24 - 7);
      v27 = *((_OWORD *)v24 - 5);
      *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
      *((_OWORD *)v22 - 5) = v27;
      *((_OWORD *)v22 - 7) = v26;
      v28 = *((_OWORD *)v24 - 4);
      v29 = *((_OWORD *)v24 - 3);
      v30 = *((_OWORD *)v24 - 1);
      *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
      *((_OWORD *)v22 - 1) = v30;
      *((_OWORD *)v22 - 4) = v28;
      *((_OWORD *)v22 - 3) = v29;
      v22 -= 112;
      v24 -= 112;
    }
    while (v24 != v25);
    v24 = (char *)*a1;
  }
  *a1 = v22;
  a1[1] = v23;
  a1[2] = &v19[112 * v21];
  if (v24)
    operator delete(v24);
  return v23;
}

void sub_1AA829460(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void OUTLINED_FUNCTION_0(void *__p)
{
  operator delete(__p);
}

void _NUIArrangementInvalidRect(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  CGRect v20;

  v19 = *MEMORY[0x1E0C80C00];
  if (_NUIArrangementLogger(void)::onceToken != -1)
    dispatch_once(&_NUIArrangementLogger(void)::onceToken, &__block_literal_global_0);
  v12 = _NUIArrangementLogger(void)::_log;
  if (os_log_type_enabled((os_log_t)_NUIArrangementLogger(void)::_log, OS_LOG_TYPE_ERROR))
  {
    v20.origin.x = a3;
    v20.origin.y = a4;
    v20.size.width = a5;
    v20.size.height = a6;
    v13 = 138412802;
    v14 = a1;
    v15 = 2112;
    v16 = NSStringFromCGRect(v20);
    v17 = 2112;
    v18 = a2;
    _os_log_error_impl(&dword_1AA816000, v12, OS_LOG_TYPE_ERROR, "A container %@ has an invalid rect %@ for item %@. Break on _NUIArrangementInvalidRect to debug.", (uint8_t *)&v13, 0x20u);
  }
}

void _NUIArrangementInvalidSize(uint64_t a1, double a2, double a3)
{
  NSObject *v6;

  if (_NUIArrangementLogger(void)::onceToken != -1)
    dispatch_once(&_NUIArrangementLogger(void)::onceToken, &__block_literal_global_0);
  v6 = _NUIArrangementLogger(void)::_log;
  if (os_log_type_enabled((os_log_t)_NUIArrangementLogger(void)::_log, OS_LOG_TYPE_ERROR))
    _NUIArrangementInvalidSize_cold_1(a1, v6, a2, a3);
}

double _NUIGridArrangement::unionFrameForSubsetCells(_NUIGridArrangement *this, _NSRange a2, _NSRange a3, CGRect a4)
{
  __int128 v4;
  double v5;
  _QWORD v7[5];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  __n128 (*v11)(uint64_t, uint64_t);
  uint64_t (*v12)();
  void *v13;
  __int128 v14;
  __int128 v15;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x5012000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = &unk_1AA8398D5;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v14 = *MEMORY[0x1E0C9D648];
  v15 = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___ZN19_NUIGridArrangement24unionFrameForSubsetCellsE8_NSRangeS0_6CGRect_block_invoke;
  v7[3] = &unk_1E57C6960;
  v7[4] = &v8;
  _NUIGridArrangement::positionSubsetCells((uint64_t)this, a2.location, a2.length, a3.location, a3.length, (uint64_t)v7, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = v9[6];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_1AA8299D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void ___ZN19_NUIGridArrangement24unionFrameForSubsetCellsE8_NSRangeS0_6CGRect_block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGRect v5;

  v5.size.height = a5;
  v5.size.width = a4;
  v5.origin.y = a3;
  v5.origin.x = a2;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 48), v5);
}

double _NUIGridArrangement::frameForColumnsAndRows(_NUIGridArrangement *this, _NSRange a2, _NSRange a3, CGRect a4)
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger v11;
  double v13;
  double v14;
  double *v15;
  NSUInteger v16;
  double v17;
  _NUIGridArrangementDimension *begin;
  NSUInteger v19;
  double v20;
  double v21;
  double *v22;
  NSUInteger v23;
  double v24;
  _NUIGridArrangementDimension *v25;
  double v26;
  NSUInteger v27;
  double v28;
  double *v29;
  NSUInteger v30;
  double v31;
  NSUInteger v32;
  double *v33;
  double v34;
  double v35;
  double v36;
  double *v37;
  NSUInteger v38;
  double v39;
  double *v40;
  NSUInteger v41;
  double v42;
  double MinX;
  CGRect v45;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  length = a3.length;
  location = a3.location;
  v10 = a2.length;
  v11 = a2.location;
  v13 = 0.0;
  v14 = 0.0;
  if ((uint64_t)a2.location >= 1)
  {
    v15 = (double *)((char *)this->columns.__begin_ + 8);
    v16 = a2.location;
    do
    {
      v17 = *v15;
      v15 += 7;
      v14 = v14 + v17;
      --v16;
    }
    while (v16);
  }
  if (a2.location)
  {
    begin = this->columns.__begin_;
    v13 = 0.0;
    v19 = a2.location;
    do
    {
      v20 = *(double *)begin;
      begin = (_NUIGridArrangementDimension *)((char *)begin + 56);
      v13 = v13 + v20;
      --v19;
    }
    while (v19);
  }
  MinX = CGRectGetMinX(a4);
  v21 = 0.0;
  if ((uint64_t)location >= 1)
  {
    v22 = (double *)((char *)this->rows.__begin_ + 8);
    v23 = location;
    do
    {
      v24 = *v22;
      v22 += 7;
      v21 = v21 + v24;
      --v23;
    }
    while (v23);
  }
  if (location)
  {
    v25 = this->rows.__begin_;
    v26 = 0.0;
    v27 = location;
    do
    {
      v26 = v26 + *(double *)v25;
      if (this->baselineRelative)
        v26 = v26 - *((double *)v25 + 11) - *((double *)v25 + 5);
      v25 = (_NUIGridArrangementDimension *)((char *)v25 + 56);
      --v27;
    }
    while (v27);
  }
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  CGRectGetMinY(v45);
  v28 = 0.0;
  if (v11 < v11 + v10)
  {
    v29 = (double *)((char *)this->columns.__begin_ + 56 * v11 + 8);
    v30 = v10;
    do
    {
      v31 = *v29;
      v29 += 7;
      v28 = v28 + v31;
      --v30;
    }
    while (v30);
  }
  if (v11 < v10 + v11 - 1)
  {
    v32 = v10 - 1;
    v33 = (double *)((char *)this->columns.__begin_ + 56 * v11);
    v34 = 0.0;
    do
    {
      v35 = *v33;
      v33 += 7;
      v34 = v34 + v35;
      --v32;
    }
    while (v32);
  }
  v36 = 0.0;
  if (location < location + length)
  {
    v37 = (double *)((char *)this->rows.__begin_ + 56 * location + 8);
    v38 = length;
    do
    {
      v39 = *v37;
      v37 += 7;
      v36 = v36 + v39;
      --v38;
    }
    while (v38);
  }
  if (location < length + location - 1)
  {
    v40 = (double *)((char *)this->rows.__begin_ + 56 * location);
    v41 = length - 1;
    v42 = 0.0;
    do
    {
      v42 = v42 + *v40;
      if (this->baselineRelative)
        v42 = v42 - v40[11] - v40[5];
      v40 += 7;
      --v41;
    }
    while (v41);
  }
  return v14 + v13 + MinX;
}

uint64_t _NUIGridArrangement::enumerateCells(uint64_t result, uint64_t a2)
{
  __int128 *v2;
  __int128 *i;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[7];

  v2 = *(__int128 **)(result + 16);
  for (i = *(__int128 **)(result + 24); v2 != i; v2 += 7)
  {
    v5 = *v2;
    v6 = v2[2];
    v10[1] = v2[1];
    v10[2] = v6;
    v10[0] = v5;
    v7 = v2[3];
    v8 = v2[4];
    v9 = v2[6];
    v10[5] = v2[5];
    v10[6] = v9;
    v10[3] = v7;
    v10[4] = v8;
    result = (*(uint64_t (**)(uint64_t, _OWORD *))(a2 + 16))(a2, v10);
  }
  return result;
}

void *_NUIGridArrangementCell::debugDictionary(_NUIGridArrangementCell *this)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  uint64_t *v11;
  const __CFString **v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[2];
  _QWORD v17[2];
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", *(_QWORD *)this, CFSTR("item"));
  if (*((double *)this + 3) != *MEMORY[0x1E0C9D820] || *((double *)this + 4) != *(double *)(MEMORY[0x1E0C9D820] + 8))
    objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", (char *)this + 24, "{CGSize=dd}"), CFSTR("size"));
  v16[0] = CFSTR("column");
  v4 = *((_QWORD *)this + 7);
  if (*((_QWORD *)this + 8) < 2uLL)
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  else
    v5 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v4);
  v16[1] = CFSTR("row");
  v17[0] = v5;
  v6 = *((_QWORD *)this + 9);
  if (*((_QWORD *)this + 10) < 2uLL)
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  else
    v7 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v6);
  v17[1] = v7;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2), CFSTR("span"));
  v8 = *((double *)this + 11);
  v9 = *((double *)this + 12);
  if (v8 == 0.0 || v8 == 2.22507386e-308)
  {
    if (v9 == 0.0 || v9 == 2.22507386e-308)
      return v2;
    v18 = CFSTR("bottomOffset");
    v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9, 2.22507386e-308);
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = &v19;
    v12 = &v18;
  }
  else
  {
    if (v9 != 0.0 && v9 != 2.22507386e-308)
    {
      v22[0] = CFSTR("topOffset");
      v23[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v22[1] = CFSTR("bottomOffset");
      v23[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v23;
      v12 = (const __CFString **)v22;
      v13 = 2;
      goto LABEL_22;
    }
    v20 = CFSTR("topOffset");
    v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = &v21;
    v12 = &v20;
  }
  v13 = 1;
LABEL_22:
  v14 = objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, v13);
  if (v14)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("baselines"));
  return v2;
}

void *_NUIGridArrangementDimension::debugDictionary(_NUIGridArrangementDimension *this)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t *v8;
  const __CFString **v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];
  _QWORD v14[2];
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned __int16 *)this + 24)), CFSTR("index"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)this + 1)), CFSTR("length"));
  v3 = *(double *)this;
  if (*(double *)this != 0.0)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3), CFSTR("spacingAfter"));
  v13[0] = CFSTR("hugging");
  LODWORD(v3) = *((_DWORD *)this + 7);
  v13[1] = CFSTR("compression");
  v14[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  LODWORD(v4) = *((_DWORD *)this + 6);
  v14[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2), CFSTR("priorities"));
  v5 = *((double *)this + 4);
  v6 = *((double *)this + 5);
  if (v5 == 0.0 || v5 == 2.22507386e-308)
  {
    if (v6 == 0.0 || v6 == 2.22507386e-308)
      return v2;
    v15 = CFSTR("bottomOffset");
    v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6, 2.22507386e-308);
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = &v16;
    v9 = &v15;
  }
  else
  {
    if (v6 != 0.0 && v6 != 2.22507386e-308)
    {
      v19[0] = CFSTR("topOffset");
      v20[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v19[1] = CFSTR("bottomOffset");
      v20[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
      v7 = (void *)MEMORY[0x1E0C99D80];
      v8 = v20;
      v9 = (const __CFString **)v19;
      v10 = 2;
      goto LABEL_13;
    }
    v17 = CFSTR("topOffset");
    v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = &v18;
    v9 = &v17;
  }
  v10 = 1;
LABEL_13:
  v11 = objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, v10);
  if (v11)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("baselines"));
  return v2;
}

void *_NUIGridArrangement::debugDictionary(_NUIGridArrangement *this)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _NUIGridArrangementCell *begin;
  _NUIGridArrangementCell *end;
  void *v10;
  _NUIGridArrangementDimension *v11;
  _NUIGridArrangementDimension *v12;
  void *v13;
  _NUIGridArrangementDimension *v14;
  _NUIGridArrangementDimension *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", CFSTR("_NUIGridArrangement"), CFSTR("class"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", this->baselineRelative), CFSTR("baselineRelative"));
  v17[0] = CFSTR("horizontal");
  v3 = *((char *)this + 8);
  if (NUIStringFromDistribution(NUIContainerDistribution)::onceToken != -1)
    dispatch_once(&NUIStringFromDistribution(NUIContainerDistribution)::onceToken, &__block_literal_global_111);
  v4 = objc_msgSend((id)NUIStringFromDistribution(NUIContainerDistribution)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3));
  if (!v4)
    v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), v3, v17[0]);
  v17[1] = CFSTR("vertical");
  v18[0] = v4;
  v5 = *((char *)this + 9);
  if (NUIStringFromDistribution(NUIContainerDistribution)::onceToken != -1)
    dispatch_once(&NUIStringFromDistribution(NUIContainerDistribution)::onceToken, &__block_literal_global_111);
  v6 = objc_msgSend((id)NUIStringFromDistribution(NUIContainerDistribution)::dict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5));
  if (!v6)
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown(%ld)"), v5);
  v18[1] = v6;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2), CFSTR("distributions"));
  if (this->cells.__end_ != this->cells.__begin_)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    begin = this->cells.__begin_;
    end = this->cells.__end_;
    while (begin != end)
    {
      objc_msgSend(v7, "addObject:", _NUIGridArrangementCell::debugDictionary(begin));
      begin = (_NUIGridArrangementCell *)((char *)begin + 112);
    }
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("cells"));
  }
  if (this->columns.__end_ != this->columns.__begin_)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = this->columns.__begin_;
    v12 = this->columns.__end_;
    while (v11 != v12)
    {
      objc_msgSend(v10, "addObject:", _NUIGridArrangementDimension::debugDictionary(v11));
      v11 = (_NUIGridArrangementDimension *)((char *)v11 + 56);
    }
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("columns"));
  }
  if (this->rows.__end_ != this->rows.__begin_)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = this->rows.__begin_;
    v14 = this->rows.__end_;
    while (v15 != v14)
    {
      objc_msgSend(v13, "addObject:", _NUIGridArrangementDimension::debugDictionary(v15));
      v15 = (_NUIGridArrangementDimension *)((char *)v15 + 56);
    }
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("rows"));
  }
  return v2;
}

os_log_t ___ZL21_NUIArrangementLoggerv_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.AppSupportUI", "arrangement");
  _NUIArrangementLogger(void)::_log = (uint64_t)result;
  return result;
}

__n128 __Block_byref_object_copy__102(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

_QWORD *std::__insertion_sort[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(_QWORD *result, _QWORD *a2, _BYTE *a3)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  _BOOL4 v25;
  int v26;

  if (result == a2)
    return result;
  v3 = result + 3;
  if (result + 3 == a2)
    return result;
  v4 = 0;
  v5 = result;
  do
  {
    v6 = v5;
    v5 = v3;
    if (*a3)
      v7 = 8;
    else
      v7 = 12;
    v9 = v6[2];
    v8 = v6[3];
    v10 = *(float *)(v8 + v7) - *(float *)(*v6 + v7);
    v11 = v6[5];
    v12 = v11 - v9;
    if (a3[1])
    {
      v13 = v12 < 0;
      if (v10 != 0.0)
        v13 = v10 > 0.0;
      if (!v13)
        goto LABEL_34;
    }
    else
    {
      v14 = v12 < 0;
      if (v11 == v9)
        v15 = v10 > 0.0;
      else
        v15 = v14;
      if (!v15)
        goto LABEL_34;
    }
    v16 = v6[4];
    *(_OWORD *)v5 = *(_OWORD *)v6;
    v5[2] = v6[2];
    v17 = result;
    if (v6 == result)
      goto LABEL_33;
    v18 = v4;
    while (1)
    {
      v19 = (char *)result + v18;
      if (*a3)
        v20 = 8;
      else
        v20 = 12;
      v21 = *(float *)(v8 + v20) - *(float *)(*(_QWORD *)((char *)result + v18 - 24) + v20);
      v22 = *((_QWORD *)v19 - 1);
      v23 = v11 - v22;
      if (a3[1])
      {
        v24 = v23 < 0;
        if (v21 != 0.0)
          v24 = v21 > 0.0;
        if (!v24)
        {
          v17 = v6;
          goto LABEL_33;
        }
        goto LABEL_30;
      }
      v25 = v23 < 0;
      v26 = v11 == v22 ? v21 > 0.0 : v25;
      if (v26 != 1)
        break;
LABEL_30:
      v6 -= 3;
      *(_OWORD *)v19 = *(_OWORD *)((char *)result + v18 - 24);
      *((_QWORD *)v19 + 2) = *(_QWORD *)((char *)result + v18 - 8);
      v18 -= 24;
      if (!v18)
      {
        v17 = result;
        goto LABEL_33;
      }
    }
    v17 = (_QWORD *)((char *)result + v18);
LABEL_33:
    *v17 = v8;
    v17[1] = v16;
    v17[2] = v11;
LABEL_34:
    v3 = v5 + 3;
    v4 += 24;
  }
  while (v5 + 3 != a2);
  return result;
}

_QWORD *std::__insertion_sort_unguarded[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(_QWORD *result, _QWORD *a2, unsigned __int8 *a3)
{
  _QWORD *v3;
  int v4;
  int v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;

  if (result != a2)
  {
    v3 = result + 3;
    if (result + 3 != a2)
    {
      v4 = *a3;
      v5 = a3[1];
      do
      {
        v6 = result;
        result = v3;
        if (v4)
          v7 = 8;
        else
          v7 = 12;
        v9 = v6[2];
        v8 = v6[3];
        v10 = *(float *)(v8 + v7) - *(float *)(*v6 + v7);
        v11 = v6[5];
        v12 = v11 - v9;
        if (v5)
        {
          v13 = v12 < 0;
          if (v10 != 0.0)
            v13 = v10 > 0.0;
          if (v13)
            goto LABEL_15;
        }
        else
        {
          v14 = v10 > 0.0;
          v15 = v12 < 0;
          if (v11 != v9)
            v14 = v15;
          if (v14)
          {
LABEL_15:
            v16 = v6[4];
            do
            {
              while (1)
              {
                v17 = v6;
                *(_OWORD *)(v6 + 3) = *(_OWORD *)v6;
                v18 = v6[2];
                v20 = *(v6 - 3);
                v6 -= 3;
                v19 = v20;
                v17[5] = v18;
                v4 = *a3;
                v21 = *a3 ? 8 : 12;
                v22 = *(float *)(v8 + v21) - *(float *)(v19 + v21);
                v23 = *(v17 - 1);
                v24 = v11 - v23;
                v5 = a3[1];
                if (!a3[1])
                  break;
                v25 = v24 < 0;
                if (v22 != 0.0)
                  v25 = v22 > 0.0;
                if (!v25)
                  goto LABEL_28;
              }
              v26 = v24 < 0;
              if (v11 == v23)
                v27 = v22 > 0.0;
              else
                v27 = v26;
            }
            while (v27);
LABEL_28:
            *v17 = v8;
            v17[1] = v16;
            v17[2] = v11;
            goto LABEL_30;
          }
          v5 = 0;
        }
LABEL_30:
        v3 = result + 3;
      }
      while (result + 3 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(_QWORD *a1, _QWORD *a2, _QWORD *a3, _BYTE *a4)
{
  uint64_t v4;
  float v5;
  float v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  BOOL v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;
  _BOOL4 v20;
  _BOOL4 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  float v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  _BOOL4 v41;
  _BOOL4 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  _BOOL4 v46;
  _BOOL4 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;

  if (*a4)
    v4 = 8;
  else
    v4 = 12;
  v5 = *(float *)(*a2 + v4);
  v6 = v5 - *(float *)(*a1 + v4);
  v7 = a2[2];
  v8 = a1[2];
  v9 = v7 - v8;
  v10 = *(float *)(*a3 + v4) - v5;
  v11 = a3[2];
  v12 = v11 - v7;
  if (!a4[1])
  {
    v18 = v9 < 0;
    if (v7 == v8)
      v19 = v6 > 0.0;
    else
      v19 = v18;
    v20 = v12 < 0;
    if (v11 == v7)
      v21 = v10 > 0.0;
    else
      v21 = v20;
    if (v19)
    {
      if (v21)
        goto LABEL_11;
      goto LABEL_20;
    }
    if (v21)
    {
LABEL_28:
      v31 = a2[2];
      v32 = *(_OWORD *)a2;
      v33 = a3[2];
      *(_OWORD *)a2 = *(_OWORD *)a3;
      a2[2] = v33;
      *(_OWORD *)a3 = v32;
      a3[2] = v31;
      v34 = 8;
      if (!*a4)
        v34 = 12;
      v35 = *(float *)(*a2 + v34) - *(float *)(*a1 + v34);
      v36 = a2[2];
      v37 = a1[2];
      v38 = v36 - v37;
      if (a4[1])
      {
        v39 = v38 < 0;
        if (v35 != 0.0)
          v39 = v35 > 0.0;
        if (!v39)
          return 1;
      }
      else
      {
        v46 = v38 < 0;
        if (v36 == v37)
          v47 = v35 > 0.0;
        else
          v47 = v46;
        if (!v47)
          return 1;
      }
      v48 = a1[2];
      v49 = *(_OWORD *)a1;
      v50 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v50;
      *(_OWORD *)a2 = v49;
      a2[2] = v48;
      return 2;
    }
    return 0;
  }
  v13 = v6 > 0.0;
  if (v6 == 0.0)
    v13 = v9 < 0;
  v14 = v12 < 0;
  if (v10 != 0.0)
    v14 = v10 > 0.0;
  if (!v13)
  {
    if (v14)
      goto LABEL_28;
    return 0;
  }
  if (!v14)
  {
LABEL_20:
    v22 = a1[2];
    v23 = *(_OWORD *)a1;
    v24 = a2[2];
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = v24;
    *(_OWORD *)a2 = v23;
    a2[2] = v22;
    v25 = 8;
    if (!*a4)
      v25 = 12;
    v26 = *(float *)(*a3 + v25) - *(float *)(*a2 + v25);
    v27 = a3[2];
    v28 = a2[2];
    v29 = v27 - v28;
    if (a4[1])
    {
      v30 = v29 < 0;
      if (v26 != 0.0)
        v30 = v26 > 0.0;
      if (!v30)
        return 1;
    }
    else
    {
      v41 = v29 < 0;
      if (v27 == v28)
        v42 = v26 > 0.0;
      else
        v42 = v41;
      if (!v42)
        return 1;
    }
    v43 = a2[2];
    v44 = *(_OWORD *)a2;
    v45 = a3[2];
    *(_OWORD *)a2 = *(_OWORD *)a3;
    a2[2] = v45;
    *(_OWORD *)a3 = v44;
    a3[2] = v43;
    return 2;
  }
LABEL_11:
  v15 = a1[2];
  v16 = *(_OWORD *)a1;
  v17 = a3[2];
  *(_OWORD *)a1 = *(_OWORD *)a3;
  a1[2] = v17;
  *(_OWORD *)a3 = v16;
  a3[2] = v15;
  return 1;
}

_QWORD *std::__partition_with_equals_on_left[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell *,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &>(uint64_t *a1, _QWORD *a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  float v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  _QWORD *v12;
  _QWORD *i;
  uint64_t v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  _BOOL4 v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  uint64_t v30;
  float v31;
  uint64_t v32;
  BOOL v33;
  _BOOL4 v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  float v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  float v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  _BOOL4 v48;
  _BOOL4 v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  float v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  BOOL v57;
  BOOL v58;
  __int128 v59;
  __int128 v61;
  uint64_t v62;

  v3 = *a1;
  v4 = a1[2];
  v5 = 8;
  if (!*a3)
    v5 = 12;
  v6 = *(float *)(v3 + v5);
  v7 = *(a2 - 3);
  v8 = v6 - *(float *)(v7 + v5);
  v9 = *(a2 - 1);
  v10 = v4 - v9;
  if (a3[1])
  {
    v11 = v10 < 0;
    if (v8 != 0.0)
      v11 = v8 > 0.0;
    if (v11)
      goto LABEL_7;
  }
  else
  {
    v22 = v10 < 0;
    if (v4 == v9)
      v22 = v8 > 0.0;
    if (v22)
    {
LABEL_7:
      v12 = a1 + 3;
      do
      {
        while (1)
        {
          i = v12;
          v14 = *v12;
          v15 = *a3 ? 8 : 12;
          v16 = v6 - *(float *)(v14 + v15);
          v17 = i[2];
          v18 = v4 - v17;
          v12 = i + 3;
          if (a3[1])
            break;
          v20 = v18 < 0;
          if (v4 == v17)
            v21 = v16 > 0.0;
          else
            v21 = v20;
          if (v21)
            goto LABEL_38;
        }
        v19 = v18 < 0;
        if (v16 != 0.0)
          v19 = v16 > 0.0;
      }
      while (!v19);
      goto LABEL_38;
    }
  }
  for (i = a1 + 3; i < a2; i += 3)
  {
    if (*a3)
      v23 = 8;
    else
      v23 = 12;
    v24 = v6 - *(float *)(*i + v23);
    v25 = i[2];
    v26 = v4 - v25;
    if (a3[1])
    {
      v27 = v26 < 0;
      if (v24 != 0.0)
        v27 = v24 > 0.0;
      if (v27)
        break;
    }
    else
    {
      v28 = v26 < 0;
      if (v4 == v25)
        v29 = v24 > 0.0;
      else
        v29 = v28;
      if (v29)
        break;
    }
  }
LABEL_38:
  if (i < a2)
  {
    for (a2 -= 3; ; v9 = a2[2])
    {
      if (*a3)
        v30 = 8;
      else
        v30 = 12;
      v31 = v6 - *(float *)(v7 + v30);
      v32 = v4 - v9;
      if (a3[1])
      {
        v33 = v32 < 0;
        if (v31 != 0.0)
          v33 = v31 > 0.0;
        if (!v33)
          break;
      }
      else
      {
        v34 = v32 < 0;
        if (v4 == v9)
          v35 = v31 > 0.0;
        else
          v35 = v34;
        if (!v35)
          break;
      }
      v36 = *(a2 - 3);
      a2 -= 3;
      v7 = v36;
    }
  }
  v37 = a1[1];
  while (i < a2)
  {
    v62 = i[2];
    v61 = *(_OWORD *)i;
    v38 = *(_OWORD *)a2;
    i[2] = a2[2];
    *(_OWORD *)i = v38;
    a2[2] = v62;
    *(_OWORD *)a2 = v61;
    if (*a3)
      v39 = 8;
    else
      v39 = 12;
    v40 = *(float *)(v3 + v39);
    v41 = i + 3;
    do
    {
      while (1)
      {
        i = v41;
        v42 = *v41;
        v43 = *a3 ? 8 : 12;
        v44 = v40 - *(float *)(v42 + v43);
        v45 = i[2];
        v46 = v4 - v45;
        v41 = i + 3;
        if (a3[1])
          break;
        v48 = v46 < 0;
        if (v4 == v45)
          v49 = v44 > 0.0;
        else
          v49 = v48;
        if (v49)
          goto LABEL_70;
      }
      v47 = v46 < 0;
      if (v44 != 0.0)
        v47 = v44 > 0.0;
    }
    while (!v47);
LABEL_70:
    v50 = a2 - 3;
    do
    {
      while (1)
      {
        a2 = v50;
        v51 = *v50;
        v52 = *a3 ? 8 : 12;
        v53 = v40 - *(float *)(v51 + v52);
        v54 = a2[2];
        v55 = v4 - v54;
        v50 = a2 - 3;
        if (a3[1])
          break;
        v57 = v55 < 0;
        if (v4 == v54)
          v58 = v53 > 0.0;
        else
          v58 = v57;
        if (!v58)
          goto LABEL_83;
      }
      v56 = v55 < 0;
      if (v53 != 0.0)
        v56 = v53 > 0.0;
    }
    while (v56);
LABEL_83:
    ;
  }
  if (i - 3 != a1)
  {
    v59 = *(_OWORD *)(i - 3);
    a1[2] = *(i - 1);
    *(_OWORD *)a1 = v59;
  }
  *(i - 3) = v3;
  *(i - 2) = v37;
  *(i - 1) = v4;
  return i;
}

unint64_t std::__partition_with_equals_on_right[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell *,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &>(uint64_t *a1, _QWORD *a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  _BOOL4 v14;
  _BOOL4 v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  _BOOL4 v24;
  _BOOL4 v25;
  uint64_t v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  _BOOL4 v31;
  unint64_t v33;
  _QWORD *v34;
  __int128 v35;
  uint64_t v36;
  float v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  float v41;
  uint64_t v42;
  uint64_t v43;
  BOOL v44;
  BOOL v45;
  BOOL v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  float v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  _BOOL4 v54;
  _BOOL4 v55;
  __int128 v56;
  __int128 v58;
  uint64_t v59;

  v3 = 0;
  v4 = *a1;
  v5 = a1[1];
  v6 = a1[2];
  if (*a3)
    v7 = 8;
  else
    v7 = 12;
  v8 = *(float *)(v4 + v7);
  while (1)
  {
    v9 = *a3 ? 8 : 12;
    v10 = *(float *)(a1[v3 + 3] + v9) - v8;
    v11 = a1[v3 + 5];
    v12 = v11 - v6;
    if (a3[1])
      break;
    v14 = v12 < 0;
    if (v11 == v6)
      v15 = v10 > 0.0;
    else
      v15 = v14;
    if (!v15)
      goto LABEL_18;
LABEL_17:
    v3 += 3;
  }
  v13 = v12 < 0;
  if (v10 != 0.0)
    v13 = v10 > 0.0;
  if (v13)
    goto LABEL_17;
LABEL_18:
  v16 = (unint64_t)&a1[v3 + 3];
  if (v3 * 8)
  {
    v17 = a2 - 3;
    do
    {
      while (1)
      {
        a2 = v17;
        v18 = *v17;
        v19 = *a3 ? 8 : 12;
        v20 = *(float *)(v18 + v19) - v8;
        v21 = a2[2];
        v22 = v21 - v6;
        v17 = a2 - 3;
        if (a3[1])
          break;
        v24 = v22 < 0;
        if (v21 == v6)
          v25 = v20 > 0.0;
        else
          v25 = v24;
        if (v25)
          goto LABEL_49;
      }
      v23 = v22 < 0;
      if (v20 != 0.0)
        v23 = v20 > 0.0;
    }
    while (!v23);
  }
  else if (v16 < (unint64_t)a2)
  {
    for (a2 -= 3; ; a2 -= 3)
    {
      v26 = *a3 ? 8 : 12;
      v27 = *(float *)(*a2 + v26) - v8;
      v28 = a2[2];
      v29 = v28 - v6;
      if (a3[1])
      {
        v30 = v29 >= 0;
        if (v27 != 0.0)
          v30 = v27 <= 0.0;
      }
      else
      {
        v31 = v29 >= 0;
        v30 = v28 == v6 ? v27 <= 0.0 : v31;
      }
      if (v30 != 1 || v16 >= (unint64_t)a2)
        break;
    }
  }
LABEL_49:
  if (v16 >= (unint64_t)a2)
  {
    v33 = (unint64_t)&a1[v3 + 3];
  }
  else
  {
    v33 = (unint64_t)&a1[v3 + 3];
    v34 = a2;
    do
    {
      v59 = *(_QWORD *)(v33 + 16);
      v58 = *(_OWORD *)v33;
      v35 = *(_OWORD *)v34;
      *(_QWORD *)(v33 + 16) = v34[2];
      *(_OWORD *)v33 = v35;
      v34[2] = v59;
      *(_OWORD *)v34 = v58;
      if (*a3)
        v36 = 8;
      else
        v36 = 12;
      v37 = *(float *)(v4 + v36);
      v38 = (uint64_t *)(v33 + 24);
      do
      {
        while (1)
        {
          v33 = (unint64_t)v38;
          v39 = *v38;
          v40 = *a3 ? 8 : 12;
          v41 = *(float *)(v39 + v40) - v37;
          v42 = *(_QWORD *)(v33 + 16);
          v43 = v42 - v6;
          v38 = (uint64_t *)(v33 + 24);
          if (a3[1])
            break;
          v45 = v43 < 0;
          if (v42 == v6)
            v46 = v41 > 0.0;
          else
            v46 = v45;
          if (!v46)
            goto LABEL_67;
        }
        v44 = v43 < 0;
        if (v41 != 0.0)
          v44 = v41 > 0.0;
      }
      while (v44);
LABEL_67:
      v47 = v34 - 3;
      do
      {
        while (1)
        {
          v34 = v47;
          v48 = *v47;
          v49 = *a3 ? 8 : 12;
          v50 = *(float *)(v48 + v49) - v37;
          v51 = v34[2];
          v52 = v51 - v6;
          v47 = v34 - 3;
          if (a3[1])
            break;
          v54 = v52 < 0;
          if (v51 == v6)
            v55 = v50 > 0.0;
          else
            v55 = v54;
          if (v55)
            goto LABEL_80;
        }
        v53 = v52 < 0;
        if (v50 != 0.0)
          v53 = v50 > 0.0;
      }
      while (!v53);
LABEL_80:
      ;
    }
    while (v33 < (unint64_t)v34);
  }
  if ((uint64_t *)(v33 - 24) != a1)
  {
    v56 = *(_OWORD *)(v33 - 24);
    a1[2] = *(_QWORD *)(v33 - 8);
    *(_OWORD *)a1 = v56;
  }
  *(_QWORD *)(v33 - 24) = v4;
  *(_QWORD *)(v33 - 16) = v5;
  *(_QWORD *)(v33 - 8) = v6;
  return v33 - 24;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(_QWORD *a1, _QWORD *a2, _BYTE *a3)
{
  unint64_t v6;
  _BOOL8 result;
  _OWORD *v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  _BOOL4 v26;
  _BOOL4 v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  _BOOL4 v36;
  _BOOL4 v37;
  _BOOL4 v38;
  _BOOL4 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;

  v6 = 0xAAAAAAAAAAAAAAABLL * (a2 - a1);
  result = 1;
  switch(v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v8 = a2 - 3;
      v9 = 8;
      if (!*a3)
        v9 = 12;
      v10 = *(float *)(*(a2 - 3) + v9) - *(float *)(*a1 + v9);
      v11 = *(a2 - 1);
      v12 = a1[2];
      v13 = v11 - v12;
      if (a3[1])
      {
        v14 = v13 < 0;
        if (v10 != 0.0)
          v14 = v10 > 0.0;
        if (v14)
        {
LABEL_52:
          v40 = a1[2];
          v41 = *(_OWORD *)a1;
          v42 = *(a2 - 1);
          *(_OWORD *)a1 = *v8;
          a1[2] = v42;
          *v8 = v41;
          *(a2 - 1) = v40;
        }
      }
      else
      {
        v38 = v13 < 0;
        if (v11 == v12)
          v39 = v10 > 0.0;
        else
          v39 = v38;
        if (v39)
          goto LABEL_52;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(a1, a1 + 3, a2 - 3, a3);
      return 1;
    case 4uLL:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(a1, a1 + 3, a1 + 6, a2 - 3, a3);
      return 1;
    case 5uLL:
      std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(a1, a1 + 3, a1 + 6, a1 + 9, a2 - 3, a3);
      return 1;
    default:
      v15 = a1 + 6;
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(a1, a1 + 3, a1 + 6, a3);
      v16 = a1 + 9;
      if (a1 + 9 == a2)
        return 1;
      v17 = 0;
      v18 = 0;
      break;
  }
LABEL_11:
  v19 = *v16;
  if (*a3)
    v20 = 8;
  else
    v20 = 12;
  v21 = *(float *)(v19 + v20) - *(float *)(*v15 + v20);
  v22 = v16[2];
  v23 = v15[2];
  v24 = v22 - v23;
  if (a3[1])
  {
    v25 = v24 < 0;
    if (v21 != 0.0)
      v25 = v21 > 0.0;
    if (!v25)
      goto LABEL_41;
  }
  else
  {
    v26 = v24 < 0;
    if (v22 == v23)
      v27 = v21 > 0.0;
    else
      v27 = v26;
    if (!v27)
      goto LABEL_41;
  }
  v28 = v16[1];
  *(_OWORD *)v16 = *(_OWORD *)v15;
  v16[2] = v15[2];
  v29 = a1;
  if (v15 == a1)
    goto LABEL_40;
  v30 = v17;
  while (1)
  {
    if (*a3)
      v31 = 8;
    else
      v31 = 12;
    v32 = *(float *)(v19 + v31) - *(float *)(*(_QWORD *)((char *)a1 + v30 + 24) + v31);
    v33 = *(_QWORD *)((char *)a1 + v30 + 40);
    v34 = v22 - v33;
    if (a3[1])
    {
      v35 = v34 < 0;
      if (v32 != 0.0)
        v35 = v32 > 0.0;
      if (!v35)
      {
        v29 = v15;
        goto LABEL_40;
      }
    }
    else
    {
      v36 = v34 < 0;
      if (v22 == v33)
        v37 = v32 > 0.0;
      else
        v37 = v36;
      if (!v37)
      {
        v29 = (_QWORD *)((char *)a1 + v30 + 48);
LABEL_40:
        *v29 = v19;
        v29[1] = v28;
        v29[2] = v22;
        if (++v18 == 8)
          return v16 + 3 == a2;
LABEL_41:
        v15 = v16;
        v17 += 24;
        v16 += 3;
        if (v16 == a2)
          return 1;
        goto LABEL_11;
      }
    }
    v15 -= 3;
    *(_OWORD *)((char *)a1 + v30 + 48) = *(_OWORD *)((char *)a1 + v30 + 24);
    *(_QWORD *)((char *)a1 + v30 + 64) = *(_QWORD *)((char *)a1 + v30 + 40);
    v30 -= 24;
    if (v30 == -48)
    {
      v29 = a1;
      goto LABEL_40;
    }
  }
}

uint64_t std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _BYTE *a5)
{
  uint64_t result;
  uint64_t v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  _BOOL4 v17;
  _BOOL4 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  _BOOL4 v28;
  _BOOL4 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  _BOOL4 v42;
  _BOOL4 v43;

  result = std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(a1, a2, a3, a5);
  v11 = 8;
  if (!*a5)
    v11 = 12;
  v12 = *(float *)(*a4 + v11) - *(float *)(*a3 + v11);
  v13 = a4[2];
  v14 = a3[2];
  v15 = v13 - v14;
  if (!a5[1])
  {
    v17 = v15 < 0;
    if (v13 == v14)
      v18 = v12 > 0.0;
    else
      v18 = v17;
    if (!v18)
      return result;
LABEL_12:
    v19 = a3[2];
    v20 = *(_OWORD *)a3;
    v21 = a4[2];
    *(_OWORD *)a3 = *(_OWORD *)a4;
    a3[2] = v21;
    *(_OWORD *)a4 = v20;
    a4[2] = v19;
    v22 = 8;
    if (!*a5)
      v22 = 12;
    v23 = *(float *)(*a3 + v22) - *(float *)(*a2 + v22);
    v24 = a3[2];
    v25 = a2[2];
    v26 = v24 - v25;
    if (a5[1])
    {
      v27 = v26 < 0;
      if (v23 != 0.0)
        v27 = v23 > 0.0;
      if (!v27)
        return result;
    }
    else
    {
      v28 = v26 < 0;
      if (v24 == v25)
        v29 = v23 > 0.0;
      else
        v29 = v28;
      if (!v29)
        return result;
    }
    v30 = a2[2];
    v31 = *(_OWORD *)a2;
    v32 = a3[2];
    *(_OWORD *)a2 = *(_OWORD *)a3;
    a2[2] = v32;
    *(_OWORD *)a3 = v31;
    a3[2] = v30;
    v33 = 8;
    if (!*a5)
      v33 = 12;
    v34 = *(float *)(*a2 + v33) - *(float *)(*a1 + v33);
    v35 = a2[2];
    v36 = a1[2];
    v37 = v35 - v36;
    if (a5[1])
    {
      v38 = v37 < 0;
      if (v34 != 0.0)
        v38 = v34 > 0.0;
      if (!v38)
        return result;
    }
    else
    {
      v42 = v37 < 0;
      if (v35 == v36)
        v43 = v34 > 0.0;
      else
        v43 = v42;
      if (!v43)
        return result;
    }
    v39 = a1[2];
    v40 = *(_OWORD *)a1;
    v41 = a2[2];
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = v41;
    *(_OWORD *)a2 = v40;
    a2[2] = v39;
    return result;
  }
  v16 = v15 < 0;
  if (v12 != 0.0)
    v16 = v12 > 0.0;
  if (v16)
    goto LABEL_12;
  return result;
}

uint64_t std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _BYTE *a6)
{
  uint64_t result;
  uint64_t v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  _BOOL4 v19;
  _BOOL4 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  _BOOL4 v30;
  _BOOL4 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  _BOOL4 v41;
  _BOOL4 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  float v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  _BOOL4 v55;
  _BOOL4 v56;

  result = std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(a1, a2, a3, a4, a6);
  v13 = 8;
  if (!*a6)
    v13 = 12;
  v14 = *(float *)(*a5 + v13) - *(float *)(*a4 + v13);
  v15 = a5[2];
  v16 = a4[2];
  v17 = v15 - v16;
  if (!a6[1])
  {
    v19 = v17 < 0;
    if (v15 == v16)
      v20 = v14 > 0.0;
    else
      v20 = v19;
    if (!v20)
      return result;
LABEL_12:
    v21 = a4[2];
    v22 = *(_OWORD *)a4;
    v23 = a5[2];
    *(_OWORD *)a4 = *(_OWORD *)a5;
    a4[2] = v23;
    *(_OWORD *)a5 = v22;
    a5[2] = v21;
    v24 = 8;
    if (!*a6)
      v24 = 12;
    v25 = *(float *)(*a4 + v24) - *(float *)(*a3 + v24);
    v26 = a4[2];
    v27 = a3[2];
    v28 = v26 - v27;
    if (a6[1])
    {
      v29 = v28 < 0;
      if (v25 != 0.0)
        v29 = v25 > 0.0;
      if (!v29)
        return result;
    }
    else
    {
      v30 = v28 < 0;
      if (v26 == v27)
        v31 = v25 > 0.0;
      else
        v31 = v30;
      if (!v31)
        return result;
    }
    v32 = a3[2];
    v33 = *(_OWORD *)a3;
    v34 = a4[2];
    *(_OWORD *)a3 = *(_OWORD *)a4;
    a3[2] = v34;
    *(_OWORD *)a4 = v33;
    a4[2] = v32;
    v35 = 8;
    if (!*a6)
      v35 = 12;
    v36 = *(float *)(*a3 + v35) - *(float *)(*a2 + v35);
    v37 = a3[2];
    v38 = a2[2];
    v39 = v37 - v38;
    if (a6[1])
    {
      v40 = v39 < 0;
      if (v36 != 0.0)
        v40 = v36 > 0.0;
      if (!v40)
        return result;
    }
    else
    {
      v41 = v39 < 0;
      if (v37 == v38)
        v42 = v36 > 0.0;
      else
        v42 = v41;
      if (!v42)
        return result;
    }
    v43 = a2[2];
    v44 = *(_OWORD *)a2;
    v45 = a3[2];
    *(_OWORD *)a2 = *(_OWORD *)a3;
    a2[2] = v45;
    *(_OWORD *)a3 = v44;
    a3[2] = v43;
    v46 = 8;
    if (!*a6)
      v46 = 12;
    v47 = *(float *)(*a2 + v46) - *(float *)(*a1 + v46);
    v48 = a2[2];
    v49 = a1[2];
    v50 = v48 - v49;
    if (a6[1])
    {
      v51 = v50 < 0;
      if (v47 != 0.0)
        v51 = v47 > 0.0;
      if (!v51)
        return result;
    }
    else
    {
      v55 = v50 < 0;
      if (v48 == v49)
        v56 = v47 > 0.0;
      else
        v56 = v55;
      if (!v56)
        return result;
    }
    v52 = a1[2];
    v53 = *(_OWORD *)a1;
    v54 = a2[2];
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = v54;
    *(_OWORD *)a2 = v53;
    a2[2] = v52;
    return result;
  }
  v18 = v17 < 0;
  if (v14 != 0.0)
    v18 = v14 > 0.0;
  if (v18)
    goto LABEL_12;
  return result;
}

__n128 *std::__partial_sort_impl[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(__n128 *a1, __n128 *a2, __n128 *a3, _BYTE *a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  __n128 *v13;
  __n128 *v14;
  uint64_t v15;
  float v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  BOOL v20;
  unint64_t v21;
  __n128 v22;
  unint64_t v23;
  _BOOL4 v24;
  _BOOL4 v25;
  int64_t v26;
  __n128 *v27;
  __n128 *v28;
  __n128 v29;
  __n128 v32;
  unint64_t v33;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = ((char *)a2 - (char *)a1) / 24;
    if ((char *)a2 - (char *)a1 >= 25)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = (uint64_t *)a1 + 3 * v10;
      do
      {
        std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>((uint64_t)a1, a4, v9, v12);
        v12 -= 3;
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      while (1)
      {
        if (*a4)
          v15 = 8;
        else
          v15 = 12;
        v16 = *(float *)(v14->n128_u64[0] + v15) - *(float *)(a1->n128_u64[0] + v15);
        v17 = v14[1].n128_i64[0];
        v18 = a1[1].n128_u64[0];
        v19 = v17 - v18;
        if (a4[1])
        {
          v20 = v19 < 0;
          if (v16 != 0.0)
            v20 = v16 > 0.0;
          if (!v20)
            goto LABEL_15;
        }
        else
        {
          v24 = v19 < 0;
          if (v17 == v18)
            v25 = v16 > 0.0;
          else
            v25 = v24;
          if (!v25)
            goto LABEL_15;
        }
        v21 = v14[1].n128_u64[0];
        v22 = *v14;
        v23 = a1[1].n128_u64[0];
        *v14 = *a1;
        v14[1].n128_u64[0] = v23;
        *a1 = v22;
        a1[1].n128_u64[0] = v21;
        std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>((uint64_t)a1, a4, v9, (uint64_t *)a1);
LABEL_15:
        v14 = (__n128 *)((char *)v14 + 24);
        if (v14 == a3)
        {
          v13 = a3;
          break;
        }
      }
    }
    if (v8 >= 25)
    {
      v26 = v8 / 0x18uLL;
      v27 = (__n128 *)((char *)a2 - 24);
      do
      {
        v32 = *a1;
        v33 = a1[1].n128_u64[0];
        std::__floyd_sift_down[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(a1, a4, v26);
        if (v27 == v28)
        {
          *v28 = v32;
          v28[1].n128_u64[0] = v33;
        }
        else
        {
          v29 = *v27;
          v28[1].n128_u64[0] = v27[1].n128_u64[0];
          *v28 = v29;
          *v27 = v32;
          v27[1].n128_u64[0] = v33;
          std::__sift_up[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>((uint64_t)a1, (uint64_t)&v28[1].n128_i64[1], a4, 0xAAAAAAAAAAAAAAABLL * ((&v28[1].n128_i8[8] - (__int8 *)a1) >> 3));
        }
        v27 = (__n128 *)((char *)v27 - 24);
      }
      while (v26-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(uint64_t result, _BYTE *a2, uint64_t a3, uint64_t *a4)
{
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  uint64_t v25;
  __int128 v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  float v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  BOOL v40;
  BOOL v41;
  __int128 v42;
  _BOOL4 v43;
  _BOOL4 v44;

  if (a3 < 2)
    return result;
  v4 = (unint64_t)(a3 - 2) >> 1;
  if (v4 < (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - result) >> 3)))
    return result;
  v5 = (0x5555555555555556 * (((uint64_t)a4 - result) >> 3)) | 1;
  v6 = (_QWORD *)(result + 24 * v5);
  if (0x5555555555555556 * (((uint64_t)a4 - result) >> 3) + 2 >= a3)
  {
    v12 = a2[1];
    goto LABEL_18;
  }
  v7 = 8;
  if (!*a2)
    v7 = 12;
  v8 = *(float *)(*v6 + v7) - *(float *)(v6[3] + v7);
  v9 = *(_QWORD *)(result + 24 * v5 + 16);
  v10 = v6[5];
  v11 = v9 - v10;
  v12 = a2[1];
  if (a2[1])
  {
    v13 = v11 < 0;
    if (v8 != 0.0)
      v13 = v8 > 0.0;
    if (!v13)
    {
      v12 = 1;
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  v14 = v11 < 0;
  if (v9 == v10)
    v15 = v8 > 0.0;
  else
    v15 = v14;
  if (v15)
  {
LABEL_16:
    v6 += 3;
    v5 = 0x5555555555555556 * (((uint64_t)a4 - result) >> 3) + 2;
    goto LABEL_18;
  }
  v12 = 0;
LABEL_18:
  v16 = 12;
  if (*a2)
    v16 = 8;
  v17 = *a4;
  v18 = *(float *)(*v6 + v16) - *(float *)(*a4 + v16);
  v19 = v6[2];
  v20 = a4[2];
  v21 = v19 - v20;
  if (v12)
  {
    v22 = v21 < 0;
    if (v18 != 0.0)
      v22 = v18 > 0.0;
    if (v22)
      return result;
  }
  else
  {
    v23 = v18 > 0.0;
    v24 = v21 < 0;
    if (v19 != v20)
      v23 = v24;
    if (v23)
      return result;
  }
  v25 = a4[1];
  v26 = *(_OWORD *)v6;
  a4[2] = v6[2];
  *(_OWORD *)a4 = v26;
  if (v4 >= v5)
  {
    while (1)
    {
      v28 = 2 * v5;
      v5 = (2 * v5) | 1;
      v27 = (_QWORD *)(result + 24 * v5);
      if (v28 + 2 >= a3)
        goto LABEL_41;
      if (*a2)
        v29 = 8;
      else
        v29 = 12;
      v30 = *(float *)(*v27 + v29) - *(float *)(v27[3] + v29);
      v31 = *(_QWORD *)(result + 24 * v5 + 16);
      v32 = v27[5];
      v33 = v31 - v32;
      if (a2[1])
      {
        v34 = v33 < 0;
        if (v30 != 0.0)
          v34 = v30 > 0.0;
        if (v34)
        {
LABEL_40:
          v27 += 3;
          v5 = v28 + 2;
        }
      }
      else
      {
        v43 = v33 < 0;
        if (v31 == v32)
          v44 = v30 > 0.0;
        else
          v44 = v43;
        if (v44)
          goto LABEL_40;
      }
LABEL_41:
      if (*a2)
        v35 = 8;
      else
        v35 = 12;
      v36 = *(float *)(*v27 + v35) - *(float *)(v17 + v35);
      v37 = v27[2];
      v38 = v37 - v20;
      if (a2[1])
      {
        v39 = v38 < 0;
        if (v36 != 0.0)
          v39 = v36 > 0.0;
        if (v39)
          break;
      }
      else
      {
        v40 = v36 > 0.0;
        v41 = v38 < 0;
        if (v37 != v20)
          v40 = v41;
        if (v40)
          break;
      }
      v42 = *(_OWORD *)v27;
      v6[2] = v27[2];
      *(_OWORD *)v6 = v42;
      v6 = v27;
      if (v4 < v5)
        goto LABEL_30;
    }
  }
  v27 = v6;
LABEL_30:
  *v27 = v17;
  v27[1] = v25;
  v27[2] = v20;
  return result;
}

__n128 std::__floyd_sift_down[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(__n128 *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __n128 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  BOOL v15;
  __n128 result;
  _BOOL4 v17;
  _BOOL4 v18;

  v3 = 0;
  v4 = a3 - 2;
  if (a3 < 2)
    v4 = a3 - 1;
  v5 = v4 >> 1;
  do
  {
    v6 = a1;
    v7 = v3 + 1;
    a1 = (__n128 *)((char *)a1 + 24 * v3 + 24);
    v8 = 2 * v3;
    v3 = (2 * v3) | 1;
    v9 = v8 + 2;
    if (v9 >= a3)
      goto LABEL_13;
    if (*a2)
      v10 = 8;
    else
      v10 = 12;
    v11 = *(float *)(a1->n128_u64[0] + v10) - *(float *)(a1[1].n128_u64[1] + v10);
    v12 = v6[1].n128_u64[3 * v7];
    v13 = a1[2].n128_u64[1];
    v14 = v12 - v13;
    if (a2[1])
    {
      v15 = v14 < 0;
      if (v11 != 0.0)
        v15 = v11 > 0.0;
      if (v15)
        goto LABEL_12;
    }
    else
    {
      v17 = v14 < 0;
      if (v12 == v13)
        v18 = v11 > 0.0;
      else
        v18 = v17;
      if (v18)
      {
LABEL_12:
        a1 = (__n128 *)((char *)a1 + 24);
        v3 = v9;
      }
    }
LABEL_13:
    result = *a1;
    v6[1].n128_u64[0] = a1[1].n128_u64[0];
    *v6 = result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__sift_up[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(uint64_t result, uint64_t a2, _BYTE *a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v16;
  __int128 v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  _BOOL4 v25;
  _BOOL4 v26;
  __int128 v27;

  v4 = a4 - 2;
  if (a4 < 2)
    return result;
  v5 = v4 >> 1;
  v6 = (_QWORD *)(result + 24 * (v4 >> 1));
  v7 = *(_QWORD *)(a2 - 24);
  v8 = 8;
  if (!*a3)
    v8 = 12;
  v9 = *(float *)(*v6 + v8) - *(float *)(v7 + v8);
  v10 = v6[2];
  v11 = *(_QWORD *)(a2 - 8);
  v12 = v10 - v11;
  if (a3[1])
  {
    v13 = v12 < 0;
    if (v9 != 0.0)
      v13 = v9 > 0.0;
    if (!v13)
      return result;
  }
  else
  {
    v14 = v12 < 0;
    if (v10 == v11)
      v15 = v9 > 0.0;
    else
      v15 = v14;
    if (!v15)
      return result;
  }
  v16 = *(_QWORD *)(a2 - 16);
  v17 = *(_OWORD *)v6;
  *(_QWORD *)(a2 - 8) = v6[2];
  *(_OWORD *)(a2 - 24) = v17;
  if (v4 >= 2)
  {
    while (1)
    {
      v19 = v5 - 1;
      v5 = (v5 - 1) >> 1;
      v18 = (_QWORD *)(result + 24 * v5);
      if (*a3)
        v20 = 8;
      else
        v20 = 12;
      v21 = *(float *)(*v18 + v20) - *(float *)(v7 + v20);
      v22 = v18[2];
      v23 = v22 - v11;
      if (a3[1])
      {
        v24 = v23 < 0;
        if (v21 != 0.0)
          v24 = v21 > 0.0;
        if (!v24)
          break;
      }
      else
      {
        v25 = v23 < 0;
        if (v22 == v11)
          v26 = v21 > 0.0;
        else
          v26 = v25;
        if (!v26)
          break;
      }
      v27 = *(_OWORD *)v18;
      v6[2] = v18[2];
      *(_OWORD *)v6 = v27;
      v6 = (_QWORD *)(result + 24 * v5);
      if (v19 <= 1)
        goto LABEL_28;
    }
  }
  v18 = v6;
LABEL_28:
  *v18 = v7;
  v18[1] = v16;
  v18[2] = v11;
  return result;
}

uint64_t nui::stack_bitset::erase(unint64_t *a1, uint64_t a2, unint64_t a3)
{
  _QWORD v4[2];

  v4[0] = a2;
  v4[1] = a3;
  if (a3 < *a1)
  {
    *(_QWORD *)(a1[1] + ((a3 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << a3);
    nui::stack_bitset::iterator::operator++((uint64_t)v4);
    return v4[0];
  }
  return a2;
}

uint64_t ___ZL25NUIStringFromDistribution24NUIContainerDistribution_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("Default"), &unk_1E57CD158, CFSTR("Fill"), &unk_1E57CD170, CFSTR("FillEqual"), &unk_1E57CD188, CFSTR("FillProp"), &unk_1E57CD1A0, CFSTR("EqualSpacing"), &unk_1E57CD1B8, CFSTR("EqualCentering"), &unk_1E57CD1D0, CFSTR("EqualGrouping"), &unk_1E57CD1E8, CFSTR("StackLeading"), &unk_1E57CD200, CFSTR("StackCenter"),
             &unk_1E57CD218,
             CFSTR("StackTrailing"),
             &unk_1E57CD230,
             0);
  NUIStringFromDistribution(NUIContainerDistribution)::dict = result;
  return result;
}

double NUIContainerViewLengthMakeSystem(double a1)
{
  return a1 * -256.0 + -1048576.0;
}

_QWORD *__Block_byref_object_copy__0(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  result[6] = a2[6];
  v2 = a2 + 7;
  v3 = a2[7];
  result[7] = v3;
  v4 = result + 7;
  v5 = a2[8];
  result[8] = v5;
  if (v5)
  {
    *(_QWORD *)(v3 + 16) = v4;
    a2[6] = v2;
    *v2 = 0;
    a2[8] = 0;
  }
  else
  {
    result[6] = v4;
  }
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  std::__tree<UIView *>::destroy(a1 + 48, *(_QWORD **)(a1 + 56));
}

uint64_t ___ZL22NUIStringFromAlignment21NUIContainerAlignment_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("Default"), &unk_1E57CD248, CFSTR("Fill"), &unk_1E57CD260, CFSTR("Top/Lead"), &unk_1E57CD278, CFSTR("FirstBL"), &unk_1E57CD290, CFSTR("Center"), &unk_1E57CD2A8, CFSTR("Bottom/Trail"), &unk_1E57CD2C0, CFSTR("LastBL"), &unk_1E57CD2D8, 0);
  NUIStringFromAlignment(NUIContainerAlignment)::dict = result;
  return result;
}

uint64_t *std::__tree<UIView *>::__emplace_unique_key_args<UIView *,UIView *&>(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  unint64_t v7;
  uint64_t **v8;
  unint64_t v9;
  uint64_t *v10;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v5;
        v9 = v5[4];
        if (v7 >= v9)
          break;
        v5 = *v8;
        v6 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (v9 >= v7)
        break;
      v5 = v8[1];
      if (!v5)
      {
        v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = a1 + 1;
LABEL_10:
    v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<UIView *>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t *std::__tree<UIView *>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1AA82FEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _NUIGridArrangement *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  _NUIGridArrangement::~_NUIGridArrangement((_NUIGridArrangement *)&a17);
  _Unwind_Resume(a1);
}

void _NUIGridArrangement::~_NUIGridArrangement(_NUIGridArrangement *this)
{
  CGRect *begin;
  _NUIGridArrangementDimension *v3;
  _NUIGridArrangementDimension *v4;
  _NUIGridArrangementCell *v5;

  begin = this->viewFrames.__begin_;
  if (begin)
  {
    this->viewFrames.__end_ = begin;
    operator delete(begin);
  }
  v3 = this->rows.__begin_;
  if (v3)
  {
    this->rows.__end_ = v3;
    operator delete(v3);
  }
  v4 = this->columns.__begin_;
  if (v4)
  {
    this->columns.__end_ = v4;
    operator delete(v4);
  }
  v5 = this->cells.__begin_;
  if (v5)
  {
    this->cells.__end_ = v5;
    operator delete(v5);
  }
}

__n128 __Block_byref_object_copy__1(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t ___ZL22NUIStringFromAlignment21NUIContainerAlignment_block_invoke_0()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("Default"), &unk_1E57CD2F0, CFSTR("Fill"), &unk_1E57CD308, CFSTR("Top/Lead"), &unk_1E57CD320, CFSTR("FirstBL"), &unk_1E57CD338, CFSTR("Center"), &unk_1E57CD350, CFSTR("Bottom/Trail"), &unk_1E57CD368, CFSTR("LastBL"), &unk_1E57CD380, 0);
  NUIStringFromAlignment(NUIContainerAlignment)::dict = result;
  return result;
}

void *std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<UIView  {__kindof}*&,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>(void **a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, _QWORD *a5, _QWORD *a6)
{
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v15;
  _BYTE *v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void *v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v6 = (char *)*a1;
  v7 = 0x6DB6DB6DB6DB6DB7 * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 4);
  v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x249249249249249)
    abort();
  v16 = a1[2];
  v15 = (uint64_t)(a1 + 2);
  v17 = 0x6DB6DB6DB6DB6DB7 * ((v16 - v6) >> 4);
  if (2 * v17 > v8)
    v8 = 2 * v17;
  if (v17 >= 0x124924924924924)
    v18 = 0x249249249249249;
  else
    v18 = v8;
  if (v18)
  {
    v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v15, v18);
    v21 = v20;
  }
  else
  {
    v19 = 0;
    v21 = 0;
  }
  _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)&v19[112 * v7], *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  v23 = v22 + 112;
  v25 = (char *)*a1;
  v24 = (char *)a1[1];
  if (v24 != *a1)
  {
    do
    {
      v26 = *((_OWORD *)v24 - 7);
      v27 = *((_OWORD *)v24 - 5);
      *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
      *((_OWORD *)v22 - 5) = v27;
      *((_OWORD *)v22 - 7) = v26;
      v28 = *((_OWORD *)v24 - 4);
      v29 = *((_OWORD *)v24 - 3);
      v30 = *((_OWORD *)v24 - 1);
      *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
      *((_OWORD *)v22 - 1) = v30;
      *((_OWORD *)v22 - 4) = v28;
      *((_OWORD *)v22 - 3) = v29;
      v22 -= 112;
      v24 -= 112;
    }
    while (v24 != v25);
    v24 = (char *)*a1;
  }
  *a1 = v22;
  a1[1] = v23;
  a1[2] = &v19[112 * v21];
  if (v24)
    operator delete(v24);
  return v23;
}

void sub_1AA830B88(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

uint64_t ___ZL25NUIStringFromDistribution24NUIContainerDistribution_block_invoke_0()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("Default"), &unk_1E57CD398, CFSTR("Fill"), &unk_1E57CD3B0, CFSTR("FillEqual"), &unk_1E57CD3C8, CFSTR("FillProp"), &unk_1E57CD3E0, CFSTR("EqualSpacing"), &unk_1E57CD3F8, CFSTR("EqualCentering"), &unk_1E57CD410, CFSTR("EqualGrouping"), &unk_1E57CD428, CFSTR("StackLeading"), &unk_1E57CD440, CFSTR("StackCenter"),
             &unk_1E57CD458,
             CFSTR("StackTrailing"),
             &unk_1E57CD470,
             0);
  NUIStringFromDistribution(NUIContainerDistribution)::dict = result;
  return result;
}

uint64_t ___ZL22NUIStringFromAlignment21NUIContainerAlignment_block_invoke_1()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("Default"), &unk_1E57CD398, CFSTR("Fill"), &unk_1E57CD3B0, CFSTR("Top/Lead"), &unk_1E57CD3C8, CFSTR("FirstBL"), &unk_1E57CD3E0, CFSTR("Center"), &unk_1E57CD3F8, CFSTR("Bottom/Trail"), &unk_1E57CD410, CFSTR("LastBL"), &unk_1E57CD428, 0);
  NUIStringFromAlignment(NUIContainerAlignment)::dict = result;
  return result;
}

uint64_t *std::__tree<std::__value_type<UIView *,double>,std::__map_value_compare<UIView *,std::__value_type<UIView *,double>,std::less<UIView *>,true>,std::allocator<std::__value_type<UIView *,double>>>::__emplace_unique_key_args<UIView *,std::piecewise_construct_t const&,std::tuple<UIView * const&>,std::tuple<>>(uint64_t **a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unint64_t v8;
  uint64_t **v9;
  unint64_t v10;
  uint64_t *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = v6[4];
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = **a4;
    v11[5] = 0;
    std::__tree<UIView *>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

void *std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<UIView *&,_NSRange &,_NSRange &,NUIContainerAlignment,NUIContainerAlignment&>(void **a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, _QWORD *a5, _QWORD *a6)
{
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v15;
  _BYTE *v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void *v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v6 = (char *)*a1;
  v7 = 0x6DB6DB6DB6DB6DB7 * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 4);
  v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x249249249249249)
    abort();
  v16 = a1[2];
  v15 = (uint64_t)(a1 + 2);
  v17 = 0x6DB6DB6DB6DB6DB7 * ((v16 - v6) >> 4);
  if (2 * v17 > v8)
    v8 = 2 * v17;
  if (v17 >= 0x124924924924924)
    v18 = 0x249249249249249;
  else
    v18 = v8;
  if (v18)
  {
    v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v15, v18);
    v21 = v20;
  }
  else
  {
    v19 = 0;
    v21 = 0;
  }
  _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)&v19[112 * v7], *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  v23 = v22 + 112;
  v25 = (char *)*a1;
  v24 = (char *)a1[1];
  if (v24 != *a1)
  {
    do
    {
      v26 = *((_OWORD *)v24 - 7);
      v27 = *((_OWORD *)v24 - 5);
      *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
      *((_OWORD *)v22 - 5) = v27;
      *((_OWORD *)v22 - 7) = v26;
      v28 = *((_OWORD *)v24 - 4);
      v29 = *((_OWORD *)v24 - 3);
      v30 = *((_OWORD *)v24 - 1);
      *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
      *((_OWORD *)v22 - 1) = v30;
      *((_OWORD *)v22 - 4) = v28;
      *((_OWORD *)v22 - 3) = v29;
      v22 -= 112;
      v24 -= 112;
    }
    while (v24 != v25);
    v24 = (char *)*a1;
  }
  *a1 = v22;
  a1[1] = v23;
  a1[2] = &v19[112 * v21];
  if (v24)
    operator delete(v24);
  return v23;
}

void sub_1AA831640(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void *std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<UIView *&,_NSRange &,_NSRange &,NUIContainerAlignment &,NUIContainerAlignment>(void **a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, _QWORD *a5, _QWORD *a6)
{
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v15;
  _BYTE *v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void *v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v6 = (char *)*a1;
  v7 = 0x6DB6DB6DB6DB6DB7 * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 4);
  v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x249249249249249)
    abort();
  v16 = a1[2];
  v15 = (uint64_t)(a1 + 2);
  v17 = 0x6DB6DB6DB6DB6DB7 * ((v16 - v6) >> 4);
  if (2 * v17 > v8)
    v8 = 2 * v17;
  if (v17 >= 0x124924924924924)
    v18 = 0x249249249249249;
  else
    v18 = v8;
  if (v18)
  {
    v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v15, v18);
    v21 = v20;
  }
  else
  {
    v19 = 0;
    v21 = 0;
  }
  _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)&v19[112 * v7], *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  v23 = v22 + 112;
  v25 = (char *)*a1;
  v24 = (char *)a1[1];
  if (v24 != *a1)
  {
    do
    {
      v26 = *((_OWORD *)v24 - 7);
      v27 = *((_OWORD *)v24 - 5);
      *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
      *((_OWORD *)v22 - 5) = v27;
      *((_OWORD *)v22 - 7) = v26;
      v28 = *((_OWORD *)v24 - 4);
      v29 = *((_OWORD *)v24 - 3);
      v30 = *((_OWORD *)v24 - 1);
      *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
      *((_OWORD *)v22 - 1) = v30;
      *((_OWORD *)v22 - 4) = v28;
      *((_OWORD *)v22 - 3) = v29;
      v22 -= 112;
      v24 -= 112;
    }
    while (v24 != v25);
    v24 = (char *)*a1;
  }
  *a1 = v22;
  a1[1] = v23;
  a1[2] = &v19[112 * v21];
  if (v24)
    operator delete(v24);
  return v23;
}

void sub_1AA8317BC(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void std::vector<_NUIBoxArrangementCell>::emplace_back<objc_object  {objcproto18NUIArrangementItem}*&,NUIContainerAlignment &,NUIContainerAlignment>(void **a1, uint64_t *a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v10 = a1[2];
  v8 = (uint64_t)(a1 + 2);
  v9 = v10;
  v11 = *(_QWORD *)(v8 - 8);
  if (v11 >= (unint64_t)v10)
  {
    v13 = (uint64_t)(v11 - (_QWORD)*a1) >> 6;
    if ((unint64_t)(v13 + 1) >> 58)
      abort();
    v14 = v9 - (_BYTE *)*a1;
    v15 = v14 >> 5;
    if (v14 >> 5 <= (unint64_t)(v13 + 1))
      v15 = v13 + 1;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFC0)
      v16 = 0x3FFFFFFFFFFFFFFLL;
    else
      v16 = v15;
    if (v16)
    {
      v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowArrangementCell>>(v8, v16);
      v19 = v18;
    }
    else
    {
      v17 = 0;
      v19 = 0;
    }
    _NUIFlowArrangementCell::_NUIFlowArrangementCell((uint64_t)&v17[64 * v13], *a2, *a3, *a4);
    v12 = v20 + 64;
    v22 = (char *)*a1;
    v21 = (char *)a1[1];
    if (v21 != *a1)
    {
      do
      {
        v23 = *((_OWORD *)v21 - 4);
        v24 = *((_OWORD *)v21 - 3);
        v25 = *((_OWORD *)v21 - 1);
        *((_OWORD *)v20 - 2) = *((_OWORD *)v21 - 2);
        *((_OWORD *)v20 - 1) = v25;
        *((_OWORD *)v20 - 4) = v23;
        *((_OWORD *)v20 - 3) = v24;
        v20 -= 64;
        v21 -= 64;
      }
      while (v21 != v22);
      v21 = (char *)*a1;
    }
    *a1 = v20;
    a1[1] = v12;
    a1[2] = &v17[64 * v19];
    if (v21)
      operator delete(v21);
  }
  else
  {
    _NUIFlowArrangementCell::_NUIFlowArrangementCell(*(_QWORD *)(v8 - 8), *a2, *a3, *a4);
    v12 = (void *)(v11 + 64);
    a1[1] = (void *)(v11 + 64);
  }
  a1[1] = v12;
}

void sub_1AA831BB0(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void *_NUIBoxArrangement::debugDictionary(_NUIBoxArrangement *this)
{
  uint64_t v2;
  void *v3;
  double baseLineFromTop;
  double baseLineFromBottom;
  void *v8;
  uint64_t *v9;
  const __CFString **v10;
  uint64_t v12;
  void *v13;
  _NUIBoxArrangementCell *end;
  _NUIBoxArrangementCell *begin;
  const __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", CFSTR("_NUIBoxArrangement"), CFSTR("class"));
  baseLineFromTop = this->maxBaseLinePair.baseLineFromTop;
  baseLineFromBottom = this->maxBaseLinePair.baseLineFromBottom;
  if (baseLineFromTop == 0.0 || baseLineFromTop == 2.22507386e-308)
  {
    if (baseLineFromBottom == 0.0 || baseLineFromBottom == 2.22507386e-308)
      goto LABEL_20;
    v17 = CFSTR("bottomOffset");
    v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", baseLineFromBottom);
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v18;
    v10 = &v17;
  }
  else
  {
    if (baseLineFromBottom != 0.0 && baseLineFromBottom != 2.22507386e-308)
    {
      v21[0] = CFSTR("topOffset");
      v21[1] = CFSTR("bottomOffset");
      v22[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v22[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", baseLineFromBottom);
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = v22;
      v10 = (const __CFString **)v21;
      v12 = 2;
      goto LABEL_18;
    }
    v19 = CFSTR("topOffset");
    v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v20;
    v10 = &v19;
  }
  v12 = 1;
LABEL_18:
  v2 = objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, v12);
  if (v2)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("maxBaselines"));
LABEL_20:
  if (this->cells.__end_ != this->cells.__begin_)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", v2);
    begin = this->cells.__begin_;
    end = this->cells.__end_;
    while (begin != end)
    {
      objc_msgSend(v13, "addObject:", _NUIFlowArrangementCell::debugDictionary((_NUIFlowArrangementCell *)begin));
      begin = (_NUIBoxArrangementCell *)((char *)begin + 64);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("cells"));
  }
  return v3;
}

void std::vector<_NUIFlowArrangementCell>::emplace_back<UIView *&,NUIContainerAlignment &,NUIContainerAlignment &>(void **a1, uint64_t *a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v10 = a1[2];
  v8 = (uint64_t)(a1 + 2);
  v9 = v10;
  v11 = *(_QWORD *)(v8 - 8);
  if (v11 >= (unint64_t)v10)
  {
    v13 = (uint64_t)(v11 - (_QWORD)*a1) >> 6;
    if ((unint64_t)(v13 + 1) >> 58)
      abort();
    v14 = v9 - (_BYTE *)*a1;
    v15 = v14 >> 5;
    if (v14 >> 5 <= (unint64_t)(v13 + 1))
      v15 = v13 + 1;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFC0)
      v16 = 0x3FFFFFFFFFFFFFFLL;
    else
      v16 = v15;
    if (v16)
    {
      v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowArrangementCell>>(v8, v16);
      v19 = v18;
    }
    else
    {
      v17 = 0;
      v19 = 0;
    }
    _NUIFlowArrangementCell::_NUIFlowArrangementCell((uint64_t)&v17[64 * v13], *a2, *a3, *a4);
    v12 = v20 + 64;
    v22 = (char *)*a1;
    v21 = (char *)a1[1];
    if (v21 != *a1)
    {
      do
      {
        v23 = *((_OWORD *)v21 - 4);
        v24 = *((_OWORD *)v21 - 3);
        v25 = *((_OWORD *)v21 - 1);
        *((_OWORD *)v20 - 2) = *((_OWORD *)v21 - 2);
        *((_OWORD *)v20 - 1) = v25;
        *((_OWORD *)v20 - 4) = v23;
        *((_OWORD *)v20 - 3) = v24;
        v20 -= 64;
        v21 -= 64;
      }
      while (v21 != v22);
      v21 = (char *)*a1;
    }
    *a1 = v20;
    a1[1] = v12;
    a1[2] = &v17[64 * v19];
    if (v21)
      operator delete(v21);
  }
  else
  {
    _NUIFlowArrangementCell::_NUIFlowArrangementCell(*(_QWORD *)(v8 - 8), *a2, *a3, *a4);
    v12 = (void *)(v11 + 64);
    a1[1] = (void *)(v11 + 64);
  }
  a1[1] = v12;
}

void sub_1AA832C54(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

uint64_t ___ZL22NUIStringFromAlignment21NUIContainerAlignment_block_invoke_2()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("Default"), &unk_1E57CD488, CFSTR("Fill"), &unk_1E57CD4A0, CFSTR("Top/Lead"), &unk_1E57CD4B8, CFSTR("FirstBL"), &unk_1E57CD4D0, CFSTR("Center"), &unk_1E57CD4E8, CFSTR("Bottom/Trail"), &unk_1E57CD500, CFSTR("LastBL"), &unk_1E57CD518, 0);
  NUIStringFromAlignment(NUIContainerAlignment)::dict = result;
  return result;
}

uint64_t ___ZL22NUIStringFromAlignment21NUIContainerAlignment_block_invoke_3()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("Default"), &unk_1E57CD530, CFSTR("Fill"), &unk_1E57CD548, CFSTR("Top/Lead"), &unk_1E57CD560, CFSTR("FirstBL"), &unk_1E57CD578, CFSTR("Center"), &unk_1E57CD590, CFSTR("Bottom/Trail"), &unk_1E57CD5A8, CFSTR("LastBL"), &unk_1E57CD5C0, 0);
  NUIStringFromAlignment(NUIContainerAlignment)::dict = result;
  return result;
}

void sub_1AA834AA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AA834B48(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AA8351BC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1AA835460(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void *std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<objc_object  {objcproto18NUIArrangementItem}*&,_NSRange &,_NSRange,NUIContainerAlignment &,NUIContainerAlignment>(void **a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, _QWORD *a5, _QWORD *a6)
{
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v15;
  _BYTE *v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void *v23;
  char *v24;
  char *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v6 = (char *)*a1;
  v7 = 0x6DB6DB6DB6DB6DB7 * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 4);
  v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x249249249249249)
    abort();
  v16 = a1[2];
  v15 = (uint64_t)(a1 + 2);
  v17 = 0x6DB6DB6DB6DB6DB7 * ((v16 - v6) >> 4);
  if (2 * v17 > v8)
    v8 = 2 * v17;
  if (v17 >= 0x124924924924924)
    v18 = 0x249249249249249;
  else
    v18 = v8;
  if (v18)
  {
    v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v15, v18);
    v21 = v20;
  }
  else
  {
    v19 = 0;
    v21 = 0;
  }
  _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)&v19[112 * v7], *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  v23 = v22 + 112;
  v25 = (char *)*a1;
  v24 = (char *)a1[1];
  if (v24 != *a1)
  {
    do
    {
      v26 = *((_OWORD *)v24 - 7);
      v27 = *((_OWORD *)v24 - 5);
      *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
      *((_OWORD *)v22 - 5) = v27;
      *((_OWORD *)v22 - 7) = v26;
      v28 = *((_OWORD *)v24 - 4);
      v29 = *((_OWORD *)v24 - 3);
      v30 = *((_OWORD *)v24 - 1);
      *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
      *((_OWORD *)v22 - 1) = v30;
      *((_OWORD *)v22 - 4) = v28;
      *((_OWORD *)v22 - 3) = v29;
      v22 -= 112;
      v24 -= 112;
    }
    while (v24 != v25);
    v24 = (char *)*a1;
  }
  *a1 = v22;
  a1[1] = v23;
  a1[2] = &v19[112 * v21];
  if (v24)
    operator delete(v24);
  return v23;
}

void sub_1AA83593C(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void _NUIFlowArrangement::_NUIFlowArrangement(void **a1, void **a2, uint64_t a3)
{
  void *v5;
  void *v6;

  v5 = *a1;
  if (v5)
  {
    *(_QWORD *)(a3 + 88) = v5;
    operator delete(v5);
  }
  v6 = *a2;
  if (*a2)
  {
    *(_QWORD *)(a3 + 64) = v6;
    OUTLINED_FUNCTION_0(v6);
  }
}

void _NUIFlowArrangement::~_NUIFlowArrangement(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[10];
  if (v2)
  {
    a1[11] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[7];
  if (v3)
  {
    a1[8] = v3;
    OUTLINED_FUNCTION_0(v3);
  }
}

void _NUIArrangementInvalidSize_cold_1(uint64_t a1, NSObject *a2, double a3, double a4)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = NSStringFromCGSize(*(CGSize *)&a3);
  _os_log_error_impl(&dword_1AA816000, a2, OS_LOG_TYPE_ERROR, "An item %@ returned an invalid size %@. Break on _NUIArrangementInvalidSize to debug.", (uint8_t *)&v5, 0x16u);
}

void _NUIGridArrangement::positionSubsetCells(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1AA816000, a2, OS_LOG_TYPE_ERROR, "Grid arrangement does not have valid measurement for %@", (uint8_t *)&v3, 0xCu);
}

{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1AA816000, a2, OS_LOG_TYPE_DEBUG, "Grid arrangement does not have valid measurement for %@", (uint8_t *)&v3, 0xCu);
}

void _NUIBoxArrangement::positionCells(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1AA816000, a2, OS_LOG_TYPE_ERROR, "Box arrangement does not have valid measurement for %@", (uint8_t *)&v3, 0xCu);
}

{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1AA816000, a2, OS_LOG_TYPE_DEBUG, "Box arrangement does not have valid measurement for %@", (uint8_t *)&v3, 0xCu);
}

BOOL CATransform3DIsIdentity(CATransform3D *t)
{
  return MEMORY[0x1E0CD2628](t);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0CEA110]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0CEA118]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void operator delete(void *__p)
{
  off_1E57C65A8(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E57C65B0(__sz);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1E0DE7D00](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

