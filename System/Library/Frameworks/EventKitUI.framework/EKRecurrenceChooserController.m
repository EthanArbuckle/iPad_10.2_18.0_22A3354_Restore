@implementation EKRecurrenceChooserController

- (EKRecurrenceChooserController)initWithDate:(id)a3
{
  id v4;
  EKRecurrenceChooserController *v5;
  EKRecurrenceChooserController *v6;

  v4 = a3;
  v5 = -[EKRecurrenceChooserController init](self, "init");
  v6 = v5;
  if (v5)
    -[EKRecurrenceChooserController setDate:](v5, "setDate:", v4);

  return v6;
}

+ (int)dayFromNumber:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return 0;
  else
    return dword_1AFA135D0[a3 - 1];
}

- (id)startDateComponents:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[EKRecurrenceChooserController date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", a3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)notifyDelegate
{
  id v3;

  -[EKRecurrenceChooserController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recurrenceChooserUpdated:", self);

}

- (int64_t)numberOfRows
{
  return 1;
}

- (double)heightForRow:(int64_t)a3
{
  return *MEMORY[0x1E0DC53D8];
}

- (BOOL)drawBackgroundForRow:(int64_t)a3
{
  return 1;
}

- (EKRecurrenceChooserControllerDelegate)delegate
{
  return (EKRecurrenceChooserControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (int64_t)frequency
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return -1;
}

- (id)cellForRow:(int64_t)a3
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  return -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
}

@end
