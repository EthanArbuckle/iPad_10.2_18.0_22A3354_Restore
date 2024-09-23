@implementation IRCandidateInspection

- (IRCandidateInspection)initWithInspectionGenerator:(id)a3
{
  id v5;
  IRCandidateInspection *v6;
  IRCandidateInspection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRCandidateInspection;
  v6 = -[IRCandidateInspection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_inspectionGenerator, a3);

  return v7;
}

- (IRCandidateInspection)initWithInspectionServicePackage:(id)a3
{
  id v5;
  IRCandidateInspection *v6;
  IRCandidateInspection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRCandidateInspection;
  v6 = -[IRCandidateInspection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_inspectionServicePackage, a3);

  return v7;
}

- (id)exportCandidateInspectionAsDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &stru_251046168, CFSTR("ServicePackageInspection"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &stru_251046168, CFSTR("GeneratorInspection"));
  -[IRCandidateInspection inspectionServicePackage](self, "inspectionServicePackage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[IRCandidateInspection inspectionServicePackage](self, "inspectionServicePackage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "exportCandidateInspectionAsDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ServicePackageInspection"));

  }
  -[IRCandidateInspection inspectionGenerator](self, "inspectionGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[IRCandidateInspection inspectionGenerator](self, "inspectionGenerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exportCandidateInspectionAsDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("GeneratorInspection"));

  }
  return v3;
}

- (int64_t)getClassification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[IRCandidateInspection inspectionServicePackage](self, "inspectionServicePackage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IRCandidateInspection inspectionServicePackage](self, "inspectionServicePackage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v4;
    v7 = objc_msgSend(v4, "classification");

    return v7;
  }
  -[IRCandidateInspection inspectionGenerator](self, "inspectionGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IRCandidateInspection inspectionGenerator](self, "inspectionGenerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return 0;
}

- (id)getClassificationDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;

  -[IRCandidateInspection inspectionServicePackage](self, "inspectionServicePackage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IRCandidateInspection inspectionServicePackage](self, "inspectionServicePackage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[IRCandidateInspection inspectionGenerator](self, "inspectionGenerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v7 = &stru_251046168;
      return v7;
    }
    -[IRCandidateInspection inspectionGenerator](self, "inspectionGenerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  objc_msgSend(v4, "classificationDescription");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)getCandidateIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  -[IRCandidateInspection inspectionServicePackage](self, "inspectionServicePackage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[IRCandidateInspection inspectionServicePackage](self, "inspectionServicePackage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[IRCandidateInspection inspectionGenerator](self, "inspectionGenerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v8 = &stru_251046168;
      return v8;
    }
    -[IRCandidateInspection inspectionGenerator](self, "inspectionGenerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  objc_msgSend(v4, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "candidateIdentifier");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (IRCandidateInspectionServicePackage)inspectionServicePackage
{
  return self->_inspectionServicePackage;
}

- (IRCandidateInspectionGenerator)inspectionGenerator
{
  return self->_inspectionGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inspectionGenerator, 0);
  objc_storeStrong((id *)&self->_inspectionServicePackage, 0);
}

@end
