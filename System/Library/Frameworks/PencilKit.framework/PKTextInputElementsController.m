@implementation PKTextInputElementsController

- (id)initWithContainerView:(id *)a1
{
  id v3;
  id *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)PKTextInputElementsController;
    v4 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v4;
    if (v4)
    {
      v5 = v4[5];
      v4[5] = (id)MEMORY[0x1E0C9AA70];

      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "timeIntervalSinceReferenceDate");
      a1[6] = v7;

      objc_storeWeak(a1 + 7, v3);
    }
  }

  return a1;
}

- (void)updateTextInputElementsWithReferenceHitPoint:(void *)a3 referenceSearchArea:(CGFloat)a4 referenceCoordSpace:(CGFloat)a5 completion:(CGFloat)x
{
  id v17;
  id v18;
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  BOOL v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  NSObject *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[5];
  id v49;
  id v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  id v59;
  _BYTE v60[128];
  uint64_t v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v61 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  v18 = a3;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "windowScene");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_visibleWindows");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0C9AA60];
    if (v22)
      v23 = v22;
    v24 = v23;

    v25 = -[PKTextInputElementsFinder initWithWindowsToSearch:]([PKTextInputElementsFinder alloc], v24);
    v26 = *(_QWORD *)(a1 + 16) + 1;
    *(_QWORD *)(a1 + 16) = v26;
    objc_msgSend(*(id *)(a1 + 40), "allValues");
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    if (v28)
    {
      v29 = v28;
      v46 = v24;
      v47 = v18;
      v30 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v53 != v30)
            objc_enumerationMutation(v27);
          v32 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
          -[PKTextInputElement coordinateSpace](v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[PKTextInputElement isFocused](v32))
            v34 = v33 == 0;
          else
            v34 = 1;
          if (!v34)
          {
            v35 = -[PKTextInputElement frame](v32);
            v64.origin.x = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v33, v17, v35, v36, v37, v38);
            v64.origin.y = v39;
            v64.size.width = v40;
            v64.size.height = v41;
            v62.origin.x = x;
            v62.origin.y = y;
            v62.size.width = width;
            v62.size.height = height;
            v63 = CGRectUnion(v62, v64);
            x = v63.origin.x;
            y = v63.origin.y;
            width = v63.size.width;
            height = v63.size.height;

            goto LABEL_16;
          }

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      }
      while (v29);
LABEL_16:
      v24 = v46;
      v18 = v47;
    }

    v42 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v57 = a1;
      v58 = 2048;
      v59 = v25;
      _os_log_debug_impl(&dword_1BE213000, v42, OS_LOG_TYPE_DEBUG, "ElementsController %p will begin elementsFinder findAvailableTextInputElements %p", buf, 0x16u);
    }

    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __129__PKTextInputElementsController_updateTextInputElementsWithReferenceHitPoint_referenceSearchArea_referenceCoordSpace_completion___block_invoke;
    v48[3] = &unk_1E7777468;
    v51 = v26;
    v48[4] = a1;
    v49 = v25;
    v43 = v18;
    v50 = v43;
    v44 = v25;
    v45 = v44;
    if (v44)
    {
      -[PKTextInputElementsFinder _findAvailableTextInputElementsWithReusableElements:referenceHitPoint:referenceSearchArea:referenceCoordSpace:nearPointOnly:completion:]((uint64_t)v44, v27, v17, 0, v48, a4, a5, x, y, width, height);
      v43 = v50;
    }

  }
}

void __129__PKTextInputElementsController_updateTextInputElementsWithReferenceHitPoint_referenceSearchArea_referenceCoordSpace_completion___block_invoke(_QWORD *a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id WeakRetained;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  const __CFString *v37;
  int v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  const __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  v7 = a1[4];
  if (a1[7] > *(_QWORD *)(v7 + 24))
  {
    v38 = a3;
    v39 = v5;
    v8 = v5;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, buf, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v41;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v41 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v14);
          if (v15)
            v16 = *(void **)(v15 + 112);
          else
            v16 = 0;
          v17 = v16;

          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(v7 + 8));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v15)
            {
              v20 = objc_msgSend(v18, "copy");
              v21 = *(void **)(v15 + 112);
              *(_QWORD *)(v15 + 112) = v20;

            }
            ++*(_QWORD *)(v7 + 8);
          }
          if (v15)
            v22 = *(void **)(v15 + 112);
          else
            v22 = 0;
          v23 = v22;
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v23);

          ++v14;
        }
        while (v12 != v14);
        v24 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, buf, 16);
        v12 = v24;
      }
      while (v24);
    }

    v25 = v9;
    v26 = v25;
    if (*(id *)(v7 + 40) != v25)
    {
      v27 = objc_msgSend(v25, "copy");
      v28 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v27;

      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      *(_QWORD *)(v7 + 48) = v29;
      WeakRetained = objc_loadWeakRetained((id *)(v7 + 32));
      objc_msgSend(WeakRetained, "elementsControllerLastDiscoveredElementsDidChange:", v7);

      +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
    }

    *(_QWORD *)(a1[4] + 24) = a1[7];
    v6 = v39;
    a3 = v38;
  }
  v31 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    v34 = a1[4];
    v33 = a1[5];
    if (v34)
      v35 = *(void **)(v34 + 40);
    else
      v35 = 0;
    v36 = objc_msgSend(v35, "count");
    v37 = CFSTR("No");
    *(_DWORD *)buf = 134218754;
    v45 = v34;
    v46 = 2048;
    if (a3)
      v37 = CFSTR("Yes");
    v47 = v33;
    v48 = 2048;
    v49 = v36;
    v50 = 2112;
    v51 = v37;
    _os_log_debug_impl(&dword_1BE213000, v31, OS_LOG_TYPE_DEBUG, "ElementsController %p finished elementsFinder findAvailableTextInputElements %p, found %ld elements, timed out: %@", buf, 0x2Au);
  }

  v32 = a1[6];
  if (v32)
    (*(void (**)(void))(v32 + 16))();

}

- (void)flushDiscoveredElements
{
  void *v2;
  uint64_t v3;
  id v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = MEMORY[0x1E0C9AA70];

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    *(_QWORD *)(a1 + 48) = v3;

  }
}

- (void)reportDebugStateDescription:(id)a3
{
  void *v4;
  NSDictionary *lastDiscoveredElementsByUniqueID;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double lastDiscoveredElementsUpdateTime;
  void *v11;
  id v12;
  void *v13;
  void (**v14)(id, const __CFString *, void *);
  _QWORD v15[5];
  id v16;

  v14 = (void (**)(id, const __CFString *, void *))a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    lastDiscoveredElementsByUniqueID = self->_lastDiscoveredElementsByUniqueID;
  else
    lastDiscoveredElementsByUniqueID = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__PKTextInputElementsController_reportDebugStateDescription___block_invoke;
  v15[3] = &unk_1E7777490;
  v15[4] = self;
  v6 = v4;
  v16 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](lastDiscoveredElementsByUniqueID, "enumerateKeysAndObjectsUsingBlock:", v15);
  objc_msgSend(v6, "sortUsingSelector:", sel_compare_);
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("\n%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[2](v14, CFSTR("lastDiscoveredElements"), v9);
  if (self)
    lastDiscoveredElementsUpdateTime = self->_lastDiscoveredElementsUpdateTime;
  else
    lastDiscoveredElementsUpdateTime = 0.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", lastDiscoveredElementsUpdateTime);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v12, "setDateFormat:", CFSTR("HH:mm:ss.SSS"));
  objc_msgSend(v12, "stringFromDate:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("lastDiscoveredElementsTime"), v13);

}

void __61__PKTextInputElementsController_reportDebugStateDescription___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  id WeakRetained;
  void *v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  void *v25;
  objc_class *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  id v30;
  CGRect v31;

  v30 = a2;
  v5 = a3;
  v6 = -[PKTextInputElement frame]((uint64_t)v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PKTextInputElement coordinateSpace]((uint64_t)v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    WeakRetained = objc_loadWeakRetained((id *)(v14 + 56));
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v13, v16, v6, v8, v10, v12);
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v31.origin.x = v17;
  v31.origin.y = v19;
  v31.size.width = v21;
  v31.size.height = v23;
  NSStringFromCGRect(v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputElement referenceView](v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = &stru_1E777DEE8;
  }
  v28 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("  %@: %@ %@"), v30, v27, v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObject:", v29);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerView);
  objc_storeStrong((id *)&self->_lastDiscoveredElementsByUniqueID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
