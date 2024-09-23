@implementation FCKeyIdentifiersFromHLSMetadata

uint64_t __FCKeyIdentifiersFromHLSMetadata_block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("uri"));
}

@end
