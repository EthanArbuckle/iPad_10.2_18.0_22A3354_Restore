@implementation NSURL(WebKit)

+ (uint64_t)nu_canHandleNavigationAction:()WebKit
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetFrame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isMainFrame");
  v7 = objc_msgSend(MEMORY[0x24BDFA960], "_canHandleRequest:forMainFrame:", v4, v6);

  return v7;
}

@end
