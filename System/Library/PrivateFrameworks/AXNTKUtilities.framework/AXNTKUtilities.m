id AXNTKFormattingManager()
{
  if (AXNTKFormattingManager_onceToken != -1)
    dispatch_once(&AXNTKFormattingManager_onceToken, &__block_literal_global);
  return (id)AXNTKFormattingManager_FormattingManager;
}

uint64_t AXNTKUserIsWheelchairUserWithVoiceOverOn()
{
  uint64_t v0;
  NSObject *v1;
  _QWORD block[4];
  id v4;
  _QWORD v5[4];
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  if (_AXSVoiceOverTouchEnabled())
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v0 = MEMORY[0x24BDAC760];
    v11 = 0;
    v5[0] = MEMORY[0x24BDAC760];
    v5[2] = __AXNTKUserIsWheelchairUserWithVoiceOverOn_block_invoke_2;
    v5[3] = &unk_24ED158B8;
    v5[1] = 3221225472;
    v6 = &__block_literal_global_186;
    v7 = &v8;
    if (AXNTKUserIsWheelchairUserWithVoiceOverOn_onceToken != -1)
      dispatch_once(&AXNTKUserIsWheelchairUserWithVoiceOverOn_onceToken, v5);
    if (!*((_BYTE *)v9 + 24))
    {
      dispatch_get_global_queue(0, 0);
      v1 = objc_claimAutoreleasedReturnValue();
      block[0] = v0;
      block[1] = 3221225472;
      block[2] = __AXNTKUserIsWheelchairUserWithVoiceOverOn_block_invoke_3;
      block[3] = &unk_24ED158E0;
      v4 = &__block_literal_global_186;
      dispatch_async(v1, block);

    }
    _Block_object_dispose(&v8, 8);
  }
  return AXNTKUserIsWheelchairUserWithVoiceOverOn___isWheelchair;
}

id AXNTKLocalizedStringForKey(void *a1)
{
  return AXNTKLocalizedStringForKeyInTable(a1, CFSTR("Accessibility"));
}

id AXNTKLocalizedStringForKeyInTable(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "localizedStringForKey:value:table:", v3, &stru_24ED15920, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id AXSolarPathValue(void *a1, double a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;

  v3 = a1;
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_24ED15B78);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("percentageThroughPeriodForWaypointDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_24ED15B90);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("percentageThroughPeriodForWaypointDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_24ED15BA8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeValueForKey:", CFSTR("percentageThroughPeriodForWaypointDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_24ED15BC0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeValueForKey:", CFSTR("percentageThroughPeriodForWaypointDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_24ED15BD8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "safeValueForKey:", CFSTR("percentageThroughPeriodForWaypointDate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = v22;

  if (v7 + -0.05 > a2)
    goto LABEL_2;
  if (v7 + -0.25 <= a2 && v7 - a2 >= 0.005)
  {
    MEMORY[0x22768FA20](0, (v7 - a2) * 86400.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD17C8];
    v29 = CFSTR("solar.minutes.until.dawn");
    goto LABEL_12;
  }
  if (v7 + -0.005 < a2)
  {
    v25 = v11 + -0.005;
    if (v11 + -0.005 >= a2)
    {
      v26 = &unk_24ED15B78;
LABEL_14:
      objc_msgSend(v3, "objectForKeyedSubscript:", v26, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "safeValueForKey:", CFSTR("localizedName"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  v25 = 0.005;
  if (vabdd_f64(a2, v11) <= 0.005)
  {
    v26 = &unk_24ED15B90;
    goto LABEL_14;
  }
  if (v11 + 0.05 > a2)
  {
    MEMORY[0x22768FA20](0, vabdd_f64(v11, a2) * 86400.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD17C8];
    v29 = CFSTR("solar.minutes.since.sunrise");
LABEL_12:
    AXNTKLocalizedStringForKey(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", v30, v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
    goto LABEL_16;
  }
  if (v15 + -0.005 > a2)
  {
    MEMORY[0x22768FA20](0, vabdd_f64(v15, a2) * 86400.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD17C8];
    v29 = CFSTR("solar.minutes.until.noon");
    goto LABEL_12;
  }
  if (vabdd_f64(a2, v15) <= 0.005)
  {
    v26 = &unk_24ED15BA8;
    goto LABEL_14;
  }
  if (v15 + 0.05 > a2)
  {
    MEMORY[0x22768FA20](0, vabdd_f64(v15, a2) * 86400.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD17C8];
    v29 = CFSTR("solar.minutes.since.noon");
    goto LABEL_12;
  }
  if (v15 < a2 && v19 - a2 > 0.005)
  {
    MEMORY[0x22768FA20](0, fabs(v19 - a2) * 86400.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD17C8];
    v29 = CFSTR("solar.minutes.until.sunset");
    goto LABEL_12;
  }
  if (vabdd_f64(a2, v19) <= 0.005)
  {
    v26 = &unk_24ED15BC0;
    goto LABEL_14;
  }
  if (v19 <= a2)
  {
    v25 = v23 + 0.005;
    if (v23 + 0.005 > a2)
    {
      v26 = &unk_24ED15BD8;
      goto LABEL_14;
    }
  }
  if (v23 + 0.05 > a2)
  {
    MEMORY[0x22768FA20](0, vabdd_f64(v23, a2) * 86400.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD17C8];
    v29 = CFSTR("solar.minutes.since.dusk");
    goto LABEL_12;
  }
LABEL_2:
  AXNTKLocalizedStringForKey(CFSTR("solar.nighttime"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v24;
}

BOOL AXNTKComplicationTemplateContainsSimpleImage(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;

  v1 = a1;
  NSSelectorFromString(CFSTR("imageProvider"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "safeValueForKey:", CFSTR("imageProvider"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2 != 0;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t AXClockTimeStringForDateIncludingSeconds()
{
  return MEMORY[0x24BDFFEB8]();
}

uint64_t AXClockTimeVoiceOverSpokenStringForDate()
{
  return MEMORY[0x24BDFFEC0]();
}

uint64_t AXClockTimeVoiceOverSpokenStringForWatchFaces()
{
  return MEMORY[0x24BDFFEC8]();
}

uint64_t AXCurrentTimeForWatchFaces()
{
  return MEMORY[0x24BDFFEF0]();
}

uint64_t AXDurationStringForDurationWithSeconds()
{
  return MEMORY[0x24BE00060]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

