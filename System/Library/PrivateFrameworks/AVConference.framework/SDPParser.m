@implementation SDPParser

- (SDPParser)initWithString:(id)a3
{
  SDPParser *v4;
  NSArray *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SDPParser;
  v4 = -[SDPParser init](&v7, sel_init);
  if (v4)
  {
    v5 = (NSArray *)(id)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("\r\n"));
    v4->_lines = v5;
    v4->_lineEnumerator = -[NSArray objectEnumerator](v5, "objectEnumerator");
    v4->_fieldNameMap = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", &unk_1E9EF77F0, CFSTR("a"), &unk_1E9EF7808, CFSTR("i"), &unk_1E9EF7820, CFSTR("c"), &unk_1E9EF7838, CFSTR("b"), &unk_1E9EF7850, CFSTR("k"), &unk_1E9EF7868, CFSTR("v"), &unk_1E9EF7880, CFSTR("m"), &unk_1E9EF7898, CFSTR("o"), &unk_1E9EF78B0,
                                          CFSTR("s"),
                                          &unk_1E9EF78C8,
                                          CFSTR("u"),
                                          &unk_1E9EF78E0,
                                          CFSTR("e"),
                                          &unk_1E9EF78F8,
                                          CFSTR("p"),
                                          &unk_1E9EF7910,
                                          CFSTR("t"),
                                          &unk_1E9EF7928,
                                          CFSTR("r"),
                                          &unk_1E9EF7940,
                                          CFSTR("z"),
                                          0);
    -[SDPParser nextLine](v4, "nextLine");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)SDPParser;
  -[SDPParser dealloc](&v3, sel_dealloc);
}

- (int)stringToMediaType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("audio")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("video")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("screen")))
    return 3;
  return -1;
}

- (BOOL)nextLine
{
  id v3;
  void *v4;
  __CFString *v5;
  id v6;
  int v7;

  v3 = -[NSEnumerator nextObject](self->_lineEnumerator, "nextObject");
  if (!v3)
    self->_parsingDone = 1;
  v4 = (void *)objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("="));
  self->_fieldName = (NSString *)objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
    v5 = &stru_1E9E58EE0;
  else
    v5 = (__CFString *)objc_msgSend((id)objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 1), "componentsJoinedByString:", CFSTR("="));
  self->_fieldValue = &v5->isa;
  v6 = -[NSDictionary objectForKeyedSubscript:](self->_fieldNameMap, "objectForKeyedSubscript:", self->_fieldName);
  if (v6)
    v7 = objc_msgSend(v6, "unsignedCharValue");
  else
    v7 = 255;
  self->_fieldType = v7;
  return v7 != 255;
}

- (BOOL)parseMediaLineHeader:(id)a3 mediaType:(int *)a4 supportedPayloads:(id)a5 rtpPort:(int *)a6
{
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  unint64_t v14;

  v10 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(" "));
  if (!a4 || !a5 || !a6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[SDPParser parseMediaLineHeader:mediaType:supportedPayloads:rtpPort:].cold.1();
    }
    return 0;
  }
  v11 = v10;
  if ((unint64_t)objc_msgSend(v10, "count") <= 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[SDPParser parseMediaLineHeader:mediaType:supportedPayloads:rtpPort:].cold.2();
    }
    return 0;
  }
  v12 = -[SDPParser stringToMediaType:](self, "stringToMediaType:", objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
  *a4 = v12;
  if (v12 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[SDPParser parseMediaLineHeader:mediaType:supportedPayloads:rtpPort:].cold.3();
    }
    return 0;
  }
  v13 = 1;
  *a6 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", 1), "intValue");
  if ((unint64_t)objc_msgSend(v11, "count") >= 4)
  {
    v14 = 3;
    do
      objc_msgSend(a5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend(v11, "objectAtIndexedSubscript:", v14++), "intValue")));
    while (v14 < objc_msgSend(v11, "count"));
    return 1;
  }
  return v13;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (NSString)fieldValue
{
  return self->_fieldValue;
}

- (unsigned)fieldType
{
  return self->_fieldType;
}

- (BOOL)parsingDone
{
  return self->_parsingDone;
}

- (void)parseMediaLineHeader:mediaType:supportedPayloads:rtpPort:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid parameters passed to parseMediaLineHeader", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)parseMediaLineHeader:mediaType:supportedPayloads:rtpPort:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Corrupted media line header", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)parseMediaLineHeader:mediaType:supportedPayloads:rtpPort:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to match the media line type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
