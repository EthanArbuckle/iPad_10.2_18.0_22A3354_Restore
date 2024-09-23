@implementation SGLabeledObject

- (SGLabeledObject)initWithLabel:(id)a3 extractionInfo:(id)a4 recordId:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SGLabeledObject *v12;
  uint64_t v13;
  NSString *label;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[SGOrigin originWithType:sourceKey:externalKey:fromForwardedMessage:](SGOrigin, "originWithType:sourceKey:externalKey:fromForwardedMessage:", 0, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)SGLabeledObject;
  v12 = -[SGObject initWithRecordId:origin:](&v16, sel_initWithRecordId_origin_, v10, v11);

  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    label = v12->_label;
    v12->_label = (NSString *)v13;

    objc_storeStrong((id *)&v12->_extractionInfo, a4);
  }

  return v12;
}

- (SGLabeledObject)initWithLabel:(id)a3 extractionType:(unint64_t)a4 recordId:(id)a5 origin:(id)a6
{
  id v9;
  id v10;
  void *v11;
  SGLabeledObject *v12;

  v9 = a5;
  v10 = a3;
  +[SGExtractionInfo extractionInfoWithExtractionType:modelVersion:confidence:](SGExtractionInfo, "extractionInfoWithExtractionType:modelVersion:confidence:", a4, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SGLabeledObject initWithLabel:extractionInfo:recordId:](self, "initWithLabel:extractionInfo:recordId:", v10, v11, v9);

  return v12;
}

- (SGLabeledObject)initWithCoder:(id)a3
{
  id v5;
  SGLabeledObject *v6;
  void *v7;
  uint64_t v8;
  NSString *label;
  void *v10;
  void *v11;
  SGExtractionInfo *v12;
  void *extractionInfo;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGLabeledObject;
  v6 = -[SGObject initWithCoder:](&v15, sel_initWithCoder_, v5);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("label"));
    v8 = objc_claimAutoreleasedReturnValue();
    label = v6->_label;
    v6->_label = (NSString *)v8;

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v10, CFSTR("extractionInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = v11;
      extractionInfo = v6->_extractionInfo;
      v6->_extractionInfo = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      extractionInfo = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(extractionInfo, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGLabeledObject.m"), 49, CFSTR("nonnull property %s *%s was null when decoded"), "SGExtractionInfo", "extractionInfo");
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGLabeledObject;
  v4 = a3;
  -[SGObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_label, CFSTR("label"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_extractionInfo, CFSTR("extractionInfo"));

}

- (BOOL)isEqual:(id)a3
{
  SGLabeledObject *v4;
  SGLabeledObject *v5;
  BOOL v6;

  v4 = (SGLabeledObject *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGLabeledObject isEqualToLabeledObject:](self, "isEqualToLabeledObject:", v5);

  return v6;
}

- (BOOL)isEqualToLabeledObject:(id)a3
{
  _QWORD *v4;
  NSString *v5;
  NSString *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v9.receiver = self,
        v9.super_class = (Class)SGLabeledObject,
        -[SGObject isEqualToSuggestion:](&v9, sel_isEqualToSuggestion_, v4)))
  {
    v5 = self->_label;
    v6 = v5;
    if (v5 == (NSString *)v4[3])
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

- (unint64_t)extractionType
{
  return -[SGExtractionInfo extractionType](self->_extractionInfo, "extractionType");
}

- (NSString)label
{
  return self->_label;
}

- (SGExtractionInfo)extractionInfo
{
  return self->_extractionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
