@implementation MKMapViewUseModernControls

uint64_t ___MKMapViewUseModernControls_block_invoke()
{
  uint64_t result;

  result = _MKLinkedOnOrAfterReleaseSet(2824);
  if ((_DWORD)result)
    result = GEOConfigGetBOOL();
  byte_1EDFB7993 = result;
  return result;
}

@end
