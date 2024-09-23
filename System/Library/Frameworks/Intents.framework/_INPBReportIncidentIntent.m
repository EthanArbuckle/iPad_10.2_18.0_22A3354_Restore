@implementation _INPBReportIncidentIntent

- (void)setAdditionalDetails:(id)a3
{
  objc_storeStrong((id *)&self->_additionalDetails, a3);
}

- (BOOL)hasAdditionalDetails
{
  return self->_additionalDetails != 0;
}

- (void)setIncidentType:(id)a3
{
  objc_storeStrong((id *)&self->_incidentType, a3);
}

- (BOOL)hasIncidentType
{
  return self->_incidentType != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setIsClear:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isClear = a3;
}

- (BOOL)hasIsClear
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsClear:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setStartTime:(double)a3
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

- (void)setUserLocation:(id)a3
{
  objc_storeStrong((id *)&self->_userLocation, a3);
}

- (BOOL)hasUserLocation
{
  return self->_userLocation != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBReportIncidentIntentReadFrom(self, (uint64_t)a3);
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
  id v13;

  v13 = a3;
  -[_INPBReportIncidentIntent additionalDetails](self, "additionalDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBReportIncidentIntent additionalDetails](self, "additionalDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBReportIncidentIntent incidentType](self, "incidentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBReportIncidentIntent incidentType](self, "incidentType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBReportIncidentIntent intentMetadata](self, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBReportIncidentIntent intentMetadata](self, "intentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBReportIncidentIntent hasIsClear](self, "hasIsClear"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBReportIncidentIntent hasStartTime](self, "hasStartTime"))
    PBDataWriterWriteDoubleField();
  -[_INPBReportIncidentIntent userLocation](self, "userLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v10)
  {
    -[_INPBReportIncidentIntent userLocation](self, "userLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v11 = v13;
  }

}

- (_INPBReportIncidentIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBReportIncidentIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBReportIncidentIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBReportIncidentIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBReportIncidentIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBReportIncidentIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBReportIncidentIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = -[_INPBReportIncidentIntent init](+[_INPBReportIncidentIntent allocWithZone:](_INPBReportIncidentIntent, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_additionalDetails, "copyWithZone:", a3);
  -[_INPBReportIncidentIntent setAdditionalDetails:](v5, "setAdditionalDetails:", v6);

  v7 = -[_INPBSupportedTrafficIncidentType copyWithZone:](self->_incidentType, "copyWithZone:", a3);
  -[_INPBReportIncidentIntent setIncidentType:](v5, "setIncidentType:", v7);

  v8 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBReportIncidentIntent setIntentMetadata:](v5, "setIntentMetadata:", v8);

  if (-[_INPBReportIncidentIntent hasIsClear](self, "hasIsClear"))
    -[_INPBReportIncidentIntent setIsClear:](v5, "setIsClear:", -[_INPBReportIncidentIntent isClear](self, "isClear"));
  if (-[_INPBReportIncidentIntent hasStartTime](self, "hasStartTime"))
  {
    -[_INPBReportIncidentIntent startTime](self, "startTime");
    -[_INPBReportIncidentIntent setStartTime:](v5, "setStartTime:");
  }
  v9 = -[_INPBLocation copyWithZone:](self->_userLocation, "copyWithZone:", a3);
  -[_INPBReportIncidentIntent setUserLocation:](v5, "setUserLocation:", v9);

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
  int v22;
  int isClear;
  int v24;
  double startTime;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  BOOL v32;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  -[_INPBReportIncidentIntent additionalDetails](self, "additionalDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "additionalDetails");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[_INPBReportIncidentIntent additionalDetails](self, "additionalDetails");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBReportIncidentIntent additionalDetails](self, "additionalDetails");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "additionalDetails");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_30;
  }
  else
  {

  }
  -[_INPBReportIncidentIntent incidentType](self, "incidentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "incidentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[_INPBReportIncidentIntent incidentType](self, "incidentType");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBReportIncidentIntent incidentType](self, "incidentType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "incidentType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_30;
  }
  else
  {

  }
  -[_INPBReportIncidentIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_29;
  -[_INPBReportIncidentIntent intentMetadata](self, "intentMetadata");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_INPBReportIncidentIntent intentMetadata](self, "intentMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_30;
  }
  else
  {

  }
  v22 = -[_INPBReportIncidentIntent hasIsClear](self, "hasIsClear");
  if (v22 != objc_msgSend(v4, "hasIsClear"))
    goto LABEL_30;
  if (-[_INPBReportIncidentIntent hasIsClear](self, "hasIsClear"))
  {
    if (objc_msgSend(v4, "hasIsClear"))
    {
      isClear = self->_isClear;
      if (isClear != objc_msgSend(v4, "isClear"))
        goto LABEL_30;
    }
  }
  v24 = -[_INPBReportIncidentIntent hasStartTime](self, "hasStartTime");
  if (v24 != objc_msgSend(v4, "hasStartTime"))
    goto LABEL_30;
  if (-[_INPBReportIncidentIntent hasStartTime](self, "hasStartTime"))
  {
    if (objc_msgSend(v4, "hasStartTime"))
    {
      startTime = self->_startTime;
      objc_msgSend(v4, "startTime");
      if (startTime != v26)
        goto LABEL_30;
    }
  }
  -[_INPBReportIncidentIntent userLocation](self, "userLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBReportIncidentIntent userLocation](self, "userLocation");
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

LABEL_33:
      v32 = 1;
      goto LABEL_31;
    }
    v28 = (void *)v27;
    -[_INPBReportIncidentIntent userLocation](self, "userLocation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userLocation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if ((v31 & 1) != 0)
      goto LABEL_33;
  }
  else
  {
LABEL_29:

  }
LABEL_30:
  v32 = 0;
LABEL_31:

  return v32;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  double startTime;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;

  v3 = -[_INPBString hash](self->_additionalDetails, "hash");
  v4 = -[_INPBSupportedTrafficIncidentType hash](self->_incidentType, "hash");
  v5 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBReportIncidentIntent hasIsClear](self, "hasIsClear"))
    v6 = 2654435761 * self->_isClear;
  else
    v6 = 0;
  if (-[_INPBReportIncidentIntent hasStartTime](self, "hasStartTime"))
  {
    startTime = self->_startTime;
    v8 = -startTime;
    if (startTime >= 0.0)
      v8 = self->_startTime;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v11 += (unint64_t)v10;
    }
    else
    {
      v11 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ -[_INPBLocation hash](self->_userLocation, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBReportIncidentIntent additionalDetails](self, "additionalDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("additionalDetails"));

  -[_INPBReportIncidentIntent incidentType](self, "incidentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("incidentType"));

  -[_INPBReportIncidentIntent intentMetadata](self, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("intentMetadata"));

  if (-[_INPBReportIncidentIntent hasIsClear](self, "hasIsClear"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBReportIncidentIntent isClear](self, "isClear"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isClear"));

  }
  if (-[_INPBReportIncidentIntent hasStartTime](self, "hasStartTime"))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBReportIncidentIntent startTime](self, "startTime");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("startTime"));

  }
  -[_INPBReportIncidentIntent userLocation](self, "userLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("userLocation"));

  return v3;
}

- (_INPBString)additionalDetails
{
  return self->_additionalDetails;
}

- (_INPBSupportedTrafficIncidentType)incidentType
{
  return self->_incidentType;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (BOOL)isClear
{
  return self->_isClear;
}

- (double)startTime
{
  return self->_startTime;
}

- (_INPBLocation)userLocation
{
  return self->_userLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLocation, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_incidentType, 0);
  objc_storeStrong((id *)&self->_additionalDetails, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
