@implementation CNSNaPSuggestionsGalleryName

- (CNSNaPSuggestionsGalleryName)initWithGivenName:(id)a3 familyName:(id)a4
{
  id v7;
  id v8;
  CNSNaPSuggestionsGalleryName *v9;
  CNSNaPSuggestionsGalleryName *v10;
  CNSNaPSuggestionsGalleryName *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNSNaPSuggestionsGalleryName;
  v9 = -[CNSNaPSuggestionsGalleryName init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_given, a3);
    objc_storeStrong((id *)&v10->_family, a4);
    v11 = v10;
  }

  return v10;
}

- (NSString)given
{
  return self->_given;
}

- (void)setGiven:(id)a3
{
  objc_storeStrong((id *)&self->_given, a3);
}

- (NSString)family
{
  return self->_family;
}

- (void)setFamily:(id)a3
{
  objc_storeStrong((id *)&self->_family, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_family, 0);
  objc_storeStrong((id *)&self->_given, 0);
}

@end
