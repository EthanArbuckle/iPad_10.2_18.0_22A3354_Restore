@implementation CreateFunctionFromDefaultLibrary

uint64_t __CreateFunctionFromDefaultLibrary_block_invoke()
{
  CreateFunctionFromDefaultLibrary_bundles = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend(MEMORY[0x1E0CB34D0], "allBundles"));
  return objc_msgSend((id)CreateFunctionFromDefaultLibrary_bundles, "addObject:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreImage")));
}

@end
