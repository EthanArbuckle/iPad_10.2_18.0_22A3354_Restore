@implementation NRDevice(DNDServer)

- (uint64_t)_dnds_pairedDeviceClass
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0D51738]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "rangeOfString:", CFSTR("iPod")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v1, "rangeOfString:", CFSTR("iPad")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v1, "rangeOfString:", CFSTR("iPhone")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(v1, "rangeOfString:", CFSTR("Mac")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v1, "rangeOfString:", CFSTR("Watch")) == 0x7FFFFFFFFFFFFFFFLL)
        v2 = 4 * (objc_msgSend(v1, "rangeOfString:", CFSTR("RealityDevice")) != 0x7FFFFFFFFFFFFFFFLL);
      else
        v2 = 3;
    }
    else
    {
      v2 = 2;
    }
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

- (uint64_t)_dnds_minorBuildVersion
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0D51760]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = DNDSMinorBuildVersionFromBuildVersion(v1);

  return v2;
}

- (void)_dnds_operatingSystemVersion
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0D51778]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v17, "count");
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  if (v4 < 3)
  {
    if (v4)
    {
      if (v4 == 2)
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "integerValue");

        objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "integerValue");

        *a2 = v12;
        a2[1] = v14;
        a2[2] = 0;
      }
      else
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "integerValue");

        a2[1] = 0;
        a2[2] = 0;
        *a2 = v16;
      }
    }
  }
  else
  {
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    objc_msgSend(v17, "objectAtIndexedSubscript:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    *a2 = v6;
    a2[1] = v8;
    a2[2] = v10;
  }

}

- (uint64_t)_dnds_assertionSyncProtocolVersion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v8 = 0uLL;
  v9 = 0;
  objc_msgSend(a1, "_dnds_operatingSystemVersion");
  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0D51760]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_dnds_pairedDeviceClass");
  v6 = v8;
  v7 = v9;
  v4 = DNDSAssertionSyncProtocolVersionFromOperatingSystemVersionAndBuildVersion((uint64_t *)&v6, v2, v3);

  return v4;
}

- (uint64_t)_dnds_configurationSyncProtocolVersion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v8 = 0uLL;
  v9 = 0;
  objc_msgSend(a1, "_dnds_operatingSystemVersion");
  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x1E0D51760]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_dnds_pairedDeviceClass");
  v6 = v8;
  v7 = v9;
  v4 = DNDSConfigurationSyncProtocolVersionFromOperatingSystemVersionAndBuildVersion((uint64_t *)&v6, v2, v3);

  return v4;
}

- (BOOL)_dnds_isIOS14EraOS
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = 0;
  v5 = 0;
  v6 = 0;
  objc_msgSend(a1, "_dnds_operatingSystemVersion");
  v2 = objc_msgSend(a1, "_dnds_pairedDeviceClass");
  if (v2 == 1)
    return v4 == 14;
  if (v2 == 3)
    return v4 == 7;
  return v2 == 2 && v4 == 10 && v5 == 18;
}

- (uint64_t)_dnds_supportsSilenceLists
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 0;
  v4 = 0;
  v5 = 0;
  objc_msgSend(a1, "_dnds_operatingSystemVersion");
  switch(objc_msgSend(a1, "_dnds_pairedDeviceClass"))
  {
    case 1:
      if (v3 <= 15)
        goto LABEL_7;
      goto LABEL_9;
    case 2:
      if (v3 > 12)
        goto LABEL_9;
      goto LABEL_7;
    case 3:
      if (v3 <= 8)
        goto LABEL_7;
      goto LABEL_9;
    case 4:
      if (v3 <= 0)
        goto LABEL_7;
LABEL_9:
      result = 1;
      break;
    default:
LABEL_7:
      result = 0;
      break;
  }
  return result;
}

@end
