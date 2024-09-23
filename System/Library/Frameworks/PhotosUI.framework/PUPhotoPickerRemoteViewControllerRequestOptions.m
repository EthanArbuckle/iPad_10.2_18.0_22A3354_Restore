@implementation PUPhotoPickerRemoteViewControllerRequestOptions

- (PUPhotoPickerRemoteViewControllerRequestOptions)initWithRequestedClassName:(id)a3 photoPickerProperties:(id)a4
{
  id v7;
  id v8;
  PUPhotoPickerRemoteViewControllerRequestOptions *v9;
  PUPhotoPickerRemoteViewControllerRequestOptions *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUPhotoPickerRemoteViewControllerRequestOptions;
  v9 = -[PUPhotoPickerRemoteViewControllerRequestOptions init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestedClassName, a3);
    objc_storeStrong((id *)&v10->_photoPickerProperties, a4);
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_onboardingHeaderDismissedBefore = objc_msgSend(v11, "BOOLForKey:", CFSTR("com.apple.photos.picker.header"));

  }
  return v10;
}

- (PUPhotoPickerRemoteViewControllerRequestOptions)initWithRequestedIdentifier:(id)a3 photoPickerProperties:(id)a4
{
  id v7;
  id v8;
  PUPhotoPickerRemoteViewControllerRequestOptions *v9;
  PUPhotoPickerRemoteViewControllerRequestOptions *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PUPhotoPickerRemoteViewControllerRequestOptions;
  v9 = -[PUPhotoPickerRemoteViewControllerRequestOptions init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestedIdentifier, a3);
    objc_storeStrong((id *)&v10->_photoPickerProperties, a4);
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_onboardingHeaderDismissedBefore = objc_msgSend(v11, "BOOLForKey:", CFSTR("com.apple.photos.picker.header"));

  }
  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoPickerRemoteViewControllerRequestOptions requestedClassName](self, "requestedClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoPickerRemoteViewControllerRequestOptions requestedIdentifier](self, "requestedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ requestedClassName %@ requestedIdentifier %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PUPhotoPickerRemoteViewControllerRequestOptions)initWithCoder:(id)a3
{
  id v4;
  PUPhotoPickerRemoteViewControllerRequestOptions *v5;
  uint64_t v6;
  NSUUID *requestedIdentifier;
  uint64_t v8;
  NSString *requestedClassName;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDictionary *photoPickerProperties;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PUPhotoPickerRemoteViewControllerRequestOptions;
  v5 = -[PUPhotoPickerRemoteViewControllerRequestOptions init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestedIdentifier = v5->_requestedIdentifier;
    v5->_requestedIdentifier = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedClassName"));
    v8 = objc_claimAutoreleasedReturnValue();
    requestedClassName = v5->_requestedClassName;
    v5->_requestedClassName = (NSString *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("photoPickerProperties"));
    v16 = objc_claimAutoreleasedReturnValue();
    photoPickerProperties = v5->_photoPickerProperties;
    v5->_photoPickerProperties = (NSDictionary *)v16;

    v5->_onboardingHeaderDismissedBefore = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onboardingHeader"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *requestedIdentifier;
  id v5;

  requestedIdentifier = self->_requestedIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestedIdentifier, CFSTR("requestedIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestedClassName, CFSTR("requestedClassName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_photoPickerProperties, CFSTR("photoPickerProperties"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_onboardingHeaderDismissedBefore, CFSTR("onboardingHeader"));

}

- (unint64_t)savingOptions
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PUPhotoPickerRemoteViewControllerRequestOptions photoPickerProperties](self, "photoPickerProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BEBEB28]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  return v4;
}

- (NSArray)mediaTypes
{
  void *v2;
  void *v3;

  -[PUPhotoPickerRemoteViewControllerRequestOptions photoPickerProperties](self, "photoPickerProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BEBEAE0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)allowsMultipleSelection
{
  void *v2;
  void *v3;

  -[PUPhotoPickerRemoteViewControllerRequestOptions photoPickerProperties](self, "photoPickerProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BEBEAB0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (unint64_t)multipleSelectionLimit
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PUPhotoPickerRemoteViewControllerRequestOptions photoPickerProperties](self, "photoPickerProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BEBEAE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  return v4;
}

- (BOOL)requiresPickingConfirmation
{
  void *v4;
  void *v5;

  if (-[PUPhotoPickerRemoteViewControllerRequestOptions showsFileSizePicker](self, "showsFileSizePicker"))
    return 1;
  -[PUPhotoPickerRemoteViewControllerRequestOptions photoPickerProperties](self, "photoPickerProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_UIImagePickerControllerRequiresPickingConfirmation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "BOOLValue");
  return (char)v4;
}

- (BOOL)showsFileSizePicker
{
  void *v2;
  void *v3;

  -[PUPhotoPickerRemoteViewControllerRequestOptions photoPickerProperties](self, "photoPickerProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("_UIImagePickerControllerShowsFileSizePicker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (BOOL)showsPrompt
{
  void *v2;
  void *v3;

  -[PUPhotoPickerRemoteViewControllerRequestOptions photoPickerProperties](self, "photoPickerProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BEBEB00]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (BOOL)convertAutoloopsToGIF
{
  void *v2;
  void *v3;

  -[PUPhotoPickerRemoteViewControllerRequestOptions photoPickerProperties](self, "photoPickerProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("_UIImagePickerControllerConvertAutoloopsToGIF"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (int64_t)modalPresentationStyle
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PUPhotoPickerRemoteViewControllerRequestOptions photoPickerProperties](self, "photoPickerProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("_UIImagePickerControllerModalPresentationStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)sourceType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PUPhotoPickerRemoteViewControllerRequestOptions photoPickerProperties](self, "photoPickerProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BEBEB08]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (NSUUID)requestedIdentifier
{
  return self->_requestedIdentifier;
}

- (void)setRequestedIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestedIdentifier, a3);
}

- (NSString)requestedClassName
{
  return self->_requestedClassName;
}

- (void)setRequestedClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)onboardingHeaderDismissedBefore
{
  return self->_onboardingHeaderDismissedBefore;
}

- (NSDictionary)photoPickerProperties
{
  return self->_photoPickerProperties;
}

- (void)setPhotoPickerProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoPickerProperties, 0);
  objc_storeStrong((id *)&self->_requestedClassName, 0);
  objc_storeStrong((id *)&self->_requestedIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
