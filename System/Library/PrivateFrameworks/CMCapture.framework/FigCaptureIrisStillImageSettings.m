@implementation FigCaptureIrisStillImageSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigCaptureIrisStillImageSettings;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", -[FigCaptureStillImageSettings description](&v7, sel_description));
  v4 = *((unsigned int *)&self->super._smartStyleReversibilitySupported + 1);
  if ((_DWORD)v4)
  {
    if (self->_movieLevelMetadataForOriginalImage)
    {
      v5 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" Original-OverCapture:%@"), self->_movieLevelMetadataForOriginalImage);
      v4 = *((unsigned int *)&self->super._smartStyleReversibilitySupported + 1);
    }
    else
    {
      v5 = &stru_1E4928818;
    }
    objc_msgSend(v3, "appendFormat:", CFSTR(" IRIS:%d Original:%@%@ <%@>%@"), v4, self->_movieRecordingSettings, v5, *(_QWORD *)&self->_movieMode, objc_msgSend(*(id *)&self->_nonDestructiveCropSize.height, "description"));
  }
  return v3;
}

- (FigCaptureIrisStillImageSettings)initWithCoder:(id)a3
{
  char *v4;
  void *AllowedClassSetForMetadataItems;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FigCaptureIrisStillImageSettings;
  v4 = -[FigCaptureStillImageSettings initWithCoder:](&v11, sel_initWithCoder_);
  if (v4)
  {
    AllowedClassSetForMetadataItems = (void *)FigCaptureMetadataUtilitiesCreateAllowedClassSetForMetadataItems();
    *((_DWORD *)v4 + 127) = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("movieMode"));
    *((_QWORD *)v4 + 64) = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("movieRecordingSettings"));
    *((_QWORD *)v4 + 65) = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("movieURLForOriginalImage"));
    *((_QWORD *)v4 + 66) = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", AllowedClassSetForMetadataItems, CFSTR("movieLevelMetadataForOriginalImage"));
    *((_QWORD *)v4 + 67) = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spatialOverCaptureMovieURLForOriginalImage"));
    *((_QWORD *)v4 + 68) = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", AllowedClassSetForMetadataItems, CFSTR("spatialOverCaptureMovieLevelMetadataForOriginalImage"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0), CFSTR("nonDestructiveCropSize"));
    CGSizeMakeWithDictionaryRepresentation(v9, (CGSize *)(v4 + 552));

    *((_QWORD *)v4 + 71) = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("semanticStyle"));
  }
  return (FigCaptureIrisStillImageSettings *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  FigCaptureMovieFileRecordingSettings *movieRecordingSettings;
  NSURL *movieURLForOriginalImage;
  NSArray *movieLevelMetadataForOriginalImage;
  NSURL *spatialOverCaptureMovieURLForOriginalImage;
  CFDictionaryRef DictionaryRepresentation;
  CGFloat height;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FigCaptureIrisStillImageSettings;
  -[FigCaptureStillImageSettings encodeWithCoder:](&v12, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInt32:forKey:", *((unsigned int *)&self->super._smartStyleReversibilitySupported + 1), CFSTR("movieMode"));
  v5 = *(_QWORD *)&self->_movieMode;
  if (v5)
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("movieRecordingSettings"));
  movieRecordingSettings = self->_movieRecordingSettings;
  if (movieRecordingSettings)
    objc_msgSend(a3, "encodeObject:forKey:", movieRecordingSettings, CFSTR("movieURLForOriginalImage"));
  movieURLForOriginalImage = self->_movieURLForOriginalImage;
  if (movieURLForOriginalImage)
    objc_msgSend(a3, "encodeObject:forKey:", movieURLForOriginalImage, CFSTR("movieLevelMetadataForOriginalImage"));
  movieLevelMetadataForOriginalImage = self->_movieLevelMetadataForOriginalImage;
  if (movieLevelMetadataForOriginalImage)
    objc_msgSend(a3, "encodeObject:forKey:", movieLevelMetadataForOriginalImage, CFSTR("spatialOverCaptureMovieURLForOriginalImage"));
  spatialOverCaptureMovieURLForOriginalImage = self->_spatialOverCaptureMovieURLForOriginalImage;
  if (spatialOverCaptureMovieURLForOriginalImage)
    objc_msgSend(a3, "encodeObject:forKey:", spatialOverCaptureMovieURLForOriginalImage, CFSTR("spatialOverCaptureMovieLevelMetadataForOriginalImage"));
  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(*(CGSize *)&self->_spatialOverCaptureMovieLevelMetadataForOriginalImage);
  objc_msgSend(a3, "encodeObject:forKey:", DictionaryRepresentation, CFSTR("nonDestructiveCropSize"));

  height = self->_nonDestructiveCropSize.height;
  if (height != 0.0)
    objc_msgSend(a3, "encodeObject:forKey:", *(_QWORD *)&height, CFSTR("semanticStyle"));
}

- (void)setSemanticStyle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 568);
}

- (FigCaptureSemanticStyle)semanticStyle
{
  return *(FigCaptureSemanticStyle **)&self->_nonDestructiveCropSize.height;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureIrisStillImageSettings;
  -[FigCaptureStillImageSettings dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCaptureIrisStillImageSettings;
  v4 = -[FigCaptureStillImageSettings copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setMovieMode:", *((unsigned int *)&self->super._smartStyleReversibilitySupported + 1));
  objc_msgSend(v4, "setMovieRecordingSettings:", *(_QWORD *)&self->_movieMode);
  objc_msgSend(v4, "setMovieURLForOriginalImage:", self->_movieRecordingSettings);
  objc_msgSend(v4, "setMovieLevelMetadataForOriginalImage:", self->_movieURLForOriginalImage);
  objc_msgSend(v4, "setSpatialOverCaptureMovieURLForOriginalImage:", self->_movieLevelMetadataForOriginalImage);
  objc_msgSend(v4, "setSpatialOverCaptureMovieLevelMetadataForOriginalImage:", self->_spatialOverCaptureMovieURLForOriginalImage);
  objc_msgSend(v4, "setNonDestructiveCropSize:", *(double *)&self->_spatialOverCaptureMovieLevelMetadataForOriginalImage, self->_nonDestructiveCropSize.width);
  objc_msgSend(v4, "setSemanticStyle:", *(_QWORD *)&self->_nonDestructiveCropSize.height);
  return v4;
}

- (int)movieMode
{
  return *((_DWORD *)&self->super._smartStyleReversibilitySupported + 1);
}

- (void)setMovieMode:(int)a3
{
  *((_DWORD *)&self->super._smartStyleReversibilitySupported + 1) = a3;
}

- (FigCaptureMovieFileRecordingSettings)movieRecordingSettings
{
  return *(FigCaptureMovieFileRecordingSettings **)&self->_movieMode;
}

- (void)setMovieRecordingSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (NSURL)movieURLForOriginalImage
{
  return (NSURL *)self->_movieRecordingSettings;
}

- (void)setMovieURLForOriginalImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (NSArray)movieLevelMetadataForOriginalImage
{
  return (NSArray *)self->_movieURLForOriginalImage;
}

- (void)setMovieLevelMetadataForOriginalImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (NSURL)spatialOverCaptureMovieURLForOriginalImage
{
  return (NSURL *)self->_movieLevelMetadataForOriginalImage;
}

- (void)setSpatialOverCaptureMovieURLForOriginalImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (NSArray)spatialOverCaptureMovieLevelMetadataForOriginalImage
{
  return (NSArray *)self->_spatialOverCaptureMovieURLForOriginalImage;
}

- (void)setSpatialOverCaptureMovieLevelMetadataForOriginalImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (CGSize)nonDestructiveCropSize
{
  NSArray *spatialOverCaptureMovieLevelMetadataForOriginalImage;
  double width;
  CGSize result;

  spatialOverCaptureMovieLevelMetadataForOriginalImage = self->_spatialOverCaptureMovieLevelMetadataForOriginalImage;
  width = self->_nonDestructiveCropSize.width;
  result.height = width;
  result.width = *(double *)&spatialOverCaptureMovieLevelMetadataForOriginalImage;
  return result;
}

- (void)setNonDestructiveCropSize:(CGSize)a3
{
  *(CGSize *)&self->_spatialOverCaptureMovieLevelMetadataForOriginalImage = a3;
}

@end
