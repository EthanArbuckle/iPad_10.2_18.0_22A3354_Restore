@implementation CKContextImageSource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)imageSourceForUIImage:(id)a3
{
  void *v3;
  CKContextImageSource *v4;

  +[CKContextExtractionUtil _renderImageToSurfaceWithImage:](CKContextExtractionUtil, "_renderImageToSurfaceWithImage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[CKContextImageSource initWithIOSurface:]([CKContextImageSource alloc], "initWithIOSurface:", v3);
  else
    v4 = 0;

  return v4;
}

- (CKContextImageSource)initWithIOSurface:(id)a3
{
  id v4;
  CKContextImageSource *v5;
  CKContextImageSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKContextImageSource;
  v5 = -[CKContextImageSource init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[CKContextImageSource setIoSurface:](v5, "setIoSurface:", v4);

  return v6;
}

- (CKContextImageSource)initWithIOSurface:(id)a3 cameraIntrinsics:(id)a4
{
  id v6;
  id v7;
  CKContextImageSource *v8;
  CKContextImageSource *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CKContextImageSource;
  v8 = -[CKContextImageSource init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CKContextImageSource setIoSurface:](v8, "setIoSurface:", v6);
    -[CKContextImageSource setCameraIntrinsics:](v9, "setCameraIntrinsics:", v7);
  }

  return v9;
}

- (CKContextImageSource)initWithCoder:(id)a3
{
  id v4;
  CKContextImageSource *v5;
  void *v6;
  void *v7;
  Class v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKContextImageSource;
  v5 = -[CKContextImageSource init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orientation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKContextImageSource setOrientation:](v5, "setOrientation:", objc_msgSend(v6, "unsignedIntValue"));
    -[CKContextImageSource setProfile:](v5, "setProfile:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("profile")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cameraIntrinsics"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKContextImageSource setCameraIntrinsics:](v5, "setCameraIntrinsics:", v7);

    v8 = NSClassFromString(CFSTR("IOSurface"));
    if (v8)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("iosurface"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKContextImageSource setIoSurface:](v5, "setIoSurface:", v9);

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  uint64_t orientation;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  orientation = self->_orientation;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedInt:", orientation);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("orientation"));

  objc_msgSend(v7, "encodeInteger:forKey:", self->_profile, CFSTR("profile"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_ioSurface, CFSTR("iosurface"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_cameraIntrinsics, CFSTR("iosurface"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CKContextImageSource ioSurface](self, "ioSurface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 31 * objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CKContextImageSource *v4;
  uint64_t v5;
  char v6;
  CKContextImageSource *v7;
  unint64_t v8;
  unsigned int v9;
  int64_t v10;
  void *v11;
  void *v12;

  v4 = (CKContextImageSource *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v8 = -[CKContextImageSource hash](self, "hash");
      if (v8 == -[CKContextImageSource hash](v7, "hash")
        && (v9 = -[CKContextImageSource orientation](self, "orientation"),
            v9 == -[CKContextImageSource orientation](v7, "orientation"))
        && (v10 = -[CKContextImageSource profile](self, "profile"), v10 == -[CKContextImageSource profile](v7, "profile")))
      {
        -[CKContextImageSource cameraIntrinsics](self, "cameraIntrinsics");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKContextImageSource cameraIntrinsics](v7, "cameraIntrinsics");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v11, "isEqual:", v12);

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (IOSurface)ioSurface
{
  return self->_ioSurface;
}

- (void)setIoSurface:(id)a3
{
  objc_storeStrong((id *)&self->_ioSurface, a3);
}

- (NSData)cameraIntrinsics
{
  return self->_cameraIntrinsics;
}

- (void)setCameraIntrinsics:(id)a3
{
  objc_storeStrong((id *)&self->_cameraIntrinsics, a3);
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

- (int64_t)profile
{
  return self->_profile;
}

- (void)setProfile:(int64_t)a3
{
  self->_profile = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraIntrinsics, 0);
  objc_storeStrong((id *)&self->_ioSurface, 0);
}

@end
