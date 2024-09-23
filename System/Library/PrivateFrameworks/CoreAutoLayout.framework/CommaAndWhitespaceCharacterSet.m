@implementation CommaAndWhitespaceCharacterSet

id __CommaAndWhitespaceCharacterSet_block_invoke()
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(", \t\n\r\v"));
}

@end
