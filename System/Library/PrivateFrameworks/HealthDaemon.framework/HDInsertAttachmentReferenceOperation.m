@implementation HDInsertAttachmentReferenceOperation

- (HDInsertAttachmentReferenceOperation)initWithReference:(id)a3
{
  id v4;
  HDInsertAttachmentReferenceOperation *v5;
  uint64_t v6;
  HDAttachmentReference *reference;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDInsertAttachmentReferenceOperation;
  v5 = -[HDInsertAttachmentReferenceOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    reference = v5->_reference;
    v5->_reference = (HDAttachmentReference *)v6;

  }
  return v5;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  void *v5;
  BOOL v6;

  +[HDAttachmentReferenceEntity _insertReference:databaseTransaction:error:](HDAttachmentReferenceEntity, "_insertReference:databaseTransaction:error:", self->_reference, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertAttachmentReferenceOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HDInsertAttachmentReferenceOperation *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attachment_reference"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HDInsertAttachmentReferenceOperation initWithReference:](self, "initWithReference:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_reference, CFSTR("attachment_reference"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference, 0);
}

@end
