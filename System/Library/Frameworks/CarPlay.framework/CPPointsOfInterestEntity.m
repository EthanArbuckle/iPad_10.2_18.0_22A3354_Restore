@implementation CPPointsOfInterestEntity

- (CPPointsOfInterestEntity)initWithTitle:(id)a3 pointsOfInterest:(id)a4
{
  id v6;
  id v7;
  CPPointsOfInterestEntity *v8;
  uint64_t v9;
  NSString *title;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPPointsOfInterestEntity;
  v8 = -[CPEntity _init](&v12, sel__init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    objc_storeStrong((id *)&v8->_pointsOfInterest, a4);
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPPointsOfInterestEntity)initWithCoder:(id)a3
{
  id v4;
  CPPointsOfInterestEntity *v5;
  uint64_t v6;
  NSString *title;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *pointsOfInterest;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPPointsOfInterestEntity;
  v5 = -[CPEntity initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPPointsOfInterestEntityTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("CPPointsOfInterestEntityPointsOfInterest"));
    v11 = objc_claimAutoreleasedReturnValue();
    pointsOfInterest = v5->_pointsOfInterest;
    v5->_pointsOfInterest = (NSArray *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPPointsOfInterestEntity;
  v4 = a3;
  -[CPEntity encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CPPointsOfInterestEntity title](self, "title", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("CPPointsOfInterestEntityTitle"));

  -[CPPointsOfInterestEntity pointsOfInterest](self, "pointsOfInterest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("CPPointsOfInterestEntityPointsOfInterest"));

}

- (id)objectForIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[CPPointsOfInterestEntity pointsOfInterest](self, "pointsOfInterest", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "primaryButton");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqual:", v4);

          if ((v14 & 1) != 0)
          {
            v16 = v12;
            goto LABEL_15;
          }
        }
        objc_msgSend(v10, "secondaryButton");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqual:", v4);

          if (v18)
          {

            goto LABEL_15;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v7)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_15:

  return v16;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)pointsOfInterest
{
  return self->_pointsOfInterest;
}

- (void)setPointsOfInterest:(id)a3
{
  objc_storeStrong((id *)&self->_pointsOfInterest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointsOfInterest, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
