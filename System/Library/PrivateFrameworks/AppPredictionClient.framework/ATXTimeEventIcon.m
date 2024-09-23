@implementation ATXTimeEventIcon

- (ATXTimeEventIcon)initWithBundleId:(id)a3
{
  id v4;
  ATXTimeEventIcon *v5;
  uint64_t v6;
  NSString *bundleId;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXTimeEventIcon;
  v5 = -[ATXTimeEventIcon init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

  }
  return v5;
}

- (ATXTimeEventIcon)initWithContactImageData:(id)a3
{
  id v4;
  ATXTimeEventIcon *v5;
  uint64_t v6;
  NSData *contactImageData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXTimeEventIcon;
  v5 = -[ATXTimeEventIcon init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contactImageData = v5->_contactImageData;
    v5->_contactImageData = (NSData *)v6;

  }
  return v5;
}

- (ATXTimeEventIcon)initWithSymbolImageName:(id)a3 backgroundColorName:(id)a4 foregroundColorName:(id)a5
{
  id v8;
  id v9;
  id v10;
  ATXTimeEventIcon *v11;
  uint64_t v12;
  NSString *symbolImageName;
  uint64_t v14;
  NSString *backgroundColorName;
  uint64_t v16;
  NSString *foregroundColorName;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXTimeEventIcon;
  v11 = -[ATXTimeEventIcon init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    symbolImageName = v11->_symbolImageName;
    v11->_symbolImageName = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    backgroundColorName = v11->_backgroundColorName;
    v11->_backgroundColorName = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    foregroundColorName = v11->_foregroundColorName;
    v11->_foregroundColorName = (NSString *)v16;

  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleId;
  id v5;

  bundleId = self->_bundleId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleId, CFSTR("bundle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactImageData, CFSTR("imageData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_symbolImageName, CFSTR("symbol"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_foregroundColorName, CFSTR("foreground"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundColorName, CFSTR("background"));

}

- (ATXTimeEventIcon)initWithCoder:(id)a3
{
  id v4;
  ATXTimeEventIcon *v5;
  uint64_t v6;
  NSString *bundleId;
  uint64_t v8;
  NSData *contactImageData;
  uint64_t v10;
  NSString *symbolImageName;
  uint64_t v12;
  NSString *foregroundColorName;
  uint64_t v14;
  NSString *backgroundColorName;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXTimeEventIcon;
  v5 = -[ATXTimeEventIcon init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundle"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
    v8 = objc_claimAutoreleasedReturnValue();
    contactImageData = v5->_contactImageData;
    v5->_contactImageData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbol"));
    v10 = objc_claimAutoreleasedReturnValue();
    symbolImageName = v5->_symbolImageName;
    v5->_symbolImageName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foreground"));
    v12 = objc_claimAutoreleasedReturnValue();
    foregroundColorName = v5->_foregroundColorName;
    v5->_foregroundColorName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("background"));
    v14 = objc_claimAutoreleasedReturnValue();
    backgroundColorName = v5->_backgroundColorName;
    v5->_backgroundColorName = (NSString *)v14;

  }
  return v5;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSData)contactImageData
{
  return self->_contactImageData;
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (NSString)backgroundColorName
{
  return self->_backgroundColorName;
}

- (NSString)foregroundColorName
{
  return self->_foregroundColorName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColorName, 0);
  objc_storeStrong((id *)&self->_backgroundColorName, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_contactImageData, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
