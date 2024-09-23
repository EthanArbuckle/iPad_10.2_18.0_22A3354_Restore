@implementation VCPProtoTime

+ (VCPProtoTime)timeWithCMTime:(id *)a3
{
  VCPProtoTime *v4;

  v4 = objc_alloc_init(VCPProtoTime);
  -[VCPProtoTime setValue:](v4, "setValue:", a3->var0);
  -[VCPProtoTime setTimescale:](v4, "setTimescale:", a3->var1);
  -[VCPProtoTime setFlags:](v4, "setFlags:", a3->var2);
  -[VCPProtoTime setEpoch:](v4, "setEpoch:", a3->var3);
  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeValue
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = -[VCPProtoTime value](self, "value");
  retstr->var1 = -[VCPProtoTime timescale](self, "timescale");
  retstr->var2 = -[VCPProtoTime flags](self, "flags");
  result = -[VCPProtoTime epoch](self, "epoch");
  retstr->var3 = (int64_t)result;
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
  v8.super_class = (Class)VCPProtoTime;
  -[VCPProtoTime description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoTime dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_value);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("value"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_timescale);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("timescale"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_flags);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("flags"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_epoch);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("epoch"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoTimeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteInt64Field();

}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 2) = self->_value;
  *((_DWORD *)a3 + 7) = self->_timescale;
  *((_DWORD *)a3 + 6) = self->_flags;
  *((_QWORD *)a3 + 1) = self->_epoch;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 2) = self->_value;
  *((_DWORD *)result + 7) = self->_timescale;
  *((_DWORD *)result + 6) = self->_flags;
  *((_QWORD *)result + 1) = self->_epoch;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_value == *((_QWORD *)v4 + 2)
    && self->_timescale == *((_DWORD *)v4 + 7)
    && self->_flags == *((_DWORD *)v4 + 6)
    && self->_epoch == *((_QWORD *)v4 + 1);

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_timescale) ^ (2654435761 * self->_value) ^ (2654435761 * self->_flags) ^ (2654435761 * self->_epoch);
}

- (void)mergeFrom:(id)a3
{
  self->_value = *((_QWORD *)a3 + 2);
  self->_timescale = *((_DWORD *)a3 + 7);
  self->_flags = *((_DWORD *)a3 + 6);
  self->_epoch = *((_QWORD *)a3 + 1);
}

- (int64_t)value
{
  return self->_value;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (int)timescale
{
  return self->_timescale;
}

- (void)setTimescale:(int)a3
{
  self->_timescale = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (void)setEpoch:(int64_t)a3
{
  self->_epoch = a3;
}

@end
