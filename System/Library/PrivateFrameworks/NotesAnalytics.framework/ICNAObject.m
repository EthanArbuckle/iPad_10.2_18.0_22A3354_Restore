@implementation ICNAObject

- (ICNAEventReporter)eventReporter
{
  ICNAEventReporter *v3;
  objc_class *v4;
  void *v5;
  ICNAEventReporter *v6;
  ICNAEventReporter *eventReporter;

  if (!self->_eventReporter
    && +[ICNAOptedInObject isOptedInForAnalytics](ICNAEventReporter, "isOptedInForAnalytics"))
  {
    v3 = [ICNAEventReporter alloc];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICNAEventReporter initWithSubTrackerName:](v3, "initWithSubTrackerName:", v5);
    eventReporter = self->_eventReporter;
    self->_eventReporter = v6;

  }
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end
