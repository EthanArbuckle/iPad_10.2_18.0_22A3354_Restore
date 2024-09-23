@implementation FPPair

+ (id)pairWithFirst:(id)a3 second:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id *v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new();
  v9 = (id *)v8;
  if (v8)
  {
    objc_storeStrong((id *)(v8 + 8), a3);
    objc_storeStrong(v9 + 2, a4);
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(self->_first, "hash");
  return objc_msgSend(self->_second, "hash") ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  +[FPPair pairWithFirst:second:](FPPair, "pairWithFirst:second:", self->_first, self->_second);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqualToPair:(id)a3
{
  _QWORD *v4;
  id first;
  id second;
  char v7;

  v4 = a3;
  first = self->_first;
  if (first == (id)v4[1] || objc_msgSend(first, "isEqual:"))
  {
    second = self->_second;
    if (second == (id)v4[2])
      v7 = 1;
    else
      v7 = objc_msgSend(second, "isEqual:");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  FPPair *v4;
  FPPair *v5;
  BOOL v6;

  v4 = (FPPair *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[FPPair isEqualToPair:](self, "isEqualToPair:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p first:%@ second:%@>"), objc_opt_class(), self, self->_first, self->_second);
}

- (id)first
{
  return self->_first;
}

- (void)setFirst:(id)a3
{
  objc_storeStrong(&self->_first, a3);
}

- (id)second
{
  return self->_second;
}

- (void)setSecond:(id)a3
{
  objc_storeStrong(&self->_second, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_second, 0);
  objc_storeStrong(&self->_first, 0);
}

@end
