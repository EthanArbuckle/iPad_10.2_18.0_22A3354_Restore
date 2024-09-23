@implementation NTKExplorerDotLayoutConstraints

- (BOOL)isEqualToLayoutConstraints:(id)a3
{
  id v4;
  double dotDiameter;
  double v6;
  double dotBorderWidth;
  double v8;
  double dotSpacing;
  double v10;
  double noServiceDotHeight;
  double v12;
  BOOL v13;

  v4 = a3;
  dotDiameter = self->_dotDiameter;
  objc_msgSend(v4, "dotDiameter");
  if (vabdd_f64(dotDiameter, v6) >= 2.22044605e-16
    || (dotBorderWidth = self->_dotBorderWidth,
        objc_msgSend(v4, "dotBorderWidth"),
        vabdd_f64(dotBorderWidth, v8) >= 2.22044605e-16)
    || (dotSpacing = self->_dotSpacing, objc_msgSend(v4, "dotSpacing"), vabdd_f64(dotSpacing, v10) >= 2.22044605e-16))
  {
    v13 = 0;
  }
  else
  {
    noServiceDotHeight = self->_noServiceDotHeight;
    objc_msgSend(v4, "noServiceDotHeight");
    v13 = vabdd_f64(noServiceDotHeight, v12) < 2.22044605e-16;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  NTKExplorerDotLayoutConstraints *v4;
  BOOL v5;

  v4 = (NTKExplorerDotLayoutConstraints *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NTKExplorerDotLayoutConstraints isEqualToLayoutConstraints:](self, "isEqualToLayoutConstraints:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dotDiameter);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dotBorderWidth);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dotSpacing);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_noServiceDotHeight);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NTKExplorerDotLayoutConstraints *v4;
  NTKExplorerDotLayoutConstraints *v5;

  v4 = objc_alloc_init(NTKExplorerDotLayoutConstraints);
  v5 = v4;
  if (v4)
  {
    -[NTKExplorerDotLayoutConstraints setDotDiameter:](v4, "setDotDiameter:", self->_dotDiameter);
    -[NTKExplorerDotLayoutConstraints setDotBorderWidth:](v5, "setDotBorderWidth:", self->_dotBorderWidth);
    -[NTKExplorerDotLayoutConstraints setDotSpacing:](v5, "setDotSpacing:", self->_dotSpacing);
    -[NTKExplorerDotLayoutConstraints setNoServiceDotHeight:](v5, "setNoServiceDotHeight:", self->_noServiceDotHeight);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double dotDiameter;
  id v5;

  dotDiameter = self->_dotDiameter;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("dotDiameterKey"), dotDiameter);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("dotBorderWidthKey"), self->_dotBorderWidth);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("dotSpacingKey"), self->_dotSpacing);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("noServiceDotHeightKey"), self->_noServiceDotHeight);

}

- (NTKExplorerDotLayoutConstraints)initWithCoder:(id)a3
{
  id v4;
  NTKExplorerDotLayoutConstraints *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = -[NTKExplorerDotLayoutConstraints init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("dotDiameterKey"));
    v5->_dotDiameter = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("dotBorderWidthKey"));
    v5->_dotBorderWidth = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("dotSpacingKey"));
    v5->_dotSpacing = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("noServiceDotHeightKey"));
    v5->_noServiceDotHeight = v9;
  }

  return v5;
}

- (double)dotDiameter
{
  return self->_dotDiameter;
}

- (void)setDotDiameter:(double)a3
{
  self->_dotDiameter = a3;
}

- (double)dotBorderWidth
{
  return self->_dotBorderWidth;
}

- (void)setDotBorderWidth:(double)a3
{
  self->_dotBorderWidth = a3;
}

- (double)dotSpacing
{
  return self->_dotSpacing;
}

- (void)setDotSpacing:(double)a3
{
  self->_dotSpacing = a3;
}

- (double)noServiceDotHeight
{
  return self->_noServiceDotHeight;
}

- (void)setNoServiceDotHeight:(double)a3
{
  self->_noServiceDotHeight = a3;
}

@end
