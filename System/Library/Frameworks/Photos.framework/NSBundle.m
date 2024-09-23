@implementation NSBundle

void __41__NSBundle_Photos__ph_isFirstPartyBundle__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  ph_isFirstPartyBundle_isFirstPartyBundle = objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple."));

}

@end
