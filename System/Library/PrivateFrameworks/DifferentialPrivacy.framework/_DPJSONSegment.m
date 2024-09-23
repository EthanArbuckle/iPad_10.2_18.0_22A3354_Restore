@implementation _DPJSONSegment

- (_DPJSONSegment)init
{

  return 0;
}

- (_DPJSONSegment)initWithKey:(id)a3 serverAlgorithmString:(id)a4 parameterDictionary:(id)a5 records:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _DPJSONSegment *v15;
  _DPJSONSegment *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_DPJSONSegment;
  v15 = -[_DPJSONSegment init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_key, a3);
    objc_storeStrong((id *)&v16->_serverAlgorithmString, a4);
    objc_storeStrong((id *)&v16->_records, a6);
    objc_storeStrong((id *)&v16->_parameterDictionary, a5);
  }

  return v16;
}

- (id)parameterStringFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToDictionary:", MEMORY[0x1E0C9AA70]) & 1) == 0)
  {
    -[_DPJSONSegment fixDoubleValuesInDictionary:](self, "fixDoubleValuesInDictionary:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1D8256B78]();
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)fixDoubleValuesInDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v10, (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "doubleValue");
          if (floor(v12) != v12)
          {
            objc_msgSend(MEMORY[0x1E0CB3598], "numberWithDouble:");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKey:", v13, v10);

          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return v14;
}

- (id)jsonSegmentString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *context;

  context = (void *)MEMORY[0x1D8256B78](self, a2);
  -[_DPJSONSegment parameterStringFrom:](self, "parameterStringFrom:", self->_parameterDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("{\n\"algorithm\": \"%@\",\n\"key\": \"%@\",\n"), self->_serverAlgorithmString, self->_key);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "appendFormat:", CFSTR("\"parameters\": %@,\n"), v3);
  objc_msgSend(v5, "appendString:", CFSTR("\"records\": [\n"));
  v6 = (void *)objc_msgSend(&stru_1E95DA470, "mutableCopy");
  if (-[NSArray count](self->_records, "count"))
  {
    v7 = 0;
    do
    {
      v8 = (void *)MEMORY[0x1D8256B78]();
      -[NSArray objectAtIndexedSubscript:](self->_records, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "jsonString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v10);

      if (v7 >= -[NSArray count](self->_records, "count") - 1)
        v11 = CFSTR("\n");
      else
        v11 = CFSTR(",\n");
      objc_msgSend(v6, "appendString:", v11);

      objc_autoreleasePoolPop(v8);
      ++v7;
    }
    while (v7 < -[NSArray count](self->_records, "count"));
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v5, v6, CFSTR("]\n}"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v12;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)serverAlgorithmString
{
  return self->_serverAlgorithmString;
}

- (NSArray)records
{
  return self->_records;
}

- (NSDictionary)parameterDictionary
{
  return self->_parameterDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterDictionary, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_serverAlgorithmString, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
