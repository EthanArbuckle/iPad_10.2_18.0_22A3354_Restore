@implementation ASDTestFlightAppGenre

- (ASDTestFlightAppGenre)initWithGenre:(id)a3 genreID:(id)a4
{
  id v7;
  id v8;
  ASDTestFlightAppGenre *v9;
  ASDTestFlightAppGenre *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASDTestFlightAppGenre;
  v9 = -[ASDTestFlightAppGenre init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_genre, a3);
    objc_storeStrong((id *)&v10->_genreID, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDTestFlightAppGenre *v5;
  uint64_t v6;
  NSString *genre;
  uint64_t v8;
  NSNumber *genreID;

  v5 = -[ASDTestFlightAppGenre init](+[ASDTestFlightAppGenre allocWithZone:](ASDTestFlightAppGenre, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_genre, "copyWithZone:", a3);
  genre = v5->_genre;
  v5->_genre = (NSString *)v6;

  v8 = -[NSNumber copyWithZone:](self->_genreID, "copyWithZone:", a3);
  genreID = v5->_genreID;
  v5->_genreID = (NSNumber *)v8;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDTestFlightAppGenre)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ASDTestFlightAppGenre *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[ASDTestFlightAppGenre initWithGenre:genreID:](self, "initWithGenre:genreID:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *genre;
  id v5;

  genre = self->_genre;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", genre, CFSTR("GE"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_genreID, CFSTR("GI"));

}

- (NSString)genre
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)genreID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genreID, 0);
  objc_storeStrong((id *)&self->_genre, 0);
}

@end
