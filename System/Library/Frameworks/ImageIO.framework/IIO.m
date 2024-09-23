@implementation IIO

uint64_t __IIO_OSAppleInternalBuild_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  IIO_OSAppleInternalBuild::is_internal = result;
  return result;
}

void __IIO_HardwareDecoderDefaultValue_block_invoke()
{
  char *v0;
  const __CFNumber *v1;
  CFNumberRef v2[3];

  v0 = getenv("IIO_use_hw_decoder");
  if (v0)
  {
    IIO_HardwareDecoderDefaultValue::hwDecoderDefaultValue = strcmp(v0, "0") != 0;
  }
  else
  {
    v1 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("IIO_use_hw_decoder"), CFSTR("com.apple.ImageIO"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    if (v1)
    {
      memset(v2, 0, sizeof(v2));
      IIONumber::IIONumber((IIONumber *)v2, v1);
      IIO_HardwareDecoderDefaultValue::hwDecoderDefaultValue = IIONumber::uint8Num(v2) != 0;
      IIONumber::~IIONumber((IIONumber *)v2);
    }
  }
}

void *__IIO_LoadHEIFSymbols_block_invoke_4()
{
  void *result;
  char v1[72];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  strcpy(v1, "/System/Library/Frameworks/VideoToolbox.framework/VideoToolbox");
  result = dlopen(v1, 257);
  if (result)
  {
    result = dlsym(result, "VTAreVideoDecodersRunningInProcess");
    gFunc_VTAreVideoDecodersRunningInProcess = (uint64_t (*)(void))result;
    if (!result)
      return (void *)puts("❌  failed to load 'VTAreVideoDecodersRunningInProcess' ");
  }
  return result;
}

void __IIO_HardwareEncoderDefaultValue_block_invoke()
{
  char *v0;
  const __CFNumber *v1;
  CFNumberRef v2[3];

  v0 = getenv("IIO_use_hw_encoder");
  if (v0)
  {
    IIO_HardwareEncoderDefaultValue::hwEncoderDefaultValue = strcmp(v0, "0") != 0;
  }
  else
  {
    v1 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("IIO_use_hw_encoder"), CFSTR("com.apple.ImageIO"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    if (v1)
    {
      memset(v2, 0, sizeof(v2));
      IIONumber::IIONumber((IIONumber *)v2, v1);
      IIO_HardwareEncoderDefaultValue::hwEncoderDefaultValue = IIONumber::uint8Num(v2) != 0;
      IIONumber::~IIONumber((IIONumber *)v2);
    }
  }
}

@end
