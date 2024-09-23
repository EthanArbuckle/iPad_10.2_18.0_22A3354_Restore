@implementation IRStatisticsDO

- (NSDate)lastClearDate
{
  return self->_lastClearDate;
}

- (int64_t)numberOfContextChanges
{
  return self->_numberOfContextChanges;
}

- (int64_t)timeInUpdatesModeInSeconds
{
  return self->_timeInUpdatesModeInSeconds;
}

- (int64_t)numberOfPickerChoiceEvents
{
  return self->_numberOfPickerChoiceEvents;
}

- (int64_t)numberOfMiLoPredictions
{
  return self->_numberOfMiLoPredictions;
}

- (int64_t)numberOfMiLoPredictionsInUpdatesMode
{
  return self->_numberOfMiLoPredictionsInUpdatesMode;
}

- (int64_t)numberOfCorrectPickerChoiceEvents
{
  return self->_numberOfCorrectPickerChoiceEvents;
}

- (int64_t)lastMiLoQuality
{
  return self->_lastMiLoQuality;
}

- (int64_t)lastMiLoQualityReasonBitmap
{
  return self->_lastMiLoQualityReasonBitmap;
}

- (int64_t)lastMiLoModels
{
  return self->_lastMiLoModels;
}

- (int64_t)lastMiLoLSLItems
{
  return self->_lastMiLoLSLItems;
}

- (id)copyWithReplacementNumberOfContextChanges:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", a3, self->_numberOfMiLoPredictions, self->_numberOfMiLoPredictionsInUpdatesMode, self->_lastMiLoLSLItems, self->_lastMiLoQualityReasonBitmap, self->_lastMiLoQuality, self->_lastMiLoModels, self->_timeInUpdatesModeInSeconds, self->_numberOfPickerChoiceEvents, self->_numberOfCorrectPickerChoiceEvents, self->_lastClearDate);
}

- (IRStatisticsDO)initWithNumberOfContextChanges:(int64_t)a3 numberOfMiLoPredictions:(int64_t)a4 numberOfMiLoPredictionsInUpdatesMode:(int64_t)a5 lastMiLoLSLItems:(int64_t)a6 lastMiLoQualityReasonBitmap:(int64_t)a7 lastMiLoQuality:(int64_t)a8 lastMiLoModels:(int64_t)a9 timeInUpdatesModeInSeconds:(int64_t)a10 numberOfPickerChoiceEvents:(int64_t)a11 numberOfCorrectPickerChoiceEvents:(int64_t)a12 lastClearDate:(id)a13
{
  id v20;
  IRStatisticsDO *v21;
  IRStatisticsDO *v22;
  objc_super v24;

  v20 = a13;
  v24.receiver = self;
  v24.super_class = (Class)IRStatisticsDO;
  v21 = -[IRStatisticsDO init](&v24, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_numberOfContextChanges = a3;
    v21->_numberOfMiLoPredictions = a4;
    v21->_numberOfMiLoPredictionsInUpdatesMode = a5;
    v21->_lastMiLoLSLItems = a6;
    v21->_lastMiLoQualityReasonBitmap = a7;
    v21->_lastMiLoQuality = a8;
    v21->_lastMiLoModels = a9;
    v21->_timeInUpdatesModeInSeconds = a10;
    v21->_numberOfPickerChoiceEvents = a11;
    v21->_numberOfCorrectPickerChoiceEvents = a12;
    objc_storeStrong((id *)&v21->_lastClearDate, a13);
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastClearDate, 0);
}

+ (IRStatisticsDO)statisticsDOWithNumberOfContextChanges:(int64_t)a3 numberOfMiLoPredictions:(int64_t)a4 numberOfMiLoPredictionsInUpdatesMode:(int64_t)a5 lastMiLoLSLItems:(int64_t)a6 lastMiLoQualityReasonBitmap:(int64_t)a7 lastMiLoQuality:(int64_t)a8 lastMiLoModels:(int64_t)a9 timeInUpdatesModeInSeconds:(int64_t)a10 numberOfPickerChoiceEvents:(int64_t)a11 numberOfCorrectPickerChoiceEvents:(int64_t)a12 lastClearDate:(id)a13
{
  id v20;
  void *v21;

  v20 = a13;
  v21 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, v20);

  return (IRStatisticsDO *)v21;
}

- (id)copyWithReplacementNumberOfMiLoPredictions:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", self->_numberOfContextChanges, a3, self->_numberOfMiLoPredictionsInUpdatesMode, self->_lastMiLoLSLItems, self->_lastMiLoQualityReasonBitmap, self->_lastMiLoQuality, self->_lastMiLoModels, self->_timeInUpdatesModeInSeconds, self->_numberOfPickerChoiceEvents, self->_numberOfCorrectPickerChoiceEvents, self->_lastClearDate);
}

- (id)copyWithReplacementNumberOfMiLoPredictionsInUpdatesMode:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", self->_numberOfContextChanges, self->_numberOfMiLoPredictions, a3, self->_lastMiLoLSLItems, self->_lastMiLoQualityReasonBitmap, self->_lastMiLoQuality, self->_lastMiLoModels, self->_timeInUpdatesModeInSeconds, self->_numberOfPickerChoiceEvents, self->_numberOfCorrectPickerChoiceEvents, self->_lastClearDate);
}

- (id)copyWithReplacementLastMiLoLSLItems:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", self->_numberOfContextChanges, self->_numberOfMiLoPredictions, self->_numberOfMiLoPredictionsInUpdatesMode, a3, self->_lastMiLoQualityReasonBitmap, self->_lastMiLoQuality, self->_lastMiLoModels, self->_timeInUpdatesModeInSeconds, self->_numberOfPickerChoiceEvents, self->_numberOfCorrectPickerChoiceEvents, self->_lastClearDate);
}

- (id)copyWithReplacementLastMiLoQualityReasonBitmap:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", self->_numberOfContextChanges, self->_numberOfMiLoPredictions, self->_numberOfMiLoPredictionsInUpdatesMode, self->_lastMiLoLSLItems, a3, self->_lastMiLoQuality, self->_lastMiLoModels, self->_timeInUpdatesModeInSeconds, self->_numberOfPickerChoiceEvents, self->_numberOfCorrectPickerChoiceEvents, self->_lastClearDate);
}

- (id)copyWithReplacementLastMiLoQuality:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", self->_numberOfContextChanges, self->_numberOfMiLoPredictions, self->_numberOfMiLoPredictionsInUpdatesMode, self->_lastMiLoLSLItems, self->_lastMiLoQualityReasonBitmap, a3, self->_lastMiLoModels, self->_timeInUpdatesModeInSeconds, self->_numberOfPickerChoiceEvents, self->_numberOfCorrectPickerChoiceEvents, self->_lastClearDate);
}

- (id)copyWithReplacementLastMiLoModels:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", self->_numberOfContextChanges, self->_numberOfMiLoPredictions, self->_numberOfMiLoPredictionsInUpdatesMode, self->_lastMiLoLSLItems, self->_lastMiLoQualityReasonBitmap, self->_lastMiLoQuality, a3, self->_timeInUpdatesModeInSeconds, self->_numberOfPickerChoiceEvents, self->_numberOfCorrectPickerChoiceEvents, self->_lastClearDate);
}

- (id)copyWithReplacementTimeInUpdatesModeInSeconds:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", self->_numberOfContextChanges, self->_numberOfMiLoPredictions, self->_numberOfMiLoPredictionsInUpdatesMode, self->_lastMiLoLSLItems, self->_lastMiLoQualityReasonBitmap, self->_lastMiLoQuality, self->_lastMiLoModels, a3, self->_numberOfPickerChoiceEvents, self->_numberOfCorrectPickerChoiceEvents, self->_lastClearDate);
}

- (id)copyWithReplacementNumberOfPickerChoiceEvents:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", self->_numberOfContextChanges, self->_numberOfMiLoPredictions, self->_numberOfMiLoPredictionsInUpdatesMode, self->_lastMiLoLSLItems, self->_lastMiLoQualityReasonBitmap, self->_lastMiLoQuality, self->_lastMiLoModels, self->_timeInUpdatesModeInSeconds, a3, self->_numberOfCorrectPickerChoiceEvents, self->_lastClearDate);
}

- (id)copyWithReplacementNumberOfCorrectPickerChoiceEvents:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", self->_numberOfContextChanges, self->_numberOfMiLoPredictions, self->_numberOfMiLoPredictionsInUpdatesMode, self->_lastMiLoLSLItems, self->_lastMiLoQualityReasonBitmap, self->_lastMiLoQuality, self->_lastMiLoModels, self->_timeInUpdatesModeInSeconds, self->_numberOfPickerChoiceEvents, a3, self->_lastClearDate);
}

- (id)copyWithReplacementLastClearDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", self->_numberOfContextChanges, self->_numberOfMiLoPredictions, self->_numberOfMiLoPredictionsInUpdatesMode, self->_lastMiLoLSLItems, self->_lastMiLoQualityReasonBitmap, self->_lastMiLoQuality, self->_lastMiLoModels, self->_timeInUpdatesModeInSeconds, self->_numberOfPickerChoiceEvents, self->_numberOfCorrectPickerChoiceEvents, v4);

  return v5;
}

- (BOOL)isEqualToStatisticsDO:(id)a3
{
  id v4;
  void *v5;
  int64_t numberOfContextChanges;
  int64_t numberOfMiLoPredictions;
  int64_t numberOfMiLoPredictionsInUpdatesMode;
  int64_t lastMiLoLSLItems;
  int64_t lastMiLoQualityReasonBitmap;
  int64_t lastMiLoQuality;
  int64_t lastMiLoModels;
  int64_t timeInUpdatesModeInSeconds;
  int64_t numberOfPickerChoiceEvents;
  int64_t numberOfCorrectPickerChoiceEvents;
  int v16;
  void *v17;
  int v18;
  NSDate *lastClearDate;
  void *v20;
  char v21;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_15;
  numberOfContextChanges = self->_numberOfContextChanges;
  if (numberOfContextChanges != objc_msgSend(v4, "numberOfContextChanges"))
    goto LABEL_15;
  numberOfMiLoPredictions = self->_numberOfMiLoPredictions;
  if (numberOfMiLoPredictions != objc_msgSend(v5, "numberOfMiLoPredictions"))
    goto LABEL_15;
  numberOfMiLoPredictionsInUpdatesMode = self->_numberOfMiLoPredictionsInUpdatesMode;
  if (numberOfMiLoPredictionsInUpdatesMode != objc_msgSend(v5, "numberOfMiLoPredictionsInUpdatesMode"))
    goto LABEL_15;
  lastMiLoLSLItems = self->_lastMiLoLSLItems;
  if (lastMiLoLSLItems != objc_msgSend(v5, "lastMiLoLSLItems"))
    goto LABEL_15;
  lastMiLoQualityReasonBitmap = self->_lastMiLoQualityReasonBitmap;
  if (lastMiLoQualityReasonBitmap != objc_msgSend(v5, "lastMiLoQualityReasonBitmap"))
    goto LABEL_15;
  lastMiLoQuality = self->_lastMiLoQuality;
  if (lastMiLoQuality != objc_msgSend(v5, "lastMiLoQuality"))
    goto LABEL_15;
  lastMiLoModels = self->_lastMiLoModels;
  if (lastMiLoModels != objc_msgSend(v5, "lastMiLoModels"))
    goto LABEL_15;
  timeInUpdatesModeInSeconds = self->_timeInUpdatesModeInSeconds;
  if (timeInUpdatesModeInSeconds != objc_msgSend(v5, "timeInUpdatesModeInSeconds"))
    goto LABEL_15;
  numberOfPickerChoiceEvents = self->_numberOfPickerChoiceEvents;
  if (numberOfPickerChoiceEvents == objc_msgSend(v5, "numberOfPickerChoiceEvents")
    && (numberOfCorrectPickerChoiceEvents = self->_numberOfCorrectPickerChoiceEvents,
        numberOfCorrectPickerChoiceEvents == objc_msgSend(v5, "numberOfCorrectPickerChoiceEvents"))
    && (v16 = self->_lastClearDate != 0,
        objc_msgSend(v5, "lastClearDate"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = v17 == 0,
        v17,
        v16 != v18))
  {
    lastClearDate = self->_lastClearDate;
    if (lastClearDate)
    {
      objc_msgSend(v5, "lastClearDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[NSDate isEqual:](lastClearDate, "isEqual:", v20);

    }
    else
    {
      v21 = 1;
    }
  }
  else
  {
LABEL_15:
    v21 = 0;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  IRStatisticsDO *v4;
  IRStatisticsDO *v5;
  BOOL v6;

  v4 = (IRStatisticsDO *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[IRStatisticsDO isEqualToStatisticsDO:](self, "isEqualToStatisticsDO:", v5);

  return v6;
}

- (unint64_t)hash
{
  int64_t v2;
  int64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;

  v2 = self->_numberOfMiLoPredictions - self->_numberOfContextChanges + 32 * self->_numberOfContextChanges;
  v3 = self->_numberOfMiLoPredictionsInUpdatesMode - v2 + 32 * v2;
  v4 = self->_lastMiLoLSLItems - v3 + 32 * v3;
  v5 = self->_lastMiLoQualityReasonBitmap - v4 + 32 * v4;
  v6 = self->_lastMiLoQuality - v5 + 32 * v5;
  v7 = self->_lastMiLoModels - v6 + 32 * v6;
  v8 = self->_timeInUpdatesModeInSeconds - v7 + 32 * v7;
  v9 = self->_numberOfPickerChoiceEvents - v8 + 32 * v8;
  v10 = self->_numberOfCorrectPickerChoiceEvents - v9 + 32 * v9;
  return -[NSDate hash](self->_lastClearDate, "hash") - v10 + 32 * v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRStatisticsDO)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString **v22;
  uint64_t *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  IRStatisticsDO *v33;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  const __CFString *v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("numberOfContextChanges"));
  if (!v5)
  {
    objc_msgSend(v4, "error");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      goto LABEL_42;
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("numberOfContextChanges")) & 1) == 0)
    {
      v59 = *MEMORY[0x24BDD0FC8];
      v60[0] = CFSTR("Missing serialized value for IRStatisticsDO.numberOfContextChanges");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = (const __CFString **)v60;
      v23 = &v59;
      goto LABEL_47;
    }
  }
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("numberOfMiLoPredictions"));
  if (!v6)
  {
    objc_msgSend(v4, "error");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      goto LABEL_42;
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("numberOfMiLoPredictions")) & 1) == 0)
    {
      v57 = *MEMORY[0x24BDD0FC8];
      v58 = CFSTR("Missing serialized value for IRStatisticsDO.numberOfMiLoPredictions");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = &v58;
      v23 = &v57;
      goto LABEL_47;
    }
  }
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("numberOfMiLoPredictionsInUpdatesMode"));
  if (!v7)
  {
    objc_msgSend(v4, "error");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      goto LABEL_42;
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("numberOfMiLoPredictionsInUpdatesMode")) & 1) == 0)
    {
      v55 = *MEMORY[0x24BDD0FC8];
      v56 = CFSTR("Missing serialized value for IRStatisticsDO.numberOfMiLoPredictionsInUpdatesMode");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = &v56;
      v23 = &v55;
      goto LABEL_47;
    }
  }
  v8 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("lastMiLoLSLItems"));
  if (!v8)
  {
    objc_msgSend(v4, "error");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
      goto LABEL_42;
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("lastMiLoLSLItems")) & 1) == 0)
    {
      v53 = *MEMORY[0x24BDD0FC8];
      v54 = CFSTR("Missing serialized value for IRStatisticsDO.lastMiLoLSLItems");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = &v54;
      v23 = &v53;
      goto LABEL_47;
    }
  }
  v9 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("lastMiLoQualityReasonBitmap"));
  if (!v9)
  {
    objc_msgSend(v4, "error");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      goto LABEL_42;
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("lastMiLoQualityReasonBitmap")) & 1) == 0)
    {
      v51 = *MEMORY[0x24BDD0FC8];
      v52 = CFSTR("Missing serialized value for IRStatisticsDO.lastMiLoQualityReasonBitmap");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = &v52;
      v23 = &v51;
      goto LABEL_47;
    }
  }
  v10 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("lastMiLoQuality"));
  if (!v10)
  {
    objc_msgSend(v4, "error");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
      goto LABEL_42;
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("lastMiLoQuality")) & 1) == 0)
    {
      v49 = *MEMORY[0x24BDD0FC8];
      v50 = CFSTR("Missing serialized value for IRStatisticsDO.lastMiLoQuality");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = &v50;
      v23 = &v49;
      goto LABEL_47;
    }
  }
  v11 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("lastMiLoModels"));
  if (!v11)
  {
    objc_msgSend(v4, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
      goto LABEL_42;
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("lastMiLoModels")) & 1) == 0)
    {
      v47 = *MEMORY[0x24BDD0FC8];
      v48 = CFSTR("Missing serialized value for IRStatisticsDO.lastMiLoModels");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = &v48;
      v23 = &v47;
      goto LABEL_47;
    }
  }
  v38 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("timeInUpdatesModeInSeconds"));
  if (!v38)
  {
    objc_msgSend(v4, "error");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
      goto LABEL_42;
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("timeInUpdatesModeInSeconds")) & 1) == 0)
    {
      v45 = *MEMORY[0x24BDD0FC8];
      v46 = CFSTR("Missing serialized value for IRStatisticsDO.timeInUpdatesModeInSeconds");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = &v46;
      v23 = &v45;
      goto LABEL_47;
    }
  }
  v37 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("numberOfPickerChoiceEvents"));
  if (!v37)
  {
    objc_msgSend(v4, "error");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      goto LABEL_42;
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("numberOfPickerChoiceEvents")) & 1) == 0)
    {
      v43 = *MEMORY[0x24BDD0FC8];
      v44 = CFSTR("Missing serialized value for IRStatisticsDO.numberOfPickerChoiceEvents");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = &v44;
      v23 = &v43;
      goto LABEL_47;
    }
  }
  v36 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("numberOfCorrectPickerChoiceEvents"));
  if (v36)
    goto LABEL_11;
  objc_msgSend(v4, "error");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("numberOfCorrectPickerChoiceEvents")) & 1) != 0)
    {
LABEL_11:
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastClearDate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unarchived unexpected class for IRStatisticsDO key \"lastClearDate\" (expected %@, decoded %@)"), v14, v16, 0);
          v39 = *MEMORY[0x24BDD0FC8];
          v40 = v17;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRStatisticsDOOCNTErrorDomain"), 3, v18);
          objc_msgSend(v4, "failWithError:", v19);

LABEL_48:
          goto LABEL_49;
        }
      }
      else
      {
        objc_msgSend(v4, "error");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
LABEL_49:
          v33 = 0;
          goto LABEL_50;
        }
      }
      self = -[IRStatisticsDO initWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:](self, "initWithNumberOfContextChanges:numberOfMiLoPredictions:numberOfMiLoPredictionsInUpdatesMode:lastMiLoLSLItems:lastMiLoQualityReasonBitmap:lastMiLoQuality:lastMiLoModels:timeInUpdatesModeInSeconds:numberOfPickerChoiceEvents:numberOfCorrectPickerChoiceEvents:lastClearDate:", v5, v6, v7, v8, v9, v10, v11, v38, v37, v36, v12);
      v33 = self;
LABEL_50:

      goto LABEL_51;
    }
    v41 = *MEMORY[0x24BDD0FC8];
    v42 = CFSTR("Missing serialized value for IRStatisticsDO.numberOfCorrectPickerChoiceEvents");
    v21 = (void *)MEMORY[0x24BDBCE70];
    v22 = &v42;
    v23 = &v41;
LABEL_47:
    objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("IRStatisticsDOOCNTErrorDomain"), 1, v12);
    objc_msgSend(v4, "failWithError:", v14);
    goto LABEL_48;
  }
LABEL_42:
  v33 = 0;
LABEL_51:

  return v33;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *lastClearDate;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", self->_numberOfContextChanges, CFSTR("numberOfContextChanges"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_numberOfMiLoPredictions, CFSTR("numberOfMiLoPredictions"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_numberOfMiLoPredictionsInUpdatesMode, CFSTR("numberOfMiLoPredictionsInUpdatesMode"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_lastMiLoLSLItems, CFSTR("lastMiLoLSLItems"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_lastMiLoQualityReasonBitmap, CFSTR("lastMiLoQualityReasonBitmap"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_lastMiLoQuality, CFSTR("lastMiLoQuality"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_lastMiLoModels, CFSTR("lastMiLoModels"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_timeInUpdatesModeInSeconds, CFSTR("timeInUpdatesModeInSeconds"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_numberOfPickerChoiceEvents, CFSTR("numberOfPickerChoiceEvents"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_numberOfCorrectPickerChoiceEvents, CFSTR("numberOfCorrectPickerChoiceEvents"));
  lastClearDate = self->_lastClearDate;
  if (lastClearDate)
    objc_msgSend(v5, "encodeObject:forKey:", lastClearDate, CFSTR("lastClearDate"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;
  void *v15;

  v14 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_numberOfContextChanges);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_numberOfMiLoPredictions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_numberOfMiLoPredictionsInUpdatesMode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_lastMiLoLSLItems);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_lastMiLoQualityReasonBitmap);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_lastMiLoQuality);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_lastMiLoModels);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_timeInUpdatesModeInSeconds);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_numberOfPickerChoiceEvents);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_numberOfCorrectPickerChoiceEvents);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("<IRStatisticsDO | numberOfContextChanges:%@ numberOfMiLoPredictions:%@ numberOfMiLoPredictionsInUpdatesMode:%@ lastMiLoLSLItems:%@ lastMiLoQualityReasonBitmap:%@ lastMiLoQuality:%@ lastMiLoModels:%@ timeInUpdatesModeInSeconds:%@ numberOfPickerChoiceEvents:%@ numberOfCorrectPickerChoiceEvents:%@ lastClearDate:%@>"), v13, v3, v4, v5, v6, v7, v8, v9, v10, v11, self->_lastClearDate);

  return v15;
}

@end
