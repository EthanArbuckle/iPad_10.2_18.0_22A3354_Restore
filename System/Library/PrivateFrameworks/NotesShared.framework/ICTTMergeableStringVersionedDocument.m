@implementation ICTTMergeableStringVersionedDocument

- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4
{
  ICTTMergeableAttributedString *v5;
  void *v6;
  ICTTMergeableAttributedString *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = [ICTTMergeableAttributedString alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICTTMergeableString initWithData:replicaID:](v5, "initWithData:replicaID:", v9, v6);

  if (v7)
  {
    -[ICTTMergeableStringVersionedDocument mergeableString](self, "mergeableString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mergeWithString:", v7);

  }
}

+ (unsigned)serializationVersion
{
  return 0;
}

- (ICTTMergeableAttributedString)mergeableString
{
  ICTTMergeableAttributedString *mergeableString;
  ICTTMergeableAttributedString *v4;
  void *v5;
  ICTTMergeableAttributedString *v6;
  ICTTMergeableAttributedString *v7;

  mergeableString = self->_mergeableString;
  if (!mergeableString)
  {
    v4 = [ICTTMergeableAttributedString alloc];
    -[ICTTVersionedDocument replicaID](self, "replicaID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICTTMergeableString initWithReplicaID:](v4, "initWithReplicaID:", v5);
    v7 = self->_mergeableString;
    self->_mergeableString = v6;

    mergeableString = self->_mergeableString;
  }
  return mergeableString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableString, 0);
}

+ (unsigned)minimumSupportedVersion
{
  return 0;
}

- (ICTTMergeableStringVersionedDocument)initWithMergeableString:(id)a3
{
  id v5;
  void *v6;
  ICTTMergeableStringVersionedDocument *v7;
  objc_super v9;

  v5 = a3;
  objc_msgSend(v5, "replicaUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)ICTTMergeableStringVersionedDocument;
  v7 = -[ICTTVersionedDocument initWithData:replicaID:](&v9, sel_initWithData_replicaID_, 0, v6);

  if (v7)
    objc_storeStrong((id *)&v7->_mergeableString, a3);

  return v7;
}

- (unint64_t)mergeWithStringVersionedDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  objc_super v9;

  v4 = a3;
  -[ICTTMergeableStringVersionedDocument mergeableString](self, "mergeableString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeableString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "mergeWithString:", v6);

  if (v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)ICTTMergeableStringVersionedDocument;
    -[ICTTVersionedDocument mergeWithVersionedDocument:](&v9, sel_mergeWithVersionedDocument_, v4);
  }

  return v7;
}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  void *v4;
  void *v5;

  *a3 = +[ICTTMergeableStringVersionedDocument serializationVersion](ICTTMergeableStringVersionedDocument, "serializationVersion");
  -[ICTTMergeableStringVersionedDocument mergeableString](self, "mergeableString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
