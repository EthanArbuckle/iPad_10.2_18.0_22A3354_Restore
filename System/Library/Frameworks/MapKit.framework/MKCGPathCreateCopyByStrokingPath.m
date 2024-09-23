@implementation MKCGPathCreateCopyByStrokingPath

void ___MKCGPathCreateCopyByStrokingPath_block_invoke(uint64_t a1, uint64_t a2)
{
  CGFloat *v3;
  CGFloat v4;
  CGFloat v5;
  uint64_t v6;
  uint64_t v7;
  CGFloat *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGPoint v14;
  CGPoint v15;

  if (*(_DWORD *)a2 == 1)
  {
    v8 = *(CGFloat **)(a2 + 8);
    v4 = *v8;
    v5 = v8[1];
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(_QWORD *)(v9 + 24);
    if (!v10)
    {
      v15.x = v4;
      v15.y = v5;
      _MKCGPathAddLineCap(*(CGMutablePathRef *)(a1 + 56), *(CGPoint *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), v15, *(double *)(a1 + 64), *(CGLineCap *)(a1 + 76), 1);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(_QWORD *)(v9 + 24);
    }
    *(_QWORD *)(v9 + 24) = v10 + 1;
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v7 = a1 + 40;
    *(_OWORD *)(*(_QWORD *)(v12 + 8) + 48) = *(_OWORD *)(*(_QWORD *)(v11 + 8) + 48);
  }
  else
  {
    if (*(_DWORD *)a2)
      return;
    v3 = *(CGFloat **)(a2 + 8);
    v4 = *v3;
    v5 = v3[1];
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v6 + 24))
    {
      v14.x = v4;
      v14.y = v5;
      _MKCGPathAddLineCap(*(CGMutablePathRef *)(a1 + 56), *(CGPoint *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), v14, *(double *)(a1 + 64), *(CGLineCap *)(a1 + 72), 0);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    }
    *(_QWORD *)(v6 + 24) = 0;
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48) = *MEMORY[0x1E0C9D538];
    v7 = a1 + 40;
  }
  v13 = *(_QWORD *)(*(_QWORD *)v7 + 8);
  *(CGFloat *)(v13 + 48) = v4;
  *(CGFloat *)(v13 + 56) = v5;
}

@end
