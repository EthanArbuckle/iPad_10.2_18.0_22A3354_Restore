@implementation HDAnalysisResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDAnalysisResult)init
{
  HDAnalysisResult *v2;
  uint64_t v3;
  NSMutableArray *measuredResults;
  uint64_t v5;
  NSMutableDictionary *auxiliaryData;
  uint64_t v7;
  NSMutableDictionary *files;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDAnalysisResult;
  v2 = -[HDAnalysisResult init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    measuredResults = v2->_measuredResults;
    v2->_measuredResults = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    auxiliaryData = v2->_auxiliaryData;
    v2->_auxiliaryData = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    files = v2->_files;
    v2->_files = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (HDAnalysisResult)initWithCoder:(id)a3
{
  id v4;
  HDAnalysisResult *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *measuredResults;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *auxiliaryData;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *files;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HDAnalysisResult;
  v5 = -[HDAnalysisResult init](&v21, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HDAnalysisResult.measuredResults"));
    v9 = objc_claimAutoreleasedReturnValue();
    measuredResults = v5->_measuredResults;
    v5->_measuredResults = (NSMutableArray *)v9;

    HDAuxDataDecodingClassAllowList();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("HDAnalysisResult.auxiliaryData"));
    v12 = objc_claimAutoreleasedReturnValue();
    auxiliaryData = v5->_auxiliaryData;
    v5->_auxiliaryData = (NSMutableDictionary *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("HDAnalysisResult.files"));
    v18 = objc_claimAutoreleasedReturnValue();
    files = v5->_files;
    v5->_files = (NSMutableDictionary *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *measuredResults;
  id v5;

  measuredResults = self->_measuredResults;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", measuredResults, CFSTR("HDAnalysisResult.measuredResults"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_auxiliaryData, CFSTR("HDAnalysisResult.auxiliaryData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_files, CFSTR("HDAnalysisResult.files"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "measuredResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", self->_measuredResults);

  objc_msgSend(v4, "auxiliaryData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", self->_auxiliaryData);

  objc_msgSend(v4, "files");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", self->_files);

  return v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (-[NSMutableDictionary count](self->_auxiliaryData, "count"))
  {
    v4 = (void *)-[NSMutableDictionary copy](self->_auxiliaryData, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("auxiliary-data"));

  }
  if (-[NSMutableDictionary count](self->_files, "count"))
  {
    v5 = (void *)objc_opt_new();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v6 = self->_files;
    v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_files, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "absoluteString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);

        }
        v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v8);
    }

    v14 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("files"));

  }
  if (-[NSMutableArray count](self->_measuredResults, "count"))
  {
    v15 = (void *)objc_opt_new();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = self->_measuredResults;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "dictionaryRepresentation", (_QWORD)v25);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v18);
    }

    v22 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("measured-results"));

  }
  v23 = (void *)objc_msgSend(v3, "copy", (_QWORD)v25);

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  HDAnalysisResult *v4;
  BOOL v5;

  v4 = (HDAnalysisResult *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[HDAnalysisResult isEqualToAnalysisResult:](self, "isEqualToAnalysisResult:", v4);
  }

  return v5;
}

- (BOOL)isEqualToAnalysisResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_msgSend(v4, "measuredResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDAnalysisResult measuredResults](self, "measuredResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToArray:", v6))
  {
    objc_msgSend(v4, "auxiliaryData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDAnalysisResult auxiliaryData](self, "auxiliaryData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToDictionary:", v8))
    {
      objc_msgSend(v4, "files");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDAnalysisResult files](self, "files");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToDictionary:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSMutableArray)measuredResults
{
  return self->_measuredResults;
}

- (NSMutableDictionary)auxiliaryData
{
  return self->_auxiliaryData;
}

- (NSMutableDictionary)files
{
  return self->_files;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_auxiliaryData, 0);
  objc_storeStrong((id *)&self->_measuredResults, 0);
}

@end
