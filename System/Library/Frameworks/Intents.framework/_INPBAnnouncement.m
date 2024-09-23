@implementation _INPBAnnouncement

- (void)setEndTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_endTime = a3;
}

- (BOOL)hasEndTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEndTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setIdentifier:(id)a3
{
  NSString *v4;
  NSString *identifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  identifier = self->_identifier;
  self->_identifier = v4;

}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (void)setSpeechDataTranscription:(id)a3
{
  NSString *v4;
  NSString *speechDataTranscription;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  speechDataTranscription = self->_speechDataTranscription;
  self->_speechDataTranscription = v4;

}

- (BOOL)hasSpeechDataTranscription
{
  return self->_speechDataTranscription != 0;
}

- (void)setSpeechDataURL:(id)a3
{
  objc_storeStrong((id *)&self->_speechDataURL, a3);
}

- (BOOL)hasSpeechDataURL
{
  return self->_speechDataURL != 0;
}

- (void)setStartTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_startTime = a3;
}

- (BOOL)hasStartTime
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasStartTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAnnouncementReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[_INPBAnnouncement hasEndTime](self, "hasEndTime"))
    PBDataWriterWriteUint64Field();
  -[_INPBAnnouncement identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBAnnouncement speechDataTranscription](self, "speechDataTranscription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();
  -[_INPBAnnouncement speechDataURL](self, "speechDataURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBAnnouncement speechDataURL](self, "speechDataURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBAnnouncement hasStartTime](self, "hasStartTime"))
    PBDataWriterWriteUint64Field();

}

- (_INPBAnnouncement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBAnnouncement *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBAnnouncement *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBAnnouncement *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBAnnouncement initWithData:](self, "initWithData:", v6);

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
  -[_INPBAnnouncement data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBAnnouncement *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = -[_INPBAnnouncement init](+[_INPBAnnouncement allocWithZone:](_INPBAnnouncement, "allocWithZone:"), "init");
  if (-[_INPBAnnouncement hasEndTime](self, "hasEndTime"))
    -[_INPBAnnouncement setEndTime:](v5, "setEndTime:", -[_INPBAnnouncement endTime](self, "endTime"));
  v6 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  -[_INPBAnnouncement setIdentifier:](v5, "setIdentifier:", v6);

  v7 = (void *)-[NSString copyWithZone:](self->_speechDataTranscription, "copyWithZone:", a3);
  -[_INPBAnnouncement setSpeechDataTranscription:](v5, "setSpeechDataTranscription:", v7);

  v8 = -[_INPBURLValue copyWithZone:](self->_speechDataURL, "copyWithZone:", a3);
  -[_INPBAnnouncement setSpeechDataURL:](v5, "setSpeechDataURL:", v8);

  if (-[_INPBAnnouncement hasStartTime](self, "hasStartTime"))
    -[_INPBAnnouncement setStartTime:](v5, "setStartTime:", -[_INPBAnnouncement startTime](self, "startTime"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  unint64_t endTime;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  int v26;
  unint64_t startTime;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  v5 = -[_INPBAnnouncement hasEndTime](self, "hasEndTime");
  if (v5 != objc_msgSend(v4, "hasEndTime"))
    goto LABEL_21;
  if (-[_INPBAnnouncement hasEndTime](self, "hasEndTime"))
  {
    if (objc_msgSend(v4, "hasEndTime"))
    {
      endTime = self->_endTime;
      if (endTime != objc_msgSend(v4, "endTime"))
        goto LABEL_21;
    }
  }
  -[_INPBAnnouncement identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_20;
  -[_INPBAnnouncement identifier](self, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBAnnouncement identifier](self, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBAnnouncement speechDataTranscription](self, "speechDataTranscription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechDataTranscription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_20;
  -[_INPBAnnouncement speechDataTranscription](self, "speechDataTranscription");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBAnnouncement speechDataTranscription](self, "speechDataTranscription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechDataTranscription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_21;
  }
  else
  {

  }
  -[_INPBAnnouncement speechDataURL](self, "speechDataURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechDataURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
  {
LABEL_20:

    goto LABEL_21;
  }
  -[_INPBAnnouncement speechDataURL](self, "speechDataURL");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBAnnouncement speechDataURL](self, "speechDataURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speechDataURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_21;
  }
  else
  {

  }
  v26 = -[_INPBAnnouncement hasStartTime](self, "hasStartTime");
  if (v26 == objc_msgSend(v4, "hasStartTime"))
  {
    if (!-[_INPBAnnouncement hasStartTime](self, "hasStartTime")
      || !objc_msgSend(v4, "hasStartTime")
      || (startTime = self->_startTime, startTime == objc_msgSend(v4, "startTime")))
    {
      v24 = 1;
      goto LABEL_22;
    }
  }
LABEL_21:
  v24 = 0;
LABEL_22:

  return v24;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;

  if (-[_INPBAnnouncement hasEndTime](self, "hasEndTime"))
    v3 = 2654435761u * self->_endTime;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_identifier, "hash");
  v5 = -[NSString hash](self->_speechDataTranscription, "hash");
  v6 = -[_INPBURLValue hash](self->_speechDataURL, "hash");
  if (-[_INPBAnnouncement hasStartTime](self, "hasStartTime"))
    v7 = 2654435761u * self->_startTime;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBAnnouncement hasEndTime](self, "hasEndTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_INPBAnnouncement endTime](self, "endTime"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("endTime"));

  }
  if (self->_identifier)
  {
    -[_INPBAnnouncement identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("identifier"));

  }
  if (self->_speechDataTranscription)
  {
    -[_INPBAnnouncement speechDataTranscription](self, "speechDataTranscription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("speechDataTranscription"));

  }
  -[_INPBAnnouncement speechDataURL](self, "speechDataURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("speechDataURL"));

  if (-[_INPBAnnouncement hasStartTime](self, "hasStartTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[_INPBAnnouncement startTime](self, "startTime"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("startTime"));

  }
  return v3;
}

- (unint64_t)endTime
{
  return self->_endTime;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)speechDataTranscription
{
  return self->_speechDataTranscription;
}

- (_INPBURLValue)speechDataURL
{
  return self->_speechDataURL;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechDataURL, 0);
  objc_storeStrong((id *)&self->_speechDataTranscription, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
