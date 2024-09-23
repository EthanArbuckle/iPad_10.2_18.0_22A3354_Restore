@implementation HDReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDReport)init
{
  HDReport *v2;
  HDReport *v3;
  NSError *error;
  uint64_t v5;
  NSMutableArray *results;
  uint64_t v7;
  NSMutableDictionary *files;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDReport;
  v2 = -[HDReport init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    error = v2->_error;
    v2->_error = 0;
    v2->_status = 0;

    v5 = objc_opt_new();
    results = v3->_results;
    v3->_results = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    files = v3->_files;
    v3->_files = (NSMutableDictionary *)v7;

  }
  return v3;
}

- (HDReport)initWithCoder:(id)a3
{
  id v4;
  HDReport *v5;
  uint64_t v6;
  NSDate *startTime;
  uint64_t v8;
  NSDate *endTime;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *results;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *files;
  void *v21;
  uint64_t v22;
  NSDictionary *auxiliaryData;
  uint64_t v24;
  NSError *error;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HDReport;
  v5 = -[HDReport init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDReport.startTime"));
    v6 = objc_claimAutoreleasedReturnValue();
    startTime = v5->_startTime;
    v5->_startTime = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDReport.endTime"));
    v8 = objc_claimAutoreleasedReturnValue();
    endTime = v5->_endTime;
    v5->_endTime = (NSDate *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("HDReport.results"));
    v13 = objc_claimAutoreleasedReturnValue();
    results = v5->_results;
    v5->_results = (NSMutableArray *)v13;

    v15 = (void *)MEMORY[0x24BDBCF20];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("HDReport.files"));
    v19 = objc_claimAutoreleasedReturnValue();
    files = v5->_files;
    v5->_files = (NSMutableDictionary *)v19;

    HDAuxDataDecodingClassAllowList();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("HDReport.auxiliaryData"));
    v22 = objc_claimAutoreleasedReturnValue();
    auxiliaryData = v5->_auxiliaryData;
    v5->_auxiliaryData = (NSDictionary *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDReport.error"));
    v24 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v24;

    v5->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HDReport.status"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startTime;
  id v5;

  startTime = self->_startTime;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startTime, CFSTR("HDReport.startTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endTime, CFSTR("HDReport.endTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_results, CFSTR("HDReport.results"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_files, CFSTR("HDReport.files"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_auxiliaryData, CFSTR("HDReport.auxiliaryData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("HDReport.error"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("HDReport.status"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[HDReport files](self, "files");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v11);
        -[HDReport files](self, "files");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addFile:forName:", v14, v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v9);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[HDReport results](self, "results", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v5, "addResult:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v17);
  }

  -[HDReport auxiliaryData](self, "auxiliaryData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  objc_msgSend(v5, "setAuxiliaryData:", v21);

  -[HDReport startTime](self, "startTime");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  objc_msgSend(v5, "setStartTime:", v23);

  -[HDReport endTime](self, "endTime");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
  objc_msgSend(v5, "setEndTime:", v25);

  -[HDReport error](self, "error");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[HDReport error](self, "error");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if ((v30 & 1) == 0)
    {
      -[HDReport error](self, "error");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "failedForError:", v31);

    }
  }
  return v5;
}

- (void)addResult:(id)a3
{
  id v4;
  HDReport *v5;
  NSMutableArray *results;
  void *v7;
  NSError *error;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSError *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSError *v25;
  uint64_t v26;
  id v27;

  v4 = a3;
  if (v4)
  {
    v27 = v4;
    v5 = self;
    objc_sync_enter(v5);
    results = v5->_results;
    v7 = (void *)objc_msgSend(v27, "copy");
    -[NSMutableArray addObject:](results, "addObject:", v7);

    if (objc_msgSend(v27, "valueWithinLimits"))
    {
      if (!v5->_status)
        v5->_status = 1;
      goto LABEL_11;
    }
    v5->_status = -1;
    error = v5->_error;
    if (error)
    {
      if (-[NSError code](error, "code") == 7)
      {
        -[NSError domain](v5->_error, "domain");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.osdiags.hardware-diagnostics.ErrorDomain"));

        if (v10)
        {
          HDCreateError(CFSTR("com.apple.osdiags.hardware-diagnostics.ErrorDomain"), 7, CFSTR("Multiple limit failures"), v11, v12, v13, v14, v15, v26);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = v5->_error;
          v5->_error = (NSError *)v16;

LABEL_11:
          objc_sync_exit(v5);

          v4 = v27;
          goto LABEL_12;
        }
      }
      if (v5->_error)
        goto LABEL_11;
    }
    objc_msgSend(v27, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HDCreateError(CFSTR("com.apple.osdiags.hardware-diagnostics.ErrorDomain"), 7, CFSTR("Measurement (%@) out of limits"), v19, v20, v21, v22, v23, (uint64_t)v18);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v5->_error;
    v5->_error = (NSError *)v24;

    goto LABEL_11;
  }
LABEL_12:

}

- (void)addFile:(id)a3 forName:(id)a4
{
  id v6;
  HDReport *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_files, "setObject:forKeyedSubscript:", v8, v6);
  objc_sync_exit(v7);

}

- (NSDictionary)files
{
  HDReport *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableDictionary copy](v2->_files, "copy");
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (NSArray)results
{
  HDReport *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:copyItems:", v2->_results, 1);
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (BOOL)attemptToSetPassed
{
  HDReport *v2;
  int64_t status;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  status = v2->_status;
  if (status != -1)
    v2->_status = 1;
  v4 = status != -1;
  objc_sync_exit(v2);

  return v4;
}

- (void)failedForError:(id)a3
{
  HDReport *v5;
  id v6;

  v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v5->_status = -1;
  if (v6)
    objc_storeStrong((id *)&v5->_error, a3);
  objc_sync_exit(v5);

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  NSError *error;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDateStyle:", 2);
  objc_msgSend(v4, "setTimeStyle:", 4);
  if (self->_startTime)
  {
    objc_msgSend(v4, "stringFromDate:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("start-time"));

  }
  if (self->_endTime)
  {
    objc_msgSend(v4, "stringFromDate:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("end-time"));

  }
  v7 = self->_status + 1;
  if (v7 > 2)
    v8 = 0;
  else
    v8 = off_24F252FB0[v7];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("status"));
  if (-[NSDictionary count](self->_auxiliaryData, "count"))
  {
    v9 = (void *)-[NSDictionary copy](self->_auxiliaryData, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("auxiliary-data"));

  }
  error = self->_error;
  if (error)
  {
    -[NSError dictionaryRepresentation](error, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("error"));

  }
  if (-[NSMutableDictionary count](self->_files, "count"))
  {
    v32 = v4;
    v12 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v13 = self->_files;
    v14 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v38 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_files, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "path");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v18);

        }
        v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v15);
    }

    v21 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("files"));

    v4 = v32;
  }
  if (-[NSMutableArray count](self->_results, "count"))
  {
    v22 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v23 = self->_results;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v34 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "dictionaryRepresentation");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v28);

        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v25);
    }

    v29 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("results"));

  }
  v30 = (void *)objc_msgSend(v3, "copy");

  return v30;
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

- (NSDictionary)auxiliaryData
{
  return self->_auxiliaryData;
}

- (void)setAuxiliaryData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_auxiliaryData, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
