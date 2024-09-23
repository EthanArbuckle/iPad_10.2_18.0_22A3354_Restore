@implementation CLPSatelliteInfo

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedBOOLClear();
  v3.receiver = self;
  v3.super_class = (Class)CLPSatelliteInfo;
  -[CLPSatelliteInfo dealloc](&v3, sel_dealloc);
}

- (unint64_t)satIdsCount
{
  return self->_satIds.count;
}

- (int)satIds
{
  return self->_satIds.list;
}

- (void)clearSatIds
{
  PBRepeatedInt32Clear();
}

- (void)addSatIds:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)satIdsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_satIds;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_satIds = &self->_satIds;
  count = self->_satIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_satIds->list[a3];
}

- (void)setSatIds:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)cnosCount
{
  return self->_cnos.count;
}

- (int)cnos
{
  return self->_cnos.list;
}

- (void)clearCnos
{
  PBRepeatedInt32Clear();
}

- (void)addCnos:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)cnosAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_cnos;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_cnos = &self->_cnos;
  count = self->_cnos.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_cnos->list[a3];
}

- (void)setCnos:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)azimuthsCount
{
  return self->_azimuths.count;
}

- (int)azimuths
{
  return self->_azimuths.list;
}

- (void)clearAzimuths
{
  PBRepeatedInt32Clear();
}

- (void)addAzimuths:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)azimuthsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_azimuths;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_azimuths = &self->_azimuths;
  count = self->_azimuths.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_azimuths->list[a3];
}

- (void)setAzimuths:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)elevationsCount
{
  return self->_elevations.count;
}

- (int)elevations
{
  return self->_elevations.list;
}

- (void)clearElevations
{
  PBRepeatedInt32Clear();
}

- (void)addElevations:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)elevationsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_elevations;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_elevations = &self->_elevations;
  count = self->_elevations.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_elevations->list[a3];
}

- (void)setElevations:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)isUsedInFixesCount
{
  return self->_isUsedInFixes.count;
}

- (BOOL)isUsedInFixes
{
  return self->_isUsedInFixes.list;
}

- (void)clearIsUsedInFixes
{
  PBRepeatedBOOLClear();
}

- (void)addIsUsedInFixes:(BOOL)a3
{
  PBRepeatedBOOLAdd();
}

- (BOOL)isUsedInFixesAtIndex:(unint64_t)a3
{
  $81BD420485C44FDD3B17AC2C53A57F4D *p_isUsedInFixes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_isUsedInFixes = &self->_isUsedInFixes;
  count = self->_isUsedInFixes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_isUsedInFixes->list[a3];
}

- (void)setIsUsedInFixes:(BOOL *)a3 count:(unint64_t)a4
{
  PBRepeatedBOOLSet();
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
  v8.super_class = (Class)CLPSatelliteInfo;
  -[CLPSatelliteInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPSatelliteInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedInt32NSArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("satIds"));

  PBRepeatedInt32NSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("cnos"));

  PBRepeatedInt32NSArray();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("azimuths"));

  PBRepeatedInt32NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v6, CFSTR("elevations"));

  PBRepeatedBOOLNSArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v7, CFSTR("isUsedInFixes"));

  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return CLPSatelliteInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  $81BD420485C44FDD3B17AC2C53A57F4D *p_isUsedInFixes;
  unint64_t v10;

  v4 = a3;
  if (self->_satIds.count)
  {
    PBDataWriterPlaceMark();
    if (self->_satIds.count)
    {
      v5 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v5;
      }
      while (v5 < self->_satIds.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_cnos.count)
  {
    PBDataWriterPlaceMark();
    if (self->_cnos.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteSint32Field();
        ++v6;
      }
      while (v6 < self->_cnos.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_azimuths.count)
  {
    PBDataWriterPlaceMark();
    if (self->_azimuths.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteSint32Field();
        ++v7;
      }
      while (v7 < self->_azimuths.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_elevations.count)
  {
    PBDataWriterPlaceMark();
    if (self->_elevations.count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteSint32Field();
        ++v8;
      }
      while (v8 < self->_elevations.count);
    }
    PBDataWriterRecallMark();
  }
  p_isUsedInFixes = &self->_isUsedInFixes;
  if (p_isUsedInFixes->count)
  {
    PBDataWriterPlaceMark();
    if (p_isUsedInFixes->count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteBOOLField();
        ++v10;
      }
      while (v10 < p_isUsedInFixes->count);
    }
    PBDataWriterRecallMark();
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  unint64_t v10;
  unint64_t v11;
  uint64_t k;
  unint64_t v13;
  unint64_t v14;
  uint64_t m;
  unint64_t v16;
  unint64_t v17;
  uint64_t n;
  id v19;

  v19 = a3;
  if (-[CLPSatelliteInfo satIdsCount](self, "satIdsCount"))
  {
    objc_msgSend(v19, "clearSatIds");
    v4 = -[CLPSatelliteInfo satIdsCount](self, "satIdsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v19, "addSatIds:", -[CLPSatelliteInfo satIdsAtIndex:](self, "satIdsAtIndex:", i));
    }
  }
  if (-[CLPSatelliteInfo cnosCount](self, "cnosCount"))
  {
    objc_msgSend(v19, "clearCnos");
    v7 = -[CLPSatelliteInfo cnosCount](self, "cnosCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
        objc_msgSend(v19, "addCnos:", -[CLPSatelliteInfo cnosAtIndex:](self, "cnosAtIndex:", j));
    }
  }
  if (-[CLPSatelliteInfo azimuthsCount](self, "azimuthsCount"))
  {
    objc_msgSend(v19, "clearAzimuths");
    v10 = -[CLPSatelliteInfo azimuthsCount](self, "azimuthsCount");
    if (v10)
    {
      v11 = v10;
      for (k = 0; k != v11; ++k)
        objc_msgSend(v19, "addAzimuths:", -[CLPSatelliteInfo azimuthsAtIndex:](self, "azimuthsAtIndex:", k));
    }
  }
  if (-[CLPSatelliteInfo elevationsCount](self, "elevationsCount"))
  {
    objc_msgSend(v19, "clearElevations");
    v13 = -[CLPSatelliteInfo elevationsCount](self, "elevationsCount");
    if (v13)
    {
      v14 = v13;
      for (m = 0; m != v14; ++m)
        objc_msgSend(v19, "addElevations:", -[CLPSatelliteInfo elevationsAtIndex:](self, "elevationsAtIndex:", m));
    }
  }
  if (-[CLPSatelliteInfo isUsedInFixesCount](self, "isUsedInFixesCount"))
  {
    objc_msgSend(v19, "clearIsUsedInFixes");
    v16 = -[CLPSatelliteInfo isUsedInFixesCount](self, "isUsedInFixesCount");
    if (v16)
    {
      v17 = v16;
      for (n = 0; n != v17; ++n)
        objc_msgSend(v19, "addIsUsedInFixes:", -[CLPSatelliteInfo isUsedInFixesAtIndex:](self, "isUsedInFixesAtIndex:", n));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedBOOLCopy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class())
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual())
  {
    v4 = PBRepeatedBOOLIsEqual();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = PBRepeatedInt32Hash();
  v3 = PBRepeatedInt32Hash() ^ v2;
  v4 = PBRepeatedInt32Hash();
  v5 = v3 ^ v4 ^ PBRepeatedInt32Hash();
  return v5 ^ PBRepeatedBOOLHash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  uint64_t v11;
  uint64_t k;
  uint64_t v13;
  uint64_t v14;
  uint64_t m;
  uint64_t v16;
  uint64_t v17;
  uint64_t n;
  id v19;

  v19 = a3;
  v4 = objc_msgSend(v19, "satIdsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[CLPSatelliteInfo addSatIds:](self, "addSatIds:", objc_msgSend(v19, "satIdsAtIndex:", i));
  }
  v7 = objc_msgSend(v19, "cnosCount");
  if (v7)
  {
    v8 = v7;
    for (j = 0; j != v8; ++j)
      -[CLPSatelliteInfo addCnos:](self, "addCnos:", objc_msgSend(v19, "cnosAtIndex:", j));
  }
  v10 = objc_msgSend(v19, "azimuthsCount");
  if (v10)
  {
    v11 = v10;
    for (k = 0; k != v11; ++k)
      -[CLPSatelliteInfo addAzimuths:](self, "addAzimuths:", objc_msgSend(v19, "azimuthsAtIndex:", k));
  }
  v13 = objc_msgSend(v19, "elevationsCount");
  if (v13)
  {
    v14 = v13;
    for (m = 0; m != v14; ++m)
      -[CLPSatelliteInfo addElevations:](self, "addElevations:", objc_msgSend(v19, "elevationsAtIndex:", m));
  }
  v16 = objc_msgSend(v19, "isUsedInFixesCount");
  if (v16)
  {
    v17 = v16;
    for (n = 0; n != v17; ++n)
      -[CLPSatelliteInfo addIsUsedInFixes:](self, "addIsUsedInFixes:", objc_msgSend(v19, "isUsedInFixesAtIndex:", n));
  }

}

@end
