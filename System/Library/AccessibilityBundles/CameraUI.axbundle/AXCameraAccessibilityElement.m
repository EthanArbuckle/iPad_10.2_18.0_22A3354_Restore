@implementation AXCameraAccessibilityElement

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDFE800], "localizedStringForLocation:isSubjectImplicit:", -[AXCameraAccessibilityElement location](self, "location"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[AXCameraAccessibilityElement _subjectDescription](self, "_subjectDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AXCameraAccessibilityElement _subjectDescription](self, "_subjectDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXCameraAccessibilityElement;
  -[AXCameraAccessibilityElement description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCameraAccessibilityElement accessibilityLabel](self, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXCameraAccessibilityElement normalizedFrame](self, "normalizedFrame");
  AXMStringFromNormalizedCGRect();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@ (%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)_subjectDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v9;
  void *v10;

  -[AXCameraAccessibilityElement faceName](self, "faceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[AXCameraAccessibilityElement faceName](self, "faceName");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[AXCameraAccessibilityElement isFace](self, "isFace"))
    {
      v6 = CFSTR("unknown.face");
    }
    else
    {
      if (-[AXCameraAccessibilityElement isPerson](self, "isPerson"))
      {
        v9 = (void *)MEMORY[0x24BDD17C8];
        accessibilityCameraUILocalizedString(CFSTR("people.count"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringWithFormat:", v10, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        return (NSString *)v7;
      }
      if (-[AXCameraAccessibilityElement isObjectClassification](self, "isObjectClassification"))
      {
        -[AXCameraAccessibilityElement classificationLocalizedValue](self, "classificationLocalizedValue");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
      v6 = CFSTR("prominent.object");
    }
    accessibilityCameraUILocalizedString(v6);
    v5 = objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  v7 = (void *)v5;
  return (NSString *)v7;
}

- (BOOL)isFace
{
  return -[AXCameraAccessibilityElement featureType](self, "featureType") == 5
      || -[AXCameraAccessibilityElement featureType](self, "featureType") == 6;
}

- (BOOL)isProminentObject
{
  return -[AXCameraAccessibilityElement featureType](self, "featureType") == 19;
}

- (BOOL)isObjectClassification
{
  return -[AXCameraAccessibilityElement featureType](self, "featureType") == 10;
}

- (BOOL)isPerson
{
  return -[AXCameraAccessibilityElement featureType](self, "featureType") == 7;
}

- (unint64_t)featureType
{
  return self->_featureType;
}

- (void)setFeatureType:(unint64_t)a3
{
  self->_featureType = a3;
}

- (int64_t)location
{
  return self->_location;
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
}

- (CGRect)normalizedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedFrame.origin.x;
  y = self->_normalizedFrame.origin.y;
  width = self->_normalizedFrame.size.width;
  height = self->_normalizedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNormalizedFrame:(CGRect)a3
{
  self->_normalizedFrame = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (AXMCameraFrameContext)cameraFrameContext
{
  return self->_cameraFrameContext;
}

- (void)setCameraFrameContext:(id)a3
{
  objc_storeStrong((id *)&self->_cameraFrameContext, a3);
}

- (NSString)faceName
{
  return self->_faceName;
}

- (void)setFaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (AXMVisionFeatureFaceAttributes)faceAttributes
{
  return self->_faceAttributes;
}

- (void)setFaceAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_faceAttributes, a3);
}

- (int64_t)faceID
{
  return self->_faceID;
}

- (void)setFaceID:(int64_t)a3
{
  self->_faceID = a3;
}

- (NSString)classificationLocalizedValue
{
  return self->_classificationLocalizedValue;
}

- (void)setClassificationLocalizedValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)classificationLabel
{
  return self->_classificationLabel;
}

- (void)setClassificationLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)didCrossEdge
{
  return self->_didCrossEdge;
}

- (void)setDidCrossEdge:(BOOL)a3
{
  self->_didCrossEdge = a3;
}

- (BOOL)didReuse
{
  return self->_didReuse;
}

- (void)setDidReuse:(BOOL)a3
{
  self->_didReuse = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationLabel, 0);
  objc_storeStrong((id *)&self->_classificationLocalizedValue, 0);
  objc_storeStrong((id *)&self->_faceAttributes, 0);
  objc_storeStrong((id *)&self->_faceName, 0);
  objc_storeStrong((id *)&self->_cameraFrameContext, 0);
}

@end
