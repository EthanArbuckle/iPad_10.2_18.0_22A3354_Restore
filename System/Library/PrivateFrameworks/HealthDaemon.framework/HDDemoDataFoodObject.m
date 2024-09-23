@implementation HDDemoDataFoodObject

- (HDDemoDataFoodObject)initWithBrandName:(id)a3 genericName:(id)a4 foodType:(int64_t)a5 nutritionFacts:(id)a6
{
  id v11;
  id v12;
  id v13;
  HDDemoDataFoodObject *v14;
  HDDemoDataFoodObject *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDDemoDataFoodObject;
  v14 = -[HDDemoDataFoodObject init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_brandName, a3);
    objc_storeStrong((id *)&v15->_genericName, a4);
    v15->_foodType = a5;
    v15->_recommendedNumServings = 1.0;
    objc_storeStrong((id *)&v15->_nutritionFacts, a6);
  }

  return v15;
}

- (id)description
{
  void *v3;
  NSString *brandName;
  NSString *genericName;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  brandName = self->_brandName;
  genericName = self->_genericName;
  NSStringFromHDDemoDataFoodType(self->_foodType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Brand name: %@\nGeneric name: %@\nFood type: %@\nRecommend Serving: %.1f\nNutrion facts: %@"), brandName, genericName, v6, *(_QWORD *)&self->_recommendedNumServings, self->_nutritionFacts);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDemoDataFoodObject)initWithCoder:(id)a3
{
  id v4;
  HDDemoDataFoodObject *v5;
  uint64_t v6;
  NSString *brandName;
  uint64_t v8;
  NSString *genericName;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *nutritionFacts;
  double v15;
  objc_super v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDDemoDataFoodObject;
  v5 = -[HDDemoDataFoodObject init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDDemoDataFoodObjectBrandNameKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    brandName = v5->_brandName;
    v5->_brandName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HDDemoDataFoodObjectGenericNameKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    genericName = v5->_genericName;
    v5->_genericName = (NSString *)v8;

    v5->_foodType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HDDemoDataFoodObjectFoodTypeKey"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("HDDemoDataFoodObjectNutritionFactsKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    nutritionFacts = v5->_nutritionFacts;
    v5->_nutritionFacts = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("HDDemoDataFoodObjectRecommendedServingsKey"));
    v5->_recommendedNumServings = v15;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *brandName;
  id v5;

  brandName = self->_brandName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", brandName, CFSTR("HDDemoDataFoodObjectBrandNameKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_genericName, CFSTR("HDDemoDataFoodObjectGenericNameKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_foodType, CFSTR("HDDemoDataFoodObjectFoodTypeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nutritionFacts, CFSTR("HDDemoDataFoodObjectNutritionFactsKey"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("HDDemoDataFoodObjectRecommendedServingsKey"), self->_recommendedNumServings);

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  HDDemoDataFoodObject *v6;
  HDDemoDataFoodObject *v7;
  HDDemoDataFoodObject *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v31;
  void *v32;
  char v33;

  v6 = (HDDemoDataFoodObject *)a3;
  if (self == v6)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      v8 = v7;
      v9 = 0;
      if (!self || !v7)
        goto LABEL_26;
      -[HDDemoDataFoodObject brandName](self, "brandName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10
        || (-[HDDemoDataFoodObject brandName](v8, "brandName"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[HDDemoDataFoodObject brandName](self, "brandName");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDDemoDataFoodObject brandName](v8, "brandName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "isEqualToString:", v11);

        if (v10)
        {
LABEL_13:

          -[HDDemoDataFoodObject genericName](self, "genericName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13
            || (-[HDDemoDataFoodObject genericName](v8, "genericName"),
                (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[HDDemoDataFoodObject genericName](self, "genericName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDDemoDataFoodObject genericName](v8, "genericName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v14, "isEqualToString:", v15);

            if (v13)
            {
LABEL_19:

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HDDemoDataFoodObject foodType](self, "foodType"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HDDemoDataFoodObject foodType](v8, "foodType"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v16, "isEqualToNumber:", v17);

              -[HDDemoDataFoodObject nutritionFacts](self, "nutritionFacts");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19
                || (-[HDDemoDataFoodObject nutritionFacts](v8, "nutritionFacts"),
                    (v31 = objc_claimAutoreleasedReturnValue()) != 0))
              {
                -[HDDemoDataFoodObject nutritionFacts](self, "nutritionFacts", v31);
                v20 = v18;
                v21 = v12;
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[HDDemoDataFoodObject nutritionFacts](v8, "nutritionFacts");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v22, "isEqualToDictionary:", v23);

                v12 = v21;
                v18 = v20;
                if (v19)
                {
LABEL_25:

                  v25 = (void *)MEMORY[0x1E0CB37E8];
                  -[HDDemoDataFoodObject recommendedNumServings](self, "recommendedNumServings");
                  objc_msgSend(v25, "numberWithDouble:");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = (void *)MEMORY[0x1E0CB37E8];
                  -[HDDemoDataFoodObject recommendedNumServings](v8, "recommendedNumServings");
                  objc_msgSend(v27, "numberWithDouble:");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = objc_msgSend(v26, "isEqualToNumber:", v28);

                  v9 = v12 & v33 & v24 & v18 & v29;
LABEL_26:

                  goto LABEL_27;
                }
              }
              else
              {
                v32 = 0;
                v24 = 1;
              }

              goto LABEL_25;
            }
          }
          else
          {
            v33 = 1;
          }

          goto LABEL_19;
        }
      }
      else
      {
        v12 = 1;
      }

      goto LABEL_13;
    }
    v9 = 0;
  }
LABEL_27:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  unint64_t v11;

  -[HDDemoDataFoodObject brandName](self, "brandName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HDDemoDataFoodObject genericName](self, "genericName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[HDDemoDataFoodObject nutritionFacts](self, "nutritionFacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v8 + 32 * -[HDDemoDataFoodObject foodType](self, "foodType");
  -[HDDemoDataFoodObject recommendedNumServings](self, "recommendedNumServings");
  v11 = v6 ^ (v9 + (unint64_t)v10);

  return v11;
}

- (NSString)brandName
{
  return self->_brandName;
}

- (void)setBrandName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)genericName
{
  return self->_genericName;
}

- (void)setGenericName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)foodType
{
  return self->_foodType;
}

- (void)setFoodType:(int64_t)a3
{
  self->_foodType = a3;
}

- (NSDictionary)nutritionFacts
{
  return self->_nutritionFacts;
}

- (void)setNutritionFacts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)recommendedNumServings
{
  return self->_recommendedNumServings;
}

- (void)setRecommendedNumServings:(double)a3
{
  self->_recommendedNumServings = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nutritionFacts, 0);
  objc_storeStrong((id *)&self->_genericName, 0);
  objc_storeStrong((id *)&self->_brandName, 0);
}

@end
