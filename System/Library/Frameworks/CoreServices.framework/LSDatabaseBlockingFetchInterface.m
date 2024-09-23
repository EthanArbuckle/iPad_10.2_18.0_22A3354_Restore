@implementation LSDatabaseBlockingFetchInterface

uint64_t __LSDatabaseBlockingFetchInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EDCE41B8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)LSDatabaseBlockingFetchInterface_result;
  LSDatabaseBlockingFetchInterface_result = v0;

  objc_msgSend((id)LSDatabaseBlockingFetchInterface_result, "setClass:forSelector:argumentIndex:ofReply:", _CSStoreGetXPCClass(), sel_getServerStoreBlockingWithCompletionHandler_, 0, 1);
  v2 = (void *)LSDatabaseBlockingFetchInterface_result;
  _FSNodeGetClasses();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_getServerStoreBlockingWithCompletionHandler_, 1, 1);

  return objc_msgSend((id)LSDatabaseBlockingFetchInterface_result, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_getServerStoreBlockingWithCompletionHandler_, 2, 1);
}

@end
