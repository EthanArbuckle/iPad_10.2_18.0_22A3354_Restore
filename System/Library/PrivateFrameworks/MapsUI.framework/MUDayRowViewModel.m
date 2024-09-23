@implementation MUDayRowViewModel

- (id)buildDefaultPlacecardHoursString
{
  void *v2;
  void *v3;

  +[MUPlaceHoursFormatter hoursFormatterFromHoursStringComponents:AMPMSymbols:](MUPlaceHoursFormatter, "hoursFormatterFromHoursStringComponents:AMPMSymbols:", self->_hourStrings, self->_AMPMStrings);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buildDefaultPlacecardHoursString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)labelHeaderString
{
  return self->_labelHeaderString;
}

- (void)setLabelHeaderString:(id)a3
{
  objc_storeStrong((id *)&self->_labelHeaderString, a3);
}

- (NSString)dayString
{
  return self->_dayString;
}

- (void)setDayString:(id)a3
{
  objc_storeStrong((id *)&self->_dayString, a3);
}

- (NSArray)hourStrings
{
  return self->_hourStrings;
}

- (void)setHourStrings:(id)a3
{
  objc_storeStrong((id *)&self->_hourStrings, a3);
}

- (NSArray)AMPMStrings
{
  return self->_AMPMStrings;
}

- (void)setAMPMStrings:(id)a3
{
  objc_storeStrong((id *)&self->_AMPMStrings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_AMPMStrings, 0);
  objc_storeStrong((id *)&self->_hourStrings, 0);
  objc_storeStrong((id *)&self->_dayString, 0);
  objc_storeStrong((id *)&self->_labelHeaderString, 0);
}

@end
