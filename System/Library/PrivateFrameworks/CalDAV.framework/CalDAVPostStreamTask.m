@implementation CalDAVPostStreamTask

- (id)lossyAsciiFilename
{
  void *v2;
  void *v3;
  void *v4;

  -[CalDAVPostStreamTask filename](self, "filename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataUsingEncoding:allowLossyConversion:", 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 1);
  return v4;
}

- (id)utf8PercentEscapedFilename
{
  void *v3;
  void *v4;

  if (utf8PercentEscapedFilename_onceToken != -1)
    dispatch_once(&utf8PercentEscapedFilename_onceToken, &__block_literal_global_5);
  -[CalDAVPostStreamTask filename](self, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", utf8PercentEscapedFilename_legalCharacters);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __50__CalDAVPostStreamTask_utf8PercentEscapedFilename__block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithRange:", 97, 26);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addCharactersInRange:", 65, 26);
  objc_msgSend(v0, "addCharactersInRange:", 48, 10);
  v1 = (void *)utf8PercentEscapedFilename_legalCharacters;
  utf8PercentEscapedFilename_legalCharacters = (uint64_t)v0;

}

- (id)additionalHeaderValues
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CalDAVPostStreamTask;
  -[CoreDAVPostOrPutTask additionalHeaderValues](&v15, sel_additionalHeaderValues);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CoreDAVPostOrPutTask forceToServer](self, "forceToServer"))
  {
    -[CalDAVPostStreamTask previousScheduleTag](self, "previousScheduleTag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalDAVUtils headersFromHeaders:replacingPreconditionsWithScheduleTag:](CalDAVUtils, "headersFromHeaders:replacingPreconditionsWithScheduleTag:", v3, v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  -[CalDAVPostStreamTask filename](self, "filename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return v3;
  v7 = (void *)objc_msgSend(v3, "mutableCopy");
  -[CalDAVPostStreamTask filename](self, "filename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canBeConvertedToEncoding:", 1);

  v10 = (void *)MEMORY[0x24BDD17C8];
  if (v9)
  {
    -[CalDAVPostStreamTask filename](self, "filename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("attachment; filename=\"%@\"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CalDAVPostStreamTask lossyAsciiFilename](self, "lossyAsciiFilename");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalDAVPostStreamTask utf8PercentEscapedFilename](self, "utf8PercentEscapedFilename");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("attachment; filename=\"%@\";filename*=utf-8''%@"), v11, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "setObject:forKey:", v12, *MEMORY[0x24BE1AA70]);

  return v7;
}

- (id)requestBodyStream
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE90];
  -[CoreDAVPostOrPutTask requestDataPayload](self, "requestDataPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputStreamWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)requestBody
{
  return 0;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  return objc_alloc_init(MEMORY[0x24BE1AB78]);
}

- (id)responseData
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[CalDAVPostStreamTask responseBodyParser](self, "responseBodyParser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CalDAVPostStreamTask responseBodyParser](self, "responseBodyParser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "octetStreamData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSString)previousScheduleTag
{
  return self->_previousScheduleTag;
}

- (void)setPreviousScheduleTag:(id)a3
{
  objc_storeStrong((id *)&self->_previousScheduleTag, a3);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_storeStrong((id *)&self->_filename, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_previousScheduleTag, 0);
}

@end
