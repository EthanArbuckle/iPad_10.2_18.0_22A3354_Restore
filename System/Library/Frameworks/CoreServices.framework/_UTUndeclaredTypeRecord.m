@implementation _UTUndeclaredTypeRecord

- (id)_initWithContext:(LSContext *)a3 identifier:(id)a4
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UTUndeclaredTypeRecord;
  v5 = -[LSRecord _initWithContext:tableID:unitID:](&v9, sel__initWithContext_tableID_unitID_);
  if (v5)
  {
    v6 = objc_msgSend(a4, "copy");
    v7 = (void *)v5[4];
    v5[4] = v6;

  }
  return v5;
}

- (id)version
{
  return 0;
}

- (BOOL)isInPublicDomain
{
  void *v2;
  char v3;

  -[_UTUndeclaredTypeRecord identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("public."));

  return v3;
}

- (id)declaration
{
  NSString *identifier;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  identifier = self->_identifier;
  v4 = CFSTR("UTTypeIdentifier");
  v5[0] = identifier;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)conformsToTypeIdentifier:(id)a3
{
  __CFString *v4;

  v4 = (__CFString *)a3;
  LOBYTE(self) = UTTypeEqual(v4, (CFStringRef)-[_UTUndeclaredTypeRecord identifier](self, "identifier")) != 0;

  return (char)self;
}

- (id)_persistentIdentifierWithContext:(LSContext *)a3 tableID:(unsigned int)a4 unitID:(unsigned int)a5 unitBytes:(const void *)a6
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UTUndeclaredTypeRecord;
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
  v5.super_class = (Class)_UTUndeclaredTypeRecord;
  -[LSRecord encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
}

- (_UTUndeclaredTypeRecord)initWithCoder:(id)a3
{
  _UTUndeclaredTypeRecord *v4;
  uint64_t v5;
  NSString *identifier;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UTUndeclaredTypeRecord;
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

- (id)awakeAfterUsingCoder:(id)a3
{
  _UTUndeclaredTypeRecord *v3;
  void *v4;
  void *v5;
  _UTUndeclaredTypeRecord *v6;

  v3 = self;
  -[_UTUndeclaredTypeRecord identifier](v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UTTypeRecord typeRecordWithIdentifier:](UTTypeRecord, "typeRecordWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v3;
  if (v5)
  {
    v6 = v5;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UTUndeclaredTypeRecord;
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
