@implementation ZN7GnssHal12GpioEmbedded11GpioBackend8instanceEv

GnssHal::GpioEmbedded::GpioBackend *___ZN7GnssHal12GpioEmbedded11GpioBackend8instanceEv_block_invoke()
{
  GnssHal::GpioEmbedded::GpioBackend *v0;
  GnssHal::GpioEmbedded::GpioBackend *result;

  v0 = (GnssHal::GpioEmbedded::GpioBackend *)operator new();
  result = GnssHal::GpioEmbedded::GpioBackend::GpioBackend(v0);
  GnssHal::GpioEmbedded::GpioBackend::fInstance = (uint64_t)v0;
  return result;
}

@end
