@implementation AKToolController

- (AKToolController)initWithController:(id)a3
{
  id v4;
  AKToolController *v5;
  AKToolController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKToolController;
  v5 = -[AKToolController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AKToolController setController:](v5, "setController:", v4);
    v6->_toolMode = -1;
    -[AKToolController setToolMode:](v6, "setToolMode:", 0);
    if (+[AKController canConnectToStylus](AKController, "canConnectToStylus"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__peripheralAvailabilityDidUpdate_, CFSTR("AKPeripheralAvailabilityManagerAvailabilityNotification"), 0);

    }
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)AKToolController;
  -[AKToolController dealloc](&v4, sel_dealloc);
}

- (void)performToolActionForSender:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  AKToolController *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  v4 = objc_msgSend(v17, "tag");
  -[AKToolController controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || objc_msgSend(v6, "requestPermissionForController:toPerformActionFromSender:", v5, v4))
  {
    switch(v4)
    {
      case 764015:
        if (-[AKToolController toolMode](self, "toolMode") == 1)
          goto LABEL_14;
        v7 = self;
        v8 = 1;
        goto LABEL_16;
      case 764016:
        if (-[AKToolController toolMode](self, "toolMode") == 2)
          goto LABEL_14;
        v7 = self;
        v8 = 2;
        goto LABEL_16;
      case 764017:
        if (-[AKToolController toolMode](self, "toolMode") == 4)
        {
LABEL_14:
          v7 = self;
          v8 = 0;
        }
        else
        {
          v7 = self;
          v8 = 4;
        }
LABEL_16:
        -[AKToolController setToolMode:](v7, "setToolMode:", v8);
        break;
      case 764018:
      case 764019:
      case 764020:
      case 764021:
        goto LABEL_7;
      case 764022:
        break;
      default:
        if (v4 != 764064)
        {
LABEL_7:
          if (objc_msgSend(v17, "tag") != 764066)
          {
            if ((unint64_t)(v4 - 764050) > 7)
            {
              switch(v4)
              {
                case 764058:
                  goto LABEL_17;
                case 764061:
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                  {
                    objc_msgSend(v6, "undoManagerForAnnotationController:", v5);
                    v12 = (void *)objc_claimAutoreleasedReturnValue();
                    v13 = v12;
                    goto LABEL_38;
                  }
                  break;
                case 764062:
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                  {
                    objc_msgSend(v6, "undoManagerForAnnotationController:", v5);
                    v13 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "registerUndoWithTarget:selector:object:", v6, sel_rotateLeft_, self);
                    objc_msgSend(v6, "rotateRight:", v5);
                    goto LABEL_43;
                  }
                  break;
                case 764063:
                  objc_msgSend(v6, "undoManagerForAnnotationController:", v5);
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                  {
                    v12 = v13;
LABEL_38:
                    objc_msgSend(v12, "registerUndoWithTarget:selector:object:", v6, sel_rotateRight_, self);
                    objc_msgSend(v6, "rotateLeft:", v5);
                  }
                  goto LABEL_43;
                default:
                  objc_msgSend(v5, "setCreationCascadingMultiplier:", 0);
                  if (v4 == 764060)
                  {
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                      objc_msgSend(v6, "controller:performActionForMode:fromSender:withAttribute:onPageAtIndex:", v5, -[AKToolController toolMode](self, "toolMode"), 764060, 763000, objc_msgSend(v5, "currentPageIndex"));
                  }
                  else
                  {
                    -[AKToolController _defaultCenterForNewAnnotation](self, "_defaultCenterForNewAnnotation");
                    -[AKToolController createAnnotationOfType:centeredAtPoint:](self, "createAnnotationOfType:centeredAtPoint:", v4);
                    v13 = (void *)objc_claimAutoreleasedReturnValue();
                    -[AKToolController addNewAnnotation:onPageController:shouldSelect:shouldCascade:](self, "addNewAnnotation:onPageController:shouldSelect:shouldCascade:", v13, 0, 1, 1);
LABEL_43:

                  }
                  break;
              }
            }
            else
            {
              objc_msgSend(v5, "attributeController");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v10 = v9;
              if (v4 == 764050)
                v11 = objc_msgSend(v9, "highlightStyle");
              else
                v11 = +[AKUserInterfaceItemHelper highlightAttributeTagFromHighlightToolTag:](AKUserInterfaceItemHelper, "highlightAttributeTagFromHighlightToolTag:", v4);
              v14 = v11;
              if ((objc_opt_respondsToSelector() & 1) == 0
                || (objc_msgSend(v6, "hasHighlightableSelectionForAnnotationController:", v5) & 1) == 0)
              {
                v15 = -[AKToolController toolMode](self, "toolMode");
                if (v15 != 3 || v4 == 764050)
                {
                  if (v15 == 3)
                    v16 = 0;
                  else
                    v16 = 3;
                  -[AKToolController setToolMode:](self, "setToolMode:", v16);
                }
                objc_msgSend(v10, "setHighlightStyle:", v14);
              }
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v6, "controller:performActionForMode:fromSender:withAttribute:onPageAtIndex:", v5, -[AKToolController toolMode](self, "toolMode"), v4, v14, objc_msgSend(v5, "currentPageIndex"));

            }
          }
        }
        break;
    }
  }
LABEL_17:

}

- (id)createAnnotationOfType:(int64_t)a3 centeredAtPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat width;
  CGFloat height;
  double MinX;
  double MaxX;
  double MidX;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  CGFloat v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  NSObject *v76;
  uint64_t v77;
  uint64_t v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  y = a4.y;
  x = a4.x;
  -[AKToolController controller](self, "controller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolController _modelBaseScaleFactorForNewAnnotation](self, "_modelBaseScaleFactorForNewAnnotation");
  v10 = 0;
  v12 = v11;
  switch(a3)
  {
    case 764000:
    case 764001:
      v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      objc_opt_self();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKToolController _defaultFillColorForAnnotationOfClass:](self, "_defaultFillColorForAnnotationOfClass:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFillColor:", v23);

      -[AKToolController _strokeWidthForNewAnnotation](self, "_strokeWidthForNewAnnotation");
      objc_msgSend(v10, "setStrokeWidth:");
      -[AKToolController _strokeColorForNewAnnotation](self, "_strokeColorForNewAnnotation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStrokeColor:", v24);

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      if (a3 == 764001)
        objc_msgSend(v10, "setCornerRadius:", v12 * 20.0);
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
      -[AKToolController _defaultTypingAttributes](self, "_defaultTypingAttributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTypingAttributes:", v25);

      goto LABEL_27;
    case 764002:
    case 764013:
      v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      objc_opt_self();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKToolController _defaultFillColorForAnnotationOfClass:](self, "_defaultFillColorForAnnotationOfClass:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFillColor:", v56);

      -[AKToolController _strokeWidthForNewAnnotation](self, "_strokeWidthForNewAnnotation");
      objc_msgSend(v10, "setStrokeWidth:");
      -[AKToolController _strokeColorForNewAnnotation](self, "_strokeColorForNewAnnotation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStrokeColor:", v57);

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      goto LABEL_16;
    case 764003:
    case 764004:
    case 764005:
      v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setArrowHeadStyle:", -[AKToolController _arrowStyleForToolTag:](self, "_arrowStyleForToolTag:", a3));
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      -[AKToolController _strokeWidthForNewAnnotation](self, "_strokeWidthForNewAnnotation");
      objc_msgSend(v10, "setStrokeWidth:");
      -[AKToolController _strokeColorForNewAnnotation](self, "_strokeColorForNewAnnotation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStrokeColor:", v13);

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      v14 = v79.origin.x;
      v15 = v79.origin.y;
      width = v79.size.width;
      height = v79.size.height;
      MinX = CGRectGetMinX(v79);
      v80.origin.x = v14;
      v80.origin.y = v15;
      v80.size.width = width;
      v80.size.height = height;
      objc_msgSend(v10, "setStartPoint:", MinX, CGRectGetMidY(v80));
      v81.origin.x = v14;
      v81.origin.y = v15;
      v81.size.width = width;
      v81.size.height = height;
      MaxX = CGRectGetMaxX(v81);
      v82.origin.x = v14;
      v82.origin.y = v15;
      v82.size.width = width;
      v82.size.height = height;
      objc_msgSend(v10, "setEndPoint:", MaxX, CGRectGetMidY(v82));
      v83.origin.x = v14;
      v83.origin.y = v15;
      v83.size.width = width;
      v83.size.height = height;
      MidX = CGRectGetMidX(v83);
      v84.origin.x = v14;
      v84.origin.y = v15;
      v84.size.width = width;
      v84.size.height = height;
      objc_msgSend(v10, "setMidPoint:", MidX, CGRectGetMidY(v84));
      goto LABEL_17;
    case 764006:
      v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setArrowHeadStyle:", -[AKToolController _arrowStyleForToolTag:](self, "_arrowStyleForToolTag:", 764006));
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      v26 = v85.origin.x;
      v27 = v85.origin.y;
      v28 = v85.size.width;
      v29 = v85.size.height;
      v30 = CGRectGetMinX(v85);
      v86.origin.x = v26;
      v86.origin.y = v27;
      v86.size.width = v28;
      v86.size.height = v29;
      objc_msgSend(v10, "setStartPoint:", v30, CGRectGetMidY(v86));
      v87.origin.x = v26;
      v87.origin.y = v27;
      v87.size.width = v28;
      v87.size.height = v29;
      v31 = CGRectGetMaxX(v87);
      v88.origin.x = v26;
      v88.origin.y = v27;
      v88.size.width = v28;
      v88.size.height = v29;
      objc_msgSend(v10, "setEndPoint:", v31, CGRectGetMidY(v88));
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      -[AKToolController _strokeWidthForNewAnnotation](self, "_strokeWidthForNewAnnotation");
      objc_msgSend(v10, "setStrokeWidth:");
      -[AKToolController _strokeColorForNewAnnotation](self, "_strokeColorForNewAnnotation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStrokeColor:", v32);

      objc_opt_self();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKToolController _defaultFillColorForAnnotationOfClass:](self, "_defaultFillColorForAnnotationOfClass:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFillColor:", v34);

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      objc_msgSend(v10, "setArrowHeadWidth:", v12 * 80.0);
      objc_msgSend(v10, "setArrowLineWidth:", v12 * 40.0);
      objc_msgSend(v10, "setArrowHeadLength:", v12 * 40.0);
      goto LABEL_17;
    case 764007:
      v10 = (id)objc_opt_new();
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
      objc_msgSend(v10, "rectangle");
      v35 = CGRectGetMinX(v89) + v12 * -10.0;
      objc_msgSend(v10, "rectangle");
      objc_msgSend(v10, "setPointyBitPoint:", v35, CGRectGetMinY(v90) + v12 * -10.0);
      objc_opt_self();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKToolController _defaultFillColorForAnnotationOfClass:](self, "_defaultFillColorForAnnotationOfClass:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFillColor:", v37);

      -[AKToolController _strokeColorForNewAnnotation](self, "_strokeColorForNewAnnotation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStrokeColor:", v38);

      -[AKToolController _strokeWidthForNewAnnotation](self, "_strokeWidthForNewAnnotation");
      objc_msgSend(v10, "setStrokeWidth:");
      objc_msgSend(v8, "attributeController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDashed:", objc_msgSend(v39, "strokeIsDashed"));

      objc_msgSend(v8, "attributeController");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v40, "brushStyle"));

      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      objc_msgSend(v10, "setPointyBitBaseWidthAngle:", 25.0);
      goto LABEL_17;
    case 764008:
      v10 = (id)objc_opt_new();
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      objc_opt_self();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKToolController _defaultFillColorForAnnotationOfClass:](self, "_defaultFillColorForAnnotationOfClass:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFillColor:", v42);

      -[AKToolController _strokeWidthForNewAnnotation](self, "_strokeWidthForNewAnnotation");
      objc_msgSend(v10, "setStrokeWidth:");
      -[AKToolController _strokeColorForNewAnnotation](self, "_strokeColorForNewAnnotation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStrokeColor:", v43);

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      objc_msgSend(v10, "setPointCount:", 5);
      +[AKStarAnnotationRenderer defaultInnerRadiusForStar:](AKStarAnnotationRenderer, "defaultInnerRadiusForStar:", v10);
      objc_msgSend(v10, "setInnerRadiusFactor:");
      goto LABEL_17;
    case 764009:
      v10 = (id)objc_opt_new();
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      objc_opt_self();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKToolController _defaultFillColorForAnnotationOfClass:](self, "_defaultFillColorForAnnotationOfClass:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFillColor:", v45);

      -[AKToolController _strokeWidthForNewAnnotation](self, "_strokeWidthForNewAnnotation");
      objc_msgSend(v10, "setStrokeWidth:");
      -[AKToolController _strokeColorForNewAnnotation](self, "_strokeColorForNewAnnotation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStrokeColor:", v46);

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      objc_msgSend(v10, "setPointCount:", 6);
      goto LABEL_17;
    case 764010:
      v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      -[AKToolController _strokeWidthForNewAnnotation](self, "_strokeWidthForNewAnnotation");
      objc_msgSend(v10, "setStrokeWidth:");
      -[AKToolController _strokeColorForNewAnnotation](self, "_strokeColorForNewAnnotation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStrokeColor:", v47);

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      objc_opt_self();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKToolController _defaultFillColorForAnnotationOfClass:](self, "_defaultFillColorForAnnotationOfClass:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFillColor:", v49);

LABEL_16:
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
LABEL_17:
      -[AKToolController _defaultTypingAttributes](self, "_defaultTypingAttributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTypingAttributes:", v21);
      goto LABEL_18;
    case 764011:
      v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      -[AKToolController _strokeWidthForNewAnnotation](self, "_strokeWidthForNewAnnotation");
      objc_msgSend(v10, "setStrokeWidth:");
      -[AKToolController _strokeColorForNewAnnotation](self, "_strokeColorForNewAnnotation");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStrokeColor:", v50);

      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      objc_opt_self();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKToolController _defaultFillColorForAnnotationOfClass:](self, "_defaultFillColorForAnnotationOfClass:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFillColor:", v52);

      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
      objc_msgSend(v10, "fillColor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKToolController _defaultHeartTypingAttributesWithFillColor:](self, "_defaultHeartTypingAttributesWithFillColor:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTypingAttributes:", v54);
      goto LABEL_24;
    case 764012:
    case 764015:
    case 764016:
    case 764017:
      goto LABEL_28;
    case 764014:
      v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setFillColor:", 0);
      objc_msgSend(v10, "setStrokeWidth:", 0.0);
      objc_msgSend(v8, "attributeController");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v58, "brushStyle"));

      objc_msgSend(v10, "setDashed:", 0);
      -[AKToolController _defaultTextBoxTypingAttributes](self, "_defaultTextBoxTypingAttributes");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTypingAttributes:", v59);

      objc_msgSend(v10, "typingAttributes");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectForKeyedSubscript:", *MEMORY[0x24BDF6600]);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStrokeColor:", v61);

      v62 = 100.0;
      v63 = 0.0;
      v64 = 0.0;
      v65 = v10;
      v66 = 100.0;
      goto LABEL_22;
    case 764018:
      v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setHasShadow:", objc_msgSend(v9, "hasShadow"));
      -[AKToolController _strokeWidthForNewAnnotation](self, "_strokeWidthForNewAnnotation");
      objc_msgSend(v10, "setStrokeWidth:");
      objc_msgSend(v10, "setDashed:", objc_msgSend(v9, "strokeIsDashed"));
      objc_msgSend(v10, "setBrushStyle:", objc_msgSend(v9, "brushStyle"));
      -[AKToolController _strokeColorForNewAnnotation](self, "_strokeColorForNewAnnotation");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStrokeColor:", v67);

      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      v65 = v10;
LABEL_22:
      objc_msgSend(v65, "setRectangle:", v63, v64, v62, v66);
      goto LABEL_27;
    case 764019:
      objc_msgSend(v8, "signatureModelController");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "selectedSignature");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (id)objc_opt_new();
      objc_msgSend(v10, "setSignature:", v53);
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStrokeColor:", v54);
LABEL_24:

      goto LABEL_28;
    case 764020:
      v10 = (id)objc_opt_new();
      -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
      objc_msgSend(v10, "setRectangle:");
      objc_msgSend(MEMORY[0x24BDF6950], "akColorWithWhite:alpha:", 0.0, 0.5);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setStrokeColor:", v69);

      objc_msgSend(v10, "setMagnification:", 2.0);
      objc_msgSend(v10, "setStrokeWidth:", v12 * 2.5);
      objc_msgSend(v10, "setBrushStyle:", 0);
      objc_msgSend(v10, "setDashed:", 0);
      objc_msgSend(v10, "setHasShadow:", 0);
      goto LABEL_27;
    case 764021:
      v70 = (void *)objc_opt_new();
      v71 = *MEMORY[0x24BDBF028];
      v72 = *(double *)(MEMORY[0x24BDBF028] + 8);
      v73 = *(double *)(MEMORY[0x24BDBF028] + 16);
      v74 = *(double *)(MEMORY[0x24BDBF028] + 24);
      v10 = v70;
      objc_msgSend(v10, "setRectangle:", v71, v72, v73, v74);
      objc_msgSend(v10, "setFillColor:", 0);
LABEL_27:

      goto LABEL_28;
    default:
      if (a3 == 764050)
      {
        v76 = os_log_create("com.apple.annotationkit", "Tool Controller");
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
          sub_22907FDC4(v76);

        v10 = (id)objc_opt_new();
        v77 = objc_msgSend(v9, "highlightStyle");
        if ((unint64_t)(v77 - 765200) > 6)
        {
          v21 = 0;
          v78 = 0;
        }
        else
        {
          v78 = qword_229092EC0[v77 - 765200];
          +[AKHighlightAppearanceHelper colorForHighlightAttributeWithTag:](AKHighlightAppearanceHelper, "colorForHighlightAttributeWithTag:", v77);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v10, "setColor:", v21);
        objc_msgSend(v10, "setStyle:", v78);
LABEL_18:

      }
      else
      {
        if (a3 != 764060)
          goto LABEL_28;
        v10 = (id)objc_opt_new();
        -[AKToolController _defaultRectangleForNewAnnotation:centeredAtPoint:](self, "_defaultRectangleForNewAnnotation:centeredAtPoint:", v10, x, y);
        objc_msgSend(v10, "setRectangle:");
        +[AKHighlightAppearanceHelper colorForNoteOfHighlightAttributeTag:](AKHighlightAppearanceHelper, "colorForNoteOfHighlightAttributeTag:", objc_msgSend(v9, "highlightStyle"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setFillColor:", v21);
      }

LABEL_28:
      return v10;
  }
}

- (void)addNewAnnotation:(id)a3 onPageController:(id)a4 shouldSelect:(BOOL)a5 shouldCascade:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  double v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  id v33;
  _QWORD v34[2];

  v6 = a6;
  v32 = a5;
  v34[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  -[AKToolController controller](self, "controller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    v13 = v10;
  }
  else
  {
    objc_msgSend(v11, "currentPageController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  objc_msgSend(v13, "pageModelController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "author");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    objc_msgSend(v9, "author");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(v12, "author");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAuthor:", v20);

    }
  }
  objc_msgSend(v9, "modificationDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setModificationDate:", v22);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !objc_msgSend(v16, "controller:shouldPlaceSingleShotAnnotation:onProposedPageModelController:", v12, v9, v15))
  {
    v23 = v15;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v33 = v15;
      objc_msgSend(v16, "controller:willPlaceSingleShotAnnotation:onProposedPageModelController:", v12, v9, &v33);
      v23 = v33;

      objc_msgSend(v14, "pageModelController");
      v24 = (id)objc_claimAutoreleasedReturnValue();

      if (v24 != v23)
      {
        objc_msgSend(v12, "pageControllerForPageModelController:", v23);
        v25 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v25;
      }
    }
    else
    {
      v23 = v15;
    }
    objc_msgSend(v9, "originalModelBaseScaleFactor");
    if (v26 == 0.0)
    {
      -[AKToolController _modelBaseScaleFactorForNewAnnotation](self, "_modelBaseScaleFactorForNewAnnotation");
      objc_msgSend(v9, "setOriginalModelBaseScaleFactor:");
      v27 = v6;
    }
    else
    {
      v27 = 0;
    }
    if (!objc_msgSend(v9, "originalExifOrientation"))
    {
      objc_msgSend(v9, "setOriginalExifOrientation:", objc_msgSend(v14, "currentModelToScreenExifOrientation"));
      objc_msgSend(v9, "adjustModelToCompensateForOriginalExif");
      if (v27)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[AKToolController _setRectangleToFitTextOnTextAnnotation:](self, "_setRectangleToFitTextOnTextAnnotation:", v9);
      }
    }
    if (v6)
    {
      v28 = (void *)objc_opt_class();
      v34[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "cascadeAnnotations:onPageController:forPaste:", v29, v14, 0);

    }
    objc_msgSend(v23, "mutableArrayValueForKey:", CFSTR("annotations"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v9);
    objc_msgSend(v12, "modelController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "deselectAllAnnotations");

    if (v32)
    {
      objc_msgSend(v12, "setCurrentPageIndex:", objc_msgSend(v14, "pageIndex"));
      objc_msgSend(v23, "selectAnnotation:byExtendingSelection:", v9, 0);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v16, "controller:didPlaceSingleShotAnnotation:onPageModelController:", v12, v9, v23);

  }
}

+ (void)cascadeAnnotations:(id)a3 onPageController:(id)a4 forPaste:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  unint64_t v34;
  double v35;
  double v36;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double MinX;
  double MaxX;
  double v45;
  double MinY;
  double MaxY;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  _QWORD rect[5];
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;
  CGPoint v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v5 = a5;
  v57 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v5)
  {
    objc_msgSend(v9, "lastCreationCascadingPageController");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 != v8)
    {
      objc_msgSend(v10, "setLastCreationCascadingPageController:", v8);
      objc_msgSend(v10, "setCreationCascadingMultiplier:", 0);
    }
  }
  objc_msgSend(v8, "overlayView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(v8, "convertRectFromOverlayToModel:", v14, v16, v18, v20);
  rect[0] = v21;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  memset(&rect[1], 0, 32);
  v54 = 0u;
  v55 = 0u;
  v28 = v7;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &rect[1], v56, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)rect[3];
    v51 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v52 = *MEMORY[0x24BDBF090];
    v49 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v50 = *(double *)(MEMORY[0x24BDBF090] + 16);
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)rect[3] != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(rect[2] + 8 * i);
        if (!v5)
        {
          v34 = objc_msgSend(v10, "creationCascadingMultiplier");
          if (!v34)
            goto LABEL_14;
LABEL_13:
          v35 = (double)v34;
          objc_msgSend(v8, "modelBaseScaleFactor");
          +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v8, v36 * v35 * 10.0, v36 * v35 * -10.0, v52, v51, v50, v49);
          objc_msgSend(v33, "translateBy:");
          goto LABEL_14;
        }
        v34 = objc_msgSend(v10, "pasteCascadingMultiplier");
        if (v34)
          goto LABEL_13;
LABEL_14:
        objc_msgSend(v33, "drawingBounds");
        x = v59.origin.x;
        y = v59.origin.y;
        width = v59.size.width;
        height = v59.size.height;
        MidX = CGRectGetMidX(v59);
        v60.origin.x = x;
        v60.origin.y = y;
        v60.size.width = width;
        v60.size.height = height;
        MidY = CGRectGetMidY(v60);
        *(_QWORD *)&v61.origin.x = rect[0];
        v61.origin.y = v23;
        v61.size.width = v25;
        v61.size.height = v27;
        v58.x = MidX;
        v58.y = MidY;
        if (!CGRectContainsPoint(v61, v58))
        {
          *(_QWORD *)&v62.origin.x = rect[0];
          v62.origin.y = v23;
          v62.size.width = v25;
          v62.size.height = v27;
          MinX = CGRectGetMinX(v62);
          *(_QWORD *)&v63.origin.x = rect[0];
          v63.origin.y = v23;
          v63.size.width = v25;
          v63.size.height = v27;
          MaxX = CGRectGetMaxX(v63);
          if (MidX <= MaxX)
            MaxX = MidX;
          if (MidX >= MinX)
            v45 = MaxX;
          else
            v45 = MinX;
          *(_QWORD *)&v64.origin.x = rect[0];
          v64.origin.y = v23;
          v64.size.width = v25;
          v64.size.height = v27;
          MinY = CGRectGetMinY(v64);
          *(_QWORD *)&v65.origin.x = rect[0];
          v65.origin.y = v23;
          v65.size.width = v25;
          v65.size.height = v27;
          MaxY = CGRectGetMaxY(v65);
          if (MidY <= MaxY)
            MaxY = MidY;
          if (MidY >= MinY)
            v48 = MaxY;
          else
            v48 = MinY;
          objc_msgSend(v33, "translateBy:", v45 - MidX, v48 - MidY);
        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &rect[1], v56, 16);
    }
    while (v30);
  }

  if (v5)
    objc_msgSend(v10, "setPasteCascadingMultiplier:", objc_msgSend(v10, "pasteCascadingMultiplier") + 1);
  else
    objc_msgSend(v10, "setCreationCascadingMultiplier:", objc_msgSend(v10, "creationCascadingMultiplier") + 1);

}

- (void)setToolMode:(unint64_t)a3
{
  char v5;
  void *v6;
  void *v7;
  unint64_t toolMode;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
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

  if (self->_toolMode != a3)
  {
    -[AKToolController controller](self, "controller");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v24, "isTornDown");
    v6 = v24;
    if ((v5 & 1) != 0)
    {
LABEL_33:

      return;
    }
    objc_msgSend(v24, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "controllerWillEnterToolMode:", v24);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "controllerWillExitToolMode:", v24);
    }
    toolMode = self->_toolMode;
    if (toolMode - 1 < 2)
    {
      objc_msgSend(v24, "legacyDoodleController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeOverlay");
    }
    else if (toolMode - 4 >= 2)
    {
      v10 = v24;
      if (toolMode)
      {
LABEL_15:
        self->_toolMode = a3;
        switch(a3)
        {
          case 0uLL:
            v12 = objc_msgSend(v10, "supportForPencilAlwaysDrawsSatisfied");
            -[AKToolController setAllInkEnabled:](self, "setAllInkEnabled:", 0);
            if (v12)
            {
              -[AKToolController setPencilInkEnabled:](self, "setPencilInkEnabled:", 1);
              objc_msgSend(v24, "attributeController");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "resetToLastDrawingInk");

            }
            else
            {
              -[AKToolController setPencilInkEnabled:](self, "setPencilInkEnabled:", 0);
            }
            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "postNotificationName:object:", CFSTR("AKToolController.inkToolStatusUpdated"), self);
            goto LABEL_26;
          case 1uLL:
            v14 = objc_msgSend(v10, "shouldDrawVariableStrokeDoodles");
            objc_msgSend(v24, "legacyDoodleController");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setPressureSensitiveDoodleMode:", v14);

            goto LABEL_20;
          case 2uLL:
            objc_msgSend(v10, "legacyDoodleController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setPressureSensitiveDoodleMode:", 1);

LABEL_20:
            objc_msgSend(v24, "legacyDoodleController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "showOverlay");
            goto LABEL_26;
          case 4uLL:
            -[AKToolController setAllInkEnabled:](self, "setAllInkEnabled:", 1);
            -[AKToolController setPencilInkEnabled:](self, "setPencilInkEnabled:", 1);
            objc_msgSend(v24, "attributeController");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "ink");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
            {
              objc_msgSend(v24, "attributeController");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setDefaultInk");

            }
            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "postNotificationName:object:", CFSTR("AKToolController.inkToolStatusUpdated"), self);

            objc_msgSend(v24, "modelController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "deselectAllAnnotations");
LABEL_26:

            v10 = v24;
            break;
          default:
            break;
        }
        objc_msgSend(v10, "toolbarViewController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "revalidateItems");
        objc_msgSend(v24, "modernToolbarView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "revalidateItems");
        if (a3)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "controllerDidEnterToolMode:", v24);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v7, "controllerDidExitToolMode:", v24);
        }

        v6 = v24;
        goto LABEL_33;
      }
      objc_msgSend(v24, "textEditorController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "endEditing");

      objc_msgSend(v24, "modelController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deselectAllAnnotations");
    }
    else
    {
      -[AKToolController setAllInkEnabled:](self, "setAllInkEnabled:", 0);
      -[AKToolController setPencilInkEnabled:](self, "setPencilInkEnabled:", 0);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:", CFSTR("AKToolController.inkToolStatusUpdated"), self);
    }

    v10 = v24;
    goto LABEL_15;
  }
}

- (BOOL)isToolSenderEnabled:(id)a3
{
  return 1;
}

- (void)updateToolSenderState:(id)a3 enabled:(BOOL)a4
{
  id v5;
  BOOL v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "tag") == 764015)
  {
    v5 = v8;
    v6 = -[AKToolController toolMode](self, "toolMode") == 1;
  }
  else if (objc_msgSend(v8, "tag") == 764016)
  {
    v5 = v8;
    v6 = -[AKToolController toolMode](self, "toolMode") == 2;
  }
  else
  {
    if (objc_msgSend(v8, "tag") != 764017)
    {
      objc_msgSend(v8, "tag");
      goto LABEL_11;
    }
    v5 = v8;
    v6 = -[AKToolController toolMode](self, "toolMode") == 4;
  }
  v7 = v6;
  objc_msgSend(v5, "setSelected:", v7);

LABEL_11:
}

- (BOOL)isInDefaultMode
{
  unint64_t v3;

  v3 = -[AKToolController toolMode](self, "toolMode");
  return v3 == -[AKToolController defaultToolMode](self, "defaultToolMode");
}

- (void)resetToDefaultMode
{
  int v3;
  void *v4;
  int v5;

  if (-[AKToolController isInDefaultMode](self, "isInDefaultMode"))
  {
    v3 = -[AKToolController pencilInkEnabled](self, "pencilInkEnabled");
    -[AKToolController controller](self, "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportForPencilAlwaysDrawsSatisfied");

    if (v3 == v5)
      return;
    self->_toolMode = -1;
  }
  -[AKToolController setToolMode:](self, "setToolMode:", -[AKToolController defaultToolMode](self, "defaultToolMode"));
}

- (unint64_t)defaultToolMode
{
  return 0;
}

- (double)_modelBaseScaleFactorForNewAnnotation
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[AKToolController controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "modelBaseScaleFactor");
  v5 = v4;

  return v5;
}

- (double)_strokeWidthForNewAnnotation
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  -[AKToolController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "strokeWidth");
  v6 = v5;

  if (v6 > 1.0001)
  {
    -[AKToolController _modelBaseScaleFactorForNewAnnotation](self, "_modelBaseScaleFactorForNewAnnotation");
    v6 = v6 * v7;
  }

  return v6;
}

- (id)_strokeColorForNewAnnotation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[AKToolController controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pageModelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedAnnotations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "anyObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "conformsToAKStrokedAnnotationProtocol"))
    {
      objc_msgSend(v7, "strokeColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }

  }
  objc_msgSend(v5, "ink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v5, "strokeColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v5, "ink");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorWithAlphaComponent:", 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
LABEL_9:

  return v8;
}

- (CGRect)_centerBounds:(CGRect)result atPoint:(CGPoint)a4
{
  double v4;
  double v5;

  v4 = a4.x - result.size.width * 0.5;
  v5 = a4.y - result.size.height * 0.5;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGPoint)_defaultCenterForNewAnnotation
{
  void *v2;
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  double v10;
  double v11;
  CGPoint result;
  CGRect v13;
  CGRect v14;

  -[AKToolController controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentPageController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleRectOfOverlay");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MidY = CGRectGetMidY(v14);

  v10 = MidX;
  v11 = MidY;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGRect)_defaultRectangleForNewAnnotation:(id)a3 centeredAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat width;
  CGFloat height;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  char isKindOfClass;
  CGRect v55;
  CGRect v56;
  CGRect result;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[AKToolController _modelBaseScaleFactorForNewAnnotation](self, "_modelBaseScaleFactorForNewAnnotation");
  v9 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AKToolController controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentPageController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "maxPageRect");
    v14 = sqrt(v12 * v13 / 40.0 / 28800.0);
    v15 = v9 * 400.0 * v14;
    v16 = v9 * 72.0 * v14;
    v17 = v7;
    objc_msgSend(v17, "signature");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "drawing");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "signature");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
    {
      objc_msgSend(v20, "drawing");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v24 = v23;
      v26 = v25;

    }
    else
    {
      v31 = objc_msgSend(v20, "path");

      if (!v31)
      {
        v24 = *MEMORY[0x24BDBF148];
        v26 = *(double *)(MEMORY[0x24BDBF148] + 8);
        goto LABEL_11;
      }
      objc_msgSend(v17, "signature");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "pathBounds");
      v24 = v32;
      v26 = v33;
    }

LABEL_11:
    +[AKGeometryHelper rectForSize:inRect:](AKGeometryHelper, "rectForSize:inRect:", v24, v26, 0.0, 0.0, v15, v16);
    v34 = v55.origin.x;
    v35 = v55.origin.y;
    width = v55.size.width;
    height = v55.size.height;
    v27 = CGRectGetWidth(v55);
    v56.origin.x = v34;
    v56.origin.y = v35;
    v56.size.width = width;
    v56.size.height = height;
    v28 = CGRectGetHeight(v56);

    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = v9 * 175.0;
    v28 = v9 * 131.0;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "size");
    v27 = v29;
    v28 = v30;
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v9 * 120.0;
LABEL_18:
    v27 = v28;
    goto LABEL_13;
  }
  v28 = v9 * 200.0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_18;
  v53 = v9 * 150.0;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v27 = 24.0;
  else
    v27 = v28;
  if ((isKindOfClass & 1) != 0)
    v28 = 24.0;
  else
    v28 = v53;
LABEL_13:
  -[AKToolController controller](self, "controller");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "currentPageController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "overlayView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolController _validatedRect:fitsInVisibleRegionOfOverlayView:ownedByPageController:centeredAtPoint:](self, "_validatedRect:fitsInVisibleRegionOfOverlayView:ownedByPageController:centeredAtPoint:", v40, v39, x - v27 * 0.5, y - v28 * 0.5, v27, v28, x, y);
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;

  v49 = v42;
  v50 = v44;
  v51 = v46;
  v52 = v48;
  result.size.height = v52;
  result.size.width = v51;
  result.origin.y = v50;
  result.origin.x = v49;
  return result;
}

- (CGRect)_validatedRect:(CGRect)a3 fitsInVisibleRegionOfOverlayView:(id)a4 ownedByPageController:(id)a5 centeredAtPoint:(CGPoint)a6
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double Height;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  void *v28;
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
  void *v39;
  CGFloat rect;
  double v42;
  CGFloat v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect result;

  rect = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a5;
  objc_msgSend(v9, "visibleRectOfOverlay");
  objc_msgSend(v9, "convertRectFromModelToOverlay:");
  objc_msgSend(v9, "convertRectFromOverlayToModel:");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v44.origin.x = v11;
  v44.origin.y = v13;
  v44.size.width = v15;
  v44.size.height = v17;
  v18 = CGRectGetWidth(v44);
  v45.origin.x = v11;
  v45.origin.y = v13;
  v45.size.width = v15;
  v45.size.height = v17;
  Height = CGRectGetHeight(v45);
  if (v18 < Height)
    Height = v18;
  if (Height >= 20.0)
    v20 = 5.0;
  else
    v20 = 0.0;
  v46.origin.x = v11;
  v46.origin.y = v13;
  v46.size.width = v15;
  v46.size.height = v17;
  v47 = CGRectInset(v46, v20, v20);
  v21 = v47.origin.x;
  v22 = v47.origin.y;
  v23 = v47.size.width;
  v24 = v47.size.height;
  v42 = CGRectGetWidth(v47);
  v48.origin.x = v21;
  v48.origin.y = v22;
  v48.size.width = v23;
  v48.size.height = v24;
  v25 = CGRectGetHeight(v48);
  v43 = x;
  v49.origin.x = x;
  v26 = y;
  v49.origin.y = y;
  v27 = width;
  v49.size.width = width;
  v49.size.height = rect;
  if (CGRectGetWidth(v49) <= v25
    && (v50.origin.x = v43,
        v50.origin.y = v26,
        v50.size.width = width,
        v50.size.height = rect,
        CGRectGetHeight(v50) <= v42))
  {
    v33 = rect;
    v35 = v26;
    v34 = v43;
  }
  else
  {
    v51.origin.x = v43;
    v51.origin.y = v26;
    v51.size.width = width;
    v51.size.height = rect;
    NSStringFromCGRect(v51);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v52.origin.x = v21;
    v52.origin.y = v22;
    v52.size.width = v23;
    v52.size.height = v24;
    NSStringFromCGRect(v52);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    AKLog(CFSTR("Proposed rect %@ does not fit in visible region %@"));

    if (v42 >= v25)
      v29 = v25;
    else
      v29 = v42;
    v53.origin.x = v43;
    v53.origin.y = v26;
    v53.size.width = width;
    v53.size.height = rect;
    v30 = CGRectGetWidth(v53);
    v54.origin.x = v43;
    v54.origin.y = v26;
    v54.size.width = width;
    v54.size.height = rect;
    v31 = CGRectGetWidth(v54);
    if (v30 >= v31)
      v31 = v30;
    v32 = v29 / v31;
    v55.origin.x = v43;
    v55.origin.y = v26;
    v55.size.width = width;
    v55.size.height = rect;
    v27 = CGRectGetWidth(v55) * v32;
    v56.origin.x = v43;
    v56.origin.y = v26;
    v56.size.width = v27;
    v56.size.height = rect;
    v33 = CGRectGetHeight(v56) * v32;
    v57.origin.x = v43;
    v57.origin.y = v26;
    v57.size.width = v27;
    v57.size.height = v33;
    v34 = a6.x - CGRectGetWidth(v57) * 0.5;
    v58.origin.x = v34;
    v58.origin.y = v26;
    v58.size.width = v27;
    v58.size.height = v33;
    v35 = a6.y - CGRectGetHeight(v58) * 0.5;
  }
  v36 = v34;
  v37 = v27;
  v38 = v33;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v35;
  result.origin.x = v36;
  return result;
}

- (id)_defaultTypingAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AKToolController controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v3, "strokeColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "strokeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDF6600]);

  }
  objc_msgSend(v3, "font");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDF65F8]);

  return v5;
}

- (id)_defaultTextBoxTypingAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AKToolController controller](self, "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v3, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDF65F8]);

  return v5;
}

- (id)_defaultHeartTypingAttributesWithFillColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[AKToolController controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "akIsEqualToColor:", v9);

  if (v10)
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDF6600]);
  objc_msgSend(v6, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDF65F8]);

  return v8;
}

- (id)_defaultFillColorForAnnotationOfClass:(Class)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor", a3);
}

- (void)_setRectangleToFitTextOnTextAnnotation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;

  v4 = a3;
  -[AKToolController controller](self, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPageController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolController _defaultCenterForNewAnnotation](self, "_defaultCenterForNewAnnotation");
  v8 = 0u;
  v9 = 0u;
  LOBYTE(v7) = 0;
  +[AKTextAnnotationRenderHelper getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:](AKTextAnnotationRenderHelper, "getAnnotationRectangle:textBounds:containerSize:exclusionPaths:isTextClipped:forAnnotation:onPageController:orInContext:shouldAlignToPixels:optionalText:optionalCenter:optionalProposedRectangle:", &v8, 0, 0, 0, 0, v4, v6, 0, v7, 0);
  objc_msgSend(v4, "setRectangle:", v8, v9);

}

- (unint64_t)_arrowStyleForToolTag:(int64_t)a3
{
  if ((unint64_t)(a3 - 764003) > 3)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return qword_229092EF8[a3 - 764003];
}

- (void)_peripheralAvailabilityDidUpdate:(id)a3
{
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  id v7;

  -[AKToolController controller](self, "controller", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "peripheralAvailabilityManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentAvailability") == 1;

  objc_msgSend(v7, "legacyDoodleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPressureSensitiveDoodleMode:", v4);

  objc_msgSend(v7, "legacyDoodleController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateStrokeAttributes");

}

- (unint64_t)toolMode
{
  return self->_toolMode;
}

- (BOOL)allInkEnabled
{
  return self->_allInkEnabled;
}

- (void)setAllInkEnabled:(BOOL)a3
{
  self->_allInkEnabled = a3;
}

- (BOOL)pencilInkEnabled
{
  return self->_pencilInkEnabled;
}

- (void)setPencilInkEnabled:(BOOL)a3
{
  self->_pencilInkEnabled = a3;
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
}

@end
