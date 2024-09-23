@implementation CNContactPoster

- (CNContactPoster)initWithPosterData:(id)a3 lastUsedDate:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  CNContactPoster *v11;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[CNContactPoster initWithIdentifier:posterData:lastUsedDate:](self, "initWithIdentifier:posterData:lastUsedDate:", v10, v8, v7);
  return v11;
}

- (CNContactPoster)initWithIdentifier:(id)a3 posterData:(id)a4 lastUsedDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNContactPoster *v11;
  NSString *v12;
  void *identifier;
  uint64_t v14;
  NSString *v15;
  CNContactPoster *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNContactPoster;
  v11 = -[CNContactPoster init](&v18, sel_init);
  if (v11)
  {
    if (objc_msgSend(v8, "length"))
    {
      v12 = (NSString *)v8;
      identifier = v11->_identifier;
      v11->_identifier = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      identifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(identifier, "UUIDString");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v11->_identifier;
      v11->_identifier = (NSString *)v14;

    }
    objc_storeStrong((id *)&v11->_posterData, a4);
    objc_storeStrong((id *)&v11->_lastUsedDate, a5);
    v16 = v11;
  }

  return v11;
}

- (id)copyWithNewPosterData:(id)a3
{
  id v4;
  CNContactPoster *v5;
  void *v6;
  void *v7;
  CNContactPoster *v8;
  void *v9;

  v4 = a3;
  v5 = [CNContactPoster alloc];
  -[CNContactPoster identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPoster lastUsedDate](self, "lastUsedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNContactPoster initWithIdentifier:posterData:lastUsedDate:](v5, "initWithIdentifier:posterData:lastUsedDate:", v6, v4, v7);

  -[CNContactPoster setIgnoredForRevert:](v8, "setIgnoredForRevert:", -[CNContactPoster ignoredForRevert](self, "ignoredForRevert"));
  -[CNContactPoster pairedImage](self, "pairedImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPoster setPairedImage:](v8, "setPairedImage:", v9);

  -[CNContactPoster setVisualFingerprintData:](v8, "setVisualFingerprintData:", 0);
  -[CNContactPoster setContentIsSensitive:](v8, "setContentIsSensitive:", -[CNContactPoster contentIsSensitive](self, "contentIsSensitive"));
  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)posterData
{
  return self->_posterData;
}

- (NSDate)lastUsedDate
{
  return self->_lastUsedDate;
}

- (BOOL)ignoredForRevert
{
  return self->_ignoredForRevert;
}

- (void)setIgnoredForRevert:(BOOL)a3
{
  self->_ignoredForRevert = a3;
}

- (NSData)visualFingerprintData
{
  return self->_visualFingerprintData;
}

- (void)setVisualFingerprintData:(id)a3
{
  objc_storeStrong((id *)&self->_visualFingerprintData, a3);
}

- (BOOL)contentIsSensitive
{
  return self->_contentIsSensitive;
}

- (void)setContentIsSensitive:(BOOL)a3
{
  self->_contentIsSensitive = a3;
}

- (CNContactImage)pairedImage
{
  return self->_pairedImage;
}

- (void)setPairedImage:(id)a3
{
  objc_storeStrong((id *)&self->_pairedImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedImage, 0);
  objc_storeStrong((id *)&self->_visualFingerprintData, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_posterData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
