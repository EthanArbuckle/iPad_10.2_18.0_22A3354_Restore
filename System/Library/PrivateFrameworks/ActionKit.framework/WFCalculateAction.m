@implementation WFCalculateAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__WFCalculateAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_24F8B6D90;
  v4[4] = self;
  v3 = a3;
  objc_msgSend(v3, "getObjectRepresentation:forClass:", v4, objc_opt_class());

}

void __48__WFCalculateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  long double v37;
  long double v38;
  void *v39;
  long double v40;
  void *v41;
  double v42;
  void *v43;
  long double v44;
  void *v45;
  long double v46;
  void *v47;
  double v48;
  void *v49;
  long double v50;
  void *v51;
  id i;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  long double v57;
  void *v58;
  void *v59;
  long double v60;
  void *v61;
  long double v62;
  void *v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  _QWORD v72[2];
  int v73;
  _QWORD v74[2];
  int v75;

  v7 = a2;
  v70 = a3;
  v71 = a4;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFMathOperation"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFScientificMathOperation"), objc_opt_class());
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFMathOperand"), objc_opt_class());
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (void *)MEMORY[0x24BDD1518];
    }
    else
    {
      v12 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("WFMathOperand"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedPlaceholder");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      objc_msgSend(v12, "numberWithDouble:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x24BDD1518];
      if (!v10)
      {
        v74[0] = 0;
        v74[1] = 0;
        v75 = 0;
LABEL_7:
        objc_msgSend(v11, "decimalNumberWithDecimal:", v74);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFScientificMathOperand"), objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          v17 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("WFScientificMathOperand"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedPlaceholder");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "doubleValue");
          objc_msgSend(v17, "numberWithDouble:");
          v20 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v20;
        }
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("+")))
        {
          objc_msgSend(*(id *)(a1 + 32), "output");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "decimalNumberByAdding:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v22);
LABEL_17:

LABEL_18:
          objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);

          goto LABEL_19;
        }
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("-")))
        {
          objc_msgSend(*(id *)(a1 + 32), "output");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "decimalNumberBySubtracting:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v22);
          goto LABEL_17;
        }
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("×")) & 1) != 0
          || (objc_msgSend(v8, "isEqualToString:", CFSTR("*")) & 1) != 0
          || objc_msgSend(v8, "isEqualToString:", CFSTR("x")))
        {
          objc_msgSend(*(id *)(a1 + 32), "output");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "decimalNumberByMultiplyingBy:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v22);
          goto LABEL_17;
        }
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("÷")) & 1) != 0
          || objc_msgSend(v8, "isEqualToString:", CFSTR("/")))
        {
          objc_msgSend(*(id *)(a1 + 32), "output");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "decimalNumberByDividingBy:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v22);
          goto LABEL_17;
        }
        if (objc_msgSend(v69, "isEqualToString:", CFSTR("Modulus")))
        {
          v23 = (void *)MEMORY[0x24BDD1518];
          if (v16)
          {
            objc_msgSend(v16, "decimalValue");
          }
          else
          {
            v72[0] = 0;
            v72[1] = 0;
            v73 = 0;
          }
          objc_msgSend(v23, "decimalNumberWithDecimal:", v72);
          v26 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1518], "zero");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "compare:", v26);
          v68 = (void *)v26;

          objc_msgSend(MEMORY[0x24BDD1518], "zero");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v26) = objc_msgSend(v29, "compare:", v7) == 1;

          if ((v28 == 1) != v26)
            v30 = 2;
          else
            v30 = 1;
          objc_msgSend(MEMORY[0x24BDD1520], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", v30, 0, 0, 0, 0, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "decimalNumberByDividingBy:withBehavior:", v68, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "decimalNumberByMultiplyingBy:", v68);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "decimalNumberBySubtracting:", v33);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "output");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v67);

          goto LABEL_18;
        }
        if (objc_msgSend(v69, "isEqualToString:", CFSTR("x^2")))
        {
          objc_msgSend(*(id *)(a1 + 32), "output");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "decimalNumberByRaisingToPower:", 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v25);
        }
        else if (objc_msgSend(v69, "isEqualToString:", CFSTR("x^3")))
        {
          objc_msgSend(*(id *)(a1 + 32), "output");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "decimalNumberByRaisingToPower:", 3);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v25);
        }
        else if (objc_msgSend(v69, "isEqualToString:", CFSTR("x^y")))
        {
          objc_msgSend(*(id *)(a1 + 32), "output");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v7, "doubleValue");
          v37 = v36;
          objc_msgSend(v16, "doubleValue");
          objc_msgSend(v35, "numberWithDouble:", (double)pow(v37, v38));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v25);
        }
        else if (objc_msgSend(v69, "isEqualToString:", CFSTR("e^x")))
        {
          objc_msgSend(*(id *)(a1 + 32), "output");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v7, "doubleValue");
          objc_msgSend(v39, "numberWithDouble:", (double)exp(v40));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v25);
        }
        else if (objc_msgSend(v69, "isEqualToString:", CFSTR("10^x")))
        {
          objc_msgSend(*(id *)(a1 + 32), "output");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v7, "doubleValue");
          objc_msgSend(v41, "numberWithDouble:", __exp10(v42));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v25);
        }
        else if (objc_msgSend(v69, "isEqualToString:", CFSTR("ln(x)")))
        {
          objc_msgSend(*(id *)(a1 + 32), "output");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v7, "doubleValue");
          objc_msgSend(v43, "numberWithDouble:", (double)log(v44));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v25);
        }
        else
        {
          v65 = v16;
          v66 = v15;
          if (objc_msgSend(v69, "isEqualToString:", CFSTR("log(x)")))
          {
            objc_msgSend(*(id *)(a1 + 32), "output");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v7, "doubleValue");
            objc_msgSend(v45, "numberWithDouble:", (double)log10(v46));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v25);
          }
          else if (objc_msgSend(v69, "isEqualToString:", CFSTR("√x")))
          {
            objc_msgSend(*(id *)(a1 + 32), "output");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v7, "doubleValue");
            objc_msgSend(v47, "numberWithDouble:", sqrt(v48));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v25);
          }
          else
          {
            if (!objc_msgSend(v69, "isEqualToString:", CFSTR("∛x")))
            {
              if (objc_msgSend(v69, "isEqualToString:", CFSTR("x!")))
              {
                objc_msgSend(MEMORY[0x24BDD1518], "one");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                for (i = v7; (int)objc_msgSend(i, "intValue") > 1; i = (id)v55)
                {
                  objc_msgSend(v51, "decimalNumberByMultiplyingBy:", i);
                  v53 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x24BDD1518], "one");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(i, "decimalNumberBySubtracting:", v54);
                  v55 = objc_claimAutoreleasedReturnValue();

                  v51 = (void *)v53;
                }

                objc_msgSend(*(id *)(a1 + 32), "output");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "addObject:", v51);

              }
              else
              {
                if (objc_msgSend(v69, "isEqualToString:", CFSTR("sin(x)")))
                {
                  objc_msgSend(*(id *)(a1 + 32), "output");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v56 = (void *)MEMORY[0x24BDD16E0];
                  objc_msgSend(v7, "doubleValue");
                  objc_msgSend(v56, "numberWithDouble:", (double)sin(v57));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "addObject:", v25);
                  goto LABEL_50;
                }
                if (objc_msgSend(v69, "isEqualToString:", CFSTR("cos(x)")))
                {
                  objc_msgSend(*(id *)(a1 + 32), "output");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = (void *)MEMORY[0x24BDD16E0];
                  objc_msgSend(v7, "doubleValue");
                  objc_msgSend(v59, "numberWithDouble:", (double)cos(v60));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "addObject:", v25);
                  goto LABEL_50;
                }
                if (objc_msgSend(v69, "isEqualToString:", CFSTR("tan(x)")))
                {
                  objc_msgSend(*(id *)(a1 + 32), "output");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v61 = (void *)MEMORY[0x24BDD16E0];
                  objc_msgSend(v7, "doubleValue");
                  objc_msgSend(v61, "numberWithDouble:", (double)tan(v62));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "addObject:", v25);
                  goto LABEL_50;
                }
                if (objc_msgSend(v69, "isEqualToString:", CFSTR("abs(x)")))
                {
                  objc_msgSend(*(id *)(a1 + 32), "output");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v63 = (void *)MEMORY[0x24BDD16E0];
                  objc_msgSend(v7, "doubleValue");
                  objc_msgSend(v63, "numberWithDouble:", fabs(v64));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "addObject:", v25);
                  goto LABEL_50;
                }
              }
              v16 = v65;
              v15 = v66;
              goto LABEL_18;
            }
            objc_msgSend(*(id *)(a1 + 32), "output");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v7, "doubleValue");
            objc_msgSend(v49, "numberWithDouble:", (double)cbrt(v50));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v25);
          }
        }
LABEL_50:

        goto LABEL_18;
      }
    }
    objc_msgSend(v10, "decimalValue");
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v71);
LABEL_19:

}

@end
