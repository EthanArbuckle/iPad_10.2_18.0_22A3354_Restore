@implementation NTKWorldClockGraphicCircularViewConfiguration

- (NTKWorldClockGraphicCircularViewConfiguration)initWithTimeZone:(id)a3 labelText:(id)a4 transitInfo:(id)a5 inTritium:(BOOL)a6 overrideDate:(id)a7 isPrivacy:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NTKWorldClockGraphicCircularViewConfiguration *v18;
  uint64_t v19;
  NSTimeZone *timeZone;
  uint64_t v21;
  NSString *labelText;
  uint64_t v23;
  NSDate *overrideDate;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)NTKWorldClockGraphicCircularViewConfiguration;
  v18 = -[NTKWorldClockGraphicCircularViewConfiguration init](&v26, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    timeZone = v18->_timeZone;
    v18->_timeZone = (NSTimeZone *)v19;

    v21 = objc_msgSend(v15, "copy");
    labelText = v18->_labelText;
    v18->_labelText = (NSString *)v21;

    objc_storeStrong((id *)&v18->_transitInfo, a5);
    v18->_inTritium = a6;
    v23 = objc_msgSend(v17, "copy");
    overrideDate = v18->_overrideDate;
    v18->_overrideDate = (NSDate *)v23;

    v18->_isPrivacy = a8;
  }

  return v18;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (CLKUIAlmanacTransitInfo)transitInfo
{
  return self->_transitInfo;
}

- (NSString)labelText
{
  return self->_labelText;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (BOOL)inTritium
{
  return self->_inTritium;
}

- (BOOL)isPrivacy
{
  return self->_isPrivacy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_labelText, 0);
  objc_storeStrong((id *)&self->_transitInfo, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end
