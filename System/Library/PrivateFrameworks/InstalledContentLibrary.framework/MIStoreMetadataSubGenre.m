@implementation MIStoreMetadataSubGenre

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genreID, 0);
  objc_storeStrong((id *)&self->_genre, 0);
}

- (MIStoreMetadataSubGenre)initWithGenre:(id)a3 genreID:(id)a4
{
  id v6;
  id v7;
  MIStoreMetadataSubGenre *v8;
  MIStoreMetadataSubGenre *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[MIStoreMetadataSubGenre init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[MIStoreMetadataSubGenre setGenre:](v8, "setGenre:", v6);
    -[MIStoreMetadataSubGenre setGenreID:](v9, "setGenreID:", v7);
  }

  return v9;
}

- (void)setGenreID:(id)a3
{
  objc_storeStrong((id *)&self->_genreID, a3);
}

- (void)setGenre:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIStoreMetadataSubGenre)initWithCoder:(id)a3
{
  id v4;
  MIStoreMetadataSubGenre *v5;
  uint64_t v6;
  NSString *genre;
  uint64_t v8;
  NSNumber *genreID;

  v4 = a3;
  v5 = -[MIStoreMetadataSubGenre init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genre"));
    v6 = objc_claimAutoreleasedReturnValue();
    genre = v5->_genre;
    v5->_genre = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genreID"));
    v8 = objc_claimAutoreleasedReturnValue();
    genreID = v5->_genreID;
    v5->_genreID = (NSNumber *)v8;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[MIStoreMetadataSubGenre genre](self, "genre");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIStoreMetadataSubGenre genreID](self, "genreID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithGenre:genreID:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[MIStoreMetadataSubGenre genre](self, "genre");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("genre"));

  -[MIStoreMetadataSubGenre genreID](self, "genreID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("genreID"));

}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = genre;
  -[MIStoreMetadataSubGenre genre](self, "genre");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = genreID;
  v8[0] = v3;
  -[MIStoreMetadataSubGenre genreID](self, "genreID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (BOOL)isEqual:(id)a3
{
  MIStoreMetadataSubGenre *v4;
  MIStoreMetadataSubGenre *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = (MIStoreMetadataSubGenre *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[MIStoreMetadataSubGenre genre](self, "genre");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIStoreMetadataSubGenre genre](v5, "genre");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (MICompareObjects(v6, v7))
      {
        -[MIStoreMetadataSubGenre genreID](self, "genreID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIStoreMetadataSubGenre genreID](v5, "genreID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = MICompareObjects(v8, v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[MIStoreMetadataSubGenre genre](self, "genre");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MIStoreMetadataSubGenre genreID](self, "genreID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)genre
{
  return self->_genre;
}

- (NSNumber)genreID
{
  return self->_genreID;
}

@end
