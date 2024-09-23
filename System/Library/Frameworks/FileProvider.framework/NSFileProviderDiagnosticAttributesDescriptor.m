@implementation NSFileProviderDiagnosticAttributesDescriptor

- (NSFileProviderDiagnosticAttributesDescriptor)initWithDocID:(unsigned int)a3
{
  NSFileProviderDiagnosticAttributesDescriptor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSFileProviderDiagnosticAttributesDescriptor;
  result = -[NSFileProviderDiagnosticAttributesDescriptor init](&v5, sel_init);
  if (result)
    result->_docID = a3;
  return result;
}

- (NSFileProviderDiagnosticAttributesDescriptor)initWithFileID:(unint64_t)a3
{
  NSFileProviderDiagnosticAttributesDescriptor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSFileProviderDiagnosticAttributesDescriptor;
  result = -[NSFileProviderDiagnosticAttributesDescriptor init](&v5, sel_init);
  if (result)
    result->_fileID = a3;
  return result;
}

- (NSFileProviderDiagnosticAttributesDescriptor)initWithItemID:(id)a3
{
  id v5;
  NSFileProviderDiagnosticAttributesDescriptor *v6;
  NSFileProviderDiagnosticAttributesDescriptor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSFileProviderDiagnosticAttributesDescriptor;
  v6 = -[NSFileProviderDiagnosticAttributesDescriptor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_itemID, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderDiagnosticAttributesDescriptor)initWithCoder:(id)a3
{
  id v4;
  NSFileProviderDiagnosticAttributesDescriptor *v5;
  uint64_t v6;
  NSString *itemID;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *diagnosticAttributes;
  uint64_t v14;
  NSError *error;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NSFileProviderDiagnosticAttributesDescriptor;
  v5 = -[NSFileProviderDiagnosticAttributesDescriptor init](&v17, sel_init);
  if (v5)
  {
    v5->_docID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_docID"));
    v5->_fileID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_fileID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_itemID"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemID = v5->_itemID;
    v5->_itemID = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("_diagnosticAttributes"));
    v12 = objc_claimAutoreleasedReturnValue();
    diagnosticAttributes = v5->_diagnosticAttributes;
    v5->_diagnosticAttributes = (NSDictionary *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_error"));
    v14 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t docID;
  id v5;

  docID = self->_docID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", docID, CFSTR("_docID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_fileID, CFSTR("_fileID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemID, CFSTR("_itemID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_diagnosticAttributes, CFSTR("_diagnosticAttributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("_error"));

}

- (unsigned)docID
{
  return self->_docID;
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (NSDictionary)diagnosticAttributes
{
  return self->_diagnosticAttributes;
}

- (void)setDiagnosticAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticAttributes, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_diagnosticAttributes, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
}

@end
