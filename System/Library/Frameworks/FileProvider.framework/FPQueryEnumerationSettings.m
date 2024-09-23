@implementation FPQueryEnumerationSettings

- (NSNumber)desiredNumberOfItems
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)allowedFileTypes
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)excludedFileTypes
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)allowedProviders
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)FPQueryEnumerationSettings;
  v4 = -[FPEnumerationSettings copyWithZone:](&v18, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_allowedProviders, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v7 = -[NSNumber copy](self->_desiredNumberOfItems, "copy");
  v8 = (void *)v4[5];
  v4[5] = v7;

  v9 = -[NSArray copy](self->_excludedFileTypes, "copy");
  v10 = (void *)v4[6];
  v4[6] = v9;

  v11 = -[NSArray copy](self->_allowedFileTypes, "copy");
  v12 = (void *)v4[7];
  v4[7] = v11;

  v13 = -[NSString copy](self->_tagIdentifier, "copy");
  v14 = (void *)v4[8];
  v4[8] = v13;

  v15 = -[NSArray copy](self->_excludedParentOIDs, "copy");
  v16 = (void *)v4[9];
  v4[9] = v15;

  *((_BYTE *)v4 + 24) = self->_allowSemanticSearchResults;
  return v4;
}

- (FPQueryEnumerationSettings)init
{
  FPQueryEnumerationSettings *v2;
  void *v3;
  uint64_t v4;
  NSArray *allowedFileTypes;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)FPQueryEnumerationSettings;
  v2 = -[FPEnumerationSettings init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC528], "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v4 = objc_claimAutoreleasedReturnValue();
    allowedFileTypes = v2->_allowedFileTypes;
    v2->_allowedFileTypes = (NSArray *)v4;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedParentOIDs, 0);
  objc_storeStrong((id *)&self->_tagIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedFileTypes, 0);
  objc_storeStrong((id *)&self->_excludedFileTypes, 0);
  objc_storeStrong((id *)&self->_desiredNumberOfItems, 0);
  objc_storeStrong((id *)&self->_allowedProviders, 0);
}

- (void)setDesiredNumberOfItems:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setExcludedFileTypes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)setAllowedFileTypes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

+ (BOOL)supportsSecureCoding
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPEnumerationSettings.m"), 180, CFSTR("UNREACHABLE: this shouldn't need to go over XPC"));

  return 0;
}

- (void)setAllowedProviders:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)tagIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTagIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSArray)excludedParentOIDs
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setExcludedParentOIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (BOOL)allowSemanticSearchResults
{
  return self->_allowSemanticSearchResults;
}

- (void)setAllowSemanticSearchResults:(BOOL)a3
{
  self->_allowSemanticSearchResults = a3;
}

@end
