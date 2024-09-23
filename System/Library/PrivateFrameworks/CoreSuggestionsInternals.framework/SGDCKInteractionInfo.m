@implementation SGDCKInteractionInfo

- (BOOL)hasInteractionId
{
  return self->_interactionId != 0;
}

- (BOOL)hasInteractionGroupId
{
  return self->_interactionGroupId != 0;
}

- (BOOL)hasInteractionBundleId
{
  return self->_interactionBundleId != 0;
}

- (BOOL)hasReservationItemReferences
{
  return self->_reservationItemReferences != 0;
}

- (BOOL)hasReservationContainerReference
{
  return self->_reservationContainerReference != 0;
}

- (BOOL)hasIntentResponseUserActivityString
{
  return self->_intentResponseUserActivityString != 0;
}

- (BOOL)hasInteractionTeamId
{
  return self->_interactionTeamId != 0;
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
  v8.super_class = (Class)SGDCKInteractionInfo;
  -[SGDCKInteractionInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGDCKInteractionInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *interactionId;
  NSString *interactionGroupId;
  NSString *interactionBundleId;
  NSData *reservationItemReferences;
  NSData *reservationContainerReference;
  NSString *intentResponseUserActivityString;
  NSString *interactionTeamId;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  interactionId = self->_interactionId;
  if (interactionId)
    objc_msgSend(v3, "setObject:forKey:", interactionId, CFSTR("interactionId"));
  interactionGroupId = self->_interactionGroupId;
  if (interactionGroupId)
    objc_msgSend(v4, "setObject:forKey:", interactionGroupId, CFSTR("interactionGroupId"));
  interactionBundleId = self->_interactionBundleId;
  if (interactionBundleId)
    objc_msgSend(v4, "setObject:forKey:", interactionBundleId, CFSTR("interactionBundleId"));
  reservationItemReferences = self->_reservationItemReferences;
  if (reservationItemReferences)
    objc_msgSend(v4, "setObject:forKey:", reservationItemReferences, CFSTR("reservationItemReferences"));
  reservationContainerReference = self->_reservationContainerReference;
  if (reservationContainerReference)
    objc_msgSend(v4, "setObject:forKey:", reservationContainerReference, CFSTR("reservationContainerReference"));
  intentResponseUserActivityString = self->_intentResponseUserActivityString;
  if (intentResponseUserActivityString)
    objc_msgSend(v4, "setObject:forKey:", intentResponseUserActivityString, CFSTR("intentResponseUserActivityString"));
  interactionTeamId = self->_interactionTeamId;
  if (interactionTeamId)
    objc_msgSend(v4, "setObject:forKey:", interactionTeamId, CFSTR("interactionTeamId"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SGDCKInteractionInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_interactionId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_interactionGroupId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_interactionBundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_reservationItemReferences)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_reservationContainerReference)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_intentResponseUserActivityString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_interactionTeamId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_interactionId)
  {
    objc_msgSend(v4, "setInteractionId:");
    v4 = v5;
  }
  if (self->_interactionGroupId)
  {
    objc_msgSend(v5, "setInteractionGroupId:");
    v4 = v5;
  }
  if (self->_interactionBundleId)
  {
    objc_msgSend(v5, "setInteractionBundleId:");
    v4 = v5;
  }
  if (self->_reservationItemReferences)
  {
    objc_msgSend(v5, "setReservationItemReferences:");
    v4 = v5;
  }
  if (self->_reservationContainerReference)
  {
    objc_msgSend(v5, "setReservationContainerReference:");
    v4 = v5;
  }
  if (self->_intentResponseUserActivityString)
  {
    objc_msgSend(v5, "setIntentResponseUserActivityString:");
    v4 = v5;
  }
  if (self->_interactionTeamId)
  {
    objc_msgSend(v5, "setInteractionTeamId:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_interactionId, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_interactionGroupId, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_interactionBundleId, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSData copyWithZone:](self->_reservationItemReferences, "copyWithZone:", a3);
  v13 = (void *)v5[7];
  v5[7] = v12;

  v14 = -[NSData copyWithZone:](self->_reservationContainerReference, "copyWithZone:", a3);
  v15 = (void *)v5[6];
  v5[6] = v14;

  v16 = -[NSString copyWithZone:](self->_intentResponseUserActivityString, "copyWithZone:", a3);
  v17 = (void *)v5[1];
  v5[1] = v16;

  v18 = -[NSString copyWithZone:](self->_interactionTeamId, "copyWithZone:", a3);
  v19 = (void *)v5[5];
  v5[5] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *interactionId;
  NSString *interactionGroupId;
  NSString *interactionBundleId;
  NSData *reservationItemReferences;
  NSData *reservationContainerReference;
  NSString *intentResponseUserActivityString;
  NSString *interactionTeamId;
  char v12;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((interactionId = self->_interactionId, !((unint64_t)interactionId | v4[4]))
     || -[NSString isEqual:](interactionId, "isEqual:"))
    && ((interactionGroupId = self->_interactionGroupId, !((unint64_t)interactionGroupId | v4[3]))
     || -[NSString isEqual:](interactionGroupId, "isEqual:"))
    && ((interactionBundleId = self->_interactionBundleId, !((unint64_t)interactionBundleId | v4[2]))
     || -[NSString isEqual:](interactionBundleId, "isEqual:"))
    && ((reservationItemReferences = self->_reservationItemReferences,
         !((unint64_t)reservationItemReferences | v4[7]))
     || -[NSData isEqual:](reservationItemReferences, "isEqual:"))
    && ((reservationContainerReference = self->_reservationContainerReference,
         !((unint64_t)reservationContainerReference | v4[6]))
     || -[NSData isEqual:](reservationContainerReference, "isEqual:"))
    && ((intentResponseUserActivityString = self->_intentResponseUserActivityString,
         !((unint64_t)intentResponseUserActivityString | v4[1]))
     || -[NSString isEqual:](intentResponseUserActivityString, "isEqual:")))
  {
    interactionTeamId = self->_interactionTeamId;
    if ((unint64_t)interactionTeamId | v4[5])
      v12 = -[NSString isEqual:](interactionTeamId, "isEqual:");
    else
      v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;

  v3 = -[NSString hash](self->_interactionId, "hash");
  v4 = -[NSString hash](self->_interactionGroupId, "hash") ^ v3;
  v5 = -[NSString hash](self->_interactionBundleId, "hash");
  v6 = v4 ^ v5 ^ -[NSData hash](self->_reservationItemReferences, "hash");
  v7 = -[NSData hash](self->_reservationContainerReference, "hash");
  v8 = v7 ^ -[NSString hash](self->_intentResponseUserActivityString, "hash");
  return v6 ^ v8 ^ -[NSString hash](self->_interactionTeamId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[4])
    -[SGDCKInteractionInfo setInteractionId:](self, "setInteractionId:");
  if (v4[3])
    -[SGDCKInteractionInfo setInteractionGroupId:](self, "setInteractionGroupId:");
  if (v4[2])
    -[SGDCKInteractionInfo setInteractionBundleId:](self, "setInteractionBundleId:");
  if (v4[7])
    -[SGDCKInteractionInfo setReservationItemReferences:](self, "setReservationItemReferences:");
  if (v4[6])
    -[SGDCKInteractionInfo setReservationContainerReference:](self, "setReservationContainerReference:");
  if (v4[1])
    -[SGDCKInteractionInfo setIntentResponseUserActivityString:](self, "setIntentResponseUserActivityString:");
  if (v4[5])
    -[SGDCKInteractionInfo setInteractionTeamId:](self, "setInteractionTeamId:");

}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (void)setInteractionId:(id)a3
{
  objc_storeStrong((id *)&self->_interactionId, a3);
}

- (NSString)interactionGroupId
{
  return self->_interactionGroupId;
}

- (void)setInteractionGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_interactionGroupId, a3);
}

- (NSString)interactionBundleId
{
  return self->_interactionBundleId;
}

- (void)setInteractionBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_interactionBundleId, a3);
}

- (NSData)reservationItemReferences
{
  return self->_reservationItemReferences;
}

- (void)setReservationItemReferences:(id)a3
{
  objc_storeStrong((id *)&self->_reservationItemReferences, a3);
}

- (NSData)reservationContainerReference
{
  return self->_reservationContainerReference;
}

- (void)setReservationContainerReference:(id)a3
{
  objc_storeStrong((id *)&self->_reservationContainerReference, a3);
}

- (NSString)intentResponseUserActivityString
{
  return self->_intentResponseUserActivityString;
}

- (void)setIntentResponseUserActivityString:(id)a3
{
  objc_storeStrong((id *)&self->_intentResponseUserActivityString, a3);
}

- (NSString)interactionTeamId
{
  return self->_interactionTeamId;
}

- (void)setInteractionTeamId:(id)a3
{
  objc_storeStrong((id *)&self->_interactionTeamId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reservationItemReferences, 0);
  objc_storeStrong((id *)&self->_reservationContainerReference, 0);
  objc_storeStrong((id *)&self->_interactionTeamId, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_interactionGroupId, 0);
  objc_storeStrong((id *)&self->_interactionBundleId, 0);
  objc_storeStrong((id *)&self->_intentResponseUserActivityString, 0);
}

@end
