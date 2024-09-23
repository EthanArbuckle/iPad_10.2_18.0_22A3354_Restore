@implementation NPTPingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTPingResult)init
{
  NPTPingResult *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NPTPingResult;
  v2 = -[NPTPingResult init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    -[NPTPingResult setPings:](v2, "setPings:", v3);

    -[NPTPingResult setAddress:](v2, "setAddress:", &stru_24C992208);
  }
  return v2;
}

- (NPTPingResult)initWithPings:(id)a3 usingAddress:(id)a4
{
  id v6;
  id v7;
  NPTPingResult *v8;
  NPTPingResult *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NPTPingResult;
  v8 = -[NPTPingResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[NPTPingResult setPings:](v8, "setPings:", v6);
    -[NPTPingResult setAddress:](v9, "setAddress:", v7);
    -[NPTPingResult populateFields](v9, "populateFields");
  }

  return v9;
}

- (void)populateFields
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[NPTPingResult setMinLatency:](self, "setMinLatency:", INFINITY);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[NPTPingResult pings](self, "pings", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v26;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "latency");
        v12 = v11;
        -[NPTPingResult minLatency](self, "minLatency");
        if (v12 < v13)
        {
          objc_msgSend(v10, "latency");
          if (v14 > 0.0)
          {
            objc_msgSend(v10, "latency");
            -[NPTPingResult setMinLatency:](self, "setMinLatency:");
          }
        }
        objc_msgSend(v10, "latency");
        v16 = v15;
        -[NPTPingResult maxLatency](self, "maxLatency");
        if (v16 > v17)
        {
          objc_msgSend(v10, "latency");
          -[NPTPingResult setMaxLatency:](self, "setMaxLatency:");
        }
        if ((objc_msgSend(v10, "wasSuccessful") & 1) != 0)
        {
          objc_msgSend(v10, "latency");
          v8 = v8 + v18;
        }
        else
        {
          ++v6;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v8 = 0.0;
  }

  -[NPTPingResult minLatency](self, "minLatency");
  if (v19 == INFINITY)
    -[NPTPingResult setMinLatency:](self, "setMinLatency:", 0.0);
  -[NPTPingResult pings](self, "pings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21 == v6)
  {
    -[NPTPingResult setMeanLatency:](self, "setMeanLatency:", 0.0);
  }
  else
  {
    -[NPTPingResult pings](self, "pings");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTPingResult setMeanLatency:](self, "setMeanLatency:", v8 / (double)(unint64_t)(objc_msgSend(v22, "count") - v6));

  }
  -[NPTPingResult pings](self, "pings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
  {
    -[NPTPingResult pings](self, "pings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTPingResult setPercentLost:](self, "setPercentLost:", (double)v6 / (double)(unint64_t)objc_msgSend(v24, "count") * 100.0);

  }
  else
  {
    -[NPTPingResult setPercentLost:](self, "setPercentLost:", 0.0);
  }

  -[NPTPingResult calculateStandardDeviation](self, "calculateStandardDeviation");
  -[NPTPingResult setStandardDeviation:](self, "setStandardDeviation:");
}

- (double)calculateStandardDeviation
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NPTPingResult pings](self, "pings", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  v5 = 0.0;
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v11, "wasSuccessful"))
        {
          objc_msgSend(v11, "latency");
          v13 = v12;
          -[NPTPingResult meanLatency](self, "meanLatency");
          v9 = v9 + (v13 - v14) * (v13 - v14);
        }
        else
        {
          ++v7;
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v9 = 0.0;
  }

  -[NPTPingResult pings](self, "pings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16 != v7)
  {
    -[NPTPingResult pings](self, "pings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = sqrt(v9 / (double)(unint64_t)(objc_msgSend(v17, "count") - v7));

  }
  return v5;
}

- (NSDictionary)asDictionary
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[NPTPingResult pings](self, "pings", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v9), "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("pings"));
  -[NPTPingResult address](self, "address");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("address"));

  v12 = (void *)MEMORY[0x24BDD16E0];
  -[NPTPingResult minLatency](self, "minLatency");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v13, CFSTR("min_latency"));

  v14 = (void *)MEMORY[0x24BDD16E0];
  -[NPTPingResult maxLatency](self, "maxLatency");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v15, CFSTR("max_latency"));

  v16 = (void *)MEMORY[0x24BDD16E0];
  -[NPTPingResult meanLatency](self, "meanLatency");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v17, CFSTR("mean_latency"));

  v18 = (void *)MEMORY[0x24BDD16E0];
  -[NPTPingResult standardDeviation](self, "standardDeviation");
  objc_msgSend(v18, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v19, CFSTR("standard_deviation"));

  v20 = (void *)MEMORY[0x24BDD16E0];
  -[NPTPingResult percentLost](self, "percentLost");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v21, CFSTR("loss_percent"));

  -[NPTPingResult error](self, "error");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[NPTPingResult error](self, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v24, CFSTR("error"));

    -[NPTPingResult error](self, "error");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "domain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v26, CFSTR("error_domain"));

    v27 = (void *)MEMORY[0x24BDD16E0];
    -[NPTPingResult error](self, "error");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithInteger:", objc_msgSend(v28, "code"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v29, CFSTR("error_code"));

  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v30;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[NPTPingResult address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("address"));

  -[NPTPingResult minLatency](self, "minLatency");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("minLatency"));
  -[NPTPingResult maxLatency](self, "maxLatency");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maxLatency"));
  -[NPTPingResult meanLatency](self, "meanLatency");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("meanLatency"));
  -[NPTPingResult standardDeviation](self, "standardDeviation");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("standardDeviation"));
  -[NPTPingResult percentLost](self, "percentLost");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("percentLost"));
  -[NPTPingResult pings](self, "pings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("pings"));

  -[NPTPingResult error](self, "error");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("error"));

}

- (NPTPingResult)initWithCoder:(id)a3
{
  id v3;
  NPTPingResult *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NPTPingResult;
  v3 = a3;
  v4 = -[NPTPingResult init](&v9, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("address"), v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPingResult setAddress:](v4, "setAddress:", v5);

  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("minLatency"));
  -[NPTPingResult setMinLatency:](v4, "setMinLatency:");
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("maxLatency"));
  -[NPTPingResult setMaxLatency:](v4, "setMaxLatency:");
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("meanLatency"));
  -[NPTPingResult setMeanLatency:](v4, "setMeanLatency:");
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("standardDeviation"));
  -[NPTPingResult setStandardDeviation:](v4, "setStandardDeviation:");
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("percentLost"));
  -[NPTPingResult setPercentLost:](v4, "setPercentLost:");
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPingResult setPings:](v4, "setPings:", v6);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("error"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPTPingResult setError:](v4, "setError:", v7);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NPTPingResult *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[NPTPingResult init](+[NPTPingResult allocWithZone:](NPTPingResult, "allocWithZone:", a3), "init");
  -[NPTPingResult address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPingResult setAddress:](v4, "setAddress:", v5);

  -[NPTPingResult minLatency](self, "minLatency");
  -[NPTPingResult setMinLatency:](v4, "setMinLatency:");
  -[NPTPingResult maxLatency](self, "maxLatency");
  -[NPTPingResult setMaxLatency:](v4, "setMaxLatency:");
  -[NPTPingResult meanLatency](self, "meanLatency");
  -[NPTPingResult setMeanLatency:](v4, "setMeanLatency:");
  -[NPTPingResult standardDeviation](self, "standardDeviation");
  -[NPTPingResult setStandardDeviation:](v4, "setStandardDeviation:");
  -[NPTPingResult percentLost](self, "percentLost");
  -[NPTPingResult setPercentLost:](v4, "setPercentLost:");
  -[NPTPingResult pings](self, "pings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPingResult setPings:](v4, "setPings:", v6);

  -[NPTPingResult error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTPingResult setError:](v4, "setError:", v7);

  return v4;
}

- (NSArray)pings
{
  return self->_pings;
}

- (void)setPings:(id)a3
{
  objc_storeStrong((id *)&self->_pings, a3);
}

- (double)minLatency
{
  return self->_minLatency;
}

- (void)setMinLatency:(double)a3
{
  self->_minLatency = a3;
}

- (double)maxLatency
{
  return self->_maxLatency;
}

- (void)setMaxLatency:(double)a3
{
  self->_maxLatency = a3;
}

- (double)meanLatency
{
  return self->_meanLatency;
}

- (void)setMeanLatency:(double)a3
{
  self->_meanLatency = a3;
}

- (double)standardDeviation
{
  return self->_standardDeviation;
}

- (void)setStandardDeviation:(double)a3
{
  self->_standardDeviation = a3;
}

- (double)percentLost
{
  return self->_percentLost;
}

- (void)setPercentLost:(double)a3
{
  self->_percentLost = a3;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_storeStrong((id *)&self->_address, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_pings, 0);
}

@end
