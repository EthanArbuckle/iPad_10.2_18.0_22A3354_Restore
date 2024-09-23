@implementation CLPMotionActivity

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v2 = 2654435761 * self->_type;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_confidence;
  return v3 ^ v2;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_type = a3;
}

- (void)setConfidence:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (int)type
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setHasType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 61)
  {
    if (a3 > 2149)
    {
      if (a3 > 17149)
      {
        if (a3 > 19149)
        {
          if (a3 == 19150)
            return CFSTR("TypeDownhillSkiing");
          if (a3 == 90603)
            return CFSTR("TypeOutdoorWheelchair");
        }
        else
        {
          if (a3 == 17150)
            return CFSTR("TypeIndoorWalking");
          if (a3 == 18240)
            return CFSTR("TypeSwimming");
        }
      }
      else if (a3 > 11804)
      {
        if (a3 == 11805)
          return CFSTR("TypePushingWheelchair");
        if (a3 == 12150)
          return CFSTR("TypeIndoorRunning");
      }
      else
      {
        if (a3 == 2150)
          return CFSTR("TypeYoga");
        if (a3 == 3015)
          return CFSTR("TypeDancing");
      }
    }
    else if (a3 > 2047)
    {
      if (a3 > 2064)
      {
        if (a3 == 2065)
          return CFSTR("TypeStairClimbing");
        if (a3 == 2071)
          return CFSTR("TypeRowing");
      }
      else
      {
        if (a3 == 2048)
          return CFSTR("TypeElliptical");
        if (a3 == 2061)
          return CFSTR("TypeCrossTraining");
      }
    }
    else if (a3 > 2009)
    {
      if (a3 == 2010)
        return CFSTR("TypeStationaryCycling");
      if (a3 == 2020)
        return CFSTR("TypeCalisthenics");
    }
    else
    {
      if (a3 == 62)
        return CFSTR("TypeWorkout");
      if (a3 == 100)
        return CFSTR("TypeCyclingLeg");
    }
  }
  else
  {
    if (a3 <= 40)
    {
      v3 = CFSTR("TypeUnknown");
      switch(a3)
      {
        case 0:
          return v3;
        case 1:
          v3 = CFSTR("TypeFrozen");
          return v3;
        case 2:
          result = CFSTR("TypeStatic");
          break;
        case 3:
          result = CFSTR("TypeMoving");
          break;
        case 4:
          result = CFSTR("TypeWalking");
          break;
        case 5:
          result = CFSTR("TypeDriving");
          break;
        case 6:
          result = CFSTR("TypeCycling");
          break;
        case 7:
          result = CFSTR("TypeSemiStationary");
          break;
        case 8:
          result = CFSTR("TypeRunning");
          break;
        case 9:
          result = CFSTR("TypeMovingCoarse");
          break;
        case 10:
          result = CFSTR("TypeInVehicleFrozen");
          break;
        case 11:
          result = CFSTR("TypeInVehicleStatic");
          break;
        default:
          goto LABEL_65;
      }
      return result;
    }
    if (a3 > 55)
    {
      if (a3 == 56)
        return CFSTR("TypeDrivingOther");
      if (a3 == 61)
        return CFSTR("TypeMachineWorkout");
    }
    else
    {
      if (a3 == 41)
        return CFSTR("TypeWalkingSlow");
      if (a3 == 52)
        return CFSTR("TypeVehicularInHand");
    }
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeUnknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeFrozen")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeStatic")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeMoving")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeWalking")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeDriving")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeCycling")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeSemiStationary")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeRunning")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeMovingCoarse")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeInVehicleFrozen")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeInVehicleStatic")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeWalkingSlow")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeVehicularInHand")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeDrivingOther")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeMachineWorkout")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeWorkout")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeCyclingLeg")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeStationaryCycling")) & 1) != 0)
  {
    v4 = 2010;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeCalisthenics")) & 1) != 0)
  {
    v4 = 2020;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeElliptical")) & 1) != 0)
  {
    v4 = 2048;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeCrossTraining")) & 1) != 0)
  {
    v4 = 2061;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeStairClimbing")) & 1) != 0)
  {
    v4 = 2065;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeRowing")) & 1) != 0)
  {
    v4 = 2071;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeYoga")) & 1) != 0)
  {
    v4 = 2150;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeDancing")) & 1) != 0)
  {
    v4 = 3015;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeIndoorRunning")) & 1) != 0)
  {
    v4 = 12150;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeIndoorWalking")) & 1) != 0)
  {
    v4 = 17150;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeSwimming")) & 1) != 0)
  {
    v4 = 18240;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypePushingWheelchair")) & 1) != 0)
  {
    v4 = 11805;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TypeOutdoorWheelchair")) & 1) != 0)
  {
    v4 = 90603;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TypeDownhillSkiing")))
  {
    v4 = 19150;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)confidence
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_confidence;
  else
    return 0;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)confidenceAsString:(int)a3
{
  if (a3 < 3)
    return *(&off_1E9595BD0 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsConfidence:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConfidenceLow")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConfidenceMedium")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ConfidenceHigh")))
  {
    v4 = 2;
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
  v8.super_class = (Class)CLPMotionActivity;
  -[CLPMotionActivity description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPMotionActivity dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  int type;
  __CFString *v6;
  uint64_t confidence;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    type = self->_type;
    if (type <= 61)
    {
      if (type <= 40)
      {
        v6 = CFSTR("TypeUnknown");
        switch(type)
        {
          case 0:
            goto LABEL_65;
          case 1:
            v6 = CFSTR("TypeFrozen");
            break;
          case 2:
            v6 = CFSTR("TypeStatic");
            break;
          case 3:
            v6 = CFSTR("TypeMoving");
            break;
          case 4:
            v6 = CFSTR("TypeWalking");
            break;
          case 5:
            v6 = CFSTR("TypeDriving");
            break;
          case 6:
            v6 = CFSTR("TypeCycling");
            break;
          case 7:
            v6 = CFSTR("TypeSemiStationary");
            break;
          case 8:
            v6 = CFSTR("TypeRunning");
            break;
          case 9:
            v6 = CFSTR("TypeMovingCoarse");
            break;
          case 10:
            v6 = CFSTR("TypeInVehicleFrozen");
            break;
          case 11:
            v6 = CFSTR("TypeInVehicleStatic");
            break;
          default:
            goto LABEL_64;
        }
        goto LABEL_65;
      }
      if (type > 55)
      {
        if (type == 56)
        {
          v6 = CFSTR("TypeDrivingOther");
          goto LABEL_65;
        }
        if (type == 61)
        {
          v6 = CFSTR("TypeMachineWorkout");
          goto LABEL_65;
        }
      }
      else
      {
        if (type == 41)
        {
          v6 = CFSTR("TypeWalkingSlow");
          goto LABEL_65;
        }
        if (type == 52)
        {
          v6 = CFSTR("TypeVehicularInHand");
          goto LABEL_65;
        }
      }
LABEL_64:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_65;
    }
    if (type > 2149)
    {
      if (type > 17149)
      {
        if (type > 19149)
        {
          if (type == 19150)
          {
            v6 = CFSTR("TypeDownhillSkiing");
            goto LABEL_65;
          }
          if (type == 90603)
          {
            v6 = CFSTR("TypeOutdoorWheelchair");
            goto LABEL_65;
          }
        }
        else
        {
          if (type == 17150)
          {
            v6 = CFSTR("TypeIndoorWalking");
            goto LABEL_65;
          }
          if (type == 18240)
          {
            v6 = CFSTR("TypeSwimming");
            goto LABEL_65;
          }
        }
        goto LABEL_64;
      }
      if (type > 11804)
      {
        if (type == 11805)
        {
          v6 = CFSTR("TypePushingWheelchair");
          goto LABEL_65;
        }
        if (type == 12150)
        {
          v6 = CFSTR("TypeIndoorRunning");
          goto LABEL_65;
        }
        goto LABEL_64;
      }
      if (type == 2150)
      {
        v6 = CFSTR("TypeYoga");
        goto LABEL_65;
      }
      if (type != 3015)
        goto LABEL_64;
      v6 = CFSTR("TypeDancing");
    }
    else
    {
      if (type > 2047)
      {
        if (type > 2064)
        {
          if (type == 2065)
          {
            v6 = CFSTR("TypeStairClimbing");
            goto LABEL_65;
          }
          if (type == 2071)
          {
            v6 = CFSTR("TypeRowing");
            goto LABEL_65;
          }
        }
        else
        {
          if (type == 2048)
          {
            v6 = CFSTR("TypeElliptical");
            goto LABEL_65;
          }
          if (type == 2061)
          {
            v6 = CFSTR("TypeCrossTraining");
            goto LABEL_65;
          }
        }
        goto LABEL_64;
      }
      if (type > 2009)
      {
        if (type == 2010)
        {
          v6 = CFSTR("TypeStationaryCycling");
          goto LABEL_65;
        }
        if (type == 2020)
        {
          v6 = CFSTR("TypeCalisthenics");
          goto LABEL_65;
        }
        goto LABEL_64;
      }
      if (type == 62)
      {
        v6 = CFSTR("TypeWorkout");
        goto LABEL_65;
      }
      if (type != 100)
        goto LABEL_64;
      v6 = CFSTR("TypeCyclingLeg");
    }
LABEL_65:
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    confidence = self->_confidence;
    if (confidence >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_confidence);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = *(&off_1E9595BD0 + confidence);
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("confidence"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPMotionActivityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_type;
    *((_BYTE *)v4 + 16) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v4[2] = self->_confidence;
    *((_BYTE *)v4 + 16) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_type;
    *((_BYTE *)result + 16) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_confidence;
    *((_BYTE *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 2) == 0 || self->_type != *((_DWORD *)v4 + 3))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = (*((_BYTE *)v4 + 16) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 16) & 1) == 0 || self->_confidence != *((_DWORD *)v4 + 2))
      goto LABEL_11;
    v5 = 1;
  }
LABEL_12:

  return v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 3);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 16);
  }
  if ((v5 & 1) != 0)
  {
    self->_confidence = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }

}

@end
