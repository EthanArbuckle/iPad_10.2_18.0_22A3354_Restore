@implementation CTSweetgumPlansInfo

- (CTSweetgumPlansInfo)init
{
  CTSweetgumPlansInfo *v2;
  CTSweetgumPlansInfo *v3;
  NSArray *planGroups;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTSweetgumPlansInfo;
  v2 = -[CTSweetgumPlansInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    planGroups = v2->_planGroups;
    v2->_planGroups = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSweetgumPlansInfo planGroups](self, "planGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" planGroups=%@"), v4);

  -[CTSweetgumPlansInfo morePlansURL](self, "morePlansURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", morePlansURL=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  CTSweetgumPlansInfo *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (CTSweetgumPlansInfo *)a3;
  if (v6 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTSweetgumPlansInfo planGroups](self, "planGroups");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTSweetgumPlansInfo planGroups](v6, "planGroups");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8
        || (-[CTSweetgumPlansInfo planGroups](self, "planGroups"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            -[CTSweetgumPlansInfo planGroups](v6, "planGroups"),
            v4 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "isEqualToArray:", v4)))
      {
        -[CTSweetgumPlansInfo morePlansURL](self, "morePlansURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSweetgumPlansInfo morePlansURL](v6, "morePlansURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 == v11)
        {
          v9 = 1;
        }
        else
        {
          -[CTSweetgumPlansInfo morePlansURL](self, "morePlansURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CTSweetgumPlansInfo morePlansURL](v6, "morePlansURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v12, "isEqualToString:", v13);

        }
        if (v7 == v8)
          goto LABEL_13;
      }
      else
      {
        v9 = 0;
      }

LABEL_13:
      goto LABEL_14;
    }
    v9 = 0;
  }
LABEL_14:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *planGroups;
  id v5;

  planGroups = self->_planGroups;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", planGroups, CFSTR("planGroups"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_morePlansURL, CFSTR("morePlansURL"));

}

- (CTSweetgumPlansInfo)initWithCoder:(id)a3
{
  id v4;
  CTSweetgumPlansInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *planGroups;
  uint64_t v11;
  NSString *morePlansURL;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTSweetgumPlansInfo;
  v5 = -[CTSweetgumPlansInfo init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("planGroups"));
    v9 = objc_claimAutoreleasedReturnValue();
    planGroups = v5->_planGroups;
    v5->_planGroups = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("morePlansURL"));
    v11 = objc_claimAutoreleasedReturnValue();
    morePlansURL = v5->_morePlansURL;
    v5->_morePlansURL = (NSString *)v11;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)planGroups
{
  return self->_planGroups;
}

- (void)setPlanGroups:(id)a3
{
  objc_storeStrong((id *)&self->_planGroups, a3);
}

- (NSString)morePlansURL
{
  return self->_morePlansURL;
}

- (void)setMorePlansURL:(id)a3
{
  objc_storeStrong((id *)&self->_morePlansURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_morePlansURL, 0);
  objc_storeStrong((id *)&self->_planGroups, 0);
}

@end
