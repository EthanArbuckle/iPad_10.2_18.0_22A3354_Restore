@implementation NSUnitLength(Intents)

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
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  void *v43;
  char v44;
  void *v45;
  char v46;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;

  objc_msgSend(MEMORY[0x1E0CB3AD8], "megameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqual:", v2);

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("megameters");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3AD8], "kilometers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "isEqual:", v5);

    if ((v6 & 1) != 0)
    {
      v4 = CFSTR("kilometers");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3AD8], "hectometers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(a1, "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        v4 = CFSTR("hectometers");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3AD8], "decameters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(a1, "isEqual:", v9);

        if ((v10 & 1) != 0)
        {
          v4 = CFSTR("decameters");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "isEqual:", v11);

          if ((v12 & 1) != 0)
          {
            v4 = CFSTR("meters");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3AD8], "decimeters");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(a1, "isEqual:", v13);

            if ((v14 & 1) != 0)
            {
              v4 = CFSTR("decimeters");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3AD8], "centimeters");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(a1, "isEqual:", v15);

              if ((v16 & 1) != 0)
              {
                v4 = CFSTR("centimeters");
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3AD8], "millimeters");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(a1, "isEqual:", v17);

                if ((v18 & 1) != 0)
                {
                  v4 = CFSTR("millimeters");
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB3AD8], "micrometers");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(a1, "isEqual:", v19);

                  if ((v20 & 1) != 0)
                  {
                    v4 = CFSTR("micrometers");
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CB3AD8], "nanometers");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = objc_msgSend(a1, "isEqual:", v21);

                    if ((v22 & 1) != 0)
                    {
                      v4 = CFSTR("nanometers");
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CB3AD8], "picometers");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      v24 = objc_msgSend(a1, "isEqual:", v23);

                      if ((v24 & 1) != 0)
                      {
                        v4 = CFSTR("picometers");
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CB3AD8], "inches");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        v26 = objc_msgSend(a1, "isEqual:", v25);

                        if ((v26 & 1) != 0)
                        {
                          v4 = CFSTR("inches");
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
                          v27 = (void *)objc_claimAutoreleasedReturnValue();
                          v28 = objc_msgSend(a1, "isEqual:", v27);

                          if ((v28 & 1) != 0)
                          {
                            v4 = CFSTR("feet");
                          }
                          else
                          {
                            objc_msgSend(MEMORY[0x1E0CB3AD8], "yards");
                            v29 = (void *)objc_claimAutoreleasedReturnValue();
                            v30 = objc_msgSend(a1, "isEqual:", v29);

                            if ((v30 & 1) != 0)
                            {
                              v4 = CFSTR("yards");
                            }
                            else
                            {
                              objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
                              v31 = (void *)objc_claimAutoreleasedReturnValue();
                              v32 = objc_msgSend(a1, "isEqual:", v31);

                              if ((v32 & 1) != 0)
                              {
                                v4 = CFSTR("miles");
                              }
                              else
                              {
                                objc_msgSend(MEMORY[0x1E0CB3AD8], "scandinavianMiles");
                                v33 = (void *)objc_claimAutoreleasedReturnValue();
                                v34 = objc_msgSend(a1, "isEqual:", v33);

                                if ((v34 & 1) != 0)
                                {
                                  v4 = CFSTR("scandinavianMiles");
                                }
                                else
                                {
                                  objc_msgSend(MEMORY[0x1E0CB3AD8], "lightyears");
                                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                                  v36 = objc_msgSend(a1, "isEqual:", v35);

                                  if ((v36 & 1) != 0)
                                  {
                                    v4 = CFSTR("lightyears");
                                  }
                                  else
                                  {
                                    objc_msgSend(MEMORY[0x1E0CB3AD8], "nauticalMiles");
                                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                                    v38 = objc_msgSend(a1, "isEqual:", v37);

                                    if ((v38 & 1) != 0)
                                    {
                                      v4 = CFSTR("nauticalMiles");
                                    }
                                    else
                                    {
                                      objc_msgSend(MEMORY[0x1E0CB3AD8], "fathoms");
                                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                                      v40 = objc_msgSend(a1, "isEqual:", v39);

                                      if ((v40 & 1) != 0)
                                      {
                                        v4 = CFSTR("fathoms");
                                      }
                                      else
                                      {
                                        objc_msgSend(MEMORY[0x1E0CB3AD8], "furlongs");
                                        v41 = (void *)objc_claimAutoreleasedReturnValue();
                                        v42 = objc_msgSend(a1, "isEqual:", v41);

                                        if ((v42 & 1) != 0)
                                        {
                                          v4 = CFSTR("furlongs");
                                        }
                                        else
                                        {
                                          objc_msgSend(MEMORY[0x1E0CB3AD8], "astronomicalUnits");
                                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                                          v44 = objc_msgSend(a1, "isEqual:", v43);

                                          if ((v44 & 1) != 0)
                                          {
                                            v4 = CFSTR("astronomicalUnits");
                                          }
                                          else
                                          {
                                            objc_msgSend(MEMORY[0x1E0CB3AD8], "parsecs");
                                            v45 = (void *)objc_claimAutoreleasedReturnValue();
                                            v46 = objc_msgSend(a1, "isEqual:", v45);

                                            if ((v46 & 1) == 0)
                                            {
                                              v48 = (void *)MEMORY[0x1E0C99DA0];
                                              v49 = *MEMORY[0x1E0C99768];
                                              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown unit %@"), a1);
                                              v50 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_msgSend(v48, "exceptionWithName:reason:userInfo:", v49, v50, 0);
                                              v51 = (id)objc_claimAutoreleasedReturnValue();

                                              objc_exception_throw(v51);
                                            }
                                            v4 = CFSTR("parsecs");
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
