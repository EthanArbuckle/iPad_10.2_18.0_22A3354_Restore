@implementation TIGetToggleFourOrFiveRowKeyboardValue

uint64_t __TIGetToggleFourOrFiveRowKeyboardValue_block_invoke()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x24BEB4EA8], "sharedPreferencesController");
  return objc_msgSend(v0, "_configureKey:domain:defaultValue:", CFSTR("ToggleFourOrFiveRowKeyboard"), CFSTR("com.apple.keyboard"), MEMORY[0x24BDBD1C0]);
}

@end
