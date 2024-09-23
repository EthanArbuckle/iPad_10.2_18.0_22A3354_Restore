@implementation BMGameControllerEvent

- (BMGameControllerEvent)initWithIsControllerConnected:(BOOL)a3 numberOfControllersConnected:(unint64_t)a4
{
  BMGameControllerEvent *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BMGameControllerEvent;
  result = -[BMEventBase init](&v7, sel_init);
  if (result)
  {
    result->_isControllerConnected = a3;
    result->_numberOfControllersConnected = a4;
  }
  return result;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isControllerConnected);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfControllersConnected);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("GameControllerEvent event with isControllerConnected: %@, numberOfControllersConnected: %@"), v4, v5);

  return (NSString *)v6;
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

  -[BMGameControllerEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMGameControllerEvent)initWithProto:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  BMGameControllerEvent *v8;
  NSObject *v9;

  v4 = a3;
  if (!v4)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BMGameControllerEvent initWithProto:].cold.1((uint64_t)self, v9);

    goto LABEL_7;
  }
  v5 = v4;
  v6 = objc_msgSend(v5, "isControllerConnected");
  v7 = objc_msgSend(v5, "numberOfControllersConnected");

  self = -[BMGameControllerEvent initWithIsControllerConnected:numberOfControllersConnected:](self, "initWithIsControllerConnected:numberOfControllersConnected:", v6, v7);
  v8 = self;
LABEL_8:

  return v8;
}

- (BMGameControllerEvent)initWithProtoData:(id)a3
{
  id v4;
  BMPBGameControllerEvent *v5;
  BMGameControllerEvent *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[BMPBGameControllerEvent initWithData:]([BMPBGameControllerEvent alloc], "initWithData:", v4);

    self = -[BMGameControllerEvent initWithProto:](self, "initWithProto:", v5);
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
  objc_msgSend(v3, "setIsControllerConnected:", -[BMGameControllerEvent isControllerConnected](self, "isControllerConnected"));
  objc_msgSend(v3, "setNumberOfControllersConnected:", -[BMGameControllerEvent numberOfControllersConnected](self, "numberOfControllersConnected"));
  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isControllerConnected);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numberOfControllersConnected);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int isControllerConnected;
  unint64_t numberOfControllersConnected;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    isControllerConnected = self->_isControllerConnected;
    if (isControllerConnected == objc_msgSend(v5, "isControllerConnected"))
    {
      numberOfControllersConnected = self->_numberOfControllersConnected;
      v8 = numberOfControllersConnected == objc_msgSend(v5, "numberOfControllersConnected");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isControllerConnected
{
  return self->_isControllerConnected;
}

- (void)setIsControllerConnected:(BOOL)a3
{
  self->_isControllerConnected = a3;
}

- (unint64_t)numberOfControllersConnected
{
  return self->_numberOfControllersConnected;
}

- (void)setNumberOfControllersConnected:(unint64_t)a3
{
  self->_numberOfControllersConnected = a3;
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
  _os_log_fault_impl(&dword_18D810000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-BMPBGameControllerEventDataVersion proto", (uint8_t *)&v5, 0xCu);

}

@end
