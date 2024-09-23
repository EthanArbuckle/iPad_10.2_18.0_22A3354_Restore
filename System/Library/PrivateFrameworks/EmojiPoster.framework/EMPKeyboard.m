@implementation EMPKeyboard

+ (CGSize)keyboardSizeForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3938], "keyboardSizeForInterfaceOrientation:", a3);
  result.height = v4;
  result.width = v3;
  return result;
}

@end
