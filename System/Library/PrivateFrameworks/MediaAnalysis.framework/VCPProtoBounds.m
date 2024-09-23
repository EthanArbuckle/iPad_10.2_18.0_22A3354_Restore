@implementation VCPProtoBounds

+ (VCPProtoBounds)boundsWithCGRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  VCPProtoBounds *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = objc_alloc_init(VCPProtoBounds);
  -[VCPProtoBounds setX0:](v7, "setX0:", x);
  -[VCPProtoBounds setY0:](v7, "setY0:", y);
  -[VCPProtoBounds setWidth:](v7, "setWidth:", width);
  -[VCPProtoBounds setHeight:](v7, "setHeight:", height);
  return v7;
}

- (CGRect)rectValue
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[VCPProtoBounds x0](self, "x0");
  v4 = v3;
  -[VCPProtoBounds y0](self, "y0");
  v6 = v5;
  -[VCPProtoBounds width](self, "width");
  v8 = v7;
  -[VCPProtoBounds height](self, "height");
  v10 = v9;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
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
  v8.super_class = (Class)VCPProtoBounds;
  -[VCPProtoBounds description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoBounds dictionaryRepresentation](self, "dictionaryRepresentation");
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
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_x0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("x0"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_y0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("y0"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_width);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("width"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("height"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoBoundsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_x0;
  *((_QWORD *)a3 + 4) = *(_QWORD *)&self->_y0;
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_width;
  *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_height;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 3) = *(_QWORD *)&self->_x0;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->_y0;
  *((_QWORD *)result + 2) = *(_QWORD *)&self->_width;
  *((_QWORD *)result + 1) = *(_QWORD *)&self->_height;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_x0 == v4[3]
    && self->_y0 == v4[4]
    && self->_width == v4[2]
    && self->_height == v4[1];

  return v5;
}

- (unint64_t)hash
{
  double x0;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  double y0;
  double v13;
  long double v14;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  double width;
  double v22;
  long double v23;
  double v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  double height;
  double v31;
  long double v32;
  double v33;
  double v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;

  x0 = self->_x0;
  v4 = -x0;
  if (x0 >= 0.0)
    v4 = self->_x0;
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
  y0 = self->_y0;
  v13 = -y0;
  if (y0 >= 0.0)
    v13 = self->_y0;
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
  width = self->_width;
  v22 = -width;
  if (width >= 0.0)
    v22 = self->_width;
  v23 = floor(v22 + 0.5);
  v24 = (v22 - v23) * 1.84467441e19;
  v25 = fmod(v23, 1.84467441e19);
  v26 = 2654435761u * (unint64_t)v25;
  v27 = v26 + (unint64_t)v24;
  if (v24 <= 0.0)
    v27 = 2654435761u * (unint64_t)v25;
  v28 = v26 - (unint64_t)fabs(v24);
  if (v24 < 0.0)
    v29 = v28;
  else
    v29 = v27;
  height = self->_height;
  v31 = -height;
  if (height >= 0.0)
    v31 = self->_height;
  v32 = floor(v31 + 0.5);
  v33 = (v31 - v32) * 1.84467441e19;
  v34 = fmod(v32, 1.84467441e19);
  v35 = 2654435761u * (unint64_t)v34;
  v36 = v35 + (unint64_t)v33;
  if (v33 <= 0.0)
    v36 = 2654435761u * (unint64_t)v34;
  v37 = v35 - (unint64_t)fabs(v33);
  if (v33 >= 0.0)
    v37 = v36;
  return v20 ^ v11 ^ v29 ^ v37;
}

- (void)mergeFrom:(id)a3
{
  self->_x0 = *((double *)a3 + 3);
  self->_y0 = *((double *)a3 + 4);
  self->_width = *((double *)a3 + 2);
  self->_height = *((double *)a3 + 1);
}

- (double)x0
{
  return self->_x0;
}

- (void)setX0:(double)a3
{
  self->_x0 = a3;
}

- (double)y0
{
  return self->_y0;
}

- (void)setY0:(double)a3
{
  self->_y0 = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

@end
