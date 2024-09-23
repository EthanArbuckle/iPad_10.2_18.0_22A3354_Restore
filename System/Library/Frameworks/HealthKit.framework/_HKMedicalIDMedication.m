@implementation _HKMedicalIDMedication

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKMedicalIDMedication textDescription](self, "textDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@]:%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_HKMedicalIDMedication)initWithCoder:(id)a3
{
  id v4;
  _HKMedicalIDMedication *v5;
  void *v6;

  v4 = a3;
  v5 = -[_HKMedicalIDMedication init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKMedicalIDMedicationTextDescriptionKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKMedicalIDMedication setTextDescription:](v5, "setTextDescription:", v6);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _HKMedicalIDMedication *v4;
  void *v5;
  void *v6;

  v4 = -[_HKMedicalIDMedication init](+[_HKMedicalIDMedication allocWithZone:](_HKMedicalIDMedication, "allocWithZone:", a3), "init");
  -[_HKMedicalIDMedication textDescription](self, "textDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[_HKMedicalIDMedication setTextDescription:](v4, "setTextDescription:", v6);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_HKMedicalIDMedication textDescription](self, "textDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HKMedicalIDMedicationTextDescriptionKey"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_HKMedicalIDMedication textDescription](self, "textDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v4, "textDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[_HKMedicalIDMedication textDescription](self, "textDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "textDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)textDescription
{
  return self->_textDescription;
}

- (void)setTextDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textDescription, 0);
}

@end
