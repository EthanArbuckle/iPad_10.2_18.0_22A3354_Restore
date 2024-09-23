@implementation MKHTTPServerTiming

- (id)value
{
  MKHTTPServerTimingMetric *v3;
  MKHTTPServerTimingMetric *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (self->_response > 0.0)
  {
    v3 = -[MKHTTPServerTimingMetric initWithDuration:]([MKHTTPServerTimingMetric alloc], "initWithDuration:", self->_response);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v3, CFSTR("response"));

  }
  if (self->_import > 0.0)
  {
    v4 = -[MKHTTPServerTimingMetric initWithDuration:]([MKHTTPServerTimingMetric alloc], "initWithDuration:", self->_import);
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v4, CFSTR("import"));

  }
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v18, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v23[0] = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        objc_msgSend(v18, "objectForKeyedSubscript:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = v13;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR(";"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "addObject:", v8);
        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);

  }
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (double)import
{
  return self->_import;
}

- (void)setImport:(double)a3
{
  self->_import = a3;
}

- (double)response
{
  return self->_response;
}

- (void)setResponse:(double)a3
{
  self->_response = a3;
}

@end
