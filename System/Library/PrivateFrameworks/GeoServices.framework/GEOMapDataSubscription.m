@implementation GEOMapDataSubscription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOMapDataSubscription)init
{
  GEOMapDataSubscription *result;

  result = (GEOMapDataSubscription *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOMapDataSubscription)initWithIdentifier:(id)a3 originatingBundleIdentifier:(id)a4 dataTypes:(unint64_t)a5 policy:(int64_t)a6 expirationDate:(id)a7 region:(id)a8 displayName:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  GEOMapDataSubscription *v20;
  uint64_t v21;
  NSString *identifier;
  uint64_t v23;
  NSString *originatingBundleIdentifier;
  uint64_t v25;
  GEOMapRegion *region;
  uint64_t v27;
  NSString *displayName;
  GEOMapDataSubscription *v29;
  objc_super v31;

  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v31.receiver = self;
  v31.super_class = (Class)GEOMapDataSubscription;
  v20 = -[GEOMapDataSubscription init](&v31, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v15, "copy");
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    originatingBundleIdentifier = v20->_originatingBundleIdentifier;
    v20->_originatingBundleIdentifier = (NSString *)v23;

    v20->_dataTypes = a5;
    v20->_policy = a6;
    objc_storeStrong((id *)&v20->_expirationDate, a7);
    v25 = objc_msgSend(v18, "copy");
    region = v20->_region;
    v20->_region = (GEOMapRegion *)v25;

    v27 = objc_msgSend(v19, "copy");
    displayName = v20->_displayName;
    v20->_displayName = (NSString *)v27;

    v29 = v20;
  }

  return v20;
}

- (GEOMapDataSubscription)initWithIdentifier:(id)a3 originatingBundleIdentifier:(id)a4 dataTypes:(unint64_t)a5 policy:(int64_t)a6 expirationDate:(id)a7 region:(id)a8 displayName:(id)a9 regulatoryRegionID:(id)a10
{
  id v17;
  GEOMapDataSubscription *v18;
  GEOMapDataSubscription *v19;
  GEOMapDataSubscription *v20;

  v17 = a10;
  v18 = -[GEOMapDataSubscription initWithIdentifier:originatingBundleIdentifier:dataTypes:policy:expirationDate:region:displayName:](self, "initWithIdentifier:originatingBundleIdentifier:dataTypes:policy:expirationDate:region:displayName:", a3, a4, a5, a6, a7, a8, a9);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_regulatoryRegionID, a10);
    v20 = v19;
  }

  return v19;
}

- (GEOMapDataSubscription)initWithCoder:(id)a3
{
  id v4;
  GEOMapDataSubscription *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *expirationDate;
  uint64_t v10;
  GEOMapRegion *region;
  uint64_t v12;
  NSString *originatingBundleIdentifier;
  uint64_t v14;
  NSString *displayName;
  uint64_t v16;
  NSNumber *regulatoryRegionID;
  GEOMapDataSubscription *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[8];
  objc_super v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)GEOMapDataSubscription;
  v5 = -[GEOMapDataSubscription init](&v31, sel_init);
  if (!v5)
    goto LABEL_9;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_dataTypes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dataTypes"));
  v5->_policy = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("policy"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
  v8 = objc_claimAutoreleasedReturnValue();
  expirationDate = v5->_expirationDate;
  v5->_expirationDate = (NSDate *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
  v10 = objc_claimAutoreleasedReturnValue();
  region = v5->_region;
  v5->_region = (GEOMapRegion *)v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originatingBundleIdentifier"));
  v12 = objc_claimAutoreleasedReturnValue();
  originatingBundleIdentifier = v5->_originatingBundleIdentifier;
  v5->_originatingBundleIdentifier = (NSString *)v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v14 = objc_claimAutoreleasedReturnValue();
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v14;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("regulatoryRegionID"));
  v16 = objc_claimAutoreleasedReturnValue();
  regulatoryRegionID = v5->_regulatoryRegionID;
  v5->_regulatoryRegionID = (NSNumber *)v16;

  if (!v5->_identifier)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT)
      || (*(_WORD *)buf = 0,
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _identifier != nil", buf, 2u), !v5->_identifier))
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB28A8];
      v34 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode %@: missing value for key %@"), objc_opt_class(), CFSTR("identifier"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 4865, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v23);

LABEL_9:
      v18 = 0;
      goto LABEL_10;
    }
  }
  if (!v5->_region)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT)
      || (*(_WORD *)buf = 0,
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: _region != nil", buf, 2u), !v5->_region))
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB28A8];
      v32 = *MEMORY[0x1E0CB2D68];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to decode %@: missing value for key %@"), objc_opt_class(), CFSTR("region"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 4865, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v28);

      goto LABEL_9;
    }
  }
  v18 = v5;
LABEL_10:

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dataTypes, CFSTR("dataTypes"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_policy, CFSTR("policy"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_region, CFSTR("region"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatingBundleIdentifier, CFSTR("originatingBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_regulatoryRegionID, CFSTR("regulatoryRegionID"));

}

- (id)debugDescription
{
  return -[GEOMapDataSubscription _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSString *identifier;
  __CFString *v8;
  int64_t policy;
  unint64_t dataTypes;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  unint64_t v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)GEOMapDataSubscription;
  -[GEOMapDataSubscription debugDescription](&v22, sel_debugDescription);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  identifier = self->_identifier;
  v8 = CFSTR("<unknown>");
  dataTypes = self->_dataTypes;
  policy = self->_policy;
  if (policy == 1)
    v8 = CFSTR("user-initiated");
  if (!policy)
    v8 = CFSTR("opportunistic");
  v11 = v8;
  GEOMapDataSubscriptionDataTypeAsString(dataTypes);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" [%@] (%@: %@) {\n"), identifier, v11, v12);

  if (-[NSString length](self->_displayName, "length"))
  {
    objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", 4 * a3, CFSTR(" "), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v13);

    objc_msgSend(v6, "appendFormat:", CFSTR("displayName: %@"), self->_displayName);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("region: %@\n"), self->_region);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("\n"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __49__GEOMapDataSubscription__descriptionWithIndent___block_invoke;
  v19[3] = &unk_1E1C05B48;
  v16 = v6;
  v20 = v16;
  v21 = a3;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v19);

  if (self->_expirationDate)
  {
    objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", 4 * a3, CFSTR(" "), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "appendString:", v17);

    objc_msgSend(v16, "appendFormat:", CFSTR("expiration: %@"), self->_expirationDate);
  }
  return v16;
}

void __49__GEOMapDataSubscription__descriptionWithIndent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;

  v6 = *(void **)(a1 + 32);
  v7 = 4 * *(_QWORD *)(a1 + 40);
  v8 = a2;
  objc_msgSend(&stru_1E1C241D0, "stringByPaddingToLength:withString:startingAtIndex:", v7, CFSTR(" "), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v9);

  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@\n"), v8);
  *a4 = 0;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  NSDate *v6;
  NSDate *expirationDate;
  char v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSString *v17;
  NSString *displayName;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 0;
    goto LABEL_18;
  }
  v5 = v4;
  if (objc_msgSend(*((id *)v5 + 1), "isEqualToString:", self->_identifier)
    && *((_QWORD *)v5 + 3) == self->_dataTypes
    && *((_QWORD *)v5 + 4) == self->_policy)
  {
    v6 = (NSDate *)*((_QWORD *)v5 + 5);
    expirationDate = self->_expirationDate;
    if (v6 == expirationDate)
      goto LABEL_23;
    v8 = 0;
    if (!v6 || !expirationDate)
      goto LABEL_17;
    -[NSDate timeIntervalSinceReferenceDate](expirationDate, "timeIntervalSinceReferenceDate");
    v10 = v9;
    objc_msgSend(*((id *)v5 + 5), "timeIntervalSinceReferenceDate");
    v12 = v10 - v11;
    -[NSDate timeIntervalSinceReferenceDate](self->_expirationDate, "timeIntervalSinceReferenceDate");
    v14 = v13;
    objc_msgSend(*((id *)v5 + 5), "timeIntervalSinceReferenceDate");
    v16 = v14 - v15;
    if (v12 < 0.0)
      v16 = -v16;
    if (v16 < 1.0)
    {
LABEL_23:
      if (objc_msgSend(*((id *)v5 + 6), "isEqual:", self->_region))
      {
        v17 = (NSString *)*((_QWORD *)v5 + 7);
        displayName = self->_displayName;
        if (v17 == displayName)
        {
          v8 = 1;
        }
        else
        {
          v8 = 0;
          if (v17 && displayName)
            v8 = -[NSString isEqualToString:](v17, "isEqualToString:");
        }
        goto LABEL_17;
      }
    }
  }
  v8 = 0;
LABEL_17:

LABEL_18:
  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)_originatingBundleIdentifier
{
  return self->_originatingBundleIdentifier;
}

- (unint64_t)dataTypes
{
  return self->_dataTypes;
}

- (int64_t)policy
{
  return self->_policy;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (GEOMapRegion)region
{
  return self->_region;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSNumber)regulatoryRegionID
{
  return self->_regulatoryRegionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regulatoryRegionID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_originatingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
