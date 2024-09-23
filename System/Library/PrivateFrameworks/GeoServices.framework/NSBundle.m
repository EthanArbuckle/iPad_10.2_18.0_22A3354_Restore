@implementation NSBundle

void __42__NSBundle_GeoServicesBundle____geoBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_287;
  _MergedGlobals_287 = v0;

}

@end
