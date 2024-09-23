@implementation AXARViewElement

- (AXARViewElement)initWithAccessibilityContainer:(id)a3 entityWrapper:(id)a4
{
  id v7;
  AXARViewElement *v8;
  AXARViewElement *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXARViewElement;
  v8 = -[AXARViewElement initWithAccessibilityContainer:](&v11, sel_initWithAccessibilityContainer_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong(&v8->_entityWrapper, a4);

  return v9;
}

- (id)_arView
{
  return (id)-[AXARViewElement _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x23491B578](CFSTR("RealityKit.ARView"), a2));
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  char v5;

  -[AXARViewElement entityWrapper](self, "entityWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("isEntityAccessible")))
  {
    -[AXARViewElement entityWrapper](self, "entityWrapper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isEntityActive"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CGRect)_boundingRect
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  CGRect result;

  -[AXARViewElement _arView](self, "_arView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v13 = 0;
    v14 = (double *)&v13;
    v15 = 0x4010000000;
    v16 = &unk_2329473D9;
    v17 = 0u;
    v18 = 0u;
    v12 = v2;
    AXPerformSafeBlock();
    v4 = v14[4];
    v5 = v14[5];
    v6 = v14[6];
    v7 = v14[7];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v4 = *MEMORY[0x24BDBF090];
    v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

void __32__AXARViewElement__boundingRect__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "entityWrapper");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "calculateScreenBoundingRectIn:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;

}

- (CGRect)accessibilityFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
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
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;

  -[AXARViewElement _boundingRect](self, "_boundingRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_opt_class();
  -[AXARViewElement _arView](self, "_arView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v33.origin.x = v4;
  v33.origin.y = v6;
  v33.size.width = v8;
  v33.size.height = v10;
  v36.origin.x = v14;
  v36.origin.y = v16;
  v36.size.width = v18;
  v36.size.height = v20;
  v34 = CGRectIntersection(v33, v36);
  CGRectIsNull(v34);
  UIAccessibilityFrameForBounds();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v29 = v22;
  v30 = v24;
  v31 = v26;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (id)accessibilityLabel
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  CGRect v10;

  -[AXARViewElement _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AXARViewElement entityWrapper](self, "entityWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("entityLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXARViewElement _boundingRect](self, "_boundingRect");
    if (CGRectIsNull(v10))
    {
      accessibilityLocalizedString(CFSTR("OFF_SCREEN"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  AXPerformSafeBlock();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  if (v2 == *MEMORY[0x24BDF73E0])
    return *MEMORY[0x24BDF7408];
  else
    return v2;
}

void __38__AXARViewElement_accessibilityTraits__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "entityWrapper");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "entityAccessibilityTraits");

}

- (id)_accessibilityScrollStatus
{
  void *v3;
  id v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  CGRect v41;

  -[AXARViewElement _boundingRect](self, "_boundingRect");
  if (CGRectIsNull(v41))
  {
    v3 = 0;
  }
  else
  {
    -[AXARViewElement entityWrapper](self, "entityWrapper");
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    AXPerformSafeBlock();
    v5 = *((_DWORD *)v38 + 6);

    _Block_object_dispose(&v37, 8);
    v6 = (void *)MEMORY[0x24BE00578];
    -[AXARViewElement _boundingRect](self, "_boundingRect");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[AXARViewElement _arView](self, "_arView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessibilityFrame");
    v31 = v16;
    LODWORD(v16) = v5;
    objc_msgSend(v6, "descriptionForDistance:objectFrame:viewBounds:", v16, v8, v10, v12, v14, *(_QWORD *)&v31, v17, v18, v19);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "safeValueForKey:", CFSTR("entityDescription"), v32, CFSTR("__AXStringForVariablesSentinel"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "safeValueForKey:", CFSTR("rootEntityWrapper"), v33, CFSTR("__AXStringForVariablesSentinel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "safeValueForKey:", CFSTR("entityLabel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "length"))
    {
      v23 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("SCENE_LABEL"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringWithFormat:", v24, v22);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v25 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v25;
    }
    objc_msgSend(v21, "safeValueForKey:", CFSTR("entityDescription"), v34, v36);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v26, "length"))
    {
      v27 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("SCENE_DESCRIPTION"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringWithFormat:", v28, v26);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v29 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v29;
    }

  }
  return v3;
}

void __45__AXARViewElement__accessibilityScrollStatus__block_invoke(uint64_t a1)
{
  int v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_arView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "distanceInMetersFromEntityAccessibilityWrapper:", *(_QWORD *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2;

}

- (BOOL)accessibilityActivate
{
  void *v3;
  int v4;
  int v5;
  objc_super v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  AXARViewElement *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  AXARViewElement *v22;

  -[AXARViewElement entityWrapper](self, "entityWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("entitySupportsAccessibilityActivateAction"));

  if (v4)
  {
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __40__AXARViewElement_accessibilityActivate__block_invoke;
    v21 = &unk_250329518;
    v22 = self;
    AXPerformSafeBlock();
  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __40__AXARViewElement_accessibilityActivate__block_invoke_2;
    v11 = &unk_2503294F0;
    v12 = self;
    v13 = &v14;
    AXPerformSafeBlock();
    v5 = *((unsigned __int8 *)v15 + 24);
    _Block_object_dispose(&v14, 8);
    if (!v5)
    {
      v7.receiver = self;
      v7.super_class = (Class)AXARViewElement;
      return -[AXARViewElement accessibilityActivate](&v7, sel_accessibilityActivate);
    }
  }
  return 1;
}

void __40__AXARViewElement_accessibilityActivate__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "entityWrapper");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "entityPerformAccessibilityActivate");

}

void __40__AXARViewElement_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_arView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "entityWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "handleTapForEntityAccessibilityWrapper:", v2);

}

- (id)accessibilityCustomContent
{
  void *v2;
  void *v3;

  -[AXARViewElement entityWrapper](self, "entityWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("entityAccessibilityCustomContent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;

  -[AXARViewElement entityWrapper](self, "entityWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("entityAccessibilityCustomActions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityCustomRotors
{
  void *v2;
  void *v3;

  -[AXARViewElement entityWrapper](self, "entityWrapper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("entityAccessibilityCustomRotors"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)accessibilityIncrement
{
  AXPerformSafeBlock();
}

void __41__AXARViewElement_accessibilityIncrement__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "entityWrapper");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "entityPerformAccessibilityIncrement");

}

- (void)accessibilityDecrement
{
  AXPerformSafeBlock();
}

void __41__AXARViewElement_accessibilityDecrement__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "entityWrapper");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "entityPerformAccessibilityDecrement");

}

- (id)entityWrapper
{
  return self->_entityWrapper;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_entityWrapper, 0);
}

@end
