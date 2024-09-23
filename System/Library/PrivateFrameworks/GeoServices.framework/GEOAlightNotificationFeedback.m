@implementation GEOAlightNotificationFeedback

- (BOOL)displayed
{
  return self->_displayed;
}

- (void)setDisplayed:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x1000u;
  self->_displayed = a3;
}

- (void)setHasDisplayed:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xEFFF | v3;
}

- (BOOL)hasDisplayed
{
  return (*(_WORD *)&self->_flags >> 12) & 1;
}

- (BOOL)triggered
{
  return self->_triggered;
}

- (void)setTriggered:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x2000u;
  self->_triggered = a3;
}

- (void)setHasTriggered:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xDFFF | v3;
}

- (BOOL)hasTriggered
{
  return (*(_WORD *)&self->_flags >> 13) & 1;
}

- (unint64_t)lineMuid
{
  return self->_lineMuid;
}

- (void)setLineMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x10u;
  self->_lineMuid = a3;
}

- (void)setHasLineMuid:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasLineMuid
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unint64_t)previousStopMuid
{
  return self->_previousStopMuid;
}

- (void)setPreviousStopMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x20u;
  self->_previousStopMuid = a3;
}

- (void)setHasPreviousStopMuid:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasPreviousStopMuid
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (unint64_t)alightStopMuid
{
  return self->_alightStopMuid;
}

- (void)setAlightStopMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 1u;
  self->_alightStopMuid = a3;
}

- (void)setHasAlightStopMuid:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3;
}

- (BOOL)hasAlightStopMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (int)trigger
{
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
    return self->_trigger;
  else
    return 0;
}

- (void)setTrigger:(int)a3
{
  *(_WORD *)&self->_flags |= 0x400u;
  self->_trigger = a3;
}

- (void)setHasTrigger:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFBFF | v3;
}

- (BOOL)hasTrigger
{
  return (*(_WORD *)&self->_flags >> 10) & 1;
}

- (id)triggerAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0CAE8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTrigger:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRIGGER_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRIGGER_LOCATION")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRIGGER_SCHEDULE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)triggeredTimestamp
{
  return self->_triggeredTimestamp;
}

- (void)setTriggeredTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x40u;
  self->_triggeredTimestamp = a3;
}

- (void)setHasTriggeredTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasTriggeredTimestamp
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (int)triggeredLocationTraversalPercent
{
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
    return self->_triggeredLocationTraversalPercent;
  else
    return -1;
}

- (void)setTriggeredLocationTraversalPercent:(int)a3
{
  *(_WORD *)&self->_flags |= 0x200u;
  self->_triggeredLocationTraversalPercent = a3;
}

- (void)setHasTriggeredLocationTraversalPercent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasTriggeredLocationTraversalPercent
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (double)lastDetectedLocationTimestamp
{
  return self->_lastDetectedLocationTimestamp;
}

- (void)setLastDetectedLocationTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 8u;
  self->_lastDetectedLocationTimestamp = a3;
}

- (void)setHasLastDetectedLocationTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasLastDetectedLocationTimestamp
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (int)lastDetectedLocationTraversalPercent
{
  if ((*(_WORD *)&self->_flags & 0x80) != 0)
    return self->_lastDetectedLocationTraversalPercent;
  else
    return -1;
}

- (void)setLastDetectedLocationTraversalPercent:(int)a3
{
  *(_WORD *)&self->_flags |= 0x80u;
  self->_lastDetectedLocationTraversalPercent = a3;
}

- (void)setHasLastDetectedLocationTraversalPercent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasLastDetectedLocationTraversalPercent
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (double)lastDetectedLocationHorizontalAccuracy
{
  double result;

  result = -1.0;
  if ((*(_WORD *)&self->_flags & 4) != 0)
    return self->_lastDetectedLocationHorizontalAccuracy;
  return result;
}

- (void)setLastDetectedLocationHorizontalAccuracy:(double)a3
{
  *(_WORD *)&self->_flags |= 4u;
  self->_lastDetectedLocationHorizontalAccuracy = a3;
}

- (void)setHasLastDetectedLocationHorizontalAccuracy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasLastDetectedLocationHorizontalAccuracy
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (BOOL)arrivalDetected
{
  return self->_arrivalDetected;
}

- (void)setArrivalDetected:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x800u;
  self->_arrivalDetected = a3;
}

- (void)setHasArrivalDetected:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xF7FF | v3;
}

- (BOOL)hasArrivalDetected
{
  return (*(_WORD *)&self->_flags >> 11) & 1;
}

- (double)arrivedAtTimestamp
{
  return self->_arrivedAtTimestamp;
}

- (void)setArrivedAtTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 2u;
  self->_arrivedAtTimestamp = a3;
}

- (void)setHasArrivedAtTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasArrivedAtTimestamp
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x100u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasStepID
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOAlightNotificationFeedback;
  -[GEOAlightNotificationFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAlightNotificationFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAlightNotificationFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 81));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("displayed"));

    v5 = *(_WORD *)(a1 + 84);
  }
  if ((v5 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 82));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("triggered"));

    v5 = *(_WORD *)(a1 + 84);
    if ((v5 & 0x10) == 0)
    {
LABEL_6:
      if ((v5 & 0x20) == 0)
        goto LABEL_7;
      goto LABEL_23;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v9 = CFSTR("lineMuid");
  else
    v9 = CFSTR("line_muid");
  objc_msgSend(v4, "setObject:forKey:", v8, v9);

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_23:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v11 = CFSTR("previousStopMuid");
  else
    v11 = CFSTR("previous_stop_muid");
  objc_msgSend(v4, "setObject:forKey:", v10, v11);

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 8));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v13 = CFSTR("alightStopMuid");
  else
    v13 = CFSTR("alight_stop_muid");
  objc_msgSend(v4, "setObject:forKey:", v12, v13);

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x400) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_31:
  v14 = *(int *)(a1 + 76);
  if (v14 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E1C0CAE8[v14];
  }
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("trigger"));

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x40) == 0)
  {
LABEL_10:
    if ((v5 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_39;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v17 = CFSTR("triggeredTimestamp");
  else
    v17 = CFSTR("triggered_timestamp");
  objc_msgSend(v4, "setObject:forKey:", v16, v17);

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x200) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0)
      goto LABEL_12;
    goto LABEL_43;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 72));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v19 = CFSTR("triggeredLocationTraversalPercent");
  else
    v19 = CFSTR("triggered_location_traversal_percent");
  objc_msgSend(v4, "setObject:forKey:", v18, v19);

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_47;
  }
LABEL_43:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v21 = CFSTR("lastDetectedLocationTimestamp");
  else
    v21 = CFSTR("last_detected_location_timestamp");
  objc_msgSend(v4, "setObject:forKey:", v20, v21);

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x80) == 0)
  {
LABEL_13:
    if ((v5 & 4) == 0)
      goto LABEL_14;
    goto LABEL_51;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 64));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("lastDetectedLocationTraversalPercent");
  else
    v23 = CFSTR("last_detected_location_traversal_percent");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 4) == 0)
  {
LABEL_14:
    if ((v5 & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_55;
  }
LABEL_51:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v25 = CFSTR("lastDetectedLocationHorizontalAccuracy");
  else
    v25 = CFSTR("last_detected_location_horizontal_accuracy");
  objc_msgSend(v4, "setObject:forKey:", v24, v25);

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 0x800) == 0)
  {
LABEL_15:
    if ((v5 & 2) == 0)
      goto LABEL_16;
    goto LABEL_59;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 80));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v27 = CFSTR("arrivalDetected");
  else
    v27 = CFSTR("arrival_detected");
  objc_msgSend(v4, "setObject:forKey:", v26, v27);

  v5 = *(_WORD *)(a1 + 84);
  if ((v5 & 2) == 0)
  {
LABEL_16:
    if ((v5 & 0x100) == 0)
      return v4;
    goto LABEL_63;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v29 = CFSTR("arrivedAtTimestamp");
  else
    v29 = CFSTR("arrived_at_timestamp");
  objc_msgSend(v4, "setObject:forKey:", v28, v29);

  if ((*(_WORD *)(a1 + 84) & 0x100) != 0)
  {
LABEL_63:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("stepID"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAlightNotificationFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOAlightNotificationFeedback)initWithDictionary:(id)a3
{
  return (GEOAlightNotificationFeedback *)-[GEOAlightNotificationFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;

  v5 = a2;
  if (!a1)
    goto LABEL_72;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_72;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("displayed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDisplayed:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("triggered"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTriggered:", objc_msgSend(v7, "BOOLValue"));

  if (a3)
    v8 = CFSTR("lineMuid");
  else
    v8 = CFSTR("line_muid");
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLineMuid:", objc_msgSend(v9, "unsignedLongLongValue"));

  if (a3)
    v10 = CFSTR("previousStopMuid");
  else
    v10 = CFSTR("previous_stop_muid");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPreviousStopMuid:", objc_msgSend(v11, "unsignedLongLongValue"));

  if (a3)
    v12 = CFSTR("alightStopMuid");
  else
    v12 = CFSTR("alight_stop_muid");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAlightStopMuid:", objc_msgSend(v13, "unsignedLongLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trigger"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v14;
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TRIGGER_UNKNOWN")) & 1) != 0)
    {
      v16 = 0;
    }
    else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("TRIGGER_LOCATION")) & 1) != 0)
    {
      v16 = 1;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("TRIGGER_SCHEDULE")))
    {
      v16 = 2;
    }
    else
    {
      v16 = 0;
    }

    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = objc_msgSend(v14, "intValue");
LABEL_33:
    objc_msgSend(a1, "setTrigger:", v16);
  }

  if (a3)
    v17 = CFSTR("triggeredTimestamp");
  else
    v17 = CFSTR("triggered_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "doubleValue");
    objc_msgSend(a1, "setTriggeredTimestamp:");
  }

  if (a3)
    v19 = CFSTR("triggeredLocationTraversalPercent");
  else
    v19 = CFSTR("triggered_location_traversal_percent");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTriggeredLocationTraversalPercent:", objc_msgSend(v20, "intValue"));

  if (a3)
    v21 = CFSTR("lastDetectedLocationTimestamp");
  else
    v21 = CFSTR("last_detected_location_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v22, "doubleValue");
    objc_msgSend(a1, "setLastDetectedLocationTimestamp:");
  }

  if (a3)
    v23 = CFSTR("lastDetectedLocationTraversalPercent");
  else
    v23 = CFSTR("last_detected_location_traversal_percent");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLastDetectedLocationTraversalPercent:", objc_msgSend(v24, "intValue"));

  if (a3)
    v25 = CFSTR("lastDetectedLocationHorizontalAccuracy");
  else
    v25 = CFSTR("last_detected_location_horizontal_accuracy");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v26, "doubleValue");
    objc_msgSend(a1, "setLastDetectedLocationHorizontalAccuracy:");
  }

  if (a3)
    v27 = CFSTR("arrivalDetected");
  else
    v27 = CFSTR("arrival_detected");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setArrivalDetected:", objc_msgSend(v28, "BOOLValue"));

  if (a3)
    v29 = CFSTR("arrivedAtTimestamp");
  else
    v29 = CFSTR("arrived_at_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v30, "doubleValue");
    objc_msgSend(a1, "setArrivedAtTimestamp:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stepID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setStepID:", objc_msgSend(v31, "unsignedIntValue"));

LABEL_72:
  return a1;
}

- (GEOAlightNotificationFeedback)initWithJSON:(id)a3
{
  return (GEOAlightNotificationFeedback *)-[GEOAlightNotificationFeedback _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAlightNotificationFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAlightNotificationFeedbackReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  __int16 flags;
  id v5;

  v5 = a3;
  flags = (__int16)self->_flags;
  if ((flags & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (__int16)self->_flags;
    if ((flags & 0x2000) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_8:
    if ((flags & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_9:
    if ((flags & 8) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_10:
    if ((flags & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_11:
    if ((flags & 4) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_12:
    if ((flags & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_13:
    if ((flags & 2) == 0)
      goto LABEL_14;
LABEL_29:
    PBDataWriterWriteDoubleField();
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_29;
LABEL_14:
  if ((flags & 0x100) != 0)
LABEL_15:
    PBDataWriterWriteUint32Field();
LABEL_16:

}

- (void)copyTo:(id)a3
{
  __int16 flags;
  _BYTE *v5;

  v5 = a3;
  -[GEOAlightNotificationFeedback readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 0x1000) != 0)
  {
    v5[81] = self->_displayed;
    *((_WORD *)v5 + 42) |= 0x1000u;
    flags = (__int16)self->_flags;
    if ((flags & 0x2000) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  v5[82] = self->_triggered;
  *((_WORD *)v5 + 42) |= 0x2000u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)v5 + 5) = self->_lineMuid;
  *((_WORD *)v5 + 42) |= 0x10u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)v5 + 6) = self->_previousStopMuid;
  *((_WORD *)v5 + 42) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)v5 + 1) = self->_alightStopMuid;
  *((_WORD *)v5 + 42) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v5 + 19) = self->_trigger;
  *((_WORD *)v5 + 42) |= 0x400u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_8:
    if ((flags & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)v5 + 7) = *(_QWORD *)&self->_triggeredTimestamp;
  *((_WORD *)v5 + 42) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_9:
    if ((flags & 8) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v5 + 18) = self->_triggeredLocationTraversalPercent;
  *((_WORD *)v5 + 42) |= 0x200u;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_10:
    if ((flags & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)v5 + 4) = *(_QWORD *)&self->_lastDetectedLocationTimestamp;
  *((_WORD *)v5 + 42) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_11:
    if ((flags & 4) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v5 + 16) = self->_lastDetectedLocationTraversalPercent;
  *((_WORD *)v5 + 42) |= 0x80u;
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_12:
    if ((flags & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)v5 + 3) = *(_QWORD *)&self->_lastDetectedLocationHorizontalAccuracy;
  *((_WORD *)v5 + 42) |= 4u;
  flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_13:
    if ((flags & 2) == 0)
      goto LABEL_14;
LABEL_29:
    *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_arrivedAtTimestamp;
    *((_WORD *)v5 + 42) |= 2u;
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  v5[80] = self->_arrivalDetected;
  *((_WORD *)v5 + 42) |= 0x800u;
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_29;
LABEL_14:
  if ((flags & 0x100) != 0)
  {
LABEL_15:
    *((_DWORD *)v5 + 17) = self->_stepID;
    *((_WORD *)v5 + 42) |= 0x100u;
  }
LABEL_16:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int16 flags;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  flags = (__int16)self->_flags;
  if ((flags & 0x1000) != 0)
  {
    *((_BYTE *)result + 81) = self->_displayed;
    *((_WORD *)result + 42) |= 0x1000u;
    flags = (__int16)self->_flags;
    if ((flags & 0x2000) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_flags & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 82) = self->_triggered;
  *((_WORD *)result + 42) |= 0x2000u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_4:
    if ((flags & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  *((_QWORD *)result + 5) = self->_lineMuid;
  *((_WORD *)result + 42) |= 0x10u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_5:
    if ((flags & 1) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  *((_QWORD *)result + 6) = self->_previousStopMuid;
  *((_WORD *)result + 42) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *((_QWORD *)result + 1) = self->_alightStopMuid;
  *((_WORD *)result + 42) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x400) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 19) = self->_trigger;
  *((_WORD *)result + 42) |= 0x400u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_8:
    if ((flags & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_triggeredTimestamp;
  *((_WORD *)result + 42) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_9:
    if ((flags & 8) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 18) = self->_triggeredLocationTraversalPercent;
  *((_WORD *)result + 42) |= 0x200u;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_10:
    if ((flags & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_lastDetectedLocationTimestamp;
  *((_WORD *)result + 42) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_11:
    if ((flags & 4) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 16) = self->_lastDetectedLocationTraversalPercent;
  *((_WORD *)result + 42) |= 0x80u;
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_12:
    if ((flags & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_lastDetectedLocationHorizontalAccuracy;
  *((_WORD *)result + 42) |= 4u;
  flags = (__int16)self->_flags;
  if ((flags & 0x800) == 0)
  {
LABEL_13:
    if ((flags & 2) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *((_BYTE *)result + 80) = self->_arrivalDetected;
  *((_WORD *)result + 42) |= 0x800u;
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_14:
    if ((flags & 0x100) == 0)
      return result;
    goto LABEL_15;
  }
LABEL_29:
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_arrivedAtTimestamp;
  *((_WORD *)result + 42) |= 2u;
  if ((*(_WORD *)&self->_flags & 0x100) == 0)
    return result;
LABEL_15:
  *((_DWORD *)result + 17) = self->_stepID;
  *((_WORD *)result + 42) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_81;
  -[GEOAlightNotificationFeedback readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 42);
  if ((flags & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x1000) == 0)
      goto LABEL_81;
    if (self->_displayed)
    {
      if (!*((_BYTE *)v4 + 81))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 81))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 42) & 0x1000) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x2000) == 0)
      goto LABEL_81;
    if (self->_triggered)
    {
      if (!*((_BYTE *)v4 + 82))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 82))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 42) & 0x2000) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_lineMuid != *((_QWORD *)v4 + 5))
      goto LABEL_81;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_previousStopMuid != *((_QWORD *)v4 + 6))
      goto LABEL_81;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_alightStopMuid != *((_QWORD *)v4 + 1))
      goto LABEL_81;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x400) == 0 || self->_trigger != *((_DWORD *)v4 + 19))
      goto LABEL_81;
  }
  else if ((*((_WORD *)v4 + 42) & 0x400) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_triggeredTimestamp != *((double *)v4 + 7))
      goto LABEL_81;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x200) == 0 || self->_triggeredLocationTraversalPercent != *((_DWORD *)v4 + 18))
      goto LABEL_81;
  }
  else if ((*((_WORD *)v4 + 42) & 0x200) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_lastDetectedLocationTimestamp != *((double *)v4 + 4))
      goto LABEL_81;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_lastDetectedLocationTraversalPercent != *((_DWORD *)v4 + 16))
      goto LABEL_81;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_lastDetectedLocationHorizontalAccuracy != *((double *)v4 + 3))
      goto LABEL_81;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x800) != 0)
    {
      if (self->_arrivalDetected)
      {
        if (!*((_BYTE *)v4 + 80))
          goto LABEL_81;
        goto LABEL_71;
      }
      if (!*((_BYTE *)v4 + 80))
        goto LABEL_71;
    }
LABEL_81:
    v7 = 0;
    goto LABEL_82;
  }
  if ((*((_WORD *)v4 + 42) & 0x800) != 0)
    goto LABEL_81;
LABEL_71:
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_arrivedAtTimestamp != *((double *)v4 + 2))
      goto LABEL_81;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 42) & 0x100) == 0 || self->_stepID != *((_DWORD *)v4 + 17))
      goto LABEL_81;
    v7 = 1;
  }
  else
  {
    v7 = (v6 & 0x100) == 0;
  }
LABEL_82:

  return v7;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  double triggeredTimestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  double lastDetectedLocationTimestamp;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  double lastDetectedLocationHorizontalAccuracy;
  double v18;
  long double v19;
  double v20;
  unint64_t v21;
  uint64_t v22;
  double arrivedAtTimestamp;
  double v24;
  long double v25;
  double v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;

  -[GEOAlightNotificationFeedback readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 0x1000) != 0)
  {
    v34 = 2654435761 * self->_displayed;
    if ((*(_WORD *)&self->_flags & 0x2000) != 0)
    {
LABEL_3:
      v33 = 2654435761 * self->_triggered;
      if ((flags & 0x10) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v34 = 0;
    if ((*(_WORD *)&self->_flags & 0x2000) != 0)
      goto LABEL_3;
  }
  v33 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_4:
    v32 = 2654435761u * self->_lineMuid;
    if ((flags & 0x20) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v32 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_5:
    v31 = 2654435761u * self->_previousStopMuid;
    if ((flags & 1) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v31 = 0;
  if ((flags & 1) != 0)
  {
LABEL_6:
    v30 = 2654435761u * self->_alightStopMuid;
    if ((*(_WORD *)&self->_flags & 0x400) != 0)
      goto LABEL_7;
LABEL_17:
    v4 = 0;
    if ((flags & 0x40) != 0)
      goto LABEL_8;
LABEL_18:
    v9 = 0;
    goto LABEL_21;
  }
LABEL_16:
  v30 = 0;
  if ((*(_WORD *)&self->_flags & 0x400) == 0)
    goto LABEL_17;
LABEL_7:
  v4 = 2654435761 * self->_trigger;
  if ((flags & 0x40) == 0)
    goto LABEL_18;
LABEL_8:
  triggeredTimestamp = self->_triggeredTimestamp;
  v6 = -triggeredTimestamp;
  if (triggeredTimestamp >= 0.0)
    v6 = self->_triggeredTimestamp;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_21:
  if ((flags & 0x200) != 0)
  {
    v10 = 2654435761 * self->_triggeredLocationTraversalPercent;
    if ((flags & 8) != 0)
      goto LABEL_23;
LABEL_28:
    v15 = 0;
    goto LABEL_31;
  }
  v10 = 0;
  if ((flags & 8) == 0)
    goto LABEL_28;
LABEL_23:
  lastDetectedLocationTimestamp = self->_lastDetectedLocationTimestamp;
  v12 = -lastDetectedLocationTimestamp;
  if (lastDetectedLocationTimestamp >= 0.0)
    v12 = self->_lastDetectedLocationTimestamp;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0)
      v15 += (unint64_t)v14;
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_31:
  if ((flags & 0x80) != 0)
  {
    v16 = 2654435761 * self->_lastDetectedLocationTraversalPercent;
    if ((flags & 4) != 0)
      goto LABEL_33;
LABEL_38:
    v21 = 0;
    goto LABEL_41;
  }
  v16 = 0;
  if ((flags & 4) == 0)
    goto LABEL_38;
LABEL_33:
  lastDetectedLocationHorizontalAccuracy = self->_lastDetectedLocationHorizontalAccuracy;
  v18 = -lastDetectedLocationHorizontalAccuracy;
  if (lastDetectedLocationHorizontalAccuracy >= 0.0)
    v18 = self->_lastDetectedLocationHorizontalAccuracy;
  v19 = floor(v18 + 0.5);
  v20 = (v18 - v19) * 1.84467441e19;
  v21 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
  if (v20 >= 0.0)
  {
    if (v20 > 0.0)
      v21 += (unint64_t)v20;
  }
  else
  {
    v21 -= (unint64_t)fabs(v20);
  }
LABEL_41:
  if ((flags & 0x800) != 0)
  {
    v22 = 2654435761 * self->_arrivalDetected;
    if ((flags & 2) != 0)
      goto LABEL_43;
LABEL_48:
    v27 = 0;
    goto LABEL_51;
  }
  v22 = 0;
  if ((flags & 2) == 0)
    goto LABEL_48;
LABEL_43:
  arrivedAtTimestamp = self->_arrivedAtTimestamp;
  v24 = -arrivedAtTimestamp;
  if (arrivedAtTimestamp >= 0.0)
    v24 = self->_arrivedAtTimestamp;
  v25 = floor(v24 + 0.5);
  v26 = (v24 - v25) * 1.84467441e19;
  v27 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
  if (v26 >= 0.0)
  {
    if (v26 > 0.0)
      v27 += (unint64_t)v26;
  }
  else
  {
    v27 -= (unint64_t)fabs(v26);
  }
LABEL_51:
  if ((flags & 0x100) != 0)
    v28 = 2654435761 * self->_stepID;
  else
    v28 = 0;
  return v33 ^ v34 ^ v32 ^ v31 ^ v30 ^ v4 ^ v9 ^ v10 ^ v15 ^ v16 ^ v21 ^ v22 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  __int16 v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x1000) != 0)
  {
    self->_displayed = *((_BYTE *)v5 + 81);
    *(_WORD *)&self->_flags |= 0x1000u;
    v4 = *((_WORD *)v5 + 42);
    if ((v4 & 0x2000) == 0)
    {
LABEL_3:
      if ((v4 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)v5 + 42) & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  self->_triggered = *((_BYTE *)v5 + 82);
  *(_WORD *)&self->_flags |= 0x2000u;
  v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x10) == 0)
  {
LABEL_4:
    if ((v4 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  self->_lineMuid = *((_QWORD *)v5 + 5);
  *(_WORD *)&self->_flags |= 0x10u;
  v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x20) == 0)
  {
LABEL_5:
    if ((v4 & 1) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  self->_previousStopMuid = *((_QWORD *)v5 + 6);
  *(_WORD *)&self->_flags |= 0x20u;
  v4 = *((_WORD *)v5 + 42);
  if ((v4 & 1) == 0)
  {
LABEL_6:
    if ((v4 & 0x400) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  self->_alightStopMuid = *((_QWORD *)v5 + 1);
  *(_WORD *)&self->_flags |= 1u;
  v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x400) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  self->_trigger = *((_DWORD *)v5 + 19);
  *(_WORD *)&self->_flags |= 0x400u;
  v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x40) == 0)
  {
LABEL_8:
    if ((v4 & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  self->_triggeredTimestamp = *((double *)v5 + 7);
  *(_WORD *)&self->_flags |= 0x40u;
  v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x200) == 0)
  {
LABEL_9:
    if ((v4 & 8) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  self->_triggeredLocationTraversalPercent = *((_DWORD *)v5 + 18);
  *(_WORD *)&self->_flags |= 0x200u;
  v4 = *((_WORD *)v5 + 42);
  if ((v4 & 8) == 0)
  {
LABEL_10:
    if ((v4 & 0x80) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  self->_lastDetectedLocationTimestamp = *((double *)v5 + 4);
  *(_WORD *)&self->_flags |= 8u;
  v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x80) == 0)
  {
LABEL_11:
    if ((v4 & 4) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  self->_lastDetectedLocationTraversalPercent = *((_DWORD *)v5 + 16);
  *(_WORD *)&self->_flags |= 0x80u;
  v4 = *((_WORD *)v5 + 42);
  if ((v4 & 4) == 0)
  {
LABEL_12:
    if ((v4 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  self->_lastDetectedLocationHorizontalAccuracy = *((double *)v5 + 3);
  *(_WORD *)&self->_flags |= 4u;
  v4 = *((_WORD *)v5 + 42);
  if ((v4 & 0x800) == 0)
  {
LABEL_13:
    if ((v4 & 2) == 0)
      goto LABEL_14;
LABEL_29:
    self->_arrivedAtTimestamp = *((double *)v5 + 2);
    *(_WORD *)&self->_flags |= 2u;
    if ((*((_WORD *)v5 + 42) & 0x100) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_28:
  self->_arrivalDetected = *((_BYTE *)v5 + 80);
  *(_WORD *)&self->_flags |= 0x800u;
  v4 = *((_WORD *)v5 + 42);
  if ((v4 & 2) != 0)
    goto LABEL_29;
LABEL_14:
  if ((v4 & 0x100) != 0)
  {
LABEL_15:
    self->_stepID = *((_DWORD *)v5 + 17);
    *(_WORD *)&self->_flags |= 0x100u;
  }
LABEL_16:

}

@end
