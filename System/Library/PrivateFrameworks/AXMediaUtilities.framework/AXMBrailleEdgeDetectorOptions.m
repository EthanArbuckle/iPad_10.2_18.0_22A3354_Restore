@implementation AXMBrailleEdgeDetectorOptions

- (AXMBrailleEdgeDetectorOptions)initWithCanvasDescription:(id)a3
{
  id v5;
  AXMBrailleEdgeDetectorOptions *v6;
  AXMBrailleEdgeDetectorOptions *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXMBrailleEdgeDetectorOptions;
  v6 = -[AXMBrailleEdgeDetectorOptions init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_canvasDescription, a3);
    v7->_zoomLevel = 1.0;
    v7->_origin.x = 0.0;
    v7->_origin.y = 0.0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMBrailleEdgeDetectorOptions)initWithCoder:(id)a3
{
  id v4;
  AXMBrailleEdgeDetectorOptions *v5;
  uint64_t v6;
  AXMBrailleCanvasDescription *canvasDescription;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXMBrailleEdgeDetectorOptions;
  v5 = -[AXMBrailleEdgeDetectorOptions init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("canvasDescription"));
    v6 = objc_claimAutoreleasedReturnValue();
    canvasDescription = v5->_canvasDescription;
    v5->_canvasDescription = (AXMBrailleCanvasDescription *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("zoomLevel"));
    v5->_zoomLevel = v8;
    objc_msgSend(v4, "axmDecodePointForKey:", CFSTR("origin"));
    v5->_origin.x = v9;
    v5->_origin.y = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("edgeStrength"));
    v5->_edgeStrength = v11;
    v5->_invert = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("invert"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  AXMBrailleCanvasDescription *canvasDescription;
  id v5;

  canvasDescription = self->_canvasDescription;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", canvasDescription, CFSTR("canvasDescription"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("zoomLevel"), self->_zoomLevel);
  objc_msgSend(v5, "axmEncodePoint:forKey:", CFSTR("origin"), self->_origin.x, self->_origin.y);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("edgeStrength"), self->_edgeStrength);
  objc_msgSend(v5, "encodeBool:forKey:", self->_invert, CFSTR("invert"));

}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("AXMBrailleEdgeDetectorOptions<%p>\n"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  Options: \n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    CanvasDescription: %@\n"), self->_canvasDescription);
  objc_msgSend(v3, "appendFormat:", CFSTR("    zoomLevel: %.2f\n"), *(_QWORD *)&self->_zoomLevel);
  AXMStringFromCGPoint(self->_origin.x, self->_origin.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("    origin: %@\n"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("    edgeStrength: %.2f\n"), *(_QWORD *)&self->_edgeStrength);
  return v3;
}

- (double)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(double)a3
{
  self->_zoomLevel = a3;
}

- (CGPoint)origin
{
  double x;
  double y;
  CGPoint result;

  x = self->_origin.x;
  y = self->_origin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  self->_origin = a3;
}

- (double)edgeStrength
{
  return self->_edgeStrength;
}

- (void)setEdgeStrength:(double)a3
{
  self->_edgeStrength = a3;
}

- (BOOL)invert
{
  return self->_invert;
}

- (void)setInvert:(BOOL)a3
{
  self->_invert = a3;
}

- (AXMBrailleCanvasDescription)canvasDescription
{
  return self->_canvasDescription;
}

- (void)setCanvasDescription:(id)a3
{
  objc_storeStrong((id *)&self->_canvasDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canvasDescription, 0);
}

@end
