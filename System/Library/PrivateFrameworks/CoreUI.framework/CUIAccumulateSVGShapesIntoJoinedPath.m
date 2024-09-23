@implementation CUIAccumulateSVGShapesIntoJoinedPath

void __CUIAccumulateSVGShapesIntoJoinedPath_block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  const CGPath *CGPath;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD block[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v22;
  CGAffineTransform v23;
  uint64_t v24;
  uint64_t v25;

  if (!a3)
  {
    v24 = v3;
    v25 = v4;
    if (CGSVGNodeGetType(a2) == 2)
    {
      if (CGSVGShapeNodeGetPath(a2))
      {
        CGPath = (const CGPath *)CGSVGPathCreateCGPath();
        memset(&v23, 0, sizeof(v23));
        CUISVGNodeGetTransform(a2, (uint64_t)&v23);
        v8 = *(_OWORD *)(a1 + 48);
        v9 = *(_OWORD *)(a1 + 64);
        *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 32);
        *(_OWORD *)&t1.c = v8;
        *(_OWORD *)&t1.tx = v9;
        memset(&v22, 0, sizeof(v22));
        t2 = v23;
        CGAffineTransformConcat(&v22, &t1, &t2);
        block[1] = 3221225472;
        v14 = *(_OWORD *)&v22.a;
        v15 = *(_OWORD *)&v22.c;
        v10 = *(_OWORD *)(a1 + 32);
        v11 = *(_OWORD *)(a1 + 48);
        v16 = *(_OWORD *)&v22.tx;
        v17 = v10;
        block[0] = _NSConcreteStackBlock;
        block[2] = __CUIAccumulateSVGShapesIntoJoinedPath_block_invoke_2;
        block[3] = &__block_descriptor_136_e36_v16__0r__CGPathElement_i__CGPoint__8l;
        block[4] = *(_QWORD *)(a1 + 80);
        v12 = *(_OWORD *)(a1 + 64);
        v18 = v11;
        v19 = v12;
        CGPathApplyWithBlock(CGPath, block);
        CGPathRelease(CGPath);
      }
    }
  }
}

void __CUIAccumulateSVGShapesIntoJoinedPath_block_invoke_2(uint64_t a1, uint64_t a2)
{
  _BOOL4 IsEmpty;
  CGPath *v5;
  CGFloat *v6;
  CGPoint CurrentPoint;
  double *v8;
  double v9;
  double v10;

  switch(*(_DWORD *)a2)
  {
    case 0:
      IsEmpty = CGPathIsEmpty(*(CGPathRef *)(a1 + 32));
      v5 = *(CGPath **)(a1 + 32);
      if (!IsEmpty)
        goto LABEL_7;
      CGPathMoveToPoint(v5, (const CGAffineTransform *)(a1 + 40), **(CGFloat **)(a2 + 8), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 8));
      break;
    case 1:
      v5 = *(CGPath **)(a1 + 32);
LABEL_7:
      CurrentPoint = CGPathGetCurrentPoint(v5);
      v8 = *(double **)(a2 + 8);
      v9 = *v8;
      v10 = v8[1];
      if (vabdd_f64(CurrentPoint.x, *(double *)(a1 + 120) + v10 * *(double *)(a1 + 104) + *(double *)(a1 + 88) * *v8) > 0.00000011920929
        || vabdd_f64(CurrentPoint.y, *(double *)(a1 + 128) + v10 * *(double *)(a1 + 112) + *(double *)(a1 + 96) * v9) > 0.00000011920929)
      {
        CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 32), (const CGAffineTransform *)(a1 + 40), v9, v10);
      }
      break;
    case 2:
      CGPathAddQuadCurveToPoint(*(CGMutablePathRef *)(a1 + 32), (const CGAffineTransform *)(a1 + 40), **(CGFloat **)(a2 + 8), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 8), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 16), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 24));
      break;
    case 3:
      v6 = *(CGFloat **)(a2 + 8);
      CGPathAddCurveToPoint(*(CGMutablePathRef *)(a1 + 32), (const CGAffineTransform *)(a1 + 40), *v6, v6[1], v6[2], v6[3], v6[4], v6[5]);
      break;
    default:
      return;
  }
}

@end
