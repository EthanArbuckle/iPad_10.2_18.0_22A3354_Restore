@implementation HDFHIRResourceLastSeenObject

- (HDFHIRResourceLastSeenObject)initWithResourceIdentifier:(id)a3 sourceURL:(id)a4 lastSeenDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDFHIRResourceLastSeenObject *v11;
  uint64_t v12;
  HKFHIRIdentifier *resourceIdentifier;
  uint64_t v14;
  NSURL *sourceURL;
  uint64_t v16;
  NSDate *lastSeenDate;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDFHIRResourceLastSeenObject;
  v11 = -[HDFHIRResourceLastSeenObject init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    resourceIdentifier = v11->_resourceIdentifier;
    v11->_resourceIdentifier = (HKFHIRIdentifier *)v12;

    v14 = objc_msgSend(v9, "copy");
    sourceURL = v11->_sourceURL;
    v11->_sourceURL = (NSURL *)v14;

    v16 = objc_msgSend(v10, "copy");
    lastSeenDate = v11->_lastSeenDate;
    v11->_lastSeenDate = (NSDate *)v16;

  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDFHIRResourceLastSeenObject)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HDFHIRResourceLastSeenObject *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SourceURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LastSeenDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HDFHIRResourceLastSeenObject initWithResourceIdentifier:sourceURL:lastSeenDate:](self, "initWithResourceIdentifier:sourceURL:lastSeenDate:", v5, v6, v7);

    v8 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HDFHIRResourceLastSeenObject resourceIdentifier](self, "resourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Identifier"));

  -[HDFHIRResourceLastSeenObject sourceURL](self, "sourceURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SourceURL"));

  -[HDFHIRResourceLastSeenObject lastSeenDate](self, "lastSeenDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("LastSeenDate"));

}

- (HKFHIRIdentifier)resourceIdentifier
{
  return self->_resourceIdentifier;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSDate)lastSeenDate
{
  return self->_lastSeenDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_resourceIdentifier, 0);
}

@end
