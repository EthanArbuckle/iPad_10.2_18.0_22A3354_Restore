@implementation _MKMapItemCustomFeature

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double latitude;
  id v5;

  latitude = self->_coordinate.latitude;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("coordinate.latitude"), latitude);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("coordinate.longitude"), self->_coordinate.longitude);
  objc_msgSend(v5, "encodeObject:forKey:", self->_feature, CFSTR("feature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_styleAttributes, CFSTR("styleAttributes"));

}

- (_MKMapItemCustomFeature)initWithCoder:(id)a3
{
  id v4;
  _MKMapItemCustomFeature *v5;
  double v6;
  double v7;
  uint64_t v8;
  VKCustomFeature *feature;
  uint64_t v10;
  GEOFeatureStyleAttributes *styleAttributes;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_MKMapItemCustomFeature;
  v5 = -[_MKMapItemCustomFeature init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("coordinate.latitude"));
    v5->_coordinate.latitude = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("coordinate.longitude"));
    v5->_coordinate.longitude = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("feature"));
    v8 = objc_claimAutoreleasedReturnValue();
    feature = v5->_feature;
    v5->_feature = (VKCustomFeature *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("styleAttributes"));
    v10 = objc_claimAutoreleasedReturnValue();
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOFeatureStyleAttributes *)v10;

  }
  return v5;
}

- (_MKMapItemCustomFeature)initWithMapItem:(id)a3
{
  id v4;
  _MKMapItemCustomFeature *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  uint64_t v10;
  VKCustomFeature *feature;
  VKCustomFeature *v12;
  void *v13;
  void *v14;
  GEOFeatureStyleAttributes *styleAttributes;
  objc_super v17;
  _OWORD v18[3];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_MKMapItemCustomFeature;
  v5 = -[_MKMapItemCustomFeature init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "placemark");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinate");
    v5->_coordinate.latitude = v7;

    objc_msgSend(v4, "placemark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinate");
    v5->_coordinate.longitude = v9;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC64D8]), "initWithCoordinate:", v5->_coordinate.latitude, v5->_coordinate.longitude);
    feature = v5->_feature;
    v5->_feature = (VKCustomFeature *)v10;

    v12 = v5->_feature;
    objc_msgSend(v4, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCustomFeature setText:locale:](v12, "setText:locale:", v13, 0);

    objc_msgSend(v4, "_styleAttributes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = xmmword_18B2AA280;
    v18[1] = unk_18B2AA290;
    v18[2] = xmmword_18B2AA2A0;
    objc_msgSend(v14, "replaceAttributes:count:", v18, 6);
    -[VKCustomFeature setStyleAttributes:](v5->_feature, "setStyleAttributes:", v14);
    -[VKCustomFeature setBusinessID:](v5->_feature, "setBusinessID:", objc_msgSend(v4, "_muid"));
    -[VKCustomFeature setFeatureID:](v5->_feature, "setFeatureID:", objc_msgSend(v4, "_customIconID"));
    styleAttributes = v5->_styleAttributes;
    v5->_styleAttributes = (GEOFeatureStyleAttributes *)v14;

  }
  return v5;
}

- (id)feature
{
  return self->_feature;
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

- (void)deselect
{
  GEOFeatureStyleAttributes *styleAttributes;
  GEOFeatureStyleAttributes *v4;
  uint64_t v5;

  styleAttributes = self->_styleAttributes;
  v5 = 65573;
  v4 = styleAttributes;
  -[GEOFeatureStyleAttributes replaceAttributes:count:](v4, "replaceAttributes:count:", &v5, 1);
  -[VKCustomFeature setStyleAttributes:](self->_feature, "setStyleAttributes:", v4);

}

- (void)select
{
  GEOFeatureStyleAttributes *styleAttributes;
  GEOFeatureStyleAttributes *v4;
  uint64_t v5;

  styleAttributes = self->_styleAttributes;
  v5 = 0x100010025;
  v4 = styleAttributes;
  -[GEOFeatureStyleAttributes replaceAttributes:count:](v4, "replaceAttributes:count:", &v5, 1);
  -[VKCustomFeature setStyleAttributes:](self->_feature, "setStyleAttributes:", v4);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
