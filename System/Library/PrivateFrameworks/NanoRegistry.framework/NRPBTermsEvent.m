@implementation NRPBTermsEvent

- (void)setEventType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasTermsText
{
  return self->_termsText != 0;
}

- (BOOL)hasDocumentationID
{
  return self->_documentationID != 0;
}

- (BOOL)hasPresentationReason
{
  return self->_presentationReason != 0;
}

- (void)setPresentationLocation:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_presentationLocation = a3;
}

- (void)setHasPresentationLocation:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPresentationLocation
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasAcknowledgedDeviceName
{
  return self->_acknowledgedDeviceName != 0;
}

- (BOOL)hasAcknowledgedDeviceSerialNumber
{
  return self->_acknowledgedDeviceSerialNumber != 0;
}

- (BOOL)hasDisplayDeviceName
{
  return self->_displayDeviceName != 0;
}

- (BOOL)hasDisplayDeviceSerialNumber
{
  return self->_displayDeviceSerialNumber != 0;
}

- (void)setEventDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_eventDate = a3;
}

- (void)setHasEventDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasLoggingProcessName
{
  return self->_loggingProcessName != 0;
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
  v8.super_class = (Class)NRPBTermsEvent;
  -[NRPBTermsEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPBTermsEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *termsText;
  NSString *documentationID;
  NSString *presentationReason;
  void *v8;
  NSString *acknowledgedDeviceName;
  NSString *acknowledgedDeviceSerialNumber;
  NSString *displayDeviceName;
  NSString *displayDeviceSerialNumber;
  void *v13;
  NSString *loggingProcessName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_eventType);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("eventType"));

  }
  termsText = self->_termsText;
  if (termsText)
    objc_msgSend(v3, "setObject:forKey:", termsText, CFSTR("termsText"));
  documentationID = self->_documentationID;
  if (documentationID)
    objc_msgSend(v3, "setObject:forKey:", documentationID, CFSTR("documentationID"));
  presentationReason = self->_presentationReason;
  if (presentationReason)
    objc_msgSend(v3, "setObject:forKey:", presentationReason, CFSTR("presentationReason"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_presentationLocation);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("presentationLocation"));

  }
  acknowledgedDeviceName = self->_acknowledgedDeviceName;
  if (acknowledgedDeviceName)
    objc_msgSend(v3, "setObject:forKey:", acknowledgedDeviceName, CFSTR("acknowledgedDeviceName"));
  acknowledgedDeviceSerialNumber = self->_acknowledgedDeviceSerialNumber;
  if (acknowledgedDeviceSerialNumber)
    objc_msgSend(v3, "setObject:forKey:", acknowledgedDeviceSerialNumber, CFSTR("acknowledgedDeviceSerialNumber"));
  displayDeviceName = self->_displayDeviceName;
  if (displayDeviceName)
    objc_msgSend(v3, "setObject:forKey:", displayDeviceName, CFSTR("displayDeviceName"));
  displayDeviceSerialNumber = self->_displayDeviceSerialNumber;
  if (displayDeviceSerialNumber)
    objc_msgSend(v3, "setObject:forKey:", displayDeviceSerialNumber, CFSTR("displayDeviceSerialNumber"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_eventDate);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("eventDate"));

  }
  loggingProcessName = self->_loggingProcessName;
  if (loggingProcessName)
    objc_msgSend(v3, "setObject:forKey:", loggingProcessName, CFSTR("loggingProcessName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBTermsEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_termsText)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_documentationID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_presentationReason)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_acknowledgedDeviceName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_acknowledgedDeviceSerialNumber)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_displayDeviceName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_displayDeviceSerialNumber)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_loggingProcessName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[14] = self->_eventType;
    *((_BYTE *)v4 + 96) |= 2u;
  }
  v5 = v4;
  if (self->_termsText)
  {
    objc_msgSend(v4, "setTermsText:");
    v4 = v5;
  }
  if (self->_documentationID)
  {
    objc_msgSend(v5, "setDocumentationID:");
    v4 = v5;
  }
  if (self->_presentationReason)
  {
    objc_msgSend(v5, "setPresentationReason:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[18] = self->_presentationLocation;
    *((_BYTE *)v4 + 96) |= 4u;
  }
  if (self->_acknowledgedDeviceName)
  {
    objc_msgSend(v5, "setAcknowledgedDeviceName:");
    v4 = v5;
  }
  if (self->_acknowledgedDeviceSerialNumber)
  {
    objc_msgSend(v5, "setAcknowledgedDeviceSerialNumber:");
    v4 = v5;
  }
  if (self->_displayDeviceName)
  {
    objc_msgSend(v5, "setDisplayDeviceName:");
    v4 = v5;
  }
  if (self->_displayDeviceSerialNumber)
  {
    objc_msgSend(v5, "setDisplayDeviceSerialNumber:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_eventDate;
    *((_BYTE *)v4 + 96) |= 1u;
  }
  if (self->_loggingProcessName)
  {
    objc_msgSend(v5, "setLoggingProcessName:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_eventType;
    *(_BYTE *)(v5 + 96) |= 2u;
  }
  v7 = -[NSData copyWithZone:](self->_termsText, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v7;

  v9 = -[NSString copyWithZone:](self->_documentationID, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v9;

  v11 = -[NSString copyWithZone:](self->_presentationReason, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v11;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_presentationLocation;
    *(_BYTE *)(v6 + 96) |= 4u;
  }
  v13 = -[NSString copyWithZone:](self->_acknowledgedDeviceName, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v13;

  v15 = -[NSString copyWithZone:](self->_acknowledgedDeviceSerialNumber, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v15;

  v17 = -[NSString copyWithZone:](self->_displayDeviceName, "copyWithZone:", a3);
  v18 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v17;

  v19 = -[NSString copyWithZone:](self->_displayDeviceSerialNumber, "copyWithZone:", a3);
  v20 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v19;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_eventDate;
    *(_BYTE *)(v6 + 96) |= 1u;
  }
  v21 = -[NSString copyWithZone:](self->_loggingProcessName, "copyWithZone:", a3);
  v22 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v21;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *termsText;
  NSString *documentationID;
  NSString *presentationReason;
  NSString *acknowledgedDeviceName;
  NSString *acknowledgedDeviceSerialNumber;
  NSString *displayDeviceName;
  NSString *displayDeviceSerialNumber;
  NSString *loggingProcessName;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 14))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
LABEL_33:
    v13 = 0;
    goto LABEL_34;
  }
  termsText = self->_termsText;
  if ((unint64_t)termsText | *((_QWORD *)v4 + 11) && !-[NSData isEqual:](termsText, "isEqual:"))
    goto LABEL_33;
  documentationID = self->_documentationID;
  if ((unint64_t)documentationID | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](documentationID, "isEqual:"))
      goto LABEL_33;
  }
  presentationReason = self->_presentationReason;
  if ((unint64_t)presentationReason | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](presentationReason, "isEqual:"))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 4) == 0 || self->_presentationLocation != *((_DWORD *)v4 + 18))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 96) & 4) != 0)
  {
    goto LABEL_33;
  }
  acknowledgedDeviceName = self->_acknowledgedDeviceName;
  if ((unint64_t)acknowledgedDeviceName | *((_QWORD *)v4 + 2)
    && !-[NSString isEqual:](acknowledgedDeviceName, "isEqual:"))
  {
    goto LABEL_33;
  }
  acknowledgedDeviceSerialNumber = self->_acknowledgedDeviceSerialNumber;
  if ((unint64_t)acknowledgedDeviceSerialNumber | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](acknowledgedDeviceSerialNumber, "isEqual:"))
      goto LABEL_33;
  }
  displayDeviceName = self->_displayDeviceName;
  if ((unint64_t)displayDeviceName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayDeviceName, "isEqual:"))
      goto LABEL_33;
  }
  displayDeviceSerialNumber = self->_displayDeviceSerialNumber;
  if ((unint64_t)displayDeviceSerialNumber | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](displayDeviceSerialNumber, "isEqual:"))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_eventDate != *((double *)v4 + 1))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    goto LABEL_33;
  }
  loggingProcessName = self->_loggingProcessName;
  if ((unint64_t)loggingProcessName | *((_QWORD *)v4 + 8))
    v13 = -[NSString isEqual:](loggingProcessName, "isEqual:");
  else
    v13 = 1;
LABEL_34:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  unint64_t v10;
  double eventDate;
  double v12;
  long double v13;
  double v14;
  uint64_t v16;
  uint64_t v17;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v17 = 2654435761 * self->_eventType;
  else
    v17 = 0;
  v16 = -[NSData hash](self->_termsText, "hash");
  v3 = -[NSString hash](self->_documentationID, "hash");
  v4 = -[NSString hash](self->_presentationReason, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v5 = 2654435761 * self->_presentationLocation;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_acknowledgedDeviceName, "hash");
  v7 = -[NSString hash](self->_acknowledgedDeviceSerialNumber, "hash");
  v8 = -[NSString hash](self->_displayDeviceName, "hash");
  v9 = -[NSString hash](self->_displayDeviceSerialNumber, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    eventDate = self->_eventDate;
    v12 = -eventDate;
    if (eventDate >= 0.0)
      v12 = self->_eventDate;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  return v16 ^ v17 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSString hash](self->_loggingProcessName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    self->_eventType = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 2u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 11))
  {
    -[NRPBTermsEvent setTermsText:](self, "setTermsText:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[NRPBTermsEvent setDocumentationID:](self, "setDocumentationID:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[NRPBTermsEvent setPresentationReason:](self, "setPresentationReason:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 96) & 4) != 0)
  {
    self->_presentationLocation = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NRPBTermsEvent setAcknowledgedDeviceName:](self, "setAcknowledgedDeviceName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[NRPBTermsEvent setAcknowledgedDeviceSerialNumber:](self, "setAcknowledgedDeviceSerialNumber:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[NRPBTermsEvent setDisplayDeviceName:](self, "setDisplayDeviceName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NRPBTermsEvent setDisplayDeviceSerialNumber:](self, "setDisplayDeviceSerialNumber:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    self->_eventDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[NRPBTermsEvent setLoggingProcessName:](self, "setLoggingProcessName:");
    v4 = v5;
  }

}

- (int)eventType
{
  return self->_eventType;
}

- (NSData)termsText
{
  return self->_termsText;
}

- (void)setTermsText:(id)a3
{
  objc_storeStrong((id *)&self->_termsText, a3);
}

- (NSString)documentationID
{
  return self->_documentationID;
}

- (void)setDocumentationID:(id)a3
{
  objc_storeStrong((id *)&self->_documentationID, a3);
}

- (NSString)presentationReason
{
  return self->_presentationReason;
}

- (void)setPresentationReason:(id)a3
{
  objc_storeStrong((id *)&self->_presentationReason, a3);
}

- (int)presentationLocation
{
  return self->_presentationLocation;
}

- (NSString)acknowledgedDeviceName
{
  return self->_acknowledgedDeviceName;
}

- (void)setAcknowledgedDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_acknowledgedDeviceName, a3);
}

- (NSString)acknowledgedDeviceSerialNumber
{
  return self->_acknowledgedDeviceSerialNumber;
}

- (void)setAcknowledgedDeviceSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_acknowledgedDeviceSerialNumber, a3);
}

- (NSString)displayDeviceName
{
  return self->_displayDeviceName;
}

- (void)setDisplayDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_displayDeviceName, a3);
}

- (NSString)displayDeviceSerialNumber
{
  return self->_displayDeviceSerialNumber;
}

- (void)setDisplayDeviceSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_displayDeviceSerialNumber, a3);
}

- (double)eventDate
{
  return self->_eventDate;
}

- (NSString)loggingProcessName
{
  return self->_loggingProcessName;
}

- (void)setLoggingProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_loggingProcessName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termsText, 0);
  objc_storeStrong((id *)&self->_presentationReason, 0);
  objc_storeStrong((id *)&self->_loggingProcessName, 0);
  objc_storeStrong((id *)&self->_documentationID, 0);
  objc_storeStrong((id *)&self->_displayDeviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_displayDeviceName, 0);
  objc_storeStrong((id *)&self->_acknowledgedDeviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_acknowledgedDeviceName, 0);
}

@end
