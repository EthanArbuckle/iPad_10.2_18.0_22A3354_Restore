@implementation UICalendarDateViewCellAccessibility

id __136___UICalendarDateViewCellAccessibility_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday___block_invoke(id *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v6;
  id v7;
  id v8;
  const __CFString *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id obj;
  uint64_t v18;
  id v19;
  _QWORD __b[8];
  id v21;
  id v22[3];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22[2] = a1;
  v22[1] = a1;
  v22[0] = 0;
  memset(__b, 0, sizeof(__b));
  obj = objc_loadWeakRetained(a1 + 4);
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v23, 16);
  if (v18)
  {
    v13 = *(_QWORD *)__b[2];
    v14 = 0;
    v15 = v18;
    while (1)
    {
      v12 = v14;
      if (*(_QWORD *)__b[2] != v13)
        objc_enumerationMutation(obj);
      v21 = *(id *)(__b[1] + 8 * v14);
      v11 = (id)objc_msgSend(v21, "accessibilityLabel", v6, v7, v9);
      v8 = (id)objc_msgSend(v21, "accessibilityValue");
      v1 = (id)__AXStringForVariables();
      v2 = v22[0];
      v22[0] = v1;

      v19 = (id)objc_msgSend(v21, "safeUIViewForKey:", CFSTR("_decorationView"), v11, v8, CFSTR("__AXStringForVariablesSentinel"));
      v6 = (id)objc_msgSend(v19, "accessibilityLabel");
      v7 = (id)objc_msgSend(v19, "accessibilityValue");
      v9 = CFSTR("__AXStringForVariablesSentinel");
      v3 = (id)__AXStringForVariables();
      v4 = v22[0];
      v22[0] = v3;

      objc_storeStrong(&v19, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        v14 = 0;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v23, 16, v6, v7, CFSTR("__AXStringForVariablesSentinel"));
        if (!v15)
          break;
      }
    }
  }

  v10 = v22[0];
  objc_storeStrong(v22, 0);
  return v10;
}

id __136___UICalendarDateViewCellAccessibility_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday___block_invoke_2(id *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  id v6;
  id v7;
  const __CFString *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id obj;
  uint64_t v16;
  id v17;
  _QWORD __b[8];
  id v19;
  id v20[3];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20[2] = a1;
  v20[1] = a1;
  v20[0] = 0;
  memset(__b, 0, sizeof(__b));
  obj = objc_loadWeakRetained(a1 + 4);
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
  if (v16)
  {
    v11 = *(_QWORD *)__b[2];
    v12 = 0;
    v13 = v16;
    while (1)
    {
      v10 = v12;
      if (*(_QWORD *)__b[2] != v11)
        objc_enumerationMutation(obj);
      v19 = *(id *)(__b[1] + 8 * v12);
      v7 = (id)objc_msgSend(v19, "accessibilityHint", v6, v8);
      v1 = (id)__AXStringForVariables();
      v2 = v20[0];
      v20[0] = v1;

      v17 = (id)objc_msgSend(v19, "safeUIViewForKey:", CFSTR("_decorationView"), v7, CFSTR("__AXStringForVariablesSentinel"));
      v6 = (id)objc_msgSend(v17, "accessibilityHint");
      v8 = CFSTR("__AXStringForVariablesSentinel");
      v3 = (id)__AXStringForVariables();
      v4 = v20[0];
      v20[0] = v3;

      objc_storeStrong(&v17, 0);
      ++v12;
      if (v10 + 1 >= v13)
      {
        v12 = 0;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16, v6, CFSTR("__AXStringForVariablesSentinel"));
        if (!v13)
          break;
      }
    }
  }

  v9 = v20[0];
  objc_storeStrong(v20, 0);
  return v9;
}

BOOL __136___UICalendarDateViewCellAccessibility_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday___block_invoke_3(uint64_t a1)
{
  id v2;
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id)objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("_decorationContentView"));
  v4 = objc_msgSend(v2, "isHidden");

  return (v4 & 1) == 0;
}

BOOL __136___UICalendarDateViewCellAccessibility_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday___block_invoke_4(uint64_t a1)
{
  id v2;
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id)objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("_decorationContentView"));
  v4 = objc_msgSend(v2, "isHidden");

  return (v4 & 1) != 0;
}

uint64_t __136___UICalendarDateViewCellAccessibility_configureWithDay_formatter_fontDesign_decorations_outOfRange_renderOverhangDays_highlightsToday___block_invoke_5(uint64_t a1)
{
  char v2;
  id WeakRetained;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a1;
  v9 = a1;
  v8 = 0;
  v8 = *MEMORY[0x24BDF73B0];
  v7 = 0;
  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (id)__UIAccessibilityCastAsClass();

  v5 = v6;
  objc_storeStrong(&v6, 0);
  v2 = objc_msgSend(v5, "isSelected");

  if ((v2 & 1) != 0)
    v8 |= *MEMORY[0x24BDF7400];
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
    return v8 | *MEMORY[0x24BDF73E8];
  return v8;
}

@end
