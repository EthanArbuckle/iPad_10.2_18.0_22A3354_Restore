@implementation MFDatePickerItem

- (MFDatePickerItem)initWithIdentifier:(id)a3 selectedDate:(id)a4 selectedTime:(id)a5 selectedCity:(id)a6 datePickerComponentType:(int64_t)a7
{
  return -[MFDatePickerItem initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:timeSwitchEnabled:](self, "initWithIdentifier:selectedDate:selectedTime:selectedCity:datePickerComponentType:timeSwitchEnabled:", a3, a4, a5, a6, a7, 0);
}

- (MFDatePickerItem)initWithIdentifier:(id)a3 selectedDate:(id)a4 selectedTime:(id)a5 selectedCity:(id)a6 datePickerComponentType:(int64_t)a7 timeSwitchEnabled:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  MFDatePickerItem *v18;
  MFDatePickerItem *v19;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MFDatePickerItem;
  v18 = -[MFDatePickerItem init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_selectedDate, a4);
    objc_storeStrong((id *)&v19->_selectedTime, a5);
    objc_storeStrong((id *)&v19->_selectedCity, a6);
    v19->_datePickerComponentType = a7;
    v19->_timeSwitchEnabled = a8;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  MFDatePickerItem *v4;
  MFDatePickerItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  int64_t v16;
  void *v17;

  v4 = (MFDatePickerItem *)a3;
  if (self == v4)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MFDatePickerItem identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFDatePickerItem identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[MFDatePickerItem selectedTime](self, "selectedTime");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFDatePickerItem selectedTime](v5, "selectedTime");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToDate:", v9))
        {
          -[MFDatePickerItem selectedDate](self, "selectedDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFDatePickerItem selectedDate](self, "selectedDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToDate:", v11))
          {
            -[MFDatePickerItem selectedCity](self, "selectedCity");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFDatePickerItem selectedCity](v5, "selectedCity");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "isEqual:", v12)
              && (v16 = -[MFDatePickerItem datePickerComponentType](self, "datePickerComponentType"),
                  v16 == -[MFDatePickerItem datePickerComponentType](v5, "datePickerComponentType")))
            {
              v13 = -[MFDatePickerItem timeSwitchEnabled](self, "timeSwitchEnabled");
              v14 = v13 ^ -[MFDatePickerItem timeSwitchEnabled](v5, "timeSwitchEnabled") ^ 1;
            }
            else
            {
              LOBYTE(v14) = 0;
            }

          }
          else
          {
            LOBYTE(v14) = 0;
          }

        }
        else
        {
          LOBYTE(v14) = 0;
        }

      }
      else
      {
        LOBYTE(v14) = 0;
      }

    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int64_t v11;

  -[MFDatePickerItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[MFDatePickerItem selectedDate](self, "selectedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[MFDatePickerItem selectedTime](self, "selectedTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[MFDatePickerItem selectedCity](self, "selectedCity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 33 * (33 * (33 * (33 * v4 + v6) + v8) + objc_msgSend(v9, "hash"));

  v11 = 33 * (v10 + -[MFDatePickerItem datePickerComponentType](self, "datePickerComponentType"));
  return v11 + -[MFDatePickerItem timeSwitchEnabled](self, "timeSwitchEnabled") + 1291467969;
}

- (MFDatePickerItemIdentifier)identifier
{
  return self->_identifier;
}

- (NSDate)selectedDate
{
  return self->_selectedDate;
}

- (void)setSelectedDate:(id)a3
{
  objc_storeStrong((id *)&self->_selectedDate, a3);
}

- (NSDate)selectedTime
{
  return self->_selectedTime;
}

- (void)setSelectedTime:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTime, a3);
}

- (MFCity)selectedCity
{
  return self->_selectedCity;
}

- (void)setSelectedCity:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCity, a3);
}

- (int64_t)datePickerComponentType
{
  return self->_datePickerComponentType;
}

- (void)setDatePickerComponentType:(int64_t)a3
{
  self->_datePickerComponentType = a3;
}

- (BOOL)timeSwitchEnabled
{
  return self->_timeSwitchEnabled;
}

- (void)setTimeSwitchEnabled:(BOOL)a3
{
  self->_timeSwitchEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedCity, 0);
  objc_storeStrong((id *)&self->_selectedTime, 0);
  objc_storeStrong((id *)&self->_selectedDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
