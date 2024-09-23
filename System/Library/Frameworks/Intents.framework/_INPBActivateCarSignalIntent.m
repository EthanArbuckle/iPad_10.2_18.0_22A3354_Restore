@implementation _INPBActivateCarSignalIntent

- (void)setCarName:(id)a3
{
  objc_storeStrong((id *)&self->_carName, a3);
}

- (BOOL)hasCarName
{
  return self->_carName != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setSignals:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)signals
{
  return self->_signals.list;
}

- (void)clearSignals
{
  PBRepeatedInt32Clear();
}

- (void)addSignals:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)signalsCount
{
  return self->_signals.count;
}

- (int)signalsAtIndex:(unint64_t)a3
{
  return self->_signals.list[a3];
}

- (id)signalsAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("AUDIBLE");
  if (a3 == 2)
  {
    v3 = CFSTR("VISIBLE");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSignals:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIBLE")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("VISIBLE")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBActivateCarSignalIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_signals;
  void *v9;
  unint64_t v10;
  id v11;

  v11 = a3;
  -[_INPBActivateCarSignalIntent carName](self, "carName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBActivateCarSignalIntent carName](self, "carName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBActivateCarSignalIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBActivateCarSignalIntent intentMetadata](self, "intentMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  p_signals = &self->_signals;
  v9 = v11;
  if (p_signals->count)
  {
    v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v9 = v11;
      ++v10;
    }
    while (v10 < p_signals->count);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[_INPBActivateCarSignalIntent clearSignals](self, "clearSignals");
  v3.receiver = self;
  v3.super_class = (Class)_INPBActivateCarSignalIntent;
  -[_INPBActivateCarSignalIntent dealloc](&v3, sel_dealloc);
}

- (_INPBActivateCarSignalIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBActivateCarSignalIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBActivateCarSignalIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBActivateCarSignalIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBActivateCarSignalIntent initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBActivateCarSignalIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBActivateCarSignalIntent *v5;
  id v6;
  id v7;

  v5 = -[_INPBActivateCarSignalIntent init](+[_INPBActivateCarSignalIntent allocWithZone:](_INPBActivateCarSignalIntent, "allocWithZone:"), "init");
  v6 = -[_INPBDataString copyWithZone:](self->_carName, "copyWithZone:", a3);
  -[_INPBActivateCarSignalIntent setCarName:](v5, "setCarName:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBActivateCarSignalIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  PBRepeatedInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBActivateCarSignalIntent carName](self, "carName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBActivateCarSignalIntent carName](self, "carName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBActivateCarSignalIntent carName](self, "carName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBActivateCarSignalIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBActivateCarSignalIntent intentMetadata](self, "intentMetadata");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      IsEqual = PBRepeatedInt32IsEqual();
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[_INPBActivateCarSignalIntent intentMetadata](self, "intentMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  IsEqual = 0;
LABEL_13:

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[_INPBDataString hash](self->_carName, "hash");
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash") ^ v3;
  return v4 ^ PBRepeatedInt32Hash();
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  int v10;
  __CFString *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBActivateCarSignalIntent carName](self, "carName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("carName"));

  -[_INPBActivateCarSignalIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("intentMetadata"));

  if (self->_signals.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBActivateCarSignalIntent signalsCount](self, "signalsCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBActivateCarSignalIntent signalsCount](self, "signalsCount"))
    {
      v9 = 0;
      do
      {
        v10 = self->_signals.list[v9];
        if (v10 == 1)
        {
          v11 = CFSTR("AUDIBLE");
        }
        else if (v10 == 2)
        {
          v11 = CFSTR("VISIBLE");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_signals.list[v9]);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v8, "addObject:", v11);

        ++v9;
      }
      while (v9 < -[_INPBActivateCarSignalIntent signalsCount](self, "signalsCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("signals"));

  }
  return v3;
}

- (_INPBDataString)carName
{
  return self->_carName;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_carName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
