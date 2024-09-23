@implementation _INPBSearchCallHistoryIntent

- (void)setCallCapabilities:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)callCapabilities
{
  return self->_callCapabilities.list;
}

- (void)clearCallCapabilities
{
  PBRepeatedInt32Clear();
}

- (void)addCallCapabilities:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)callCapabilitiesCount
{
  return self->_callCapabilities.count;
}

- (int)callCapabilitiesAtIndex:(unint64_t)a3
{
  return self->_callCapabilities.list[a3];
}

- (id)callCapabilitiesAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("AUDIO_CALL");
  if (a3 == 2)
  {
    v3 = CFSTR("VIDEO_CALL");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsCallCapabilities:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_CALL")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO_CALL")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setCallType:(int)a3
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
    self->_callType = a3;
  }
}

- (BOOL)hasCallType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasCallType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)callTypeAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 2;
  if ((a3 - 2) < 9 && ((0x1EFu >> v3) & 1) != 0)
  {
    v4 = off_1E228EE68[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsCallType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OUTGOING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MISSED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECEIVED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATEST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICEMAIL")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RINGING")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_PROGRESS")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ON_HOLD")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (void)setCallTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)callTypes
{
  return self->_callTypes.list;
}

- (void)clearCallTypes
{
  PBRepeatedInt32Clear();
}

- (void)addCallTypes:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)callTypesCount
{
  return self->_callTypes.count;
}

- (int)callTypesAtIndex:(unint64_t)a3
{
  return self->_callTypes.list[a3];
}

- (id)callTypesAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 2;
  if ((a3 - 2) < 9 && ((0x1EFu >> v3) & 1) != 0)
  {
    v4 = off_1E228EE68[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsCallTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OUTGOING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MISSED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECEIVED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LATEST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VOICEMAIL")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RINGING")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_PROGRESS")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ON_HOLD")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (void)setCapabilities:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)capabilities
{
  return self->_capabilities.list;
}

- (void)clearCapabilities
{
  PBRepeatedInt32Clear();
}

- (void)addCapabilities:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)capabilitiesCount
{
  return self->_capabilities.count;
}

- (int)capabilitiesAtIndex:(unint64_t)a3
{
  return self->_capabilities.list[a3];
}

- (id)capabilitiesAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("AUDIO_CALL");
  if (a3 == 2)
  {
    v3 = CFSTR("VIDEO_CALL");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsCapabilities:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUDIO_CALL")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("VIDEO_CALL")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setDateCreated:(id)a3
{
  objc_storeStrong((id *)&self->_dateCreated, a3);
}

- (BOOL)hasDateCreated
{
  return self->_dateCreated != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setPreferredCallProvider:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_preferredCallProvider = a3;
  }
}

- (BOOL)hasPreferredCallProvider
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasPreferredCallProvider:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)preferredCallProviderAsString:(int)a3
{
  if ((a3 - 2) < 3)
    return off_1E228EEB0[a3 - 2];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPreferredCallProvider:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TELEPHONY_PROVIDER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FACETIME_PROVIDER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("THIRD_PARTY_PROVIDER")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

- (void)setRecipient:(id)a3
{
  objc_storeStrong((id *)&self->_recipient, a3);
}

- (BOOL)hasRecipient
{
  return self->_recipient != 0;
}

- (void)setTargetContact:(id)a3
{
  objc_storeStrong((id *)&self->_targetContact, a3);
}

- (BOOL)hasTargetContact
{
  return self->_targetContact != 0;
}

- (void)setUnseen:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_unseen = a3;
}

- (BOOL)hasUnseen
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasUnseen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSearchCallHistoryIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (self->_callCapabilities.count)
  {
    v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_callCapabilities.count);
  }
  if (-[_INPBSearchCallHistoryIntent hasCallType](self, "hasCallType"))
    PBDataWriterWriteInt32Field();
  if (self->_callTypes.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_callTypes.count);
  }
  if (self->_capabilities.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v6;
    }
    while (v6 < self->_capabilities.count);
  }
  -[_INPBSearchCallHistoryIntent dateCreated](self, "dateCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBSearchCallHistoryIntent dateCreated](self, "dateCreated");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchCallHistoryIntent intentMetadata](self, "intentMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBSearchCallHistoryIntent intentMetadata](self, "intentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSearchCallHistoryIntent hasPreferredCallProvider](self, "hasPreferredCallProvider"))
    PBDataWriterWriteInt32Field();
  -[_INPBSearchCallHistoryIntent recipient](self, "recipient");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_INPBSearchCallHistoryIntent recipient](self, "recipient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSearchCallHistoryIntent targetContact](self, "targetContact");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_INPBSearchCallHistoryIntent targetContact](self, "targetContact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSearchCallHistoryIntent hasUnseen](self, "hasUnseen"))
    PBDataWriterWriteBOOLField();

}

- (void)dealloc
{
  objc_super v3;

  -[_INPBSearchCallHistoryIntent clearCallCapabilities](self, "clearCallCapabilities");
  -[_INPBSearchCallHistoryIntent clearCallTypes](self, "clearCallTypes");
  -[_INPBSearchCallHistoryIntent clearCapabilities](self, "clearCapabilities");
  v3.receiver = self;
  v3.super_class = (Class)_INPBSearchCallHistoryIntent;
  -[_INPBSearchCallHistoryIntent dealloc](&v3, sel_dealloc);
}

- (_INPBSearchCallHistoryIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSearchCallHistoryIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSearchCallHistoryIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSearchCallHistoryIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSearchCallHistoryIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSearchCallHistoryIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSearchCallHistoryIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = -[_INPBSearchCallHistoryIntent init](+[_INPBSearchCallHistoryIntent allocWithZone:](_INPBSearchCallHistoryIntent, "allocWithZone:"), "init");
  PBRepeatedInt32Copy();
  if (-[_INPBSearchCallHistoryIntent hasCallType](self, "hasCallType"))
    -[_INPBSearchCallHistoryIntent setCallType:](v5, "setCallType:", -[_INPBSearchCallHistoryIntent callType](self, "callType"));
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  v6 = -[_INPBDateTimeRange copyWithZone:](self->_dateCreated, "copyWithZone:", a3);
  -[_INPBSearchCallHistoryIntent setDateCreated:](v5, "setDateCreated:", v6);

  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSearchCallHistoryIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  if (-[_INPBSearchCallHistoryIntent hasPreferredCallProvider](self, "hasPreferredCallProvider"))
    -[_INPBSearchCallHistoryIntent setPreferredCallProvider:](v5, "setPreferredCallProvider:", -[_INPBSearchCallHistoryIntent preferredCallProvider](self, "preferredCallProvider"));
  v8 = -[_INPBContact copyWithZone:](self->_recipient, "copyWithZone:", a3);
  -[_INPBSearchCallHistoryIntent setRecipient:](v5, "setRecipient:", v8);

  v9 = -[_INPBContact copyWithZone:](self->_targetContact, "copyWithZone:", a3);
  -[_INPBSearchCallHistoryIntent setTargetContact:](v5, "setTargetContact:", v9);

  if (-[_INPBSearchCallHistoryIntent hasUnseen](self, "hasUnseen"))
    -[_INPBSearchCallHistoryIntent setUnseen:](v5, "setUnseen:", -[_INPBSearchCallHistoryIntent unseen](self, "unseen"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int callType;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int preferredCallProvider;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  BOOL v31;
  int v33;
  int unseen;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_33;
  v5 = -[_INPBSearchCallHistoryIntent hasCallType](self, "hasCallType");
  if (v5 != objc_msgSend(v4, "hasCallType"))
    goto LABEL_33;
  if (-[_INPBSearchCallHistoryIntent hasCallType](self, "hasCallType"))
  {
    if (objc_msgSend(v4, "hasCallType"))
    {
      callType = self->_callType;
      if (callType != objc_msgSend(v4, "callType"))
        goto LABEL_33;
    }
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual())
    goto LABEL_33;
  -[_INPBSearchCallHistoryIntent dateCreated](self, "dateCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateCreated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_32;
  -[_INPBSearchCallHistoryIntent dateCreated](self, "dateCreated");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBSearchCallHistoryIntent dateCreated](self, "dateCreated");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateCreated");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_33;
  }
  else
  {

  }
  -[_INPBSearchCallHistoryIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_32;
  -[_INPBSearchCallHistoryIntent intentMetadata](self, "intentMetadata");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBSearchCallHistoryIntent intentMetadata](self, "intentMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_33;
  }
  else
  {

  }
  v19 = -[_INPBSearchCallHistoryIntent hasPreferredCallProvider](self, "hasPreferredCallProvider");
  if (v19 != objc_msgSend(v4, "hasPreferredCallProvider"))
    goto LABEL_33;
  if (-[_INPBSearchCallHistoryIntent hasPreferredCallProvider](self, "hasPreferredCallProvider"))
  {
    if (objc_msgSend(v4, "hasPreferredCallProvider"))
    {
      preferredCallProvider = self->_preferredCallProvider;
      if (preferredCallProvider != objc_msgSend(v4, "preferredCallProvider"))
        goto LABEL_33;
    }
  }
  -[_INPBSearchCallHistoryIntent recipient](self, "recipient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recipient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_32;
  -[_INPBSearchCallHistoryIntent recipient](self, "recipient");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_INPBSearchCallHistoryIntent recipient](self, "recipient");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recipient");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_33;
  }
  else
  {

  }
  -[_INPBSearchCallHistoryIntent targetContact](self, "targetContact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
  {
LABEL_32:

    goto LABEL_33;
  }
  -[_INPBSearchCallHistoryIntent targetContact](self, "targetContact");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[_INPBSearchCallHistoryIntent targetContact](self, "targetContact");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetContact");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_33;
  }
  else
  {

  }
  v33 = -[_INPBSearchCallHistoryIntent hasUnseen](self, "hasUnseen");
  if (v33 == objc_msgSend(v4, "hasUnseen"))
  {
    if (!-[_INPBSearchCallHistoryIntent hasUnseen](self, "hasUnseen")
      || !objc_msgSend(v4, "hasUnseen")
      || (unseen = self->_unseen, unseen == objc_msgSend(v4, "unseen")))
    {
      v31 = 1;
      goto LABEL_34;
    }
  }
LABEL_33:
  v31 = 0;
LABEL_34:

  return v31;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v13 = PBRepeatedInt32Hash();
  if (-[_INPBSearchCallHistoryIntent hasCallType](self, "hasCallType"))
    v3 = 2654435761 * self->_callType;
  else
    v3 = 0;
  v4 = PBRepeatedInt32Hash();
  v5 = PBRepeatedInt32Hash();
  v6 = -[_INPBDateTimeRange hash](self->_dateCreated, "hash");
  v7 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBSearchCallHistoryIntent hasPreferredCallProvider](self, "hasPreferredCallProvider"))
    v8 = 2654435761 * self->_preferredCallProvider;
  else
    v8 = 0;
  v9 = -[_INPBContact hash](self->_recipient, "hash");
  v10 = -[_INPBContact hash](self->_targetContact, "hash");
  if (-[_INPBSearchCallHistoryIntent hasUnseen](self, "hasUnseen"))
    v11 = 2654435761 * self->_unseen;
  else
    v11 = 0;
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  unint64_t v5;
  int v6;
  __CFString *v7;
  uint64_t v8;
  int v9;
  __CFString *v10;
  void *v11;
  unint64_t v12;
  unsigned int v13;
  __CFString *v14;
  void *v15;
  unint64_t v16;
  int v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_callCapabilities.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBSearchCallHistoryIntent callCapabilitiesCount](self, "callCapabilitiesCount"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBSearchCallHistoryIntent callCapabilitiesCount](self, "callCapabilitiesCount"))
    {
      v5 = 0;
      do
      {
        v6 = self->_callCapabilities.list[v5];
        if (v6 == 1)
        {
          v7 = CFSTR("AUDIO_CALL");
        }
        else if (v6 == 2)
        {
          v7 = CFSTR("VIDEO_CALL");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_callCapabilities.list[v5]);
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v4, "addObject:", v7);

        ++v5;
      }
      while (v5 < -[_INPBSearchCallHistoryIntent callCapabilitiesCount](self, "callCapabilitiesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("callCapabilities"));

  }
  if (-[_INPBSearchCallHistoryIntent hasCallType](self, "hasCallType"))
  {
    v8 = -[_INPBSearchCallHistoryIntent callType](self, "callType");
    v9 = v8 - 2;
    if ((v8 - 2) < 9 && ((0x1EFu >> v9) & 1) != 0)
    {
      v10 = off_1E228EE68[v9];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("callType"));

  }
  if (self->_callTypes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBSearchCallHistoryIntent callTypesCount](self, "callTypesCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBSearchCallHistoryIntent callTypesCount](self, "callTypesCount"))
    {
      v12 = 0;
      do
      {
        v13 = self->_callTypes.list[v12] - 2;
        if (v13 < 9 && ((0x1EFu >> v13) & 1) != 0)
        {
          v14 = off_1E228EE68[v13];
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_callTypes.list[v12]);
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v11, "addObject:", v14);

        ++v12;
      }
      while (v12 < -[_INPBSearchCallHistoryIntent callTypesCount](self, "callTypesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("callTypes"));

  }
  if (self->_capabilities.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBSearchCallHistoryIntent capabilitiesCount](self, "capabilitiesCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBSearchCallHistoryIntent capabilitiesCount](self, "capabilitiesCount"))
    {
      v16 = 0;
      do
      {
        v17 = self->_capabilities.list[v16];
        if (v17 == 1)
        {
          v18 = CFSTR("AUDIO_CALL");
        }
        else if (v17 == 2)
        {
          v18 = CFSTR("VIDEO_CALL");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_capabilities.list[v16]);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v15, "addObject:", v18);

        ++v16;
      }
      while (v16 < -[_INPBSearchCallHistoryIntent capabilitiesCount](self, "capabilitiesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("capabilities"));

  }
  -[_INPBSearchCallHistoryIntent dateCreated](self, "dateCreated");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("dateCreated"));

  -[_INPBSearchCallHistoryIntent intentMetadata](self, "intentMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dictionaryRepresentation");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("intentMetadata"));

  if (-[_INPBSearchCallHistoryIntent hasPreferredCallProvider](self, "hasPreferredCallProvider"))
  {
    v23 = -[_INPBSearchCallHistoryIntent preferredCallProvider](self, "preferredCallProvider");
    if ((v23 - 2) >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v23);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E228EEB0[(v23 - 2)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("preferredCallProvider"));

  }
  -[_INPBSearchCallHistoryIntent recipient](self, "recipient");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dictionaryRepresentation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("recipient"));

  -[_INPBSearchCallHistoryIntent targetContact](self, "targetContact");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dictionaryRepresentation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("targetContact"));

  if (-[_INPBSearchCallHistoryIntent hasUnseen](self, "hasUnseen"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBSearchCallHistoryIntent unseen](self, "unseen"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("unseen"));

  }
  return v3;
}

- (int)callType
{
  return self->_callType;
}

- (_INPBDateTimeRange)dateCreated
{
  return self->_dateCreated;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)preferredCallProvider
{
  return self->_preferredCallProvider;
}

- (_INPBContact)recipient
{
  return self->_recipient;
}

- (_INPBContact)targetContact
{
  return self->_targetContact;
}

- (BOOL)unseen
{
  return self->_unseen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContact, 0);
  objc_storeStrong((id *)&self->_recipient, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
