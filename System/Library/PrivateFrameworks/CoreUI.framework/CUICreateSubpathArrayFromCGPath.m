@implementation CUICreateSubpathArrayFromCGPath

void __CUICreateSubpathArrayFromCGPath_block_invoke(uint64_t a1, uint64_t a2)
{
  CGFloat *v4;
  CGPath *v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (*(_DWORD *)a2 == 4)
      return;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGPathCreateMutable();
  }
  switch(*(_DWORD *)a2)
  {
    case 0:
      CGPathMoveToPoint(*(CGMutablePathRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0, **(CGFloat **)(a2 + 8), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 8));
      break;
    case 1:
      CGPathAddLineToPoint(*(CGMutablePathRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0, **(CGFloat **)(a2 + 8), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 8));
      break;
    case 2:
      CGPathAddQuadCurveToPoint(*(CGMutablePathRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0, **(CGFloat **)(a2 + 8), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 8), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 16), *(CGFloat *)(*(_QWORD *)(a2 + 8) + 24));
      break;
    case 3:
      v4 = *(CGFloat **)(a2 + 8);
      CGPathAddCurveToPoint(*(CGMutablePathRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0, *v4, v4[1], v4[2], v4[3], v4[4], v4[5]);
      break;
    case 4:
      v5 = *(CGPath **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (v5)
      {
        CGPathCloseSubpath(v5);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
        CGPathRelease(*(CGPathRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      }
      break;
    default:
      return;
  }
}

@end
