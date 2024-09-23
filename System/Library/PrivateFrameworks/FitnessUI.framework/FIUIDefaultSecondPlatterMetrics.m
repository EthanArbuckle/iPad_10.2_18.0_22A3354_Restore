@implementation FIUIDefaultSecondPlatterMetrics

+ (id)metricsForActivityType:(id)a3 metricsVersion:(int64_t)a4
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  switch(a4)
  {
    case 6:
      +[FIUIDefaultSecondPlatterMetrics moonstoneMetricsForActivityType:](FIUIDefaultSecondPlatterMetrics, "moonstoneMetricsForActivityType:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      +[FIUIDefaultSecondPlatterMetrics velocityMetricsForActivityType:](FIUIDefaultSecondPlatterMetrics, "velocityMetricsForActivityType:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      +[FIUIDefaultSecondPlatterMetrics boltMetricsForActivityType:](FIUIDefaultSecondPlatterMetrics, "boltMetricsForActivityType:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v7 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_9;
  }
  v7 = (void *)v6;
LABEL_9:

  return v7;
}

+ (id)boltMetricsForActivityType:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  v4 = objc_msgSend(v3, "effectiveTypeIdentifier");
  if (v4 <= 36)
  {
    if (v4 == 13)
    {
      if (!objc_msgSend(v3, "isIndoor"))
      {
        v8 = &unk_24CF4EF60;
        goto LABEL_21;
      }
      goto LABEL_18;
    }
    if (v4 != 24)
    {
LABEL_18:
      +[FIUIDefaultSecondPlatterMetrics boltDefaultNonDistance](FIUIDefaultSecondPlatterMetrics, "boltDefaultNonDistance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_8:
    v8 = &unk_24CF4EFA8;
    goto LABEL_21;
  }
  if (v4 != 52)
  {
    if (v4 != 46)
    {
      if (v4 == 37)
      {
        v5 = objc_msgSend(v3, "isIndoor");
        v6 = &unk_24CF4EF30;
        v7 = &unk_24CF4EF48;
        goto LABEL_10;
      }
      goto LABEL_18;
    }
    v9 = objc_msgSend(v3, "swimmingLocationType");
    switch(v9)
    {
      case 0:
        goto LABEL_18;
      case 1:
        v8 = &unk_24CF4EF78;
        goto LABEL_21;
      case 2:
        v8 = &unk_24CF4EF90;
        goto LABEL_21;
    }
    goto LABEL_8;
  }
  v5 = objc_msgSend(v3, "isIndoor");
  v6 = &unk_24CF4EFC0;
  v7 = &unk_24CF4EFD8;
LABEL_10:
  if (v5)
    v8 = v7;
  else
    v8 = v6;
LABEL_21:

  return v8;
}

+ (id)velocityMetricsForActivityType:(id)a3
{
  id v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  int v7;
  int v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  if (objc_msgSend(v3, "effectiveTypeIdentifier") != 13)
  {
    +[FIUIDefaultSecondPlatterMetrics boltMetricsForActivityType:](FIUIDefaultSecondPlatterMetrics, "boltMetricsForActivityType:", v3);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_22:
    v11 = (void *)v12;
    goto LABEL_23;
  }
  v4 = +[FIUIBluetoothSensorLookup hasHadPairedCyclingPowerSensors](FIUIBluetoothSensorLookup, "hasHadPairedCyclingPowerSensors");
  v5 = +[FIUIBluetoothSensorLookup hasHadPairedCyclingCadenceSensors](FIUIBluetoothSensorLookup, "hasHadPairedCyclingCadenceSensors");
  v6 = +[FIUIBluetoothSensorLookup hasHadPairedCyclingSpeedSensors](FIUIBluetoothSensorLookup, "hasHadPairedCyclingSpeedSensors");
  v7 = objc_msgSend(v3, "isIndoor");
  v8 = v4 && v5;
  v9 = v4 || v5;
  if (v7 && !v6)
  {
    if (v8)
      v10 = &unk_24CF4F050;
    else
      v10 = &unk_24CF4F068;
    if (v4)
      v11 = v10;
    else
      v11 = &unk_24CF4F080;
    if (v9)
      goto LABEL_23;
    goto LABEL_21;
  }
  if (v8)
    v13 = &unk_24CF4EFF0;
  else
    v13 = &unk_24CF4F008;
  if (v4)
    v11 = v13;
  else
    v11 = &unk_24CF4F020;
  if (!v9)
  {
    if (!objc_msgSend(v3, "isIndoor"))
    {
      v11 = &unk_24CF4F038;
      goto LABEL_23;
    }
LABEL_21:
    objc_msgSend((id)objc_opt_class(), "boltDefaultNonDistance");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
LABEL_23:

  return v11;
}

+ (id)boltDefaultNonDistance
{
  return &unk_24CF4F098;
}

+ (id)moonstoneMetricsForActivityType:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
LABEL_10:
    +[FIUIDefaultSecondPlatterMetrics velocityMetricsForActivityType:](FIUIDefaultSecondPlatterMetrics, "velocityMetricsForActivityType:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v4 = objc_msgSend(v3, "effectiveTypeIdentifier");
  if (v4 <= 59)
  {
    if (v4 == 31)
    {
      v5 = &unk_24CF4F0F8;
      goto LABEL_11;
    }
    if (v4 == 35 && !objc_msgSend(v3, "isIndoor"))
    {
      v5 = &unk_24CF4F0E0;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v4 == 60)
  {
    v5 = &unk_24CF4F0B0;
    goto LABEL_11;
  }
  if (v4 != 67 && v4 != 61)
    goto LABEL_10;
  v5 = &unk_24CF4F0C8;
LABEL_11:

  return v5;
}

@end
