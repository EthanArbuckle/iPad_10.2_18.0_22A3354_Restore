@implementation CNAutocompleteAggdPerformanceProbe

- (CNAutocompleteAggdPerformanceProbe)init
{
  void *v3;
  const char *v4;
  void *v5;
  CNAutocompleteAggdProbe *v6;
  CNAutocompleteAggdPerformanceProbe *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("com.apple.contacts.autocomplete");
  v9[1] = CFSTR("performance");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CNAutocompleteProbeBuildKey(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[CNAutocompleteAggdProbe initWithKeyPrefix:]([CNAutocompleteAggdProbe alloc], "initWithKeyPrefix:", v5);
  v7 = -[CNAutocompleteAggdPerformanceProbe initWithAggdProbe:](self, "initWithAggdProbe:", v6);

  return v7;
}

- (CNAutocompleteAggdPerformanceProbe)initWithAggdProbe:(id)a3
{
  id v5;
  CNAutocompleteAggdPerformanceProbe *v6;
  CNAutocompleteAggdPerformanceProbe *v7;
  uint64_t v8;
  NSMutableDictionary *pendingAddData;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNAutocompleteAggdPerformanceProbe;
  v6 = -[CNAutocompleteAggdPerformanceProbe init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_aggdProbe, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    pendingAddData = v7->_pendingAddData;
    v7->_pendingAddData = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)recordNumberOfResultsReturned:(unint64_t)a3 inTimeInterval:(double)a4 forBatch:(unint64_t)a5 includesServers:(BOOL)a6
{
  _BOOL4 v6;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v6 = a6;
  v28[2] = *MEMORY[0x1E0C80C00];
  v28[0] = CFSTR("latency");
  CNAutocompleteProbeBatchKey(a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CNAutocompleteProbeBuildKey(v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v27[0] = v14;
    v27[1] = CFSTR("includingServers");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CNAutocompleteProbeBuildKey(v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v17;
  }
  v26[0] = CFSTR("numberOfResults");
  CNAutocompleteProbeBatchKey(a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CNAutocompleteProbeBuildKey(v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteAggdPerformanceProbe pendingAddData](self, "pendingAddData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v14);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteAggdPerformanceProbe pendingAddData](self, "pendingAddData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v21);

}

- (void)recordLatency:(double)a3 forResultCount:(unint64_t)a4 forSource:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("latency");
  v21[1] = a5;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a5;
  objc_msgSend(v8, "arrayWithObjects:count:", v21, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CNAutocompleteProbeBuildKey(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = CFSTR("numberOfResults");
  v20[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CNAutocompleteProbeBuildKey(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteAggdPerformanceProbe pendingAddData](self, "pendingAddData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v12);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNAutocompleteAggdPerformanceProbe pendingAddData](self, "pendingAddData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v15);

}

- (void)recordNumberOfRecentResults:(unint64_t)a3 inTimeInterval:(double)a4
{
  -[CNAutocompleteAggdPerformanceProbe recordLatency:forResultCount:forSource:](self, "recordLatency:forResultCount:forSource:", a3, CFSTR("recents"), a4);
}

- (void)recordNumberOfStewieResults:(unint64_t)a3 inTimeInterval:(double)a4
{
  -[CNAutocompleteAggdPerformanceProbe recordLatency:forResultCount:forSource:](self, "recordLatency:forResultCount:forSource:", a3, CFSTR("stewie"), a4);
}

- (void)recordNumberOfContactResults:(unint64_t)a3 inTimeInterval:(double)a4
{
  -[CNAutocompleteAggdPerformanceProbe recordLatency:forResultCount:forSource:](self, "recordLatency:forResultCount:forSource:", a3, CFSTR("contacts"), a4);
}

- (void)recordNumberOfSuggestionResults:(unint64_t)a3 inTimeInterval:(double)a4
{
  -[CNAutocompleteAggdPerformanceProbe recordLatency:forResultCount:forSource:](self, "recordLatency:forResultCount:forSource:", a3, CFSTR("suggestions"), a4);
}

- (void)recordNumberOfDirectoryServerResults:(unint64_t)a3 inTimeInterval:(double)a4
{
  -[CNAutocompleteAggdPerformanceProbe recordLatency:forResultCount:forSource:](self, "recordLatency:forResultCount:forSource:", a3, CFSTR("directoryServer"), a4);
}

- (void)recordNumberOfPredictionResults:(unint64_t)a3 inTimeInterval:(double)a4
{
  -[CNAutocompleteAggdPerformanceProbe recordLatency:forResultCount:forSource:](self, "recordLatency:forResultCount:forSource:", a3, CFSTR("duet"), a4);
}

- (void)recordNumberOfSupplementalResults:(unint64_t)a3 inTimeInterval:(double)a4
{
  -[CNAutocompleteAggdPerformanceProbe recordLatency:forResultCount:forSource:](self, "recordLatency:forResultCount:forSource:", a3, CFSTR("supplemental"), a4);
}

- (void)recordNumberOfCalendarServerResults:(unint64_t)a3 inTimeInterval:(double)a4
{
  -[CNAutocompleteAggdPerformanceProbe recordLatency:forResultCount:forSource:](self, "recordLatency:forResultCount:forSource:", a3, CFSTR("calendarServer"), a4);
}

- (void)sendData
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[CNAutocompleteAggdPerformanceProbe pendingAddData](self, "pendingAddData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__CNAutocompleteAggdPerformanceProbe_sendData__block_invoke;
  v5[3] = &unk_1E70DFAF8;
  v5[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

  -[CNAutocompleteAggdPerformanceProbe aggdProbe](self, "aggdProbe");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendData");

}

void __46__CNAutocompleteAggdPerformanceProbe_sendData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "aggdProbe");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordAddValue:forKey:", v5, v6);

}

- (CNAutocompleteAggdProbe)aggdProbe
{
  return self->_aggdProbe;
}

- (void)setAggdProbe:(id)a3
{
  objc_storeStrong((id *)&self->_aggdProbe, a3);
}

- (NSMutableDictionary)pendingAddData
{
  return self->_pendingAddData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAddData, 0);
  objc_storeStrong((id *)&self->_aggdProbe, 0);
}

@end
