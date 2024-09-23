@implementation HKMedicationDisplayNameComponents

- (HKMedicationDisplayNameComponents)init
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

- (HKMedicationDisplayNameComponents)initWithFullDisplayName:(id)a3 medicationDisplayName:(id)a4 displayStrength:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKMedicationDisplayNameComponents *v11;
  uint64_t v12;
  NSString *fullDisplayName;
  uint64_t v14;
  NSString *medicationDisplayName;
  uint64_t v16;
  NSString *displayStrength;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKMedicationDisplayNameComponents;
  v11 = -[HKMedicationDisplayNameComponents init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    fullDisplayName = v11->_fullDisplayName;
    v11->_fullDisplayName = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    medicationDisplayName = v11->_medicationDisplayName;
    v11->_medicationDisplayName = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    displayStrength = v11->_displayStrength;
    v11->_displayStrength = (NSString *)v16;

  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationDisplayNameComponents *v4;
  HKMedicationDisplayNameComponents *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;

  v4 = (HKMedicationDisplayNameComponents *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HKMedicationDisplayNameComponents fullDisplayName](v5, "fullDisplayName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicationDisplayNameComponents fullDisplayName](self, "fullDisplayName");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKMedicationDisplayNameComponents fullDisplayName](self, "fullDisplayName");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_19;
        v10 = (void *)v9;
        -[HKMedicationDisplayNameComponents fullDisplayName](v5, "fullDisplayName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicationDisplayNameComponents fullDisplayName](self, "fullDisplayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if (!v13)
          goto LABEL_20;
      }
      -[HKMedicationDisplayNameComponents medicationDisplayName](v5, "medicationDisplayName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicationDisplayNameComponents medicationDisplayName](self, "medicationDisplayName");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

      }
      else
      {
        v8 = (void *)v15;
        -[HKMedicationDisplayNameComponents medicationDisplayName](self, "medicationDisplayName");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_19;
        v17 = (void *)v16;
        -[HKMedicationDisplayNameComponents medicationDisplayName](v5, "medicationDisplayName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicationDisplayNameComponents medicationDisplayName](self, "medicationDisplayName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if (!v20)
          goto LABEL_20;
      }
      -[HKMedicationDisplayNameComponents displayStrength](v5, "displayStrength");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedicationDisplayNameComponents displayStrength](self, "displayStrength");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v21)
      {

LABEL_24:
        v14 = 1;
        goto LABEL_21;
      }
      v8 = (void *)v21;
      -[HKMedicationDisplayNameComponents displayStrength](self, "displayStrength");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        -[HKMedicationDisplayNameComponents displayStrength](v5, "displayStrength");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedicationDisplayNameComponents displayStrength](self, "displayStrength");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqualToString:", v25);

        if ((v26 & 1) != 0)
          goto LABEL_24;
LABEL_20:
        v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    v14 = 0;
  }
LABEL_22:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_fullDisplayName, "hash");
  v4 = -[NSString hash](self->_medicationDisplayName, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_displayStrength, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationDisplayNameComponents)initWithCoder:(id)a3
{
  id v4;
  HKMedicationDisplayNameComponents *v5;
  uint64_t v6;
  NSString *fullDisplayName;
  uint64_t v8;
  NSString *medicationDisplayName;
  uint64_t v10;
  NSString *displayStrength;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKMedicationDisplayNameComponents;
  v5 = -[HKMedicationDisplayNameComponents init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FullDisplayNameKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    fullDisplayName = v5->_fullDisplayName;
    v5->_fullDisplayName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MedicationDisplayNameKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    medicationDisplayName = v5->_medicationDisplayName;
    v5->_medicationDisplayName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DisplayStrengthKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    displayStrength = v5->_displayStrength;
    v5->_displayStrength = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *fullDisplayName;
  id v5;

  fullDisplayName = self->_fullDisplayName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", fullDisplayName, CFSTR("FullDisplayNameKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_medicationDisplayName, CFSTR("MedicationDisplayNameKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayStrength, CFSTR("DisplayStrengthKey"));

}

- (NSString)fullDisplayName
{
  return self->_fullDisplayName;
}

- (NSString)medicationDisplayName
{
  return self->_medicationDisplayName;
}

- (NSString)displayStrength
{
  return self->_displayStrength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayStrength, 0);
  objc_storeStrong((id *)&self->_medicationDisplayName, 0);
  objc_storeStrong((id *)&self->_fullDisplayName, 0);
}

@end
