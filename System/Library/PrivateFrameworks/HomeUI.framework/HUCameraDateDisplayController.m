@implementation HUCameraDateDisplayController

- (HUCameraDateDisplayController)initWithDayOfWeekLabel:(id)a3 timeLabel:(id)a4
{
  id v6;
  id v7;
  HUCameraDateDisplayController *v8;
  HUCameraDateDisplayController *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUCameraDateDisplayController;
  v8 = -[HUCameraDateDisplayController init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HUCameraDateDisplayController setDayLabel:](v8, "setDayLabel:", v6);
    -[HUCameraDateDisplayController setTimeLabel:](v9, "setTimeLabel:", v7);
    -[HUCameraDateDisplayController setDateDisplayType:](v9, "setDateDisplayType:", 1);
    -[HUCameraDateDisplayController setDayHasChanged:](v9, "setDayHasChanged:", 1);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraDateDisplayController setCalendar:](v9, "setCalendar:", v10);

    -[HUCameraDateDisplayController setSecondUnitFlags:](v9, "setSecondUnitFlags:", 764);
    -[HUCameraDateDisplayController setMinuteUnitFlags:](v9, "setMinuteUnitFlags:", 636);
  }

  return v9;
}

- (void)updateDisplayDateWithDate:(id)a3 forType:(unint64_t)a4
{
  id v6;

  v6 = a3;
  if (-[HUCameraDateDisplayController dateDisplayType](self, "dateDisplayType") == a4)
  {
    if (!-[HUCameraDateDisplayController _shouldUpdateDisplayWithDate:](self, "_shouldUpdateDisplayWithDate:", v6))
      goto LABEL_6;
  }
  else
  {
    -[HUCameraDateDisplayController setDateDisplayType:](self, "setDateDisplayType:", a4);
    -[HUCameraDateDisplayController setDayHasChanged:](self, "setDayHasChanged:", 1);
  }
  -[HUCameraDateDisplayController setCurrentDate:](self, "setCurrentDate:", v6);
LABEL_6:

}

- (BOOL)_shouldUpdateDisplayWithDate:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  BOOL v8;

  v4 = a3;
  -[HUCameraDateDisplayController currentDate](self, "currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToDate:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    if (-[HUCameraDateDisplayController dateDisplayType](self, "dateDisplayType"))
      v8 = -[HUCameraDateDisplayController _isSameMinuteAsDate:](self, "_isSameMinuteAsDate:", v4);
    else
      v8 = -[HUCameraDateDisplayController _isSameSecondAsDate:](self, "_isSameSecondAsDate:", v4);
    v7 = !v8;
  }

  return v7;
}

- (BOOL)_isSameSecondAsDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;

  v4 = a3;
  -[HUCameraDateDisplayController calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", -[HUCameraDateDisplayController secondUnitFlags](self, "secondUnitFlags"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCameraDateDisplayController currentDateComponents](self, "currentDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "year");
  if (v8 != objc_msgSend(v6, "year"))
    goto LABEL_11;
  -[HUCameraDateDisplayController currentDateComponents](self, "currentDateComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "month");
  if (v10 != objc_msgSend(v6, "month"))
  {
LABEL_10:

LABEL_11:
    goto LABEL_12;
  }
  -[HUCameraDateDisplayController currentDateComponents](self, "currentDateComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "day");
  if (v12 != objc_msgSend(v6, "day"))
  {

    goto LABEL_10;
  }
  -[HUCameraDateDisplayController currentDateComponents](self, "currentDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "weekday");
  v15 = objc_msgSend(v6, "weekday");

  if (v14 != v15)
  {
LABEL_12:
    -[HUCameraDateDisplayController setDayHasChanged:](self, "setDayHasChanged:", 1);
    goto LABEL_13;
  }
  -[HUCameraDateDisplayController currentDateComponents](self, "currentDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hour");
  if (v17 != objc_msgSend(v6, "hour"))
  {
LABEL_16:

    goto LABEL_13;
  }
  -[HUCameraDateDisplayController currentDateComponents](self, "currentDateComponents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "minute");
  if (v19 != objc_msgSend(v6, "minute"))
  {

    goto LABEL_16;
  }
  -[HUCameraDateDisplayController currentDateComponents](self, "currentDateComponents");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "second");
  v22 = objc_msgSend(v6, "second");

  if (v21 != v22)
  {
LABEL_13:
    v23 = 0;
    goto LABEL_14;
  }
  v23 = 1;
LABEL_14:

  return v23;
}

- (BOOL)_isSameMinuteAsDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;

  v4 = a3;
  -[HUCameraDateDisplayController calendar](self, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", -[HUCameraDateDisplayController minuteUnitFlags](self, "minuteUnitFlags"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUCameraDateDisplayController currentDateComponents](self, "currentDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "year");
  if (v8 != objc_msgSend(v6, "year"))
    goto LABEL_10;
  -[HUCameraDateDisplayController currentDateComponents](self, "currentDateComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "month");
  if (v10 != objc_msgSend(v6, "month"))
  {
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  -[HUCameraDateDisplayController currentDateComponents](self, "currentDateComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "day");
  if (v12 != objc_msgSend(v6, "day"))
  {

    goto LABEL_9;
  }
  -[HUCameraDateDisplayController currentDateComponents](self, "currentDateComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "weekday");
  v15 = objc_msgSend(v6, "weekday");

  if (v14 != v15)
  {
LABEL_11:
    -[HUCameraDateDisplayController setDayHasChanged:](self, "setDayHasChanged:", 1);
    goto LABEL_12;
  }
  -[HUCameraDateDisplayController currentDateComponents](self, "currentDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hour");
  if (v17 != objc_msgSend(v6, "hour"))
  {

    goto LABEL_12;
  }
  -[HUCameraDateDisplayController currentDateComponents](self, "currentDateComponents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "minute");
  v20 = objc_msgSend(v6, "minute");

  if (v19 != v20)
  {
LABEL_12:
    v21 = 0;
    goto LABEL_13;
  }
  v21 = 1;
LABEL_13:

  return v21;
}

- (void)setCurrentDate:(id)a3
{
  unint64_t v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_currentDate, a3);
  if (self->_currentDate)
  {
    v5 = -[HUCameraDateDisplayController dateDisplayType](self, "dateDisplayType");
    -[HUCameraDateDisplayController calendar](self, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v7 = -[HUCameraDateDisplayController minuteUnitFlags](self, "minuteUnitFlags");
    else
      v7 = -[HUCameraDateDisplayController secondUnitFlags](self, "secondUnitFlags");
    objc_msgSend(v6, "components:fromDate:", v7, self->_currentDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraDateDisplayController setCurrentDateComponents:](self, "setCurrentDateComponents:", v8);

    -[HUCameraDateDisplayController _updateTimeLabel](self, "_updateTimeLabel");
    -[HUCameraDateDisplayController _updateDayLabel](self, "_updateDayLabel");
  }
  else
  {
    -[HUCameraDateDisplayController _resetLabels](self, "_resetLabels");
  }

}

- (void)_resetLabels
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E6F60E80);
  -[HUCameraDateDisplayController timeLabel](self, "timeLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", v3);

  -[HUCameraDateDisplayController dayLabel](self, "dayLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", &stru_1E6F60E80);

}

- (void)_updateTimeLabel
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[HUCameraDateDisplayController dateDisplayType](self, "dateDisplayType");
  v4 = (void *)MEMORY[0x1E0D31288];
  -[HUCameraDateDisplayController currentDate](self, "currentDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v4, "attributedShortTimeStringFromDate:", v7);
  else
    objc_msgSend(v4, "attributedFullTimeStringFromDate:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraDateDisplayController timeLabel](self, "timeLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", v5);

}

- (void)_updateDayLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[HUCameraDateDisplayController dayHasChanged](self, "dayHasChanged"))
  {
    v3 = (void *)MEMORY[0x1E0D31288];
    -[HUCameraDateDisplayController currentDate](self, "currentDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dayStringFromDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraDateDisplayController dayLabel](self, "dayLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    -[HUCameraDateDisplayController setDayHasChanged:](self, "setDayHasChanged:", 0);
  }
}

- (HUActsAsLabel)dayLabel
{
  return (HUActsAsLabel *)objc_loadWeakRetained((id *)&self->_dayLabel);
}

- (void)setDayLabel:(id)a3
{
  objc_storeWeak((id *)&self->_dayLabel, a3);
}

- (HUActsAsLabel)timeLabel
{
  return (HUActsAsLabel *)objc_loadWeakRetained((id *)&self->_timeLabel);
}

- (void)setTimeLabel:(id)a3
{
  objc_storeWeak((id *)&self->_timeLabel, a3);
}

- (unint64_t)dateDisplayType
{
  return self->_dateDisplayType;
}

- (void)setDateDisplayType:(unint64_t)a3
{
  self->_dateDisplayType = a3;
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (BOOL)dayHasChanged
{
  return self->_dayHasChanged;
}

- (void)setDayHasChanged:(BOOL)a3
{
  self->_dayHasChanged = a3;
}

- (NSDateComponents)currentDateComponents
{
  return self->_currentDateComponents;
}

- (void)setCurrentDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_currentDateComponents, a3);
}

- (unsigned)secondUnitFlags
{
  return self->_secondUnitFlags;
}

- (void)setSecondUnitFlags:(unsigned int)a3
{
  self->_secondUnitFlags = a3;
}

- (unsigned)minuteUnitFlags
{
  return self->_minuteUnitFlags;
}

- (void)setMinuteUnitFlags:(unsigned int)a3
{
  self->_minuteUnitFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDateComponents, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_destroyWeak((id *)&self->_timeLabel);
  objc_destroyWeak((id *)&self->_dayLabel);
}

@end
