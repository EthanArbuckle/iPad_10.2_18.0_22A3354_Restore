@implementation GEOTrafficCameraInformation

- (BOOL)hasCameraIdentifier
{
  return self->_cameraIdentifier != 0;
}

- (NSString)cameraIdentifier
{
  return self->_cameraIdentifier;
}

- (void)setCameraIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_cameraIdentifier, a3);
}

- (int)cameraType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_cameraType;
  else
    return 0;
}

- (void)setCameraType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_cameraType = a3;
}

- (void)setHasCameraType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasCameraType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)cameraTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0CC50[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCameraType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_CAMERA_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_CAMERA_TYPE_RED_LIGHT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_CAMERA_TYPE_SPEED")))
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
  v8.super_class = (Class)GEOTrafficCameraInformation;
  -[GEOTrafficCameraInformation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTrafficCameraInformation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTrafficCameraInformation _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  const __CFString *v9;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "cameraIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("cameraIdentifier");
      else
        v6 = CFSTR("camera_identifier");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      v7 = *(int *)(a1 + 16);
      if (v7 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = off_1E1C0CC50[v7];
      }
      if (a2)
        v9 = CFSTR("cameraType");
      else
        v9 = CFSTR("camera_type");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

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
  return -[GEOTrafficCameraInformation _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOTrafficCameraInformation)initWithDictionary:(id)a3
{
  return (GEOTrafficCameraInformation *)-[GEOTrafficCameraInformation _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("cameraIdentifier");
      else
        v6 = CFSTR("camera_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setCameraIdentifier:", v8);

      }
      if (a3)
        v9 = CFSTR("cameraType");
      else
        v9 = CFSTR("camera_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TRAFFIC_CAMERA_TYPE_UNKNOWN")) & 1) != 0)
        {
          v12 = 0;
        }
        else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("TRAFFIC_CAMERA_TYPE_RED_LIGHT")) & 1) != 0)
        {
          v12 = 1;
        }
        else if (objc_msgSend(v11, "isEqualToString:", CFSTR("TRAFFIC_CAMERA_TYPE_SPEED")))
        {
          v12 = 2;
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_23:

          goto LABEL_24;
        }
        v12 = objc_msgSend(v10, "intValue");
      }
      objc_msgSend(a1, "setCameraType:", v12);
      goto LABEL_23;
    }
  }
LABEL_24:

  return a1;
}

- (GEOTrafficCameraInformation)initWithJSON:(id)a3
{
  return (GEOTrafficCameraInformation *)-[GEOTrafficCameraInformation _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTrafficCameraInformationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTrafficCameraInformationReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_cameraIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTrafficCameraInformation readAll:](self, "readAll:", 0);
  if (self->_cameraIdentifier)
    objc_msgSend(v4, "setCameraIdentifier:");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_cameraType;
    *((_BYTE *)v4 + 20) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_cameraIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_cameraType;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *cameraIdentifier;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_8;
  -[GEOTrafficCameraInformation readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  cameraIdentifier = self->_cameraIdentifier;
  if ((unint64_t)cameraIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](cameraIdentifier, "isEqual:"))
      goto LABEL_8;
  }
  v6 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0 && self->_cameraType == *((_DWORD *)v4 + 4))
    {
      v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;

  -[GEOTrafficCameraInformation readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_cameraIdentifier, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v4 = 2654435761 * self->_cameraType;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;

  v4 = (int *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 1))
    -[GEOTrafficCameraInformation setCameraIdentifier:](self, "setCameraIdentifier:");
  if ((v4[5] & 1) != 0)
  {
    self->_cameraType = v4[4];
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraIdentifier, 0);
}

@end
