@implementation SHMediaLibraryTrackBuilder

- (SHMediaLibraryTrackBuilder)initWithCreationDate:(id)a3
{
  id v5;
  SHMediaLibraryTrackBuilder *v6;
  SHMediaLibraryTrackBuilder *v7;
  uint64_t v8;
  NSSet *labels;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHMediaLibraryTrackBuilder;
  v6 = -[SHMediaLibraryTrackBuilder init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_creationDate, a3);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    labels = v7->_labels;
    v7->_labels = (NSSet *)v8;

  }
  return v7;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSString)recognitionIdentifier
{
  return self->_recognitionIdentifier;
}

- (void)setRecognitionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SHShazamKey)shazamKey
{
  return self->_shazamKey;
}

- (void)setShazamKey:(id)a3
{
  objc_storeStrong((id *)&self->_shazamKey, a3);
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)providerIdentifier
{
  return self->_providerIdentifier;
}

- (void)setProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSURL)artworkURL
{
  return self->_artworkURL;
}

- (void)setArtworkURL:(id)a3
{
  objc_storeStrong((id *)&self->_artworkURL, a3);
}

- (NSURL)shazamURL
{
  return self->_shazamURL;
}

- (void)setShazamURL:(id)a3
{
  objc_storeStrong((id *)&self->_shazamURL, a3);
}

- (NSSet)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_storeStrong((id *)&self->_labels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_shazamURL, 0);
  objc_storeStrong((id *)&self->_artworkURL, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_providerIdentifier, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_shazamKey, 0);
  objc_storeStrong((id *)&self->_recognitionIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
