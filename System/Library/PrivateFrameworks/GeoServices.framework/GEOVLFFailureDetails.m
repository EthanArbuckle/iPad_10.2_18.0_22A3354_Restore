@implementation GEOVLFFailureDetails

- (int)failureReason
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_failureReason;
  else
    return 0;
}

- (void)setFailureReason:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_failureReason = a3;
}

- (void)setHasFailureReason:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasFailureReason
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)failureReasonAsString:(int)a3
{
  if (a3 < 0x12)
    return off_1E1C239E0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFailureReason:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_BAD_IMAGE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_MAP_DATA_MISSING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_MAP_DATA_PENDING")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_POSE_FAILED")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_POSE_REJECTED_VIO")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_POSE_REJECTED_HEIGHT")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_POSE_REJECTED_GRAVITY")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_POSE_REJECTED_GPS")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_POSE_REJECTED_SCORE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_BAD_INPUT")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_REJECTED_CONFIDENCE")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_REJECTED_COVARIANCE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_POSE_DISCARDED_IMAGE_TILT")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_POSE_DISCARDED_IMAGE_GRAVITY")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_POSE_DISCARDED_IMAGE_CALIBRATION")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_POSE_DISCARDED_IMAGE_LOCATION_TYPE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFailureReason_POSE_DISCARDED_IMAGE_HORZ_UNCERTAINTY")))
  {
    v4 = 17;
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
  v8.super_class = (Class)GEOVLFFailureDetails;
  -[GEOVLFFailureDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFFailureDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFFailureDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 12) & 1) != 0)
    {
      v5 = *(int *)(a1 + 8);
      if (v5 >= 0x12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 8));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C239E0[v5];
      }
      if (a2)
        v7 = CFSTR("failureReason");
      else
        v7 = CFSTR("failure_reason");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFFailureDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFFailureDetails)initWithDictionary:(id)a3
{
  return (GEOVLFFailureDetails *)-[GEOVLFFailureDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("failureReason");
      else
        v6 = CFSTR("failure_reason");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_UNKNOWN")) & 1) != 0)
        {
          v9 = 0;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_BAD_IMAGE")) & 1) != 0)
        {
          v9 = 1;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_MAP_DATA_MISSING")) & 1) != 0)
        {
          v9 = 2;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_MAP_DATA_PENDING")) & 1) != 0)
        {
          v9 = 3;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_POSE_FAILED")) & 1) != 0)
        {
          v9 = 4;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_POSE_REJECTED_VIO")) & 1) != 0)
        {
          v9 = 5;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_POSE_REJECTED_HEIGHT")) & 1) != 0)
        {
          v9 = 6;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_POSE_REJECTED_GRAVITY")) & 1) != 0)
        {
          v9 = 7;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_POSE_REJECTED_GPS")) & 1) != 0)
        {
          v9 = 8;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_POSE_REJECTED_SCORE")) & 1) != 0)
        {
          v9 = 9;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_BAD_INPUT")) & 1) != 0)
        {
          v9 = 10;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_REJECTED_CONFIDENCE")) & 1) != 0)
        {
          v9 = 11;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_REJECTED_COVARIANCE")) & 1) != 0)
        {
          v9 = 12;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_POSE_DISCARDED_IMAGE_TILT")) & 1) != 0)
        {
          v9 = 13;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_POSE_DISCARDED_IMAGE_GRAVITY")) & 1) != 0)
        {
          v9 = 14;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_POSE_DISCARDED_IMAGE_CALIBRATION")) & 1) != 0)
        {
          v9 = 15;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_POSE_DISCARDED_IMAGE_LOCATION_TYPE")) & 1) != 0)
        {
          v9 = 16;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("VLFFailureReason_POSE_DISCARDED_IMAGE_HORZ_UNCERTAINTY")))
        {
          v9 = 17;
        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_48:

          goto LABEL_49;
        }
        v9 = objc_msgSend(v7, "intValue");
      }
      objc_msgSend(a1, "setFailureReason:", v9);
      goto LABEL_48;
    }
  }
LABEL_49:

  return a1;
}

- (GEOVLFFailureDetails)initWithJSON:(id)a3
{
  return (GEOVLFFailureDetails *)-[GEOVLFFailureDetails _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFFailureDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFFailureDetailsReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;

  v4 = a3;
  -[GEOVLFFailureDetails readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4[2] = self->_failureReason;
    *((_BYTE *)v4 + 12) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)result + 2) = self->_failureReason;
    *((_BYTE *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  -[GEOVLFFailureDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = (*((_BYTE *)v4 + 12) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 12) & 1) != 0 && self->_failureReason == *((_DWORD *)v4 + 2))
    {
      v5 = 1;
      goto LABEL_7;
    }
LABEL_6:
    v5 = 0;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  -[GEOVLFFailureDetails readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return 2654435761 * self->_failureReason;
  else
    return 0;
}

- (void)mergeFrom:(id)a3
{
  int *v4;

  v4 = (int *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((v4[3] & 1) != 0)
  {
    self->_failureReason = v4[2];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

@end
