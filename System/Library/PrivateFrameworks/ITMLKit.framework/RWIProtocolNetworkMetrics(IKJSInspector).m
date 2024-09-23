@implementation RWIProtocolNetworkMetrics(IKJSInspector)

+ (id)ik_networkMetricsFromURLRequest:()IKJSInspector response:responseBody:timingData:
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
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

  v7 = a6;
  v8 = (objc_class *)MEMORY[0x1E0DD9658];
  v9 = a3;
  v10 = objc_alloc_init(v8);
  objc_msgSend(v7, "objectForKey:", CFSTR("_kCFNTimingDataNetworkProtocolName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("_kCFNTimingDataNetworkProtocolName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setProtocol:", v12);

  }
  objc_msgSend(v7, "objectForKey:", CFSTR("_kCFNTimingDataRemoteAddressAndPort"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("_kCFNTimingDataRemoteAddressAndPort"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRemoteAddress:", v14);

  }
  objc_msgSend(v7, "objectForKey:", CFSTR("_kCFNTimingDataConnectionInterfaceIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("_kCFNTimingDataConnectionInterfaceIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setConnectionIdentifier:", v16);

  }
  objc_msgSend(v7, "objectForKey:", CFSTR("_kCFNTimingDataResponseBodyBytesDecoded"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("_kCFNTimingDataResponseBodyBytesDecoded"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    objc_msgSend(v10, "setResponseBodyDecodedSize:");

  }
  objc_msgSend(v7, "objectForKey:", CFSTR("_kCFNTimingDataResponseBodyBytesReceived"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("_kCFNTimingDataResponseBodyBytesReceived"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    objc_msgSend(v10, "setResponseBodyBytesReceived:");

  }
  objc_msgSend(v7, "objectForKey:", CFSTR("_kCFNTimingDataRequestHeaderSize"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("_kCFNTimingDataRequestHeaderSize"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    objc_msgSend(v10, "setRequestHeaderBytesSent:");

  }
  objc_msgSend(v9, "HTTPBody");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRequestBodyBytesSent:", (double)(unint64_t)objc_msgSend(v23, "length"));

  v24 = (void *)MEMORY[0x1E0DD9648];
  objc_msgSend(v9, "allHTTPHeaderFields");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "ik_networkHeadersFromHTTPHeaderFields:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setRequestHeaders:", v26);
  return v10;
}

@end
