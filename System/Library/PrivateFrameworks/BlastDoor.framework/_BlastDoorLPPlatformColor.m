@implementation _BlastDoorLPPlatformColor

- (id)copyWithZone:(_NSZone *)a3
{
  _BlastDoorLPPlatformColor *v4;
  _BlastDoorLPPlatformColor *v5;

  v4 = +[_BlastDoorLPPlatformColor allocWithZone:](_BlastDoorLPPlatformColor, "allocWithZone:", a3);
  if (v4)
  {
    -[_BlastDoorLPPlatformColor r](self, "r");
    -[_BlastDoorLPPlatformColor setR:](v4, "setR:");
    -[_BlastDoorLPPlatformColor g](self, "g");
    -[_BlastDoorLPPlatformColor setG:](v4, "setG:");
    -[_BlastDoorLPPlatformColor b](self, "b");
    -[_BlastDoorLPPlatformColor setB:](v4, "setB:");
    -[_BlastDoorLPPlatformColor a](self, "a");
    -[_BlastDoorLPPlatformColor setA:](v4, "setA:");
    v5 = v4;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_BlastDoorLPPlatformColor;
  if (-[_BlastDoorLPPlatformColor isEqual:](&v20, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      -[_BlastDoorLPPlatformColor r](self, "r");
      v8 = v7;
      objc_msgSend(v6, "r");
      if (v8 != v9)
        goto LABEL_8;
      -[_BlastDoorLPPlatformColor g](self, "g");
      v11 = v10;
      objc_msgSend(v6, "g");
      if (v11 != v12)
        goto LABEL_8;
      -[_BlastDoorLPPlatformColor b](self, "b");
      v14 = v13;
      objc_msgSend(v6, "b");
      if (v14 == v15 && (-[_BlastDoorLPPlatformColor a](self, "a"), v17 = v16, objc_msgSend(v6, "a"), v17 == v18))
        v5 = 1;
      else
LABEL_8:
        v5 = 0;

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[_BlastDoorLPPlatformColor r](self, "r");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[_BlastDoorLPPlatformColor g](self, "g");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") ^ v5;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[_BlastDoorLPPlatformColor b](self, "b");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[_BlastDoorLPPlatformColor a](self, "a");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8 ^ v11 ^ objc_msgSend(v13, "hash");

  return v14;
}

- (double)r
{
  return self->_r;
}

- (void)setR:(double)a3
{
  self->_r = a3;
}

- (double)g
{
  return self->_g;
}

- (void)setG:(double)a3
{
  self->_g = a3;
}

- (double)b
{
  return self->_b;
}

- (void)setB:(double)a3
{
  self->_b = a3;
}

- (double)a
{
  return self->_a;
}

- (void)setA:(double)a3
{
  self->_a = a3;
}

@end
