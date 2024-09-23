@implementation CADeviceNeedsTripleBufferedTTL

void __CADeviceNeedsTripleBufferedTTL_block_invoke()
{
  BOOL v0;

  if ((MGIsDeviceOneOfType() & 1) != 0)
  {
    v0 = 1;
  }
  else if (CADeviceSupportsOddQuantaFrameRates())
  {
    if (CADeviceIsPhone::once[0] != -1)
      dispatch_once(CADeviceIsPhone::once, &__block_literal_global_134);
    v0 = CADeviceIsPhone::phone == 0;
  }
  else
  {
    v0 = 0;
  }
  CADeviceNeedsTripleBufferedTTL::wants_triple_buffered_ttl = v0;
}

@end
