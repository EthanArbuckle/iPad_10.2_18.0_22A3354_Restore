@implementation AppleCV3DSchemaContextSnapshot

- (void)setLuxLevel:(float)a3
{
  self->_luxLevel = a3;
}

- (void)setSmudgeLevel:(float)a3
{
  self->_smudgeLevel = a3;
}

- (void)setPrewittLevel:(float)a3
{
  self->_prewittLevel = a3;
}

- (void)setImuAcceleration:(float)a3
{
  self->_imuAcceleration = a3;
}

- (void)setImuAngularVelocityX:(float)a3
{
  self->_imuAngularVelocityX = a3;
}

- (void)setImuAngularVelocityY:(float)a3
{
  self->_imuAngularVelocityY = a3;
}

- (void)setImuAngularVelocityZ:(float)a3
{
  self->_imuAngularVelocityZ = a3;
}

- (void)setEnvironmentType:(int)a3
{
  self->_environmentType = a3;
}

- (BOOL)readFrom:(id)a3
{
  double v3;

  return sub_20E87D0C4(self, (uint64_t)a3, v3);
}

- (void)writeTo:(id)a3
{
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  -[AppleCV3DSchemaContextSnapshot luxLevel](self, "luxLevel");
  if (v4 != 0.0)
    PBDataWriterWriteFloatField();
  -[AppleCV3DSchemaContextSnapshot smudgeLevel](self, "smudgeLevel");
  if (v5 != 0.0)
    PBDataWriterWriteFloatField();
  -[AppleCV3DSchemaContextSnapshot prewittLevel](self, "prewittLevel");
  if (v6 != 0.0)
    PBDataWriterWriteFloatField();
  -[AppleCV3DSchemaContextSnapshot imuAcceleration](self, "imuAcceleration");
  if (v7 != 0.0)
    PBDataWriterWriteFloatField();
  -[AppleCV3DSchemaContextSnapshot imuAngularVelocityX](self, "imuAngularVelocityX");
  if (v8 != 0.0)
    PBDataWriterWriteFloatField();
  -[AppleCV3DSchemaContextSnapshot imuAngularVelocityY](self, "imuAngularVelocityY");
  if (v9 != 0.0)
    PBDataWriterWriteFloatField();
  -[AppleCV3DSchemaContextSnapshot imuAngularVelocityZ](self, "imuAngularVelocityZ");
  if (v10 != 0.0)
    PBDataWriterWriteFloatField();
  v11 = -[AppleCV3DSchemaContextSnapshot environmentType](self, "environmentType");
  v12 = v13;
  if (v11)
  {
    PBDataWriterWriteInt32Field();
    v12 = v13;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  float luxLevel;
  float v6;
  float smudgeLevel;
  float v8;
  float prewittLevel;
  float v10;
  float imuAcceleration;
  float v12;
  float imuAngularVelocityX;
  float v14;
  float imuAngularVelocityY;
  float v16;
  float imuAngularVelocityZ;
  float v18;
  BOOL v19;
  int environmentType;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  luxLevel = self->_luxLevel;
  objc_msgSend(v4, "luxLevel");
  if (luxLevel != v6)
    goto LABEL_9;
  smudgeLevel = self->_smudgeLevel;
  objc_msgSend(v4, "smudgeLevel");
  if (smudgeLevel != v8)
    goto LABEL_9;
  prewittLevel = self->_prewittLevel;
  objc_msgSend(v4, "prewittLevel");
  if (prewittLevel != v10)
    goto LABEL_9;
  imuAcceleration = self->_imuAcceleration;
  objc_msgSend(v4, "imuAcceleration");
  if (imuAcceleration != v12)
    goto LABEL_9;
  imuAngularVelocityX = self->_imuAngularVelocityX;
  objc_msgSend(v4, "imuAngularVelocityX");
  if (imuAngularVelocityX == v14
    && (imuAngularVelocityY = self->_imuAngularVelocityY,
        objc_msgSend(v4, "imuAngularVelocityY"),
        imuAngularVelocityY == v16)
    && (imuAngularVelocityZ = self->_imuAngularVelocityZ,
        objc_msgSend(v4, "imuAngularVelocityZ"),
        imuAngularVelocityZ == v18))
  {
    environmentType = self->_environmentType;
    v19 = environmentType == objc_msgSend(v4, "environmentType");
  }
  else
  {
LABEL_9:
    v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  float luxLevel;
  BOOL v4;
  double v5;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float smudgeLevel;
  BOOL v11;
  double v12;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  float prewittLevel;
  BOOL v18;
  double v19;
  double v20;
  long double v21;
  double v22;
  unint64_t v23;
  float imuAcceleration;
  BOOL v25;
  double v26;
  double v27;
  long double v28;
  double v29;
  unint64_t v30;
  float imuAngularVelocityX;
  BOOL v32;
  double v33;
  double v34;
  long double v35;
  double v36;
  unint64_t v37;
  float imuAngularVelocityY;
  BOOL v39;
  double v40;
  double v41;
  long double v42;
  double v43;
  unint64_t v44;
  float imuAngularVelocityZ;
  BOOL v46;
  double v47;
  double v48;
  long double v49;
  double v50;
  unint64_t v51;

  luxLevel = self->_luxLevel;
  v4 = luxLevel < 0.0;
  if (luxLevel == 0.0)
  {
    v9 = 0;
  }
  else
  {
    v5 = luxLevel;
    v6 = -v5;
    if (!v4)
      v6 = v5;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v9 += (unint64_t)v8;
    }
    else
    {
      v9 -= (unint64_t)fabs(v8);
    }
  }
  smudgeLevel = self->_smudgeLevel;
  v11 = smudgeLevel < 0.0;
  if (smudgeLevel == 0.0)
  {
    v16 = 0;
  }
  else
  {
    v12 = smudgeLevel;
    v13 = -v12;
    if (!v11)
      v13 = v12;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v16 += (unint64_t)v15;
    }
    else
    {
      v16 -= (unint64_t)fabs(v15);
    }
  }
  prewittLevel = self->_prewittLevel;
  v18 = prewittLevel < 0.0;
  if (prewittLevel == 0.0)
  {
    v23 = 0;
  }
  else
  {
    v19 = prewittLevel;
    v20 = -v19;
    if (!v18)
      v20 = v19;
    v21 = floor(v20 + 0.5);
    v22 = (v20 - v21) * 1.84467441e19;
    v23 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v23 += (unint64_t)v22;
    }
    else
    {
      v23 -= (unint64_t)fabs(v22);
    }
  }
  imuAcceleration = self->_imuAcceleration;
  v25 = imuAcceleration < 0.0;
  if (imuAcceleration == 0.0)
  {
    v30 = 0;
  }
  else
  {
    v26 = imuAcceleration;
    v27 = -v26;
    if (!v25)
      v27 = v26;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v30 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v30 += (unint64_t)v29;
    }
    else
    {
      v30 -= (unint64_t)fabs(v29);
    }
  }
  imuAngularVelocityX = self->_imuAngularVelocityX;
  v32 = imuAngularVelocityX < 0.0;
  if (imuAngularVelocityX == 0.0)
  {
    v37 = 0;
  }
  else
  {
    v33 = imuAngularVelocityX;
    v34 = -v33;
    if (!v32)
      v34 = v33;
    v35 = floor(v34 + 0.5);
    v36 = (v34 - v35) * 1.84467441e19;
    v37 = 2654435761u * (unint64_t)fmod(v35, 1.84467441e19);
    if (v36 >= 0.0)
    {
      if (v36 > 0.0)
        v37 += (unint64_t)v36;
    }
    else
    {
      v37 -= (unint64_t)fabs(v36);
    }
  }
  imuAngularVelocityY = self->_imuAngularVelocityY;
  v39 = imuAngularVelocityY < 0.0;
  if (imuAngularVelocityY == 0.0)
  {
    v44 = 0;
  }
  else
  {
    v40 = imuAngularVelocityY;
    v41 = -v40;
    if (!v39)
      v41 = v40;
    v42 = floor(v41 + 0.5);
    v43 = (v41 - v42) * 1.84467441e19;
    v44 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v44 += (unint64_t)v43;
    }
    else
    {
      v44 -= (unint64_t)fabs(v43);
    }
  }
  imuAngularVelocityZ = self->_imuAngularVelocityZ;
  v46 = imuAngularVelocityZ < 0.0;
  if (imuAngularVelocityZ == 0.0)
  {
    v51 = 0;
  }
  else
  {
    v47 = imuAngularVelocityZ;
    v48 = -v47;
    if (!v46)
      v48 = v47;
    v49 = floor(v48 + 0.5);
    v50 = (v48 - v49) * 1.84467441e19;
    v51 = 2654435761u * (unint64_t)fmod(v49, 1.84467441e19);
    if (v50 >= 0.0)
    {
      if (v50 > 0.0)
        v51 += (unint64_t)v50;
    }
    else
    {
      v51 -= (unint64_t)fabs(v50);
    }
  }
  return v16 ^ v9 ^ v23 ^ v30 ^ v37 ^ v44 ^ v51 ^ (2654435761 * self->_environmentType);
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_environmentType)
  {
    v4 = -[AppleCV3DSchemaContextSnapshot environmentType](self, "environmentType");
    if (v4 >= 0x20)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_24C9ABD88[(int)v4];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("environmentType"));

  }
  if (self->_imuAcceleration != 0.0)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    -[AppleCV3DSchemaContextSnapshot imuAcceleration](self, "imuAcceleration");
    objc_msgSend(v6, "numberWithFloat:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("imuAcceleration"));

  }
  if (self->_imuAngularVelocityX != 0.0)
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    -[AppleCV3DSchemaContextSnapshot imuAngularVelocityX](self, "imuAngularVelocityX");
    objc_msgSend(v8, "numberWithFloat:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("imuAngularVelocityX"));

  }
  if (self->_imuAngularVelocityY != 0.0)
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    -[AppleCV3DSchemaContextSnapshot imuAngularVelocityY](self, "imuAngularVelocityY");
    objc_msgSend(v10, "numberWithFloat:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("imuAngularVelocityY"));

  }
  if (self->_imuAngularVelocityZ != 0.0)
  {
    v12 = (void *)MEMORY[0x24BDD16E0];
    -[AppleCV3DSchemaContextSnapshot imuAngularVelocityZ](self, "imuAngularVelocityZ");
    objc_msgSend(v12, "numberWithFloat:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("imuAngularVelocityZ"));

  }
  if (self->_luxLevel != 0.0)
  {
    v14 = (void *)MEMORY[0x24BDD16E0];
    -[AppleCV3DSchemaContextSnapshot luxLevel](self, "luxLevel");
    objc_msgSend(v14, "numberWithFloat:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("luxLevel"));

  }
  if (self->_prewittLevel != 0.0)
  {
    v16 = (void *)MEMORY[0x24BDD16E0];
    -[AppleCV3DSchemaContextSnapshot prewittLevel](self, "prewittLevel");
    objc_msgSend(v16, "numberWithFloat:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("prewittLevel"));

  }
  if (self->_smudgeLevel != 0.0)
  {
    v18 = (void *)MEMORY[0x24BDD16E0];
    -[AppleCV3DSchemaContextSnapshot smudgeLevel](self, "smudgeLevel");
    objc_msgSend(v18, "numberWithFloat:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("smudgeLevel"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[AppleCV3DSchemaContextSnapshot dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSData *)v3;
  }
  else
  {

    return (NSData *)0;
  }
}

- (AppleCV3DSchemaContextSnapshot)initWithJSON:(id)a3
{
  void *v4;
  AppleCV3DSchemaContextSnapshot *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[AppleCV3DSchemaContextSnapshot initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (AppleCV3DSchemaContextSnapshot)initWithDictionary:(id)a3
{
  id v4;
  AppleCV3DSchemaContextSnapshot *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AppleCV3DSchemaContextSnapshot *v14;
  void *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AppleCV3DSchemaContextSnapshot;
  v5 = -[AppleCV3DSchemaContextSnapshot init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("luxLevel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "floatValue");
      -[AppleCV3DSchemaContextSnapshot setLuxLevel:](v5, "setLuxLevel:");
    }
    v16 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("smudgeLevel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "floatValue");
      -[AppleCV3DSchemaContextSnapshot setSmudgeLevel:](v5, "setSmudgeLevel:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("prewittLevel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      -[AppleCV3DSchemaContextSnapshot setPrewittLevel:](v5, "setPrewittLevel:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imuAcceleration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "floatValue");
      -[AppleCV3DSchemaContextSnapshot setImuAcceleration:](v5, "setImuAcceleration:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imuAngularVelocityX"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      -[AppleCV3DSchemaContextSnapshot setImuAngularVelocityX:](v5, "setImuAngularVelocityX:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imuAngularVelocityY"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v11, "floatValue");
      -[AppleCV3DSchemaContextSnapshot setImuAngularVelocityY:](v5, "setImuAngularVelocityY:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imuAngularVelocityZ"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      -[AppleCV3DSchemaContextSnapshot setImuAngularVelocityZ:](v5, "setImuAngularVelocityZ:");
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("environmentType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[AppleCV3DSchemaContextSnapshot setEnvironmentType:](v5, "setEnvironmentType:", objc_msgSend(v13, "intValue"));
    v14 = v5;

  }
  return v5;
}

- (float)luxLevel
{
  return self->_luxLevel;
}

- (float)smudgeLevel
{
  return self->_smudgeLevel;
}

- (float)prewittLevel
{
  return self->_prewittLevel;
}

- (float)imuAcceleration
{
  return self->_imuAcceleration;
}

- (float)imuAngularVelocityX
{
  return self->_imuAngularVelocityX;
}

- (float)imuAngularVelocityY
{
  return self->_imuAngularVelocityY;
}

- (float)imuAngularVelocityZ
{
  return self->_imuAngularVelocityZ;
}

- (int)environmentType
{
  return self->_environmentType;
}

@end
