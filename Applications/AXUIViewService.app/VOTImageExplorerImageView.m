@implementation VOTImageExplorerImageView

- (void)setVisionFeatures:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[VOTImageExplorerImageView setObjectClassificationFeatures:](self, "setObjectClassificationFeatures:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[VOTImageExplorerImageView setSceneClassificationFeatures:](self, "setSceneClassificationFeatures:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[VOTImageExplorerImageView setOcrFeatures:](self, "setOcrFeatures:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[VOTImageExplorerImageView setFaceFeatures:](self, "setFaceFeatures:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[VOTImageExplorerImageView setPeopleFeatures:](self, "setPeopleFeatures:", v9);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 1, CFSTR("people")));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v16 = (uint64_t)objc_msgSend(v15, "featureType");
        if (v16 <= 25)
        {
          switch(v16)
          {
            case 5:
            case 6:
              goto LABEL_8;
            case 8:
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView explorableOCRTypes](self, "explorableOCRTypes"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v15, "ocrFeatureType")));
              v20 = objc_msgSend(v18, "containsObject:", v19);

              if (!v20)
                continue;
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView ocrFeatures](self, "ocrFeatures"));
              break;
            case 9:
              goto LABEL_17;
            case 10:
              goto LABEL_19;
            default:
              continue;
          }
          goto LABEL_23;
        }
        if (v16 == 26)
        {
          if (!AXRuntimeCheck_MediaAnalysisSupport())
            continue;
LABEL_17:
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView sceneClassificationFeatures](self, "sceneClassificationFeatures"));
          goto LABEL_23;
        }
        if (v16 == 27)
        {
          if (!AXRuntimeCheck_MediaAnalysisSupport())
            continue;
LABEL_19:
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "classificationLabel"));
          v22 = objc_msgSend(v30, "containsObject:", v21);

          if ((v22 & 1) != 0)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "classificationLabel"));
            v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("people"));

            if (!v24)
              continue;
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView peopleFeatures](self, "peopleFeatures"));
          }
          else
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView objectClassificationFeatures](self, "objectClassificationFeatures"));
          }
          goto LABEL_23;
        }
        if (v16 == 31 && AXRuntimeCheck_MediaAnalysisSupport())
        {
LABEL_8:
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView faceFeatures](self, "faceFeatures"));
LABEL_23:
          v25 = v17;
          objc_msgSend(v17, "axSafelyAddObject:", v15);

          continue;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v12);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView faceFeatures](self, "faceFeatures"));
  if (objc_msgSend(v26, "count"))
    goto LABEL_29;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView peopleFeatures](self, "peopleFeatures"));
  v28 = objc_msgSend(v27, "count");

  if (v28)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView objectClassificationFeatures](self, "objectClassificationFeatures"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView peopleFeatures](self, "peopleFeatures"));
    objc_msgSend(v26, "axSafelyAddObjectsFromArray:", v29);

LABEL_29:
  }

}

- (NSDictionary)elements
{
  void *v3;
  void *v4;
  NSDictionary *v5;
  NSDictionary *elements;
  void *v8;
  id v9;

  if (!self->_elements)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView ocrFeatures](self, "ocrFeatures"));
    if (!objc_msgSend(v3, "count"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView objectClassificationFeatures](self, "objectClassificationFeatures"));
      if (!objc_msgSend(v4, "count"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView faceFeatures](self, "faceFeatures"));
        v9 = objc_msgSend(v8, "count");

        if (!v9)
          return self->_elements;
        goto LABEL_6;
      }

    }
LABEL_6:
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView generateAccessibilityElements](self, "generateAccessibilityElements"));
    elements = self->_elements;
    self->_elements = v5;

  }
  return self->_elements;
}

- (NSArray)axSortedElements
{
  void *v3;
  NSArray *v4;
  NSArray *axSortedElements;

  if (!self->_axSortedElements)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView elements](self, "elements"));

    if (v3)
    {
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView sortedElements](self, "sortedElements"));
      axSortedElements = self->_axSortedElements;
      self->_axSortedElements = v4;

    }
  }
  return self->_axSortedElements;
}

- (id)filteredSubfeaturesForFeature:(id)a3 withOCRType:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "subfeatures"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A39C;
  v9[3] = &unk_100024948;
  v9[4] = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v9));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "filteredArrayUsingPredicate:", v6));

  return v7;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView axSortedElements](self, "axSortedElements"));
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)accessibilityCustomRotors
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v34.receiver = self;
  v34.super_class = (Class)VOTImageExplorerImageView;
  v4 = -[VOTImageExplorerImageView accessibilityCustomRotors](&v34, "accessibilityCustomRotors");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v29 = v3;
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView ocrFeatures](self, "ocrFeatures"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = objc_alloc_init((Class)NSMutableSet);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView ocrFeatures](self, "ocrFeatures"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (!v10)
      goto LABEL_22;
    v11 = v10;
    v12 = *(_QWORD *)v31;
    while (1)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v14, "ocrFeatureType")));
        v16 = objc_msgSend(v8, "containsObject:", v15);

        if ((v16 & 1) == 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v14, "ocrFeatureType")));
          objc_msgSend(v8, "addObject:", v17);

          v18 = (uint64_t)objc_msgSend(v14, "ocrFeatureType");
          if (v18 <= 12)
          {
            if (v18 == 1)
            {
              v19 = CFSTR("VoiceOverImageExplorer.text.rotor");
            }
            else
            {
              if (v18 != 7)
                continue;
              v19 = CFSTR("VoiceOverImageExplorer.table.rotor");
            }
            goto LABEL_19;
          }
          if (v18 == 16 || v18 == 13)
          {
            v19 = CFSTR("VoiceOverImageExplorer.document.rotor");
LABEL_19:
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView imageExplorerRotorWithName:](self, "imageExplorerRotorWithName:", v19));
            objc_msgSend(v29, "axSafelyAddObject:", v21);

            continue;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (!v11)
      {
LABEL_22:

        break;
      }
    }
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView objectClassificationFeatures](self, "objectClassificationFeatures"));
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView imageExplorerRotorWithName:](self, "imageExplorerRotorWithName:", CFSTR("VoiceOverImageExplorer.objects.rotor")));
    objc_msgSend(v29, "axSafelyAddObject:", v24);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView faceFeatures](self, "faceFeatures"));
  v26 = objc_msgSend(v25, "count");

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView imageExplorerRotorWithName:](self, "imageExplorerRotorWithName:", CFSTR("VoiceOverImageExplorer.people.rotor")));
    objc_msgSend(v29, "axSafelyAddObject:", v27);

  }
  return v29;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

- (BOOL)_accessibilityShouldIncludeRemoteParentCustomActions
{
  return 0;
}

- (BOOL)_accessibilityShouldIncludeRegionDescription
{
  return 0;
}

- (id)explorableOCRTypes
{
  return &off_100026028;
}

- (id)generateAccessibilityElements
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView ocrFeatures](self, "ocrFeatures"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView _generateOCRDocumentAccessibilityElements](self, "_generateOCRDocumentAccessibilityElements"));
    objc_msgSend(v3, "axSafelyAddEntriesFromDictionary:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView faceFeatures](self, "faceFeatures"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView _generateFaceAccessibilityElements](self, "_generateFaceAccessibilityElements"));
    objc_msgSend(v3, "axSafelyAddEntriesFromDictionary:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView objectClassificationFeatures](self, "objectClassificationFeatures"));
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView _generateObjectClassificationAccessibilityElements](self, "_generateObjectClassificationAccessibilityElements"));
    objc_msgSend(v3, "axSafelyAddEntriesFromDictionary:", v12);

  }
  return v3;
}

- (id)_generateOCRDocumentAccessibilityElements
{
  void *v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  VOTImageExplorerTableElement *v10;
  VOTImageExplorerTableElement *v11;
  void *v12;
  const __CFString *v13;
  VOTImageExplorerDocumentElement *v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  void *v24;
  void *v25;
  VOTImageExplorerTextElement *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  _BOOL8 v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  __int128 v38;
  uint64_t v39;
  void *v40;
  id v41;
  id obj;
  const __CFString *v43;
  VOTImageExplorerTableElement *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  const __CFString *v55;
  _BYTE v56[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView ocrFeatures](self, "ocrFeatures"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v49;
    *(_QWORD *)&v5 = 138412546;
    v38 = v5;
    v39 = *(_QWORD *)v49;
    v40 = v3;
    do
    {
      v8 = 0;
      v41 = v6;
      do
      {
        if (*(_QWORD *)v49 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend(v9, "ocrFeatureType", v38) == (id)1)
        {
          v10 = (VOTImageExplorerTableElement *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView _generateOCRTextAccessibilityElementsForFeature:](self, "_generateOCRTextAccessibilityElementsForFeature:", v9));
          objc_msgSend(v3, "axSafelyAddEntriesFromDictionary:", v10);
        }
        else
        {
          v45 = v8;
          if (objc_msgSend(v9, "ocrFeatureType") == (id)7)
          {
            v11 = -[VOTImageExplorerElement initWithImageView:forFeature:hasFlippedYAxis:]([VOTImageExplorerTableElement alloc], "initWithImageView:forFeature:hasFlippedYAxis:", self, v9, 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView _accessibilityCustomContentForFeature:](self, "_accessibilityCustomContentForFeature:", v9));
            v44 = v11;
            -[VOTImageExplorerTableElement setAccessibilityCustomContent:](v11, "setAccessibilityCustomContent:", v12);
            v13 = CFSTR("VoiceOverImageExplorer.table.rotor");
          }
          else
          {
            v14 = -[VOTImageExplorerElement initWithImageView:forFeature:hasFlippedYAxis:]([VOTImageExplorerDocumentElement alloc], "initWithImageView:forFeature:hasFlippedYAxis:", self, v9, 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView _accessibilityCustomContentForFeature:](self, "_accessibilityCustomContentForFeature:", v9));
            v44 = (VOTImageExplorerTableElement *)v14;
            -[VOTImageExplorerDocumentElement setAccessibilityCustomContent:](v14, "setAccessibilityCustomContent:", v12);
            v13 = CFSTR("VoiceOverImageExplorer.document.rotor");
          }
          v43 = v13;

          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView filteredSubfeaturesForFeature:withOCRType:](self, "filteredSubfeaturesForFeature:withOCRType:", v9, 9));
          v17 = objc_msgSend(v16, "count");

          if (v17)
          {
            v18 = 0;
            do
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView filteredSubfeaturesForFeature:withOCRType:](self, "filteredSubfeaturesForFeature:withOCRType:", v9, 9));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndex:", v18));

              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subfeatures"));
              v22 = objc_msgSend(v21, "count");

              if (v22)
              {
                v23 = 0;
                do
                {
                  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subfeatures"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndex:", v23));

                  v26 = -[VOTImageExplorerTextElement initWithImageView:forTextFeature:withParentTextFeature:hasFlippedYAxis:]([VOTImageExplorerTextElement alloc], "initWithImageView:forTextFeature:withParentTextFeature:hasFlippedYAxis:", self, v25, v9, 0);
                  v27 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView _accessibilityCustomContentForFeature:](self, "_accessibilityCustomContentForFeature:", v9));
                  -[VOTImageExplorerTextElement setAccessibilityCustomContent:](v26, "setAccessibilityCustomContent:", v27);

                  -[VOTImageExplorerTextElement setRowIndex:](v26, "setRowIndex:", v18);
                  -[VOTImageExplorerTextElement setColumnIndex:](v26, "setColumnIndex:", v23);
                  objc_msgSend(v15, "axSafelyAddObject:", v26);

                  ++v23;
                  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "subfeatures"));
                  v29 = objc_msgSend(v28, "count");

                }
                while (v23 < (unint64_t)v29);
              }

              ++v18;
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView filteredSubfeaturesForFeature:withOCRType:](self, "filteredSubfeaturesForFeature:withOCRType:", v9, 9));
              v31 = objc_msgSend(v30, "count");

            }
            while (v18 < (unint64_t)v31);
          }
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_10000ACAC;
          v46[3] = &unk_1000249B0;
          v32 = v15;
          v47 = v32;
          v10 = v44;
          -[VOTImageExplorerTableElement _setAccessibilityElementsBlock:](v44, "_setAccessibilityElementsBlock:", v46);
          v3 = v40;
          v33 = -[VOTImageExplorerImageView addElement:toElements:forFeatureKey:](self, "addElement:toElements:forFeatureKey:", v44, v40, v43);
          v8 = v45;
          if (!v33)
          {
            v34 = VOTLogImageExplorer(v33);
            v35 = objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerDocumentElement description](v44, "description"));
              *(_DWORD *)buf = v38;
              v53 = v36;
              v54 = 2112;
              v55 = v43;
              _os_log_fault_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_FAULT, "Unable to add element %@ with a feature key of: %@", buf, 0x16u);

            }
          }

          v7 = v39;
          v6 = v41;
        }

        v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_generateOCRTextAccessibilityElementsForFeature:(id)a3
{
  id v4;
  void *v5;
  VOTImageExplorerDocumentElement *v6;
  void *v7;
  void *v8;
  id v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  VOTImageExplorerTextElement *v17;
  id v18;
  _BOOL8 v19;
  uint64_t v20;
  NSObject *v21;
  void *v23;
  id obj;
  uint64_t v25;
  id v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = -[VOTImageExplorerElement initWithImageView:forFeature:hasFlippedYAxis:]([VOTImageExplorerDocumentElement alloc], "initWithImageView:forFeature:hasFlippedYAxis:", self, v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v23 = v5;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subfeatures"));
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v26)
    {
      v25 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "subfeatures"));
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v30;
            do
            {
              for (j = 0; j != v14; j = (char *)j + 1)
              {
                if (*(_QWORD *)v30 != v15)
                  objc_enumerationMutation(v12);
                v17 = -[VOTImageExplorerTextElement initWithImageView:forTextFeature:withParentTextFeature:hasFlippedYAxis:]([VOTImageExplorerTextElement alloc], "initWithImageView:forTextFeature:withParentTextFeature:hasFlippedYAxis:", self, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j), v4, 0);
                objc_msgSend(v7, "axSafelyAddObject:", v17);

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            }
            while (v14);
          }

        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v26);
    }

    v5 = v23;
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10000AF9C;
  v27[3] = &unk_1000249B0;
  v18 = v7;
  v28 = v18;
  -[VOTImageExplorerDocumentElement _setAccessibilityElementsBlock:](v6, "_setAccessibilityElementsBlock:", v27);
  v19 = -[VOTImageExplorerImageView addElement:toElements:forFeatureKey:](self, "addElement:toElements:forFeatureKey:", v6, v5, CFSTR("VoiceOverImageExplorer.text.rotor"));
  if (!v19)
  {
    v20 = VOTLogImageExplorer(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      sub_1000141CC(v6, v21);

  }
  return v5;
}

- (id)_generateObjectClassificationAccessibilityElements
{
  void *v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  VOTImageExplorerObjectClassificationElement *v15;
  void *v16;
  _BOOL8 v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  __int128 v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const __CFString *v31;
  _BYTE v32[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView objectClassificationFeatures](self, "objectClassificationFeatures"));
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v25;
    *(_QWORD *)&v5 = 138412546;
    v22 = v5;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView sceneClassificationFeatures](self, "sceneClassificationFeatures", v22));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXMVisionFeature filterFeatureList:basedOnSceneClassIdsForFeature:](AXMVisionFeature, "filterFeatureList:basedOnSceneClassIdsForFeature:", v11, v10));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "classificationLabel"));
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("people"));

        v7 += v14;
        v15 = -[VOTImageExplorerObjectClassificationElement initWithImageView:forFeature:withMatchingScenes:hasFlippedYAxis:objectIndex:]([VOTImageExplorerObjectClassificationElement alloc], "initWithImageView:forFeature:withMatchingScenes:hasFlippedYAxis:objectIndex:", self, v10, v12, 1, v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView _accessibilityCustomContentForFeature:](self, "_accessibilityCustomContentForFeature:", v10));
        -[VOTImageExplorerObjectClassificationElement setAccessibilityCustomContent:](v15, "setAccessibilityCustomContent:", v16);

        v17 = -[VOTImageExplorerImageView addElement:toElements:forFeatureKey:](self, "addElement:toElements:forFeatureKey:", v15, v3, CFSTR("VoiceOverImageExplorer.objects.rotor"));
        if (!v17)
        {
          v18 = VOTLogImageExplorer(v17);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerObjectClassificationElement description](v15, "description"));
            *(_DWORD *)buf = v22;
            v29 = v20;
            v30 = 2112;
            v31 = CFSTR("VoiceOverImageExplorer.objects.rotor");
            _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Unable to add element %@ with a feature key of: %@", buf, 0x16u);

          }
        }

        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_generateFaceAccessibilityElements
{
  void *v3;
  void *v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  VOTImageExplorerFaceElement *v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  void *v27;
  id obj;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const __CFString *v38;
  _BYTE v39[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView faceFeatures](self, "faceFeatures"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v32;
    *(_QWORD *)&v6 = 138412546;
    v26 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView _findPeopleFeatureThatOverlapsWithFace:](self, "_findPeopleFeatureThatOverlapsWithFace:", v10, v26));
        objc_msgSend(v4, "axSafelyAddObject:", v11);
        v12 = -[VOTImageExplorerFaceElement initWithImageView:forFaceFeature:withOverlappingPeopleFeature:hasFlippedYAxis:]([VOTImageExplorerFaceElement alloc], "initWithImageView:forFaceFeature:withOverlappingPeopleFeature:hasFlippedYAxis:", self, v10, v11, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView _accessibilityCustomContentForFeature:](self, "_accessibilityCustomContentForFeature:", v10));
        -[VOTImageExplorerFaceElement setAccessibilityCustomContent:](v12, "setAccessibilityCustomContent:", v13);

        v14 = -[VOTImageExplorerImageView addElement:toElements:forFeatureKey:](self, "addElement:toElements:forFeatureKey:", v12, v3, CFSTR("VoiceOverImageExplorer.people.rotor"));
        if (!v14)
        {
          v15 = VOTLogImageExplorer(v14);
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerFaceElement description](v12, "description"));
            *(_DWORD *)buf = v26;
            v36 = v27;
            v37 = 2112;
            v38 = CFSTR("VoiceOverImageExplorer.people.rotor");
            _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "Unable to add element %@ with a feature key of: %@", buf, 0x16u);

          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView faceFeatures](self, "faceFeatures"));
  v18 = objc_msgSend(v17, "count");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView peopleFeatures](self, "peopleFeatures"));
  v20 = objc_msgSend(v19, "count");

  if (v18 < v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView peopleFeatures](self, "peopleFeatures"));

    if (v21 && v4)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView peopleFeatures](self, "peopleFeatures"));
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10000B544;
      v29[3] = &unk_1000249D8;
      v30 = v4;
      objc_msgSend(v22, "ax_removeObjectsFromArrayUsingBlock:", v29);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView objectClassificationFeatures](self, "objectClassificationFeatures"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView peopleFeatures](self, "peopleFeatures"));
    objc_msgSend(v23, "axSafelyAddObjectsFromArray:", v24);

  }
  return v3;
}

- (id)_findPeopleFeatureThatOverlapsWithFace:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  uint64_t *v12;
  _QWORD v13[4];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_10000B698;
  v18 = sub_10000B6A8;
  v19 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0x10000000000000;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView peopleFeatures](self, "peopleFeatures"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B6B0;
  v9[3] = &unk_100024A00;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = v13;
  v12 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v15[5];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (BOOL)addElement:(id)a3 toElements:(id)a4 forFeatureKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  if (a5)
  {
    v8 = a5;
    v9 = a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));
    if (!v10)
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v10, "addObject:", v7);
    objc_msgSend(v9, "setObject:forKey:", v10, v8);

  }
  return a5 != 0;
}

- (id)imageExplorerRotorWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView elements](self, "elements"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView imageExplorerRotorCache](self, "imageExplorerRotorCache"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));
    if (!v7)
    {
      objc_initWeak(&location, self);
      v8 = objc_alloc((Class)UIAccessibilityCustomRotor);
      v9 = sub_10000DC74(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000BAA8;
      v13[3] = &unk_100024A68;
      objc_copyWeak(&v15, &location);
      v11 = v4;
      v14 = v11;
      v7 = objc_msgSend(v8, "initWithName:itemSearchBlock:", v10, v13);

      objc_msgSend(v6, "setObject:forKey:", v7, v11);
      -[VOTImageExplorerImageView setImageExplorerRotorCache:](self, "setImageExplorerRotorCache:", v6);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)sortedElements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView elements](self, "elements"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForKeyPath:", CFSTR("@unionOfArrays.self")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingSelector:", "accessibilityCompareGeometry:"));
  return v5;
}

- (id)_axRelationOfCurrentFrame:(CGRect)a3 withNeighborFrame:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double MaxY;
  double MidX;
  double MidY;
  const __CFString *v15;
  __CFString *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  double MaxX;
  double MinY;
  double MinX;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  MinX = CGRectGetMinX(a4);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MaxX = CGRectGetMaxX(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  MinY = CGRectGetMinY(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MaxY = CGRectGetMaxY(v26);
  v27.origin.x = v11;
  v27.origin.y = v10;
  v27.size.width = v9;
  v27.size.height = v8;
  MidX = CGRectGetMidX(v27);
  v28.origin.x = v11;
  v28.origin.y = v10;
  v28.size.width = v9;
  v28.size.height = v8;
  MidY = CGRectGetMidY(v28);
  if (MidX < MinX)
  {
    v15 = CFSTR("VoiceOverImageExplorer.relations.top-right");
    if (MidY < MaxY)
      v15 = CFSTR("VoiceOverImageExplorer.relations.right");
    if (MidY >= MinY)
      v16 = (__CFString *)v15;
    else
      v16 = CFSTR("VoiceOverImageExplorer.relations.bottom-right");
    goto LABEL_18;
  }
  if (MidX >= MaxX)
  {
    v18 = CFSTR("VoiceOverImageExplorer.relations.top-left");
    if (MidY < MaxY)
      v18 = CFSTR("VoiceOverImageExplorer.relations.left");
    if (MidY > MinY)
      v16 = (__CFString *)v18;
    else
      v16 = CFSTR("VoiceOverImageExplorer.relations.bottom-left");
    goto LABEL_18;
  }
  if (MidY <= MinY)
  {
    v16 = CFSTR("VoiceOverImageExplorer.relations.bottom");
LABEL_18:
    v19 = sub_10000DC74(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v19);
    return v17;
  }
  if (MidY >= MaxY)
  {
    v16 = CFSTR("VoiceOverImageExplorer.relations.top");
    goto LABEL_18;
  }
  v17 = 0;
  return v17;
}

- (id)_axNearbyRelationKeyForFeature:(id)a3 andNeighborFeature:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  _BOOL4 v9;
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
  double v25;
  double v26;
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
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "featureType") == (id)10;
  v9 = objc_msgSend(v6, "featureType") == (id)10;
  if (AXRuntimeCheck_MediaAnalysisSupport())
  {
    v8 = objc_msgSend(v7, "featureType") == (id)27;
    v9 = objc_msgSend(v6, "featureType") == (id)27;
  }
  if (v6 == v7)
  {
    v46 = 0;
  }
  else
  {
    objc_msgSend(v6, "normalizedFrame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[VOTImageExplorerImageView frame](self, "frame");
    if (v9)
      v20 = 1.0 - v13 - v17;
    else
      v20 = v13;
    v21 = UIAccessibilityFrameForBounds(self, v11 * v18, v19 * v20, v15 * v18, v17 * v19);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    objc_msgSend(v7, "normalizedFrame");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    -[VOTImageExplorerImageView frame](self, "frame");
    if (v8)
      v38 = 1.0 - v31 - v35;
    else
      v38 = v31;
    v39 = UIAccessibilityFrameForBounds(self, v29 * v36, v37 * v38, v33 * v36, v35 * v37);
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView _axRelationOfCurrentFrame:withNeighborFrame:](self, "_axRelationOfCurrentFrame:withNeighborFrame:", v21, v23, v25, v27, v39, v40, v42, v44));
    v53.origin.x = v21;
    v53.origin.y = v23;
    v53.size.width = v25;
    v53.size.height = v27;
    v56.origin.x = v39;
    v56.origin.y = v41;
    v56.size.width = v43;
    v56.size.height = v45;
    if (CGRectIntersectsRect(v53, v56))
    {
      v54.origin.x = v21;
      v54.origin.y = v23;
      v54.size.width = v25;
      v54.size.height = v27;
      v57.origin.x = v39;
      v57.origin.y = v41;
      v57.size.width = v43;
      v57.size.height = v45;
      if (CGRectContainsRect(v54, v57))
        goto LABEL_13;
      v55.origin.x = v39;
      v55.origin.y = v41;
      v55.size.width = v43;
      v55.size.height = v45;
      v58.origin.x = v21;
      v58.origin.y = v23;
      v58.size.width = v25;
      v58.size.height = v27;
      if (CGRectContainsRect(v55, v58))
      {
LABEL_13:
        v47 = sub_10000DC74(CFSTR("VoiceOverImageExplorer.relations.overlaps"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
        v50 = __UIAXStringForVariables(v48, v49);
        v51 = objc_claimAutoreleasedReturnValue(v50);

        v46 = (void *)v51;
      }
    }
  }

  return v46;
}

- (id)_axNearbyRelationsForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView faceFeatures](self, "faceFeatures"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000C388;
  v26[3] = &unk_100024A90;
  objc_copyWeak(&v29, &location);
  v7 = v4;
  v27 = v7;
  v8 = v5;
  v28 = v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v26);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView objectClassificationFeatures](self, "objectClassificationFeatures"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000C4E8;
  v22[3] = &unk_100024A90;
  objc_copyWeak(&v25, &location);
  v10 = v7;
  v23 = v10;
  v11 = v8;
  v24 = v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v22);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView ocrFeatures](self, "ocrFeatures"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000C5F8;
  v18[3] = &unk_100024A90;
  objc_copyWeak(&v21, &location);
  v13 = v10;
  v19 = v13;
  v14 = v11;
  v20 = v14;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v18);

  v15 = v20;
  v16 = v14;

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  return v16;
}

- (id)_accessibilityCustomContentForFeature:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_10000B698;
  v13 = sub_10000B6A8;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VOTImageExplorerImageView _axNearbyRelationsForFeature:](self, "_axNearbyRelationsForFeature:", v4));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C830;
  v8[3] = &unk_100024B80;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

- (NSArray)visionFeatures
{
  return self->_visionFeatures;
}

- (void)setElements:(id)a3
{
  objc_storeStrong((id *)&self->_elements, a3);
}

- (void)setAxSortedElements:(id)a3
{
  objc_storeStrong((id *)&self->_axSortedElements, a3);
}

- (NSMutableArray)ocrFeatures
{
  return self->_ocrFeatures;
}

- (void)setOcrFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_ocrFeatures, a3);
}

- (NSMutableArray)objectClassificationFeatures
{
  return self->_objectClassificationFeatures;
}

- (void)setObjectClassificationFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_objectClassificationFeatures, a3);
}

- (NSMutableArray)sceneClassificationFeatures
{
  return self->_sceneClassificationFeatures;
}

- (void)setSceneClassificationFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_sceneClassificationFeatures, a3);
}

- (NSMutableArray)faceFeatures
{
  return self->_faceFeatures;
}

- (void)setFaceFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_faceFeatures, a3);
}

- (NSMutableArray)peopleFeatures
{
  return self->_peopleFeatures;
}

- (void)setPeopleFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_peopleFeatures, a3);
}

- (NSMutableDictionary)imageExplorerRotorCache
{
  return self->_imageExplorerRotorCache;
}

- (void)setImageExplorerRotorCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageExplorerRotorCache, a3);
}

- (NSArray)filteredRowFeatures
{
  return self->_filteredRowFeatures;
}

- (void)setFilteredRowFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_filteredRowFeatures, a3);
}

- (NSArray)filteredColumnFeatures
{
  return self->_filteredColumnFeatures;
}

- (void)setFilteredColumnFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_filteredColumnFeatures, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredColumnFeatures, 0);
  objc_storeStrong((id *)&self->_filteredRowFeatures, 0);
  objc_storeStrong((id *)&self->_imageExplorerRotorCache, 0);
  objc_storeStrong((id *)&self->_peopleFeatures, 0);
  objc_storeStrong((id *)&self->_faceFeatures, 0);
  objc_storeStrong((id *)&self->_sceneClassificationFeatures, 0);
  objc_storeStrong((id *)&self->_objectClassificationFeatures, 0);
  objc_storeStrong((id *)&self->_ocrFeatures, 0);
  objc_storeStrong((id *)&self->_axSortedElements, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_visionFeatures, 0);
}

@end
