@implementation AXUIContextDrawingAnnotation

+ (void)addLabel:(id)a3 boundingRect:(CGRect)a4 withContext:(CGContext *)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  AXUIContextDrawingAnnotation *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  AXUIContextDrawingAnnotation *v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AXUIContextDrawingAnnotation initWithLabel:boundingRect:]([AXUIContextDrawingAnnotation alloc], "initWithLabel:boundingRect:", v11, x, y, width, height);
    objc_msgSend(a1, "contextAnnotationMap");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v14);
    objc_msgSend(v14, "objectForKeyedSubscript:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, v12);

    }
    objc_msgSend(v14, "objectForKeyedSubscript:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v13);

    v18 = v14;
    v19 = v12;
    v20 = v13;
    AXPerformBlockOnMainThreadAfterDelay();

    objc_sync_exit(v18);
  }

}

- (AXUIContextDrawingAnnotation)initWithLabel:(id)a3 boundingRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  AXUIContextDrawingAnnotation *v11;
  AXUIContextDrawingAnnotation *v12;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXUIContextDrawingAnnotation;
  v11 = -[AXUIContextDrawingAnnotation init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_label, a3);
    v12->_boundingRect.origin.x = x;
    v12->_boundingRect.origin.y = y;
    v12->_boundingRect.size.width = width;
    v12->_boundingRect.size.height = height;
  }

  return v12;
}

+ (id)contextAnnotationMap
{
  if (contextAnnotationMap_onceToken != -1)
    dispatch_once(&contextAnnotationMap_onceToken, &__block_literal_global_7);
  return (id)contextAnnotationMap___axContextAnnotationMap;
}

+ (id)annotationsForContext:(CGContext *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "contextAnnotationMap");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v5);
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    if (v7)
      objc_msgSend(v5, "removeObjectForKey:", v4);
    objc_sync_exit(v5);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void __66__AXUIContextDrawingAnnotation_addLabel_boundingRect_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(obj);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

void __52__AXUIContextDrawingAnnotation_contextAnnotationMap__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)contextAnnotationMap___axContextAnnotationMap;
  contextAnnotationMap___axContextAnnotationMap = (uint64_t)v0;

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;
  CGRect v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)AXUIContextDrawingAnnotation;
  -[AXUIContextDrawingAnnotation description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIContextDrawingAnnotation label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIContextDrawingAnnotation boundingRect](self, "boundingRect");
  NSStringFromCGRect(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, label=%@, boundingRect=%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (CGRect)boundingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingRect.origin.x;
  y = self->_boundingRect.origin.y;
  width = self->_boundingRect.size.width;
  height = self->_boundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
