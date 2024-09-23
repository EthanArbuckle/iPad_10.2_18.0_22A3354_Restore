@implementation HKMedicationComponent

- (HKMedicationComponent)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKMedicationComponent)initWithComponentForm:(int64_t)a3 ingredients:(id)a4
{
  id v6;
  HKMedicationComponent *v7;
  HKMedicationComponent *v8;
  uint64_t v9;
  NSSet *ingredients;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKMedicationComponent;
  v7 = -[HKMedicationComponent init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_componentForm = a3;
    v9 = objc_msgSend(v6, "copy");
    ingredients = v8->_ingredients;
    v8->_ingredients = (NSSet *)v9;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationComponent *v4;
  HKMedicationComponent *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v4 = (HKMedicationComponent *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[HKMedicationComponent componentForm](v5, "componentForm");
      if (v6 == -[HKMedicationComponent componentForm](self, "componentForm"))
      {
        -[HKMedicationComponent ingredients](v5, "ingredients");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicationComponent ingredients](self, "ingredients");
        v8 = objc_claimAutoreleasedReturnValue();
        if (v7 == (void *)v8)
        {

          goto LABEL_11;
        }
        v9 = (void *)v8;
        -[HKMedicationComponent ingredients](self, "ingredients");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          -[HKMedicationComponent ingredients](v5, "ingredients");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKMedicationComponent ingredients](self, "ingredients");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToSet:", v13);

          if ((v14 & 1) == 0)
            goto LABEL_13;
LABEL_11:
          v15 = 1;
LABEL_14:

          goto LABEL_15;
        }

      }
LABEL_13:
      v15 = 0;
      goto LABEL_14;
    }
    v15 = 0;
  }
LABEL_15:

  return v15;
}

- (unint64_t)hash
{
  int64_t componentForm;

  componentForm = self->_componentForm;
  return -[NSSet hash](self->_ingredients, "hash") ^ componentForm;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationComponent)initWithCoder:(id)a3
{
  id v4;
  HKMedicationComponent *v5;
  void *v6;
  uint64_t v7;
  NSSet *ingredients;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKMedicationComponent;
  v5 = -[HKMedicationComponent init](&v10, sel_init);
  if (v5)
  {
    v5->_componentForm = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Form"));
    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForSetOf:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("Ingredients"));
    v7 = objc_claimAutoreleasedReturnValue();
    ingredients = v5->_ingredients;
    v5->_ingredients = (NSSet *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t componentForm;
  id v5;

  componentForm = self->_componentForm;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", componentForm, CFSTR("Form"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ingredients, CFSTR("Ingredients"));

}

- (int64_t)componentForm
{
  return self->_componentForm;
}

- (NSSet)ingredients
{
  return self->_ingredients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ingredients, 0);
}

@end
