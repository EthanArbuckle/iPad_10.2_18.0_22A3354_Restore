@implementation AudioQuality

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear(&self->_delayCnts, a2);
  v3.receiver = self;
  v3.super_class = (Class)AudioQuality;
  -[AudioQuality dealloc](&v3, "dealloc");
}

- (BOOL)hasRecordType
{
  return self->_recordType != 0;
}

- (void)setNumRecvdSpeechPkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_numRecvdSpeechPkt = a3;
}

- (void)setHasNumRecvdSpeechPkt:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasNumRecvdSpeechPkt
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setNumRecvdSilencePkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numRecvdSilencePkt = a3;
}

- (void)setHasNumRecvdSilencePkt:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumRecvdSilencePkt
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setNumLostPkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_numLostPkt = a3;
}

- (void)setHasNumLostPkt:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasNumLostPkt
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setNumUflwSpeechPkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_numUflwSpeechPkt = a3;
}

- (void)setHasNumUflwSpeechPkt:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasNumUflwSpeechPkt
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setNumUflwSilencePkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_numUflwSilencePkt = a3;
}

- (void)setHasNumUflwSilencePkt:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNumUflwSilencePkt
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setNumEnqdSpeechPkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_numEnqdSpeechPkt = a3;
}

- (void)setHasNumEnqdSpeechPkt:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasNumEnqdSpeechPkt
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setNumEnqdSilencePkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_numEnqdSilencePkt = a3;
}

- (void)setHasNumEnqdSilencePkt:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasNumEnqdSilencePkt
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNumPlayedSpeechPkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_numPlayedSpeechPkt = a3;
}

- (void)setHasNumPlayedSpeechPkt:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNumPlayedSpeechPkt
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setNumMissedSpeechPkt:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_numMissedSpeechPkt = a3;
}

- (void)setHasNumMissedSpeechPkt:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasNumMissedSpeechPkt
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setNumSpeechQempty:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_numSpeechQempty = a3;
}

- (void)setHasNumSpeechQempty:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasNumSpeechQempty
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (unint64_t)delayCntsCount
{
  return self->_delayCnts.count;
}

- (unsigned)delayCnts
{
  return self->_delayCnts.list;
}

- (void)clearDelayCnts
{
  PBRepeatedUInt32Clear(&self->_delayCnts, a2);
}

- (void)addDelayCnt:(unsigned int)a3
{
  PBRepeatedUInt32Add(&self->_delayCnts, *(_QWORD *)&a3);
}

- (unsigned)delayCntAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_delayCnts;
  unint64_t count;
  void *v6;
  void *v7;

  p_delayCnts = &self->_delayCnts;
  count = self->_delayCnts.count;
  if (count <= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSRangeException, v6, 0));
    objc_msgSend(v7, "raise");

  }
  return p_delayCnts->list[a3];
}

- (void)setDelayCnts:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set(&self->_delayCnts, a3, a4);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AudioQuality;
  v3 = -[AudioQuality description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AudioQuality dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *recordType;
  __int16 has;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  recordType = self->_recordType;
  if (recordType)
    objc_msgSend(v3, "setObject:forKey:", recordType, CFSTR("record_type"));
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numRecvdSpeechPkt));
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("num_recvd_speech_pkt"));

    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_17;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numRecvdSilencePkt));
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("num_recvd_silence_pkt"));

  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numLostPkt));
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("num_lost_pkt"));

  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numUflwSpeechPkt));
  objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("num_uflw_speech_pkt"));

  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numUflwSilencePkt));
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("num_uflw_silence_pkt"));

  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_21;
  }
LABEL_20:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numEnqdSpeechPkt));
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("num_enqd_speech_pkt"));

  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_22;
  }
LABEL_21:
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numEnqdSilencePkt));
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("num_enqd_silence_pkt"));

  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
LABEL_23:
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numMissedSpeechPkt));
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("num_missed_speech_pkt"));

    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_22:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numPlayedSpeechPkt));
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("num_played_speech_pkt"));

  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_23;
LABEL_12:
  if ((has & 0x80) != 0)
  {
LABEL_13:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_numSpeechQempty));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("num_speech_qempty"));

  }
LABEL_14:
  v8 = PBRepeatedUInt32NSArray(&self->_delayCnts);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("delay_cnt"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A706C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *recordType;
  __int16 has;
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_delayCnts;
  unint64_t v8;
  id v9;

  v4 = a3;
  recordType = self->_recordType;
  v9 = v4;
  if (recordType)
  {
    PBDataWriterWriteStringField(v4, recordType, 1);
    v4 = v9;
  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field(v9, self->_numRecvdSpeechPkt, 3);
    v4 = v9;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_20;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field(v9, self->_numRecvdSilencePkt, 4);
  v4 = v9;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field(v9, self->_numLostPkt, 5);
  v4 = v9;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field(v9, self->_numUflwSpeechPkt, 8);
  v4 = v9;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field(v9, self->_numUflwSilencePkt, 9);
  v4 = v9;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field(v9, self->_numEnqdSpeechPkt, 11);
  v4 = v9;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field(v9, self->_numEnqdSilencePkt, 12);
  v4 = v9;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field(v9, self->_numPlayedSpeechPkt, 16);
  v4 = v9;
  has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_26:
  PBDataWriterWriteUint32Field(v9, self->_numMissedSpeechPkt, 17);
  v4 = v9;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_13:
    PBDataWriterWriteUint32Field(v9, self->_numSpeechQempty, 18);
    v4 = v9;
  }
LABEL_14:
  p_delayCnts = &self->_delayCnts;
  if (p_delayCnts->count)
  {
    v8 = 0;
    do
    {
      PBDataWriterWriteUint32Field(v9, p_delayCnts->list[v8], 20);
      v4 = v9;
      ++v8;
    }
    while (v8 < p_delayCnts->count);
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  __int16 has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  id v9;

  v4 = a3;
  v9 = v4;
  if (self->_recordType)
  {
    objc_msgSend(v4, "setRecordType:");
    v4 = v9;
  }
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_numRecvdSpeechPkt;
    *((_WORD *)v4 + 40) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_21;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 13) = self->_numRecvdSilencePkt;
  *((_WORD *)v4 + 40) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 10) = self->_numLostPkt;
  *((_WORD *)v4 + 40) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 17) = self->_numUflwSpeechPkt;
  *((_WORD *)v4 + 40) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 2) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 16) = self->_numUflwSilencePkt;
  *((_WORD *)v4 + 40) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 9) = self->_numEnqdSpeechPkt;
  *((_WORD *)v4 + 40) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 8) = self->_numEnqdSilencePkt;
  *((_WORD *)v4 + 40) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 8) == 0)
      goto LABEL_12;
LABEL_27:
    *((_DWORD *)v4 + 11) = self->_numMissedSpeechPkt;
    *((_WORD *)v4 + 40) |= 8u;
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_26:
  *((_DWORD *)v4 + 12) = self->_numPlayedSpeechPkt;
  *((_WORD *)v4 + 40) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_27;
LABEL_12:
  if ((has & 0x80) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 15) = self->_numSpeechQempty;
    *((_WORD *)v4 + 40) |= 0x80u;
  }
LABEL_14:
  if (-[AudioQuality delayCntsCount](self, "delayCntsCount"))
  {
    objc_msgSend(v9, "clearDelayCnts");
    v6 = -[AudioQuality delayCntsCount](self, "delayCntsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(v9, "addDelayCnt:", -[AudioQuality delayCntAtIndex:](self, "delayCntAtIndex:", i));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  __int16 has;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_recordType, "copyWithZone:", a3);
  v7 = (void *)v5[9];
  v5[9] = v6;

  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((_DWORD *)v5 + 14) = self->_numRecvdSpeechPkt;
    *((_WORD *)v5 + 40) |= 0x40u;
    has = (__int16)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_15;
    }
  }
  else if ((has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 13) = self->_numRecvdSilencePkt;
  *((_WORD *)v5 + 40) |= 0x20u;
  has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0)
      goto LABEL_5;
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v5 + 10) = self->_numLostPkt;
  *((_WORD *)v5 + 40) |= 4u;
  has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0)
      goto LABEL_6;
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v5 + 17) = self->_numUflwSpeechPkt;
  *((_WORD *)v5 + 40) |= 0x200u;
  has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v5 + 16) = self->_numUflwSilencePkt;
  *((_WORD *)v5 + 40) |= 0x100u;
  has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 1) == 0)
      goto LABEL_8;
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v5 + 9) = self->_numEnqdSpeechPkt;
  *((_WORD *)v5 + 40) |= 2u;
  has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v5 + 8) = self->_numEnqdSilencePkt;
  *((_WORD *)v5 + 40) |= 1u;
  has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 8) == 0)
      goto LABEL_10;
LABEL_21:
    *((_DWORD *)v5 + 11) = self->_numMissedSpeechPkt;
    *((_WORD *)v5 + 40) |= 8u;
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  *((_DWORD *)v5 + 12) = self->_numPlayedSpeechPkt;
  *((_WORD *)v5 + 40) |= 0x10u;
  has = (__int16)self->_has;
  if ((has & 8) != 0)
    goto LABEL_21;
LABEL_10:
  if ((has & 0x80) != 0)
  {
LABEL_11:
    *((_DWORD *)v5 + 15) = self->_numSpeechQempty;
    *((_WORD *)v5 + 40) |= 0x80u;
  }
LABEL_12:
  PBRepeatedUInt32Copy(v5 + 1, &self->_delayCnts);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  NSString *recordType;
  __int16 has;
  __int16 v8;
  char IsEqual;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
    goto LABEL_55;
  recordType = self->_recordType;
  if ((unint64_t)recordType | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](recordType, "isEqual:"))
      goto LABEL_55;
  }
  has = (__int16)self->_has;
  v8 = *((_WORD *)v4 + 40);
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_numRecvdSpeechPkt != *((_DWORD *)v4 + 14))
      goto LABEL_55;
  }
  else if ((v8 & 0x40) != 0)
  {
LABEL_55:
    IsEqual = 0;
    goto LABEL_56;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_numRecvdSilencePkt != *((_DWORD *)v4 + 13))
      goto LABEL_55;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_numLostPkt != *((_DWORD *)v4 + 10))
      goto LABEL_55;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x200) == 0 || self->_numUflwSpeechPkt != *((_DWORD *)v4 + 17))
      goto LABEL_55;
  }
  else if ((*((_WORD *)v4 + 40) & 0x200) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 40) & 0x100) == 0 || self->_numUflwSilencePkt != *((_DWORD *)v4 + 16))
      goto LABEL_55;
  }
  else if ((*((_WORD *)v4 + 40) & 0x100) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_numEnqdSpeechPkt != *((_DWORD *)v4 + 9))
      goto LABEL_55;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_numEnqdSilencePkt != *((_DWORD *)v4 + 8))
      goto LABEL_55;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_numPlayedSpeechPkt != *((_DWORD *)v4 + 12))
      goto LABEL_55;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_numMissedSpeechPkt != *((_DWORD *)v4 + 11))
      goto LABEL_55;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_55;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_numSpeechQempty != *((_DWORD *)v4 + 15))
      goto LABEL_55;
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_55;
  }
  IsEqual = PBRepeatedUInt32IsEqual(&self->_delayCnts, v4 + 8);
LABEL_56:

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;
  __int16 has;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = -[NSString hash](self->_recordType, "hash");
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    v5 = 2654435761 * self->_numRecvdSpeechPkt;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      v6 = 2654435761 * self->_numRecvdSilencePkt;
      if ((has & 4) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else
  {
    v5 = 0;
    if ((has & 0x20) != 0)
      goto LABEL_3;
  }
  v6 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_numLostPkt;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_5:
    v8 = 2654435761 * self->_numUflwSpeechPkt;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v8 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    v9 = 2654435761 * self->_numUflwSilencePkt;
    if ((has & 2) != 0)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v9 = 0;
  if ((has & 2) != 0)
  {
LABEL_7:
    v10 = 2654435761 * self->_numEnqdSpeechPkt;
    if ((has & 1) != 0)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v10 = 0;
  if ((has & 1) != 0)
  {
LABEL_8:
    v11 = 2654435761 * self->_numEnqdSilencePkt;
    if ((has & 0x10) != 0)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v11 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_9:
    v12 = 2654435761 * self->_numPlayedSpeechPkt;
    if ((has & 8) != 0)
      goto LABEL_10;
LABEL_20:
    v13 = 0;
    if ((has & 0x80) != 0)
      goto LABEL_11;
LABEL_21:
    v14 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ PBRepeatedUInt32Hash(&self->_delayCnts);
  }
LABEL_19:
  v12 = 0;
  if ((has & 8) == 0)
    goto LABEL_20;
LABEL_10:
  v13 = 2654435761 * self->_numMissedSpeechPkt;
  if ((has & 0x80) == 0)
    goto LABEL_21;
LABEL_11:
  v14 = 2654435761 * self->_numSpeechQempty;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ PBRepeatedUInt32Hash(&self->_delayCnts);
}

- (void)mergeFrom:(id)a3
{
  unsigned int *v4;
  __int16 v5;
  char *v6;
  char *v7;
  char *i;
  unsigned int *v9;

  v4 = (unsigned int *)a3;
  v9 = v4;
  if (*((_QWORD *)v4 + 9))
  {
    -[AudioQuality setRecordType:](self, "setRecordType:");
    v4 = v9;
  }
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x40) != 0)
  {
    self->_numRecvdSpeechPkt = v4[14];
    *(_WORD *)&self->_has |= 0x40u;
    v5 = *((_WORD *)v4 + 40);
    if ((v5 & 0x20) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_6;
      goto LABEL_20;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_5;
  }
  self->_numRecvdSilencePkt = v4[13];
  *(_WORD *)&self->_has |= 0x20u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x200) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  self->_numLostPkt = v4[10];
  *(_WORD *)&self->_has |= 4u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x200) == 0)
  {
LABEL_7:
    if ((v5 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_22;
  }
LABEL_21:
  self->_numUflwSpeechPkt = v4[17];
  *(_WORD *)&self->_has |= 0x200u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x100) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0)
      goto LABEL_9;
    goto LABEL_23;
  }
LABEL_22:
  self->_numUflwSilencePkt = v4[16];
  *(_WORD *)&self->_has |= 0x100u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0)
      goto LABEL_10;
    goto LABEL_24;
  }
LABEL_23:
  self->_numEnqdSpeechPkt = v4[9];
  *(_WORD *)&self->_has |= 2u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  self->_numEnqdSilencePkt = v4[8];
  *(_WORD *)&self->_has |= 1u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  self->_numPlayedSpeechPkt = v4[12];
  *(_WORD *)&self->_has |= 0x10u;
  v5 = *((_WORD *)v4 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_26:
  self->_numMissedSpeechPkt = v4[11];
  *(_WORD *)&self->_has |= 8u;
  if ((v4[20] & 0x80) != 0)
  {
LABEL_13:
    self->_numSpeechQempty = v4[15];
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_14:
  v6 = (char *)objc_msgSend(v4, "delayCntsCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[AudioQuality addDelayCnt:](self, "addDelayCnt:", objc_msgSend(v9, "delayCntAtIndex:", i));
  }

}

- (NSString)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
  objc_storeStrong((id *)&self->_recordType, a3);
}

- (unsigned)numRecvdSpeechPkt
{
  return self->_numRecvdSpeechPkt;
}

- (unsigned)numRecvdSilencePkt
{
  return self->_numRecvdSilencePkt;
}

- (unsigned)numLostPkt
{
  return self->_numLostPkt;
}

- (unsigned)numUflwSpeechPkt
{
  return self->_numUflwSpeechPkt;
}

- (unsigned)numUflwSilencePkt
{
  return self->_numUflwSilencePkt;
}

- (unsigned)numEnqdSpeechPkt
{
  return self->_numEnqdSpeechPkt;
}

- (unsigned)numEnqdSilencePkt
{
  return self->_numEnqdSilencePkt;
}

- (unsigned)numPlayedSpeechPkt
{
  return self->_numPlayedSpeechPkt;
}

- (unsigned)numMissedSpeechPkt
{
  return self->_numMissedSpeechPkt;
}

- (unsigned)numSpeechQempty
{
  return self->_numSpeechQempty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordType, 0);
}

@end
