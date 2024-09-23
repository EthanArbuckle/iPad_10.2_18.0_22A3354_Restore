@implementation CADeviceHasInternalDiagnostics

uint64_t __CADeviceHasInternalDiagnostics_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  CADeviceHasInternalDiagnostics::internal = result;
  return result;
}

@end
