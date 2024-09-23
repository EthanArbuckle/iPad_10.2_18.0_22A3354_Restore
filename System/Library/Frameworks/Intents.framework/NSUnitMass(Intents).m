@implementation NSUnitMass(Intents)

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
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;

  objc_msgSend(MEMORY[0x1E0CB3AE0], "kilograms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqual:", v2);

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("kilograms");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3AE0], "grams");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "isEqual:", v5);

    if ((v6 & 1) != 0)
    {
      v4 = CFSTR("grams");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3AE0], "decigrams");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(a1, "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        v4 = CFSTR("decigrams");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "centigrams");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(a1, "isEqual:", v9);

        if ((v10 & 1) != 0)
        {
          v4 = CFSTR("centigrams");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3AE0], "milligrams");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "isEqual:", v11);

          if ((v12 & 1) != 0)
          {
            v4 = CFSTR("milligrams");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3AE0], "micrograms");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(a1, "isEqual:", v13);

            if ((v14 & 1) != 0)
            {
              v4 = CFSTR("micrograms");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3AE0], "nanograms");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(a1, "isEqual:", v15);

              if ((v16 & 1) != 0)
              {
                v4 = CFSTR("nanograms");
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3AE0], "picograms");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(a1, "isEqual:", v17);

                if ((v18 & 1) != 0)
                {
                  v4 = CFSTR("picograms");
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB3AE0], "ounces");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(a1, "isEqual:", v19);

                  if ((v20 & 1) != 0)
                  {
                    v4 = CFSTR("ounces");
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CB3AE0], "poundsMass");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = objc_msgSend(a1, "isEqual:", v21);

                    if ((v22 & 1) != 0)
                    {
                      v4 = CFSTR("poundsMass");
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CB3AE0], "stones");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      v24 = objc_msgSend(a1, "isEqual:", v23);

                      if ((v24 & 1) != 0)
                      {
                        v4 = CFSTR("stones");
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CB3AE0], "metricTons");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        v26 = objc_msgSend(a1, "isEqual:", v25);

                        if ((v26 & 1) != 0)
                        {
                          v4 = CFSTR("metricTons");
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x1E0CB3AE0], "shortTons");
                          v27 = (void *)objc_claimAutoreleasedReturnValue();
                          v28 = objc_msgSend(a1, "isEqual:", v27);

                          if ((v28 & 1) != 0)
                          {
                            v4 = CFSTR("shortTons");
                          }
                          else
                          {
                            objc_msgSend(MEMORY[0x1E0CB3AE0], "carats");
                            v29 = (void *)objc_claimAutoreleasedReturnValue();
                            v30 = objc_msgSend(a1, "isEqual:", v29);

                            if ((v30 & 1) != 0)
                            {
                              v4 = CFSTR("carats");
                            }
                            else
                            {
                              objc_msgSend(MEMORY[0x1E0CB3AE0], "ouncesTroy");
                              v31 = (void *)objc_claimAutoreleasedReturnValue();
                              v32 = objc_msgSend(a1, "isEqual:", v31);

                              if ((v32 & 1) != 0)
                              {
                                v4 = CFSTR("ouncesTroy");
                              }
                              else
                              {
                                objc_msgSend(MEMORY[0x1E0CB3AE0], "slugs");
                                v33 = (void *)objc_claimAutoreleasedReturnValue();
                                v34 = objc_msgSend(a1, "isEqual:", v33);

                                if ((v34 & 1) == 0)
                                {
                                  v36 = (void *)MEMORY[0x1E0C99DA0];
                                  v37 = *MEMORY[0x1E0C99768];
                                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown unit %@"), a1);
                                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v36, "exceptionWithName:reason:userInfo:", v37, v38, 0);
                                  v39 = (id)objc_claimAutoreleasedReturnValue();

                                  objc_exception_throw(v39);
                                }
                                v4 = CFSTR("slugs");
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  -[__CFString if_ASCIIStringByUppercasingFirstCharacter](v4, "if_ASCIIStringByUppercasingFirstCharacter");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
