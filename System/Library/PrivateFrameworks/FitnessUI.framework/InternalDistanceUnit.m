@implementation InternalDistanceUnit

void ___InternalDistanceUnit_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_InternalDistanceUnit___unit;
  _InternalDistanceUnit___unit = v0;

}

@end
