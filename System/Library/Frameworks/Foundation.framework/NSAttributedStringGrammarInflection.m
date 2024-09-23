@implementation NSAttributedStringGrammarInflection

uint64_t __78___NSAttributedStringGrammarInflection_NSInflectionPresets__presetInflections__block_invoke()
{
  uint64_t result;
  _QWORD v1[4];

  v1[3] = *MEMORY[0x1E0C80C00];
  v1[0] = -[_NSAttributedStringGrammarInflection _initWithGender:]([_NSAttributedStringGrammarInflection alloc], "_initWithGender:", 2);
  v1[1] = -[_NSAttributedStringGrammarInflection _initWithGender:]([_NSAttributedStringGrammarInflection alloc], "_initWithGender:", 1, v1[0]);
  v1[2] = -[_NSAttributedStringGrammarInflection _initWithGender:]([_NSAttributedStringGrammarInflection alloc], "_initWithGender:", 3);
  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 3), "copy");
  qword_1ECD0A410 = result;
  return result;
}

@end
