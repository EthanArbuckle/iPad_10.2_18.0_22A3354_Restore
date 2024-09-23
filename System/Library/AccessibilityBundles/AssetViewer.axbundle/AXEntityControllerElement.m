@implementation AXEntityControllerElement

- (AXEntityControllerElement)initWithAccessibilityContainer:(id)a3 entityController:(id)a4 previewViewController:(id)a5
{
  id v8;
  id v9;
  AXEntityControllerElement *v10;
  AXEntityControllerElement *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)AXEntityControllerElement;
  v10 = -[AXEntityControllerElement initWithAccessibilityContainer:](&v13, sel_initWithAccessibilityContainer_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak(&v10->_entityController, v8);
    objc_storeWeak(&v11->_previewViewController, v9);
  }

  return v11;
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  int v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;

  -[AXEntityControllerElement previewViewController](self, "previewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXEntityControllerElement entityController](self, "entityController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_axEmitterMode");
  v6 = 0;
  if (v4 && v3 && v5 == 2)
  {
    if ((objc_msgSend(v3, "_axIsOffScreenForEntityController:", v4) & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v29 = 0;
      v30 = &v29;
      v31 = 0x2020000000;
      v32 = 0;
      v27 = v3;
      v28 = v4;
      AXPerformSafeBlock();
      v26 = *((_DWORD *)v30 + 6);

      _Block_object_dispose(&v29, 8);
      objc_msgSend(v27, "_axBoundingRectForEntityController:", v28);
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[AXEntityControllerElement _arView](self, "_arView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;

      LODWORD(v24) = v26;
      objc_msgSend(MEMORY[0x24BE00578], "descriptionForDistance:objectFrame:viewBounds:", v24, v8, v10, v12, v14, v17, v19, v21, v23);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6;
}

uint64_t __55__AXEntityControllerElement__accessibilityScrollStatus__block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = objc_msgSend(*(id *)(a1 + 32), "accessibilityDistanceInMetersFromEntityController:", *(_QWORD *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (id)entityController
{
  return objc_loadWeakRetained(&self->_entityController);
}

- (void)setEntityController:(id)a3
{
  objc_storeWeak(&self->_entityController, a3);
}

- (id)previewViewController
{
  return objc_loadWeakRetained(&self->_previewViewController);
}

- (void)setPreviewViewController:(id)a3
{
  objc_storeWeak(&self->_previewViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_previewViewController);
  objc_destroyWeak(&self->_entityController);
}

@end
