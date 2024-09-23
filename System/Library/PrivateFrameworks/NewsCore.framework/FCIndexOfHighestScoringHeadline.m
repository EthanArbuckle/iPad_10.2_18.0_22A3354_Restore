@implementation FCIndexOfHighestScoringHeadline

void __FCIndexOfHighestScoringHeadline_block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  double v5;
  id v6;

  v6 = a2;
  v5 = (*(double (**)(void))(a1[4] + 16))();
  if (v5 > *(double *)(*(_QWORD *)(a1[6] + 8) + 24) && (*(unsigned int (**)(void))(a1[5] + 16))())
  {
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a3;
  }

}

@end
