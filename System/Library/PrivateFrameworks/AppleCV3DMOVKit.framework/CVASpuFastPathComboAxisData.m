@implementation CVASpuFastPathComboAxisData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EEE0 != -1)
    dispatch_once(&qword_254A6EEE0, &unk_24CA35FE0);
  return (id)qword_254A6EED8;
}

- (CVASpuFastPathComboAxisData)initWithCoder:(id)a3
{
  id v4;
  CVASpuFastPathComboAxisData *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CVASpuFastPathComboAxisData;
  v5 = -[CVASpuFastPathComboAxisData init](&v8, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    -[CVASpuFastPathComboAxisData setPacketType:](v5, "setPacketType:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pt")));
    -[CVASpuFastPathComboAxisData setSample_id:](v5, "setSample_id:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("si")));
    -[CVASpuFastPathComboAxisData setValid_data:](v5, "setValid_data:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("vd")));
    -[CVASpuFastPathComboAxisData setAx:](v5, "setAx:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ax")));
    -[CVASpuFastPathComboAxisData setAy:](v5, "setAy:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ay")));
    -[CVASpuFastPathComboAxisData setAz:](v5, "setAz:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("az")));
    -[CVASpuFastPathComboAxisData setUnfiltered_ax:](v5, "setUnfiltered_ax:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("uax")));
    -[CVASpuFastPathComboAxisData setUnfiltered_ay:](v5, "setUnfiltered_ay:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("uay")));
    -[CVASpuFastPathComboAxisData setUnfiltered_az:](v5, "setUnfiltered_az:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("uaz")));
    -[CVASpuFastPathComboAxisData setGx:](v5, "setGx:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("gx")));
    -[CVASpuFastPathComboAxisData setGy:](v5, "setGy:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("gy")));
    -[CVASpuFastPathComboAxisData setGz:](v5, "setGz:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("gz")));
    -[CVASpuFastPathComboAxisData setTemperature:](v5, "setTemperature:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("p")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t"));
    -[CVASpuFastPathComboAxisData setTimestamp:](v5, "setTimestamp:");
    -[CVASpuFastPathComboAxisData setSyncTimestamp:](v5, "setSyncTimestamp:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("st")));
    -[CVASpuFastPathComboAxisData setFrameId:](v5, "setFrameId:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("fi")));
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (CVASpuFastPathComboAxisData)initWithFastPathIMUData:(id)a3
{
  id v4;
  CVASpuFastPathComboAxisData *v5;
  unsigned __int16 *v6;
  unsigned __int16 *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CVASpuFastPathComboAxisData *v19;
  CMTime time;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CVASpuFastPathComboAxisData;
  v5 = -[CVASpuFastPathComboAxisData init](&v22, sel_init);
  if (v5)
  {
    v6 = (unsigned __int16 *)objc_msgSend(objc_retainAutorelease(v4), "bytes");
    v7 = v6;
    v8 = *v6;
    if (v8 == 3)
    {
      CMClockMakeHostTimeFromSystemUnits(&time, *((_QWORD *)v6 + 1));
      -[CVASpuFastPathComboAxisData setTimestamp:](v5, "setTimestamp:", CMTimeGetSeconds(&time));
      -[CVASpuFastPathComboAxisData setFrameId:](v5, "setFrameId:", -1);
      -[CVASpuFastPathComboAxisData setPacketType:](v5, "setPacketType:", *((unsigned int *)v7 + 4));
      -[CVASpuFastPathComboAxisData setSyncTimestamp:](v5, "setSyncTimestamp:", *((_QWORD *)v7 + 1));
      -[CVASpuFastPathComboAxisData setSample_id:](v5, "setSample_id:", v7[10]);
      LODWORD(v10) = vcvtd_n_s64_f64(*((double *)v7 + 3), 0x10uLL);
      -[CVASpuFastPathComboAxisData setTemperature:](v5, "setTemperature:", v10);
      -[CVASpuFastPathComboAxisData setValid_data:](v5, "setValid_data:", *((unsigned int *)v7 + 8));
      LODWORD(v11) = vcvtd_n_s64_f64(*((double *)v7 + 5), 0x10uLL);
      -[CVASpuFastPathComboAxisData setAx:](v5, "setAx:", v11);
      LODWORD(v12) = vcvtd_n_s64_f64(*((double *)v7 + 6), 0x10uLL);
      -[CVASpuFastPathComboAxisData setAy:](v5, "setAy:", v12);
      LODWORD(v13) = vcvtd_n_s64_f64(*((double *)v7 + 7), 0x10uLL);
      -[CVASpuFastPathComboAxisData setAz:](v5, "setAz:", v13);
      LODWORD(v14) = vcvtd_n_s64_f64(*((double *)v7 + 8), 0x10uLL);
      -[CVASpuFastPathComboAxisData setUnfiltered_ax:](v5, "setUnfiltered_ax:", v14);
      LODWORD(v15) = vcvtd_n_s64_f64(*((double *)v7 + 9), 0x10uLL);
      -[CVASpuFastPathComboAxisData setUnfiltered_ay:](v5, "setUnfiltered_ay:", v15);
      LODWORD(v16) = vcvtd_n_s64_f64(*((double *)v7 + 10), 0x10uLL);
      -[CVASpuFastPathComboAxisData setUnfiltered_az:](v5, "setUnfiltered_az:", v16);
      LODWORD(v17) = vcvtd_n_s64_f64(*((double *)v7 + 11), 0x10uLL);
      -[CVASpuFastPathComboAxisData setGx:](v5, "setGx:", v17);
      LODWORD(v18) = vcvtd_n_s64_f64(*((double *)v7 + 12), 0x10uLL);
      -[CVASpuFastPathComboAxisData setGy:](v5, "setGy:", v18);
      LODWORD(v9) = vcvtd_n_s64_f64(*((double *)v7 + 13), 0x10uLL);
    }
    else
    {
      if (v8 != 1)
      {
        v19 = 0;
        goto LABEL_9;
      }
      -[CVASpuFastPathComboAxisData setTimestamp:](v5, "setTimestamp:", *((double *)v6 + 1));
      -[CVASpuFastPathComboAxisData setFrameId:](v5, "setFrameId:", *((_QWORD *)v7 + 2));
      -[CVASpuFastPathComboAxisData setPacketType:](v5, "setPacketType:", *((unsigned int *)v7 + 6));
      -[CVASpuFastPathComboAxisData setSyncTimestamp:](v5, "setSyncTimestamp:", *(_QWORD *)(v7 + 14));
      -[CVASpuFastPathComboAxisData setSample_id:](v5, "setSample_id:", v7[18]);
      -[CVASpuFastPathComboAxisData setTemperature:](v5, "setTemperature:", *(unsigned int *)(v7 + 19));
      -[CVASpuFastPathComboAxisData setValid_data:](v5, "setValid_data:", *(unsigned int *)(v7 + 21));
      -[CVASpuFastPathComboAxisData setAx:](v5, "setAx:", *(unsigned int *)(v7 + 23));
      -[CVASpuFastPathComboAxisData setAy:](v5, "setAy:", *(unsigned int *)(v7 + 25));
      -[CVASpuFastPathComboAxisData setAz:](v5, "setAz:", *(unsigned int *)(v7 + 27));
      -[CVASpuFastPathComboAxisData setUnfiltered_ax:](v5, "setUnfiltered_ax:", *(unsigned int *)(v7 + 29));
      -[CVASpuFastPathComboAxisData setUnfiltered_ay:](v5, "setUnfiltered_ay:", *(unsigned int *)(v7 + 31));
      -[CVASpuFastPathComboAxisData setUnfiltered_az:](v5, "setUnfiltered_az:", *(unsigned int *)(v7 + 33));
      -[CVASpuFastPathComboAxisData setGx:](v5, "setGx:", *(unsigned int *)(v7 + 35));
      -[CVASpuFastPathComboAxisData setGy:](v5, "setGy:", *(unsigned int *)(v7 + 37));
      v9 = *(unsigned int *)(v7 + 39);
    }
    -[CVASpuFastPathComboAxisData setGz:](v5, "setGz:", v9);
  }
  v19 = v5;
LABEL_9:

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  objc_msgSend(v5, "encodeInt32:forKey:", -[CVASpuFastPathComboAxisData packetType](self, "packetType"), CFSTR("pt"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[CVASpuFastPathComboAxisData sample_id](self, "sample_id"), CFSTR("si"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[CVASpuFastPathComboAxisData valid_data](self, "valid_data"), CFSTR("vd"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[CVASpuFastPathComboAxisData ax](self, "ax"), CFSTR("ax"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[CVASpuFastPathComboAxisData ay](self, "ay"), CFSTR("ay"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[CVASpuFastPathComboAxisData az](self, "az"), CFSTR("az"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[CVASpuFastPathComboAxisData unfiltered_ax](self, "unfiltered_ax"), CFSTR("uax"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[CVASpuFastPathComboAxisData unfiltered_ay](self, "unfiltered_ay"), CFSTR("uay"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[CVASpuFastPathComboAxisData unfiltered_az](self, "unfiltered_az"), CFSTR("uaz"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[CVASpuFastPathComboAxisData gx](self, "gx"), CFSTR("gx"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[CVASpuFastPathComboAxisData gy](self, "gy"), CFSTR("gy"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[CVASpuFastPathComboAxisData gz](self, "gz"), CFSTR("gz"));
  objc_msgSend(v5, "encodeInt32:forKey:", -[CVASpuFastPathComboAxisData temperature](self, "temperature"), CFSTR("p"));
  -[CVASpuFastPathComboAxisData timestamp](self, "timestamp");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("t"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[CVASpuFastPathComboAxisData syncTimestamp](self, "syncTimestamp"), CFSTR("st"));
  objc_msgSend(v5, "encodeInt64:forKey:", -[CVASpuFastPathComboAxisData frameId](self, "frameId"), CFSTR("fi"));
  objc_autoreleasePoolPop(v4);

}

+ (double)getTimestamp:(id)a3
{
  return *(double *)(objc_msgSend(objc_retainAutorelease(a3), "bytes") + 8);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (unsigned)packetType
{
  return self->_packetType;
}

- (void)setPacketType:(unsigned int)a3
{
  self->_packetType = a3;
}

- (unint64_t)syncTimestamp
{
  return self->_syncTimestamp;
}

- (void)setSyncTimestamp:(unint64_t)a3
{
  self->_syncTimestamp = a3;
}

- (unsigned)sample_id
{
  return self->_sample_id;
}

- (void)setSample_id:(unsigned int)a3
{
  self->_sample_id = a3;
}

- (unsigned)valid_data
{
  return self->_valid_data;
}

- (void)setValid_data:(unsigned int)a3
{
  self->_valid_data = a3;
}

- (int)ax
{
  return self->_ax;
}

- (void)setAx:(int)a3
{
  self->_ax = a3;
}

- (int)ay
{
  return self->_ay;
}

- (void)setAy:(int)a3
{
  self->_ay = a3;
}

- (int)az
{
  return self->_az;
}

- (void)setAz:(int)a3
{
  self->_az = a3;
}

- (int)unfiltered_ax
{
  return self->_unfiltered_ax;
}

- (void)setUnfiltered_ax:(int)a3
{
  self->_unfiltered_ax = a3;
}

- (int)unfiltered_ay
{
  return self->_unfiltered_ay;
}

- (void)setUnfiltered_ay:(int)a3
{
  self->_unfiltered_ay = a3;
}

- (int)unfiltered_az
{
  return self->_unfiltered_az;
}

- (void)setUnfiltered_az:(int)a3
{
  self->_unfiltered_az = a3;
}

- (int)gx
{
  return self->_gx;
}

- (void)setGx:(int)a3
{
  self->_gx = a3;
}

- (int)gy
{
  return self->_gy;
}

- (void)setGy:(int)a3
{
  self->_gy = a3;
}

- (int)gz
{
  return self->_gz;
}

- (void)setGz:(int)a3
{
  self->_gz = a3;
}

- (int)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(int)a3
{
  self->_temperature = a3;
}

- (unint64_t)frameId
{
  return self->_frameId;
}

- (void)setFrameId:(unint64_t)a3
{
  self->_frameId = a3;
}

@end
