@implementation BMPBDeviceMetadataEvent

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (int)platform
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_platform;
  else
    return 0;
}

- (void)setPlatform:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_platform = a3;
}

- (void)setHasPlatform:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlatform
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)platformAsString:(int)a3
{
  if (a3 < 9)
    return off_1E2649670[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlatform:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPad")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("iPhone")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MacDesktop")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MacPortable")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Watch")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomePod")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Vision")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasSupplementalBuild
{
  return self->_supplementalBuild != 0;
}

- (void)setRapidSecurityResponsePreReboot:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_rapidSecurityResponsePreReboot = a3;
}

- (void)setHasRapidSecurityResponsePreReboot:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRapidSecurityResponsePreReboot
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)BMPBDeviceMetadataEvent;
  -[BMPBDeviceMetadataEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBDeviceMetadataEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *name;
  NSString *build;
  uint64_t platform;
  __CFString *v8;
  NSString *supplementalBuild;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  name = self->_name;
  if (name)
    objc_msgSend(v3, "setObject:forKey:", name, CFSTR("name"));
  build = self->_build;
  if (build)
    objc_msgSend(v4, "setObject:forKey:", build, CFSTR("build"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    platform = self->_platform;
    if (platform >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_platform);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E2649670[platform];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("platform"));

  }
  supplementalBuild = self->_supplementalBuild;
  if (supplementalBuild)
    objc_msgSend(v4, "setObject:forKey:", supplementalBuild, CFSTR("supplementalBuild"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_rapidSecurityResponsePreReboot);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("rapidSecurityResponsePreReboot"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBDeviceMetadataEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_build)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_supplementalBuild)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    v4 = v5;
  }
  if (self->_build)
  {
    objc_msgSend(v5, "setBuild:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_platform;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  if (self->_supplementalBuild)
  {
    objc_msgSend(v5, "setSupplementalBuild:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_BYTE *)v4 + 40) = self->_rapidSecurityResponsePreReboot;
    *((_BYTE *)v4 + 44) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_build, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_platform;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v10 = -[NSString copyWithZone:](self->_supplementalBuild, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_rapidSecurityResponsePreReboot;
    *(_BYTE *)(v5 + 44) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *name;
  NSString *build;
  char has;
  NSString *supplementalBuild;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
      goto LABEL_16;
  }
  build = self->_build;
  if ((unint64_t)build | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](build, "isEqual:"))
      goto LABEL_16;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_platform != *((_DWORD *)v4 + 6))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_16;
  }
  supplementalBuild = self->_supplementalBuild;
  if ((unint64_t)supplementalBuild | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](supplementalBuild, "isEqual:"))
      goto LABEL_16;
    has = (char)self->_has;
  }
  v9 = (*((_BYTE *)v4 + 44) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) != 0)
    {
      if (self->_rapidSecurityResponsePreReboot)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_16;
      }
      else if (*((_BYTE *)v4 + 40))
      {
        goto LABEL_16;
      }
      v9 = 1;
      goto LABEL_17;
    }
LABEL_16:
    v9 = 0;
  }
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_build, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_platform;
  else
    v5 = 0;
  v6 = -[NSString hash](self->_supplementalBuild, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v7 = 2654435761 * self->_rapidSecurityResponsePreReboot;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[BMPBDeviceMetadataEvent setName:](self, "setName:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[BMPBDeviceMetadataEvent setBuild:](self, "setBuild:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_platform = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBDeviceMetadataEvent setSupplementalBuild:](self, "setSupplementalBuild:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    self->_rapidSecurityResponsePreReboot = *((_BYTE *)v4 + 40);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_storeStrong((id *)&self->_build, a3);
}

- (NSString)supplementalBuild
{
  return self->_supplementalBuild;
}

- (void)setSupplementalBuild:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalBuild, a3);
}

- (BOOL)rapidSecurityResponsePreReboot
{
  return self->_rapidSecurityResponsePreReboot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalBuild, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

@end
