@implementation CHSWatchComplicationsCurvedLabelMetrics

- (CHSWatchComplicationsCurvedLabelMetrics)init
{
  char *v2;
  char *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CHSWatchComplicationsCurvedLabelMetrics;
  v2 = -[CHSWatchComplicationsCurvedLabelMetrics init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = *MEMORY[0x1E0C9D538];
    *((_QWORD *)v2 + 3) = 0;
    *((_QWORD *)v2 + 4) = 0;
    v4 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 5) = 0;
    *((_QWORD *)v2 + 6) = 0;

    v3[56] = 0;
    *((_QWORD *)v3 + 8) = 0;
    *((_QWORD *)v3 + 9) = 0;
    objc_msgSend(MEMORY[0x1E0D01710], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 1.0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v3 + 10);
    *((_QWORD *)v3 + 10) = v5;

    *((_QWORD *)v3 + 11) = 0;
    *((_QWORD *)v3 + 12) = 0;
    *(_OWORD *)(v3 + 104) = *MEMORY[0x1E0C9D820];
  }
  return (CHSWatchComplicationsCurvedLabelMetrics *)v3;
}

- (id)_initWithInstance:(id)a3
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v4 = (char *)a3;
  v12.receiver = self;
  v12.super_class = (Class)CHSWatchComplicationsCurvedLabelMetrics;
  v5 = -[CHSWatchComplicationsCurvedLabelMetrics init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = *(_OWORD *)(v4 + 8);
    *((_QWORD *)v5 + 3) = *((_QWORD *)v4 + 3);
    *((_QWORD *)v5 + 4) = *((_QWORD *)v4 + 4);
    *((_QWORD *)v5 + 5) = *((_QWORD *)v4 + 5);
    v7 = objc_msgSend(*((id *)v4 + 6), "copy");
    v8 = (void *)*((_QWORD *)v6 + 6);
    *((_QWORD *)v6 + 6) = v7;

    v6[56] = v4[56];
    *((_QWORD *)v6 + 8) = *((_QWORD *)v4 + 8);
    *((_QWORD *)v6 + 9) = *((_QWORD *)v4 + 9);
    v9 = objc_msgSend(*((id *)v4 + 10), "copy");
    v10 = (void *)*((_QWORD *)v6 + 10);
    *((_QWORD *)v6 + 10) = v9;

    *((_QWORD *)v6 + 11) = *((_QWORD *)v4 + 11);
    *((_QWORD *)v6 + 12) = *((_QWORD *)v4 + 12);
    *(_OWORD *)(v6 + 104) = *(_OWORD *)(v4 + 104);
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  id v12;
  CHSWatchComplicationsCurvedLabelMetrics *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __54__CHSWatchComplicationsCurvedLabelMetrics_description__block_invoke;
  v11 = &unk_1E2A5A290;
  v4 = v3;
  v12 = v4;
  v13 = self;
  v5 = (id)objc_msgSend(v4, "modifyProem:", &v8);
  objc_msgSend(v4, "build", v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

id __54__CHSWatchComplicationsCurvedLabelMetrics_description__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendPoint:withName:", CFSTR("circleCenter"), *(double *)(*(_QWORD *)(a1 + 40) + 8), *(double *)(*(_QWORD *)(a1 + 40) + 16));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("circleRadius"), 2, *(double *)(*(_QWORD *)(a1 + 40) + 24));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("maximumAngularWidth"), 2, *(double *)(*(_QWORD *)(a1 + 40) + 32));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("centerAngle"), 2, *(double *)(*(_QWORD *)(a1 + 40) + 40));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("bezierPath"), 1);
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("interior"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("tracking"), 2, *(double *)(*(_QWORD *)(a1 + 40) + 64));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("fontSize"), 2, *(double *)(*(_QWORD *)(a1 + 40) + 72));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), CFSTR("textColor"));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("accessoryPlacement"), 2, (double)*(unint64_t *)(*(_QWORD *)(a1 + 40) + 88));
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:decimalPrecision:", CFSTR("accessoryPadding"), 2, *(double *)(*(_QWORD *)(a1 + 40) + 96));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendSize:withName:", CFSTR("accessoryMaxSize"), *(double *)(*(_QWORD *)(a1 + 40) + 104), *(double *)(*(_QWORD *)(a1 + 40) + 112));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  double circleRadius;
  id v14;
  id v15;
  double maximumAngularWidth;
  id v17;
  id v18;
  double centerAngle;
  id v20;
  id v21;
  CHSBezierPath *bezierPath;
  id v23;
  id v24;
  _BOOL8 interior;
  id v26;
  id v27;
  double tracking;
  id v29;
  id v30;
  double fontSize;
  id v32;
  id v33;
  BSColor *textColor;
  id v35;
  id v36;
  unint64_t accessoryPlacement;
  id v38;
  id v39;
  double accessoryPadding;
  id v41;
  id v42;
  id v43;
  id v44;
  char v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t);
  void *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  _QWORD v72[4];
  id v73;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v4;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  v10 = MEMORY[0x1E0C809B0];
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke;
  v72[3] = &unk_1E2A5A4B8;
  v11 = v9;
  v73 = v11;
  v12 = (id)objc_msgSend(v5, "appendCGPoint:counterpart:", v72, self->_circleCenter.x, self->_circleCenter.y);
  circleRadius = self->_circleRadius;
  v70[0] = v10;
  v70[1] = 3221225472;
  v70[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_2;
  v70[3] = &unk_1E2A5A4E0;
  v14 = v11;
  v71 = v14;
  v15 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v70, circleRadius);
  maximumAngularWidth = self->_maximumAngularWidth;
  v68[0] = v10;
  v68[1] = 3221225472;
  v68[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_3;
  v68[3] = &unk_1E2A5A4E0;
  v17 = v14;
  v69 = v17;
  v18 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v68, maximumAngularWidth);
  centerAngle = self->_centerAngle;
  v66[0] = v10;
  v66[1] = 3221225472;
  v66[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_4;
  v66[3] = &unk_1E2A5A4E0;
  v20 = v17;
  v67 = v20;
  v21 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v66, centerAngle);
  bezierPath = self->_bezierPath;
  v64[0] = v10;
  v64[1] = 3221225472;
  v64[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_5;
  v64[3] = &unk_1E2A5A268;
  v23 = v20;
  v65 = v23;
  v24 = (id)objc_msgSend(v5, "appendObject:counterpart:", bezierPath, v64);
  interior = self->_interior;
  v62[0] = v10;
  v62[1] = 3221225472;
  v62[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_6;
  v62[3] = &unk_1E2A5A508;
  v26 = v23;
  v63 = v26;
  v27 = (id)objc_msgSend(v5, "appendBool:counterpart:", interior, v62);
  tracking = self->_tracking;
  v60[0] = v10;
  v60[1] = 3221225472;
  v60[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_7;
  v60[3] = &unk_1E2A5A4E0;
  v29 = v26;
  v61 = v29;
  v30 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v60, tracking);
  fontSize = self->_fontSize;
  v58[0] = v10;
  v58[1] = 3221225472;
  v58[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_8;
  v58[3] = &unk_1E2A5A4E0;
  v32 = v29;
  v59 = v32;
  v33 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v58, fontSize);
  textColor = self->_textColor;
  v56[0] = v10;
  v56[1] = 3221225472;
  v56[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_9;
  v56[3] = &unk_1E2A5A530;
  v35 = v32;
  v57 = v35;
  v36 = (id)objc_msgSend(v5, "appendObject:counterpart:", textColor, v56);
  accessoryPlacement = self->_accessoryPlacement;
  v54[0] = v10;
  v54[1] = 3221225472;
  v54[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_10;
  v54[3] = &unk_1E2A5A558;
  v38 = v35;
  v55 = v38;
  v39 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", accessoryPlacement, v54);
  accessoryPadding = self->_accessoryPadding;
  v52[0] = v10;
  v52[1] = 3221225472;
  v52[2] = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_11;
  v52[3] = &unk_1E2A5A4E0;
  v41 = v38;
  v53 = v41;
  v42 = (id)objc_msgSend(v5, "appendCGFloat:counterpart:", v52, accessoryPadding);
  v47 = v10;
  v48 = 3221225472;
  v49 = __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_12;
  v50 = &unk_1E2A5A580;
  v43 = v41;
  v51 = v43;
  v44 = (id)objc_msgSend(v5, "appendCGSize:counterpart:", &v47, self->_accessoryMaxSize.width, self->_accessoryMaxSize.height);
  v45 = objc_msgSend(v5, "isEqual", v47, v48, v49, v50);

  return v45;
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "circleCenter");
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "circleRadius");
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "maximumAngularWidth");
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "centerAngle");
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bezierPath");
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "interior");
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "tracking");
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fontSize");
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "textColor");
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryPlacement");
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryPadding");
}

uint64_t __51__CHSWatchComplicationsCurvedLabelMetrics_isEqual___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryMaxSize");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendCGPoint:", self->_circleCenter.x, self->_circleCenter.y);
  v5 = (id)objc_msgSend(v3, "appendCGFloat:", self->_circleRadius);
  v6 = (id)objc_msgSend(v3, "appendCGFloat:", self->_maximumAngularWidth);
  v7 = (id)objc_msgSend(v3, "appendCGFloat:", self->_centerAngle);
  v8 = (id)objc_msgSend(v3, "appendObject:", self->_bezierPath);
  v9 = (id)objc_msgSend(v3, "appendBool:", self->_interior);
  v10 = (id)objc_msgSend(v3, "appendCGFloat:", self->_tracking);
  v11 = (id)objc_msgSend(v3, "appendCGFloat:", self->_fontSize);
  v12 = (id)objc_msgSend(v3, "appendObject:", self->_textColor);
  v13 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_accessoryPlacement);
  v14 = (id)objc_msgSend(v3, "appendCGFloat:", self->_accessoryPadding);
  v15 = (id)objc_msgSend(v3, "appendCGSize:", self->_accessoryMaxSize.width, self->_accessoryMaxSize.height);
  v16 = objc_msgSend(v3, "hash");

  return v16;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CHSWatchComplicationsCurvedLabelMetrics _initWithInstance:]([CHSMutableWatchComplicationsCurvedLabelMetrics alloc], "_initWithInstance:", self);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeCGPoint:forKey:", CFSTR("circleCenter"), self->_circleCenter.x, self->_circleCenter.y);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("circleRadius"), self->_circleRadius);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maximumAngularWidth"), self->_maximumAngularWidth);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("centerAngle"), self->_centerAngle);
  objc_msgSend(v4, "encodeObject:forKey:", self->_bezierPath, CFSTR("bezierPath"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_interior, CFSTR("interior"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("tracking"), self->_tracking);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("fontSize"), self->_fontSize);
  objc_msgSend(v4, "encodeObject:forKey:", self->_textColor, CFSTR("textColor"));
  objc_msgSend(v4, "encodeUInt64:forKey:", self->_accessoryPlacement, CFSTR("accessoryPlacement"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("accessoryPadding"), self->_accessoryPadding);
  objc_msgSend(v4, "encodeCGSize:forKey:", CFSTR("accessoryMaxSize"), self->_accessoryMaxSize.width, self->_accessoryMaxSize.height);

}

- (CHSWatchComplicationsCurvedLabelMetrics)initWithBSXPCCoder:(id)a3
{
  id v4;
  CHSWatchComplicationsCurvedLabelMetrics *v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  CHSBezierPath *bezierPath;
  double v13;
  double v14;
  uint64_t v15;
  BSColor *textColor;
  double v17;
  CGFloat v18;
  CGFloat v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CHSWatchComplicationsCurvedLabelMetrics;
  v5 = -[CHSWatchComplicationsCurvedLabelMetrics init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeCGPointForKey:", CFSTR("circleCenter"));
    v5->_circleCenter.x = v6;
    v5->_circleCenter.y = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("circleRadius"));
    v5->_circleRadius = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maximumAngularWidth"));
    v5->_maximumAngularWidth = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("centerAngle"));
    v5->_centerAngle = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bezierPath"));
    v11 = objc_claimAutoreleasedReturnValue();
    bezierPath = v5->_bezierPath;
    v5->_bezierPath = (CHSBezierPath *)v11;

    v5->_interior = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("interior"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("tracking"));
    v5->_tracking = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("fontSize"));
    v5->_fontSize = v14;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textColor"));
    v15 = objc_claimAutoreleasedReturnValue();
    textColor = v5->_textColor;
    v5->_textColor = (BSColor *)v15;

    v5->_accessoryPlacement = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("accessoryPlacement"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("accessoryPadding"));
    v5->_accessoryPadding = v17;
    objc_msgSend(v4, "decodeCGSizeForKey:", CFSTR("accessoryMaxSize"));
    v5->_accessoryMaxSize.width = v18;
    v5->_accessoryMaxSize.height = v19;
  }

  return v5;
}

- (CGPoint)circleCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_circleCenter.x;
  y = self->_circleCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)circleRadius
{
  return self->_circleRadius;
}

- (double)maximumAngularWidth
{
  return self->_maximumAngularWidth;
}

- (double)centerAngle
{
  return self->_centerAngle;
}

- (CHSBezierPath)bezierPath
{
  return self->_bezierPath;
}

- (BOOL)interior
{
  return self->_interior;
}

- (double)tracking
{
  return self->_tracking;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (BSColor)textColor
{
  return self->_textColor;
}

- (unint64_t)accessoryPlacement
{
  return self->_accessoryPlacement;
}

- (double)accessoryPadding
{
  return self->_accessoryPadding;
}

- (CGSize)accessoryMaxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_accessoryMaxSize.width;
  height = self->_accessoryMaxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_bezierPath, 0);
}

@end
