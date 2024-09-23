@implementation NTKTimelineEntryModel

- (id)entryForComplicationFamily:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_new();
  -[NTKTimelineEntryModel entryDate](self, "entryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDate:", v6);

  -[NTKTimelineEntryModel templateForComplicationFamily:](self, "templateForComplicationFamily:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setComplicationTemplate:", v7);

  objc_msgSend(v5, "finalize");
  return v5;
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

- (void)setEntryDate:(id)a3
{
  objc_storeStrong((id *)&self->_entryDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryDate, 0);
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
