@implementation MOEventTravel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *tripTitle;
  id v5;

  tripTitle = self->_tripTitle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tripTitle, CFSTR("tripTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tripParts, CFSTR("tripParts"));

}

- (MOEventTravel)initWithCoder:(id)a3
{
  id v4;
  MOEventTravel *v5;
  uint64_t v6;
  NSString *tripTitle;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *tripParts;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MOEventTravel;
  v5 = -[MOEventTravel init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tripTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    tripTitle = v5->_tripTitle;
    v5->_tripTitle = (NSString *)v6;

    v8 = (void *)MEMORY[0x1D1798EEC]();
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = (void *)objc_msgSend(v9, "initWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("tripParts"));
    v14 = objc_claimAutoreleasedReturnValue();
    tripParts = v5->_tripParts;
    v5->_tripParts = (NSArray *)v14;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventTravel *v4;

  v4 = objc_alloc_init(MOEventTravel);
  objc_storeStrong((id *)&v4->_tripParts, self->_tripParts);
  objc_storeStrong((id *)&v4->_tripTitle, self->_tripTitle);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MOEventTravel tripTitle](self, "tripTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("tripTitle, %@"), v5);

  return v6;
}

- (NSString)tripTitle
{
  return self->_tripTitle;
}

- (void)setTripTitle:(id)a3
{
  objc_storeStrong((id *)&self->_tripTitle, a3);
}

- (NSArray)tripParts
{
  return self->_tripParts;
}

- (void)setTripParts:(id)a3
{
  objc_storeStrong((id *)&self->_tripParts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripParts, 0);
  objc_storeStrong((id *)&self->_tripTitle, 0);
}

@end
