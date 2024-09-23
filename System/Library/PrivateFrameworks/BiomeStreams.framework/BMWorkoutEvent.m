@implementation BMWorkoutEvent

- (BMWorkoutEvent)initWithStarting:(BOOL)a3
{
  BMWorkoutEvent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BMWorkoutEvent;
  result = -[BMEventBase init](&v5, sel_init);
  if (result)
    result->_starting = a3;
  return result;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_starting);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Workout event with isWorkoutStart: %@"), v4);

  return (NSString *)v5;
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

  -[BMWorkoutEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMWorkoutEvent)initWithProto:(id)a3
{
  id v4;
  BMWorkoutEvent *v5;
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
      -[BMWorkoutEvent initWithProto:].cold.1((uint64_t)self, v6);

    goto LABEL_7;
  }
  self = -[BMWorkoutEvent initWithStarting:](self, "initWithStarting:", objc_msgSend(v4, "starting"));
  v5 = self;
LABEL_8:

  return v5;
}

- (BMWorkoutEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBWorkoutEvent *v5;
  BMWorkoutEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBWorkoutEvent initWithData:]([BMPBWorkoutEvent alloc], "initWithData:", v4);

    self = -[BMWorkoutEvent initWithProto:](self, "initWithProto:", v5);
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
  objc_msgSend(v3, "setStarting:", -[BMWorkoutEvent isStarting](self, "isStarting"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  char v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[BMWorkoutEvent isStarting](self, "isStarting");
    v7 = objc_msgSend(v5, "isStarting");

    v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isStarting
{
  return self->_starting;
}

- (void)setStarting:(BOOL)a3
{
  self->_starting = a3;
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBWorkoutEvent proto", (uint8_t *)&v5, 0xCu);

}

@end
