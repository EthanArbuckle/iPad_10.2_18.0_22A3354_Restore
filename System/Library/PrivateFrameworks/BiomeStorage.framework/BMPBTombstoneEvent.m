@implementation BMPBTombstoneEvent

- (BOOL)hasSegmentName
{
  if (result)
    return *(_QWORD *)(result + 48) != 0;
  return result;
}

- (uint64_t)setOffset:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 56) |= 4u;
    *(_DWORD *)(result + 20) = a2;
  }
  return result;
}

- (uint64_t)setHasOffset:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 4;
    else
      v2 = 0;
    *(_BYTE *)(result + 56) = *(_BYTE *)(result + 56) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasOffset
{
  if (result)
    return (*(unsigned __int8 *)(result + 56) >> 2) & 1;
  return result;
}

- (uint64_t)setLength:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 56) |= 2u;
    *(_DWORD *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasLength:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 2;
    else
      v2 = 0;
    *(_BYTE *)(result + 56) = *(_BYTE *)(result + 56) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasLength
{
  if (result)
    return (*(unsigned __int8 *)(result + 56) >> 1) & 1;
  return result;
}

- (uint64_t)reason
{
  if (result)
  {
    if ((*(_BYTE *)(result + 56) & 8) != 0)
      return *(unsigned int *)(result + 40);
    else
      return 0;
  }
  return result;
}

- (uint64_t)setReason:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 56) |= 8u;
    *(_DWORD *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setHasReason:(uint64_t)result
{
  char v2;

  if (result)
  {
    if (a2)
      v2 = 8;
    else
      v2 = 0;
    *(_BYTE *)(result + 56) = *(_BYTE *)(result + 56) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasReason
{
  if (result)
    return (*(unsigned __int8 *)(result + 56) >> 3) & 1;
  return result;
}

- (__CFString)reasonAsString:(void *)a1
{
  if (a1)
  {
    if (a2 < 3)
      return off_1E5565D88[(int)a2];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (uint64_t)StringAsReason:(uint64_t)a1
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
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("TTL")) & 1) != 0)
    {
      v6 = 1;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("UserInitiated")))
    {
      v6 = 2;
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

- (BOOL)hasProcessName
{
  if (result)
    return *(_QWORD *)(result + 32) != 0;
  return result;
}

- (uint64_t)setEventTimestamp:(uint64_t)result
{
  if (result)
  {
    *(_BYTE *)(result + 56) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasEventTimestamp:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 56) = *(_BYTE *)(result + 56) & 0xFE | a2;
  return result;
}

- (uint64_t)hasEventTimestamp
{
  if (result)
    return *(_BYTE *)(result + 56) & 1;
  return result;
}

- (BOOL)hasPolicyID
{
  if (result)
    return *(_QWORD *)(result + 24) != 0;
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
  v8.super_class = (Class)BMPBTombstoneEvent;
  -[BMPBTombstoneEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBTombstoneEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *segmentName;
  char has;
  void *v7;
  void *v8;
  uint64_t reason;
  __CFString *v10;
  NSString *processName;
  void *v12;
  NSString *policyID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  segmentName = self->_segmentName;
  if (segmentName)
    objc_msgSend(v3, "setObject:forKey:", segmentName, CFSTR("segmentName"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_offset);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("offset"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_13;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("length"));

  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_13;
LABEL_9:
  reason = self->_reason;
  if (reason >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_reason);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E5565D88[reason];
  }
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("reason"));

LABEL_13:
  processName = self->_processName;
  if (processName)
    objc_msgSend(v4, "setObject:forKey:", processName, CFSTR("processName"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_eventTimestamp);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("eventTimestamp"));

  }
  policyID = self->_policyID;
  if (policyID)
    objc_msgSend(v4, "setObject:forKey:", policyID, CFSTR("policyID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBTombstoneEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_segmentName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    v4 = v6;
  }
LABEL_7:
  if (self->_processName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_policyID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(uint64_t)a1
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  if (!a1)
    goto LABEL_14;
  v4 = *(void **)(a1 + 48);
  v8 = v3;
  if (v4)
  {
    -[BMPBTombstoneEvent setSegmentName:]((uint64_t)v3, v4);
    v3 = v8;
  }
  v5 = *(_BYTE *)(a1 + 56);
  if ((v5 & 4) == 0)
  {
    if ((*(_BYTE *)(a1 + 56) & 2) == 0)
      goto LABEL_6;
LABEL_16:
    *((_DWORD *)v3 + 4) = *(_DWORD *)(a1 + 16);
    *((_BYTE *)v3 + 56) |= 2u;
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  *((_DWORD *)v3 + 5) = *(_DWORD *)(a1 + 20);
  *((_BYTE *)v3 + 56) |= 4u;
  v5 = *(_BYTE *)(a1 + 56);
  if ((v5 & 2) != 0)
    goto LABEL_16;
LABEL_6:
  if ((v5 & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v3 + 10) = *(_DWORD *)(a1 + 40);
    *((_BYTE *)v3 + 56) |= 8u;
  }
LABEL_8:
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    -[BMPBTombstoneEvent setProcessName:]((uint64_t)v8, v6);
    v3 = v8;
  }
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    *((_QWORD *)v3 + 1) = *(_QWORD *)(a1 + 8);
    *((_BYTE *)v3 + 56) |= 1u;
  }
  v7 = *(void **)(a1 + 24);
  if (v7)
  {
    -[BMPBTombstoneEvent setPolicyID:]((uint64_t)v8, v7);
    v3 = v8;
  }
LABEL_14:

}

- (void)setSegmentName:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (void)setProcessName:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setPolicyID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_segmentName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_offset;
    *(_BYTE *)(v5 + 56) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_length;
  *(_BYTE *)(v5 + 56) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 40) = self->_reason;
    *(_BYTE *)(v5 + 56) |= 8u;
  }
LABEL_5:
  v9 = -[NSString copyWithZone:](self->_processName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_eventTimestamp;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v11 = -[NSString copyWithZone:](self->_policyID, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *segmentName;
  char has;
  NSString *processName;
  NSString *policyID;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  segmentName = self->_segmentName;
  if ((unint64_t)segmentName | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](segmentName, "isEqual:"))
      goto LABEL_29;
  }
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 4) == 0 || self->_offset != *((_DWORD *)v4 + 5))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 56) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 2) == 0 || self->_length != *((_DWORD *)v4 + 4))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 56) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 8) == 0 || self->_reason != *((_DWORD *)v4 + 10))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 56) & 8) != 0)
  {
    goto LABEL_29;
  }
  processName = self->_processName;
  if ((unint64_t)processName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](processName, "isEqual:"))
    {
LABEL_29:
      v9 = 0;
      goto LABEL_30;
    }
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_eventTimestamp != *((double *)v4 + 1))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    goto LABEL_29;
  }
  policyID = self->_policyID;
  if ((unint64_t)policyID | *((_QWORD *)v4 + 3))
    v9 = -[NSString isEqual:](policyID, "isEqual:");
  else
    v9 = 1;
LABEL_30:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  double eventTimestamp;
  double v10;
  long double v11;
  double v12;

  v3 = -[NSString hash](self->_segmentName, "hash");
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v4 = 2654435761 * self->_offset;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_length;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_reason;
    goto LABEL_8;
  }
LABEL_7:
  v6 = 0;
LABEL_8:
  v7 = -[NSString hash](self->_processName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    eventTimestamp = self->_eventTimestamp;
    v10 = -eventTimestamp;
    if (eventTimestamp >= 0.0)
      v10 = self->_eventTimestamp;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_policyID, "hash");
}

- (void)mergeFrom:(uint64_t)a1
{
  _QWORD *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  v3 = a2;
  if (!a1)
    goto LABEL_14;
  v4 = (void *)v3[6];
  v8 = v3;
  if (v4)
  {
    objc_storeStrong((id *)(a1 + 48), v4);
    v3 = v8;
  }
  v5 = *((_BYTE *)v3 + 56);
  if ((v5 & 4) == 0)
  {
    if ((v3[7] & 2) == 0)
      goto LABEL_6;
LABEL_16:
    *(_DWORD *)(a1 + 16) = *((_DWORD *)v3 + 4);
    *(_BYTE *)(a1 + 56) |= 2u;
    if ((v3[7] & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  *(_DWORD *)(a1 + 20) = *((_DWORD *)v3 + 5);
  *(_BYTE *)(a1 + 56) |= 4u;
  v5 = *((_BYTE *)v3 + 56);
  if ((v5 & 2) != 0)
    goto LABEL_16;
LABEL_6:
  if ((v5 & 8) != 0)
  {
LABEL_7:
    *(_DWORD *)(a1 + 40) = *((_DWORD *)v3 + 10);
    *(_BYTE *)(a1 + 56) |= 8u;
  }
LABEL_8:
  v6 = (void *)v3[4];
  if (v6)
  {
    objc_storeStrong((id *)(a1 + 32), v6);
    v3 = v8;
  }
  if ((v3[7] & 1) != 0)
  {
    *(_QWORD *)(a1 + 8) = v3[1];
    *(_BYTE *)(a1 + 56) |= 1u;
  }
  v7 = (void *)v3[3];
  if (v7)
  {
    objc_storeStrong((id *)(a1 + 24), v7);
    v3 = v8;
  }
LABEL_14:

}

- (uint64_t)segmentName
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (uint64_t)offset
{
  if (result)
    return *(unsigned int *)(result + 20);
  return result;
}

- (uint64_t)length
{
  if (result)
    return *(unsigned int *)(result + 16);
  return result;
}

- (uint64_t)processName
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

- (double)eventTimestamp
{
  if (a1)
    return *(double *)(a1 + 8);
  else
    return 0.0;
}

- (uint64_t)policyID
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentName, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_policyID, 0);
}

@end
