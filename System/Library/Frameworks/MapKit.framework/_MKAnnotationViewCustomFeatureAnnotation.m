@implementation _MKAnnotationViewCustomFeatureAnnotation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  id v6;

  v4 = a3;
  -[_MKAnnotationViewCustomFeatureAnnotation coordinate](self, "coordinate");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("lat"));
  -[_MKAnnotationViewCustomFeatureAnnotation coordinate](self, "coordinate");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("lng"), v5);
  -[_MKAnnotationViewCustomFeatureAnnotation feature](self, "feature");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("feature"));

}

- (_MKAnnotationViewCustomFeatureAnnotation)initWithCoder:(id)a3
{
  id v4;
  _MKAnnotationViewCustomFeatureAnnotation *v5;
  double v6;
  double v7;
  uint64_t v8;
  VKCustomFeature *customFeature;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_MKAnnotationViewCustomFeatureAnnotation;
  v5 = -[_MKAnnotationViewCustomFeatureAnnotation init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lat"));
    v5->_coordinate.latitude = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("lng"));
    v5->_coordinate.longitude = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("feature"));
    v8 = objc_claimAutoreleasedReturnValue();
    customFeature = v5->_customFeature;
    v5->_customFeature = (VKCustomFeature *)v8;

  }
  return v5;
}

- (void)setCustomFeature:(id)a3
{
  objc_storeStrong((id *)&self->_customFeature, a3);
}

- (VKCustomFeature)feature
{
  VKCustomFeature *customFeature;
  id WeakRetained;
  double v5;
  double v6;
  VKCustomFeature *v7;
  VKCustomFeature *v8;
  id v9;
  void *v10;
  uint64_t v11;
  double width;
  double height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  CGRect v24;
  CGRect v25;

  customFeature = self->_customFeature;
  if (!customFeature)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_annotationView);
    objc_msgSend(WeakRetained, "coordinate");
    self->_coordinate.latitude = v5;
    self->_coordinate.longitude = v6;
    v7 = (VKCustomFeature *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC64D8]), "initWithCoordinate:", self->_coordinate.latitude, self->_coordinate.longitude);
    v8 = self->_customFeature;
    self->_customFeature = v7;

    v9 = objc_loadWeakRetained((id *)&self->_annotationView);
    -[VKCustomFeature setFeatureID:](self->_customFeature, "setFeatureID:", objc_msgSend(v9, "_featureId"));

    objc_msgSend(MEMORY[0x1E0D270A8], "annotationViewProvidedCustomFeatureStyleAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(WeakRetained, "isSelected"))
    {
      objc_msgSend(MEMORY[0x1E0D270A8], "styleAttributesForCalloutWithAttributes:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    -[VKCustomFeature setStyleAttributes:](self->_customFeature, "setStyleAttributes:", v10);
    objc_msgSend(WeakRetained, "_collisionFrame");
    v25 = CGRectInset(v24, 5.0, 5.0);
    width = v25.size.width;
    height = v25.size.height;
    objc_msgSend(WeakRetained, "_collisionAlignmentRectInsets", v25.origin.x, v25.origin.y);
    v16 = (v14 - v15) * 0.5;
    v19 = (v17 - v18) * 0.5;
    objc_msgSend(WeakRetained, "centerOffset");
    -[VKCustomFeature setPlaceholderIconWithSize:anchorPoint:isRound:](self->_customFeature, "setPlaceholderIconWithSize:anchorPoint:isRound:", objc_msgSend(WeakRetained, "collisionMode") == 1, width, height, width * 0.5 - (v20 + v16), height * 0.5 - (v21 + v19));
    v22 = objc_loadWeakRetained((id *)&self->_annotationView);
    objc_msgSend(v22, "configureCustomFeature:", self->_customFeature);

    customFeature = self->_customFeature;
  }
  return customFeature;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (MKAnnotationView)annotationView
{
  return (MKAnnotationView *)objc_loadWeakRetained((id *)&self->_annotationView);
}

- (void)setAnnotationView:(id)a3
{
  objc_storeWeak((id *)&self->_annotationView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_annotationView);
  objc_storeStrong((id *)&self->_customFeature, 0);
}

@end
