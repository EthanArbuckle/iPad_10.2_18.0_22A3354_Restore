@implementation CNPhotoPickerConfiguration

- (id)configurationBySettingAllowsPhotoCapture:(BOOL)a3
{
  CNPhotoPickerConfiguration *v4;
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  BOOL v11;
  BOOL v12;
  uint64_t v14;

  v4 = [CNPhotoPickerConfiguration alloc];
  v5 = -[CNPhotoPickerConfiguration includeContactImage](self, "includeContactImage");
  v6 = -[CNPhotoPickerConfiguration includeUnifiedContactImages](self, "includeUnifiedContactImages");
  v7 = -[CNPhotoPickerConfiguration includeFaces](self, "includeFaces");
  v8 = -[CNPhotoPickerConfiguration includeMonograms](self, "includeMonograms");
  v9 = -[CNPhotoPickerConfiguration includeAnimoji](self, "includeAnimoji");
  v10 = -[CNPhotoPickerConfiguration includeRecents](self, "includeRecents");
  v11 = -[CNPhotoPickerConfiguration includeEmoji](self, "includeEmoji");
  v12 = -[CNPhotoPickerConfiguration allowPhotoFromLibrary](self, "allowPhotoFromLibrary");
  BYTE4(v14) = 0;
  BYTE3(v14) = -[CNPhotoPickerConfiguration allowAnimojiCreation](self, "allowAnimojiCreation");
  BYTE2(v14) = v12;
  BYTE1(v14) = a3;
  LOBYTE(v14) = v11;
  return -[CNPhotoPickerConfiguration initWithIncludeContactImage:includeUnifiedContactImages:includeFaces:includeMonograms:includeAnimoji:includeRecents:includeEmoji:allowPhotoCapture:allowPhotoFromLibrary:allowAnimojiCreation:allowRotation:](v4, "initWithIncludeContactImage:includeUnifiedContactImages:includeFaces:includeMonograms:includeAnimoji:includeRecents:includeEmoji:allowPhotoCapture:allowPhotoFromLibrary:allowAnimojiCreation:allowRotation:", v5, v6, v7, v8, v9, v10, v14);
}

- (CNPhotoPickerConfiguration)initWithIncludeContactImage:(BOOL)a3 includeUnifiedContactImages:(BOOL)a4 includeFaces:(BOOL)a5 includeMonograms:(BOOL)a6 includeAnimoji:(BOOL)a7 includeRecents:(BOOL)a8 includeEmoji:(BOOL)a9 allowPhotoCapture:(BOOL)a10 allowPhotoFromLibrary:(BOOL)a11 allowAnimojiCreation:(BOOL)a12 allowRotation:(BOOL)a13
{
  CNPhotoPickerConfiguration *v19;
  CNPhotoPickerConfiguration *v20;
  CNPhotoPickerConfiguration *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CNPhotoPickerConfiguration;
  v19 = -[CNPhotoPickerConfiguration init](&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_includeContactImage = a3;
    v19->_includeUnifiedContactImages = a4;
    v19->_includeMonograms = a6;
    v19->_includeAnimoji = a7;
    v19->_includeFaces = a5;
    v19->_includeRecents = a8;
    v19->_includeEmoji = a9;
    v19->_allowPhotoCapture = a10;
    v19->_allowPhotoFromLibrary = a11;
    v19->_allowAnimojiCreation = a12;
    v19->_allowRotation = a13;
    v21 = v19;
  }

  return v20;
}

- (BOOL)includeContactImage
{
  return self->_includeContactImage;
}

- (BOOL)includeUnifiedContactImages
{
  return self->_includeUnifiedContactImages;
}

- (BOOL)includeFaces
{
  return self->_includeFaces;
}

- (BOOL)includeMonograms
{
  return self->_includeMonograms;
}

- (BOOL)includeAnimoji
{
  return self->_includeAnimoji;
}

- (BOOL)includeRecents
{
  return self->_includeRecents;
}

- (BOOL)includeEmoji
{
  return self->_includeEmoji;
}

- (BOOL)allowPhotoCapture
{
  return self->_allowPhotoCapture;
}

- (BOOL)allowPhotoFromLibrary
{
  return self->_allowPhotoFromLibrary;
}

- (BOOL)allowAnimojiCreation
{
  return self->_allowAnimojiCreation;
}

- (BOOL)allowRotation
{
  return self->_allowRotation;
}

+ (CNPhotoPickerConfiguration)contactsConfiguration
{
  uint64_t v3;

  BYTE4(v3) = 0;
  LODWORD(v3) = 16843009;
  return (CNPhotoPickerConfiguration *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithIncludeContactImage:includeUnifiedContactImages:includeFaces:includeMonograms:includeAnimoji:includeRecents:includeEmoji:allowPhotoCapture:allowPhotoFromLibrary:allowAnimojiCreation:allowRotation:", 1, 1, 1, 1, 1, 1, v3);
}

+ (CNPhotoPickerConfiguration)gameCenterConfiguration
{
  uint64_t v3;

  BYTE4(v3) = 1;
  LODWORD(v3) = 0x1000000;
  return (CNPhotoPickerConfiguration *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithIncludeContactImage:includeUnifiedContactImages:includeFaces:includeMonograms:includeAnimoji:includeRecents:includeEmoji:allowPhotoCapture:allowPhotoFromLibrary:allowAnimojiCreation:allowRotation:", 1, 0, 0, 1, 1, 0, v3);
}

@end
