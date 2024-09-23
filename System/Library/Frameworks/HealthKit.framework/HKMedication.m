@implementation HKMedication

- (HKMedication)init
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

- (HKMedication)initWithIdentifier:(id)a3 displayNameComponents:(id)a4 loggingUnit:(id)a5 components:(id)a6 codingCollection:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HKMedication *v17;
  uint64_t v18;
  HKMedicationIdentifier *identifier;
  uint64_t v20;
  HKMedicationDisplayNameComponents *displayNameComponents;
  uint64_t v22;
  HKMedicationLoggingUnit *loggingUnit;
  uint64_t v24;
  NSArray *components;
  uint64_t v26;
  HKClinicalCodingCollection *codingCollection;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKMedication;
  v17 = -[HKMedication init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (HKMedicationIdentifier *)v18;

    v20 = objc_msgSend(v13, "copy");
    displayNameComponents = v17->_displayNameComponents;
    v17->_displayNameComponents = (HKMedicationDisplayNameComponents *)v20;

    v22 = objc_msgSend(v14, "copy");
    loggingUnit = v17->_loggingUnit;
    v17->_loggingUnit = (HKMedicationLoggingUnit *)v22;

    v24 = objc_msgSend(v15, "copy");
    components = v17->_components;
    v17->_components = (NSArray *)v24;

    v26 = objc_msgSend(v16, "copy");
    codingCollection = v17->_codingCollection;
    v17->_codingCollection = (HKClinicalCodingCollection *)v26;

  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  HKMedication *v4;
  HKMedication *v5;
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
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;

  v4 = (HKMedication *)a3;
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
      -[HKMedication identifier](v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedication identifier](self, "identifier");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKMedication identifier](self, "identifier");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_29;
        v10 = (void *)v9;
        -[HKMedication identifier](v5, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedication identifier](self, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_30;
      }
      -[HKMedication displayNameComponents](v5, "displayNameComponents");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedication displayNameComponents](self, "displayNameComponents");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v15)
      {

      }
      else
      {
        v8 = (void *)v15;
        -[HKMedication displayNameComponents](self, "displayNameComponents");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_29;
        v17 = (void *)v16;
        -[HKMedication displayNameComponents](v5, "displayNameComponents");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedication displayNameComponents](self, "displayNameComponents");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if (!v20)
          goto LABEL_30;
      }
      -[HKMedication loggingUnit](v5, "loggingUnit");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedication loggingUnit](self, "loggingUnit");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v21)
      {

      }
      else
      {
        v8 = (void *)v21;
        -[HKMedication loggingUnit](self, "loggingUnit");
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
          goto LABEL_29;
        v23 = (void *)v22;
        -[HKMedication loggingUnit](v5, "loggingUnit");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedication loggingUnit](self, "loggingUnit");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqual:", v25);

        if (!v26)
          goto LABEL_30;
      }
      -[HKMedication components](v5, "components");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedication components](self, "components");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v27)
      {

      }
      else
      {
        v8 = (void *)v27;
        -[HKMedication components](self, "components");
        v28 = objc_claimAutoreleasedReturnValue();
        if (!v28)
          goto LABEL_29;
        v29 = (void *)v28;
        -[HKMedication components](v5, "components");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedication components](self, "components");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v30, "isEqualToArray:", v31);

        if (!v32)
          goto LABEL_30;
      }
      -[HKMedication codingCollection](v5, "codingCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKMedication codingCollection](self, "codingCollection");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v33)
      {

LABEL_34:
        v14 = 1;
        goto LABEL_31;
      }
      v8 = (void *)v33;
      -[HKMedication codingCollection](self, "codingCollection");
      v34 = objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v35 = (void *)v34;
        -[HKMedication codingCollection](v5, "codingCollection");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKMedication codingCollection](self, "codingCollection");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v36, "isEqual:", v37);

        if ((v38 & 1) != 0)
          goto LABEL_34;
LABEL_30:
        v14 = 0;
LABEL_31:

        goto LABEL_32;
      }
LABEL_29:

      goto LABEL_30;
    }
    v14 = 0;
  }
LABEL_32:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[HKMedicationIdentifier hash](self->_identifier, "hash");
  v4 = -[HKMedicationDisplayNameComponents hash](self->_displayNameComponents, "hash") ^ v3;
  v5 = -[HKMedicationLoggingUnit hash](self->_loggingUnit, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_components, "hash");
  return v6 ^ -[HKClinicalCodingCollection hash](self->_codingCollection, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedication)initWithCoder:(id)a3
{
  id v4;
  HKMedication *v5;
  uint64_t v6;
  HKMedicationIdentifier *identifier;
  uint64_t v8;
  HKMedicationDisplayNameComponents *displayNameComponents;
  uint64_t v10;
  HKMedicationLoggingUnit *loggingUnit;
  void *v12;
  uint64_t v13;
  NSArray *components;
  uint64_t v15;
  HKClinicalCodingCollection *codingCollection;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKMedication;
  v5 = -[HKMedication init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("IdentifierKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (HKMedicationIdentifier *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DisplayNameComponentsKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    displayNameComponents = v5->_displayNameComponents;
    v5->_displayNameComponents = (HKMedicationDisplayNameComponents *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LoggingUnitKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    loggingUnit = v5->_loggingUnit;
    v5->_loggingUnit = (HKMedicationLoggingUnit *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "hk_typesForArrayOf:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("ComponentsKey"));
    v13 = objc_claimAutoreleasedReturnValue();
    components = v5->_components;
    v5->_components = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CodingCollectionKey"));
    v15 = objc_claimAutoreleasedReturnValue();
    codingCollection = v5->_codingCollection;
    v5->_codingCollection = (HKClinicalCodingCollection *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  HKMedicationIdentifier *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("IdentifierKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayNameComponents, CFSTR("DisplayNameComponentsKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loggingUnit, CFSTR("LoggingUnitKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_components, CFSTR("ComponentsKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_codingCollection, CFSTR("CodingCollectionKey"));

}

- (HKMedicationIdentifier)identifier
{
  return self->_identifier;
}

- (HKMedicationDisplayNameComponents)displayNameComponents
{
  return self->_displayNameComponents;
}

- (HKMedicationLoggingUnit)loggingUnit
{
  return self->_loggingUnit;
}

- (NSArray)components
{
  return self->_components;
}

- (HKClinicalCodingCollection)codingCollection
{
  return self->_codingCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codingCollection, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_loggingUnit, 0);
  objc_storeStrong((id *)&self->_displayNameComponents, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
