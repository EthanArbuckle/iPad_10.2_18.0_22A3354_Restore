@implementation ETPKiss

- (BOOL)hasDelays
{
  return self->_delays != 0;
}

- (BOOL)hasPoints
{
  return self->_points != 0;
}

- (BOOL)hasAngles
{
  return self->_angles != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ETPKiss;
  -[ETPKiss description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETPKiss dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *delays;
  NSData *points;
  NSData *angles;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  delays = self->_delays;
  if (delays)
    objc_msgSend(v3, "setObject:forKey:", delays, CFSTR("delays"));
  points = self->_points;
  if (points)
    objc_msgSend(v4, "setObject:forKey:", points, CFSTR("points"));
  angles = self->_angles;
  if (angles)
    objc_msgSend(v4, "setObject:forKey:", angles, CFSTR("angles"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ETPKissReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_delays)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_points)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_angles)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_delays, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_points, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSData copyWithZone:](self->_angles, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *delays;
  NSData *points;
  NSData *angles;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((delays = self->_delays, !((unint64_t)delays | v4[2]))
     || -[NSData isEqual:](delays, "isEqual:"))
    && ((points = self->_points, !((unint64_t)points | v4[3]))
     || -[NSData isEqual:](points, "isEqual:")))
  {
    angles = self->_angles;
    if ((unint64_t)angles | v4[1])
      v8 = -[NSData isEqual:](angles, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_delays, "hash");
  v4 = -[NSData hash](self->_points, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_angles, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[ETPKiss setDelays:](self, "setDelays:");
  if (v4[3])
    -[ETPKiss setPoints:](self, "setPoints:");
  if (v4[1])
    -[ETPKiss setAngles:](self, "setAngles:");

}

- (NSData)delays
{
  return self->_delays;
}

- (void)setDelays:(id)a3
{
  objc_storeStrong((id *)&self->_delays, a3);
}

- (NSData)points
{
  return self->_points;
}

- (void)setPoints:(id)a3
{
  objc_storeStrong((id *)&self->_points, a3);
}

- (NSData)angles
{
  return self->_angles;
}

- (void)setAngles:(id)a3
{
  objc_storeStrong((id *)&self->_angles, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_points, 0);
  objc_storeStrong((id *)&self->_delays, 0);
  objc_storeStrong((id *)&self->_angles, 0);
}

@end
