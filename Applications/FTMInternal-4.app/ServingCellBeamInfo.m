@implementation ServingCellBeamInfo

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear(&self->_rxBeamIds, a2);
  v3.receiver = self;
  v3.super_class = (Class)ServingCellBeamInfo;
  -[ServingCellBeamInfo dealloc](&v3, "dealloc");
}

- (void)setCellPci:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cellPci = a3;
}

- (void)setHasCellPci:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCellPci
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSsbIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_ssbIndex = a3;
}

- (void)setHasSsbIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (BOOL)hasSsbIndex
{
  return *(_BYTE *)&self->_has >> 7;
}

- (unint64_t)rxBeamIdsCount
{
  return self->_rxBeamIds.count;
}

- (unsigned)rxBeamIds
{
  return self->_rxBeamIds.list;
}

- (void)clearRxBeamIds
{
  PBRepeatedUInt32Clear(&self->_rxBeamIds, a2);
}

- (void)addRxBeamId:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_rxBeamIds, *(_QWORD *)&a3);
}

- (unsigned)rxBeamIdAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_rxBeamIds;
  unint64_t count;
  void *v6;
  void *v7;

  p_rxBeamIds = &self->_rxBeamIds;
  count = self->_rxBeamIds.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_rxBeamIds->list[a3];
}

- (void)setRxBeamIds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_rxBeamIds, a3, a4);
}

- (void)setNumDetectedTxBeams:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_numDetectedTxBeams = a3;
}

- (void)setHasNumDetectedTxBeams:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNumDetectedTxBeams
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setAntennaPanelIndex:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_antennaPanelIndex = a3;
}

- (void)setHasAntennaPanelIndex:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAntennaPanelIndex
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCellRsrp:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_cellRsrp = a3;
}

- (void)setHasCellRsrp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCellRsrp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCellRsrq:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_cellRsrq = a3;
}

- (void)setHasCellRsrq:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCellRsrq
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setRxBeamRsrp:(int)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_rxBeamRsrp = a3;
}

- (void)setHasRxBeamRsrp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRxBeamRsrp
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setRasterArfcn:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_rasterArfcn = a3;
}

- (void)setHasRasterArfcn:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRasterArfcn
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ServingCellBeamInfo;
  v3 = -[ServingCellBeamInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServingCellBeamInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_cellPci));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("cell_pci"));

    has = (char)self->_has;
  }
  if (has < 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_ssbIndex));
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("ssb_index"));

  }
  v7 = PBRepeatedUInt32NSArray(&self->_rxBeamIds);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("rx_beam_id"));

  v9 = (char)self->_has;
  if ((v9 & 0x10) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numDetectedTxBeams));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("num_detected_tx_beams"));

    v9 = (char)self->_has;
    if ((v9 & 1) == 0)
    {
LABEL_7:
      if ((v9 & 4) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_antennaPanelIndex));
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("antenna_panel_index"));

  v9 = (char)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_8:
    if ((v9 & 8) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_cellRsrp));
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("cell_rsrp"));

  v9 = (char)self->_has;
  if ((v9 & 8) == 0)
  {
LABEL_9:
    if ((v9 & 0x40) == 0)
      goto LABEL_10;
LABEL_17:
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_rxBeamRsrp));
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("rx_beam_rsrp"));

    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v3;
    goto LABEL_11;
  }
LABEL_16:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_cellRsrq));
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("cell_rsrq"));

  v9 = (char)self->_has;
  if ((v9 & 0x40) != 0)
    goto LABEL_17;
LABEL_10:
  if ((v9 & 0x20) != 0)
  {
LABEL_11:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_rasterArfcn));
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("raster_arfcn"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100059624((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  has = (char)self->_has;
  v8 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_cellPci, 1);
    v4 = v8;
    has = (char)self->_has;
  }
  if (has < 0)
  {
    PBDataWriterWriteUint32Field(v8, self->_ssbIndex, 2);
    v4 = v8;
  }
  if (self->_rxBeamIds.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v8, self->_rxBeamIds.list[v6], 3);
      v4 = v8;
      ++v6;
    }
    while (v6 < self->_rxBeamIds.count);
  }
  v7 = (char)self->_has;
  if ((v7 & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field(v8, self->_numDetectedTxBeams, 4);
    v4 = v8;
    v7 = (char)self->_has;
    if ((v7 & 1) == 0)
    {
LABEL_10:
      if ((v7 & 4) == 0)
        goto LABEL_11;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field(v8, self->_antennaPanelIndex, 5);
  v4 = v8;
  v7 = (char)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_11:
    if ((v7 & 8) == 0)
      goto LABEL_12;
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field(v8, self->_cellRsrp, 6);
  v4 = v8;
  v7 = (char)self->_has;
  if ((v7 & 8) == 0)
  {
LABEL_12:
    if ((v7 & 0x40) == 0)
      goto LABEL_13;
LABEL_20:
    PBDataWriterWriteInt32Field(v8, self->_rxBeamRsrp, 8);
    v4 = v8;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_19:
  PBDataWriterWriteInt32Field(v8, self->_cellRsrq, 7);
  v4 = v8;
  v7 = (char)self->_has;
  if ((v7 & 0x40) != 0)
    goto LABEL_20;
LABEL_13:
  if ((v7 & 0x20) != 0)
  {
LABEL_14:
    PBDataWriterWriteUint32Field(v8, self->_rasterArfcn, 9);
    v4 = v8;
  }
LABEL_15:

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  char v9;
  id v10;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[9] = self->_cellPci;
    *((_BYTE *)v4 + 64) |= 2u;
    has = (char)self->_has;
  }
  if (has < 0)
  {
    v4[15] = self->_ssbIndex;
    *((_BYTE *)v4 + 64) |= 0x80u;
  }
  v10 = v4;
  if (-[ServingCellBeamInfo rxBeamIdsCount](self, "rxBeamIdsCount"))
  {
    objc_msgSend(v10, "clearRxBeamIds");
    v6 = -[ServingCellBeamInfo rxBeamIdsCount](self, "rxBeamIdsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v10, "addRxBeamId:", -[ServingCellBeamInfo rxBeamIdAtIndex:](self, "rxBeamIdAtIndex:", i));
    }
  }
  v9 = (char)self->_has;
  if ((v9 & 0x10) != 0)
  {
    *((_DWORD *)v10 + 12) = self->_numDetectedTxBeams;
    *((_BYTE *)v10 + 64) |= 0x10u;
    v9 = (char)self->_has;
    if ((v9 & 1) == 0)
    {
LABEL_11:
      if ((v9 & 4) == 0)
        goto LABEL_12;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v10 + 8) = self->_antennaPanelIndex;
  *((_BYTE *)v10 + 64) |= 1u;
  v9 = (char)self->_has;
  if ((v9 & 4) == 0)
  {
LABEL_12:
    if ((v9 & 8) == 0)
      goto LABEL_13;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v10 + 10) = self->_cellRsrp;
  *((_BYTE *)v10 + 64) |= 4u;
  v9 = (char)self->_has;
  if ((v9 & 8) == 0)
  {
LABEL_13:
    if ((v9 & 0x40) == 0)
      goto LABEL_14;
LABEL_21:
    *((_DWORD *)v10 + 14) = self->_rxBeamRsrp;
    *((_BYTE *)v10 + 64) |= 0x40u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_20:
  *((_DWORD *)v10 + 11) = self->_cellRsrq;
  *((_BYTE *)v10 + 64) |= 8u;
  v9 = (char)self->_has;
  if ((v9 & 0x40) != 0)
    goto LABEL_21;
LABEL_14:
  if ((v9 & 0x20) != 0)
  {
LABEL_15:
    *((_DWORD *)v10 + 13) = self->_rasterArfcn;
    *((_BYTE *)v10 + 64) |= 0x20u;
  }
LABEL_16:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  _DWORD *v5;
  char has;
  char v7;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = v4;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[9] = self->_cellPci;
    *((_BYTE *)v4 + 64) |= 2u;
    has = (char)self->_has;
  }
  if (has < 0)
  {
    v4[15] = self->_ssbIndex;
    *((_BYTE *)v4 + 64) |= 0x80u;
  }
  PBRepeatedUInt32Copy(v4 + 2, &self->_rxBeamIds);
  v7 = (char)self->_has;
  if ((v7 & 0x10) != 0)
  {
    v5[12] = self->_numDetectedTxBeams;
    *((_BYTE *)v5 + 64) |= 0x10u;
    v7 = (char)self->_has;
    if ((v7 & 1) == 0)
    {
LABEL_7:
      if ((v7 & 4) == 0)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  v5[8] = self->_antennaPanelIndex;
  *((_BYTE *)v5 + 64) |= 1u;
  v7 = (char)self->_has;
  if ((v7 & 4) == 0)
  {
LABEL_8:
    if ((v7 & 8) == 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  v5[10] = self->_cellRsrp;
  *((_BYTE *)v5 + 64) |= 4u;
  v7 = (char)self->_has;
  if ((v7 & 8) == 0)
  {
LABEL_9:
    if ((v7 & 0x40) == 0)
      goto LABEL_10;
LABEL_17:
    v5[14] = self->_rxBeamRsrp;
    *((_BYTE *)v5 + 64) |= 0x40u;
    if ((*(_BYTE *)&self->_has & 0x20) == 0)
      return v5;
    goto LABEL_11;
  }
LABEL_16:
  v5[11] = self->_cellRsrq;
  *((_BYTE *)v5 + 64) |= 8u;
  v7 = (char)self->_has;
  if ((v7 & 0x40) != 0)
    goto LABEL_17;
LABEL_10:
  if ((v7 & 0x20) != 0)
  {
LABEL_11:
    v5[13] = self->_rasterArfcn;
    *((_BYTE *)v5 + 64) |= 0x20u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_42;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((v4[64] & 2) == 0 || self->_cellPci != *((_DWORD *)v4 + 9))
      goto LABEL_42;
  }
  else if ((v4[64] & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
  {
    if ((v4[64] & 0x80) == 0 || self->_ssbIndex != *((_DWORD *)v4 + 15))
      goto LABEL_42;
  }
  else if (v4[64] < 0)
  {
LABEL_42:
    v6 = 0;
    goto LABEL_43;
  }
  if (!PBRepeatedUInt32IsEqual(&self->_rxBeamIds, v4 + 8))
    goto LABEL_42;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((v4[64] & 0x10) == 0 || self->_numDetectedTxBeams != *((_DWORD *)v4 + 12))
      goto LABEL_42;
  }
  else if ((v4[64] & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v4[64] & 1) == 0 || self->_antennaPanelIndex != *((_DWORD *)v4 + 8))
      goto LABEL_42;
  }
  else if ((v4[64] & 1) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((v4[64] & 4) == 0 || self->_cellRsrp != *((_DWORD *)v4 + 10))
      goto LABEL_42;
  }
  else if ((v4[64] & 4) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v4[64] & 8) == 0 || self->_cellRsrq != *((_DWORD *)v4 + 11))
      goto LABEL_42;
  }
  else if ((v4[64] & 8) != 0)
  {
    goto LABEL_42;
  }
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((v4[64] & 0x40) == 0 || self->_rxBeamRsrp != *((_DWORD *)v4 + 14))
      goto LABEL_42;
  }
  else if ((v4[64] & 0x40) != 0)
  {
    goto LABEL_42;
  }
  v6 = (v4[64] & 0x20) == 0;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v4[64] & 0x20) == 0 || self->_rasterArfcn != *((_DWORD *)v4 + 13))
      goto LABEL_42;
    v6 = 1;
  }
LABEL_43:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_cellPci;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
      goto LABEL_3;
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 0x80) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_ssbIndex;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = PBRepeatedUInt32Hash(&self->_rxBeamIds);
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v6 = 2654435761 * self->_numDetectedTxBeams;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_8:
      v7 = 2654435761 * self->_antennaPanelIndex;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_9;
      goto LABEL_15;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_8;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_9:
    v8 = 2654435761 * self->_cellRsrp;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_10;
    goto LABEL_16;
  }
LABEL_15:
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_10:
    v9 = 2654435761 * self->_cellRsrq;
    if ((*(_BYTE *)&self->_has & 0x40) != 0)
      goto LABEL_11;
LABEL_17:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_12;
LABEL_18:
    v11 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v5;
  }
LABEL_16:
  v9 = 0;
  if ((*(_BYTE *)&self->_has & 0x40) == 0)
    goto LABEL_17;
LABEL_11:
  v10 = 2654435761 * self->_rxBeamRsrp;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_18;
LABEL_12:
  v11 = 2654435761 * self->_rasterArfcn;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  char *v6;
  char *v7;
  char *i;
  char v9;
  id v10;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 2) != 0)
  {
    self->_cellPci = *((_DWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 64);
  }
  if (v5 < 0)
  {
    self->_ssbIndex = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_has |= 0x80u;
  }
  v10 = v4;
  v6 = (char *)objc_msgSend(v4, "rxBeamIdsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[ServingCellBeamInfo addRxBeamId:](self, "addRxBeamId:", objc_msgSend(v10, "rxBeamIdAtIndex:", i));
  }
  v9 = *((_BYTE *)v10 + 64);
  if ((v9 & 0x10) != 0)
  {
    self->_numDetectedTxBeams = *((_DWORD *)v10 + 12);
    *(_BYTE *)&self->_has |= 0x10u;
    v9 = *((_BYTE *)v10 + 64);
    if ((v9 & 1) == 0)
    {
LABEL_10:
      if ((v9 & 4) == 0)
        goto LABEL_11;
      goto LABEL_18;
    }
  }
  else if ((*((_BYTE *)v10 + 64) & 1) == 0)
  {
    goto LABEL_10;
  }
  self->_antennaPanelIndex = *((_DWORD *)v10 + 8);
  *(_BYTE *)&self->_has |= 1u;
  v9 = *((_BYTE *)v10 + 64);
  if ((v9 & 4) == 0)
  {
LABEL_11:
    if ((v9 & 8) == 0)
      goto LABEL_12;
    goto LABEL_19;
  }
LABEL_18:
  self->_cellRsrp = *((_DWORD *)v10 + 10);
  *(_BYTE *)&self->_has |= 4u;
  v9 = *((_BYTE *)v10 + 64);
  if ((v9 & 8) == 0)
  {
LABEL_12:
    if ((v9 & 0x40) == 0)
      goto LABEL_13;
LABEL_20:
    self->_rxBeamRsrp = *((_DWORD *)v10 + 14);
    *(_BYTE *)&self->_has |= 0x40u;
    if ((*((_BYTE *)v10 + 64) & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_19:
  self->_cellRsrq = *((_DWORD *)v10 + 11);
  *(_BYTE *)&self->_has |= 8u;
  v9 = *((_BYTE *)v10 + 64);
  if ((v9 & 0x40) != 0)
    goto LABEL_20;
LABEL_13:
  if ((v9 & 0x20) != 0)
  {
LABEL_14:
    self->_rasterArfcn = *((_DWORD *)v10 + 13);
    *(_BYTE *)&self->_has |= 0x20u;
  }
LABEL_15:

}

- (unsigned)cellPci
{
  return self->_cellPci;
}

- (unsigned)ssbIndex
{
  return self->_ssbIndex;
}

- (unsigned)numDetectedTxBeams
{
  return self->_numDetectedTxBeams;
}

- (unsigned)antennaPanelIndex
{
  return self->_antennaPanelIndex;
}

- (int)cellRsrp
{
  return self->_cellRsrp;
}

- (int)cellRsrq
{
  return self->_cellRsrq;
}

- (int)rxBeamRsrp
{
  return self->_rxBeamRsrp;
}

- (unsigned)rasterArfcn
{
  return self->_rasterArfcn;
}

@end
