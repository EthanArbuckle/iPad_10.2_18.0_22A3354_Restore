@implementation CPLFaceInstance

- (BOOL)isPetDetectionType
{
  return -[CPLFaceInstance detectionType](self, "detectionType") > 2;
}

- (int64_t)compare:(id)a3
{
  id v5;
  int64_t v6;
  NSString *personIdentifier;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = (id)objc_opt_class();
        v14 = v18;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_ERROR, "Unexpected class type: %@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLFaceAnalysisReference.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v16, 31, CFSTR("Unexpected class type: %@"), objc_opt_class());

    abort();
  }
  if (!-[CPLFaceInstance isEqual:](self, "isEqual:", v5))
  {
    personIdentifier = self->_personIdentifier;
    if (!personIdentifier)
    {
      objc_msgSend(v5, "personIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_size);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "size");
        objc_msgSend(v11, "numberWithDouble:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v8, "compare:", v12);

        goto LABEL_6;
      }
      personIdentifier = self->_personIdentifier;
      if (!personIdentifier)
      {
        v6 = -1;
        goto LABEL_7;
      }
    }
    objc_msgSend(v5, "personIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[NSString compare:](personIdentifier, "compare:", v8);
LABEL_6:

    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (id)pointerDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)clearState
{
  -[CPLFaceInstance setFaceState:](self, "setFaceState:", 0);
}

- (BOOL)isNoneState
{
  return -[CPLFaceInstance faceState](self, "faceState") == 0;
}

- (void)setKeyFace:(BOOL)a3
{
  -[CPLFaceInstance _setFaceStateBit:fromBoolValue:](self, "_setFaceStateBit:fromBoolValue:", 1, a3);
}

- (BOOL)isKeyFace
{
  return -[CPLFaceInstance _isFaceStateBitSet:](self, "_isFaceStateBitSet:", 1);
}

- (void)setManual:(BOOL)a3
{
  -[CPLFaceInstance _setFaceStateBit:fromBoolValue:](self, "_setFaceStateBit:fromBoolValue:", 2, a3);
}

- (BOOL)isManual
{
  return -[CPLFaceInstance _isFaceStateBitSet:](self, "_isFaceStateBitSet:", 2);
}

- (void)_setFaceStateBit:(unsigned int)a3 fromBoolValue:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int v7;
  uint64_t v8;

  v4 = a4;
  v7 = -[CPLFaceInstance faceState](self, "faceState");
  if (v4)
    v8 = v7 | a3;
  else
    v8 = v7 & ~a3;
  -[CPLFaceInstance setFaceState:](self, "setFaceState:", v8);
}

- (BOOL)_isFaceStateBitSet:(unsigned int)a3
{
  return (a3 & ~-[CPLFaceInstance faceState](self, "faceState")) == 0;
}

- (BOOL)isTorsoOnly
{
  double v3;
  double v4;

  -[CPLFaceInstance centerX](self, "centerX");
  if (v3 != 0.0)
    return 0;
  -[CPLFaceInstance bodyCenterX](self, "bodyCenterX");
  return v4 != 0.0;
}

- (BOOL)hasPersonIdentifier
{
  return self->_personIdentifier != 0;
}

- (void)setCenterX:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_centerX = a3;
}

- (void)setHasCenterX:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCenterX
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setCenterY:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_centerY = a3;
}

- (void)setHasCenterY:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCenterY
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSize:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSize
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setFaceState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_faceState = a3;
}

- (void)setHasFaceState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasFaceState
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)clearRejectedPersonIdentifiers
{
  -[NSMutableArray removeAllObjects](self->_rejectedPersonIdentifiers, "removeAllObjects");
}

- (void)addRejectedPersonIdentifiers:(id)a3
{
  id v4;
  NSMutableArray *rejectedPersonIdentifiers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rejectedPersonIdentifiers = self->_rejectedPersonIdentifiers;
  v8 = v4;
  if (!rejectedPersonIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_rejectedPersonIdentifiers;
    self->_rejectedPersonIdentifiers = v6;

    v4 = v8;
    rejectedPersonIdentifiers = self->_rejectedPersonIdentifiers;
  }
  -[NSMutableArray addObject:](rejectedPersonIdentifiers, "addObject:", v4);

}

- (unint64_t)rejectedPersonIdentifiersCount
{
  return -[NSMutableArray count](self->_rejectedPersonIdentifiers, "count");
}

- (id)rejectedPersonIdentifiersAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_rejectedPersonIdentifiers, "objectAtIndex:", a3);
}

- (void)setNameSource:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_nameSource = a3;
}

- (void)setHasNameSource:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasNameSource
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setDetectionType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_detectionType = a3;
}

- (void)setHasDetectionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDetectionType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setBodyCenterX:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bodyCenterX = a3;
}

- (void)setHasBodyCenterX:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBodyCenterX
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setBodyCenterY:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bodyCenterY = a3;
}

- (void)setHasBodyCenterY:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBodyCenterY
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setBodyWidth:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_bodyWidth = a3;
}

- (void)setHasBodyWidth:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBodyWidth
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setBodyHeight:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_bodyHeight = a3;
}

- (void)setHasBodyHeight:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasBodyHeight
{
  return (*(_WORD *)&self->_has >> 2) & 1;
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
  v8.super_class = (Class)CPLFaceInstance;
  -[CPLFaceInstance description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLFaceInstance dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *personIdentifier;
  __int16 has;
  void *v7;
  NSMutableArray *rejectedPersonIdentifiers;
  __int16 v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  personIdentifier = self->_personIdentifier;
  if (personIdentifier)
    objc_msgSend(v3, "setObject:forKey:", personIdentifier, CFSTR("personIdentifier"));
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_centerX);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("centerX"));

    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0)
        goto LABEL_6;
      goto LABEL_20;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_centerY);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("centerY"));

  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_size);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("size"));

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_faceState);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("faceState"));

  }
LABEL_8:
  rejectedPersonIdentifiers = self->_rejectedPersonIdentifiers;
  if (rejectedPersonIdentifiers)
    objc_msgSend(v4, "setObject:forKey:", rejectedPersonIdentifiers, CFSTR("rejectedPersonIdentifiers"));
  v9 = (__int16)self->_has;
  if ((v9 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_nameSource);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("nameSource"));

    v9 = (__int16)self->_has;
    if ((v9 & 0x80) == 0)
    {
LABEL_12:
      if ((v9 & 1) == 0)
        goto LABEL_13;
      goto LABEL_24;
    }
  }
  else if ((v9 & 0x80) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_detectionType);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("detectionType"));

  v9 = (__int16)self->_has;
  if ((v9 & 1) == 0)
  {
LABEL_13:
    if ((v9 & 2) == 0)
      goto LABEL_14;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bodyCenterX);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("bodyCenterX"));

  v9 = (__int16)self->_has;
  if ((v9 & 2) == 0)
  {
LABEL_14:
    if ((v9 & 8) == 0)
      goto LABEL_15;
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bodyWidth);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("bodyWidth"));

    if ((*(_WORD *)&self->_has & 4) == 0)
      return v4;
    goto LABEL_16;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bodyCenterY);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("bodyCenterY"));

  v9 = (__int16)self->_has;
  if ((v9 & 8) != 0)
    goto LABEL_26;
LABEL_15:
  if ((v9 & 4) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_bodyHeight);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("bodyHeight"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CPLFaceInstanceReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int16 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_personIdentifier)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0)
        goto LABEL_6;
      goto LABEL_25;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x100) != 0)
LABEL_7:
    PBDataWriterWriteUint32Field();
LABEL_8:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_rejectedPersonIdentifiers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = (__int16)self->_has;
  if ((v11 & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    v11 = (__int16)self->_has;
    if ((v11 & 0x80) == 0)
    {
LABEL_17:
      if ((v11 & 1) == 0)
        goto LABEL_18;
      goto LABEL_29;
    }
  }
  else if ((v11 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteUint32Field();
  v11 = (__int16)self->_has;
  if ((v11 & 1) == 0)
  {
LABEL_18:
    if ((v11 & 2) == 0)
      goto LABEL_19;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  v11 = (__int16)self->_has;
  if ((v11 & 2) == 0)
  {
LABEL_19:
    if ((v11 & 8) == 0)
      goto LABEL_20;
LABEL_31:
    PBDataWriterWriteDoubleField();
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  v11 = (__int16)self->_has;
  if ((v11 & 8) != 0)
    goto LABEL_31;
LABEL_20:
  if ((v11 & 4) != 0)
LABEL_21:
    PBDataWriterWriteDoubleField();
LABEL_22:

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (self->_personIdentifier)
  {
    objc_msgSend(v4, "setPersonIdentifier:");
    v4 = v11;
  }
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_QWORD *)v4 + 5) = *(_QWORD *)&self->_centerX;
    *((_WORD *)v4 + 48) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0)
        goto LABEL_6;
LABEL_22:
      *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_size;
      *((_WORD *)v4 + 48) |= 0x40u;
      if ((*(_WORD *)&self->_has & 0x100) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *((_QWORD *)v4 + 6) = *(_QWORD *)&self->_centerY;
  *((_WORD *)v4 + 48) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_22;
LABEL_6:
  if ((has & 0x100) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 17) = self->_faceState;
    *((_WORD *)v4 + 48) |= 0x100u;
  }
LABEL_8:
  if (-[CPLFaceInstance rejectedPersonIdentifiersCount](self, "rejectedPersonIdentifiersCount"))
  {
    objc_msgSend(v11, "clearRejectedPersonIdentifiers");
    v6 = -[CPLFaceInstance rejectedPersonIdentifiersCount](self, "rejectedPersonIdentifiersCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[CPLFaceInstance rejectedPersonIdentifiersAtIndex:](self, "rejectedPersonIdentifiersAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addRejectedPersonIdentifiers:", v9);

      }
    }
  }
  v10 = (__int16)self->_has;
  if ((v10 & 0x200) != 0)
  {
    *((_DWORD *)v11 + 18) = self->_nameSource;
    *((_WORD *)v11 + 48) |= 0x200u;
    v10 = (__int16)self->_has;
    if ((v10 & 0x80) == 0)
    {
LABEL_14:
      if ((v10 & 1) == 0)
        goto LABEL_15;
      goto LABEL_26;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_14;
  }
  *((_DWORD *)v11 + 16) = self->_detectionType;
  *((_WORD *)v11 + 48) |= 0x80u;
  v10 = (__int16)self->_has;
  if ((v10 & 1) == 0)
  {
LABEL_15:
    if ((v10 & 2) == 0)
      goto LABEL_16;
    goto LABEL_27;
  }
LABEL_26:
  *((_QWORD *)v11 + 1) = *(_QWORD *)&self->_bodyCenterX;
  *((_WORD *)v11 + 48) |= 1u;
  v10 = (__int16)self->_has;
  if ((v10 & 2) == 0)
  {
LABEL_16:
    if ((v10 & 8) == 0)
      goto LABEL_17;
LABEL_28:
    *((_QWORD *)v11 + 4) = *(_QWORD *)&self->_bodyWidth;
    *((_WORD *)v11 + 48) |= 8u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
LABEL_27:
  *((_QWORD *)v11 + 2) = *(_QWORD *)&self->_bodyCenterY;
  *((_WORD *)v11 + 48) |= 2u;
  v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
    goto LABEL_28;
LABEL_17:
  if ((v10 & 4) != 0)
  {
LABEL_18:
    *((_QWORD *)v11 + 3) = *(_QWORD *)&self->_bodyHeight;
    *((_WORD *)v11 + 48) |= 4u;
  }
LABEL_19:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int16 has;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int16 v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_personIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v6;

  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(double *)(v5 + 40) = self->_centerX;
    *(_WORD *)(v5 + 96) |= 0x10u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 48) = self->_centerY;
  *(_WORD *)(v5 + 96) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_23:
  *(double *)(v5 + 56) = self->_size;
  *(_WORD *)(v5 + 96) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 68) = self->_faceState;
    *(_WORD *)(v5 + 96) |= 0x100u;
  }
LABEL_6:
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_rejectedPersonIdentifiers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend((id)v5, "addRejectedPersonIdentifiers:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v15 = (__int16)self->_has;
  if ((v15 & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_nameSource;
    *(_WORD *)(v5 + 96) |= 0x200u;
    v15 = (__int16)self->_has;
    if ((v15 & 0x80) == 0)
    {
LABEL_15:
      if ((v15 & 1) == 0)
        goto LABEL_16;
      goto LABEL_27;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(v5 + 64) = self->_detectionType;
  *(_WORD *)(v5 + 96) |= 0x80u;
  v15 = (__int16)self->_has;
  if ((v15 & 1) == 0)
  {
LABEL_16:
    if ((v15 & 2) == 0)
      goto LABEL_17;
    goto LABEL_28;
  }
LABEL_27:
  *(double *)(v5 + 8) = self->_bodyCenterX;
  *(_WORD *)(v5 + 96) |= 1u;
  v15 = (__int16)self->_has;
  if ((v15 & 2) == 0)
  {
LABEL_17:
    if ((v15 & 8) == 0)
      goto LABEL_18;
LABEL_29:
    *(double *)(v5 + 32) = self->_bodyWidth;
    *(_WORD *)(v5 + 96) |= 8u;
    if ((*(_WORD *)&self->_has & 4) == 0)
      return (id)v5;
    goto LABEL_19;
  }
LABEL_28:
  *(double *)(v5 + 16) = self->_bodyCenterY;
  *(_WORD *)(v5 + 96) |= 2u;
  v15 = (__int16)self->_has;
  if ((v15 & 8) != 0)
    goto LABEL_29;
LABEL_18:
  if ((v15 & 4) != 0)
  {
LABEL_19:
    *(double *)(v5 + 24) = self->_bodyHeight;
    *(_WORD *)(v5 + 96) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *personIdentifier;
  __int16 has;
  __int16 v7;
  NSMutableArray *rejectedPersonIdentifiers;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_57;
  personIdentifier = self->_personIdentifier;
  if ((unint64_t)personIdentifier | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](personIdentifier, "isEqual:"))
      goto LABEL_57;
  }
  has = (__int16)self->_has;
  v7 = *((_WORD *)v4 + 48);
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_centerX != *((double *)v4 + 5))
      goto LABEL_57;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_centerY != *((double *)v4 + 6))
      goto LABEL_57;
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_size != *((double *)v4 + 7))
      goto LABEL_57;
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 48) & 0x100) == 0 || self->_faceState != *((_DWORD *)v4 + 17))
      goto LABEL_57;
  }
  else if ((*((_WORD *)v4 + 48) & 0x100) != 0)
  {
    goto LABEL_57;
  }
  rejectedPersonIdentifiers = self->_rejectedPersonIdentifiers;
  if ((unint64_t)rejectedPersonIdentifiers | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](rejectedPersonIdentifiers, "isEqual:"))
    {
LABEL_57:
      v9 = 0;
      goto LABEL_58;
    }
    has = (__int16)self->_has;
    v7 = *((_WORD *)v4 + 48);
  }
  if ((has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_nameSource != *((_DWORD *)v4 + 18))
      goto LABEL_57;
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_detectionType != *((_DWORD *)v4 + 16))
      goto LABEL_57;
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_bodyCenterX != *((double *)v4 + 1))
      goto LABEL_57;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_bodyCenterY != *((double *)v4 + 2))
      goto LABEL_57;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_bodyWidth != *((double *)v4 + 4))
      goto LABEL_57;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_57;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_bodyHeight != *((double *)v4 + 3))
      goto LABEL_57;
    v9 = 1;
  }
  else
  {
    v9 = (v7 & 4) == 0;
  }
LABEL_58:

  return v9;
}

- (unint64_t)hash
{
  __int16 has;
  unint64_t v4;
  double centerX;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double centerY;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double size;
  double v16;
  long double v17;
  double v18;
  __int16 v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  double bodyCenterX;
  double v24;
  long double v25;
  double v26;
  unint64_t v27;
  double bodyCenterY;
  double v29;
  long double v30;
  double v31;
  unint64_t v32;
  double bodyWidth;
  double v34;
  long double v35;
  double v36;
  unint64_t v37;
  double bodyHeight;
  double v39;
  long double v40;
  double v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSUInteger v46;

  v46 = -[NSString hash](self->_personIdentifier, "hash");
  has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    centerX = self->_centerX;
    v6 = -centerX;
    if (centerX >= 0.0)
      v6 = self->_centerX;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 0x20) != 0)
  {
    centerY = self->_centerY;
    v11 = -centerY;
    if (centerY >= 0.0)
      v11 = self->_centerY;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 0x40) != 0)
  {
    size = self->_size;
    v16 = -size;
    if (size >= 0.0)
      v16 = self->_size;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 0x100) != 0)
    v45 = 2654435761 * self->_faceState;
  else
    v45 = 0;
  v44 = -[NSMutableArray hash](self->_rejectedPersonIdentifiers, "hash");
  v19 = (__int16)self->_has;
  if ((v19 & 0x200) != 0)
  {
    v43 = 2654435761 * self->_nameSource;
    if ((v19 & 0x80) != 0)
      goto LABEL_30;
  }
  else
  {
    v43 = 0;
    if ((v19 & 0x80) != 0)
    {
LABEL_30:
      v20 = 2654435761 * self->_detectionType;
      goto LABEL_33;
    }
  }
  v20 = 0;
LABEL_33:
  v21 = v4;
  if ((v19 & 1) != 0)
  {
    bodyCenterX = self->_bodyCenterX;
    v24 = -bodyCenterX;
    if (bodyCenterX >= 0.0)
      v24 = self->_bodyCenterX;
    v25 = floor(v24 + 0.5);
    v26 = (v24 - v25) * 1.84467441e19;
    v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0)
        v22 += (unint64_t)v26;
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    v22 = 0;
  }
  if ((v19 & 2) != 0)
  {
    bodyCenterY = self->_bodyCenterY;
    v29 = -bodyCenterY;
    if (bodyCenterY >= 0.0)
      v29 = self->_bodyCenterY;
    v30 = floor(v29 + 0.5);
    v31 = (v29 - v30) * 1.84467441e19;
    v27 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
    if (v31 >= 0.0)
    {
      if (v31 > 0.0)
        v27 += (unint64_t)v31;
    }
    else
    {
      v27 -= (unint64_t)fabs(v31);
    }
  }
  else
  {
    v27 = 0;
  }
  if ((v19 & 8) != 0)
  {
    bodyWidth = self->_bodyWidth;
    v34 = -bodyWidth;
    if (bodyWidth >= 0.0)
      v34 = self->_bodyWidth;
    v35 = floor(v34 + 0.5);
    v36 = (v34 - v35) * 1.84467441e19;
    v32 = 2654435761u * (unint64_t)fmod(v35, 1.84467441e19);
    if (v36 >= 0.0)
    {
      if (v36 > 0.0)
        v32 += (unint64_t)v36;
    }
    else
    {
      v32 -= (unint64_t)fabs(v36);
    }
  }
  else
  {
    v32 = 0;
  }
  if ((v19 & 4) != 0)
  {
    bodyHeight = self->_bodyHeight;
    v39 = -bodyHeight;
    if (bodyHeight >= 0.0)
      v39 = self->_bodyHeight;
    v40 = floor(v39 + 0.5);
    v41 = (v39 - v40) * 1.84467441e19;
    v37 = 2654435761u * (unint64_t)fmod(v40, 1.84467441e19);
    if (v41 >= 0.0)
    {
      if (v41 > 0.0)
        v37 += (unint64_t)v41;
    }
    else
    {
      v37 -= (unint64_t)fabs(v41);
    }
  }
  else
  {
    v37 = 0;
  }
  return v21 ^ v46 ^ v9 ^ v14 ^ v45 ^ v44 ^ v43 ^ v20 ^ v22 ^ v27 ^ v32 ^ v37;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int16 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 10))
    -[CPLFaceInstance setPersonIdentifier:](self, "setPersonIdentifier:");
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x10) != 0)
  {
    self->_centerX = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
    v5 = *((_WORD *)v4 + 48);
    if ((v5 & 0x20) == 0)
    {
LABEL_5:
      if ((v5 & 0x40) == 0)
        goto LABEL_6;
      goto LABEL_25;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_5;
  }
  self->_centerY = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 48);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_25:
  self->_size = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 48) & 0x100) != 0)
  {
LABEL_7:
    self->_faceState = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_8:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *((id *)v4 + 11);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[CPLFaceInstance addRejectedPersonIdentifiers:](self, "addRejectedPersonIdentifiers:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = *((_WORD *)v4 + 48);
  if ((v11 & 0x200) != 0)
  {
    self->_nameSource = *((_DWORD *)v4 + 18);
    *(_WORD *)&self->_has |= 0x200u;
    v11 = *((_WORD *)v4 + 48);
    if ((v11 & 0x80) == 0)
    {
LABEL_17:
      if ((v11 & 1) == 0)
        goto LABEL_18;
      goto LABEL_29;
    }
  }
  else if ((v11 & 0x80) == 0)
  {
    goto LABEL_17;
  }
  self->_detectionType = *((_DWORD *)v4 + 16);
  *(_WORD *)&self->_has |= 0x80u;
  v11 = *((_WORD *)v4 + 48);
  if ((v11 & 1) == 0)
  {
LABEL_18:
    if ((v11 & 2) == 0)
      goto LABEL_19;
    goto LABEL_30;
  }
LABEL_29:
  self->_bodyCenterX = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  v11 = *((_WORD *)v4 + 48);
  if ((v11 & 2) == 0)
  {
LABEL_19:
    if ((v11 & 8) == 0)
      goto LABEL_20;
LABEL_31:
    self->_bodyWidth = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
    if ((*((_WORD *)v4 + 48) & 4) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
LABEL_30:
  self->_bodyCenterY = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  v11 = *((_WORD *)v4 + 48);
  if ((v11 & 8) != 0)
    goto LABEL_31;
LABEL_20:
  if ((v11 & 4) != 0)
  {
LABEL_21:
    self->_bodyHeight = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_22:

}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (void)setPersonIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_personIdentifier, a3);
}

- (double)centerX
{
  return self->_centerX;
}

- (double)centerY
{
  return self->_centerY;
}

- (double)size
{
  return self->_size;
}

- (unsigned)faceState
{
  return self->_faceState;
}

- (NSMutableArray)rejectedPersonIdentifiers
{
  return self->_rejectedPersonIdentifiers;
}

- (void)setRejectedPersonIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_rejectedPersonIdentifiers, a3);
}

- (unsigned)nameSource
{
  return self->_nameSource;
}

- (unsigned)detectionType
{
  return self->_detectionType;
}

- (double)bodyCenterX
{
  return self->_bodyCenterX;
}

- (double)bodyCenterY
{
  return self->_bodyCenterY;
}

- (double)bodyWidth
{
  return self->_bodyWidth;
}

- (double)bodyHeight
{
  return self->_bodyHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectedPersonIdentifiers, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
}

+ (Class)rejectedPersonIdentifiersType
{
  return (Class)objc_opt_class();
}

@end
