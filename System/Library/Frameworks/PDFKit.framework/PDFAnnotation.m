@implementation PDFAnnotation

- (PDFAnnotation)init
{
  return (PDFAnnotation *)-[PDFAnnotation initCommonWithBounds:](self, "initCommonWithBounds:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (id)initCommonWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PDFAnnotation *v7;
  PDFAnnotation *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)PDFAnnotation;
  v7 = -[PDFAnnotation init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[PDFAnnotation commonInit](v7, "commonInit");
    -[PDFAnnotation setBounds:](v8, "setBounds:", x, y, width, height);
    -[PDFAnnotation secondaryInit](v8, "secondaryInit");
    v8->_isFullyConstructed = 1;
  }
  return v8;
}

- (PDFAnnotation)initWithBounds:(CGRect)bounds forType:(PDFAnnotationSubtype)annotationType withProperties:(NSDictionary *)properties
{
  double height;
  double width;
  double y;
  double x;
  NSString *v11;
  NSDictionary *v12;
  PDFAnnotation *v13;
  PDFAnnotation *v14;
  NSDictionary *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  PDFAnnotation *v24;
  NSDictionary *v26;
  NSString *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  v34 = *MEMORY[0x24BDAC8D0];
  v11 = annotationType;
  v12 = properties;
  v32.receiver = self;
  v32.super_class = (Class)PDFAnnotation;
  v13 = -[PDFAnnotation init](&v32, sel_init);
  v14 = v13;
  if (!v13)
  {
LABEL_18:
    v24 = v14;
    goto LABEL_25;
  }
  -[PDFAnnotation commonInit](v13, "commonInit");
  if (v11)
  {
    -[PDFAnnotation setRect:forAnnotationKey:](v14, "setRect:forAnnotationKey:", CFSTR("/Rect"), x, y, width, height);
    -[PDFAnnotation setValue:forAnnotationKey:](v14, "setValue:forAnnotationKey:", v11, CFSTR("/Subtype"));
    -[PDFAnnotation secondaryInit](v14, "secondaryInit");
    if (v12)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v15 = v12;
      v16 = -[NSDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v16)
      {
        v17 = v16;
        v26 = v12;
        v27 = v11;
        v18 = 0;
        v19 = *(_QWORD *)v29;
        while (2)
        {
          v20 = 0;
          v21 = v18;
          do
          {
            if (*(_QWORD *)v29 != v19)
              objc_enumerationMutation(v15);
            v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v20);
            -[NSDictionary objectForKey:](v15, "objectForKey:", v22);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = -[PDFAnnotation setValue:forAnnotationKey:](v14, "setValue:forAnnotationKey:", v18, v22);
            if ((objc_msgSend(v22, "isEqualToString:", CFSTR("/Subtype")) & 1) != 0)
            {
              if (!v23)
                goto LABEL_22;
            }
            else if (((objc_msgSend(v22, "isEqualToString:", CFSTR("/Rect")) ^ 1 | v23) & 1) == 0)
            {
LABEL_22:
              if (v14->_loggingEnabled)
                NSLog(CFSTR("Error: Cannot create annotation. Improper value for key %@."), v22);

              v24 = 0;
              v12 = v26;
              v11 = v27;
              goto LABEL_25;
            }
            ++v20;
            v21 = v18;
          }
          while (v17 != v20);
          v17 = -[NSDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          if (v17)
            continue;
          break;
        }

        v12 = v26;
        v11 = v27;
      }

    }
    v14->_isFullyConstructed = 1;
    goto LABEL_18;
  }
  if (v14->_loggingEnabled)
    NSLog(CFSTR("Error: Cannot create annotation without a type."));
  v24 = 0;
LABEL_25:

  return v24;
}

- (PDFAnnotation)initWithDictionary:(NSDictionary *)dictionary forPage:(PDFPage *)page
{
  NSDictionary *v6;
  PDFPage *v7;
  PDFAnnotation *v8;
  PDFAnnotation *v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  PDFAnnotation *v21;
  PDFPage *v23;
  NSDictionary *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = dictionary;
  v7 = page;
  v29.receiver = self;
  v29.super_class = (Class)PDFAnnotation;
  v8 = -[PDFAnnotation init](&v29, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PDFAnnotation commonInit](v8, "commonInit");
    -[NSDictionary objectForKey:](v6, "objectForKey:", CFSTR("/Subtype"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NSDictionary objectForKey:](v6, "objectForKey:", CFSTR("/Rect"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v12 = v6;
        v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v13)
        {
          v14 = v13;
          v23 = v7;
          v24 = v6;
          v15 = 0;
          v16 = *(_QWORD *)v26;
          while (2)
          {
            v17 = 0;
            v18 = v15;
            do
            {
              if (*(_QWORD *)v26 != v16)
                objc_enumerationMutation(v12);
              v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v17);
              -[NSDictionary objectForKey:](v12, "objectForKey:", v19);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              v20 = -[PDFAnnotation setValue:forAnnotationKey:](v9, "setValue:forAnnotationKey:", v15, v19);
              if ((objc_msgSend(v19, "isEqualToString:", CFSTR("/Subtype")) & 1) != 0)
              {
                if (!v20)
                  goto LABEL_22;
              }
              else if (((objc_msgSend(v19, "isEqualToString:", CFSTR("/Rect")) ^ 1 | v20) & 1) == 0)
              {
LABEL_22:
                if (v9->_loggingEnabled)
                  NSLog(CFSTR("Error: Cannot create annotation. Improper value for key %@."), v19);

                v21 = 0;
                v7 = v23;
                v6 = v24;
                goto LABEL_28;
              }
              ++v17;
              v18 = v15;
            }
            while (v14 != v17);
            v14 = -[NSDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
            if (v14)
              continue;
            break;
          }

          v7 = v23;
          v6 = v24;
        }

        objc_storeWeak((id *)&v9->_page, v7);
        -[PDFAnnotation setValue:forAnnotationKey:](v9, "setValue:forAnnotationKey:", v7, CFSTR("/P"));
        if (v7)
          -[PDFPage addAnnotation:](v7, "addAnnotation:", v9);
        v9->_isFullyConstructed = 1;
        goto LABEL_19;
      }
      if (v9->_loggingEnabled)
        NSLog(CFSTR("Error: Cannot create annotation without a value for key /Rect."));
    }
    else if (v9->_loggingEnabled)
    {
      NSLog(CFSTR("Error: Cannot create annotation without a value for key /Subtype."));
    }
    v21 = 0;
    goto LABEL_28;
  }
LABEL_19:
  v21 = v9;
LABEL_28:

  return v21;
}

- (void)commonInit
{
  NSUUID *v3;
  NSUUID *pdfAnnotationUUID;
  NSMutableDictionary *v5;
  NSMutableDictionary *PDFAnnotationDictionary;
  NSDictionary *v7;
  NSDictionary *PDFAnnotationKeyMapping;
  NSMutableDictionary *v9;
  NSMutableDictionary *internalPDFAnnotationDictionary;
  NSCopying *akAnnotationForCopying;
  NSIndexSet *quadPointsIndexSet;
  PDFAnnotation *popup;
  NSLock *v14;
  NSLock *pathLock;
  NSString *widgetOnStateString;
  NSString *labelText;
  CGPoint *v18;
  CGPoint v19;
  NSArray *quadPoints;
  NSMutableDictionary *v21;
  id v22;

  self->_sourceDictionary = 0;
  self->_dictionaryRef = 0;
  objc_storeWeak((id *)&self->_page, 0);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  pdfAnnotationUUID = self->_pdfAnnotationUUID;
  self->_pdfAnnotationUUID = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  PDFAnnotationDictionary = self->_PDFAnnotationDictionary;
  self->_PDFAnnotationDictionary = v5;

  -[PDFAnnotation getPDFKeyMappingDictionary](self, "getPDFKeyMappingDictionary");
  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  PDFAnnotationKeyMapping = self->_PDFAnnotationKeyMapping;
  self->_PDFAnnotationKeyMapping = v7;

  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  internalPDFAnnotationDictionary = self->_internalPDFAnnotationDictionary;
  self->_internalPDFAnnotationDictionary = v9;

  akAnnotationForCopying = self->_akAnnotationForCopying;
  self->_akAnnotationForCopying = 0;

  self->_loggingEnabled = GetDefaultsWriteAnnotationLoggingEnabled();
  self->_shouldExport = 1;
  -[PDFAnnotation setShouldPrint:](self, "setShouldPrint:", 1);
  *(_OWORD *)&self->_downAppearance = 0u;
  *(_OWORD *)&self->_rolloverOffAppearance = 0u;
  *(_OWORD *)&self->_normalAppearance = 0u;
  self->_saveAppearance = 1;
  self->_cachedAppearancesLock._os_unfair_lock_opaque = 0;
  *(_WORD *)&self->_isSelected = 0;
  quadPointsIndexSet = self->_quadPointsIndexSet;
  self->_quadPointsIndexSet = 0;

  self->_quadPointsPath = 0;
  objc_storeWeak((id *)&self->_parent, 0);
  popup = self->_popup;
  self->_popup = 0;

  self->_popupDictionary = 0;
  *(_WORD *)&self->_popupDrawCloseWidget = 257;
  self->_cgPaths = 0;
  v14 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
  pathLock = self->_pathLock;
  self->_pathLock = v14;

  *(_WORD *)&self->_isSignature = 0;
  widgetOnStateString = self->_widgetOnStateString;
  self->_widgetOnStateString = (NSString *)CFSTR("Yes");

  objc_storeWeak(&self->_control, 0);
  *(_WORD *)&self->_pointerIsOverAnnotation = 0;
  self->_formContentType = 0;
  self->_autofillEntryType = 0;
  labelText = self->_labelText;
  self->_labelText = 0;
  self->_shouldReportAnalytics = 1;
  self->_suppressAppearanceStreamText = 0;

  v18 = (CGPoint *)MEMORY[0x24BDBEFB0];
  *(_WORD *)&self->_restoreLinePoints = 0;
  v19 = *v18;
  self->_startPoint = *v18;
  self->_endPoint = v19;
  quadPoints = self->_quadPoints;
  self->_quadPoints = 0;

  self->_isTransparent = 0;
  objc_storeWeak((id *)&self->_accessibilityNode, 0);
  self->_scaleFactor = 1.0;
  *(_WORD *)&self->_isFullyConstructed = 0;
  v21 = self->_PDFAnnotationDictionary;
  objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v22, CFSTR("/Rect"));

}

- (void)secondaryInit
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PDFBorder *v17;
  void *v18;
  PDFBorder *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  __n128 v28;
  __n128 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v35 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  NSFullUserName();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation setUserName:](self, "setUserName:", v11);

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation setModificationDate:](self, "setModificationDate:", v12);

  if (objc_msgSend(v35, "isEqualToString:", CFSTR("/Circle")))
    goto LABEL_6;
  if (!objc_msgSend(v35, "isEqualToString:", CFSTR("/FreeText")))
  {
    if (objc_msgSend(v35, "isEqualToString:", CFSTR("/Ink")))
    {
LABEL_6:
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFAnnotation setColor:](self, "setColor:", v18);

      v17 = objc_alloc_init(PDFBorder);
      -[PDFAnnotation setBorder:](self, "setBorder:", v17);
      goto LABEL_7;
    }
    if (objc_msgSend(v35, "isEqualToString:", CFSTR("/Line")))
    {
      -[PDFAnnotation setStartPoint:](self, "setStartPoint:", PDFPointMake(0.5, 0.5));
      -[PDFAnnotation setEndPoint:](self, "setEndPoint:", PDFPointMake(v8 + -0.5, v10 + -0.5));
      v17 = (PDFBorder *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("/None"), 0);
      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v17, CFSTR("/LE"));
      v19 = objc_alloc_init(PDFBorder);
      -[PDFAnnotation setBorder:](self, "setBorder:", v19);
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFAnnotation setColor:](self, "setColor:", v20);
    }
    else
    {
      if ((objc_msgSend(v35, "isEqualToString:", CFSTR("/Link")) & 1) != 0)
        goto LABEL_8;
      if (-[PDFAnnotation isMarkupAnnotationSubtype](self, "isMarkupAnnotationSubtype"))
      {
        v17 = (PDFBorder *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 4);
        objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFPoint:", PDFPointMake(0.0, v10));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFBorder addObject:](v17, "addObject:", v21);

        objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFPoint:", PDFPointMake(v8, v10));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFBorder addObject:](v17, "addObject:", v22);

        objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFPoint:", PDFPointMake(0.0, 0.0));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFBorder addObject:](v17, "addObject:", v23);

        objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFPoint:", PDFPointMake(v8, 0.0));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFBorder addObject:](v17, "addObject:", v24);

        -[PDFAnnotation setQuadrilateralPoints:](self, "setQuadrilateralPoints:", v17);
        objc_msgSend(MEMORY[0x24BDF6950], "yellowColor");
        v19 = (PDFBorder *)objc_claimAutoreleasedReturnValue();
        -[PDFAnnotation setColor:](self, "setColor:", v19);
        goto LABEL_12;
      }
      if ((objc_msgSend(v35, "isEqualToString:", CFSTR("/Popup")) & 1) != 0)
        goto LABEL_8;
      if (objc_msgSend(v35, "isEqualToString:", CFSTR("/Square")))
        goto LABEL_6;
      if (objc_msgSend(v35, "isEqualToString:", CFSTR("/Stamp")))
      {
        objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
      if (objc_msgSend(v35, "isEqualToString:", CFSTR("/Text")))
      {
        objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFAnnotation setColor:](self, "setColor:", v25);

        v26 = objc_alloc(-[PDFAnnotation annotationSubclassForPopup](self, "annotationSubclassForPopup"));
        v27 = PDFRectGetMaxX(v4, v6, v8) + 4.0;
        v28.n128_f64[0] = PDFRectGetMaxY(v4, v6, v8, v10) + 4.0;
        v29.n128_f64[0] = v27;
        PDFRectMake(v29, v28, 72.0, 36.0);
        v17 = (PDFBorder *)objc_msgSend(v26, "initWithBounds:forType:withProperties:", CFSTR("/Popup"), 0);
        -[PDFAnnotation setPopup:](self, "setPopup:", v17);
        goto LABEL_7;
      }
      if (!objc_msgSend(v35, "isEqualToString:", CFSTR("/Widget")))
        goto LABEL_8;
      -[PDFAnnotation _generateFormFieldName](self, "_generateFormFieldName");
      -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
      v17 = (PDFBorder *)objc_claimAutoreleasedReturnValue();
      if (!-[PDFBorder isEqualToString:](v17, "isEqualToString:", CFSTR("/Btn")))
      {
        if ((-[PDFBorder isEqualToString:](v17, "isEqualToString:", CFSTR("/Ch")) & 1) != 0)
          goto LABEL_7;
        if (!-[PDFBorder isEqualToString:](v17, "isEqualToString:", CFSTR("/Tx")))
        {
          -[PDFBorder isEqualToString:](v17, "isEqualToString:", CFSTR("/Sig"));
          goto LABEL_7;
        }
        v34 = (void *)MEMORY[0x24BDF6A70];
        objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
        objc_msgSend(v34, "systemFontOfSize:");
        v19 = (PDFBorder *)objc_claimAutoreleasedReturnValue();
        -[PDFAnnotation setFont:](self, "setFont:", v19);
        goto LABEL_12;
      }
      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", CFSTR("Off"), CFSTR("/V"));
      -[PDFAnnotation setWidgetOnStateString:](self, "setWidgetOnStateString:", CFSTR("Yes"));
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v30, CFSTR("/C"));

      v19 = -[PDFAppearanceCharacteristics initWithAnnotationDictionary:forControlType:]([PDFAppearanceCharacteristics alloc], "initWithAnnotationDictionary:forControlType:", 0, -1);
      PDFColorCreateFromWhiteAlpha(-[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v19, CFSTR("/MK")), 0.75, 1.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFAnnotation setBackgroundColor:](self, "setBackgroundColor:", v31);

      v32 = (void *)MEMORY[0x24BDF6A70];
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
      objc_msgSend(v32, "systemFontOfSize:");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFAnnotation setFont:](self, "setFont:", v33);

      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFAnnotation setFontColor:](self, "setFontColor:", v20);
    }

LABEL_12:
    goto LABEL_7;
  }
  v13 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontSize");
  objc_msgSend(v13, "systemFontOfSize:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation setFont:](self, "setFont:", v14);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation setFontColor:](self, "setFontColor:", v15);

  objc_msgSend(MEMORY[0x24BDF6950], "yellowColor");
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_4:
  v17 = (PDFBorder *)v16;
  -[PDFAnnotation setColor:](self, "setColor:", v16);
LABEL_7:

LABEL_8:
}

- (Class)annotationSubclassForPopup
{
  return (Class)objc_opt_class();
}

- (void)_generateFormFieldName
{
  const __CFString *v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("/Btn")) & 1) != 0)
  {
    v3 = CFSTR("button%d");
    v4 = &buttonWidgetCount;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("/Ch")) & 1) != 0)
  {
    v3 = CFSTR("choice%d");
    v4 = &choiceWidgetCount;
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("/Tx")))
      goto LABEL_9;
    v3 = CFSTR("text%d");
    v4 = &textWidgetCount;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v3, *v4);
  v5 = objc_claimAutoreleasedReturnValue();
  ++*v4;
  if (v5)
  {
    v6 = (void *)v5;
    -[PDFAnnotation setFieldName:](self, "setFieldName:", v5);

  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  _NSZone *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  PDFAnnotation *v23;
  void *v24;
  uint64_t v25;
  _NSZone *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  PDFAnnotation *v30;
  PDFAnnotation *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  PDFAKAnnotationAdaptor *akAnnotationAdaptor;
  void *v37;
  uint64_t v38;
  void *v39;
  NSCopying *akAnnotationForCopying;
  uint64_t v41;
  uint64_t v43;
  NSMutableDictionary *obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v3 = a3;
  v50 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[PDFAnnotation bounds](self, "bounds");
  v6 = objc_msgSend(v5, "initCommonWithBounds:");
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;

    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v9;

    -[PDFAnnotation getPDFKeyMappingDictionary](self, "getPDFKeyMappingDictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(v6 + 64);
    *(_QWORD *)(v6 + 64) = v11;

    objc_msgSend((id)v6, "setSavesAppearanceStream:", -[PDFAnnotation savesAppearanceStream](self, "savesAppearanceStream"));
    *(_BYTE *)(v6 + 8) = self->_loggingEnabled;
    *(_BYTE *)(v6 + 9) = self->_shouldExport;
    *(_BYTE *)(v6 + 145) = self->_isHighlighted;
    *(_BYTE *)(v6 + 192) = self->_popupDrawCloseWidget;
    *(_BYTE *)(v6 + 193) = self->_popupDrawText;
    v13 = objc_alloc_init(MEMORY[0x24BDD1648]);
    v14 = *(void **)(v6 + 208);
    *(_QWORD *)(v6 + 208) = v13;

    *(_BYTE *)(v6 + 216) = self->_isSignature;
    objc_storeStrong((id *)(v6 + 224), self->_widgetOnStateString);
    v15 = -[NSMutableDictionary mutableCopyWithZone:](self->_internalPDFAnnotationDictionary, "mutableCopyWithZone:", v3);
    v16 = *(void **)(v6 + 72);
    *(_QWORD *)(v6 + 72) = v15;

    *(_QWORD *)(v6 + 256) = self->_formContentType;
    objc_storeStrong((id *)(v6 + 248), self->_autoFillTextContentType);
    *(_QWORD *)(v6 + 264) = self->_autofillEntryType;
    *(_BYTE *)(v6 + 282) = self->_shouldReportAnalytics;
    *(_BYTE *)(v6 + 284) = self->_suppressAppearanceStreamText;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = self->_PDFAnnotationDictionary;
    v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v46;
      do
      {
        v20 = 0;
        v43 = v18;
        do
        {
          if (*(_QWORD *)v46 != v19)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v20);
          -[NSMutableDictionary objectForKey:](self->_PDFAnnotationDictionary, "objectForKey:", v21, v43);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "conformsToProtocol:", &unk_2545C00B0))
          {
            v23 = self;
            v24 = *(void **)(v6 + 56);
            v25 = v19;
            v26 = v3;
            v27 = (void *)objc_msgSend(v22, "copyWithZone:", v3);
            v28 = v24;
            self = v23;
            objc_msgSend(v28, "setObject:forKey:", v27, v21);

            v3 = v26;
            v19 = v25;
            v18 = v43;
          }

          ++v20;
        }
        while (v18 != v20);
        v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v18);
    }

    v29 = 0;
    do
    {
      if (-[PDFAnnotation appearance:](self, "appearance:", v29))
      {
        CGPDFFormGetStream();
        objc_msgSend((id)v6, "setAppearance:forType:", CGPDFFormCreate(), v29);
      }
      v29 = (v29 + 1);
    }
    while ((_DWORD)v29 != 6);
    v30 = self->_popup;
    if (v30)
    {
      v31 = v30;
      v32 = -[PDFAnnotation copyWithZone:](v30, "copyWithZone:", v3);

      objc_msgSend((id)v6, "setPopupInternal:scanPage:", v32, 0);
    }
    -[PDFAnnotation border](self, "border");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = v33;
      v35 = (void *)objc_msgSend(v33, "copyWithZone:", v3);

      objc_msgSend((id)v6, "setBorder:", v35);
    }
    akAnnotationAdaptor = self->_akAnnotationAdaptor;
    if (akAnnotationAdaptor)
    {
      -[PDFAKAnnotationAdaptor akAnnotation](akAnnotationAdaptor, "akAnnotation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "copyWithZone:", v3);

      v39 = *(void **)(v6 + 384);
      *(_QWORD *)(v6 + 384) = v38;
    }
    else
    {
      akAnnotationForCopying = self->_akAnnotationForCopying;
      if (akAnnotationForCopying)
      {
        v41 = -[NSCopying copyWithZone:](akAnnotationForCopying, "copyWithZone:", v3);
        v39 = *(void **)(v6 + 384);
        *(_QWORD *)(v6 + 384) = v41;
      }
      else
      {
        v39 = *(void **)(v6 + 384);
        *(_QWORD *)(v6 + 384) = 0;
      }
    }

    *(_BYTE *)(v6 + 368) = 1;
  }
  return (id)v6;
}

- (PDFAnnotation)initWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  if (objc_msgSend(v5, "allowsKeyedCoding"))
  {
    self = -[PDFAnnotation init](self, "init");
    if (self)
    {
      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PDFAnnotDictionary"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFAnnotation setPDFAnnotationDictionary:](self, "setPDFAnnotationDictionary:", v6);

      -[PDFAnnotation setSavesAppearanceStream:](self, "setSavesAppearanceStream:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("PDFAnnotBaseSaveAppearance")));
      -[PDFAnnotation setForExport:](self, "setForExport:", objc_msgSend(v5, "decodeBoolForKey:", CFSTR("PDFAnnotBaseExport")));
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDD0E20];
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("%@ - only keyed coders are supported by %@"), v9, objc_opt_class());

  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *PDFAnnotationDictionary;
  id v5;

  PDFAnnotationDictionary = self->_PDFAnnotationDictionary;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", PDFAnnotationDictionary, CFSTR("PDFAnnotDictionary"));
  objc_msgSend(v5, "encodeBool:forKey:", -[PDFAnnotation savesAppearanceStream](self, "savesAppearanceStream"), CFSTR("PDFAnnotBaseSaveAppearance"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldExport, CFSTR("PDFAnnotBaseExport"));

}

- (void)dealloc
{
  CGPath *quadPointsPath;
  CGPDFAnnotation *cgAnnotation;
  objc_super v5;

  -[PDFAnnotation removeAKAnnotationAdaptor](self, "removeAKAnnotationAdaptor");
  -[PDFAnnotation _releaseDictionaryRef](self, "_releaseDictionaryRef");
  if (self->_normalAppearance)
    CGPDFFormRelease();
  if (self->_rolloverAppearance)
    CGPDFFormRelease();
  if (self->_downAppearance)
    CGPDFFormRelease();
  if (self->_normalOffAppearance)
    CGPDFFormRelease();
  if (self->_rolloverOffAppearance)
    CGPDFFormRelease();
  if (self->_downOffAppearance)
    CGPDFFormRelease();
  quadPointsPath = self->_quadPointsPath;
  if (quadPointsPath)
    CGPathRelease(quadPointsPath);
  if (self->_cgPaths)
    -[PDFAnnotation releaseCGPathArray](self, "releaseCGPathArray");
  cgAnnotation = self->_cgAnnotation;
  if (cgAnnotation)
    CFRelease(cgAnnotation);
  v5.receiver = self;
  v5.super_class = (Class)PDFAnnotation;
  -[PDFAnnotation dealloc](&v5, sel_dealloc);
}

- (void)_releaseDictionaryRef
{
  __CFDictionary *dictionaryRef;

  dictionaryRef = self->_dictionaryRef;
  if (dictionaryRef)
  {
    CFDictionaryRemoveValue(dictionaryRef, CFSTR("/Parent"));
    CFDictionaryRemoveValue(self->_dictionaryRef, CFSTR("/Popup"));
    CFRelease(self->_dictionaryRef);
  }
}

- (void)setupAKAnnotationAdaptorIfNecessary
{
  BOOL isFullyConstructed;
  NSCopying *akAnnotationForCopying;
  PDFAKAnnotationAdaptor *v5;
  PDFAKAnnotationAdaptor *akAnnotationAdaptor;
  void *v7;
  id v8;
  PDFAKAnnotationAdaptor *v9;
  NSCopying *v10;

  if (GetDefaultsWriteAKEnabled() && !self->_akAnnotationAdaptor)
  {
    isFullyConstructed = self->_isFullyConstructed;
    self->_isFullyConstructed = 0;
    akAnnotationForCopying = self->_akAnnotationForCopying;
    v10 = akAnnotationForCopying;
    if (akAnnotationForCopying)
    {
      v5 = -[PDFAKAnnotationAdaptor initWithPDFAnnotation:andAKAnnotation:]([PDFAKAnnotationAdaptor alloc], "initWithPDFAnnotation:andAKAnnotation:", self, akAnnotationForCopying);
      akAnnotationAdaptor = self->_akAnnotationAdaptor;
      self->_akAnnotationAdaptor = v5;

      v7 = self->_akAnnotationForCopying;
      self->_akAnnotationForCopying = 0;
    }
    else
    {
      v8 = 0;
      +[PDFAKAnnotationAdaptor annotationAdaptorWithPDFAnnotation:andCGPDFAnnotation:andPDFDictionary:](PDFAKAnnotationAdaptor, "annotationAdaptorWithPDFAnnotation:andCGPDFAnnotation:andPDFDictionary:", self, -[PDFAnnotation CGPDFAnnotation](self, "CGPDFAnnotation"), -[PDFAnnotation sourceDictionary](self, "sourceDictionary"));
      v9 = (PDFAKAnnotationAdaptor *)objc_claimAutoreleasedReturnValue();
      v7 = self->_akAnnotationAdaptor;
      self->_akAnnotationAdaptor = v9;
    }

    self->_isFullyConstructed = isFullyConstructed;
  }
}

- (void)removeAKAnnotationAdaptor
{
  PDFAKAnnotationAdaptor *akAnnotationAdaptor;
  PDFAKAnnotationAdaptor *v4;

  akAnnotationAdaptor = self->_akAnnotationAdaptor;
  if (akAnnotationAdaptor)
  {
    -[PDFAKAnnotationAdaptor teardown](akAnnotationAdaptor, "teardown");
    v4 = self->_akAnnotationAdaptor;
    self->_akAnnotationAdaptor = 0;

  }
}

- (PDFPage)page
{
  return (PDFPage *)objc_loadWeakRetained((id *)&self->_page);
}

- (void)setPage:(PDFPage *)page
{
  PDFPage *v4;

  v4 = page;
  objc_storeWeak((id *)&self->_page, v4);
  if (v4)
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/P"));
  else
    -[PDFAnnotation removeValueForAnnotationKey:](self, "removeValueForAnnotationKey:", CFSTR("/P"));

}

- (NSString)type
{
  void *v2;
  void *v3;

  -[NSMutableDictionary objectForKey:](self->_PDFAnnotationDictionary, "objectForKey:", CFSTR("/Subtype"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "substringFromIndex:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setType:(NSString *)type
{
  id v4;

  v4 = (id)-[NSString copy](type, "copy");
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/Subtype"));

}

- (CGRect)bounds
{
  void *v2;
  double v3;
  double v4;
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
  CGRect result;

  -[NSMutableDictionary objectForKey:](self->_PDFAnnotationDictionary, "objectForKey:", CFSTR("/Rect"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "PDFKitPDFRectValue");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setBounds:(CGRect)bounds
{
  double height;
  double width;
  double y;
  double x;
  id v8;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  if (-[PDFAnnotation _annotationAllowsCommenting:](self, "_annotationAllowsCommenting:", CFSTR("setBounds:")))
  {
    -[PDFAnnotation _savePropertiesBeforeSetBounds](self, "_savePropertiesBeforeSetBounds");
    objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", x, y, width, height);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_PDFAnnotationDictionary, "setObject:forKey:", v8, CFSTR("/Rect"));
    -[PDFAnnotation _restorePropertiesAfterSetBounds](self, "_restorePropertiesAfterSetBounds");
    -[PDFAnnotation _didSetValue:forAnnotationKey:](self, "_didSetValue:forAnnotationKey:", v8, CFSTR("/Rect"));
    -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");

  }
}

- (void)setBoundsWithUndo:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PDFAnnotation bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[PDFAnnotation setBounds:](self, "setBounds:", x, y, width, height);
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  objc_msgSend(WeakRetained, "view");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    PDFKitLocalizedString(CFSTR("Change of %@ %@"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation displayName](self, "displayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PDFAnnotation PresentableStringForAnnotationKey:](PDFAnnotation, "PresentableStringForAnnotationKey:", CFSTR("/Rect"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "undoManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "prepareWithInvocationTarget:", self);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBoundsWithUndo:", v9, v11, v13, v15);

    objc_msgSend(v26, "undoManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PDFKitLocalizedString(v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActionName:", v25);

  }
}

- (void)_savePropertiesBeforeSetBounds
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  NSArray *v9;
  NSArray *quadPoints;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/L"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_restoreLinePoints = v3 != 0;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/QuadPoints"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_restoreQuadPoints = v4 != 0;

  if (self->_restoreLinePoints)
  {
    -[PDFAnnotation startPoint](self, "startPoint");
    self->_startPoint.x = v5;
    self->_startPoint.y = v6;
    -[PDFAnnotation endPoint](self, "endPoint");
    self->_endPoint.x = v7;
    self->_endPoint.y = v8;
  }
  if (self->_restoreQuadPoints)
  {
    -[PDFAnnotation quadrilateralPoints](self, "quadrilateralPoints");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    quadPoints = self->_quadPoints;
    self->_quadPoints = v9;

  }
}

- (void)_restorePropertiesAfterSetBounds
{
  if (self->_restoreLinePoints)
  {
    -[PDFAnnotation setStartPoint:](self, "setStartPoint:", self->_startPoint.x, self->_startPoint.y);
    -[PDFAnnotation setEndPoint:](self, "setEndPoint:", self->_endPoint.x, self->_endPoint.y);
  }
  if (self->_restoreQuadPoints)
    -[PDFAnnotation setQuadrilateralPoints:](self, "setQuadrilateralPoints:", self->_quadPoints);
}

- (NSDate)modificationDate
{
  return (NSDate *)-[NSMutableDictionary objectForKey:](self->_PDFAnnotationDictionary, "objectForKey:", CFSTR("/M"));
}

- (void)setModificationDate:(NSDate *)modificationDate
{
  id v4;

  if (modificationDate)
  {
    v4 = (id)-[NSDate copy](modificationDate, "copy");
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/M"));

  }
  else
  {
    -[PDFAnnotation removeValueForAnnotationKey:](self, "removeValueForAnnotationKey:", CFSTR("/M"));
  }
}

- (NSString)userName
{
  void *v3;
  char v4;
  void *v5;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("/Widget"));

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_PDFAnnotationDictionary, "objectForKey:", CFSTR("/T"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (void)setUserName:(NSString *)userName
{
  void *v4;
  NSString *v5;

  v5 = userName;
  if (-[PDFAnnotation isMarkupAnnotation](self, "isMarkupAnnotation"))
  {
    if (v5)
    {
      v4 = (void *)-[NSString copy](v5, "copy");
      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/T"));

    }
    else
    {
      -[PDFAnnotation removeValueForAnnotationKey:](self, "removeValueForAnnotationKey:", CFSTR("/T"));
    }
  }

}

- (PDFAnnotation)popup
{
  return self->_popup;
}

- (void)setPopup:(PDFAnnotation *)popup
{
  -[PDFAnnotation setPopupInternal:scanPage:](self, "setPopupInternal:scanPage:", popup, 1);
}

- (BOOL)isSignature
{
  return self->_isSignature;
}

- (void)setIsSignature:(BOOL)a3
{
  self->_isSignature = a3;
}

- (BOOL)shouldBurnIn
{
  return self->_shouldBurnIn;
}

- (void)setShouldBurnIn:(BOOL)a3
{
  id WeakRetained;
  void *v4;
  id v5;

  self->_shouldBurnIn = a3;
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_page);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      objc_msgSend(WeakRetained, "document");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDocumentHasBurnInAnnotations:", 1);

      WeakRetained = v5;
    }

  }
}

- (id)control
{
  return objc_loadWeakRetained(&self->_control);
}

- (id)uiControl
{
  id WeakRetained;
  id v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained(&self->_control);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "textView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = WeakRetained;
  }
  v4 = v3;

  return v4;
}

- (void)setControl:(id)a3
{
  objc_storeWeak(&self->_control, a3);
  -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");
}

- (BOOL)pointerIsOverAnnotation
{
  return self->_pointerIsOverAnnotation;
}

- (void)setPointerIsOverAnnotation:(BOOL)a3
{
  if (self->_pointerIsOverAnnotation != a3)
  {
    self->_pointerIsOverAnnotation = a3;
    -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");
  }
}

- (BOOL)shouldComb
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("/Widget"))
    && objc_msgSend(v4, "isEqualToString:", CFSTR("/Tx"))
    && -[PDFAnnotation hasComb](self, "hasComb"))
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/MaxLen"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && !-[PDFAnnotation isMultiline](self, "isMultiline"))
      v6 = !-[PDFAnnotation isPasswordField](self, "isPasswordField");
    else
      LOBYTE(v6) = 0;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)inFormFillingMode
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "view"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "isInFormFillingMode");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)interactiveBackgroundColor
{
  void *v2;
  void *v5;
  int v6;
  void *v7;
  PDFWidgetControlType v8;
  void *v9;
  void *v10;

  if (!self->_shouldHideInteractiveBackgroundColor)
  {
    if (-[PDFAnnotation inFormFillingMode](self, "inFormFillingMode")
      || -[PDFAnnotation pointerIsOverAnnotation](self, "pointerIsOverAnnotation")
      && -[PDFAnnotation isTextWidget](self, "isTextWidget"))
    {
      +[PDFAnnotation PDFFormFieldBackgroundColor](PDFAnnotation, "PDFFormFieldBackgroundColor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
    }
    if (GetDefaultsWriteColorWidgetBackgrounds())
    {
      -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("/Widget"));

      if (v6)
      {
        -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Btn")))
        {
          v8 = -[PDFAnnotation widgetControlType](self, "widgetControlType");
          if (v8)
          {
            if (v8 == kPDFWidgetRadioButtonControl)
            {
              objc_msgSend(MEMORY[0x24BDF6950], "redColor");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v8 == kPDFWidgetCheckBoxControl)
                objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
              else
                objc_msgSend(MEMORY[0x24BDF6950], "orangeColor");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDF6950], "purpleColor");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Ch")))
        {
          objc_msgSend(MEMORY[0x24BDF6950], "yellowColor");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Tx")))
          {
            +[PDFAnnotation PDFFormFieldBackgroundColor](PDFAnnotation, "PDFFormFieldBackgroundColor");
            v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

            return v2;
          }
          if (!objc_msgSend(v7, "isEqualToString:", CFSTR("/Sig")))
          {
            v2 = 0;
            goto LABEL_26;
          }
          objc_msgSend(MEMORY[0x24BDF6950], "cyanColor");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v10 = v9;
        objc_msgSend(v9, "colorWithAlphaComponent:", 0.2);
        v2 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_26;
      }
    }
  }
  v2 = 0;
  return v2;
}

- (void)setShouldHideInteractiveBackgroundColor:(BOOL)a3
{
  self->_shouldHideInteractiveBackgroundColor = a3;
}

- (unint64_t)markupStyle
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  _QWORD v8[4];
  id v9;

  switch(-[PDFAnnotation markupType](self, "markupType"))
  {
    case kPDFMarkupTypeHighlight:
      -[PDFAnnotation color](self, "color");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[PDFAnnotation PDFMarkupColors](PDFAnnotation, "PDFMarkupColors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __28__PDFAnnotation_markupStyle__block_invoke;
      v8[3] = &unk_24C25C520;
      v9 = v3;
      v5 = v3;
      v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v8);

      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        v6 = 0;

      break;
    case kPDFMarkupTypeStrikeOut:
      v6 = 6;
      break;
    case kPDFMarkupTypeUnderline:
      v6 = 5;
      break;
    case kPDFMarkupTypeRedact:
      v6 = 7;
      break;
    default:
      v6 = 8;
      break;
  }
  return v6;
}

BOOL __28__PDFAnnotation_markupStyle__block_invoke(uint64_t a1, void *a2)
{
  return PDFColorComponentsAreEqual(*(void **)(a1 + 32), a2);
}

- (CGRect)noteBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  char v13;
  double v14;
  __n128 v15;
  __n128 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[PDFAnnotation popup](self, "popup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PDFAnnotation bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("/Text"));

    if ((v13 & 1) == 0)
    {
      v14 = PDFRectGetMaxX(v5, v7, v9) + 4.0;
      v15.n128_f64[0] = PDFRectGetMaxY(v5, v7, v9, v11) + 4.0;
      v16.n128_f64[0] = v14;
      v5 = PDFRectMake(v16, v15, 15.0, 15.0);
      v7 = v17;
      v9 = v18;
      v11 = v19;
    }
  }
  else
  {
    v5 = *MEMORY[0x24BDBF090];
    v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v9 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v20 = v5;
  v21 = v7;
  v22 = v9;
  v23 = v11;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)noteContainsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[PDFAnnotation noteBounds](self, "noteBounds");
  v6.x = x;
  v6.y = y;
  return PDFRectContainsPoint(v7, v6);
}

- (id)indexSetForQuadPoints
{
  NSIndexSet *quadPointsIndexSet;
  NSIndexSet *v3;
  id WeakRetained;
  void *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  NSIndexSet **location;
  id *locationa;
  id v53;
  void *v54;
  void *v55;
  unint64_t v56;
  void *v57;

  quadPointsIndexSet = self->_quadPointsIndexSet;
  if (quadPointsIndexSet)
  {
    v3 = quadPointsIndexSet;
  }
  else
  {
    location = &self->_quadPointsIndexSet;
    WeakRetained = objc_loadWeakRetained((id *)&self->_page);
    objc_msgSend(WeakRetained, "string");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/QuadPoints"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x24BDD1698]);
    if ((unint64_t)objc_msgSend(v6, "count") >= 4)
    {
      v8 = 0;
      v9 = 3;
      v53 = v7;
      do
      {
        objc_msgSend(v6, "objectAtIndex:", v9 - 3, location);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PDFKitPDFPointValue");
        v12 = v11;
        v14 = v13;

        objc_msgSend(v6, "objectAtIndex:", v9 - 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "PDFKitPDFPointValue");
        v17 = v16;
        v19 = v18;

        v20 = PDFPointMake((v12 + v17) * 0.5, (v14 + v19) * 0.5);
        v22 = v21;
        objc_msgSend(v6, "objectAtIndex:", v9 - 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "PDFKitPDFPointValue");
        v25 = v24;
        v27 = v26;

        objc_msgSend(v6, "objectAtIndex:", v9);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "PDFKitPDFPointValue");
        v30 = v29;
        v32 = v31;

        v33 = PDFPointMake((v25 + v30) * 0.5, (v27 + v32) * 0.5);
        objc_msgSend(WeakRetained, "selectionFromPoint:toPoint:type:", 0, v20, v22, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "rangeAtIndex:onPage:", 0, WeakRetained);
        v38 = v37;
        v39 = objc_msgSend(v7, "lastIndex");
        v57 = v35;
        if (objc_msgSend(v7, "lastIndex") != 0x7FFFFFFFFFFFFFFFLL)
        {
          v40 = v39 + 1;
          v41 = v36 - (v39 + 1);
          if (v38 && v41 >= 1)
          {
            objc_msgSend(v54, "substringWithRange:", objc_msgSend(v7, "lastIndex") + 1, v41);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
            v56 = v8;
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "stringByTrimmingCharactersInSet:", v43);
            v44 = WeakRetained;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v6;
            v47 = objc_msgSend(v45, "length");

            WeakRetained = v44;
            v48 = v47 == 0;
            v6 = v46;
            v7 = v53;
            if (v48)
            {
              v36 = v40;
              v49 = v41;
            }
            else
            {
              v49 = 0;
            }
            v38 += v49;
            v8 = v56;

          }
        }
        objc_msgSend(v7, "addIndexesInRange:", v36, v38);

        ++v8;
        v9 += 4;
      }
      while (v8 < (unint64_t)objc_msgSend(v6, "count") >> 2);
    }
    if (objc_msgSend(v7, "count", location))
      objc_storeStrong(locationa, v7);
    v3 = (NSIndexSet *)*locationa;

  }
  return v3;
}

- (void)setQuadPointsForIndexSet:(id)a3 withUndo:(BOOL)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFArray *v10;
  CFIndex Count;
  CFIndex v12;
  CFIndex i;
  uint64_t NumberOfRectsAndTransforms;
  uint64_t v15;
  uint64_t j;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSIndexSet *v25;
  __n128 v26;
  __n128 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  PDFAnnotation *v40;
  void *v41;
  id WeakRetained;
  void *v43;
  double v44;
  double v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  double v50[4];

  v5 = a3;
  v40 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "rangeCount"))
  {
    v7 = 0;
    v41 = v5;
    do
    {
      v8 = objc_msgSend(v5, "rangeAtIndex:", v7);
      objc_msgSend(WeakRetained, "selectionForRange:", v8, v9);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        v10 = (const __CFArray *)objc_msgSend(v43, "cgSelections");
        Count = CFArrayGetCount(v10);
        if (Count >= 1)
        {
          v12 = Count;
          for (i = 0; i != v12; ++i)
          {
            CFArrayGetValueAtIndex(v10, i);
            NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
            if (NumberOfRectsAndTransforms >= 1)
            {
              v15 = NumberOfRectsAndTransforms;
              for (j = 0; j != v15; ++j)
              {
                v49 = 0u;
                *(_OWORD *)v50 = 0u;
                v47 = 0u;
                v48 = 0u;
                v46 = 0u;
                if ((CGPDFSelectionGetRectAndTransform() & 1) == 0)
                {
                  v17 = (*((double *)&v49 + 1) + v50[1]) * *(double *)&v47;
                  v18 = (*((double *)&v49 + 1) + v50[1]) * *((double *)&v47 + 1);
                  v19 = *(double *)&v48 + v17 + *(double *)&v46 * (*(double *)&v49 + v50[0]);
                  v20 = *((double *)&v48 + 1) + v18 + *((double *)&v46 + 1) * (*(double *)&v49 + v50[0]);
                  objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFPoint:", *(double *)&v48 + v17 + *(double *)&v46 * *(double *)&v49, *((double *)&v48 + 1) + v18 + *((double *)&v46 + 1) * *(double *)&v49);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "addObject:", v21);

                  objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFPoint:", v19, v20);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "addObject:", v22);

                  objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFPoint:", *(double *)&v48 + *(double *)&v47 * *((double *)&v49 + 1) + *(double *)&v46 * *(double *)&v49, *((double *)&v48 + 1)+ *((double *)&v47 + 1) * *((double *)&v49 + 1)+ *((double *)&v46 + 1) * *(double *)&v49);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "addObject:", v23);

                  objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFPoint:", *(double *)&v48+ *(double *)&v47 * *((double *)&v49 + 1)+ *(double *)&v46 * (*(double *)&v49 + v50[0]), *((double *)&v48 + 1)+ *((double *)&v47 + 1) * *((double *)&v49 + 1)+ *((double *)&v46 + 1) * (*(double *)&v49 + v50[0]));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "addObject:", v24);

                }
              }
            }
          }
        }
      }

      ++v7;
      v5 = v41;
    }
    while (v7 < objc_msgSend(v41, "rangeCount"));
  }
  v25 = v40->_quadPointsIndexSet;
  v45 = 0.0;
  *(_QWORD *)&v46 = 0;
  *(_QWORD *)&v49 = 0;
  v44 = 0.0;
  PDFPointsGetMinMaxValues(v6, (double *)&v46, (double *)&v49, &v45, &v44);
  v26.n128_u64[0] = v46;
  v27.n128_u64[0] = v49;
  -[PDFAnnotation setBounds:](v40, "setBounds:", PDFRectMake(v26, v27, v45 - *(double *)&v46, v44 - *(double *)&v49));
  objc_storeStrong((id *)&v40->_quadPointsIndexSet, a3);
  -[PDFAnnotation setValue:forAnnotationKey:](v40, "setValue:forAnnotationKey:", v6, CFSTR("/QuadPoints"));
  objc_msgSend(WeakRetained, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28 && a4)
  {
    v29 = (void *)MEMORY[0x24BDD17C8];
    PDFKitLocalizedString(CFSTR("Change of %@ %@"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation displayName](v40, "displayName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[PDFAnnotation PresentableStringForAnnotationKey:](PDFAnnotation, "PresentableStringForAnnotationKey:", CFSTR("/QuadPoints"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "undoManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "prepareWithInvocationTarget:", v40);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setQuadPointsForIndexSet:withUndo:", v25, 1);

    objc_msgSend(v28, "undoManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    PDFKitLocalizedString(v33);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setActionName:", v37);

  }
}

- (CGPath)quadPointsPath
{
  return self->_quadPointsPath;
}

- (BOOL)isTextMarkupOrNoteAnnotation
{
  return -[PDFAnnotation isTextMarkupAnnotation](self, "isTextMarkupAnnotation")
      || -[PDFAnnotation isNoteAnnotation](self, "isNoteAnnotation");
}

- (BOOL)isNoteAnnotation
{
  void *v2;
  char v3;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("/Text"));

  return v3;
}

- (id)displayName
{
  PDFAKAnnotationAdaptor *akAnnotationAdaptor;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  PDFWidgetControlType v8;
  const __CFString *v9;
  const __CFString *v10;
  _BOOL4 v11;
  __CFString *v12;

  akAnnotationAdaptor = self->_akAnnotationAdaptor;
  if (!akAnnotationAdaptor)
  {
    -[PDFAnnotation type](self, "type");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("StrikeOut")))
    {

      v4 = CFSTR("Strikethrough");
    }
    if (-[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("Text")))
    {

      v4 = CFSTR("Note");
    }
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      goto LABEL_23;
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("/Btn")))
    {
      v8 = -[PDFAnnotation widgetControlType](self, "widgetControlType");
      v9 = CFSTR("Button");
      if (v8 == kPDFWidgetCheckBoxControl)
        v9 = CFSTR("Checkbox");
      if (v8 == kPDFWidgetRadioButtonControl)
        v10 = CFSTR("Radio Button");
      else
        v10 = v9;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Ch")))
    {
      v11 = -[PDFAnnotation isListChoice](self, "isListChoice");
      v12 = CFSTR("Combo Box");
      if (v11)
        v12 = CFSTR("List Box");
      v10 = v12;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("/Tx")) & 1) != 0)
    {
      v10 = CFSTR("Text Field");
    }
    else
    {
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("/Sig")))
      {
LABEL_23:
        PDFKitLocalizedString(v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_24;
      }
      v10 = CFSTR("Signature");
    }

    v4 = (__CFString *)v10;
    goto LABEL_23;
  }
  -[PDFAKAnnotationAdaptor akAnnotation](akAnnotationAdaptor, "akAnnotation");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString displayName](v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v5;
}

- (id)textMarkupString
{
  void *v2;
  void *v3;
  void *v4;

  -[PDFAnnotation _selectionForMarkupAnnotation](self, "_selectionForMarkupAnnotation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_selectionForMarkupAnnotation
{
  id WeakRetained;
  void *v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  if (-[PDFAnnotation isMarkupAnnotationSubtype](self, "isMarkupAnnotationSubtype"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_page);
    -[PDFAnnotation indexSetForQuadPoints](self, "indexSetForQuadPoints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "rangeCount"))
    {
      v5 = 0;
      v6 = 0;
      do
      {
        v7 = objc_msgSend(v4, "rangeAtIndex:", v5);
        objc_msgSend(WeakRetained, "selectionForRange:", v7, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v6)
          objc_msgSend(v6, "addSelection:", v9);
        else
          v6 = v9;

        ++v5;
      }
      while (v5 < objc_msgSend(v4, "rangeCount"));
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)accessibilityNode
{
  return objc_loadWeakRetained((id *)&self->_accessibilityNode);
}

- (void)setAccessibilityNode:(id)a3
{
  objc_storeWeak((id *)&self->_accessibilityNode, a3);
}

- (double)scaleFactor
{
  id WeakRetained;
  void *v4;
  void *v5;
  double BackingScaleFactor;
  double v7;
  double v8;
  double scaleFactor;

  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      BackingScaleFactor = PDFScreenGetBackingScaleFactor();
      objc_msgSend(v5, "scaleFactor");
      v8 = BackingScaleFactor * v7;
      if (v8 > 0.0 && vabdd_f64(self->_scaleFactor, v8) > 0.00000011920929)
        self->_scaleFactor = v8;
    }

  }
  scaleFactor = self->_scaleFactor;

  return scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  if (vabdd_f64(self->_scaleFactor, a3) > 0.00000011920929)
  {
    self->_scaleFactor = a3;
    -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");
  }
}

- (BOOL)isFullyConstructed
{
  return self->_isFullyConstructed;
}

- (void)setIsFullyConstructed:(BOOL)a3
{
  self->_isFullyConstructed = a3;
}

- (void)_printDictionary:(id)a3 atDepth:(int)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  objc_class *v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (a4 >= 1)
  {
    v7 = a4;
    do
    {
      objc_msgSend(v6, "appendString:", CFSTR("\t"));
      --v7;
    }
    while (v7);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v5, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = (a4 + 1);
    v12 = *(_QWORD *)v27;
    v24 = v11;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
        objc_msgSend(v5, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          NSLog(CFSTR("%@%@: String \"%@\"), v6, v14, v15);
          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "description");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("%@%@: NSValue \"%@\"), v6, v14, v16);
          goto LABEL_15;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "description");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("%@%@: NSDate \"%@\"), v6, v14, v16);
          goto LABEL_15;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "allKeys");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("%@%@: Dictionary (%d key-value pairs)"), v6, v14, objc_msgSend(v17, "count"));

          -[PDFAnnotation _printDictionary:atDepth:](self, "_printDictionary:atDepth:", v5, v11);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "appearanceCharacteristicsKeyValues");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "allKeys");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("%@%@: PDFAppearanceCharacteristics (%d key-value pairs)"), v6, v14, objc_msgSend(v18, "count"));
LABEL_26:

            v11 = v24;
            goto LABEL_27;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "description");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("%@%@: NSColor / UIColor \"%@\"), v6, v14, v16);
            goto LABEL_15;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v15, "borderKeyValues");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "allKeys");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("%@%@: PDFBorder (%d key-value pairs)"), v6, v14, objc_msgSend(v18, "count"));
            goto LABEL_26;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            NSLog(CFSTR("%@%@: PDFAnnotation Child..."), v6, v14);
            objc_msgSend(v15, "annotationKeyValues");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:
            -[PDFAnnotation _printDictionary:atDepth:](self, "_printDictionary:atDepth:", v16, v11);
LABEL_15:

            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v21 = (objc_class *)objc_opt_class();
            NSStringFromClass(v21);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("%@%@: Unknown type (%@)"), v6, v14, v16);
            goto LABEL_15;
          }
          v19 = v15;
          v23 = objc_msgSend(v19, "count");
          objc_msgSend(v19, "description");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          NSLog(CFSTR("%@%@: NSArray (%d elements), %@"), v6, v14, v23, v20);
          v11 = v24;
        }
LABEL_16:

        ++v13;
      }
      while (v10 != v13);
      v22 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v10 = v22;
    }
    while (v22);
  }

}

- (void)printDictionaryKeyValues
{
  id v3;

  -[PDFAnnotation annotationKeyValues](self, "annotationKeyValues");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation _printDictionary:atDepth:](self, "_printDictionary:atDepth:", v3, 1);

}

- (PDFBorder)border
{
  return (PDFBorder *)-[NSMutableDictionary objectForKey:](self->_PDFAnnotationDictionary, "objectForKey:", CFSTR("/Border"));
}

- (void)setBorder:(PDFBorder *)border
{
  PDFBorder *v4;
  PDFBorder *v5;

  v4 = border;
  v5 = v4;
  if (v4)
  {
    -[PDFBorder setAnnotation:](v4, "setAnnotation:", self);
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v5, CFSTR("/Border"));
  }
  else
  {
    -[PDFAnnotation removeValueForAnnotationKey:](self, "removeValueForAnnotationKey:", CFSTR("/Border"));
  }

}

- (UIColor)color
{
  return (UIColor *)-[NSMutableDictionary objectForKey:](self->_PDFAnnotationDictionary, "objectForKey:", CFSTR("/C"));
}

- (void)setColor:(UIColor *)color
{
  UIColor *v4;
  void *v5;
  uint64_t v6;
  id v7;
  PDFAnnotation *popup;
  id v9;
  id v10;

  if (color)
  {
    v4 = color;
    -[PDFAnnotation removeAllAppearanceStreams](self, "removeAllAppearanceStreams");
    v5 = (void *)-[UIColor copy](v4, "copy");

    v9 = objc_retainAutorelease(v5);
    if (CGColorGetPattern((CGColorRef)objc_msgSend(v9, "CGColor")))
    {
      NSLog(CFSTR("PDFKit \"setFontColor:\" warning: Annotations do not support pattern colors. Defaulting to clear."));
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v6 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v6;
    }
    else
    {
      v7 = v9;
    }
    v10 = v7;
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v7, CFSTR("/C"));
    popup = self->_popup;
    if (popup)
      -[PDFAnnotation setColor:](popup, "setColor:", v10);

  }
}

- (PDFAction)action
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  PDFActionGoTo *v7;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/A"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PDFAnnotation destination](self, "destination");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation URL](self, "URL");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v4)
    {
      v7 = -[PDFActionGoTo initWithDestination:]([PDFActionGoTo alloc], "initWithDestination:", v4);
    }
    else
    {
      if (!v5)
      {
        v3 = 0;
LABEL_9:

        return (PDFAction *)v3;
      }
      v7 = -[PDFActionURL initWithURL:]([PDFActionURL alloc], "initWithURL:", v5);
    }
    v3 = v7;
    if (v7)
      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v7, CFSTR("/A"));
    goto LABEL_9;
  }
  return (PDFAction *)v3;
}

- (void)setAction:(PDFAction *)action
{
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", action, CFSTR("/A"));
}

- (NSString)contents
{
  return (NSString *)-[NSMutableDictionary objectForKey:](self->_PDFAnnotationDictionary, "objectForKey:", CFSTR("/Contents"));
}

- (void)setContents:(NSString *)contents
{
  id v4;

  if (contents)
  {
    v4 = (id)-[NSString copy](contents, "copy");
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/Contents"));

  }
  else
  {
    -[PDFAnnotation removeValueForAnnotationKey:](self, "removeValueForAnnotationKey:", CFSTR("/Contents"));
  }
}

- (void)setContents:(id)a3 withUndo:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  __n128 v18;
  __n128 v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  id WeakRetained;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v4 = a4;
  v38 = a3;
  -[PDFAnnotation contents](self, "contents");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v38)
  {
    v6 = v38;
  }
  else if ((objc_msgSend(v38, "isEqualToString:", v6) & 1) == 0)
  {
    -[PDFAnnotation setContents:](self, "setContents:", v38);
    if (v38)
    {
      -[PDFAnnotation popup](self, "popup");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        -[PDFAnnotation bounds](self, "bounds");
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v16 = objc_alloc(-[PDFAnnotation annotationSubclassForPopup](self, "annotationSubclassForPopup"));
        v17 = PDFRectGetMaxX(v9, v11, v13) + 4.0;
        v18.n128_f64[0] = PDFRectGetMaxY(v9, v11, v13, v15) + 4.0;
        v19.n128_f64[0] = v17;
        v20 = (void *)objc_msgSend(v16, "initWithBounds:forType:withProperties:", CFSTR("/Popup"), 0, PDFRectMake(v19, v18, 72.0, 36.0));
        -[PDFAnnotation setPopup:](self, "setPopup:", v20);

      }
    }
    else
    {
      -[PDFAnnotation setPopup:](self, "setPopup:", 0);
    }
    if (objc_msgSend(v38, "isEqualToString:", &stru_24C25F170))
      v21 = 0;
    else
      v21 = v38;
    v22 = v21;

    if (objc_msgSend(v6, "isEqualToString:", &stru_24C25F170))
      v23 = 0;
    else
      v23 = v6;
    v24 = v23;

    v6 = 0;
    v38 = 0;
    if (v22 | v24)
    {
      v38 = (id)v22;
      v6 = (id)v24;
      WeakRetained = objc_loadWeakRetained((id *)&self->_page);
      objc_msgSend(WeakRetained, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26 && v4 && objc_msgSend(v26, "allowsUndo"))
      {
        v28 = (void *)MEMORY[0x24BDD17C8];
        PDFKitLocalizedString(CFSTR("Change of %@ %@"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFAnnotation displayName](self, "displayName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[PDFAnnotation PresentableStringForAnnotationKey:](PDFAnnotation, "PresentableStringForAnnotationKey:", CFSTR("/Contents"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v27, "undoManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "prepareWithInvocationTarget:", self);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setContents:withUndo:", v6, 1);

        objc_msgSend(v27, "undoManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        PDFKitLocalizedString(v32);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setActionName:", v36);

        -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v38 && objc_msgSend(v37, "isEqualToString:", CFSTR("/Text")))
          objc_msgSend(WeakRetained, "removeAnnotation:withUndo:", self, 1);

      }
    }
  }

}

- (NSString)toolTip
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PDFAnnotation contents](self, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PDFAnnotation contents](self, "contents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PDFAnnotation action](self, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PDFAnnotation action](self, "action");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "toolTip");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  return (NSString *)v4;
}

- (BOOL)hasAppearanceStream
{
  return self->_normalAppearance != 0;
}

- (void)removeAllAppearanceStreams
{
  -[PDFAnnotation removeValueForAnnotationKey:](self, "removeValueForAnnotationKey:", CFSTR("/AP"));
}

- (BOOL)_annotationAllowsCommenting:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  BOOL v8;
  char v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  objc_msgSend(WeakRetained, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 1;
  if (WeakRetained && v6 && self->_isFullyConstructed)
  {
    v9 = objc_msgSend(v6, "allowsCommenting");
    v10 = objc_msgSend(v7, "allowsFormFieldEntry");
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("/Widget"));

    v13 = objc_msgSend(v7, "permissionsStatus");
    v14 = CFSTR("user");
    if (v13 == 2)
      v14 = CFSTR("owner");
    v15 = v14;
    v16 = v15;
    if ((v9 & 1) != 0 || (v12 & 1) != 0)
    {
      if (((v10 | v12 ^ 1) & 1) != 0)
      {
        v8 = 1;
LABEL_13:

        goto LABEL_14;
      }
      NSLog(CFSTR("PDFAnnotations's setValue:forAnnotationKey: failed. PDF document's %@ permissions does not allow form field modifications."), v15);
    }
    else
    {
      NSLog(CFSTR("PDFAnnotations's %@ failed. PDF document's %@ permissions does not allow annotation modifications."), v4, v15);
    }
    v8 = 0;
    goto LABEL_13;
  }
LABEL_14:

  return v8;
}

- (BOOL)_isValidAnnotationKey:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v7;
  uint64_t v8;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length") && objc_msgSend(v4, "characterAtIndex:", 0) == 47)
  {
    if (objc_msgSend(v4, "length") == 1)
    {
      v5 = 1;
    }
    else
    {
      if (_isValidAnnotationKey__onceToken != -1)
        dispatch_once(&_isValidAnnotationKey__onceToken, &__block_literal_global_1);
      objc_msgSend(v4, "substringFromIndex:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rangeOfCharacterFromSet:", _isValidAnnotationKey__invalidCharacters);
      v5 = v8 == 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __39__PDFAnnotation__isValidAnnotationKey___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "mutableCopy");
  v2 = (void *)_isValidAnnotationKey__invalidCharacters;
  _isValidAnnotationKey__invalidCharacters = v1;

  return objc_msgSend((id)_isValidAnnotationKey__invalidCharacters, "addCharactersInString:", CFSTR("()<>[]{}/%"));
}

- (BOOL)setValue:(id)value forAnnotationKey:(PDFAnnotationKey)key
{
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  BOOL v14;
  _BOOL4 loggingEnabled;

  v6 = value;
  v7 = key;
  if (-[PDFAnnotation _annotationAllowsCommenting:](self, "_annotationAllowsCommenting:", CFSTR("setValue:forAnnotationKey:")))
  {
    +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PDFAnnotation _isValidAnnotationKey:](self, "_isValidAnnotationKey:", v8))
    {
      if (v6)
      {
        -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](self->_PDFAnnotationKeyMapping, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          switch(objc_msgSend(v10, "integerValue"))
          {
            case 0:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && -[PDFAnnotation _setArray:forAnnotationKey:](self, "_setArray:forAnnotationKey:", v6, v8))
              {
                goto LABEL_25;
              }
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error: Key %@ requires an array value."), v8);
              goto LABEL_43;
            case 1:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v13 = 0;
                  goto LABEL_44;
                }
              }
              v14 = -[PDFAnnotation setBoolean:forAnnotationKey:](self, "setBoolean:forAnnotationKey:", objc_msgSend(v6, "BOOLValue"), v8);
LABEL_46:
              v12 = v14;
              v13 = 0;
              break;
            case 2:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && -[PDFAnnotation _setDictionary:forAnnotationKey:](self, "_setDictionary:forAnnotationKey:", v6, v8))
              {
                goto LABEL_25;
              }
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error: Key %@ requires a dictionary value."), v8);
              goto LABEL_43;
            case 3:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                if (-[PDFAnnotation _setInteger:forAnnotationKey:](self, "_setInteger:forAnnotationKey:", v6, v8))
                  goto LABEL_25;
              }
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error: Key %@ requires an integer value."), v8);
              goto LABEL_43;
            case 4:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v6, "PDFKitPDFRectValue");
                if (-[PDFAnnotation setRect:forAnnotationKey:](self, "setRect:forAnnotationKey:", v8))
                  goto LABEL_25;
              }
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error: Key %@ requires an NSValue of either rectValue or CGRectValue."), v8);
              goto LABEL_43;
            case 5:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && -[PDFAnnotation _setString:forAnnotationKey:](self, "_setString:forAnnotationKey:", v6, v8))
              {
                goto LABEL_25;
              }
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error: Key %@ requires a string value."), v8);
              goto LABEL_43;
            case 6:
              v14 = -[PDFAnnotation _setVarious:forAnnotationKey:](self, "_setVarious:forAnnotationKey:", v6, v8);
              goto LABEL_46;
            default:
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error: Could not resolve type for known key %@."), v8);
              goto LABEL_43;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_24;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_24;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_24;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_24;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
LABEL_24:
            -[NSMutableDictionary setObject:forKey:](self->_PDFAnnotationDictionary, "setObject:forKey:", v6, v8);
LABEL_25:
            v13 = 0;
            v12 = 1;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error: Invalid value for annotation key: %@"), v8);
LABEL_43:
            v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_44:
            v12 = 0;
          }
        }
        -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");
        -[PDFAnnotation presentRedactionDiscoverabilityAlertWithOldValue:forAnnotationKey:](self, "presentRedactionDiscoverabilityAlertWithOldValue:forAnnotationKey:", v9, v8);
        loggingEnabled = self->_loggingEnabled;
        if (!self->_loggingEnabled && v13)
        {
          if (setValue_forAnnotationKey__onceToken != -1)
            dispatch_once(&setValue_forAnnotationKey__onceToken, &__block_literal_global_296);
          loggingEnabled = self->_loggingEnabled;
        }
        if (loggingEnabled && v13)
          NSLog(CFSTR("%@"), v13);

      }
      else
      {
        -[PDFAnnotation removeValueForAnnotationKey:](self, "removeValueForAnnotationKey:", v8);
        v12 = 1;
      }
    }
    else
    {
      NSLog(CFSTR("Error: %@ key is invalid."), v7);
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __43__PDFAnnotation_setValue_forAnnotationKey___block_invoke()
{
  NSLog(&CFSTR("-[PDFAnnotation setValue:forAnnotationKey:] failed. Turn on logging to learn more: set environment variable \"P"
               "DFKIT_LOG_ANNOTATIONS\" to any value.").isa);
}

- (BOOL)setBoolean:(BOOL)value forAnnotationKey:(PDFAnnotationKey)key
{
  _BOOL8 v4;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = value;
  v6 = key;
  if (-[PDFAnnotation _annotationAllowsCommenting:](self, "_annotationAllowsCommenting:", CFSTR("setBoolean:forAnnotationKey:")))
  {
    +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PDFAnnotation _isValidAnnotationKey:](self, "_isValidAnnotationKey:", v7))
    {
      -[NSDictionary objectForKey:](self->_PDFAnnotationKeyMapping, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8 && objc_msgSend(v8, "integerValue") != 1)
      {
        if (self->_loggingEnabled)
          NSLog(CFSTR("Error: %@ does not take a Boolean as it's value."), v7);
        v11 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](self->_PDFAnnotationDictionary, "setObject:forKey:", v10, v7);
        -[PDFAnnotation _didSetValue:forAnnotationKey:](self, "_didSetValue:forAnnotationKey:", v10, v7);

        v11 = 1;
      }

    }
    else
    {
      NSLog(CFSTR("Error: %@ is not a valid key."), v6);
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)setRect:(CGRect)value forAnnotationKey:(PDFAnnotationKey)key
{
  double height;
  double width;
  double y;
  double x;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  height = value.size.height;
  width = value.size.width;
  y = value.origin.y;
  x = value.origin.x;
  v9 = key;
  if (-[PDFAnnotation _annotationAllowsCommenting:](self, "_annotationAllowsCommenting:", CFSTR("setRect:forAnnotationKey:")))
  {
    +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PDFAnnotation _isValidAnnotationKey:](self, "_isValidAnnotationKey:", v10))
    {
      -[NSDictionary objectForKey:](self->_PDFAnnotationKeyMapping, "objectForKey:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && objc_msgSend(v11, "integerValue") != 4)
      {
        if (self->_loggingEnabled)
          NSLog(CFSTR("Error: %@ does not take a rect as it's value."), v10);
        v14 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", x, y, width, height);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("/Rect")))
          -[PDFAnnotation setBounds:](self, "setBounds:", x, y, width, height);
        else
          -[NSMutableDictionary setObject:forKey:](self->_PDFAnnotationDictionary, "setObject:forKey:", v13, v10);
        -[PDFAnnotation _didSetValue:forAnnotationKey:](self, "_didSetValue:forAnnotationKey:", v13, v10);

        v14 = 1;
      }

    }
    else
    {
      NSLog(CFSTR("Error: %@ key is invalid."), v9);
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_setString:(id)a3 forAnnotationKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("/FT")))
  {
    +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[PDFAnnotation PDFKitFieldTypeArray](PDFAnnotation, "PDFKitFieldTypeArray");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = (void *)v10;
    goto LABEL_6;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("/H")))
  {
    +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[PDFAnnotation PDFKitHighlightingModeArray](PDFAnnotation, "PDFKitHighlightingModeArray");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Contents")) && self->_isFullyConstructed)
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation popup](self, "popup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("/FreeText")))
    {
      -[PDFAnnotation removeAllAppearanceStreams](self, "removeAllAppearanceStreams");
    }
    else if (v15 && objc_msgSend(v15, "isOpen"))
    {
      -[NSMutableDictionary setObject:forKey:](self->_PDFAnnotationDictionary, "setObject:forKey:", v8, v7);
      objc_msgSend(v15, "removeAllAppearanceStreams");
      objc_msgSend(v15, "updateAnnotationEffect");
    }

  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Subtype")))
  {
    +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
    goto LABEL_6;
  }
  v11 = 0;
  v9 = v8;
LABEL_6:
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("/V")))
    -[PDFAnnotation setWidgetStringValue:](self, "setWidgetStringValue:", v9);
  if (v11 && !objc_msgSend(v11, "containsObject:", v9))
  {
    v12 = 0;
  }
  else
  {
    -[NSMutableDictionary setObject:forKey:](self->_PDFAnnotationDictionary, "setObject:forKey:", v9, v7);
    -[PDFAnnotation _didSetValue:forAnnotationKey:](self, "_didSetValue:forAnnotationKey:", v9, v7);
    v12 = 1;
  }

  return v12;
}

- (BOOL)_setArray:(id)a3 forAnnotationKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  char v12;
  int v13;
  void *v14;
  char isKindOfClass;
  uint64_t v16;
  char v17;
  char v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  id v27;
  void *v28;
  void *v29;
  unint64_t v30;
  char v31;
  char v32;
  CGPath *quadPointsPath;
  unint64_t v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  void *v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  void *v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  void *v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  uint64_t v57;
  char v58;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = objc_msgSend(v8, "count");
  v10 = v8;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("/InkList")) & 1) != 0)
  {
LABEL_2:
    -[NSMutableDictionary setObject:forKey:](self->_PDFAnnotationDictionary, "setObject:forKey:", v10, v7);
    -[PDFAnnotation _didSetValue:forAnnotationKey:](self, "_didSetValue:forAnnotationKey:", v10, v7);
    v11 = 1;
    goto LABEL_49;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("/L")))
  {
    if (v9 != 4)
      goto LABEL_46;
    v12 = 1;
    v13 = 4;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        v12 = 0;
      --v13;
    }
    while (v13);
    v10 = v8;
    if ((v12 & 1) == 0)
      goto LABEL_46;
    goto LABEL_2;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("/LE")))
  {
    if (v9 != 2)
      goto LABEL_46;
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v16 = 0;
    v17 = 1;
    v18 = 1;
    while (1)
    {
      v19 = v17;
      objc_msgSend(v8, "objectAtIndex:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[PDFAnnotation nameForLineStyle:](PDFAnnotation, "nameForLineStyle:", objc_msgSend(v20, "integerValue"));
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v18 = 0;
          goto LABEL_20;
        }
        +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v20);
        v21 = objc_claimAutoreleasedReturnValue();
      }
      v22 = (void *)v21;
      objc_msgSend(v10, "addObject:", v21);

LABEL_20:
      v17 = 0;
      v16 = 1;
      if ((v19 & 1) == 0)
      {
        if ((v18 & 1) != 0)
        {

          goto LABEL_2;
        }
LABEL_45:

        goto LABEL_46;
      }
    }
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("/Opt")))
  {
    v10 = v8;
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("/QuadPoints")))
    {
      quadPointsPath = self->_quadPointsPath;
      if (quadPointsPath)
        CGPathRelease(quadPointsPath);
      self->_quadPointsPath = CGPathCreateMutable();
      v10 = v8;
      if ((unint64_t)objc_msgSend(v8, "count") >= 4)
      {
        v35 = 3;
        do
        {
          objc_msgSend(v8, "objectAtIndex:", v35 - 3);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "PDFKitPDFPointValue");
          v38 = v37;
          v40 = v39;

          objc_msgSend(v8, "objectAtIndex:", v35 - 2);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "PDFKitPDFPointValue");
          v43 = v42;
          v45 = v44;

          objc_msgSend(v8, "objectAtIndex:", v35 - 1);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "PDFKitPDFPointValue");
          v48 = v47;
          v50 = v49;

          objc_msgSend(v8, "objectAtIndex:", v35);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "PDFKitPDFPointValue");
          v53 = v52;
          v55 = v54;

          CGPathMoveToPoint(self->_quadPointsPath, 0, v38, v40);
          CGPathAddLineToPoint(self->_quadPointsPath, 0, v43, v45);
          CGPathAddLineToPoint(self->_quadPointsPath, 0, v53, v55);
          CGPathAddLineToPoint(self->_quadPointsPath, 0, v48, v50);
          CGPathAddLineToPoint(self->_quadPointsPath, 0, v38, v40);
          CGPathCloseSubpath(self->_quadPointsPath);
          v35 += 4;
        }
        while (v35 < objc_msgSend(v8, "count"));
        v10 = v8;
      }
    }
    goto LABEL_2;
  }
  v10 = v8;
  if (!v9)
    goto LABEL_2;
  v23 = 0;
  v24 = v9 - 1;
  v25 = 1;
  v26 = 0x24BDD1000uLL;
  v57 = v9 - 1;
  do
  {
    objc_msgSend(v8, "objectAtIndex:", v23);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_45;
      v27 = v10;
      if (objc_msgSend(v27, "count") == 2)
      {
        objc_msgSend(v27, "objectAtIndex:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v58 = objc_opt_isKindOfClass();

        objc_msgSend(v27, "objectAtIndex:", 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v30 = v26;
        v31 = objc_opt_isKindOfClass();

        v24 = v57;
        v32 = v31 & v58;
        v26 = v30;
        if ((v32 & 1) == 0)
          v25 = 0;
      }
      else
      {
        v25 = 0;
      }

    }
    if ((v25 & 1) == 0)
      break;
  }
  while (v24 != v23++);
  v10 = v8;
  if ((v25 & 1) != 0)
    goto LABEL_2;
LABEL_46:
  if (self->_loggingEnabled)
    NSLog(CFSTR("Error: Improper value for key %@."), v7);
  v11 = 0;
  v10 = v8;
LABEL_49:

  return v11;
}

- (BOOL)_setDictionary:(id)a3 forAnnotationKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t i;
  void *v17;
  BOOL v18;
  PDFAnnotation *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("/AP")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("/MK")))
  {
    +[PDFAnnotation PDFKitAppearanceDictionaryArray](PDFAnnotation, "PDFKitAppearanceDictionaryArray");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("/BS")))
    {
      v10 = 0;
      goto LABEL_23;
    }
    +[PDFAnnotation PDFKitBorderStyleArray](PDFAnnotation, "PDFKitBorderStyleArray");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  if (!v9)
  {
LABEL_23:
    -[NSMutableDictionary setObject:forKey:](self->_PDFAnnotationDictionary, "setObject:forKey:", v8, v7);
    -[PDFAnnotation _didSetValue:forAnnotationKey:](self, "_didSetValue:forAnnotationKey:", v8, v7);
    v18 = 1;
    goto LABEL_24;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v12)
  {

    goto LABEL_23;
  }
  v13 = v12;
  v20 = self;
  v14 = *(_QWORD *)v22;
  v15 = 1;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v22 != v14)
        objc_enumerationMutation(v11);
      +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "containsObject:", v17))
        v15 = 0;

    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v13);

  if ((v15 & 1) != 0)
  {
    self = v20;
    goto LABEL_23;
  }
  if (v20->_loggingEnabled)
    NSLog(CFSTR("Error: Improper value for key %@."), v7);
  v18 = 0;
LABEL_24:

  return v18;
}

- (BOOL)_setInteger:(id)a3 forAnnotationKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  if ((!strcmp((const char *)objc_msgSend(v8, "objCType"), "i")
     || !strcmp((const char *)objc_msgSend(objc_retainAutorelease(v8), "objCType"), "q"))
    && (!objc_msgSend(v7, "isEqualToString:", CFSTR("/Q"))
     || (unint64_t)objc_msgSend(v8, "integerValue") <= 2))
  {
    -[NSMutableDictionary setObject:forKey:](self->_PDFAnnotationDictionary, "setObject:forKey:", v8, v7);
    -[PDFAnnotation _didSetValue:forAnnotationKey:](self, "_didSetValue:forAnnotationKey:", v8, v7);
    v9 = 1;
  }
  else
  {
    if (self->_loggingEnabled)
      NSLog(CFSTR("Error: Improper value for key %@."), v7);
    v9 = 0;
  }

  return v9;
}

- (BOOL)_setVarious:(id)a3 forAnnotationKey:(id)a4
{
  PDFAnnotation *v6;
  id v7;
  char isKindOfClass;
  PDFAnnotation *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  float v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  int v23;
  char v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  PDFAnnotation *v30;
  PDFAnnotation *popup;
  PDFAnnotation *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  char v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  char v41;

  v6 = (PDFAnnotation *)a3;
  v7 = a4;
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("/A")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("/AA")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
LABEL_5:
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    goto LABEL_6;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Border")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PDFAnnotation setAnnotation:](v6, "setAnnotation:", self);
        goto LABEL_4;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_4;
      v6 = v6;
      v19 = -[PDFAnnotation count](v6, "count");
      if ((unint64_t)(v19 - 3) > 1)
        goto LABEL_44;
      v40 = v19;
      v20 = 0;
      v41 = 1;
      do
      {
        -[PDFAnnotation objectAtIndex:](v6, "objectAtIndex:", v20);
        v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        if (!strcmp((const char *)objc_msgSend(v21, "objCType"), "i"))
        {

        }
        else
        {
          -[PDFAnnotation objectAtIndex:](v6, "objectAtIndex:", v20);
          v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v23 = strcmp((const char *)objc_msgSend(v22, "objCType"), "q");

          if (v23)
            v41 = 0;
        }
        ++v20;
      }
      while (v20 != 3);
      if (v40 != 4)
      {
        v24 = v41;
        goto LABEL_93;
      }
      v24 = v41;
      if ((v41 & 1) == 0)
      {
LABEL_93:

        isKindOfClass = v24 & 1;
        goto LABEL_6;
      }
      -[PDFAnnotation objectAtIndex:](v6, "objectAtIndex:", 3);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PDFAnnotation objectAtIndex:](v6, "objectAtIndex:", 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

        if (v27 > 2)
        {
LABEL_44:
          v24 = 0;
          goto LABEL_93;
        }
        -[PDFAnnotation objectAtIndex:](v6, "objectAtIndex:", 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v25, "count");
        if (v33)
        {
          v34 = v33;
          objc_msgSend(v25, "objectAtIndex:", 0);
          v35 = objc_claimAutoreleasedReturnValue();
          if (IsObcCEquivalent((void *)v35, "i"))
          {
            if ((v35 & 0x8000000000000000) == 0)
            {
LABEL_76:
              if (((v35 == 0) & (v34 == 1) & v41) != 0)
                v37 = 0;
              else
                v37 = v41;
              if (v34 != 2 || (v37 & 1) == 0)
                goto LABEL_91;
              objc_msgSend(v25, "objectAtIndex:", 1);
              v38 = objc_claimAutoreleasedReturnValue();
              if (IsObcCEquivalent((void *)v38, "i"))
              {
                if ((v38 & 0x8000000000000000) == 0)
                  goto LABEL_87;
              }
              else
              {
                v39 = IsObcCEquivalent((void *)v38, "q");
                if ((v38 & 0x8000000000000000) == 0 || !v39)
                {
LABEL_87:
                  if (((v35 == 0) & v41) != 0)
                    v37 = 0;
                  else
                    v37 = v41;

LABEL_91:
                  v24 = v37;
                  goto LABEL_92;
                }
              }
              v41 = 0;
              goto LABEL_87;
            }
          }
          else
          {
            v36 = IsObcCEquivalent((void *)v35, "q");
            if ((v35 & 0x8000000000000000) == 0 || !v36)
              goto LABEL_76;
          }
          v41 = 0;
          goto LABEL_76;
        }
        v24 = v41;
      }
      else
      {
        v24 = 0;
      }
LABEL_92:

      goto LABEL_93;
    }
LABEL_55:
    isKindOfClass = 0;
    goto LABEL_56;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Dest")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
    goto LABEL_5;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("/C")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("/IC")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_5;
    v9 = v6;
    v10 = -[PDFAnnotation count](v9, "count");
    v11 = v10;
    if ((unint64_t)(v10 - 3) >= 2)
    {
      if (!v10)
        goto LABEL_49;
      if (v10 != 1)
      {
LABEL_31:
        isKindOfClass = 0;
        v6 = v9;
LABEL_50:

        goto LABEL_6;
      }
    }
    v12 = 0;
    v13 = 1;
    do
    {
      -[PDFAnnotation objectAtIndex:](v9, "objectAtIndex:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFAnnotation objectAtIndex:](v9, "objectAtIndex:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v16 = objc_opt_isKindOfClass();

      if ((v16 & 1) == 0
        || (objc_msgSend(v14, "floatValue"), v17 < 0.0)
        || (objc_msgSend(v14, "floatValue"), v18 > 1.0))
      {
        v13 = 0;
      }

      ++v12;
    }
    while (v11 != v12);
    if ((v13 & 1) == 0)
      goto LABEL_31;
LABEL_49:
    PDFColorCreateFromNSArray(v9);
    v6 = (PDFAnnotation *)objc_claimAutoreleasedReturnValue();

    isKindOfClass = 1;
    goto LABEL_50;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("/M")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
    goto LABEL_5;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("/P")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_55;
    }
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_62:
    v30 = (PDFAnnotation *)v28;

    isKindOfClass = 1;
    v6 = v30;
    goto LABEL_6;
  }
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("/Parent")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Popup")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        popup = self->_popup;
        self->_popup = v6;
        v32 = v6;

        -[PDFAnnotation pdfAnnotationUUID](v32, "pdfAnnotationUUID");
        v6 = (PDFAnnotation *)objc_claimAutoreleasedReturnValue();

      }
    }
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeWeak((id *)&self->_parent, v6);
    -[PDFAnnotation pdfAnnotationUUID](v6, "pdfAnnotationUUID");
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_62;
  }
LABEL_4:
  isKindOfClass = 1;
LABEL_6:
  if ((isKindOfClass & 1) != 0 && v6)
  {
    -[NSMutableDictionary setObject:forKey:](self->_PDFAnnotationDictionary, "setObject:forKey:", v6, v7);
    -[PDFAnnotation _didSetValue:forAnnotationKey:](self, "_didSetValue:forAnnotationKey:", v6, v7);
    isKindOfClass = 1;
    goto LABEL_58;
  }
LABEL_56:
  if (self->_loggingEnabled)
    NSLog(CFSTR("Error: Improper value for key %@."), v7);
LABEL_58:

  return isKindOfClass & 1;
}

- (NSDictionary)annotationKeyValues
{
  PDFAnnotation *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char *v15;
  const __CFString *v16;
  id v17;
  void *v18;
  PDFAnnotation *v19;
  uint64_t v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v2 = self;
  v28 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary allKeys](self->_PDFAnnotationDictionary, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    v9 = CFSTR("/Parent");
    do
    {
      v10 = 0;
      v11 = sel_copyWithZone_;
      v22 = v7;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        if ((objc_msgSend(v12, "isEqualToString:", v9) & 1) == 0)
        {
          -[NSMutableDictionary objectForKey:](v2->_PDFAnnotationDictionary, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v14 = v8;
            v15 = v11;
            v16 = v9;
            v17 = v5;
            v18 = v4;
            v19 = v2;
            v20 = objc_msgSend(v13, "copyWithZone:", 0);

            v13 = (void *)v20;
            v2 = v19;
            v4 = v18;
            v5 = v17;
            v9 = v16;
            v11 = v15;
            v8 = v14;
            v7 = v22;
          }
          objc_msgSend(v4, "setObject:forKey:", v13, v12);

        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  return (NSDictionary *)v4;
}

- (id)valueForAnnotationKey:(PDFAnnotationKey)key
{
  void *v4;
  PDFAnnotation *WeakRetained;
  PDFAnnotation *v6;
  PDFAnnotation *v7;

  if (key)
  {
    +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("/Parent")))
    {
      WeakRetained = (PDFAnnotation *)objc_loadWeakRetained((id *)&self->_parent);
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("/Popup")))
    {
      WeakRetained = self->_popup;
    }
    else
    {
      -[NSMutableDictionary objectForKey:](self->_PDFAnnotationDictionary, "objectForKey:", v4);
      WeakRetained = (PDFAnnotation *)objc_claimAutoreleasedReturnValue();
    }
    v6 = WeakRetained;
    if (WeakRetained)
    {
      v7 = WeakRetained;
    }
    else if (self->_loggingEnabled)
    {
      NSLog(CFSTR("Error: No value currently exists for key %@"), v4);
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)removeValueForAnnotationKey:(PDFAnnotationKey)key
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;

  v8 = key;
  +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PDFAnnotation _isValidAnnotationKey:](self, "_isValidAnnotationKey:", v4))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("/AP")))
    {
      -[PDFAnnotation setAppearance:forType:](self, "setAppearance:forType:", 0, 0);
      -[PDFAnnotation setAppearance:forType:](self, "setAppearance:forType:", 0, 1);
      -[PDFAnnotation setAppearance:forType:](self, "setAppearance:forType:", 0, 2);
      -[PDFAnnotation setAppearance:forType:](self, "setAppearance:forType:", 0, 3);
      -[PDFAnnotation setAppearance:forType:](self, "setAppearance:forType:", 0, 4);
      -[PDFAnnotation setAppearance:forType:](self, "setAppearance:forType:", 0, 5);
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("/Border")))
    {
      -[NSMutableDictionary objectForKey:](self->_PDFAnnotationDictionary, "objectForKey:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAnnotation:", 0);

    }
    if (v4)
    {
      -[NSMutableDictionary objectForKey:](self->_PDFAnnotationDictionary, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {

LABEL_11:
        -[NSMutableDictionary removeObjectForKey:](self->_PDFAnnotationDictionary, "removeObjectForKey:", v4);
        -[NSMutableDictionary removeObjectForKey:](self->_internalPDFAnnotationDictionary, "removeObjectForKey:", v4);
        -[PDFAnnotation _didRemoveValueForAnnotationKey:](self, "_didRemoveValueForAnnotationKey:", v4);
        -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");
        goto LABEL_12;
      }
      -[NSMutableDictionary objectForKey:](self->_internalPDFAnnotationDictionary, "objectForKey:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        goto LABEL_11;
    }
  }
  else
  {
    NSLog(CFSTR("Error: %@ key is invalid."), v8);
  }
LABEL_12:

}

- (void)_didSetValue:(id)a3 forAnnotationKey:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  PDFAKAnnotationAdaptor *akAnnotationAdaptor;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  if (WeakRetained && (objc_msgSend(v7, "isEqualToString:", CFSTR("/P")) & 1) == 0 && self->_isFullyConstructed)
    objc_msgSend(WeakRetained, "changedAnnotation:", self);
  akAnnotationAdaptor = self->_akAnnotationAdaptor;
  if (akAnnotationAdaptor)
    -[PDFAKAnnotationAdaptor didSetValue:forAnnotationKey:](akAnnotationAdaptor, "didSetValue:forAnnotationKey:", v6, v7);
  -[PDFAnnotation postAnnotationsChangedNotification](self, "postAnnotationsChangedNotification");
  objc_msgSend(WeakRetained, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "allowsMarkupAnnotationEditing");

  if (v11)
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("/Widget"))
      && objc_msgSend(v7, "isEqualToString:", CFSTR("/V"))
      && -[PDFAnnotation isFullyConstructed](self, "isFullyConstructed"))
    {
      -[PDFAnnotation updateFormData](self, "updateFormData");
    }
    if (-[PDFAnnotation isFullyConstructed](self, "isFullyConstructed"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = CFSTR("annotation");
      v16[1] = CFSTR("key");
      v17[0] = self;
      v17[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("PDFAnnotationPropertiesChangedNotificationNotification"), v14, v15);

    }
  }

}

- (void)_didRemoveValueForAnnotationKey:(id)a3
{
  id v4;
  id WeakRetained;
  PDFAKAnnotationAdaptor *akAnnotationAdaptor;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  if (WeakRetained && (objc_msgSend(v4, "isEqualToString:", CFSTR("/P")) & 1) == 0 && self->_isFullyConstructed)
    objc_msgSend(WeakRetained, "changedAnnotation:", self);
  akAnnotationAdaptor = self->_akAnnotationAdaptor;
  if (akAnnotationAdaptor)
    -[PDFAKAnnotationAdaptor didRemoveValueForAnnotationKey:](akAnnotationAdaptor, "didRemoveValueForAnnotationKey:", v4);
  objc_msgSend(WeakRetained, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsMarkupAnnotationEditing");

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = CFSTR("annotation");
    v12[1] = CFSTR("key");
    v13[0] = self;
    v13[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("PDFAnnotationPropertiesChangedNotificationNotification"), v10, v11);

  }
}

- (id)getPDFKeyMappingDictionary
{
  if (getPDFKeyMappingDictionary_onceToken != -1)
    dispatch_once(&getPDFKeyMappingDictionary_onceToken, &__block_literal_global_325);
  return (id)getPDFKeyMappingDictionary_kPDFKeyMappingDictionary;
}

void __43__PDFAnnotation_getPDFKeyMappingDictionary__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[42];
  _QWORD v45[44];

  v45[42] = *MEMORY[0x24BDAC8D0];
  v44[0] = CFSTR("/A");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v43;
  v44[1] = CFSTR("/AC");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v42;
  v44[2] = CFSTR("/AA");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v41;
  v44[3] = CFSTR("/AP");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v40;
  v44[4] = CFSTR("/AS");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v39;
  v44[5] = CFSTR("/BC");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v38;
  v44[6] = CFSTR("/BG");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v37;
  v44[7] = CFSTR("/Border");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v36;
  v44[8] = CFSTR("/BS");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45[8] = v35;
  v44[9] = CFSTR("/C");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45[9] = v34;
  v44[10] = CFSTR("/CA");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[10] = v33;
  v44[11] = CFSTR("/Contents");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v45[11] = v32;
  v44[12] = CFSTR("/DA");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45[12] = v31;
  v44[13] = CFSTR("/Dest");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45[13] = v30;
  v44[14] = CFSTR("/DV");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v45[14] = v29;
  v44[15] = CFSTR("/F");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45[15] = v28;
  v44[16] = CFSTR("/Ff");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v45[16] = v27;
  v44[17] = CFSTR("/FT");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[17] = v26;
  v44[18] = CFSTR("/H");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v45[18] = v25;
  v44[19] = CFSTR("/IC");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45[19] = v24;
  v44[20] = CFSTR("/Inklist");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45[20] = v23;
  v44[21] = CFSTR("/L");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45[21] = v22;
  v44[22] = CFSTR("/LE");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v45[22] = v21;
  v44[23] = CFSTR("/M");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45[23] = v20;
  v44[24] = CFSTR("/MaxLen");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45[24] = v19;
  v44[25] = CFSTR("/MK");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45[25] = v18;
  v44[26] = CFSTR("/Name");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45[26] = v17;
  v44[27] = CFSTR("/Open");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[27] = v16;
  v44[28] = CFSTR("/Opt");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[28] = v15;
  v44[29] = CFSTR("/P");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[29] = v14;
  v44[30] = CFSTR("/Parent");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45[30] = v13;
  v44[31] = CFSTR("/Popup");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[31] = v12;
  v44[32] = CFSTR("/Q");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v45[32] = v0;
  v44[33] = CFSTR("/QuadPoints");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v45[33] = v1;
  v44[34] = CFSTR("/R");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v45[34] = v2;
  v44[35] = CFSTR("/RC");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v45[35] = v3;
  v44[36] = CFSTR("/Rect");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45[36] = v4;
  v44[37] = CFSTR("/Subtype");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45[37] = v5;
  v44[38] = CFSTR("/Type");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45[38] = v6;
  v44[39] = CFSTR("/T");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45[39] = v7;
  v44[40] = CFSTR("/TU");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[40] = v8;
  v44[41] = CFSTR("/V");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45[41] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 42);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)getPDFKeyMappingDictionary_kPDFKeyMappingDictionary;
  getPDFKeyMappingDictionary_kPDFKeyMappingDictionary = v10;

}

+ (id)getProperNameStringFromString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "hasPrefix:", CFSTR("/")))
  {
    objc_msgSend(CFSTR("/"), "stringByAppendingString:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (__CFDictionary)dictionaryRef
{
  __CFDictionary *v3;
  __CFDictionary *v4;

  if (!self->_dictionaryRef)
  {
    v3 = -[PDFAnnotation commonCreateDictionaryRef](self, "commonCreateDictionaryRef");
    if (v3)
    {
      v4 = v3;
      -[PDFAnnotation _addAKAnnotationToDictionary:](self, "_addAKAnnotationToDictionary:", v3);
      -[PDFAnnotation setDictionaryRef:](self, "setDictionaryRef:", v4);
      CFRelease(v4);
    }
  }
  return self->_dictionaryRef;
}

- (__CFDictionary)dictionaryRefExcludingParentOrPopup
{
  __CFDictionary *v2;
  __CFDictionary *v3;
  const __CFDictionary *Value;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const __CFAllocator *v8;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v10;
  __CFDictionary *v11;
  __CFDictionary *v12;

  v2 = -[PDFAnnotation dictionaryRef](self, "dictionaryRef");
  v3 = v2;
  if (v2)
  {
    CFDictionaryRemoveValue(v2, CFSTR("/Parent"));
    CFDictionaryRemoveValue(v3, CFSTR("/Popup"));
    Value = (const __CFDictionary *)CFDictionaryGetValue(v3, CFSTR("/AAPL:AKExtras"));
    if (Value)
    {
      v5 = Value;
      v6 = (const __CFDictionary *)CFDictionaryGetValue(Value, CFSTR("/AAPL:AKPDFAnnotationDictionary"));
      if (v6)
      {
        v7 = v6;
        if (CFDictionaryGetValue(v6, CFSTR("/Parent")) || CFDictionaryGetValue(v7, CFSTR("/Popup")))
        {
          v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v5);
          if (MutableCopy)
          {
            v10 = MutableCopy;
            v11 = CFDictionaryCreateMutableCopy(v8, 0, v7);
            if (v11)
            {
              v12 = v11;
              CFDictionaryRemoveValue(v11, CFSTR("/Parent"));
              CFDictionaryRemoveValue(v12, CFSTR("/Popup"));
              CFDictionarySetValue(v10, CFSTR("/AAPL:AKPDFAnnotationDictionary"), v12);
              CFRelease(v12);
            }
            CFDictionarySetValue(v3, CFSTR("/AAPL:AKExtras"), v10);
            CFRelease(v10);
          }
        }
      }
    }
  }
  return v3;
}

- (void)_addAKAnnotationToDictionary:(__CFDictionary *)a3
{
  NSCopying *v5;
  NSCopying *v6;

  -[PDFAnnotation akAnnotation](self, "akAnnotation");
  v5 = (NSCopying *)objc_claimAutoreleasedReturnValue();
  if (v5 || (v5 = self->_akAnnotationForCopying) != 0)
  {
    v6 = v5;
    +[PDFAKAnnotationSerializationHelper addAKAnnotation:toAnnotationDictionary:](PDFAKAnnotationSerializationHelper, "addAKAnnotation:toAnnotationDictionary:", v5, a3);

  }
}

- (CGPDFAnnotation)CGPDFAnnotation
{
  return self->_cgAnnotation;
}

- (void)setCGPDFAnnotation:(CGPDFAnnotation *)a3
{
  CGPDFAnnotation *cgAnnotation;

  cgAnnotation = self->_cgAnnotation;
  if (cgAnnotation != a3)
  {
    if (cgAnnotation)
      CFRelease(cgAnnotation);
    self->_cgAnnotation = a3;
    if (a3)
      CFRetain(a3);
  }
}

- (void)setIsSelected:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  objc_msgSend(WeakRetained, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isUpdatingSelectionMarkups") & 1) == 0)
  {
    self->_isSelected = v3;
    if (GetDefaultsWriteAKEnabled())
    {
      -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[PDFAnnotation isMarkupAnnotationSubtype](self, "isMarkupAnnotationSubtype"))
      {
        v7 = objc_msgSend(v5, "activeMarkupStyle");
        objc_msgSend(v5, "setActiveMarkupStyle:", 8);
        if (v3)
        {
          -[PDFAnnotation _selectionForMarkupAnnotation](self, "_selectionForMarkupAnnotation");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            objc_msgSend(v5, "currentSelection");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addSelection:", v9);
            objc_msgSend(v5, "setCurrentSelection:", v8);

          }
        }
        else
        {
          objc_msgSend(v5, "setCurrentSelection:", 0);
        }
        objc_msgSend(v5, "setActiveMarkupStyle:", v7);
      }
      else
      {
        if (objc_msgSend(v6, "isEqualToString:", CFSTR("/Link")))
          v10 = !v3;
        else
          v10 = 1;
        if (v10)
        {
          if (self->_akAnnotationAdaptor)
          {
            objc_msgSend(WeakRetained, "akPageAdaptor");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "akPageModelController");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v3)
            {
              -[PDFAKAnnotationAdaptor akAnnotation](self->_akAnnotationAdaptor, "akAnnotation");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "selectAnnotation:byExtendingSelection:", v13, 1);
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD15E0], "indexSet");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "selectAnnotationsAtIndexes:byExtendingSelection:", v13, 0);
            }

          }
        }
        else
        {
          objc_msgSend(v5, "document");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "indexForPage:", WeakRetained);

          objc_msgSend(v5, "pageViewForPageAtIndex:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "pageLayer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = +[PDFPageLayerEffect createFlashEffectForPDFLinkAnnotation:withLayer:forType:](PDFPageLayerEffect, "createFlashEffectForPDFLinkAnnotation:withLayer:forType:", self, v17, 0);

        }
      }

    }
    -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");
  }

}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void)setPopupInternal:(id)a3 scanPage:(BOOL)a4
{
  _BOOL4 v4;
  PDFAnnotation *v7;
  PDFAnnotation **p_popup;
  void *v9;
  void *v10;
  PDFAnnotation *v11;
  PDFAnnotation *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PDFAnnotation *v16;
  PDFAnnotation *v17;
  void *v18;
  PDFAnnotation *popup;
  PDFAnnotation *v20;

  v4 = a4;
  v7 = (PDFAnnotation *)a3;
  p_popup = &self->_popup;
  if (self->_popup != v7)
  {
    v20 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&self->_popup, a3);
      -[PDFAnnotation setParent:](self->_popup, "setParent:", self);
      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v20, CFSTR("/Popup"));
      -[PDFAnnotation setValue:forAnnotationKey:](self->_popup, "setValue:forAnnotationKey:", self, CFSTR("/Parent"));
      if (!v4)
        goto LABEL_17;
      -[PDFAnnotation page](self, "page");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_17;
      v10 = v9;
      objc_msgSend(v9, "annotations");
      v11 = (PDFAnnotation *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = -[PDFAnnotation count](v11, "count");
        if (v13)
        {
          v14 = v13;
          v15 = 0;
          while (1)
          {
            -[PDFAnnotation objectAtIndex:](v12, "objectAtIndex:", v15);
            v16 = (PDFAnnotation *)objc_claimAutoreleasedReturnValue();
            v17 = *p_popup;

            if (v16 == v17)
              break;
            if (v14 == ++v15)
              goto LABEL_10;
          }
        }
        else
        {
LABEL_10:
          objc_msgSend(v10, "addAnnotation:", *p_popup);
        }
      }
    }
    else
    {
      -[PDFAnnotation page](self, "page");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v18;
      if (v18)
        objc_msgSend(v18, "removeAnnotation:", *p_popup);
      -[PDFAnnotation removeValueForAnnotationKey:](self, "removeValueForAnnotationKey:", CFSTR("/Contents"));
      popup = self->_popup;
      if (popup)
        -[PDFAnnotation removeValueForAnnotationKey:](popup, "removeValueForAnnotationKey:", CFSTR("/Parent"));
      -[PDFAnnotation removeValueForAnnotationKey:](self, "removeValueForAnnotationKey:", CFSTR("/Popup"));
      v12 = self->_popup;
      self->_popup = 0;
    }

LABEL_17:
    -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");
    v7 = v20;
  }

}

- (PDFAnnotation)initWithAnnotationDictionary:(CGPDFDictionary *)a3 forPage:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PDFBorder *v30;
  void *v31;
  void *v32;
  id v33;
  __CFString *v34;
  void *v35;
  CFDateRef v36;
  CFDateRef v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  PDFDestination *v42;
  PDFDestination *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t Count;
  size_t i;
  CGPDFArray *v51;
  unsigned int v52;
  void *v54;
  double v55;
  unsigned int v56;
  uint64_t v57;
  size_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  PDFLineStyle v73;
  id v74;
  void *v75;
  uint64_t v76;
  PDFLineStyle v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  __CFString *v86;
  CFDateRef v87;
  CFDateRef v88;
  void *v89;
  id v90;
  void *v91;
  uint64_t v92;
  unsigned int v93;
  uint64_t v94;
  void *v95;
  size_t v96;
  int v97;
  size_t v98;
  void *v99;
  void *v100;
  PDFBorder *v101;
  id v102;
  void *v103;
  void *v104;
  CGPDFInteger v105;
  void *v106;
  uint64_t v107;
  __CFString *v108;
  uint64_t v109;
  PDFAnnotation *v110;
  void *v111;
  int v112;
  __CFString *v113;
  __CFString *v114;
  void *v115;
  void *v116;
  unint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  id v121;
  size_t v122;
  size_t v123;
  size_t v124;
  __CFString *v125;
  __CFString *v126;
  __CFString *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  uint64_t v131;
  PDFAppearanceCharacteristics *v132;
  PDFAppearanceCharacteristics *v133;
  PDFAppearanceCharacteristics *v134;
  void *v135;
  PDFBorder *v136;
  PDFAnnotation *v137;
  uint64_t v138;
  NSUUID *pdfAnnotationUUID;
  int v140;
  __CFString *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  CGPDFDictionaryRef v147;
  double v148;
  CGPDFArrayRef v149;
  objc_super v150;
  char *v151;
  CGPDFDictionaryRef value;
  CGPDFDictionaryRef dict;
  CGPDFArrayRef array;
  CGPDFStringRef string;
  CGPDFReal v156;
  CGPDFInteger v157;
  CGPDFBoolean v158;
  __int128 v159;
  __int128 v160;
  CGPDFReal v161[2];
  CGRect v162;
  CGRect v163;

  v6 = a4;
  v159 = 0u;
  v160 = 0u;
  v158 = 0;
  v156 = 0.0;
  v157 = 0;
  array = 0;
  string = 0;
  value = 0;
  dict = 0;
  v151 = 0;
  if (a3)
  {
    v150.receiver = self;
    v150.super_class = (Class)PDFAnnotation;
    self = -[PDFAnnotation init](&v150, sel_init);

    if (self)
    {
      -[PDFAnnotation commonInit](self, "commonInit");
      self->_isFullyConstructed = 0;
      self->_sourceDictionary = a3;
      if (CGPDFDictionaryGetRect())
      {
        v7 = PDFRectFromCGRect(*(double *)&v159, *((double *)&v159 + 1), *(double *)&v160, *((double *)&v160 + 1));
        v9 = v8;
        v11 = v10;
        v13 = v12;
        -[PDFAnnotation setRect:forAnnotationKey:](self, "setRect:forAnnotationKey:", CFSTR("/Rect"));
        if (!CGPDFDictionaryGetDictionary(a3, "Parent", &value))
          value = 0;
        if (CGPDFDictionaryGetName(a3, "Subtype", (const char **)&v151))
        {
          v14 = objc_alloc(MEMORY[0x24BDD17C8]);
          v15 = (void *)objc_msgSend(v14, "initWithUTF8String:", v151);
          +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v16, CFSTR("/Subtype"));
          if (objc_msgSend(v16, "isEqualToString:")
            && (CGPDFDictionaryGetName(a3, "FT", (const char **)&v151)
             || value && CGPDFDictionaryGetName(value, "FT", (const char **)&v151)))
          {
            v17 = objc_alloc(MEMORY[0x24BDD17C8]);
            v18 = (void *)objc_msgSend(v17, "initWithUTF8String:", v151);
            +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v19, CFSTR("/FT"));
          }
          else
          {
            v19 = 0;
          }
          objc_storeWeak((id *)&self->_page, v6);
          objc_msgSend(v6, "document");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (CGPDFDictionaryGetDictionary(a3, "A", &dict))
          {
            +[PDFAction actionWithActionDictionary:forDocument:forPage:](PDFAction, "actionWithActionDictionary:forDocument:forPage:", dict, v21, v6);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v22)
            {
              objc_msgSend(v22, "type");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v24)
                -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v23, CFSTR("/A"));
            }
          }
          else
          {
            v23 = 0;
          }
          if (!CGPDFDictionaryGetDictionary(a3, "AA", &dict))
          {
            v142 = 0;
LABEL_37:
            if (-[PDFAnnotation _shouldReadAppearanceStreams](self, "_shouldReadAppearanceStreams")
              && CGPDFDictionaryGetDictionary(a3, "AP", &dict))
            {
              -[PDFAnnotation getAppearancesFromDictionary:ofType:](self, "getAppearancesFromDictionary:ofType:", dict, 0);
              -[PDFAnnotation getAppearancesFromDictionary:ofType:](self, "getAppearancesFromDictionary:ofType:", dict, 1);
              -[PDFAnnotation getAppearancesFromDictionary:ofType:](self, "getAppearancesFromDictionary:ofType:", dict, 2);
            }
            if (CGPDFDictionaryGetArray(a3, "Border", &array) || CGPDFDictionaryGetDictionary(a3, "BS", &dict))
            {
              v30 = -[PDFBorder initWithAnnotationDictionary:forPage:]([PDFBorder alloc], "initWithAnnotationDictionary:forPage:", a3, v6);
              -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v30, CFSTR("/Border"));

            }
            if (CGPDFDictionaryGetArray(a3, "C", &array))
            {
              PDFColorCreateFromCGPDFArray(array);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[PDFAnnotation isMarkupAnnotationSubtype](self, "isMarkupAnnotationSubtype"))
              {
                -[PDFAnnotation _PDFMarkupColorForColor:](self, "_PDFMarkupColorForColor:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                if (!objc_msgSend(v16, "isEqualToString:", CFSTR("/Text")))
                {
LABEL_53:
                  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v31, CFSTR("/C"));

LABEL_54:
                  if (CGPDFDictionaryGetString(a3, "Contents", &string))
                  {
                    v34 = (__CFString *)CGPDFStringCopyTextString(string);
                    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v34, CFSTR("/Contents"));

                  }
                  if (CGPDFDictionaryGetInteger(a3, "F", &v157))
                  {
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v157);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v35, CFSTR("/F"));

                  }
                  if (CGPDFDictionaryGetString(a3, "M", &string))
                  {
                    v36 = CGPDFStringCopyDate(string);
                    if (v36)
                    {
                      v37 = v36;
                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v36, CFSTR("/M"));

                    }
                  }
                  if (CGPDFDictionaryGetString(a3, "NM", &string))
                  {
                    v38 = (__CFString *)CGPDFStringCopyTextString(string);
                    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v38, CFSTR("/NM"));

                  }
                  if ((objc_msgSend(v16, "isEqualToString:") & 1) == 0
                    && CGPDFDictionaryGetDictionary(a3, "Popup", &dict))
                  {
                    self->_popupDictionary = dict;
                  }
                  if ((objc_msgSend(v16, "isEqualToString:", CFSTR("/Widget")) & 1) != 0
                    || !CGPDFDictionaryGetString(a3, "T", &string))
                  {
                    -[PDFAnnotation _generateFormFieldName](self, "_generateFormFieldName");
                  }
                  else
                  {
                    v39 = (__CFString *)CGPDFStringCopyTextString(string);
                    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v39, CFSTR("/T"));

                  }
                  if (CGPDFDictionaryGetString(a3, "DA", &string))
                  {
                    -[PDFAnnotation getFontFromAppearanceString:](self, "getFontFromAppearanceString:", string);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PDFAnnotation setFont:](self, "setFont:", v40);

                    -[PDFAnnotation getColorFromAppearanceString:](self, "getColorFromAppearanceString:", string);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PDFAnnotation setFontColor:](self, "setFontColor:", v41);

                  }
                  if (!objc_msgSend(v16, "isEqualToString:", CFSTR("/Link")))
                  {
LABEL_82:
                    if (CGPDFDictionaryGetArray(a3, "IC", &array))
                    {
                      PDFColorCreateFromCGPDFArray(array);
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v44, CFSTR("/IC"));

                    }
                    if (CGPDFDictionaryGetName(a3, "H", (const char **)&v151))
                    {
                      v45 = objc_alloc(MEMORY[0x24BDD17C8]);
                      v46 = (void *)objc_msgSend(v45, "initWithUTF8String:", v151);
                      +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v46);
                      v47 = (void *)objc_claimAutoreleasedReturnValue();

                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v47, CFSTR("/H"));
                    }
                    v144 = v21;
                    v145 = v16;
                    v146 = v19;
                    v143 = v23;
                    if (CGPDFDictionaryGetArray(a3, "InkList", &array))
                    {
                      v48 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                      v149 = 0;
                      Count = CGPDFArrayGetCount(array);
                      if (Count)
                      {
                        for (i = 0; i != Count; ++i)
                        {
                          if (CGPDFArrayGetArray(array, i, &v149))
                          {
                            v51 = v149;
                            *(double *)&v147 = 0.0;
                            v161[0] = 0.0;
                            v52 = CGPDFArrayGetCount(v149);
                            if (v52 && (v52 & 1) == 0)
                            {
                              objc_msgSend(MEMORY[0x24BDF6870], "bezierPath");
                              v54 = (void *)objc_claimAutoreleasedReturnValue();
                              if (!CGPDFArrayGetNumber(v51, 0, (CGPDFReal *)&v147))
                                *(double *)&v147 = 0.0;
                              if (CGPDFArrayGetNumber(v51, 1uLL, v161))
                              {
                                v55 = v161[0];
                              }
                              else
                              {
                                v161[0] = 0.0;
                                v55 = 0.0;
                              }
                              objc_msgSend(v54, "moveToPoint:", PDFPointMake(*(double *)&v147 - v7, v55 - v9));
                              if (v52 >= 4)
                              {
                                v56 = v52 >> 1;
                                if (v52 >> 1 <= 2)
                                  v56 = 2;
                                v57 = 2 * v56;
                                v58 = 2;
                                do
                                {
                                  if (!CGPDFArrayGetNumber(v51, v58, (CGPDFReal *)&v147))
                                    *(double *)&v147 = 0.0;
                                  if (CGPDFArrayGetNumber(v51, v58 + 1, v161))
                                  {
                                    v59 = v161[0];
                                  }
                                  else
                                  {
                                    v161[0] = 0.0;
                                    v59 = 0.0;
                                  }
                                  objc_msgSend(v54, "addLineToPoint:", PDFPointMake(*(double *)&v147 - v7, v59 - v9));
                                  v58 += 2;
                                }
                                while (v57 != v58);
                              }
                              if (v54)
                              {
                                objc_msgSend(v48, "addObject:", v54);

                              }
                            }
                          }
                        }
                      }
                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v48, CFSTR("/InkList"));

                      v21 = v144;
                      v16 = v145;
                      v19 = v146;
                      v23 = v143;
                    }
                    if (CGPDFDictionaryGetArray(a3, "L", &array) && CGPDFArrayGetCount(array) == 4)
                    {
                      v60 = *MEMORY[0x24BDBEFB0];
                      v61 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
                      if (CGPDFArrayGetNumber(array, 0, &v156))
                        v62 = v156;
                      else
                        v62 = v60;
                      if (CGPDFArrayGetNumber(array, 1uLL, &v156))
                        v63 = v156;
                      else
                        v63 = v61;
                      if (CGPDFArrayGetNumber(array, 2uLL, &v156))
                        v60 = v156;
                      if (CGPDFArrayGetNumber(array, 3uLL, &v156))
                        v61 = v156;
                      v64 = objc_alloc(MEMORY[0x24BDBCE30]);
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v62);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v63);
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v60);
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v61);
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      v69 = (void *)objc_msgSend(v64, "initWithObjects:", v65, v66, v67, v68, 0);

                      v19 = v146;
                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v69, CFSTR("/L"));

                    }
                    else if ((objc_msgSend(v16, "isEqualToString:", CFSTR("/Line")) & 1) != 0)
                    {
                      a3 = 0;
LABEL_287:

                      goto LABEL_13;
                    }
                    if (CGPDFDictionaryGetArray(a3, "LE", &array) && CGPDFArrayGetCount(array) == 2)
                    {
                      if (CGPDFArrayGetName(array, 0, (const char **)&v151))
                      {
                        v70 = objc_alloc(MEMORY[0x24BDD17C8]);
                        v71 = (void *)objc_msgSend(v70, "initWithUTF8String:", v151);
                        +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v71);
                        v72 = (void *)objc_claimAutoreleasedReturnValue();

                        v73 = +[PDFAnnotation lineStyleFromName:](PDFAnnotation, "lineStyleFromName:", v72);
                      }
                      else
                      {
                        v73 = kPDFLineStyleNone;
                        v72 = 0;
                      }
                      if (CGPDFArrayGetName(array, 1uLL, (const char **)&v151))
                      {
                        v74 = objc_alloc(MEMORY[0x24BDD17C8]);
                        v75 = (void *)objc_msgSend(v74, "initWithUTF8String:", v151);
                        +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v75);
                        v76 = objc_claimAutoreleasedReturnValue();

                        v77 = +[PDFAnnotation lineStyleFromName:](PDFAnnotation, "lineStyleFromName:", v76);
                        v72 = (void *)v76;
                      }
                      else
                      {
                        v77 = kPDFLineStyleNone;
                      }
                      v78 = objc_alloc(MEMORY[0x24BDBCE30]);
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v73);
                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v77);
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      v81 = (void *)objc_msgSend(v78, "initWithObjects:", v79, v80, 0);

                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v81, CFSTR("/LE"));
                      v19 = v146;
                    }
                    if (CGPDFDictionaryGetName(a3, "Name", (const char **)&v151))
                    {
                      v82 = objc_alloc(MEMORY[0x24BDD17C8]);
                      v83 = (void *)objc_msgSend(v82, "initWithUTF8String:", v151);
                      +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v83);
                      v84 = (void *)objc_claimAutoreleasedReturnValue();

                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v84, CFSTR("/Name"));
                    }
                    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("/Stamp")))
                    {
                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", CFSTR("/Draft"), CFSTR("/Name"));
                    }
                    if (CGPDFDictionaryGetBoolean(a3, "Open", &v158))
                    {
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v158 != 0);
                      v85 = (void *)objc_claimAutoreleasedReturnValue();
                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v85, CFSTR("/Open"));

                    }
                    if (value && objc_msgSend(v16, "isEqualToString:", CFSTR("/Popup")))
                    {
                      *(double *)&v147 = 0.0;
                      v161[0] = 0.0;
                      if (CGPDFDictionaryGetString(value, "Contents", &v147))
                      {
                        v86 = (__CFString *)CGPDFStringCopyTextString(v147);
                        if (-[__CFString length](v86, "length"))
                          -[PDFAnnotation setContents:](self, "setContents:", v86);

                      }
                      if (CGPDFDictionaryGetString(value, "M", &v147))
                      {
                        v87 = CGPDFStringCopyDate(v147);
                        if (v87)
                        {
                          v88 = v87;
                          -[PDFAnnotation setModificationDate:](self, "setModificationDate:", v87);

                        }
                      }
                      if (CGPDFDictionaryGetArray(value, "C", (CGPDFArrayRef *)v161))
                      {
                        PDFColorCreateFromCGPDFArray(*(CGPDFArray **)&v161[0]);
                        v89 = (void *)objc_claimAutoreleasedReturnValue();
                        -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v89, CFSTR("/C"));

                      }
                    }
                    if (objc_msgSend(v16, "isEqualToString:", CFSTR("/Text"))
                      && !-[PDFAnnotation popupDictionary](self, "popupDictionary"))
                    {
                      v90 = objc_alloc(-[PDFAnnotation annotationSubclassForPopup](self, "annotationSubclassForPopup"));
                      v162.origin.x = v7;
                      v162.origin.y = v9;
                      v162.size.width = v11;
                      v162.size.height = v13;
                      v163 = PDFRectOffset(v162, 30.0, 0.0);
                      v91 = (void *)objc_msgSend(v90, "initCommonWithBounds:", v163.origin.x, v163.origin.y, v163.size.width, v163.size.height);
                      objc_msgSend(v91, "setType:", CFSTR("/Popup"));
                      objc_msgSend(v91, "setOpen:", -[PDFAnnotation isOpen](self, "isOpen"));
                      -[PDFAnnotation setPopupInternal:scanPage:](self, "setPopupInternal:scanPage:", v91, 0);

                    }
                    if (CGPDFDictionaryGetInteger(a3, "Q", &v157))
                    {
                      if (v157 == 1)
                        v92 = 1;
                      else
                        v92 = 2 * (v157 == 2);
                      -[PDFAnnotation setAlignment:](self, "setAlignment:", v92);
                    }
                    if (CGPDFDictionaryGetArray(a3, "QuadPoints", &array))
                    {
                      v93 = CGPDFArrayGetCount(array);
                      if (v93 >= 2)
                      {
                        v94 = v93 >> 1;
                        v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v94);
                        v96 = 0;
                        if (v94 <= 1)
                          v97 = 1;
                        else
                          v97 = v94;
                        while (1)
                        {
                          *(double *)&v147 = 0.0;
                          v148 = 0.0;
                          if (!CGPDFArrayGetNumber(array, v96, (CGPDFReal *)&v147))
                            break;
                          v98 = v96 + 1;
                          if (!CGPDFArrayGetNumber(array, v98, &v148))
                            break;
                          objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", *(double *)&v147, v148);
                          v99 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v95, "addObject:", v99);

                          v96 = v98 + 1;
                          if (!--v97)
                          {
                            -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v95, CFSTR("/QuadPoints"));
                            -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");
                            break;
                          }
                        }

                        v16 = v145;
                        v19 = v146;
                      }
                    }
                    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("/Circle")) & 1) != 0
                      || (objc_msgSend(v16, "isEqualToString:", CFSTR("/FreeText")) & 1) != 0
                      || (objc_msgSend(v16, "isEqualToString:", CFSTR("/Line")) & 1) != 0
                      || (objc_msgSend(v16, "isEqualToString:", CFSTR("/Ink")) & 1) != 0
                      || objc_msgSend(v16, "isEqualToString:", CFSTR("/Square")))
                    {
                      -[PDFAnnotation border](self, "border");
                      v100 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v100)
                      {
                        v101 = objc_alloc_init(PDFBorder);
                        -[PDFAnnotation setBorder:](self, "setBorder:", v101);

                      }
                    }
                    if (objc_msgSend(v16, "isEqualToString:", CFSTR("/Text")))
                      -[PDFAnnotation setBounds:](self, "setBounds:", v7, PDFRectGetMaxY(v7, v9, v11, v13) + -24.0, 24.0, 24.0);
                    if (!objc_msgSend(v16, "isEqualToString:", CFSTR("/Widget")))
                      goto LABEL_285;
                    if (objc_msgSend(v19, "isEqualToString:", CFSTR("/Sig")))
                    {
                      -[PDFAnnotation setIsSignature:](self, "setIsSignature:", 1);
                    }
                    else if (CGPDFDictionaryGetName(value, "FT", (const char **)&v151))
                    {
                      v102 = objc_alloc(MEMORY[0x24BDD17C8]);
                      v103 = (void *)objc_msgSend(v102, "initWithUTF8String:", v151);
                      +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v103);
                      v104 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v104, "isEqualToString:", CFSTR("/Sig")))
                        -[PDFAnnotation setIsSignature:](self, "setIsSignature:", 1);

                    }
                    if (objc_msgSend(v19, "isEqualToString:", CFSTR("/Tx")))
                      self->_suppressAppearanceStreamText = 1;
                    if (CGPDFDictionaryGetInteger(a3, "Ff", &v157)
                      || value && CGPDFDictionaryGetInteger(value, "Ff", &v157))
                    {
                      v105 = v157;
                    }
                    else
                    {
                      v105 = 0;
                    }
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v105);
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v106, CFSTR("/Ff"));

                    -[PDFAnnotation _getFullFieldNameFromDictionary:](self, "_getFullFieldNameFromDictionary:", a3);
                    v107 = objc_claimAutoreleasedReturnValue();
                    if (v107)
                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v107, CFSTR("/T"));
                    if (CGPDFDictionaryGetString(a3, "TU", &string)
                      || value && CGPDFDictionaryGetString(value, "TU", &string))
                    {
                      v108 = (__CFString *)CGPDFStringCopyTextString(string);
                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v108, CFSTR("/TU"));

                    }
                    if (CGPDFDictionaryGetName(a3, "V", (const char **)&v151)
                      || value && CGPDFDictionaryGetName(value, "V", (const char **)&v151))
                    {
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v151, 1);
                      v109 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      if (!CGPDFDictionaryGetString(a3, "V", &string)
                        && (!value || !CGPDFDictionaryGetString(value, "V", &string)))
                      {
                        v111 = (void *)v107;
                        v110 = 0;
                        goto LABEL_213;
                      }
                      v109 = (uint64_t)CGPDFStringCopyTextString(string);
                    }
                    v110 = (PDFAnnotation *)v109;
                    v111 = (void *)v107;
                    if (v109)
                    {
                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v109, CFSTR("/V"));
                      v112 = 0;
                      goto LABEL_214;
                    }
LABEL_213:
                    v112 = 1;
LABEL_214:
                    if ((objc_msgSend(v19, "isEqualToString:", CFSTR("/Btn")) & 1) != 0)
                    {
                      v113 = 0;
                      goto LABEL_225;
                    }
                    if (CGPDFDictionaryGetString(a3, "DV", &string)
                      || value && CGPDFDictionaryGetString(value, "DV", &string))
                    {
                      v113 = (__CFString *)CGPDFStringCopyTextString(string);
                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v113, CFSTR("/DV"));
                      if (!v112)
                        goto LABEL_225;
                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v113, CFSTR("/V"));
                      v114 = v113;
                    }
                    else
                    {
                      if ((v112 & 1) != 0)
                      {
                        v113 = 0;
                        v110 = 0;
                        goto LABEL_225;
                      }
                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v110, CFSTR("/DV"));
                      v114 = v110;
                    }
                    v113 = v114;
                    v110 = (PDFAnnotation *)v114;
LABEL_225:
                    v115 = v111;
                    if (CGPDFDictionaryGetInteger(a3, "MaxLen", &v157)
                      || value && CGPDFDictionaryGetInteger(value, "MaxLen", &v157))
                    {
                      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v157);
                      v116 = (void *)objc_claimAutoreleasedReturnValue();
                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v116, CFSTR("/MaxLen"));

                      if (v110)
                      {
                        v117 = -[PDFAnnotation length](v110, "length");
                        if (v117 > v157)
                        {
                          -[PDFAnnotation substringToIndex:](v110, "substringToIndex:");
                          v118 = objc_claimAutoreleasedReturnValue();

                          -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v118, CFSTR("/V"));
                          v110 = (PDFAnnotation *)v118;
                        }
                      }
                      if (v113)
                      {
                        v119 = -[__CFString length](v113, "length");
                        if (v119 > v157)
                        {
                          -[__CFString substringToIndex:](v113, "substringToIndex:");
                          v120 = objc_claimAutoreleasedReturnValue();

                          -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v120, CFSTR("/DV"));
                          v113 = (__CFString *)v120;
                        }
                      }
                    }
                    if (CGPDFDictionaryGetArray(a3, "Opt", &array)
                      || value && CGPDFDictionaryGetArray(value, "Opt", &array))
                    {
                      v140 = v105;
                      v141 = v113;
                      v121 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                      v122 = CGPDFArrayGetCount(array);
                      if (v122)
                      {
                        v123 = v122;
                        v124 = 0;
                        while (1)
                        {
                          *(double *)&v147 = 0.0;
                          if (CGPDFArrayGetString(array, v124, &string))
                            break;
                          if (!CGPDFArrayGetArray(array, v124, &v147))
                          {
                            NSLog(CFSTR("No string for Opt for Choice widget."));
                            goto LABEL_249;
                          }
                          if (CGPDFArrayGetCount(v147) != 2)
                          {
                            NSLog(CFSTR("Incorrect array count for Opt for Choice widget."));
                            goto LABEL_249;
                          }
                          v125 = (__CFString *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
                          if (CGPDFArrayGetString(v147, 0, &string))
                          {
                            v126 = (__CFString *)CGPDFStringCopyTextString(string);
                            -[__CFString addObject:](v125, "addObject:", v126);

                          }
                          else
                          {
                            NSLog(CFSTR("No value for array for Opt for Choice widget."));
                          }
                          if (CGPDFArrayGetString(v147, 1uLL, &string))
                          {
                            v127 = (__CFString *)CGPDFStringCopyTextString(string);
                            -[__CFString addObject:](v125, "addObject:", v127);

                          }
                          else
                          {
                            NSLog(CFSTR("No text for array for Opt for Choice widget."));
                          }
                          v19 = v146;
                          if (-[__CFString count](v125, "count") == 2)
                            goto LABEL_241;
LABEL_242:

LABEL_249:
                          if (v123 == ++v124)
                            goto LABEL_257;
                        }
                        v125 = (__CFString *)CGPDFStringCopyTextString(string);
LABEL_241:
                        objc_msgSend(v121, "addObject:", v125);
                        goto LABEL_242;
                      }
LABEL_257:
                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v121, CFSTR("/Opt"));

                      LODWORD(v105) = v140;
                      v113 = v141;
                    }
                    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("/Ch")) & 1) != 0)
                    {

                      a3 = 0;
LABEL_286:

                      v21 = v144;
                      v16 = v145;
                      v23 = v143;
                      goto LABEL_287;
                    }
                    if (objc_msgSend(v19, "isEqualToString:", CFSTR("/Btn")))
                    {
                      if ((v105 & 0x8000) != 0)
                      {
                        v128 = 1;
                      }
                      else if ((v105 & 0x10000) != 0)
                      {
                        -[PDFAnnotation setButtonWidgetState:](self, "setButtonWidgetState:", 1);
                        v128 = 0;
                      }
                      else
                      {
                        v128 = 2;
                      }
                      -[PDFAnnotation setWidgetControlType:](self, "setWidgetControlType:", v128);
                      if (CGPDFDictionaryGetName(a3, "AS", (const char **)&v151))
                      {
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v151, 1);
                        v129 = (void *)objc_claimAutoreleasedReturnValue();
                        -[PDFAnnotation widgetOnStateString](self, "widgetOnStateString");
                        v130 = (void *)objc_claimAutoreleasedReturnValue();
                        v131 = objc_msgSend(v129, "caseInsensitiveCompare:", CFSTR("Off"));
                        if (((-[PDFAnnotation isEqualToString:](v110, "isEqualToString:", v129) & 1) != 0
                           || objc_msgSend(v130, "isEqualToString:", v129))
                          && v131)
                        {
                          -[PDFAnnotation setButtonWidgetState:](self, "setButtonWidgetState:", 1);
                        }

                        v19 = v146;
                      }
                    }
                    else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("/Ch")) & 1) != 0)
                    {
                      v128 = 4;
                    }
                    else if (objc_msgSend(v19, "isEqualToString:", CFSTR("/Tx")))
                    {
                      v128 = 3;
                    }
                    else
                    {
                      v128 = -1;
                    }
                    if (CGPDFDictionaryGetDictionary(a3, "MK", &dict))
                    {
                      v132 = [PDFAppearanceCharacteristics alloc];
                      v133 = -[PDFAppearanceCharacteristics initWithAnnotationDictionary:forControlType:](v132, "initWithAnnotationDictionary:forControlType:", dict, v128);
                      v134 = v133;
                      if (v133)
                      {
                        -[PDFAppearanceCharacteristics borderColor](v133, "borderColor");
                        v135 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v135)
                        {
                          -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Border"));
                          v136 = (PDFBorder *)objc_claimAutoreleasedReturnValue();
                          if (!v136)
                          {
                            v136 = objc_alloc_init(PDFBorder);
                            -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v136, CFSTR("/Border"));
                          }

                        }
                      }
                      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v134, CFSTR("/MK"));

                    }
LABEL_285:
                    -[PDFAnnotation decodeUnknownAnnotationProperties](self, "decodeUnknownAnnotationProperties");
                    v137 = self;
                    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
                    v138 = objc_claimAutoreleasedReturnValue();
                    pdfAnnotationUUID = v137->_pdfAnnotationUUID;
                    v137->_pdfAnnotationUUID = (NSUUID *)v138;

                    self->_isFullyConstructed = 1;
                    v110 = v137;
                    a3 = (CGPDFDictionary *)v110;
                    goto LABEL_286;
                  }
                  if (v23)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        -[PDFAnnotation setDestination:](self, "setDestination:", 0);
                        -[PDFAnnotation setAction:](self, "setAction:", v23);
                      }
                      v43 = 0;
                      goto LABEL_81;
                    }
                    objc_msgSend(v23, "destination");
                    v42 = (PDFDestination *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v42 = -[PDFDestination initWithDictionary:forDocument:]([PDFDestination alloc], "initWithDictionary:forDocument:", a3, v21);
                  }
                  v43 = v42;
LABEL_81:
                  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v43, CFSTR("/Dest"));

                  goto LABEL_82;
                }
                -[PDFAnnotation _PDFTextColorForColor:](self, "_PDFTextColorForColor:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v33 = v32;
              if (v32)
              {
                v33 = v32;

                v31 = v33;
              }
            }
            else
            {
              if (!-[PDFAnnotation isMarkupAnnotationSubtype](self, "isMarkupAnnotationSubtype"))
                goto LABEL_54;
              +[PDFAnnotation PDFMarkupColors](PDFAnnotation, "PDFMarkupColors");
              v33 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "objectAtIndex:", -[PDFAnnotation markupStyle](self, "markupStyle"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_53;
          }
          *(double *)&v147 = 0.0;
          if (CGPDFDictionaryGetDictionary(dict, "D", &v147))
          {
            +[PDFAction actionWithActionDictionary:forDocument:forPage:](PDFAction, "actionWithActionDictionary:forDocument:forPage:", v147, v21, v6);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v26 = v25;
              objc_msgSend(v25, "type");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (v27)
                -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v26, CFSTR("/AA"));
              goto LABEL_36;
            }
          }
          else if (CGPDFDictionaryGetDictionary(dict, "U", &v147))
          {
            if (!v23)
            {
              +[PDFAction actionWithActionDictionary:forDocument:forPage:](PDFAction, "actionWithActionDictionary:forDocument:forPage:", v147, v21, v6);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v28;
              if (v28)
              {
                objc_msgSend(v28, "type");
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                if (v29)
                  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v23, CFSTR("/A"));
              }
            }
          }
          else if (!CGPDFDictionaryGetDictionary(dict, "K", &v147)
                 && !CGPDFDictionaryGetDictionary(dict, "F", &v147)
                 && !CGPDFDictionaryGetDictionary(dict, "V", &v147))
          {
            CGPDFDictionaryGetDictionary(dict, "C", &v147);
          }
          v26 = 0;
LABEL_36:
          v142 = v26;
          goto LABEL_37;
        }
      }
    }
    a3 = 0;
  }
LABEL_13:

  return (PDFAnnotation *)a3;
}

- (PDFAnnotation)initWithCGPDFAnnotation:(CGPDFAnnotation *)a3 forPage:(id)a4
{
  PDFAnnotation *v5;
  id v6;
  PDFAnnotation *v7;

  v5 = 0;
  if (a3 && a4)
  {
    v6 = a4;
    v7 = -[PDFAnnotation initWithAnnotationDictionary:forPage:](self, "initWithAnnotationDictionary:forPage:", CGPDFAnnotationGetCGPDFDictionary(), v6);

    self = v7;
    v5 = self;
  }

  return v5;
}

- (void)decodeUnknownAnnotationProperties
{
  CGPDFDictionary *sourceDictionary;
  _QWORD block[5];

  sourceDictionary = self->_sourceDictionary;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__PDFAnnotation_decodeUnknownAnnotationProperties__block_invoke;
  block[3] = &unk_24C25C588;
  block[4] = self;
  CGPDFDictionaryApplyBlock(sourceDictionary, block, 0);
}

uint64_t __50__PDFAnnotation_decodeUnknownAnnotationProperties__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  CFMutableSetRef Mutable;
  void *v10;
  uint64_t v11;
  char v13;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[PDFAnnotation PDFKitAnnotationKeys](PDFAnnotation, "PDFKitAnnotationKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v6);

    if (a3)
    {
      if ((v8 & 1) == 0)
      {
        Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0);
        v13 = 0;
        objc_msgSend(*(id *)(a1 + 32), "valueForCGPDFObject:visitedSet:isInternalObject:", a3, Mutable, &v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = 72;
          if (!v13)
            v11 = 56;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + v11), "setObject:forKey:", v10, v6);
        }
        CFRelease(Mutable);

      }
    }
  }

  return 1;
}

- (id)valueForCGPDFObject:(CGPDFObject *)a3 visitedSet:(__CFSet *)a4 isInternalObject:(BOOL *)a5
{
  id v5;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;
  id v14;
  void *v15;
  CGPDFDictionary *Dictionary;
  void *v17;
  CGPDFArray *v18;
  id v19;
  void *v20;
  void *v21;
  CGPDFDictionary *v22;
  _QWORD v23[5];
  id v24;
  __CFSet *v25;
  _QWORD block[5];
  id v27;
  __CFSet *v28;
  char *__s1;
  _QWORD v30[5];
  CGPDFStreamRef v31;
  CGPDFDictionaryRef v32;
  CGPDFArray *v33;
  CGPDFStringRef v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  char value;

  v5 = 0;
  if (a3 && a4)
  {
    if (CFSetContainsValue(a4, a3))
    {
      v5 = 0;
      return v5;
    }
    CFSetAddValue(a4, a3);
    value = 0;
    v36 = 0.0;
    v37 = 0;
    v34 = 0;
    v35 = 0;
    v32 = 0;
    v33 = 0;
    v10 = MEMORY[0x24BDAC760];
    v31 = 0;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __65__PDFAnnotation_valueForCGPDFObject_visitedSet_isInternalObject___block_invoke;
    v30[3] = &__block_descriptor_40_e35___PDFAnnotationCGPDFObject_16__0_B8l;
    v30[4] = a3;
    v11 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD1AEB4](v30);
    CGPDFObjectGetType(a3);
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeBoolean, &value))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", value != 0);
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v5 = (id)v12;
LABEL_12:

      return v5;
    }
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeInteger, &v37))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v37);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeReal, &v36))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeName, &v35))
    {
      v14 = objc_alloc(MEMORY[0x24BDD17C8]);
      v15 = (void *)objc_msgSend(v14, "initWithUTF8String:", v35);
      +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v15);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeString, &v34))
    {
      v12 = (uint64_t)CGPDFStringCopyTextString(v34);
      goto LABEL_11;
    }
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeStream, &v31))
    {
      Dictionary = CGPDFStreamGetDictionary(v31);
      __s1 = 0;
      if (CGPDFDictionaryGetName(Dictionary, "Type", (const char **)&__s1) && !strncmp(__s1, "Data", 4uLL))
      {
        v12 = (uint64_t)CGPDFStreamCopyData(v31, 0);
        goto LABEL_11;
      }
LABEL_29:
      ((void (**)(_QWORD, BOOL *))v11)[2](v11, a5);
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    if (CGPDFObjectGetValue(a3, kCGPDFObjectTypeArray, &v33))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v33;
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __65__PDFAnnotation_valueForCGPDFObject_visitedSet_isInternalObject___block_invoke_2;
      block[3] = &unk_24C25C5D0;
      block[4] = self;
      v28 = a4;
      v19 = v17;
      v27 = v19;
      CGPDFArrayApplyBlock(v18, block, 0);
      v20 = v27;
    }
    else
    {
      if (!CGPDFObjectGetValue(a3, kCGPDFObjectTypeDictionary, &v32))
        goto LABEL_29;
      __s1 = 0;
      if (CGPDFDictionaryGetName(v32, "Type", (const char **)&__s1) && !strncmp(__s1, "Annot", 5uLL))
      {
        v5 = 0;
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v32;
      v23[0] = v10;
      v23[1] = 3221225472;
      v23[2] = __65__PDFAnnotation_valueForCGPDFObject_visitedSet_isInternalObject___block_invoke_3;
      v23[3] = &unk_24C25C5F8;
      v23[4] = self;
      v25 = a4;
      v19 = v21;
      v24 = v19;
      CGPDFDictionaryApplyBlock(v22, v23, 0);
      v20 = v24;
    }
    v5 = v19;

    goto LABEL_12;
  }
  return v5;
}

PDFAnnotationCGPDFObject *__65__PDFAnnotation_valueForCGPDFObject_visitedSet_isInternalObject___block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t CFObject;
  const void *v4;
  PDFAnnotationCGPDFObject *v5;

  CFObject = CGPDFAppenderCreateCFObject();
  if (CFObject)
  {
    v4 = (const void *)CFObject;
    v5 = -[PDFAnnotationCGPDFObject initWithCFObject:]([PDFAnnotationCGPDFObject alloc], "initWithCFObject:", CFObject);
    CFRelease(v4);
    *a2 = 1;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

uint64_t __65__PDFAnnotation_valueForCGPDFObject_visitedSet_isInternalObject___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  char v7;

  v7 = 0;
  objc_msgSend(*(id *)(a1 + 32), "valueForCGPDFObject:visitedSet:isInternalObject:", a3, *(_QWORD *)(a1 + 48), &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", *(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKey:", v5, *(_QWORD *)(a1 + 40));
      }
      objc_msgSend(v5, "addObject:", v4);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
    }
  }

  return 1;
}

uint64_t __65__PDFAnnotation_valueForCGPDFObject_visitedSet_isInternalObject___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v10;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v10 = 0;
    objc_msgSend(*(id *)(a1 + 32), "valueForCGPDFObject:visitedSet:isInternalObject:", a3, *(_QWORD *)(a1 + 48), &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (v10)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKey:", *(_QWORD *)(a1 + 40));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKey:", v8, *(_QWORD *)(a1 + 40));
        }
        objc_msgSend(v8, "setObject:forKey:", v7, v6);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v6);
      }
    }

  }
  return 1;
}

- (id)_PDFMarkupColorForColor:(id)a3
{
  id v4;
  PDFMarkupType v5;
  PDFMarkupType v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;

  v4 = a3;
  if (!v4)
    goto LABEL_12;
  v5 = -[PDFAnnotation markupType](self, "markupType");
  if (v5 == kPDFMarkupTypeUnderline)
  {
    +[PDFAnnotation PDFMarkupColors](PDFAnnotation, "PDFMarkupColors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndex:", 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = PDFColorComponentsAreEqual(v4, v17);

    if (!v18)
      goto LABEL_12;
    +[PDFAnnotation PDFMarkupColors](PDFAnnotation, "PDFMarkupColors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = 5;
    goto LABEL_14;
  }
  v6 = v5;
  if (v5 == kPDFMarkupTypeStrikeOut)
  {
    +[PDFAnnotation PDFMarkupColors](PDFAnnotation, "PDFMarkupColors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", 6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = PDFColorComponentsAreEqual(v4, v11);

    if (!v12)
      goto LABEL_12;
    +[PDFAnnotation PDFMarkupColors](PDFAnnotation, "PDFMarkupColors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = 6;
LABEL_14:
    objc_msgSend(v13, "objectAtIndex:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  if (v5 == kPDFMarkupTypeHighlight)
  {
    while (1)
    {
      +[PDFAnnotation PDFMarkupColors](PDFAnnotation, "PDFMarkupColors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = PDFColorComponentsAreEqual(v4, v8);

      if (v9)
        break;
      if (++v6 == 5)
        goto LABEL_12;
    }
    +[PDFAnnotation PDFMarkupColors](PDFAnnotation, "PDFMarkupColors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = v6;
    goto LABEL_14;
  }
LABEL_12:
  v19 = 0;
LABEL_15:

  return v19;
}

- (id)_PDFTextColorForColor:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v14;

  v3 = a3;
  if (v3
    && (+[PDFAnnotation PDFTextColors](PDFAnnotation, "PDFTextColors"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v5))
  {
    v6 = 0;
    while (1)
    {
      +[PDFAnnotation PDFTextColors](PDFAnnotation, "PDFTextColors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = PDFColorComponentsAreEqual(v3, v8);

      if (v9)
        break;
      ++v6;
      +[PDFAnnotation PDFTextColors](PDFAnnotation, "PDFTextColors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v6 >= v11)
        goto LABEL_6;
    }
    +[PDFAnnotation PDFTextColors](PDFAnnotation, "PDFTextColors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndex:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_6:
    v12 = 0;
  }

  return v12;
}

- (id)pdfAnnotationUUID
{
  return self->_pdfAnnotationUUID;
}

- (void)setPDFAnnotationUUID:(id)a3
{
  objc_storeStrong((id *)&self->_pdfAnnotationUUID, a3);
}

- (int64_t)priority
{
  void *v2;
  int64_t v3;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("/StrikeOut")) & 1) != 0)
  {
    v3 = 0;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("/Underline")) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("/Highlight")) & 1) != 0)
  {
    v3 = 2;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("/Link")) & 1) != 0)
  {
    v3 = 3;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("/Text")))
  {
    v3 = 4;
  }
  else
  {
    v3 = 5;
  }

  return v3;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  if (self->_quadPointsPath)
    return CGPathContainsPoint(self->_quadPointsPath, 0, a3, 0);
  v7.origin.x = PDFRectToCGRect(-[PDFAnnotation bounds](self, "bounds"));
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (BOOL)shouldExport
{
  return self->_shouldExport;
}

- (void)setForExport:(BOOL)a3
{
  self->_shouldExport = a3;
}

- (BOOL)isMarkupAnnotation
{
  void *v2;
  BOOL v3;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_msgSend(v2, "isEqualToString:", CFSTR("/Text")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("/FreeText")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("/Line")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("/Square")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("/Circle")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("/Highlight")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("/Underline")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("/StrikeOut")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("/Stamp")) & 1) != 0
    || objc_msgSend(v2, "isEqualToString:", CFSTR("/Ink"));

  return v3;
}

- (id)mouseDownAction
{
  return -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/AA"));
}

- (void)setMouseDownAction:(id)a3
{
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", a3, CFSTR("/AA"));
}

- (id)_getFullFieldNameFromDictionary:(CGPDFDictionary *)a3
{
  __CFString *MutableCopy;
  const __CFString *v5;
  const __CFString *v6;
  const __CFAllocator *v7;
  CGPDFDictionary *v8;
  uint64_t v9;
  unint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  CGPDFDictionaryRef dict;
  CGPDFStringRef value;

  dict = 0;
  value = 0;
  MutableCopy = 0;
  if (CGPDFDictionaryGetString(a3, "T", &value))
  {
    v5 = CGPDFStringCopyTextString(value);
    if (v5)
    {
      v6 = v5;
      MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v5);
      CFRelease(v6);
    }
    else
    {
      MutableCopy = 0;
    }
  }
  if (!CGPDFDictionaryGetDictionary(a3, "Parent", &dict))
    goto LABEL_23;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = dict;
  v9 = 1;
  while (1)
  {
    v10 = v9;
    if (!CGPDFDictionaryGetString(v8, "T", &value))
    {
      dict = 0;
      goto LABEL_23;
    }
    if (MutableCopy)
    {
      CFStringInsert(MutableCopy, 0, CFSTR("."));
      v11 = CGPDFStringCopyTextString(value);
      if (!v11)
        goto LABEL_14;
      v12 = v11;
      CFStringInsert(MutableCopy, 0, v11);
      goto LABEL_13;
    }
    v13 = CGPDFStringCopyTextString(value);
    if (v13)
    {
      v12 = v13;
      MutableCopy = CFStringCreateMutableCopy(v7, 0, v13);
LABEL_13:
      CFRelease(v12);
      goto LABEL_14;
    }
    MutableCopy = 0;
LABEL_14:
    if (!CGPDFDictionaryGetDictionary(v8, "Parent", &dict))
      break;
    v8 = dict;
    if (dict)
    {
      v9 = v10 + 1;
      if (v10 < 0x63)
        continue;
    }
    goto LABEL_21;
  }
  dict = 0;
LABEL_21:
  if (v10 >= 0x63)
    NSLog(CFSTR("_getFullFieldNameFromDictionary nested too deep - aborted."));
LABEL_23:
  if (!MutableCopy)
    return 0;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", MutableCopy);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isWidgetOrMarkupAnnotation
{
  void *v2;
  char v3;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("/Highlight")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("/StrikeOut")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("/Underline")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("/Widget"));
  }

  return v3;
}

- (BOOL)isHighlighted
{
  return self->_isHighlighted;
}

- (void)setHighlighted:(BOOL)highlighted
{
  self->_isHighlighted = highlighted;
  -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");
}

- (id)parent
{
  return objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeWeak((id *)&self->_parent, v7);
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("/Popup"));

  if (v5)
  {
    objc_msgSend(v7, "color");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation setColor:](self, "setColor:", v6);

  }
}

- (BOOL)isMarkupAnnotationSubtype
{
  void *v3;
  BOOL v4;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isEqualToString:", CFSTR("/Highlight")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("/StrikeOut")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("/Underline")) & 1) != 0
    || -[PDFAnnotation _isTextMarkupRedaction](self, "_isTextMarkupRedaction");

  return v4;
}

- (BOOL)isRedaction
{
  char v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;

  if (-[PDFAnnotation _isTextMarkupRedaction](self, "_isTextMarkupRedaction"))
  {
    v3 = 1;
  }
  else
  {
    -[PDFAKAnnotationAdaptor akAnnotation](self->_akAnnotationAdaptor, "akAnnotation");
    v4 = objc_claimAutoreleasedReturnValue();
    AKRedactionRectAnnotationClass();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v6, "isEqualToString:", CFSTR("/Redact"));

    v3 = isKindOfClass | v4;
  }
  return v3 & 1;
}

- (BOOL)_isTextMarkupRedaction
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("/Redact")))
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/QuadPoints"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = objc_msgSend(v4, "count") != 0;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isTransparent
{
  return self->_isTransparent;
}

- (void)setIsTransparent:(BOOL)a3
{
  _BOOL4 v3;
  PDFAKAnnotationAdaptor *akAnnotationAdaptor;
  id v6;

  v3 = a3;
  if (-[PDFAnnotation isRedaction](self, "isRedaction"))
  {
    self->_isTransparent = v3;
    akAnnotationAdaptor = self->_akAnnotationAdaptor;
    if (akAnnotationAdaptor)
    {
      -[PDFAKAnnotationAdaptor akAnnotation](akAnnotationAdaptor, "akAnnotation");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIsOpaque:", !v3);

    }
    else
    {
      -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");
    }
  }
}

- (void)highlightRedaction:(BOOL)a3
{
  _BOOL8 v3;
  PDFAKAnnotationAdaptor *akAnnotationAdaptor;
  id v6;

  v3 = a3;
  if (-[PDFAnnotation isRedaction](self, "isRedaction"))
  {
    akAnnotationAdaptor = self->_akAnnotationAdaptor;
    if (akAnnotationAdaptor)
    {
      -[PDFAKAnnotationAdaptor akAnnotation](akAnnotationAdaptor, "akAnnotation");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setIsHighlighted:", v3);

    }
    else
    {
      -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");
    }
  }
}

- (BOOL)intersectsWithRedactionPath
{
  BOOL v3;
  id WeakRetained;
  void *v5;
  char v6;

  if (-[PDFAnnotation isRedaction](self, "isRedaction"))
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  v5 = WeakRetained;
  if (self->_quadPointsPath)
  {
    v6 = objc_msgSend(WeakRetained, "pathIntersectsWithRedactionPath:");
  }
  else
  {
    -[PDFAnnotation bounds](self, "bounds");
    v6 = objc_msgSend(v5, "rectIntersectsWithRedactionPath:");
  }
  v3 = v6;

  return v3;
}

- (BOOL)isTextWidget
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("/Widget"))
    && (objc_msgSend(v4, "isEqualToString:", CFSTR("/Tx")) & 1) != 0;

  return v5;
}

- (BOOL)isSynthesizedFormField
{
  void *v2;
  BOOL v3;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/AAPL:SFF"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isDetectedCheckbox
{
  return self->_isDetectedCheckbox;
}

- (void)setIsDetectedCheckbox:(BOOL)a3
{
  self->_isDetectedCheckbox = a3;
}

- (BOOL)isDetectedSignature
{
  return self->_isDetectedSignature;
}

- (void)setIsDetectedSignature:(BOOL)a3
{
  self->_isDetectedSignature = a3;
}

- (BOOL)shouldReportAnalytics
{
  return self->_shouldReportAnalytics;
}

- (void)setShouldReportAnalytics:(BOOL)a3
{
  self->_shouldReportAnalytics = a3;
}

- (BOOL)isAutofillNewContextStart
{
  return self->_isAutofillNewContextStart;
}

- (void)setAutofillNewContextStart:(BOOL)a3
{
  self->_isAutofillNewContextStart = a3;
}

- (BOOL)isFormField
{
  return -[PDFAnnotation isTextWidget](self, "isTextWidget")
      || -[PDFAnnotation isSynthesizedFormField](self, "isSynthesizedFormField");
}

- (id)_accessibilityTypeString
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;

  -[PDFAnnotation type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("/Widget"));

  if (v5)
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("/Tx")) & 1) != 0)
    {
      v7 = CFSTR("Text ");
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("/Ch")) & 1) != 0)
    {
      v7 = CFSTR("Choice ");
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("/Btn")))
      {
LABEL_9:

        return v3;
      }
      v7 = CFSTR("Button ");
    }
    -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v3);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
    goto LABEL_9;
  }
  return v3;
}

- (id)akAnnotation
{
  return -[PDFAKAnnotationAdaptor akAnnotation](self->_akAnnotationAdaptor, "akAnnotation");
}

- (id)createAKAnnotation
{
  void *v3;
  void *v4;
  void *v5;

  -[PDFAKAnnotationAdaptor akAnnotation](self->_akAnnotationAdaptor, "akAnnotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PDFAKAnnotationAdaptor akAnnotation](self->_akAnnotationAdaptor, "akAnnotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[PDFAnnotation handledByPDFKitCheckAKEnabled:](self, "handledByPDFKitCheckAKEnabled:", 0))
  {
    v4 = 0;
  }
  else
  {
    +[PDFAKAnnotationAdaptor annotationAdaptorWithPDFAnnotation:andCGPDFAnnotation:andPDFDictionary:updatePDFAnnotationIfNeeded:](PDFAKAnnotationAdaptor, "annotationAdaptorWithPDFAnnotation:andCGPDFAnnotation:andPDFDictionary:updatePDFAnnotationIfNeeded:", self, -[PDFAnnotation CGPDFAnnotation](self, "CGPDFAnnotation"), -[PDFAnnotation sourceDictionary](self, "sourceDictionary"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "akAnnotation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)getAKTextView
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  objc_msgSend(WeakRetained, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "akController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "textEditorController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "annotation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation akAnnotation](self, "akAnnotation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
    {
      objc_msgSend(v6, "textView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)newPDFAnnotationFromAKAnnotation:(id)a3
{
  return +[PDFAKAnnotationAdaptor newPDFAnnotationFromAKAnnotation:](PDFAKAnnotationAdaptor, "newPDFAnnotationFromAKAnnotation:", a3);
}

+ (id)createWithPKDrawing:(id)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  PDFAnnotationPKDrawing *v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  v9 = -[PDFAnnotationPKDrawing initWithPKDrawing:bounds:]([PDFAnnotationPKDrawing alloc], "initWithPKDrawing:bounds:", v8, x, y, width, height);

  return v9;
}

- (void)addPageReferenceToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PDFAnnotation page](self, "page");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    objc_msgSend(v4, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    if (v6)
    {
      v7 = v6;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/#%ld"), objc_msgSend(v6, "indexForPage:", v9) + 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionarySetValue(a3, CFSTR("/P"), v8);

      v5 = v9;
    }
  }

}

- (id)_createArrayForCGRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMinX(a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMinY(v13));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMaxX(v14));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CGRectGetMaxY(v15));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v7, v8, v9, v10, 0);

  return v11;
}

- (void)addRect:(CGRect)a3 forKey:(__CFString *)a4 toDictionaryRef:(__CFDictionary *)a5
{
  double x;
  double v9;
  double y;
  double v11;
  double width;
  double v13;
  double height;
  void *v15;
  _BOOL8 v16;
  __int128 v17;
  void *v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGRect v21;
  CGRect v22;

  x = PDFRectToCGRect(self);
  y = v9;
  width = v11;
  height = v13;
  -[PDFAnnotation page](self, "page");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = +[PDFPage isNativeRotationDrawingEnabledForThisThread](PDFPage, "isNativeRotationDrawingEnabledForThisThread");
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", 1);
  if (!+[PDFDocument pdfDocumentAppendModeActiveForThisThread](PDFDocument, "pdfDocumentAppendModeActiveForThisThread")&& v15&& CFStringCompare(a4, CFSTR("/Rect"), 0) == kCFCompareEqualTo)
  {
    v17 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v20.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v20.c = v17;
    *(_OWORD *)&v20.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v15, "getDrawingTransformForBox:", 0);
    v19 = v20;
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v22 = CGRectApplyAffineTransform(v21, &v19);
    x = v22.origin.x;
    y = v22.origin.y;
    width = v22.size.width;
    height = v22.size.height;
  }
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", v16);
  -[PDFAnnotation _createArrayForCGRect:](self, "_createArrayForCGRect:", x, y, width, height);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionarySetValue(a5, a4, v18);

}

- (void)addFlagsToDictionaryRef:(__CFDictionary *)a3
{
  unint64_t v4;

  v4 = -[PDFAnnotation flags](self, "flags");
  CFDictionarySetValue(a3, CFSTR("/F"), (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4));
}

- (void)addModificationDateToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/M"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    CFDictionarySetValue(a3, CFSTR("/M"), v4);
    v4 = v5;
  }

}

- (void)addTextLabelToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/T"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    CFDictionarySetValue(a3, CFSTR("/T"), v4);
    v4 = v5;
  }

}

- (void)addPopupToDictionaryRef:(__CFDictionary *)a3
{
  PDFAnnotation *popup;
  __CFDictionary *v5;
  __CFDictionary *v6;

  popup = self->_popup;
  if (popup)
  {
    v5 = -[PDFAnnotation dictionaryRef](popup, "dictionaryRef");
    if (v5)
    {
      v6 = v5;
      CFDictionarySetValue(v5, CFSTR("/Parent"), a3);
      CFDictionarySetValue(a3, CFSTR("/Popup"), v6);
    }
  }
}

- (id)_createArrayForColor:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  CGColor *v8;
  size_t NumberOfComponents;
  const CGFloat *Components;
  double *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_3;
  v5 = objc_retainAutorelease(v3);
  if (CGColorGetAlpha((CGColorRef)objc_msgSend(v5, "CGColor")) == 0.0)
    goto LABEL_3;
  v8 = (CGColor *)objc_msgSend(objc_retainAutorelease(v5), "CGColor");
  NumberOfComponents = CGColorGetNumberOfComponents(v8);
  Components = CGColorGetComponents(v8);
  v11 = (double *)Components;
  switch(NumberOfComponents)
  {
    case 5uLL:
      v12 = objc_alloc(MEMORY[0x24BDBCE30]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11[1]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11[2]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11[3]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v12, "initWithObjects:", v13, v14, v15, v16, 0);

LABEL_12:
      goto LABEL_13;
    case 4uLL:
      v17 = objc_alloc(MEMORY[0x24BDBCE30]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11[1]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11[2]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v17, "initWithObjects:", v13, v14, v15, 0);
      goto LABEL_12;
    case 2uLL:
      if (Components[1] == 0.0)
      {
        v6 = objc_alloc_init(MEMORY[0x24BDBCE30]);
        goto LABEL_4;
      }
      v18 = objc_alloc(MEMORY[0x24BDBCE30]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v18, "initWithObjects:", v13, 0);
LABEL_13:

      goto LABEL_4;
  }
LABEL_3:
  v6 = 0;
LABEL_4:

  return v6;
}

- (void)addColor:(id)a3 forKey:(__CFString *)a4 toDictionaryRef:(__CFDictionary *)a5
{
  void *v7;
  void *v8;

  -[PDFAnnotation _createArrayForColor:](self, "_createArrayForColor:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    CFDictionarySetValue(a5, a4, v7);
    v7 = v8;
  }

}

- (void)addNormalAppearanceToDictionaryRef:(__CFDictionary *)a3
{
  CFMutableDictionaryRef Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  -[PDFAnnotation addAppearanceForKey:toDictionaryRef:](self, "addAppearanceForKey:toDictionaryRef:", CFSTR("/N"), Mutable);
  CFDictionarySetValue(a3, CFSTR("/AP"), Mutable);
  if (Mutable)
    CFRelease(Mutable);
}

- (void)addAppearanceForKey:(__CFString *)a3 toDictionaryRef:(__CFDictionary *)a4
{
  _BOOL8 v7;
  double x;
  double v9;
  double y;
  double v11;
  CGFloat width;
  double v13;
  CGFloat height;
  void *v15;
  void *v16;
  __int128 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const void *v21;
  CGContext *v22;
  CGContext *v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  uint64_t v26;
  _QWORD v27[2];
  CGRect v28;
  CGRect v29;

  v27[1] = *MEMORY[0x24BDAC8D0];
  v7 = +[PDFPage isNativeRotationDrawingEnabledForThisThread](PDFPage, "isNativeRotationDrawingEnabledForThisThread");
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", 1);
  x = PDFRectToCGRect(-[PDFAnnotation extendedBoundsForAction:](self, "extendedBoundsForAction:", 1));
  y = v9;
  width = v11;
  height = v13;
  -[PDFAnnotation page](self, "page");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v25.a = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)&v25.c = v17;
    *(_OWORD *)&v25.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v15, "getDrawingTransformForBox:", 0);
    v24 = v25;
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v29 = CGRectApplyAffineTransform(v28, &v24);
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
  }
  *(_OWORD *)&v25.a = 0uLL;
  v25.c = width;
  v25.d = height;
  v26 = *MEMORY[0x24BDBF338];
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v25, 32);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = CGDisplayListCreateWithRect();
  if (v20)
  {
    v21 = (const void *)v20;
    CGDisplayListSetBoundingBox();
    v22 = (CGContext *)CGDisplayListContextCreate();
    if (!v22)
    {
      +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", v7);
      CGDisplayListRelease();
      goto LABEL_8;
    }
    v23 = v22;
    CGContextTranslateCTM(v22, -x, -y);
    -[PDFAnnotation drawWithBox:inContext:](self, "drawWithBox:inContext:", 0, v23);
    CFDictionarySetValue(a4, a3, v21);
    CGContextRelease(v23);
    CGDisplayListRelease();
  }
  +[PDFPage setNativeRotationDrawingEnabledForThisThread:](PDFPage, "setNativeRotationDrawingEnabledForThisThread:", v7);
LABEL_8:

}

- (void)addBorderToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v17;

  -[PDFAnnotation border](self, "border");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v17, "dashPattern");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      objc_msgSend(v17, "dashPattern");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  v7 = objc_alloc(MEMORY[0x24BDBCE30]);
  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v17, "horizontalCornerRadius");
  *(float *)&v9 = v9;
  objc_msgSend(v8, "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v17, "verticalCornerRadius");
  *(float *)&v12 = v12;
  objc_msgSend(v11, "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v17, "lineWidth");
  *(float *)&v15 = v15;
  objc_msgSend(v14, "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v7, "initWithObjects:", v10, v13, v16, 0);

  if (v6)
LABEL_6:
    CFDictionarySetValue(a3, CFSTR("/Border"), v6);
LABEL_7:

}

- (void)addBorderStyleToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  const void *v5;
  id v6;

  -[PDFAnnotation border](self, "border");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    v5 = (const void *)objc_msgSend(v4, "createDictionaryRef");
    v4 = v6;
    if (v5)
    {
      CFDictionarySetValue(a3, CFSTR("/BS"), v5);
      CFRelease(v5);
      v4 = v6;
    }
  }

}

- (void)addContentsToDictionaryRef:(__CFDictionary *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  -[PDFAnnotation noteBounds](self, "noteBounds");
  if ((objc_msgSend(WeakRetained, "rectIntersectsWithRedactionPath:") & 1) == 0)
  {
    -[PDFAnnotation contents](self, "contents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "length"))
    {
      v7 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("//"), 2, 0, 1);
      CFDictionarySetValue(a3, CFSTR("/Contents"), v7);

    }
  }

}

- (void)addDefaultAppearanceDictionaryRef:(__CFDictionary *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;
  void *v22;
  void *v23;
  double v24;
  BOOL v25;
  double v26;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  double v31[3];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v30 = xmmword_209DC03B0;
  *(_OWORD *)v31 = unk_209DC03C0;
  -[PDFAnnotation font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "fontName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "pointSize");
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%.0f"), round(v9));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation fontColor](self, "fontColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v7)
    {
      if (v11)
      {
        PDFKitPlatformColorGetRGBA(v11, (uint64_t)&v30, (uint64_t)&v30 + 8, (uint64_t)v31, (uint64_t)&v31[1]);
        v14 = *((double *)&v30 + 1);
        v13 = *(double *)&v30;
        v15 = v31[0];
      }
      else
      {
        v15 = 0.0;
        v14 = 0.0;
        v13 = 0.0;
      }
      v16 = v13 * 100.0;
      v17 = round(v13 * 100.0);
      if (v13 == v14 && v13 == v15)
      {
        if (v17 == v16)
        {
          if (round(v13 * 10.0) == v13 * 10.0)
          {
            if (round(v13) == v13)
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.0f g"), *(_QWORD *)&v13, v28, v29);
            else
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.1f g"), *(_QWORD *)&v13, v28, v29);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f g"), *(_QWORD *)&v13, v28, v29);
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.3f g"), *(_QWORD *)&v13, v28, v29);
        }
      }
      else
      {
        v19 = v17 == v16;
        v18 = round(v14 * 100.0);
        v19 = v19 && v18 == v14 * 100.0;
        v20 = round(v15 * 100.0);
        if (v19 && v20 == v15 * 100.0)
        {
          v24 = round(v14 * 10.0);
          v25 = round(v13 * 10.0) == v13 * 10.0 && v24 == v14 * 10.0;
          v26 = round(v15 * 10.0);
          if (v25 && v26 == v15 * 10.0)
          {
            if (round(v13) == v13 && round(v14) == v14 && round(v15) == v15)
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.0f %.0f %.0f rg"), *(_QWORD *)&v13, *(_QWORD *)&v14, *(_QWORD *)&v15);
            else
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.1f %.1f %.1f rg"), *(_QWORD *)&v13, *(_QWORD *)&v14, *(_QWORD *)&v15);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f %.2f %.2f rg"), *(_QWORD *)&v13, *(_QWORD *)&v14, *(_QWORD *)&v15);
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.3f %.3f %.3f rg"), *(_QWORD *)&v13, *(_QWORD *)&v14, *(_QWORD *)&v15);
        }
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("//%@ %@ Tf %@"), v7, v10, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionarySetValue(a3, CFSTR("/DA"), v23);

    }
  }
  else
  {
    v10 = 0;
    v12 = 0;
    v7 = 0;
  }

}

- (void)addQuaddingToDictionaryRef:(__CFDictionary *)a3
{
  NSTextAlignment v4;
  unsigned int v5;
  uint64_t v6;
  id v7;

  v4 = -[PDFAnnotation alignment](self, "alignment");
  if (v4)
  {
    if (v4 == NSTextAlignmentRight)
      v5 = 2;
    else
      v5 = 0;
    if (v4 == NSTextAlignmentCenter)
      v6 = 1;
    else
      v6 = v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(a3, CFSTR("/Q"), v7);

  }
}

- (void)addQuadPointsToDictionaryRef:(__CFDictionary *)a3
{
  void *v5;
  BOOL v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/QuadPoints"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PDFDocument pdfDocumentAppendModeActiveForThisThread](PDFDocument, "pdfDocumentAppendModeActiveForThisThread");
  v7 = objc_msgSend(v5, "count");
  if (v7)
    v8 = (v7 & 3) == 0;
  else
    v8 = 0;
  if (v8)
  {
    v9 = v7;
    -[PDFAnnotation page](self, "page");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "getDrawingTransformForBox:", 0);
      v12 = v32;
      v13 = v33;
      v14 = v34;
      v15 = v35;
      v16 = v36;
      v17 = v37;
    }
    else
    {
      v12 = *MEMORY[0x24BDBD8B8];
      v13 = *(double *)(MEMORY[0x24BDBD8B8] + 8);
      v14 = *(double *)(MEMORY[0x24BDBD8B8] + 16);
      v15 = *(double *)(MEMORY[0x24BDBD8B8] + 24);
      v16 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
      v17 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
    }
    v18 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v19 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "PDFKitPDFPointValue");
      v22 = v21;
      v24 = v23;

      if (!v6)
      {
        v26 = PDFPointToCGPoint(v22, v24);
        v25 = PDFPointFromCGPoint(v16 + v14 * v27 + v12 * v26, v17 + v15 * v27 + v13 * v26);
        v22 = v25;
        v24 = v28;
      }
      *(float *)&v25 = v22;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v29);

      *(float *)&v30 = v24;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v31);

      ++v19;
    }
    while (v9 != v19);
    CFDictionarySetValue(a3, CFSTR("/QuadPoints"), v18);

  }
}

- (void)addActionToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  const void *v5;
  id v6;

  -[PDFAnnotation action](self, "action");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    v5 = (const void *)objc_msgSend(v4, "createDictionaryRef");
    v4 = v6;
    if (v5)
    {
      CFDictionarySetValue(a3, CFSTR("/A"), v5);
      CFRelease(v5);
      v4 = v6;
    }
  }

}

- (void)addAdditionalActionsToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  void *v8;
  const __CFString *v9;
  void *values;

  -[PDFAnnotation mouseDownAction](self, "mouseDownAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    values = (void *)objc_msgSend(v4, "createDictionaryRef");
    if (values)
    {
      v9 = CFSTR("/D");
      v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&v9, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (v6)
      {
        v7 = v6;
        CFDictionarySetValue(a3, CFSTR("/AA"), v6);
        CFRelease(v7);
        v8 = values;
        if (!values)
          goto LABEL_8;
      }
      else
      {
        v8 = values;
      }
      CFRelease(v8);
    }
  }
LABEL_8:

}

- (void)addLineToDictionaryRef:(__CFDictionary *)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
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
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;

  v5 = +[PDFDocument pdfDocumentAppendModeActiveForThisThread](PDFDocument, "pdfDocumentAppendModeActiveForThisThread");
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/L"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v10 = v9;
    objc_msgSend(v7, "objectAtIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = PDFPointMake(v10, v12);
    v15 = v14;

    objc_msgSend(v7, "objectAtIndex:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;
    objc_msgSend(v7, "objectAtIndex:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v46 = PDFPointMake(v18, v20);
    v47 = v21;

    -[PDFAnnotation page](self, "page");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "getDrawingTransformForBox:", 0);
      v24 = v48;
      v45 = v49;
      v26 = v50;
      v25 = v51;
      v28 = v52;
      v27 = v53;
    }
    else
    {
      v24 = *MEMORY[0x24BDBD8B8];
      v45 = *(double *)(MEMORY[0x24BDBD8B8] + 8);
      v26 = *(double *)(MEMORY[0x24BDBD8B8] + 16);
      v25 = *(double *)(MEMORY[0x24BDBD8B8] + 24);
      v28 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
      v27 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
    }
    v29 = PDFPointToCGPoint(v13, v15);
    v31 = v29;
    v32 = v30;
    if (v5)
    {
      v33 = PDFPointToCGPoint(v46, v47);
      v35 = v34;
      v36 = v31;
    }
    else
    {
      v36 = v28 + v26 * v30 + v24 * v29;
      v32 = v27 + v25 * v30 + v45 * v29;
      v37 = PDFPointToCGPoint(v46, v47);
      v33 = v28 + v26 * v38 + v24 * v37;
      v35 = v27 + v25 * v38 + v45 * v37;
    }
    v39 = objc_alloc(MEMORY[0x24BDBCE30]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v36);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v32);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v33);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v35);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v39, "initWithObjects:", v40, v41, v42, v43, 0);

    CFDictionarySetValue(a3, CFSTR("/L"), v44);
  }

}

- (void)addLineEndingStylesToDictionaryRef:(__CFDictionary *)a3
{
  void *v5;
  void *v6;
  id v7;

  +[PDFAnnotation nameForLineStyle:](PDFAnnotation, "nameForLineStyle:", -[PDFAnnotation startLineStyle](self, "startLineStyle"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[PDFAnnotation nameForLineStyle:](PDFAnnotation, "nameForLineStyle:", -[PDFAnnotation endLineStyle](self, "endLineStyle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v7, v5, 0);
  CFDictionarySetValue(a3, CFSTR("/LE"), v6);

}

- (void)addNameToDictionaryRef:(__CFDictionary *)a3
{
  void *v5;
  const void *v6;
  id v7;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Stamp")))
    {
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Draft")) & 1) != 0)
        goto LABEL_7;
      goto LABEL_6;
    }
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Text")))
    {
LABEL_6:
      +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v5);
      v6 = (const void *)objc_claimAutoreleasedReturnValue();

      CFDictionarySetValue(a3, CFSTR("/Name"), v6);
      v5 = (void *)v6;
    }
  }
LABEL_7:

}

- (void)addOpenToDictionaryRef:(__CFDictionary *)a3
{
  PDFAnnotation *popup;
  id v6;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("/Popup")))
  {
    if (!-[PDFAnnotation isOpen](self, "isOpen"))
      goto LABEL_8;
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("/Text")))
  {
    popup = self->_popup;
    if (popup)
    {
      if (-[PDFAnnotation isOpen](popup, "isOpen"))
LABEL_7:
        CFDictionarySetValue(a3, CFSTR("/Open"), (const void *)*MEMORY[0x24BDBD270]);
    }
  }
LABEL_8:

}

- (void)addHighlightingModeToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;
  char v6;
  void *value;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/H"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    value = v4;
    v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("/I"));
    v5 = value;
    if ((v6 & 1) == 0)
    {
      CFDictionarySetValue(a3, CFSTR("/H"), value);
      v5 = value;
    }
  }

}

- (BOOL)addDestinationToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;
  const void *v6;
  const void *v7;
  BOOL v8;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Dest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (v6 = (const void *)objc_msgSend(v4, "createArrayRef")) != 0)
  {
    v7 = v6;
    CFDictionarySetValue(a3, CFSTR("/Dest"), v6);
    CFRelease(v7);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)addInkListToDictionaryRef:(__CFDictionary *)a3
{
  CFIndex v4;
  __CFArray *Mutable;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  const CGPath *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/InkList"));
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v26, "count");
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], v4, MEMORY[0x24BDBD690]);
  -[PDFAnnotation bounds](self, "bounds");
  if (v4 >= 1)
  {
    v10 = v6;
    v11 = v7;
    v12 = v8;
    v13 = v9;
    v14 = 0;
    v15 = *MEMORY[0x24BDBF090];
    v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v17 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v18 = *(double *)(MEMORY[0x24BDBF090] + 24);
    do
    {
      objc_msgSend(v26, "objectAtIndex:", v14);
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = (const CGPath *)objc_msgSend(v19, "CGPath");
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", v10, v11, v12, v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v23, CFSTR("bounds"));

      objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", v15, v16, v17, v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v24, CFSTR("firstPoint"));

      objc_msgSend(v21, "setObject:forKey:", &unk_24C27D5B0, CFSTR("elementCount"));
      objc_msgSend(v21, "setObject:forKey:", v22, CFSTR("pathArray"));
      CGPathApply(v20, v21, (CGPathApplierFunction)PDFAnnotationCGPathApplierFunc);
      CFArrayAppendValue(Mutable, v22);

      ++v14;
    }
    while (v4 != v14);
  }
  CFDictionarySetValue(a3, CFSTR("/InkList"), Mutable);
  if (Mutable)
    CFRelease(Mutable);

}

- (void)addNormalAndDownAppearanceToDictionaryRef:(__CFDictionary *)a3
{
  void *v5;
  CFMutableDictionaryRef Mutable;
  _BOOL8 v7;
  id v8;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("/Widget")))
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("/Btn")))
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v7 = -[PDFAnnotation isHighlighted](self, "isHighlighted");
      -[PDFAnnotation setHighlighted:](self, "setHighlighted:", 0);
      -[PDFAnnotation addAppearanceForKey:toDictionaryRef:](self, "addAppearanceForKey:toDictionaryRef:", CFSTR("/N"), Mutable);
      -[PDFAnnotation setHighlighted:](self, "setHighlighted:", 1);
      -[PDFAnnotation addAppearanceForKey:toDictionaryRef:](self, "addAppearanceForKey:toDictionaryRef:", CFSTR("/D"), Mutable);
      CFDictionarySetValue(a3, CFSTR("/AP"), Mutable);
      -[PDFAnnotation setHighlighted:](self, "setHighlighted:", v7);
      CFDictionarySetValue(a3, CFSTR("/H"), CFSTR("/P"));
      if (Mutable)
        CFRelease(Mutable);
    }
  }

}

- (void)addNormalAppearanceWithStateToDictionaryRef:(__CFDictionary *)a3
{
  void *v5;
  const __CFAllocator *v6;
  const CFDictionaryKeyCallBacks *v7;
  const CFDictionaryValueCallBacks *v8;
  __CFDictionary *Mutable;
  CFMutableDictionaryRef v10;
  void *v11;
  PDFWidgetCellState v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  id v16;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqualToString:", CFSTR("/Widget"))
    || !objc_msgSend(v5, "isEqualToString:", CFSTR("/Btn")))
  {
    goto LABEL_11;
  }
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v10 = CFDictionaryCreateMutable(v6, 0, v7, v8);
  -[PDFAnnotation widgetOnStateString](self, "widgetOnStateString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[PDFAnnotation buttonWidgetState](self, "buttonWidgetState");
    v13 = -[PDFAnnotation isHighlighted](self, "isHighlighted");
    -[PDFAnnotation setHighlighted:](self, "setHighlighted:", 0);
    -[PDFAnnotation setButtonWidgetState:](self, "setButtonWidgetState:", 1);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%@"), v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation addAppearanceForKey:toDictionaryRef:](self, "addAppearanceForKey:toDictionaryRef:", v14, v10);

    -[PDFAnnotation setButtonWidgetState:](self, "setButtonWidgetState:", 0);
    -[PDFAnnotation addAppearanceForKey:toDictionaryRef:](self, "addAppearanceForKey:toDictionaryRef:", CFSTR("/Off"), v10);
    -[PDFAnnotation setButtonWidgetState:](self, "setButtonWidgetState:", v12);
    -[PDFAnnotation setHighlighted:](self, "setHighlighted:", v13);
    CFDictionarySetValue(Mutable, CFSTR("/N"), v10);
    CFDictionarySetValue(a3, CFSTR("/AP"), Mutable);
    if (-[PDFAnnotation buttonWidgetState](self, "buttonWidgetState") != kPDFWidgetOnState)
    {
      CFDictionarySetValue(a3, CFSTR("/AS"), CFSTR("/Off"));
      if (!v10)
        goto LABEL_8;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%@"), v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(a3, CFSTR("/AS"), v15);

  }
  if (v10)
LABEL_7:
    CFRelease(v10);
LABEL_8:
  if (Mutable)
    CFRelease(Mutable);

LABEL_11:
}

- (void)addNormalAndDownAppearanceWithStateToDictionaryRef:(__CFDictionary *)a3
{
  void *v5;
  const __CFAllocator *v6;
  const CFDictionaryKeyCallBacks *v7;
  const CFDictionaryValueCallBacks *v8;
  __CFDictionary *Mutable;
  CFMutableDictionaryRef v10;
  CFMutableDictionaryRef v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  PDFWidgetCellState v17;
  id v18;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("/Widget"))
    && objc_msgSend(v5, "isEqualToString:", CFSTR("/Btn")))
  {
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v7 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
    v8 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v10 = CFDictionaryCreateMutable(v6, 0, v7, v8);
    v11 = CFDictionaryCreateMutable(v6, 0, v7, v8);
    -[PDFAnnotation widgetOnStateString](self, "widgetOnStateString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v17 = -[PDFAnnotation buttonWidgetState](self, "buttonWidgetState");
      v16 = -[PDFAnnotation isHighlighted](self, "isHighlighted");
      -[PDFAnnotation setHighlighted:](self, "setHighlighted:", 0);
      -[PDFAnnotation setButtonWidgetState:](self, "setButtonWidgetState:", 1);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%@"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFAnnotation addAppearanceForKey:toDictionaryRef:](self, "addAppearanceForKey:toDictionaryRef:", v13, v10);

      -[PDFAnnotation setHighlighted:](self, "setHighlighted:", 0);
      -[PDFAnnotation setButtonWidgetState:](self, "setButtonWidgetState:", 0);
      -[PDFAnnotation addAppearanceForKey:toDictionaryRef:](self, "addAppearanceForKey:toDictionaryRef:", CFSTR("/Off"), v10);
      -[PDFAnnotation setHighlighted:](self, "setHighlighted:", 1);
      -[PDFAnnotation setButtonWidgetState:](self, "setButtonWidgetState:", 1);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%@"), v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFAnnotation addAppearanceForKey:toDictionaryRef:](self, "addAppearanceForKey:toDictionaryRef:", v14, v11);

      -[PDFAnnotation setHighlighted:](self, "setHighlighted:", 1);
      -[PDFAnnotation setButtonWidgetState:](self, "setButtonWidgetState:", 0);
      -[PDFAnnotation addAppearanceForKey:toDictionaryRef:](self, "addAppearanceForKey:toDictionaryRef:", CFSTR("/Off"), v11);
      -[PDFAnnotation setButtonWidgetState:](self, "setButtonWidgetState:", v17);
      -[PDFAnnotation setHighlighted:](self, "setHighlighted:", v16);
      CFDictionarySetValue(Mutable, CFSTR("/N"), v10);
      CFDictionarySetValue(Mutable, CFSTR("/D"), v11);
      CFDictionarySetValue(a3, CFSTR("/AP"), Mutable);
      if (-[PDFAnnotation buttonWidgetState](self, "buttonWidgetState") == kPDFWidgetOnState)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%@"), v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        CFDictionarySetValue(a3, CFSTR("/AS"), v15);

      }
      else
      {
        CFDictionarySetValue(a3, CFSTR("/AS"), CFSTR("/Off"));
      }
      CFDictionarySetValue(a3, CFSTR("/H"), CFSTR("/P"));
    }
    if (v11)
      CFRelease(v11);
    if (v10)
      CFRelease(v10);
    if (Mutable)
      CFRelease(Mutable);

  }
}

- (void)addAppearanceCharacteristicsToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  const void *v5;
  id v6;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/MK"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    v5 = (const void *)objc_msgSend(v4, "createDictionaryRef");
    v4 = v6;
    if (v5)
    {
      CFDictionarySetValue(a3, CFSTR("/MK"), v5);
      CFRelease(v5);
      v4 = v6;
    }
  }

}

- (void)addFieldTypeToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    CFDictionarySetValue(a3, CFSTR("/FT"), v4);
    v4 = v5;
  }

}

- (void)addFieldValueToDictionaryRef:(__CFDictionary *)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  id v9;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/V"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("/Widget")))
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("/Btn")))
    {
      objc_msgSend(CFSTR("/"), "stringByAppendingString:", v6);
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    CFDictionarySetValue(a3, CFSTR("/V"), v6);
  }

}

- (void)addDefaultFieldValueToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/DV"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    CFDictionarySetValue(a3, CFSTR("/DV"), v4);
    v4 = v5;
  }

}

- (void)addFieldNameToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/T"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    CFDictionarySetValue(a3, CFSTR("/T"), v4);
    v4 = v5;
  }

}

- (void)addAlternateFieldNameToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  void *v5;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/TU"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    CFDictionarySetValue(a3, CFSTR("/TU"), v4);
    v4 = v5;
  }

}

- (void)addFieldFlagsToDictionaryRef:(__CFDictionary *)a3
{
  void *v5;
  void *v6;
  int v7;
  CFNumberRef v8;
  CFNumberRef v9;
  int valuePtr;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("/Widget")))
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Ff"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    valuePtr = v7;
    v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
    if (v8)
    {
      v9 = v8;
      CFDictionarySetValue(a3, CFSTR("/Ff"), v8);
      CFRelease(v9);
    }
  }

}

- (void)addMaxLenToDictionaryRef:(__CFDictionary *)a3
{
  void *v4;
  int v5;
  CFNumberRef v6;
  CFNumberRef v7;
  int valuePtr;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/MaxLen"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  valuePtr = v5;
  if (v5)
  {
    v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
    if (v6)
    {
      v7 = v6;
      CFDictionarySetValue(a3, CFSTR("/MaxLen"), v6);
      CFRelease(v7);
    }
  }
}

- (void)addOptionsToDictionaryRef:(__CFDictionary *)a3
{
  void *v5;
  void *v6;
  void *v7;
  CFIndex v8;
  const __CFAllocator *v9;
  __CFArray *Mutable;
  uint64_t i;
  void *v12;
  __CFArray *v13;
  id v14;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("/Widget"))
    && objc_msgSend(v5, "isEqualToString:", CFSTR("/Ch")))
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Opt"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "count");
      if (objc_msgSend(v7, "count"))
      {
        v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, MEMORY[0x24BDBD690]);
        if (v8 >= 1)
        {
          for (i = 0; i != v8; ++i)
          {
            objc_msgSend(v7, "objectAtIndex:", i);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              CFArrayAppendValue(Mutable, v12);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v13 = CFArrayCreateMutable(v9, 2, MEMORY[0x24BDBD690]);
                CFArrayAppendValue(v13, (const void *)objc_msgSend(v12, "objectAtIndex:", 0));
                CFArrayAppendValue(v13, (const void *)objc_msgSend(v12, "objectAtIndex:", 1));
                CFArrayAppendValue(Mutable, v13);
                if (v13)
                  CFRelease(v13);
              }
            }

          }
        }
        CFDictionarySetValue(a3, CFSTR("/Opt"), Mutable);
        if (Mutable)
          CFRelease(Mutable);
      }
    }

  }
}

- (void)_sanitizeValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  __CFArray *Mutable;
  unint64_t v10;
  __CFArray *v11;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  const void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  id v34;
  unint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  const void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  const void *v46;
  uint64_t v47;
  void *v48;
  __CFArray *v49;
  __CFArray *v50;
  id v51;
  PDFAnnotation *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_retainAutorelease(v6);
    if (strcmp((const char *)objc_msgSend(v8, "objCType"), "{CGRect={CGPoint=dd}{CGSize=dd}}"))
    {
LABEL_4:
      Mutable = 0;
      goto LABEL_9;
    }
    -[PDFAnnotation _createArrayForCGRect:](self, "_createArrayForCGRect:", PDFRectToCGRect(objc_msgSend(v8, "PDFKitPDFRectValue")));
    v11 = (__CFArray *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    Mutable = v11;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (v10 = 0x24BDD1000uLL, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_7:
    v11 = (__CFArray *)v6;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v6;
    v14 = v6;
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v66 != v18)
            objc_enumerationMutation(v15);
          v20 = -[PDFAnnotation _sanitizeValue:forKey:](self, "_sanitizeValue:forKey:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i), v7);
          if (v20)
          {
            v21 = v20;
            CFArrayAppendValue(Mutable, v20);
            CFRelease(v21);
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
      }
      while (v17);
    }

    -[NSMutableDictionary objectForKey:](self->_internalPDFAnnotationDictionary, "objectForKey:", v15);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v62 != v25)
            objc_enumerationMutation(v22);
          CFArrayAppendValue(Mutable, *(const void **)(*(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j) + 8));
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
      }
      while (v24);
    }
    if (CFArrayGetCount(Mutable) <= 0)
    {
      NSLog(CFSTR("Error: Could not create array value for key: %@. Invalid value."), v7);
      Mutable = 0;
    }

    v6 = v13;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = v6;
      v52 = self;
      v27 = v6;
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v28 = v27;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v58;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v58 != v31)
              objc_enumerationMutation(v28);
            v33 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v34 = v7;
              v35 = v10;
              +[PDFAnnotation getProperNameStringFromString:](PDFAnnotation, "getProperNameStringFromString:", v33);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = v28;
              objc_msgSend(v28, "objectForKey:", v33);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = -[PDFAnnotation _sanitizeValue:forKey:](v52, "_sanitizeValue:forKey:", v38, v33);
              if (v39)
              {
                v40 = v39;
                CFDictionarySetValue(Mutable, v36, v39);
                CFRelease(v40);
              }

              v10 = v35;
              v7 = v34;
              v28 = v37;
            }
            else
            {
              NSLog(CFSTR("Error: Attempting to save dictionary with key: %@. Dictionary keys must be of type string."), v33);
            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
        }
        while (v30);
      }

      -[NSMutableDictionary objectForKey:](v52->_internalPDFAnnotationDictionary, "objectForKey:", v28);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v54;
        do
        {
          for (m = 0; m != v43; ++m)
          {
            if (*(_QWORD *)v54 != v44)
              objc_enumerationMutation(v41);
            v46 = *(const void **)(*((_QWORD *)&v53 + 1) + 8 * m);
            objc_msgSend(v41, "objectForKey:", v46);
            v47 = objc_claimAutoreleasedReturnValue();
            v48 = (void *)v47;
            if (v47)
              CFDictionarySetValue(Mutable, v46, *(const void **)(v47 + 8));

          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
        }
        while (v43);
      }
      if (!CFDictionaryGetCount(Mutable))
      {
        NSLog(CFSTR("Error: Could not create dictionary value for key: %@. Invalid value."), v7);
        Mutable = 0;
      }

      v6 = v51;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_4;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v11 = (__CFArray *)objc_msgSend(v6, "createArrayRef");
              goto LABEL_8;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              NSLog(CFSTR("Error: Cannot save value for annotation key: %@. Invalid type."), v7);
              goto LABEL_4;
            }
          }
        }
        v11 = (__CFArray *)objc_msgSend(v6, "createDictionaryRef");
        goto LABEL_8;
      }
      -[PDFAnnotation _createArrayForColor:](self, "_createArrayForColor:", v6);
      v49 = (__CFArray *)objc_claimAutoreleasedReturnValue();
      Mutable = v49;
      if (v49)
        v50 = v49;

    }
  }
LABEL_9:

  return Mutable;
}

- (void)_addUnknownPropertiesToDictionaryRef:(__CFDictionary *)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const void *v13;
  void *v14;
  void *v15;
  const void *v16;
  NSMutableDictionary *internalPDFAnnotationDictionary;
  _QWORD v18[5];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[NSMutableDictionary allKeys](self->_PDFAnnotationDictionary, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[PDFAnnotation PDFKitAnnotationKeys](PDFAnnotation, "PDFKitAnnotationKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(const void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v13) & 1) == 0)
        {
          -[NSMutableDictionary objectForKey:](self->_PDFAnnotationDictionary, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[PDFAnnotation _sanitizeValue:forKey:](self, "_sanitizeValue:forKey:", v14, v13);
          if (v15)
          {
            v16 = v15;
            CFDictionarySetValue(a3, v13, v15);
            CFRelease(v16);
          }
          else
          {
            NSLog(CFSTR("Error: Cannot save value for annotation key: %@. Invalid type."), v13);
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  if (+[PDFDocument pdfDocumentAppendModeActiveForThisThread](PDFDocument, "pdfDocumentAppendModeActiveForThisThread"))
  {
    internalPDFAnnotationDictionary = self->_internalPDFAnnotationDictionary;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __54__PDFAnnotation__addUnknownPropertiesToDictionaryRef___block_invoke;
    v18[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
    v18[4] = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](internalPDFAnnotationDictionary, "enumerateKeysAndObjectsUsingBlock:", v18);
  }

}

void __54__PDFAnnotation__addUnknownPropertiesToDictionaryRef___block_invoke(uint64_t a1, void *a2, void *a3)
{
  const void **v5;
  id key;

  key = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), key, v5[1]);
  }

}

- (id)createDefaultAppearanceStringWithFont:(id)a3 fontColor:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  double v24;
  BOOL v25;
  double v26;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  double v31[3];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v30 = xmmword_209DC03B0;
  *(_OWORD *)v31 = unk_209DC03C0;
  if (a3)
  {
    v6 = a3;
    objc_msgSend(v6, "fontName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "pointSize");
    v10 = v9;

    objc_msgSend(v8, "stringWithFormat:", CFSTR("%.0f"), round(v10));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (v5)
      {
        PDFKitPlatformColorGetRGBA(v5, (uint64_t)&v30, (uint64_t)&v30 + 8, (uint64_t)v31, (uint64_t)&v31[1]);
        v13 = *((double *)&v30 + 1);
        v12 = *(double *)&v30;
        v14 = v31[0];
      }
      else
      {
        v14 = 0.0;
        v13 = 0.0;
        v12 = 0.0;
      }
      v17 = v12 * 100.0;
      v18 = round(v12 * 100.0);
      if (v12 == v13 && v12 == v14)
      {
        if (v18 == v17)
        {
          if (round(v12 * 10.0) == v12 * 10.0)
          {
            if (round(v12) == v12)
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.0f g"), *(_QWORD *)&v12, v28, v29);
            else
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.1f g"), *(_QWORD *)&v12, v28, v29);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f g"), *(_QWORD *)&v12, v28, v29);
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.3f g"), *(_QWORD *)&v12, v28, v29);
        }
      }
      else
      {
        v20 = v18 == v17;
        v19 = round(v13 * 100.0);
        v20 = v20 && v19 == v13 * 100.0;
        v21 = round(v14 * 100.0);
        if (v20 && v21 == v14 * 100.0)
        {
          v24 = round(v13 * 10.0);
          v25 = round(v12 * 10.0) == v12 * 10.0 && v24 == v13 * 10.0;
          v26 = round(v14 * 10.0);
          if (v25 && v26 == v14 * 10.0)
          {
            if (round(v12) == v12 && round(v13) == v13 && round(v14) == v14)
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.0f %.0f %.0f rg"), *(_QWORD *)&v12, *(_QWORD *)&v13, *(_QWORD *)&v14);
            else
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.1f %.1f %.1f rg"), *(_QWORD *)&v12, *(_QWORD *)&v13, *(_QWORD *)&v14);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.2f %.2f %.2f rg"), *(_QWORD *)&v12, *(_QWORD *)&v13, *(_QWORD *)&v14);
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.3f %.3f %.3f rg"), *(_QWORD *)&v12, *(_QWORD *)&v13, *(_QWORD *)&v14);
        }
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%@ %@ Tf %@"), v7, v11, v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)flags
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/F"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 4;

  return v4;
}

- (CGPDFDictionary)sourceDictionary
{
  return self->_sourceDictionary;
}

- (CGPDFDictionary)popupDictionary
{
  return self->_popupDictionary;
}

- (void)setPDFAnnotationDictionary:(id)a3
{
  NSMutableDictionary *PDFAnnotationDictionary;
  NSMutableDictionary *v6;
  CGFloat x;
  id v8;

  v8 = a3;
  PDFAnnotationDictionary = self->_PDFAnnotationDictionary;
  self = (PDFAnnotation *)((char *)self + 56);
  v6 = PDFAnnotationDictionary;
  objc_storeStrong((id *)&self->super.isa, a3);
  x = self->_endPoint.x;
  if (x != 0.0)
    objc_msgSend(*(id *)&x, "didReplaceAllValuesWithNewDictionary:andOldDictionary:", v8, v6);

}

- (id)widgetOnStateString
{
  return self->_widgetOnStateString;
}

- (void)setWidgetOnStateString:(id)a3
{
  objc_storeStrong((id *)&self->_widgetOnStateString, a3);
}

- (BOOL)popupDrawsCloseWidget
{
  return self->_popupDrawCloseWidget;
}

- (void)setPopupDrawsCloseWidget:(BOOL)a3
{
  self->_popupDrawCloseWidget = a3;
}

- (BOOL)popupDrawsText
{
  return self->_popupDrawText;
}

- (void)setPopupDrawsText:(BOOL)a3
{
  self->_popupDrawText = a3;
}

- (CGPath)cgPathArray
{
  return self->_cgPaths;
}

- (void)setCGPathArray:(CGPath *)a3
{
  self->_cgPaths = a3;
}

- (void)releaseCGPathArray
{
  void *v3;
  uint64_t v4;
  uint64_t i;

  if (self->_cgPaths)
  {
    -[PDFAnnotation paths](self, "paths");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4 >= 1)
    {
      for (i = 0; i != v4; ++i)
        CGPathRelease(self->_cgPaths[i]);
    }
    NSZoneReallyFree();
    self->_cgPaths = 0;
  }
}

- (id)pathLock
{
  return self->_pathLock;
}

- (id)replaceTextWidgetWithString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;

  v4 = a3;
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("/Widget"))
    && objc_msgSend(v6, "isEqualToString:", CFSTR("/Tx"))
    && (v7 = -[PDFAnnotation maximumLength](self, "maximumLength")) != 0
    && (v8 = v7, objc_msgSend(v4, "length") > v7))
  {
    objc_msgSend(v4, "substringToIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "length") <= v8)
      v11 = v10;
    else
      v11 = &stru_24C25F170;

  }
  else
  {
    v11 = (__CFString *)v4;
  }

  return v11;
}

- (CGPDFForm)appearance:(int)a3
{
  if (a3 > 5)
    return 0;
  else
    return (CGPDFForm *)*((_QWORD *)&self->_normalAppearance + a3);
}

- (void)setSavesAppearanceStream:(BOOL)a3
{
  self->_saveAppearance = a3;
}

- (BOOL)savesAppearanceStream
{
  return self->_saveAppearance;
}

- (void)setAppearance:(CGPDFForm *)a3 forType:(int)a4
{
  CGPDFForm **p_normalAppearance;

  switch(a4)
  {
    case 0:
      p_normalAppearance = &self->_normalAppearance;
      if (self->_normalAppearance)
        goto LABEL_13;
      goto LABEL_14;
    case 1:
      p_normalAppearance = &self->_rolloverAppearance;
      if (!self->_rolloverAppearance)
        goto LABEL_14;
      goto LABEL_13;
    case 2:
      p_normalAppearance = &self->_downAppearance;
      if (!self->_downAppearance)
        goto LABEL_14;
      goto LABEL_13;
    case 3:
      p_normalAppearance = &self->_normalOffAppearance;
      if (!self->_normalOffAppearance)
        goto LABEL_14;
      goto LABEL_13;
    case 4:
      p_normalAppearance = &self->_rolloverOffAppearance;
      if (!self->_rolloverOffAppearance)
        goto LABEL_14;
      goto LABEL_13;
    case 5:
      p_normalAppearance = &self->_downOffAppearance;
      if (self->_downOffAppearance)
LABEL_13:
        CGPDFFormRelease();
LABEL_14:
      *p_normalAppearance = a3;
      break;
    default:
      return;
  }
}

- (CGDisplayList)cachedAppearance:(int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_cachedAppearancesLock;
  NSMutableDictionary *cachedAppearances;
  void *v7;
  CGDisplayList *v8;

  v3 = *(_QWORD *)&a3;
  p_cachedAppearancesLock = &self->_cachedAppearancesLock;
  os_unfair_lock_lock(&self->_cachedAppearancesLock);
  cachedAppearances = self->_cachedAppearances;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedAppearances, "objectForKeyedSubscript:", v7);
  v8 = (CGDisplayList *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_cachedAppearancesLock);
  return v8;
}

- (void)cacheAppearances
{
  os_unfair_lock_s *p_cachedAppearancesLock;
  NSMutableDictionary *v4;
  NSMutableDictionary *cachedAppearances;
  uint64_t v6;
  CGPDFForm *v7;
  CGPDFForm *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  CGContext *v15;
  NSMutableDictionary *v16;
  void *v17;

  p_cachedAppearancesLock = &self->_cachedAppearancesLock;
  os_unfair_lock_lock(&self->_cachedAppearancesLock);
  if (!self->_cachedAppearances)
  {
    v4 = (NSMutableDictionary *)objc_opt_new();
    cachedAppearances = self->_cachedAppearances;
    self->_cachedAppearances = v4;

  }
  v6 = 0;
  do
  {
    v7 = -[PDFAnnotation appearance:](self, "appearance:", v6);
    if (v7)
    {
      v8 = v7;
      v9 = self->_cachedAppearances;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[PDFAnnotation bounds](self, "bounds");
        v12 = CGDisplayListCreateWithRect();
        if (v12)
        {
          v13 = (void *)v12;
          v14 = CGDisplayListContextCreate();
          if (v14)
          {
            v15 = (CGContext *)v14;
            -[PDFAnnotation drawAppearance:withBox:inContext:](self, "drawAppearance:withBox:inContext:", v8, 1, v14);
            v16 = self->_cachedAppearances;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v13, v17);

            CGContextRelease(v15);
          }
        }
      }
    }
    v6 = (v6 + 1);
  }
  while ((_DWORD)v6 != 6);
  os_unfair_lock_unlock(p_cachedAppearancesLock);
}

- (BOOL)isAppearanceStreamEmpty
{
  CGPDFForm *v3;
  CGPDFForm *v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  const void *v8;
  BOOL v9;

  v3 = -[PDFAnnotation appearance:](self, "appearance:", 0);
  if (!v3)
    return 1;
  v4 = v3;
  -[PDFAnnotation bounds](self, "bounds");
  v5 = CGDisplayListCreateWithRect();
  if (!v5)
    return 1;
  v6 = (const void *)v5;
  v7 = CGDisplayListContextCreate();
  if (v7)
  {
    v8 = (const void *)v7;
    -[PDFAnnotation drawAppearance:withBox:inContext:](self, "drawAppearance:withBox:inContext:", v4, 1, v7);
    v9 = CGDisplayListGetNumberOfEntries() == 0;
    CFRelease(v8);
  }
  else
  {
    v9 = 1;
  }
  CFRelease(v6);
  return v9;
}

- (void)getAppearancesFromDictionary:(CGPDFDictionary *)a3 ofType:(int)a4
{
  CGPDFForm **p_downAppearance;
  CGPDFForm **p_downOffAppearance;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  CGPDFDictionaryRef info;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CGPDFDictionaryRef dict;
  uint64_t v16;
  CGPDFObjectRef value;

  value = 0;
  v16 = 0;
  if (a4 == 2)
  {
    self->_downAppearance = 0;
    p_downAppearance = &self->_downAppearance;
    self->_downOffAppearance = 0;
    p_downOffAppearance = &self->_downOffAppearance;
    if (!CGPDFDictionaryGetObject(a3, "D", &value))
      return;
    goto LABEL_9;
  }
  if (a4 == 1)
  {
    self->_rolloverAppearance = 0;
    p_downAppearance = &self->_rolloverAppearance;
    self->_rolloverOffAppearance = 0;
    p_downOffAppearance = &self->_rolloverOffAppearance;
    v7 = "R";
  }
  else
  {
    if (a4)
      return;
    self->_normalAppearance = 0;
    p_downAppearance = &self->_normalAppearance;
    self->_normalOffAppearance = 0;
    p_downOffAppearance = &self->_normalOffAppearance;
    v7 = "N";
  }
  if (CGPDFDictionaryGetObject(a3, v7, &value))
  {
LABEL_9:
    if (CGPDFObjectGetValue(value, kCGPDFObjectTypeStream, &v16))
    {
      *p_downAppearance = (CGPDFForm *)CGPDFFormCreate();
    }
    else
    {
      dict = 0;
      if (CGPDFObjectGetValue(value, kCGPDFObjectTypeDictionary, &dict))
      {
        info = dict;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        CGPDFDictionaryApplyFunction(dict, (CGPDFDictionaryApplierFunction)getStreams, &info);
        if (v12)
          *p_downAppearance = (CGPDFForm *)CGPDFFormCreate();
        if (v13)
          *p_downOffAppearance = (CGPDFForm *)CGPDFFormCreate();
        -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 && objc_msgSend(v8, "isEqualToString:", CFSTR("/Widget")))
        {
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("/Btn")))
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 1);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[PDFAnnotation setWidgetOnStateString:](self, "setWidgetOnStateString:", v10);

          }
        }

      }
    }
  }
}

- (id)tokenizeAppearanceString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 5);
  v5 = objc_msgSend(v3, "length");
  v6 = 0;
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      if (objc_msgSend(v3, "characterAtIndex:", i) == 32)
      {
        if (i == v6)
        {
          ++v6;
        }
        else
        {
          objc_msgSend(v3, "substringWithRange:", v6, i - v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v8);

          v6 = i + 1;
        }
      }
    }
  }
  objc_msgSend(v3, "substringWithRange:", v6, v5 - v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

  return v4;
}

- (double)pointSizeFromAppearanceTokens:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  float v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  v5 = 0.0;
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    while (1)
    {
      if (v7)
      {
        objc_msgSend(v3, "objectAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Tf"));

        if (v9)
          break;
      }
      if (v6 == ++v7)
        goto LABEL_8;
    }
    objc_msgSend(v3, "objectAtIndex:", v7 - 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v5 = v11;

  }
LABEL_8:

  return v5;
}

- (id)fontNameFromAppearanceTokens:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = 0;
    while (1)
    {
      if (v5 >= 2)
      {
        objc_msgSend(v3, "objectAtIndex:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Tf"));

        if (v7)
        {
          objc_msgSend(v3, "objectAtIndex:", v5 - 2);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "length");

          if (v9)
            break;
        }
      }
      if (v4 == (void *)++v5)
      {
        v4 = 0;
        goto LABEL_9;
      }
    }
    objc_msgSend(v3, "objectAtIndex:", v5 - 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "substringWithRange:", 1, v9 - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v4;
}

- (id)colorFromAppearanceTokens:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  float v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  void *v20;
  float v21;
  double v22;
  void *v23;
  float v24;
  void *v25;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (!v4)
  {
LABEL_9:
    v25 = 0;
    goto LABEL_12;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0xFFFFFFFF00000000;
  v8 = 0xFFFFFFFE00000000;
  v9 = 0xFFFFFFFD00000000;
  while (v6 < 3)
  {
    if (v6)
      goto LABEL_7;
LABEL_8:
    ++v6;
    v7 += 0x100000000;
    v8 += 0x100000000;
    v9 += 0x100000000;
    if (v5 == v6)
      goto LABEL_9;
  }
  objc_msgSend(v3, "objectAtIndex:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("rg"));

  if (v11)
  {
    v16 = (void *)MEMORY[0x24BDF6950];
    objc_msgSend(v3, "objectAtIndex:", v9 >> 32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v19 = v18;
    objc_msgSend(v3, "objectAtIndex:", v8 >> 32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    v22 = v21;
    objc_msgSend(v3, "objectAtIndex:", v7 >> 32);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "floatValue");
    objc_msgSend(v16, "colorWithRed:green:blue:alpha:", v19, v22, v24, 1.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
LABEL_7:
  objc_msgSend(v3, "objectAtIndex:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("g"));

  if (!v13)
    goto LABEL_8;
  v14 = (void *)MEMORY[0x24BDF6950];
  objc_msgSend(v3, "objectAtIndex:", v7 >> 32);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  objc_msgSend(v14, "colorWithWhite:alpha:", v15, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_12:
  return v25;
}

- (id)getFontFromAppearanceString:(CGPDFString *)a3
{
  __CFString *v4;
  void *v5;

  v4 = (__CFString *)CGPDFStringCopyTextString(a3);
  -[PDFAnnotation getFontFromAppearanceNSString:](self, "getFontFromAppearanceNSString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getColorFromAppearanceString:(CGPDFString *)a3
{
  __CFString *v4;
  void *v5;

  v4 = (__CFString *)CGPDFStringCopyTextString(a3);
  -[PDFAnnotation getColorFromAppearanceNSString:](self, "getColorFromAppearanceNSString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getFontFromAppearanceNSString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  float v9;
  void *v10;
  CGPDFDictionary *Catalog;
  CGPDFDictionary *v12;
  id v13;
  uint64_t v14;
  CGFont *Font;
  CFStringRef v16;
  __CFString *v17;
  void *v18;
  char Flags;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  CGPDFDictionaryRef dict;
  CGPDFDictionaryRef value;
  CGPDFObjectRef v29;
  CGPDFDictionaryRef v30;

  v4 = a3;
  v29 = 0;
  v30 = 0;
  -[PDFAnnotation page](self, "page");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "document");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v10 = 0;
    v14 = 0;
    v7 = 0;
    v9 = 0.0;
    goto LABEL_29;
  }
  -[PDFAnnotation tokenizeAppearanceString:](self, "tokenizeAppearanceString:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation pointSizeFromAppearanceTokens:](self, "pointSizeFromAppearanceTokens:", v7);
  v9 = v8;
  -[PDFAnnotation fontNameFromAppearanceTokens:](self, "fontNameFromAppearanceTokens:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v14 = 0;
    goto LABEL_29;
  }
  if ((!objc_msgSend(v6, "createdWithWithHighLatencyDataProvider")
     || (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
    && (value = 0, (Catalog = CGPDFDocumentGetCatalog((CGPDFDocumentRef)objc_msgSend(v6, "documentRef", 0))) != 0)
    && CGPDFDictionaryGetDictionary(Catalog, "AcroForm", &value)
    && CGPDFDictionaryGetDictionary(value, "DR", &dict)
    && CGPDFDictionaryGetDictionary(dict, "Font", &v30)
    && (v12 = v30,
        v13 = objc_retainAutorelease(v10),
        CGPDFDictionaryGetObject(v12, (const char *)objc_msgSend(v13, "cStringUsingEncoding:", 1), &v29)))
  {
    v14 = CGPDFFontCreateWithObject();
    if (v14)
    {
      Font = (CGFont *)CGPDFFontGetFont();
      v16 = CGFontCopyPostScriptName(Font);
      if (v16)
      {
        v17 = (__CFString *)v16;
        PDFFontWithNameAndSize((uint64_t)v16, v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
LABEL_32:
          CGPDFFontRelease();
          v10 = v13;
          goto LABEL_33;
        }
        CGPDFFontGetFontDescriptor();
        Flags = CGPDFFontDescriptorGetFlags();
        v20 = CFSTR("Courier");
        if ((Flags & 1) == 0)
          v20 = CFSTR("Times");
        v21 = CFSTR("Helvetica");
        if ((Flags & 1) != 0)
          v21 = CFSTR("Monaco");
        if ((Flags & 2) != 0)
          v22 = (uint64_t)v20;
        else
          v22 = (uint64_t)v21;
        PDFFontWithNameAndSize(v22, v9);
        v23 = objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v18 = (void *)v23;
          goto LABEL_32;
        }
      }
    }
  }
  else
  {
    v14 = 0;
  }
  if (v9 <= 0.0)
    goto LABEL_29;
  PDFFontWithNameAndSize((uint64_t)v10, v9);
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
LABEL_30:
    v18 = (void *)v24;
    goto LABEL_31;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Helv")) & 1) != 0)
  {
    v25 = CFSTR("Helvetica");
    goto LABEL_40;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("HeBo")) & 1) != 0)
  {
    v25 = CFSTR("Helvetica-Bold");
    goto LABEL_40;
  }
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Cour")) & 1) != 0)
  {
    v25 = CFSTR("Courier");
    goto LABEL_40;
  }
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("ZaDb")))
  {
LABEL_29:
    PDFFontWithNameAndSize((uint64_t)CFSTR("Helvetica"), v9);
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_30;
  }
  v25 = CFSTR("ZapfDingbats");
LABEL_40:
  PDFFontWithNameAndSize((uint64_t)v25, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
    goto LABEL_29;
LABEL_31:
  v13 = v10;
  if (v14)
    goto LABEL_32;
LABEL_33:

  return v18;
}

- (id)getColorFromAppearanceNSString:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[PDFAnnotation tokenizeAppearanceString:](self, "tokenizeAppearanceString:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation colorFromAppearanceTokens:](self, "colorFromAppearanceTokens:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }

  return v5;
}

- (BOOL)_shouldReadAppearanceStreams
{
  id WeakRetained;
  CGPDFDocument *Document;
  int minorVersion[2];

  if (!-[PDFAnnotation isMarkupAnnotationSubtype](self, "isMarkupAnnotationSubtype"))
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  Document = CGPDFPageGetDocument((CGPDFPageRef)objc_msgSend(WeakRetained, "pageRef"));

  if (!Document)
    return 1;
  *(_QWORD *)minorVersion = 0;
  CGPDFDocumentGetVersion(Document, &minorVersion[1], minorVersion);
  return minorVersion[1] != 1 || minorVersion[0] > 3;
}

- (void)setDictionaryRef:(__CFDictionary *)a3
{
  -[PDFAnnotation _releaseDictionaryRef](self, "_releaseDictionaryRef");
  self->_dictionaryRef = a3;
  if (a3)
    CFRetain(a3);
}

- (__CFDictionary)commonCreateDictionaryRef
{
  __CFDictionary *Mutable;
  BOOL pointerIsOverAnnotation;
  BOOL isSelected;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PDFWidgetControlType v12;
  CGPDFForm *v13;
  void *v14;
  void *v15;
  void *v16;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  self->_constructingDictionaryRef = 1;
  pointerIsOverAnnotation = self->_pointerIsOverAnnotation;
  self->_pointerIsOverAnnotation = 0;
  isSelected = self->_isSelected;
  self->_isSelected = 0;
  CFDictionarySetValue(Mutable, CFSTR("/Type"), CFSTR("/Annot"));
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    CFDictionarySetValue(Mutable, CFSTR("/Subtype"), v6);
    -[PDFAnnotation extendedBoundsForAction:](self, "extendedBoundsForAction:", 1);
    -[PDFAnnotation addRect:forKey:toDictionaryRef:](self, "addRect:forKey:toDictionaryRef:", CFSTR("/Rect"), Mutable);
    -[PDFAnnotation addActionToDictionaryRef:](self, "addActionToDictionaryRef:", Mutable);
    -[PDFAnnotation addAdditionalActionsToDictionaryRef:](self, "addAdditionalActionsToDictionaryRef:", Mutable);
    if (-[PDFAnnotation savesAppearanceStream](self, "savesAppearanceStream")
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("/Popup")) & 1) == 0)
    {
      -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("/Widget"))
        && objc_msgSend(v8, "isEqualToString:", CFSTR("/Btn")))
      {
        -[PDFAnnotation formData](self, "formData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[PDFAnnotation fieldName](self, "fieldName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringValueForFieldNamed:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v11 = 0;
        }
        v12 = -[PDFAnnotation widgetControlType](self, "widgetControlType");
        v13 = -[PDFAnnotation appearance:](self, "appearance:", 2);
        if (v12)
        {
          if (v13)
            -[PDFAnnotation addNormalAndDownAppearanceWithStateToDictionaryRef:](self, "addNormalAndDownAppearanceWithStateToDictionaryRef:", Mutable);
          else
            -[PDFAnnotation addNormalAppearanceWithStateToDictionaryRef:](self, "addNormalAppearanceWithStateToDictionaryRef:", Mutable);
        }
        else if (v13)
        {
          -[PDFAnnotation addNormalAndDownAppearanceToDictionaryRef:](self, "addNormalAndDownAppearanceToDictionaryRef:", Mutable);
        }
        else
        {
          -[PDFAnnotation addNormalAppearanceToDictionaryRef:](self, "addNormalAppearanceToDictionaryRef:", Mutable);
        }
        if (v11)
        {
          -[PDFAnnotation fieldName](self, "fieldName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setStringValue:forFieldNamed:postFormChangeNotification:", v11, v14, !self->_constructingDictionaryRef);

        }
      }
      else
      {
        -[PDFAnnotation addNormalAppearanceToDictionaryRef:](self, "addNormalAppearanceToDictionaryRef:", Mutable);
      }

    }
    -[PDFAnnotation addBorderToDictionaryRef:](self, "addBorderToDictionaryRef:", Mutable);
    -[PDFAnnotation addBorderStyleToDictionaryRef:](self, "addBorderStyleToDictionaryRef:", Mutable);
    -[PDFAnnotation color](self, "color");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation addColor:forKey:toDictionaryRef:](self, "addColor:forKey:toDictionaryRef:", v15, CFSTR("/C"), Mutable);

    -[PDFAnnotation addContentsToDictionaryRef:](self, "addContentsToDictionaryRef:", Mutable);
    -[PDFAnnotation addDefaultAppearanceDictionaryRef:](self, "addDefaultAppearanceDictionaryRef:", Mutable);
    if (!-[PDFAnnotation addDestinationToDictionaryRef:](self, "addDestinationToDictionaryRef:", Mutable))
      -[PDFAnnotation addActionToDictionaryRef:](self, "addActionToDictionaryRef:", Mutable);
    -[PDFAnnotation addFlagsToDictionaryRef:](self, "addFlagsToDictionaryRef:", Mutable);
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/IC"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation addColor:forKey:toDictionaryRef:](self, "addColor:forKey:toDictionaryRef:", v16, CFSTR("/IC"), Mutable);

    -[PDFAnnotation addHighlightingModeToDictionaryRef:](self, "addHighlightingModeToDictionaryRef:", Mutable);
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("/Ink")))
      -[PDFAnnotation addInkListToDictionaryRef:](self, "addInkListToDictionaryRef:", Mutable);
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("/Line")))
      -[PDFAnnotation addLineToDictionaryRef:](self, "addLineToDictionaryRef:", Mutable);
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("/Line")))
      -[PDFAnnotation addLineEndingStylesToDictionaryRef:](self, "addLineEndingStylesToDictionaryRef:", Mutable);
    -[PDFAnnotation addModificationDateToDictionaryRef:](self, "addModificationDateToDictionaryRef:", Mutable);
    -[PDFAnnotation addNameToDictionaryRef:](self, "addNameToDictionaryRef:", Mutable);
    -[PDFAnnotation addOpenToDictionaryRef:](self, "addOpenToDictionaryRef:", Mutable);
    -[PDFAnnotation addPopupToDictionaryRef:](self, "addPopupToDictionaryRef:", Mutable);
    -[PDFAnnotation addQuaddingToDictionaryRef:](self, "addQuaddingToDictionaryRef:", Mutable);
    if (-[PDFAnnotation isMarkupAnnotationSubtype](self, "isMarkupAnnotationSubtype"))
      -[PDFAnnotation addQuadPointsToDictionaryRef:](self, "addQuadPointsToDictionaryRef:", Mutable);
    -[PDFAnnotation addTextLabelToDictionaryRef:](self, "addTextLabelToDictionaryRef:", Mutable);
    -[PDFAnnotation addDefaultFieldValueToDictionaryRef:](self, "addDefaultFieldValueToDictionaryRef:", Mutable);
    -[PDFAnnotation addFieldFlagsToDictionaryRef:](self, "addFieldFlagsToDictionaryRef:", Mutable);
    -[PDFAnnotation addFieldTypeToDictionaryRef:](self, "addFieldTypeToDictionaryRef:", Mutable);
    -[PDFAnnotation addMaxLenToDictionaryRef:](self, "addMaxLenToDictionaryRef:", Mutable);
    -[PDFAnnotation addAppearanceCharacteristicsToDictionaryRef:](self, "addAppearanceCharacteristicsToDictionaryRef:", Mutable);
    -[PDFAnnotation addOptionsToDictionaryRef:](self, "addOptionsToDictionaryRef:", Mutable);
    -[PDFAnnotation addAlternateFieldNameToDictionaryRef:](self, "addAlternateFieldNameToDictionaryRef:", Mutable);
    -[PDFAnnotation addFieldValueToDictionaryRef:](self, "addFieldValueToDictionaryRef:", Mutable);
    -[PDFAnnotation _addUnknownPropertiesToDictionaryRef:](self, "_addUnknownPropertiesToDictionaryRef:", Mutable);
    self->_isSelected = isSelected;
    self->_pointerIsOverAnnotation = pointerIsOverAnnotation;
    self->_constructingDictionaryRef = 0;
  }
  else
  {
    NSLog(CFSTR("PDFKit serialization failure: /Subtype missing."));
    Mutable = 0;
  }

  return Mutable;
}

- (void)drawAppearance:(CGPDFForm *)a3 withBox:(int64_t)a4 inContext:(CGContext *)a5
{
  -[PDFAnnotation drawAppearance:withBox:inContext:scaleProportional:](self, "drawAppearance:withBox:inContext:scaleProportional:", a3, a4, a5, 1);
}

- (void)drawAppearance:(CGPDFForm *)a3 withBox:(int64_t)a4 inContext:(CGContext *)a5 scaleProportional:(BOOL)a6
{
  _BOOL8 v6;

  v6 = a6;
  -[PDFAnnotation bounds](self, "bounds");
  -[PDFAnnotation drawAppearance:withBox:inContext:inRect:scaleProportional:](self, "drawAppearance:withBox:inContext:inRect:scaleProportional:", a3, a4, a5, v6);
}

- (void)drawAppearance:(CGPDFForm *)a3 withBox:(int64_t)a4 inContext:(CGContext *)a5 inRect:(CGRect)a6 scaleProportional:(BOOL)a7
{
  -[PDFAnnotation drawAppearance:withBox:inContext:inRect:scaleProportional:suppressTextRendering:](self, "drawAppearance:withBox:inContext:inRect:scaleProportional:suppressTextRendering:", a3, a4, a5, a7, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (void)drawAppearance:(CGPDFForm *)a3 withBox:(int64_t)a4 inContext:(CGContext *)a5 inRect:(CGRect)a6 scaleProportional:(BOOL)a7 suppressTextRendering:(BOOL)a8
{
  double x;
  _BOOL4 v10;
  CGFloat height;
  double width;
  CGFloat y;
  CGContext *CurrentContext;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double MinY;
  CGFloat v26;
  uint64_t v27;
  double v28;
  double v29;
  double MinX;
  CGFloat v31;
  CGFloat v32;
  double v33;
  CGFloat rect;
  double v35;
  CGAffineTransform transform;
  CGAffineTransform v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  x = a6.origin.x;
  memset(&v37, 0, sizeof(v37));
  if (a3)
  {
    if ((unint64_t)a4 <= 4)
    {
      v10 = a7;
      height = a6.size.height;
      width = a6.size.width;
      y = a6.origin.y;
      CurrentContext = a5;
      if (a5 || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0)
      {
        v35 = height;
        v33 = y;
        CGPDFFormGetMatrix();
        CGPDFFormGetBBox();
        v16 = v38.origin.x;
        v17 = v38.origin.y;
        v18 = v38.size.width;
        v19 = v38.size.height;
        transform = v37;
        v39 = CGRectApplyAffineTransform(v38, &transform);
        v32 = v39.origin.x;
        rect = v39.origin.y;
        v20 = v39.size.width;
        v21 = v39.size.height;
        CGContextSaveGState(CurrentContext);
        -[PDFAnnotation page](self, "page");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "transformContext:forBox:", CurrentContext, a4);

        if (v20 <= 0.0 || v21 <= 0.0)
        {
          CGContextRestoreGState(CurrentContext);
          return;
        }
        v23 = width / v20;
        v24 = v35 / v21;
        if (v10)
        {
          if (v23 >= v24)
          {
            v28 = v35 / v21;
            if (v24 < v23)
            {
              v29 = v35 / v21;
LABEL_13:
              MinX = PDFRectGetMinX(x, v33, width);
              v40.origin.x = v32;
              v40.origin.y = rect;
              v40.size.width = v20;
              v40.size.height = v21;
              v31 = (width - v29 * v20) * 0.5 + MinX - v29 * CGRectGetMinX(v40);
              MinY = PDFRectGetMinY(x, v33, width, v35);
              v41.origin.x = v32;
              v41.origin.y = rect;
              v41.size.width = v20;
              v41.size.height = v21;
              v26 = CGRectGetMinY(v41);
              transform.a = v29;
              transform.b = 0.0;
              transform.c = 0.0;
              transform.d = v28;
              transform.tx = v31;
              transform.ty = (v35 - v28 * v21) * 0.5 + MinY - v28 * v26;
              CGContextConcatCTM(CurrentContext, &transform);
              CGPDFFormGetStream();
              CGPDFFormGetResources();
              v27 = CGPDFDrawingContextCreateWithStream();
              transform = v37;
              CGContextConcatCTM(CurrentContext, &transform);
              v42.origin.y = v17;
              v42.origin.x = v16;
              v42.size.height = v19;
              v42.size.width = v18;
              CGContextClipToRect(CurrentContext, v42);
              CGPDFDrawingContextDrawWithContentTypes();
              CGContextRestoreGState(CurrentContext);
              if (v27)
                CGPDFDrawingContextRelease();
              return;
            }
          }
          else
          {
            v28 = width / v20;
          }
        }
        else
        {
          v28 = v35 / v21;
        }
        v29 = width / v20;
        goto LABEL_13;
      }
    }
  }
}

- (void)drawCachedAppearance:(CGDisplayList *)a3 withBox:(int64_t)a4 inContext:(CGContext *)a5 inRect:(CGRect)a6 scaleProportional:(BOOL)a7
{
  _BOOL4 v8;
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MinX;
  double MinY;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGAffineTransform transform;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  if (a3)
  {
    if ((unint64_t)a4 <= 4)
    {
      v8 = a7;
      height = a6.size.height;
      width = a6.size.width;
      y = a6.origin.y;
      x = a6.origin.x;
      CurrentContext = a5;
      if (a5 || (CurrentContext = PDFGraphicsGetCurrentContext()) != 0)
      {
        -[PDFAnnotation bounds](self, "bounds");
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        CGContextSaveGState(CurrentContext);
        -[PDFAnnotation page](self, "page");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "transformContext:forBox:", CurrentContext, a4);

        if (v20 > 0.0 && v22 > 0.0)
        {
          v24 = x;
          v25 = width / v20;
          v26 = height / v22;
          v35 = v16;
          v36 = v18;
          v27 = y;
          v28 = height;
          if (v8)
          {
            if (v25 >= v26)
            {
              v33 = height / v22;
              if (v26 < v25)
                v25 = height / v22;
            }
            else
            {
              v33 = width / v20;
            }
          }
          else
          {
            v33 = height / v22;
          }
          v29 = v24;
          v30 = v27;
          MinX = PDFRectGetMinX(v24, v27, width);
          v38.origin.x = v35;
          v38.origin.y = v36;
          v38.size.width = v20;
          v38.size.height = v22;
          v34 = (width - v25 * v20) * 0.5 + MinX - v25 * CGRectGetMinX(v38);
          MinY = PDFRectGetMinY(v29, v30, width, v28);
          v39.origin.x = v35;
          v39.origin.y = v36;
          v39.size.width = v20;
          v39.size.height = v22;
          transform.a = v25;
          transform.b = 0.0;
          transform.c = 0.0;
          transform.d = v33;
          transform.tx = v34;
          transform.ty = (v28 - v33 * v22) * 0.5 + MinY - v33 * CGRectGetMinY(v39);
          CGContextConcatCTM(CurrentContext, &transform);
          v40.origin.x = v35;
          v40.origin.y = v36;
          v40.size.width = v20;
          v40.size.height = v22;
          CGContextClipToRect(CurrentContext, v40);
          CGDisplayListDrawInContext();
        }
        CGContextRestoreGState(CurrentContext);
      }
    }
  }
}

- (void)_drawAnnotationWithBox:(int64_t)a3 inContext:(CGContext *)a4
{
  +[PDFAnnotationDrawing drawWithBox:inContext:withAnnotation:](PDFAnnotationDrawing, "drawWithBox:inContext:withAnnotation:", a3, a4, self);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Type: '%@', Bounds: (%.0f, %.0f) [%.0f, %.0f]"), v12, v5, v7, v9, v11);
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("/Widget"))
    && objc_msgSend(v13, "isEqualToString:", CFSTR("/Tx")))
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/V"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", WidgetValue: %@"), v14);
LABEL_6:

    goto LABEL_7;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("/FreeText")))
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Contents"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", Contents: %@"), v14);
    goto LABEL_6;
  }
LABEL_7:

  return (NSString *)v3;
}

- (id)debugQuickLookObject
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  _QWORD v14[9];

  -[PDFAnnotation bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6A98]), "initWithSize:", v7, v9);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __37__PDFAnnotation_debugQuickLookObject__block_invoke;
  v14[3] = &unk_24C25C640;
  v14[5] = v4;
  v14[6] = v6;
  *(double *)&v14[7] = v8;
  *(double *)&v14[8] = v10;
  v14[4] = self;
  objc_msgSend(v11, "imageWithActions:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __37__PDFAnnotation_debugQuickLookObject__block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  CGContext *v4;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  if (v3)
  {
    v4 = v3;
    CGContextSaveGState(v3);
    CGContextScaleCTM(v4, 1.0, -1.0);
    CGContextTranslateCTM(v4, -*(double *)(a1 + 40), -*(double *)(a1 + 48) - *(double *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "drawWithBox:inContext:", 1, v4);
    CGContextRestoreGState(v4);
  }
}

- (__CFDictionary)gcCreateAttributesForFont:(id)a3 color:(id)a4
{
  id v5;
  id v6;
  __CFDictionary *Mutable;
  __CFDictionary *v8;
  id v9;
  CGColorSpace *ColorSpace;
  const CGFloat *Components;
  CGColorRef v12;
  CGColor *v13;

  v5 = a3;
  v6 = a4;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v8 = Mutable;
  if (Mutable)
  {
    if (v5)
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC4C28], v5);
    if (v6)
    {
      v9 = objc_retainAutorelease(v6);
      ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v9, "CGColor"));
      Components = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(v9), "CGColor"));
      v12 = CGColorCreate(ColorSpace, Components);
      if (v12)
      {
        v13 = v12;
        CFDictionarySetValue(v8, (const void *)*MEMORY[0x24BDC4EE0], v12);
        CGColorRelease(v13);
      }
    }
  }

  return v8;
}

- (void)addToPageView
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  if (WeakRetained)
  {
    v10 = WeakRetained;
    objc_msgSend(WeakRetained, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v10;
    if (v4)
    {
      objc_msgSend(v10, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "document");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "indexForPage:", v10);

      objc_msgSend(v5, "pageViewForPageAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "addAnnotation:", self);

      WeakRetained = v10;
    }
  }

}

- (void)removeFromPageView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[PDFAnnotation page](self, "page");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v10 = v3;
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v10;
    if (v4)
    {
      objc_msgSend(v10, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "document");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "indexForPage:", v10);

      objc_msgSend(v5, "pageViewForPageAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "removeAnnotation:", self);

      v3 = v10;
    }
  }

}

- (void)updateAnnotationEffect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  if (!self->_constructingDictionaryRef && self->_isFullyConstructed)
  {
    -[PDFAnnotation page](self, "page");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v10 = v3;
      objc_msgSend(v3, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v10;
      if (v4)
      {
        objc_msgSend(v10, "view");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "document");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "indexForPage:", v10);

        objc_msgSend(v5, "pageViewForPageAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
          objc_msgSend(v8, "updateAnnotation:", self);

        v3 = v10;
      }
    }

  }
}

- (void)addControl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[PDFAnnotation page](self, "page");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v10 = v3;
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v10;
    if (v4)
    {
      objc_msgSend(v10, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "document");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "indexForPage:", v10);

      objc_msgSend(v5, "pageViewForPageAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        objc_msgSend(v8, "addControlForAnnotation:", self);

      v3 = v10;
    }
  }

}

- (void)postAnnotationsChangedNotification
{
  id WeakRetained;
  id v3;

  if (!self->_constructingDictionaryRef && self->_isFullyConstructed)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_page);
    if (WeakRetained)
    {
      v3 = WeakRetained;
      objc_msgSend(WeakRetained, "postAnnotationsChangedNotification");
      WeakRetained = v3;
    }

  }
}

- (CGRect)extendedBoundsForAction:(int)a3
{
  uint64_t v3;
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
  CGRect result;

  v3 = *(_QWORD *)&a3;
  -[PDFAnnotation bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PDFAnnotation _calculatePDFAnnotationLayerOutsetForAction:](self, "_calculatePDFAnnotationLayerOutsetForAction:", v3);
  v16 = v15 + v10 + v13;
  v18 = v17 + v12 + v14;
  v19 = v6 - v13;
  v20 = v8 - v14;
  result.size.height = v18;
  result.size.width = v16;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- ($7741FFA882D97FFFD3D8D0FADF1D33D8)_calculatePDFAnnotationLayerOutsetForAction:(int)a3
{
  double v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
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
  PDFLineStyle v29;
  PDFLineStyle v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v50;
  CGFloat v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  double v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat recta;
  CGFloat rect;
  double rect_8;
  double rect_16;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  $7741FFA882D97FFFD3D8D0FADF1D33D8 result;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v5 = 0.0;
  if (-[PDFAnnotation hasAppearanceStream](self, "hasAppearanceStream")
    || (-[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("/Line")),
        v6,
        a3 == 1)
    && !v7)
  {
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
  }
  else
  {
    -[PDFAnnotation border](self, "border");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lineWidth");
    v17 = v16;

    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/MK"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "borderColor");

    if (!v7)
    {
      if (v17 <= 0.0)
      {
        v8 = 0.0;
        v9 = 0.0;
        v10 = 0.0;
        if (!-[PDFAnnotation _isTextMarkupRedaction](self, "_isTextMarkupRedaction"))
          goto LABEL_5;
        v58 = 0.8;
      }
      else
      {
        v58 = ceil(v17);
      }
      v10 = PDFPointMake(v58, v58);
      v9 = v61;
      v8 = PDFPointMake(v58, v58);
      v5 = v62;
      goto LABEL_5;
    }
    -[PDFAnnotation bounds](self, "bounds");
    rect_8 = v20;
    rect_16 = v19;
    -[PDFAnnotation startPoint](self, "startPoint");
    v22 = v21;
    v24 = v23;
    -[PDFAnnotation endPoint](self, "endPoint");
    v26 = v25;
    v28 = v27;
    v29 = -[PDFAnnotation startLineStyle](self, "startLineStyle");
    v30 = -[PDFAnnotation endLineStyle](self, "endLineStyle");
    -[PDFAnnotation _drawingRectForLineStyle:from:to:borderWidth:](self, "_drawingRectForLineStyle:from:to:borderWidth:", v29, v26, v28, v22, v24, v17);
    recta = v31;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    -[PDFAnnotation _drawingRectForLineStyle:from:to:borderWidth:](self, "_drawingRectForLineStyle:from:to:borderWidth:", v30, v22, v24, v26, v28, v17);
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v70.origin.x = recta;
    v70.origin.y = v33;
    v70.size.width = v35;
    v70.size.height = v37;
    v71 = PDFRectInset(v70, -1.0, -1.0);
    x = v71.origin.x;
    y = v71.origin.y;
    width = v71.size.width;
    height = v71.size.height;
    v71.origin.x = v39;
    v71.origin.y = v41;
    v71.size.width = v43;
    v71.size.height = v45;
    v72 = PDFRectInset(v71, -1.0, -1.0);
    v64 = v72.origin.x;
    v65 = v72.size.width;
    rect = v72.origin.y;
    v63 = v72.size.height;
    v50 = *MEMORY[0x24BDBEFB0];
    v51 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v72.origin.x = *(CGFloat *)MEMORY[0x24BDBEFB0];
    v72.origin.y = v51;
    v72.size.height = rect_8;
    v72.size.width = rect_16;
    v52 = rect_8;
    v78.origin.x = x;
    v78.origin.y = y;
    v78.size.width = width;
    v78.size.height = height;
    if (PDFRectIntersectsRect(v72, v78))
    {
      v73.origin.x = v50;
      v73.origin.y = v51;
      v73.size.width = rect_16;
      v73.size.height = rect_8;
      v79.origin.x = x;
      v79.origin.y = y;
      v79.size.width = width;
      v79.size.height = height;
      v74 = PDFRectUnion(v73, v79);
      v53 = v74.origin.x;
      v54 = v74.origin.y;
      v55 = v74.size.width;
      v52 = v74.size.height;
      v56 = rect_8;
      v57 = rect_16;
    }
    else
    {
      v53 = v50;
      v54 = v51;
      v57 = rect_16;
      v55 = rect_16;
      v56 = rect_8;
    }
    v59 = v50;
    v60 = v51;
    v80.origin.x = v64;
    v80.origin.y = rect;
    v80.size.width = v65;
    v80.size.height = v63;
    if (PDFRectIntersectsRect(*(CGRect *)(&v57 - 2), v80))
    {
      v75.origin.x = v53;
      v75.origin.y = v54;
      v75.size.width = v55;
      v75.size.height = v52;
      v81.origin.x = v64;
      v81.origin.y = rect;
      v81.size.width = v65;
      v81.size.height = v63;
      v76 = PDFRectUnion(v75, v81);
      v53 = v76.origin.x;
      v54 = v76.origin.y;
      v55 = v76.size.width;
      v52 = v76.size.height;
    }
    v10 = fabs(PDFRectGetMinX(v53, v54, v55));
    v9 = fabs(PDFRectGetMinY(v53, v54, v55, v52));
    v8 = PDFRectGetMaxX(v53, v54, v55) - rect_16;
    v5 = PDFRectGetMaxY(v53, v54, v55, v52) - rect_8;
  }
LABEL_5:
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v5;
  result.var1.y = v14;
  result.var1.x = v13;
  result.var0.y = v12;
  result.var0.x = v11;
  return result;
}

- (CGRect)_drawingRectForLineStyle:(int64_t)a3 from:(CGPoint)a4 to:(CGPoint)a5 borderWidth:(double)a6
{
  double y;
  double x;
  double v9;
  double v10;
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
  __n128 v23;
  __n128 v24;
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
  double v41;
  __n128 v42;
  __n128 v43;
  double v44;
  double v45;
  double v46;
  __n128 v47;
  __n128 v48;
  __n128 v49;
  __n128 v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  uint64_t v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat width;
  CGFloat height;
  double v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  __n128 v94;
  __n128 v95;
  double v96;
  double v97;
  double v98;
  double v99;
  __n128 v100;
  __n128 v101;
  double v102;
  double v103;
  double v104;
  double v105;
  __n128 v106;
  __n128 v107;
  uint64_t v108;
  double v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  CGFloat v114;
  double v115;
  CGFloat v116;
  double v117;
  CGFloat v118;
  double v119;
  CGFloat v120;
  uint64_t v121;
  CGFloat v122;
  CGFloat v123;
  CGFloat v124;
  double r1;
  uint64_t r1a;
  double v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  double v133;
  double v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect result;
  CGRect v141;
  CGRect v142;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v13 = PDFRectMakeFromCenter(a5.x, a5.y, 2.0);
  switch(a3)
  {
    case 0:
      v19 = PDFPointMake(a6 * 0.5, a6 * 0.5);
      v20 = v19 + v19;
      v22 = v21 + v21;
      v23.n128_f64[0] = x - v19;
      v24.n128_f64[0] = y - v21;
      v13 = PDFRectMake(v23, v24, v20, v22);
      break;
    case 1:
    case 2:
      v17 = a6 * 0.5;
      v18 = 1.5;
      goto LABEL_5;
    case 3:
      v17 = a6 * 1.5 * 0.25 + a6 * 1.5;
      v18 = 0.375;
LABEL_5:
      v13 = PDFRectMakeFromCenter(x, y, v17 + a6 * v18 + v17 + a6 * v18);
      break;
    case 4:
      v25 = sqrt((y - v9) * (y - v9) + (x - v10) * (x - v10));
      v26 = (x - v10) * a6;
      v27 = (y - v9) * a6;
      v28 = PDFPointMake(x - v26 * 3.0 / v25, y - v27 * 3.0 / v25);
      v30 = v29;
      v31 = v27 * 1.5 / v25;
      v32 = v26 * 1.5 / v25;
      v33 = PDFPointMake(v28 - v31, v32 + v29);
      v127 = v34;
      v35 = PDFPointMake(v31 + v28, v30 - v32);
      v37 = v36;
      -[PDFAnnotation _pointOutsetFrom:startPoint1:startPoint2:lineWidth:](self, "_pointOutsetFrom:startPoint1:startPoint2:lineWidth:", x, y, v33, v127, v35, v36, a6);
      v39 = v38 + v38;
      v41 = v40 + v40;
      v42.n128_f64[0] = x - v38;
      v43.n128_f64[0] = y - v40;
      PDFRectMake(v42, v43, v39, v41);
      v44 = PDFPointMake(a6 * 0.5, a6 * 0.5);
      v46 = v45;
      v47.n128_f64[0] = v33 - v44;
      v48.n128_f64[0] = v127 - v45;
      PDFRectMake(v47, v48, v44 + v44, v46 + v46);
      v49.n128_f64[0] = v35 - v44;
      v50.n128_f64[0] = v37 - v46;
      PDFRectMake(v49, v50, v44 + v44, v46 + v46);
      v52 = PDFRectToCGRect(v51);
      v131 = v53;
      v133 = v52;
      v128 = v55;
      v129 = v54;
      v57 = PDFRectToCGRect(v56);
      v59 = v58;
      v61 = v60;
      v63 = v62;
      v141.origin.x = PDFRectToCGRect(v64);
      v141.origin.y = v65;
      v141.size.width = v66;
      v141.size.height = v67;
      v135.origin.x = v57;
      v135.origin.y = v59;
      v135.size.width = v61;
      v135.size.height = v63;
      v136 = CGRectUnion(v135, v141);
      v68 = v136.origin.x;
      v69 = v136.origin.y;
      width = v136.size.width;
      height = v136.size.height;
      v73 = v131;
      v72 = v133;
      v75 = v128;
      v74 = v129;
      goto LABEL_8;
    case 5:
      v76 = y - v9;
      v77 = sqrt(v76 * v76 + (x - v10) * (x - v10));
      v78 = (x - v10) * a6;
      v79 = v76 * a6;
      v80 = PDFPointMake(x - v78 * 3.0 / v77, y - v76 * a6 * 3.0 / v77);
      v82 = v81;
      v83 = v79 * 1.5 / v77;
      v84 = v78 * 1.5 / v77;
      r1 = PDFPointMake(v80 - v83, v84 + v81);
      v86 = v85;
      v87 = PDFPointMake(v83 + v80, v82 - v84);
      v89 = v88;
      -[PDFAnnotation _pointOutsetFrom:startPoint1:startPoint2:lineWidth:](self, "_pointOutsetFrom:startPoint1:startPoint2:lineWidth:", x, y, r1, v86, v87, v88, a6);
      v91 = v90 + v90;
      v93 = v92 + v92;
      v94.n128_f64[0] = x - v90;
      v95.n128_f64[0] = y - v92;
      PDFRectMake(v94, v95, v91, v93);
      -[PDFAnnotation _pointOutsetFrom:startPoint1:startPoint2:lineWidth:](self, "_pointOutsetFrom:startPoint1:startPoint2:lineWidth:", r1, v86, x, y, v87, v89, a6);
      v97 = v96 + v96;
      v99 = v98 + v98;
      v100.n128_f64[0] = r1 - v96;
      v101.n128_f64[0] = v86 - v98;
      PDFRectMake(v100, v101, v97, v99);
      -[PDFAnnotation _pointOutsetFrom:startPoint1:startPoint2:lineWidth:](self, "_pointOutsetFrom:startPoint1:startPoint2:lineWidth:", v87, v89, x, y, r1, v86, a6);
      v103 = v102 + v102;
      v105 = v104 + v104;
      v106.n128_f64[0] = v87 - v102;
      v107.n128_f64[0] = v89 - v104;
      PDFRectMake(v106, v107, v103, v105);
      v109 = PDFRectToCGRect(v108);
      v132 = v110;
      v134 = v109;
      v130 = v111;
      r1a = v112;
      v114 = PDFRectToCGRect(v113);
      v116 = v115;
      v118 = v117;
      v120 = v119;
      v142.origin.x = PDFRectToCGRect(v121);
      v142.origin.y = v122;
      v142.size.width = v123;
      v142.size.height = v124;
      v137.origin.x = v114;
      v137.origin.y = v116;
      v137.size.width = v118;
      v137.size.height = v120;
      v138 = CGRectUnion(v137, v142);
      v68 = v138.origin.x;
      v69 = v138.origin.y;
      width = v138.size.width;
      height = v138.size.height;
      v73 = v132;
      v72 = v134;
      v74 = v130;
      v75 = r1a;
LABEL_8:
      v139 = CGRectUnion(*(CGRect *)&v72, *(CGRect *)&v68);
      v13 = PDFRectFromCGRect(v139.origin.x, v139.origin.y, v139.size.width, v139.size.height);
      break;
    default:
      break;
  }
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGPoint)_pointOutsetFrom:(CGPoint)a3 startPoint1:(CGPoint)a4 startPoint2:(CGPoint)a5 lineWidth:(double)a6
{
  double y;
  double x;
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
  long double v21;
  double v22;
  double v23;
  CGPoint result;

  y = a5.y;
  x = a5.x;
  v9 = a3.y;
  v10 = a3.x;
  v11 = PDFNormalizedCGVectorFromPoints(a3.x, a3.y, a4.x, a4.y);
  v13 = v12;
  v14 = PDFNormalizedCGVectorFromPoints(v10, v9, x, y);
  v16 = v15;
  v17 = PDFNormalizeCGVector((v11 + v14) * 0.5, (v13 + v15) * 0.5);
  v19 = v18;
  v20 = PDFGetAngleBetweenCGVectors(v11, v13, v14, v16);
  v21 = a6 / sin(v20 * 0.5) * 0.5;
  v22 = PDFPointMake(v17 * v21, v19 * v21);
  result.y = v23;
  result.x = v22;
  return result;
}

- (void)updateFormData
{
  id WeakRetained;
  void *v4;
  PDFForm *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  PDFFormField *v14;
  void *v15;
  PDFFormField *v16;
  id v17;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("/Widget")))
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation formData](self, "formData");
    v5 = (PDFForm *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(WeakRetained, "document");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_alloc_init(PDFForm);
      -[PDFForm setDocument:](v5, "setDocument:", v6);
      objc_msgSend(v6, "setFormData:", v5);

    }
    -[PDFAnnotation fieldName](self, "fieldName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("/Btn")))
    {
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("/Ch")))
      {
        -[PDFForm fieldNamed:](v5, "fieldNamed:", v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          v14 = -[PDFFormField initWithAnnotation:]([PDFFormField alloc], "initWithAnnotation:", self);
          -[PDFForm addFormField:](v5, "addFormField:", v14);

        }
        -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/V"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v4, "isEqualToString:", CFSTR("/Tx")))
        {
LABEL_22:

          goto LABEL_23;
        }
        -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/V"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PDFForm fieldNamed:](v5, "fieldNamed:", v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          objc_msgSend(WeakRetained, "addAnnotationFormField:", self);
      }
      -[PDFForm setStringValue:forFieldNamed:postFormChangeNotification:](v5, "setStringValue:forFieldNamed:postFormChangeNotification:", v8, v7, !self->_constructingDictionaryRef);
LABEL_21:

      goto LABEL_22;
    }
    -[PDFAnnotation widgetOnStateString](self, "widgetOnStateString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/V"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v8);
    -[PDFForm fieldNamed:](v5, "fieldNamed:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (v10)
      {
LABEL_7:
        -[PDFAnnotation widgetOnStateString](self, "widgetOnStateString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          -[PDFForm setStringValue:forFieldNamed:postFormChangeNotification:](v5, "setStringValue:forFieldNamed:postFormChangeNotification:", v12, v7, !self->_constructingDictionaryRef);

        goto LABEL_20;
      }
    }
    else
    {
      v16 = -[PDFFormField initWithAnnotation:]([PDFFormField alloc], "initWithAnnotation:", self);
      -[PDFForm addFormField:](v5, "addFormField:", v16);

      if (v10)
        goto LABEL_7;
    }
    -[PDFForm setStringValue:forFieldNamed:postFormChangeNotification:](v5, "setStringValue:forFieldNamed:postFormChangeNotification:", 0, v7, !self->_constructingDictionaryRef);
LABEL_20:

    goto LABEL_21;
  }
LABEL_23:

}

- (void)clearFormData
{
  void *v3;
  void *v4;
  id v5;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("/Widget")))
  {
    -[PDFAnnotation fieldName](self, "fieldName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      -[PDFAnnotation setFieldName:](self, "setFieldName:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PDFAnnotation alternateFieldName](self, "alternateFieldName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[PDFAnnotation setAlternateFieldName:](self, "setAlternateFieldName:", 0);
      }
    }
  }

}

- (id)formData
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("/Widget"))
    && (-[PDFAnnotation page](self, "page"), (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    objc_msgSend(v4, "document");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      -[PDFAnnotation fieldName](self, "fieldName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v7, "formData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)akAnnotationAdaptor
{
  return self->_akAnnotationAdaptor;
}

- (id)scaledFontForTextWidget
{
  id v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  -[PDFAnnotation font](self, "font");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[PDFAnnotation isTextWidget](self, "isTextWidget"))
    goto LABEL_7;
  if (v3)
  {
    objc_msgSend(v3, "pointSize");
    if (v4 == 0.0)
    {
      objc_msgSend(MEMORY[0x24BDF6A70], "smallSystemFontSize");
      objc_msgSend(v3, "fontWithSize:");
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v5;
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend(MEMORY[0x24BDF6A70], "smallSystemFontSize");
    objc_msgSend(v6, "systemFontOfSize:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!-[PDFAnnotation isMultiline](self, "isMultiline"))
  {
    objc_msgSend(v3, "pointSize");
    v9 = v8;
    -[PDFAnnotation bounds](self, "bounds");
    v11 = v10;
    v13 = v12;
    -[PDFAnnotation widgetStringValue](self, "widgetStringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BDF65F8];
    do
    {
      v16 = v9;
      if (v9 <= 4.0)
        break;
      v24 = v15;
      objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = PDFSizeToCGSize(objc_msgSend(v14, "sizeWithAttributes:", v18));
      v21 = v20;

      v9 = v9 + -1.0;
    }
    while (v19 > v11 || v21 > v13);
    objc_msgSend(v3, "fontWithSize:", round(v16));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_7:
    v3 = v3;
    v7 = v3;
  }

  return v7;
}

- (id)createAttributedStringForTextWidget
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSTextAlignment v7;
  uint64_t v8;
  void *v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  -[PDFAnnotation widgetStringValue](self, "widgetStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    -[PDFAnnotation scaledFontForTextWidget](self, "scaledFontForTextWidget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation fontColor](self, "fontColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PDFAnnotation alignment](self, "alignment");
    v8 = objc_msgSend(v4, "length");
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", v4);
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x24BDF6610], &unk_24C27D5B0, 0, v8);
    v10 = (uint64_t *)MEMORY[0x24BDF65F8];
    if (v5)
      objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x24BDF65F8], v5, 0, v8);
    if (v6)
      objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x24BDF6600], v6, 0, v8);
    objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "setAlignment:", v7);
    if (-[PDFAnnotation shouldComb](self, "shouldComb"))
    {
      -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/MaxLen"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (double)objc_msgSend(v13, "integerValue");

      v23 = *v10;
      v24[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sizeWithAttributes:", v15);
      v17 = v16;

      v18 = (double)(unint64_t)objc_msgSend(v4, "length");
      -[PDFAnnotation bounds](self, "bounds");
      v20 = *MEMORY[0x24BDF6608];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (v19 + -v17 / v18 * v14) / v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAttribute:value:range:", v20, v21, 0, v8);

      objc_msgSend(v12, "setLineBreakMode:", 2);
    }
    objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x24BDF6628], v12, 0, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)suppressAppearanceStreamText
{
  return self->_suppressAppearanceStreamText;
}

- (id)autoFillTextContentType
{
  NSString **p_autoFillTextContentType;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t (**v8)(_QWORD, _QWORD);
  id *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  p_autoFillTextContentType = &self->_autoFillTextContentType;
  if (!self->_autoFillTextContentType && -[PDFAnnotation isTextWidget](self, "isTextWidget"))
  {
    -[PDFAnnotation fieldName](self, "fieldName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/TU"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __40__PDFAnnotation_autoFillTextContentType__block_invoke;
    v11[3] = &unk_24C25C668;
    v6 = v4;
    v12 = v6;
    v7 = v5;
    v13 = v7;
    v8 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x20BD1AEB4](v11);
    if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("user")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7F40];
    }
    else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("password")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7EE0];
    }
    else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("email")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7E70];
    }
    else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("url")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7F38];
    }
    else if (((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("address")))
    {
      objc_storeStrong((id *)p_autoFillTextContentType, (id)*MEMORY[0x24BDF7E80]);
      if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("first")) & 1) != 0
        || (((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("1")) & 1) != 0)
      {
        v9 = (id *)MEMORY[0x24BDF7EF0];
      }
      else
      {
        if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("second")) & 1) == 0
          && (((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("2")) & 1) == 0)
        {
          goto LABEL_33;
        }
        v9 = (id *)MEMORY[0x24BDF7EF8];
      }
    }
    else if (((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("city"))
           && (((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("state")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7E08];
    }
    else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("city")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7E00];
    }
    else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("state")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7E10];
    }
    else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("sublocal")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7F00];
    }
    else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("country")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7E18];
    }
    else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("postal")) & 1) != 0
           || (((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("postcode")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7EE8];
    }
    else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("location")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7E98];
    }
    else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("job")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7E90];
    }
    else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("organization")) & 1) != 0
           || (((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("company")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7ED8];
    }
    else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("prefix")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7EB0];
    }
    else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("suffix")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7EB8];
    }
    else if (((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("name")))
    {
      objc_storeStrong((id *)p_autoFillTextContentType, (id)*MEMORY[0x24BDF7EA8]);
      if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("first")) & 1) != 0
        || (((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("given")) & 1) != 0)
      {
        v9 = (id *)MEMORY[0x24BDF7E88];
      }
      else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("middle")) & 1) != 0)
      {
        v9 = (id *)MEMORY[0x24BDF7EA0];
      }
      else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("last")) & 1) != 0
             || (((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("family")) & 1) != 0
             || (((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("surname")) & 1) != 0)
      {
        v9 = (id *)MEMORY[0x24BDF7E78];
      }
      else
      {
        if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("nickname")) & 1) == 0)
          goto LABEL_33;
        v9 = (id *)MEMORY[0x24BDF7EC8];
      }
    }
    else if ((((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("phone")) & 1) != 0
           || (((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("mobile")) & 1) != 0)
    {
      v9 = (id *)MEMORY[0x24BDF7F30];
    }
    else
    {
      if (!((uint64_t (**)(_QWORD, const __CFString *))v8)[2](v8, CFSTR("credit")))
        goto LABEL_33;
      v9 = (id *)MEMORY[0x24BDF7E50];
    }
    objc_storeStrong((id *)p_autoFillTextContentType, *v9);
LABEL_33:

  }
  return *p_autoFillTextContentType;
}

uint64_t __40__PDFAnnotation_autoFillTextContentType__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "localizedCaseInsensitiveContainsString:", v3) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(*(id *)(a1 + 40), "localizedCaseInsensitiveContainsString:", v3);

  return v4;
}

- (void)setAutoFillTextContentType:(id)a3
{
  objc_storeStrong((id *)&self->_autoFillTextContentType, a3);
}

- (unint64_t)formContentType
{
  return self->_formContentType;
}

- (void)setFormContentType:(unint64_t)a3
{
  self->_formContentType = a3;
}

- (unint64_t)autofillEntryType
{
  return self->_autofillEntryType;
}

- (void)setAutofillEntryType:(unint64_t)a3
{
  self->_autofillEntryType = a3;
}

- (id)labelText
{
  return self->_labelText;
}

- (void)setLabelText:(id)a3
{
  objc_storeStrong((id *)&self->_labelText, a3);
}

- (BOOL)handledByPDFKit
{
  return -[PDFAnnotation handledByPDFKitCheckAKEnabled:](self, "handledByPDFKitCheckAKEnabled:", 1);
}

- (BOOL)handledByPDFKitCheckAKEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  id WeakRetained;
  void *v8;
  BOOL v9;

  v3 = a3;
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = ShouldRenderAnnotationsInPDFKit();
  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  objc_msgSend(WeakRetained, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v6 = objc_msgSend(v8, "allowsMarkupAnnotationEditing") ^ 1;
  v9 = v3 && (v6 & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("/Widget")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("/Link")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("/Text")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("/Popup")) & 1) != 0
    || -[PDFAnnotation isMarkupAnnotationSubtype](self, "isMarkupAnnotationSubtype");

  return v9;
}

+ (void)setAnnotationPageLayerEffectIsFlipped:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("PDFAnnotationPageLayerEffectIsFlippedKey"));

}

+ (BOOL)annotationPageLayerEffectIsFlipped
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PDFAnnotationPageLayerEffectIsFlippedKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (id)PDFKitAnnotationKeys
{
  if (PDFKitAnnotationKeys_pred != -1)
    dispatch_once(&PDFKitAnnotationKeys_pred, &__block_literal_global_580);
  return (id)PDFKitAnnotationKeys_array;
}

void __37__PDFAnnotation_PDFKitAnnotationKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", CFSTR("/AP"), CFSTR("/AS"), CFSTR("/Border"), CFSTR("/C"), CFSTR("/Contents"), CFSTR("/F"), CFSTR("/M"), CFSTR("/NM"), CFSTR("/P"), CFSTR("/Rect"), CFSTR("/Type"), CFSTR("/Subtype"), CFSTR("/A"), CFSTR("/AA"), CFSTR("/BS"), CFSTR("/DA"), CFSTR("/Dest"),
         CFSTR("/H"),
         CFSTR("/InkList"),
         CFSTR("/IC"),
         CFSTR("/L"),
         CFSTR("/LE"),
         CFSTR("/Name"),
         CFSTR("/Open"),
         CFSTR("/Parent"),
         CFSTR("/Popup"),
         CFSTR("/Q"),
         CFSTR("/QuadPoints"),
         CFSTR("/T"),
         CFSTR("/AC"),
         CFSTR("/BC"),
         CFSTR("/BG"),
         CFSTR("/CA"),
         CFSTR("/DV"),
         CFSTR("/Ff"),
         CFSTR("/FT"),
         CFSTR("/MK"),
         CFSTR("/MaxLen"),
         CFSTR("/Opt"),
         CFSTR("/R"),
         CFSTR("/RC"),
         CFSTR("/TU"),
         CFSTR("/V"),
         0);
  v1 = (void *)PDFKitAnnotationKeys_array;
  PDFKitAnnotationKeys_array = v0;

}

+ (id)PDFKitFieldTypeArray
{
  if (PDFKitFieldTypeArray_pred != -1)
    dispatch_once(&PDFKitFieldTypeArray_pred, &__block_literal_global_581);
  return (id)PDFKitFieldTypeArray_array;
}

void __37__PDFAnnotation_PDFKitFieldTypeArray__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", CFSTR("/Btn"), CFSTR("/Ch"), CFSTR("/Tx"), CFSTR("/Sig"), 0);
  v1 = (void *)PDFKitFieldTypeArray_array;
  PDFKitFieldTypeArray_array = v0;

}

+ (id)PDFKitHighlightingModeArray
{
  if (PDFKitHighlightingModeArray_pred != -1)
    dispatch_once(&PDFKitHighlightingModeArray_pred, &__block_literal_global_582);
  return (id)PDFKitHighlightingModeArray_array;
}

void __44__PDFAnnotation_PDFKitHighlightingModeArray__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", CFSTR("/N"), CFSTR("/I"), CFSTR("/O"), CFSTR("/P"), CFSTR("/T"), 0);
  v1 = (void *)PDFKitHighlightingModeArray_array;
  PDFKitHighlightingModeArray_array = v0;

}

+ (id)PDFKitSubtypeArray
{
  if (PDFKitSubtypeArray_pred != -1)
    dispatch_once(&PDFKitSubtypeArray_pred, &__block_literal_global_587);
  return (id)PDFKitSubtypeArray_array;
}

void __35__PDFAnnotation_PDFKitSubtypeArray__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", CFSTR("/Text"), CFSTR("/Link"), CFSTR("/FreeText"), CFSTR("/Line"), CFSTR("/Square"), CFSTR("/Circle"), CFSTR("/Highlight"), CFSTR("/Underline"), CFSTR("/StrikeOut"), CFSTR("/Stamp"), CFSTR("/Ink"), CFSTR("/Popup"), CFSTR("/Widget"), 0);
  v1 = (void *)PDFKitSubtypeArray_array;
  PDFKitSubtypeArray_array = v0;

}

+ (id)PDFKitAppearanceDictionaryArray
{
  if (PDFKitAppearanceDictionaryArray_pred != -1)
    dispatch_once(&PDFKitAppearanceDictionaryArray_pred, &__block_literal_global_588);
  return (id)PDFKitAppearanceDictionaryArray_array;
}

void __48__PDFAnnotation_PDFKitAppearanceDictionaryArray__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", CFSTR("/N"), CFSTR("/R"), CFSTR("/D"), 0);
  v1 = (void *)PDFKitAppearanceDictionaryArray_array;
  PDFKitAppearanceDictionaryArray_array = v0;

}

+ (id)PDFKitBorderStyleArray
{
  if (PDFKitBorderStyleArray_pred != -1)
    dispatch_once(&PDFKitBorderStyleArray_pred, &__block_literal_global_589);
  return (id)PDFKitBorderStyleArray_array;
}

void __39__PDFAnnotation_PDFKitBorderStyleArray__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", CFSTR("/Type"), CFSTR("/W"), CFSTR("/S"), CFSTR("/D"), 0);
  v1 = (void *)PDFKitBorderStyleArray_array;
  PDFKitBorderStyleArray_array = v0;

}

+ (int64_t)MarkupTypeForMarkupStyle:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  if (MarkupTypeForMarkupStyle__onceToken != -1)
    dispatch_once(&MarkupTypeForMarkupStyle__onceToken, &__block_literal_global_594);
  v4 = (void *)MarkupTypeForMarkupStyle__styles;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

void __42__PDFAnnotation_MarkupTypeForMarkupStyle___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24C27D5C8;
  v2[1] = &unk_24C27D5F8;
  v3[0] = &unk_24C27D5E0;
  v3[1] = &unk_24C27D5E0;
  v2[2] = &unk_24C27D610;
  v2[3] = &unk_24C27D628;
  v3[2] = &unk_24C27D5E0;
  v3[3] = &unk_24C27D5E0;
  v2[4] = &unk_24C27D640;
  v2[5] = &unk_24C27D658;
  v3[4] = &unk_24C27D5E0;
  v3[5] = &unk_24C27D670;
  v2[6] = &unk_24C27D688;
  v2[7] = &unk_24C27D6B8;
  v3[6] = &unk_24C27D6A0;
  v3[7] = &unk_24C27D6D0;
  v2[8] = &unk_24C27D6E8;
  v3[8] = &unk_24C27D700;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MarkupTypeForMarkupStyle__styles;
  MarkupTypeForMarkupStyle__styles = v0;

}

+ (id)SubtypeForPDFMarkupStyle:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (SubtypeForPDFMarkupStyle__onceToken != -1)
    dispatch_once(&SubtypeForPDFMarkupStyle__onceToken, &__block_literal_global_609);
  v4 = (void *)SubtypeForPDFMarkupStyle__subtypes;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __42__PDFAnnotation_SubtypeForPDFMarkupStyle___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];
  _QWORD v3[10];

  v3[9] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24C27D5C8;
  v2[1] = &unk_24C27D5F8;
  v3[0] = CFSTR("/Highlight");
  v3[1] = CFSTR("/Highlight");
  v2[2] = &unk_24C27D610;
  v2[3] = &unk_24C27D628;
  v3[2] = CFSTR("/Highlight");
  v3[3] = CFSTR("/Highlight");
  v2[4] = &unk_24C27D640;
  v2[5] = &unk_24C27D658;
  v3[4] = CFSTR("/Highlight");
  v3[5] = CFSTR("/Underline");
  v2[6] = &unk_24C27D688;
  v2[7] = &unk_24C27D6B8;
  v3[6] = CFSTR("/StrikeOut");
  v3[7] = CFSTR("/Redact");
  v2[8] = &unk_24C27D6E8;
  v3[8] = &stru_24C25F170;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SubtypeForPDFMarkupStyle__subtypes;
  SubtypeForPDFMarkupStyle__subtypes = v0;

}

+ (id)PDFMarkupColors
{
  if (PDFMarkupColors_pred != -1)
    dispatch_once(&PDFMarkupColors_pred, &__block_literal_global_610);
  return (id)PDFMarkupColors_array;
}

void __32__PDFAnnotation_PDFMarkupColors__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v0 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.980392, 0.803922, 0.352941, 1.0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.486275, 0.784314, 0.407843, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.411765, 0.690196, 0.945098, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.984314, 0.360784, 0.537255, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.784314, 0.521569, 0.854902, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.92549, 0.156863, 0.078431, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.92549, 0.156863, 0.078431, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v0, "initWithObjects:", v10, v1, v2, v3, v4, v5, v6, v7, 0);
  v9 = (void *)PDFMarkupColors_array;
  PDFMarkupColors_array = v8;

}

+ (id)PDFTextColors
{
  if (PDFTextColors_pred != -1)
    dispatch_once(&PDFTextColors_pred, &__block_literal_global_611);
  return (id)PDFTextColors_array;
}

void __30__PDFAnnotation_PDFTextColors__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v0 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.92, 0.42, 1.0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.75, 0.93, 0.45, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.67, 0.85, 1.0, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 0.69, 0.79, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.85, 0.7, 1.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v0, "initWithObjects:", v9, v1, v2, v3, v4, v5, v6, 0);
  v8 = (void *)PDFTextColors_array;
  PDFTextColors_array = v7;

}

+ (id)PDFTextColorForMarkupStyle:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "PDFTextColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
  {
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"Annotations", (uint64_t)"markupStyle (%lu) is out of range", v5, v6, v7, v8, v9, a3);
    a3 = 0;
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)PDFTextBorderColors
{
  if (PDFTextBorderColors_pred != -1)
    dispatch_once(&PDFTextBorderColors_pred, &__block_literal_global_614);
  return (id)PDFTextBorderColors_array;
}

void __36__PDFAnnotation_PDFTextBorderColors__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v0 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.9, 0.79, 0.39, 1.0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.65, 0.8, 0.38, 1.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.57, 0.71, 0.85, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.85, 0.59, 0.67, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.71, 0.59, 0.84, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.5, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.5, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v0, "initWithObjects:", v9, v1, v2, v3, v4, v5, v6, 0);
  v8 = (void *)PDFTextBorderColors_array;
  PDFTextBorderColors_array = v7;

}

+ (id)PDFTextBorderColorForMarkupStyle:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "PDFTextBorderColors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
  {
    _PDFLog(OS_LOG_TYPE_ERROR, (uint64_t)"Annotations", (uint64_t)"markupStyle (%lu) is out of range", v5, v6, v7, v8, v9, a3);
    a3 = 0;
  }
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)PDFFormFieldBackgroundColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)PDFMarkupStyleLabels
{
  if (PDFMarkupStyleLabels_pred != -1)
    dispatch_once(&PDFMarkupStyleLabels_pred, &__block_literal_global_615);
  return (id)PDFMarkupStyleLabels_array;
}

void __37__PDFAnnotation_PDFMarkupStyleLabels__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v0 = objc_alloc(MEMORY[0x24BDBCEB8]);
  PDFKitLocalizedString(CFSTR("Yellow"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  PDFKitLocalizedString(CFSTR("Green"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PDFKitLocalizedString(CFSTR("Blue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PDFKitLocalizedString(CFSTR("Pink"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PDFKitLocalizedString(CFSTR("Purple"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PDFKitLocalizedString(CFSTR("Underline"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PDFKitLocalizedString(CFSTR("Strikethrough"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v0, "initWithObjects:", v9, v1, v2, v3, v4, v5, v6, 0);
  v8 = (void *)PDFMarkupStyleLabels_array;
  PDFMarkupStyleLabels_array = v7;

}

+ (id)PDFAnnotationKeysWithStringValues
{
  if (PDFAnnotationKeysWithStringValues_pred != -1)
    dispatch_once(&PDFAnnotationKeysWithStringValues_pred, &__block_literal_global_628);
  return (id)PDFAnnotationKeysWithStringValues_array;
}

void __50__PDFAnnotation_PDFAnnotationKeysWithStringValues__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", CFSTR("/Contents"), CFSTR("/DA"), CFSTR("/NM"), CFSTR("/T"), CFSTR("/AC"), CFSTR("/CA"), CFSTR("/RC"), CFSTR("/TU"), 0);
  v1 = (void *)PDFAnnotationKeysWithStringValues_array;
  PDFAnnotationKeysWithStringValues_array = v0;

}

+ (id)PDFAnnotationKeysForRedactionDiscoverability
{
  if (PDFAnnotationKeysForRedactionDiscoverability_pred != -1)
    dispatch_once(&PDFAnnotationKeysForRedactionDiscoverability_pred, &__block_literal_global_629);
  return (id)PDFAnnotationKeysForRedactionDiscoverability_set;
}

void __61__PDFAnnotation_PDFAnnotationKeysForRedactionDiscoverability__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("/P"), CFSTR("/IC"), CFSTR("/LE"), CFSTR("/Border"), 0);
  v1 = (void *)PDFAnnotationKeysForRedactionDiscoverability_set;
  PDFAnnotationKeysForRedactionDiscoverability_set = v0;

}

+ (id)PDFKitAnnotationUndoManagerDisplayNames
{
  if (PDFKitAnnotationUndoManagerDisplayNames_pred != -1)
    dispatch_once(&PDFKitAnnotationUndoManagerDisplayNames_pred, &__block_literal_global_631);
  return (id)PDFKitAnnotationUndoManagerDisplayNames_array;
}

void __56__PDFAnnotation_PDFKitAnnotationUndoManagerDisplayNames__block_invoke()
{
  void *v0;

  v0 = (void *)PDFKitAnnotationUndoManagerDisplayNames_array;
  PDFKitAnnotationUndoManagerDisplayNames_array = (uint64_t)&unk_24C27DB90;

}

+ (id)PresentableStringForAnnotationKey:(id)a3
{
  id v3;
  uint64_t v4;
  __CFString *v5;

  v3 = a3;
  if (PresentableStringForAnnotationKey__onceToken != -1)
    dispatch_once(&PresentableStringForAnnotationKey__onceToken, &__block_literal_global_637);
  objc_msgSend((id)PresentableStringForAnnotationKey__strings, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (__CFString *)v4;
  else
    v5 = CFSTR("Annotation Property");

  return v5;
}

void __51__PDFAnnotation_PresentableStringForAnnotationKey___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("/Rect");
  PDFKitLocalizedString(CFSTR("Bounds"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[1] = CFSTR("/Contents");
  PDFKitLocalizedString(CFSTR("Contents"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v5[2] = CFSTR("/QuadPoints");
  PDFKitLocalizedString(CFSTR("Range"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)PresentableStringForAnnotationKey__strings;
  PresentableStringForAnnotationKey__strings = v3;

}

+ (id)detectedFormFieldDefaultFontName
{
  return CFSTR("Helvetica");
}

+ (double)detectedFormFieldDefaultFontSize
{
  return 11.0;
}

+ (id)createDetectedTextFieldWithBounds:(CGRect)a3 font:(id)a4 textContentType:(id)a5 page:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v13 = a4;
  v14 = objc_alloc_init((Class)objc_msgSend(a6, "annotationSubclassForSubtype:", CFSTR("/FreeText")));
  objc_msgSend(v14, "setValue:forAnnotationKey:", MEMORY[0x24BDBD1C8], CFSTR("/AAPL:SFF"));
  objc_msgSend(v14, "setAutoFillTextContentType:", v12);

  objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFRect:", x, y, width, height);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forAnnotationKey:", v15, CFSTR("/Rect"));

  objc_msgSend(v14, "setValue:forAnnotationKey:", CFSTR("/FreeText"), CFSTR("/Subtype"));
  objc_msgSend(v14, "setFont:", v13);

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFontColor:", v16);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forAnnotationKey:", v17, CFSTR("/Q"));

  return v14;
}

- (CRNormalizedQuad)boundingQuad
{
  id WeakRetained;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double x;
  double y;
  double width;
  double height;
  void *v14;
  objc_class *v15;
  id v16;
  void *v17;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGRect v22;
  CGRect v23;

  WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  objc_msgSend(WeakRetained, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renderingProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    v5 = (void *)objc_opt_new();
  objc_msgSend(WeakRetained, "boundsForBox:", objc_msgSend(v5, "displayBox"));
  v7 = v6;
  v9 = v8;
  CGAffineTransformMakeTranslation(&v21, 0.0, 1.0);
  v19 = v21;
  CGAffineTransformScale(&v20, &v19, 1.0 / v7, -1.0 / v9);
  v21 = v20;
  -[PDFAnnotation bounds](self, "bounds");
  v20 = v21;
  v23 = CGRectApplyAffineTransform(v22, &v20);
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  v19.a = 0.0;
  *(_QWORD *)&v19.b = &v19;
  *(_QWORD *)&v19.c = 0x2050000000;
  v14 = (void *)getCRNormalizedQuadClass_softClass;
  *(_QWORD *)&v19.d = getCRNormalizedQuadClass_softClass;
  if (!getCRNormalizedQuadClass_softClass)
  {
    *(_QWORD *)&v20.a = MEMORY[0x24BDAC760];
    *(_QWORD *)&v20.b = 3221225472;
    *(_QWORD *)&v20.c = __getCRNormalizedQuadClass_block_invoke;
    *(_QWORD *)&v20.d = &unk_24C25C890;
    *(_QWORD *)&v20.tx = &v19;
    __getCRNormalizedQuadClass_block_invoke((uint64_t)&v20);
    v14 = *(void **)(*(_QWORD *)&v19.b + 24);
  }
  v15 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v19, 8);
  v16 = [v15 alloc];
  v17 = (void *)objc_msgSend(v16, "initWithNormalizedBoundingBox:size:", x, y, width, height, v7, v9, *(_QWORD *)&v19.a);

  return (CRNormalizedQuad *)v17;
}

- (unint64_t)fieldSource
{
  return 4;
}

- (unint64_t)fieldType
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("/Widget")))
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("/Tx")) & 1) != 0)
    {
      v5 = 1;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("/Ch")))
    {
      v5 = 2;
    }
    else
    {
      v5 = -1;
    }

  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("/FreeText")))
  {
    v5 = 1;
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

- (NSString)fieldValue
{
  return 0;
}

- (unint64_t)layoutDirection
{
  return 0;
}

- (unint64_t)textContentType
{
  return self->_formContentType;
}

- (void)setTextContentType:(unint64_t)a3
{
  void *v5;
  id v6;
  NSString *v7;
  NSString *autoFillTextContentType;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  self->_formContentType = a3;
  if (a3 == 50)
  {
    self->_isDetectedSignature = 1;
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v5 = (void *)getVKCFormRegionClass_softClass;
    v13 = getVKCFormRegionClass_softClass;
    if (!getVKCFormRegionClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getVKCFormRegionClass_block_invoke;
      v9[3] = &unk_24C25C890;
      v9[4] = &v10;
      __getVKCFormRegionClass_block_invoke((uint64_t)v9);
      v5 = (void *)v11[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v10, 8);
    objc_msgSend(v6, "autoFillContentTypeForCRContentType:", a3);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    autoFillTextContentType = self->_autoFillTextContentType;
    self->_autoFillTextContentType = v7;

  }
}

- (double)suggestedLineHeight
{
  return self->_suggestedLineHeight;
}

- (void)setSuggestedLineHeight:(double)a3
{
  self->_suggestedLineHeight = a3;
}

- (unint64_t)maxCharacterCount
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_akAnnotationForCopying, 0);
  objc_storeStrong((id *)&self->_akAnnotationAdaptor, 0);
  objc_destroyWeak((id *)&self->_accessibilityNode);
  objc_storeStrong((id *)&self->_quadPoints, 0);
  objc_storeStrong((id *)&self->_labelText, 0);
  objc_storeStrong((id *)&self->_autoFillTextContentType, 0);
  objc_destroyWeak(&self->_control);
  objc_storeStrong((id *)&self->_widgetOnStateString, 0);
  objc_storeStrong((id *)&self->_pathLock, 0);
  objc_storeStrong((id *)&self->_popup, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_quadPointsIndexSet, 0);
  objc_storeStrong((id *)&self->_cachedAppearances, 0);
  objc_storeStrong((id *)&self->_internalPDFAnnotationDictionary, 0);
  objc_storeStrong((id *)&self->_PDFAnnotationKeyMapping, 0);
  objc_storeStrong((id *)&self->_PDFAnnotationDictionary, 0);
  objc_storeStrong((id *)&self->_pdfAnnotationUUID, 0);
  objc_destroyWeak((id *)&self->_page);
}

- (UIFont)font
{
  void *v3;
  void *v4;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/DA"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation getFontFromAppearanceNSString:](self, "getFontFromAppearanceNSString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFont *)v4;
}

- (void)setFont:(UIFont *)font
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)-[UIFont copy](font, "copy");
  -[PDFAnnotation fontColor](self, "fontColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation createDefaultAppearanceStringWithFont:fontColor:](self, "createDefaultAppearanceStringWithFont:fontColor:", v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v5, CFSTR("/DA"));

}

- (UIColor)fontColor
{
  void *v3;
  void *v4;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/DA"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation getColorFromAppearanceNSString:](self, "getColorFromAppearanceNSString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (UIColor *)v4;
}

- (void)setFontColor:(UIColor *)fontColor
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = objc_retainAutorelease((id)-[UIColor copy](fontColor, "copy"));
  if (CGColorGetPattern((CGColorRef)objc_msgSend(v7, "CGColor")))
  {
    NSLog(CFSTR("PDFKit \"setFontColor:\" warning: Annotations do not support pattern colors. Defaulting to clear."));
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v4;
  }
  -[PDFAnnotation font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation createDefaultAppearanceStringWithFont:fontColor:](self, "createDefaultAppearanceStringWithFont:fontColor:", v5, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v6, CFSTR("/DA"));

}

- (UIColor)interiorColor
{
  return (UIColor *)-[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/IC"));
}

- (void)setInteriorColor:(UIColor *)interiorColor
{
  id v4;

  v4 = (id)-[UIColor copy](interiorColor, "copy");
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/IC"));

}

- (NSTextAlignment)alignment
{
  void *v2;
  uint64_t v3;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Q"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (v3 == 1)
    return 1;
  else
    return 2 * (v3 == 2);
}

- (void)setAlignment:(NSTextAlignment)alignment
{
  uint64_t v4;
  id v5;

  if ((unint64_t)(alignment - 1) > 2)
    v4 = 0;
  else
    v4 = qword_209DC0760[alignment - 1];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v5, CFSTR("/Q"));

}

- (CGPoint)startPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
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
  CGPoint result;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/L"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(v3, "objectAtIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = PDFPointMake(v6, v8);
  v11 = v10;

  -[PDFAnnotation bounds](self, "bounds");
  v13 = v9 - v12;
  v15 = v11 - v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)setStartPoint:(CGPoint)startPoint
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  y = startPoint.y;
  x = startPoint.x;
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/L"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v6, v6, v6, v6, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[PDFAnnotation bounds](self, "bounds");
  v8 = x + v7;
  v10 = y + v9;
  v11 = objc_alloc(MEMORY[0x24BDBCE30]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndex:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndex:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithObjects:", v12, v13, v14, v15, 0);

  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v16, CFSTR("/L"));
}

- (CGPoint)endPoint
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
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
  CGPoint result;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/L"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;
  objc_msgSend(v3, "objectAtIndex:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = PDFPointMake(v6, v8);
  v11 = v10;

  -[PDFAnnotation bounds](self, "bounds");
  v13 = v9 - v12;
  v15 = v11 - v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)setEndPoint:(CGPoint)endPoint
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  y = endPoint.y;
  x = endPoint.x;
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/L"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v6, v6, v6, v6, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[PDFAnnotation bounds](self, "bounds");
  v8 = x + v7;
  v10 = y + v9;
  v11 = objc_alloc(MEMORY[0x24BDBCE30]);
  objc_msgSend(v17, "objectAtIndex:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndex:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithObjects:", v12, v13, v14, v15, 0);

  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v16, CFSTR("/L"));
}

- (PDFLineStyle)startLineStyle
{
  void *v2;
  void *v3;
  PDFLineStyle v4;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/LE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("/None"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PDFAnnotation lineStyleFromName:](PDFAnnotation, "lineStyleFromName:", v3);

  return v4;
}

- (void)setStartLineStyle:(PDFLineStyle)startLineStyle
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if ((unint64_t)startLineStyle < (kPDFLineStyleOpenArrow|kPDFLineStyleCircle))
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/LE"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("/None"), 0);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (id)v5;
    +[PDFAnnotation nameForLineStyle:](PDFAnnotation, "nameForLineStyle:", startLineStyle);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDBCE30]);
    objc_msgSend(v10, "objectAtIndex:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v6, v8, 0);

    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v9, CFSTR("/LE"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("setStartLineStyle: %ld out of range"), startLineStyle);
  }
}

- (PDFLineStyle)endLineStyle
{
  void *v2;
  void *v3;
  PDFLineStyle v4;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/LE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("/None"), 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "objectAtIndex:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PDFAnnotation lineStyleFromName:](PDFAnnotation, "lineStyleFromName:", v3);

  return v4;
}

- (void)setEndLineStyle:(PDFLineStyle)endLineStyle
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if ((unint64_t)endLineStyle < (kPDFLineStyleOpenArrow|kPDFLineStyleCircle))
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/LE"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("/None"), 0);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (id)v5;
    +[PDFAnnotation nameForLineStyle:](PDFAnnotation, "nameForLineStyle:", endLineStyle);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDBCE30]);
    objc_msgSend(v10, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v6, 0);

    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v9, CFSTR("/LE"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("setEndLineStyle: %ld out of range"), endLineStyle);
  }
}

- (PDFTextAnnotationIconType)iconType
{
  void *v2;
  PDFTextAnnotationIconType v3;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("/Comment")) & 1) != 0)
  {
    v3 = kPDFTextAnnotationIconComment;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("/Key")) & 1) != 0)
  {
    v3 = kPDFTextAnnotationIconKey;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("/Note")) & 1) != 0)
  {
    v3 = kPDFTextAnnotationIconNote;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("/Help")) & 1) != 0)
  {
    v3 = kPDFTextAnnotationIconHelp;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("/NewParagraph")) & 1) != 0)
  {
    v3 = kPDFTextAnnotationIconNewParagraph;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("/Paragraph")) & 1) != 0)
  {
    v3 = kPDFTextAnnotationIconParagraph;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("/Insert")))
  {
    v3 = kPDFTextAnnotationIconInsert;
  }
  else
  {
    v3 = kPDFTextAnnotationIconNote;
  }

  return v3;
}

- (void)setIconType:(PDFTextAnnotationIconType)iconType
{
  if ((unint64_t)iconType >= (kPDFTextAnnotationIconInsert|kPDFTextAnnotationIconKey))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB78], CFSTR("setIconType: %ld out of range"), iconType);
  if ((unint64_t)iconType <= kPDFTextAnnotationIconInsert)
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", off_24C25D610[iconType], CFSTR("/Name"));
}

- (NSArray)quadrilateralPoints
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/QuadPoints"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[PDFAnnotation bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  if (objc_msgSend(v3, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "PDFKitPDFPointValue");
      v12 = v11;
      v14 = v13;

      objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFPoint:", v12 - v6, v14 - v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v15);

      ++v9;
    }
    while (objc_msgSend(v3, "count") > v9);
  }

  return (NSArray *)v4;
}

- (void)setQuadrilateralPoints:(NSArray *)quadrilateralPoints
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  NSArray *v16;

  v16 = quadrilateralPoints;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[PDFAnnotation bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  if (-[NSArray count](v16, "count"))
  {
    v9 = 0;
    do
    {
      -[NSArray objectAtIndex:](v16, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "PDFKitPDFPointValue");
      v12 = v11;
      v14 = v13;

      objc_msgSend(MEMORY[0x24BDD1968], "PDFKitValueWithPDFPoint:", v6 + v12, v8 + v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v15);

      ++v9;
    }
    while (-[NSArray count](v16, "count") > v9);
  }
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/QuadPoints"));
  -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");

}

- (PDFMarkupType)markupType
{
  void *v2;
  PDFMarkupType v3;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("/Underline")) & 1) != 0)
  {
    v3 = kPDFMarkupTypeUnderline;
  }
  else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("/StrikeOut")) & 1) != 0)
  {
    v3 = kPDFMarkupTypeStrikeOut;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("/Redact")))
  {
    v3 = kPDFMarkupTypeRedact;
  }
  else
  {
    v3 = kPDFMarkupTypeHighlight;
  }

  return v3;
}

- (void)setMarkupType:(PDFMarkupType)markupType
{
  if ((unint64_t)markupType <= kPDFMarkupTypeUnderline)
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", off_24C25D648[markupType], CFSTR("/Subtype"));
}

- (NSString)widgetFieldType
{
  return (NSString *)-[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
}

- (void)setWidgetFieldType:(NSString *)widgetFieldType
{
  void *v4;
  id v5;

  v5 = (id)-[NSString copy](widgetFieldType, "copy");
  -[PDFAnnotation widgetFieldType](self, "widgetFieldType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v5, CFSTR("/FT"));
  if (!v4)
    -[PDFAnnotation secondaryInit](self, "secondaryInit");

}

- (PDFWidgetControlType)widgetControlType
{
  void *v2;
  unsigned int v3;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Ff"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if ((v3 & 0x8000) != 0)
    return 1;
  else
    return (unint64_t)(~(v3 >> 15) & 2);
}

- (void)setWidgetControlType:(PDFWidgetControlType)widgetControlType
{
  void *v5;
  uint64_t v6;
  PDFWidgetControlType v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Ff"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = -[PDFAnnotation widgetControlType](self, "widgetControlType");
  if (v7)
  {
    if (v7 == kPDFWidgetRadioButtonControl)
      v8 = v6 & 0xFFFFFFFFFFFF7FFFLL;
    else
      v8 = 0;
  }
  else
  {
    v8 = v6 & 0xFFFFFFFFFFFEFFFFLL;
  }
  v9 = v8 | 0x10000;
  if (widgetControlType == kPDFWidgetRadioButtonControl)
    v8 |= 0x8000uLL;
  if (widgetControlType)
    v10 = v8;
  else
    v10 = v9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v11, CFSTR("/Ff"));

}

- (BOOL)_BOOLValueForAnnotationFlag:(unint64_t)a3 withDefaultValue:(BOOL)a4
{
  void *v6;
  void *v7;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/F"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    a4 = (a3 & ~objc_msgSend(v6, "unsignedIntegerValue")) == 0;

  return a4;
}

- (void)_setBoolValue:(BOOL)a3 forAnnotationFlag:(unint64_t)a4
{
  unsigned int v4;
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;

  v4 = a4;
  v5 = a3;
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/F"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v5)
    v9 = v8 | v4;
  else
    v9 = v8 & ~(unint64_t)v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v10, CFSTR("/F"));

}

- (BOOL)isInvisible
{
  return -[PDFAnnotation _BOOLValueForAnnotationFlag:withDefaultValue:](self, "_BOOLValueForAnnotationFlag:withDefaultValue:", 1, 0);
}

- (void)setInvisible:(BOOL)a3
{
  -[PDFAnnotation _setBoolValue:forAnnotationFlag:](self, "_setBoolValue:forAnnotationFlag:", a3, 1);
}

- (BOOL)isHidden
{
  return -[PDFAnnotation _BOOLValueForAnnotationFlag:withDefaultValue:](self, "_BOOLValueForAnnotationFlag:withDefaultValue:", 2, 0);
}

- (void)setHidden:(BOOL)a3
{
  -[PDFAnnotation _setBoolValue:forAnnotationFlag:](self, "_setBoolValue:forAnnotationFlag:", a3, 2);
}

- (BOOL)shouldPrint
{
  return -[PDFAnnotation _BOOLValueForAnnotationFlag:withDefaultValue:](self, "_BOOLValueForAnnotationFlag:withDefaultValue:", 4, 1);
}

- (void)setShouldPrint:(BOOL)shouldPrint
{
  -[PDFAnnotation _setBoolValue:forAnnotationFlag:](self, "_setBoolValue:forAnnotationFlag:", shouldPrint, 4);
}

- (BOOL)shouldNotZoom
{
  return -[PDFAnnotation _BOOLValueForAnnotationFlag:withDefaultValue:](self, "_BOOLValueForAnnotationFlag:withDefaultValue:", 8, 0);
}

- (void)setShouldNotZoom:(BOOL)a3
{
  -[PDFAnnotation _setBoolValue:forAnnotationFlag:](self, "_setBoolValue:forAnnotationFlag:", a3, 8);
}

- (BOOL)shouldNotRotate
{
  return -[PDFAnnotation _BOOLValueForAnnotationFlag:withDefaultValue:](self, "_BOOLValueForAnnotationFlag:withDefaultValue:", 16, 0);
}

- (void)setShouldNotRotate:(BOOL)a3
{
  -[PDFAnnotation _setBoolValue:forAnnotationFlag:](self, "_setBoolValue:forAnnotationFlag:", a3, 16);
}

- (BOOL)shouldDisplay
{
  return !-[PDFAnnotation _BOOLValueForAnnotationFlag:withDefaultValue:](self, "_BOOLValueForAnnotationFlag:withDefaultValue:", 32, 0);
}

- (void)setShouldDisplay:(BOOL)shouldDisplay
{
  -[PDFAnnotation _setBoolValue:forAnnotationFlag:](self, "_setBoolValue:forAnnotationFlag:", !shouldDisplay, 32);
  -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");
}

- (BOOL)isReadOnlyAnnotation
{
  return -[PDFAnnotation _BOOLValueForAnnotationFlag:withDefaultValue:](self, "_BOOLValueForAnnotationFlag:withDefaultValue:", 64, 0);
}

- (void)setReadOnlyAnnotation:(BOOL)a3
{
  -[PDFAnnotation _setBoolValue:forAnnotationFlag:](self, "_setBoolValue:forAnnotationFlag:", a3, 64);
}

- (BOOL)isLocked
{
  return -[PDFAnnotation _BOOLValueForAnnotationFlag:withDefaultValue:](self, "_BOOLValueForAnnotationFlag:withDefaultValue:", 128, 0);
}

- (void)setLocked:(BOOL)a3
{
  -[PDFAnnotation _setBoolValue:forAnnotationFlag:](self, "_setBoolValue:forAnnotationFlag:", a3, 128);
}

- (BOOL)shouldToggleNoView
{
  return -[PDFAnnotation _BOOLValueForAnnotationFlag:withDefaultValue:](self, "_BOOLValueForAnnotationFlag:withDefaultValue:", 256, 0);
}

- (void)setShouldToggleNoView:(BOOL)a3
{
  -[PDFAnnotation _setBoolValue:forAnnotationFlag:](self, "_setBoolValue:forAnnotationFlag:", a3, 256);
}

- (BOOL)contentsLocked
{
  return -[PDFAnnotation _BOOLValueForAnnotationFlag:withDefaultValue:](self, "_BOOLValueForAnnotationFlag:withDefaultValue:", 512, 0);
}

- (void)setContentsLocked:(BOOL)a3
{
  -[PDFAnnotation _setBoolValue:forAnnotationFlag:](self, "_setBoolValue:forAnnotationFlag:", a3, 512);
}

- (BOOL)_BOOLValueForWidgetFieldFlag:(unint64_t)a3
{
  void *v4;
  uint64_t v5;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Ff"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  return (a3 & ~v5) == 0;
}

- (void)_setBoolValue:(BOOL)a3 forWidgetFieldFlag:(unint64_t)a4
{
  unsigned int v4;
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;

  v4 = a4;
  v5 = a3;
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Ff"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v5)
    v9 = v8 | v4;
  else
    v9 = v8 & ~(unint64_t)v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v10, CFSTR("/Ff"));

}

- (BOOL)isMultiline
{
  return -[PDFAnnotation _BOOLValueForWidgetFieldFlag:](self, "_BOOLValueForWidgetFieldFlag:", 4096);
}

- (void)setMultiline:(BOOL)multiline
{
  -[PDFAnnotation _setBoolValue:forWidgetFieldFlag:](self, "_setBoolValue:forWidgetFieldFlag:", multiline, 4096);
}

- (BOOL)isActivatableTextField
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  _BOOL4 v9;
  int v10;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/AAPL:SFF"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("/Widget")))
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("/Tx")) ^ 1;
  else
    LOBYTE(v7) = 1;
  if (-[PDFAnnotation shouldDisplay](self, "shouldDisplay"))
    v8 = -[PDFAnnotation isHidden](self, "isHidden");
  else
    v8 = 1;
  v9 = -[PDFAnnotation shouldDisplay](self, "shouldDisplay");
  v10 = v9 & !-[PDFAnnotation isReadOnly](self, "isReadOnly");
  if (((v7 | v8) & 1) != 0)
    v4 = 0;
  else
    v4 = v10;

  return v4;
}

- (BOOL)isPasswordField
{
  return -[PDFAnnotation _BOOLValueForWidgetFieldFlag:](self, "_BOOLValueForWidgetFieldFlag:", 0x2000);
}

- (BOOL)hasComb
{
  return -[PDFAnnotation _BOOLValueForWidgetFieldFlag:](self, "_BOOLValueForWidgetFieldFlag:", 0x1000000);
}

- (void)setComb:(BOOL)comb
{
  -[PDFAnnotation _setBoolValue:forWidgetFieldFlag:](self, "_setBoolValue:forWidgetFieldFlag:", comb, 0x1000000);
}

- (NSInteger)maximumLength
{
  void *v2;
  NSInteger v3;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/MaxLen"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setMaximumLength:(NSInteger)maximumLength
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", maximumLength);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/MaxLen"));

}

- (NSString)widgetStringValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/V"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("/Widget")))
  {
    -[PDFAnnotation fieldName](self, "fieldName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[PDFAnnotation page](self, "page");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "document");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "formData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringValueForFieldNamed:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("/Ch")))
    {
      -[PDFAnnotation _textForValue:](self, "_textForValue:", v10);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    if (v10)
      v13 = v10;
    else
      v13 = v3;
    v11 = v13;

  }
  else
  {
    v11 = v3;
  }

  return (NSString *)v11;
}

- (void)setWidgetStringValue:(NSString *)widgetStringValue
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)-[NSString copy](widgetStringValue, "copy");
  -[PDFAnnotation replaceTextWidgetWithString:](self, "replaceTextWidgetWithString:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/V"));
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("/Widget"))
    && -[PDFAnnotation isFullyConstructed](self, "isFullyConstructed"))
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("/Ch")))
      -[PDFAnnotation removeValueForAnnotationKey:](self, "removeValueForAnnotationKey:", CFSTR("/AP"));
    -[PDFAnnotation updateFormData](self, "updateFormData");

  }
}

- (NSString)widgetDefaultStringValue
{
  __CFString *v3;
  void *v4;
  void *v5;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/DV"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("/Widget")))
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("/Tx")))
        v3 = &stru_24C25F170;
      else
        v3 = 0;
    }
    else
    {
      v3 = 0;
    }
  }

  return (NSString *)v3;
}

- (void)setWidgetDefaultStringValue:(NSString *)widgetDefaultStringValue
{
  id v4;

  v4 = (id)-[NSString copy](widgetDefaultStringValue, "copy");
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/DV"));

}

- (BOOL)allowsToggleToOff
{
  PDFWidgetControlType v3;

  v3 = -[PDFAnnotation widgetControlType](self, "widgetControlType");
  if (v3)
    LOBYTE(v3) = !-[PDFAnnotation _BOOLValueForWidgetFieldFlag:](self, "_BOOLValueForWidgetFieldFlag:", 0x4000);
  return v3;
}

- (void)setAllowsToggleToOff:(BOOL)allowsToggleToOff
{
  _BOOL4 v3;

  v3 = allowsToggleToOff;
  if (-[PDFAnnotation widgetControlType](self, "widgetControlType"))
    -[PDFAnnotation _setBoolValue:forWidgetFieldFlag:](self, "_setBoolValue:forWidgetFieldFlag:", !v3, 0x4000);
}

- (BOOL)radiosInUnison
{
  PDFWidgetControlType v3;

  v3 = -[PDFAnnotation widgetControlType](self, "widgetControlType");
  if (v3)
    LOBYTE(v3) = -[PDFAnnotation _BOOLValueForWidgetFieldFlag:](self, "_BOOLValueForWidgetFieldFlag:", 0x2000000);
  return v3;
}

- (void)setRadiosInUnison:(BOOL)radiosInUnison
{
  _BOOL8 v3;

  v3 = radiosInUnison;
  if (-[PDFAnnotation widgetControlType](self, "widgetControlType"))
    -[PDFAnnotation _setBoolValue:forWidgetFieldFlag:](self, "_setBoolValue:forWidgetFieldFlag:", v3, 0x2000000);
}

- (BOOL)isReadOnly
{
  return -[PDFAnnotation _BOOLValueForWidgetFieldFlag:](self, "_BOOLValueForWidgetFieldFlag:", 1);
}

- (void)setReadOnly:(BOOL)readOnly
{
  -[PDFAnnotation _setBoolValue:forWidgetFieldFlag:](self, "_setBoolValue:forWidgetFieldFlag:", readOnly, 1);
}

- (BOOL)isListChoice
{
  return !-[PDFAnnotation _BOOLValueForWidgetFieldFlag:](self, "_BOOLValueForWidgetFieldFlag:", 0x20000);
}

- (void)setListChoice:(BOOL)listChoice
{
  -[PDFAnnotation _setBoolValue:forWidgetFieldFlag:](self, "_setBoolValue:forWidgetFieldFlag:", !listChoice, 0x20000);
}

- (NSArray)choices
{
  void *v2;
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Opt"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v2, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v2, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v3, "addObject:", v5);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v5, "objectAtIndex:", 1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v6);

        }
      }

      ++v4;
    }
    while (objc_msgSend(v2, "count") > v4);
  }

  return (NSArray *)v3;
}

- (void)setChoices:(NSArray *)choices
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char isKindOfClass;
  id v9;
  unint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSArray *v15;

  v15 = choices;
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Opt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4
    && (v6 = objc_msgSend(v4, "count"), v6 == -[NSArray count](v15, "count"))
    && (objc_msgSend(v5, "objectAtIndex:", 0),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) == 0))
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (objc_msgSend(v5, "count"))
    {
      v10 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v11, "objectAtIndex:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

        -[NSArray objectAtIndex:](v15, "objectAtIndex:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v14);

        objc_msgSend(v9, "addObject:", v12);
        ++v10;
      }
      while (objc_msgSend(v5, "count") > v10);
    }
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v9, CFSTR("/Opt"));

  }
  else
  {
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v15, CFSTR("/Opt"));
  }

}

- (NSArray)values
{
  void *v2;
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Opt"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v2, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v2, "objectAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "objectAtIndex:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v6);

      }
      ++v4;
    }
    while (objc_msgSend(v2, "count") > v4);
  }

  return (NSArray *)v3;
}

- (void)setValues:(NSArray *)values
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSArray *v13;

  v13 = values;
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Opt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (v6 = objc_msgSend(v4, "count"), v6 == -[NSArray count](v13, "count")))
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (objc_msgSend(v5, "count"))
    {
      v8 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        -[NSArray objectAtIndex:](v13, "objectAtIndex:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v11);

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "addObject:", v9);
        }
        else
        {
          objc_msgSend(v9, "objectAtIndex:", 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v12);

        }
        objc_msgSend(v7, "addObject:", v10);

        ++v8;
      }
      while (objc_msgSend(v5, "count") > v8);
    }
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v7, CFSTR("/Opt"));

  }
  else
  {
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v13, CFSTR("/Opt"));
  }

}

- (id)_textForValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  int v12;
  id v13;

  v4 = a3;
  -[PDFAnnotation choices](self, "choices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation values](self, "values");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  v8 = objc_msgSend(v6, "count");
  if (!v8)
    goto LABEL_9;
  v9 = v8;
  v10 = 0;
  while (1)
  {
    objc_msgSend(v7, "objectAtIndex:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", v4);

    if (v12)
      break;
    if (v9 == ++v10)
      goto LABEL_9;
  }
  if (objc_msgSend(v5, "count") <= v10
    || (objc_msgSend(v5, "objectAtIndex:", v10), (v13 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_9:
    v13 = v4;
  }

  return v13;
}

- (PDFWidgetCellState)buttonWidgetState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PDFWidgetCellState v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PDFWidgetCellState v16;
  void *v18;
  id v19;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("/Widget"))
    && objc_msgSend(v4, "isEqualToString:", CFSTR("/Btn")))
  {
    -[PDFAnnotation widgetOnStateString](self, "widgetOnStateString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/V"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (unint64_t)objc_msgSend(v6, "isEqualToString:", v5);
    -[PDFAnnotation fieldName](self, "fieldName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PDFAnnotation page](self, "page");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = v9;
        objc_msgSend(v9, "document");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = v11;
          objc_msgSend(v11, "formData");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "fieldNamed:", v8);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v7;
            if (v15)
            {
              v19 = v15;
              objc_msgSend(v15, "stringValue");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = (unint64_t)objc_msgSend(v18, "isEqualToString:", v5);

              v15 = v19;
            }

            goto LABEL_14;
          }

        }
      }
    }
    v16 = v7;
LABEL_14:

    goto LABEL_15;
  }
  v16 = kPDFWidgetMixedState;
LABEL_15:

  return v16;
}

- (void)setButtonWidgetState:(PDFWidgetCellState)buttonWidgetState
{
  void *v5;
  uint64_t v6;
  __CFString *v7;
  id v8;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/FT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("/Widget"))
    && objc_msgSend(v5, "isEqualToString:", CFSTR("/Btn"))
    && -[PDFAnnotation widgetControlType](self, "widgetControlType"))
  {
    if (buttonWidgetState)
    {
      -[PDFAnnotation widgetOnStateString](self, "widgetOnStateString");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
        v7 = (__CFString *)v6;
      else
        v7 = CFSTR("Yes");
      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v7, CFSTR("/V"));

    }
    else
    {
      -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", CFSTR("Off"), CFSTR("/V"));
    }
    if (-[PDFAnnotation isFullyConstructed](self, "isFullyConstructed"))
      -[PDFAnnotation updateFormData](self, "updateFormData");
  }

}

- (void)setButtonWidgetStateString:(NSString *)buttonWidgetStateString
{
  id v4;

  v4 = (id)-[NSString copy](buttonWidgetStateString, "copy");
  -[PDFAnnotation setWidgetOnStateString:](self, "setWidgetOnStateString:", v4);

}

- (BOOL)isOpen
{
  void *v2;
  void *v3;
  char v4;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Open"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setOpen:(BOOL)open
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", open);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/Open"));

}

- (NSArray)paths
{
  return (NSArray *)-[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/InkList"));
}

- (PDFDestination)destination
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("/Link")))
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/A"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v4, "destination");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Dest"));
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v5;
LABEL_9:

    goto LABEL_10;
  }
  v6 = 0;
LABEL_10:

  return (PDFDestination *)v6;
}

- (void)setDestination:(PDFDestination *)destination
{
  void *v4;
  PDFDestination *v5;

  v5 = destination;
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("/Link")))
  {
    -[PDFAnnotation removeValueForAnnotationKey:](self, "removeValueForAnnotationKey:", CFSTR("/A"));
    -[PDFAnnotation removeValueForAnnotationKey:](self, "removeValueForAnnotationKey:", CFSTR("/Dest"));
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v5, CFSTR("/Dest"));
  }

}

- (NSURL)URL
{
  void *v3;
  void *v4;
  void *v5;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("/Link")))
  {
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/A"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v4, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return (NSURL *)v5;
}

- (void)setURL:(NSURL *)URL
{
  void *v4;
  void *v5;
  void *v6;
  PDFActionURL *v7;
  NSURL *v8;

  v8 = URL;
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Subtype"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("/Link")))
  {
    -[PDFAnnotation removeValueForAnnotationKey:](self, "removeValueForAnnotationKey:", CFSTR("/A"));
    -[PDFAnnotation removeValueForAnnotationKey:](self, "removeValueForAnnotationKey:", CFSTR("/Dest"));
    v5 = (void *)-[NSURL copy](v8, "copy");
    -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/A"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v6, "setURL:", v5);
    }
    else
    {
      v7 = -[PDFActionURL initWithURL:]([PDFActionURL alloc], "initWithURL:", v5);

      v6 = v7;
    }
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v6, CFSTR("/A"));

  }
}

- (NSString)fieldName
{
  return (NSString *)-[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/T"));
}

- (void)setFieldName:(NSString *)fieldName
{
  id v4;

  v4 = (id)-[NSString copy](fieldName, "copy");
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/T"));

}

- (NSString)caption
{
  void *v2;
  void *v3;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/MK"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "caption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCaption:(NSString *)caption
{
  PDFAppearanceCharacteristics *v4;
  id v5;

  v5 = (id)-[NSString copy](caption, "copy");
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/MK"));
  v4 = (PDFAppearanceCharacteristics *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(PDFAppearanceCharacteristics);
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/MK"));
  }
  -[PDFAppearanceCharacteristics setCaption:](v4, "setCaption:", v5);
  -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");

}

- (UIColor)backgroundColor
{
  void *v2;
  void *v3;

  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/MK"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  PDFAppearanceCharacteristics *v4;
  id v5;

  v5 = (id)-[UIColor copy](backgroundColor, "copy");
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/MK"));
  v4 = (PDFAppearanceCharacteristics *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(PDFAppearanceCharacteristics);
    -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/MK"));
  }
  -[PDFAppearanceCharacteristics setBackgroundColor:](v4, "setBackgroundColor:", v5);
  -[PDFAnnotation updateAnnotationEffect](self, "updateAnnotationEffect");

}

- (NSString)stampName
{
  return (NSString *)-[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/Name"));
}

- (void)setStampName:(NSString *)stampName
{
  id v4;

  v4 = (id)-[NSString copy](stampName, "copy");
  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v4, CFSTR("/Name"));

}

+ (PDFLineStyle)lineStyleFromName:(NSString *)name
{
  NSString *v3;
  PDFLineStyle v4;

  v3 = name;
  if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("/Square")))
  {
    v4 = kPDFLineStyleSquare;
  }
  else if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("/Circle")))
  {
    v4 = kPDFLineStyleCircle;
  }
  else if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("/Diamond")))
  {
    v4 = kPDFLineStyleDiamond;
  }
  else if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("/OpenArrow")))
  {
    v4 = kPDFLineStyleOpenArrow;
  }
  else if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("/ClosedArrow")))
  {
    v4 = kPDFLineStyleClosedArrow;
  }
  else
  {
    v4 = kPDFLineStyleNone;
  }

  return v4;
}

+ (NSString)nameForLineStyle:(PDFLineStyle)style
{
  if ((unint64_t)(style - 1) > 4)
    return (NSString *)CFSTR("/None");
  else
    return &off_24C25D660[style - 1]->isa;
}

- (void)addBezierPath:(UIBezierPath *)path
{
  UIBezierPath *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = path;
  -[PDFAnnotation pathLock](self, "pathLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (void *)MEMORY[0x24BDBCEB8];
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/InkList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PDFAnnotation releaseCGPathArray](self, "releaseCGPathArray");
  objc_msgSend(v9, "addObject:", v4);

  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v9, CFSTR("/InkList"));
  -[PDFAnnotation pathLock](self, "pathLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (void)removeBezierPath:(UIBezierPath *)path
{
  UIBezierPath *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = path;
  -[PDFAnnotation pathLock](self, "pathLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (void *)MEMORY[0x24BDBCEB8];
  -[PDFAnnotation valueForAnnotationKey:](self, "valueForAnnotationKey:", CFSTR("/InkList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PDFAnnotation releaseCGPathArray](self, "releaseCGPathArray");
  objc_msgSend(v9, "removeObject:", v4);

  -[PDFAnnotation setValue:forAnnotationKey:](self, "setValue:forAnnotationKey:", v9, CFSTR("/InkList"));
  -[PDFAnnotation pathLock](self, "pathLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

@end
