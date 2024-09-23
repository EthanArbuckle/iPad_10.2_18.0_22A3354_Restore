@implementation NSUnitTemperature(Intents)

- (id)_intents_stringRepresentation
{
  void *v2;
  char v3;
  __CFString *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB3B00], "kelvin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqual:", v2);

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("kelvin");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B00], "celsius");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "isEqual:", v5);

    if ((v6 & 1) != 0)
    {
      v4 = CFSTR("celsius");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3B00], "fahrenheit");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(a1, "isEqual:", v7);

      if ((v8 & 1) == 0)
      {
        v10 = (void *)MEMORY[0x1E0C99DA0];
        v11 = *MEMORY[0x1E0C99768];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown unit %@"), a1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v12, 0);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        objc_exception_throw(v13);
      }
      v4 = CFSTR("fahrenheit");
    }
  }
  -[__CFString if_ASCIIStringByUppercasingFirstCharacter](v4, "if_ASCIIStringByUppercasingFirstCharacter");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
