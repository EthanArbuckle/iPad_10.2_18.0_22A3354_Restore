@implementation ASCLockupFeatureGenre

- (ASCLockupFeatureGenre)initWithGenreName:(id)a3 genreID:(id)a4 subgenres:(id)a5
{
  id v8;
  id v9;
  id v10;
  ASCLockupFeatureGenre *v11;
  uint64_t v12;
  NSString *genreName;
  uint64_t v14;
  NSString *genreID;
  uint64_t v16;
  NSArray *subgenres;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ASCLockupFeatureGenre;
  v11 = -[ASCLockupFeatureGenre init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    genreName = v11->_genreName;
    v11->_genreName = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    genreID = v11->_genreID;
    v11->_genreID = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    subgenres = v11->_subgenres;
    v11->_subgenres = (NSArray *)v16;

  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupFeatureGenre)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ASCLockupFeatureGenre *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genreName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("genreID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("subgenres"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ASCLockupFeatureGenre initWithGenreName:genreID:subgenres:](self, "initWithGenreName:genreID:subgenres:", v5, v6, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ASCLockupFeatureGenre genreName](self, "genreName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("genreName"));

  -[ASCLockupFeatureGenre genreID](self, "genreID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("genreID"));

  -[ASCLockupFeatureGenre subgenres](self, "subgenres");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("subgenres"));

}

- (unint64_t)hash
{
  ASCHasher *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = objc_alloc_init(ASCHasher);
  -[ASCLockupFeatureGenre genreName](self, "genreName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  -[ASCLockupFeatureGenre genreID](self, "genreID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  -[ASCLockupFeatureGenre subgenres](self, "subgenres");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  v7 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  ASCLockupFeatureGenre *v4;
  ASCLockupFeatureGenre *v5;
  ASCLockupFeatureGenre *v6;
  char v7;
  ASCLockupFeatureGenre *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v4 = (ASCLockupFeatureGenre *)a3;
  if (self != v4)
  {
    objc_opt_class();
    v5 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = v5;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v8 = v6;

    if (!v8)
    {
      v7 = 0;
LABEL_27:

      goto LABEL_28;
    }
    -[ASCLockupFeatureGenre genreName](self, "genreName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupFeatureGenre genreName](v8, "genreName");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
    {
      if (objc_msgSend(v9, "isEqual:", v10))
      {
LABEL_12:
        -[ASCLockupFeatureGenre genreID](self, "genreID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASCLockupFeatureGenre genreID](v8, "genreID");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v12 && v13)
        {
          if (objc_msgSend(v12, "isEqual:", v13))
            goto LABEL_15;
        }
        else if (v12 == (void *)v13)
        {
LABEL_15:
          -[ASCLockupFeatureGenre subgenres](self, "subgenres");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASCLockupFeatureGenre subgenres](v8, "subgenres");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v15 && v16)
            v7 = objc_msgSend(v15, "isEqual:", v16);
          else
            v7 = v15 == (void *)v16;

          goto LABEL_25;
        }
        v7 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    else if (v9 == (void *)v10)
    {
      goto LABEL_12;
    }
    v7 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v7 = 1;
LABEL_28:

  return v7;
}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockupFeatureGenre genreName](self, "genreName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("genreName"));

  -[ASCLockupFeatureGenre genreID](self, "genreID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("genreID"));

  -[ASCLockupFeatureGenre subgenres](self, "subgenres");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("subgenres"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)genreName
{
  return self->_genreName;
}

- (NSString)genreID
{
  return self->_genreID;
}

- (NSArray)subgenres
{
  return self->_subgenres;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subgenres, 0);
  objc_storeStrong((id *)&self->_genreID, 0);
  objc_storeStrong((id *)&self->_genreName, 0);
}

@end
