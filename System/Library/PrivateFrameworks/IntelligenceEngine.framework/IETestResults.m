@implementation IETestResults

- (int)getCount:(unint64_t)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[IETestResults results](self, "results", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "status") == a3)
          ++v5;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v5;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSArray)parseErrors
{
  return self->_parseErrors;
}

- (void)setParseErrors:(id)a3
{
  objc_storeStrong((id *)&self->_parseErrors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parseErrors, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
