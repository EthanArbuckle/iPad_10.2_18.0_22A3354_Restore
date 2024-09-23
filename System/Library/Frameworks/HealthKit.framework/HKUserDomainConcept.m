@implementation HKUserDomainConcept

- (HKUserDomainConcept)initWithCodingCollection:(id)a3 linkCollection:(id)a4 propertyCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  CFAbsoluteTime Current;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v28;
  uint64_t v29;
  objc_super v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)HKUserDomainConcept;
  v11 = -[HKUserDomainConcept init](&v30, sel_init);
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v11 + 2);
    *((_QWORD *)v11 + 2) = v12;

    objc_msgSend((id)objc_opt_class(), "_typeIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v11 + 5);
    *((_QWORD *)v11 + 5) = v14;

    Current = CFAbsoluteTimeGetCurrent();
    *((CFAbsoluteTime *)v11 + 6) = Current;
    *((CFAbsoluteTime *)v11 + 7) = Current;
    +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "currentOSVersionStruct");
    }
    else
    {
      v28 = 0uLL;
      v29 = 0;
    }
    *(_OWORD *)(v11 + 88) = v28;
    *((_QWORD *)v11 + 13) = v29;
    objc_msgSend(v18, "currentOSBuild");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)*((_QWORD *)v11 + 8);
    *((_QWORD *)v11 + 8) = v19;

    v11[8] = 0;
    v21 = objc_msgSend(v8, "copy");
    v22 = (void *)*((_QWORD *)v11 + 3);
    *((_QWORD *)v11 + 3) = v21;

    v23 = objc_msgSend(v9, "copy");
    v24 = (void *)*((_QWORD *)v11 + 4);
    *((_QWORD *)v11 + 4) = v23;

    v25 = objc_msgSend(v10, "copy");
    v26 = (void *)*((_QWORD *)v11 + 10);
    *((_QWORD *)v11 + 10) = v25;

  }
  return (HKUserDomainConcept *)v11;
}

- (id)description
{
  return -[HKUserDomainConcept descriptionAllowedForPublic:](self, "descriptionAllowedForPublic:", 1);
}

- (id)descriptionAllowedForPublic:(BOOL)a3
{
  uint64_t v4;
  __CFString *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *build;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  int64_t patchVersion;

  -[HKUserDomainConcept _dataDescriptionAllowedForPublic:](self, "_dataDescriptionAllowedForPublic:", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %@"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E37FD4C0;
  }
  v24 = (void *)MEMORY[0x1E0CB37A0];
  v23 = objc_opt_class();
  -[HKUserDomainConceptTypeIdentifier schema](self->_identifier, "schema");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKUserDomainConceptTypeIdentifier code](self->_identifier, "code");
  -[NSUUID hk_shortRepresentation](self->_UUID, "hk_shortRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUserDomainConcept creationDate](self, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUserDomainConcept modificationDate](self, "modificationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  build = self->_build;
  v26 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  patchVersion = self->_operatingSystemVersion.patchVersion;
  HKNSOperatingSystemVersionString(&v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@ %@ %ld %@%@, (%@), (%@), %@ (%@)"), v23, v22, v6, v7, v5, v9, v11, build, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[HKMedicalCodingCollection count](self->_codingCollection, "count");
  v16 = "s";
  if (v15 >= 1)
  {
    if (v15 == 1)
      v17 = "";
    else
      v17 = "s";
    objc_msgSend(v14, "appendFormat:", CFSTR(", %ld coding%s"), v15, v17);
  }
  v18 = -[HKUserDomainConceptLinkCollection count](self->_linkCollection, "count");
  if (v18 >= 1)
  {
    if (v18 == 1)
      v16 = "";
    objc_msgSend(v14, "appendFormat:", CFSTR(", %ld link%s %ld"), v18, v16, -[HKUserDomainConceptLinkCollection epoch](self->_linkCollection, "epoch"));
  }
  v19 = -[HKUserDomainConceptPropertyCollection count](self->_propertyCollection, "count");
  if (v19 >= 1)
  {
    v20 = CFSTR("properties");
    if (v19 == 1)
      v20 = CFSTR("property");
    objc_msgSend(v14, "appendFormat:", CFSTR(", %ld %@"), v19, v20);
  }
  objc_msgSend(v14, "appendString:", CFSTR(">"));

  return v14;
}

- (HKUserDomainConcept)init
{
  return -[HKUserDomainConcept initWithCodingCollection:linkCollection:propertyCollection:](self, "initWithCodingCollection:linkCollection:propertyCollection:", 0, 0, 0);
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKUserDomainConcept;
  return -[HKUserDomainConcept init](&v3, sel_init);
}

- (id)userDomainConceptByAddingCodings:(id)a3
{
  id v4;
  void *v5;
  HKMedicalCodingCollection *codingCollection;
  HKMedicalCodingCollection *v7;
  HKMedicalCodingCollection *v8;

  v4 = a3;
  -[HKUserDomainConcept modificationCopy](self, "modificationCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  codingCollection = self->_codingCollection;
  if (codingCollection)
  {
    -[HKMedicalCodingCollection collectionByAddingCodings:](codingCollection, "collectionByAddingCodings:", v4);
    v7 = (HKMedicalCodingCollection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = -[HKMedicalCodingCollection initWithCodings:]([HKMedicalCodingCollection alloc], "initWithCodings:", v4);
  }
  v8 = v7;
  objc_msgSend(v5, "_setCodingCollection:", v7);

  return v5;
}

- (id)userDomainConceptByReplacingCodings:(id)a3
{
  id v4;
  void *v5;
  HKMedicalCodingCollection *v6;

  v4 = a3;
  -[HKUserDomainConcept modificationCopy](self, "modificationCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKMedicalCodingCollection initWithCodings:]([HKMedicalCodingCollection alloc], "initWithCodings:", v4);

  objc_msgSend(v5, "_setCodingCollection:", v6);
  return v5;
}

- (id)userDomainConceptByReplacingLinks:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HKUserDomainConcept modificationCopy](self, "modificationCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setLinkCollection:", v4);

  return v5;
}

- (id)userDomainConceptByReplacingLinks:(id)a3 andCodings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HKMedicalCodingCollection *v9;

  v6 = a4;
  v7 = a3;
  -[HKUserDomainConcept modificationCopy](self, "modificationCopy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setLinkCollection:", v7);

  v9 = -[HKMedicalCodingCollection initWithCodings:]([HKMedicalCodingCollection alloc], "initWithCodings:", v6);
  objc_msgSend(v8, "_setCodingCollection:", v9);

  return v8;
}

- (id)copyUserDomainConceptBySettingProperties:(id)a3
{
  id v4;
  void *v5;
  HKUserDomainConceptPropertyCollection *v6;

  v4 = a3;
  -[HKUserDomainConcept modificationCopy](self, "modificationCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKUserDomainConceptPropertyCollection initWithProperties:]([HKUserDomainConceptPropertyCollection alloc], "initWithProperties:", v4);

  objc_msgSend(v5, "_setPropertyCollection:", v6);
  return v5;
}

- (id)copyUserDomainConceptByMergingInPropertyCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKUserDomainConcept *v7;

  v4 = a3;
  -[HKUserDomainConcept propertyCollection](self, "propertyCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUserDomainConceptPropertyCollection propertyCollectionByMergingCollection:otherCollection:](HKUserDomainConceptPropertyCollection, "propertyCollectionByMergingCollection:otherCollection:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    v7 = self;
  }
  else
  {
    -[HKUserDomainConcept modificationCopy](self, "modificationCopy");
    v7 = (HKUserDomainConcept *)objc_claimAutoreleasedReturnValue();
    -[HKUserDomainConcept _setPropertyCollection:](v7, "_setPropertyCollection:", v6);
  }

  return v7;
}

- (id)copyUserDomainConceptByMergingInConcept:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  HKUserDomainConcept *v12;
  HKUserDomainConcept *v13;

  v4 = a3;
  -[HKUserDomainConcept propertyCollection](self, "propertyCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUserDomainConceptPropertyCollection propertyCollectionByMergingCollection:otherCollection:](HKUserDomainConceptPropertyCollection, "propertyCollectionByMergingCollection:otherCollection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKUserDomainConcept linkCollection](self, "linkCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "linkCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKUserDomainConceptLinkCollection collectionByMergingCollection:otherCollection:](HKUserDomainConceptLinkCollection, "collectionByMergingCollection:otherCollection:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v8)
  {
    v11 = 1;
  }
  else
  {
    if (!v8)
    {
      LOBYTE(v11) = 0;
      goto LABEL_9;
    }
    v11 = objc_msgSend(v10, "isEqual:", v8);
  }
  if (v7 == v5 && v11)
  {
    v12 = self;
    goto LABEL_13;
  }
LABEL_9:
  -[HKUserDomainConcept modificationCopy](self, "modificationCopy");
  v13 = (HKUserDomainConcept *)objc_claimAutoreleasedReturnValue();
  v12 = v13;
  if (v7 != v5)
    -[HKUserDomainConcept _setPropertyCollection:](v13, "_setPropertyCollection:", v7);
  if ((v11 & 1) == 0)
    -[HKUserDomainConcept _setLinkCollection:](v12, "_setLinkCollection:", v10);
LABEL_13:

  return v12;
}

- (id)deletedUserDomainConcept
{
  return +[HKUserDomainConcept deletedUserDomainConceptWithUUID:creationTimestamp:](HKUserDomainConcept, "deletedUserDomainConceptWithUUID:creationTimestamp:", self->_UUID, self->_creationTimestamp);
}

+ (id)deletedUserDomainConceptWithUUID:(id)a3 creationTimestamp:(double)a4
{
  id v5;
  HKUserDomainConcept *v6;
  void *v7;

  v5 = a3;
  v6 = objc_alloc_init(HKUserDomainConcept);
  v7 = (void *)objc_msgSend(v5, "copy");

  -[HKUserDomainConcept _setUUID:](v6, "_setUUID:", v7);
  -[HKUserDomainConcept _setDeleted:](v6, "_setDeleted:", 1);
  -[HKUserDomainConcept _setCreationTimestamp:](v6, "_setCreationTimestamp:", a4);
  return v6;
}

- (id)modificationCopy
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  -[HKUserDomainConcept _deepCopy](self, "_deepCopy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setModificationTimestamp:", CFAbsoluteTimeGetCurrent());
  +[_HKBehavior sharedBehavior](_HKBehavior, "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "currentOSVersionStruct");
  else
    memset(v7, 0, sizeof(v7));
  objc_msgSend(v2, "_setOperatingSystemVersion:", v7);
  objc_msgSend(v4, "currentOSBuild");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setBuild:", v5);

  return v2;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_creationTimestamp);
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_modificationTimestamp);
}

- (BOOL)isAdHocUserDomainConcept
{
  void *v2;
  BOOL v3;

  -[HKUserDomainConcept firstAdhocCoding](self, "firstAdhocCoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_UUID, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKUserDomainConcept *v4;
  NSUUID *UUID;
  void *v6;
  char v7;

  v4 = (HKUserDomainConcept *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      UUID = self->_UUID;
      -[HKUserDomainConcept UUID](v4, "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[NSUUID isEqual:](UUID, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)_deepCopy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  $A44FF20282FB96BA82CF1B0FF6945C38 operatingSystemVersion;

  v3 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initBareObject");
  v4 = (void *)-[HKUserDomainConceptTypeIdentifier copy](self->_identifier, "copy");
  objc_msgSend(v3, "_setIdentifier:", v4);

  v5 = (void *)-[NSUUID copy](self->_UUID, "copy");
  objc_msgSend(v3, "_setUUID:", v5);

  objc_msgSend(v3, "_setDeleted:", self->_deleted);
  objc_msgSend(v3, "_setCreationTimestamp:", self->_creationTimestamp);
  objc_msgSend(v3, "_setModificationTimestamp:", self->_modificationTimestamp);
  operatingSystemVersion = self->_operatingSystemVersion;
  objc_msgSend(v3, "_setOperatingSystemVersion:", &operatingSystemVersion);
  v6 = (void *)-[NSString copy](self->_build, "copy");
  objc_msgSend(v3, "_setBuild:", v6);

  objc_msgSend(v3, "_setCodingCollection:", self->_codingCollection);
  objc_msgSend(v3, "_setLinkCollection:", self->_linkCollection);
  objc_msgSend(v3, "_setPropertyCollection:", self->_propertyCollection);
  return v3;
}

- (id)_dataDescriptionAllowedForPublic:(BOOL)a3
{
  if (self->_deleted)
    return CFSTR("DELETED");
  else
    return 0;
}

+ (id)_typeIdentifier
{
  return +[HKUserDomainConceptTypeIdentifier baseUserDomainConceptIdentifier](HKUserDomainConceptTypeIdentifier, "baseUserDomainConceptIdentifier");
}

- (BOOL)isSemanticallyEquivalent:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HKUserDomainConcept semanticIdentifier](self, "semanticIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "semanticIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (HKUserDomainConceptSemanticIdentifier)semanticIdentifier
{
  return (HKUserDomainConceptSemanticIdentifier *)-[HKBaseUserDomainConceptSemanticIdentifier initWithUUID:]([HKBaseUserDomainConceptSemanticIdentifier alloc], "initWithUUID:", self->_UUID);
}

- (BOOL)canRequestSyncUponInsertion
{
  return self->_deleted;
}

- (id)firstOntologyCoding
{
  void *v3;
  void *v4;

  +[HKMedicalCodingSystem appleOntologySystem](HKMedicalCodingSystem, "appleOntologySystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUserDomainConcept _firstCodingForSystem:](self, "_firstCodingForSystem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)firstAdhocCoding
{
  void *v3;
  void *v4;

  +[HKMedicalCodingSystem adHocConceptSystem](HKMedicalCodingSystem, "adHocConceptSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUserDomainConcept _firstCodingForSystem:](self, "_firstCodingForSystem:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)firstConceptIdentifier
{
  void *v2;
  void *v3;
  HKConceptIdentifier *v4;

  -[HKUserDomainConcept firstOntologyCoding](self, "firstOntologyCoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "code");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = -[HKConceptIdentifier initWithRawIdentifier:]([HKConceptIdentifier alloc], "initWithRawIdentifier:", (int)objc_msgSend(v3, "intValue"));
  else
    v4 = 0;

  return v4;
}

- (id)_firstCodingForSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HKUserDomainConcept codingCollection](self, "codingCollection", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "codings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    while (1)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "codingSystem");
        v13 = objc_claimAutoreleasedReturnValue();
        if ((id)v13 == v4)
        {

          if (v9)
          {
LABEL_12:
            objc_msgSend(v9, "code");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "code");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v17, "compare:", v18);

            if (v19 != 1)
              continue;
          }
LABEL_13:
          v14 = v9;
          v9 = v12;
          goto LABEL_14;
        }
        v14 = (void *)v13;
        if (v4)
        {
          objc_msgSend(v12, "codingSystem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqual:", v4);

          if (!v16)
            continue;
          if (v9)
            goto LABEL_12;
          goto LABEL_13;
        }
LABEL_14:

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (!v8)
        goto LABEL_19;
    }
  }
  v9 = 0;
LABEL_19:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("uuid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("created"), self->_creationTimestamp);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("modified"), self->_modificationTimestamp);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_operatingSystemVersion.majorVersion, CFSTR("major_version"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_operatingSystemVersion.minorVersion, CFSTR("minor_version"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_operatingSystemVersion.patchVersion, CFSTR("patch_version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_build, CFSTR("build"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_deleted, CFSTR("deleted"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_codingCollection, CFSTR("codingCollection"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_linkCollection, CFSTR("linkCollection"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_propertyCollection, CFSTR("propertyCollection"));

}

- (HKUserDomainConcept)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  HKUserDomainConcept *v17;
  HKUserDomainConcept *v18;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("created"));
  v8 = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("modified"));
  v10 = v9;
  v21 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("major_version"));
  v20 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("minor_version"));
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("patch_version"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("build"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deleted"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codingCollection"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkCollection"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("propertyCollection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v22.receiver = self;
  v22.super_class = (Class)HKUserDomainConcept;
  v17 = -[HKUserDomainConcept init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_UUID, v5);
    objc_storeStrong((id *)&v18->_identifier, v6);
    v18->_creationTimestamp = v8;
    v18->_modificationTimestamp = v10;
    v18->_operatingSystemVersion.majorVersion = v21;
    v18->_operatingSystemVersion.minorVersion = v20;
    v18->_operatingSystemVersion.patchVersion = v11;
    objc_storeStrong((id *)&v18->_build, v12);
    v18->_deleted = v13;
    objc_storeStrong((id *)&v18->_codingCollection, v14);
    objc_storeStrong((id *)&v18->_linkCollection, v15);
    objc_storeStrong((id *)&v18->_propertyCollection, v16);
  }

  return v18;
}

- (void)_setUUID:(id)a3
{
  id v5;
  NSUUID *v6;
  NSUUID *UUID;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConcept.m"), 445, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("UUID != nil"));

    v5 = 0;
  }
  v6 = (NSUUID *)objc_msgSend(v5, "copy");
  UUID = self->_UUID;
  self->_UUID = v6;

}

- (void)_setIdentifier:(id)a3
{
  id v5;
  HKUserDomainConceptTypeIdentifier *v6;
  HKUserDomainConceptTypeIdentifier *identifier;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConcept.m"), 451, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

    v5 = 0;
  }
  v6 = (HKUserDomainConceptTypeIdentifier *)objc_msgSend(v5, "copy");
  identifier = self->_identifier;
  self->_identifier = v6;

}

- (void)_setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (void)_setCreationTimestamp:(double)a3
{
  self->_creationTimestamp = a3;
}

- (void)_setModificationTimestamp:(double)a3
{
  self->_modificationTimestamp = a3;
}

- (void)_setOperatingSystemVersion:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_operatingSystemVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v3;
}

- (void)_setBuild:(id)a3
{
  NSString *v4;
  NSString *build;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  build = self->_build;
  self->_build = v4;

}

- (void)_setCodingCollection:(id)a3
{
  HKMedicalCodingCollection *v4;
  HKMedicalCodingCollection *codingCollection;

  v4 = (HKMedicalCodingCollection *)objc_msgSend(a3, "copy");
  codingCollection = self->_codingCollection;
  self->_codingCollection = v4;

}

- (void)_setLinkCollection:(id)a3
{
  HKUserDomainConceptLinkCollection *v4;
  HKUserDomainConceptLinkCollection *linkCollection;

  v4 = (HKUserDomainConceptLinkCollection *)objc_msgSend(a3, "copy");
  linkCollection = self->_linkCollection;
  self->_linkCollection = v4;

}

- (void)_setPropertyCollection:(id)a3
{
  HKUserDomainConceptPropertyCollection *v4;
  HKUserDomainConceptPropertyCollection *propertyCollection;

  v4 = (HKUserDomainConceptPropertyCollection *)objc_msgSend(a3, "copy");
  propertyCollection = self->_propertyCollection;
  self->_propertyCollection = v4;

}

- (BOOL)unitTesting_isIdentical:(id)a3
{
  return -[HKUserDomainConcept unitTesting_isIdentical:ignoreModificationTimestamp:](self, "unitTesting_isIdentical:ignoreModificationTimestamp:", a3, 0);
}

- (BOOL)unitTesting_isIdentical:(id)a3 ignoreModificationTimestamp:(BOOL)a4
{
  void *v4;
  char *v7;
  NSUUID *UUID;
  NSUUID *v9;
  HKUserDomainConceptTypeIdentifier *identifier;
  HKUserDomainConceptTypeIdentifier *v11;
  NSString *build;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HKUserDomainConceptPropertyCollection *v26;
  HKUserDomainConceptPropertyCollection *v27;
  HKUserDomainConceptPropertyCollection *propertyCollection;
  HKUserDomainConceptPropertyCollection *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  int64_t patchVersion;

  v7 = (char *)a3;
  if (-[HKUserDomainConcept isEqual:](self, "isEqual:", v7)
    && (a4 || self->_modificationTimestamp == *((double *)v7 + 7)))
  {
    UUID = self->_UUID;
    v9 = (NSUUID *)*((_QWORD *)v7 + 2);
    if (UUID == v9 || v9 && -[NSUUID isEqual:](UUID, "isEqual:"))
    {
      identifier = self->_identifier;
      v11 = (HKUserDomainConceptTypeIdentifier *)*((_QWORD *)v7 + 5);
      if ((identifier == v11 || v11 && -[HKUserDomainConceptTypeIdentifier isEqual:](identifier, "isEqual:"))
        && self->_deleted == v7[8]
        && self->_creationTimestamp == *((double *)v7 + 6))
      {
        v36 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
        patchVersion = self->_operatingSystemVersion.patchVersion;
        v34 = *(_OWORD *)(v7 + 88);
        v35 = *((_QWORD *)v7 + 13);
        if (HKNSOperatingSystemVersionsEqual((uint64_t)&v36, (uint64_t)&v34))
        {
          build = self->_build;
          v13 = (NSString *)*((_QWORD *)v7 + 8);
          if (build == v13 || v13 && -[NSString isEqual:](build, "isEqual:"))
          {
            -[HKMedicalCodingCollection codingsSet](self->_codingCollection, "codingsSet");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*((id *)v7 + 3), "codingsSet");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14 == v15)
            {
              -[HKUserDomainConceptLinkCollection links](self->_linkCollection, "links", v30, v32);
            }
            else
            {
              objc_msgSend(*((id *)v7 + 3), "codingsSet");
              v16 = objc_claimAutoreleasedReturnValue();
              if (!v16)
              {
                v19 = 0;
LABEL_40:

                goto LABEL_21;
              }
              v4 = (void *)v16;
              -[HKMedicalCodingCollection codingsSet](self->_codingCollection, "codingsSet");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*((id *)v7 + 3), "codingsSet");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v17, "isEqualToSet:", v18))
              {
                v19 = 0;
LABEL_39:

                goto LABEL_40;
              }
              -[HKUserDomainConceptLinkCollection links](self->_linkCollection, "links", v18, v17);
            }
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*((id *)v7 + 4), "links");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21 == v22)
            {
              propertyCollection = self->_propertyCollection;
              v29 = (HKUserDomainConceptPropertyCollection *)*((_QWORD *)v7 + 10);
              v19 = propertyCollection == v29;
              if (propertyCollection != v29 && v29)
                v19 = -[HKUserDomainConceptPropertyCollection isEqual:](propertyCollection, "isEqual:");
            }
            else
            {
              objc_msgSend(*((id *)v7 + 4), "links");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (v23)
              {
                -[HKUserDomainConceptLinkCollection links](self->_linkCollection, "links");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*((id *)v7 + 4), "links");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v24, "isEqual:", v25) & 1) != 0)
                {
                  v26 = self->_propertyCollection;
                  v27 = (HKUserDomainConceptPropertyCollection *)*((_QWORD *)v7 + 10);
                  v19 = v26 == v27;
                  if (v26 != v27 && v27)
                    v19 = -[HKUserDomainConceptPropertyCollection isEqual:](v26, "isEqual:");
                }
                else
                {
                  v19 = 0;
                }

              }
              else
              {
                v19 = 0;
              }

            }
            v18 = v31;
            v17 = v33;
            if (v14 == v15)
              goto LABEL_40;
            goto LABEL_39;
          }
        }
      }
    }
  }
  v19 = 0;
LABEL_21:

  return v19;
}

- (id)unitTesting_duplicate
{
  void *v2;
  void *v3;

  -[HKUserDomainConcept _deepCopy](self, "_deepCopy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setUUID:", v3);

  return v2;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (HKMedicalCodingCollection)codingCollection
{
  return self->_codingCollection;
}

- (HKUserDomainConceptLinkCollection)linkCollection
{
  return self->_linkCollection;
}

- (HKUserDomainConceptTypeIdentifier)identifier
{
  return self->_identifier;
}

- (BOOL)isDeleted
{
  return self->_deleted;
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (double)modificationTimestamp
{
  return self->_modificationTimestamp;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = *($A44FF20282FB96BA82CF1B0FF6945C38 *)((char *)self + 88);
  return self;
}

- (NSString)build
{
  return self->_build;
}

- (int64_t)healthd_use_only_syncEntityIdentity
{
  return self->_healthd_use_only_syncEntityIdentity;
}

- (void)setHealthd_use_only_syncEntityIdentity:(int64_t)a3
{
  self->_healthd_use_only_syncEntityIdentity = a3;
}

- (HKUserDomainConceptPropertyCollection)propertyCollection
{
  return self->_propertyCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyCollection, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_linkCollection, 0);
  objc_storeStrong((id *)&self->_codingCollection, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
