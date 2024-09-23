@implementation JFXOverlayEffectDebugViewOptions

+ (JFXOverlayEffectDebugViewOptions)debugViewOptionsWithDictionary:(id)a3
{
  id v3;
  void *v4;
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

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowDocumentBoundingBox"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setShowDocumentBoundingBox:", objc_msgSend(v5, "BOOLValue"));
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowObjectAlignedBoundingBox"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setShowObjectAlignedBoundingBox:", objc_msgSend(v6, "BOOLValue"));
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowTextBoundingBoxes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setShowTextBoundingBoxes:", objc_msgSend(v7, "BOOLValue"));
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowHitAreaBoundingBox"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setShowHitAreaBoundingBox:", objc_msgSend(v8, "BOOLValue"));
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowFaceRect"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setShowFaceRect:", objc_msgSend(v9, "BOOLValue"));
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowTapPoints"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setShowTapPoints:", objc_msgSend(v10, "BOOLValue"));
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowCornerPoints"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setShowCornerPoints:", objc_msgSend(v11, "BOOLValue"));
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowTextCornerPoints"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setShowTextCornerPoints:", objc_msgSend(v12, "BOOLValue"));
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowHitAreaPoints"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setShowHitAreaPoints:", objc_msgSend(v13, "BOOLValue"));
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("JFX_DEBUG_DrawOverlayBoundsOptionShowAdditionalRects"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setShowAdditionalRects:", objc_msgSend(v14, "BOOLValue"));
  }

  return (JFXOverlayEffectDebugViewOptions *)v4;
}

- (JFXOverlayEffectDebugViewOptions)init
{
  JFXOverlayEffectDebugViewOptions *v2;
  JFXOverlayEffectDebugViewOptions *v3;
  void *v4;
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
  objc_super v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[4];
  _QWORD v38[5];

  v38[4] = *MEMORY[0x24BDAC8D0];
  v34.receiver = self;
  v34.super_class = (Class)JFXOverlayEffectDebugViewOptions;
  v2 = -[JFXOverlayEffectDebugViewOptions init](&v34, sel_init);
  v3 = v2;
  if (v2)
  {
    -[JFXOverlayEffectDebugViewOptions setShowDocumentBoundingBox:](v2, "setShowDocumentBoundingBox:", 0);
    -[JFXOverlayEffectDebugViewOptions setShowObjectAlignedBoundingBox:](v3, "setShowObjectAlignedBoundingBox:", 1);
    -[JFXOverlayEffectDebugViewOptions setShowTextBoundingBoxes:](v3, "setShowTextBoundingBoxes:", 1);
    -[JFXOverlayEffectDebugViewOptions setShowHitAreaBoundingBox:](v3, "setShowHitAreaBoundingBox:", 1);
    -[JFXOverlayEffectDebugViewOptions setShowFaceRect:](v3, "setShowFaceRect:", 1);
    -[JFXOverlayEffectDebugViewOptions setShowTapPoints:](v3, "setShowTapPoints:", 0);
    -[JFXOverlayEffectDebugViewOptions setShowMidpoint:](v3, "setShowMidpoint:", 1);
    -[JFXOverlayEffectDebugViewOptions setShowCornerPoints:](v3, "setShowCornerPoints:", 1);
    -[JFXOverlayEffectDebugViewOptions setShowTextCornerPoints:](v3, "setShowTextCornerPoints:", 1);
    -[JFXOverlayEffectDebugViewOptions setShowHitAreaPoints:](v3, "setShowHitAreaPoints:", 1);
    -[JFXOverlayEffectDebugViewOptions setShowAdditionalRects:](v3, "setShowAdditionalRects:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "magentaColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugViewOptions setDocumentBoundingBoxColor:](v3, "setDocumentBoundingBoxColor:", v4);

    objc_msgSend(MEMORY[0x24BDF6950], "yellowColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugViewOptions setOutputROIColor:](v3, "setOutputROIColor:", v5);

    objc_msgSend(MEMORY[0x24BDF6950], "cyanColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugViewOptions setObjectAlignedBoundingBoxColor:](v3, "setObjectAlignedBoundingBoxColor:", v6);

    objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", 0.261799388, 0.7, 0.9, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v7;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", 0.523598776, 0.7, 0.9, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v8;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", 0.785398163, 0.7, 0.9, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v9;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", 1.57079633, 0.7, 0.9, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugViewOptions setTextBoundingBoxColors:](v3, "setTextBoundingBoxColors:", v11);

    objc_msgSend(MEMORY[0x24BDF6950], "orangeColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugViewOptions setHitAreaBoundingBoxColor:](v3, "setHitAreaBoundingBoxColor:", v12);

    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugViewOptions setMidpointColor:](v3, "setMidpointColor:", v13);

    objc_msgSend(MEMORY[0x24BDF6950], "lightGrayColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugViewOptions setOverlayCenterColor:](v3, "setOverlayCenterColor:", v14);

    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugViewOptions setOriginCrosshairColor:](v3, "setOriginCrosshairColor:", v15);

    objc_msgSend(MEMORY[0x24BDF6950], "redColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v16;
    objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v17;
    objc_msgSend(MEMORY[0x24BDF6950], "yellowColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v18;
    objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37[3] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugViewOptions setCornerPointColors:](v3, "setCornerPointColors:", v20);

    objc_msgSend(MEMORY[0x24BDF6950], "redColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v21;
    objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v22;
    objc_msgSend(MEMORY[0x24BDF6950], "yellowColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[2] = v23;
    objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36[3] = v24;
    objc_msgSend(MEMORY[0x24BDF6950], "magentaColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v36[4] = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugViewOptions setTextCornerPointColors:](v3, "setTextCornerPointColors:", v26);

    objc_msgSend(MEMORY[0x24BDF6950], "redColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v27;
    objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v28;
    objc_msgSend(MEMORY[0x24BDF6950], "yellowColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[2] = v29;
    objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35[3] = v30;
    objc_msgSend(MEMORY[0x24BDF6950], "magentaColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35[4] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffectDebugViewOptions setHitAreaPointColors:](v3, "setHitAreaPointColors:", v32);

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  objc_super v18;

  v14 = (id)MEMORY[0x24BDD17C8];
  v18.receiver = self;
  v18.super_class = (Class)JFXOverlayEffectDebugViewOptions;
  -[JFXOverlayEffectDebugViewOptions description](&v18, sel_description);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showDocumentBoundingBox](self, "showDocumentBoundingBox"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showObjectAlignedBoundingBox](self, "showObjectAlignedBoundingBox"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showTextBoundingBoxes](self, "showTextBoundingBoxes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showHitAreaBoundingBox](self, "showHitAreaBoundingBox"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showFaceRect](self, "showFaceRect"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showTapPoints](self, "showTapPoints"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showMidpoint](self, "showMidpoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showCornerPoints](self, "showCornerPoints"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showTextCornerPoints](self, "showTextCornerPoints"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showHitAreaPoints](self, "showHitAreaPoints"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showAdditionalRects](self, "showAdditionalRects"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@\n    showDocumentBoundingBox         %@\n    showObjectAlignedBoundingBox    %@\n    showTextBoundingBoxes           %@\n    showHitAreaBoundingBox          %@\n    showFaceRect                    %@\n    showTapPoints                   %@\n    showMidpoint                    %@\n    showCornerPoints                %@\n    showTextCornerPoints            %@\n    showHitAreaPoints               %@\n    showAdditionalRects             %@"), v13, v12, v17, v16, v3, v4, v5, v6, v7, v8, v9, v10);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)showDocumentBoundingBox
{
  return self->_showDocumentBoundingBox;
}

- (void)setShowDocumentBoundingBox:(BOOL)a3
{
  self->_showDocumentBoundingBox = a3;
}

- (BOOL)showObjectAlignedBoundingBox
{
  return self->_showObjectAlignedBoundingBox;
}

- (void)setShowObjectAlignedBoundingBox:(BOOL)a3
{
  self->_showObjectAlignedBoundingBox = a3;
}

- (BOOL)showTextBoundingBoxes
{
  return self->_showTextBoundingBoxes;
}

- (void)setShowTextBoundingBoxes:(BOOL)a3
{
  self->_showTextBoundingBoxes = a3;
}

- (BOOL)showHitAreaBoundingBox
{
  return self->_showHitAreaBoundingBox;
}

- (void)setShowHitAreaBoundingBox:(BOOL)a3
{
  self->_showHitAreaBoundingBox = a3;
}

- (BOOL)showFaceRect
{
  return self->_showFaceRect;
}

- (void)setShowFaceRect:(BOOL)a3
{
  self->_showFaceRect = a3;
}

- (BOOL)showTapPoints
{
  return self->_showTapPoints;
}

- (void)setShowTapPoints:(BOOL)a3
{
  self->_showTapPoints = a3;
}

- (BOOL)showMidpoint
{
  return self->_showMidpoint;
}

- (void)setShowMidpoint:(BOOL)a3
{
  self->_showMidpoint = a3;
}

- (BOOL)showCornerPoints
{
  return self->_showCornerPoints;
}

- (void)setShowCornerPoints:(BOOL)a3
{
  self->_showCornerPoints = a3;
}

- (BOOL)showTextCornerPoints
{
  return self->_showTextCornerPoints;
}

- (void)setShowTextCornerPoints:(BOOL)a3
{
  self->_showTextCornerPoints = a3;
}

- (BOOL)showHitAreaPoints
{
  return self->_showHitAreaPoints;
}

- (void)setShowHitAreaPoints:(BOOL)a3
{
  self->_showHitAreaPoints = a3;
}

- (BOOL)showAdditionalRects
{
  return self->_showAdditionalRects;
}

- (void)setShowAdditionalRects:(BOOL)a3
{
  self->_showAdditionalRects = a3;
}

- (UIColor)documentBoundingBoxColor
{
  return self->_documentBoundingBoxColor;
}

- (void)setDocumentBoundingBoxColor:(id)a3
{
  objc_storeStrong((id *)&self->_documentBoundingBoxColor, a3);
}

- (UIColor)outputROIColor
{
  return self->_outputROIColor;
}

- (void)setOutputROIColor:(id)a3
{
  objc_storeStrong((id *)&self->_outputROIColor, a3);
}

- (UIColor)objectAlignedBoundingBoxColor
{
  return self->_objectAlignedBoundingBoxColor;
}

- (void)setObjectAlignedBoundingBoxColor:(id)a3
{
  objc_storeStrong((id *)&self->_objectAlignedBoundingBoxColor, a3);
}

- (NSArray)textBoundingBoxColors
{
  return self->_textBoundingBoxColors;
}

- (void)setTextBoundingBoxColors:(id)a3
{
  objc_storeStrong((id *)&self->_textBoundingBoxColors, a3);
}

- (UIColor)hitAreaBoundingBoxColor
{
  return self->_hitAreaBoundingBoxColor;
}

- (void)setHitAreaBoundingBoxColor:(id)a3
{
  objc_storeStrong((id *)&self->_hitAreaBoundingBoxColor, a3);
}

- (UIColor)midpointColor
{
  return self->_midpointColor;
}

- (void)setMidpointColor:(id)a3
{
  objc_storeStrong((id *)&self->_midpointColor, a3);
}

- (UIColor)overlayCenterColor
{
  return self->_overlayCenterColor;
}

- (void)setOverlayCenterColor:(id)a3
{
  objc_storeStrong((id *)&self->_overlayCenterColor, a3);
}

- (UIColor)originCrosshairColor
{
  return self->_originCrosshairColor;
}

- (void)setOriginCrosshairColor:(id)a3
{
  objc_storeStrong((id *)&self->_originCrosshairColor, a3);
}

- (NSArray)cornerPointColors
{
  return self->_cornerPointColors;
}

- (void)setCornerPointColors:(id)a3
{
  objc_storeStrong((id *)&self->_cornerPointColors, a3);
}

- (NSArray)textCornerPointColors
{
  return self->_textCornerPointColors;
}

- (void)setTextCornerPointColors:(id)a3
{
  objc_storeStrong((id *)&self->_textCornerPointColors, a3);
}

- (NSArray)hitAreaPointColors
{
  return self->_hitAreaPointColors;
}

- (void)setHitAreaPointColors:(id)a3
{
  objc_storeStrong((id *)&self->_hitAreaPointColors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitAreaPointColors, 0);
  objc_storeStrong((id *)&self->_textCornerPointColors, 0);
  objc_storeStrong((id *)&self->_cornerPointColors, 0);
  objc_storeStrong((id *)&self->_originCrosshairColor, 0);
  objc_storeStrong((id *)&self->_overlayCenterColor, 0);
  objc_storeStrong((id *)&self->_midpointColor, 0);
  objc_storeStrong((id *)&self->_hitAreaBoundingBoxColor, 0);
  objc_storeStrong((id *)&self->_textBoundingBoxColors, 0);
  objc_storeStrong((id *)&self->_objectAlignedBoundingBoxColor, 0);
  objc_storeStrong((id *)&self->_outputROIColor, 0);
  objc_storeStrong((id *)&self->_documentBoundingBoxColor, 0);
}

@end
