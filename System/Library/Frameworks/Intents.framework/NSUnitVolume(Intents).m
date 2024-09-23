@implementation NSUnitVolume(Intents)

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
  void *v47;
  char v48;
  void *v49;
  char v50;
  void *v51;
  char v52;
  void *v53;
  char v54;
  void *v55;
  char v56;
  void *v57;
  char v58;
  void *v59;
  char v60;
  void *v61;
  char v62;
  void *v63;
  char v64;
  void *v66;
  uint64_t v67;
  void *v68;
  id v69;

  objc_msgSend(MEMORY[0x1E0CB3B08], "megaliters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqual:", v2);

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("megaliters");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3B08], "kiloliters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(a1, "isEqual:", v5);

    if ((v6 & 1) != 0)
    {
      v4 = CFSTR("kiloliters");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3B08], "liters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(a1, "isEqual:", v7);

      if ((v8 & 1) != 0)
      {
        v4 = CFSTR("liters");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "deciliters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(a1, "isEqual:", v9);

        if ((v10 & 1) != 0)
        {
          v4 = CFSTR("deciliters");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3B08], "centiliters");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(a1, "isEqual:", v11);

          if ((v12 & 1) != 0)
          {
            v4 = CFSTR("centiliters");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3B08], "milliliters");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(a1, "isEqual:", v13);

            if ((v14 & 1) != 0)
            {
              v4 = CFSTR("milliliters");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3B08], "cubicKilometers");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(a1, "isEqual:", v15);

              if ((v16 & 1) != 0)
              {
                v4 = CFSTR("cubicKilometers");
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMeters");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(a1, "isEqual:", v17);

                if ((v18 & 1) != 0)
                {
                  v4 = CFSTR("cubicMeters");
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB3B08], "cubicDecimeters");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(a1, "isEqual:", v19);

                  if ((v20 & 1) != 0)
                  {
                    v4 = CFSTR("cubicDecimeters");
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CB3B08], "cubicCentimeters");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = objc_msgSend(a1, "isEqual:", v21);

                    if ((v22 & 1) != 0)
                    {
                      v4 = CFSTR("cubicCentimeters");
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMillimeters");
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      v24 = objc_msgSend(a1, "isEqual:", v23);

                      if ((v24 & 1) != 0)
                      {
                        v4 = CFSTR("cubicMillimeters");
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CB3B08], "cubicInches");
                        v25 = (void *)objc_claimAutoreleasedReturnValue();
                        v26 = objc_msgSend(a1, "isEqual:", v25);

                        if ((v26 & 1) != 0)
                        {
                          v4 = CFSTR("cubicInches");
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x1E0CB3B08], "cubicFeet");
                          v27 = (void *)objc_claimAutoreleasedReturnValue();
                          v28 = objc_msgSend(a1, "isEqual:", v27);

                          if ((v28 & 1) != 0)
                          {
                            v4 = CFSTR("cubicFeet");
                          }
                          else
                          {
                            objc_msgSend(MEMORY[0x1E0CB3B08], "cubicYards");
                            v29 = (void *)objc_claimAutoreleasedReturnValue();
                            v30 = objc_msgSend(a1, "isEqual:", v29);

                            if ((v30 & 1) != 0)
                            {
                              v4 = CFSTR("cubicYards");
                            }
                            else
                            {
                              objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMiles");
                              v31 = (void *)objc_claimAutoreleasedReturnValue();
                              v32 = objc_msgSend(a1, "isEqual:", v31);

                              if ((v32 & 1) != 0)
                              {
                                v4 = CFSTR("cubicMiles");
                              }
                              else
                              {
                                objc_msgSend(MEMORY[0x1E0CB3B08], "acreFeet");
                                v33 = (void *)objc_claimAutoreleasedReturnValue();
                                v34 = objc_msgSend(a1, "isEqual:", v33);

                                if ((v34 & 1) != 0)
                                {
                                  v4 = CFSTR("acreFeet");
                                }
                                else
                                {
                                  objc_msgSend(MEMORY[0x1E0CB3B08], "bushels");
                                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                                  v36 = objc_msgSend(a1, "isEqual:", v35);

                                  if ((v36 & 1) != 0)
                                  {
                                    v4 = CFSTR("bushels");
                                  }
                                  else
                                  {
                                    objc_msgSend(MEMORY[0x1E0CB3B08], "teaspoons");
                                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                                    v38 = objc_msgSend(a1, "isEqual:", v37);

                                    if ((v38 & 1) != 0)
                                    {
                                      v4 = CFSTR("teaspoons");
                                    }
                                    else
                                    {
                                      objc_msgSend(MEMORY[0x1E0CB3B08], "tablespoons");
                                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                                      v40 = objc_msgSend(a1, "isEqual:", v39);

                                      if ((v40 & 1) != 0)
                                      {
                                        v4 = CFSTR("tablespoons");
                                      }
                                      else
                                      {
                                        objc_msgSend(MEMORY[0x1E0CB3B08], "fluidOunces");
                                        v41 = (void *)objc_claimAutoreleasedReturnValue();
                                        v42 = objc_msgSend(a1, "isEqual:", v41);

                                        if ((v42 & 1) != 0)
                                        {
                                          v4 = CFSTR("fluidOunces");
                                        }
                                        else
                                        {
                                          objc_msgSend(MEMORY[0x1E0CB3B08], "cups");
                                          v43 = (void *)objc_claimAutoreleasedReturnValue();
                                          v44 = objc_msgSend(a1, "isEqual:", v43);

                                          if ((v44 & 1) != 0)
                                          {
                                            v4 = CFSTR("cups");
                                          }
                                          else
                                          {
                                            objc_msgSend(MEMORY[0x1E0CB3B08], "pints");
                                            v45 = (void *)objc_claimAutoreleasedReturnValue();
                                            v46 = objc_msgSend(a1, "isEqual:", v45);

                                            if ((v46 & 1) != 0)
                                            {
                                              v4 = CFSTR("pints");
                                            }
                                            else
                                            {
                                              objc_msgSend(MEMORY[0x1E0CB3B08], "quarts");
                                              v47 = (void *)objc_claimAutoreleasedReturnValue();
                                              v48 = objc_msgSend(a1, "isEqual:", v47);

                                              if ((v48 & 1) != 0)
                                              {
                                                v4 = CFSTR("quarts");
                                              }
                                              else
                                              {
                                                objc_msgSend(MEMORY[0x1E0CB3B08], "gallons");
                                                v49 = (void *)objc_claimAutoreleasedReturnValue();
                                                v50 = objc_msgSend(a1, "isEqual:", v49);

                                                if ((v50 & 1) != 0)
                                                {
                                                  v4 = CFSTR("gallons");
                                                }
                                                else
                                                {
                                                  objc_msgSend(MEMORY[0x1E0CB3B08], "imperialTeaspoons");
                                                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v52 = objc_msgSend(a1, "isEqual:", v51);

                                                  if ((v52 & 1) != 0)
                                                  {
                                                    v4 = CFSTR("imperialTeaspoons");
                                                  }
                                                  else
                                                  {
                                                    objc_msgSend(MEMORY[0x1E0CB3B08], "imperialTablespoons");
                                                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v54 = objc_msgSend(a1, "isEqual:", v53);

                                                    if ((v54 & 1) != 0)
                                                    {
                                                      v4 = CFSTR("imperialTablespoons");
                                                    }
                                                    else
                                                    {
                                                      objc_msgSend(MEMORY[0x1E0CB3B08], "imperialFluidOunces");
                                                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                                                      v56 = objc_msgSend(a1, "isEqual:", v55);

                                                      if ((v56 & 1) != 0)
                                                      {
                                                        v4 = CFSTR("imperialFluidOunces");
                                                      }
                                                      else
                                                      {
                                                        objc_msgSend(MEMORY[0x1E0CB3B08], "imperialPints");
                                                        v57 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v58 = objc_msgSend(a1, "isEqual:", v57);

                                                        if ((v58 & 1) != 0)
                                                        {
                                                          v4 = CFSTR("imperialPints");
                                                        }
                                                        else
                                                        {
                                                          objc_msgSend(MEMORY[0x1E0CB3B08], "imperialQuarts");
                                                          v59 = (void *)objc_claimAutoreleasedReturnValue();
                                                          v60 = objc_msgSend(a1, "isEqual:", v59);

                                                          if ((v60 & 1) != 0)
                                                          {
                                                            v4 = CFSTR("imperialQuarts");
                                                          }
                                                          else
                                                          {
                                                            objc_msgSend(MEMORY[0x1E0CB3B08], "imperialGallons");
                                                            v61 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v62 = objc_msgSend(a1, "isEqual:", v61);

                                                            if ((v62 & 1) != 0)
                                                            {
                                                              v4 = CFSTR("imperialGallons");
                                                            }
                                                            else
                                                            {
                                                              objc_msgSend(MEMORY[0x1E0CB3B08], "metricCups");
                                                              v63 = (void *)objc_claimAutoreleasedReturnValue();
                                                              v64 = objc_msgSend(a1, "isEqual:", v63);

                                                              if ((v64 & 1) == 0)
                                                              {
                                                                v66 = (void *)MEMORY[0x1E0C99DA0];
                                                                v67 = *MEMORY[0x1E0C99768];
                                                                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown unit %@"), a1);
                                                                v68 = (void *)objc_claimAutoreleasedReturnValue();
                                                                objc_msgSend(v66, "exceptionWithName:reason:userInfo:", v67, v68, 0);
                                                                v69 = (id)objc_claimAutoreleasedReturnValue();

                                                                objc_exception_throw(v69);
                                                              }
                                                              v4 = CFSTR("metricCups");
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
