@implementation BMScreenRecordingEvent

- (BMScreenRecordingEvent)initWithIsStart:(BOOL)a3
{
  BMScreenRecordingEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BMScreenRecordingEvent;
  result = -[BMEventBase init](&v5, sel_init);
  if (result)
    result->_isStart = a3;
  return result;
}

- (NSString)description
{
  id v3;
  const __CFString *v4;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self->_isStart)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  return (NSString *)(id)objc_msgSend(v3, "initWithFormat:", CFSTR("Screen Recording event is start: %@"), v4);
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)jsonDict
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("isStart");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isStart);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMScreenRecordingEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMDeviceMetadataEvent json].cold.1(v6);

  }
  return v4;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMScreenRecordingEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMScreenRecordingEvent)initWithProto:(id)a3
{
  id v4;
  BMScreenRecordingEvent *v5;
  NSObject *v6;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[BMScreenRecordingEvent initWithProto:].cold.1((uint64_t)self, v6);

    goto LABEL_7;
  }
  self = -[BMScreenRecordingEvent initWithIsStart:](self, "initWithIsStart:", objc_msgSend(v4, "isStart"));
  v5 = self;
LABEL_8:

  return v5;
}

- (BMScreenRecordingEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBScreenRecordingEvent *v5;
  BMScreenRecordingEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBScreenRecordingEvent initWithData:]([BMPBScreenRecordingEvent alloc], "initWithData:", v4);

    self = -[BMScreenRecordingEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)proto
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setIsStart:", self->_isStart);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int isStart;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isStart = self->_isStart;
    v6 = isStart == objc_msgSend(v4, "isStart");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBScreenRecordingEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
