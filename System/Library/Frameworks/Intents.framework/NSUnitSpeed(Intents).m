@implementation NSUnitSpeed(Intents)

- (id)_intents_stringRepresentation
{
  void *v2;
  char v3;
  __CFString *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0CB3AF8], "metersPerSecond");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqual:", v2);

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("metersPerSecond");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3AF8], "kilometersPerHour");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "isEqual:", v5);

    if ((v6 & 1) != 0)
    {
      v4 = CFSTR("kilometersPerHour");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3AF8], "milesPerHour");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(a1, "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        v4 = CFSTR("milesPerHour");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3AF8], "knots");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(a1, "isEqual:", v9);

        if ((v10 & 1) == 0)
        {
          v12 = (void *)MEMORY[0x1E0C99DA0];
          v13 = *MEMORY[0x1E0C99768];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown unit %@"), a1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, v14, 0);
          v15 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v15);
        }
        v4 = CFSTR("knots");
      }
    }
  }
  -[__CFString if_ASCIIStringByUppercasingFirstCharacter](v4, "if_ASCIIStringByUppercasingFirstCharacter");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
