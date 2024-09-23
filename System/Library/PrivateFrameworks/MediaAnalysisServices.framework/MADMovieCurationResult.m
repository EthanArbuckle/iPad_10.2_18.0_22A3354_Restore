@implementation MADMovieCurationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADMovieCurationResult)initWithSummaryEntries:(id)a3 highlightEntries:(id)a4 curationScoreEntries:(id)a5
{
  id v9;
  id v10;
  id v11;
  MADMovieCurationResult *v12;
  MADMovieCurationResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MADMovieCurationResult;
  v12 = -[MADResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_summaryEntries, a3);
    objc_storeStrong((id *)&v13->_highlightEntries, a4);
    objc_storeStrong((id *)&v13->_curationScoreEntries, a5);
  }

  return v13;
}

+ (id)resultWithSummaryEntries:(id)a3 highlightEntries:(id)a4 curationScoreEntries:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSummaryEntries:highlightEntries:curationScoreEntries:", v8, v9, v10);

  return v11;
}

- (MADMovieCurationResult)initWithCoder:(id)a3
{
  id v4;
  MADMovieCurationResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *curationScoreEntries;
  uint64_t v11;
  NSArray *highlightEntries;
  uint64_t v13;
  NSArray *summaryEntries;
  objc_super v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MADMovieCurationResult;
  v5 = -[MADResult initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v17[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("CurationScoreEntries"));
    v9 = objc_claimAutoreleasedReturnValue();
    curationScoreEntries = v5->_curationScoreEntries;
    v5->_curationScoreEntries = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HighlightEntries"));
    v11 = objc_claimAutoreleasedReturnValue();
    highlightEntries = v5->_highlightEntries;
    v5->_highlightEntries = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("SummaryEntries"));
    v13 = objc_claimAutoreleasedReturnValue();
    summaryEntries = v5->_summaryEntries;
    v5->_summaryEntries = (NSArray *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADMovieCurationResult;
  -[MADResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_curationScoreEntries, CFSTR("CurationScoreEntries"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_highlightEntries, CFSTR("HighlightEntries"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_summaryEntries, CFSTR("SummaryEntries"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %lu count, "), CFSTR("SummaryEntries"), -[NSArray count](self->_summaryEntries, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %lu count, "), CFSTR("HighlightEntries"), -[NSArray count](self->_highlightEntries, "count"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %lu count>"), CFSTR("CurationScoreEntries"), -[NSArray count](self->_curationScoreEntries, "count"));
  return v3;
}

- (NSArray)curationScoreEntries
{
  return self->_curationScoreEntries;
}

- (NSArray)highlightEntries
{
  return self->_highlightEntries;
}

- (NSArray)summaryEntries
{
  return self->_summaryEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryEntries, 0);
  objc_storeStrong((id *)&self->_highlightEntries, 0);
  objc_storeStrong((id *)&self->_curationScoreEntries, 0);
}

@end
