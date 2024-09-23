@implementation VOTImageExplorerObjectClassificationElement

- (VOTImageExplorerObjectClassificationElement)initWithImageView:(id)a3 forFeature:(id)a4 withMatchingScenes:(id)a5 hasFlippedYAxis:(BOOL)a6 objectIndex:(int64_t)a7
{
  _BOOL8 v8;
  NSSet *v12;
  VOTImageExplorerObjectClassificationElement *v13;
  NSSet *matchingScenes;
  objc_super v16;

  v8 = a6;
  v12 = (NSSet *)a5;
  v16.receiver = self;
  v16.super_class = (Class)VOTImageExplorerObjectClassificationElement;
  v13 = -[VOTImageExplorerElement initWithImageView:forFeature:hasFlippedYAxis:](&v16, "initWithImageView:forFeature:hasFlippedYAxis:", a3, a4, v8);
  matchingScenes = v13->_matchingScenes;
  v13->_matchingScenes = v12;

  v13->_objectIndex = a7;
  return v13;
}

- (id)accessibilityLabel
{
  return -[VOTImageExplorerObjectClassificationElement axObjectLabel](self, "axObjectLabel");
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
  return CFSTR("VOTImageExplorerObjectClassificationElement");
}

- (id)axObjectLabel
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "classificationLabel"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("people"));

  if (v5)
  {
    v6 = sub_10000DC74(CFSTR("VoiceOverImageExplorer.person.no.face.detected"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, -[VOTImageExplorerObjectClassificationElement objectIndex](self, "objectIndex")));
LABEL_8:
    v23 = (void *)v8;
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerObjectClassificationElement matchingScenes](self, "matchingScenes"));
  v10 = objc_msgSend(v9, "count");

  if (!v10)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "classificationLocalizedValue"));
    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerObjectClassificationElement matchingScenes](self, "matchingScenes"));
  v12 = objc_msgSend(v11, "count");

  if (v12 == (id)1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerObjectClassificationElement matchingScenes](self, "matchingScenes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", 0));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sceneClassId"));
    v16 = objc_msgSend(v15, "intValue");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sceneClassId"));
    v19 = objc_msgSend(v18, "intValue");

    if (+[AXMPhotoVisionSupport axmIsSceneClassId:childOfSceneClassId:](AXMPhotoVisionSupport, "axmIsSceneClassId:childOfSceneClassId:", v16, v19))
    {
      v20 = (id)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerObjectClassificationElement matchingScenes](self, "matchingScenes"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allObjects"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndex:", 0));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "classificationLocalizedValue"));

    }
    else
    {
      v20 = (id)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "classificationLocalizedValue"));
    }
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerElement feature](self, "feature"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sceneClassId"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerObjectClassificationElement matchingScenes](self, "matchingScenes"));
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10000DA74;
    v29[3] = &unk_100024BA8;
    v30 = v25;
    v20 = v25;
    objc_msgSend(v26, "enumerateObjectsUsingBlock:", v29);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[AXMPhotoVisionSupport findLeastCommonAncestorForSceneClassIds:withKnownAncestorSceneClassId:](AXMPhotoVisionSupport, "findLeastCommonAncestorForSceneClassIds:withKnownAncestorSceneClassId:", v20, objc_msgSend(v7, "intValue")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedName"));

  }
LABEL_12:

  return v23;
}

- (NSSet)matchingScenes
{
  return self->_matchingScenes;
}

- (void)setMatchingScenes:(id)a3
{
  objc_storeStrong((id *)&self->_matchingScenes, a3);
}

- (int64_t)objectIndex
{
  return self->_objectIndex;
}

- (void)setObjectIndex:(int64_t)a3
{
  self->_objectIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingScenes, 0);
}

@end
