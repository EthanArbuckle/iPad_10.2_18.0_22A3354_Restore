@implementation AKAnnotation

- (AKAnnotation)init
{
  AKAnnotation *v2;
  void *v3;
  uint64_t v4;
  NSString *UUID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKAnnotation;
  v2 = -[AKAnnotation init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    UUID = v2->_UUID;
    v2->_UUID = (NSString *)v4;

    v2->_shouldUsePlaceholderText = 1;
    v2->_editsDisableAppearanceOverride = 1;
    v2->_conformsToAKStrokedAnnotationProtocol = -[AKAnnotation conformsToProtocol:](v2, "conformsToProtocol:", &unk_255A41BC8);
    v2->_conformsToAKFilledAnnotationProtocol = -[AKAnnotation conformsToProtocol:](v2, "conformsToProtocol:", &unk_255A41C48);
    v2->_conformsToAKRectangularAnnotationProtocol = -[AKAnnotation conformsToProtocol:](v2, "conformsToProtocol:", &unk_255A40F98);
    v2->_conformsToAKFlippableAnnotationProtocol = -[AKAnnotation conformsToProtocol:](v2, "conformsToProtocol:", &unk_255A42500);
    v2->_conformsToAKRotatableAnnotationProtocol = -[AKAnnotation conformsToProtocol:](v2, "conformsToProtocol:", &unk_255A41020);
    v2->_conformsToAKTextAnnotationProtocol = -[AKAnnotation conformsToProtocol:](v2, "conformsToProtocol:", &unk_255A421E8);
    v2->_conformsToAKParentAnnotationProtocol = -[AKAnnotation conformsToProtocol:](v2, "conformsToProtocol:", &unk_255A423E8);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CGPDFDocumentRelease(self->_appearanceOverridePDF);
  if (-[AKAnnotation shouldObserveEdits](self, "shouldObserveEdits"))
    -[AKAnnotation setShouldObserveEdits:](self, "setShouldObserveEdits:", 0);
  if (-[AKAnnotation shouldUseAppearanceOverride](self, "shouldUseAppearanceOverride"))
    -[AKAnnotation setShouldUseAppearanceOverride:](self, "setShouldUseAppearanceOverride:", 0);
  -[AKAnnotation setAppearanceOverride:](self, "setAppearanceOverride:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AKAnnotation;
  -[AKAnnotation dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  -[AKAnnotation dataRepresentation](self, "dataRepresentation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[AKAnnotation annotationWithData:](AKAnnotation, "annotationWithData:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)keyPathsForValuesAffectingHitTestBounds
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

+ (id)keyPathsForValuesAffectingDrawingBounds
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("rotationAngle"));
}

+ (id)displayNameForUndoablePropertyChangeWithKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;

  v3 = a3;
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("rotationAngle")))
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("isEdited")) & 1) == 0
      && (objc_msgSend(v3, "isEqualToString:", CFSTR("shouldObserveEdits")) & 1) == 0
      && (objc_msgSend(v3, "isEqualToString:", CFSTR("shouldUseAppearanceOverride")) & 1) == 0)
    {
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("childAnnotation")))
      {
        +[AKController akBundle](AKController, "akBundle");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("Note");
        goto LABEL_3;
      }
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("author")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("modificationDate")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass (key: %@"), "+[AKAnnotation displayNameForUndoablePropertyChangeWithKey:]", v3);
        v7 = 0;
        goto LABEL_12;
      }
    }
    v7 = &stru_24F1A83D0;
    goto LABEL_12;
  }
  +[AKController akBundle](AKController, "akBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = CFSTR("Rotation");
LABEL_3:
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24F1A83D0, CFSTR("AnnotationStrings"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v7;
}

+ (id)defaultPlaceholderText
{
  return 0;
}

+ (AKAnnotation)annotationWithData:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v5 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_22907FBD4();
    goto LABEL_10;
  }
  if (!objc_msgSend(v3, "length"))
  {
    v5 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_22907FC00();
    goto LABEL_10;
  }
  v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v4, 0);
  if (!v5)
  {
LABEL_10:
    v6 = 0;
    goto LABEL_15;
  }
  -[NSObject decodeObjectOfClass:forKey:](v5, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD0E88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      sub_22907FC2C();

    v6 = 0;
  }
  -[NSObject finishDecoding](v5, "finishDecoding");
LABEL_15:

  return (AKAnnotation *)v6;
}

- (id)dataRepresentation
{
  void *v2;
  id v3;
  NSObject *v4;
  id v6;

  v6 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 0, &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;
  if (v3)
  {
    v4 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_22907FD50((uint64_t)v3, v4);
  }
  else
  {
    if (objc_msgSend(v2, "length"))
      goto LABEL_6;
    v4 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_22907FD24();
  }

LABEL_6:
  return v2;
}

- (NSString)displayName
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), "-[AKAnnotation displayName]");
  return 0;
}

- (BOOL)shouldBurnIn
{
  return 0;
}

- (id)keysForValuesToObserveForUndo
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", CFSTR("isEdited"));
  objc_msgSend(v3, "addObject:", CFSTR("shouldObserveEdits"));
  objc_msgSend(v3, "addObject:", CFSTR("shouldUseAppearanceOverride"));
  objc_msgSend(v3, "addObject:", CFSTR("author"));
  objc_msgSend(v3, "addObject:", CFSTR("modificationDate"));
  if (-[AKAnnotation conformsToAKRotatableAnnotationProtocol](self, "conformsToAKRotatableAnnotationProtocol"))
    objc_msgSend(v3, "addObject:", CFSTR("rotationAngle"));
  if (-[AKAnnotation conformsToAKParentAnnotationProtocol](self, "conformsToAKParentAnnotationProtocol"))
    objc_msgSend(v3, "addObject:", CFSTR("childAnnotation"));
  return v3;
}

- (id)keysForValuesToObserveForRedrawing
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("drawingBounds"), CFSTR("isEditingText"), 0);
}

- (id)keysForValuesToObserveForAdornments
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("drawingBounds"), CFSTR("isEditingText"), 0);
}

- (void)setOriginalModelBaseScaleFactor:(double)a3
{
  self->_originalModelBaseScaleFactor = a3;
}

- (void)setOriginalExifOrientation:(int64_t)a3
{
  self->_originalExifOrientation = a3;
}

- (CGRect)hitTestBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), "-[AKAnnotation hitTestBounds]");
  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)drawingBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  +[AKAnnotationRenderer drawingBoundsOfAnnotation:](AKAnnotationRenderer, "drawingBoundsOfAnnotation:", self);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)integralDrawingBounds
{
  double x;
  double y;
  double width;
  double height;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect result;

  -[AKAnnotation drawingBounds](self, "drawingBounds");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  if (!CGRectIsInfinite(v14))
  {
    +[AKGeometryHelper stableIntegralRectForRect:](AKGeometryHelper, "stableIntegralRectForRect:", x, y, width, height);
    x = v6;
    y = v7;
    width = v8;
    height = v9;
  }
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)flattenModelExifOrientation:(int64_t)a3 withModelSize:(CGSize)a4
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), a4.width, a4.height, "-[AKAnnotation flattenModelExifOrientation:withModelSize:]");
}

- (void)translateBy:(CGPoint)a3
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%s must be overriden by a subclass"), a3.x, a3.y, "-[AKAnnotation translateBy:]");
}

- (void)setShouldObserveEdits:(BOOL)a3
{
  BOOL v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _QWORD block[4];
  id v14;
  id v15;
  id location;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (self->_isObservingForIsEdited == a3)
    return;
  self->_isObservingForIsEdited = a3;
  v4 = !self->_isReallyObservingForIsEdited || a3;
  v5 = !self->_isReallyObservingForIsEdited && a3;
  -[AKAnnotation keysForValuesToObserveForUndo](self, "keysForValuesToObserveForUndo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_255A271D0 == -1)
  {
    if (!v4)
    {
LABEL_10:
      self->_isReallyObservingForIsEdited = 0;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
            if ((objc_msgSend((id)qword_255A271C8, "containsObject:", v12) & 1) == 0)
              -[AKAnnotation removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, v12, CFSTR("AKAnnotation.annotationPropertyObservationForIsEditedContext"));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);
      }

    }
  }
  else
  {
    dispatch_once(&qword_255A271D0, &unk_24F1A71F8);
    if (!v4)
      goto LABEL_10;
  }
  if (v5)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_229043DA8;
    block[3] = &unk_24F1A7770;
    objc_copyWeak(&v15, &location);
    v14 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

- (BOOL)shouldObserveEdits
{
  return self->_isObservingForIsEdited;
}

- (void)setAppearanceOverride:(id)a3
{
  id v4;
  id appearanceOverride;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v4 = a3;
  appearanceOverride = self->_appearanceOverride;
  if (v4)
  {
    v6 = v4;
    v11 = objc_msgSend(v4, "copy");

    v7 = (void *)MEMORY[0x22E2C12D0](v11);
    v8 = self->_appearanceOverride;
    self->_appearanceOverride = v7;

    if (!appearanceOverride)
    {
      -[AKAnnotation setShouldUseAppearanceOverride:](self, "setShouldUseAppearanceOverride:", 1);
      -[AKAnnotation drawingBounds](self, "drawingBounds");
      -[AKAnnotation setInitialDrawingBoundsForAppearanceOverride:](self, "setInitialDrawingBoundsForAppearanceOverride:");
    }
    v9 = (void *)v11;
  }
  else
  {
    if (appearanceOverride)
      -[AKAnnotation setShouldUseAppearanceOverride:](self, "setShouldUseAppearanceOverride:", 0);
    v10 = self->_appearanceOverride;
    self->_appearanceOverride = 0;

    v9 = 0;
  }

}

- (id)appearanceOverride
{
  return (id)MEMORY[0x22E2C12D0](self->_appearanceOverride, a2);
}

- (BOOL)isUsingAppearanceOverride
{
  void *v3;
  BOOL v4;

  if (!-[AKAnnotation shouldUseAppearanceOverride](self, "shouldUseAppearanceOverride"))
    return 0;
  -[AKAnnotation appearanceOverride](self, "appearanceOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setShouldUseAppearanceOverride:(BOOL)a3
{
  BOOL v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _QWORD block[4];
  id v14;
  id v15;
  id location;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (self->_shouldUseAppearanceOverride == a3)
    return;
  self->_shouldUseAppearanceOverride = a3;
  v4 = !self->_isObservingForAppearance || a3;
  v5 = !self->_isObservingForAppearance && a3;
  -[AKAnnotation keysForValuesToObserveForUndo](self, "keysForValuesToObserveForUndo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_255A271E0 == -1)
  {
    if (!v4)
    {
LABEL_10:
      self->_isObservingForAppearance = 0;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
            if ((objc_msgSend((id)qword_255A271D8, "containsObject:", v12) & 1) == 0)
              -[AKAnnotation removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, v12, CFSTR("AKAnnotation.annotationPropertyObservationForAppearanceContext"));
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v9);
      }

    }
  }
  else
  {
    dispatch_once(&qword_255A271E0, &unk_24F1A8058);
    if (!v4)
      goto LABEL_10;
  }
  if (v5)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_229044248;
    block[3] = &unk_24F1A7770;
    objc_copyWeak(&v15, &location);
    v14 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

- (BOOL)shouldUseAppearanceOverride
{
  return self->_shouldUseAppearanceOverride;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  double v23;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a6 == CFSTR("AKAnnotation.annotationPropertyObservationForIsEditedContext"))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqual:", v15) & 1) == 0)
    {
      if (!-[AKAnnotation isEdited](self, "isEdited"))
        -[AKAnnotation setIsEdited:](self, "setIsEdited:", 1);
      if (-[AKAnnotation shouldObserveEdits](self, "shouldObserveEdits"))
        -[AKAnnotation setShouldObserveEdits:](self, "setShouldObserveEdits:", 0);
    }
    goto LABEL_14;
  }
  if (a6 == CFSTR("AKAnnotation.annotationPropertyObservationForAppearanceContext"))
  {
    if (!-[AKAnnotation editsDisableAppearanceOverride](self, "editsDisableAppearanceOverride"))
      goto LABEL_15;
    sub_22906F844();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("rectangle"))
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_msgSend(v15, "akRectValue");
      v18 = v17;
      v20 = v19;
      objc_msgSend(v14, "akRectValue");
      v22 = v18 == v21;
      if (v20 != v23)
        v22 = 0;
      if (((v22 | v16) & 1) != 0)
        goto LABEL_14;
    }
    else if ((v16 & 1) != 0)
    {
LABEL_14:

      goto LABEL_15;
    }
    -[AKAnnotation setShouldUseAppearanceOverride:](self, "setShouldUseAppearanceOverride:", 0);
    goto LABEL_14;
  }
  v24.receiver = self;
  v24.super_class = (Class)AKAnnotation;
  -[AKAnnotation observeValueForKeyPath:ofObject:change:context:](&v24, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_15:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  CGDataConsumerRef v19;
  CGDataConsumer *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGContext *v27;
  CGContext *v28;
  void (**v29)(_QWORD, _QWORD);
  CGRect v30;

  v4 = a3;
  if ((sub_22906F844() & 1) == 0)
  {
    -[AKAnnotation setAkSerializationVersion:](self, "setAkSerializationVersion:", 2);
    -[AKAnnotation setAkSerializationPlatform:](self, "setAkSerializationPlatform:", 2);
  }
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKAnnotation akSerializationVersion](self, "akSerializationVersion"), CFSTR("akVers"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKAnnotation akSerializationPlatform](self, "akSerializationPlatform"), CFSTR("akPlat"));
  -[AKAnnotation UUID](self, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("UUID"));

  -[AKAnnotation originalModelBaseScaleFactor](self, "originalModelBaseScaleFactor");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("originalModelBaseScaleFactor"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKAnnotation originalExifOrientation](self, "originalExifOrientation"), CFSTR("originalExifOrientation"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AKAnnotation textIsClipped](self, "textIsClipped"), CFSTR("textIsClipped"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AKAnnotation textIsFixedWidth](self, "textIsFixedWidth"), CFSTR("textIsFixedWidth"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AKAnnotation textIsFixedHeight](self, "textIsFixedHeight"), CFSTR("textIsFixedHeight"));
  objc_msgSend(v4, "encodeBool:forKey:", -[AKAnnotation shouldUsePlaceholderText](self, "shouldUsePlaceholderText"), CFSTR("shouldUsePlaceholderText"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[AKAnnotation formContentType](self, "formContentType"), CFSTR("formContentType"));
  -[AKAnnotation customPlaceholderText](self, "customPlaceholderText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("customPlaceholderText"));

  -[AKAnnotation author](self, "author");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AKAnnotation author](self, "author");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("author"));

  }
  -[AKAnnotation modificationDate](self, "modificationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AKAnnotation modificationDate](self, "modificationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("modificationDate"));

  }
  -[AKAnnotation parentAnnotation](self, "parentAnnotation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("parentAnnotation.UUID"));

  }
  -[AKAnnotation childAnnotation](self, "childAnnotation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("childAnnotation.UUID"));

  }
  objc_msgSend(v4, "encodeBool:forKey:", -[AKAnnotation editsDisableAppearanceOverride](self, "editsDisableAppearanceOverride"), CFSTR("editsDisableAppearanceOverride"));
  if (-[AKAnnotation isBeingCopied](self, "isBeingCopied"))
  {
    -[AKAnnotation appearanceOverride](self, "appearanceOverride");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17 && -[AKAnnotation shouldUseAppearanceOverride](self, "shouldUseAppearanceOverride"))
    {
      v18 = -[AKAnnotation editsDisableAppearanceOverride](self, "editsDisableAppearanceOverride");

      if (v18)
        goto LABEL_20;
      objc_msgSend(MEMORY[0x24BDBCEC8], "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CGDataConsumerCreateWithCFData((CFMutableDataRef)v17);
      if (v19)
      {
        v20 = v19;
        -[AKAnnotation initialDrawingBoundsForAppearanceOverride](self, "initialDrawingBoundsForAppearanceOverride");
        v22 = v21;
        v24 = v23;
        v30.origin.x = 0.0;
        v30.origin.y = 0.0;
        v30.size.width = v25;
        v30.size.height = v26;
        v27 = CGPDFContextCreate(v20, &v30, 0);
        if (v27)
        {
          v28 = v27;
          CGPDFContextBeginPage(v27, 0);
          CGContextTranslateCTM(v28, -v22, -v24);
          -[AKAnnotation appearanceOverride](self, "appearanceOverride");
          v29 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, CGContext *))v29)[2](v29, v28);

          CGPDFContextEndPage(v28);
          CGContextFlush(v28);
          CGPDFContextClose(v28);
          objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("appearanceOverridePDF"));
          CFRelease(v28);
        }
        CFRelease(v20);
      }
    }

  }
LABEL_20:
  if (-[AKAnnotation conformsToAKRotatableAnnotationProtocol](self, "conformsToAKRotatableAnnotationProtocol"))
  {
    -[AKAnnotation rotationAngle](self, "rotationAngle");
    objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("rotationAngle"));
  }
  objc_msgSend(v4, "encodeBool:forKey:", -[AKAnnotation isFormField](self, "isFormField"), CFSTR("AKIsFormFieldKey"));

}

- (AKAnnotation)initWithCoder:(id)a3
{
  id v4;
  AKAnnotation *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *UUID;
  int v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFData *v22;
  CGDataProvider *v23;
  CGDataProvider *v24;
  CGPDFDocument *v25;
  CGPDFPageRef Page;
  CGPDFPage *v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, CGContext *);
  void *v32;
  id v33;
  id location;
  CGRect BoxRect;

  v4 = a3;
  v5 = -[AKAnnotation init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("akVers")))
      v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("akVers"));
    else
      v6 = 0;
    -[AKAnnotation setAkSerializationVersion:](v5, "setAkSerializationVersion:", v6);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("akPlat")))
      v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("akPlat"));
    else
      v7 = 0;
    -[AKAnnotation setAkSerializationPlatform:](v5, "setAkSerializationPlatform:", v7);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("UUID")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
      v8 = objc_claimAutoreleasedReturnValue();
      UUID = v5->_UUID;
      v5->_UUID = (NSString *)v8;

    }
    v10 = objc_msgSend(v4, "containsValueForKey:", CFSTR("originalModelBaseScaleFactor"));
    v11 = 1.0;
    if (v10)
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("originalModelBaseScaleFactor"), 1.0);
    -[AKAnnotation setOriginalModelBaseScaleFactor:](v5, "setOriginalModelBaseScaleFactor:", v11);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("originalExifOrientation")))
      v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("originalExifOrientation"));
    else
      v12 = 1;
    -[AKAnnotation setOriginalExifOrientation:](v5, "setOriginalExifOrientation:", v12);
    -[AKAnnotation setTextIsClipped:](v5, "setTextIsClipped:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("textIsClipped")));
    -[AKAnnotation setTextIsFixedWidth:](v5, "setTextIsFixedWidth:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("textIsFixedWidth")));
    -[AKAnnotation setTextIsFixedHeight:](v5, "setTextIsFixedHeight:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("textIsFixedHeight")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("shouldUsePlaceholderText")))
      v13 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldUsePlaceholderText"));
    else
      v13 = 0;
    -[AKAnnotation setShouldUsePlaceholderText:](v5, "setShouldUsePlaceholderText:", v13);
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("formContentType")))
      -[AKAnnotation setFormContentType:](v5, "setFormContentType:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("formContentType")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("customPlaceholderText")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customPlaceholderText"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAnnotation setCustomPlaceholderText:](v5, "setCustomPlaceholderText:", v14);

    }
    else
    {
      -[AKAnnotation setCustomPlaceholderText:](v5, "setCustomPlaceholderText:", 0);
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("author")))
    {
      objc_opt_self();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, CFSTR("author"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAnnotation setAuthor:](v5, "setAuthor:", v16);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("modificationDate")))
    {
      objc_opt_self();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v17, CFSTR("modificationDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKAnnotation setModificationDate:](v5, "setModificationDate:", v18);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("parentAnnotation.UUID")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentAnnotation.UUID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v5, CFSTR("AKAnnotation.parentAnnotationUUIDAssociatedObjectKey"), v19, (void *)0x301);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("childAnnotation.UUID")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("childAnnotation.UUID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v5, CFSTR("AKAnnotation.childAnnotationUUIDAssociatedObjectKey"), v20, (void *)0x301);

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("editsDisableAppearanceOverride")))
      -[AKAnnotation setEditsDisableAppearanceOverride:](v5, "setEditsDisableAppearanceOverride:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("editsDisableAppearanceOverride")));
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("appearanceOverridePDF")))
    {
      objc_opt_self();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, CFSTR("appearanceOverridePDF"));
      v22 = (const __CFData *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = CGDataProviderCreateWithCFData(v22);
        if (v23)
        {
          v24 = v23;
          v25 = CGPDFDocumentCreateWithProvider(v23);
          v5->_appearanceOverridePDF = v25;
          if (v25)
          {
            Page = CGPDFDocumentGetPage(v25, 1uLL);
            if (Page)
            {
              v27 = Page;
              objc_initWeak(&location, v5);
              v29 = MEMORY[0x24BDAC760];
              v30 = 3221225472;
              v31 = sub_229044F70;
              v32 = &unk_24F1A8080;
              objc_copyWeak(&v33, &location);
              -[AKAnnotation setAppearanceOverride:](v5, "setAppearanceOverride:", &v29);
              BoxRect = CGPDFPageGetBoxRect(v27, kCGPDFMediaBox);
              -[AKAnnotation setInitialDrawingBoundsForAppearanceOverride:](v5, "setInitialDrawingBoundsForAppearanceOverride:", BoxRect.origin.x, BoxRect.origin.y, BoxRect.size.width, BoxRect.size.height, v29, v30, v31, v32);
              objc_destroyWeak(&v33);
              objc_destroyWeak(&location);
            }
          }
          CFRelease(v24);
        }
      }

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("rotationAngle"))
      && -[AKAnnotation conformsToAKRotatableAnnotationProtocol](v5, "conformsToAKRotatableAnnotationProtocol"))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("rotationAngle"));
      -[AKAnnotation setRotationAngle:](v5, "setRotationAngle:");
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("AKIsFormFieldKey")))
      -[AKAnnotation setIsFormField:](v5, "setIsFormField:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AKIsFormFieldKey")));
  }

  return v5;
}

- (BOOL)conformsToAKStrokedAnnotationProtocol
{
  return self->_conformsToAKStrokedAnnotationProtocol;
}

- (BOOL)conformsToAKFilledAnnotationProtocol
{
  return self->_conformsToAKFilledAnnotationProtocol;
}

- (BOOL)conformsToAKRectangularAnnotationProtocol
{
  return self->_conformsToAKRectangularAnnotationProtocol;
}

- (BOOL)conformsToAKFlippableAnnotationProtocol
{
  return self->_conformsToAKFlippableAnnotationProtocol;
}

- (BOOL)conformsToAKRotatableAnnotationProtocol
{
  return self->_conformsToAKRotatableAnnotationProtocol;
}

- (BOOL)conformsToAKTextAnnotationProtocol
{
  return self->_conformsToAKTextAnnotationProtocol;
}

- (BOOL)conformsToAKParentAnnotationProtocol
{
  return self->_conformsToAKParentAnnotationProtocol;
}

- (NSString)UUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)customPlaceholderText
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCustomPlaceholderText:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (double)originalModelBaseScaleFactor
{
  return self->_originalModelBaseScaleFactor;
}

- (int64_t)originalExifOrientation
{
  return self->_originalExifOrientation;
}

- (BOOL)editsDisableAppearanceOverride
{
  return self->_editsDisableAppearanceOverride;
}

- (void)setEditsDisableAppearanceOverride:(BOOL)a3
{
  self->_editsDisableAppearanceOverride = a3;
}

- (BOOL)isEdited
{
  return self->_isEdited;
}

- (void)setIsEdited:(BOOL)a3
{
  self->_isEdited = a3;
}

- (NSDate)modificationDate
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)author
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAuthor:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (BOOL)isTranslating
{
  return self->_isTranslating;
}

- (void)setIsTranslating:(BOOL)a3
{
  self->_isTranslating = a3;
}

- (BOOL)isDraggingHandle
{
  return self->_isDraggingHandle;
}

- (void)setIsDraggingHandle:(BOOL)a3
{
  self->_isDraggingHandle = a3;
}

- (BOOL)isFormField
{
  return self->_isFormField;
}

- (void)setIsFormField:(BOOL)a3
{
  self->_isFormField = a3;
}

- (int64_t)akSerializationVersion
{
  return self->_akSerializationVersion;
}

- (void)setAkSerializationVersion:(int64_t)a3
{
  self->_akSerializationVersion = a3;
}

- (int64_t)akSerializationPlatform
{
  return self->_akSerializationPlatform;
}

- (void)setAkSerializationPlatform:(int64_t)a3
{
  self->_akSerializationPlatform = a3;
}

- (BOOL)isEditingText
{
  return self->_isEditingText;
}

- (void)setIsEditingText:(BOOL)a3
{
  self->_isEditingText = a3;
}

- (BOOL)textIsClipped
{
  return self->_textIsClipped;
}

- (void)setTextIsClipped:(BOOL)a3
{
  self->_textIsClipped = a3;
}

- (BOOL)editingDisabled
{
  return self->_editingDisabled;
}

- (void)setEditingDisabled:(BOOL)a3
{
  self->_editingDisabled = a3;
}

- (AKAnnotation)parentAnnotation
{
  return (AKAnnotation *)objc_loadWeakRetained((id *)&self->_parentAnnotation);
}

- (void)setParentAnnotation:(id)a3
{
  objc_storeWeak((id *)&self->_parentAnnotation, a3);
}

- (AKAnnotation)childAnnotation
{
  return (AKAnnotation *)objc_loadWeakRetained((id *)&self->_childAnnotation);
}

- (void)setChildAnnotation:(id)a3
{
  objc_storeWeak((id *)&self->_childAnnotation, a3);
}

- (CGRect)initialDrawingBoundsForAppearanceOverride
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_initialDrawingBoundsForAppearanceOverride, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setInitialDrawingBoundsForAppearanceOverride:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_initialDrawingBoundsForAppearanceOverride, &v3, 32, 1, 0);
}

- (BOOL)isBeingCopied
{
  return self->_isBeingCopied;
}

- (void)setIsBeingCopied:(BOOL)a3
{
  self->_isBeingCopied = a3;
}

- (BOOL)textIsFixedWidth
{
  return self->_textIsFixedWidth;
}

- (void)setTextIsFixedWidth:(BOOL)a3
{
  self->_textIsFixedWidth = a3;
}

- (BOOL)textIsFixedHeight
{
  return self->_textIsFixedHeight;
}

- (void)setTextIsFixedHeight:(BOOL)a3
{
  self->_textIsFixedHeight = a3;
}

- (BOOL)shouldUsePlaceholderText
{
  return self->_shouldUsePlaceholderText;
}

- (void)setShouldUsePlaceholderText:(BOOL)a3
{
  self->_shouldUsePlaceholderText = a3;
}

- (unint64_t)formContentType
{
  return self->_formContentType;
}

- (void)setFormContentType:(unint64_t)a3
{
  self->_formContentType = a3;
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (void)setTextContentType:(id)a3
{
  self->_textContentType = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_childAnnotation);
  objc_destroyWeak((id *)&self->_parentAnnotation);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_customPlaceholderText, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong(&self->_appearanceOverride, 0);
}

@end
