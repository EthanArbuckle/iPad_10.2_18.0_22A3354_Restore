@implementation NSUnitEnergy(Intents)

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
  void *v11;
  char v12;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0CB3AB0], "kilojoules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqual:", v2);

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("kilojoules");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3AB0], "joules");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "isEqual:", v5);

    if ((v6 & 1) != 0)
    {
      v4 = CFSTR("joules");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3AB0], "kilocalories");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(a1, "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        v4 = CFSTR("kilocalories");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3AB0], "calories");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(a1, "isEqual:", v9);

        if ((v10 & 1) != 0)
        {
          v4 = CFSTR("calories");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "isEqual:", v11);

          if ((v12 & 1) == 0)
          {
            v14 = (void *)MEMORY[0x1E0C99DA0];
            v15 = *MEMORY[0x1E0C99768];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown unit %@"), a1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, v16, 0);
            v17 = (id)objc_claimAutoreleasedReturnValue();

            objc_exception_throw(v17);
          }
          v4 = CFSTR("kilowattHours");
        }
      }
    }
  }
  -[__CFString if_ASCIIStringByUppercasingFirstCharacter](v4, "if_ASCIIStringByUppercasingFirstCharacter");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
