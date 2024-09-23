id _DMTLogOperation()
{
  if (_DMTLogOperation_onceToken != -1)
    dispatch_once(&_DMTLogOperation_onceToken, &__block_literal_global);
  return (id)_DMTLogOperation_logObj;
}

id DMTValidateProfileArray(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  void *v8;
  void *v9;
  CFTypeID v10;
  id v11;
  void *v12;
  uint64_t v13;
  const __CFString *v15;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = CFGetTypeID(v8);
    if (v10 == CFArrayGetTypeID())
    {
      v11 = v9;
      goto LABEL_11;
    }
    if (!a4)
    {
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
    v15 = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
    v16 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 71;
LABEL_9:
    DMTErrorWithCodeAndUserInfo(v13, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v11 = 0;
  if (!a3 && a4)
  {
    v17 = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
    v18[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 70;
    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

uint64_t DMTValidateProfileBoolean(void *a1, void *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  id v9;
  void *v10;
  void *v11;
  CFTypeID v12;
  CFTypeID v13;
  void *v14;
  uint64_t v15;
  const __CFString *v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    if (a3)
      goto LABEL_12;
    if (a5)
    {
      v19 = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
      v20[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 70;
LABEL_10:
      DMTErrorWithCodeAndUserInfo(v15, v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_11:
    a4 = 0;
    goto LABEL_12;
  }
  v12 = CFGetTypeID(v10);
  if (v12 != CFNumberGetTypeID())
  {
    v13 = CFGetTypeID(v11);
    if (v13 != CFBooleanGetTypeID())
    {
      if (a5)
      {
        v17 = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
        v18 = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 71;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
  }
  a4 = BooleanValueForObject(v11);
LABEL_12:

  return a4;
}

id DMTValidateProfileData(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  void *v8;
  void *v9;
  CFTypeID v10;
  id v11;
  void *v12;
  uint64_t v13;
  const __CFString *v15;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = CFGetTypeID(v8);
    if (v10 == CFDataGetTypeID())
    {
      v11 = v9;
      goto LABEL_11;
    }
    if (!a4)
    {
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
    v15 = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
    v16 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 71;
LABEL_9:
    DMTErrorWithCodeAndUserInfo(v13, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v11 = 0;
  if (!a3 && a4)
  {
    v17 = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
    v18[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 70;
    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

id DMTValidateProfileDate(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  void *v8;
  void *v9;
  CFTypeID v10;
  id v11;
  void *v12;
  uint64_t v13;
  const __CFString *v15;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = CFGetTypeID(v8);
    if (v10 == CFDateGetTypeID())
    {
      v11 = v9;
      goto LABEL_11;
    }
    if (!a4)
    {
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
    v15 = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
    v16 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 71;
LABEL_9:
    DMTErrorWithCodeAndUserInfo(v13, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v11 = 0;
  if (!a3 && a4)
  {
    v17 = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
    v18[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 70;
    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

id DMTValidateProfileDictionary(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  void *v8;
  void *v9;
  CFTypeID v10;
  id v11;
  void *v12;
  uint64_t v13;
  const __CFString *v15;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = CFGetTypeID(v8);
    if (v10 == CFDictionaryGetTypeID())
    {
      v11 = v9;
      goto LABEL_11;
    }
    if (!a4)
    {
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
    v15 = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
    v16 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 71;
LABEL_9:
    DMTErrorWithCodeAndUserInfo(v13, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v11 = 0;
  if (!a3 && a4)
  {
    v17 = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
    v18[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 70;
    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

id DMTValidateProfileNumber(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  void *v8;
  void *v9;
  CFTypeID v10;
  id v11;
  void *v12;
  uint64_t v13;
  const __CFString *v15;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = CFGetTypeID(v8);
    if (v10 == CFNumberGetTypeID())
    {
      v11 = v9;
      goto LABEL_11;
    }
    if (!a4)
    {
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
    v15 = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
    v16 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 71;
LABEL_9:
    DMTErrorWithCodeAndUserInfo(v13, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v11 = 0;
  if (!a3 && a4)
  {
    v17 = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
    v18[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 70;
    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

id DMTValidateProfileString(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  void *v8;
  void *v9;
  CFTypeID v10;
  id v11;
  void *v12;
  uint64_t v13;
  const __CFString *v15;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = CFGetTypeID(v8);
    if (v10 == CFStringGetTypeID())
    {
      v11 = v9;
      goto LABEL_11;
    }
    if (!a4)
    {
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
    v15 = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
    v16 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 71;
LABEL_9:
    DMTErrorWithCodeAndUserInfo(v13, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v11 = 0;
  if (!a3 && a4)
  {
    v17 = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
    v18[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 70;
    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

id DMTLocalizedOrganizationMarketingNameForOrganizationType(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  switch(a1)
  {
    case 3:
      DMTBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Apple Business Essentials");
      break;
    case 2:
      DMTBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Apple Business Manager");
      break;
    case 1:
      DMTBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Apple School Manager");
      break;
    default:
      DMTBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("Apple School Manager, Apple Business Manager or Apple Business Essentials");
      break;
  }
  objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_24E5A0848, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id DMTFormattedEnrollmentOrganizationNameFrom(uint64_t a1)
{
  void *v1;
  void *v2;

  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("“%@”"), a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("your organization"), &stru_24E5A0848, 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

id DMTTitleTextAddingDeviceFor(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  int v5;
  void *v6;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("iPhone")))
  {
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("Adding iPhone…");
  }
  else
  {
    v5 = objc_msgSend(v1, "isEqualToString:", CFSTR("iPad"));
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v5)
      v4 = CFSTR("Adding iPad…");
    else
      v4 = CFSTR("Adding…");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_24E5A0848, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id DMTCompletionButtonTitleForDeviceClass(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  int v5;
  void *v6;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("iPhone")))
  {
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("Erase iPhone");
  }
  else
  {
    v5 = objc_msgSend(v1, "isEqualToString:", CFSTR("iPad"));
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v5)
      v4 = CFSTR("Erase iPad");
    else
      v4 = CFSTR("Erase Device");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_24E5A0848, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id DMTDetailTextAddingDeviceBodyFor(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  int v5;
  void *v6;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("iPhone")))
  {
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("This iPhone will be added to %@ in %@.");
  }
  else
  {
    v5 = objc_msgSend(v1, "isEqualToString:", CFSTR("iPad"));
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v5)
      v4 = CFSTR("This iPad will be added to %@ in %@.");
    else
      v4 = CFSTR("This device will be added to %@ in %@.");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_24E5A0848, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id DMTSuccessfulEnrollmentTitleTextForDeviceClass(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  int v5;
  void *v6;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("iPhone")))
  {
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("iPhone Added");
  }
  else
  {
    v5 = objc_msgSend(v1, "isEqualToString:", CFSTR("iPad"));
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v5)
      v4 = CFSTR("iPad Added");
    else
      v4 = CFSTR("Device Added");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_24E5A0848, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id DMTDetailTextSuccessfulEnrollmentFor(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  int v5;
  void *v6;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("iPhone")))
  {
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("This iPhone has been added to %@.\n\nAssign this iPhone to an MDM server in %@ to configure its enrollment settings and enable Automated Device Enrollment.");
  }
  else
  {
    v5 = objc_msgSend(v1, "isEqualToString:", CFSTR("iPad"));
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v5)
      v4 = CFSTR("This iPad has been added to %@.\n\nAssign this iPad to an MDM server in %@ to configure its enrollment settings and enable Automated Device Enrollment.");
    else
      v4 = CFSTR("This device has been added to %@.\n\nAssign this device to an MDM server in %@ to configure its enrollment settings and enable Automated Device Enrollment.");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_24E5A0848, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id DMTDetailTextSuccessfulEnrollmentWithMDMServerFor(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  int v5;
  void *v6;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("iPhone")))
  {
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("This iPhone has been added to %@.\n\nThis iPhone has been assigned to MDM Server “%@” in %@.");
  }
  else
  {
    v5 = objc_msgSend(v1, "isEqualToString:", CFSTR("iPad"));
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v5)
      v4 = CFSTR("This iPad has been added to %@.\n\nThis iPad has been assigned to MDM Server “%@” in %@.");
    else
      v4 = CFSTR("This device has been added to %@.\n\nThis device has been assigned to MDM Server “%@” in %@.");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_24E5A0848, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id DMTTitleTextFailureEnrollmentFor(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  int v5;
  void *v6;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("iPhone")))
  {
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("Failed to Add iPhone");
  }
  else
  {
    v5 = objc_msgSend(v1, "isEqualToString:", CFSTR("iPad"));
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v5)
      v4 = CFSTR("Failed to Add iPad");
    else
      v4 = CFSTR("Failed to Add Device");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_24E5A0848, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id DMTDetailTextFailureEnrollmentFor(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  int v5;
  void *v6;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("iPhone")))
  {
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("There was a problem adding this iPhone. Tap Erase iPhone to try again.");
  }
  else
  {
    v5 = objc_msgSend(v1, "isEqualToString:", CFSTR("iPad"));
    DMTBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v5)
      v4 = CFSTR("There was a problem adding this iPad. Tap Erase iPad to try again.");
    else
      v4 = CFSTR("There was a problem adding this device. Tap Erase device to try again.");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_24E5A0848, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_21FD6DE44(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21FD6E37C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _DMTLogGeneral()
{
  if (_DMTLogGeneral_onceToken != -1)
    dispatch_once(&_DMTLogGeneral_onceToken, &__block_literal_global_102);
  return (id)_DMTLogGeneral_logObj;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_21FD6E8EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21FD6EC04(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;

  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 88));
  _Unwind_Resume(a1);
}

void sub_21FD6EC5C()
{
  JUMPOUT(0x21FD6EC44);
}

id _DMTLogGeneral_0()
{
  if (_DMTLogGeneral_onceToken_0 != -1)
    dispatch_once(&_DMTLogGeneral_onceToken_0, &__block_literal_global_120);
  return (id)_DMTLogGeneral_logObj_0;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

void sub_21FD721A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FD728DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FD729F0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21FD72EB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  id *v9;
  id *v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v17 - 112));
  _Unwind_Resume(a1);
}

void sub_21FD72F30()
{
  JUMPOUT(0x21FD72F00);
}

void sub_21FD72F38()
{
  JUMPOUT(0x21FD72F08);
}

void sub_21FD72F40()
{
  JUMPOUT(0x21FD72F10);
}

void sub_21FD72F48()
{
  JUMPOUT(0x21FD72F18);
}

id _DMTLogGeneral_1()
{
  if (_DMTLogGeneral_onceToken_5 != -1)
    dispatch_once(&_DMTLogGeneral_onceToken_5, &__block_literal_global_6);
  return (id)_DMTLogGeneral_logObj_5;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id DMTDescriptionKeyFormattedString(void *a1, uint64_t a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a1;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:arguments:", v4, a2);

  return v5;
}

id DMTErrorWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  _QWORD v28[4];
  id v29;

  v3 = a2;
  if (DMTErrorWithCodeAndUserInfo_onceToken != -1)
    dispatch_once(&DMTErrorWithCodeAndUserInfo_onceToken, &__block_literal_global_7);
  v4 = DMTisWAPI();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("NSDescriptionKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_5;
  }
  if (a1 > 89)
  {
    switch(a1)
    {
      case 'Z':
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Task server invalidated.");
        break;
      case '[':
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Client Disconnected");
        break;
      case 'd':
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("The device has already been added to a different organization");
        break;
      default:
LABEL_5:
        v8 = v3;
        goto LABEL_38;
    }
  }
  else
  {
    switch(a1)
    {
      case 1:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("An unknown error occurred");
        goto LABEL_36;
      case 2:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("A parameter was invalid");
        goto LABEL_36;
      case 3:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("A value was unexpected");
        goto LABEL_36;
      case 4:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("A timeout occurred.");
        goto LABEL_36;
      case 5:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("An internal error occurred");
        goto LABEL_36;
      case 10:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Discovery primitives invalidated");
        goto LABEL_36;
      case 11:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Discovery primitives interrupted");
        goto LABEL_36;
      case 20:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Sharing session invalidated");
        goto LABEL_36;
      case 21:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Sharing session interrupted");
        goto LABEL_36;
      case 30:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Broadcast primitives invalidated");
        goto LABEL_36;
      case 31:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Broadcast primitives interrupted");
        goto LABEL_36;
      case 40:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Broadcast setup invalidated");
        goto LABEL_36;
      case 50:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v11 = CFSTR("No Wi-Fi interface present");
        v12 = CFSTR("No WLAN interface present");
        break;
      case 51:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v11 = CFSTR("Unable to power on Wi-Fi interface");
        v12 = CFSTR("Unable to power on WLAN interface");
        break;
      case 52:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v11 = CFSTR("Wi-Fi join cancelled");
        v12 = CFSTR("WLAN join cancelled");
        break;
      case 53:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v11 = CFSTR("Unable to find Wi-Fi network");
        v12 = CFSTR("Unable to find WLAN network");
        break;
      case 54:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v11 = CFSTR("Timed out joining Wi-Fi network");
        v12 = CFSTR("Timed out joining WLAN network");
        break;
      case 55:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v11 = CFSTR("Unable to join Wi-Fi network");
        v12 = CFSTR("Unable to join WLAN network");
        break;
      case 56:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Unable to reach the Internet");
        goto LABEL_36;
      case 57:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Unable to reach the Internet with no network configuration shared");
        goto LABEL_36;
      case 58:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v11 = CFSTR("Unable to reach the Internet with the Wi-Fi credentials shared");
        v12 = CFSTR("Unable to reach the Internet with the WLAN credentials shared");
        break;
      case 59:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Unable to reach the Internet with the Configuration Profile shared");
        goto LABEL_36;
      case 60:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Erase already in progress");
        goto LABEL_36;
      case 70:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Configuration profile payload value is missing");
        goto LABEL_36;
      case 71:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Configuration profile payload value is of the wrong type");
        goto LABEL_36;
      case 72:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Configuration profile payload value is invalid");
        goto LABEL_36;
      case 73:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Configuration profile payload type is not supported by this software");
        goto LABEL_36;
      case 74:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Configuration profile failed validation");
        goto LABEL_36;
      case 75:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Configuration profile payload failed validation");
        goto LABEL_36;
      case 76:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Configuration profile is missing a required payload");
        goto LABEL_36;
      case 77:
        v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        v10 = CFSTR("Configuration profile contains a disallowed payload");
        goto LABEL_36;
      default:
        goto LABEL_5;
    }
    if (v4)
      v10 = v12;
    else
      v10 = v11;
  }
LABEL_36:
  objc_msgSend(v9, "cat_localizedStringsForKey:value:table:", v10, &stru_24E5A0848, CFSTR("DMTErrors"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _DMTErrorDescriptionsForKey(v13, v14, v15, v16, v17, v18, v19, v20, v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v3;
  if (v21)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __DMTErrorWithCodeAndUserInfo_block_invoke_2;
    v28[3] = &unk_24E5A04E0;
    v29 = v22;
    v23 = v22;
    objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v28);
    v24 = objc_msgSend(v23, "copy");

    v8 = (id)v24;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("DeviceManagementTools.error"), a1, v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

id _DMTErrorDescriptionsForKey(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v10 = (void *)objc_opt_new();
  v24 = &a9;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", v16, (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        DMTDescriptionKeyFormattedString(v17, (uint64_t)v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v13);
  }

  return v10;
}

id DMTEnrollmentTimeoutErrorForNetworkConfiguration(uint64_t a1)
{
  uint64_t v1;

  if ((unint64_t)(a1 - 1) > 2)
    v1 = 56;
  else
    v1 = qword_21FD80FD8[a1 - 1];
  DMTErrorWithCodeAndUserInfo(v1, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_21FD7570C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_21FD75C6C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21FD75EE4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_21FD76198(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_21FD764E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_21FD76900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21FD76CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _DMTLogGeneral_2()
{
  if (_DMTLogGeneral_onceToken_6 != -1)
    dispatch_once(&_DMTLogGeneral_onceToken_6, &__block_literal_global_8);
  return (id)_DMTLogGeneral_logObj_6;
}

id _DMTLogEnrollment()
{
  if (_DMTLogEnrollment_onceToken != -1)
    dispatch_once(&_DMTLogEnrollment_onceToken, &__block_literal_global_239);
  return (id)_DMTLogEnrollment_logObj;
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id _DMTLogGeneral_3()
{
  if (_DMTLogGeneral_onceToken_7 != -1)
    dispatch_once(&_DMTLogGeneral_onceToken_7, &__block_literal_global_9);
  return (id)_DMTLogGeneral_logObj_7;
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_21FD78B44(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21FD78DB8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21FD78F80(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21FD7937C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  id *v6;
  uint64_t v7;

  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v7 - 104));
  _Unwind_Resume(a1);
}

void sub_21FD793E0()
{
  JUMPOUT(0x21FD793C8);
}

id _DMTLogGeneral_4()
{
  if (_DMTLogGeneral_onceToken_8 != -1)
    dispatch_once(&_DMTLogGeneral_onceToken_8, &__block_literal_global_10);
  return (id)_DMTLogGeneral_logObj_8;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id _DMTLogOperation_0()
{
  if (_DMTLogOperation_onceToken_0 != -1)
    dispatch_once(&_DMTLogOperation_onceToken_0, &__block_literal_global_11);
  return (id)_DMTLogOperation_logObj_0;
}

CFDataRef ExtractSignedData(void *a1)
{
  id v1;
  NSObject *v2;
  CFDataRef v3;
  _CMSDecoder *v4;
  id v5;
  NSObject *v6;
  SecPolicyRef BasicX509;
  size_t v9;
  OSStatus v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  CFDataRef contentOut;
  CMSSignerStatus signerStatusOut;
  size_t numSignersOut;
  CMSDecoderRef cmsDecoderOut;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  size_t v22;
  __int16 v23;
  CMSSignerStatus v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  numSignersOut = 0;
  cmsDecoderOut = 0;
  if (CMSDecoderCreate(&cmsDecoderOut))
  {
    _DMTLogGeneral_5();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      ExtractSignedData_cold_6();

    v3 = 0;
    goto LABEL_18;
  }
  v4 = cmsDecoderOut;
  v5 = objc_retainAutorelease(v1);
  if (!CMSDecoderUpdateMessage(v4, (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length")))
  {
    if (CMSDecoderFinalizeMessage(cmsDecoderOut))
    {
      _DMTLogGeneral_5();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        ExtractSignedData_cold_4();
      goto LABEL_14;
    }
    if (CMSDecoderGetNumSigners(cmsDecoderOut, &numSignersOut))
    {
      _DMTLogGeneral_5();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        ExtractSignedData_cold_2();
      goto LABEL_14;
    }
    if (!numSignersOut)
    {
      _DMTLogGeneral_5();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FD69000, v14, OS_LOG_TYPE_INFO, "Data does not appear to be signed", buf, 2u);
      }

      goto LABEL_15;
    }
    BasicX509 = SecPolicyCreateBasicX509();
    if ((uint64_t)numSignersOut < 1)
    {
LABEL_26:
      contentOut = 0;
      if (!CMSDecoderCopyContent(cmsDecoderOut, &contentOut))
      {
        v3 = contentOut;
LABEL_38:
        if (BasicX509)
          CFRelease(BasicX509);
        goto LABEL_16;
      }
      _DMTLogGeneral_5();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        ExtractSignedData_cold_1();

    }
    else
    {
      v9 = 0;
      while (1)
      {
        signerStatusOut = kCMSSignerInvalidIndex;
        v10 = CMSDecoderCopySignerStatus(cmsDecoderOut, v9, BasicX509, 0, &signerStatusOut, 0, 0);
        _DMTLogGeneral_5();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v10)
          break;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446722;
          v20 = "ExtractSignedData";
          v21 = 2050;
          v22 = v9;
          v23 = 1026;
          v24 = signerStatusOut;
          _os_log_impl(&dword_21FD69000, v12, OS_LOG_TYPE_INFO, "%{public}s: signerIndex = %{public}ld, signStatus = %{public}d", buf, 0x1Cu);
        }

        if ((uint64_t)++v9 >= (uint64_t)numSignersOut)
          goto LABEL_26;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        ExtractSignedData_cold_2();

    }
    v3 = 0;
    goto LABEL_38;
  }
  _DMTLogGeneral_5();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    ExtractSignedData_cold_5();
LABEL_14:

LABEL_15:
  v3 = 0;
LABEL_16:
  if (cmsDecoderOut)
    CFRelease(cmsDecoderOut);
LABEL_18:

  return v3;
}

id _DMTLogGeneral_5()
{
  if (_DMTLogGeneral_onceToken_9 != -1)
    dispatch_once(&_DMTLogGeneral_onceToken_9, &__block_literal_global_12);
  return (id)_DMTLogGeneral_logObj_9;
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_21FD7B570(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

id _DMTLogGeneral_6()
{
  if (_DMTLogGeneral_onceToken_10 != -1)
    dispatch_once(&_DMTLogGeneral_onceToken_10, &__block_literal_global_13);
  return (id)_DMTLogGeneral_logObj_10;
}

uint64_t DMTBundle()
{
  return objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.DeviceManagementTools"));
}

uint64_t DMTisWAPI()
{
  if (DMTisWAPI_onceToken != -1)
    dispatch_once(&DMTisWAPI_onceToken, &__block_literal_global_14);
  return DMTisWAPI_wapi;
}

uint64_t BooleanValueForObject(void *a1)
{
  id v1;
  void *v2;
  CFTypeID v3;
  CFTypeID TypeID;
  int Value;
  CFTypeID v6;
  void *v7;
  void *v8;
  int v9;
  unsigned __int16 v10;
  uint64_t v11;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = CFGetTypeID(v1);
    TypeID = CFBooleanGetTypeID();

    if (v3 == TypeID)
    {
      Value = CFBooleanGetValue((CFBooleanRef)v2);
LABEL_15:
      v11 = Value != 0;
      goto LABEL_19;
    }
    v6 = CFGetTypeID(v2);
    if (v6 == CFStringGetTypeID())
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v8, "length")
        || (v9 = objc_msgSend(v8, "characterAtIndex:", 0),
            v10 = ((unsigned __int16)(v9 - 70) >> 3) | (((_WORD)v9 - 70) << 13),
            v10 < 6u)
        && ((0x33u >> v10) & 1) != 0)
      {
        v11 = 0;
      }
      else
      {
        if ((v9 - 84) >= 0x26 || ((0x2100000021uLL >> (v9 - 84)) & 1) == 0)
        {

          goto LABEL_11;
        }
        v11 = 1;
      }

      goto LABEL_19;
    }
  }
LABEL_11:
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v11 = 0;
      goto LABEL_19;
    }
    Value = objc_msgSend(v2, "intValue");
    goto LABEL_15;
  }
  v11 = objc_msgSend(v2, "BOOLValue");
LABEL_19:

  return v11;
}

id _DMTLogGeneral_7()
{
  if (_DMTLogGeneral_onceToken_12 != -1)
    dispatch_once(&_DMTLogGeneral_onceToken_12, &__block_literal_global_16);
  return (id)_DMTLogGeneral_logObj_12;
}

uint64_t OUTLINED_FUNCTION_3_1@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

void ExtractSignedData_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_21FD69000, v0, v1, "Failed to extract content from signed data (%{public}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ExtractSignedData_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_21FD69000, v0, v1, "Failed to determine number of signers (%{public}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ExtractSignedData_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_21FD69000, v0, v1, "Failed to finalize decoder message (%{public}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ExtractSignedData_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_21FD69000, v0, v1, "Failed to set decoder message (%{public}d). Is this signed data?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ExtractSignedData_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_21FD69000, v0, v1, "Failed to create decoder (%{public}d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

uint64_t CATAssertIsQueue()
{
  return MEMORY[0x24BE15730]();
}

uint64_t CATErrorWithCodeAndUserInfo()
{
  return MEMORY[0x24BE15740]();
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x24BDBBDA8]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

OSStatus CMSDecoderCopyContent(CMSDecoderRef cmsDecoder, CFDataRef *contentOut)
{
  return MEMORY[0x24BDE8400](cmsDecoder, contentOut);
}

OSStatus CMSDecoderCopySignerStatus(CMSDecoderRef cmsDecoder, size_t signerIndex, CFTypeRef policyOrArray, Boolean evaluateSecTrust, CMSSignerStatus *signerStatusOut, SecTrustRef *secTrustOut, OSStatus *certVerifyResultCodeOut)
{
  return MEMORY[0x24BDE8408](cmsDecoder, signerIndex, policyOrArray, evaluateSecTrust, signerStatusOut, secTrustOut, certVerifyResultCodeOut);
}

OSStatus CMSDecoderCreate(CMSDecoderRef *cmsDecoderOut)
{
  return MEMORY[0x24BDE8410](cmsDecoderOut);
}

OSStatus CMSDecoderFinalizeMessage(CMSDecoderRef cmsDecoder)
{
  return MEMORY[0x24BDE8418](cmsDecoder);
}

OSStatus CMSDecoderGetNumSigners(CMSDecoderRef cmsDecoder, size_t *numSignersOut)
{
  return MEMORY[0x24BDE8420](cmsDecoder, numSignersOut);
}

OSStatus CMSDecoderUpdateMessage(CMSDecoderRef cmsDecoder, const void *msgBytes, size_t msgBytesLen)
{
  return MEMORY[0x24BDE8428](cmsDecoder, msgBytes, msgBytesLen);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C28]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A08](monitor);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x24BDE1A10]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x24BDE1A38](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x24BDE1A48](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A50](monitor);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

