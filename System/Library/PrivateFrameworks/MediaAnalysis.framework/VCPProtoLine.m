@implementation VCPProtoLine

+ (id)lineFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  VCPProtoLine *v8;
  void *v9;
  void *v10;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v8 = objc_alloc_init(VCPProtoLine);
  +[VCPProtoPoint pointWithPoint:](VCPProtoPoint, "pointWithPoint:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLine setStart:](v8, "setStart:", v9);

  +[VCPProtoPoint pointWithPoint:](VCPProtoPoint, "pointWithPoint:", x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLine setEnd:](v8, "setEnd:", v10);

  return v8;
}

- (CGPoint)startPointValue
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[VCPProtoLine start](self, "start");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointValue");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)endPointValue
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[VCPProtoLine end](self, "end");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointValue");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
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
  v8.super_class = (Class)VCPProtoLine;
  -[VCPProtoLine description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VCPProtoLine dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  VCPProtoPoint *start;
  void *v5;
  VCPProtoPoint *end;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  start = self->_start;
  if (start)
  {
    -[VCPProtoPoint dictionaryRepresentation](start, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("start"));

  }
  end = self->_end;
  if (end)
  {
    -[VCPProtoPoint dictionaryRepresentation](end, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("end"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCPProtoLineReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  VCPProtoPoint *start;
  id v5;

  start = self->_start;
  v5 = a3;
  objc_msgSend(v5, "setStart:", start);
  objc_msgSend(v5, "setEnd:", self->_end);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[VCPProtoPoint copyWithZone:](self->_start, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[VCPProtoPoint copyWithZone:](self->_end, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  VCPProtoPoint *start;
  VCPProtoPoint *end;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((start = self->_start, !((unint64_t)start | v4[2])) || -[VCPProtoPoint isEqual:](start, "isEqual:")))
  {
    end = self->_end;
    if ((unint64_t)end | v4[1])
      v7 = -[VCPProtoPoint isEqual:](end, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[VCPProtoPoint hash](self->_start, "hash");
  return -[VCPProtoPoint hash](self->_end, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  VCPProtoPoint *start;
  uint64_t v6;
  VCPProtoPoint *end;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  start = self->_start;
  v6 = v4[2];
  v9 = v4;
  if (start)
  {
    if (!v6)
      goto LABEL_7;
    -[VCPProtoPoint mergeFrom:](start, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[VCPProtoLine setStart:](self, "setStart:");
  }
  v4 = v9;
LABEL_7:
  end = self->_end;
  v8 = v4[1];
  if (end)
  {
    if (v8)
    {
      -[VCPProtoPoint mergeFrom:](end, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[VCPProtoLine setEnd:](self, "setEnd:");
    goto LABEL_12;
  }

}

- (VCPProtoPoint)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
  objc_storeStrong((id *)&self->_start, a3);
}

- (VCPProtoPoint)end
{
  return self->_end;
}

- (void)setEnd:(id)a3
{
  objc_storeStrong((id *)&self->_end, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_end, 0);
}

@end
