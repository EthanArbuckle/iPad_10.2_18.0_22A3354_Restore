@implementation AX

uint64_t __AX_CGPathEnumerateElementsUsingBlock_block_invoke(uint64_t result, int *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  v4 = *(unsigned __int8 *)(v2 + 24);
  v3 = v2 + 24;
  if (!v4)
  {
    v6 = result;
    v7 = *(_QWORD *)(result + 32);
    v8 = *a2;
    if (v8 > 3)
      v9 = 0;
    else
      v9 = qword_18C736A68[v8];
    result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t))(v7 + 16))(v7, v8, *((_QWORD *)a2 + 1), v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8) + 24), v3);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 48) + 8) + 24);
  }
  return result;
}

__n128 __AX_CGPathGetIntersectionPointWithRect_block_invoke(uint64_t a1, uint64_t a2, __n128 *a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  __n128 result;

  if (!a5)
  {
    result = *a3;
    *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = *a3;
    *a6 = 1;
  }
  return result;
}

uint64_t __AX_CGPathGetNumberOfElements_block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

__n128 __AX_CGPathGetStartingAndEndingPoints_block_invoke(uint64_t a1, uint64_t a2, __n128 *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  __n128 result;

  if (a4)
  {
    if (a5)
      v5 = *(_QWORD *)(a1 + 40);
    else
      v5 = *(_QWORD *)(a1 + 32);
    result = *a3;
    *(__n128 *)(*(_QWORD *)(v5 + 8) + 32) = *a3;
  }
  return result;
}

uint64_t __AX_CGPathGetPointForElementAtIndex_block_invoke(uint64_t result, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  if (*(_QWORD *)(result + 40) == a5)
  {
    if (a4)
      *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 32) = *a3;
    *a6 = 1;
  }
  return result;
}

void __AX_CGCreatePathPathWithUniformInset_block_invoke(uint64_t a1, unsigned int a2, double *a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;

  if (a2 >= 4)
  {
    if (a2 == 4)
      CGPathCloseSubpath(*(CGMutablePathRef *)(a1 + 56));
  }
  else
  {
    v7 = *(double *)(a1 + 40);
    v6 = *(double *)(a1 + 48);
    v8 = *(double *)(a1 + 32);
    v9 = AX_CGPointInset(*a3, a3[1], v8, v7, v6);
    v11 = v9;
    v12 = v10;
    switch(a2)
    {
      case 0u:
        CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 56), 0, v9, v10);
        break;
      case 1u:
        CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 56), 0, v9, v10);
        break;
      case 2u:
        v13 = AX_CGPointInset(a3[2], a3[3], v8, v7, v6);
        CGPathAddQuadCurveToPoint(*(CGMutablePathRef *)(a1 + 56), 0, v11, v12, v13, v14);
        break;
      case 3u:
        v15 = AX_CGPointInset(a3[2], a3[3], v8, v7, v6);
        v17 = v16;
        v18 = AX_CGPointInset(a3[4], a3[5], v8, v7, v6);
        CGPathAddCurveToPoint(*(CGMutablePathRef *)(a1 + 56), 0, v11, v12, v15, v17, v18, v19);
        break;
      default:
        return;
    }
  }
}

uint64_t __AX_CGPathGetDescription_block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  const __CFString *v7;
  uint64_t result;
  _QWORD *v9;

  if (a2 > 4)
    v7 = CFSTR("Unhandled path element type");
  else
    v7 = off_1E24C76A8[a2];
  result = objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@\n"), v7);
  if (a4)
  {
    v9 = (_QWORD *)(a3 + 8);
    do
    {
      result = objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%f, %f\n"), *(v9 - 1), *v9);
      v9 += 2;
      --a4;
    }
    while (a4);
  }
  return result;
}

__n128 ___AX_CGPathGetIntersectionPointWithOtherPathNonExhaustive_block_invoke(uint64_t a1, uint64_t a2, __n128 *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  __n128 result;

  if (a5)
    v5 = *(_QWORD *)(a1 + 40);
  else
    v5 = *(_QWORD *)(a1 + 32);
  result = *a3;
  *(__n128 *)(*(_QWORD *)(v5 + 8) + 32) = *a3;
  return result;
}

__n128 ___AX_CGPathGetIntersectionPointWithOtherPathNonExhaustive_block_invoke_2(uint64_t a1, uint64_t a2, __n128 *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  __n128 result;

  if (a5)
    v5 = *(_QWORD *)(a1 + 40);
  else
    v5 = *(_QWORD *)(a1 + 32);
  result = *a3;
  *(__n128 *)(*(_QWORD *)(v5 + 8) + 32) = *a3;
  return result;
}

__n128 ___AX_CGPathGetIntersectionPointWithOtherPathExhaustive_block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  const CGPath *v9;
  uint64_t v10;
  __n128 result;
  _QWORD v13[5];
  __int128 v14;
  _OWORD *v15;
  _BYTE *v16;
  _QWORD v17[4];
  __int128 v18;

  if (a5)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3010000000;
    v17[3] = &unk_18C749431;
    v18 = *MEMORY[0x1E0C9D538];
    v9 = *(const CGPath **)(a1 + 48);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = ___AX_CGPathGetIntersectionPointWithOtherPathExhaustive_block_invoke_2;
    v13[3] = &unk_1E24C7660;
    v13[4] = v17;
    v14 = *(_OWORD *)(a1 + 32);
    v15 = a3;
    v16 = a6;
    AX_CGPathEnumerateElementsUsingBlock(v9, v13);
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = *a3;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(double *)(v10 + 32) != 1.79769313e308 || *(double *)(v10 + 40) != 1.79769313e308)
      *a6 = 1;
    _Block_object_dispose(v17, 8);
  }
  else
  {
    result = *(__n128 *)a3;
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = *a3;
  }
  return result;
}

__n128 ___AX_CGPathGetIntersectionPointWithOtherPathExhaustive_block_invoke_2(uint64_t a1, uint64_t a2, double *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double Center;
  double v22;
  double v23;
  double v24;
  CGFloat height;
  CGFloat x;
  CGFloat width;
  uint64_t v28;
  double *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double MaxY;
  double v35;
  double v36;
  uint64_t v37;
  __n128 result;
  CGFloat y;
  double v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  if (a5)
  {
    v7 = a1 + 32;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(double **)(a1 + 56);
    v10 = *(double *)(v8 + 32);
    v11 = *(double *)(v8 + 40);
    v12 = v9[1];
    if (v10 >= *v9)
      v13 = *v9;
    else
      v13 = *(double *)(v8 + 32);
    if (v11 >= v12)
      v14 = *((_QWORD *)v9 + 1);
    else
      v14 = *(_QWORD *)(v8 + 40);
    v15 = fmax(vabdd_f64(v10, *v9), 1.0);
    v16 = fmax(vabdd_f64(v11, v12), 1.0);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v18 = *(double *)(v17 + 32);
    v19 = *(double *)(v17 + 40);
    v20 = a3[1];
    if (v18 >= *a3)
      Center = *a3;
    else
      Center = *(double *)(v17 + 32);
    if (v19 >= v20)
      v22 = a3[1];
    else
      v22 = *(double *)(v17 + 40);
    v23 = fmax(vabdd_f64(v18, *a3), 1.0);
    v24 = fmax(vabdd_f64(v19, v20), 1.0);
    v48.origin.x = Center;
    v48.origin.y = v22;
    v48.size.width = v23;
    v48.size.height = v24;
    v41 = CGRectIntersection(*(CGRect *)&v13, v48);
    if (v41.size.width > 0.0)
    {
      height = v41.size.height;
      if (v41.size.height != 0.0)
      {
        x = v41.origin.x;
        width = v41.size.width;
        v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v29 = *(double **)(a1 + 56);
        v30 = *(double *)(v28 + 32);
        v31 = v29[1];
        v32 = fmax(vabdd_f64(v30, *v29), 0.001);
        v33 = v30 - *v29;
        if (v32 + -0.001 <= 0.000001)
          v33 = v32;
        if (vabdd_f64(v41.origin.x, Center) >= 0.001)
        {
          y = v41.origin.y;
          v40 = (*(double *)(v28 + 40) - v31) / v33;
          v42.origin.x = Center;
          v42.origin.y = v22;
          v42.size.width = v23;
          v42.size.height = v24;
          if (vabdd_f64(x, CGRectGetMaxX(v42)) >= 0.001)
          {
            if (vabdd_f64(y, v22) >= 0.001)
            {
              v45.origin.x = Center;
              v45.origin.y = v22;
              v45.size.width = v23;
              v45.size.height = v24;
              if (vabdd_f64(y, CGRectGetMaxY(v45)) >= 0.001)
              {
                Center = AX_CGRectGetCenter(x, y, width, height);
                MaxY = v36;
              }
              else
              {
                v46.origin.x = Center;
                v46.origin.y = v22;
                v46.size.width = v23;
                v46.size.height = v24;
                v35 = **(double **)(a1 + 56) + (CGRectGetMaxY(v46) - *(double *)(*(_QWORD *)(a1 + 56) + 8)) / v40;
                v47.origin.x = Center;
                v47.origin.y = v22;
                v47.size.width = v23;
                v47.size.height = v24;
                MaxY = CGRectGetMaxY(v47);
                Center = v35;
              }
            }
            else
            {
              Center = **(double **)(a1 + 56) + (v22 - *(double *)(*(_QWORD *)(a1 + 56) + 8)) / v40;
              MaxY = v22;
            }
          }
          else
          {
            v43.origin.x = Center;
            v43.origin.y = v22;
            v43.size.width = v23;
            v43.size.height = v24;
            MaxY = *(double *)(*(_QWORD *)(a1 + 56) + 8) + v40 * (CGRectGetMaxX(v43) - **(double **)(a1 + 56));
            v44.origin.x = Center;
            v44.origin.y = v22;
            v44.size.width = v23;
            v44.size.height = v24;
            Center = CGRectGetMaxX(v44);
          }
        }
        else
        {
          MaxY = v31 + (*(double *)(v28 + 40) - v31) / v33 * (Center - *v29);
        }
        v37 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        *(double *)(v37 + 32) = Center;
        *(double *)(v37 + 40) = MaxY;
        **(_BYTE **)(a1 + 64) = 1;
      }
    }
  }
  else
  {
    v7 = a1 + 32;
  }
  result = *(__n128 *)a3;
  *(_OWORD *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 32) = *(_OWORD *)a3;
  return result;
}

@end
