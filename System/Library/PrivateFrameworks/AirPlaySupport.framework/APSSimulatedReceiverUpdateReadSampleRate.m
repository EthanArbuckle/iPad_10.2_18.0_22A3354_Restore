@implementation APSSimulatedReceiverUpdateReadSampleRate

double __APSSimulatedReceiverUpdateReadSampleRate_block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 80) = result;
  return result;
}

@end
