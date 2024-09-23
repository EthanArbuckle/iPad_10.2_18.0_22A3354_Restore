@implementation PKTextInputSingleElementFinder

- (void)findSingleElementCloseToPosition:(CGPoint)a3 coordinateSpace:(id)a4 completion:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  id v15;
  id v16;
  NSMutableSet *foundElements;
  _QWORD v18[5];
  id v19;
  id v20;
  CGFloat v21;
  CGFloat v22;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__PKTextInputSingleElementFinder_findSingleElementCloseToPosition_coordinateSpace_completion___block_invoke;
  v18[3] = &unk_1E7778B68;
  v21 = x;
  v22 = y;
  v18[4] = self;
  v19 = v9;
  v20 = v10;
  v11 = *MEMORY[0x1E0C9D628];
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v15 = v10;
  v16 = v9;
  -[PKTextInputElementsFinder _findAvailableTextInputElementsWithReusableElements:referenceHitPoint:referenceSearchArea:referenceCoordSpace:nearPointOnly:completion:]((uint64_t)self, 0, v16, 1, v18, x, y, v11, v12, v13, v14);
  if (self)
    foundElements = self->super.__foundElements;
  else
    foundElements = 0;
  -[PKTextInputSingleElementFinder _finishSingleElementSearchIfReadyAtPosition:coordinateSpace:candidates:completion:](self, "_finishSingleElementSearchIfReadyAtPosition:coordinateSpace:candidates:completion:", v16, foundElements, v15, x, y);

}

_BYTE *__94__PKTextInputSingleElementFinder_findSingleElementCloseToPosition_coordinateSpace_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[64])
    return (_BYTE *)objc_msgSend(result, "_finishSingleElementSearchIfReadyAtPosition:coordinateSpace:candidates:completion:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return result;
}

- (void)findSingleElementAtPosition:(CGPoint)a3 coordinateSpace:(id)a4 completion:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  double v16;
  double v17;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__PKTextInputSingleElementFinder_findSingleElementAtPosition_coordinateSpace_completion___block_invoke;
  v13[3] = &unk_1E7778B90;
  v16 = x;
  v17 = y;
  v13[4] = self;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  -[PKTextInputSingleElementFinder findSingleElementCloseToPosition:coordinateSpace:completion:](self, "findSingleElementCloseToPosition:coordinateSpace:completion:", v12, v13, x, y);

}

void __89__PKTextInputSingleElementFinder_findSingleElementAtPosition_coordinateSpace_completion___block_invoke(uint64_t a1)
{
  id *v2;
  id *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  id *v19;

  objc_msgSend(*(id *)(a1 + 32), "foundElement");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v19 = v2;
  if (v2)
  {
    -[PKTextInputElement referenceView](v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(*(void **)(a1 + 40), v5, *(double *)(a1 + 56), *(double *)(a1 + 64), *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v8 = v7;
      if (-[PKTextInputElement containsPoint:inCoordinateSpace:]((_BOOL8)v19, v5, v6, v7))
      {
        objc_msgSend(v5, "hitTest:withEvent:", 0, v6, v8);
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
LABEL_11:

          v3 = v19;
          goto LABEL_12;
        }
        v10 = (void *)v9;
        -[PKTextInputElement referenceView](v19);
        v11 = objc_claimAutoreleasedReturnValue();
        if (v10 == (void *)v11)
        {

          goto LABEL_10;
        }
        v12 = (void *)v11;
        -[PKTextInputElement referenceView](v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isDescendantOfView:", v13)
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v18 = +[PKTextInputElementsFinder shouldAvoidElementWithHitView:]((uint64_t)PKTextInputElementsFinder, v10);

          if (!v18)
            goto LABEL_11;
        }
        else
        {

        }
      }
    }
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 72);
    *(_QWORD *)(v14 + 72) = 0;

    v16 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v16 + 80);
    *(_QWORD *)(v16 + 80) = 0;
LABEL_10:

    goto LABEL_11;
  }
LABEL_12:
  v17 = *(_QWORD *)(a1 + 48);
  if (v17)
  {
    (*(void (**)(uint64_t, id *))(v17 + 16))(v17, v3);
    v3 = v19;
  }

}

- (void)_finishSingleElementSearchIfReadyAtPosition:(CGPoint)a3 coordinateSpace:(id)a4 candidates:(id)a5 completion:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  _QWORD *v19;
  void *v20;
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
  BOOL v33;
  double v34;
  double v35;
  double v36;
  _BOOL4 v37;
  double v38;
  double v39;
  int v40;
  _QWORD *v41;
  NSMutableSet *pendingElementContainerReplies;
  uint64_t v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  id obj;
  id obja;
  void (**v50)(_QWORD);
  double v51;
  double v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;
  CGPoint v59;
  CGRect v60;

  y = a3.y;
  x = a3.x;
  v58 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  obj = a5;
  v12 = a5;
  v50 = (void (**)(_QWORD))a6;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v54;
    v51 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v52 = *MEMORY[0x1E0C9D820];
    v17 = 1.79769313e308;
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v54 != v16)
          objc_enumerationMutation(v12);
        v19 = *(_QWORD **)(*((_QWORD *)&v53 + 1) + 8 * i);
        -[PKTextInputElement coordinateSpace]((uint64_t)v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = -[PKTextInputElement frame]((uint64_t)v19);
          v25 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v20, v11, v21, v22, v23, v24);
          v27 = v26;
          v29 = v28;
          v31 = v30;
          v60.origin.x = -[PKTextInputElement hitToleranceFrameFromElementFrame:](v19, v25, v26, v28, v30);
          v59.x = x;
          v59.y = y;
          if (CGRectContainsPoint(v60, v59))
          {
            if (x >= v25)
            {
              v32 = v25 + v29;
              v33 = x <= v25 + v29;
              v25 = x;
              if (!v33)
                v25 = v32;
            }
            if (y >= v27)
            {
              v34 = v27 + v31;
              v33 = y <= v27 + v31;
              v27 = y;
              if (!v33)
                v27 = v34;
            }
            v35 = (y - v27) * (y - v27) + (x - v25) * (x - v25);
            if (v15)
            {
              v36 = vabdd_f64(v35, v17);
              v37 = v36 < 0.00999999978;
              if (v35 >= v17 && v36 >= 0.00999999978)
                goto LABEL_26;
            }
            else
            {
              v37 = 0;
            }
            v38 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v11, v20, x, y, v52, v51);
            v40 = -[PKTextInputElement shouldBeginAtLocation:](v19, v38, v39);
            if (!v15 || !v40 || !v37)
            {
              if (!v40)
                goto LABEL_26;
LABEL_25:
              v41 = v19;

              v15 = v41;
              v17 = v35;
              goto LABEL_26;
            }
            if ((-[PKTextInputElement isInFrontOfElement:]((uint64_t)v19, v15) & 1) != 0)
              goto LABEL_25;
          }
        }
LABEL_26:

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, v57, 16, obj);
      if (!v14)
      {
        if (self)
          goto LABEL_29;
LABEL_40:
        pendingElementContainerReplies = 0;
        goto LABEL_30;
      }
    }
  }
  v15 = 0;
  if (!self)
    goto LABEL_40;
LABEL_29:
  pendingElementContainerReplies = self->super.__pendingElementContainerReplies;
LABEL_30:
  v43 = -[NSMutableSet count](pendingElementContainerReplies, "count", obj);
  -[PKTextInputElement referenceView]((id *)v15);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "window");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v43 && v15 && v45)
  {
    v46 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v11, v45, x, y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    if (+[PKTextInputElementsFinder _anyOtherWindowAboveWindow:position:](v46, v47, (uint64_t)PKTextInputElementsFinder, v45))
    {

      v15 = 0;
    }
  }
  else if (v43)
  {
    goto LABEL_38;
  }
  objc_storeStrong((id *)&self->_candidateElements, obja);
  objc_storeStrong((id *)&self->_foundElement, v15);
  self->_finished = 1;
  if (v50)
    v50[2](v50);
LABEL_38:

}

- (PKTextInputElement)foundElement
{
  return self->_foundElement;
}

- (NSSet)candidateElements
{
  return self->_candidateElements;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateElements, 0);
  objc_storeStrong((id *)&self->_foundElement, 0);
}

@end
