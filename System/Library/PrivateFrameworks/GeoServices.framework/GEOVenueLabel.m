@implementation GEOVenueLabel

- (GEOVenueLabel)init
{
  GEOVenueLabel *result;

  result = (GEOVenueLabel *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOVenueLabel)initWithName:(id)a3 shortName:(id)a4 detail:(id)a5
{
  id v9;
  id v10;
  id v11;
  GEOVenueLabel *v12;
  GEOVenueLabel *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GEOVenueLabel;
  v12 = -[GEOVenueLabel init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_shortName, a4);
    objc_storeStrong((id *)&v13->_detail, a5);
  }

  return v13;
}

- (GEOVenueLabel)initWithName:(id)a3
{
  return -[GEOVenueLabel initWithName:shortName:detail:](self, "initWithName:shortName:detail:", a3, 0, 0);
}

- (GEOVenueLabel)initWithLabel:(id)a3
{
  id *v4;
  GEOVenueLabel *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (id *)a3;
  -[GEOPDVenueLabel name](v4);
  v5 = (GEOVenueLabel *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[GEOPDVenueLabel name](v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDVenueLabel nameShort](v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDVenueLabel detail](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[GEOVenueLabel initWithName:shortName:detail:](self, "initWithName:shortName:detail:", v6, v7, v8);

    v5 = self;
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSString)detail
{
  return self->_detail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
