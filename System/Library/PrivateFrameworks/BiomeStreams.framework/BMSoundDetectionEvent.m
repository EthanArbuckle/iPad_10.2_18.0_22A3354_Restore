@implementation BMSoundDetectionEvent

- (BMSoundDetectionEvent)initWithAbsoluteTimestamp:(double)a3 type:(id)a4 customName:(id)a5
{
  id v7;
  BMSoundDetectionEvent *v8;
  BMSoundDetectionEvent *v9;
  uint64_t v10;
  NSString *type;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMSoundDetectionEvent;
  v8 = -[BMEventBase init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_absoluteTimestamp = a3;
    v10 = objc_msgSend(v7, "copy");
    type = v9->_type;
    v9->_type = (NSString *)v10;

  }
  return v9;
}

- (BMSoundDetectionEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBSoundDetectionEvent *v5;
  BMSoundDetectionEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBSoundDetectionEvent initWithData:]([BMPBSoundDetectionEvent alloc], "initWithData:", v4);

    self = -[BMSoundDetectionEvent initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMSoundDetectionEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMSoundDetectionEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  BMSoundDetectionEvent *v9;
  NSObject *v10;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[BMSoundDetectionEvent initWithProto:].cold.1((uint64_t)self, v10);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "absoluteTimestamp");
  v7 = v6;
  objc_msgSend(v5, "soundDetectionType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  self = -[BMSoundDetectionEvent initWithAbsoluteTimestamp:type:customName:](self, "initWithAbsoluteTimestamp:type:customName:", v8, 0, v7);
  v9 = self;
LABEL_8:

  return v9;
}

- (id)proto
{
  BMPBSoundDetectionEvent *v3;
  void *v4;

  v3 = objc_alloc_init(BMPBSoundDetectionEvent);
  -[BMSoundDetectionEvent absoluteTimestamp](self, "absoluteTimestamp");
  -[BMPBSoundDetectionEvent setAbsoluteTimestamp:](v3, "setAbsoluteTimestamp:");
  -[BMSoundDetectionEvent type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBSoundDetectionEvent setSoundDetectionType:](v3, "setSoundDetectionType:", v4);

  return v3;
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

- (unint64_t)hash
{
  double v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  -[BMSoundDetectionEvent absoluteTimestamp](self, "absoluteTimestamp");
  v4 = (unint64_t)(v3 * 1000.0);
  -[BMSoundDetectionEvent type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  double absoluteTimestamp;
  double v8;
  NSString *type;
  NSString *v10;
  void *v11;
  char v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    absoluteTimestamp = self->_absoluteTimestamp;
    objc_msgSend(v6, "absoluteTimestamp");
    if (absoluteTimestamp == v8)
    {
      type = self->_type;
      v10 = type;
      if (!type)
      {
        objc_msgSend(v6, "type");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v3)
        {
          v12 = 1;
LABEL_11:

          goto LABEL_12;
        }
        v10 = self->_type;
      }
      objc_msgSend(v6, "type");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSString isEqual:](v10, "isEqual:", v11);

      if (!type)
        goto LABEL_11;
    }
    else
    {
      v12 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (NSString)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x1E0C99D68];
  -[BMSoundDetectionEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMSoundDetectionEvent type](self, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> time: %@, type: %@"), v4, self, v6, v7);

  return (NSString *)v8;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBSoundDetectionEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
