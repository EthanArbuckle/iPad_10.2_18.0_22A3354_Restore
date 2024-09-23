@implementation MOSuggestionAssetPhotoMoments

- (MOSuggestionAssetPhotoMoments)initWithKeyPhoto:(id)a3 curatedPhotos:(id)a4
{
  id v7;
  id v8;
  MOSuggestionAssetPhotoMoments *v9;
  MOSuggestionAssetPhotoMoments *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOSuggestionAssetPhotoMoments;
  v9 = -[MOSuggestionAssetPhotoMoments init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyPhoto, a3);
    objc_storeStrong((id *)&v10->_curatedPhotos, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *curatedPhotos;
  id v5;

  curatedPhotos = self->_curatedPhotos;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", curatedPhotos, CFSTR("photos"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_keyPhoto, CFSTR("keyPhotos"));

}

- (MOSuggestionAssetPhotoMoments)initWithCoder:(id)a3
{
  id v4;
  MOSuggestionAssetPhotoMoments *v5;
  uint64_t v6;
  UIImage *keyPhoto;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *curatedPhotos;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MOSuggestionAssetPhotoMoments;
  v5 = -[MOSuggestionAssetPhotoMoments init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyPhotos"));
    v6 = objc_claimAutoreleasedReturnValue();
    keyPhoto = v5->_keyPhoto;
    v5->_keyPhoto = (UIImage *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("photos"));
    v11 = objc_claimAutoreleasedReturnValue();
    curatedPhotos = v5->_curatedPhotos;
    v5->_curatedPhotos = (NSArray *)v11;

  }
  return v5;
}

- (UIImage)keyPhoto
{
  return self->_keyPhoto;
}

- (NSArray)curatedPhotos
{
  return self->_curatedPhotos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curatedPhotos, 0);
  objc_storeStrong((id *)&self->_keyPhoto, 0);
}

@end
