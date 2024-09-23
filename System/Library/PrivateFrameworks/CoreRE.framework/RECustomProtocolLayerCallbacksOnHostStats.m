@implementation RECustomProtocolLayerCallbacksOnHostStats

double __RECustomProtocolLayerCallbacksOnHostStats_block_invoke(uint64_t a1, uint64_t a2)
{
  double result;
  uint64_t v4;
  __int128 v5;

  v5 = 0uLL;
  v4 = 0;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    *(_QWORD *)a2 = v4;
    result = *(double *)&v5;
    *(_OWORD *)(a2 + 8) = v5;
  }
  return result;
}

@end
