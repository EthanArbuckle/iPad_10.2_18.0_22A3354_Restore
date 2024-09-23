@implementation CIFilter(PrivateDepthUtilities)

+ (void)getMinMaxSimulatedApertureFrom:()PrivateDepthUtilities minValue:maxValue:version:.cold.1(int *a1, NSObject *a2)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = +[CIFilter maxSDOFRenderingVersionSupported](CIFilter, "maxSDOFRenderingVersionSupported");
  _os_log_debug_impl(&dword_1921E4000, a2, OS_LOG_TYPE_DEBUG, "Unified Rendering does not support rendering this version (%d); max version = %d; returning as unajustable image.",
    (uint8_t *)v4,
    0xEu);
}

@end
