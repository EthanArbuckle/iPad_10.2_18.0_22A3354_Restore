@implementation NSMutableDictionary(HMMTRRemoteMessageDictionary)

- (void)setCHIPEndpointId:()HMMTRRemoteMessageDictionary clusterId:attributeId:
{
  id v8;
  id v9;

  v9 = a5;
  v8 = a4;
  objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("endpointId"));
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v8, CFSTR("clusterId"));

  objc_msgSend(a1, "setObject:forKeyedSubscript:", v9, CFSTR("attributeId"));
}

- (void)setCHIPEndpointId:()HMMTRRemoteMessageDictionary clusterId:commandId:
{
  id v8;
  id v9;

  v9 = a5;
  v8 = a4;
  objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("endpointId"));
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v8, CFSTR("clusterId"));

  objc_msgSend(a1, "setObject:forKeyedSubscript:", v9, CFSTR("commandId"));
}

- (uint64_t)setCHIPData:()HMMTRRemoteMessageDictionary
{
  return objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("data"));
}

- (uint64_t)setCHIPCommandFields:()HMMTRRemoteMessageDictionary
{
  return objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("fields"));
}

- (uint64_t)setCHIPMinInterval:()HMMTRRemoteMessageDictionary
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("minInterval"));
}

- (uint64_t)setCHIPMaxInterval:()HMMTRRemoteMessageDictionary
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("maxInterval"));
}

- (uint64_t)setCHIPTimedWriteTimeout:()HMMTRRemoteMessageDictionary
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("timedWriteTimeout"));
}

- (uint64_t)setCHIPTimedInvokeTimeout:()HMMTRRemoteMessageDictionary
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("timedInvokeTimeout"));
}

- (void)setCHIPReadParams:()HMMTRRemoteMessageDictionary
{
  id v2;

  objc_msgSend(MEMORY[0x24BDDB680], "encodeXPCReadParams:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v2, CFSTR("params"));

}

- (uint64_t)setCHIPRemoteMessageTimeout:()HMMTRRemoteMessageDictionary
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("timeout"));
}

- (uint64_t)setCHIPDownloadLogType:()HMMTRRemoteMessageDictionary
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("logType"));
}

- (uint64_t)setCHIPDownloadTimeout:()HMMTRRemoteMessageDictionary
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("logTimeout"));
}

- (void)setCHIPSubscribeParams:()HMMTRRemoteMessageDictionary
{
  id v2;

  objc_msgSend(MEMORY[0x24BDDB680], "encodeXPCSubscribeParams:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v2, CFSTR("params"));

}

- (void)setCHIPEncodedParams:()HMMTRRemoteMessageDictionary
{
  if (a3)
    return (void *)objc_msgSend(a1, "setObject:forKeyedSubscript:", a3, CFSTR("params"));
  return a1;
}

- (uint64_t)setCHIPRemoteCommand:()HMMTRRemoteMessageDictionary
{
  return objc_msgSend(a1, "setObject:forKey:", a3, CFSTR("command"));
}

- (void)setCHIPRemoteResults:()HMMTRRemoteMessageDictionary
{
  id v4;

  encodeValues(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v4, CFSTR("results"));

}

@end
