@implementation MFMailDirectoryURL

uint64_t __MFMailDirectoryURL_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", MFMailDirectory());
  MFMailDirectoryURL___MailDirURL = result;
  return result;
}

@end
