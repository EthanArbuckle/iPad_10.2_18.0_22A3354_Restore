@implementation BMSiriDictationEvent

- (BMSiriDictationEvent)initWithAbsoluteTimestamp:(double)a3
{
  return -[BMSiriDictationEvent initWithAbsoluteTimestamp:recognizedText:correctedText:](self, "initWithAbsoluteTimestamp:recognizedText:correctedText:", 0, 0, a3);
}

- (BMSiriDictationEvent)initWithAbsoluteTimestamp:(double)a3 recognizedText:(id)a4 correctedText:(id)a5
{
  id v8;
  id v9;
  BMSiriDictationEvent *v10;
  BMSiriDictationEvent *v11;
  uint64_t v12;
  NSString *recognizedText;
  uint64_t v14;
  NSString *correctedText;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BMSiriDictationEvent;
  v10 = -[BMSiriDictationEvent init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_absoluteTimestamp = a3;
    v12 = objc_msgSend(v8, "copy");
    recognizedText = v11->_recognizedText;
    v11->_recognizedText = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    correctedText = v11->_correctedText;
    v11->_correctedText = (NSString *)v14;

  }
  return v11;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  void *v7;
  NSObject *v8;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v6);
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[BMSiriDictationEvent eventWithData:dataVersion:].cold.1(a4, v8);

    v7 = 0;
  }

  return v7;
}

- (id)jsonDict
{
  void *v3;
  NSString *recognizedText;
  void *v5;
  NSString *correctedText;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("absoluteTimeStamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("recognizedText");
  recognizedText = self->_recognizedText;
  v5 = recognizedText;
  if (!recognizedText)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v5;
  v10[2] = CFSTR("correctedText");
  correctedText = self->_correctedText;
  v7 = correctedText;
  if (!correctedText)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!correctedText)
  {

    if (recognizedText)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!recognizedText)
    goto LABEL_9;
LABEL_7:

  return v8;
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
  -[BMSiriDictationEvent jsonDict](self, "jsonDict");
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

  -[BMSiriDictationEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSiriDictationEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  BMSiriDictationEvent *v10;
  NSObject *v11;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BMSiriDictationEvent initWithProto:].cold.1((uint64_t)self, v11);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "absoluteTimestamp");
  v7 = v6;
  objc_msgSend(v5, "recognizedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "correctedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  self = -[BMSiriDictationEvent initWithAbsoluteTimestamp:recognizedText:correctedText:](self, "initWithAbsoluteTimestamp:recognizedText:correctedText:", v8, v9, v7);
  v10 = self;
LABEL_8:

  return v10;
}

- (BMSiriDictationEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBSiriDictationEvent *v5;
  BMSiriDictationEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSiriDictationEvent initWithData:]([BMPBSiriDictationEvent alloc], "initWithData:", v4);

    self = -[BMSiriDictationEvent initWithProto:](self, "initWithProto:", v5);
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
  objc_msgSend(v3, "setAbsoluteTimestamp:", self->_absoluteTimestamp);
  objc_msgSend(v3, "setRecognizedText:", self->_recognizedText);
  objc_msgSend(v3, "setCorrectedText:", self->_correctedText);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  double absoluteTimestamp;
  double v8;
  NSString *recognizedText;
  void *v10;
  uint64_t v11;
  int v12;
  char v13;
  NSString *correctedText;
  NSString *v15;
  void *v16;
  void *v18;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    absoluteTimestamp = self->_absoluteTimestamp;
    objc_msgSend(v6, "absoluteTimestamp");
    if (absoluteTimestamp != v8)
    {
      v13 = 0;
LABEL_20:

      goto LABEL_21;
    }
    recognizedText = self->_recognizedText;
    v10 = recognizedText;
    if (!recognizedText)
    {
      objc_msgSend(v6, "recognizedText");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v18 = 0;
        v12 = 0;
        goto LABEL_12;
      }
      v18 = (void *)v11;
      v10 = self->_recognizedText;
    }
    objc_msgSend(v6, "recognizedText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v3) & 1) == 0)
    {

      v13 = 0;
      goto LABEL_18;
    }
    v12 = 1;
LABEL_12:
    correctedText = self->_correctedText;
    v15 = correctedText;
    if (!correctedText)
    {
      objc_msgSend(v6, "correctedText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v13 = 1;
        goto LABEL_23;
      }
      v15 = self->_correctedText;
    }
    objc_msgSend(v6, "correctedText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[NSString isEqualToString:](v15, "isEqualToString:", v16);

    if (correctedText)
    {
      if (!v12)
        goto LABEL_18;
      goto LABEL_17;
    }
LABEL_23:

    if ((v12 & 1) == 0)
    {
LABEL_18:
      if (!recognizedText)

      goto LABEL_20;
    }
LABEL_17:

    goto LABEL_18;
  }
  v13 = 0;
LABEL_21:

  return v13;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)recognizedText
{
  return self->_recognizedText;
}

- (NSString)correctedText
{
  return self->_correctedText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctedText, 0);
  objc_storeStrong((id *)&self->_recognizedText, 0);
}

+ (void)eventWithData:(int)a1 dataVersion:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 1;
  _os_log_error_impl(&dword_18D810000, a2, OS_LOG_TYPE_ERROR, "BMSiriDictationEvent: Mismatched data versions (%u != %u) cannot deserialize", (uint8_t *)v2, 0xEu);
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBSiriDictationEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
