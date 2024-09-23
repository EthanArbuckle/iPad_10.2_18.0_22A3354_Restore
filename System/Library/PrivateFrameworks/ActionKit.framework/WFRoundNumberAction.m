@implementation WFRoundNumberAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__WFRoundNumberAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_24F8B59A8;
  v4[4] = self;
  v3 = a3;
  objc_msgSend(v3, "getObjectRepresentations:forClass:", v4, objc_opt_class());

}

- (id)scaleValueFromParameterValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[16];
  _QWORD v10[17];

  v10[16] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9[0] = CFSTR("Ones Place");
  v9[1] = CFSTR("Tens Place");
  v10[0] = &unk_24F93ADF0;
  v10[1] = &unk_24F93AE08;
  v9[2] = CFSTR("Tenths");
  v9[3] = CFSTR("Hundreds Place");
  v10[2] = &unk_24F93AE20;
  v10[3] = &unk_24F93AE38;
  v9[4] = CFSTR("Hundredths");
  v9[5] = CFSTR("Thousands");
  v10[4] = &unk_24F93AE50;
  v10[5] = &unk_24F93AE68;
  v9[6] = CFSTR("Thousandths");
  v9[7] = CFSTR("Ten Thousands");
  v10[6] = &unk_24F93AE80;
  v10[7] = &unk_24F93AE98;
  v9[8] = CFSTR("Ten Thousandths");
  v9[9] = CFSTR("Hundred Thousands");
  v10[8] = &unk_24F93AEB0;
  v10[9] = &unk_24F93AEC8;
  v9[10] = CFSTR("Hundred Thousandths");
  v9[11] = CFSTR("Millions");
  v10[10] = &unk_24F93AEE0;
  v10[11] = &unk_24F93AEF8;
  v9[12] = CFSTR("Millionths");
  v9[13] = CFSTR("Ten Millionths");
  v10[12] = &unk_24F93AF10;
  v10[13] = &unk_24F93AF28;
  v9[14] = CFSTR("Hundred Millionths");
  v9[15] = CFSTR("Billionths");
  v10[14] = &unk_24F93AF40;
  v10[15] = &unk_24F93AF58;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("10 ^")))
  {
    -[WFRoundNumberAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("TenToThePowerOf"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -objc_msgSend(v6, "integerValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __50__WFRoundNumberAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v22 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFRoundTo"), objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFRoundMode"), objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("Always Round Up")) & 1) != 0)
      v9 = 2;
    else
      v9 = objc_msgSend(v20, "isEqualToString:", CFSTR("Always Round Down"));
    objc_msgSend(*(id *)(a1 + 32), "scaleValueFromParameterValue:", v21, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1520], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", v9, objc_msgSend(v10, "shortValue"), 0, 0, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "output");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "decimalNumberByRoundingAccordingToBehavior:", v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v18);

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
    v8 = v19;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v8);
  }

}

@end
