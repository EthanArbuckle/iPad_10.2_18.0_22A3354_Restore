@implementation VKExplorationAccessibilityElement

- (BOOL)isCurrent
{
  void *v2;
  char v3;

  -[VKExplorationAccessibilityElement vertex](self, "vertex");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrent");

  return v3;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[VKExplorationAccessibilityElement isCurrent](self, "isCurrent"))
    return 1;
  -[VKExplorationAccessibilityElement vertex](self, "vertex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isComputed"))
  {
    -[VKExplorationAccessibilityElement vertex](self, "vertex");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "roads");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v48;
  double v49;
  CGPoint v50;
  CGPoint v51;

  if (!-[VKExplorationAccessibilityElement isCurrent](self, "isCurrent"))
  {
    -[VKExplorationAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessibilityElementManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentExplorationVertex");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[VKExplorationAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "accessibilityYaw");
      v20 = v19;

      v21 = v20 + 360.0;
      if (v20 >= 0.0)
        v21 = v20;
      if (v21 >= 0.0)
        v22 = v21;
      else
        v22 = v21 + 360.0;
      -[VKExplorationAccessibilityElement vertex](self, "vertex");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "getScreenPoint");
      v25 = v24;
      v27 = v26;

      -[VKExplorationAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "accessibilityElementManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "currentExplorationVertex");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "getScreenPoint");
      v32 = v31;
      v34 = v33;

      v50.y = -v27;
      v51.y = -v34;
      v48 = 0.0;
      v49 = 0.0;
      v50.x = v25;
      v51.x = v32;
      AXVKMathGetVectorAndDistanceForPoints(&v49, &v48, v50, v51);
      v35 = v22 + 360.0 - v49 + dbl_232B5BC90[360.0 - v49 >= 270.0];
      if (v35 > 360.0)
        v35 = v35 + -360.0;
      v49 = v35;
      AXDescriptionForHeadingInDegrees();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKExplorationAccessibilityElement vertex](self, "vertex");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKExplorationAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "accessibilityElementManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "currentExplorationVertex");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "connectingRoadWith:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "trueLabel");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v41, "length"))
      {
        AXVectorKitLocString(CFSTR("UNNAMED_ROAD"));
        v42 = objc_claimAutoreleasedReturnValue();

        v41 = (void *)v42;
      }
      v43 = (void *)MEMORY[0x24BDD17C8];
      AXVectorKitLocString(CFSTR("MOVE_ON_FORMAT"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "stringWithFormat:", v44, v8, v41);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
    v45 = (void *)MEMORY[0x24BDD17C8];
    AXVectorKitLocString(CFSTR("MOVE_TO_FORMAT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKExplorationAccessibilityElement vertex](self, "vertex");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilityLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringWithFormat:", v8, v46);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
LABEL_20:

    return v14;
  }
  -[VKExplorationAccessibilityElement vertex](self, "vertex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "roads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[VKExplorationAccessibilityElement vertex](self, "vertex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isComputed");

    if ((v6 & 1) != 0)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      AXVectorKitLocString(CFSTR("INTERSECTION_INFO_FORMAT"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKExplorationAccessibilityElement vertex](self, "vertex");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "edges");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      -[VKExplorationAccessibilityElement vertex](self, "vertex");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accessibilityLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v8, v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_19;
    }
  }
  else
  {

  }
  v14 = 0;
  return v14;
}

- (id)accessibilityPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDF6870];
  -[VKExplorationAccessibilityElement accessibilityPaths](self, "accessibilityPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bezierPathWithCGPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityPaths
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  AXVKExplorationVertexElement *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  AXVKExplorationVertexElement *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v26;
  double MidX;
  id v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;
  CGRect v38;
  CGRect v39;

  v37 = *MEMORY[0x24BDAC8D0];
  if (-[VKExplorationAccessibilityElement isCurrent](self, "isCurrent"))
    goto LABEL_14;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[VKExplorationAccessibilityElement vertex](self, "vertex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "neighbors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (!v5)
  {

LABEL_14:
    -[VKExplorationAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
    x = v38.origin.x;
    y = v38.origin.y;
    width = v38.size.width;
    height = v38.size.height;
    v26 = (void *)MEMORY[0x24BDF6870];
    MidX = CGRectGetMidX(v38);
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    objc_msgSend(v26, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMidY(v39), 30.0, 0.0, 6.28318531);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v34 = objc_msgSend(v28, "CGPath");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  v6 = 0;
  v7 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v31 != v7)
        objc_enumerationMutation(v4);
      v9 = *(AXVKExplorationVertexElement **)(*((_QWORD *)&v30 + 1) + 8 * i);
      if (-[AXVKExplorationVertexElement isCurrent](v9, "isCurrent"))
      {
        -[AXVKExplorationVertexElement getScreenPoint](v9, "getScreenPoint");
        v11 = v10;
        v13 = v12;
        -[VKExplorationAccessibilityElement vertex](self, "vertex");
        v14 = (AXVKExplorationVertexElement *)objc_claimAutoreleasedReturnValue();
        v15 = AXVKGetWalkingDirectionBetweenVertices(v9, v14);

        objc_msgSend(MEMORY[0x24BDF6870], "bezierPath");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v15 * 0.0174532925 + 3.14159265;
        v18 = v17 + -0.261799388;
        v19 = v17 + 0.261799388;
        objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v11, v13, 1000.0, v17 + -0.261799388, v17 + 0.261799388);
        objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v11, v13, 30.0, v19, v18);
        objc_msgSend(v16, "closePath");
        v20 = objc_retainAutorelease(v16);
        v35 = objc_msgSend(v20, "CGPath");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
        v21 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v21;
      }
    }
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  }
  while (v5);

  if (!v6)
    goto LABEL_14;
  return v6;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  void *v5;
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
  CGRect result;

  -[VKExplorationAccessibilityElement vertex](self, "vertex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getScreenPoint");

  -[VKExplorationAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLayerHostingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityFrameForBounds();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (VKExplorationAccessibilityElement)initWithAccessibilityContainer:(id)a3 andVertex:(id)a4
{
  id v7;
  VKExplorationAccessibilityElement *v8;
  VKExplorationAccessibilityElement *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VKExplorationAccessibilityElement;
  v8 = -[VKExplorationAccessibilityElement initWithAccessibilityContainer:](&v11, sel_initWithAccessibilityContainer_, a3);
  v9 = v8;
  if (v8)
  {
    v8->_isExplorationElement = 1;
    objc_storeStrong((id *)&v8->_vertex, a4);
  }

  return v9;
}

- (BOOL)accessibilityActivate
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[VKExplorationAccessibilityElement isCurrent](self, "isCurrent");
  if (!v3)
  {
    -[VKExplorationAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityElementManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKExplorationAccessibilityElement vertex](self, "vertex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityMapsExplorationContinueWithVertex:", v6);

  }
  return !v3;
}

- (AXVKExplorationVertexElement)vertex
{
  return self->_vertex;
}

- (void)setVertex:(id)a3
{
  objc_storeStrong((id *)&self->_vertex, a3);
}

- (BOOL)isExplorationElement
{
  return self->_isExplorationElement;
}

- (void)setIsExplorationElement:(BOOL)a3
{
  self->_isExplorationElement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertex, 0);
}

@end
