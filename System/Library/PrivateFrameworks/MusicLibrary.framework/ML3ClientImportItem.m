@implementation ML3ClientImportItem

- (ML3ClientImportItem)initWithMultiverseIdentifier:(id)a3 mediaItem:(id)a4
{
  id v7;
  id v8;
  ML3ClientImportItem *v9;
  ML3ClientImportItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ML3ClientImportItem;
  v9 = -[ML3ClientImportItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_multiverseIdentifier, a3);
    objc_storeStrong((id *)&v10->_mediaItem, a4);
  }

  return v10;
}

- (ML3ClientImportItem)initWithCoder:(id)a3
{
  id v4;
  ML3ClientImportItem *v5;
  uint64_t v6;
  MIPMultiverseIdentifier *multiverseIdentifier;
  uint64_t v8;
  MIPMediaItem *mediaItem;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ML3ClientImportItem;
  v5 = -[ML3ClientImportItem init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("multiverseID"));
    v6 = objc_claimAutoreleasedReturnValue();
    multiverseIdentifier = v5->_multiverseIdentifier;
    v5->_multiverseIdentifier = (MIPMultiverseIdentifier *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaItem"));
    v8 = objc_claimAutoreleasedReturnValue();
    mediaItem = v5->_mediaItem;
    v5->_mediaItem = (MIPMediaItem *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  MIPMultiverseIdentifier *multiverseIdentifier;
  id v5;

  multiverseIdentifier = self->_multiverseIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", multiverseIdentifier, CFSTR("multiverseID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaItem, CFSTR("mediaItem"));

}

- (MIPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (MIPMultiverseIdentifier)multiverseIdentifier
{
  return self->_multiverseIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_multiverseIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
