@implementation InitializeURLAllowedCharacterSets

CFCharacterSetRef __InitializeURLAllowedCharacterSets_block_invoke()
{
  const __CFString *v0;
  CFCharacterSetRef result;

  sURLAllowedCharacterSets = CFAllocatorAllocateTyped(0, 56, 0x6004044C4A2DFLL, 0);
  *(_QWORD *)sURLAllowedCharacterSets = CFCharacterSetCreateWithCharactersInString(0, CFSTR("!$&'()*+,-.0123456789;=ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"));
  *(_QWORD *)(sURLAllowedCharacterSets + 8) = CFCharacterSetCreateWithCharactersInString(0, CFSTR("!$&'()*+,-.0123456789;=ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"));
  *(_QWORD *)(sURLAllowedCharacterSets + 16) = CFCharacterSetCreateWithCharactersInString(0, CFSTR("!$&'()*+,-.0123456789:;=ABCDEFGHIJKLMNOPQRSTUVWXYZ[]_abcdefghijklmnopqrstuvwxyz~"));
  *(_QWORD *)(sURLAllowedCharacterSets + 48) = CFCharacterSetCreateWithCharactersInString(0, CFSTR("0123456789"));
  if (_CFURIParserSemicolonAllowedInPath_onceToken != -1)
    dispatch_once(&_CFURIParserSemicolonAllowedInPath_onceToken, &__block_literal_global_13);
  if (_CFURIParserSemicolonAllowedInPath_allowSemicolon)
    v0 = CFSTR("!$&'()*+,-./0123456789:;=@ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~");
  else
    v0 = CFSTR("!$&'()*+,-./0123456789:=@ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~");
  *(_QWORD *)(sURLAllowedCharacterSets + 24) = CFCharacterSetCreateWithCharactersInString(0, v0);
  *(_QWORD *)(sURLAllowedCharacterSets + 32) = CFCharacterSetCreateWithCharactersInString(0, CFSTR("!$&'()*+,-./0123456789:;=?@ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"));
  result = CFCharacterSetCreateWithCharactersInString(0, CFSTR("!$&'()*+,-./0123456789:;=?@ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"));
  *(_QWORD *)(sURLAllowedCharacterSets + 40) = result;
  return result;
}

@end
