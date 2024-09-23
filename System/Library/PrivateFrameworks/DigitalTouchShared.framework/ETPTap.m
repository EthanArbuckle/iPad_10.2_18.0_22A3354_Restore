@implementation ETPTap

- (BOOL)hasTimeDeltas
{
  return self->_timeDeltas != 0;
}

- (BOOL)hasPoints
{
  return self->_points != 0;
}

- (BOOL)hasColors
{
  return self->_colors != 0;
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
  v8.super_class = (Class)ETPTap;
  -[ETPTap description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ETPTap dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *timeDeltas;
  NSData *points;
  NSData *colors;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  timeDeltas = self->_timeDeltas;
  if (timeDeltas)
    objc_msgSend(v3, "setObject:forKey:", timeDeltas, CFSTR("timeDeltas"));
  points = self->_points;
  if (points)
    objc_msgSend(v4, "setObject:forKey:", points, CFSTR("points"));
  colors = self->_colors;
  if (colors)
    objc_msgSend(v4, "setObject:forKey:", colors, CFSTR("colors"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ETPTapReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_timeDeltas)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_points)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_colors)
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
  v6 = -[NSData copyWithZone:](self->_timeDeltas, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSData copyWithZone:](self->_points, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSData copyWithZone:](self->_colors, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *timeDeltas;
  NSData *points;
  NSData *colors;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((timeDeltas = self->_timeDeltas, !((unint64_t)timeDeltas | v4[3]))
     || -[NSData isEqual:](timeDeltas, "isEqual:"))
    && ((points = self->_points, !((unint64_t)points | v4[2]))
     || -[NSData isEqual:](points, "isEqual:")))
  {
    colors = self->_colors;
    if ((unint64_t)colors | v4[1])
      v8 = -[NSData isEqual:](colors, "isEqual:");
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

  v3 = -[NSData hash](self->_timeDeltas, "hash");
  v4 = -[NSData hash](self->_points, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_colors, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[ETPTap setTimeDeltas:](self, "setTimeDeltas:");
  if (v4[2])
    -[ETPTap setPoints:](self, "setPoints:");
  if (v4[1])
    -[ETPTap setColors:](self, "setColors:");

}

- (NSData)timeDeltas
{
  return self->_timeDeltas;
}

- (void)setTimeDeltas:(id)a3
{
  objc_storeStrong((id *)&self->_timeDeltas, a3);
}

- (NSData)points
{
  return self->_points;
}

- (void)setPoints:(id)a3
{
  objc_storeStrong((id *)&self->_points, a3);
}

- (NSData)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
  objc_storeStrong((id *)&self->_colors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeDeltas, 0);
  objc_storeStrong((id *)&self->_points, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

@end
