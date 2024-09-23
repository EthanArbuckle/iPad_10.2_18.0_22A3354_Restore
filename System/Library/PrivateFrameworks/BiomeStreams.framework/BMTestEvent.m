@implementation BMTestEvent

- (BMTestEvent)initWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  BMTestEvent *v7;
  BMTestEvent *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMTestEvent;
  v7 = -[BMEventBase init](&v10, sel_init);
  if (!v7
    || objc_msgSend(v6, "length") == 8
    && (objc_msgSend(v6, "getBytes:length:", &v7->_data, 8), v7->_data.dataVersion == a4))
  {
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BMTestEvent)initWithContent:(unsigned int)a3 dataVersion:(unsigned int)a4
{
  BMTestEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BMTestEvent;
  result = -[BMEventBase init](&v7, sel_init);
  if (result)
  {
    result->_data.dataVersion = a4;
    result->_data.content = a3;
  }
  return result;
}

- (unsigned)content
{
  return self->_data.content;
}

- (unsigned)dataVersion
{
  return self->_data.dataVersion;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  BMTestEvent *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = -[BMTestEvent initWithData:dataVersion:]([BMTestEvent alloc], "initWithData:dataVersion:", v5, v4);

  return v6;
}

- (id)serialize
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &self->_data, 8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForuint32_t:(unsigned int)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode key %@"), v11, *MEMORY[0x1E0CB2D50]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v13, a7, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  $AF15E8D926B5A27F436AB938D227AB0A *p_data;
  uint64_t dataVersion;
  id v5;

  p_data = &self->_data;
  dataVersion = self->_data.dataVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", dataVersion, CFSTR("dataVersion"));
  objc_msgSend(v5, "encodeInt32:forKey:", p_data->content, CFSTR("content"));

}

- (BMTestEvent)initWithCoder:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  BMTestEvent *v9;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("dataVersion"));
  if (-[BMTestEvent checkAndReportDecodingFailureIfNeededForuint32_t:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForuint32_t:key:coder:errorDomain:errorCode:", v7, CFSTR("dataVersion"), v4, v6, -1)|| (v8 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("content")), -[BMTestEvent checkAndReportDecodingFailureIfNeededForuint32_t:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForuint32_t:key:coder:errorDomain:errorCode:", v8, CFSTR("content"), v4, v6, -1)))
  {
    v9 = 0;
  }
  else
  {
    self = -[BMTestEvent initWithContent:dataVersion:](self, "initWithContent:dataVersion:", v8, v7);
    v9 = self;
  }

  return v9;
}

@end
