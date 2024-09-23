@implementation SGEmailAddress

- (SGEmailAddress)initWithEmailAddress:(id)a3 label:(id)a4 extractionInfo:(id)a5 recordId:(id)a6
{
  id v10;
  SGEmailAddress *v11;
  uint64_t v12;
  NSString *emailAddress;
  objc_super v15;

  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGEmailAddress;
  v11 = -[SGLabeledObject initWithLabel:extractionInfo:recordId:](&v15, sel_initWithLabel_extractionInfo_recordId_, a4, a5, a6);
  if (v11)
  {
    v12 = objc_msgSend(v10, "copy");
    emailAddress = v11->_emailAddress;
    v11->_emailAddress = (NSString *)v12;

  }
  return v11;
}

- (SGEmailAddress)initWithCoder:(id)a3
{
  id v5;
  SGEmailAddress *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *emailAddress;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SGEmailAddress;
  v6 = -[SGLabeledObject initWithCoder:](&v12, sel_initWithCoder_, v5);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("emailAddress"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
      emailAddress = v6->_emailAddress;
      v6->_emailAddress = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      emailAddress = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(emailAddress, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGEmailAddress.m"), 30, CFSTR("nonnull property %s *%s was null when decoded"), "NSString", "emailAddress");
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGEmailAddress;
  v4 = a3;
  -[SGLabeledObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_emailAddress, CFSTR("emailAddress"), v5.receiver, v5.super_class);

}

- (BOOL)isEqual:(id)a3
{
  SGEmailAddress *v4;
  SGEmailAddress *v5;
  BOOL v6;

  v4 = (SGEmailAddress *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGEmailAddress isEqualToEmailAddress:](self, "isEqualToEmailAddress:", v5);

  return v6;
}

- (BOOL)isEqualToEmailAddress:(id)a3
{
  _QWORD *v4;
  NSString *v5;
  NSString *v6;
  char v7;

  v4 = a3;
  if (-[SGLabeledObject isEqualToLabeledObject:](self, "isEqualToLabeledObject:", v4))
  {
    v5 = self->_emailAddress;
    v6 = v5;
    if (v5 == (NSString *)v4[5])
      v7 = 1;
    else
      v7 = -[NSString isEqual:](v5, "isEqual:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_emailAddress, "hash");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGLabeledObject label](self, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[SGLabeledObject label](self, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@/'%@'"), v5, self->_emailAddress);

  }
  else
  {
    v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@/'%@'"), CFSTR("unlabeled"), self->_emailAddress);
  }

  return v6;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddress, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)emailAddress:(id)a3 label:(id)a4 extractionInfo:(id)a5 withRecordId:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  SGEmailAddress *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[SGEmailAddress initWithEmailAddress:label:extractionInfo:recordId:]([SGEmailAddress alloc], "initWithEmailAddress:label:extractionInfo:recordId:", v12, v11, v10, v9);

  return v13;
}

+ (id)emailAddress:(id)a3 label:(id)a4 extractionType:(unint64_t)a5 withRecordId:(id)a6 origin:(id)a7
{
  return +[SGEmailAddress emailAddress:label:extractionType:withRecordId:](SGEmailAddress, "emailAddress:label:extractionType:withRecordId:", a3, a4, a5, a6, a7);
}

+ (id)emailAddress:(id)a3 label:(id)a4 extractionType:(unint64_t)a5 withRecordId:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  +[SGExtractionInfo extractionInfoWithExtractionType:modelVersion:confidence:](SGExtractionInfo, "extractionInfoWithExtractionType:modelVersion:confidence:", a5, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGEmailAddress emailAddress:label:extractionInfo:withRecordId:](SGEmailAddress, "emailAddress:label:extractionInfo:withRecordId:", v11, v10, v12, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
