@implementation MKMapSnapshotCustomFeatureAnnotation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MKMapSnapshotCustomFeatureAnnotation)initWithCustomFeature:(id)a3 coordinate:(id)a4
{
  double var1;
  double var0;
  id v7;
  MKMapSnapshotCustomFeatureAnnotation *v8;
  _MKAnnotationViewCustomFeatureAnnotation *v9;
  _MKAnnotationViewCustomFeatureAnnotation *internalCustomFeatureAnnotation;
  objc_super v12;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MKMapSnapshotCustomFeatureAnnotation;
  v8 = -[MKMapSnapshotCustomFeatureAnnotation init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(_MKAnnotationViewCustomFeatureAnnotation);
    internalCustomFeatureAnnotation = v8->_internalCustomFeatureAnnotation;
    v8->_internalCustomFeatureAnnotation = v9;

    -[_MKAnnotationViewCustomFeatureAnnotation setCoordinate:](v8->_internalCustomFeatureAnnotation, "setCoordinate:", var0, var1);
    -[_MKAnnotationViewCustomFeatureAnnotation setCustomFeature:](v8->_internalCustomFeatureAnnotation, "setCustomFeature:", v7);
  }

  return v8;
}

- (MKMapSnapshotCustomFeatureAnnotation)initWithCoder:(id)a3
{
  id v4;
  MKMapSnapshotCustomFeatureAnnotation *v5;
  uint64_t v6;
  _MKAnnotationViewCustomFeatureAnnotation *internalCustomFeatureAnnotation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKMapSnapshotCustomFeatureAnnotation;
  v5 = -[MKMapSnapshotCustomFeatureAnnotation init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("featureAnnotation"));
    v6 = objc_claimAutoreleasedReturnValue();
    internalCustomFeatureAnnotation = v5->_internalCustomFeatureAnnotation;
    v5->_internalCustomFeatureAnnotation = (_MKAnnotationViewCustomFeatureAnnotation *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MKMapSnapshotCustomFeatureAnnotation internalCustomFeatureAnnotation](self, "internalCustomFeatureAnnotation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("featureAnnotation"));

}

- (id)feature
{
  return -[_MKAnnotationViewCustomFeatureAnnotation feature](self->_internalCustomFeatureAnnotation, "feature");
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double v2;
  double v3;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  -[_MKAnnotationViewCustomFeatureAnnotation coordinate](self->_internalCustomFeatureAnnotation, "coordinate");
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setCoordinate:(id)a3
{
  -[_MKAnnotationViewCustomFeatureAnnotation setCoordinate:](self->_internalCustomFeatureAnnotation, "setCoordinate:", a3.var0, a3.var1);
}

- (BOOL)showsBalloonCallout
{
  return 1;
}

+ (id)customFeatureAnnotationForMapItem:(id)a3
{
  return (id)objc_msgSend(a1, "customFeatureAnnotationForMapItem:styleAttributes:", a3, 0);
}

+ (id)customFeatureAnnotationForMapItem:(id)a3 styleAttributes:(id)a4
{
  return (id)objc_msgSend(a1, "customFeatureAnnotationForMapItem:styleAttributes:suppressLabel:", a3, a4, 0);
}

+ (id)customFeatureAnnotationForMapItem:(id)a3 styleAttributes:(id)a4 suppressLabel:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  MKMapSnapshotCustomFeatureAnnotation *v20;
  __int128 v22;
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "_coordinate");
  v10 = v9;
  objc_msgSend(v7, "_coordinate");
  v12 = v11;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC64D8]), "initWithCoordinate:", v10, v11);
  v14 = v13;
  if (v5)
    objc_msgSend(v13, "setTextDisplayMode:", 3);
  objc_msgSend(v7, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:locale:", v15, 0);

  if (v8)
  {
    v16 = v8;
  }
  else
  {
    objc_msgSend(v7, "_styleAttributes");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;
  if ((objc_msgSend(v16, "hasAttributes") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D270A8], "markerStyleAttributes");
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v18;
  }
  v19 = (void *)objc_msgSend(v17, "copy");

  v22 = xmmword_18B2A9E60;
  objc_msgSend(v19, "replaceAttributes:count:", &v22, 2);
  objc_msgSend(v14, "setStyleAttributes:", v19);
  v20 = -[MKMapSnapshotCustomFeatureAnnotation initWithCustomFeature:coordinate:]([MKMapSnapshotCustomFeatureAnnotation alloc], "initWithCustomFeature:coordinate:", v14, v10, v12);

  return v20;
}

- (_MKAnnotationViewCustomFeatureAnnotation)internalCustomFeatureAnnotation
{
  return self->_internalCustomFeatureAnnotation;
}

- (void)setInternalCustomFeatureAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->_internalCustomFeatureAnnotation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalCustomFeatureAnnotation, 0);
}

@end
