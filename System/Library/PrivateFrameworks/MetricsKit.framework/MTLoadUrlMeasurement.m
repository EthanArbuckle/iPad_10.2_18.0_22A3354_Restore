@implementation MTLoadUrlMeasurement

- (void)mark:(id)a3 time:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a3;
  objc_msgSend(v6, "numberWithLongLong:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement timestamps](self, "timestamps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);

}

- (void)setRequestUrl:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("requestUrl"));

}

- (void)setConnectionReused:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("connectionReused"));

}

- (void)setDnsServersIPAddresses:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("dnsServersIPAddresses"));

}

- (void)setEdgeNodeCacheStatus:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("edgeNodeCacheStatus"));

}

- (void)setRedirectCount:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("redirectCount"));

}

- (void)setResolvedIPAddress:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("resolvedIPAddress"));

}

- (void)setStatusCode:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("statusCode"));

}

- (void)setXpSessionDuration:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("xpSessionDuration"));

}

- (void)setXpSamplingForced:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("xpSamplingForced"));

}

- (void)setXpSamplingPercentageUsers:(double)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTPerfBaseMeasurement measurementSpecificData](self, "measurementSpecificData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("xpSamplingPercentageUsers"));

}

- (void)mark:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  -[MTLoadUrlMeasurement mark:time:](self, "mark:time:", v5, objc_msgSend(v4, "mt_longMillisecondsSince1970"));

}

- (void)mark:(id)a3 date:(id)a4
{
  id v6;

  v6 = a3;
  -[MTLoadUrlMeasurement mark:time:](self, "mark:time:", v6, objc_msgSend(a4, "mt_longMillisecondsSince1970"));

}

@end
