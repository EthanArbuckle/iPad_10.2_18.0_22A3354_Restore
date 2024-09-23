@implementation HDConceptIndexEntry

- (HDConceptIndexEntry)init
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

- (HDConceptIndexEntry)initWithSampleUUID:(id)a3 conceptIdentifier:(int64_t)a4 conceptVersion:(int64_t)a5 keyPath:(id)a6 compoundIndex:(unint64_t)a7 type:(unint64_t)a8 ontologyVersion:(id)a9
{
  id v16;
  id v17;
  id v18;
  HDConceptIndexEntry *v19;
  uint64_t v20;
  NSUUID *sampleUUID;
  uint64_t v22;
  NSString *keyPath;
  uint64_t v24;
  HKOntologyVersion *ontologyVersion;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v16 = a3;
  v17 = a6;
  v18 = a9;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDConceptIndexEntry.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath != nil"));

    if (v18)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDConceptIndexEntry.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sampleUUID != nil"));

  if (!v17)
    goto LABEL_8;
LABEL_3:
  if (v18)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDConceptIndexEntry.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ontologyVersion != nil"));

LABEL_4:
  v30.receiver = self;
  v30.super_class = (Class)HDConceptIndexEntry;
  v19 = -[HDConceptIndexEntry init](&v30, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v16, "copy");
    sampleUUID = v19->_sampleUUID;
    v19->_sampleUUID = (NSUUID *)v20;

    v19->_conceptIdentifier = a4;
    v19->_conceptVersion = a5;
    v22 = objc_msgSend(v17, "copy");
    keyPath = v19->_keyPath;
    v19->_keyPath = (NSString *)v22;

    v19->_compoundIndex = a7;
    v19->_type = a8;
    v24 = objc_msgSend(v18, "copy");
    ontologyVersion = v19->_ontologyVersion;
    v19->_ontologyVersion = (HKOntologyVersion *)v24;

  }
  return v19;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p sampleUUID=%@, conceptIdentifier=%lld, conceptVersion=%lld, keyPath='%@', compoundIndex=%llu, type=%lu, ontologyVersion=%@>"), v5, self, self->_sampleUUID, self->_conceptIdentifier, self->_conceptVersion, self->_keyPath, self->_compoundIndex, self->_type, self->_ontologyVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  int8x16_t v6;
  int8x16_t v8;
  int8x16_t v9;

  v3 = -[NSUUID hash](self->_sampleUUID, "hash");
  v9 = *(int8x16_t *)&self->_conceptIdentifier;
  v4 = -[NSString hash](self->_keyPath, "hash");
  v8 = *(int8x16_t *)&self->_compoundIndex;
  v5 = -[HKOntologyVersion hash](self->_ontologyVersion, "hash");
  v6 = veorq_s8(v9, v8);
  return *(_QWORD *)&veor_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) ^ v5 ^ v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  HDConceptIndexEntry *v4;
  HDConceptIndexEntry *v5;
  NSUUID *sampleUUID;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSUUID *v11;
  void *v12;
  BOOL v13;
  int64_t conceptIdentifier;
  int64_t conceptVersion;
  NSString *keyPath;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSString *v20;
  void *v21;
  unint64_t compoundIndex;
  unint64_t type;
  HKOntologyVersion *ontologyVersion;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  HKOntologyVersion *v28;
  void *v29;

  v4 = (HDConceptIndexEntry *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      sampleUUID = self->_sampleUUID;
      -[HDConceptIndexEntry sampleUUID](v5, "sampleUUID");
      v7 = objc_claimAutoreleasedReturnValue();
      if (sampleUUID == (NSUUID *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[HDConceptIndexEntry sampleUUID](v5, "sampleUUID");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
          goto LABEL_23;
        v10 = (void *)v9;
        v11 = self->_sampleUUID;
        -[HDConceptIndexEntry sampleUUID](v5, "sampleUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = -[NSUUID isEqual:](v11, "isEqual:", v12);

        if (!(_DWORD)v11)
          goto LABEL_24;
      }
      conceptIdentifier = self->_conceptIdentifier;
      if (conceptIdentifier != -[HDConceptIndexEntry conceptIdentifier](v5, "conceptIdentifier"))
        goto LABEL_24;
      conceptVersion = self->_conceptVersion;
      if (conceptVersion != -[HDConceptIndexEntry conceptVersion](v5, "conceptVersion"))
        goto LABEL_24;
      keyPath = self->_keyPath;
      -[HDConceptIndexEntry keyPath](v5, "keyPath");
      v17 = objc_claimAutoreleasedReturnValue();
      if (keyPath == (NSString *)v17)
      {

      }
      else
      {
        v8 = (void *)v17;
        -[HDConceptIndexEntry keyPath](v5, "keyPath");
        v18 = objc_claimAutoreleasedReturnValue();
        if (!v18)
          goto LABEL_23;
        v19 = (void *)v18;
        v20 = self->_keyPath;
        -[HDConceptIndexEntry keyPath](v5, "keyPath");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v20) = -[NSString isEqualToString:](v20, "isEqualToString:", v21);

        if (!(_DWORD)v20)
          goto LABEL_24;
      }
      compoundIndex = self->_compoundIndex;
      if (compoundIndex != -[HDConceptIndexEntry compoundIndex](v5, "compoundIndex"))
        goto LABEL_24;
      type = self->_type;
      if (type != -[HDConceptIndexEntry type](v5, "type"))
        goto LABEL_24;
      ontologyVersion = self->_ontologyVersion;
      -[HDConceptIndexEntry ontologyVersion](v5, "ontologyVersion");
      v25 = objc_claimAutoreleasedReturnValue();
      if (ontologyVersion == (HKOntologyVersion *)v25)
      {

LABEL_28:
        v13 = 1;
        goto LABEL_25;
      }
      v8 = (void *)v25;
      -[HDConceptIndexEntry ontologyVersion](v5, "ontologyVersion");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)v26;
        v28 = self->_ontologyVersion;
        -[HDConceptIndexEntry ontologyVersion](v5, "ontologyVersion");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v28) = -[HKOntologyVersion isEqual:](v28, "isEqual:", v29);

        if ((v28 & 1) != 0)
          goto LABEL_28;
LABEL_24:
        v13 = 0;
LABEL_25:

        goto LABEL_26;
      }
LABEL_23:

      goto LABEL_24;
    }
    v13 = 0;
  }
LABEL_26:

  return v13;
}

- (NSUUID)sampleUUID
{
  return self->_sampleUUID;
}

- (int64_t)conceptIdentifier
{
  return self->_conceptIdentifier;
}

- (int64_t)conceptVersion
{
  return self->_conceptVersion;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (unint64_t)compoundIndex
{
  return self->_compoundIndex;
}

- (unint64_t)type
{
  return self->_type;
}

- (HKOntologyVersion)ontologyVersion
{
  return self->_ontologyVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ontologyVersion, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_sampleUUID, 0);
}

@end
