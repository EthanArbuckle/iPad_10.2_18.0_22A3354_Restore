@implementation _INPBIntentSlotResolutionResult

- (void)setPayloadConfirmation:(id)a3
{
  objc_storeStrong((id *)&self->_payloadConfirmation, a3);
}

- (BOOL)hasPayloadConfirmation
{
  return self->_payloadConfirmation != 0;
}

- (void)setPayloadNeedsDisambiguation:(id)a3
{
  objc_storeStrong((id *)&self->_payloadNeedsDisambiguation, a3);
}

- (BOOL)hasPayloadNeedsDisambiguation
{
  return self->_payloadNeedsDisambiguation != 0;
}

- (void)setPayloadNeedsExecuteIntent:(id)a3
{
  objc_storeStrong((id *)&self->_payloadNeedsExecuteIntent, a3);
}

- (BOOL)hasPayloadNeedsExecuteIntent
{
  return self->_payloadNeedsExecuteIntent != 0;
}

- (void)setPayloadNeedsValue:(id)a3
{
  objc_storeStrong((id *)&self->_payloadNeedsValue, a3);
}

- (BOOL)hasPayloadNeedsValue
{
  return self->_payloadNeedsValue != 0;
}

- (void)setPayloadSuccess:(id)a3
{
  objc_storeStrong((id *)&self->_payloadSuccess, a3);
}

- (BOOL)hasPayloadSuccess
{
  return self->_payloadSuccess != 0;
}

- (void)setPayloadUnsupported:(id)a3
{
  objc_storeStrong((id *)&self->_payloadUnsupported, a3);
}

- (BOOL)hasPayloadUnsupported
{
  return self->_payloadUnsupported != 0;
}

- (void)setType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_type = a3;
  }
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)typeAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((a3 - 1) < 0xB && ((0x7EFu >> v3) & 1) != 0)
  {
    v4 = off_1E2290318[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Success")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unsupported")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NeedsValue")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NeedsDisambiguation")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NeedsConfirmation")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotRequired")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CallerToResolve")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CalleeNotImplemented")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AuthenticationRequired")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NeedsExecuteIntent")))
  {
    v4 = 11;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBIntentSlotResolutionResultReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[_INPBIntentSlotResolutionResult payloadConfirmation](self, "payloadConfirmation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBIntentSlotResolutionResult payloadConfirmation](self, "payloadConfirmation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBIntentSlotResolutionResult payloadNeedsDisambiguation](self, "payloadNeedsDisambiguation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBIntentSlotResolutionResult payloadNeedsDisambiguation](self, "payloadNeedsDisambiguation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBIntentSlotResolutionResult payloadNeedsExecuteIntent](self, "payloadNeedsExecuteIntent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBIntentSlotResolutionResult payloadNeedsExecuteIntent](self, "payloadNeedsExecuteIntent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBIntentSlotResolutionResult payloadNeedsValue](self, "payloadNeedsValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBIntentSlotResolutionResult payloadNeedsValue](self, "payloadNeedsValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBIntentSlotResolutionResult payloadSuccess](self, "payloadSuccess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBIntentSlotResolutionResult payloadSuccess](self, "payloadSuccess");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBIntentSlotResolutionResult payloadUnsupported](self, "payloadUnsupported");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBIntentSlotResolutionResult payloadUnsupported](self, "payloadUnsupported");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBIntentSlotResolutionResult hasType](self, "hasType"))
    PBDataWriterWriteInt32Field();

}

- (_INPBIntentSlotResolutionResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBIntentSlotResolutionResult *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBIntentSlotResolutionResult *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBIntentSlotResolutionResult *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBIntentSlotResolutionResult initWithData:](self, "initWithData:", v6);

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
  -[_INPBIntentSlotResolutionResult data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBIntentSlotResolutionResult *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v5 = -[_INPBIntentSlotResolutionResult init](+[_INPBIntentSlotResolutionResult allocWithZone:](_INPBIntentSlotResolutionResult, "allocWithZone:"), "init");
  v6 = -[_INPBPayloadConfirmation copyWithZone:](self->_payloadConfirmation, "copyWithZone:", a3);
  -[_INPBIntentSlotResolutionResult setPayloadConfirmation:](v5, "setPayloadConfirmation:", v6);

  v7 = -[_INPBPayloadNeedsDisambiguation copyWithZone:](self->_payloadNeedsDisambiguation, "copyWithZone:", a3);
  -[_INPBIntentSlotResolutionResult setPayloadNeedsDisambiguation:](v5, "setPayloadNeedsDisambiguation:", v7);

  v8 = -[_INPBPayloadNeedsExecuteIntent copyWithZone:](self->_payloadNeedsExecuteIntent, "copyWithZone:", a3);
  -[_INPBIntentSlotResolutionResult setPayloadNeedsExecuteIntent:](v5, "setPayloadNeedsExecuteIntent:", v8);

  v9 = -[_INPBPayloadNeedsValue copyWithZone:](self->_payloadNeedsValue, "copyWithZone:", a3);
  -[_INPBIntentSlotResolutionResult setPayloadNeedsValue:](v5, "setPayloadNeedsValue:", v9);

  v10 = -[_INPBPayloadSuccess copyWithZone:](self->_payloadSuccess, "copyWithZone:", a3);
  -[_INPBIntentSlotResolutionResult setPayloadSuccess:](v5, "setPayloadSuccess:", v10);

  v11 = -[_INPBPayloadUnsupported copyWithZone:](self->_payloadUnsupported, "copyWithZone:", a3);
  -[_INPBIntentSlotResolutionResult setPayloadUnsupported:](v5, "setPayloadUnsupported:", v11);

  if (-[_INPBIntentSlotResolutionResult hasType](self, "hasType"))
    -[_INPBIntentSlotResolutionResult setType:](v5, "setType:", -[_INPBIntentSlotResolutionResult type](self, "type"));
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  BOOL v37;
  int v39;
  int type;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[_INPBIntentSlotResolutionResult payloadConfirmation](self, "payloadConfirmation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadConfirmation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBIntentSlotResolutionResult payloadConfirmation](self, "payloadConfirmation");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBIntentSlotResolutionResult payloadConfirmation](self, "payloadConfirmation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payloadConfirmation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBIntentSlotResolutionResult payloadNeedsDisambiguation](self, "payloadNeedsDisambiguation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadNeedsDisambiguation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBIntentSlotResolutionResult payloadNeedsDisambiguation](self, "payloadNeedsDisambiguation");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBIntentSlotResolutionResult payloadNeedsDisambiguation](self, "payloadNeedsDisambiguation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payloadNeedsDisambiguation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBIntentSlotResolutionResult payloadNeedsExecuteIntent](self, "payloadNeedsExecuteIntent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadNeedsExecuteIntent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBIntentSlotResolutionResult payloadNeedsExecuteIntent](self, "payloadNeedsExecuteIntent");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBIntentSlotResolutionResult payloadNeedsExecuteIntent](self, "payloadNeedsExecuteIntent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payloadNeedsExecuteIntent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBIntentSlotResolutionResult payloadNeedsValue](self, "payloadNeedsValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadNeedsValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBIntentSlotResolutionResult payloadNeedsValue](self, "payloadNeedsValue");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_INPBIntentSlotResolutionResult payloadNeedsValue](self, "payloadNeedsValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payloadNeedsValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBIntentSlotResolutionResult payloadSuccess](self, "payloadSuccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadSuccess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_INPBIntentSlotResolutionResult payloadSuccess](self, "payloadSuccess");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_INPBIntentSlotResolutionResult payloadSuccess](self, "payloadSuccess");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payloadSuccess");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[_INPBIntentSlotResolutionResult payloadUnsupported](self, "payloadUnsupported");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadUnsupported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  -[_INPBIntentSlotResolutionResult payloadUnsupported](self, "payloadUnsupported");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_INPBIntentSlotResolutionResult payloadUnsupported](self, "payloadUnsupported");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "payloadUnsupported");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_32;
  }
  else
  {

  }
  v39 = -[_INPBIntentSlotResolutionResult hasType](self, "hasType");
  if (v39 == objc_msgSend(v4, "hasType"))
  {
    if (!-[_INPBIntentSlotResolutionResult hasType](self, "hasType")
      || !objc_msgSend(v4, "hasType")
      || (type = self->_type, type == objc_msgSend(v4, "type")))
    {
      v37 = 1;
      goto LABEL_33;
    }
  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v3 = -[_INPBPayloadConfirmation hash](self->_payloadConfirmation, "hash");
  v4 = -[_INPBPayloadNeedsDisambiguation hash](self->_payloadNeedsDisambiguation, "hash");
  v5 = -[_INPBPayloadNeedsExecuteIntent hash](self->_payloadNeedsExecuteIntent, "hash");
  v6 = -[_INPBPayloadNeedsValue hash](self->_payloadNeedsValue, "hash");
  v7 = -[_INPBPayloadSuccess hash](self->_payloadSuccess, "hash");
  v8 = -[_INPBPayloadUnsupported hash](self->_payloadUnsupported, "hash");
  if (-[_INPBIntentSlotResolutionResult hasType](self, "hasType"))
    v9 = 2654435761 * self->_type;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  __CFString *v18;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBIntentSlotResolutionResult payloadConfirmation](self, "payloadConfirmation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("_payloadConfirmation"));

  -[_INPBIntentSlotResolutionResult payloadNeedsDisambiguation](self, "payloadNeedsDisambiguation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("_payloadNeedsDisambiguation"));

  -[_INPBIntentSlotResolutionResult payloadNeedsExecuteIntent](self, "payloadNeedsExecuteIntent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("_payloadNeedsExecuteIntent"));

  -[_INPBIntentSlotResolutionResult payloadNeedsValue](self, "payloadNeedsValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("_payloadNeedsValue"));

  -[_INPBIntentSlotResolutionResult payloadSuccess](self, "payloadSuccess");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("_payloadSuccess"));

  -[_INPBIntentSlotResolutionResult payloadUnsupported](self, "payloadUnsupported");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("_payloadUnsupported"));

  if (-[_INPBIntentSlotResolutionResult hasType](self, "hasType"))
  {
    v16 = -[_INPBIntentSlotResolutionResult type](self, "type");
    v17 = v16 - 1;
    if ((v16 - 1) < 0xB && ((0x7EFu >> v17) & 1) != 0)
    {
      v18 = off_1E2290318[v17];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v16);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("type"));

  }
  return v3;
}

- (_INPBPayloadConfirmation)payloadConfirmation
{
  return self->_payloadConfirmation;
}

- (_INPBPayloadNeedsDisambiguation)payloadNeedsDisambiguation
{
  return self->_payloadNeedsDisambiguation;
}

- (_INPBPayloadNeedsExecuteIntent)payloadNeedsExecuteIntent
{
  return self->_payloadNeedsExecuteIntent;
}

- (_INPBPayloadNeedsValue)payloadNeedsValue
{
  return self->_payloadNeedsValue;
}

- (_INPBPayloadSuccess)payloadSuccess
{
  return self->_payloadSuccess;
}

- (_INPBPayloadUnsupported)payloadUnsupported
{
  return self->_payloadUnsupported;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadUnsupported, 0);
  objc_storeStrong((id *)&self->_payloadSuccess, 0);
  objc_storeStrong((id *)&self->_payloadNeedsValue, 0);
  objc_storeStrong((id *)&self->_payloadNeedsExecuteIntent, 0);
  objc_storeStrong((id *)&self->_payloadNeedsDisambiguation, 0);
  objc_storeStrong((id *)&self->_payloadConfirmation, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
