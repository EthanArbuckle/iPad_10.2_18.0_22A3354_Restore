@implementation UnitRank

- (UnitRank)initWithUnitID:(int)a3 rank:(float)a4 locale:(id)a5
{
  return -[UnitRank initWithUnitID:rank:locale:context:](self, "initWithUnitID:rank:locale:context:", *(_QWORD *)&a3, a5, 0);
}

- (UnitRank)initWithUnitID:(int)a3 rank:(float)a4 locale:(id)a5 context:(id)a6
{
  id v11;
  id v12;
  UnitRank *v13;
  UnitRank *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)UnitRank;
  v13 = -[UnitRank init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_unitID = a3;
    v13->_rank = a4;
    objc_storeStrong((id *)&v13->_locale, a5);
    objc_storeStrong(&v14->_context, a6);
    v14->_tokenType = 2;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  float v6;
  float v7;
  float v8;
  BOOL v9;

  v4 = a3;
  if (v4 && (v5 = -[UnitRank unitID](self, "unitID"), v5 == objc_msgSend(v4, "unitID")))
  {
    -[UnitRank rank](self, "rank");
    v7 = v6;
    objc_msgSend(v4, "rank");
    v9 = v7 == v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  int64_t v8;
  float v9;
  float v10;
  float v11;

  v4 = a3;
  -[UnitRank rank](self, "rank");
  v6 = v5;
  objc_msgSend(v4, "rank");
  if (v6 <= v7)
  {
    -[UnitRank rank](self, "rank");
    v10 = v9;
    objc_msgSend(v4, "rank");
    if (v10 >= v11)
      v8 = 0;
    else
      v8 = -1;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  float v4;

  v3 = 31 * -[UnitRank unitID](self, "unitID");
  -[UnitRank rank](self, "rank");
  return v3 + (int)(float)(v4 * 1000.0) + 961;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  float v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[UnitRank unitID](self, "unitID");
  -[UnitRank rank](self, "rank");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%d (%f)"), v4, v5);
}

- (int)unitID
{
  return self->_unitID;
}

- (void)setUnitID:(int)a3
{
  self->_unitID = a3;
}

- (float)rank
{
  return self->_rank;
}

- (void)setRank:(float)a3
{
  self->_rank = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (id)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (BOOL)isConfusable
{
  return self->_isConfusable;
}

- (void)setIsConfusable:(BOOL)a3
{
  self->_isConfusable = a3;
}

- (int)tokenType
{
  return self->_tokenType;
}

- (void)setTokenType:(int)a3
{
  self->_tokenType = a3;
}

- (BOOL)isLaTeX
{
  return self->_isLaTeX;
}

- (void)setIsLaTeX:(BOOL)a3
{
  self->_isLaTeX = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
