@implementation HMMediaGroupProtoMediaGroupRole

- (BOOL)hasMediaSystem
{
  return self->_mediaSystem != 0;
}

- (void)setMediaSystem:(id)a3
{
  HMMediaGroupProtoMediaSystemRoles *v4;
  HMMediaGroupProtoMediaSystemRoles *mediaSystem;

  v4 = (HMMediaGroupProtoMediaSystemRoles *)a3;
  -[HMMediaGroupProtoMediaGroupRole clearOneofValuesForRole](self, "clearOneofValuesForRole");
  *(_BYTE *)&self->_has |= 1u;
  self->_role = 1;
  mediaSystem = self->_mediaSystem;
  self->_mediaSystem = v4;

}

- (int)role
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_role;
  else
    return 0;
}

- (void)setRole:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_role = a3;
}

- (void)setHasRole:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRole
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)roleAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("PBUNSET");
  if (a3 == 1)
  {
    v3 = CFSTR("mediaSystem");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRole:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("mediaSystem"));

  return v4;
}

- (void)clearOneofValuesForRole
{
  HMMediaGroupProtoMediaSystemRoles *mediaSystem;

  *(_BYTE *)&self->_has &= ~1u;
  self->_role = 0;
  mediaSystem = self->_mediaSystem;
  self->_mediaSystem = 0;

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
  v8.super_class = (Class)HMMediaGroupProtoMediaGroupRole;
  -[HMMediaGroupProtoMediaGroupRole description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaGroupProtoMediaGroupRole dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HMMediaGroupProtoMediaSystemRoles *mediaSystem;
  void *v5;
  int role;
  __CFString *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  mediaSystem = self->_mediaSystem;
  if (mediaSystem)
  {
    -[HMMediaGroupProtoMediaSystemRoles dictionaryRepresentation](mediaSystem, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mediaSystem"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    role = self->_role;
    if (role)
    {
      if (role == 1)
      {
        v7 = CFSTR("mediaSystem");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_role);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = CFSTR("PBUNSET");
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("role"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMMediaGroupProtoMediaGroupRoleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_mediaSystem)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_role;
    *((_BYTE *)v4 + 20) |= 1u;
  }
  if (self->_mediaSystem)
  {
    v5 = v4;
    objc_msgSend(v4, "setMediaSystem:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_role;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[HMMediaGroupProtoMediaSystemRoles copyWithZone:](self->_mediaSystem, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HMMediaGroupProtoMediaSystemRoles *mediaSystem;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_role != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  mediaSystem = self->_mediaSystem;
  if ((unint64_t)mediaSystem | *((_QWORD *)v4 + 1))
    v6 = -[HMMediaGroupProtoMediaSystemRoles isEqual:](mediaSystem, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_role;
  else
    v2 = 0;
  return -[HMMediaGroupProtoMediaSystemRoles hash](self->_mediaSystem, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  HMMediaGroupProtoMediaSystemRoles *mediaSystem;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
    self->_role = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  mediaSystem = self->_mediaSystem;
  v7 = v5[1];
  if (mediaSystem)
  {
    if (v7)
    {
      v8 = v5;
      -[HMMediaGroupProtoMediaSystemRoles mergeFrom:](mediaSystem, "mergeFrom:");
LABEL_8:
      v5 = v8;
    }
  }
  else if (v7)
  {
    v8 = v5;
    -[HMMediaGroupProtoMediaGroupRole setMediaSystem:](self, "setMediaSystem:");
    goto LABEL_8;
  }

}

- (HMMediaGroupProtoMediaSystemRoles)mediaSystem
{
  return self->_mediaSystem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaSystem, 0);
}

@end
