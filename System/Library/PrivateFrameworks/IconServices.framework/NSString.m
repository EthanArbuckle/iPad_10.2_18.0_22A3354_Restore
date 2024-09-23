@implementation NSString

void __70__NSString_FileNameConventionAdditions___IS_imageMetadataFromFileName__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)_IS_imageMetadataFromFileName_regexp;
  _IS_imageMetadataFromFileName_regexp = (uint64_t)CFSTR("^(.+?)[_|-]?(?:\\[(selected)\\])?([0-9]+)?(?:x[0-9]+)?(?:@([1|2|3])x)?$");

  if (!_IS_imageMetadataFromFileName_matcher)
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^(.+?)[_|-]?(?:\\[(selected)\\])?([0-9]+)?(?:x[0-9]+)?(?:@([1|2|3])x)?$"), 0, 0);
    v2 = (void *)_IS_imageMetadataFromFileName_matcher;
    _IS_imageMetadataFromFileName_matcher = v1;

    if (!_IS_imageMetadataFromFileName_matcher)
      __70__NSString_FileNameConventionAdditions___IS_imageMetadataFromFileName__block_invoke_cold_1();
  }
}

void __82__NSString_FileNameConventionAdditions___IS_scaleableResourceMetadataFromFileName__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)_IS_scaleableResourceMetadataFromFileName_regexp;
  _IS_scaleableResourceMetadataFromFileName_regexp = (uint64_t)CFSTR("^(.+?)(?:_\\[(selected)\\])?$");

  if (!_IS_scaleableResourceMetadataFromFileName_matcher)
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^(.+?)(?:_\\[(selected)\\])?$"), 0, 0);
    v2 = (void *)_IS_scaleableResourceMetadataFromFileName_matcher;
    _IS_scaleableResourceMetadataFromFileName_matcher = v1;

    if (!_IS_scaleableResourceMetadataFromFileName_matcher)
      __82__NSString_FileNameConventionAdditions___IS_scaleableResourceMetadataFromFileName__block_invoke_cold_1();
  }
}

void __70__NSString_FileNameConventionAdditions___IS_imageMetadataFromFileName__block_invoke_cold_1()
{
  __assert_rtn("-[NSString(FileNameConventionAdditions) _IS_imageMetadataFromFileName]_block_invoke", "NSString+FileNameConventionAdditions.m", 109, "matcher");
}

void __82__NSString_FileNameConventionAdditions___IS_scaleableResourceMetadataFromFileName__block_invoke_cold_1()
{
  __assert_rtn("-[NSString(FileNameConventionAdditions) _IS_scaleableResourceMetadataFromFileName]_block_invoke", "NSString+FileNameConventionAdditions.m", 174, "matcher");
}

@end
