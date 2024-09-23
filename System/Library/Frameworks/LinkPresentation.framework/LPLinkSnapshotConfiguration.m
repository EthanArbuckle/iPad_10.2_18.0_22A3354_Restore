@implementation LPLinkSnapshotConfiguration

- (LPLinkSnapshotConfiguration)init
{

  return 0;
}

- (LPLinkSnapshotConfiguration)initWithTraitCollection:(id)a3 preferredSizeClass:(unint64_t)a4 maximumSize:(CGSize)a5 scale:(double)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  LPLinkSnapshotConfiguration *v13;
  LPLinkSnapshotConfiguration *v14;
  LPLinkSnapshotConfiguration *v15;
  objc_super v17;

  height = a5.height;
  width = a5.width;
  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)LPLinkSnapshotConfiguration;
  v13 = -[LPLinkSnapshotConfiguration init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_traitCollection, a3);
    v14->_preferredSizeClass = a4;
    v14->_maximumSize.width = width;
    v14->_maximumSize.height = height;
    v14->_scale = a6;
    v15 = v14;
  }

  return v14;
}

- (LPLinkSnapshotConfiguration)initWithTraitCollection:(id)a3 preferredSizeClass:(unint64_t)a4 size:(CGSize)a5 scale:(double)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  LPLinkSnapshotConfiguration *v13;
  LPLinkSnapshotConfiguration *v14;
  LPLinkSnapshotConfiguration *v15;
  objc_super v17;

  height = a5.height;
  width = a5.width;
  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)LPLinkSnapshotConfiguration;
  v13 = -[LPLinkSnapshotConfiguration init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_traitCollection, a3);
    v14->_preferredSizeClass = a4;
    v14->_size.width = width;
    v14->_size.height = height;
    v14->_scale = a6;
    v15 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPLinkSnapshotConfiguration)initWithCoder:(id)a3
{
  id v4;
  LPLinkSnapshotConfiguration *v5;
  uint64_t v6;
  UITraitCollection *traitCollection;
  uint64_t v8;
  LPLinkRendererSizeClassParameters *sizeClassParameters;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  LPLinkSnapshotConfiguration *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)LPLinkSnapshotConfiguration;
  v5 = -[LPLinkSnapshotConfiguration init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("traitCollection"));
    v6 = objc_claimAutoreleasedReturnValue();
    traitCollection = v5->_traitCollection;
    v5->_traitCollection = (UITraitCollection *)v6;

    v5->_preferredSizeClass = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredSizeClass"));
    objc_msgSend(v4, "_lp_strictlyDecodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sizeClassParameters"));
    v8 = objc_claimAutoreleasedReturnValue();
    sizeClassParameters = v5->_sizeClassParameters;
    v5->_sizeClassParameters = (LPLinkRendererSizeClassParameters *)v8;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("maximumWidth"));
    v11 = v10;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("maximumHeight"));
    v5->_maximumSize.width = v11;
    v5->_maximumSize.height = v12;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("sizeWidth"));
    v14 = v13;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("sizeHeight"));
    v5->_size.width = v14;
    v5->_size.height = v15;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("scale"));
    v5->_scale = v16;
    v17 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CGFloat width;
  CGFloat height;
  CGFloat v6;
  CGFloat v7;
  double scale;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "_lp_encodeObjectIfNotNil:forKey:", self->_traitCollection, CFSTR("traitCollection"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_preferredSizeClass, CFSTR("preferredSizeClass"));
  objc_msgSend(v9, "_lp_encodeObjectIfNotNil:forKey:", self->_sizeClassParameters, CFSTR("sizeClassParameters"));
  width = self->_maximumSize.width;
  *(float *)&width = width;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("maximumWidth"), width);
  height = self->_maximumSize.height;
  *(float *)&height = height;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("maximumHeight"), height);
  v6 = self->_size.width;
  *(float *)&v6 = v6;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("sizeWidth"), v6);
  v7 = self->_size.height;
  *(float *)&v7 = v7;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("sizeHeight"), v7);
  scale = self->_scale;
  *(float *)&scale = scale;
  objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("scale"), scale);

}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (unint64_t)preferredSizeClass
{
  return self->_preferredSizeClass;
}

- (LPLinkRendererSizeClassParameters)sizeClassParameters
{
  return self->_sizeClassParameters;
}

- (void)setSizeClassParameters:(id)a3
{
  objc_storeStrong((id *)&self->_sizeClassParameters, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)maximumSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumSize.width;
  height = self->_maximumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)showDebugIndicators
{
  return self->_showDebugIndicators;
}

- (void)setShowDebugIndicators:(BOOL)a3
{
  self->_showDebugIndicators = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClassParameters, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
