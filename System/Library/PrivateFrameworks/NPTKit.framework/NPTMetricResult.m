@implementation NPTMetricResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)asDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSError *error;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setValue:forKey:", self->_fetchDate, CFSTR("fetch_date"));
  objc_msgSend(v3, "setValue:forKey:", self->_protocolName, CFSTR("protocol_name"));
  objc_msgSend(v3, "setValue:forKey:", self->_isReusedConnection, CFSTR("is_reused_connection"));
  objc_msgSend(v3, "setValue:forKey:", self->_isProxyConnection, CFSTR("is_proxy_connection"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_fileSize);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v4, CFSTR("file_size"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_speed);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("speed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_maxSpeedObserved);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v6, CFSTR("max_speed_observed"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_stableSpeed);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("stable_speed"));

  objc_msgSend(v3, "setValue:forKey:", self->_speedRating, CFSTR("speed_rating"));
  objc_msgSend(v3, "setValue:forKey:", self->_speedConfidence, CFSTR("speed_confidence"));
  objc_msgSend(v3, "setValue:forKey:", self->_latency, CFSTR("latency"));
  objc_msgSend(v3, "setValue:forKey:", self->_nqTestEndPoint, CFSTR("nq_test_end_point"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_domainLookupTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("domain_lookup_time"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_connectionTime);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v9, CFSTR("connection_time"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_secureConnectionTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v10, CFSTR("secure_connection_time"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_requestTime);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("request_time"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_requestToResponseTime);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v12, CFSTR("request_to_response_time"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_responseTime);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", v13, CFSTR("response_time"));

  objc_msgSend(v3, "setValue:forKey:", self->_cdnpop, CFSTR("cdn_pop"));
  objc_msgSend(v3, "setValue:forKey:", self->_cdnuuid, CFSTR("cdn_uuid"));
  objc_msgSend(v3, "setValue:forKey:", self->_appleClientASN, CFSTR("apple_client_asn"));
  objc_msgSend(v3, "setValue:forKey:", self->_appleClientASNCompany, CFSTR("apple_client_asn_company"));
  objc_msgSend(v3, "setValue:forKey:", self->_server, CFSTR("server"));
  objc_msgSend(v3, "setValue:forKey:", self->_isCellular, CFSTR("is_cellular"));
  objc_msgSend(v3, "setValue:forKey:", self->_isConstrained, CFSTR("is_constrained"));
  objc_msgSend(v3, "setValue:forKey:", self->_isExpensive, CFSTR("is_expensive"));
  objc_msgSend(v3, "setValue:forKey:", self->_isMultipath, CFSTR("is_multipath"));
  objc_msgSend(v3, "setValue:forKey:", self->_localAddress, CFSTR("local_address"));
  objc_msgSend(v3, "setValue:forKey:", self->_remoteAddress, CFSTR("remote_address"));
  objc_msgSend(v3, "setValue:forKey:", self->_localPort, CFSTR("local_port"));
  objc_msgSend(v3, "setValue:forKey:", self->_remotePort, CFSTR("remote_port"));
  objc_msgSend(v3, "setValue:forKey:", self->_negotiatedTLSCipherSuite, CFSTR("negotiated_tls_cipher_suite"));
  objc_msgSend(v3, "setValue:forKey:", self->_negotiatedTLSProtocolVersion, CFSTR("negotiated_tls_protocol_version"));
  objc_msgSend(v3, "setValue:forKey:", self->_interfaceServiceName, CFSTR("interface_service_name"));
  objc_msgSend(v3, "setValue:forKey:", self->_interfaceName, CFSTR("interface_name"));
  objc_msgSend(v3, "setValue:forKey:", self->_concurrentStreams, CFSTR("number_of_streams"));
  objc_msgSend(v3, "setValue:forKey:", self->_responsiveness, CFSTR("responsiveness"));
  objc_msgSend(v3, "setValue:forKey:", self->_responsivenessRating, CFSTR("responsiveness_rating"));
  objc_msgSend(v3, "setValue:forKey:", self->_responsivenessConfidence, CFSTR("responsiveness_confidence"));
  error = self->_error;
  if (error)
  {
    -[NSError localizedDescription](error, "localizedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v15, CFSTR("error"));

    -[NSError domain](self->_error, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v16, CFSTR("error_domain"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSError code](self->_error, "code"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v17, CFSTR("error_code"));

  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[NPTMetricResult fileSize](self, "fileSize"), CFSTR("fileSize"));
  -[NPTMetricResult fetchDate](self, "fetchDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fetchDate"));

  -[NPTMetricResult protocolName](self, "protocolName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("protocolName"));

  -[NPTMetricResult isReusedConnection](self, "isReusedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("isReusedConnection"));

  -[NPTMetricResult isProxyConnection](self, "isProxyConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("isProxtConnection"));

  -[NPTMetricResult domainLookupTime](self, "domainLookupTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("domainLookupTime"));
  -[NPTMetricResult connectionTime](self, "connectionTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("connectionTime"));
  -[NPTMetricResult secureConnectionTime](self, "secureConnectionTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("secureConnectionTime"));
  -[NPTMetricResult requestTime](self, "requestTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("requestTime"));
  -[NPTMetricResult requestToResponseTime](self, "requestToResponseTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("requestToResponseTime"));
  -[NPTMetricResult responseTime](self, "responseTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("responseTime"));
  -[NPTMetricResult speed](self, "speed");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("speed"));
  -[NPTMetricResult speedRating](self, "speedRating");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("speedRating"));

  -[NPTMetricResult speedConfidence](self, "speedConfidence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("speedConfidence"));

  -[NPTMetricResult latency](self, "latency");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("latency"));

  -[NPTMetricResult nqTestEndPoint](self, "nqTestEndPoint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("nqTestEndPoint"));

  -[NPTMetricResult maxSpeedObserved](self, "maxSpeedObserved");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maxSpeedObserved"));
  -[NPTMetricResult stableSpeed](self, "stableSpeed");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("stableSpeed"));
  -[NPTMetricResult cdnpop](self, "cdnpop");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("cdnpop"));

  -[NPTMetricResult cdnuuid](self, "cdnuuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("cdnuuid"));

  -[NPTMetricResult appleClientASN](self, "appleClientASN");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("appleClientASN"));

  -[NPTMetricResult appleClientASNCompany](self, "appleClientASNCompany");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("appleClientASNCompany"));

  -[NPTMetricResult server](self, "server");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("server"));

  -[NPTMetricResult isCellular](self, "isCellular");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v18, CFSTR("isCellular"));

  -[NPTMetricResult isConstrained](self, "isConstrained");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v19, CFSTR("isConstrained"));

  -[NPTMetricResult isExpensive](self, "isExpensive");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("isExpensive"));

  -[NPTMetricResult isMultipath](self, "isMultipath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("isMultipath"));

  -[NPTMetricResult localAddress](self, "localAddress");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v22, CFSTR("localAddress"));

  -[NPTMetricResult remoteAddress](self, "remoteAddress");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v23, CFSTR("remoteAddress"));

  -[NPTMetricResult localPort](self, "localPort");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v24, CFSTR("localPort"));

  -[NPTMetricResult remotePort](self, "remotePort");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v25, CFSTR("remotePort"));

  -[NPTMetricResult negotiatedTLSCipherSuite](self, "negotiatedTLSCipherSuite");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v26, CFSTR("negotiatedTLSCipherSuite"));

  -[NPTMetricResult negotiatedTLSProtocolVersion](self, "negotiatedTLSProtocolVersion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v27, CFSTR("negotiatedTLSProtocolVersion"));

  -[NPTMetricResult interfaceServiceName](self, "interfaceServiceName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v28, CFSTR("interfaceServiceName"));

  -[NPTMetricResult interfaceName](self, "interfaceName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v29, CFSTR("interfaceName"));

  -[NPTMetricResult concurrentStreams](self, "concurrentStreams");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v30, CFSTR("number_of_streams"));

  -[NPTMetricResult error](self, "error");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v31, CFSTR("error"));

  -[NPTMetricResult responsiveness](self, "responsiveness");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v32, CFSTR("responsiveness"));

  -[NPTMetricResult responsivenessRating](self, "responsivenessRating");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v33, CFSTR("responsivenessRating"));

  -[NPTMetricResult responsivenessConfidence](self, "responsivenessConfidence");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v34, CFSTR("responsivenessConfidence"));

}

- (NPTMetricResult)initWithCoder:(id)a3
{
  id v3;
  NPTMetricResult *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)NPTMetricResult;
  v3 = a3;
  v4 = -[NPTMetricResult init](&v36, sel_init);
  -[NPTMetricResult setFileSize:](v4, "setFileSize:", (int)objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("fileSize"), v36.receiver, v36.super_class));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fetchDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setFetchDate:](v4, "setFetchDate:", v5);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protocolName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setProtocolName:](v4, "setProtocolName:", v6);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isReusedConnection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setIsReusedConnection:](v4, "setIsReusedConnection:", v7);

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isProxyConnection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setIsProxyConnection:](v4, "setIsProxyConnection:", v8);

  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("domainLookupTime"));
  -[NPTMetricResult setDomainLookupTime:](v4, "setDomainLookupTime:");
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("connectionTime"));
  -[NPTMetricResult setConnectionTime:](v4, "setConnectionTime:");
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("secureConnectionTime"));
  -[NPTMetricResult setSecureConnectionTime:](v4, "setSecureConnectionTime:");
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("requestTime"));
  -[NPTMetricResult setRequestTime:](v4, "setRequestTime:");
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("requestToResponseTime"));
  -[NPTMetricResult setRequestToResponseTime:](v4, "setRequestToResponseTime:");
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("responseTime"));
  -[NPTMetricResult setResponseTime:](v4, "setResponseTime:");
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("speed"));
  -[NPTMetricResult setSpeed:](v4, "setSpeed:");
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("speedRating"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setSpeedRating:](v4, "setSpeedRating:", v9);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("speedConfidence"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setSpeedConfidence:](v4, "setSpeedConfidence:", v10);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("latency"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setLatency:](v4, "setLatency:", v11);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("nqTestEndPoint"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setNqTestEndPoint:](v4, "setNqTestEndPoint:", v12);

  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("maxSpeedObserved"));
  -[NPTMetricResult setMaxSpeedObserved:](v4, "setMaxSpeedObserved:");
  objc_msgSend(v3, "decodeDoubleForKey:", CFSTR("stableSpeed"));
  -[NPTMetricResult setStableSpeed:](v4, "setStableSpeed:");
  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("cdnpop"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setCdnpop:](v4, "setCdnpop:", v13);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("cdnuuid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setCdnuuid:](v4, "setCdnuuid:", v14);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("appleClientASN"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setAppleClientASN:](v4, "setAppleClientASN:", v15);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("appleClientASNCompany"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setAppleClientASNCompany:](v4, "setAppleClientASNCompany:", v16);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("server"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setServer:](v4, "setServer:", v17);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("isCellular"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setIsCellular:](v4, "setIsCellular:", v18);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("isConstrained"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setIsConstrained:](v4, "setIsConstrained:", v19);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("isExpensive"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setIsExpensive:](v4, "setIsExpensive:", v20);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("isMultipath"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setIsMultipath:](v4, "setIsMultipath:", v21);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("localAddress"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setLocalAddress:](v4, "setLocalAddress:", v22);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("remoteAddress"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setRemoteAddress:](v4, "setRemoteAddress:", v23);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("localPort"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setLocalPort:](v4, "setLocalPort:", v24);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("remotePort"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setRemotePort:](v4, "setRemotePort:", v25);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("negotiatedTLSCipherSuite"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setNegotiatedTLSCipherSuite:](v4, "setNegotiatedTLSCipherSuite:", v26);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("negotiatedTLSProtocolVersion"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setNegotiatedTLSProtocolVersion:](v4, "setNegotiatedTLSProtocolVersion:", v27);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("interfaceServiceName"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setInterfaceServiceName:](v4, "setInterfaceServiceName:", v28);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("interfaceName"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setInterfaceName:](v4, "setInterfaceName:", v29);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("number_of_streams"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setConcurrentStreams:](v4, "setConcurrentStreams:", v30);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("error"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setError:](v4, "setError:", v31);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("responsiveness"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setResponsiveness:](v4, "setResponsiveness:", v32);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("responsivenessRating"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setResponsivenessRating:](v4, "setResponsivenessRating:", v33);

  objc_msgSend(v3, "decodeObjectForKey:", CFSTR("responsivenessConfidence"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPTMetricResult setResponsivenessConfidence:](v4, "setResponsivenessConfidence:", v34);
  return v4;
}

- (double)timeIntervalSinceDateWithLogging:(id)a3 startDate:(id)a4 nameToLog:(id)a5
{
  id v7;
  double v8;
  double v9;
  NSObject *v10;

  v7 = a5;
  if (a3 && a4)
  {
    objc_msgSend(a3, "timeIntervalSinceDate:", a4);
    v9 = v8;
  }
  else
  {
    +[NPTLogger network](NPTLogger, "network");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[NPTMetricResult timeIntervalSinceDateWithLogging:startDate:nameToLog:].cold.1((uint64_t)v7, v10);

    v9 = 0.0;
  }

  return v9;
}

- (void)populateWithMetrics:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  objc_msgSend(a3, "transactionMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v35 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSxxx"));
  objc_msgSend(v35, "fetchStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setFetchDate:](self, "setFetchDate:", v7);

  objc_msgSend(v35, "domainLookupEndDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "domainLookupStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult timeIntervalSinceDateWithLogging:startDate:nameToLog:](self, "timeIntervalSinceDateWithLogging:startDate:nameToLog:", v8, v9, CFSTR("domainLookupTime"));
  -[NPTMetricResult setDomainLookupTime:](self, "setDomainLookupTime:");

  objc_msgSend(v35, "connectEndDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "connectStartDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult timeIntervalSinceDateWithLogging:startDate:nameToLog:](self, "timeIntervalSinceDateWithLogging:startDate:nameToLog:", v10, v11, CFSTR("connectionTime"));
  -[NPTMetricResult setConnectionTime:](self, "setConnectionTime:");

  objc_msgSend(v35, "secureConnectionEndDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "secureConnectionStartDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult timeIntervalSinceDateWithLogging:startDate:nameToLog:](self, "timeIntervalSinceDateWithLogging:startDate:nameToLog:", v12, v13, CFSTR("secureConnectionTime"));
  -[NPTMetricResult setSecureConnectionTime:](self, "setSecureConnectionTime:");

  objc_msgSend(v35, "requestEndDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "requestStartDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult timeIntervalSinceDateWithLogging:startDate:nameToLog:](self, "timeIntervalSinceDateWithLogging:startDate:nameToLog:", v14, v15, CFSTR("requestTime"));
  -[NPTMetricResult setRequestTime:](self, "setRequestTime:");

  objc_msgSend(v35, "responseStartDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "requestEndDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult timeIntervalSinceDateWithLogging:startDate:nameToLog:](self, "timeIntervalSinceDateWithLogging:startDate:nameToLog:", v16, v17, CFSTR("requestToResponseTime"));
  -[NPTMetricResult setRequestToResponseTime:](self, "setRequestToResponseTime:");

  objc_msgSend(v35, "responseEndDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "responseStartDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult timeIntervalSinceDateWithLogging:startDate:nameToLog:](self, "timeIntervalSinceDateWithLogging:startDate:nameToLog:", v18, v19, CFSTR("responseTime"));
  -[NPTMetricResult setResponseTime:](self, "setResponseTime:");

  if (objc_msgSend(v35, "isProxyConnection"))
    v20 = CFSTR("true");
  else
    v20 = CFSTR("false");
  -[NPTMetricResult setIsProxyConnection:](self, "setIsProxyConnection:", v20);
  if (objc_msgSend(v35, "isReusedConnection"))
    v21 = CFSTR("true");
  else
    v21 = CFSTR("false");
  -[NPTMetricResult setIsReusedConnection:](self, "setIsReusedConnection:", v21);
  objc_msgSend(v35, "networkProtocolName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setProtocolName:](self, "setProtocolName:", v22);

  if (objc_msgSend(v35, "isCellular"))
    v23 = CFSTR("true");
  else
    v23 = CFSTR("false");
  -[NPTMetricResult setIsCellular:](self, "setIsCellular:", v23);
  if (objc_msgSend(v35, "isConstrained"))
    v24 = CFSTR("true");
  else
    v24 = CFSTR("false");
  -[NPTMetricResult setIsConstrained:](self, "setIsConstrained:", v24);
  if (objc_msgSend(v35, "isExpensive"))
    v25 = CFSTR("true");
  else
    v25 = CFSTR("false");
  -[NPTMetricResult setIsExpensive:](self, "setIsExpensive:", v25);
  if (objc_msgSend(v35, "isMultipath"))
    v26 = CFSTR("true");
  else
    v26 = CFSTR("false");
  -[NPTMetricResult setIsMultipath:](self, "setIsMultipath:", v26);
  objc_msgSend(v35, "localAddress");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setLocalAddress:](self, "setLocalAddress:", v27);

  objc_msgSend(v35, "remoteAddress");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setRemoteAddress:](self, "setRemoteAddress:", v28);

  objc_msgSend(v35, "localPort");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setLocalPort:](self, "setLocalPort:", v29);

  objc_msgSend(v35, "remotePort");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setRemotePort:](self, "setRemotePort:", v30);

  objc_msgSend(v35, "negotiatedTLSCipherSuite");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setNegotiatedTLSCipherSuite:](self, "setNegotiatedTLSCipherSuite:", v31);

  objc_msgSend(v35, "negotiatedTLSProtocolVersion");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setNegotiatedTLSProtocolVersion:](self, "setNegotiatedTLSProtocolVersion:", v32);

  objc_msgSend(v35, "interfaceServiceName");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setInterfaceServiceName:](self, "setInterfaceServiceName:", v33);

  objc_msgSend(v35, "interfaceName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setInterfaceName:](self, "setInterfaceName:", v34);

}

- (void)populateWithURLResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(a3, "allHeaderFields");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("cdnuuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setCdnuuid:](self, "setCdnuuid:", v4);

  objc_msgSend(v15, "objectForKey:", CFSTR("Server"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setServer:](self, "setServer:", v5);

  objc_msgSend(v15, "objectForKey:", CFSTR("Apple-Client-ASN"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v7, "setNumberStyle:", 0);
  objc_msgSend(v7, "numberFromString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setAppleClientASN:](self, "setAppleClientASN:", v8);

  objc_msgSend(v15, "objectForKey:", CFSTR("Apple-Client-ASN-Company"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setAppleClientASNCompany:](self, "setAppleClientASNCompany:", v9);

  objc_msgSend(v15, "objectForKey:", CFSTR("Via"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(" "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v11, "count") < 2)
  {
    if (objc_msgSend(v11, "count") != 1)
    {
      -[NPTMetricResult setCdnpop:](self, "setCdnpop:", CFSTR("Unknown"));
      goto LABEL_7;
    }
    v12 = v11;
    v13 = 0;
  }
  else
  {
    v12 = v11;
    v13 = 1;
  }
  objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setCdnpop:](self, "setCdnpop:", v14);

LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  NPTMetricResult *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v4 = -[NPTMetricResult init](+[NPTMetricResult allocWithZone:](NPTMetricResult, "allocWithZone:", a3), "init");
  -[NPTMetricResult cdnpop](self, "cdnpop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setCdnpop:](v4, "setCdnpop:", v5);

  -[NPTMetricResult server](self, "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setServer:](v4, "setServer:", v6);

  -[NPTMetricResult cdnuuid](self, "cdnuuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setCdnuuid:](v4, "setCdnuuid:", v7);

  -[NPTMetricResult appleClientASN](self, "appleClientASN");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setAppleClientASN:](v4, "setAppleClientASN:", v8);

  -[NPTMetricResult appleClientASNCompany](self, "appleClientASNCompany");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setAppleClientASNCompany:](v4, "setAppleClientASNCompany:", v9);

  -[NPTMetricResult setFileSize:](v4, "setFileSize:", -[NPTMetricResult fileSize](self, "fileSize"));
  -[NPTMetricResult fetchDate](self, "fetchDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setFetchDate:](v4, "setFetchDate:", v10);

  -[NPTMetricResult protocolName](self, "protocolName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setProtocolName:](v4, "setProtocolName:", v11);

  -[NPTMetricResult isReusedConnection](self, "isReusedConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setIsReusedConnection:](v4, "setIsReusedConnection:", v12);

  -[NPTMetricResult isProxyConnection](self, "isProxyConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setIsProxyConnection:](v4, "setIsProxyConnection:", v13);

  -[NPTMetricResult domainLookupTime](self, "domainLookupTime");
  -[NPTMetricResult setDomainLookupTime:](v4, "setDomainLookupTime:");
  -[NPTMetricResult connectionTime](self, "connectionTime");
  -[NPTMetricResult setConnectionTime:](v4, "setConnectionTime:");
  -[NPTMetricResult secureConnectionTime](self, "secureConnectionTime");
  -[NPTMetricResult setSecureConnectionTime:](v4, "setSecureConnectionTime:");
  -[NPTMetricResult requestTime](self, "requestTime");
  -[NPTMetricResult setRequestTime:](v4, "setRequestTime:");
  -[NPTMetricResult requestToResponseTime](self, "requestToResponseTime");
  -[NPTMetricResult setRequestToResponseTime:](v4, "setRequestToResponseTime:");
  -[NPTMetricResult responseTime](self, "responseTime");
  -[NPTMetricResult setResponseTime:](v4, "setResponseTime:");
  -[NPTMetricResult speed](self, "speed");
  -[NPTMetricResult setSpeed:](v4, "setSpeed:");
  -[NPTMetricResult speedRating](self, "speedRating");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setSpeedRating:](v4, "setSpeedRating:", v14);

  -[NPTMetricResult speedConfidence](self, "speedConfidence");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setSpeedConfidence:](v4, "setSpeedConfidence:", v15);

  -[NPTMetricResult latency](self, "latency");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setLatency:](v4, "setLatency:", v16);

  -[NPTMetricResult nqTestEndPoint](self, "nqTestEndPoint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setNqTestEndPoint:](v4, "setNqTestEndPoint:", v17);

  -[NPTMetricResult stableSpeed](self, "stableSpeed");
  -[NPTMetricResult setStableSpeed:](v4, "setStableSpeed:");
  -[NPTMetricResult isCellular](self, "isCellular");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setIsCellular:](v4, "setIsCellular:", v18);

  -[NPTMetricResult isExpensive](self, "isExpensive");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setIsExpensive:](v4, "setIsExpensive:", v19);

  -[NPTMetricResult isConstrained](self, "isConstrained");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setIsConstrained:](v4, "setIsConstrained:", v20);

  -[NPTMetricResult isMultipath](self, "isMultipath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setIsMultipath:](v4, "setIsMultipath:", v21);

  -[NPTMetricResult localAddress](self, "localAddress");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setLocalAddress:](v4, "setLocalAddress:", v22);

  -[NPTMetricResult remoteAddress](self, "remoteAddress");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setRemoteAddress:](v4, "setRemoteAddress:", v23);

  -[NPTMetricResult negotiatedTLSCipherSuite](self, "negotiatedTLSCipherSuite");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setNegotiatedTLSCipherSuite:](v4, "setNegotiatedTLSCipherSuite:", v24);

  -[NPTMetricResult negotiatedTLSProtocolVersion](self, "negotiatedTLSProtocolVersion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setNegotiatedTLSProtocolVersion:](v4, "setNegotiatedTLSProtocolVersion:", v25);

  -[NPTMetricResult localPort](self, "localPort");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setLocalPort:](v4, "setLocalPort:", v26);

  -[NPTMetricResult remotePort](self, "remotePort");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setRemotePort:](v4, "setRemotePort:", v27);

  -[NPTMetricResult interfaceServiceName](self, "interfaceServiceName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setInterfaceServiceName:](v4, "setInterfaceServiceName:", v28);

  -[NPTMetricResult interfaceName](self, "interfaceName");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setInterfaceName:](v4, "setInterfaceName:", v29);

  -[NPTMetricResult concurrentStreams](self, "concurrentStreams");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setConcurrentStreams:](v4, "setConcurrentStreams:", v30);

  -[NPTMetricResult error](self, "error");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setError:](v4, "setError:", v31);

  -[NPTMetricResult responsiveness](self, "responsiveness");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setResponsiveness:](v4, "setResponsiveness:", v32);

  -[NPTMetricResult responsivenessRating](self, "responsivenessRating");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setResponsivenessRating:](v4, "setResponsivenessRating:", v33);

  -[NPTMetricResult responsivenessConfidence](self, "responsivenessConfidence");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTMetricResult setResponsivenessConfidence:](v4, "setResponsivenessConfidence:", v34);

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[NPTMetricResult fetchDate](self, "fetchDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[NPTMetricResult cdnuuid](self, "cdnuuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[NPTMetricResult cdnpop](self, "cdnpop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqualToMetricResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;

  v4 = a3;
  -[NPTMetricResult fetchDate](self, "fetchDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", v6))
    goto LABEL_8;
  -[NPTMetricResult requestToResponseTime](self, "requestToResponseTime");
  v8 = v7;
  objc_msgSend(v4, "requestToResponseTime");
  if (v8 != v9)
    goto LABEL_8;
  -[NPTMetricResult requestTime](self, "requestTime");
  v11 = v10;
  objc_msgSend(v4, "requestTime");
  if (v11 == v12
    && (-[NPTMetricResult domainLookupTime](self, "domainLookupTime"),
        v14 = v13,
        objc_msgSend(v4, "domainLookupTime"),
        v14 == v15))
  {
    -[NPTMetricResult cdnuuid](self, "cdnuuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cdnuuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", v17))
    {
      -[NPTMetricResult cdnpop](self, "cdnpop");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cdnpop");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isEqualToString:", v19))
      {
        -[NPTMetricResult responseTime](self, "responseTime");
        v21 = v20;
        objc_msgSend(v4, "responseTime");
        v23 = v21 == v22;
      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
LABEL_8:
    v23 = 0;
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  NPTMetricResult *v4;
  NPTMetricResult *v5;
  BOOL v6;

  v4 = (NPTMetricResult *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[NPTMetricResult isEqualToMetricResult:](self, "isEqualToMetricResult:", v5);

  return v6;
}

- (NSString)cdnpop
{
  return self->_cdnpop;
}

- (void)setCdnpop:(id)a3
{
  objc_storeStrong((id *)&self->_cdnpop, a3);
}

- (NSString)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (NSString)cdnuuid
{
  return self->_cdnuuid;
}

- (void)setCdnuuid:(id)a3
{
  objc_storeStrong((id *)&self->_cdnuuid, a3);
}

- (NSString)appleClientASNCompany
{
  return self->_appleClientASNCompany;
}

- (void)setAppleClientASNCompany:(id)a3
{
  objc_storeStrong((id *)&self->_appleClientASNCompany, a3);
}

- (NSNumber)appleClientASN
{
  return self->_appleClientASN;
}

- (void)setAppleClientASN:(id)a3
{
  objc_storeStrong((id *)&self->_appleClientASN, a3);
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (NSString)fetchDate
{
  return self->_fetchDate;
}

- (void)setFetchDate:(id)a3
{
  objc_storeStrong((id *)&self->_fetchDate, a3);
}

- (NSString)protocolName
{
  return self->_protocolName;
}

- (void)setProtocolName:(id)a3
{
  objc_storeStrong((id *)&self->_protocolName, a3);
}

- (NSString)isReusedConnection
{
  return self->_isReusedConnection;
}

- (void)setIsReusedConnection:(id)a3
{
  objc_storeStrong((id *)&self->_isReusedConnection, a3);
}

- (NSString)isProxyConnection
{
  return self->_isProxyConnection;
}

- (void)setIsProxyConnection:(id)a3
{
  objc_storeStrong((id *)&self->_isProxyConnection, a3);
}

- (double)domainLookupTime
{
  return self->_domainLookupTime;
}

- (void)setDomainLookupTime:(double)a3
{
  self->_domainLookupTime = a3;
}

- (double)connectionTime
{
  return self->_connectionTime;
}

- (void)setConnectionTime:(double)a3
{
  self->_connectionTime = a3;
}

- (double)secureConnectionTime
{
  return self->_secureConnectionTime;
}

- (void)setSecureConnectionTime:(double)a3
{
  self->_secureConnectionTime = a3;
}

- (double)requestTime
{
  return self->_requestTime;
}

- (void)setRequestTime:(double)a3
{
  self->_requestTime = a3;
}

- (double)requestToResponseTime
{
  return self->_requestToResponseTime;
}

- (void)setRequestToResponseTime:(double)a3
{
  self->_requestToResponseTime = a3;
}

- (double)responseTime
{
  return self->_responseTime;
}

- (void)setResponseTime:(double)a3
{
  self->_responseTime = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (double)maxSpeedObserved
{
  return self->_maxSpeedObserved;
}

- (void)setMaxSpeedObserved:(double)a3
{
  self->_maxSpeedObserved = a3;
}

- (double)stableSpeed
{
  return self->_stableSpeed;
}

- (void)setStableSpeed:(double)a3
{
  self->_stableSpeed = a3;
}

- (NSNumber)speedRating
{
  return self->_speedRating;
}

- (void)setSpeedRating:(id)a3
{
  objc_storeStrong((id *)&self->_speedRating, a3);
}

- (NSNumber)speedConfidence
{
  return self->_speedConfidence;
}

- (void)setSpeedConfidence:(id)a3
{
  objc_storeStrong((id *)&self->_speedConfidence, a3);
}

- (NSNumber)responsiveness
{
  return self->_responsiveness;
}

- (void)setResponsiveness:(id)a3
{
  objc_storeStrong((id *)&self->_responsiveness, a3);
}

- (NSNumber)responsivenessRating
{
  return self->_responsivenessRating;
}

- (void)setResponsivenessRating:(id)a3
{
  objc_storeStrong((id *)&self->_responsivenessRating, a3);
}

- (NSNumber)responsivenessConfidence
{
  return self->_responsivenessConfidence;
}

- (void)setResponsivenessConfidence:(id)a3
{
  objc_storeStrong((id *)&self->_responsivenessConfidence, a3);
}

- (NSNumber)latency
{
  return self->_latency;
}

- (void)setLatency:(id)a3
{
  objc_storeStrong((id *)&self->_latency, a3);
}

- (NSString)nqTestEndPoint
{
  return self->_nqTestEndPoint;
}

- (void)setNqTestEndPoint:(id)a3
{
  objc_storeStrong((id *)&self->_nqTestEndPoint, a3);
}

- (NSString)isCellular
{
  return self->_isCellular;
}

- (void)setIsCellular:(id)a3
{
  objc_storeStrong((id *)&self->_isCellular, a3);
}

- (NSString)isExpensive
{
  return self->_isExpensive;
}

- (void)setIsExpensive:(id)a3
{
  objc_storeStrong((id *)&self->_isExpensive, a3);
}

- (NSString)isConstrained
{
  return self->_isConstrained;
}

- (void)setIsConstrained:(id)a3
{
  objc_storeStrong((id *)&self->_isConstrained, a3);
}

- (NSString)isMultipath
{
  return self->_isMultipath;
}

- (void)setIsMultipath:(id)a3
{
  objc_storeStrong((id *)&self->_isMultipath, a3);
}

- (NSString)localAddress
{
  return self->_localAddress;
}

- (void)setLocalAddress:(id)a3
{
  objc_storeStrong((id *)&self->_localAddress, a3);
}

- (NSString)remoteAddress
{
  return self->_remoteAddress;
}

- (void)setRemoteAddress:(id)a3
{
  objc_storeStrong((id *)&self->_remoteAddress, a3);
}

- (NSNumber)negotiatedTLSCipherSuite
{
  return self->_negotiatedTLSCipherSuite;
}

- (void)setNegotiatedTLSCipherSuite:(id)a3
{
  objc_storeStrong((id *)&self->_negotiatedTLSCipherSuite, a3);
}

- (NSNumber)negotiatedTLSProtocolVersion
{
  return self->_negotiatedTLSProtocolVersion;
}

- (void)setNegotiatedTLSProtocolVersion:(id)a3
{
  objc_storeStrong((id *)&self->_negotiatedTLSProtocolVersion, a3);
}

- (NSNumber)localPort
{
  return self->_localPort;
}

- (void)setLocalPort:(id)a3
{
  objc_storeStrong((id *)&self->_localPort, a3);
}

- (NSNumber)remotePort
{
  return self->_remotePort;
}

- (void)setRemotePort:(id)a3
{
  objc_storeStrong((id *)&self->_remotePort, a3);
}

- (NSString)interfaceServiceName
{
  return self->_interfaceServiceName;
}

- (void)setInterfaceServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceServiceName, a3);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceName, a3);
}

- (NSNumber)concurrentStreams
{
  return self->_concurrentStreams;
}

- (void)setConcurrentStreams:(id)a3
{
  objc_storeStrong((id *)&self->_concurrentStreams, a3);
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
  objc_storeStrong((id *)&self->_concurrentStreams, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_interfaceServiceName, 0);
  objc_storeStrong((id *)&self->_remotePort, 0);
  objc_storeStrong((id *)&self->_localPort, 0);
  objc_storeStrong((id *)&self->_negotiatedTLSProtocolVersion, 0);
  objc_storeStrong((id *)&self->_negotiatedTLSCipherSuite, 0);
  objc_storeStrong((id *)&self->_remoteAddress, 0);
  objc_storeStrong((id *)&self->_localAddress, 0);
  objc_storeStrong((id *)&self->_isMultipath, 0);
  objc_storeStrong((id *)&self->_isConstrained, 0);
  objc_storeStrong((id *)&self->_isExpensive, 0);
  objc_storeStrong((id *)&self->_isCellular, 0);
  objc_storeStrong((id *)&self->_nqTestEndPoint, 0);
  objc_storeStrong((id *)&self->_latency, 0);
  objc_storeStrong((id *)&self->_responsivenessConfidence, 0);
  objc_storeStrong((id *)&self->_responsivenessRating, 0);
  objc_storeStrong((id *)&self->_responsiveness, 0);
  objc_storeStrong((id *)&self->_speedConfidence, 0);
  objc_storeStrong((id *)&self->_speedRating, 0);
  objc_storeStrong((id *)&self->_isProxyConnection, 0);
  objc_storeStrong((id *)&self->_isReusedConnection, 0);
  objc_storeStrong((id *)&self->_protocolName, 0);
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong((id *)&self->_appleClientASN, 0);
  objc_storeStrong((id *)&self->_appleClientASNCompany, 0);
  objc_storeStrong((id *)&self->_cdnuuid, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_cdnpop, 0);
}

- (void)timeIntervalSinceDateWithLogging:(uint64_t)a1 startDate:(NSObject *)a2 nameToLog:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_20E71B000, a2, OS_LOG_TYPE_DEBUG, "%@ is NaN", (uint8_t *)&v2, 0xCu);
}

@end
