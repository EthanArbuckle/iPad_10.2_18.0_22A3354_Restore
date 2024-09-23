@implementation ICTTOrderedSetVersionedDocument

- (ICCROrderedSet)orderedSet
{
  ICCROrderedSet *orderedSet;
  ICCRDocument *v4;
  void *v5;
  ICCRDocument *v6;
  ICCRDocument *document;
  ICCROrderedSet *v8;
  ICCROrderedSet *v9;

  orderedSet = self->_orderedSet;
  if (!orderedSet)
  {
    v4 = [ICCRDocument alloc];
    -[ICTTVersionedDocument replicaID](self, "replicaID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICCRDocument initWithReplica:](v4, "initWithReplica:", v5);
    document = self->_document;
    self->_document = v6;

    v8 = objc_alloc_init(ICCROrderedSet);
    v9 = self->_orderedSet;
    self->_orderedSet = v8;

    -[ICCRDocument setRootObject:](self->_document, "setRootObject:", self->_orderedSet);
    orderedSet = self->_orderedSet;
  }
  return orderedSet;
}

+ (unsigned)serializationVersion
{
  return 0;
}

+ (unsigned)minimumSupportedVersion
{
  return 0;
}

- (unint64_t)mergeWithOrderedSetVersionedDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  objc_super v13;

  v4 = a3;
  -[ICTTOrderedSetVersionedDocument orderedSet](self, "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICTTOrderedSetVersionedDocument document](self, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mergeWithDocument:", v8);

  -[ICTTOrderedSetVersionedDocument orderedSet](self, "orderedSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v13.receiver = self;
  v13.super_class = (Class)ICTTOrderedSetVersionedDocument;
  -[ICTTVersionedDocument mergeWithVersionedDocument:](&v13, sel_mergeWithVersionedDocument_, v4);

  if (objc_msgSend(v10, "isEqualToArray:", v6))
    v11 = 1;
  else
    v11 = 2;

  return v11;
}

- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  ICCROrderedSet *v8;
  ICCROrderedSet *orderedSet;
  id obj;

  v5 = a4;
  -[ICTTVersionedDocument replicaID](self, "replicaID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICCRCoderUnarchiver decodedDocumentFromData:replica:](ICCRCoderUnarchiver, "decodedDocumentFromData:replica:", v5, v6);
  obj = (id)objc_claimAutoreleasedReturnValue();

  v7 = obj;
  if (obj)
  {
    if (self->_document)
    {
      -[ICCRDocument mergeWithDocument:](self->_document, "mergeWithDocument:", obj);
    }
    else
    {
      objc_storeStrong((id *)&self->_document, obj);
      objc_msgSend(obj, "rootObject");
      v8 = (ICCROrderedSet *)objc_claimAutoreleasedReturnValue();
      orderedSet = self->_orderedSet;
      self->_orderedSet = v8;

    }
    v7 = obj;
  }

}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  if (a3)
    *a3 = objc_msgSend((id)objc_opt_class(), "serializationVersion");
  return -[ICCRDocument archivedData](self->_document, "archivedData");
}

- (void)setOrderedSet:(id)a3
{
  objc_storeStrong((id *)&self->_orderedSet, a3);
}

- (ICCRDocument)document
{
  return (ICCRDocument *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_orderedSet, 0);
}

@end
