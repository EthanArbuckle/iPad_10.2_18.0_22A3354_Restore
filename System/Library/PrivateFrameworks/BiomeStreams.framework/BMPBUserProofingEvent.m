@implementation BMPBUserProofingEvent

- (void)setAbsoluteTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAge
{
  return self->_age != 0;
}

- (BOOL)hasGender
{
  return self->_gender != 0;
}

- (BOOL)hasSkinTone
{
  return self->_skinTone != 0;
}

- (BOOL)hasEthnicity
{
  return self->_ethnicity != 0;
}

- (BOOL)hasDeviceLanguage
{
  return self->_deviceLanguage != 0;
}

- (BOOL)hasProofingDecision
{
  return self->_proofingDecision != 0;
}

- (BOOL)hasIssuer
{
  return self->_issuer != 0;
}

- (BOOL)hasLivenessAssessment
{
  return self->_livenessAssessment != 0;
}

- (BOOL)hasGestureAssessment
{
  return self->_gestureAssessment != 0;
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
  v8.super_class = (Class)BMPBUserProofingEvent;
  -[BMPBUserProofingEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBUserProofingEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *age;
  NSString *gender;
  NSString *skinTone;
  NSString *ethnicity;
  NSString *deviceLanguage;
  NSString *proofingDecision;
  NSString *issuer;
  NSString *livenessAssessment;
  NSString *gestureAssessment;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("absoluteTimestamp"));

  }
  age = self->_age;
  if (age)
    objc_msgSend(v3, "setObject:forKey:", age, CFSTR("age"));
  gender = self->_gender;
  if (gender)
    objc_msgSend(v3, "setObject:forKey:", gender, CFSTR("gender"));
  skinTone = self->_skinTone;
  if (skinTone)
    objc_msgSend(v3, "setObject:forKey:", skinTone, CFSTR("skinTone"));
  ethnicity = self->_ethnicity;
  if (ethnicity)
    objc_msgSend(v3, "setObject:forKey:", ethnicity, CFSTR("ethnicity"));
  deviceLanguage = self->_deviceLanguage;
  if (deviceLanguage)
    objc_msgSend(v3, "setObject:forKey:", deviceLanguage, CFSTR("deviceLanguage"));
  proofingDecision = self->_proofingDecision;
  if (proofingDecision)
    objc_msgSend(v3, "setObject:forKey:", proofingDecision, CFSTR("proofingDecision"));
  issuer = self->_issuer;
  if (issuer)
    objc_msgSend(v3, "setObject:forKey:", issuer, CFSTR("issuer"));
  livenessAssessment = self->_livenessAssessment;
  if (livenessAssessment)
    objc_msgSend(v3, "setObject:forKey:", livenessAssessment, CFSTR("livenessAssessment"));
  gestureAssessment = self->_gestureAssessment;
  if (gestureAssessment)
    objc_msgSend(v3, "setObject:forKey:", gestureAssessment, CFSTR("gestureAssessment"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBUserProofingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_age)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_gender)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_skinTone)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_ethnicity)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deviceLanguage)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_proofingDecision)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_issuer)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_livenessAssessment)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_gestureAssessment)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = *(_QWORD *)&self->_absoluteTimestamp;
    *((_BYTE *)v4 + 88) |= 1u;
  }
  v5 = v4;
  if (self->_age)
  {
    objc_msgSend(v4, "setAge:");
    v4 = v5;
  }
  if (self->_gender)
  {
    objc_msgSend(v5, "setGender:");
    v4 = v5;
  }
  if (self->_skinTone)
  {
    objc_msgSend(v5, "setSkinTone:");
    v4 = v5;
  }
  if (self->_ethnicity)
  {
    objc_msgSend(v5, "setEthnicity:");
    v4 = v5;
  }
  if (self->_deviceLanguage)
  {
    objc_msgSend(v5, "setDeviceLanguage:");
    v4 = v5;
  }
  if (self->_proofingDecision)
  {
    objc_msgSend(v5, "setProofingDecision:");
    v4 = v5;
  }
  if (self->_issuer)
  {
    objc_msgSend(v5, "setIssuer:");
    v4 = v5;
  }
  if (self->_livenessAssessment)
  {
    objc_msgSend(v5, "setLivenessAssessment:");
    v4 = v5;
  }
  if (self->_gestureAssessment)
  {
    objc_msgSend(v5, "setGestureAssessment:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
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
  uint64_t v23;
  void *v24;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(_BYTE *)(v5 + 88) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_age, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  v9 = -[NSString copyWithZone:](self->_gender, "copyWithZone:", a3);
  v10 = (void *)v6[5];
  v6[5] = v9;

  v11 = -[NSString copyWithZone:](self->_skinTone, "copyWithZone:", a3);
  v12 = (void *)v6[10];
  v6[10] = v11;

  v13 = -[NSString copyWithZone:](self->_ethnicity, "copyWithZone:", a3);
  v14 = (void *)v6[4];
  v6[4] = v13;

  v15 = -[NSString copyWithZone:](self->_deviceLanguage, "copyWithZone:", a3);
  v16 = (void *)v6[3];
  v6[3] = v15;

  v17 = -[NSString copyWithZone:](self->_proofingDecision, "copyWithZone:", a3);
  v18 = (void *)v6[9];
  v6[9] = v17;

  v19 = -[NSString copyWithZone:](self->_issuer, "copyWithZone:", a3);
  v20 = (void *)v6[7];
  v6[7] = v19;

  v21 = -[NSString copyWithZone:](self->_livenessAssessment, "copyWithZone:", a3);
  v22 = (void *)v6[8];
  v6[8] = v21;

  v23 = -[NSString copyWithZone:](self->_gestureAssessment, "copyWithZone:", a3);
  v24 = (void *)v6[6];
  v6[6] = v23;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *age;
  NSString *gender;
  NSString *skinTone;
  NSString *ethnicity;
  NSString *deviceLanguage;
  NSString *proofingDecision;
  NSString *issuer;
  NSString *livenessAssessment;
  NSString *gestureAssessment;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_25;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 88) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1))
      goto LABEL_25;
  }
  else if ((*((_BYTE *)v4 + 88) & 1) != 0)
  {
LABEL_25:
    v14 = 0;
    goto LABEL_26;
  }
  age = self->_age;
  if ((unint64_t)age | *((_QWORD *)v4 + 2) && !-[NSString isEqual:](age, "isEqual:"))
    goto LABEL_25;
  gender = self->_gender;
  if ((unint64_t)gender | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](gender, "isEqual:"))
      goto LABEL_25;
  }
  skinTone = self->_skinTone;
  if ((unint64_t)skinTone | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](skinTone, "isEqual:"))
      goto LABEL_25;
  }
  ethnicity = self->_ethnicity;
  if ((unint64_t)ethnicity | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](ethnicity, "isEqual:"))
      goto LABEL_25;
  }
  deviceLanguage = self->_deviceLanguage;
  if ((unint64_t)deviceLanguage | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceLanguage, "isEqual:"))
      goto LABEL_25;
  }
  proofingDecision = self->_proofingDecision;
  if ((unint64_t)proofingDecision | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](proofingDecision, "isEqual:"))
      goto LABEL_25;
  }
  issuer = self->_issuer;
  if ((unint64_t)issuer | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](issuer, "isEqual:"))
      goto LABEL_25;
  }
  livenessAssessment = self->_livenessAssessment;
  if ((unint64_t)livenessAssessment | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](livenessAssessment, "isEqual:"))
      goto LABEL_25;
  }
  gestureAssessment = self->_gestureAssessment;
  if ((unint64_t)gestureAssessment | *((_QWORD *)v4 + 6))
    v14 = -[NSString isEqual:](gestureAssessment, "isEqual:");
  else
    v14 = 1;
LABEL_26:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  double absoluteTimestamp;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    absoluteTimestamp = self->_absoluteTimestamp;
    v5 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0)
      v5 = self->_absoluteTimestamp;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSString hash](self->_age, "hash") ^ v3;
  v9 = -[NSString hash](self->_gender, "hash");
  v10 = v8 ^ v9 ^ -[NSString hash](self->_skinTone, "hash");
  v11 = -[NSString hash](self->_ethnicity, "hash");
  v12 = v11 ^ -[NSString hash](self->_deviceLanguage, "hash");
  v13 = v10 ^ v12 ^ -[NSString hash](self->_proofingDecision, "hash");
  v14 = -[NSString hash](self->_issuer, "hash");
  v15 = v14 ^ -[NSString hash](self->_livenessAssessment, "hash");
  return v13 ^ v15 ^ -[NSString hash](self->_gestureAssessment, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  if (((_BYTE)v4[11] & 1) != 0)
  {
    self->_absoluteTimestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[BMPBUserProofingEvent setAge:](self, "setAge:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[BMPBUserProofingEvent setGender:](self, "setGender:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[BMPBUserProofingEvent setSkinTone:](self, "setSkinTone:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBUserProofingEvent setEthnicity:](self, "setEthnicity:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBUserProofingEvent setDeviceLanguage:](self, "setDeviceLanguage:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[BMPBUserProofingEvent setProofingDecision:](self, "setProofingDecision:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[BMPBUserProofingEvent setIssuer:](self, "setIssuer:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[BMPBUserProofingEvent setLivenessAssessment:](self, "setLivenessAssessment:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[BMPBUserProofingEvent setGestureAssessment:](self, "setGestureAssessment:");
    v4 = v5;
  }

}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)age
{
  return self->_age;
}

- (void)setAge:(id)a3
{
  objc_storeStrong((id *)&self->_age, a3);
}

- (NSString)gender
{
  return self->_gender;
}

- (void)setGender:(id)a3
{
  objc_storeStrong((id *)&self->_gender, a3);
}

- (NSString)skinTone
{
  return self->_skinTone;
}

- (void)setSkinTone:(id)a3
{
  objc_storeStrong((id *)&self->_skinTone, a3);
}

- (NSString)ethnicity
{
  return self->_ethnicity;
}

- (void)setEthnicity:(id)a3
{
  objc_storeStrong((id *)&self->_ethnicity, a3);
}

- (NSString)deviceLanguage
{
  return self->_deviceLanguage;
}

- (void)setDeviceLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLanguage, a3);
}

- (NSString)proofingDecision
{
  return self->_proofingDecision;
}

- (void)setProofingDecision:(id)a3
{
  objc_storeStrong((id *)&self->_proofingDecision, a3);
}

- (NSString)issuer
{
  return self->_issuer;
}

- (void)setIssuer:(id)a3
{
  objc_storeStrong((id *)&self->_issuer, a3);
}

- (NSString)livenessAssessment
{
  return self->_livenessAssessment;
}

- (void)setLivenessAssessment:(id)a3
{
  objc_storeStrong((id *)&self->_livenessAssessment, a3);
}

- (NSString)gestureAssessment
{
  return self->_gestureAssessment;
}

- (void)setGestureAssessment:(id)a3
{
  objc_storeStrong((id *)&self->_gestureAssessment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skinTone, 0);
  objc_storeStrong((id *)&self->_proofingDecision, 0);
  objc_storeStrong((id *)&self->_livenessAssessment, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_gestureAssessment, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_ethnicity, 0);
  objc_storeStrong((id *)&self->_deviceLanguage, 0);
  objc_storeStrong((id *)&self->_age, 0);
}

@end
