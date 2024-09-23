@implementation ZN16GPURegionRuntimeC2EP14MPSGraphDeviceP8MPSGraphP18MPSGraphExecutableP12NSDictionaryIP8NSStringS5

const char *___ZN16GPURegionRuntimeC2EP14MPSGraphDeviceP8MPSGraphP18MPSGraphExecutableP12NSDictionaryIP8NSStringS5_EN4mlir8ModuleOpENSB_19FunctionOpInterfaceEjb_block_invoke()
{
  const char *result;

  result = getenv("MPSGRAPH_INTERMEDIATES_ARE_TEMPORARY");
  if (result)
  {
    result = (const char *)atol(result);
    if (!result)
      GPURegionRuntime::GPURegionRuntime(MPSGraphDevice *,MPSGraph *,MPSGraphExecutable *,NSDictionary<NSString *,MPSGraphExecutable *> *,mlir::ModuleOp,mlir::FunctionOpInterface,unsigned int,BOOL)::_intermediatesAreTemporaryEV = 0;
  }
  return result;
}

@end
