@implementation CLPBaroCalibrationIndication

- (void)setIsCalibratedBarometricAlt:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isCalibratedBarometricAlt = a3;
}

- (void)setHasIsCalibratedBarometricAlt:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsCalibratedBarometricAlt
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIsMapMatched:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isMapMatched = a3;
}

- (void)setHasIsMapMatched:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsMapMatched
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsOutdoorContext:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isOutdoorContext = a3;
}

- (void)setHasIsOutdoorContext:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsOutdoorContext
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setOutdoorConfidence:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_outdoorConfidence = a3;
}

- (void)setHasOutdoorConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOutdoorConfidence
{
  return *(_BYTE *)&self->_has & 1;
}

- (int)mapMatchRoadType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_mapMatchRoadType;
  else
    return 0;
}

- (void)setMapMatchRoadType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_mapMatchRoadType = a3;
}

- (void)setHasMapMatchRoadType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMapMatchRoadType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)mapMatchRoadTypeAsString:(int)a3
{
  if (a3 < 0x13)
    return *(&off_1E9595968 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapMatchRoadType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PartOfMotorway")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PartOfMultiCarriageWayNotMotorway")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ParOfSingleCarriageWayDefault")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PartOfRoundabout")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PartOfAnEtaParkingPlace")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PartOfAnEtaParkingGarageBuilding")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PartOfEtaUnstructuredTrafficSquare")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PartOfSlipRoad")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PartOfServiceRoad")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EntraceExitToFormCarPark")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PartOfPedestrianZone")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PartOfWalkWay")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SpecialTrafficFigures")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FowEtaGallery")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FowStairs")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RoadForAuthorities")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FowConnector")) & 1) != 0)
  {
    v4 = 17;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FowCulDeSac")))
  {
    v4 = 18;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)CLPBaroCalibrationIndication;
  -[CLPBaroCalibrationIndication description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPBaroCalibrationIndication dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t mapMatchRoadType;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCalibratedBarometricAlt);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("isCalibratedBarometricAlt"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMapMatched);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isMapMatched"));

  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_outdoorConfidence);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("outdoorConfidence"));

    if ((*(_BYTE *)&self->_has & 2) == 0)
      return v3;
    goto LABEL_11;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isOutdoorContext);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("isOutdoorContext"));

  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_10;
LABEL_5:
  if ((has & 2) == 0)
    return v3;
LABEL_11:
  mapMatchRoadType = self->_mapMatchRoadType;
  if (mapMatchRoadType >= 0x13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_mapMatchRoadType);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = *(&off_1E9595968 + mapMatchRoadType);
  }
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("mapMatchRoadType"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPBaroCalibrationIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_11:
    PBDataWriterWriteDoubleField();
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field();
LABEL_7:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[20] = self->_isCalibratedBarometricAlt;
    v4[24] |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[21] = self->_isMapMatched;
  v4[24] |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_11:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_outdoorConfidence;
    v4[24] |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  v4[22] = self->_isOutdoorContext;
  v4[24] |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 4) = self->_mapMatchRoadType;
    v4[24] |= 2u;
  }
LABEL_7:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)result + 20) = self->_isCalibratedBarometricAlt;
    *((_BYTE *)result + 24) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 21) = self->_isMapMatched;
  *((_BYTE *)result + 24) |= 8u;
  has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  *((_BYTE *)result + 22) = self->_isOutdoorContext;
  *((_BYTE *)result + 24) |= 0x10u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      return result;
    goto LABEL_6;
  }
LABEL_11:
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_outdoorConfidence;
  *((_BYTE *)result + 24) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    return result;
LABEL_6:
  *((_DWORD *)result + 4) = self->_mapMatchRoadType;
  *((_BYTE *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_35;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 4) == 0)
      goto LABEL_35;
    if (self->_isCalibratedBarometricAlt)
    {
      if (!*((_BYTE *)v4 + 20))
        goto LABEL_35;
    }
    else if (*((_BYTE *)v4 + 20))
    {
      goto LABEL_35;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 4) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 8) == 0)
      goto LABEL_35;
    if (self->_isMapMatched)
    {
      if (!*((_BYTE *)v4 + 21))
        goto LABEL_35;
    }
    else if (*((_BYTE *)v4 + 21))
    {
      goto LABEL_35;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 8) != 0)
  {
    goto LABEL_35;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 0x10) != 0)
    {
      if (self->_isOutdoorContext)
      {
        if (!*((_BYTE *)v4 + 22))
          goto LABEL_35;
        goto LABEL_26;
      }
      if (!*((_BYTE *)v4 + 22))
        goto LABEL_26;
    }
LABEL_35:
    v5 = 0;
    goto LABEL_36;
  }
  if ((*((_BYTE *)v4 + 24) & 0x10) != 0)
    goto LABEL_35;
LABEL_26:
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_outdoorConfidence != *((double *)v4 + 1))
      goto LABEL_35;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_35;
  }
  v5 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_mapMatchRoadType != *((_DWORD *)v4 + 4))
      goto LABEL_35;
    v5 = 1;
  }
LABEL_36:

  return v5;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double outdoorConfidence;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4 = 2654435761 * self->_isCalibratedBarometricAlt;
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_isMapMatched;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
        goto LABEL_4;
LABEL_11:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
LABEL_12:
      v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_11;
LABEL_4:
  v6 = 2654435761 * self->_isOutdoorContext;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_5:
  outdoorConfidence = self->_outdoorConfidence;
  v8 = -outdoorConfidence;
  if (outdoorConfidence >= 0.0)
    v8 = self->_outdoorConfidence;
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
LABEL_15:
  if ((has & 2) != 0)
    v12 = 2654435761 * self->_mapMatchRoadType;
  else
    v12 = 0;
  return v5 ^ v4 ^ v6 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 4) != 0)
  {
    self->_isCalibratedBarometricAlt = *((_BYTE *)v4 + 20);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 24);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)v4 + 24) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_isMapMatched = *((_BYTE *)v4 + 21);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0)
      goto LABEL_5;
LABEL_11:
    self->_outdoorConfidence = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    if ((*((_BYTE *)v4 + 24) & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  self->_isOutdoorContext = *((_BYTE *)v4 + 22);
  *(_BYTE *)&self->_has |= 0x10u;
  v5 = *((_BYTE *)v4 + 24);
  if ((v5 & 1) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 2) != 0)
  {
LABEL_6:
    self->_mapMatchRoadType = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:

}

- (BOOL)isCalibratedBarometricAlt
{
  return self->_isCalibratedBarometricAlt;
}

- (BOOL)isMapMatched
{
  return self->_isMapMatched;
}

- (BOOL)isOutdoorContext
{
  return self->_isOutdoorContext;
}

- (double)outdoorConfidence
{
  return self->_outdoorConfidence;
}

@end
