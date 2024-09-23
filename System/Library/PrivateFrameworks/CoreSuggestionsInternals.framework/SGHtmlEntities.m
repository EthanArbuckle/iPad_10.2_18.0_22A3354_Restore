@implementation SGHtmlEntities

+ (id)decodeEntities:(id)a3
{
  void *v3;
  void *v4;
  xmlParserCtxt *PushParserCtxt;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  int v10;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<"), CFSTR("&lt;"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  PushParserCtxt = htmlCreatePushParserCtxt(&htmlEntitiesSAXHandlerStruct, v4, 0, 0, 0, XML_CHAR_ENCODING_UTF8);
  v6 = htmlCtxtUseOptions(PushParserCtxt, 2107393);
  v7 = (void *)MEMORY[0x1C3BD4F6C](v6);
  v8 = objc_retainAutorelease(v3);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  v10 = strlen(v9);
  htmlParseChunk(PushParserCtxt, v9, v10, 1);
  objc_autoreleasePoolPop(v7);
  MEMORY[0x1C3BD4E1C](PushParserCtxt);

  return v4;
}

@end
