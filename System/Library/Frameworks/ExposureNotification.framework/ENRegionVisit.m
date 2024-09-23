@implementation ENRegionVisit

- (ENRegion)region
{
  return self->_region;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

- (ENRegionVisit)initWithRegion:(id)a3 date:(id)a4
{
  id v7;
  id v8;
  void *v9;
  ENRegionVisit *v10;
  uint64_t v11;
  ENRegion *region;
  uint64_t v13;
  NSDate *date;
  void *v16;
  void *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENRegionVisit.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("region"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENRegionVisit.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)ENRegionVisit;
  v10 = -[ENRegionVisit init](&v18, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    region = v10->_region;
    v10->_region = (ENRegion *)v11;

    v13 = objc_msgSend(v9, "copy");
    date = v10->_date;
    v10->_date = (NSDate *)v13;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ENRegionVisit)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ENRegionVisit *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reg"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      self = -[ENRegionVisit initWithRegion:date:](self, "initWithRegion:date:", v5, v6);
      v7 = self;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  ENRegion *region;
  id v5;

  region = self->_region;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", region, CFSTR("reg"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));

}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[ENRegion hash](self->_region, "hash");
  return -[NSDate hash](self->_date, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  ENRegion *v7;
  ENRegion *v8;
  ENRegion *v9;
  _BOOL4 v10;
  char v11;
  NSDate *date;
  void *v13;
  ENRegion *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_14;
  }
  v5 = v4;
  v6 = (void *)v5[1];
  v7 = self->_region;
  v8 = v6;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  v9 = v8;
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_11;
  v10 = -[ENRegion isEqual:](v7, "isEqual:", v8);

  if (v10)
  {
LABEL_7:
    date = self->_date;
    v13 = (void *)v5[2];
    v7 = date;
    v14 = v13;
    v9 = v14;
    if (v7 == v14)
    {
      v11 = 1;
      goto LABEL_12;
    }
    if ((v7 == 0) != (v14 != 0))
    {
      v11 = -[ENRegion isEqual:](v7, "isEqual:", v14);
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  v11 = 0;
LABEL_13:

LABEL_14:
  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ENRegion countryCode](self->_region, "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ENRegion subdivisionCode](self->_region, "subdivisionCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("countryCode, %@, subdivisionCode, %@, date, %@"), v4, v5, self->_date);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
