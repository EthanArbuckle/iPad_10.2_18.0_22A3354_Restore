@implementation CMIModuleCalibration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklevelShadingCorrectionThumbnails, 0);
  objc_storeStrong((id *)&self->_quadraShadingFPNCorrectionImage, 0);
  objc_storeStrong((id *)&self->_shadingFPNCorrectionImage, 0);
}

- (CMIShadingFPNCorrectionImage)shadingFPNCorrectionImage
{
  return self->_shadingFPNCorrectionImage;
}

- (CMIShadingFPNCorrectionImage)quadraShadingFPNCorrectionImage
{
  return self->_quadraShadingFPNCorrectionImage;
}

- (CMIBlackLevelShadingCorrectionThumbnails)blacklevelShadingCorrectionThumbnails
{
  return self->_blacklevelShadingCorrectionThumbnails;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CMIModuleCalibration *v4;

  v4 = objc_alloc_init(CMIModuleCalibration);
  objc_storeStrong((id *)&v4->_shadingFPNCorrectionImage, self->_shadingFPNCorrectionImage);
  objc_storeStrong((id *)&v4->_quadraShadingFPNCorrectionImage, self->_quadraShadingFPNCorrectionImage);
  objc_storeStrong((id *)&v4->_blacklevelShadingCorrectionThumbnails, self->_blacklevelShadingCorrectionThumbnails);
  return v4;
}

- (CMIModuleCalibration)initWithCoder:(id)a3
{
  id v4;
  CMIModuleCalibration *v5;
  uint64_t v6;
  CMIShadingFPNCorrectionImage *shadingFPNCorrectionImage;
  uint64_t v8;
  CMIShadingFPNCorrectionImage *quadraShadingFPNCorrectionImage;
  uint64_t v10;
  CMIBlackLevelShadingCorrectionThumbnails *blacklevelShadingCorrectionThumbnails;
  CMIModuleCalibration *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CMIModuleCalibration;
  v5 = -[CMIModuleCalibration init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ShadingFPNCorrectionImage"));
    v6 = objc_claimAutoreleasedReturnValue();
    shadingFPNCorrectionImage = v5->_shadingFPNCorrectionImage;
    v5->_shadingFPNCorrectionImage = (CMIShadingFPNCorrectionImage *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("QuadraShadingFPNCorrectionImage"));
    v8 = objc_claimAutoreleasedReturnValue();
    quadraShadingFPNCorrectionImage = v5->_quadraShadingFPNCorrectionImage;
    v5->_quadraShadingFPNCorrectionImage = (CMIShadingFPNCorrectionImage *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BlackLevelShadingCorrectionThumbnails"));
    v10 = objc_claimAutoreleasedReturnValue();
    blacklevelShadingCorrectionThumbnails = v5->_blacklevelShadingCorrectionThumbnails;
    v5->_blacklevelShadingCorrectionThumbnails = (CMIBlackLevelShadingCorrectionThumbnails *)v10;

    v12 = v5;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[CMIShadingFPNCorrectionImage pixelBuffer](self->_shadingFPNCorrectionImage, "pixelBuffer"))
    objc_msgSend(v6, "encodeObject:forKey:", self->_shadingFPNCorrectionImage, CFSTR("ShadingFPNCorrectionImage"));
  if (-[CMIShadingFPNCorrectionImage pixelBuffer](self->_quadraShadingFPNCorrectionImage, "pixelBuffer"))
    objc_msgSend(v6, "encodeObject:forKey:", self->_quadraShadingFPNCorrectionImage, CFSTR("QuadraShadingFPNCorrectionImage"));
  -[CMIBlackLevelShadingCorrectionThumbnails metadata](self->_blacklevelShadingCorrectionThumbnails, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4)
  {
    objc_msgSend(v6, "encodeObject:forKey:", self->_blacklevelShadingCorrectionThumbnails, CFSTR("BlackLevelShadingCorrectionThumbnails"));
    v5 = v6;
  }

}

- (void)setShadingFPNCorrectionImage:(id)a3
{
  objc_storeStrong((id *)&self->_shadingFPNCorrectionImage, a3);
}

- (void)setQuadraShadingFPNCorrectionImage:(id)a3
{
  objc_storeStrong((id *)&self->_quadraShadingFPNCorrectionImage, a3);
}

- (void)setBlacklevelShadingCorrectionThumbnails:(id)a3
{
  objc_storeStrong((id *)&self->_blacklevelShadingCorrectionThumbnails, a3);
}

@end
