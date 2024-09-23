@implementation UIAccessibilityPickerComponent

- (unint64_t)_accessibilityAutomationType
{
  return 39;
}

- (id)accessibilityLabel
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  id v10;
  unint64_t component;
  id WeakRetained;
  BOOL v13;
  id location;
  id v15;
  id v16[2];
  UIAccessibilityPickerComponent *v17;
  id v18;

  v17 = self;
  v16[1] = (id)a2;
  component = self->_component;
  WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  v13 = component < objc_msgSend(WeakRetained, "numberOfComponents");

  if (v13)
  {
    v10 = objc_loadWeakRetained((id *)&v17->_picker);
    v16[0] = (id)objc_msgSend(v10, "delegate");

    v15 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = -[UIAccessibilityPickerComponent picker]((uint64_t)v17);
      location = (id)objc_msgSend(v16[0], "pickerView:accessibilityAttributedLabelForComponent:");

      if (location)
      {
        v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithCFAttributedString:", location);
        v3 = v15;
        v15 = v2;

      }
      objc_storeStrong(&location, 0);
    }
    if (!v15 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = v16[0];
      v8 = -[UIAccessibilityPickerComponent picker]((uint64_t)v17);
      v4 = (id)objc_msgSend(v7, "pickerView:accessibilityLabelForComponent:");
      v5 = v15;
      v15 = v4;

    }
    v18 = v15;
    objc_storeStrong(&v15, 0);
    objc_storeStrong(v16, 0);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (id)picker
{
  if (a1)
    return objc_loadWeakRetained((id *)(a1 + 64));
  else
    return 0;
}

- (id)accessibilityHint
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v7;
  unint64_t component;
  id WeakRetained;
  BOOL v10;
  id location;
  id v12;
  id v13[2];
  UIAccessibilityPickerComponent *v14;
  id v15;

  v14 = self;
  v13[1] = (id)a2;
  component = self->_component;
  WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  v10 = component < objc_msgSend(WeakRetained, "numberOfComponents");

  if (v10)
  {
    v7 = objc_loadWeakRetained((id *)&v14->_picker);
    v13[0] = (id)objc_msgSend(v7, "delegate");

    v12 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      location = (id)objc_msgSend(v13[0], "pickerView:accessibilityAttributedHintForComponent:", v14, v14->_component);
      if (location)
      {
        v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithCFAttributedString:", location);
        v3 = v12;
        v12 = v2;

      }
      objc_storeStrong(&location, 0);
    }
    if (!v12 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v4 = (id)objc_msgSend(v13[0], "pickerView:accessibilityHintForComponent:", v14, v14->_component);
      v5 = v12;
      v12 = v4;

    }
    v15 = v12;
    objc_storeStrong(&v12, 0);
    objc_storeStrong(v13, 0);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (int64_t)_accessibilityPickerType
{
  id WeakRetained;
  int64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  v4 = objc_msgSend(WeakRetained, "_accessibilityPickerType");

  return v4;
}

- (uint64_t)_axIsInDatePickerView
{
  id WeakRetained;
  char v3;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    NSClassFromString(CFSTR("_UIDatePickerView"));
    v3 = objc_opt_isKindOfClass() & 1;

  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (id)automationElements
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id WeakRetained;
  char v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26[2];
  UIAccessibilityPickerComponent *v27;
  id v28;

  v27 = self;
  v26[1] = (id)a2;
  WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  NSClassFromString(CFSTR("UIDatePickerView"));
  v16 = 1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    v16 = -[UIAccessibilityPickerComponent _axIsInDatePickerView]((uint64_t)v27);

  if ((v16 & 1) != 0)
  {
    v28 = 0;
  }
  else
  {
    v14 = objc_loadWeakRetained((id *)&v27->_picker);
    v13 = (id)objc_msgSend(v14, "safeValueForKey:", CFSTR("_tables"));
    v26[0] = (id)objc_msgSend(v13, "objectAtIndex:", v27->_component);

    v25 = (id)objc_msgSend(v26[0], "safeValueForKey:", CFSTR("_middleTable"));
    v24 = objc_msgSend(v25, "numberOfRowsInSection:", 0);
    v23 = 0;
    v22 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v24);
    while (v23 < v24)
    {
      v11 = v25;
      v12 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v23, 0);
      v21 = (id)objc_msgSend(v11, "accessibilityCellForRowAtIndexPath:");

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v9 = (void *)MEMORY[0x24BDFEA70];
        v10 = (id)objc_msgSend(v21, "title");
        v20 = (id)objc_msgSend(v9, "axAttributedStringWithString:");

        objc_msgSend(v22, "addObject:", v20);
        objc_storeStrong(&v20, 0);
      }
      else
      {
        NSClassFromString(CFSTR("UIPickerTableViewWrapperCell"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = (id)objc_msgSend(v21, "safeUIViewForKey:", CFSTR("wrappedView"));
          v18 = (id)objc_msgSend(v19, "accessibilityLabel");
          if (!objc_msgSend(v18, "length"))
          {
            v8 = (id)objc_msgSend(v19, "_accessibleSubviews");
            v2 = (id)MEMORY[0x2348C3584]();
            v3 = v18;
            v18 = v2;

          }
          if (!objc_msgSend(v18, "length"))
          {
            v7 = (id)objc_msgSend(v19, "accessibilityElements");
            v4 = (id)MEMORY[0x2348C3584]();
            v5 = v18;
            v18 = v4;

          }
          if (v18)
          {
            v17 = (id)objc_msgSend(MEMORY[0x24BDFEA70], "axAttributedStringWithString:", v18);
            objc_msgSend(v22, "addObject:", v17);
            objc_storeStrong(&v17, 0);
          }
          objc_storeStrong(&v18, 0);
          objc_storeStrong(&v19, 0);
        }
      }
      objc_storeStrong(&v21, 0);
      ++v23;
    }
    v28 = v22;
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(v26, 0);
  }
  return v28;
}

- (int64_t)_accessibilityIndexForPickerString:(id)a3
{
  id v4;
  char v5;
  id v6;
  char v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  int v13;
  id v14;
  int64_t i;
  uint64_t v16;
  id v17;
  id v18;
  id location[2];
  UIAccessibilityPickerComponent *v20;
  int64_t v21;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v20->_picker);
  v10 = (id)objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_tables"));
  v18 = (id)objc_msgSend(v10, "objectAtIndex:", v20->_component);

  v17 = (id)objc_msgSend(v18, "safeValueForKey:", CFSTR("_middleTable"));
  v16 = objc_msgSend(v17, "numberOfRowsInSection:", 0);
  for (i = 0; i < v16; ++i)
  {
    v8 = v17;
    v9 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", i, 0);
    v14 = (id)objc_msgSend(v8, "cellForRowAtIndexPath:");

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = (id)objc_msgSend(v14, "title");
      v7 = objc_msgSend(v6, "isEqualToString:", location[0]);

      if ((v7 & 1) != 0)
      {
        v21 = i;
        v13 = 1;
        goto LABEL_13;
      }
LABEL_12:
      v13 = 0;
      goto LABEL_13;
    }
    NSClassFromString(CFSTR("UIPickerTableViewWrapperCell"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_12;
    v12 = (id)objc_msgSend(v14, "safeValueForKey:", CFSTR("wrappedView"));
    v4 = (id)objc_msgSend(v12, "accessibilityLabel");
    v5 = objc_msgSend(v4, "isEqualToString:", location[0]);

    if ((v5 & 1) != 0)
    {
      v21 = i;
      v13 = 1;
    }
    else
    {
      v13 = 0;
    }
    objc_storeStrong(&v12, 0);
    if (!v13)
      goto LABEL_12;
LABEL_13:
    objc_storeStrong(&v14, 0);
    if (v13)
      goto LABEL_16;
  }
  v21 = 0x7FFFFFFFFFFFFFFFLL;
  v13 = 1;
LABEL_16:
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  return v21;
}

- (id)_accessibilityViewForComponent
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  id WeakRetained;
  BOOL v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v13 = a1;
  if (a1)
  {
    v7 = *(_QWORD *)(v13 + 56);
    WeakRetained = objc_loadWeakRetained((id *)(v13 + 64));
    v9 = v7 < objc_msgSend(WeakRetained, "numberOfComponents");

    if (v9)
    {
      v12 = 0;
      v3 = objc_loadWeakRetained((id *)(v13 + 64));
      v4 = objc_msgSend(v3, "selectedRowInComponent:", *(_QWORD *)(v13 + 56));

      v12 = v4;
      v11 = 0;
      v5 = objc_loadWeakRetained((id *)(v13 + 64));
      v6 = objc_msgSend(v5, "numberOfRowsInComponent:", *(_QWORD *)(v13 + 56));

      v11 = v6;
      if (v4 >= 0 && v12 < v11)
      {
        v2 = objc_loadWeakRetained((id *)(v13 + 64));
        v10 = (id)objc_msgSend(v2, "viewForRow:forComponent:", v12, *(_QWORD *)(v13 + 56));

        v14 = v10;
        objc_storeStrong(&v10, 0);
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)_accessibilityDateTimePickerValues
{
  int v2;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  uint64_t v9;
  id v10;
  char v11;
  id v12;
  uint64_t i;
  os_log_type_t v14;
  os_log_t oslog[2];
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27[3];
  char v28;
  os_log_type_t v29;
  id location;
  uint64_t v31;
  uint64_t *v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v39;
  int v40;
  int v41;
  id (*v42)(id *, void *, void *, void *);
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49[2];
  UIAccessibilityPickerComponent *v50;
  uint8_t v51[16];
  uint8_t v52[8];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v50 = self;
  v49[1] = (id)a2;
  v49[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v48 = -[UIAccessibilityPickerComponent _accessibilityDatePickerComponentType](v50, "_accessibilityDatePickerComponentType");
  if (!v48)
  {
    CFRunLoopRunInMode((CFRunLoopMode)*MEMORY[0x24BDBD5A0], 0.25, 0);
    v48 = -[UIAccessibilityPickerComponent _accessibilityDatePickerComponentType](v50, "_accessibilityDatePickerComponentType");
  }
  v47 = -[UIAccessibilityPickerComponent _accessibilityViewForComponent]((uint64_t)v50);
  v46 = (id)objc_msgSend(v47, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("_UIDatePickerView")));
  v39 = MEMORY[0x24BDAC760];
  v40 = -1073741824;
  v41 = 0;
  v42 = __68__UIAccessibilityPickerComponent__accessibilityDateTimePickerValues__block_invoke;
  v43 = &__block_descriptor_40_e24___NSString_32__0_8q16q24l;
  v44 = v48;
  v45 = (id)MEMORY[0x2348C3D88](&v39);
  v38 = (id)objc_msgSend(v46, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v37 = (id)objc_msgSend(v46, "safeValueForKey:", CFSTR("_mode"));
  v36 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x20000000;
  v34 = 32;
  v35 = 0;
  location = (id)AXLogUIA();
  v29 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_1_4_0((uint64_t)v52, (int)v48);
    _os_log_impl(&dword_230C4A000, (os_log_t)location, v29, "Date picker unit: %d", v52, 8u);
  }
  objc_storeStrong(&location, 0);
  if (v48 == (void *)2 || v48 == (void *)4)
    goto LABEL_26;
  if (v48 == (void *)8)
  {
    v32[3] = 12;
    goto LABEL_27;
  }
  if (v48 == (void *)16)
  {
    v32[3] = 31;
    goto LABEL_27;
  }
  if (v48 == (void *)32)
  {
    v10 = (id)objc_msgSend(v37, "safeValueForKey:", CFSTR("is24Hour"));
    v11 = objc_msgSend(v10, "BOOLValue");

    v28 = v11 & 1;
    if ((v11 & 1) != 0)
      v2 = 24;
    else
      v2 = 12;
    v32[3] = v2;
    goto LABEL_27;
  }
  if (v48 == (void *)64)
  {
    if (v38)
      v9 = objc_msgSend(v38, "minuteInterval");
    else
      v9 = 60;
    v32[3] = 60 / v9;
    goto LABEL_27;
  }
  if (v48 == (void *)128)
  {
    v32[3] = 60;
    goto LABEL_27;
  }
  if (v48 == (void *)536)
  {
LABEL_26:
    v22 = MEMORY[0x24BDAC760];
    v23 = -1073741824;
    v24 = 0;
    v25 = __68__UIAccessibilityPickerComponent__accessibilityDateTimePickerValues__block_invoke_224;
    v26 = &unk_24FF3E1F8;
    v27[1] = &v31;
    v27[0] = v37;
    v27[2] = v48;
    AXPerformSafeBlock();
    objc_storeStrong(v27, 0);
    goto LABEL_27;
  }
  if (v48 == (void *)0x10000)
    v32[3] = 2;
LABEL_27:
  if (v48 == (void *)536)
  {
    v21 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&v50->_picker);
    v7 = objc_msgSend(WeakRetained, "selectedRowInComponent:", v50->_component);

    v21 = v7;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v32[3] = 100;
    }
    else
    {
      v20 = 0;
      v19 = v21 - 50;
      if (v21 - 50 <= 0)
        v6 = v20;
      else
        v6 = v19;
      v18 = v6;
      v36 = v6;
      v17 = 0;
      v17 = v32[3];
      v16 = (v21 + 50);
      if ((uint64_t)v17 >= v21 + 50)
        v5 = v16;
      else
        v5 = v17;
      oslog[1] = v5;
      v32[3] = (uint64_t)v5;
    }
  }
  oslog[0] = (os_log_t)(id)AXLogUIA();
  v14 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v51, v36, v32[3]);
    _os_log_impl(&dword_230C4A000, oslog[0], v14, "Date picker start %d: end %d", v51, 0xEu);
  }
  objc_storeStrong((id *)oslog, 0);
  for (i = v36; i < v32[3]; ++i)
  {
    v12 = (id)(*((uint64_t (**)(id, id, uint64_t, unint64_t))v45 + 2))(v45, v37, i, v50->_component);
    if (!v12)
      _AXAssert();
    if (objc_msgSend(v12, "length"))
      objc_msgSend(v49[0], "addObject:", v12);
    if (v48 == (void *)4 && v32[3] > 1000 && i != v32[3] - 1)
      i = v32[3] - 2;
    objc_storeStrong(&v12, 0);
  }
  v4 = v49[0];
  _Block_object_dispose(&v31, 8);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(v49, 0);
  return v4;
}

id __68__UIAccessibilityPickerComponent__accessibilityDateTimePickerValues__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v5;
  id v9[5];
  uint64_t v10;
  uint64_t *v11;
  int v12;
  int v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16[2];
  void *v17;
  void *v18;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v18 = a3;
  v17 = a4;
  v16[1] = a1;
  v10 = 0;
  v11 = &v10;
  v12 = 838860800;
  v13 = 48;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16[0] = 0;
  v9[0] = location[0];
  v9[2] = a1[4];
  v9[3] = v18;
  v9[1] = &v10;
  v9[4] = v17;
  AXPerformSafeBlock();
  v5 = (id)v11[5];
  objc_storeStrong(v9, 0);
  _Block_object_dispose(&v10, 8);
  objc_storeStrong(v16, 0);
  objc_storeStrong(location, 0);
  return v5;
}

void __68__UIAccessibilityPickerComponent__accessibilityDateTimePickerValues__block_invoke_214(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v8;
  id v9[3];

  v9[2] = (id)a1;
  v9[1] = (id)a1;
  NSClassFromString(CFSTR("_UIDatePickerMode_DateAndTime"));
  if ((objc_opt_isKindOfClass() & 1) != 0 && *(_QWORD *)(a1 + 48) == 536)
  {
    v9[0] = (id)objc_msgSend(*(id *)(a1 + 32), "dateForRow:inCalendarUnit:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
    v8 = (id)objc_msgSend(*(id *)(a1 + 32), "dateFormatterForCalendarUnit:", *(_QWORD *)(a1 + 48));
    v1 = (id)objc_msgSend(v8, "stringFromDate:", v9[0]);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = v1;

    objc_storeStrong(&v8, 0);
    objc_storeStrong(v9, 0);
  }
  else
  {
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "titleForRow:inComponent:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

uint64_t __68__UIAccessibilityPickerComponent__accessibilityDateTimePickerValues__block_invoke_224(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "numberOfRowsForCalendarUnit:", *(_QWORD *)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_accessibilityDatePickerComponentType
{
  id v3;
  unint64_t v4;

  v3 = -[UIAccessibilityPickerComponent _accessibilityViewForComponent]((uint64_t)self);
  v4 = objc_msgSend(v3, "_accessibilityDatePickerComponentType");

  return v4;
}

- (double)_accessibilityNumberValue
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  unint64_t component;
  id WeakRetained;
  BOOL v9;

  component = self->_component;
  WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  v9 = component < objc_msgSend(WeakRetained, "numberOfComponents");

  if (!v9)
    return 0.0;
  v3 = objc_loadWeakRetained((id *)&self->_picker);
  v4 = objc_msgSend(v3, "selectedRowInComponent:", self->_component);

  v5 = objc_loadWeakRetained((id *)&self->_picker);
  v6 = objc_msgSend(v5, "numberOfRowsInComponent:", self->_component);

  if (v4 >= 0 && v4 < v6)
    return (double)v4;
  else
    return 0.0;
}

- (id)accessibilityValue
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  char v23;
  id v24;
  id v25;
  id v26;
  char v27;
  id v28;
  id v29;
  id v30;
  id v31;
  BOOL v32;
  id v33;
  id v34;
  char v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  unint64_t component;
  id WeakRetained;
  BOOL v43;
  id v44;
  id v45;
  id v46;
  char v47;
  id v48;
  char v49;
  id v50;
  id v51;
  char v52;
  id v53;
  char v54;
  id v55;
  id location;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  SEL v61;
  UIAccessibilityPickerComponent *v62;
  id v63;

  v62 = self;
  v61 = a2;
  component = self->_component;
  WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  v43 = component < objc_msgSend(WeakRetained, "numberOfComponents");

  if (v43)
  {
    v60 = 0;
    v37 = objc_loadWeakRetained((id *)&v62->_picker);
    v38 = objc_msgSend(v37, "selectedRowInComponent:", v62->_component);

    v60 = v38;
    v59 = 0;
    v39 = objc_loadWeakRetained((id *)&v62->_picker);
    v40 = objc_msgSend(v39, "numberOfRowsInComponent:", v62->_component);

    v59 = v40;
    if (v38 >= 0 && v60 < v59)
    {
      v36 = objc_loadWeakRetained((id *)&v62->_picker);
      v58 = (id)objc_msgSend(v36, "viewForRow:forComponent:", v60, v62->_component);

      v57 = (id)objc_msgSend(v58, "accessibilityLabel");
      if (objc_msgSend(v57, "length"))
      {
        v44 = (id)objc_msgSend(v58, "accessibilityLanguage");
        if (objc_msgSend(v44, "length"))
        {
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithString:", v57);
          v12 = v57;
          v57 = v11;

          objc_msgSend(v57, "setAttribute:forKey:", v44, *MEMORY[0x24BDF7358]);
        }
        objc_storeStrong(&v44, 0);
      }
      else
      {
        v34 = objc_loadWeakRetained((id *)&v62->_picker);
        v33 = (id)objc_msgSend(v34, "delegate");
        v35 = objc_opt_respondsToSelector();

        if ((v35 & 1) != 0)
        {
          v30 = objc_loadWeakRetained((id *)&v62->_picker);
          v29 = (id)objc_msgSend(v30, "delegate");
          v28 = objc_loadWeakRetained((id *)&v62->_picker);
          location = (id)objc_msgSend(v29, "pickerView:attributedTitleForRow:forComponent:");

          v31 = (id)objc_msgSend(location, "accessibilityLabel");
          v32 = objc_msgSend(v31, "length") == 0;

          if (v32)
            v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithCFAttributedString:", location);
          else
            v2 = (id)objc_msgSend(v57, "accessibilityLabel");
          v3 = v57;
          v57 = v2;

          objc_storeStrong(&location, 0);
        }
        v54 = 0;
        v52 = 0;
        v27 = 0;
        if (!objc_msgSend(v57, "length"))
        {
          v55 = objc_loadWeakRetained((id *)&v62->_picker);
          v54 = 1;
          v53 = (id)objc_msgSend(v55, "delegate");
          v52 = 1;
          v27 = objc_opt_respondsToSelector();
        }
        if ((v52 & 1) != 0)

        if ((v54 & 1) != 0)
        if ((v27 & 1) != 0)
        {
          v26 = objc_loadWeakRetained((id *)&v62->_picker);
          v25 = (id)objc_msgSend(v26, "delegate");
          v24 = objc_loadWeakRetained((id *)&v62->_picker);
          v4 = (id)objc_msgSend(v25, "pickerView:titleForRow:forComponent:");
          v5 = v57;
          v57 = v4;

          v51 = (id)objc_msgSend(v57, "accessibilityLabel");
          if (objc_msgSend(v51, "length"))
            objc_storeStrong(&v57, v51);
          objc_storeStrong(&v51, 0);
        }
        v49 = 0;
        v47 = 0;
        v23 = 0;
        if (!objc_msgSend(v57, "length"))
        {
          v50 = objc_loadWeakRetained((id *)&v62->_picker);
          v49 = 1;
          v48 = (id)objc_msgSend(v50, "delegate");
          v47 = 1;
          v23 = objc_opt_respondsToSelector();
        }
        if ((v47 & 1) != 0)

        if ((v49 & 1) != 0)
        if ((v23 & 1) != 0)
        {
          v22 = objc_loadWeakRetained((id *)&v62->_picker);
          v21 = (id)objc_msgSend(v22, "delegate");
          v20 = objc_loadWeakRetained((id *)&v62->_picker);
          v46 = (id)objc_msgSend(v21, "pickerView:viewForRow:forComponent:reusingView:");

          v6 = (id)objc_msgSend(v46, "accessibilityLabel");
          v7 = v57;
          v57 = v6;

          v45 = (id)objc_msgSend(v46, "accessibilityLanguage");
          if (objc_msgSend(v45, "length"))
          {
            v8 = objc_alloc(MEMORY[0x24BDFEA60]);
            v9 = (void *)objc_msgSend(v8, "initWithString:", v57);
            v10 = v57;
            v57 = v9;

            objc_msgSend(v57, "setAttribute:forKey:", v45, *MEMORY[0x24BDF7358]);
          }
          objc_storeStrong(&v45, 0);
          objc_storeStrong(&v46, 0);
        }
      }
      if (!objc_msgSend(v57, "length"))
      {
        v19 = (id)objc_msgSend(v58, "_accessibleSubviews");
        v13 = (id)MEMORY[0x2348C3584]();
        v14 = v57;
        v57 = v13;

      }
      if (!objc_msgSend(v57, "length"))
      {
        v18 = (id)objc_msgSend(v58, "accessibilityElements");
        v15 = (id)MEMORY[0x2348C3584]();
        v16 = v57;
        v57 = v15;

      }
      v63 = v57;
      objc_storeStrong(&v57, 0);
      objc_storeStrong(&v58, 0);
    }
    else
    {
      v63 = 0;
    }
  }
  else
  {
    v63 = 0;
  }
  return v63;
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2;
  NSUInteger v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t component;
  id WeakRetained;
  BOOL v14;
  id v15;
  id v16;
  char v17;
  id v18;
  id v19[4];
  int v20;
  int v21;
  __n128 (*v22)(uint64_t);
  void *v23;
  id v24[2];
  uint64_t v25;
  uint64_t *v26;
  int v27;
  int v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  SEL v38;
  UIAccessibilityPickerComponent *v39;
  uint64_t v40;
  NSUInteger v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _NSRange result;

  v39 = self;
  v38 = a2;
  component = self->_component;
  WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  v14 = component < objc_msgSend(WeakRetained, "numberOfComponents");

  if (v14)
  {
    v37 = 0;
    v8 = objc_loadWeakRetained((id *)&v39->_picker);
    v9 = objc_msgSend(v8, "selectedRowInComponent:", v39->_component);

    v37 = v9;
    v36 = 0;
    v10 = objc_loadWeakRetained((id *)&v39->_picker);
    v11 = objc_msgSend(v10, "numberOfRowsInComponent:", v39->_component);

    v36 = v11;
    if (v9 >= 0 && v37 < v36)
    {
      v7 = objc_loadWeakRetained((id *)&v39->_picker);
      v35 = (id)objc_msgSend(v7, "viewForRow:forComponent:", v37, v39->_component);

      NSClassFromString(CFSTR("UIDatePickerContentView"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = (id)objc_msgSend(v35, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("_UIDatePickerView")));
        v33 = (id)objc_msgSend(v34, "safeValueForKey:", CFSTR("_mode"));
        v32 = 0uLL;
        v25 = 0;
        v26 = &v25;
        v27 = 0x10000000;
        v28 = 48;
        v29 = &unk_230DEFD8E;
        v30 = 0;
        v31 = 0;
        v19[3] = (id)MEMORY[0x24BDAC760];
        v20 = -1073741824;
        v21 = 0;
        v22 = __55__UIAccessibilityPickerComponent_accessibilityRowRange__block_invoke;
        v23 = &unk_24FF3DE88;
        v24[1] = &v25;
        v24[0] = v33;
        AXPerformSafeBlock();
        v32 = *((_OWORD *)v26 + 2);
        objc_storeStrong(v24, 0);
        _Block_object_dispose(&v25, 8);
        v19[0] = (id)objc_msgSend(v34, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
        v17 = 0;
        v6 = (id)objc_msgSend(v33, "safeValueForKey:", CFSTR("_selectedDateComponents"));
        v16 = (id)__UIAccessibilitySafeClass();

        v15 = v16;
        objc_storeStrong(&v16, 0);
        v18 = v15;
        v4 = objc_loadWeakRetained((id *)&v39->_picker);
        v5 = objc_msgSend(v4, "_accessibilityPickerType");

        if ((unint64_t)(v5 - 2) <= 3)
          __asm { BR              X8 }
        objc_storeStrong(&v18, 0);
        objc_storeStrong(v19, 0);
        objc_storeStrong(&v33, 0);
        objc_storeStrong(&v34, 0);
        v43 = 0x7FFFFFFFLL;
        v42 = 0;
        v44 = 0x7FFFFFFFLL;
        v45 = 0;
        v40 = 0x7FFFFFFFLL;
        v41 = 0;
      }
      else
      {
        NSClassFromString(CFSTR("UIDatePickerWeekMonthDayView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v51 = 0x7FFFFFFFLL;
          v50 = 0;
          v52 = 0x7FFFFFFFLL;
          v53 = 0;
          v40 = 0x7FFFFFFFLL;
          v41 = 0;
        }
        else
        {
          v47 = v37;
          v46 = v36;
          v48 = v37;
          v49 = v36;
          v40 = v37;
          v41 = v36;
        }
      }
      objc_storeStrong(&v35, 0);
    }
    else
    {
      v40 = 0x7FFFFFFFLL;
      v41 = 0;
    }
  }
  else
  {
    v40 = 0x7FFFFFFFLL;
    v41 = 0;
  }
  v2 = v40;
  v3 = v41;
  result.length = v3;
  result.location = v2;
  return result;
}

__n128 __55__UIAccessibilityPickerComponent_accessibilityRowRange__block_invoke(uint64_t a1)
{
  unint64_t v1;
  __n128 result;
  __n128 v4;

  v4.n128_u64[0] = objc_msgSend(*(id *)(a1 + 32), "rangeForCalendarUnit:", 32);
  v4.n128_u64[1] = v1;
  result = v4;
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v4;
  return result;
}

uint64_t __55__UIAccessibilityPickerComponent_accessibilityRowRange__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "numberOfRowsForCalendarUnit:", 32);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (CGRect)accessibilityFrame
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  id v20;
  unint64_t v21;
  unint64_t component;
  id v23;
  BOOL v24;
  id v25;
  id v26;
  id WeakRetained;
  BOOL v28;
  CGPoint v29;
  CGSize v30;
  CGPoint v31;
  CGSize v32;
  CGRect v33;
  UIView *v34;
  int v35;
  id v36[2];
  UIAccessibilityPickerComponent *v37;
  __int128 v38;
  __int128 v39;
  CGRect v40;
  CGRect result;

  v37 = self;
  v36[1] = (id)a2;
  WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  v2 = (id)objc_msgSend(WeakRetained, "accessibilityUserDefinedFrame");
  v28 = v2 == 0;

  if (v28)
  {
    component = v37->_component;
    v23 = objc_loadWeakRetained((id *)&v37->_picker);
    v24 = component < objc_msgSend(v23, "numberOfComponents");

    if (v24)
    {
      v20 = objc_loadWeakRetained((id *)&v37->_picker);
      v36[0] = (id)objc_msgSend(v20, "safeValueForKey:", CFSTR("_tables"));

      v21 = v37->_component;
      if (v21 < objc_msgSend(v36[0], "count"))
      {
        v34 = (UIView *)(id)objc_msgSend(v36[0], "objectAtIndex:", v37->_component);
        v33.origin = (CGPoint)*MEMORY[0x24BDBF090];
        v33.size = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
        NSClassFromString(CFSTR("UIPickerColumnView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = (id)-[UIView safeValueForKey:](v34, "safeValueForKey:", CFSTR("_tableFrame"));
          objc_msgSend(v19, "rectValue");
          v31.x = v7;
          v31.y = v8;
          v32.width = v9;
          v32.height = v10;
          v33.origin = v31;
          v33.size = v32;

        }
        else
        {
          NSClassFromString(CFSTR("UIPickerTableView"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[UIView bounds](v34, "bounds");
            v29.x = v11;
            v29.y = v12;
            v30.width = v13;
            v30.height = v14;
            v33.origin = v29;
            v33.size = v30;
          }
        }
        v40 = UIAccessibilityConvertFrameToScreenCoordinates(v33, v34);
        *(CGFloat *)&v38 = v40.origin.x;
        *((_QWORD *)&v38 + 1) = *(_QWORD *)&v40.origin.y;
        *(CGFloat *)&v39 = v40.size.width;
        *((_QWORD *)&v39 + 1) = *(_QWORD *)&v40.size.height;
        v35 = 1;
        objc_storeStrong((id *)&v34, 0);
      }
      else
      {
        v38 = *MEMORY[0x24BDBF090];
        v39 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
        v35 = 1;
      }
      objc_storeStrong(v36, 0);
    }
    else
    {
      v38 = *MEMORY[0x24BDBF090];
      v39 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    }
  }
  else
  {
    v26 = objc_loadWeakRetained((id *)&v37->_picker);
    v25 = (id)objc_msgSend(v26, "accessibilityUserDefinedFrame");
    objc_msgSend(v25, "CGRectValue");
    *(_QWORD *)&v38 = v3;
    *((_QWORD *)&v38 + 1) = v4;
    *(_QWORD *)&v39 = v5;
    *((_QWORD *)&v39 + 1) = v6;

  }
  v16 = *((double *)&v38 + 1);
  v15 = *(double *)&v38;
  v18 = *((double *)&v39 + 1);
  v17 = *(double *)&v39;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)_accessibilityMoveSelection:(uint64_t)a1
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  char v9;
  BOOL v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  BOOL v18;
  unint64_t v19;
  id WeakRetained;
  BOOL v21;
  id v22;
  id v23;
  id v24[3];
  void *v25;
  id v26;
  id v27;
  char v28;
  id v29;
  id v30;
  char v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;

  v34 = a1;
  v33 = a2;
  if (a1)
  {
    v19 = *(_QWORD *)(v34 + 56);
    WeakRetained = objc_loadWeakRetained((id *)(v34 + 64));
    v21 = v19 < objc_msgSend(WeakRetained, "numberOfComponents");

    if (v21)
    {
      v32 = 0;
      v15 = objc_loadWeakRetained((id *)(v34 + 64));
      v16 = objc_msgSend(v15, "selectedRowInComponent:", *(_QWORD *)(v34 + 56));

      v32 = (char *)(v16 + v33);
      v17 = objc_loadWeakRetained((id *)(v34 + 64));
      v18 = v16 + v33 < objc_msgSend(v17, "numberOfRowsInComponent:", *(_QWORD *)(v34 + 56));

      if (v18)
      {
        if ((uint64_t)v32 < 0)
          v32 = 0;
      }
      else
      {
        v14 = objc_loadWeakRetained((id *)(v34 + 64));
        v32 = (char *)(objc_msgSend(v14, "numberOfRowsInComponent:", *(_QWORD *)(v34 + 56)) - 1);

      }
      v31 = 1;
      v13 = objc_loadWeakRetained((id *)(v34 + 64));
      v30 = (id)objc_msgSend(v13, "viewForRow:forComponent:", v32, *(_QWORD *)(v34 + 56));

      if (v30)
      {
        NSClassFromString(CFSTR("UIDatePickerContentView"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = (id)objc_msgSend(v30, "safeValueForKey:", CFSTR("titleLabel"));
          v11 = (id)objc_msgSend(v12, "safeValueForKey:", CFSTR("isEnabled"));
          v31 = objc_msgSend(v11, "BOOLValue") & 1;

        }
      }
      if ((v31 & 1) != 0)
      {
        if (v33 > 0)
        {
          while (1)
          {
            v8 = objc_loadWeakRetained((id *)(v34 + 64));
            v9 = 0;
            if ((uint64_t)v32 < objc_msgSend(v8, "numberOfRowsInComponent:", *(_QWORD *)(v34 + 56)) - 1)
              v9 = -[UIAccessibilityPickerComponent _isRowDisabledInWebKit:](v34, (uint64_t)v32);

            if ((v9 & 1) == 0)
              break;
            ++v32;
          }
        }
      }
      else if (v33 >= 0 || (uint64_t)v32 <= 0)
      {
        v28 = 0;
        v10 = 0;
        if (v33 > 0)
        {
          v29 = objc_loadWeakRetained((id *)(v34 + 64));
          v28 = 1;
          v10 = (uint64_t)v32 < objc_msgSend(v29, "numberOfRowsInComponent:", *(_QWORD *)(v34 + 56));
        }
        if ((v28 & 1) != 0)

        if (v10)
          ++v32;
      }
      else
      {
        --v32;
      }
      v5 = objc_loadWeakRetained((id *)(v34 + 64));
      v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("_tables"));
      v27 = (id)objc_msgSend(v4, "objectAtIndex:", *(_QWORD *)(v34 + 56));

      v26 = (id)objc_msgSend(v27, "safeValueForKey:", CFSTR("_middleTable"));
      v6 = (id)objc_msgSend(v26, "safeValueForKey:", CFSTR("_contentOffsetAnimationDuration"));
      objc_msgSend(v6, "doubleValue");
      v7 = v2;

      v25 = v7;
      v22 = v26;
      v23 = (id)v34;
      v24[0] = v27;
      v24[1] = v32;
      v24[2] = v25;
      AXPerformSafeBlock();
      v3 = (id)objc_msgSend(v26, "safeValueForKey:", CFSTR("_scrollingFinished"));
      objc_storeStrong(v24, 0);
      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v22, 0);
      objc_storeStrong(&v26, 0);
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v30, 0);
    }
  }
}

- (uint64_t)_isRowDisabledInWebKit:(uint64_t)a1
{
  double v2;
  double v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  int v12;
  id WeakRetained;
  BOOL v14;
  id location;
  int v16;
  id v17;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v21 = a1;
  v20 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v21 + 64));
    v14 = v20 < objc_msgSend(WeakRetained, "numberOfRowsInComponent:", *(_QWORD *)(v21 + 56));

    if (v14)
    {
      v11 = objc_loadWeakRetained((id *)(v21 + 64));
      NSClassFromString(CFSTR("WKSelectSinglePicker"));
      v18 = 0;
      LOBYTE(v12) = 0;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v19 = objc_loadWeakRetained((id *)(v21 + 64));
        v18 = 1;
        NSClassFromString(CFSTR("UIWebSelectSinglePicker"));
        v12 = objc_opt_isKindOfClass() ^ 1;
      }
      if ((v18 & 1) != 0)

      if ((v12 & 1) != 0)
      {
        v22 = 0;
      }
      else
      {
        v9 = objc_loadWeakRetained((id *)(v21 + 64));
        v8 = (id)objc_msgSend(v9, "delegate");
        v10 = objc_opt_respondsToSelector();

        if ((v10 & 1) != 0)
        {
          v7 = objc_loadWeakRetained((id *)(v21 + 64));
          v6 = (id)objc_msgSend(v7, "delegate");
          v5 = objc_loadWeakRetained((id *)(v21 + 64));
          v17 = (id)objc_msgSend(v6, "pickerView:attributedTitleForRow:forComponent:");

          if (objc_msgSend(v17, "length"))
          {
            location = (id)objc_msgSend(v17, "attribute:atIndex:effectiveRange:", *MEMORY[0x24BEBB368], 0, 0);
            if (location
              && (objc_msgSend(location, "alphaComponent"), v2 > 0.0)
              && (objc_msgSend(location, "alphaComponent"), v3 < 1.0))
            {
              v22 = 1;
              v16 = 1;
            }
            else
            {
              v22 = 0;
              v16 = 1;
            }
            objc_storeStrong(&location, 0);
          }
          else
          {
            v22 = 0;
            v16 = 1;
          }
          objc_storeStrong(&v17, 0);
        }
        else
        {
          v22 = 0;
        }
      }
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }
  return v22 & 1;
}

uint64_t __62__UIAccessibilityPickerComponent__accessibilityMoveSelection___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;
  char isKindOfClass;
  id v6[2];
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a1;
  v9 = a1;
  objc_msgSend(*(id *)(a1 + 32), "_setContentOffsetAnimationDuration:", 0.01);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
  v7 = 0;
  isKindOfClass = 1;
  if ((objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("allowsMultipleSelection")) & 1) == 0)
  {
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
    v7 = 1;
    NSClassFromString(CFSTR("WKMultipleSelectPicker"));
    isKindOfClass = objc_opt_isKindOfClass();
  }
  if ((v7 & 1) != 0)

  if ((isKindOfClass & 1) != 0)
  {
    v6[0] = *(id *)(a1 + 48);
    v6[1] = *(id *)(a1 + 56);
    AXPerformSafeBlock();
    objc_storeStrong(v6, 0);
  }
  else
  {
    v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 64));
    objc_msgSend(v2, "_selectRow:inComponent:animated:notify:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), 1, 1);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_setContentOffsetAnimationDuration:", *(double *)(a1 + 64));
}

void __62__UIAccessibilityPickerComponent__accessibilityMoveSelection___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(v1, "_scrollRowAtIndexPathToSelectionBar:animated:");

}

- (id)_accessibilityScrollStatus
{
  return -[UIAccessibilityPickerComponent accessibilityValue](self, "accessibilityValue", a2, self);
}

- (void)accessibilityIncrement
{
  -[UIAccessibilityPickerComponent _accessibilityMoveSelection:]((uint64_t)self, 1);
}

- (void)accessibilityDecrement
{
  -[UIAccessibilityPickerComponent _accessibilityMoveSelection:]((uint64_t)self, -1);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 3)
  {
    -[UIAccessibilityPickerComponent _accessibilityMoveSelection:]((uint64_t)self, -8);
  }
  else if (a3 == 4)
  {
    -[UIAccessibilityPickerComponent _accessibilityMoveSelection:]((uint64_t)self, 8);
  }
  return 0;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  id *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t component;
  id WeakRetained;
  BOOL v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;
  unint64_t v28;
  SEL v29;
  UIAccessibilityPickerComponent *v30;

  v30 = self;
  v29 = a2;
  component = self->_component;
  WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  v20 = component < objc_msgSend(WeakRetained, "numberOfComponents");

  if (!v20)
    return 0;
  v28 = 0;
  v27.receiver = v30;
  v27.super_class = (Class)UIAccessibilityPickerComponent;
  v28 = -[UIAccessibilityPickerComponent accessibilityTraits](&v27, sel_accessibilityTraits);
  v28 |= *MEMORY[0x24BEBB148] | *MEMORY[0x24BDF73A0];
  v26 = 0;
  v14 = objc_loadWeakRetained((id *)&v30->_picker);
  v15 = objc_msgSend(v14, "selectedRowInComponent:", v30->_component);

  v26 = v15;
  v25 = 0;
  v16 = objc_loadWeakRetained((id *)&v30->_picker);
  v17 = objc_msgSend(v16, "numberOfRowsInComponent:", v30->_component);

  v25 = v17;
  if (v15 < 0 || v26 >= v25)
    return v28;
  v12 = objc_loadWeakRetained((id *)&v30->_picker);
  v11 = (id)objc_msgSend(v12, "delegate");
  v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&v30->_picker);
    v9 = (id)objc_msgSend(v10, "delegate");
    v8 = objc_loadWeakRetained((id *)&v30->_picker);
    v24 = (id)objc_msgSend(v9, "pickerView:viewForRow:forComponent:reusingView:");

    if ((-[UIAccessibilityPickerComponent _axIsInDatePickerView]((uint64_t)v30) & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)&v30->_picker);
      v23 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("_mode"));

      v6 = (id)objc_msgSend((id)objc_opt_class(), "safeValueForKey:", CFSTR("datePickerMode"));
      v7 = objc_msgSend(v6, "integerValue");

      v22 = v7;
      if (v7 == 1 || v22 == 2)
      {
        v21 = (id)objc_msgSend(v23, "safeValueForKey:", CFSTR("todayTextColor"));
        objc_msgSend(v24, "_accessibilitySetRetainedValue:forKey:", v21, CFSTR("SelectedColor"));
        objc_storeStrong(&v21, 0);
      }
      objc_storeStrong(&v23, 0);
    }
    v2 = objc_msgSend(v24, "accessibilityTraits", &v24);
    v28 |= v2;
    objc_storeStrong(v4, 0);
  }
  return v28;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)_axSpeechInputLabelForDateCalendarUnit:(uint64_t)a1
{
  id v2;
  id v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v7 = a1;
  v6 = a2;
  if (a1)
  {
    v5 = 0;
    if (v6 == 4 || v6 == 8 || v6 == 16 || v6 == 32 || v6 == 64 || v6 == 128 || v6 == 536 || v6 == 0x10000)
    {
      v2 = (id)accessibilityUIKitLocalizedString();
      v3 = v5;
      v5 = v2;

    }
    else
    {
      _AXAssert();
    }
    v8 = v5;
    objc_storeStrong(&v5, 0);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_axSpeechInputLabelForTimeIntervalCalendarUnit:(uint64_t)a1
{
  id v2;
  id v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v7 = a1;
  v6 = a2;
  if (a1)
  {
    v5 = 0;
    if (v6 == 32 || v6 == 64 || v6 == 128)
    {
      v2 = (id)accessibilityUIKitLocalizedString();
      v3 = v5;
      v5 = v2;

    }
    else
    {
      _AXAssert();
    }
    v8 = v5;
    objc_storeStrong(&v5, 0);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)accessibilityUserInputLabels
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;
  id v27;
  id v28;
  id v29;
  id v30;
  char v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  unint64_t component;
  id WeakRetained;
  BOOL v40;
  uint64_t v41;
  objc_super v42;
  id location;
  id v44;
  id v45[2];
  UIAccessibilityPickerComponent *v46;
  id v47;

  v46 = self;
  v45[1] = (id)a2;
  component = self->_component;
  WeakRetained = objc_loadWeakRetained((id *)&self->_picker);
  v40 = component < objc_msgSend(WeakRetained, "numberOfComponents");

  if (v40)
  {
    v45[0] = 0;
    v37 = objc_loadWeakRetained((id *)&v46->_picker);
    v44 = (id)objc_msgSend(v37, "delegate");

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v36 = -[UIAccessibilityPickerComponent picker]((uint64_t)v46);
      location = (id)objc_msgSend(v44, "pickerView:accessibilityAttributedUserInputLabelsForComponent:");

      if (objc_msgSend(location, "count"))
      {
        v2 = (id)objc_msgSend(location, "ax_mappedArrayUsingBlock:", &__block_literal_global_10);
        v3 = v45[0];
        v45[0] = v2;

      }
      objc_storeStrong(&location, 0);
    }
    if (!v45[0] && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v34 = v44;
      v35 = -[UIAccessibilityPickerComponent picker]((uint64_t)v46);
      v4 = (id)objc_msgSend(v34, "pickerView:accessibilityUserInputLabelsForComponent:");
      v5 = v45[0];
      v45[0] = v4;

    }
    if (!objc_msgSend(v45[0], "count"))
    {
      v33 = -[UIAccessibilityPickerComponent accessibilityLabel](v46, "accessibilityLabel");
      v6 = (id)MEMORY[0x2348C3560]();
      v7 = v45[0];
      v45[0] = v6;

    }
    if (!objc_msgSend(v45[0], "count"))
    {
      v42.receiver = v46;
      v42.super_class = (Class)UIAccessibilityPickerComponent;
      v8 = -[UIAccessibilityPickerComponent accessibilityUserInputLabels](&v42, sel_accessibilityUserInputLabels);
      v9 = v45[0];
      v45[0] = v8;

    }
    if (!objc_msgSend(v45[0], "count"))
    {
      v32 = objc_loadWeakRetained((id *)&v46->_picker);
      objc_msgSend(v32, "selectedRowInComponent:", v46->_component);

      if ((-[UIAccessibilityPickerComponent _axIsInDatePickerView]((uint64_t)v46) & 1) != 0)
      {
        v41 = -[UIAccessibilityPickerComponent _accessibilityDatePickerComponentType](v46, "_accessibilityDatePickerComponentType");
        v30 = objc_loadWeakRetained((id *)&v46->_picker);
        v29 = (id)objc_msgSend(v30, "safeValueForKey:", CFSTR("_mode"));
        v31 = objc_msgSend(v29, "safeBoolForKey:", CFSTR("isTimeIntervalMode"));

        if ((v31 & 1) != 0)
        {
          v28 = -[UIAccessibilityPickerComponent _axSpeechInputLabelForTimeIntervalCalendarUnit:]((uint64_t)v46, v41);
          v10 = (id)MEMORY[0x2348C3560]();
          v11 = v45[0];
          v45[0] = v10;

        }
        else
        {
          v27 = -[UIAccessibilityPickerComponent _axSpeechInputLabelForDateCalendarUnit:]((uint64_t)v46, v41);
          v12 = (id)MEMORY[0x2348C3560]();
          v13 = v45[0];
          v45[0] = v12;

        }
      }
      else
      {
        v25 = objc_loadWeakRetained((id *)&v46->_picker);
        v24 = (id)objc_msgSend(v25, "delegate");
        v26 = objc_opt_respondsToSelector();

        if ((v26 & 1) != 0)
        {
          v23 = objc_loadWeakRetained((id *)&v46->_picker);
          v22 = (id)objc_msgSend(v23, "delegate");
          v21 = objc_loadWeakRetained((id *)&v46->_picker);
          v20 = (id)objc_msgSend(v22, "pickerView:viewForRow:forComponent:reusingView:");
          v14 = (id)objc_msgSend(v20, "accessibilityUserInputLabels");
          v15 = v45[0];
          v45[0] = v14;

        }
      }
      if (!objc_msgSend(v45[0], "count"))
      {
        v19 = -[UIAccessibilityPickerComponent accessibilityValue](v46, "accessibilityValue");
        v16 = (id)MEMORY[0x2348C3560]();
        v17 = v45[0];
        v45[0] = v16;

      }
    }
    v47 = v45[0];
    objc_storeStrong(&v44, 0);
    objc_storeStrong(v45, 0);
  }
  else
  {
    v47 = MEMORY[0x24BDBD1A8];
  }
  return v47;
}

id __62__UIAccessibilityPickerComponent_accessibilityUserInputLabels__block_invoke(void *a1, void *a2)
{
  id v2;
  id v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v2 = objc_alloc(MEMORY[0x24BDFEA60]);
  v4 = (id)objc_msgSend(v2, "initWithCFAttributedString:", location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)_accessibilitySetNativeFocus
{
  id v3;
  id v4;
  id v5;
  char v6;

  v5 = -[UIAccessibilityPickerComponent picker]((uint64_t)self);
  v4 = (id)objc_msgSend(v5, "safeArrayForKey:", CFSTR("_tables"));
  v3 = (id)objc_msgSend(v4, "axSafeObjectAtIndex:", -[UIAccessibilityPickerComponent component]((uint64_t)self));
  v6 = objc_msgSend(v3, "_accessibilitySetNativeFocus");

  return v6 & 1;
}

- (uint64_t)component
{
  if (a1)
    return *(_QWORD *)(a1 + 56);
  else
    return 0;
}

- (uint64_t)setComponent:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 56) = a2;
  return result;
}

- (id)setPicker:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 8, a2);
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_picker);
}

@end
