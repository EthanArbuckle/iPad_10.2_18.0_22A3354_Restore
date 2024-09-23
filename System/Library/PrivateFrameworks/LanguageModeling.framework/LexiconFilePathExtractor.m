@implementation LexiconFilePathExtractor

- (id)lexiconFilePath:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  return (id)MEMORY[0x1E0DE7D20](v3, sel_pathForResource_ofType_);
}

@end
