@implementation PKTextInputElementsFinder

- (id)initWithWindowsToSearch:(id)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)PKTextInputElementsFinder;
    a1 = objc_msgSendSuper2(&v8, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v4;

      *((_QWORD *)a1 + 3) = 0;
      +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)a1 + 9) = objc_msgSend(v6, "enableOnNonEditableViews");

    }
  }

  return a1;
}

- (void)_findAvailableTextInputElementsWithReusableElements:(void *)a3 referenceHitPoint:(uint64_t)a4 referenceSearchArea:(void *)a5 referenceCoordSpace:(CGFloat)a6 nearPointOnly:(CGFloat)a7 completion:(CGFloat)a8
{
  double v22;
  CGFloat v23;
  double v24;
  double x;
  double y;
  double width;
  double height;
  SEL v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  id *v49;
  void *v50;
  double v51;
  double v52;
  dispatch_time_t v53;
  void *v54;
  double v55;
  double v56;
  dispatch_time_t v57;
  id v58;
  void *v59;
  id newValue;
  id obj;
  id v62;
  _QWORD v63[5];
  _QWORD block[4];
  id v65;
  id location;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v78 = *MEMORY[0x1E0C80C00];
  v58 = a2;
  v62 = a3;
  newValue = a5;
  if (!a1)
    goto LABEL_31;
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "firstResponderAttractionHorizontal");
  v23 = v22 + v22;
  objc_msgSend(v59, "firstResponderAttractionVertical");
  v81.size.height = v24 + v24;
  v81.origin.x = a6 - v23 * 0.5;
  v81.origin.y = a7 - (v24 + v24) * 0.5;
  v79.origin.x = a8;
  v79.origin.y = a9;
  v79.size.width = a10;
  v79.size.height = a11;
  v81.size.width = v23;
  v80 = CGRectUnion(v79, v81);
  x = v80.origin.x;
  y = v80.origin.y;
  width = v80.size.width;
  height = v80.size.height;
  objc_setProperty_nonatomic_copy((id)a1, v29, newValue, 40);
  objc_storeStrong((id *)(a1 + 48), a2);
  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a1 + 24) = 1;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v31;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v33;

  *(_BYTE *)(a1 + 10) = 1;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = *(id *)(a1 + 16);
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  if (!v35)
    goto LABEL_20;
  v36 = *(_QWORD *)v73;
  do
  {
    v37 = 0;
    do
    {
      if (*(_QWORD *)v73 != v36)
        objc_enumerationMutation(obj);
      v38 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v37);
      objc_msgSend(v38, "firstResponder");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v40, "enableViewControllerSupport"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v43 = +[PKTextInputElementsFinder responderSupportsPencilTextInput:]((uint64_t)PKTextInputElementsFinder, v39);

          if (!v43)
            goto LABEL_10;
          objc_msgSend(v39, "textInputView");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v39;
          if (v41 != v39)
            goto LABEL_11;
        }
      }

LABEL_10:
      v41 = 0;
LABEL_11:
      v42 = *(void **)(a1 + 32);
      v71[0] = MEMORY[0x1E0C809B0];
      v71[1] = 3221225472;
      v71[2] = __164__PKTextInputElementsFinder__findAvailableTextInputElementsWithReusableElements_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_completion___block_invoke;
      v71[3] = &unk_1E7778AF0;
      v71[4] = a1;
      -[PKTextInputElementsFinder _collectTextInputs:asyncElementContainers:underView:referenceHitPoint:referenceSearchArea:referenceCoordSpace:nearPointOnly:firstResponderTextInputView:elementContainerCompletion:](a1, v30, v42, v38, v62, a4, v41, v71, a6, a7, x, y, width, height);
      if (v41 && objc_msgSend(v30, "containsObject:", v41))
      {
        objc_msgSend(v30, "removeObject:", v41);
        objc_msgSend(v30, "addObject:", v39);
      }

      ++v37;
    }
    while (v35 != v37);
    v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    v35 = v44;
  }
  while (v44);
LABEL_20:

  v70 = 0u;
  v68 = 0u;
  v69 = 0u;
  v67 = 0u;
  v45 = v30;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v46)
  {
    v47 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v68 != v47)
          objc_enumerationMutation(v45);
        v49 = -[PKTextInputElement initWithTextInput:]((id *)[PKTextInputElement alloc], *(void **)(*((_QWORD *)&v67 + 1) + 8 * i));
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v49);

      }
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    }
    while (v46);
  }

  *(_BYTE *)(a1 + 10) = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    *(_QWORD *)(a1 + 24) = 2;
    objc_initWeak(&location, (id)a1);
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "asyncElementRequestTimeout");
    v52 = v51;

    v53 = dispatch_time(0, (uint64_t)(v52 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __164__PKTextInputElementsFinder__findAvailableTextInputElementsWithReusableElements_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_completion___block_invoke_8;
    block[3] = &unk_1E7777588;
    objc_copyWeak(&v65, &location);
    dispatch_after(v53, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v65);
    objc_destroyWeak(&location);
  }
  else
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "debugElementFinderArtificialDelay");
    v56 = v55;

    v57 = dispatch_time(0, (uint64_t)(v56 * 1000000000.0));
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __164__PKTextInputElementsFinder__findAvailableTextInputElementsWithReusableElements_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_completion___block_invoke_2;
    v63[3] = &unk_1E7778020;
    v63[4] = a1;
    dispatch_after(v57, MEMORY[0x1E0C80D38], v63);
  }

LABEL_31:
}

+ (uint64_t)responderSupportsPencilTextInput:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;

  v2 = a2;
  v3 = objc_opt_self();
  PKScribbleInteractionInTextInput(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isElementContainer");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(v4, "isEnabled") ^ 1;
    if (!v5)
      goto LABEL_7;
  }
  else
  {
    v6 = 0;
    if (!v5)
    {
LABEL_7:
      v7 = +[PKTextInputElementsFinder isResponderEditableTextInput:](v3, v2);
      goto LABEL_8;
    }
  }
  if (v6)
    goto LABEL_7;
  v7 = 1;
LABEL_8:

  return v7;
}

void __164__PKTextInputElementsFinder__findAvailableTextInputElementsWithReusableElements_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_completion___block_invoke(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9 && *(_QWORD *)(v9 + 24) == 4)
  {
    v10 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134218498;
      v17 = objc_msgSend(v8, "count");
      v18 = 2112;
      v19 = v7;
      v20 = 2048;
      v21 = a4;
      _os_log_impl(&dword_1BE213000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring text input elements: %ld because of timeout. Interaction: %@. Duration: %0.3fs.", (uint8_t *)&v16, 0x20u);
    }

  }
  else
  {
    v11 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134218498;
      v17 = objc_msgSend(v8, "count");
      v18 = 2112;
      v19 = v7;
      v20 = 2048;
      v21 = a4;
      _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_DEFAULT, "Received text input elements: %ld. Interaction: %@. Duration: %0.3fs.", (uint8_t *)&v16, 0x20u);
    }

    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
      v13 = *(void **)(v12 + 32);
    else
      v13 = 0;
    objc_msgSend(v13, "removeObject:", v7);
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
      v15 = *(void **)(v14 + 56);
    else
      v15 = 0;
    objc_msgSend(v15, "addObjectsFromArray:", v8);
    -[PKTextInputElementsFinder _finishFindIfReadyTimedOut:](*(_QWORD *)(a1 + 32), 0);
  }

}

- (void)_finishFindIfReadyTimedOut:(uint64_t)a1
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  const char *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  id obj;
  id v21;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a1
    && (unint64_t)(*(_QWORD *)(a1 + 24) - 3) >= 2
    && !objc_msgSend(*(id *)(a1 + 32), "count")
    && !*(_BYTE *)(a1 + 10))
  {
    v2 = 3;
    if (a2)
      v2 = 4;
    *(_QWORD *)(a1 + 24) = v2;
    v3 = *(void **)(a1 + 48);
    v4 = *(id *)(a1 + 56);
    v5 = v3;
    objc_opt_self();
    v17 = v4;
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      obj = v4;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v32;
        v9 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v32 != v8)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            v25 = 0;
            v26 = &v25;
            v27 = 0x3032000000;
            v28 = __Block_byref_object_copy__4;
            v29 = __Block_byref_object_dispose__4;
            v30 = v11;
            v22[0] = v9;
            v22[1] = 3221225472;
            v22[2] = __61__PKTextInputElementsFinder__uniqueElements_reusingElements___block_invoke;
            v22[3] = &unk_1E7778B18;
            v22[4] = v30;
            v24 = &v25;
            v23 = v6;
            objc_msgSend(v5, "enumerateObjectsAtIndexes:options:usingBlock:", v23, 0, v22);
            objc_msgSend(v21, "addObject:", v26[5]);

            _Block_object_dispose(&v25, 8);
          }
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v7);
      }

    }
    else
    {
      v21 = v4;
    }

    v13 = (_QWORD *)a1;
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v14 + 16))(v14, v21, a2);
      v13 = (_QWORD *)a1;
    }
    v15 = v13;
    objc_setProperty_nonatomic_copy(v13, v12, 0, 40);
    v16 = (void *)v15[6];
    v15[6] = 0;

  }
}

- (void)_collectTextInputs:(void *)a3 asyncElementContainers:(void *)a4 underView:(void *)a5 referenceHitPoint:(uint64_t)a6 referenceSearchArea:(void *)a7 referenceCoordSpace:(void *)a8 nearPointOnly:(CGFloat)a9 firstResponderTextInputView:(CGFloat)a10 elementContainerCompletion:(double)a11
{
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _UNKNOWN **v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  int v39;
  int v40;
  _BOOL4 v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  void *v62;
  uint64_t v63;
  void *v67;
  id v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t j;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  double x;
  double y;
  double width;
  double height;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  uint64_t v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[4];
  id v98;
  id v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;
  CGRect v108;
  CGRect v109;

  v107 = *MEMORY[0x1E0C80C00];
  v92 = a2;
  v27 = a3;
  v28 = a4;
  v29 = a5;
  v30 = a7;
  v31 = a8;
  v32 = &off_1E776F000;
  v33 = +[PKTextInputElementsFinder _shouldConsiderTextInputSearchForView:referenceHitPoint:referenceCoordSpace:nearPointOnly:](a9, a10, (uint64_t)PKTextInputElementsFinder, v28, v29, a6);
  if (v33)
  {
    v34 = v33;
    if (v33 == 1)
    {
      v35 = v28;
      objc_opt_self();
      PKScribbleInteractionInView(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v36, "isElementContainer"))
        v37 = v36;
      else
        v37 = 0;
      v38 = v37;

      v32 = &off_1E776F000;
    }
    else
    {
      v38 = 0;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v39 = objc_msgSend(v38, "isEnabled") ^ 1;
      if (!v38)
        goto LABEL_21;
    }
    else
    {
      v39 = 0;
      if (!v38)
        goto LABEL_21;
    }
    if (!v39)
    {
      v40 = +[PKTextInputElementsFinder _isReachableHitTestView:nearPoint:coordSpace:](a9, a10, (uint64_t)v32[448], v28, v29);
      v41 = +[PKTextInputUtilities isValidReachableInteraction:](PKTextInputUtilities, "isValidReachableInteraction:", v28);
      if (v40)
      {
        v42 = v27 && v41;
        if (v31 && v42)
        {
          v43 = v38;
          objc_msgSend(v28, "window");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "bounds");
          v46 = v45;
          v48 = v47;
          v50 = v49;
          v52 = v51;
          objc_msgSend(v28, "window");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "PK_convertRect:fromView:", v53, v46, v48, v50, v52);
          v55 = v54;
          v57 = v56;
          v59 = v58;
          v61 = v60;

          +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v62, "useLargeHitTestArea"))
            objc_msgSend(v28, "bounds");
          else
            objc_msgSend(v28, "PK_convertRect:fromCoordinateSpace:", v29, a11, a12, a13, a14);
          v38 = v43;
          v109.origin.x = v55;
          v109.origin.y = v57;
          v109.size.width = v59;
          v109.size.height = v61;
          v108 = CGRectIntersection(*(CGRect *)&v63, v109);
          x = v108.origin.x;
          y = v108.origin.y;
          width = v108.size.width;
          height = v108.size.height;
          if (!CGRectIsNull(v108))
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            v84 = v83;
            objc_msgSend(v27, "addObject:", v43);
            v97[0] = MEMORY[0x1E0C809B0];
            v97[1] = 3221225472;
            v97[2] = __208__PKTextInputElementsFinder__collectTextInputs_asyncElementContainers_underView_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_firstResponderTextInputView_elementContainerCompletion___block_invoke;
            v97[3] = &unk_1E7778B40;
            v100 = v84;
            v98 = v43;
            v99 = v31;
            objc_msgSend(v98, "requestElementsInRect:completion:", v97, x, y, width, height);

          }
          goto LABEL_57;
        }
      }
      v32 = &off_1E776F000;
      if (v34 != 1)
      {
LABEL_49:
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        objc_msgSend(v28, "subviews", v85);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
        if (v75)
        {
          v76 = v75;
          v87 = v38;
          v89 = v28;
          v77 = *(_QWORD *)v94;
          do
          {
            for (i = 0; i != v76; ++i)
            {
              if (*(_QWORD *)v94 != v77)
                objc_enumerationMutation(v62);
              -[PKTextInputElementsFinder _collectTextInputs:asyncElementContainers:underView:referenceHitPoint:referenceSearchArea:referenceCoordSpace:nearPointOnly:firstResponderTextInputView:elementContainerCompletion:](a1, v92, v27, *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * i), v29, a6, v30, v31, a9, a10, a11, a12, a13, a14);
            }
            v76 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v93, v105, 16);
          }
          while (v76);
          v38 = v87;
          v28 = v89;
        }
LABEL_57:

        goto LABEL_58;
      }
LABEL_24:
      if (+[PKTextInputElementsFinder isResponderEditableTextInput:]((uint64_t)v32[448], v28))
      {
        if (*(_BYTE *)(a1 + 8))
          v67 = 0;
        else
          v67 = v28;
        v68 = v67;
      }
      else
      {
        if (!*(_BYTE *)(a1 + 9))
        {
          v69 = 0;
LABEL_32:
          if (v28 == v30 || v69)
          {
            if ((+[PKTextInputElementsFinder _isReachableHitTestView:nearPoint:coordSpace:](a9, a10, (uint64_t)v32[448], v28, v29) & 1) != 0)
            {
LABEL_47:
              objc_msgSend(v92, "addObject:", v69, v85);
            }
            else
            {
              v85 = v69;
              v86 = v38;
              v88 = v28;
              v90 = v28;
              v101 = 0u;
              v102 = 0u;
              v103 = 0u;
              v104 = 0u;
              v70 = *(id *)(a1 + 48);
              v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
              if (v71)
              {
                v72 = v71;
                v91 = *(_QWORD *)v102;
                while (2)
                {
                  for (j = 0; j != v72; ++j)
                  {
                    if (*(_QWORD *)v102 != v91)
                      objc_enumerationMutation(v70);
                    v74 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * j);
                    if (-[PKTextInputElement isFocused](v74)
                      && -[PKTextInputElement isElementView:](v74, v90))
                    {

                      v69 = v85;
                      v38 = v86;
                      v28 = v88;
                      goto LABEL_47;
                    }
                  }
                  v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v101, v106, 16);
                  if (v72)
                    continue;
                  break;
                }
              }

              v69 = v85;
              v38 = v86;
              v28 = v88;
            }
          }

          goto LABEL_49;
        }
        +[PKTextInputUtilities nonEditableTextInputForView:](PKTextInputUtilities, "nonEditableTextInputForView:", v28);
        v68 = (id)objc_claimAutoreleasedReturnValue();
      }
      v69 = v68;
      goto LABEL_32;
    }
LABEL_21:
    +[PKTextInputUtilities isValidReachableInteraction:](PKTextInputUtilities, "isValidReachableInteraction:", v28);
    if (v34 != 1)
      goto LABEL_49;
    goto LABEL_24;
  }
LABEL_58:

}

void __164__PKTextInputElementsFinder__findAvailableTextInputElementsWithReusableElements_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_completion___block_invoke_8(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[3] == 2)
  {
    v4 = WeakRetained;
    v2 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *((_QWORD *)v4 + 4);
      *(_DWORD *)buf = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Text input elements request timed out for containers: %@.", buf, 0xCu);
    }

    objc_msgSend(*((id *)v4 + 4), "removeAllObjects");
    -[PKTextInputElementsFinder _finishFindIfReadyTimedOut:]((uint64_t)v4, 1u);
    WeakRetained = v4;
  }

}

void __164__PKTextInputElementsFinder__findAvailableTextInputElementsWithReusableElements_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_completion___block_invoke_2(uint64_t a1)
{
  -[PKTextInputElementsFinder _finishFindIfReadyTimedOut:](*(_QWORD *)(a1 + 32), 0);
}

void __61__PKTextInputElementsFinder__uniqueElements_reusingElements___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id *v8;

  v8 = a2;
  if (-[PKTextInputElement isEquivalentToElement:](v8, *(void **)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    -[PKTextInputElement updateFromEquivalentElement:]((uint64_t)v8, *(void **)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "removeIndex:", a3);
    *a4 = 1;
  }

}

+ (uint64_t)_shouldConsiderTextInputSearchForView:(uint64_t)a3 referenceHitPoint:(void *)a4 referenceCoordSpace:(void *)a5 nearPointOnly:(int)a6
{
  id v10;
  id v11;
  double v12;
  uint64_t v13;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGPoint v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  v10 = a4;
  v11 = a5;
  objc_opt_self();
  if ((objc_msgSend(v10, "isHidden") & 1) != 0 || (objc_msgSend(v10, "alpha"), v12 == 0.0))
  {
    v13 = 0;
    goto LABEL_4;
  }
  objc_msgSend(v10, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v10, "window");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "PK_convertRect:fromView:", v24, v17, v19, v21, v23);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  objc_msgSend(v10, "bounds");
  v59.origin.x = v26;
  v59.origin.y = v28;
  v59.size.width = v30;
  v59.size.height = v32;
  v55 = CGRectIntersection(v54, v59);
  x = v55.origin.x;
  y = v55.origin.y;
  width = v55.size.width;
  height = v55.size.height;
  objc_msgSend(v10, "frame");
  if (CGRectIsEmpty(v56)
    || (v57.origin.x = x, v57.origin.y = y, v57.size.width = width, v57.size.height = height, CGRectIsNull(v57)))
  {
    if (objc_msgSend(v10, "clipsToBounds"))
      v13 = 0;
    else
      v13 = 2;
    goto LABEL_4;
  }
  if (!a6)
  {
LABEL_18:
    +[PKTextInputFakeInteractions attachFakeInteractionToViewIfNecessary:](PKTextInputFakeInteractions, "attachFakeInteractionToViewIfNecessary:", v10);
    v13 = 1;
    goto LABEL_4;
  }
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "textInputViewHitTestSlackHorizontal");
  v39 = v38;
  objc_msgSend(v37, "firstResponderAttractionHorizontal");
  if (v39 >= v40)
    v41 = v39;
  else
    v41 = v40;
  objc_msgSend(v37, "textInputViewHitTestSlackVertical");
  v43 = v42;
  objc_msgSend(v37, "firstResponderAttractionVertical");
  if (v43 < v44)
    v43 = v44;
  objc_opt_self();
  objc_msgSend(v10, "bounds");
  v49 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v10, v11, v45, v46, v47, v48);
  v58.origin.x = +[PKTextInputElement hitToleranceFrameFromElementFrame:insets:](v49, v50, v51, v52, -v43, -v41);
  v53.x = a1;
  v53.y = a2;
  if (CGRectContainsPoint(v58, v53))
  {

    goto LABEL_18;
  }
  if (objc_msgSend(v10, "clipsToBounds"))
    v13 = 0;
  else
    v13 = 2;

LABEL_4:
  return v13;
}

+ (uint64_t)_isReachableHitTestView:(uint64_t)a3 nearPoint:(void *)a4 coordSpace:(void *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double x;
  double y;
  double width;
  double height;
  uint64_t v28;
  CGFloat MidX;
  double MidY;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  BOOL v36;
  void *v37;
  char v38;
  void *v39;
  uint64_t v40;
  NSObject *v42;
  int v43;
  void *v44;
  uint64_t v45;
  CGPoint v46;
  NSRect v47;
  NSRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  NSRect v54;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_self();
  objc_msgSend(v8, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "bounds");
    objc_msgSend(v8, "PK_convertRect:toView:", v11);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v11, "bounds");
    v54.origin.x = v20;
    v54.origin.y = v21;
    v54.size.width = v22;
    v54.size.height = v23;
    v47.origin.x = v13;
    v47.origin.y = v15;
    v47.size.width = v17;
    v47.size.height = v19;
    v48 = NSIntersectionRect(v47, v54);
    v49 = CGRectInset(v48, 2.0, 2.0);
    x = v49.origin.x;
    y = v49.origin.y;
    width = v49.size.width;
    height = v49.size.height;
    if (!CGRectIsNull(v49))
    {
      v50.origin.x = x;
      v50.origin.y = y;
      v50.size.width = width;
      v50.size.height = height;
      MidX = CGRectGetMidX(v50);
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      MidY = CGRectGetMidY(v51);
      if (v9)
      {
        objc_msgSend(v11, "PK_convertPoint:fromCoordinateSpace:", v9, a1, a2);
        v32 = v31;
        v34 = v33;
        v52.origin.x = x;
        v52.origin.y = y;
        v52.size.width = width;
        v52.size.height = height;
        v46.x = v32;
        v46.y = v34;
        if (CGRectContainsPoint(v52, v46))
        {
          x = v32;
LABEL_7:
          y = v34;
          goto LABEL_14;
        }
        if (v32 >= x)
        {
          v35 = x + width;
          v36 = v32 <= x + width;
          x = v32;
          if (!v36)
            x = v35;
        }
        if (v34 >= y)
        {
          y = y + height;
          if (v34 <= y)
            goto LABEL_7;
        }
      }
      else
      {
        x = MidX;
        y = MidY;
      }
LABEL_14:
      objc_msgSend(v11, "hitTest:withEvent:", 0, x, y);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v37, "isDescendantOfView:", v8) & 1) == 0)
      {
        objc_msgSend(v37, "frame");
        if (!CGRectIsEmpty(v53)
          || (objc_msgSend(v37, "subviews"),
              v39 = (void *)objc_claimAutoreleasedReturnValue(),
              v40 = objc_msgSend(v39, "count"),
              v39,
              v40))
        {
          v38 = 0;
LABEL_19:
          if (qword_1EF560440 == -1)
          {
            if ((v38 & 1) != 0)
              goto LABEL_24;
          }
          else
          {
            dispatch_once(&qword_1EF560440, &__block_literal_global_18);
            if ((v38 & 1) != 0)
              goto LABEL_24;
          }
          if (_MergedGlobals_39 && qword_1EF560430)
            v38 |= objc_opt_isKindOfClass();
LABEL_24:
          if ((v38 & 1) == 0 && qword_1EF560438 && (objc_opt_isKindOfClass() & 1) != 0)
          {
            if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v37, "suppressesBackdrops") & 1) == 0)
              goto LABEL_29;
          }
          else if ((v38 & 1) != 0)
          {
LABEL_29:
            v28 = +[PKTextInputElementsFinder _anyOtherWindowAboveWindow:position:](x, y, v10, v11) ^ 1;
LABEL_32:

            goto LABEL_33;
          }
          v28 = 0;
          goto LABEL_32;
        }
        v42 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          v43 = 138412290;
          v44 = v37;
          _os_log_debug_impl(&dword_1BE213000, v42, OS_LOG_TYPE_DEBUG, "ignoring empty hitView during elementFinder reachability check: %@", (uint8_t *)&v43, 0xCu);
        }

      }
      v38 = 1;
      goto LABEL_19;
    }
  }
  v28 = 0;
LABEL_33:

  return v28;
}

void __208__PKTextInputElementsFinder__collectTextInputs_asyncElementContainers_underView_referenceHitPoint_referenceSearchArea_referenceCoordSpace_nearPointOnly_firstResponderTextInputView_elementContainerCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  id *v17;
  uint64_t v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v7 = v6;
  v8 = *(double *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v21;
    v18 = -a3;
    do
    {
      v14 = 0;
      v15 = v18 + v12;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(obj);
        v16 = -[PKTextInputElement initWithElementInteraction:elementIdentifier:orderInContainer:]((id *)[PKTextInputElement alloc], *(void **)(a1 + 32), *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14), (void *)(v12 + v14));
        v17 = v16;
        if (v16)
          *((_BYTE *)v16 + 50) = v15 + v14 == 0;
        objc_msgSend(v9, "addObject:", v16, v18);

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v12 += v14;
    }
    while (v11);
  }

  (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(v7 - v8);
}

+ (uint64_t)isResponderEditableTextInput:(uint64_t)a1
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_self();
  if (+[PKTextInputUtilities isResponderSupportedTextInput:](PKTextInputUtilities, "isResponderSupportedTextInput:", v2))
  {
    PKScribbleInteractionInTextInput(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "supportsShouldBegin") & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
      v4 = 1;
    else
      v4 = objc_msgSend(v2, "isEditable");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)isResponderNonEditableTextInput:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  void *v7;

  v2 = a2;
  v3 = objc_opt_self();
  v4 = objc_opt_class();
  PKDynamicCast(v4, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (+[PKTextInputElementsFinder isResponderEditableTextInput:](v3, v2) & 1) == 0)
  {
    +[PKTextInputUtilities nonEditableTextInputForView:](PKTextInputUtilities, "nonEditableTextInputForView:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (uint64_t)shouldDisableInputAssistantForTextInput:(uint64_t)a1
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_self();
  if (+[PKTextInputUtilities isResponderSupportedTextInput:](PKTextInputUtilities, "isResponderSupportedTextInput:", v2)&& +[PKTextInputUtilities responderTextInputSource:](PKTextInputUtilities, "responderTextInputSource:", v2) == 3)
  {
    PKScribbleInteractionInTextInput(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(v3, "shouldDisableInputAssistant");
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)shouldConsiderTextInputSearchForView:(uint64_t)a3 referenceHitPoint:(void *)a4 referenceCoordSpace:(void *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v8 = a5;
  v9 = a4;
  v10 = objc_opt_self();
  v11 = +[PKTextInputElementsFinder _shouldConsiderTextInputSearchForView:referenceHitPoint:referenceCoordSpace:nearPointOnly:](a1, a2, v10, v9, v8, 0);

  return v11 == 1;
}

Class __74__PKTextInputElementsFinder__isReachableHitTestView_nearPoint_coordSpace___block_invoke()
{
  Class result;

  _MergedGlobals_39 = (uint64_t)NSClassFromString(CFSTR("UITextRangeView"));
  qword_1EF560430 = (uint64_t)NSClassFromString(CFSTR("WKContentView"));
  result = NSClassFromString(CFSTR("UIDimmingView"));
  qword_1EF560438 = (uint64_t)result;
  return result;
}

+ (uint64_t)_anyOtherWindowAboveWindow:(uint64_t)a3 position:(void *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_opt_self();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_visibleWindows");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v9);
        v13 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v13 != v6)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "windowLevel", (_QWORD)v21);
          v15 = v14;
          objc_msgSend(v6, "windowLevel");
          if (v15 > v16)
          {
            objc_msgSend(v6, "PK_convertPoint:toView:", v13, a1, a2);
            objc_msgSend(v13, "hitTest:withEvent:", 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v18 = v17;
              objc_msgSend(v17, "window");
              v19 = (id)objc_claimAutoreleasedReturnValue();

              if (v19 == v13)
              {
                v10 = 1;
                goto LABEL_14;
              }
            }
          }
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_14:

  return v10;
}

+ (uint64_t)shouldAvoidElementWithHitView:(uint64_t)a1
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a2;
  objc_opt_self();
  if (qword_1EF560450 != -1)
    dispatch_once(&qword_1EF560450, &__block_literal_global_30);
  if (qword_1EF560448 && (v3 = v2) != 0)
  {
    v4 = v3;
    do
    {
      v5 = objc_msgSend((id)qword_1EF560448, "containsObject:", objc_opt_class());
      if ((v5 & 1) != 0)
        break;
      objc_msgSend(v4, "superview");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    while (v6);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __59__PKTextInputElementsFinder_shouldAvoidElementWithHitView___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = (uint64_t)NSClassFromString(CFSTR("_UIContextMenuView"));
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v0);
    v0 = objc_claimAutoreleasedReturnValue();
  }
  v1 = (void *)qword_1EF560448;
  qword_1EF560448 = v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__foundElements, 0);
  objc_storeStrong((id *)&self->__reusableElements, 0);
  objc_storeStrong(&self->__finderCompletionHandler, 0);
  objc_storeStrong((id *)&self->__pendingElementContainerReplies, 0);
  objc_storeStrong((id *)&self->_windowsToSearch, 0);
}

@end
