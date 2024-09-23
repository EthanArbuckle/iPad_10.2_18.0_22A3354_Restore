@implementation RedEyeFace

- (RedEyeFace)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RedEyeFace;
  return -[RedEyeFace init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  -[RedEyeFace setObservation:](self, "setObservation:", 0);
  -[RedEyeFace setLandmarks:](self, "setLandmarks:", 0);
  -[RedEyeFace setSegmentationSkin:](self, "setSegmentationSkin:", 0);
  -[RedEyeFace setSegmentationSclera:](self, "setSegmentationSclera:", 0);
  -[RedEyeFace setSegmentationIris:](self, "setSegmentationIris:", 0);
  -[RedEyeFace setUvLeft:](self, "setUvLeft:", 0);
  -[RedEyeFace setUvRight:](self, "setUvRight:", 0);
  -[RedEyeFace setFaceRect:](self, "setFaceRect:", 0);
  -[RedEyeFace setRoiRenderOriginLeft:](self, "setRoiRenderOriginLeft:", 0);
  -[RedEyeFace setRoiRenderOriginRight:](self, "setRoiRenderOriginRight:", 0);
  -[RedEyeFace setRoiRenderSize:](self, "setRoiRenderSize:", 0);
  -[RedEyeFace setPupilLeft:](self, "setPupilLeft:", 0);
  -[RedEyeFace setPupilRight:](self, "setPupilRight:", 0);
  v3.receiver = self;
  v3.super_class = (Class)RedEyeFace;
  -[RedEyeFace dealloc](&v3, sel_dealloc);
}

- (int)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setImageOrientation:(int)a3
{
  self->_imageOrientation = a3;
}

- (float)faceOrientation
{
  return self->_faceOrientation;
}

- (void)setFaceOrientation:(float)a3
{
  self->_faceOrientation = a3;
}

- (float)junkiness
{
  return self->_junkiness;
}

- (void)setJunkiness:(float)a3
{
  self->_junkiness = a3;
}

- (float)areaMax
{
  return self->_areaMax;
}

- (void)setAreaMax:(float)a3
{
  self->_areaMax = a3;
}

- (VNFaceObservation)observation
{
  return self->_observation;
}

- (void)setObservation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (VNFaceLandmarks2D)landmarks
{
  return self->_landmarks;
}

- (void)setLandmarks:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (CIImage)segmentationSkin
{
  return self->_segmentationSkin;
}

- (void)setSegmentationSkin:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (CIImage)segmentationSclera
{
  return self->_segmentationSclera;
}

- (void)setSegmentationSclera:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (CIImage)segmentationIris
{
  return self->_segmentationIris;
}

- (void)setSegmentationIris:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSArray)uvLeft
{
  return self->_uvLeft;
}

- (void)setUvLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSArray)uvRight
{
  return self->_uvRight;
}

- (void)setUvRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (CIVector)faceRect
{
  return self->_faceRect;
}

- (void)setFaceRect:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CIVector)roiRenderOriginLeft
{
  return self->_roiRenderOriginLeft;
}

- (void)setRoiRenderOriginLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (CIVector)roiRenderOriginRight
{
  return self->_roiRenderOriginRight;
}

- (void)setRoiRenderOriginRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (CIVector)roiRenderSize
{
  return self->_roiRenderSize;
}

- (void)setRoiRenderSize:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (CIVector)pupilLeft
{
  return self->_pupilLeft;
}

- (void)setPupilLeft:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (CIVector)pupilRight
{
  return self->_pupilRight;
}

- (void)setPupilRight:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

@end
