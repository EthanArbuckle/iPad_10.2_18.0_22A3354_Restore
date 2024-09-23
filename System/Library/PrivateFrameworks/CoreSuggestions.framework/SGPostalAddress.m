@implementation SGPostalAddress

- (SGPostalAddress)initWithAddress:(id)a3 components:(id)a4 label:(id)a5 extractionInfo:(id)a6 recordId:(id)a7
{
  id v12;
  id v13;
  SGPostalAddress *v14;
  uint64_t v15;
  NSString *rawAddress;
  objc_super v18;

  v12 = a3;
  v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SGPostalAddress;
  v14 = -[SGLabeledObject initWithLabel:extractionInfo:recordId:](&v18, sel_initWithLabel_extractionInfo_recordId_, a5, a6, a7);
  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    rawAddress = v14->_rawAddress;
    v14->_rawAddress = (NSString *)v15;

    pthread_mutex_init(&v14->_cachedAddressLock, 0);
    objc_storeStrong((id *)&v14->_components, a4);
  }

  return v14;
}

- (SGPostalAddress)initWithCoder:(id)a3
{
  id v5;
  SGPostalAddress *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *rawAddress;
  void *v11;
  void *v12;
  SGPostalAddressComponents *v13;
  void *components;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SGPostalAddress;
  v6 = -[SGLabeledObject initWithCoder:](&v16, sel_initWithCoder_, v5);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("rawAddress"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
      rawAddress = v6->_rawAddress;
      v6->_rawAddress = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      rawAddress = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(rawAddress, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGPostalAddress.m"), 163, CFSTR("nonnull property %s *%s was null when decoded"), "NSString", "rawAddress");
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("components"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = v12;
      components = v6->_components;
      v6->_components = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      components = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(components, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGPostalAddress.m"), 164, CFSTR("nonnull property %s *%s was null when decoded"), "SGPostalAddressComponents", "components");
    }

    pthread_mutex_init(&v6->_cachedAddressLock, 0);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_cachedAddressLock);
  v3.receiver = self;
  v3.super_class = (Class)SGPostalAddress;
  -[SGPostalAddress dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGPostalAddress;
  v4 = a3;
  -[SGLabeledObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_rawAddress, CFSTR("rawAddress"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_components, CFSTR("components"));

}

- (NSString)address
{
  _opaque_pthread_mutex_t *p_cachedAddressLock;
  NSString *v4;
  NSString *cachedAddress;

  p_cachedAddressLock = &self->_cachedAddressLock;
  pthread_mutex_lock(&self->_cachedAddressLock);
  if (!self->_cachedAddress)
  {
    collapseWhitespaceAndStrip(self->_rawAddress);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    cachedAddress = self->_cachedAddress;
    self->_cachedAddress = v4;

  }
  pthread_mutex_unlock(p_cachedAddressLock);
  return self->_cachedAddress;
}

- (BOOL)isEqual:(id)a3
{
  SGPostalAddress *v4;
  SGPostalAddress *v5;
  BOOL v6;

  v4 = (SGPostalAddress *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGPostalAddress isEqualToPostalAddress:](self, "isEqualToPostalAddress:", v5);

  return v6;
}

- (BOOL)isEqualToPostalAddress:(id)a3
{
  id *v4;
  NSString *rawAddress;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  char v10;
  SGPostalAddressComponents *v11;
  SGPostalAddressComponents *v12;

  v4 = (id *)a3;
  if (!-[SGLabeledObject isEqualToLabeledObject:](self, "isEqualToLabeledObject:", v4))
    goto LABEL_4;
  rawAddress = self->_rawAddress;
  v6 = (NSString *)v4[14];
  if (rawAddress == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = rawAddress;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
LABEL_4:
      v10 = 0;
      goto LABEL_10;
    }
  }
  v11 = self->_components;
  v12 = v11;
  if (v11 == v4[15])
    v10 = 1;
  else
    v10 = -[SGPostalAddressComponents isEqual:](v11, "isEqual:");

LABEL_10:
  return v10;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_rawAddress, "hash");
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
    v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@/'%@'"), v5, self->_rawAddress);

  }
  else
  {
    v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@/'%@'"), CFSTR("unlabeled"), self->_rawAddress);
  }

  return v6;
}

- (NSString)rawAddress
{
  return self->_rawAddress;
}

- (SGPostalAddressComponents)components
{
  return self->_components;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_rawAddress, 0);
  objc_storeStrong((id *)&self->_cachedAddress, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)postalAddress:(id)a3 components:(id)a4 label:(id)a5 extractionInfo:(id)a6 recordId:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  SGPostalAddress *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[SGPostalAddress initWithAddress:components:label:extractionInfo:recordId:]([SGPostalAddress alloc], "initWithAddress:components:label:extractionInfo:recordId:", v15, v14, v13, v12, v11);

  return v16;
}

+ (id)postalAddress:(id)a3 components:(id)a4 label:(id)a5 extractionType:(unint64_t)a6 recordId:(id)a7 origin:(id)a8
{
  return +[SGPostalAddress postalAddress:components:label:extractionType:recordId:](SGPostalAddress, "postalAddress:components:label:extractionType:recordId:", a3, a4, a5, a6, a7, a8);
}

+ (id)postalAddress:(id)a3 components:(id)a4 label:(id)a5 extractionType:(unint64_t)a6 recordId:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  +[SGExtractionInfo extractionInfoWithExtractionType:modelVersion:confidence:](SGExtractionInfo, "extractionInfoWithExtractionType:modelVersion:confidence:", a6, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGPostalAddress postalAddress:components:label:extractionInfo:recordId:](SGPostalAddress, "postalAddress:components:label:extractionInfo:recordId:", v14, v13, v12, v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
