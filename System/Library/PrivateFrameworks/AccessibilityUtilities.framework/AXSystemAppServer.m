@implementation AXSystemAppServer

+ (id)server
{
  if (server_onceToken_6 != -1)
    dispatch_once(&server_onceToken_6, &__block_literal_global_38);
  return (id)objc_msgSend((id)server__ServerClass, "server");
}

uint64_t __27__AXSystemAppServer_server__block_invoke()
{
  void *v0;
  int v1;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0D10780], "sharedSystemShellSwitcher");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isClarityBoardEnabled");

  if (v1)
    result = objc_opt_class();
  else
    result = (uint64_t)NSClassFromString(CFSTR("AXSpringBoardServer"));
  server__ServerClass = result;
  return result;
}

@end
