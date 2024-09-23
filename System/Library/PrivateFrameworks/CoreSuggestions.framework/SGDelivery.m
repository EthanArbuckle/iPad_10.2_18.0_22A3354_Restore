@implementation SGDelivery

- (SGDelivery)initWithRecordId:(id)a3 origin:(id)a4 parentURL:(id)a5 provider:(unint64_t)a6 trackingNumber:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SGDelivery *v17;
  SGDelivery *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSString *externalIdentifier;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDelivery.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recordId"));

    if (v14)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDelivery.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentURL"));

      if (v16)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDelivery.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("origin"));

  if (!v15)
    goto LABEL_10;
LABEL_4:
  if (v16)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGDelivery.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trackingNumber"));

LABEL_5:
  v28.receiver = self;
  v28.super_class = (Class)SGDelivery;
  v17 = -[SGObject initWithRecordId:origin:](&v28, sel_initWithRecordId_origin_, v13, v14);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_parentURL, a5);
    v18->_provider = a6;
    objc_storeStrong((id *)&v18->_trackingNumber, a7);
    objc_msgSend((id)objc_opt_class(), "stringForProvider:", v18->_provider);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v19;
    v29[1] = v18->_trackingNumber;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SGDelimitedStringsSerializeArray(v20);
    v21 = objc_claimAutoreleasedReturnValue();
    externalIdentifier = v18->_externalIdentifier;
    v18->_externalIdentifier = (NSString *)v21;

  }
  return v18;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[SGDelivery externalIdentifier:%@]"), self->_externalIdentifier);
}

- (SGDelivery)initWithCoder:(id)a3
{
  id v5;
  SGDelivery *v6;
  void *v7;
  void *v8;
  NSURL *v9;
  void *parentURL;
  void *v11;
  void *v12;
  NSString *v13;
  void *trackingNumber;
  void *v15;
  void *v16;
  NSString *v17;
  void *externalIdentifier;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SGDelivery;
  v6 = -[SGObject initWithCoder:](&v20, sel_initWithCoder_, v5);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("parentURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
      parentURL = v6->_parentURL;
      v6->_parentURL = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      parentURL = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(parentURL, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGDelivery.m"), 50, CFSTR("nonnull property %s *%s was null when decoded"), "NSURL", "parentURL");
    }

    v6->_provider = objc_msgSend(v5, "decodeInt64ForKey:", CFSTR("provider"));
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("trackingNumber"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = v12;
      trackingNumber = v6->_trackingNumber;
      v6->_trackingNumber = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      trackingNumber = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(trackingNumber, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGDelivery.m"), 52, CFSTR("nonnull property %s *%s was null when decoded"), "NSString", "trackingNumber");
    }

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v15, CFSTR("externalIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = v16;
      externalIdentifier = v6->_externalIdentifier;
      v6->_externalIdentifier = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      externalIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(externalIdentifier, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SGDelivery.m"), 53, CFSTR("nonnull property %s *%s was null when decoded"), "NSString", "externalIdentifier");
    }

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGDelivery;
  v4 = a3;
  -[SGObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_parentURL, CFSTR("parentURL"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_provider, CFSTR("provider"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_trackingNumber, CFSTR("trackingNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalIdentifier, CFSTR("externalIdentifier"));

}

- (NSURL)parentURL
{
  return self->_parentURL;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (unint64_t)provider
{
  return self->_provider;
}

- (NSString)trackingNumber
{
  return self->_trackingNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingNumber, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_parentURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stringForProvider:(unint64_t)a3
{
  if (a3 > 0xA)
    return CFSTR("Unknown");
  else
    return off_1E4762508[a3];
}

+ (unint64_t)providerForString:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("fedex")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ups")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("usps")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ontrac")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("dhl")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tnt")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ems")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("canadapost")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("chronopost")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("colissimo")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
