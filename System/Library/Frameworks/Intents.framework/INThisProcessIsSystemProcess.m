@implementation INThisProcessIsSystemProcess

void __INThisProcessIsSystemProcess_block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CA5890], "bundleProxyForCurrentProcess");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    v3 = v0;
    v2 = objc_msgSend(v0, "if_isSystem");
    v1 = v3;
  }
  else
  {
    v2 = 1;
  }
  INThisProcessIsSystemProcess_isSystemProcess = v2;

}

@end
