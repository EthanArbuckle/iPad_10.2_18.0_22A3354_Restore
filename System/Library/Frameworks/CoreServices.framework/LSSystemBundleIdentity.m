@implementation LSSystemBundleIdentity

- (LSSystemBundleIdentity)initWithIdentityString:(id)a3 parsedIdentityStringDictionary:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  LSSystemBundleIdentity *v9;
  uint64_t v10;
  NSString *bundleIdentifier;
  objc_super v13;

  v7 = a3;
  objc_msgSend(a4, "objectForKey:", CFSTR("b"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)LSSystemBundleIdentity;
  v9 = -[LSBundleIdentity initWithIdentityString:personaUniqueString:personaType:](&v13, sel_initWithIdentityString_personaUniqueString_personaType_, v7, 0, 4);

  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    bundleIdentifier = v9->_bundleIdentifier;
    v9->_bundleIdentifier = (NSString *)v10;

  }
  return v9;
}

- (LSSystemBundleIdentity)initWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  LSSystemBundleIdentity *v10;
  uint64_t v11;
  NSString *bundleIdentifier;
  objc_super v14;
  id v15;

  v4 = a3;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 4, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  if (v5)
  {
    v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
  }
  else
  {
    _LSDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[LSSystemBundleIdentity initWithBundleIdentifier:].cold.1((uint64_t)v6, v8);

    v7 = CFSTR("\"<ERROR>\");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{\"v\":2,\"b\":%@,\"it\":%lu}"), v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)LSSystemBundleIdentity;
  v10 = -[LSBundleIdentity initWithIdentityString:personaUniqueString:personaType:](&v14, sel_initWithIdentityString_personaUniqueString_personaType_, v9, 0, 4);

  if (v10)
  {
    v11 = objc_msgSend(v4, "copy");
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

  }
  return v10;
}

- (id)bundleIdentifier
{
  return self->_bundleIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LSSystemBundleIdentity;
  v4 = a3;
  -[LSBundleIdentity encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"), v5.receiver, v5.super_class);

}

- (LSSystemBundleIdentity)initWithCoder:(id)a3
{
  id v4;
  LSSystemBundleIdentity *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSSystemBundleIdentity;
  v5 = -[LSBundleIdentity initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LSSystemBundleIdentity;
  return -[NSString hash](self->_bundleIdentifier, "hash") ^ __ROR8__(-[LSBundleIdentity hash](&v3, sel_hash), 56);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *bundleIdentifier;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    bundleIdentifier = self->_bundleIdentifier;
    if (bundleIdentifier == (NSString *)v4[4])
      v6 = 1;
    else
      v6 = -[NSString isEqualToString:](bundleIdentifier, "isEqualToString:");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)initWithBundleIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "could not escape bookmark string: %@", (uint8_t *)&v2, 0xCu);
}

@end
