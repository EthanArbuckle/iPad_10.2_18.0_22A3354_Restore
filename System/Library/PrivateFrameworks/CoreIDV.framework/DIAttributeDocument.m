@implementation DIAttributeDocument

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributeDocument;
  v4 = a3;
  -[DIAttribute encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_docType, CFSTR("docType"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_idDocType, CFSTR("idDocType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_acceptableDocTypes, CFSTR("acceptableDocTypes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_acceptableDocs, CFSTR("acceptableDocs"));

  os_unfair_lock_unlock(&self->super._lock);
}

- (DIAttributeDocument)initWithCoder:(id)a3
{
  id v4;
  DIAttributeDocument *v5;
  uint64_t v6;
  NSString *idDocType;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *acceptableDocs;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DIAttributeDocument;
  v5 = -[DIAttribute initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_docType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("docType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idDocType"));
    v6 = objc_claimAutoreleasedReturnValue();
    idDocType = v5->_idDocType;
    v5->_idDocType = (NSString *)v6;

    v5->_acceptableDocTypes = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("acceptableDocTypes"));
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("acceptableDocs"));
    v11 = objc_claimAutoreleasedReturnValue();
    acceptableDocs = v5->_acceptableDocs;
    v5->_acceptableDocs = (NSArray *)v11;

  }
  return v5;
}

- (DIAttributeDocument)initWithAcceptableDocs:(id)a3
{
  id v5;
  DIAttributeDocument *v6;
  DIAttributeDocument *v7;
  NSString *idDocType;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DIAttributeDocument;
  v6 = -[DIAttribute init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[DIAttribute setAttributeType:](v6, "setAttributeType:", 4);
    -[DIAttribute setIdentifier:](v7, "setIdentifier:", CFSTR("identityDocument"));
    v7->_acceptableDocTypes = 1;
    objc_storeStrong((id *)&v7->_acceptableDocs, a3);
    v7->_docType = 1;
    idDocType = v7->_idDocType;
    v7->_idDocType = (NSString *)CFSTR("unknown");

  }
  return v7;
}

- (void)setDocType:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  const __CFString *v6;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_docType = a3;
  os_unfair_lock_unlock(p_lock);
  if (a3 - 2 > 6)
    v6 = CFSTR("unknown");
  else
    v6 = off_24C2D2B78[a3 - 2];
  -[DIAttributeDocument setIdDocType:](self, "setIdDocType:", v6);
}

- (void)setCurrentValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeDocument;
  -[DIAttribute setCurrentValue:](&v3, sel_setCurrentValue_, a3);
}

- (void)setIdDocType:(id)a3
{
  NSString *v4;
  NSString *idDocType;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_idDocType != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    idDocType = self->_idDocType;
    self->_idDocType = v4;

  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (void)setAcceptableDocs:(id)a3
{
  NSArray *v4;
  NSArray *acceptableDocs;
  NSArray *v6;

  v6 = (NSArray *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_acceptableDocs != v6)
  {
    v4 = (NSArray *)-[NSArray copyWithZone:](v6, "copyWithZone:", 0);
    acceptableDocs = self->_acceptableDocs;
    self->_acceptableDocs = v4;

  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (void)setAcceptableDocTypes:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_acceptableDocTypes = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)getCurrentValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeDocument;
  -[DIAttribute getCurrentValue](&v3, sel_getCurrentValue);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeDocument;
  -[DIAttribute defaultValue](&v3, sel_defaultValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)idDocType
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_idDocType;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)docType
{
  os_unfair_lock_s *p_lock;
  unint64_t docType;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  docType = self->_docType;
  os_unfair_lock_unlock(p_lock);
  return docType;
}

- (NSArray)acceptableDocs
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_acceptableDocs;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)acceptableDocTypes
{
  os_unfair_lock_s *p_lock;
  unint64_t acceptableDocTypes;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  acceptableDocTypes = self->_acceptableDocTypes;
  os_unfair_lock_unlock(p_lock);
  return acceptableDocTypes;
}

- (id)description
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", &stru_24C2D5A40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)DIAttributeDocument;
  -[DIAttribute description](&v27, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v3, "appendFormat:", CFSTR("docType: '%lu'; "), self->_docType);
  objc_msgSend(v3, "appendFormat:", CFSTR("idDocType: '%@'; "), self->_idDocType);
  objc_msgSend(v3, "appendFormat:", CFSTR("acceptableDocTypes: '%lu'; "), self->_acceptableDocTypes);
  objc_msgSend(v3, "appendFormat:", CFSTR("acceptableDocs: [ \n"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_acceptableDocs;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("    acceptableDoc: '%@'\n"), v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->super._lock);
  objc_msgSend(v3, "appendFormat:", CFSTR("]; "));
  -[DIAttributeDocument defaultValue](self, "defaultValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("defaultValue: '%@'; "), v11);

  objc_msgSend(v3, "appendFormat:", CFSTR("currentValue: [ \n"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[DIAttributeDocument getCurrentValue](self, "getCurrentValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "description");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("    image: '%@'\n"), v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v14);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("]; "));
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptableDocs, 0);
  objc_storeStrong((id *)&self->_idDocType, 0);
}

@end
