@implementation PHCollectionReference

- (PHCollectionReference)initWithLocalIdentifier:(id)a3 libraryURL:(id)a4 transientIdentifier:(id)a5 transientTitle:(id)a6
{
  id v10;
  id v11;
  PHCollectionReference *v12;
  uint64_t v13;
  NSString *transientIdentifier;
  uint64_t v15;
  NSString *transientTitle;
  objc_super v18;

  v10 = a5;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PHCollectionReference;
  v12 = -[PHObjectReference initWithLocalIdentifier:libraryURL:](&v18, sel_initWithLocalIdentifier_libraryURL_, a3, a4);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    transientIdentifier = v12->_transientIdentifier;
    v12->_transientIdentifier = (NSString *)v13;

    v15 = objc_msgSend(v11, "copy");
    transientTitle = v12->_transientTitle;
    v12->_transientTitle = (NSString *)v15;

  }
  return v12;
}

- (PHCollectionReference)initWithDictionary:(id)a3 referenceType:(id)a4
{
  id v6;
  PHCollectionReference *v7;
  void *v8;
  uint64_t v9;
  NSString *transientIdentifier;
  void *v11;
  uint64_t v12;
  NSString *transientTitle;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHCollectionReference;
  v7 = -[PHObjectReference initWithDictionary:referenceType:](&v15, sel_initWithDictionary_referenceType_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transientIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    transientIdentifier = v7->_transientIdentifier;
    v7->_transientIdentifier = (NSString *)v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("transientTitle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    transientTitle = v7->_transientTitle;
    v7->_transientTitle = (NSString *)v12;

  }
  return v7;
}

- (id)dictionaryForReferenceType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHCollectionReference;
  -[PHObjectReference dictionaryForReferenceType:](&v8, sel_dictionaryForReferenceType_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PHCollectionReference transient](self, "transient"))
  {
    -[PHCollectionReference transientIdentifier](self, "transientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("transientIdentifier"));

    -[PHCollectionReference transientTitle](self, "transientTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("transientTitle"));

  }
  return v4;
}

- (BOOL)transient
{
  return 0;
}

- (id)_transientCollectionInLibrary:(id)a3
{
  return 0;
}

- (NSString)transientIdentifier
{
  return self->_transientIdentifier;
}

- (NSString)transientTitle
{
  return self->_transientTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transientTitle, 0);
  objc_storeStrong((id *)&self->_transientIdentifier, 0);
}

+ (id)representedType
{
  return CFSTR("com.apple.photos.object-reference.collection");
}

@end
