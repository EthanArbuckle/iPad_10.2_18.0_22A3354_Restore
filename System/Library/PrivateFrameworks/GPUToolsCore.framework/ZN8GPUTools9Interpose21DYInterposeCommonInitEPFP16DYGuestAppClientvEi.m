@implementation ZN8GPUTools9Interpose21DYInterposeCommonInitEPFP16DYGuestAppClientvEi

char *___ZN8GPUTools9Interpose21DYInterposeCommonInitEPFP16DYGuestAppClientvEi_block_invoke()
{
  GPUTools::Interpose *v0;

  GPUTools::Interpose::gHostPort = MEMORY[0x2426230C4]();
  v0 = (GPUTools::Interpose *)mach_timebase_info((mach_timebase_info_t)&g_DYTimebaseInfo);
  return GPUTools::Interpose::DYFetchSandboxEntitlements(v0);
}

@end
