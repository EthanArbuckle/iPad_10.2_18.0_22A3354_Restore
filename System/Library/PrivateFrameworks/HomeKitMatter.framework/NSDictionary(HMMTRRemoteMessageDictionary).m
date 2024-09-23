@implementation NSDictionary(HMMTRRemoteMessageDictionary)

- (uint64_t)CHIPEndpointID
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("endpointId"));
}

- (uint64_t)CHIPClusterID
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("clusterId"));
}

- (uint64_t)CHIPAttributeID
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("attributeId"));
}

- (uint64_t)CHIPCommandID
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("commandId"));
}

- (uint64_t)CHIPData
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("data"));
}

- (uint64_t)CHIPCommandFields
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("fields"));
}

- (uint64_t)CHIPMinInterval
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("minInterval"));
}

- (uint64_t)CHIPMaxInterval
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("maxInterval"));
}

- (uint64_t)CHIPTimedWriteTimeout
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("timedWriteTimeout"));
}

- (uint64_t)CHIPTimedInvokeTimeout
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("timedInvokeTimeout"));
}

- (uint64_t)CHIPRemoteMessageTimeout
{
  return objc_msgSend(a1, "hmf_numberForKey:", CFSTR("timeout"));
}

- (uint64_t)CHIPDownloadLogType
{
  return objc_msgSend(a1, "hmf_numberForKey:", CFSTR("logType"));
}

- (uint64_t)CHIPDownloadTimeout
{
  return objc_msgSend(a1, "hmf_numberForKey:", CFSTR("timeout"));
}

- (id)CHIPReadParams
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDDB680];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("params"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "decodeXPCReadParams:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)CHIPSubscribeParams
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDDB680];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("params"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "decodeXPCSubscribeParams:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)CHIPRemoteCommand
{
  return objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("command"));
}

- (id)CHIPRemoteResults
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("results"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("results"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    decodeValues(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
