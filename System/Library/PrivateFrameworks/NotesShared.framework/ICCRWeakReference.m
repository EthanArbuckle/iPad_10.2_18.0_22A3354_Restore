@implementation ICCRWeakReference

- (ICCRWeakReference)initWithContents:(id)a3
{
  return -[ICCRWeakReference initWithContents:document:](self, "initWithContents:document:", a3, 0);
}

- (ICCRWeakReference)initWithContents:(id)a3 document:(id)a4
{
  id v6;
  id v7;
  ICCRWeakReference *v8;
  uint64_t v9;
  NSUUID *identifier;
  ICCRWeakReference *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)ICCRWeakReference;
    v8 = -[ICCRWeakReference init](&v13, sel_init);
    if (v8)
    {
      objc_msgSend(v6, "identity");
      v9 = objc_claimAutoreleasedReturnValue();
      identifier = v8->_identifier;
      v8->_identifier = (NSUUID *)v9;

      objc_storeWeak((id *)&v8->_document, v7);
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (ICCRWeakReference)initWithIdentifier:(id)a3 document:(id)a4
{
  id v7;
  id v8;
  ICCRWeakReference *v9;
  ICCRWeakReference *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICCRWeakReference;
  v9 = -[ICCRWeakReference init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeWeak((id *)&v10->_document, v8);
  }

  return v10;
}

- (ICCRWeakReference)initWithICCRCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  ICCRWeakReference *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentDocumentObjectForDecoding");
  if (*(_DWORD *)(v5 + 48) == 11)
  {
    objc_msgSend(v4, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_document, v6);

    if (*(_DWORD *)(v5 + 48) == 11)
      v7 = *(_QWORD *)(v5 + 40);
    else
      v7 = 0;
    objc_msgSend(v4, "decodeUUIDFromUUIDIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "document");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ICCRWeakReference initWithIdentifier:document:](self, "initWithIdentifier:document:", v8, v9);

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithICCRCoder:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "currentDocumentObjectForEncoding");
  -[ICCRWeakReference identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "encodeUUIDIndexFromUUID:", v5);
  if (*(_DWORD *)(v4 + 48) != 11)
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v4 + 48) = 11;
  }
  *(_QWORD *)(v4 + 40) = v6;

}

- (id)contents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICCRWeakReference document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRWeakReference identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  return 0;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCRWeakReference identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CR_shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p %@>"), v5, self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (ICCRDocument)document
{
  return (ICCRDocument *)objc_loadWeakRetained((id *)&self->_document);
}

- (void)setDocument:(id)a3
{
  objc_storeWeak((id *)&self->_document, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_document);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
