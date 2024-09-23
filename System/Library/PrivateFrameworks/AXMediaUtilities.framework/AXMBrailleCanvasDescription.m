@implementation AXMBrailleCanvasDescription

- (AXMBrailleCanvasDescription)initWithHeight:(unint64_t)a3 width:(unint64_t)a4 numberOfDiscretePinHeights:(unint64_t)a5
{
  AXMBrailleCanvasDescription *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXMBrailleCanvasDescription;
  result = -[AXMBrailleCanvasDescription init](&v9, sel_init);
  if (result)
  {
    result->_width = a4;
    result->_height = a3;
    result->_numberOfDiscretePinHeights = a5;
    *(_WORD *)&result->_hasConsistentHorizontalPinSpacing = 257;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMBrailleCanvasDescription)initWithCoder:(id)a3
{
  id v4;
  AXMBrailleCanvasDescription *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  AXMBrailleCanvasDescription *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AXMBrailleCanvasDescription;
  v5 = -[AXMBrailleCanvasDescription init](&v12, sel_init);
  if (!v5)
    goto LABEL_7;
  v5->_height = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("height"));
  v5->_width = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("width"));
  v5->_numberOfDiscretePinHeights = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numberOfDiscretePinHeights"));
  v5->_hasConsistentHorizontalPinSpacing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasConsistentHorizontalPinSpacing"));
  v5->_hasConsistentVerticalPinSpacing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasConsistentVerticalPinSpacing"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("verticalPinSpacing"));
  v5->_verticalPinSpacing = v6;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("horizontalPinSpacing"));
  v5->_horizontalPinSpacing = v7;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("interCellHorizontalSpacing"));
  v5->_interCellHorizontalSpacing = v8;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("interCellVerticalSpacing"));
  v5->_interCellVerticalSpacing = v9;
  if (v5->_hasConsistentHorizontalPinSpacing && v5->_hasConsistentVerticalPinSpacing)
    goto LABEL_7;
  if (v5->_verticalPinSpacing == 0.0 || v5->_horizontalPinSpacing == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("verticalPinSpacing and horizontalPinSpacing are required if cell spacing is not uniform."));
    v10 = 0;
  }
  else
  {
LABEL_7:
    v10 = v5;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t height;
  id v5;

  height = self->_height;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", height, CFSTR("height"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_width, CFSTR("width"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[AXMBrailleCanvasDescription numberOfDiscretePinHeights](self, "numberOfDiscretePinHeights"), CFSTR("numberOfDiscretePinHeights"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasConsistentHorizontalPinSpacing, CFSTR("hasConsistentHorizontalPinSpacing"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasConsistentVerticalPinSpacing, CFSTR("hasConsistentVerticalPinSpacing"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("verticalPinSpacing"), self->_verticalPinSpacing);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("horizontalPinSpacing"), self->_horizontalPinSpacing);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("interCellHorizontalSpacing"), self->_interCellHorizontalSpacing);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("interCellVerticalSpacing"), self->_interCellVerticalSpacing);

  if ((!self->_hasConsistentHorizontalPinSpacing || !self->_hasConsistentVerticalPinSpacing)
    && (self->_verticalPinSpacing == 0.0 || self->_horizontalPinSpacing == 0.0))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("verticalPinSpacing and horizontalPinSpacing are required if cell spacing is not uniform."));
  }
}

- (id)description
{
  void *v3;
  float verticalPinSpacing;
  float horizontalPinSpacing;
  float interCellHorizontalSpacing;
  float interCellVerticalSpacing;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("AXMBrailleCanvasDescription<%p>\n"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  Options: \n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("    Size(%ld, %ld)\n"), self->_width, self->_height);
  objc_msgSend(v3, "appendFormat:", CFSTR("    numberOfDiscretePinHeights: %ld\n"), self->_numberOfDiscretePinHeights);
  if (!self->_hasConsistentVerticalPinSpacing || !self->_hasConsistentHorizontalPinSpacing)
  {
    verticalPinSpacing = self->_verticalPinSpacing;
    objc_msgSend(v3, "appendFormat:", CFSTR("        verticalPinSpacing: %.2f\n"), verticalPinSpacing);
    horizontalPinSpacing = self->_horizontalPinSpacing;
    objc_msgSend(v3, "appendFormat:", CFSTR("        horizontalPinSpacing: %.2f\n"), horizontalPinSpacing);
    interCellHorizontalSpacing = self->_interCellHorizontalSpacing;
    objc_msgSend(v3, "appendFormat:", CFSTR("        interCellHorizontalSpacing: %.2f\n"), interCellHorizontalSpacing);
    interCellVerticalSpacing = self->_interCellVerticalSpacing;
    objc_msgSend(v3, "appendFormat:", CFSTR("        interCellVerticalSpacing: %.2f\n"), interCellVerticalSpacing);
  }
  return v3;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)numberOfDiscretePinHeights
{
  return self->_numberOfDiscretePinHeights;
}

- (BOOL)hasConsistentHorizontalPinSpacing
{
  return self->_hasConsistentHorizontalPinSpacing;
}

- (void)setHasConsistentHorizontalPinSpacing:(BOOL)a3
{
  self->_hasConsistentHorizontalPinSpacing = a3;
}

- (BOOL)hasConsistentVerticalPinSpacing
{
  return self->_hasConsistentVerticalPinSpacing;
}

- (void)setHasConsistentVerticalPinSpacing:(BOOL)a3
{
  self->_hasConsistentVerticalPinSpacing = a3;
}

- (double)verticalPinSpacing
{
  return self->_verticalPinSpacing;
}

- (void)setVerticalPinSpacing:(double)a3
{
  self->_verticalPinSpacing = a3;
}

- (double)horizontalPinSpacing
{
  return self->_horizontalPinSpacing;
}

- (void)setHorizontalPinSpacing:(double)a3
{
  self->_horizontalPinSpacing = a3;
}

- (double)interCellHorizontalSpacing
{
  return self->_interCellHorizontalSpacing;
}

- (void)setInterCellHorizontalSpacing:(double)a3
{
  self->_interCellHorizontalSpacing = a3;
}

- (double)interCellVerticalSpacing
{
  return self->_interCellVerticalSpacing;
}

- (void)setInterCellVerticalSpacing:(double)a3
{
  self->_interCellVerticalSpacing = a3;
}

@end
