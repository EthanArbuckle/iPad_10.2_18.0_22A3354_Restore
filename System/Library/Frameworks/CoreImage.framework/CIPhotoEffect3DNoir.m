@implementation CIPhotoEffect3DNoir

- (int)_defaultVersion
{
  return dyld_program_sdk_at_least();
}

- (void)setDefaults
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIPhotoEffect3DNoir;
  -[CIPhotoEffect3D setDefaults](&v3, sel_setDefaults);
  -[CIPhotoEffect3DNoir setValue:forKey:](self, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[CIPhotoEffect3DNoir _defaultVersion](self, "_defaultVersion")), CFSTR("__inputVersion"));
  -[CIPhotoEffect3D setInputGrainAmount:](self, "setInputGrainAmount:", &unk_1E2F1A6A0);
}

- (int)_maxVersion
{
  return 1;
}

@end
