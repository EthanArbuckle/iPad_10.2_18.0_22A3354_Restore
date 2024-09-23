@implementation GEOGetProxyAuthFromResourceManifest

uint64_t __GEOGetProxyAuthFromResourceManifest_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a2, "useAuthProxy"));
}

@end
