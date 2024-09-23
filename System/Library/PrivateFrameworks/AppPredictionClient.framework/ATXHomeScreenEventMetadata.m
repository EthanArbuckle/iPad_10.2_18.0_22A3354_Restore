@implementation ATXHomeScreenEventMetadata

- (ATXHomeScreenEventMetadata)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXHomeScreenEventMetadata *v10;
  uint64_t v11;
  NSNumber *pageIndex;
  void *v13;
  uint64_t v14;
  NSArray *bundleIds;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  ATXHomeScreenEventMetadata *v19;
  NSMutableArray *stackIds;
  void *v21;
  void *v22;
  NSMutableArray *v23;
  NSMutableArray *widgets;
  NSArray *v25;
  NSArray *widgetsInStack;
  uint64_t v27;
  NSNumber *isSuggestionInAddWidgetSheet;
  uint64_t v29;
  NSNumber *isWidgetInTodayView;
  ATXCGRectWrapper *v31;
  void *v32;
  uint64_t v33;
  ATXCGRectWrapper *visibleRect;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSURL *engagedUrl;
  uint64_t v40;
  NSNumber *isStalenessRotation;
  objc_super v43;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ATXPBHomeScreenEventMetadata widgetIdentifiables]((uint64_t)v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_70);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[ATXPBHomeScreenEventMetadata widgetInStackIdentifiables]((uint64_t)v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_12_1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v43.receiver = self;
      v43.super_class = (Class)ATXHomeScreenEventMetadata;
      v10 = -[ATXHomeScreenEventMetadata init](&v43, sel_init);
      if (v10)
      {
        if (-[ATXPBHomeScreenEventMetadata hasPageIndex]((uint64_t)v5))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[ATXPBHomeScreenEventMetadata pageIndex]((uint64_t)v5));
          v11 = objc_claimAutoreleasedReturnValue();
          pageIndex = v10->_pageIndex;
          v10->_pageIndex = (NSNumber *)v11;

        }
        -[ATXPBHomeScreenEventMetadata bundleIds]((uint64_t)v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "copy");
        bundleIds = v10->_bundleIds;
        v10->_bundleIds = (NSArray *)v14;

        v10->_suggestedPageType = (int)-[ATXPBHomeScreenEventMetadata suggestedPageType]((uint64_t)v5);
        -[ATXPBHomeScreenEventMetadata stackIds]((uint64_t)v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
          v18 = v16;
        else
          v18 = (NSMutableArray *)objc_opt_new();
        stackIds = v10->_stackIds;
        v10->_stackIds = v18;

        v21 = (void *)objc_msgSend(v7, "mutableCopy");
        v22 = v21;
        if (v21)
          v23 = v21;
        else
          v23 = (NSMutableArray *)objc_opt_new();
        widgets = v10->_widgets;
        v10->_widgets = v23;

        if (v9)
          v25 = v9;
        else
          v25 = (NSArray *)objc_opt_new();
        widgetsInStack = v10->_widgetsInStack;
        v10->_widgetsInStack = v25;

        if (-[ATXPBHomeScreenEventMetadata hasIsSuggestionInAddWidgetSheet]((uint64_t)v5))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXPBHomeScreenEventMetadata isSuggestionInAddWidgetSheet]((_BOOL8)v5));
          v27 = objc_claimAutoreleasedReturnValue();
          isSuggestionInAddWidgetSheet = v10->_isSuggestionInAddWidgetSheet;
          v10->_isSuggestionInAddWidgetSheet = (NSNumber *)v27;

        }
        if (-[ATXPBHomeScreenEventMetadata hasIsWidgetInTodayView]((uint64_t)v5))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXPBHomeScreenEventMetadata isWidgetInTodayView]((_BOOL8)v5));
          v29 = objc_claimAutoreleasedReturnValue();
          isWidgetInTodayView = v10->_isWidgetInTodayView;
          v10->_isWidgetInTodayView = (NSNumber *)v29;

        }
        v31 = [ATXCGRectWrapper alloc];
        -[ATXPBHomeScreenEventMetadata visibleRect]((uint64_t)v5);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[ATXCGRectWrapper initWithProto:](v31, "initWithProto:", v32);
        visibleRect = v10->_visibleRect;
        v10->_visibleRect = (ATXCGRectWrapper *)v33;

        -[ATXPBHomeScreenEventMetadata engagedUrl]((uint64_t)v5);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          v36 = (void *)MEMORY[0x1E0C99E98];
          -[ATXPBHomeScreenEventMetadata engagedUrl]((uint64_t)v5);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "URLWithString:", v37);
          v38 = objc_claimAutoreleasedReturnValue();
          engagedUrl = v10->_engagedUrl;
          v10->_engagedUrl = (NSURL *)v38;

        }
        if (-[ATXPBHomeScreenEventMetadata hasIsStalenessRotation]((uint64_t)v5))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXPBHomeScreenEventMetadata isStalenessRotation]((_BOOL8)v5));
          v40 = objc_claimAutoreleasedReturnValue();
          isStalenessRotation = v10->_isStalenessRotation;
          v10->_isStalenessRotation = (NSNumber *)v40;

        }
      }
      self = v10;

      v19 = self;
    }
    else
    {
      __atxlog_handle_default();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXHomeScreenEventMetadata initWithProto:].cold.1((uint64_t)self, v5);
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)proto
{
  void *v3;
  NSNumber *pageIndex;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSNumber *isWidgetInTodayView;
  void *v13;
  void *v14;
  NSNumber *isStalenessRotation;

  v3 = (void *)objc_opt_new();
  pageIndex = self->_pageIndex;
  if (pageIndex)
    -[ATXPBHomeScreenEventMetadata setPageIndex:]((uint64_t)v3, -[NSNumber unsignedIntegerValue](pageIndex, "unsignedIntegerValue"));
  v5 = (void *)-[NSArray mutableCopy](self->_bundleIds, "mutableCopy");
  -[ATXPBHomeScreenEventMetadata setBundleIds:]((uint64_t)v3, v5);

  -[ATXPBHomeScreenEventMetadata setStackIds:]((uint64_t)v3, self->_stackIds);
  -[ATXPBHomeScreenEventMetadata setSuggestedPageType:]((uint64_t)v3, self->_suggestedPageType);
  -[NSMutableArray _pas_mappedArrayWithTransform:](self->_widgets, "_pas_mappedArrayWithTransform:", &__block_literal_global_17_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray _pas_mappedArrayWithTransform:](self->_widgetsInStack, "_pas_mappedArrayWithTransform:", &__block_literal_global_18_1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  -[ATXPBHomeScreenEventMetadata setWidgetIdentifiables:]((uint64_t)v3, v8);

  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  -[ATXPBHomeScreenEventMetadata setWidgetInStackIdentifiables:]((uint64_t)v3, v9);

  -[ATXHomeScreenEventMetadata isSuggestionInAddWidgetSheet](self, "isSuggestionInAddWidgetSheet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ATXHomeScreenEventMetadata isSuggestionInAddWidgetSheet](self, "isSuggestionInAddWidgetSheet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXPBHomeScreenEventMetadata setIsSuggestionInAddWidgetSheet:]((uint64_t)v3, objc_msgSend(v11, "BOOLValue"));

  }
  isWidgetInTodayView = self->_isWidgetInTodayView;
  if (isWidgetInTodayView)
    -[ATXPBHomeScreenEventMetadata setIsWidgetInTodayView:]((uint64_t)v3, -[NSNumber BOOLValue](isWidgetInTodayView, "BOOLValue"));
  -[ATXCGRectWrapper proto](self->_visibleRect, "proto");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenEventMetadata setVisibleRect:]((uint64_t)v3, v13);

  -[NSURL absoluteString](self->_engagedUrl, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPBHomeScreenEventMetadata setEngagedUrl:]((uint64_t)v3, v14);

  isStalenessRotation = self->_isStalenessRotation;
  if (isStalenessRotation)
    -[ATXPBHomeScreenEventMetadata setIsStalenessRotation:]((uint64_t)v3, -[NSNumber BOOLValue](isStalenessRotation, "BOOLValue"));

  return v3;
}

- (NSNumber)isSuggestionInAddWidgetSheet
{
  return self->_isSuggestionInAddWidgetSheet;
}

- (void)setPageIndex:(id)a3
{
  objc_storeStrong((id *)&self->_pageIndex, a3);
}

- (ATXHomeScreenEventMetadata)init
{
  return -[ATXHomeScreenEventMetadata initWithPageIndex:suggestedPageType:stacks:widgetsInStack:isSuggestionInAddWidgetSheet:isWidgetInTodayView:visibleRect:engagedUrl:](self, "initWithPageIndex:suggestedPageType:stacks:widgetsInStack:isSuggestionInAddWidgetSheet:isWidgetInTodayView:visibleRect:engagedUrl:", 0, 0, 0, 0, 0, 0, 0, 0);
}

- (ATXHomeScreenEventMetadata)initWithPageIndex:(id)a3 suggestedPageType:(int64_t)a4 stacks:(id)a5 widgetsInStack:(id)a6 isSuggestionInAddWidgetSheet:(id)a7 isWidgetInTodayView:(id)a8 visibleRect:(id)a9 engagedUrl:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  ATXHomeScreenEventMetadata *v20;
  ATXHomeScreenEventMetadata *v21;
  uint64_t v22;
  NSMutableArray *stackIds;
  uint64_t v24;
  NSMutableArray *widgets;
  void *v26;
  void *v27;
  NSArray *v28;
  NSArray *widgetsInStack;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v16 = a5;
  v17 = a6;
  v33 = a7;
  v32 = a8;
  v18 = a9;
  v19 = a10;
  v35.receiver = self;
  v35.super_class = (Class)ATXHomeScreenEventMetadata;
  v20 = -[ATXHomeScreenEventMetadata init](&v35, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_pageIndex, a3);
    v22 = objc_opt_new();
    stackIds = v21->_stackIds;
    v21->_stackIds = (NSMutableArray *)v22;

    v24 = objc_opt_new();
    widgets = v21->_widgets;
    v21->_widgets = (NSMutableArray *)v24;

    v26 = (void *)objc_msgSend(v17, "copy");
    v27 = v26;
    if (v26)
      v28 = v26;
    else
      v28 = (NSArray *)objc_opt_new();
    widgetsInStack = v21->_widgetsInStack;
    v21->_widgetsInStack = v28;

    objc_storeStrong((id *)&v21->_isSuggestionInAddWidgetSheet, a7);
    objc_storeStrong((id *)&v21->_isWidgetInTodayView, a8);
    objc_storeStrong((id *)&v21->_visibleRect, a9);
    objc_storeStrong((id *)&v21->_engagedUrl, a10);
    v21->_suggestedPageType = a4;
  }
  -[ATXHomeScreenEventMetadata setStacks:](v21, "setStacks:", v16, a4);

  return v21;
}

- (void)setStacks:(id)a3
{
  NSMutableArray *stackIds;
  id v5;
  _QWORD v6[5];

  stackIds = self->_stackIds;
  v5 = a3;
  -[NSMutableArray removeAllObjects](stackIds, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_widgets, "removeAllObjects");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__ATXHomeScreenEventMetadata_setStacks___block_invoke;
  v6[3] = &unk_1E4D5B330;
  v6[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isStalenessRotation, 0);
  objc_storeStrong((id *)&self->_engagedUrl, 0);
  objc_storeStrong((id *)&self->_visibleRect, 0);
  objc_storeStrong((id *)&self->_isWidgetInTodayView, 0);
  objc_storeStrong((id *)&self->_isSuggestionInAddWidgetSheet, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
  objc_storeStrong((id *)&self->_widgetsInStack, 0);
  objc_storeStrong((id *)&self->_pageIndex, 0);
  objc_storeStrong((id *)&self->_widgets, 0);
  objc_storeStrong((id *)&self->_stackIds, 0);
}

- (NSDictionary)stacks
{
  NSMutableArray *stackIds;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14;
  v11 = __Block_byref_object_dispose__14;
  v12 = (id)objc_opt_new();
  stackIds = self->_stackIds;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__ATXHomeScreenEventMetadata_stacks__block_invoke;
  v6[3] = &unk_1E4D5B308;
  v6[4] = self;
  v6[5] = &v7;
  -[NSMutableArray enumerateObjectsUsingBlock:](stackIds, "enumerateObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __36__ATXHomeScreenEventMetadata_stacks__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count") > a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setValue:forKey:", v5, v6);

  }
}

void __40__ATXHomeScreenEventMetadata_setStacks___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a3;
  objc_msgSend(v5, "addObject:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", v6);

}

- (ATXHomeScreenEventMetadata)initWithProtoData:(id)a3
{
  id v4;
  ATXPBHomeScreenEventMetadata *v5;
  ATXHomeScreenEventMetadata *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBHomeScreenEventMetadata initWithData:]([ATXPBHomeScreenEventMetadata alloc], "initWithData:", v4);

    self = -[ATXHomeScreenEventMetadata initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

ATXHomeScreenWidgetIdentifiable *__44__ATXHomeScreenEventMetadata_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXHomeScreenWidgetIdentifiable *v3;

  v2 = a2;
  v3 = -[ATXHomeScreenWidgetIdentifiable initWithProto:]([ATXHomeScreenWidgetIdentifiable alloc], "initWithProto:", v2);

  return v3;
}

ATXHomeScreenWidgetIdentifiable *__44__ATXHomeScreenEventMetadata_initWithProto___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  ATXHomeScreenWidgetIdentifiable *v3;

  v2 = a2;
  v3 = -[ATXHomeScreenWidgetIdentifiable initWithProto:]([ATXHomeScreenWidgetIdentifiable alloc], "initWithProto:", v2);

  return v3;
}

uint64_t __35__ATXHomeScreenEventMetadata_proto__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

uint64_t __35__ATXHomeScreenEventMetadata_proto__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXHomeScreenEventMetadata proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXHomeScreenEventMetadata encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXHomeScreenEventMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXHomeScreenEventMetadata *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXHomeScreenEventMetadata initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  ATXHomeScreenEventMetadata *v4;
  ATXHomeScreenEventMetadata *v5;
  BOOL v6;

  v4 = (ATXHomeScreenEventMetadata *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXHomeScreenEventMetadata isEqualToATXHomeScreenEventMetadata:](self, "isEqualToATXHomeScreenEventMetadata:", v5);

  return v6;
}

- (BOOL)isEqualToATXHomeScreenEventMetadata:(id)a3
{
  id *v4;
  NSNumber *pageIndex;
  NSNumber *v6;
  NSNumber *v7;
  NSNumber *v8;
  char v9;
  NSMutableArray *stackIds;
  NSMutableArray *v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  char v14;
  NSMutableArray *widgets;
  NSMutableArray *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  char v19;
  NSArray *widgetsInStack;
  NSArray *v21;
  NSArray *v22;
  NSArray *v23;
  char v24;
  NSNumber *isSuggestionInAddWidgetSheet;
  NSNumber *v26;
  NSNumber *v27;
  NSNumber *v28;
  char v29;
  NSNumber *isWidgetInTodayView;
  NSNumber *v31;
  NSNumber *v32;
  NSNumber *v33;
  char v34;
  ATXCGRectWrapper *visibleRect;
  ATXCGRectWrapper *v36;
  ATXCGRectWrapper *v37;
  ATXCGRectWrapper *v38;
  BOOL v39;
  char v40;
  NSURL *v42;
  NSURL *v43;

  v4 = (id *)a3;
  pageIndex = self->_pageIndex;
  v6 = (NSNumber *)v4[3];
  if (pageIndex == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = pageIndex;
    v9 = -[NSNumber isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_27;
  }
  stackIds = self->_stackIds;
  v11 = (NSMutableArray *)v4[1];
  if (stackIds == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = stackIds;
    v14 = -[NSMutableArray isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_27;
  }
  widgets = self->_widgets;
  v16 = (NSMutableArray *)v4[2];
  if (widgets == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = widgets;
    v19 = -[NSMutableArray isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_27;
  }
  widgetsInStack = self->_widgetsInStack;
  v21 = (NSArray *)v4[5];
  if (widgetsInStack == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = widgetsInStack;
    v24 = -[NSArray isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_27;
  }
  isSuggestionInAddWidgetSheet = self->_isSuggestionInAddWidgetSheet;
  v26 = (NSNumber *)v4[7];
  if (isSuggestionInAddWidgetSheet == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = isSuggestionInAddWidgetSheet;
    v29 = -[NSNumber isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_27;
  }
  isWidgetInTodayView = self->_isWidgetInTodayView;
  v31 = (NSNumber *)v4[8];
  if (isWidgetInTodayView == v31)
  {

  }
  else
  {
    v32 = v31;
    v33 = isWidgetInTodayView;
    v34 = -[NSNumber isEqual:](v33, "isEqual:", v32);

    if ((v34 & 1) == 0)
      goto LABEL_27;
  }
  visibleRect = self->_visibleRect;
  v36 = (ATXCGRectWrapper *)v4[9];
  if (visibleRect == v36)
  {

  }
  else
  {
    v37 = v36;
    v38 = visibleRect;
    v39 = -[ATXCGRectWrapper isEqual:](v38, "isEqual:", v37);

    if (!v39)
    {
LABEL_27:
      v40 = 0;
      goto LABEL_28;
    }
  }
  v42 = self->_engagedUrl;
  v43 = v42;
  if (v42 == v4[10])
    v40 = 1;
  else
    v40 = -[NSURL isEqual:](v42, "isEqual:");

LABEL_28:
  return v40;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v3 = -[NSNumber hash](self->_pageIndex, "hash");
  v4 = -[NSMutableArray hash](self->_stackIds, "hash") - v3 + 32 * v3;
  v5 = -[NSMutableArray hash](self->_widgets, "hash") - v4 + 32 * v4;
  v6 = -[NSArray hash](self->_widgetsInStack, "hash") - v5 + 32 * v5;
  v7 = -[NSNumber hash](self->_isSuggestionInAddWidgetSheet, "hash") - v6 + 32 * v6;
  v8 = -[NSNumber hash](self->_isWidgetInTodayView, "hash") - v7 + 32 * v7;
  v9 = -[ATXCGRectWrapper hash](self->_visibleRect, "hash") - v8 + 32 * v8;
  return -[NSURL hash](self->_engagedUrl, "hash") - v9 + 32 * v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSNumber *pageIndex;
  NSNumber *isSuggestionInAddWidgetSheet;
  int64_t suggestedPageType;
  __CFString *v19;
  NSNumber *isWidgetInTodayView;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[ATXHomeScreenEventMetadata stacks](self, "stacks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dictionaryRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
  }

  -[ATXHomeScreenEventMetadata widgetsInStack](self, "widgetsInStack");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_25_0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_pageIndex)
    pageIndex = self->_pageIndex;
  else
    pageIndex = (NSNumber *)CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", pageIndex, CFSTR("pageIndex"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("stacks"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("widgetsInStack"));
  if (self->_isSuggestionInAddWidgetSheet)
    isSuggestionInAddWidgetSheet = self->_isSuggestionInAddWidgetSheet;
  else
    isSuggestionInAddWidgetSheet = (NSNumber *)CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", isSuggestionInAddWidgetSheet, CFSTR("isSuggestionInAddWidgetSheet"));
  suggestedPageType = self->_suggestedPageType;
  if (suggestedPageType >= 0xC)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_suggestedPageType);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E4D5B3B0[(int)suggestedPageType];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("suggestedPageType"));

  if (self->_isWidgetInTodayView)
    isWidgetInTodayView = self->_isWidgetInTodayView;
  else
    isWidgetInTodayView = (NSNumber *)CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", isWidgetInTodayView, CFSTR("isWidgetInTodayView"));
  -[ATXCGRectWrapper description](self->_visibleRect, "description");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = (const __CFString *)v21;
  else
    v23 = CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("visibleRect"));

  -[NSURL absoluteString](self->_engagedUrl, "absoluteString");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = (const __CFString *)v24;
  else
    v26 = CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("engagedUrl"));

  -[NSArray componentsJoinedByString:](self->_bundleIds, "componentsJoinedByString:", CFSTR(", "));
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    v29 = (const __CFString *)v27;
  else
    v29 = CFSTR("nil");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("bundleIds"));

  return v3;
}

uint64_t __54__ATXHomeScreenEventMetadata_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (NSNumber)pageIndex
{
  return self->_pageIndex;
}

- (int64_t)suggestedPageType
{
  return self->_suggestedPageType;
}

- (void)setSuggestedPageType:(int64_t)a3
{
  self->_suggestedPageType = a3;
}

- (NSArray)widgetsInStack
{
  return self->_widgetsInStack;
}

- (void)setWidgetsInStack:(id)a3
{
  objc_storeStrong((id *)&self->_widgetsInStack, a3);
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIds, a3);
}

- (void)setIsSuggestionInAddWidgetSheet:(id)a3
{
  objc_storeStrong((id *)&self->_isSuggestionInAddWidgetSheet, a3);
}

- (NSNumber)isWidgetInTodayView
{
  return self->_isWidgetInTodayView;
}

- (void)setIsWidgetInTodayView:(id)a3
{
  objc_storeStrong((id *)&self->_isWidgetInTodayView, a3);
}

- (ATXCGRectWrapper)visibleRect
{
  return self->_visibleRect;
}

- (void)setVisibleRect:(id)a3
{
  objc_storeStrong((id *)&self->_visibleRect, a3);
}

- (NSURL)engagedUrl
{
  return self->_engagedUrl;
}

- (void)setEngagedUrl:(id)a3
{
  objc_storeStrong((id *)&self->_engagedUrl, a3);
}

- (NSNumber)isStalenessRotation
{
  return self->_isStalenessRotation;
}

- (void)setIsStalenessRotation:(id)a3
{
  objc_storeStrong((id *)&self->_isStalenessRotation, a3);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBHomeScreenEventMetadata proto", (uint8_t *)&v5, 0xCu);

}

@end
