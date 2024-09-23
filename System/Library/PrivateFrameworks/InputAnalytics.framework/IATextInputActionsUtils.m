@implementation IATextInputActionsUtils

+ (int64_t)setBool:(BOOL)a3 forField:(int64_t)a4 inFlagOptions:(int64_t)a5
{
  if (a3)
    return a5 | a4;
  else
    return a5 & ~a4;
}

+ (BOOL)isEmojiSearchSetInFlagOptions:(int64_t)a3
{
  return a3 & 1;
}

+ (int64_t)setEmojiSearch:(BOOL)a3 inFlagOptions:(int64_t)a4
{
  return MEMORY[0x24BEDD108](a1, sel_setBool_forField_inFlagOptions_, a3, 1, a4);
}

+ (BOOL)isMarkedTextSetInFlagOptions:(int64_t)a3
{
  return ((unint64_t)a3 >> 1) & 1;
}

+ (int64_t)setMarkedText:(BOOL)a3 inFlagOptions:(int64_t)a4
{
  return MEMORY[0x24BEDD108](a1, sel_setBool_forField_inFlagOptions_, a3, 2, a4);
}

+ (BOOL)isWebSetInFlagOptions:(int64_t)a3
{
  return ((unint64_t)a3 >> 2) & 1;
}

+ (int64_t)setWeb:(BOOL)a3 inFlagOptions:(int64_t)a4
{
  return MEMORY[0x24BEDD108](a1, sel_setBool_forField_inFlagOptions_, a3, 4, a4);
}

+ (id)stringForSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE)
    return CFSTR("Unspecified");
  else
    return off_250F8F358[a3 - 1];
}

+ (id)stringForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x10)
    return CFSTR("Unspecified");
  else
    return off_250F8F3D0[a3 - 1];
}

+ (id)stringForReplaceWithCandidateType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("CandidateUnknown");
  else
    return off_250F8F458[a3 - 1];
}

+ (int64_t)sessionActionsEnumFromSource:(int64_t)a3 type:(int64_t)a4
{
  uint64_t v4;
  int64_t result;
  int64_t v8;

  result = objc_msgSend_sessionActionsEnumFromSource_(IATextInputActionsUtils, a2, a3, a4, v4);
  if (result != 1)
    return result;
  if (a3 == 12)
  {
    if (a4 != 15)
      return 0;
    return 10;
  }
  if (a3 == 4)
  {
    if (a4 <= 14)
    {
      if (a4 == 1)
        return 6;
      if (a4 == 2)
        return 7;
      return 0;
    }
    if (a4 != 15)
    {
      if (a4 == 16)
        return 11;
      return 0;
    }
    return 10;
  }
  if (a3 != 3)
    return 0;
  v8 = 5;
  if (a4 != 1)
    v8 = 0;
  if (a4 == 15)
    return 10;
  else
    return v8;
}

+ (int64_t)sessionActionsEnumFromSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE)
    return 2;
  else
    return qword_23F0A22F0[a3 - 1];
}

+ (id)stringForSessionActionsEnum:(int64_t)a3
{
  if ((unint64_t)a3 > 0xD)
    return CFSTR("U");
  else
    return off_250F8F470[a3];
}

+ (id)stringForKeyboardDockItemButtonPressResult:(unint64_t)a3
{
  if (a3 > 3)
    return CFSTR("?");
  else
    return off_250F8F4E0[a3];
}

+ (id)stringForKeyboardDockItemButtonType:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("?");
  else
    return off_250F8F500[a3];
}

+ (unint64_t)log10WholeNumberForUnsignedInt:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 1;
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (a3 >> 4 >= 0x271)
    v6 = 5;
  if (a3 >= 0x3E8)
    v5 = v6;
  if (a3 >= 0x64)
    v4 = v5;
  if (a3 >= 0xA)
    v3 = v4;
  if (a3)
    return v3;
  else
    return 0;
}

+ (unint64_t)log10IntegerForInt:(int64_t)a3
{
  if (a3 < -9999)
    return 0;
  if (a3 < -999)
    return 1;
  if (a3 < -99)
    return 2;
  if (a3 < -9)
    return 3;
  if (a3 < 0)
    return 4;
  if (!a3)
    return 5;
  if ((unint64_t)a3 < 0xA)
    return 6;
  if ((unint64_t)a3 < 0x64)
    return 7;
  if ((unint64_t)a3 < 0x3E8)
    return 8;
  if ((unint64_t)a3 >> 4 < 0x271)
    return 9;
  return 10;
}

@end
