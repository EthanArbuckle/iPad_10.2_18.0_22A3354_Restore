@implementation MSPPin

- (BOOL)hasDroppedPin
{
  return self->_droppedPin != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MSPPin;
  -[MSPPin description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSPPin dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  MSPDroppedPin *droppedPin;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  droppedPin = self->_droppedPin;
  if (droppedPin)
  {
    -[MSPDroppedPin dictionaryRepresentation](droppedPin, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("droppedPin"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPPinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  if (self->_droppedPin)
  {
    v4 = (objc_class *)MEMORY[0x1E0D82B98];
    v5 = a3;
    v7 = objc_alloc_init(v4);
    -[MSPDroppedPin writeTo:](self->_droppedPin, "writeTo:", v7);
    objc_msgSend(v7, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeData:forTag:", v6, 1);

  }
}

- (void)copyTo:(id)a3
{
  MSPDroppedPin *droppedPin;

  droppedPin = self->_droppedPin;
  if (droppedPin)
    objc_msgSend(a3, "setDroppedPin:", droppedPin);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[MSPDroppedPin copyWithZone:](self->_droppedPin, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  MSPDroppedPin *droppedPin;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    droppedPin = self->_droppedPin;
    if ((unint64_t)droppedPin | v4[1])
      v6 = -[MSPDroppedPin isEqual:](droppedPin, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[MSPDroppedPin hash](self->_droppedPin, "hash");
}

- (MSPDroppedPin)droppedPin
{
  return self->_droppedPin;
}

- (void)setDroppedPin:(id)a3
{
  objc_storeStrong((id *)&self->_droppedPin, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_droppedPin, 0);
}

@end
