@implementation ATXCandidateRelevanceModelDataStoreDatasetMetadata

- (ATXCandidateRelevanceModelDataStoreDatasetMetadata)initWithNumberOfPositiveSamples:(unint64_t)a3 numberOfSamples:(unint64_t)a4 numberOfDaysWithPositiveSamples:(unint64_t)a5 numberOfDaysWithSamples:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8
{
  id v15;
  id v16;
  ATXCandidateRelevanceModelDataStoreDatasetMetadata *v17;
  ATXCandidateRelevanceModelDataStoreDatasetMetadata *v18;
  objc_super v20;

  v15 = a7;
  v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)ATXCandidateRelevanceModelDataStoreDatasetMetadata;
  v17 = -[ATXCandidateRelevanceModelDataStoreDatasetMetadata init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_numberOfPositiveSamples = a3;
    v17->_numberOfSamples = a4;
    v17->_numberOfDaysWithPositiveSamples = a5;
    v17->_numberOfDaysWithSamples = a6;
    objc_storeStrong((id *)&v17->_startDate, a7);
    objc_storeStrong((id *)&v18->_endDate, a8);
  }

  return v18;
}

+ (id)datasetMetadataForDataPoints:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "observeDataPoint:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), (_QWORD)v12);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "currentMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "setDateStyle:", 4);
  objc_msgSend(v4, "setTimeStyle:", 4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US"));
  objc_msgSend(v4, "setLocale:", v5);

  objc_msgSend(v4, "stringFromDate:", self->_startDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Dataset Start Date: %@\n"), v6);

  objc_msgSend(v4, "stringFromDate:", self->_endDate);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Dataset End Date: %@\n"), v7);

  objc_msgSend(v3, "appendFormat:", CFSTR("Dataset Number of Positive Samples: %lu\n"), self->_numberOfPositiveSamples);
  objc_msgSend(v3, "appendFormat:", CFSTR("Dataset Number of Samples: %lu\n"), self->_numberOfSamples);
  objc_msgSend(v3, "appendFormat:", CFSTR("Dataset Number of Days with Positive Samples: %lu\n"), self->_numberOfDaysWithPositiveSamples);
  objc_msgSend(v3, "appendFormat:", CFSTR("Dataset Number of Days with Samples: %lu"), self->_numberOfDaysWithSamples);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXCandidateRelevanceModelDataStoreDatasetMetadata *v4;
  ATXCandidateRelevanceModelDataStoreDatasetMetadata *v5;
  BOOL v6;

  v4 = (ATXCandidateRelevanceModelDataStoreDatasetMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXCandidateRelevanceModelDataStoreDatasetMetadata isEqualToATXCandidateRelevanceModelDataStoreDatasetMetadata:](self, "isEqualToATXCandidateRelevanceModelDataStoreDatasetMetadata:", v5);

  return v6;
}

- (BOOL)isEqualToATXCandidateRelevanceModelDataStoreDatasetMetadata:(id)a3
{
  char *v4;
  _QWORD *v5;
  NSDate *startDate;
  NSDate *v7;
  NSDate *v8;
  NSDate *v9;
  char v10;
  char v11;
  NSDate *v13;
  NSDate *v14;

  v4 = (char *)a3;
  v5 = v4;
  if (*(_OWORD *)&self->_numberOfPositiveSamples != *(_OWORD *)(v4 + 8)
    || self->_numberOfDaysWithPositiveSamples != *((_QWORD *)v4 + 3)
    || self->_numberOfDaysWithSamples != *((_QWORD *)v4 + 4))
  {
    goto LABEL_6;
  }
  startDate = self->_startDate;
  v7 = (NSDate *)*((id *)v4 + 5);
  if (startDate == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = startDate;
    v10 = -[NSDate isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
LABEL_6:
      v11 = 0;
      goto LABEL_7;
    }
  }
  v13 = self->_endDate;
  v14 = v13;
  if (v13 == (NSDate *)v5[6])
    v11 = 1;
  else
    v11 = -[NSDate isEqual:](v13, "isEqual:");

LABEL_7:
  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXCandidateRelevanceModelDataStoreDatasetMetadata numberOfPositiveSamples](self, "numberOfPositiveSamples"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfPositiveSamples"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[ATXCandidateRelevanceModelDataStoreDatasetMetadata numberOfDaysWithPositiveSamples](self, "numberOfDaysWithPositiveSamples"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "numberOfDaysWithPositiveSamples"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "compare:", v9);

  }
  return v7;
}

- (unint64_t)numberOfPositiveSamples
{
  return self->_numberOfPositiveSamples;
}

- (unint64_t)numberOfSamples
{
  return self->_numberOfSamples;
}

- (unint64_t)numberOfDaysWithPositiveSamples
{
  return self->_numberOfDaysWithPositiveSamples;
}

- (unint64_t)numberOfDaysWithSamples
{
  return self->_numberOfDaysWithSamples;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
