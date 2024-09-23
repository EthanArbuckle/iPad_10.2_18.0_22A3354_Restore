@implementation ARAddJasperTechniquesToParent

void __ARAddJasperTechniquesToParent_block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2 - 1;
  if ((unint64_t)(a2 - 1) > 3)
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v5 = qword_1B3BE3708[v4];
    v6 = qword_1B3BE3728[v4];
  }
  *a4 = v5;
  *a3 = v6;
}

@end
