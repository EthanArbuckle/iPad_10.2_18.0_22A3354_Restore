@implementation HDExperimentResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDExperimentResult)init
{
  HDExperimentResult *v2;
  uint64_t v3;
  NSMutableDictionary *measurements;
  uint64_t v5;
  NSMutableDictionary *auxiliaryData;
  uint64_t v7;
  NSMutableDictionary *files;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDExperimentResult;
  v2 = -[HDExperimentResult init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    measurements = v2->_measurements;
    v2->_measurements = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    auxiliaryData = v2->_auxiliaryData;
    v2->_auxiliaryData = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    files = v2->_files;
    v2->_files = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (HDExperimentResult)initWithCoder:(id)a3
{
  id v4;
  HDExperimentResult *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *measurements;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *auxiliaryData;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *files;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HDExperimentResult;
  v5 = -[HDExperimentResult init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("HDExperimentResult.measurement"));
    v10 = objc_claimAutoreleasedReturnValue();
    measurements = v5->_measurements;
    v5->_measurements = (NSMutableDictionary *)v10;

    HDAuxDataDecodingClassAllowList();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("HDExperimentResult.auxiliaryData"));
    v13 = objc_claimAutoreleasedReturnValue();
    auxiliaryData = v5->_auxiliaryData;
    v5->_auxiliaryData = (NSMutableDictionary *)v13;

    v15 = (void *)MEMORY[0x24BDBCF20];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("HDExperimentResult.files"));
    v19 = objc_claimAutoreleasedReturnValue();
    files = v5->_files;
    v5->_files = (NSMutableDictionary *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *measurements;
  id v5;

  measurements = self->_measurements;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", measurements, CFSTR("HDExperimentResult.measurement"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_auxiliaryData, CFSTR("HDExperimentResult.auxiliaryData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_files, CFSTR("HDExperimentResult.files"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "measurements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", self->_measurements);

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
  void *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  NSMutableDictionary *obj;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  if (-[NSMutableDictionary count](self->_auxiliaryData, "count"))
  {
    v4 = (void *)-[NSMutableDictionary copy](self->_auxiliaryData, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("auxiliary-data"));

  }
  if (-[NSMutableDictionary count](self->_files, "count"))
  {
    v5 = v3;
    v6 = (void *)objc_opt_new();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v7 = self->_files;
    v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v39 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_files, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "absoluteString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);

        }
        v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      }
      while (v9);
    }

    v15 = (void *)objc_msgSend(v6, "copy");
    v3 = v5;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("files"));

  }
  if (-[NSMutableDictionary count](self->_measurements, "count"))
  {
    v30 = v3;
    v33 = (void *)objc_opt_new();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = self->_measurements;
    v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v16)
    {
      v17 = v16;
      v32 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v35 != v32)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
          v42[0] = CFSTR("value");
          v20 = (void *)MEMORY[0x24BDD16E0];
          -[NSMutableDictionary objectForKeyedSubscript:](self->_measurements, "objectForKeyedSubscript:", v19, v30);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "doubleValue");
          objc_msgSend(v20, "numberWithDouble:");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v42[1] = CFSTR("units");
          v43[0] = v22;
          -[NSMutableDictionary objectForKeyedSubscript:](self->_measurements, "objectForKeyedSubscript:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "unit");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "symbol");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v43[1] = v25;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setObject:forKey:", v26, v19);

        }
        v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      }
      while (v17);
    }

    v27 = (void *)objc_msgSend(v33, "copy");
    v3 = v30;
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v27, CFSTR("measurements"));

  }
  v28 = (void *)objc_msgSend(v3, "copy", v30);

  return v28;
}

- (BOOL)isEqual:(id)a3
{
  HDExperimentResult *v4;
  BOOL v5;

  v4 = (HDExperimentResult *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[HDExperimentResult isEqualToExperimentResult:](self, "isEqualToExperimentResult:", v4);
  }

  return v5;
}

- (BOOL)isEqualToExperimentResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  char v27;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v4 = a3;
  objc_msgSend(v4, "auxiliaryData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDExperimentResult auxiliaryData](self, "auxiliaryData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToDictionary:", v6);

  objc_msgSend(v4, "files");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDExperimentResult files](self, "files");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToDictionary:", v9);

  objc_msgSend(v4, "measurements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDExperimentResult measurements](self, "measurements");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToDictionary:", v12);

  if (v13)
  {
    v14 = v7 & v10;
  }
  else
  {
    objc_msgSend(v4, "measurements");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    -[HDExperimentResult measurements](self, "measurements");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");

    v19 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v16, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v18, "allKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v21, "isEqualToSet:", v24);

    if (v25)
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x2020000000;
      v35 = 1;
      objc_msgSend(v4, "measurements");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __48__HDExperimentResult_isEqualToExperimentResult___block_invoke;
      v29[3] = &unk_24F253038;
      v30 = v18;
      v31 = &v32;
      objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v29);

      if (*((_BYTE *)v33 + 24))
        v27 = v7;
      else
        v27 = 0;
      v14 = v27 & v10;

      _Block_object_dispose(&v32, 8);
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

void __48__HDExperimentResult_isEqualToExperimentResult___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Unexpectedly missing measurement for key %@"), v14);
LABEL_6:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_7;
  }
  objc_msgSend(v8, "unit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "canBeConvertedToUnit:", v10);

  if (!v11)
    goto LABEL_6;
  objc_msgSend(v9, "unit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "measurementByConvertingToUnit:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v13;
  if ((objc_msgSend(v13, "isEqual:", v9) & 1) == 0)
    goto LABEL_6;
LABEL_7:

}

- (NSMutableDictionary)measurements
{
  return self->_measurements;
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
  objc_storeStrong((id *)&self->_measurements, 0);
}

@end
