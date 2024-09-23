@implementation CVACameraCalibration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)classes
{
  if (qword_254A6EE90 != -1)
    dispatch_once(&qword_254A6EE90, &unk_24CA35F40);
  return (id)qword_254A6EE88;
}

- (CVACameraCalibration)initWithCoder:(id)a3
{
  id v4;
  CVACameraCalibration *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CVACameraCalibration;
  v5 = -[CVACameraCalibration init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BC8864]();
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("id"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACameraCalibration setMetadataID:](v5, "setMetadataID:", v7);

    -[CVACameraCalibration setImageWidth:](v5, "setImageWidth:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("w")));
    -[CVACameraCalibration setImageHeight:](v5, "setImageHeight:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("h")));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("px"));
    -[CVACameraCalibration setPrincipalPointX:](v5, "setPrincipalPointX:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("py"));
    -[CVACameraCalibration setPrincipalPointY:](v5, "setPrincipalPointY:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fx"));
    -[CVACameraCalibration setFocalLengthX:](v5, "setFocalLengthX:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fy"));
    -[CVACameraCalibration setFocalLengthY:](v5, "setFocalLengthY:");
    -[CVACameraCalibration setLensDistortionModel:](v5, "setLensDistortionModel:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dm")));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("rd"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACameraCalibration setRadialDistortion:](v5, "setRadialDistortion:", v8);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("td"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACameraCalibration setTangentialDistortion:](v5, "setTangentialDistortion:", v9);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("lo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACameraCalibration setLensOffset:](v5, "setLensOffset:", v10);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("co"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACameraCalibration setChipOffset:](v5, "setChipOffset:", v11);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tc"));
    -[CVACameraCalibration setTimestampCorrection:](v5, "setTimestampCorrection:");
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("rt"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACameraCalibration setReadoutTime:](v5, "setReadoutTime:", v12);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("r"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACameraCalibration setCameraToIMURotation:](v5, "setCameraToIMURotation:", v13);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("t"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CVACameraCalibration setCameraToIMUTranslation:](v5, "setCameraToIMUTranslation:", v14);

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)MEMORY[0x212BC8864]();
  -[CVACameraCalibration metadataID](self, "metadataID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("id"));

  objc_msgSend(v13, "encodeInteger:forKey:", -[CVACameraCalibration imageWidth](self, "imageWidth"), CFSTR("w"));
  objc_msgSend(v13, "encodeInteger:forKey:", -[CVACameraCalibration imageHeight](self, "imageHeight"), CFSTR("h"));
  -[CVACameraCalibration principalPointX](self, "principalPointX");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("px"));
  -[CVACameraCalibration principalPointY](self, "principalPointY");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("py"));
  -[CVACameraCalibration focalLengthX](self, "focalLengthX");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("fx"));
  -[CVACameraCalibration focalLengthY](self, "focalLengthY");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("fy"));
  objc_msgSend(v13, "encodeInteger:forKey:", -[CVACameraCalibration lensDistortionModel](self, "lensDistortionModel"), CFSTR("dm"));
  -[CVACameraCalibration radialDistortion](self, "radialDistortion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("rd"));

  -[CVACameraCalibration tangentialDistortion](self, "tangentialDistortion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("td"));

  -[CVACameraCalibration lensOffset](self, "lensOffset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("lo"));

  -[CVACameraCalibration chipOffset](self, "chipOffset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("co"));

  -[CVACameraCalibration timestampCorrection](self, "timestampCorrection");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("tc"));
  -[CVACameraCalibration readoutTime](self, "readoutTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("rt"));

  -[CVACameraCalibration cameraToIMURotation](self, "cameraToIMURotation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("r"));

  -[CVACameraCalibration cameraToIMUTranslation](self, "cameraToIMUTranslation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("t"));

  objc_autoreleasePoolPop(v4);
}

- (NSString)metadataID
{
  return self->_metadataID;
}

- (void)setMetadataID:(id)a3
{
  objc_storeStrong((id *)&self->_metadataID, a3);
}

- (unsigned)imageWidth
{
  return self->_imageWidth;
}

- (void)setImageWidth:(unsigned int)a3
{
  self->_imageWidth = a3;
}

- (unsigned)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageHeight:(unsigned int)a3
{
  self->_imageHeight = a3;
}

- (double)principalPointX
{
  return self->_principalPointX;
}

- (void)setPrincipalPointX:(double)a3
{
  self->_principalPointX = a3;
}

- (double)principalPointY
{
  return self->_principalPointY;
}

- (void)setPrincipalPointY:(double)a3
{
  self->_principalPointY = a3;
}

- (double)focalLengthX
{
  return self->_focalLengthX;
}

- (void)setFocalLengthX:(double)a3
{
  self->_focalLengthX = a3;
}

- (double)focalLengthY
{
  return self->_focalLengthY;
}

- (void)setFocalLengthY:(double)a3
{
  self->_focalLengthY = a3;
}

- (int64_t)lensDistortionModel
{
  return self->_lensDistortionModel;
}

- (void)setLensDistortionModel:(int64_t)a3
{
  self->_lensDistortionModel = a3;
}

- (NSArray)radialDistortion
{
  return self->_radialDistortion;
}

- (void)setRadialDistortion:(id)a3
{
  objc_storeStrong((id *)&self->_radialDistortion, a3);
}

- (NSArray)tangentialDistortion
{
  return self->_tangentialDistortion;
}

- (void)setTangentialDistortion:(id)a3
{
  objc_storeStrong((id *)&self->_tangentialDistortion, a3);
}

- (NSArray)lensOffset
{
  return self->_lensOffset;
}

- (void)setLensOffset:(id)a3
{
  objc_storeStrong((id *)&self->_lensOffset, a3);
}

- (NSArray)chipOffset
{
  return self->_chipOffset;
}

- (void)setChipOffset:(id)a3
{
  objc_storeStrong((id *)&self->_chipOffset, a3);
}

- (double)timestampCorrection
{
  return self->_timestampCorrection;
}

- (void)setTimestampCorrection:(double)a3
{
  self->_timestampCorrection = a3;
}

- (NSNumber)readoutTime
{
  return self->_readoutTime;
}

- (void)setReadoutTime:(id)a3
{
  objc_storeStrong((id *)&self->_readoutTime, a3);
}

- (NSArray)cameraToIMURotation
{
  return self->_cameraToIMURotation;
}

- (void)setCameraToIMURotation:(id)a3
{
  objc_storeStrong((id *)&self->_cameraToIMURotation, a3);
}

- (NSArray)cameraToIMUTranslation
{
  return self->_cameraToIMUTranslation;
}

- (void)setCameraToIMUTranslation:(id)a3
{
  objc_storeStrong((id *)&self->_cameraToIMUTranslation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraToIMUTranslation, 0);
  objc_storeStrong((id *)&self->_cameraToIMURotation, 0);
  objc_storeStrong((id *)&self->_readoutTime, 0);
  objc_storeStrong((id *)&self->_chipOffset, 0);
  objc_storeStrong((id *)&self->_lensOffset, 0);
  objc_storeStrong((id *)&self->_tangentialDistortion, 0);
  objc_storeStrong((id *)&self->_radialDistortion, 0);
  objc_storeStrong((id *)&self->_metadataID, 0);
}

@end
