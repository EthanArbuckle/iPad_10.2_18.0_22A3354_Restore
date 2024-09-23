@implementation MKLabelSelectionFilter

- (MKLabelSelectionFilter)initWithMapFeatureOptions:(int64_t)a3
{
  MKLabelSelectionFilter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKLabelSelectionFilter;
  result = -[MKLabelSelectionFilter init](&v5, sel_init);
  if (result)
    result->_featureOptions = a3;
  return result;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (int64_t)mapFeatureOptions
{
  return self->_featureOptions;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong(&self->_selectionHandler, 0);
}

- (MKLabelSelectionFilter)initWithSelectionHandler:(id)a3
{
  id v4;
  MKLabelSelectionFilter *v5;
  MKLabelSelectionFilter *v6;
  uint64_t v7;
  id selectionHandler;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MKLabelSelectionFilter;
  v5 = -[MKLabelSelectionFilter init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_featureOptions = 7;
    v7 = MEMORY[0x18D778DB8](v4);
    selectionHandler = v6->_selectionHandler;
    v6->_selectionHandler = (id)v7;

  }
  return v6;
}

- (BOOL)canSelectLabelMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  char v9;
  MKMapFeatureAnnotation *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MKLabelSelectionFilter mapView](self, "mapView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v8 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "elevationStyle") == 0;
    v10 = -[MKMapFeatureAnnotation initWithVKLabelMarker:isHybridMap:]([MKMapFeatureAnnotation alloc], "initWithVKLabelMarker:isHybridMap:", v4, v8);
    v9 = (*((uint64_t (**)(void))self->_selectionHandler + 2))();

  }
  else
  {
    objc_initWeak(&location, self);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__MKLabelSelectionFilter_canSelectLabelMarker___block_invoke;
    v12[3] = &unk_1E20DCD18;
    v14 = &v16;
    objc_copyWeak(&v15, &location);
    v13 = v4;
    dispatch_sync(MEMORY[0x1E0C80D38], v12);
    v9 = *((_BYTE *)v17 + 24) != 0;

    objc_destroyWeak(&v15);
    _Block_object_dispose(&v16, 8);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __47__MKLabelSelectionFilter_canSelectLabelMarker___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(WeakRetained, "canSelectLabelMarker:", *(_QWORD *)(a1 + 32));

}

- (BOOL)selectionEnabled
{
  return self->_selectionHandler || self->_featureOptions != 0;
}

- (BOOL)isFeatureAnnotationSelectable:(id)a3
{
  uint64_t (**selectionHandler)(id, id);
  uint64_t v6;
  int v7;

  selectionHandler = (uint64_t (**)(id, id))self->_selectionHandler;
  if (selectionHandler)
    return selectionHandler[2](selectionHandler, a3);
  v6 = objc_msgSend(a3, "featureType");
  switch(v6)
  {
    case 2:
      v7 = (LOBYTE(self->_featureOptions) >> 2) & 1;
      break;
    case 1:
      v7 = (LOBYTE(self->_featureOptions) >> 1) & 1;
      break;
    case 0:
      LOBYTE(v7) = self->_featureOptions & 1;
      break;
  }
  return v7 & 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[MKLabelSelectionFilter isEqualToLabelSelectionFilter:](self, "isEqualToLabelSelectionFilter:", v4);

  return v5;
}

- (BOOL)isEqualToLabelSelectionFilter:(id)a3
{
  return self->_selectionHandler == (id)*((_QWORD *)a3 + 1) && self->_featureOptions == *((_QWORD *)a3 + 2);
}

- (BOOL)isLabelSelectable:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;

  v4 = a3;
  objc_msgSend(v4, "featureAnnotation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "featureAnnotation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "annotationView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEnabled");

  }
  else if (self->_selectionHandler)
  {
    v9 = -[MKLabelSelectionFilter canSelectLabelMarker:](self, "canSelectLabelMarker:", v4);
  }
  else
  {
    v10 = objc_msgSend(v4, "externalFeatureCategory");
    if (v10 == 1)
    {
      if ((self->_featureOptions & 1) == 0)
      {
        v9 = 0;
        goto LABEL_14;
      }
      v13 = objc_msgSend(v4, "pickedLabelBalloonBehavior") == 1;
    }
    else
    {
      v11 = v10;
      v12 = 4;
      if (v10 != 3)
        v12 = 0;
      if (v10 != 2)
        v11 = v12;
      v13 = (self->_featureOptions & v11) == 0;
    }
    v9 = !v13;
  }
LABEL_14:

  return v9;
}

- (void)performQueries:(id)a3 completionHandler:(id)a4 completionQueue:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "labelMarker");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setResult:", -[MKLabelSelectionFilter isLabelSelectable:](self, "isLabelSelectable:", v16));

      }
      v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __75__MKLabelSelectionFilter_performQueries_completionHandler_completionQueue___block_invoke;
  v19[3] = &unk_1E20D7F70;
  v20 = v8;
  v21 = v9;
  v17 = v8;
  v18 = v9;
  dispatch_async(v10, v19);

}

uint64_t __75__MKLabelSelectionFilter_performQueries_completionHandler_completionQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  MKLabelSelectionFilter *v4;
  uint64_t v5;
  id selectionHandler;
  id WeakRetained;

  v4 = objc_alloc_init(MKLabelSelectionFilter);
  v5 = MEMORY[0x18D778DB8](self->_selectionHandler);
  selectionHandler = v4->_selectionHandler;
  v4->_selectionHandler = (id)v5;

  v4->_featureOptions = self->_featureOptions;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  objc_storeWeak((id *)&v4->_mapView, WeakRetained);

  return v4;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void)setMapView:(id)a3
{
  objc_storeWeak((id *)&self->_mapView, a3);
}

@end
