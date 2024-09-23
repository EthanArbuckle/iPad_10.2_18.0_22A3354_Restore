@implementation ActivityGoalLineSeries

void __166___ActivityGoalLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  double v8;
  double v9;
  CGFloat v10;
  uint64_t v11;
  id v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  void *v19;
  id v20;
  CGFloat v21;
  CGContext *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;

  v25 = a2;
  v7 = a4;
  objc_msgSend(v25, "coordinate");
  v10 = v8;
  if (v8 < *(double *)(a1 + 64))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = v25;
LABEL_3:
    v13 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v12;
LABEL_14:

    goto LABEL_15;
  }
  v14 = v9;
  if (v8 <= *(double *)(a1 + 72))
  {
    v17 = objc_msgSend(*(id *)(a1 + 32), "_lineSeriesCoordinateIsPaused:", v25);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = *(void **)(v18 + 40);
    if (v19)
    {
      if ((v17 & 1) != 0)
      {
        CGContextMoveToPoint(*(CGContextRef *)(a1 + 80), v10, v14);
LABEL_22:
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
        if ((v17 & 1) != 0)
          goto LABEL_15;
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v12 = v7;
        goto LABEL_3;
      }
      objc_msgSend(v19, "coordinate");
      v22 = *(CGContext **)(a1 + 80);
      if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) < 1)
        CGContextMoveToPoint(v22, v21, v14);
      else
        CGContextAddLineToPoint(v22, v21, v14);
      CGContextAddLineToPoint(*(CGContextRef *)(a1 + 80), v10, v14);
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v24 = *(_QWORD *)(v23 + 24) + 2;
    }
    else
    {
      if ((v17 & 1) != 0)
      {
        v20 = v25;
        v13 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = v20;
        goto LABEL_14;
      }
      CGContextMoveToPoint(*(CGContextRef *)(a1 + 80), *(CGFloat *)(a1 + 64), v14);
      CGContextAddLineToPoint(*(CGContextRef *)(a1 + 80), v10, v14);
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v24 = *(_QWORD *)(v23 + 24) + 1;
    }
    *(_QWORD *)(v23 + 24) = v24;
    goto LABEL_22;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_lineSeriesCoordinateIsPaused:", v25) & 1) == 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "coordinate");
      CGContextAddLineToPoint(*(CGContextRef *)(a1 + 80), v15, v14);
      CGContextAddLineToPoint(*(CGContextRef *)(a1 + 80), v10, v14);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += 2;
    }
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;
    goto LABEL_14;
  }
LABEL_15:

}

@end
