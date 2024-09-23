@implementation HMPBActionContainer

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_type;
  else
    return 1;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E3AB5A28[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CharacteristicWriteAction")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MediaPlaybackAction")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NaturalLightingAction")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasCharacteristicWriteAction
{
  return self->_characteristicWriteAction != 0;
}

- (BOOL)hasMediaPlaybackAction
{
  return self->_mediaPlaybackAction != 0;
}

- (BOOL)hasNaturalLightingAction
{
  return self->_naturalLightingAction != 0;
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
  v8.super_class = (Class)HMPBActionContainer;
  -[HMPBActionContainer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMPBActionContainer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  HMPBCharacteristicWriteAction *characteristicWriteAction;
  void *v7;
  HMPBMediaPlaybackAction *mediaPlaybackAction;
  void *v9;
  HMPBNaturalLightingAction *naturalLightingAction;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = self->_type - 1;
    if (v4 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E3AB5A28[v4];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  }
  characteristicWriteAction = self->_characteristicWriteAction;
  if (characteristicWriteAction)
  {
    -[HMPBCharacteristicWriteAction dictionaryRepresentation](characteristicWriteAction, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("characteristicWriteAction"));

  }
  mediaPlaybackAction = self->_mediaPlaybackAction;
  if (mediaPlaybackAction)
  {
    -[HMPBMediaPlaybackAction dictionaryRepresentation](mediaPlaybackAction, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("mediaPlaybackAction"));

  }
  naturalLightingAction = self->_naturalLightingAction;
  if (naturalLightingAction)
  {
    -[HMPBNaturalLightingAction dictionaryRepresentation](naturalLightingAction, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("naturalLightingAction"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HMPBActionContainerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_characteristicWriteAction)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_mediaPlaybackAction)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_naturalLightingAction)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[8] = self->_type;
    *((_BYTE *)v4 + 36) |= 1u;
  }
  v5 = v4;
  if (self->_characteristicWriteAction)
  {
    objc_msgSend(v4, "setCharacteristicWriteAction:");
    v4 = v5;
  }
  if (self->_mediaPlaybackAction)
  {
    objc_msgSend(v5, "setMediaPlaybackAction:");
    v4 = v5;
  }
  if (self->_naturalLightingAction)
  {
    objc_msgSend(v5, "setNaturalLightingAction:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(_BYTE *)(v5 + 36) |= 1u;
  }
  v7 = -[HMPBCharacteristicWriteAction copyWithZone:](self->_characteristicWriteAction, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[HMPBMediaPlaybackAction copyWithZone:](self->_mediaPlaybackAction, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  v11 = -[HMPBNaturalLightingAction copyWithZone:](self->_naturalLightingAction, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  HMPBCharacteristicWriteAction *characteristicWriteAction;
  HMPBMediaPlaybackAction *mediaPlaybackAction;
  HMPBNaturalLightingAction *naturalLightingAction;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  characteristicWriteAction = self->_characteristicWriteAction;
  if ((unint64_t)characteristicWriteAction | *((_QWORD *)v4 + 1)
    && !-[HMPBCharacteristicWriteAction isEqual:](characteristicWriteAction, "isEqual:"))
  {
    goto LABEL_13;
  }
  mediaPlaybackAction = self->_mediaPlaybackAction;
  if ((unint64_t)mediaPlaybackAction | *((_QWORD *)v4 + 2))
  {
    if (!-[HMPBMediaPlaybackAction isEqual:](mediaPlaybackAction, "isEqual:"))
      goto LABEL_13;
  }
  naturalLightingAction = self->_naturalLightingAction;
  if ((unint64_t)naturalLightingAction | *((_QWORD *)v4 + 3))
    v8 = -[HMPBNaturalLightingAction isEqual:](naturalLightingAction, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[HMPBCharacteristicWriteAction hash](self->_characteristicWriteAction, "hash") ^ v3;
  v5 = -[HMPBMediaPlaybackAction hash](self->_mediaPlaybackAction, "hash");
  return v4 ^ v5 ^ -[HMPBNaturalLightingAction hash](self->_naturalLightingAction, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  HMPBCharacteristicWriteAction *characteristicWriteAction;
  uint64_t v7;
  HMPBMediaPlaybackAction *mediaPlaybackAction;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  HMPBNaturalLightingAction *naturalLightingAction;
  uint64_t v20;
  _QWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 36) & 1) != 0)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  characteristicWriteAction = self->_characteristicWriteAction;
  v7 = v5[1];
  v21 = v5;
  if (characteristicWriteAction)
  {
    if (!v7)
      goto LABEL_9;
    -[HMPBCharacteristicWriteAction mergeFrom:](characteristicWriteAction, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    -[HMPBActionContainer setCharacteristicWriteAction:](self, "setCharacteristicWriteAction:");
  }
  v5 = v21;
LABEL_9:
  mediaPlaybackAction = self->_mediaPlaybackAction;
  v9 = (void *)v5[2];
  if (mediaPlaybackAction)
  {
    if (!v9)
      goto LABEL_30;
    v10 = v9;
    v11 = (void *)*((_QWORD *)v10 + 1);
    if (v11)
      objc_storeStrong((id *)&mediaPlaybackAction->_actionUUID, v11);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v12 = *((id *)v10 + 3);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          -[HMPBMediaPlaybackAction addMediaProfiles:]((uint64_t)mediaPlaybackAction, *(void **)(*((_QWORD *)&v22 + 1) + 8 * i));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);
    }

    if ((*((_BYTE *)v10 + 48) & 1) != 0)
    {
      mediaPlaybackAction->_mediaPlaybackState = *((_DWORD *)v10 + 4);
      *(_BYTE *)&mediaPlaybackAction->_has |= 1u;
    }
    v17 = (void *)*((_QWORD *)v10 + 5);
    if (v17)
      objc_storeStrong((id *)&mediaPlaybackAction->_volume, v17);
    v18 = (void *)*((_QWORD *)v10 + 4);
    if (v18)
      objc_storeStrong((id *)&mediaPlaybackAction->_playbackArchive, v18);

  }
  else
  {
    if (!v9)
      goto LABEL_30;
    -[HMPBActionContainer setMediaPlaybackAction:](self, "setMediaPlaybackAction:");
  }
  v5 = v21;
LABEL_30:
  naturalLightingAction = self->_naturalLightingAction;
  v20 = v5[3];
  if (naturalLightingAction)
  {
    if (v20)
    {
      -[HMPBNaturalLightingAction mergeFrom:](naturalLightingAction, "mergeFrom:");
LABEL_35:
      v5 = v21;
    }
  }
  else if (v20)
  {
    -[HMPBActionContainer setNaturalLightingAction:](self, "setNaturalLightingAction:");
    goto LABEL_35;
  }

}

- (HMPBCharacteristicWriteAction)characteristicWriteAction
{
  return self->_characteristicWriteAction;
}

- (void)setCharacteristicWriteAction:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicWriteAction, a3);
}

- (HMPBMediaPlaybackAction)mediaPlaybackAction
{
  return self->_mediaPlaybackAction;
}

- (void)setMediaPlaybackAction:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlaybackAction, a3);
}

- (HMPBNaturalLightingAction)naturalLightingAction
{
  return self->_naturalLightingAction;
}

- (void)setNaturalLightingAction:(id)a3
{
  objc_storeStrong((id *)&self->_naturalLightingAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_naturalLightingAction, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackAction, 0);
  objc_storeStrong((id *)&self->_characteristicWriteAction, 0);
}

@end
