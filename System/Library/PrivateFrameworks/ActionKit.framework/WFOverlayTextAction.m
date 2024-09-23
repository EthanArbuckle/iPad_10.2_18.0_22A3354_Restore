@implementation WFOverlayTextAction

- (void)overlayImage:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat MidX;
  CGFloat MidY;
  id v23;
  id v24;
  id v25;
  CGContext *v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  CGRect v37;
  CGRect v38;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "CGImageSize");
  v9 = v8;
  objc_msgSend(v7, "CGImageSize");
  v11 = v10;
  objc_msgSend(v7, "CGImageSize");
  -[WFOverlayTextAction setImageWidth:](self, "setImageWidth:");
  objc_msgSend(v7, "CGImageSize");
  -[WFOverlayTextAction setImageHeight:](self, "setImageHeight:", v12);
  -[WFOverlayTextAction drawingRectForImage:](self, "drawingRectForImage:", v7);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v6, "becomeCurrent");
  objc_msgSend(v7, "drawInContext:inRect:", v6, 0.0, 0.0, v9, v11);

  v37.origin.x = v14;
  v37.origin.y = v16;
  v37.size.width = v18;
  v37.size.height = v20;
  MidX = CGRectGetMidX(v37);
  v38.origin.x = v14;
  v38.origin.y = v16;
  v38.size.width = v18;
  v38.size.height = v20;
  MidY = CGRectGetMidY(v38);
  v23 = objc_retainAutorelease(v6);
  CGContextSaveGState((CGContextRef)objc_msgSend(v23, "CGContext"));
  v24 = objc_retainAutorelease(v23);
  CGContextTranslateCTM((CGContextRef)objc_msgSend(v24, "CGContext"), MidX, MidY);
  v25 = objc_retainAutorelease(v24);
  v26 = (CGContext *)objc_msgSend(v25, "CGContext");
  -[WFOverlayTextAction rotation](self, "rotation");
  CGContextRotateCTM(v26, v27 * 3.14159265 / 180.0);
  -[WFOverlayTextAction boxWidth](self, "boxWidth");
  if (v28 == 0.0)
    v29 = 2;
  else
    v29 = 3;
  if (-[WFOverlayTextAction strokeEnabled](self, "strokeEnabled"))
  {
    -[WFOverlayTextAction strokeWidth](self, "strokeWidth");
    if (v30 != 0.0)
    {
      -[WFOverlayTextAction strokeColor](self, "strokeColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        -[WFOverlayTextAction text](self, "text");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFOverlayTextAction outlinedTextAttributes](self, "outlinedTextAttributes");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "drawWithRect:options:attributes:context:", v29, v33, 0, v18 * -0.5, v20 * -0.5, v18, v20);

      }
    }
  }
  -[WFOverlayTextAction text](self, "text");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOverlayTextAction textAttributes](self, "textAttributes");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "drawWithRect:options:attributes:context:", v29, v35, 0, v18 * -0.5, v20 * -0.5, v18, v20);

  v36 = objc_retainAutorelease(v25);
  CGContextRestoreGState((CGContextRef)objc_msgSend(v36, "CGContext"));
  objc_msgSend(v36, "resignCurrent");

}

- (double)boxWidth
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  float v6;
  double v7;
  double v8;
  double v9;
  float v10;

  v3 = -[WFOverlayTextAction useProportionalSizing](self, "useProportionalSizing");
  v4 = objc_opt_class();
  if (v3)
  {
    -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPercentageTextBoxWidth"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;
    -[WFOverlayTextAction imageWidth](self, "imageWidth");
    v9 = v8 * v7;
  }
  else
  {
    -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTextBoxWidth"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v9 = v10;
  }

  return v9;
}

- (CGRect)drawingRectForImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  void *v28;
  int IsTopPosition;
  double v30;
  double v31;
  id v32;
  void *v33;
  int v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  int v41;
  id v42;
  int v43;
  void *v44;
  int IsBottomPosition;
  double v46;
  int v47;
  id v48;
  double v49;
  int v50;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "CGImageSize");
  v6 = v5;
  objc_msgSend(v4, "CGImageSize");
  v8 = v7;

  -[WFOverlayTextAction boxWidth](self, "boxWidth");
  v10 = v9;
  -[WFOverlayTextAction text](self, "text");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == 0.0)
  {
    -[WFOverlayTextAction textAttributes](self, "textAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 1.79769313e308;
    v17 = v11;
    v19 = 1.79769313e308;
    v20 = 2;
  }
  else
  {
    -[WFOverlayTextAction boxWidth](self, "boxWidth");
    v13 = v12;
    -[WFOverlayTextAction imageHeight](self, "imageHeight");
    v15 = v14;
    -[WFOverlayTextAction textAttributes](self, "textAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v11;
    v18 = v13;
    v19 = v15;
    v20 = 3;
  }
  objc_msgSend(v17, "boundingRectWithSize:options:attributes:context:", v20, v16, 0, v18, v19);
  v22 = v21;
  v24 = v23;

  -[WFOverlayTextAction textPosition](self, "textPosition");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "isEqualToString:", CFSTR("Top Left")) & 1) != 0
    || objc_msgSend(v25, "isEqualToString:", CFSTR("Middle Left")))
  {

LABEL_7:
    -[WFOverlayTextAction offset](self, "offset");
    v27 = v26 + 0.0;
    goto LABEL_8;
  }
  v41 = objc_msgSend(v25, "isEqualToString:", CFSTR("Bottom Left"));

  if (v41)
    goto LABEL_7;
  -[WFOverlayTextAction textPosition](self, "textPosition");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v42, "isEqualToString:", CFSTR("Top Center")) & 1) != 0
    || objc_msgSend(v42, "isEqualToString:", CFSTR("Center")))
  {

LABEL_21:
    v27 = v6 * 0.5 - v22 * 0.5;
    goto LABEL_8;
  }
  v47 = objc_msgSend(v42, "isEqualToString:", CFSTR("Bottom Center"));

  if (v47)
    goto LABEL_21;
  -[WFOverlayTextAction textPosition](self, "textPosition");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v48, "isEqualToString:", CFSTR("Top Right")) & 1) != 0
    || objc_msgSend(v48, "isEqualToString:", CFSTR("Middle Right")))
  {

LABEL_29:
    -[WFOverlayTextAction offset](self, "offset");
    v27 = v6 - v22 - v49;
    goto LABEL_8;
  }
  v50 = objc_msgSend(v48, "isEqualToString:", CFSTR("Bottom Right"));

  v27 = 0.0;
  if (v50)
    goto LABEL_29;
LABEL_8:
  -[WFOverlayTextAction textPosition](self, "textPosition");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  IsTopPosition = WFTextPositionIsTopPosition(v28);

  if (IsTopPosition)
  {
    -[WFOverlayTextAction offset](self, "offset");
    v31 = v30 + 0.0;
    goto LABEL_14;
  }
  -[WFOverlayTextAction textPosition](self, "textPosition");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v32, "isEqualToString:", CFSTR("Middle Left")) & 1) != 0
    || objc_msgSend(v32, "isEqualToString:", CFSTR("Center")))
  {

LABEL_13:
    v31 = (v8 - v24) * 0.5;
    goto LABEL_14;
  }
  v43 = objc_msgSend(v32, "isEqualToString:", CFSTR("Middle Right"));

  if (v43)
    goto LABEL_13;
  -[WFOverlayTextAction textPosition](self, "textPosition");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  IsBottomPosition = WFTextPositionIsBottomPosition(v44);

  v31 = 0.0;
  if (IsBottomPosition)
  {
    -[WFOverlayTextAction offset](self, "offset");
    v31 = v8 - v24 - v46;
  }
LABEL_14:
  -[WFOverlayTextAction textPosition](self, "textPosition");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("Custom Position"));

  if (v34)
  {
    -[WFOverlayTextAction yPosition](self, "yPosition");
    v31 = v35 + 0.0;
    -[WFOverlayTextAction xPosition](self, "xPosition");
    v27 = v36;
  }
  v37 = v27;
  v38 = v31;
  v39 = v22;
  v40 = v24;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = objc_opt_class();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v5, v6);

}

- (id)paragraphStyle
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v3 = (void *)getNSParagraphStyleClass_softClass;
  v13 = getNSParagraphStyleClass_softClass;
  if (!getNSParagraphStyleClass_softClass)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __getNSParagraphStyleClass_block_invoke;
    v9[3] = &unk_24F8BB430;
    v9[4] = &v10;
    __getNSParagraphStyleClass_block_invoke((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(v4, "defaultParagraphStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setAlignment:", -[WFOverlayTextAction textAlignment](self, "textAlignment"));
  objc_msgSend(v6, "setLineBreakMode:", 0);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (id)textAttributes
{
  id *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  id v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v3 = (id *)getNSForegroundColorAttributeNameSymbolLoc_ptr;
  v27 = getNSForegroundColorAttributeNameSymbolLoc_ptr;
  if (!getNSForegroundColorAttributeNameSymbolLoc_ptr)
  {
    v4 = UIKitLibrary();
    v3 = (id *)dlsym(v4, "NSForegroundColorAttributeName");
    v25[3] = (uint64_t)v3;
    getNSForegroundColorAttributeNameSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v24, 8);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNSForegroundColorAttributeName(void)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("WFOverlayTextAction.m"), 16, CFSTR("%s"), dlerror(), v24);

    goto LABEL_14;
  }
  v5 = *v3;
  v28[0] = v5;
  -[WFOverlayTextAction textColor](self, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "platformColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v7;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v8 = (id *)getNSFontAttributeNameSymbolLoc_ptr;
  v27 = getNSFontAttributeNameSymbolLoc_ptr;
  if (!getNSFontAttributeNameSymbolLoc_ptr)
  {
    v9 = UIKitLibrary();
    v8 = (id *)dlsym(v9, "NSFontAttributeName");
    v25[3] = (uint64_t)v8;
    getNSFontAttributeNameSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v24, 8);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNSFontAttributeName(void)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("WFOverlayTextAction.m"), 17, CFSTR("%s"), dlerror(), v24);

    goto LABEL_14;
  }
  v10 = *v8;
  v28[1] = v10;
  -[WFOverlayTextAction font](self, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v11;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v12 = (id *)getNSParagraphStyleAttributeNameSymbolLoc_ptr;
  v27 = getNSParagraphStyleAttributeNameSymbolLoc_ptr;
  if (!getNSParagraphStyleAttributeNameSymbolLoc_ptr)
  {
    v13 = UIKitLibrary();
    v12 = (id *)dlsym(v13, "NSParagraphStyleAttributeName");
    v25[3] = (uint64_t)v12;
    getNSParagraphStyleAttributeNameSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v24, 8);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNSParagraphStyleAttributeName(void)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("WFOverlayTextAction.m"), 18, CFSTR("%s"), dlerror(), v24);

LABEL_14:
    __break(1u);
  }
  v29 = *v12;
  v14 = v29;
  -[WFOverlayTextAction paragraphStyle](self, "paragraphStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v28, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)outlinedTextAttributes
{
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  -[WFOverlayTextAction textAttributes](self, "textAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v5 = (id *)getNSStrokeColorAttributeNameSymbolLoc_ptr;
  v24 = getNSStrokeColorAttributeNameSymbolLoc_ptr;
  if (!getNSStrokeColorAttributeNameSymbolLoc_ptr)
  {
    v6 = UIKitLibrary();
    v5 = (id *)dlsym(v6, "NSStrokeColorAttributeName");
    v22[3] = (uint64_t)v5;
    getNSStrokeColorAttributeNameSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v21, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNSStrokeColorAttributeName(void)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("WFOverlayTextAction.m"), 20, CFSTR("%s"), dlerror(), v21);

    goto LABEL_10;
  }
  v7 = *v5;
  v25 = v7;
  -[WFOverlayTextAction strokeColor](self, "strokeColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "platformColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v9;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v10 = (id *)getNSStrokeWidthAttributeNameSymbolLoc_ptr;
  v24 = getNSStrokeWidthAttributeNameSymbolLoc_ptr;
  if (!getNSStrokeWidthAttributeNameSymbolLoc_ptr)
  {
    v11 = UIKitLibrary();
    v10 = (id *)dlsym(v11, "NSStrokeWidthAttributeName");
    v22[3] = (uint64_t)v10;
    getNSStrokeWidthAttributeNameSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v21, 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNSStrokeWidthAttributeName(void)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("WFOverlayTextAction.m"), 19, CFSTR("%s"), dlerror(), v21);

LABEL_10:
    __break(1u);
  }
  v26 = *v10;
  v12 = v26;
  -[WFOverlayTextAction strokeWidthPercentage](self, "strokeWidthPercentage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v25, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v14);

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

- (id)strokeWidthPercentage
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[WFOverlayTextAction strokeWidth](self, "strokeWidth");
  v4 = v3;
  -[WFOverlayTextAction fontSize](self, "fontSize");
  v6 = v4 / v5 * -100.0;
  *(float *)&v6 = v6;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v6);
}

- (id)font
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  -[WFOverlayTextAction fontDescriptor](self, "fontDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFOverlayTextAction fontSize](self, "fontSize");
  objc_msgSend(v3, "fontWithSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2050000000;
    v6 = (void *)getUIFontClass_softClass;
    v14 = getUIFontClass_softClass;
    if (!getUIFontClass_softClass)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __getUIFontClass_block_invoke;
      v10[3] = &unk_24F8BB430;
      v10[4] = &v11;
      __getUIFontClass_block_invoke((uint64_t)v10);
      v6 = (void *)v12[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v11, 8);
    -[WFOverlayTextAction fontSize](self, "fontSize");
    objc_msgSend(v7, "systemFontOfSize:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v5;

  return v8;
}

- (id)parameterKeysIgnoredForParameterSummary
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("WFTextOutlineEnabled"), CFSTR("WFFont"), CFSTR("WFFontSize"), CFSTR("WFPercentageFontSize"), CFSTR("WFTextColor"), CFSTR("WFTextRotation"), CFSTR("WFTextStrokeWidth"), CFSTR("WFPercentageTextStrokeWidth"), CFSTR("WFTextStrokeColor"), CFSTR("WFSizingMethod"), CFSTR("WFTextAlignment"), CFSTR("WFTextBoxWidth"), CFSTR("WFPercentageTextBoxWidth"), 0);
}

- (id)text
{
  return (id)-[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFText"), objc_opt_class());
}

- (id)textPosition
{
  return (id)-[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTextPosition"), objc_opt_class());
}

- (int64_t)textAlignment
{
  __CFString *v2;
  __CFString *v3;
  char v4;
  int64_t v5;
  __CFString *v6;
  __CFString *v7;
  char v8;
  __CFString *v9;
  __CFString *v10;
  int v11;

  -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTextAlignment"), objc_opt_class());
  v2 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == CFSTR("Left"))
    goto LABEL_4;
  if (!v2)
  {
LABEL_10:
    v5 = 1;
    goto LABEL_11;
  }
  v4 = -[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("Left"));

  if ((v4 & 1) == 0)
  {
    v6 = v3;
    if (v6 != CFSTR("Center"))
    {
      v7 = v6;
      v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Center"));

      if ((v8 & 1) == 0)
      {
        v9 = v7;
        if (v9 == CFSTR("Right")
          || (v10 = v9,
              v11 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("Right")),
              v10,
              v11))
        {
          v5 = 2;
          goto LABEL_11;
        }
      }
    }
    goto LABEL_10;
  }
LABEL_4:
  v5 = 0;
LABEL_11:

  return v5;
}

- (double)xPosition
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  float v6;
  double v7;
  double v8;
  double v9;
  float v10;

  v3 = -[WFOverlayTextAction useProportionalSizing](self, "useProportionalSizing");
  v4 = objc_opt_class();
  if (v3)
  {
    -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPercentageTextX"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;
    -[WFOverlayTextAction imageWidth](self, "imageWidth");
    v9 = v8 * v7;
  }
  else
  {
    -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTextX"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v9 = v10;
  }

  return v9;
}

- (double)yPosition
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  float v6;
  double v7;
  double v8;
  double v9;
  float v10;

  v3 = -[WFOverlayTextAction useProportionalSizing](self, "useProportionalSizing");
  v4 = objc_opt_class();
  if (v3)
  {
    -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPercentageTextY"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;
    -[WFOverlayTextAction imageWidth](self, "imageWidth");
    v9 = v8 * v7;
  }
  else
  {
    -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTextY"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v9 = v10;
  }

  return v9;
}

- (double)offset
{
  void *v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  int IsBottomPosition;
  float v9;
  double v10;
  double v11;
  float v12;

  if (-[WFOverlayTextAction useProportionalSizing](self, "useProportionalSizing"))
  {
    -[WFOverlayTextAction textPosition](self, "textPosition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (WFTextPositionIsTopPosition(v3))
    {

    }
    else
    {
      -[WFOverlayTextAction textPosition](self, "textPosition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      IsBottomPosition = WFTextPositionIsBottomPosition(v7);

      if (!IsBottomPosition)
      {
        -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPercentageTextOffset"), objc_opt_class());
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "floatValue");
        v10 = v12;
        -[WFOverlayTextAction imageWidth](self, "imageWidth");
        goto LABEL_8;
      }
    }
    -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPercentageTextOffset"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    v10 = v9;
    -[WFOverlayTextAction imageHeight](self, "imageHeight");
LABEL_8:
    v6 = v11 * v10;
    goto LABEL_9;
  }
  -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTextOffset"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;
LABEL_9:

  return v6;
}

- (BOOL)strokeEnabled
{
  void *v2;
  char v3;

  -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTextOutlineEnabled"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)fontDescriptor
{
  return (id)-[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFont"), objc_opt_class());
}

- (double)fontSize
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  float v6;
  double v7;
  double v8;
  double v9;
  float v10;

  v3 = -[WFOverlayTextAction useProportionalSizing](self, "useProportionalSizing");
  v4 = objc_opt_class();
  if (v3)
  {
    -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPercentageFontSize"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;
    -[WFOverlayTextAction imageWidth](self, "imageWidth");
    v9 = v8 * v7;
  }
  else
  {
    -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFontSize"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v9 = v10;
  }

  return v9;
}

- (id)textColor
{
  return (id)-[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTextColor"), objc_opt_class());
}

- (double)rotation
{
  void *v2;
  float v3;
  double v4;

  -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTextRotation"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  v4 = v3;

  return v4;
}

- (double)strokeWidth
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  float v6;
  double v7;
  double v8;
  double v9;
  float v10;

  v3 = -[WFOverlayTextAction useProportionalSizing](self, "useProportionalSizing");
  v4 = objc_opt_class();
  if (v3)
  {
    -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPercentageTextStrokeWidth"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v7 = v6;
    -[WFOverlayTextAction fontSize](self, "fontSize");
    v9 = v8 * v7;
  }
  else
  {
    -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTextStrokeWidth"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    v9 = v10;
  }

  return v9;
}

- (id)strokeColor
{
  return (id)-[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTextStrokeColor"), objc_opt_class());
}

- (BOOL)useProportionalSizing
{
  void *v2;
  char v3;

  -[WFOverlayTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSizingMethod"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Proportional"));

  return v3;
}

- (double)imageWidth
{
  return self->_imageWidth;
}

- (void)setImageWidth:(double)a3
{
  self->_imageWidth = a3;
}

- (double)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageHeight:(double)a3
{
  self->_imageHeight = a3;
}

void __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  uint64_t v10;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_2;
    v9[3] = &unk_24F8B4290;
    v10 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_6;
    v8[3] = &unk_24F8BAFA8;
    v8[4] = v10;
    objc_msgSend(v6, "transformItemsUsingBlock:completionHandler:", v9, v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_3;
  v9[3] = &unk_24F8BA0C0;
  v10 = v5;
  v11 = v6;
  v9[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  v8 = v6;
  objc_msgSend(v7, "getFileRepresentation:forType:", v9, 0);

}

void __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  if (v3)
  {
    WFImageSizeFromFile();
    v5 = *(id *)(a1 + 48);
    v4 = *(id *)(a1 + 40);
    WFAsyncTransformedImageFromImage();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "overlayImage:inContext:", a2, a3);
}

void __50__WFOverlayTextAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void (*v12)(uint64_t, _QWORD, id);
  id v13;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  v13 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BE19450];
    v8 = *(void **)(a1 + 32);
    v9 = a3;
    objc_msgSend(v8, "attributionSet");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemWithFile:attributionSet:", v13, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v11, v9);

  }
  else
  {
    v12 = *(void (**)(uint64_t, _QWORD, id))(v6 + 16);
    v10 = a3;
    v12(v6, 0, v10);
  }

}

@end
