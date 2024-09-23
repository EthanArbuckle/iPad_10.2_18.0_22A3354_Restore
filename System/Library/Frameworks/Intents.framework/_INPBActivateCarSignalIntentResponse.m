@implementation _INPBActivateCarSignalIntentResponse

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
  return _INPBActivateCarSignalIntentResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_signals;
  unint64_t v4;

  p_signals = &self->_signals;
  if (self->_signals.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < p_signals->count);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[_INPBActivateCarSignalIntentResponse clearSignals](self, "clearSignals");
  v3.receiver = self;
  v3.super_class = (Class)_INPBActivateCarSignalIntentResponse;
  -[_INPBActivateCarSignalIntentResponse dealloc](&v3, sel_dealloc);
}

- (_INPBActivateCarSignalIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBActivateCarSignalIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBActivateCarSignalIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBActivateCarSignalIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBActivateCarSignalIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBActivateCarSignalIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBActivateCarSignalIntentResponse *v3;

  v3 = -[_INPBActivateCarSignalIntentResponse init](+[_INPBActivateCarSignalIntentResponse allocWithZone:](_INPBActivateCarSignalIntentResponse, "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char IsEqual;

  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
    IsEqual = PBRepeatedInt32IsEqual();
  else
    IsEqual = 0;

  return IsEqual;
}

- (unint64_t)hash
{
  return PBRepeatedInt32Hash();
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  unint64_t v5;
  int v6;
  __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_signals.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBActivateCarSignalIntentResponse signalsCount](self, "signalsCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBActivateCarSignalIntentResponse signalsCount](self, "signalsCount"))
    {
      v5 = 0;
      do
      {
        v6 = self->_signals.list[v5];
        if (v6 == 1)
        {
          v7 = CFSTR("AUDIBLE");
        }
        else if (v6 == 2)
        {
          v7 = CFSTR("VISIBLE");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_signals.list[v5]);
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v4, "addObject:", v7);

        ++v5;
      }
      while (v5 < -[_INPBActivateCarSignalIntentResponse signalsCount](self, "signalsCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("signals"));

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
