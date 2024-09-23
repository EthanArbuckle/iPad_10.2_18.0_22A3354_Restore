@implementation NSMeasurement(INJSONSerialization)

- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  void *v2;
  void *v3;
  char v4;
  const __CFString *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  void *v46;
  char v47;
  void *v48;
  char v49;
  void *v50;
  char v51;
  void *v52;
  char v53;
  void *v54;
  char v55;
  void *v56;
  char v57;
  void *v58;
  char v59;
  void *v60;
  char v61;
  void *v62;
  char v63;
  void *v64;
  char v65;
  void *v66;
  char v67;
  void *v68;
  char v69;
  void *v70;
  char v71;
  void *v72;
  char v73;
  void *v74;
  char v75;
  void *v76;
  char v77;
  void *v78;
  char v79;
  void *v80;
  char v81;
  void *v82;
  char v83;
  void *v84;
  char v85;
  void *v86;
  char v87;
  void *v88;
  char v89;
  void *v90;
  char v91;
  void *v92;
  char v93;
  void *v94;
  char v95;
  void *v96;
  char v97;
  void *v98;
  char v99;
  void *v100;
  char v101;
  void *v102;
  char v103;
  void *v104;
  char v105;
  void *v106;
  char v107;
  void *v108;
  char v109;
  void *v110;
  char v111;
  void *v112;
  char v113;
  void *v114;
  char v115;
  void *v116;
  char v117;
  void *v118;
  char v119;
  void *v120;
  char v121;
  void *v122;
  char v123;
  void *v124;
  int v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  _QWORD v131[2];
  _QWORD v132[3];

  v132[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if ((v4 & 1) != 0)
  {
    v5 = CFSTR("meters");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v2, "isEqual:", v6);

    if ((v7 & 1) != 0)
    {
      v5 = CFSTR("miles");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3AD8], "centimeters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v2, "isEqual:", v8);

      if ((v9 & 1) != 0)
      {
        v5 = CFSTR("centimeters");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v2, "isEqual:", v10);

        if ((v11 & 1) != 0)
        {
          v5 = CFSTR("feet");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3AD8], "inches");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v2, "isEqual:", v12);

          if ((v13 & 1) != 0)
          {
            v5 = CFSTR("inches");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3AD8], "yards");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v2, "isEqual:", v14);

            if ((v15 & 1) != 0)
            {
              v5 = CFSTR("yards");
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3AD8], "kilometers");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v2, "isEqual:", v16);

              if ((v17 & 1) != 0)
              {
                v5 = CFSTR("kilometers");
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3B00], "celsius");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v2, "isEqual:", v18);

                if ((v19 & 1) != 0)
                {
                  v5 = CFSTR("celsius");
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB3B00], "fahrenheit");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v2, "isEqual:", v20);

                  if ((v21 & 1) != 0)
                  {
                    v5 = CFSTR("fahrenheit");
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CB3B00], "kelvin");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = objc_msgSend(v2, "isEqual:", v22);

                    if ((v23 & 1) != 0)
                    {
                      v5 = CFSTR("kelvin");
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CB3AE0], "kilograms");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = objc_msgSend(v2, "isEqual:", v24);

                      if ((v25 & 1) != 0)
                      {
                        v5 = CFSTR("kilograms");
                      }
                      else
                      {
                        objc_msgSend(MEMORY[0x1E0CB3AE0], "grams");
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        v27 = objc_msgSend(v2, "isEqual:", v26);

                        if ((v27 & 1) != 0)
                        {
                          v5 = CFSTR("grams");
                        }
                        else
                        {
                          objc_msgSend(MEMORY[0x1E0CB3AE0], "decigrams");
                          v28 = (void *)objc_claimAutoreleasedReturnValue();
                          v29 = objc_msgSend(v2, "isEqual:", v28);

                          if ((v29 & 1) != 0)
                          {
                            v5 = CFSTR("decigrams");
                          }
                          else
                          {
                            objc_msgSend(MEMORY[0x1E0CB3AE0], "centigrams");
                            v30 = (void *)objc_claimAutoreleasedReturnValue();
                            v31 = objc_msgSend(v2, "isEqual:", v30);

                            if ((v31 & 1) != 0)
                            {
                              v5 = CFSTR("centigrams");
                            }
                            else
                            {
                              objc_msgSend(MEMORY[0x1E0CB3AE0], "milligrams");
                              v32 = (void *)objc_claimAutoreleasedReturnValue();
                              v33 = objc_msgSend(v2, "isEqual:", v32);

                              if ((v33 & 1) != 0)
                              {
                                v5 = CFSTR("milligrams");
                              }
                              else
                              {
                                objc_msgSend(MEMORY[0x1E0CB3AE0], "micrograms");
                                v34 = (void *)objc_claimAutoreleasedReturnValue();
                                v35 = objc_msgSend(v2, "isEqual:", v34);

                                if ((v35 & 1) != 0)
                                {
                                  v5 = CFSTR("micrograms");
                                }
                                else
                                {
                                  objc_msgSend(MEMORY[0x1E0CB3AE0], "nanograms");
                                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                                  v37 = objc_msgSend(v2, "isEqual:", v36);

                                  if ((v37 & 1) != 0)
                                  {
                                    v5 = CFSTR("nanograms");
                                  }
                                  else
                                  {
                                    objc_msgSend(MEMORY[0x1E0CB3AE0], "picograms");
                                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                                    v39 = objc_msgSend(v2, "isEqual:", v38);

                                    if ((v39 & 1) != 0)
                                    {
                                      v5 = CFSTR("picograms");
                                    }
                                    else
                                    {
                                      objc_msgSend(MEMORY[0x1E0CB3AE0], "ounces");
                                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                                      v41 = objc_msgSend(v2, "isEqual:", v40);

                                      if ((v41 & 1) != 0)
                                      {
                                        v5 = CFSTR("ounces");
                                      }
                                      else
                                      {
                                        objc_msgSend(MEMORY[0x1E0CB3AE0], "poundsMass");
                                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                                        v43 = objc_msgSend(v2, "isEqual:", v42);

                                        if ((v43 & 1) != 0)
                                        {
                                          v5 = CFSTR("poundsMass");
                                        }
                                        else
                                        {
                                          objc_msgSend(MEMORY[0x1E0CB3AE0], "stones");
                                          v44 = (void *)objc_claimAutoreleasedReturnValue();
                                          v45 = objc_msgSend(v2, "isEqual:", v44);

                                          if ((v45 & 1) != 0)
                                          {
                                            v5 = CFSTR("stones");
                                          }
                                          else
                                          {
                                            objc_msgSend(MEMORY[0x1E0CB3AE0], "metricTons");
                                            v46 = (void *)objc_claimAutoreleasedReturnValue();
                                            v47 = objc_msgSend(v2, "isEqual:", v46);

                                            if ((v47 & 1) != 0)
                                            {
                                              v5 = CFSTR("metricTons");
                                            }
                                            else
                                            {
                                              objc_msgSend(MEMORY[0x1E0CB3AE0], "shortTons");
                                              v48 = (void *)objc_claimAutoreleasedReturnValue();
                                              v49 = objc_msgSend(v2, "isEqual:", v48);

                                              if ((v49 & 1) != 0)
                                              {
                                                v5 = CFSTR("shortTons");
                                              }
                                              else
                                              {
                                                objc_msgSend(MEMORY[0x1E0CB3AE0], "carats");
                                                v50 = (void *)objc_claimAutoreleasedReturnValue();
                                                v51 = objc_msgSend(v2, "isEqual:", v50);

                                                if ((v51 & 1) != 0)
                                                {
                                                  v5 = CFSTR("carats");
                                                }
                                                else
                                                {
                                                  objc_msgSend(MEMORY[0x1E0CB3AE0], "ouncesTroy");
                                                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                                                  v53 = objc_msgSend(v2, "isEqual:", v52);

                                                  if ((v53 & 1) != 0)
                                                  {
                                                    v5 = CFSTR("ouncesTroy");
                                                  }
                                                  else
                                                  {
                                                    objc_msgSend(MEMORY[0x1E0CB3AE0], "slugs");
                                                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v55 = objc_msgSend(v2, "isEqual:", v54);

                                                    if ((v55 & 1) != 0)
                                                    {
                                                      v5 = CFSTR("slugs");
                                                    }
                                                    else
                                                    {
                                                      objc_msgSend(MEMORY[0x1E0CB3B08], "megaliters");
                                                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                                                      v57 = objc_msgSend(v2, "isEqual:", v56);

                                                      if ((v57 & 1) != 0)
                                                      {
                                                        v5 = CFSTR("megaliters");
                                                      }
                                                      else
                                                      {
                                                        objc_msgSend(MEMORY[0x1E0CB3B08], "kiloliters");
                                                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v59 = objc_msgSend(v2, "isEqual:", v58);

                                                        if ((v59 & 1) != 0)
                                                        {
                                                          v5 = CFSTR("kiloliters");
                                                        }
                                                        else
                                                        {
                                                          objc_msgSend(MEMORY[0x1E0CB3B08], "liters");
                                                          v60 = (void *)objc_claimAutoreleasedReturnValue();
                                                          v61 = objc_msgSend(v2, "isEqual:", v60);

                                                          if ((v61 & 1) != 0)
                                                          {
                                                            v5 = CFSTR("liters");
                                                          }
                                                          else
                                                          {
                                                            objc_msgSend(MEMORY[0x1E0CB3B08], "deciliters");
                                                            v62 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v63 = objc_msgSend(v2, "isEqual:", v62);

                                                            if ((v63 & 1) != 0)
                                                            {
                                                              v5 = CFSTR("deciliters");
                                                            }
                                                            else
                                                            {
                                                              objc_msgSend(MEMORY[0x1E0CB3B08], "centiliters");
                                                              v64 = (void *)objc_claimAutoreleasedReturnValue();
                                                              v65 = objc_msgSend(v2, "isEqual:", v64);

                                                              if ((v65 & 1) != 0)
                                                              {
                                                                v5 = CFSTR("centiliters");
                                                              }
                                                              else
                                                              {
                                                                objc_msgSend(MEMORY[0x1E0CB3B08], "milliliters");
                                                                v66 = (void *)objc_claimAutoreleasedReturnValue();
                                                                v67 = objc_msgSend(v2, "isEqual:", v66);

                                                                if ((v67 & 1) != 0)
                                                                {
                                                                  v5 = CFSTR("milliliters");
                                                                }
                                                                else
                                                                {
                                                                  objc_msgSend(MEMORY[0x1E0CB3B08], "cubicKilometers");
                                                                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                                                                  v69 = objc_msgSend(v2, "isEqual:", v68);

                                                                  if ((v69 & 1) != 0)
                                                                  {
                                                                    v5 = CFSTR("cubicKilometers");
                                                                  }
                                                                  else
                                                                  {
                                                                    objc_msgSend(MEMORY[0x1E0CB3B08], "cubicDecimeters");
                                                                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v71 = objc_msgSend(v2, "isEqual:", v70);

                                                                    if ((v71 & 1) != 0)
                                                                    {
                                                                      v5 = CFSTR("cubicDecimeters");
                                                                    }
                                                                    else
                                                                    {
                                                                      objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMillimeters");
                                                                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                                                                      v73 = objc_msgSend(v2, "isEqual:", v72);

                                                                      if ((v73 & 1) != 0)
                                                                      {
                                                                        v5 = CFSTR("cubicMillimeters");
                                                                      }
                                                                      else
                                                                      {
                                                                        objc_msgSend(MEMORY[0x1E0CB3B08], "cubicInches");
                                                                        v74 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        v75 = objc_msgSend(v2, "isEqual:", v74);

                                                                        if ((v75 & 1) != 0)
                                                                        {
                                                                          v5 = CFSTR("cubicInches");
                                                                        }
                                                                        else
                                                                        {
                                                                          objc_msgSend(MEMORY[0x1E0CB3B08], "cubicFeet");
                                                                          v76 = (void *)objc_claimAutoreleasedReturnValue();
                                                                          v77 = objc_msgSend(v2, "isEqual:", v76);

                                                                          if ((v77 & 1) != 0)
                                                                          {
                                                                            v5 = CFSTR("cubicFeet");
                                                                          }
                                                                          else
                                                                          {
                                                                            objc_msgSend(MEMORY[0x1E0CB3B08], "cubicYards");
                                                                            v78 = (void *)objc_claimAutoreleasedReturnValue();
                                                                            v79 = objc_msgSend(v2, "isEqual:", v78);

                                                                            if ((v79 & 1) != 0)
                                                                            {
                                                                              v5 = CFSTR("cubicYards");
                                                                            }
                                                                            else
                                                                            {
                                                                              objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMiles");
                                                                              v80 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              v81 = objc_msgSend(v2, "isEqual:", v80);

                                                                              if ((v81 & 1) != 0)
                                                                              {
                                                                                v5 = CFSTR("cubicMiles");
                                                                              }
                                                                              else
                                                                              {
                                                                                objc_msgSend(MEMORY[0x1E0CB3B08], "acreFeet");
                                                                                v82 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                v83 = objc_msgSend(v2, "isEqual:", v82);

                                                                                if ((v83 & 1) != 0)
                                                                                {
                                                                                  v5 = CFSTR("acreFeet");
                                                                                }
                                                                                else
                                                                                {
                                                                                  objc_msgSend(MEMORY[0x1E0CB3B08], "bushels");
                                                                                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  v85 = objc_msgSend(v2, "isEqual:", v84);

                                                                                  if ((v85 & 1) != 0)
                                                                                  {
                                                                                    v5 = CFSTR("bushels");
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    objc_msgSend(MEMORY[0x1E0CB3B08], "teaspoons");
                                                                                    v86 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                    v87 = objc_msgSend(v2, "isEqual:", v86);

                                                                                    if ((v87 & 1) != 0)
                                                                                    {
                                                                                      v5 = CFSTR("teaspoons");
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      objc_msgSend(MEMORY[0x1E0CB3B08], "tablespoons");
                                                                                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      v89 = objc_msgSend(v2, "isEqual:", v88);

                                                                                      if ((v89 & 1) != 0)
                                                                                      {
                                                                                        v5 = CFSTR("tablespoons");
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        objc_msgSend(MEMORY[0x1E0CB3B08], "fluidOunces");
                                                                                        v90 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                        v91 = objc_msgSend(v2, "isEqual:", v90);

                                                                                        if ((v91 & 1) != 0)
                                                                                        {
                                                                                          v5 = CFSTR("fluidOunces");
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          objc_msgSend(MEMORY[0x1E0CB3B08], "cups");
                                                                                          v92 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                          v93 = objc_msgSend(v2, "isEqual:", v92);

                                                                                          if ((v93 & 1) != 0)
                                                                                          {
                                                                                            v5 = CFSTR("cups");
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            objc_msgSend(MEMORY[0x1E0CB3B08], "pints");
                                                                                            v94 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                            v95 = objc_msgSend(v2, "isEqual:", v94);

                                                                                            if ((v95 & 1) != 0)
                                                                                            {
                                                                                              v5 = CFSTR("pints");
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              objc_msgSend(MEMORY[0x1E0CB3B08], "quarts");
                                                                                              v96 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                              v97 = objc_msgSend(v2, "isEqual:", v96);

                                                                                              if ((v97 & 1) != 0)
                                                                                              {
                                                                                                v5 = CFSTR("quarts");
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                objc_msgSend(MEMORY[0x1E0CB3B08], "gallons");
                                                                                                v98 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                v99 = objc_msgSend(v2, "isEqual:", v98);

                                                                                                if ((v99 & 1) != 0)
                                                                                                {
                                                                                                  v5 = CFSTR("gallons");
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  objc_msgSend(MEMORY[0x1E0CB3B08], "imperialTeaspoons");
                                                                                                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                  v101 = objc_msgSend(v2, "isEqual:", v100);

                                                                                                  if ((v101 & 1) != 0)
                                                                                                  {
                                                                                                    v5 = CFSTR("imperialTeaspoons");
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    objc_msgSend(MEMORY[0x1E0CB3B08], "imperialQuarts");
                                                                                                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                    v103 = objc_msgSend(v2, "isEqual:", v102);

                                                                                                    if ((v103 & 1) != 0)
                                                                                                    {
                                                                                                      v5 = CFSTR("imperialQuarts");
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      objc_msgSend(MEMORY[0x1E0CB3B08], "imperialGallons");
                                                                                                      v104 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                      v105 = objc_msgSend(v2, "isEqual:", v104);

                                                                                                      if ((v105 & 1) != 0)
                                                                                                      {
                                                                                                        v5 = CFSTR("imperialGallons");
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        objc_msgSend(MEMORY[0x1E0CB3B08], "metricCups");
                                                                                                        v106 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                        v107 = objc_msgSend(v2, "isEqual:", v106);

                                                                                                        if ((v107 & 1) != 0)
                                                                                                        {
                                                                                                          v5 = CFSTR("metricCups");
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          objc_msgSend(MEMORY[0x1E0CB3AF8], "metersPerSecond");
                                                                                                          v108 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                          v109 = objc_msgSend(v2, "isEqual:", v108);

                                                                                                          if ((v109 & 1) != 0)
                                                                                                          {
                                                                                                            v5 = CFSTR("metersPerSecond");
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            objc_msgSend(MEMORY[0x1E0CB3AF8], "kilometersPerHour");
                                                                                                            v110 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                            v111 = objc_msgSend(v2, "isEqual:", v110);

                                                                                                            if ((v111 & 1) != 0)
                                                                                                            {
                                                                                                              v5 = CFSTR("kilometersPerHour");
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              objc_msgSend(MEMORY[0x1E0CB3AF8], "milesPerHour");
                                                                                                              v112 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                              v113 = objc_msgSend(v2, "isEqual:", v112);

                                                                                                              if ((v113 & 1) != 0)
                                                                                                              {
                                                                                                                v5 = CFSTR("milesPerHour");
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                objc_msgSend(MEMORY[0x1E0CB3AF8], "knots");
                                                                                                                v114 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                v115 = objc_msgSend(v2, "isEqual:", v114);

                                                                                                                if ((v115 & 1) != 0)
                                                                                                                {
                                                                                                                  v5 = CFSTR("knots");
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  objc_msgSend(MEMORY[0x1E0CB3AB0], "kilojoules");
                                                                                                                  v116 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                  v117 = objc_msgSend(v2, "isEqual:", v116);

                                                                                                                  if ((v117 & 1) != 0)
                                                                                                                  {
                                                                                                                    v5 = CFSTR("kilojoules");
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    objc_msgSend(MEMORY[0x1E0CB3AB0], "joules");
                                                                                                                    v118 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                    v119 = objc_msgSend(v2, "isEqual:", v118);

                                                                                                                    if ((v119 & 1) != 0)
                                                                                                                    {
                                                                                                                      v5 = CFSTR("joules");
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      objc_msgSend(MEMORY[0x1E0CB3AB0], "kilocalories");
                                                                                                                      v120 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                      v121 = objc_msgSend(v2, "isEqual:", v120);

                                                                                                                      if ((v121 & 1) != 0)
                                                                                                                      {
                                                                                                                        v5 = CFSTR("kilocalories");
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        objc_msgSend(MEMORY[0x1E0CB3AB0], "calories");
                                                                                                                        v122 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                        v123 = objc_msgSend(v2, "isEqual:", v122);

                                                                                                                        if ((v123 & 1) != 0)
                                                                                                                        {
                                                                                                                          v5 = CFSTR("calories");
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
                                                                                                                          v124 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                                                          v125 = objc_msgSend(v2, "isEqual:", v124);

                                                                                                                          v5 = &stru_1E2295770;
                                                                                                                          if (v125)
                                                                                                                            v5 = CFSTR("kilowattHours");
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
  v132[0] = v5;
  v131[0] = CFSTR("unit");
  v131[1] = CFSTR("doubleValue");
  v126 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "doubleValue");
  objc_msgSend(v126, "numberWithDouble:");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v132[1] = v127;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, v131, 2);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v128, "if_dictionaryWithNonEmptyValues");
  v129 = (void *)objc_claimAutoreleasedReturnValue();

  return v129;
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("doubleValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v12 = v11;

      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("unit"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("meters")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AD8], "meters");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("miles")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AD8], "miles");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("centimeters")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AD8], "centimeters");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("feet")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AD8], "feet");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("inches")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AD8], "inches");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("yards")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AD8], "yards");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("kilometers")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AD8], "kilometers");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("celsius")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B00], "celsius");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("fahrenheit")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B00], "fahrenheit");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("kelvin")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B00], "kelvin");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("kilograms")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "kilograms");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("grams")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "grams");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("decigrams")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "decigrams");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("centigrams")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "centigrams");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("milligrams")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "milligrams");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("micrograms")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "micrograms");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("nanograms")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "nanograms");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("picograms")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "picograms");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("ounces")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "ounces");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("poundsMass")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "poundsMass");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("stones")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "stones");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("metricTons")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "metricTons");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("shortTons")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "shortTons");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("carats")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "carats");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("ouncesTroy")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "ouncesTroy");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("slugs")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AE0], "slugs");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("megaliters")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "megaliters");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("kiloliters")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "kiloliters");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("liters")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "liters");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("deciliters")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "deciliters");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("centiliters")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "centiliters");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("milliliters")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "milliliters");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("cubicKilometers")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "cubicKilometers");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("cubicDecimeters")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "cubicDecimeters");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("cubicMillimeters")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMillimeters");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("cubicInches")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "cubicInches");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("cubicFeet")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "cubicFeet");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("cubicYards")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "cubicYards");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("cubicMiles")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "cubicMiles");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("acreFeet")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "acreFeet");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("bushels")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "bushels");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("teaspoons")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "teaspoons");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("tablespoons")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "tablespoons");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("fluidOunces")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "fluidOunces");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("cups")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "cups");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("pints")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "pints");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("quarts")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "quarts");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("gallons")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "gallons");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("imperialTeaspoons")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "imperialTeaspoons");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("imperialQuarts")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "imperialQuarts");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("imperialGallons")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "imperialGallons");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("metricCups")))
      {
        objc_msgSend(MEMORY[0x1E0CB3B08], "metricCups");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("metersPerSecond")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AF8], "metersPerSecond");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("kilometersPerHour")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AF8], "kilometersPerHour");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("milesPerHour")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AF8], "milesPerHour");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("knots")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AF8], "knots");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("kilojoules")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AB0], "kilojoules");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("joules")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AB0], "joules");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("kilocalories")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AB0], "kilocalories");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else if (objc_msgSend(v13, "isEqualToString:", CFSTR("calories")))
      {
        objc_msgSend(MEMORY[0x1E0CB3AB0], "calories");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v13, "isEqualToString:", CFSTR("kilowattHours")))
          goto LABEL_128;
        objc_msgSend(MEMORY[0x1E0CB3AB0], "kilowattHours");
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v16 = (void *)v14;
      if (v14)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3758]), "initWithDoubleValue:unit:", v14, v12);

LABEL_129:
        goto LABEL_130;
      }
LABEL_128:
      v15 = 0;
      goto LABEL_129;
    }
  }
  v15 = 0;
LABEL_130:

  return v15;
}

@end
