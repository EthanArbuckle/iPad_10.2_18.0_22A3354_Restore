@implementation BMBacklightEvent

- (BMBacklightEvent)initWithAbsoluteTimestamp:(double)a3 backlightLevel:(unint64_t)a4
{
  BMBacklightEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BMBacklightEvent;
  result = -[BMEventBase init](&v7, sel_init);
  if (result)
  {
    result->_absoluteTimestamp = a3;
    result->_backlightLevel = a4;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Backlight event with timestamp: %f"), *(_QWORD *)&self->_absoluteTimestamp);
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMBacklightEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMBacklightEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  BMBacklightEvent *v9;
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
      -[BMBacklightEvent initWithProto:].cold.1((uint64_t)self, v10);

    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v5, "absoluteTimestamp");
  v7 = v6;
  v8 = objc_msgSend(v5, "backlightLevel");

  self = -[BMBacklightEvent initWithAbsoluteTimestamp:backlightLevel:](self, "initWithAbsoluteTimestamp:backlightLevel:", v8, v7);
  v9 = self;
LABEL_8:

  return v9;
}

- (BMBacklightEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBBacklightEvent *v5;
  BMBacklightEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBBacklightEvent initWithData:]([BMPBBacklightEvent alloc], "initWithData:", v4);

    self = -[BMBacklightEvent initWithProto:](self, "initWithProto:", v5);
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
  objc_msgSend(v3, "setBacklightLevel:", self->_backlightLevel);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  double absoluteTimestamp;
  double v7;
  unint64_t backlightLevel;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    absoluteTimestamp = self->_absoluteTimestamp;
    objc_msgSend(v5, "absoluteTimestamp");
    if (absoluteTimestamp == v7)
    {
      backlightLevel = self->_backlightLevel;
      v9 = backlightLevel == objc_msgSend(v5, "backlightLevel");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (unint64_t)backlightLevel
{
  return self->_backlightLevel;
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBBacklightEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
