@implementation MPRadioStationEvent

- (MPRadioStationEvent)initWithBlock:(id)a3
{
  void (**v4)(id, MPRadioStationEvent *);
  MPRadioStationEvent *v5;
  objc_super v7;

  v4 = (void (**)(id, MPRadioStationEvent *))a3;
  v7.receiver = self;
  v7.super_class = (Class)MPRadioStationEvent;
  v5 = -[MPRadioStationEvent init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (MPRadioStationEvent)initWithCoder:(id)a3
{
  id v4;
  MPRadioStationEvent *v5;
  uint64_t v6;
  NSString *title;
  uint64_t v8;
  NSString *descriptionText;
  uint64_t v10;
  NSDate *startTime;
  uint64_t v12;
  NSDate *endTime;

  v4 = a3;
  v5 = -[MPRadioStationEvent init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptionText"));
    v8 = objc_claimAutoreleasedReturnValue();
    descriptionText = v5->_descriptionText;
    v5->_descriptionText = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startTime"));
    v10 = objc_claimAutoreleasedReturnValue();
    startTime = v5->_startTime;
    v5->_startTime = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endTime"));
    v12 = objc_claimAutoreleasedReturnValue();
    endTime = v5->_endTime;
    v5->_endTime = (NSDate *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_descriptionText, CFSTR("descriptionText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startTime, CFSTR("startTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endTime, CFSTR("endTime"));

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
