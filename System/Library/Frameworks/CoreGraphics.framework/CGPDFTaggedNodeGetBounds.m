@implementation CGPDFTaggedNodeGetBounds

uint64_t __CGPDFTaggedNodeGetBounds_block_invoke(uint64_t a1, uint64_t a2)
{
  double *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGRect v12;
  CGRect v13;

  v3 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = v3[6];
  v5 = v3[7];
  v6 = v3[8];
  v7 = v3[9];
  v13.origin.x = CGPDFTaggedNodeGetBounds(a2);
  v13.origin.y = v8;
  v13.size.width = v9;
  v13.size.height = v10;
  v12.origin.x = v4;
  v12.origin.y = v5;
  v12.size.width = v6;
  v12.size.height = v7;
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = CGRectUnion(v12, v13);
  return 1;
}

@end
