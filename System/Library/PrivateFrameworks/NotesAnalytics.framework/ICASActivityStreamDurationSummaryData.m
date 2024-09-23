@implementation ICASActivityStreamDurationSummaryData

- (ICASActivityStreamDurationSummaryData)initWithHalfHeightViewDuration:(id)a3 fullHeightViewDuration:(id)a4 sideBarViewDuration:(id)a5 minimizedViewDuration:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICASActivityStreamDurationSummaryData *v15;
  ICASActivityStreamDurationSummaryData *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ICASActivityStreamDurationSummaryData;
  v15 = -[ICASActivityStreamDurationSummaryData init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_halfHeightViewDuration, a3);
    objc_storeStrong((id *)&v16->_fullHeightViewDuration, a4);
    objc_storeStrong((id *)&v16->_sideBarViewDuration, a5);
    objc_storeStrong((id *)&v16->_minimizedViewDuration, a6);
  }

  return v16;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("ActivityStreamDurationSummaryData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("halfHeightViewDuration");
  -[ICASActivityStreamDurationSummaryData halfHeightViewDuration](self, "halfHeightViewDuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASActivityStreamDurationSummaryData halfHeightViewDuration](self, "halfHeightViewDuration");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v18[0] = v4;
  v17[1] = CFSTR("fullHeightViewDuration");
  -[ICASActivityStreamDurationSummaryData fullHeightViewDuration](self, "fullHeightViewDuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASActivityStreamDurationSummaryData fullHeightViewDuration](self, "fullHeightViewDuration");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v18[1] = v7;
  v17[2] = CFSTR("sideBarViewDuration");
  -[ICASActivityStreamDurationSummaryData sideBarViewDuration](self, "sideBarViewDuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASActivityStreamDurationSummaryData sideBarViewDuration](self, "sideBarViewDuration");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v18[2] = v10;
  v17[3] = CFSTR("minimizedViewDuration");
  -[ICASActivityStreamDurationSummaryData minimizedViewDuration](self, "minimizedViewDuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[ICASActivityStreamDurationSummaryData minimizedViewDuration](self, "minimizedViewDuration");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_opt_new();
  }
  v14 = (void *)v13;
  v18[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSNumber)halfHeightViewDuration
{
  return self->_halfHeightViewDuration;
}

- (NSNumber)fullHeightViewDuration
{
  return self->_fullHeightViewDuration;
}

- (NSNumber)sideBarViewDuration
{
  return self->_sideBarViewDuration;
}

- (NSNumber)minimizedViewDuration
{
  return self->_minimizedViewDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimizedViewDuration, 0);
  objc_storeStrong((id *)&self->_sideBarViewDuration, 0);
  objc_storeStrong((id *)&self->_fullHeightViewDuration, 0);
  objc_storeStrong((id *)&self->_halfHeightViewDuration, 0);
}

@end
