@implementation CLPPressure

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CLPPressure;
  -[CLPPressure description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPPressure dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("value"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_std);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("std"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPPressureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_timestamp;
  *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_value;
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_std;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_timestamp;
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_value;
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_std;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_timestamp == v4[2]
    && self->_value == v4[3]
    && self->_std == v4[1];

  return v5;
}

- (unint64_t)hash
{
  double timestamp;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double value;
  double v13;
  long double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double std;
  double v22;
  long double v23;
  double v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;

  timestamp = self->_timestamp;
  v4 = -timestamp;
  if (timestamp >= 0.0)
    v4 = self->_timestamp;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = fmod(v5, 1.84467441e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  value = self->_value;
  v13 = -value;
  if (value >= 0.0)
    v13 = self->_value;
  v14 = floor(v13 + 0.5);
  v15 = (v13 - v14) * 1.84467441e19;
  v16 = fmod(v14, 1.84467441e19);
  v17 = 2654435761u * (unint64_t)v16;
  v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0)
    v18 = 2654435761u * (unint64_t)v16;
  v19 = v17 - (unint64_t)fabs(v15);
  if (v15 < 0.0)
    v20 = v19;
  else
    v20 = v18;
  std = self->_std;
  v22 = -std;
  if (std >= 0.0)
    v22 = self->_std;
  v23 = floor(v22 + 0.5);
  v24 = (v22 - v23) * 1.84467441e19;
  v25 = fmod(v23, 1.84467441e19);
  v26 = 2654435761u * (unint64_t)v25;
  v27 = v26 + (unint64_t)v24;
  if (v24 <= 0.0)
    v27 = 2654435761u * (unint64_t)v25;
  v28 = v26 - (unint64_t)fabs(v24);
  if (v24 >= 0.0)
    v28 = v27;
  return v20 ^ v11 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  self->_timestamp = *((double *)a3 + 2);
  self->_value = *((double *)a3 + 3);
  self->_std = *((double *)a3 + 1);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (double)std
{
  return self->_std;
}

- (void)setStd:(double)a3
{
  self->_std = a3;
}

@end
