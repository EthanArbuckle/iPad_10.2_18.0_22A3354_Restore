@implementation ICTableVersionedDocument

+ (unsigned)serializationVersion
{
  return 0;
}

+ (unsigned)minimumSupportedVersion
{
  return 0;
}

- (ICTableVersionedDocument)initWithColumnCount:(unint64_t)a3 rowCount:(unint64_t)a4 replicaID:(id)a5
{
  ICTableVersionedDocument *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ICTableVersionedDocument;
  v7 = -[ICTTVersionedDocument initWithData:replicaID:](&v15, sel_initWithData_replicaID_, 0, a5);
  if (v7)
  {
    if (a3)
    {
      v8 = 0;
      do
      {
        -[ICTableVersionedDocument table](v7, "table");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v9, "insertColumnAtIndex:", v8);

        ++v8;
      }
      while (a3 != v8);
    }
    if (a4)
    {
      v11 = 0;
      do
      {
        -[ICTableVersionedDocument table](v7, "table");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (id)objc_msgSend(v12, "insertRowAtIndex:", v11);

        ++v11;
      }
      while (a4 != v11);
    }
  }
  return v7;
}

- (unint64_t)mergeWithTableVersionedDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a3;
  -[ICTableVersionedDocument innerTableDocument](self, "innerTableDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "innerTableDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "mergeWithDocument:", v6);
  v8 = 1;
  if (v7 != 1)
    v8 = 2;
  if (v7)
    return v8;
  else
    return 0;
}

- (ICCRDocument)innerTableDocument
{
  void *v2;
  void *v3;

  -[ICTableVersionedDocument table](self, "table");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICCRDocument *)v3;
}

- (ICTable)table
{
  ICTable *table;
  ICCRTTCompatibleDocument *v4;
  void *v5;
  ICCRDocument *v6;
  ICCRDocument *innerTableDocument;
  ICTable *v8;
  ICTable *v9;

  table = self->_table;
  if (!table)
  {
    v4 = [ICCRTTCompatibleDocument alloc];
    -[ICTTVersionedDocument replicaID](self, "replicaID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICCRDocument initWithReplica:](v4, "initWithReplica:", v5);
    innerTableDocument = self->_innerTableDocument;
    self->_innerTableDocument = v6;

    v8 = -[CRTable initWithDocument:]([ICTable alloc], "initWithDocument:", self->_innerTableDocument);
    v9 = self->_table;
    self->_table = v8;

    -[ICCRDocument setRootObject:](self->_innerTableDocument, "setRootObject:", self->_table);
    table = self->_table;
  }
  return table;
}

- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  ICCRDocument *innerTableDocument;
  ICTable *v9;
  ICTable *table;
  id obj;

  v5 = a4;
  -[ICTTVersionedDocument replicaID](self, "replicaID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCRCoderUnarchiver decodedDocumentFromData:replica:](ICCRCoderUnarchiver, "decodedDocumentFromData:replica:", v5, v6);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v7 = obj;
  if (obj)
  {
    innerTableDocument = self->_innerTableDocument;
    if (innerTableDocument)
    {
      -[ICCRDocument mergeWithDocument:](innerTableDocument, "mergeWithDocument:", obj);
    }
    else
    {
      objc_storeStrong((id *)&self->_innerTableDocument, obj);
      -[ICCRDocument rootObject](self->_innerTableDocument, "rootObject");
      v9 = (ICTable *)objc_claimAutoreleasedReturnValue();
      table = self->_table;
      self->_table = v9;

    }
    v7 = obj;
  }

}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  if (a3)
    *a3 = objc_msgSend((id)objc_opt_class(), "serializationVersion");
  return -[ICCRDocument archivedData](self->_innerTableDocument, "archivedData");
}

- (void)setTable:(id)a3
{
  objc_storeStrong((id *)&self->_table, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_innerTableDocument, 0);
}

@end
