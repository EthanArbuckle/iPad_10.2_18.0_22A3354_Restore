@implementation _CNUILikenessFingerprintPersistedContactImpl

- (BOOL)isEqual:(id)a3
{
  _CNUILikenessFingerprintPersistedContactImpl *v4;
  NSString *contactIdentifier;
  BOOL v6;

  v4 = (_CNUILikenessFingerprintPersistedContactImpl *)a3;
  v6 = 1;
  if (self != v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (contactIdentifier = self->_contactIdentifier,
          (unint64_t)contactIdentifier | (unint64_t)v4->_contactIdentifier)
      && !-[NSString isEqual:](contactIdentifier, "isEqual:"))
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return objc_msgSend(MEMORY[0x1E0D13A78], "objectHash:", self->_contactIdentifier) + 527;
}

- (_CNUILikenessFingerprintPersistedContactImpl)initWithContactIdentifier:(id)a3
{
  id v4;
  _CNUILikenessFingerprintPersistedContactImpl *v5;
  uint64_t v6;
  NSString *contactIdentifier;
  _CNUILikenessFingerprintPersistedContactImpl *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNUILikenessFingerprintPersistedContactImpl;
  v5 = -[_CNUILikenessFingerprintPersistedContactImpl init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

- (_CNUILikenessFingerprintPersistedContactImpl)init
{
  _CNUILikenessFingerprintPersistedContactImpl *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (_CNUILikenessFingerprintPersistedContactImpl)initWithContact:(id)a3
{
  void *v4;
  _CNUILikenessFingerprintPersistedContactImpl *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_CNUILikenessFingerprintPersistedContactImpl initWithContactIdentifier:](self, "initWithContactIdentifier:", v4);

  return v5;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contactIdentifier"), self->_contactIdentifier);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)hasContactIdentifier:(id)a3
{
  return -[NSString isEqualToString:](self->_contactIdentifier, "isEqualToString:", a3);
}

- (NSString)contactIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

@end
