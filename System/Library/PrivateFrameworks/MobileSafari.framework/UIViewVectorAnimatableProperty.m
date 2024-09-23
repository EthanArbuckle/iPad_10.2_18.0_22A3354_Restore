@implementation UIViewVectorAnimatableProperty

double __84__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setPointValue___block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __83__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setSizeValue___block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __83__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setRectValue___block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a2 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a2 + 8) = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(a1 + 48);
  result = *(double *)(a1 + 56);
  *(double *)(a2 + 24) = result;
  return result;
}

double __88__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setTransformValue___block_invoke(uint64_t a1, uint64_t a2)
{
  double result;

  *(long double *)a2 = log(*(long double *)(a1 + 32));
  *(long double *)(a2 + 8) = log(*(long double *)(a1 + 40));
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 48);
  result = *(double *)(a1 + 56);
  *(double *)(a2 + 40) = result;
  return result;
}

@end
