@implementation HKMedicationDosage

+ (id)indexableKeyPathsWithPrefix:(id)a3
{
  return +[HKConceptIndexUtilities keyPaths:prefix:](HKConceptIndexUtilities, "keyPaths:prefix:", &unk_1E389DDB0, a3);
}

+ (id)dosageWithInstruction:(id)a3 timingPeriod:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInstruction:timingPeriod:siteCoding:routeCoding:methodCoding:", v7, v6, 0, 0, 0);

  return v8;
}

+ (id)dosageWithInstruction:(id)a3 timingPeriod:(id)a4 siteCoding:(id)a5 routeCoding:(id)a6 methodCoding:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInstruction:timingPeriod:siteCoding:routeCoding:methodCoding:", v16, v15, v14, v13, v12);

  return v17;
}

- (HKMedicationDosage)init
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

- (HKMedicationDosage)initWithInstruction:(id)a3 timingPeriod:(id)a4 siteCoding:(id)a5 routeCoding:(id)a6 methodCoding:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HKMedicationDosage *v17;
  uint64_t v18;
  NSString *instruction;
  uint64_t v20;
  HKMedicalDateInterval *timingPeriod;
  uint64_t v22;
  HKMedicalCoding *siteCoding;
  uint64_t v24;
  HKMedicalCoding *routeCoding;
  uint64_t v26;
  HKMedicalCoding *methodCoding;
  void *v28;
  uint64_t v29;
  HKConcept *site;
  void *v31;
  uint64_t v32;
  HKConcept *route;
  void *v34;
  uint64_t v35;
  HKConcept *method;
  objc_super v38;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v38.receiver = self;
  v38.super_class = (Class)HKMedicationDosage;
  v17 = -[HKMedicationDosage init](&v38, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    instruction = v17->_instruction;
    v17->_instruction = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    timingPeriod = v17->_timingPeriod;
    v17->_timingPeriod = (HKMedicalDateInterval *)v20;

    v22 = objc_msgSend(v14, "copy");
    siteCoding = v17->_siteCoding;
    v17->_siteCoding = (HKMedicalCoding *)v22;

    v24 = objc_msgSend(v15, "copy");
    routeCoding = v17->_routeCoding;
    v17->_routeCoding = (HKMedicalCoding *)v24;

    v26 = objc_msgSend(v16, "copy");
    methodCoding = v17->_methodCoding;
    v17->_methodCoding = (HKMedicalCoding *)v26;

    if (v17->_siteCoding)
    {
      -[HKMedicationDosage _siteCodingCollection](v17, "_siteCodingCollection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v28);
      v29 = objc_claimAutoreleasedReturnValue();
      site = v17->_site;
      v17->_site = (HKConcept *)v29;

    }
    if (v17->_routeCoding)
    {
      -[HKMedicationDosage _routeCodingCollection](v17, "_routeCodingCollection");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v31);
      v32 = objc_claimAutoreleasedReturnValue();
      route = v17->_route;
      v17->_route = (HKConcept *)v32;

    }
    if (v17->_methodCoding)
    {
      -[HKMedicationDosage _methodCodingCollection](v17, "_methodCodingCollection");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v34);
      v35 = objc_claimAutoreleasedReturnValue();
      method = v17->_method;
      v17->_method = (HKConcept *)v35;

    }
  }

  return v17;
}

- (id)_siteCodingCollection
{
  return +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", self->_siteCoding);
}

- (id)_routeCodingCollection
{
  return +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", self->_routeCoding);
}

- (id)_methodCodingCollection
{
  return +[HKMedicalCodingCollection collectionWithCoding:](HKMedicalCodingCollection, "collectionWithCoding:", self->_methodCoding);
}

- (void)_setSiteCoding:(id)a3
{
  HKMedicalCoding *v5;
  HKMedicalCoding *siteCoding;
  HKConcept *v7;
  HKConcept *site;
  HKConcept *v9;
  uint64_t v10;

  v5 = (HKMedicalCoding *)objc_msgSend(a3, "copy");
  siteCoding = self->_siteCoding;
  self->_siteCoding = v5;

  if (a3)
  {
    -[HKMedicationDosage _siteCodingCollection](self, "_siteCodingCollection");
    v10 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v10);
    v7 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    site = self->_site;
    self->_site = v7;

    v9 = (HKConcept *)v10;
  }
  else
  {
    v9 = self->_site;
    self->_site = 0;
  }

}

- (void)_setRouteCoding:(id)a3
{
  HKMedicalCoding *v5;
  HKMedicalCoding *routeCoding;
  HKConcept *v7;
  HKConcept *route;
  HKConcept *v9;
  uint64_t v10;

  v5 = (HKMedicalCoding *)objc_msgSend(a3, "copy");
  routeCoding = self->_routeCoding;
  self->_routeCoding = v5;

  if (a3)
  {
    -[HKMedicationDosage _routeCodingCollection](self, "_routeCodingCollection");
    v10 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v10);
    v7 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    route = self->_route;
    self->_route = v7;

    v9 = (HKConcept *)v10;
  }
  else
  {
    v9 = self->_route;
    self->_route = 0;
  }

}

- (void)_setMethodCoding:(id)a3
{
  HKMedicalCoding *v5;
  HKMedicalCoding *methodCoding;
  HKConcept *v7;
  HKConcept *method;
  HKConcept *v9;
  uint64_t v10;

  v5 = (HKMedicalCoding *)objc_msgSend(a3, "copy");
  methodCoding = self->_methodCoding;
  self->_methodCoding = v5;

  if (a3)
  {
    -[HKMedicationDosage _methodCodingCollection](self, "_methodCodingCollection");
    v10 = objc_claimAutoreleasedReturnValue();
    +[HKConceptSynthesizer synthesizeInMemoryConceptForCodingCollection:](HKConceptSynthesizer, "synthesizeInMemoryConceptForCodingCollection:", v10);
    v7 = (HKConcept *)objc_claimAutoreleasedReturnValue();
    method = self->_method;
    self->_method = v7;

    v9 = (HKConcept *)v10;
  }
  else
  {
    v9 = self->_method;
    self->_method = 0;
  }

}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[NSString hash](self->_instruction, "hash");
  v4 = -[HKMedicalDateInterval hash](self->_timingPeriod, "hash") ^ v3;
  v5 = -[HKConcept hash](self->_site, "hash");
  v6 = v4 ^ v5 ^ -[HKMedicalCoding hash](self->_siteCoding, "hash");
  v7 = -[HKConcept hash](self->_route, "hash");
  v8 = v7 ^ -[HKMedicalCoding hash](self->_routeCoding, "hash");
  v9 = v6 ^ v8 ^ -[HKConcept hash](self->_method, "hash");
  return v9 ^ -[HKMedicalCoding hash](self->_methodCoding, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKMedicationDosage *v4;
  HKMedicationDosage *v5;
  NSString *instruction;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSString *v11;
  void *v12;
  BOOL v13;
  HKMedicalDateInterval *timingPeriod;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  HKMedicalDateInterval *v18;
  void *v19;
  HKMedicalCoding *siteCoding;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  HKMedicalCoding *v24;
  void *v25;
  HKMedicalCoding *routeCoding;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  HKMedicalCoding *v30;
  void *v31;
  HKMedicalCoding *methodCoding;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  HKMedicalCoding *v36;
  void *v37;
  HKConcept *site;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  HKConcept *v42;
  void *v43;
  HKConcept *route;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  HKConcept *v48;
  void *v49;
  HKConcept *method;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  HKConcept *v54;
  void *v55;

  v4 = (HKMedicationDosage *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      instruction = self->_instruction;
      -[HKMedicationDosage instruction](v5, "instruction");
      v7 = objc_claimAutoreleasedReturnValue();
      if (instruction == (NSString *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HKMedicationDosage instruction](v5, "instruction");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_44;
        v10 = (void *)v9;
        v11 = self->_instruction;
        -[HKMedicationDosage instruction](v5, "instruction");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = -[NSString isEqual:](v11, "isEqual:", v12);

        if (!(_DWORD)v11)
          goto LABEL_45;
      }
      timingPeriod = self->_timingPeriod;
      -[HKMedicationDosage timingPeriod](v5, "timingPeriod");
      v15 = objc_claimAutoreleasedReturnValue();
      if (timingPeriod == (HKMedicalDateInterval *)v15)
      {

      }
      else
      {
        v8 = (void *)v15;
        -[HKMedicationDosage timingPeriod](v5, "timingPeriod");
        v16 = objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_44;
        v17 = (void *)v16;
        v18 = self->_timingPeriod;
        -[HKMedicationDosage timingPeriod](v5, "timingPeriod");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v18) = -[HKMedicalDateInterval isEqual:](v18, "isEqual:", v19);

        if (!(_DWORD)v18)
          goto LABEL_45;
      }
      siteCoding = self->_siteCoding;
      -[HKMedicationDosage siteCoding](v5, "siteCoding");
      v21 = objc_claimAutoreleasedReturnValue();
      if (siteCoding == (HKMedicalCoding *)v21)
      {

      }
      else
      {
        v8 = (void *)v21;
        -[HKMedicationDosage siteCoding](v5, "siteCoding");
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
          goto LABEL_44;
        v23 = (void *)v22;
        v24 = self->_siteCoding;
        -[HKMedicationDosage siteCoding](v5, "siteCoding");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v24) = -[HKMedicalCoding isEqual:](v24, "isEqual:", v25);

        if (!(_DWORD)v24)
          goto LABEL_45;
      }
      routeCoding = self->_routeCoding;
      -[HKMedicationDosage routeCoding](v5, "routeCoding");
      v27 = objc_claimAutoreleasedReturnValue();
      if (routeCoding == (HKMedicalCoding *)v27)
      {

      }
      else
      {
        v8 = (void *)v27;
        -[HKMedicationDosage routeCoding](v5, "routeCoding");
        v28 = objc_claimAutoreleasedReturnValue();
        if (!v28)
          goto LABEL_44;
        v29 = (void *)v28;
        v30 = self->_routeCoding;
        -[HKMedicationDosage routeCoding](v5, "routeCoding");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v30) = -[HKMedicalCoding isEqual:](v30, "isEqual:", v31);

        if (!(_DWORD)v30)
          goto LABEL_45;
      }
      methodCoding = self->_methodCoding;
      -[HKMedicationDosage methodCoding](v5, "methodCoding");
      v33 = objc_claimAutoreleasedReturnValue();
      if (methodCoding == (HKMedicalCoding *)v33)
      {

      }
      else
      {
        v8 = (void *)v33;
        -[HKMedicationDosage methodCoding](v5, "methodCoding");
        v34 = objc_claimAutoreleasedReturnValue();
        if (!v34)
          goto LABEL_44;
        v35 = (void *)v34;
        v36 = self->_methodCoding;
        -[HKMedicationDosage methodCoding](v5, "methodCoding");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v36) = -[HKMedicalCoding isEqual:](v36, "isEqual:", v37);

        if (!(_DWORD)v36)
          goto LABEL_45;
      }
      site = self->_site;
      -[HKMedicationDosage site](v5, "site");
      v39 = objc_claimAutoreleasedReturnValue();
      if (site == (HKConcept *)v39)
      {

      }
      else
      {
        v8 = (void *)v39;
        -[HKMedicationDosage site](v5, "site");
        v40 = objc_claimAutoreleasedReturnValue();
        if (!v40)
          goto LABEL_44;
        v41 = (void *)v40;
        v42 = self->_site;
        -[HKMedicationDosage site](v5, "site");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v42) = -[HKConcept isEqual:](v42, "isEqual:", v43);

        if (!(_DWORD)v42)
          goto LABEL_45;
      }
      route = self->_route;
      -[HKMedicationDosage route](v5, "route");
      v45 = objc_claimAutoreleasedReturnValue();
      if (route == (HKConcept *)v45)
      {

      }
      else
      {
        v8 = (void *)v45;
        -[HKMedicationDosage route](v5, "route");
        v46 = objc_claimAutoreleasedReturnValue();
        if (!v46)
          goto LABEL_44;
        v47 = (void *)v46;
        v48 = self->_route;
        -[HKMedicationDosage route](v5, "route");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v48) = -[HKConcept isEqual:](v48, "isEqual:", v49);

        if (!(_DWORD)v48)
          goto LABEL_45;
      }
      method = self->_method;
      -[HKMedicationDosage method](v5, "method");
      v51 = objc_claimAutoreleasedReturnValue();
      if (method == (HKConcept *)v51)
      {

LABEL_49:
        v13 = 1;
        goto LABEL_46;
      }
      v8 = (void *)v51;
      -[HKMedicationDosage method](v5, "method");
      v52 = objc_claimAutoreleasedReturnValue();
      if (v52)
      {
        v53 = (void *)v52;
        v54 = self->_method;
        -[HKMedicationDosage method](v5, "method");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v54) = -[HKConcept isEqual:](v54, "isEqual:", v55);

        if ((v54 & 1) != 0)
          goto LABEL_49;
LABEL_45:
        v13 = 0;
LABEL_46:

        goto LABEL_47;
      }
LABEL_44:

      goto LABEL_45;
    }
    v13 = 0;
  }
LABEL_47:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicationDosage)initWithCoder:(id)a3
{
  id v4;
  HKMedicationDosage *v5;
  uint64_t v6;
  NSString *instruction;
  uint64_t v8;
  HKMedicalDateInterval *timingPeriod;
  uint64_t v10;
  HKConcept *site;
  uint64_t v12;
  HKMedicalCoding *siteCoding;
  uint64_t v14;
  HKConcept *route;
  uint64_t v16;
  HKMedicalCoding *routeCoding;
  uint64_t v18;
  HKConcept *method;
  uint64_t v20;
  HKMedicalCoding *methodCoding;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HKMedicationDosage;
  v5 = -[HKMedicationDosage init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Instruction"));
    v6 = objc_claimAutoreleasedReturnValue();
    instruction = v5->_instruction;
    v5->_instruction = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TimingPeriod"));
    v8 = objc_claimAutoreleasedReturnValue();
    timingPeriod = v5->_timingPeriod;
    v5->_timingPeriod = (HKMedicalDateInterval *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiteConcept"));
    v10 = objc_claimAutoreleasedReturnValue();
    site = v5->_site;
    v5->_site = (HKConcept *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SiteCoding"));
    v12 = objc_claimAutoreleasedReturnValue();
    siteCoding = v5->_siteCoding;
    v5->_siteCoding = (HKMedicalCoding *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RouteConcept"));
    v14 = objc_claimAutoreleasedReturnValue();
    route = v5->_route;
    v5->_route = (HKConcept *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RouteCoding"));
    v16 = objc_claimAutoreleasedReturnValue();
    routeCoding = v5->_routeCoding;
    v5->_routeCoding = (HKMedicalCoding *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MethodConcept"));
    v18 = objc_claimAutoreleasedReturnValue();
    method = v5->_method;
    v5->_method = (HKConcept *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MethodCoding"));
    v20 = objc_claimAutoreleasedReturnValue();
    methodCoding = v5->_methodCoding;
    v5->_methodCoding = (HKMedicalCoding *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *instruction;
  id v5;

  instruction = self->_instruction;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", instruction, CFSTR("Instruction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timingPeriod, CFSTR("TimingPeriod"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_site, CFSTR("SiteConcept"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_siteCoding, CFSTR("SiteCoding"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_route, CFSTR("RouteConcept"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_routeCoding, CFSTR("RouteCoding"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_method, CFSTR("MethodConcept"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_methodCoding, CFSTR("MethodCoding"));

}

- (id)codingsForKeyPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("site")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("method")))
    {
      -[HKMedicationDosage methodCoding](self, "methodCoding");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[HKMedicationDosage _methodCodingCollection](self, "_methodCodingCollection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v9;
        v10 = (void *)MEMORY[0x1E0C99D20];
        v11 = &v17;
        goto LABEL_10;
      }
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("route")))
      {
        +[HKConceptIndexUtilities assignError:forInvalidKeyPath:inClass:](HKConceptIndexUtilities, "assignError:forInvalidKeyPath:inClass:", a4, v6, objc_opt_class());
        v14 = 0;
        goto LABEL_13;
      }
      -[HKMedicationDosage routeCoding](self, "routeCoding");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[HKMedicationDosage _routeCodingCollection](self, "_routeCodingCollection");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v9;
        v10 = (void *)MEMORY[0x1E0C99D20];
        v11 = &v16;
        goto LABEL_10;
      }
    }
LABEL_11:
    v14 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_13;
  }
  -[HKMedicationDosage siteCoding](self, "siteCoding");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_11;
  -[HKMedicationDosage _siteCodingCollection](self, "_siteCodingCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKIndexableObject indexableObjectWithObject:](HKIndexableObject, "indexableObjectWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = &v18;
LABEL_10:
  objc_msgSend(v10, "arrayWithObjects:count:", v11, 1, v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v14;
}

- (BOOL)applyConcepts:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  HKConcept *v14;
  HKConcept *method;
  void *v16;
  _BOOL4 v17;
  HKConcept *v18;
  void *v19;
  _BOOL4 v20;
  HKConcept *v21;
  BOOL v22;

  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("site")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("method")))
    {
      -[HKMedicationDosage methodCoding](self, "methodCoding");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = HKIndexableObjectCheckCardinalityForIndexRestore(1, v16 != 0, (uint64_t)v9, (uint64_t)a5);

      if (v17)
      {
        objc_msgSend(v8, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "object");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (HKConcept *)objc_msgSend(v13, "copy");
        method = self->_method;
        self->_method = v18;
        goto LABEL_10;
      }
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("route")))
    {
      -[HKMedicationDosage routeCoding](self, "routeCoding");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = HKIndexableObjectCheckCardinalityForIndexRestore(1, v19 != 0, (uint64_t)v9, (uint64_t)a5);

      if (v20)
      {
        objc_msgSend(v8, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "object");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (HKConcept *)objc_msgSend(v13, "copy");
        method = self->_route;
        self->_route = v21;
        goto LABEL_10;
      }
    }
    else
    {
      +[HKConceptIndexUtilities assignError:forInvalidKeyPath:inClass:](HKConceptIndexUtilities, "assignError:forInvalidKeyPath:inClass:", a5, v9, objc_opt_class());
    }
LABEL_12:
    v22 = 0;
    goto LABEL_13;
  }
  -[HKMedicationDosage siteCoding](self, "siteCoding");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = HKIndexableObjectCheckCardinalityForIndexRestore(1, v10 != 0, (uint64_t)v9, (uint64_t)a5);

  if (!v11)
    goto LABEL_12;
  objc_msgSend(v8, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (HKConcept *)objc_msgSend(v13, "copy");
  method = self->_site;
  self->_site = v14;
LABEL_10:

  v22 = 1;
LABEL_13:

  return v22;
}

- (NSString)instruction
{
  return self->_instruction;
}

- (HKMedicalDateInterval)timingPeriod
{
  return self->_timingPeriod;
}

- (HKConcept)site
{
  return self->_site;
}

- (HKMedicalCoding)siteCoding
{
  return self->_siteCoding;
}

- (HKConcept)route
{
  return self->_route;
}

- (HKMedicalCoding)routeCoding
{
  return self->_routeCoding;
}

- (HKConcept)method
{
  return self->_method;
}

- (HKMedicalCoding)methodCoding
{
  return self->_methodCoding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methodCoding, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_routeCoding, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_siteCoding, 0);
  objc_storeStrong((id *)&self->_site, 0);
  objc_storeStrong((id *)&self->_timingPeriod, 0);
  objc_storeStrong((id *)&self->_instruction, 0);
}

@end
