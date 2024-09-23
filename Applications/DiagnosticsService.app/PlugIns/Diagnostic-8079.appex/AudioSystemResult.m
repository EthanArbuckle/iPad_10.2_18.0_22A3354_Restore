@implementation AudioSystemResult

- (id)dictionaryValue
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemResult input](self, "input"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("input"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemResult output](self, "output"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("output"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemResult source](self, "source"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("source"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemResult dbValue](self, "dbValue"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AudioSystemResult dbValue](self, "dbValue"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("dbValue"));

  }
  v9 = objc_msgSend(v3, "copy");

  return v9;
}

- (NSString)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
  objc_storeStrong((id *)&self->_input, a3);
}

- (NSString)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (NSNumber)dbValue
{
  return self->_dbValue;
}

- (void)setDbValue:(id)a3
{
  objc_storeStrong((id *)&self->_dbValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbValue, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

@end
