@implementation GEOPlaceCachePlaceReply

- (GEOPlaceCachePlaceReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOPlaceCachePlaceReply *v7;
  const void *data;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *identifiers;
  GEOPlaceCachePlaceReply *v16;
  size_t length;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOPlaceCachePlaceReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v19, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    length = 0;
    data = xpc_dictionary_get_data(v6, "identifiers", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3710];
      v11 = (void *)MEMORY[0x1E0C99E60];
      v12 = objc_opt_class();
      objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "unarchivedObjectOfClasses:fromData:error:", v13, v9, a4);
      v14 = objc_claimAutoreleasedReturnValue();
      identifiers = v7->_identifiers;
      v7->_identifiers = (NSArray *)v14;

    }
    v16 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceCachePlaceReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v6, sel_encodeToXPCDictionary_, v4);
  if (-[NSArray count](self->_identifiers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_identifiers, 1, 0);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "identifiers", (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));

  }
}

- (BOOL)isValid
{
  return 1;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_identifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
