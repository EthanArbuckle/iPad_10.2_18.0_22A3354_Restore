@implementation VNRecognizedObjectObservation

- (VNRecognizedObjectObservation)initWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 confidence:(float)a5 labels:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  double v15;
  VNRecognizedObjectObservation *v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a6;
  objc_msgSend((id)objc_opt_class(), "defaultOriginatingRequestSpecifierForRevision:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    *(float *)&v15 = a5;
    self = -[VNRecognizedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:](self, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:", v14, v13, 0, 0, x, y, width, height, v15);
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (VNRecognizedObjectObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4 confidence:(float)a5 labels:(id)a6 segmentationMask:(id)a7 groupId:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  id v20;
  VNRecognizedObjectObservation *v21;
  double v22;
  VNRecognizedObjectObservation *v23;
  uint64_t v24;
  NSArray *labels;
  objc_super v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a3;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v27.receiver = self;
  v27.super_class = (Class)VNRecognizedObjectObservation;
  v21 = -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:groupId:](&v27, sel_initWithOriginatingRequestSpecifier_boundingBox_groupId_, v17, v20, x, y, width, height);
  v23 = v21;
  if (v21)
  {
    *(float *)&v22 = a5;
    -[VNObservation setConfidence:](v21, "setConfidence:", v22);
    v24 = objc_msgSend(v18, "copy");
    labels = v23->_labels;
    v23->_labels = (NSArray *)v24;

    objc_storeStrong((id *)&v23->_segmentationMask, a7);
  }

  return v23;
}

- (id)vn_cloneObject
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VNRecognizedObjectObservation;
  -[VNDetectedObjectObservation vn_cloneObject](&v9, sel_vn_cloneObject);
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[NSArray copy](self->_labels, "copy");
    v5 = (void *)v3[20];
    v3[20] = v4;

    v6 = -[VNPixelBufferObservation copy](self->_segmentationMask, "copy");
    v7 = (void *)v3[21];
    v3[21] = v6;

  }
  return v3;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VNRecognizedObjectObservation;
  return -[VNPixelBufferObservation hash](self->_segmentationMask, "hash") ^ __ROR8__(-[NSArray hash](self->_labels, "hash") ^ __ROR8__(-[VNDetectedObjectObservation hash](&v3, sel_hash), 51), 51);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VNRecognizedObjectObservation;
  if (-[VNDetectedObjectObservation isEqual:](&v13, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    -[VNRecognizedObjectObservation segmentationMask](self, "segmentationMask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "segmentationMask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = VisionCoreEqualOrNilObjects();

    if ((v8 & 1) != 0)
    {
      -[VNRecognizedObjectObservation labels](self, "labels");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "labels");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = VisionCoreEquivalentOrNilUnorderedArrays();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[VNRecognizedObjectObservation labels](self, "labels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)VNRecognizedObjectObservation;
  -[VNDetectedObjectObservation description](&v10, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ labels=[%@]"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (VNRecognizedObjectObservation)initWithCoder:(id)a3
{
  id v4;
  VNRecognizedObjectObservation *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *labels;
  uint64_t v12;
  VNPixelBufferObservation *segmentationMask;
  VNRecognizedObjectObservation *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VNRecognizedObjectObservation;
  v5 = -[VNDetectedObjectObservation initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_6;
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("labels"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  labels = v5->_labels;
  v5->_labels = (NSArray *)v10;

  if (!v5->_labels)
    goto LABEL_6;
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("segmentationMask"))
    || (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("segmentationMask")),
        v12 = objc_claimAutoreleasedReturnValue(),
        segmentationMask = v5->_segmentationMask,
        v5->_segmentationMask = (VNPixelBufferObservation *)v12,
        segmentationMask,
        v5->_segmentationMask))
  {
    v14 = v5;
  }
  else
  {
LABEL_6:
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  VNPixelBufferObservation *segmentationMask;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VNRecognizedObjectObservation;
  -[VNDetectedObjectObservation encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_labels, CFSTR("labels"));
  segmentationMask = self->_segmentationMask;
  if (segmentationMask)
    objc_msgSend(v4, "encodeObject:forKey:", segmentationMask, CFSTR("segmentationMask"));

}

- (VNPixelBufferObservation)segmentationMask
{
  return (VNPixelBufferObservation *)objc_getProperty(self, a2, 168, 1);
}

- (NSArray)labels
{
  return self->_labels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentationMask, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNRecognizeObjectsRequest");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
