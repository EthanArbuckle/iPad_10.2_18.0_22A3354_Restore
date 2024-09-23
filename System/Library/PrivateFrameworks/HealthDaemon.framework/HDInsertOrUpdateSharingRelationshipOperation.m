@implementation HDInsertOrUpdateSharingRelationshipOperation

- (HDInsertOrUpdateSharingRelationshipOperation)initWithCodableSharingRelationships:(id)a3 syncProvenance:(int64_t)a4
{
  id v6;
  HDInsertOrUpdateSharingRelationshipOperation *v7;
  uint64_t v8;
  NSArray *relationships;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDInsertOrUpdateSharingRelationshipOperation;
  v7 = -[HDInsertOrUpdateSharingRelationshipOperation init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    relationships = v7->_relationships;
    v7->_relationships = (NSArray *)v8;

    v7->_syncProvenance = a4;
  }

  return v7;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  void *v7;

  objc_msgSend(a3, "sharingAuthorizationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v7, "insertOrUpdateCodableRelationships:syncProvenance:error:", self->_relationships, self->_syncProvenance, a5);

  return (char)a5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertOrUpdateSharingRelationshipOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  HDInsertOrUpdateSharingRelationshipOperation *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("relationships"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("syncProvenance"));

  v7 = -[HDInsertOrUpdateSharingRelationshipOperation initWithCodableSharingRelationships:syncProvenance:](self, "initWithCodableSharingRelationships:syncProvenance:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *relationships;
  id v5;

  relationships = self->_relationships;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", relationships, CFSTR("relationships"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_syncProvenance, CFSTR("syncProvenance"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationships, 0);
}

@end
