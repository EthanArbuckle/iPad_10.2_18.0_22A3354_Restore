@implementation SGEntityExtractionInfo

- (SGEntityExtractionInfo)initWithSpotlightIdentifier:(id)a3 source:(id)a4 entityType:(int64_t)a5 creationTimestamp:(SGUnixTimestamp_)a6 extractionType:(int64_t)a7 contactIdentifier:(id)a8
{
  id v15;
  id v16;
  id v17;
  SGEntityExtractionInfo *v18;
  SGEntityExtractionInfo *v19;
  objc_super v21;

  v15 = a3;
  v16 = a4;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)SGEntityExtractionInfo;
  v18 = -[SGEntityExtractionInfo init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_spotlightIdentifier, a3);
    objc_storeStrong((id *)&v19->_source, a4);
    v19->_entityType = a5;
    v19->_creationTimestamp = a6;
    v19->_extractionType = a7;
    objc_storeStrong((id *)&v19->_contactIdentifier, a8);
  }

  return v19;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  __CFString *v8;
  double v9;
  void *v10;
  int64_t v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SGEntityExtractionInfo spotlightIdentifier](self, "spotlightIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGEntityExtractionInfo source](self, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SGEntityExtractionInfo entityType](self, "entityType");
  if (v6 > 0x1B)
    v7 = CFSTR("SGEntityTypePseudoEvent");
  else
    v7 = off_1E4761C30[v6];
  v8 = v7;
  -[SGEntityExtractionInfo creationTimestamp](self, "creationTimestamp");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v9);
  v11 = -[SGEntityExtractionInfo extractionType](self, "extractionType");
  v12 = CFSTR("ExtractionTypeUnknown");
  if (v11 == 2)
    v12 = CFSTR("ExtractionTypeCongratulations");
  if (v11 == 1)
    v12 = CFSTR("ExtractionTypeBirthday");
  v13 = v12;
  -[SGEntityExtractionInfo contactIdentifier](self, "contactIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<SGEntityExtractionInfo: spotlightIdentifier:%@ source:%@ entityType:%@ creationTimestamp:%@ extractionType:%@ contactIdentifier:%@>"), v4, v5, v8, v10, v13, v14);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *spotlightIdentifier;
  id v5;

  spotlightIdentifier = self->_spotlightIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", spotlightIdentifier, CFSTR("spotlightIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_entityType, CFSTR("entityType"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("creationTimestamp"), self->_creationTimestamp.secondsFromUnixEpoch);
  objc_msgSend(v5, "encodeInt64:forKey:", self->_extractionType, CFSTR("extractionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("contactIdentifier"));

}

- (SGEntityExtractionInfo)initWithCoder:(id)a3
{
  id v4;
  SGEntityExtractionInfo *v5;
  void *v6;
  uint64_t v7;
  NSString *spotlightIdentifier;
  void *v9;
  uint64_t v10;
  NSString *source;
  double v12;
  void *v13;
  uint64_t v14;
  NSString *contactIdentifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SGEntityExtractionInfo;
  v5 = -[SGEntityExtractionInfo init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("spotlightIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    spotlightIdentifier = v5->_spotlightIdentifier;
    v5->_spotlightIdentifier = (NSString *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("source"));
    v10 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (NSString *)v10;

    v5->_entityType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("entityType"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("creationTimestamp"));
    v5->_creationTimestamp.secondsFromUnixEpoch = v12;
    v5->_extractionType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("extractionType"));
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("contactIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v14;

  }
  return v5;
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (NSString)source
{
  return self->_source;
}

- (int64_t)entityType
{
  return self->_entityType;
}

- (SGUnixTimestamp_)creationTimestamp
{
  return self->_creationTimestamp;
}

- (int64_t)extractionType
{
  return self->_extractionType;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
