@implementation FBSDisplayLayout

- (NSArray)elements
{
  return &self->_elements->super;
}

uint64_t __33__FBSDisplayLayout__sortElements__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(a2, "level"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "level");

  objc_msgSend(v7, "numberWithInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

- (int64_t)displayBacklightLevel
{
  return self->_backlightLevel;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (FBSDisplayLayout)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  FBSDisplayLayout *v6;
  uint64_t v7;
  FBSDisplayConfiguration *displayConfiguration;
  double v9;
  uint64_t v10;
  NSDate *timestamp;
  id v12;
  void *v13;
  Class Class;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  int64_t value;
  id v21;
  Class v22;
  objc_class *v23;

  v4 = a3;
  BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[FBSDisplayLayout _initWithElements:](self, "_initWithElements:", v5);
  if (!v6)
    goto LABEL_12;
  v7 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
  displayConfiguration = v6->_displayConfiguration;
  v6->_displayConfiguration = (FBSDisplayConfiguration *)v7;

  v6->_backlightLevel = xpc_dictionary_get_int64(v4, "backlightLevel");
  v6->_interfaceOrientation = xpc_dictionary_get_int64(v4, "orientation");
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  if (v9 > 0.0)
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v9);
    timestamp = v6->_timestamp;
    v6->_timestamp = (NSDate *)v10;

  }
  v12 = v4;
  v13 = v12;
  if (!v12
    || (Class = object_getClass(v12),
        v15 = (objc_class *)MEMORY[0x1E0C812F8],
        v13,
        v13,
        Class != v15))
  {
    v16 = 0;
LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  xpc_dictionary_get_value(v13, "backlightState");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v21;
  if (!v21)
    goto LABEL_7;
  v22 = object_getClass(v21);
  v23 = (objc_class *)MEMORY[0x1E0C81328];

  if (v22 == v23)
    v17 = v16;
  else
    v17 = 0;
LABEL_8:
  v18 = v17;

  if (v18)
    value = xpc_int64_get_value(v18);
  else
    value = 0x7FFFFFFFFFFFFFFFLL;
  v6->_backlightState = value;

LABEL_12:
  return v6;
}

- (id)_initWithElements:(id)a3
{
  id v4;
  FBSDisplayLayout *v5;
  uint64_t v6;
  NSMutableArray *elements;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FBSDisplayLayout;
  v5 = -[FBSDisplayLayout init](&v9, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = objc_opt_new();
    }
    elements = v5->_elements;
    v5->_elements = (NSMutableArray *)v6;

    *(_OWORD *)&v5->_interfaceOrientation = xmmword_19A767F10;
    v5->_backlightState = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_elements, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t backlightLevel;
  uint64_t v7;
  id v8;
  id v9;
  int64_t backlightState;
  id v11;
  id v12;
  int64_t interfaceOrientation;
  id v14;
  id v15;
  NSMutableArray *elements;
  id v17;
  id v18;
  FBSDisplayConfiguration *displayConfiguration;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v4 = a3;
  objc_msgSend(off_1E38E9E00, "builderWithObject:ofExpectedClass:", self, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  backlightLevel = self->_backlightLevel;
  v7 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __28__FBSDisplayLayout_isEqual___block_invoke;
  v31[3] = &unk_1E38EB9E8;
  v8 = v4;
  v32 = v8;
  v9 = (id)objc_msgSend(v5, "appendInteger:counterpart:", backlightLevel, v31);
  backlightState = self->_backlightState;
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __28__FBSDisplayLayout_isEqual___block_invoke_2;
  v29[3] = &unk_1E38EB9E8;
  v11 = v8;
  v30 = v11;
  v12 = (id)objc_msgSend(v5, "appendInteger:counterpart:", backlightState, v29);
  interfaceOrientation = self->_interfaceOrientation;
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __28__FBSDisplayLayout_isEqual___block_invoke_3;
  v27[3] = &unk_1E38EB9E8;
  v14 = v11;
  v28 = v14;
  v15 = (id)objc_msgSend(v5, "appendInteger:counterpart:", interfaceOrientation, v27);
  elements = self->_elements;
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __28__FBSDisplayLayout_isEqual___block_invoke_4;
  v25[3] = &unk_1E38EC3A0;
  v17 = v14;
  v26 = v17;
  v18 = (id)objc_msgSend(v5, "appendObject:counterpart:", elements, v25);
  displayConfiguration = self->_displayConfiguration;
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __28__FBSDisplayLayout_isEqual___block_invoke_5;
  v23[3] = &unk_1E38EBA38;
  v24 = v17;
  v20 = v17;
  v21 = (id)objc_msgSend(v5, "appendObject:counterpart:", displayConfiguration, v23);
  LOBYTE(displayConfiguration) = objc_msgSend(v5, "isEqual");

  return (char)displayConfiguration;
}

- (id)addElement:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  if (v4)
  {
    -[NSMutableArray addObject:](self->_elements, "addObject:", v4);
    -[FBSDisplayLayout _sortElements](self, "_sortElements");
  }
  return v4;
}

- (void)_sortElements
{
  -[NSMutableArray sortUsingComparator:](self->_elements, "sortUsingComparator:", &__block_literal_global_7);
}

- (void)finalizeLayout
{
  NSDate *v3;
  NSDate *timestamp;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t i;
  void *v19;
  BOOL IsEmpty;
  double v21;
  double MinX;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  int64_t interfaceOrientation;
  double Height;
  double MinY;
  double Width;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat rect;
  double rect_8;
  double rect_16;
  double rect_24;
  double v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;
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

  v48 = *MEMORY[0x1E0C80C00];
  v3 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
  timestamp = self->_timestamp;
  self->_timestamp = v3;

  -[FBSDisplayConfiguration bounds](self->_displayConfiguration, "bounds");
  v6 = v5;
  rect_16 = v7;
  v9 = v8;
  v11 = v10;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v12 = self->_elements;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v44;
    v16 = *MEMORY[0x1E0C9D648];
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    rect_24 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v42 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v37 = *MEMORY[0x1E0C9D648];
    rect = v6;
    rect_8 = v17;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v44 != v15)
          objc_enumerationMutation(v12);
        v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (objc_msgSend(v19, "fillsDisplayBounds"))
          objc_msgSend(v19, "setReferenceFrame:", v6, rect_16, v9, v11);
        objc_msgSend(v19, "referenceFrame");
        IsEmpty = CGRectIsEmpty(v49);
        v21 = v16;
        MinX = v17;
        v24 = rect_24;
        v23 = v42;
        if (!IsEmpty)
        {
          objc_msgSend(v19, "referenceFrame");
          v21 = v25;
          MinX = v26;
          v24 = v27;
          v29 = v28;
          interfaceOrientation = self->_interfaceOrientation;
          if (interfaceOrientation != 2)
          {
            if (interfaceOrientation == 3)
            {
              MinY = CGRectGetMinY(*(CGRect *)&v25);
              v53.origin.x = v6;
              v53.origin.y = rect_16;
              v53.size.width = v9;
              v53.size.height = v11;
              Width = CGRectGetWidth(v53);
              v54.origin.x = v21;
              v54.origin.y = MinX;
              v54.size.width = v24;
              v54.size.height = v29;
              MinX = Width - CGRectGetMaxX(v54);
              v6 = rect;
LABEL_14:
              v21 = MinY;
              v16 = v37;
              v23 = v29;
            }
            else
            {
              if (interfaceOrientation == 4)
              {
                v50.origin.x = v6;
                v50.origin.y = rect_16;
                v50.size.width = v9;
                v50.size.height = v11;
                Height = CGRectGetHeight(v50);
                v51.origin.x = v21;
                v51.origin.y = MinX;
                v51.size.width = v24;
                v51.size.height = v29;
                MinY = Height - CGRectGetMaxY(v51);
                v52.origin.x = v21;
                v52.origin.y = MinX;
                v52.size.width = v24;
                v52.size.height = v29;
                MinX = CGRectGetMinX(v52);
                goto LABEL_14;
              }
LABEL_16:
              v23 = v24;
              v24 = v29;
            }
            v17 = rect_8;
            goto LABEL_18;
          }
          v55.origin.x = v6;
          v55.origin.y = rect_16;
          v55.size.width = v9;
          v55.size.height = v11;
          v34 = CGRectGetWidth(v55);
          v56.origin.x = v21;
          v56.origin.y = MinX;
          v56.size.width = v24;
          v56.size.height = v29;
          v36 = v34 - CGRectGetMaxX(v56);
          v57.origin.x = rect;
          v57.origin.y = rect_16;
          v57.size.width = v9;
          v57.size.height = v11;
          v35 = CGRectGetHeight(v57);
          v58.origin.x = v21;
          v58.origin.y = MinX;
          v58.size.width = v24;
          v58.size.height = v29;
          MinX = v35 - CGRectGetMaxY(v58);
          v21 = v36;
          v16 = v37;
          v6 = rect;
          goto LABEL_16;
        }
LABEL_18:
        objc_msgSend(v19, "setFrame:", v21, MinX, v23, v24);
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v14);
  }

}

void __58__FBSDisplayLayout_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double x;
  double y;
  double width;
  double height;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  objc_msgSend(*(id *)(a1 + 32), "bounds");
  if (!CGRectIsEmpty(v24))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    v3 = (id)objc_msgSend(v2, "appendRect:withName:", CFSTR("bounds"));
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 32))
  {
    v5 = *(void **)(a1 + 40);
    BSInterfaceOrientationDescription();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendString:withName:", v6, CFSTR("interfaceOrientation"));

    v4 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v4 + 24), "bounds");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  if (!CGRectIsEmpty(v25))
  {
    objc_msgSend(*(id *)(a1 + 32), "bounds");
    v27.origin.x = v11;
    v27.origin.y = v12;
    v27.size.width = v13;
    v27.size.height = v14;
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    if (!CGRectEqualToRect(v26, v27))
      v15 = (id)objc_msgSend(*(id *)(a1 + 40), "appendRect:withName:", CFSTR("referenceBounds"), x, y, width, height);
  }
  v16 = *(_QWORD **)(a1 + 32);
  v17 = v16[5];
  if (v17 != -1)
  {
    v18 = (id)objc_msgSend(*(id *)(a1 + 40), "appendInteger:withName:", v17, CFSTR("backlightLevel"));
    v16 = *(_QWORD **)(a1 + 32);
  }
  v19 = v16[6];
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = (id)objc_msgSend(*(id *)(a1 + 40), "appendInteger:withName:", v19, CFSTR("backlightState"));
    v16 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(*(id *)(a1 + 40), "appendArraySection:withName:skipIfEmpty:", v16[1], CFSTR("elements"), 1);
  v21 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 3, 3);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v21, "appendObject:withName:skipIfNil:", v23, CFSTR("timestamp"), 1);

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
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

  -[FBSDisplayConfiguration bounds](self->_displayConfiguration, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  if (BSInterfaceOrientationIsLandscape())
  {
    BSRectWithSize();
    v3 = v10;
    v5 = v11;
    v7 = v12;
    v9 = v13;
  }
  v14 = v3;
  v15 = v5;
  v16 = v7;
  v17 = v9;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

uint64_t __28__FBSDisplayLayout_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "backlightState");
}

uint64_t __28__FBSDisplayLayout_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayBacklightLevel");
}

uint64_t __28__FBSDisplayLayout_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation");
}

- (NSString)description
{
  return (NSString *)-[FBSDisplayLayout descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (int64_t)displayType
{
  FBSDisplayConfiguration *displayConfiguration;

  displayConfiguration = self->_displayConfiguration;
  if (displayConfiguration)
    return -[FBSDisplayConfiguration type](displayConfiguration, "type");
  else
    return -1;
}

- (void)removeElement:(id)a3
{
  -[NSMutableArray removeObjectIdenticalTo:](self->_elements, "removeObjectIdenticalTo:", a3);
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

uint64_t __28__FBSDisplayLayout_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "elements");
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSDisplayLayout descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[FBSDisplayLayout succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__FBSDisplayLayout_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E38EAE08;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  id v7;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSDisplayConfiguration identity](self->_displayConfiguration, "identity");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("<nil>");
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("displayIdentity"));

  return v3;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  int64_t backlightState;
  xpc_object_t xdict;

  xdict = a3;
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();
  xpc_dictionary_set_int64(xdict, "backlightLevel", self->_backlightLevel);
  xpc_dictionary_set_int64(xdict, "orientation", self->_interfaceOrientation);
  -[NSDate timeIntervalSinceReferenceDate](self->_timestamp, "timeIntervalSinceReferenceDate");
  BSSerializeDoubleToXPCDictionaryWithKey();
  backlightState = self->_backlightState;
  if (backlightState != 0x7FFFFFFFFFFFFFFFLL)
    xpc_dictionary_set_int64(xdict, "backlightState", backlightState);

}

- (FBSDisplayLayout)init
{
  return (FBSDisplayLayout *)-[FBSDisplayLayout _initWithElements:](self, "_initWithElements:", 0);
}

uint64_t __28__FBSDisplayLayout_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayConfiguration");
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSDisplayLayout succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)referenceBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[FBSDisplayConfiguration bounds](self->_displayConfiguration, "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setDisplayConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_displayConfiguration, a3);
}

- (void)setDisplayBacklightLevel:(int64_t)a3
{
  self->_backlightLevel = a3;
}

- (int64_t)backlightState
{
  return self->_backlightState;
}

- (void)setBacklightState:(int64_t)a3
{
  self->_backlightState = a3;
}

@end
