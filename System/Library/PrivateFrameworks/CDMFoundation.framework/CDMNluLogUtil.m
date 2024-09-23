@implementation CDMNluLogUtil

+ (id)getLogBasePath
{
  if (+[CDMNluLogUtil getLogBasePath]::onceToken != -1)
    dispatch_once(&+[CDMNluLogUtil getLogBasePath]::onceToken, &__block_literal_global_4278);
  return (id)+[CDMNluLogUtil getLogBasePath]::value;
}

+ (id)writeNlv4RequestToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Nlv4Request-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeNlv4ParserRequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeNlv4ParserRequestWithRequest:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, a4))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeNlv4RequestToDisk:error:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s NLv4Request logged to: %@", buf, 0x16u);
    }

    v16 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *a4;
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeNlv4RequestToDisk:error:]";
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing file: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)writeNlv4ResponseToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Nlv4Response-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeNlv4ParserResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeNlv4ParserResponseWithResponse:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, a4))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeNlv4ResponseToDisk:error:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s NLv4Response logged to: %@", buf, 0x16u);
    }

    v16 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *a4;
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeNlv4ResponseToDisk:error:]";
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing file: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)writeMDRequestToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("MDRequest-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeMDRequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeMDRequestWithRequest:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, a4))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeMDRequestToDisk:error:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s MD Request logged to: %@", buf, 0x16u);
    }

    v16 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *a4;
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeMDRequestToDisk:error:]";
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing file: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)writeMDResponseToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("MDResponse-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeMDResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeMDResponseWithResponse:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, a4))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeMDResponseToDisk:error:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s MD Response logged to: %@", buf, 0x16u);
    }

    v16 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *a4;
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeMDResponseToDisk:error:]";
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing file: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)writeMRRequestToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("MRRequest-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeMRRequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeMRRequestWithRequest:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, a4))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeMRRequestToDisk:error:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s MR Request logged to: %@", buf, 0x16u);
    }

    v16 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *a4;
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeMRRequestToDisk:error:]";
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing file: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)writeMRResponseToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("MRResponse-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeMRResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeMRResponseWithResponse:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, a4))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeMRResponseToDisk:error:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s MR Response logged to: %@", buf, 0x16u);
    }

    v16 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *a4;
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeMRResponseToDisk:error:]";
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing file: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)writeSNLCRequestToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("SNLCRequest-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeITFMParserRequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeITFMParserRequestWithRequest:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, a4))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeSNLCRequestToDisk:error:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s SNLCRequest logged to: %@", buf, 0x16u);
    }

    v16 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *a4;
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeSNLCRequestToDisk:error:]";
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing file: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)writeSNLCResponseToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("SNLCResponse-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeITFMParserResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeITFMParserResponseWithResponse:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, a4))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeSNLCResponseToDisk:error:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s SNLCResponse logged to: %@", buf, 0x16u);
    }

    v16 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *a4;
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeSNLCResponseToDisk:error:]";
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing file: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)writePSCRequestToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("PSCRequest-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializePSCParserRequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializePSCParserRequestWithRequest:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, a4))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writePSCRequestToDisk:error:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s PSCRequest logged to: %@", buf, 0x16u);
    }

    v16 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *a4;
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writePSCRequestToDisk:error:]";
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing file: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)writePSCResponseToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("PSCResponse-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializePSCParserResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializePSCParserResponseWithResponse:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, a4))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writePSCResponseToDisk:error:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s PSCResponse logged to: %@", buf, 0x16u);
    }

    v16 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *a4;
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writePSCResponseToDisk:error:]";
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing file: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)writeLVCRequestToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("LVCRequest-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeITFMParserRequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeITFMParserRequestWithRequest:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, a4))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeLVCRequestToDisk:error:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s LVCRequest logged to: %@", buf, 0x16u);
    }

    v16 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *a4;
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeLVCRequestToDisk:error:]";
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: Error writing LVC request to file: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)writeLVCResponseToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("LVCResponse-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeITFMParserResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeITFMParserResponseWithResponse:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, a4))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeLVCResponseToDisk:error:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s LVCResponse logged to: %@", buf, 0x16u);
    }

    v16 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *a4;
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeLVCResponseToDisk:error:]";
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: Error writing LVC response to file: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)writeSSURequestToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("SSURequest-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeSSURequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeSSURequestWithRequest:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, a4))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeSSURequestToDisk:error:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s SSURequest logged to: %@", buf, 0x16u);
    }

    v16 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *a4;
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeSSURequestToDisk:error:]";
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: Error writing SSU request to file: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)writeSSUResponseToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("SSUResponse-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeSSUResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeSSUResponseWithResponse:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, a4))
  {
    CDMOSLoggerForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeSSUResponseToDisk:error:]";
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_21A2A0000, v15, OS_LOG_TYPE_INFO, "%s SSUResponse logged to: %@", buf, 0x16u);
    }

    v16 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = *a4;
      *(_DWORD *)buf = 136315394;
      v21 = "+[CDMNluLogUtil writeSSUResponseToDisk:error:]";
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: Error writing SSU response to file: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)writeUaaPRequestToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("UaaPRequest-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeUaaPParserRequestWithRequest:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeUaaPParserRequestWithRequest:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v15 = +[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, &v21);
  v16 = v21;
  if (v15)
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "+[CDMNluLogUtil writeUaaPRequestToDisk:error:]";
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_INFO, "%s UaaPRequest logged to: %@", buf, 0x16u);
    }

    v18 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "+[CDMNluLogUtil writeUaaPRequestToDisk:error:]";
      v24 = 2112;
      v25 = v16;
      _os_log_error_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing file: %@", buf, 0x16u);
    }

    v18 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v16);
  }

  return v18;
}

+ (id)writeUaaPResponseToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("UaaPResponse-%f.json"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "getLogBasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "pathExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeUaaPParserResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeUaaPParserResponseWithResponse:formatType:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v15 = +[CDMNluLogUtil saveProtoFile:protobufFile:error:](CDMNluLogUtil, "saveProtoFile:protobufFile:error:", v14, v12, &v21);
  v16 = v21;
  if (v15)
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "+[CDMNluLogUtil writeUaaPResponseToDisk:error:]";
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_INFO, "%s UaaPResponse logged to: %@", buf, 0x16u);
    }

    v18 = v12;
  }
  else
  {
    CDMOSLoggerForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "+[CDMNluLogUtil writeUaaPResponseToDisk:error:]";
      v24 = 2112;
      v25 = v16;
      _os_log_error_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing file: %@", buf, 0x16u);
    }

    v18 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v16);
  }

  return v18;
}

+ (id)prettyPrintResponse:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  size_t v7;
  const std::locale::facet *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  siri::ontology *v22;
  uint64_t *SharedUsoVocabManager;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  _QWORD *v32;
  const std::locale::facet *v33;
  void *locale;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  _BYTE *v45;
  void *v46;
  uint64_t v47;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  std::locale v52;
  uint64_t v53;
  unsigned __int8 v54;
  uint64_t v55;
  std::__shared_weak_count *v56;
  uint64_t v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[2];
  _QWORD v65[11];
  char v66;
  uint64_t v67;
  _BYTE v68[22];
  char v69;
  void *__p;
  char v71;
  uint64_t v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v64);
  v49 = v3;
  objc_msgSend(v3, "requestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idAsString");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");
  v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v65, (uint64_t)v6, v7);
  std::ios_base::getloc((const std::ios_base *)((char *)v65 + *(_QWORD *)(v65[0] - 24)));
  v8 = std::locale::use_facet((const std::locale *)v68, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
  std::locale::~locale((std::locale *)v68);
  std::ostream::put();
  std::ostream::flush();

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(v49, "parses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
  if (!v10)
    goto LABEL_60;
  v11 = 0;
  v12 = *(_QWORD *)v61;
  v13 = *MEMORY[0x24BEDB800];
  v51 = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v50 = MEMORY[0x24BEDB848] + 16;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v61 != v12)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v14);
      objc_msgSend(v15, "userDialogActs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count") == 0;

      if (v17)
        goto LABEL_51;
      objc_msgSend(v15, "userDialogActs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v19, "reference");
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v21 = (void *)v20;

        if (!v21)
          goto LABEL_52;
        SharedUsoVocabManager = (uint64_t *)siri::ontology::getSharedUsoVocabManager(v22);
        v24 = *SharedUsoVocabManager;
        v25 = (std::__shared_weak_count *)SharedUsoVocabManager[1];
        v58 = *SharedUsoVocabManager;
        v59 = v25;
        if (v25)
        {
          p_shared_owners = (unint64_t *)&v25->__shared_owners_;
          do
            v27 = __ldxr(p_shared_owners);
          while (__stxr(v27 + 1, p_shared_owners));
          v56 = v25;
          do
            v28 = __ldxr(p_shared_owners);
          while (__stxr(v28 + 1, p_shared_owners));
        }
        else
        {
          v56 = 0;
        }
        v55 = v24;
        objc_msgSend(v21, "toCppUsoGraph:withError:", &v55, 0);
        v29 = v56;
        if (v56)
        {
          v30 = (unint64_t *)&v56->__shared_owners_;
          do
            v31 = __ldaxr(v30);
          while (__stlxr(v31 - 1, v30));
          if (!v31)
          {
            ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
            std::__shared_weak_count::__release_weak(v29);
          }
        }
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v68);
        siri::ontology::UsoGraph::prettyPrint();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v65, (uint64_t)"Parse ", 6);
        v32 = (_QWORD *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)":", 1);
        std::ios_base::getloc((const std::ios_base *)((char *)v32 + *(_QWORD *)(*v32 - 24)));
        v33 = std::locale::use_facet(&v52, MEMORY[0x24BEDB350]);
        ((void (*)(const std::locale::facet *, uint64_t))v33->__vftable[2].~facet_0)(v33, 10);
        std::locale::~locale(&v52);
        std::ostream::put();
        std::ostream::flush();
        std::stringbuf::str();
        if ((v54 & 0x80u) == 0)
          locale = &v52;
        else
          locale = v52.__locale_;
        if ((v54 & 0x80u) == 0)
          v35 = v54;
        else
          v35 = v53;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)locale, v35);
        if ((char)v54 < 0)
          operator delete(v52.__locale_);
        *(_QWORD *)v68 = v13;
        *(_QWORD *)&v68[*(_QWORD *)(v13 - 24)] = v51;
        *(_QWORD *)&v68[8] = v50;
        if (v71 < 0)
          operator delete(__p);
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x22074405C](&v72);
        v36 = v57;
        v57 = 0;
        if (v36)
        {
          v37 = MEMORY[0x220743D5C]();
          MEMORY[0x22074408C](v37, 0x10A0C403D23BABBLL);
        }
        v38 = v59;
        if (v59)
        {
          v39 = (unint64_t *)&v59->__shared_owners_;
          do
            v40 = __ldaxr(v39);
          while (__stlxr(v40 - 1, v39));
          if (!v40)
          {
            ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
            std::__shared_weak_count::__release_weak(v38);
          }
        }

LABEL_51:
        ++v11;
        goto LABEL_52;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v19, "task");
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = v19;
        objc_msgSend(v41, "description");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_65;
      }
      CDMOSLoggerForCategory(0);
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v68 = 136315394;
        *(_QWORD *)&v68[4] = "+[CDMNluLogUtil prettyPrintResponse:]";
        *(_WORD *)&v68[12] = 2112;
        *(_QWORD *)&v68[14] = v19;
        _os_log_error_impl(&dword_21A2A0000, v42, OS_LOG_TYPE_ERROR, "%s [ERR]: Unhandled SIRINLUUserDialogAct type: %@", v68, 0x16u);
      }

LABEL_52:
      ++v14;
    }
    while (v14 != v10);
    v43 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    v10 = v43;
  }
  while (v43);
LABEL_60:

  v44 = (void *)MEMORY[0x24BDD17C8];
  std::stringbuf::str();
  if (v69 >= 0)
    v45 = v68;
  else
    v45 = *(_BYTE **)v68;
  objc_msgSend(v44, "stringWithCString:encoding:", v45, 4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v69 < 0)
    operator delete(*(void **)v68);
LABEL_65:
  v64[0] = *MEMORY[0x24BEDB7F0];
  v47 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v64 + *(_QWORD *)(v64[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v65[0] = v47;
  v65[1] = MEMORY[0x24BEDB848] + 16;
  if (v66 < 0)
    operator delete((void *)v65[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x22074405C](&v67);

  return v46;
}

+ (id)prettyPrintProtoResponse:(id)a3
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  size_t v7;
  const std::locale::facet *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  siri::ontology *v22;
  uint64_t *SharedUsoVocabManager;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  _QWORD *v32;
  const std::locale::facet *v33;
  void *locale;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  _BYTE *v44;
  void *v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id obj;
  std::locale v52;
  uint64_t v53;
  unsigned __int8 v54;
  uint64_t v55;
  std::__shared_weak_count *v56;
  uint64_t v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[2];
  _QWORD v65[11];
  char v66;
  uint64_t v67;
  _BYTE v68[22];
  char v69;
  void *__p;
  char v71;
  uint64_t v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v64);
  objc_msgSend(v3, "requestId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v3;
  objc_msgSend(v4, "idA");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");
  v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v65, (uint64_t)v6, v7);
  std::ios_base::getloc((const std::ios_base *)((char *)v65 + *(_QWORD *)(v65[0] - 24)));
  v8 = std::locale::use_facet((const std::locale *)v68, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
  std::locale::~locale((std::locale *)v68);
  std::ostream::put();
  std::ostream::flush();

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(v3, "parses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
  if (!v9)
    goto LABEL_64;
  v10 = 0;
  v11 = *(_QWORD *)v61;
  v12 = *MEMORY[0x24BEDB800];
  v49 = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v48 = MEMORY[0x24BEDB848] + 16;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v61 != v11)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v13);
      objc_msgSend(v14, "userDialogActs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count") == 0;

      if (v16)
        goto LABEL_57;
      objc_msgSend(v14, "userDialogActs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "hasAccepted"))
      {
        objc_msgSend(v18, "accepted");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "reference");
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_23:
        v21 = (void *)v20;

        if (!v21)
          goto LABEL_58;
        objc_msgSend(MEMORY[0x24BE9E368], "convertUsoGraph:", v21);
        v22 = (siri::ontology *)objc_claimAutoreleasedReturnValue();
        SharedUsoVocabManager = (uint64_t *)siri::ontology::getSharedUsoVocabManager(v22);
        v24 = *SharedUsoVocabManager;
        v25 = (std::__shared_weak_count *)SharedUsoVocabManager[1];
        v58 = *SharedUsoVocabManager;
        v59 = v25;
        if (v25)
        {
          p_shared_owners = (unint64_t *)&v25->__shared_owners_;
          do
            v27 = __ldxr(p_shared_owners);
          while (__stxr(v27 + 1, p_shared_owners));
          v56 = v25;
          do
            v28 = __ldxr(p_shared_owners);
          while (__stxr(v28 + 1, p_shared_owners));
        }
        else
        {
          v56 = 0;
        }
        v55 = v24;
        if (v22)
          -[siri::ontology toCppUsoGraph:withError:](v22, "toCppUsoGraph:withError:", &v55, 0);
        else
          v57 = 0;
        v29 = v56;
        if (v56)
        {
          v30 = (unint64_t *)&v56->__shared_owners_;
          do
            v31 = __ldaxr(v30);
          while (__stlxr(v31 - 1, v30));
          if (!v31)
          {
            ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
            std::__shared_weak_count::__release_weak(v29);
          }
        }
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v68);
        siri::ontology::UsoGraph::prettyPrint();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v65, (uint64_t)"Parse ", 6);
        v32 = (_QWORD *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)":", 1);
        std::ios_base::getloc((const std::ios_base *)((char *)v32 + *(_QWORD *)(*v32 - 24)));
        v33 = std::locale::use_facet(&v52, MEMORY[0x24BEDB350]);
        ((void (*)(const std::locale::facet *, uint64_t))v33->__vftable[2].~facet_0)(v33, 10);
        std::locale::~locale(&v52);
        std::ostream::put();
        std::ostream::flush();
        std::stringbuf::str();
        if ((v54 & 0x80u) == 0)
          locale = &v52;
        else
          locale = v52.__locale_;
        if ((v54 & 0x80u) == 0)
          v35 = v54;
        else
          v35 = v53;
        v3 = v50;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)locale, v35);
        if ((char)v54 < 0)
          operator delete(v52.__locale_);
        *(_QWORD *)v68 = v12;
        *(_QWORD *)&v68[*(_QWORD *)(v12 - 24)] = v49;
        *(_QWORD *)&v68[8] = v48;
        if (v71 < 0)
          operator delete(__p);
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x22074405C](&v72);
        v36 = v57;
        v57 = 0;
        if (v36)
        {
          v37 = MEMORY[0x220743D5C]();
          MEMORY[0x22074408C](v37, 0x10A0C403D23BABBLL);
        }
        v38 = v59;
        if (v59)
        {
          v39 = (unint64_t *)&v59->__shared_owners_;
          do
            v40 = __ldaxr(v39);
          while (__stlxr(v40 - 1, v39));
          if (!v40)
          {
            ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
            std::__shared_weak_count::__release_weak(v38);
          }
        }

LABEL_57:
        ++v10;
        goto LABEL_58;
      }
      if (objc_msgSend(v18, "hasRejected"))
      {
        objc_msgSend(v18, "rejected");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "reference");
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      if (objc_msgSend(v18, "hasCancelled"))
      {
        objc_msgSend(v18, "cancelled");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "reference");
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      if (objc_msgSend(v18, "hasUserStatedTask"))
      {
        objc_msgSend(v18, "userStatedTask");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "task");
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      if (objc_msgSend(v18, "hasWantedToRepeat"))
      {
        objc_msgSend(v18, "wantedToRepeat");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "reference");
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      if (objc_msgSend(v18, "hasAcknowledged"))
      {
        objc_msgSend(v18, "acknowledged");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "reference");
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      if (objc_msgSend(v18, "hasWantedToProceed"))
      {
        objc_msgSend(v18, "wantedToProceed");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "reference");
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      if (objc_msgSend(v18, "hasWantedToPause"))
      {
        objc_msgSend(v18, "wantedToPause");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "reference");
        v20 = objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      CDMOSLoggerForCategory(0);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v68 = 136315394;
        *(_QWORD *)&v68[4] = "+[CDMNluLogUtil prettyPrintProtoResponse:]";
        *(_WORD *)&v68[12] = 2112;
        *(_QWORD *)&v68[14] = v18;
        _os_log_error_impl(&dword_21A2A0000, v41, OS_LOG_TYPE_ERROR, "%s [ERR]: Unhandled SIRINLUExternalUserDialogAct type: %@", v68, 0x16u);
      }

LABEL_58:
      ++v13;
    }
    while (v13 != v9);
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    v9 = v42;
  }
  while (v42);
LABEL_64:

  v43 = (void *)MEMORY[0x24BDD17C8];
  std::stringbuf::str();
  if (v69 >= 0)
    v44 = v68;
  else
    v44 = *(_BYTE **)v68;
  objc_msgSend(v43, "stringWithCString:encoding:", v44, 4);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v69 < 0)
    operator delete(*(void **)v68);
  v64[0] = *MEMORY[0x24BEDB7F0];
  v46 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v64 + *(_QWORD *)(v64[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v65[0] = v46;
  v65[1] = MEMORY[0x24BEDB848] + 16;
  if (v66 < 0)
    operator delete((void *)v65[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x22074405C](&v67);

  return v45;
}

+ (void)populateErrorWithUserInfo:(id *)a3 errorMessage:(id)a4 errorCode:(int64_t)a5
{
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDMNluLogUtil"), a5, v7);
  *a3 = (id)objc_claimAutoreleasedReturnValue();

}

+ (id)loadDataFromProtobuf2File:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("error reading file: %@"), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "+[CDMNluLogUtil loadDataFromProtobuf2File:error:]";
      v14 = 2112;
      v15 = v9;
      _os_log_error_impl(&dword_21A2A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    if (a4)
      +[CDMNluLogUtil populateErrorWithUserInfo:errorMessage:errorCode:](CDMNluLogUtil, "populateErrorWithUserInfo:errorMessage:errorCode:", a4, v9, -1);

  }
  return v7;
}

+ (id)loadRequestFromProtobuf2File:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[CDMNluLogUtil loadDataFromProtobuf2File:error:](CDMNluLogUtil, "loadDataFromProtobuf2File:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("json")))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
      +[CDMProtobufConverter siriExternalNluRequestJsonToObjWithProto2Json:](_TtC13CDMFoundation20CDMProtobufConverter, "siriExternalNluRequestJsonToObjWithProto2Json:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("pb")))
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE9E080]), "initWithData:", v6);
        if (!v10)
        {
LABEL_9:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("error decoding SIRINLUEXTERNALCDMNluRequest object"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          CDMOSLoggerForCategory(0);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v15 = 136315394;
            v16 = "+[CDMNluLogUtil loadRequestFromProtobuf2File:error:]";
            v17 = 2112;
            v18 = v11;
            _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v15, 0x16u);
          }

          if (a4)
            +[CDMNluLogUtil populateErrorWithUserInfo:errorMessage:errorCode:](CDMNluLogUtil, "populateErrorWithUserInfo:errorMessage:errorCode:", a4, v11, -3);
LABEL_19:

          v10 = 0;
        }
LABEL_20:

        goto LABEL_21;
      }
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("base64")))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unhandled path extension"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        CDMOSLoggerForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v15 = 136315394;
          v16 = "+[CDMNluLogUtil loadRequestFromProtobuf2File:error:]";
          v17 = 2112;
          v18 = v11;
          _os_log_error_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v15, 0x16u);
        }

        if (a4)
          +[CDMNluLogUtil populateErrorWithUserInfo:errorMessage:errorCode:](CDMNluLogUtil, "populateErrorWithUserInfo:errorMessage:errorCode:", a4, v11, -2);
        goto LABEL_19;
      }
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedData:options:", v6, 1);
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE9E080]), "initWithData:", v8);
    }
    v10 = (void *)v9;

    if (!v10)
      goto LABEL_9;
    goto LABEL_20;
  }
  v10 = 0;
LABEL_21:

  return v10;
}

+ (id)loadSubwordEmbeddingRequestFromProtobuf2File:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[CDMNluLogUtil loadDataFromProtobuf2File:error:](CDMNluLogUtil, "loadDataFromProtobuf2File:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("json")))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
      +[CDMProtobufConverter siriExternalSubwordEmbeddingRequestJsonToObjWithProto2Json:](_TtC13CDMFoundation20CDMProtobufConverter, "siriExternalSubwordEmbeddingRequestJsonToObjWithProto2Json:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("pb")))
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE9E118]), "initWithData:", v6);
        if (!v10)
        {
LABEL_9:
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("error decoding SIRINLUEXTERNALSUBWORD_EMBEDDINGSubwordEmbeddingRequest object"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          CDMOSLoggerForCategory(0);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v15 = 136315394;
            v16 = "+[CDMNluLogUtil loadSubwordEmbeddingRequestFromProtobuf2File:error:]";
            v17 = 2112;
            v18 = v11;
            _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v15, 0x16u);
          }

          if (a4)
            +[CDMNluLogUtil populateErrorWithUserInfo:errorMessage:errorCode:](CDMNluLogUtil, "populateErrorWithUserInfo:errorMessage:errorCode:", a4, v11, -3);
LABEL_19:

          v10 = 0;
        }
LABEL_20:

        goto LABEL_21;
      }
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("base64")))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unhandled path extension"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        CDMOSLoggerForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v15 = 136315394;
          v16 = "+[CDMNluLogUtil loadSubwordEmbeddingRequestFromProtobuf2File:error:]";
          v17 = 2112;
          v18 = v11;
          _os_log_error_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v15, 0x16u);
        }

        if (a4)
          +[CDMNluLogUtil populateErrorWithUserInfo:errorMessage:errorCode:](CDMNluLogUtil, "populateErrorWithUserInfo:errorMessage:errorCode:", a4, v11, -2);
        goto LABEL_19;
      }
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedData:options:", v6, 1);
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE9E118]), "initWithData:", v8);
    }
    v10 = (void *)v9;

    if (!v10)
      goto LABEL_9;
    goto LABEL_20;
  }
  v10 = 0;
LABEL_21:

  return v10;
}

+ (id)loadCdmPlannerRequestFromProtobuf2File:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[CDMNluLogUtil loadDataFromProtobuf2File:error:](CDMNluLogUtil, "loadDataFromProtobuf2File:error:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("json")))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
      +[CDMProtobufConverter siriExternalCdmPlannerRequestJsonToObjWithProto2Json:](_TtC13CDMFoundation20CDMProtobufConverter, "siriExternalCdmPlannerRequestJsonToObjWithProto2Json:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("pb")))
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE9E090]), "initWithData:", v6);
        goto LABEL_15;
      }
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("base64")))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unhandled path extension"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        CDMOSLoggerForCategory(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v14 = 136315394;
          v15 = "+[CDMNluLogUtil loadCdmPlannerRequestFromProtobuf2File:error:]";
          v16 = 2112;
          v17 = v11;
          _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", (uint8_t *)&v14, 0x16u);
        }

        if (a4)
          +[CDMNluLogUtil populateErrorWithUserInfo:errorMessage:errorCode:](CDMNluLogUtil, "populateErrorWithUserInfo:errorMessage:errorCode:", a4, v11, -2);

        v10 = 0;
        goto LABEL_15;
      }
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedData:options:", v6, 1);
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BE9E090]), "initWithData:", v8);
    }
    v10 = (void *)v9;

LABEL_15:
    goto LABEL_16;
  }
  v10 = 0;
LABEL_16:

  return v10;
}

+ (id)loadOverrideSpansFromProtobuf2File:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id *v14;
  id *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v23;
  void *v24;
  id v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  +[CDMNluLogUtil loadDataFromProtobuf2File:error:](CDMNluLogUtil, "loadDataFromProtobuf2File:error:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(v25, "pathExtension");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isEqualToString:", CFSTR("json")))
    {
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v24, 4, a4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count", v5));
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        obj = v5;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v6)
        {
          v7 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v29 != v7)
                objc_enumerationMutation(obj);
              v9 = a4;
              objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), 0, a4);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v10, 4);
              +[CDMProtobufConverter siriInternalMatchingSpanJsonToObjWithProto2Json:](_TtC13CDMFoundation20CDMProtobufConverter, "siriInternalMatchingSpanJsonToObjWithProto2Json:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12)
              {
                objc_msgSend(v27, "addObject:", v12);
              }
              else
              {
                CDMOSLoggerForCategory(0);
                v13 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315138;
                  v33 = "+[CDMNluLogUtil loadOverrideSpansFromProtobuf2File:error:]";
                  _os_log_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_INFO, "%s [WARN]: Tried to parse a MatchingSpan from JSON for SiriVocabMatcher override but was unable to do so!", buf, 0xCu);
                }

              }
              a4 = v9;
            }
            v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v6);
        }
        v14 = a4;

        if (v27)
          goto LABEL_33;
      }
      else
      {
        v14 = a4;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("error serializing array of MatchingSpans from JSON"), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        CDMOSLoggerForCategory(0);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v33 = "+[CDMNluLogUtil loadOverrideSpansFromProtobuf2File:error:]";
          v34 = 2112;
          v35 = v18;
          _os_log_error_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
        }

        if (v14)
        {
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v18, *MEMORY[0x24BDD0FC8]);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDMNluLogUtil"), -3, v20);
          *v14 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("error decoding SIRINLUMatchingSpan objects"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CDMOSLoggerForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "+[CDMNluLogUtil loadOverrideSpansFromProtobuf2File:error:]";
        v34 = 2112;
        v35 = v16;
        _os_log_error_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
      }

      if (v14)
        +[CDMNluLogUtil populateErrorWithUserInfo:errorMessage:errorCode:](CDMNluLogUtil, "populateErrorWithUserInfo:errorMessage:errorCode:", v14, v16, -3);
    }
    else
    {
      v15 = a4;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unhandled path extension"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CDMOSLoggerForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "+[CDMNluLogUtil loadOverrideSpansFromProtobuf2File:error:]";
        v34 = 2112;
        v35 = v16;
        _os_log_error_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
      }

      if (v15)
        +[CDMNluLogUtil populateErrorWithUserInfo:errorMessage:errorCode:](CDMNluLogUtil, "populateErrorWithUserInfo:errorMessage:errorCode:", v15, v16, -2);
    }

    v27 = 0;
LABEL_33:

    goto LABEL_34;
  }
  v27 = 0;
LABEL_34:

  return v27;
}

+ (BOOL)saveSpanMatchResponseToProtobuf:(id)a3 protobufFile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
    objc_msgSend(v10, "stringWithFormat:", CFSTR("CDMSpanMatchResponse-%f.json"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "getLogBasePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v13);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "pathExtension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter serializeSpanMatchResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeSpanMatchResponseWithResponse:formatType:", v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v24 = 0;
    v17 = objc_msgSend(v16, "writeToFile:atomically:encoding:error:", v9, 1, 4, &v24);
    v18 = v24;
    if ((v17 & 1) != 0)
    {
      CDMOSLoggerForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "+[CDMNluLogUtil saveSpanMatchResponseToProtobuf:protobufFile:error:]";
        v27 = 2112;
        v28 = v9;
        _os_log_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_INFO, "%s CDMNluResponse(proto) logged to: %@", buf, 0x16u);
      }
    }
    else
    {
      CDMOSLoggerForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "+[CDMNluLogUtil saveSpanMatchResponseToProtobuf:protobufFile:error:]";
        v27 = 2112;
        v28 = v18;
        _os_log_error_impl(&dword_21A2A0000, v21, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing (response proto) file: %@", buf, 0x16u);
      }

      if (!a5)
        goto LABEL_13;
      v22 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v18, "userInfo");
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("CDMNluLogUtil"), -4, v19);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_13:
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("nil file data. Not saving file."), CFSTR("errorDescription"), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDMNluLogUtil"), -4, v20);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  v17 = 0;
LABEL_14:

  return v17;
}

+ (BOOL)saveResponseToProtobuf:(id)a3 protobufFile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
    objc_msgSend(v10, "stringWithFormat:", CFSTR("CDMNluResponse-%f.json"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "getLogBasePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v13);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "pathExtension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter nluResponseFromSIRINLUWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "nluResponseFromSIRINLUWithResponse:formatType:", v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v17 = objc_msgSend(v16, "writeToFile:atomically:encoding:error:", v9, 1, 4, &v23);
  v18 = v23;
  if ((v17 & 1) != 0)
  {
    CDMOSLoggerForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "+[CDMNluLogUtil saveResponseToProtobuf:protobufFile:error:]";
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_INFO, "%s CDMNluResponse(proto) logged to: %@", buf, 0x16u);
    }
    goto LABEL_10;
  }
  CDMOSLoggerForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "+[CDMNluLogUtil saveResponseToProtobuf:protobufFile:error:]";
    v26 = 2112;
    v27 = v18;
    _os_log_error_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing (response proto) file: %@", buf, 0x16u);
  }

  if (a5)
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v18, "userInfo");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("CDMNluLogUtil"), -4, v19);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  }
  return v17;
}

+ (BOOL)saveResponseToProtobuf2:(id)a3 protobufFile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
    objc_msgSend(v10, "stringWithFormat:", CFSTR("CDMSIRINLUEXTERNALCDMNluResponse-%f.json"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "getLogBasePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v13);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v9, "pathExtension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CDMProtobufConverter nluResponseFromSIRINLUEXTERNALCDMNluResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "nluResponseFromSIRINLUEXTERNALCDMNluResponseWithResponse:formatType:", v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v17 = objc_msgSend(v16, "writeToFile:atomically:encoding:error:", v9, 1, 4, &v23);
  v18 = v23;
  if ((v17 & 1) != 0)
  {
    CDMOSLoggerForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "+[CDMNluLogUtil saveResponseToProtobuf2:protobufFile:error:]";
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_21A2A0000, v19, OS_LOG_TYPE_INFO, "%s CDMNluResponse(proto) logged to: %@", buf, 0x16u);
    }
    goto LABEL_10;
  }
  CDMOSLoggerForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "+[CDMNluLogUtil saveResponseToProtobuf2:protobufFile:error:]";
    v26 = 2112;
    v27 = v18;
    _os_log_error_impl(&dword_21A2A0000, v20, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing (response proto) file: %@", buf, 0x16u);
  }

  if (a5)
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v18, "userInfo");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("CDMNluLogUtil"), -4, v19);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  }
  return v17;
}

+ (BOOL)saveProtoFile:(id)a3 protobufFile:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  char v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v15 = 0;
  v9 = objc_msgSend(v7, "writeToFile:atomically:encoding:error:", v8, 1, 4, &v15);
  v10 = v15;
  if ((v9 & 1) != 0)
  {
    CDMOSLoggerForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "+[CDMNluLogUtil saveProtoFile:protobufFile:error:]";
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_21A2A0000, v11, OS_LOG_TYPE_INFO, "%s Successfully logged protobuf to: %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  CDMOSLoggerForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "+[CDMNluLogUtil saveProtoFile:protobufFile:error:]";
    v18 = 2112;
    v19 = v10;
    _os_log_error_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing proto file: %@", buf, 0x16u);
  }

  if (a5)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v10, "userInfo");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("CDMNluLogUtil"), -4, v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:

  }
  return v9;
}

+ (BOOL)saveString:(id)a3 toFile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSince1970");
    objc_msgSend(v10, "stringWithFormat:", CFSTR("CDMNluResponse-%f.json"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "getLogBasePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v13);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  v21 = 0;
  v15 = objc_msgSend(v8, "writeToFile:atomically:encoding:error:", v9, 1, 4, &v21);
  v16 = v21;
  if ((v15 & 1) != 0)
  {
    CDMOSLoggerForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v23 = "+[CDMNluLogUtil saveString:toFile:error:]";
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_21A2A0000, v17, OS_LOG_TYPE_INFO, "%s CDMNluResponse(proto) logged to: %@", buf, 0x16u);
    }
    goto LABEL_10;
  }
  CDMOSLoggerForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "+[CDMNluLogUtil saveString:toFile:error:]";
    v24 = 2112;
    v25 = v16;
    _os_log_error_impl(&dword_21A2A0000, v18, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing (response proto) file: %@", buf, 0x16u);
  }

  if (a5)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v16, "userInfo");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("CDMNluLogUtil"), -4, v17);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

  }
  return v15;
}

+ (BOOL)savePreprocessingWrapperJson:(id)a3 toFile:(id)a4 error:(id *)a5
{
  __CFString *v7;
  void *v8;
  void *v9;
  char v10;
  __CFString *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = (__CFString *)a4;
  +[CDMProtobufConverter serializePreprocessingWrapperWithWrapper:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializePreprocessingWrapperWithWrapper:formatType:", a3, CFSTR("json"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "+[CDMNluLogUtil savePreprocessingWrapperJson:toFile:error:]";
      v20 = 2112;
      v21 = CFSTR("Nil content when PreprocessingWrapper(proto) was serialized");
      _os_log_error_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    if (a5)
      +[CDMNluLogUtil populateErrorWithUserInfo:errorMessage:errorCode:](CDMNluLogUtil, "populateErrorWithUserInfo:errorMessage:errorCode:", a5, CFSTR("Nil content when PreprocessingWrapper(proto) was serialized"), -1);
    v11 = 0;
    goto LABEL_15;
  }
  v17 = 0;
  v10 = objc_msgSend(v8, "writeToFile:atomically:encoding:error:", v7, 1, 4, &v17);
  v11 = (__CFString *)v17;
  if ((v10 & 1) != 0)
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "+[CDMNluLogUtil savePreprocessingWrapperJson:toFile:error:]";
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s CDMPreprocessingWrapper(proto) logged to: %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  CDMOSLoggerForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "+[CDMNluLogUtil savePreprocessingWrapperJson:toFile:error:]";
    v20 = 2112;
    v21 = v11;
    _os_log_error_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing (response proto) file: %@", buf, 0x16u);
  }

  if (!a5)
  {
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  v15 = (void *)MEMORY[0x24BDD1540];
  -[__CFString userInfo](v11, "userInfo");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("CDMNluLogUtil"), -4, v12);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_16:
  return v10;
}

+ (BOOL)saveSubwordEmbeddingResponseJson:(id)a3 toFile:(id)a4 error:(id *)a5
{
  __CFString *v7;
  void *v8;
  void *v9;
  char v10;
  __CFString *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = (__CFString *)a4;
  +[CDMProtobufConverter serializeExternalSubwordEmbeddingResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeExternalSubwordEmbeddingResponseWithResponse:formatType:", a3, CFSTR("json"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "+[CDMNluLogUtil saveSubwordEmbeddingResponseJson:toFile:error:]";
      v20 = 2112;
      v21 = CFSTR("Nil content when SubwordEmbeddingResponse(proto) was serialized");
      _os_log_error_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    if (a5)
      +[CDMNluLogUtil populateErrorWithUserInfo:errorMessage:errorCode:](CDMNluLogUtil, "populateErrorWithUserInfo:errorMessage:errorCode:", a5, CFSTR("Nil content when SubwordEmbeddingResponse(proto) was serialized"), -1);
    v11 = 0;
    goto LABEL_15;
  }
  v17 = 0;
  v10 = objc_msgSend(v8, "writeToFile:atomically:encoding:error:", v7, 1, 4, &v17);
  v11 = (__CFString *)v17;
  if ((v10 & 1) != 0)
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "+[CDMNluLogUtil saveSubwordEmbeddingResponseJson:toFile:error:]";
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s SubwordEmbeddingResponse(proto) logged to: %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  CDMOSLoggerForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "+[CDMNluLogUtil saveSubwordEmbeddingResponseJson:toFile:error:]";
    v20 = 2112;
    v21 = v11;
    _os_log_error_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing (response proto) file: %@", buf, 0x16u);
  }

  if (!a5)
  {
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  v15 = (void *)MEMORY[0x24BDD1540];
  -[__CFString userInfo](v11, "userInfo");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("CDMNluLogUtil"), -4, v12);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_16:
  return v10;
}

+ (BOOL)saveCdmPlannerResponseJson:(id)a3 toFile:(id)a4 error:(id *)a5
{
  __CFString *v7;
  void *v8;
  void *v9;
  char v10;
  __CFString *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = (__CFString *)a4;
  +[CDMProtobufConverter serializeExternalCdmPlannerResponseWithResponse:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializeExternalCdmPlannerResponseWithResponse:formatType:", a3, CFSTR("json"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    CDMOSLoggerForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "+[CDMNluLogUtil saveCdmPlannerResponseJson:toFile:error:]";
      v20 = 2112;
      v21 = CFSTR("Nil content when CdmPlannerResponse(proto) was serialized");
      _os_log_error_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", buf, 0x16u);
    }

    if (a5)
      +[CDMNluLogUtil populateErrorWithUserInfo:errorMessage:errorCode:](CDMNluLogUtil, "populateErrorWithUserInfo:errorMessage:errorCode:", a5, CFSTR("Nil content when CdmPlannerResponse(proto) was serialized"), -1);
    v11 = 0;
    goto LABEL_15;
  }
  v17 = 0;
  v10 = objc_msgSend(v8, "writeToFile:atomically:encoding:error:", v7, 1, 4, &v17);
  v11 = (__CFString *)v17;
  if ((v10 & 1) != 0)
  {
    CDMOSLoggerForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "+[CDMNluLogUtil saveCdmPlannerResponseJson:toFile:error:]";
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_21A2A0000, v12, OS_LOG_TYPE_INFO, "%s CdmPlannerResponse(proto) logged to: %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  CDMOSLoggerForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "+[CDMNluLogUtil saveCdmPlannerResponseJson:toFile:error:]";
    v20 = 2112;
    v21 = v11;
    _os_log_error_impl(&dword_21A2A0000, v14, OS_LOG_TYPE_ERROR, "%s [ERR]: error writing (response proto) file: %@", buf, 0x16u);
  }

  if (!a5)
  {
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  v15 = (void *)MEMORY[0x24BDD1540];
  -[__CFString userInfo](v11, "userInfo");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("CDMNluLogUtil"), -4, v12);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

LABEL_16:
  return v10;
}

+ (BOOL)saveCLIResult:(id)a3 protobufFile:(id)a4 preprocess:(BOOL)a5 saveBinary:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  id v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  const char *v28;
  id v29;
  const char *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v37;
  uint64_t v38;

  v8 = a6;
  v9 = a5;
  v11 = a3;
  v12 = a4;
  if (v8)
  {
    if (v9)
    {
      objc_msgSend(v11, "preprocessingWrapper");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = (void *)MEMORY[0x24BE9E320];
      objc_msgSend(v11, "nluResponse");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "convertFromNluResponse:", v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v13, "data");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "writeToFile:atomically:", v12, 1);
    if ((v24 & 1) != 0)
    {
      printf("%s saved\n", (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to save %@"), v12);
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      puts((const char *)objc_msgSend(v35, "UTF8String"));
      +[CDMNluLogUtil populateErrorWithUserInfo:errorMessage:errorCode:](CDMNluLogUtil, "populateErrorWithUserInfo:errorMessage:errorCode:", a7, v35, -4);

    }
    v19 = 0;
  }
  else
  {
    if (v9)
    {
      objc_msgSend(v11, "preprocessingWrapper");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[CDMProtobufConverter serializePreprocessingWrapperWithWrapper:formatType:](_TtC13CDMFoundation20CDMProtobufConverter, "serializePreprocessingWrapperWithWrapper:formatType:", v14, CFSTR("json"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      +[CDMPlatformUtils prettyPrintJson:](CDMPlatformUtils, "prettyPrintJson:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_retainAutorelease(v12);
      v18 = (const char *)objc_msgSend(v17, "UTF8String");
      v19 = objc_retainAutorelease(v16);
      printf("%s result:%s\n", v18, (const char *)objc_msgSend(v19, "UTF8String"));
      v38 = 0;
      v20 = (id *)&v38;
      +[CDMNluLogUtil saveString:toFile:error:](CDMNluLogUtil, "saveString:toFile:error:", v19, v17, &v38);
    }
    else
    {
      objc_msgSend(v11, "nluResponse");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "description");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_retainAutorelease(v12);
      v28 = (const char *)objc_msgSend(v27, "UTF8String");
      v19 = objc_retainAutorelease(v26);
      printf("%s result:%s\n", v28, (const char *)objc_msgSend(v19, "UTF8String"));
      objc_msgSend(v11, "nluResponse");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v20 = (id *)&v37;
      +[CDMNluLogUtil saveResponseToProtobuf:protobufFile:error:](CDMNluLogUtil, "saveResponseToProtobuf:protobufFile:error:", v15, v27, &v37);
    }
    v29 = *v20;

    if (v29)
    {
      v30 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      objc_msgSend(v29, "localizedDescription");
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      printf("Error save %s:%s\n", v30, (const char *)objc_msgSend(v31, "UTF8String"));

      v32 = (void *)MEMORY[0x24BDBCE70];
      objc_msgSend(v29, "localizedDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "dictionaryWithObject:forKey:", v33, *MEMORY[0x24BDD0FC8]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CDMNluLogUtil"), -4, v34);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      v24 = 0;
    }
    else
    {
      v24 = 1;
    }
  }

  return v24;
}

void __31__CDMNluLogUtil_getLogBasePath__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[CDMUserDefaultsUtils readCustomLogPath](CDMUserDefaultsUtils, "readCustomLogPath");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[CDMNluLogUtil getLogBasePath]::value;
  +[CDMNluLogUtil getLogBasePath]::value = v0;

}

@end
