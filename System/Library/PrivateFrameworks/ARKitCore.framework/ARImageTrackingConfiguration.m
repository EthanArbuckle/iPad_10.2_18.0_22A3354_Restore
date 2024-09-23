@implementation ARImageTrackingConfiguration

- (ARImageTrackingConfiguration)init
{
  ARImageTrackingConfiguration *v2;
  uint64_t v3;
  NSSet *trackingImages;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ARImageTrackingConfiguration;
  v2 = -[ARConfiguration initPrivate](&v6, sel_initPrivate);
  if (v2)
  {
    v3 = objc_opt_new();
    trackingImages = v2->_trackingImages;
    v2->_trackingImages = (NSSet *)v3;

    -[ARConfiguration setAutoFocusEnabled:](v2, "setAutoFocusEnabled:", 1);
    -[ARImageTrackingConfiguration setMaximumNumberOfTrackedImages:](v2, "setMaximumNumberOfTrackedImages:", 1);
  }
  return v2;
}

- (void)setMaximumNumberOfTrackedImages:(NSInteger)maximumNumberOfTrackedImages
{
  self->_maximumNumberOfTrackedImages = +[ARODTHandleManager actualNumberOfImagesTracked:](ARODTHandleManager, "actualNumberOfImagesTracked:", maximumNumberOfTrackedImages);
}

+ (BOOL)isSupported
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ARImageTrackingConfiguration;
  return objc_msgSendSuper2(&v3, sel_isSupported);
}

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  return objc_msgSend((id)objc_opt_class(), "supportsFrameSemantics:", a3);
}

+ (id)supportedVideoFormats
{
  return +[AROrientationTrackingConfiguration supportedVideoFormats](AROrientationTrackingConfiguration, "supportedVideoFormats");
}

+ (id)recommendedVideoFormatFor4KResolution
{
  return +[ARWorldTrackingConfiguration recommendedVideoFormatFor4KResolution](ARWorldTrackingConfiguration, "recommendedVideoFormatFor4KResolution");
}

+ (id)recommendedVideoFormatForHighResolutionFrameCapturing
{
  return +[ARWorldTrackingConfiguration recommendedVideoFormatForHighResolutionFrameCapturing](ARWorldTrackingConfiguration, "recommendedVideoFormatForHighResolutionFrameCapturing");
}

- (void)createTechniques:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  ARImageTrackingTechnique *v7;
  void *v8;
  void *v9;
  ARImageTrackingTechnique *v10;
  ARParentTechnique *v11;
  void *v12;
  ARParentTechnique *v13;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ARImageTrackingConfiguration trackingImages](self, "trackingImages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = [ARImageTrackingTechnique alloc];
    -[ARImageTrackingConfiguration trackingImages](self, "trackingImages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ARImageTrackingTechnique initWithReferenceImages:maximumNumberOfTrackedImages:](v7, "initWithReferenceImages:maximumNumberOfTrackedImages:", v9, -[ARImageTrackingConfiguration maximumNumberOfTrackedImages](self, "maximumNumberOfTrackedImages"));

    v11 = [ARParentTechnique alloc];
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ARParentTechnique initWithParallelTechniques:](v11, "initWithParallelTechniques:", v12);

    objc_msgSend(v4, "addObject:", v13);
  }
  v14.receiver = self;
  v14.super_class = (Class)ARImageTrackingConfiguration;
  -[ARConfiguration createTechniques:](&v14, sel_createTechniques_, v4);

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSInteger v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARImageTrackingConfiguration;
  if (-[ARConfiguration isEqual:](&v13, sel_isEqual_, v6))
  {
    v7 = v6;
    -[ARImageTrackingConfiguration trackingImages](self, "trackingImages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trackingImages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == v9
      || (-[ARImageTrackingConfiguration trackingImages](self, "trackingImages"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "trackingImages"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "isEqual:", v4)))
    {
      v11 = -[ARImageTrackingConfiguration maximumNumberOfTrackedImages](self, "maximumNumberOfTrackedImages");
      v10 = v11 == objc_msgSend(v7, "maximumNumberOfTrackedImages");
      if (v8 == v9)
      {
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      v10 = 0;
    }

    goto LABEL_8;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ARImageTrackingConfiguration;
  v5 = -[ARConfiguration copyWithZone:](&v10, sel_copyWithZone_);
  -[ARImageTrackingConfiguration trackingImages](self, "trackingImages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)v5[14];
  v5[14] = v7;

  v5[15] = -[ARImageTrackingConfiguration maximumNumberOfTrackedImages](self, "maximumNumberOfTrackedImages");
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ARConfiguration descriptionWithoutBrackets](self, "descriptionWithoutBrackets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  -[ARImageTrackingConfiguration trackingImages](self, "trackingImages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[ARImageTrackingConfiguration trackingImages](self, "trackingImages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" trackingImages=[%@]"), v12);

  }
  -[ARImageTrackingConfiguration trackingImages](self, "trackingImages");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
    objc_msgSend(v6, "appendFormat:", CFSTR(" maximumNumberOfTrackedImages=%ld"), -[ARImageTrackingConfiguration maximumNumberOfTrackedImages](self, "maximumNumberOfTrackedImages"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (NSSet)trackingImages
{
  return self->_trackingImages;
}

- (void)setTrackingImages:(NSSet *)trackingImages
{
  objc_setProperty_nonatomic_copy(self, a2, trackingImages, 112);
}

- (NSInteger)maximumNumberOfTrackedImages
{
  return self->_maximumNumberOfTrackedImages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingImages, 0);
}

@end
