@implementation ZN17IIO

const char *___ZN17IIO_ReaderHandler12UseAppleJPEGEv_block_invoke()
{
  const char *result;

  result = getenv("ImageIO_Use_AppleJPEG");
  if (result)
  {
    result = (const char *)atoi(result);
    IIO_ReaderHandler::UseAppleJPEG(void)::gUseAppleJPEGPlugin = (_DWORD)result != 0;
  }
  return result;
}

@end
