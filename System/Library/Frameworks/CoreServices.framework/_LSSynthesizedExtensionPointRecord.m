@implementation _LSSynthesizedExtensionPointRecord

- (_LSSynthesizedExtensionPointRecord)initWithIdentifier:(id)a3
{
  _LSSynthesizedExtensionPointRecord *v4;
  _LSDServiceDomain *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _LSSynthesizedExtensionPointRecord *v9;
  id v10;
  id v11;
  objc_super v13;
  void **CurrentContext;
  id v15;
  char v16;
  id v17;

  v4 = self;
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)self);
  v15 = 0;
  v16 = 0;
  v17 = 0;
  +[_LSDServiceDomain defaultServiceDomain]();
  v5 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v5, 0);

  if (!v6)
    goto LABEL_4;
  v7 = *(unsigned int *)(*v6 + 1608);
  v13.receiver = v4;
  v13.super_class = (Class)_LSSynthesizedExtensionPointRecord;
  v6 = -[LSRecord _initWithContext:tableID:unitID:](&v13, sel__initWithContext_tableID_unitID_, v6, v7, 0);
  if (v6)
  {
    v8 = objc_msgSend(a3, "copy");
    v4 = (_LSSynthesizedExtensionPointRecord *)v6[4];
    v6[4] = v8;
LABEL_4:

  }
  v9 = v6;
  if (CurrentContext && v16)
    _LSContextDestroy(CurrentContext);
  v10 = v15;
  CurrentContext = 0;
  v15 = 0;

  v16 = 0;
  v11 = v17;
  v17 = 0;

  return v9;
}

- (id)_initWithContext:(LSContext *)a3 persistentIdentifierData:(const LSPersistentIdentifierData *)a4 length:(unint64_t)a5
{
  id *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_LSSynthesizedExtensionPointRecord;
  v7 = -[LSRecord _initWithContext:persistentIdentifierData:length:](&v10, sel__initWithContext_persistentIdentifierData_length_, a3);
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", a4->var5, a5 - 28, 4, 0);
    if (v8)
      objc_storeStrong(v7 + 4, v8);

  }
  return v7;
}

- (id)version
{
  return CFSTR("1.0");
}

- (id)parentAppRecord
{
  return 0;
}

- (unsigned)extensionPointType
{
  return 2;
}

- (unsigned)TCCPolicy
{
  return 1;
}

- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_LSSynthesizedExtensionPointRecord;
  -[LSRecord _persistentIdentifierWithContext:tableID:unitID:unitBytes:](&v12, sel__persistentIdentifierWithContext_tableID_unitID_unitBytes_, a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[NSString dataUsingEncoding:](self->_identifier, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "appendData:", v9);

  v10 = (void *)objc_msgSend(v8, "copy");
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_LSSynthesizedExtensionPointRecord;
  -[LSRecord encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
}

- (_LSSynthesizedExtensionPointRecord)initWithCoder:(id)a3
{
  _LSSynthesizedExtensionPointRecord *v4;
  uint64_t v5;
  NSString *identifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_LSSynthesizedExtensionPointRecord;
  v4 = -[LSRecord initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v5 = objc_claimAutoreleasedReturnValue();
    identifier = v4->_identifier;
    v4->_identifier = (NSString *)v5;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_LSSynthesizedExtensionPointRecord;
  v4 = -[LSRecord copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
    objc_storeStrong(v4 + 4, self->_identifier);
  return v5;
}

- (id)identifier
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
