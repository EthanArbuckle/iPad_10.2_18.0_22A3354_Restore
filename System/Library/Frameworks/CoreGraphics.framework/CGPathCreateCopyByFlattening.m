@implementation CGPathCreateCopyByFlattening

void __CGPathCreateCopyByFlattening_block_invoke(uint64_t a1, uint64_t a2)
{
  float64x2_t *v4;
  float64x2_t v5;
  float64x2_t v6;
  double v7;
  _QWORD *v8;
  float64x2_t *v9;
  float64x2_t v10;
  _QWORD v11[5];
  _QWORD v12[5];
  CGPoint CurrentPoint;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  switch(*(_DWORD *)a2)
  {
    case 0:
      CGPathMoveToPoint(*(CGMutablePathRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0, **(CGFloat **)(a2 + 8), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 8));
      break;
    case 1:
      CGPathAddLineToPoint(*(CGMutablePathRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0, **(CGFloat **)(a2 + 8), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 8));
      break;
    case 2:
      CurrentPoint = CGPathGetCurrentPoint((CGPathRef)*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      v4 = *(float64x2_t **)(a2 + 8);
      v5 = (float64x2_t)vdupq_n_s64(0x3FE5555555555555uLL);
      v6 = vmlaq_f64(v4[1], v5, vsubq_f64(*v4, v4[1]));
      v14 = vmlaq_f64((float64x2_t)CurrentPoint, v5, vsubq_f64(*v4, (float64x2_t)CurrentPoint));
      v15 = v6;
      v16 = v4[1];
      v7 = *(double *)(a1 + 40);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 0x40000000;
      v12[2] = __CGPathCreateCopyByFlattening_block_invoke_2;
      v12[3] = &unk_1E1630258;
      v12[4] = *(_QWORD *)(a1 + 32);
      v8 = v12;
      goto LABEL_6;
    case 3:
      CurrentPoint = CGPathGetCurrentPoint((CGPathRef)*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      v9 = *(float64x2_t **)(a2 + 8);
      v10 = v9[1];
      v14 = *v9;
      v15 = v10;
      v16 = v9[2];
      v7 = *(double *)(a1 + 40);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 0x40000000;
      v11[2] = __CGPathCreateCopyByFlattening_block_invoke_3;
      v11[3] = &unk_1E1630280;
      v11[4] = *(_QWORD *)(a1 + 32);
      v8 = v11;
LABEL_6:
      subdivide_bezier_with_flatness((uint64_t)&CurrentPoint, (uint64_t)v8, v7);
      break;
    case 4:
      CGPathCloseSubpath(*(CGMutablePathRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      break;
    default:
      return;
  }
}

void __CGPathCreateCopyByFlattening_block_invoke_2(uint64_t a1, CGFloat a2, CGFloat a3)
{
  CGPathAddLineToPoint(*(CGMutablePathRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0, a2, a3);
}

void __CGPathCreateCopyByFlattening_block_invoke_3(uint64_t a1, CGFloat a2, CGFloat a3)
{
  CGPathAddLineToPoint(*(CGMutablePathRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0, a2, a3);
}

@end
