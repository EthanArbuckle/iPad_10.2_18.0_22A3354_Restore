@implementation VOTImageExplorerFaceElement

- (VOTImageExplorerFaceElement)initWithImageView:(id)a3 forFaceFeature:(id)a4 withOverlappingPeopleFeature:(id)a5 hasFlippedYAxis:(BOOL)a6
{
  _BOOL8 v6;
  AXMVisionFeature *v10;
  VOTImageExplorerFaceElement *v11;
  AXMVisionFeature *peopleFeature;
  objc_super v14;

  v6 = a6;
  v10 = (AXMVisionFeature *)a5;
  v14.receiver = self;
  v14.super_class = (Class)VOTImageExplorerFaceElement;
  v11 = -[VOTImageExplorerElement initWithImageView:forFeature:hasFlippedYAxis:](&v14, "initWithImageView:forFeature:hasFlippedYAxis:", a3, a4, v6);
  peopleFeature = v11->_peopleFeature;
  v11->_peopleFeature = v10;

  return v11;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "faceDetectionResult"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "faceDetectionResult"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributes"));

  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mediaAnalysisFaceDetectionResult"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mediaAnalysisFaceDetectionResult"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributes"));

    v5 = (void *)v11;
    v8 = (void *)v14;
  }
  objc_msgSend(v8, "setExcludeOptions:", +[AXMVisionFeatureFaceAttributes defaultExcludeOptions](AXMVisionFeatureFaceAttributes, "defaultExcludeOptions"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessibilityLabelForAttributes"));
  v16 = __UIAXStringForVariables(v5, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  return v17;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXMVisionFeature localizedStringForLocation:isSubjectImplicit:](AXMVisionFeature, "localizedStringForLocation:isSubjectImplicit:", objc_msgSend(v3, "locationUsingThirds:withFlippedYAxis:", 0, -[VOTImageExplorerElement flippedYAxis](self, "flippedYAxis")), 1));

  return v4;
}

- (id)accessibilityIdentifier
{
  return CFSTR("VOTImageExplorerFaceElement");
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerFaceElement accessibilityContainer](self, "accessibilityContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
  objc_msgSend(v4, "normalizedFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v3, "frame");
  v14 = v13;
  v16 = v15;
  if (-[VOTImageExplorerElement flippedYAxis](self, "flippedYAxis"))
    v17 = 1.0 - v8 - v12;
  else
    v17 = v8;
  v18 = UIAccessibilityFrameForBounds(v3, v6 * v14, v16 * v17, v10 * v14, v12 * v16);
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerFaceElement peopleFeature](self, "peopleFeature"));
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerFaceElement peopleFeature](self, "peopleFeature"));
    objc_msgSend(v26, "normalizedFrame");
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    objc_msgSend(v3, "frame");
    UIAccessibilityFrameForBounds(v3, v28 * v35, v36 * (1.0 - v30 - v34), v32 * v35, v34 * v36);
    v38 = v37;
    v40 = v39;

    v24 = v40 - vabdd_f64(v38, v20);
  }

  v41 = v18;
  v42 = v20;
  v43 = v22;
  v44 = v24;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (AXMVisionFeature)peopleFeature
{
  return self->_peopleFeature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleFeature, 0);
}

@end
