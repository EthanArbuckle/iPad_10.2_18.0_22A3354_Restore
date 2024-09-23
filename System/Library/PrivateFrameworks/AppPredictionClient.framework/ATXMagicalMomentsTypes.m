@implementation ATXMagicalMomentsTypes

+ (id)stringForConsumerType:(unint64_t)a3
{
  id result;
  void *v7;

  if ((uint64_t)a3 > 15)
  {
    if ((uint64_t)a3 > 63)
    {
      if (a3 == 64)
        return CFSTR("AppConnectionExpert");
      if (a3 == 127)
        return CFSTR("All");
    }
    else
    {
      if (a3 == 16)
        return CFSTR("Maps");
      if (a3 == 32)
        return CFSTR("Widget");
    }
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXMagicalMomentsTypes.m"), 41, CFSTR("stringForConsumerType called with invalid ATXMagicalMomentsConsumerType value of %lu"), a3);

    return CFSTR("Error");
  }
  else
  {
    result = CFSTR("Spotlight");
    switch(a3)
    {
      case 0uLL:
        result = CFSTR("Unknown");
        break;
      case 1uLL:
        result = CFSTR("SpringBoard");
        break;
      case 2uLL:
        return result;
      case 4uLL:
        result = CFSTR("CarPlay");
        break;
      case 8uLL:
        result = CFSTR("Phone");
        break;
      default:
        goto LABEL_16;
    }
  }
  return result;
}

+ (id)predictionReasonMapping
{
  void *v3;
  void *v4;
  int i;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringForPredictionReason:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, &unk_1E4DC13B0);

  for (i = 0; i != 12; ++i)
  {
    objc_msgSend(a1, "stringForPredictionReason:", (1 << i));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (1 << i));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  }
  return v3;
}

+ (id)mmEventTypeMapping
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 6; ++i)
  {
    objc_msgSend(a1, "stringForMMEventType:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

  }
  return v3;
}

+ (id)consumerMapping
{
  void *v3;
  void *v4;
  int i;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringForConsumerType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, &unk_1E4DC13C8);

  for (i = 0; i != 7; ++i)
  {
    objc_msgSend(a1, "stringForConsumerType:", (1 << i));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (1 << i));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  }
  return v3;
}

+ (int64_t)selectSingleReason:(int64_t)a3
{
  int64_t v3;
  uint64_t v4;
  int64_t v5;

  v3 = 1;
  v4 = 32;
  v5 = a3 & 0x400;
  if ((a3 & 0x10) != 0)
    v5 = 16;
  if ((a3 & 0x20) == 0)
    v4 = v5;
  if ((a3 & 1) == 0)
    v3 = v4;
  if ((a3 & 2) != 0)
    return 2;
  else
    return v3;
}

+ (id)stringForPredictionReason:(int64_t)a3
{
  __int16 v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (!a3)
  {
    v6 = CFSTR("Unknown");
    return v6;
  }
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = v4;
  if ((v3 & 0x40) != 0)
  {
    objc_msgSend(v4, "appendString:", CFSTR("Application_"));
    if ((v3 & 0x10) == 0)
    {
LABEL_4:
      if ((v3 & 8) == 0)
        goto LABEL_5;
      goto LABEL_18;
    }
  }
  else if ((v3 & 0x10) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(v5, "appendString:", CFSTR("Location_"));
  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x200) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  objc_msgSend(v5, "appendString:", CFSTR("Motion_"));
  if ((v3 & 0x200) == 0)
  {
LABEL_6:
    if ((v3 & 1) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v5, "appendString:", CFSTR("Other_"));
  if ((v3 & 1) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(v5, "appendString:", CFSTR("Headphones_"));
  if ((v3 & 2) == 0)
  {
LABEL_8:
    if ((v3 & 4) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v5, "appendString:", CFSTR("Bluetooth_"));
  if ((v3 & 4) == 0)
  {
LABEL_9:
    if ((v3 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v5, "appendString:", CFSTR("CarPlay_"));
  if ((v3 & 0x20) == 0)
  {
LABEL_10:
    if ((v3 & 0x400) == 0)
      goto LABEL_11;
LABEL_24:
    objc_msgSend(v5, "appendString:", CFSTR("MicroLocation_"));
    if ((v3 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_23:
  objc_msgSend(v5, "appendString:", CFSTR("FirstWakeup_"));
  if ((v3 & 0x400) != 0)
    goto LABEL_24;
LABEL_11:
  if ((v3 & 0x800) != 0)
LABEL_12:
    objc_msgSend(v5, "appendString:", CFSTR("HeroApp_"));
LABEL_13:
  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = CFSTR("Unknown_");

  return v6;
}

+ (id)stringForMMEventType:(unint64_t)a3
{
  id result;
  NSObject *v4;

  switch(a3)
  {
    case 1uLL:
      result = CFSTR("suppressed");
      break;
    case 2uLL:
      result = CFSTR("served");
      break;
    case 3uLL:
      result = CFSTR("shown");
      break;
    case 4uLL:
      result = CFSTR("converted");
      break;
    case 5uLL:
      result = CFSTR("abandoned");
      break;
    case 6uLL:
      __atxlog_handle_pmm();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        +[ATXMagicalMomentsTypes stringForMMEventType:].cold.1(v4);

      result = CFSTR("max");
      break;
    default:
      result = CFSTR("suggested");
      break;
  }
  return result;
}

+ (id)mmConsumerMapping
{
  void *v3;
  void *v4;
  int i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringForMMConsumerType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, &unk_1E4DC13C8);

  for (i = 0; i != 7; ++i)
  {
    objc_msgSend(a1, "stringForMMConsumerType:", (1 << i));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (1 << i));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);

  }
  v8 = objc_msgSend((id)objc_opt_class(), "mmConsumerTypeOfConsumerType:consumerSubType:", 1, 2);
  objc_msgSend(a1, "stringForMMConsumerType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, v10);

  return v3;
}

+ (id)stringForMMConsumerType:(unint64_t)a3
{
  unint64_t v5;
  id result;
  void *v7;

  v5 = a3 & 0x7F;
  if (v5 > 0xF)
  {
    if ((a3 & 0x7F) > 0x3F)
    {
      if (v5 == 64)
        return CFSTR("AppConnectionExpert");
      if (v5 == 127)
        return CFSTR("All");
    }
    else
    {
      if (v5 == 16)
        return CFSTR("Maps");
      if (v5 == 32)
        return CFSTR("Widget");
    }
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXMagicalMomentsTypes.m"), 206, CFSTR("stringForMMConsumerType called with invalid ATXMagicalMomentsConsumerType value of %lu"), v5);

    return CFSTR("Error");
  }
  else
  {
    result = CFSTR("Spotlight");
    switch(a3 & 0x7F)
    {
      case 0uLL:
        result = CFSTR("Unknown");
        break;
      case 1uLL:
        if ((a3 & 0x80) != 0)
          result = CFSTR("SpringBoardAppSwitcher");
        else
          result = CFSTR("SpringBoardLock");
        break;
      case 2uLL:
        return result;
      case 4uLL:
        result = CFSTR("CarPlay");
        break;
      case 8uLL:
        result = CFSTR("Phone");
        break;
      default:
        goto LABEL_18;
    }
  }
  return result;
}

+ (unint64_t)mmConsumerTypeOfConsumerType:(unint64_t)a3 consumerSubType:(unsigned __int8)a4
{
  if (a4 == 2 && a3 == 1)
    return 129;
  else
    return a3;
}

+ (void)stringForMMEventType:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A49EF000, log, OS_LOG_TYPE_FAULT, "ATXMagicalMomentsTypes stringForMMEventType invoked with ATXMagicalMomentsEventTypeMax", v1, 2u);
}

@end
