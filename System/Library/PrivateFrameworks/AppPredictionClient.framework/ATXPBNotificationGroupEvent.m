@implementation ATXPBNotificationGroupEvent

- (uint64_t)eventType
{
  if (result)
  {
    if ((*(_BYTE *)(result + 32) & 2) != 0)
      return *(unsigned int *)(result + 16);
    else
      return 0;
  }
  return result;
}

- (uint64_t)setEventType:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 32) |= 2u;
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasEventType:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasEventType
{
  if (result)
    return (*(unsigned __int8 *)(result + 32) >> 1) & 1;
  return result;
}

- (__CFString)eventTypeAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 0x16)
      return off_1E4D59720[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsEventType:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Unused")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NotificationCenterAppeared")) & 1) != 0)
    {
      v6 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NotificationCenterDisappeared")) & 1) != 0)
    {
      v6 = 2;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NotificationCenterClearAll")) & 1) != 0)
    {
      v6 = 3;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MissedBundleAppeared")) & 1) != 0)
    {
      v6 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MissedBundleExpired")) & 1) != 0)
    {
      v6 = 5;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MissedBundleExpanded")) & 1) != 0)
    {
      v6 = 6;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MissedBundleCollapsed")) & 1) != 0)
    {
      v6 = 13;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MissedBundleDismissed")) & 1) != 0)
    {
      v6 = 7;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DigestAppeared")) & 1) != 0)
    {
      v6 = 8;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DigestExpired")) & 1) != 0)
    {
      v6 = 9;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DigestExpanded")) & 1) != 0)
    {
      v6 = 10;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DigestCollapsed")) & 1) != 0)
    {
      v6 = 14;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DigestDismissed")) & 1) != 0)
    {
      v6 = 11;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("DigestClearAll")) & 1) != 0)
    {
      v6 = 12;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SpringboardRestart")) & 1) != 0)
    {
      v6 = 15;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PriorityNotificationsSectionAppeared")) & 1) != 0)
    {
      v6 = 16;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PriorityNotificationsSectionDisappeared")) & 1) != 0)
    {
      v6 = 17;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PriorityNotificationsSectionExpanded")) & 1) != 0)
    {
      v6 = 18;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PriorityNotificationsSectionCollapsed")) & 1) != 0)
    {
      v6 = 19;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("PriorityNotificationsSectionClearAll")) & 1) != 0)
    {
      v6 = 20;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Total")))
    {
      v6 = 21;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasUuid
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
  return result;
}

- (uint64_t)setSecondsSinceReferenceDate:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 32) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasSecondsSinceReferenceDate:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 32) = *(_BYTE *)(result + 32) & 0xFE | a2;
  return result;
}

- (uint64_t)hasSecondsSinceReferenceDate
{
  if (result)
    return *(_BYTE *)(result + 32) & 1;
  return result;
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
  v8.super_class = (Class)ATXPBNotificationGroupEvent;
  -[ATXPBNotificationGroupEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBNotificationGroupEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t eventType;
  __CFString *v5;
  NSString *uuid;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    eventType = self->_eventType;
    if (eventType >= 0x16)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_eventType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E4D59720[eventType];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("eventType"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_secondsSinceReferenceDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("secondsSinceReferenceDate"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBNotificationGroupEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (void)copyTo:(uint64_t)a1
{
  _DWORD *v3;
  void *v4;
  _DWORD *v5;

  v3 = a2;
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 32) & 2) != 0)
    {
      v3[4] = *(_DWORD *)(a1 + 16);
      *((_BYTE *)v3 + 32) |= 2u;
    }
    v4 = *(void **)(a1 + 24);
    if (v4)
    {
      v5 = v3;
      -[ATXPBNotificationGroupEvent setUuid:]((uint64_t)v3, v4);
      v3 = v5;
    }
    if ((*(_BYTE *)(a1 + 32) & 1) != 0)
    {
      *((_QWORD *)v3 + 1) = *(_QWORD *)(a1 + 8);
      *((_BYTE *)v3 + 32) |= 1u;
    }
  }

}

- (void)setUuid:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_eventType;
    *(_BYTE *)(v5 + 32) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v6 + 8) = self->_secondsSinceReferenceDate;
    *(_BYTE *)(v6 + 32) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  NSString *uuid;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 4))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
    goto LABEL_14;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
    {
LABEL_14:
      v7 = 0;
      goto LABEL_15;
    }
    has = (char)self->_has;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_secondsSinceReferenceDate != *((double *)v4 + 1))
      goto LABEL_14;
    v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  double secondsSinceReferenceDate;
  double v7;
  long double v8;
  double v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_eventType;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_uuid, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    secondsSinceReferenceDate = self->_secondsSinceReferenceDate;
    v7 = -secondsSinceReferenceDate;
    if (secondsSinceReferenceDate >= 0.0)
      v7 = self->_secondsSinceReferenceDate;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(uint64_t)a1
{
  _DWORD *v3;
  void *v4;
  _DWORD *v5;

  v3 = a2;
  if (a1)
  {
    if ((v3[8] & 2) != 0)
    {
      *(_DWORD *)(a1 + 16) = v3[4];
      *(_BYTE *)(a1 + 32) |= 2u;
    }
    v4 = (void *)*((_QWORD *)v3 + 3);
    if (v4)
    {
      v5 = v3;
      objc_storeStrong((id *)(a1 + 24), v4);
      v3 = v5;
    }
    if ((v3[8] & 1) != 0)
    {
      *(_QWORD *)(a1 + 8) = *((_QWORD *)v3 + 1);
      *(_BYTE *)(a1 + 32) |= 1u;
    }
  }

}

- (uint64_t)uuid
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (double)secondsSinceReferenceDate
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
