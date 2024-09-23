@implementation MCPasscodeUtilities

+ (int)unlockScreenTypeForPasscode:(id)a3 outSimplePasscodeType:(int *)a4
{
  void *v5;

  +[MCPasscodeManager characteristicsDictionaryFromPasscode:](MCPasscodeManager, "characteristicsDictionaryFromPasscode:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = +[MCPasscodeManager unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:](MCPasscodeManager, "unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:", v5, a4);

  return (int)a4;
}

+ (int)unlockScreenTypeForUMUserPasscodeType:(unint64_t)a3 outSimplePasscodeType:(int *)a4
{
  int v4;
  int result;

  if (a3 > 2)
  {
    result = 2;
    v4 = -1;
    if (!a4)
      return result;
    goto LABEL_5;
  }
  v4 = dword_19EDA28A8[a3];
  result = dword_19EDA28B4[a3];
  if (a4)
LABEL_5:
    *a4 = v4;
  return result;
}

+ (id)defaultPublicDictionaryForUMUserPasscodeType:(unint64_t)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v3 = objc_msgSend(a1, "unlockScreenTypeForUMUserPasscodeType:outSimplePasscodeType:", a3, &v8);
  v9[0] = CFSTR("simpleType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = CFSTR("keyboardType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
