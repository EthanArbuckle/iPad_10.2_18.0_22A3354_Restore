@implementation FHSuggestedEvent

- (FHSuggestedEvent)initWithPPSuggestedEvent:(id)a3
{
  id v4;
  FHSuggestedEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FHSuggestedEvent;
  v5 = -[FHSuggestedEvent init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHSuggestedEvent setTitle:](v5, "setTitle:", v6);

    objc_msgSend(v4, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHSuggestedEvent setStartDate:](v5, "setStartDate:", v7);

    objc_msgSend(v4, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHSuggestedEvent setEndDate:](v5, "setEndDate:", v8);

    objc_msgSend(v4, "eventIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FHSuggestedEvent setEventIdentifier:](v5, "setEventIdentifier:", v9);

  }
  return v5;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("title"), self->_title);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("startDate"), self->_startDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("endDate"), self->_endDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("eventIdentifier"), self->_eventIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setEventIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

@end
