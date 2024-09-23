@implementation PKTextInputReserveSpaceController

- (PKTextInputReserveSpaceController)initWithFeedbackController:(id)a3
{
  id v5;
  PKTextInputReserveSpaceController *v6;
  PKTextInputReserveSpaceController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTextInputReserveSpaceController;
  v6 = -[PKTextInputReserveSpaceController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feedbackController, a3);
    v7->__wasAskedToReserveSpace = 0;
    v7->__insertionCharacterLocation = 0x7FFFFFFFFFFFFFFFLL;
    v7->__reserveSpaceState = 0;
  }

  return v7;
}

- (void)beginIfPossibleWithElement:(id)a3 atLocation:(CGPoint)a4 coordinateSpace:(id)a5
{
  double y;
  double x;
  _QWORD *v9;
  id v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  _QWORD v21[7];
  uint8_t buf[4];
  _QWORD *v23;
  uint64_t v24;
  CGPoint v25;
  CGRect v26;

  y = a4.y;
  x = a4.x;
  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = -[PKTextInputReserveSpaceController isReserveSpaceActive](self, "isReserveSpaceActive");
  if (v9)
  {
    if (!v11)
    {
      -[PKTextInputElement coordinateSpace]((uint64_t)v9);
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)v12;
        v14 = -[PKTextInputElement isEditableElement]((uint64_t)v9);

        if (v14)
        {
          if ((-[PKTextInputElement isFocused]((uint64_t)v9) & 1) != 0
            || (-[PKTextInputElement shouldPostponeFocusing](v9) & 1) == 0)
          {
            v15 = os_log_create("com.apple.pencilkit", "PencilTextInput");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v23 = v9;
              _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_DEFAULT, "ReserveSpace: beginIfPossibleWithElement, element: %@", buf, 0xCu);
            }

            -[PKTextInputElement coordinateSpace]((uint64_t)v9);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v10, v16, x, y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
            v19 = v18;

            v26.origin.x = -[PKTextInputElement frame]((uint64_t)v9);
            v25.x = v17;
            v25.y = v19;
            if (CGRectContainsPoint(v26, v25))
            {
              -[PKTextInputReserveSpaceController _setReserveSpaceState:](self, "_setReserveSpaceState:", 1);
              -[PKTextInputReserveSpaceController delegate](self, "delegate");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "reserveSpaceController:willFocusElement:", self, v9);

              v21[0] = MEMORY[0x1E0C809B0];
              v21[1] = 3221225472;
              v21[2] = __91__PKTextInputReserveSpaceController_beginIfPossibleWithElement_atLocation_coordinateSpace___block_invoke;
              v21[3] = &unk_1E777C450;
              v21[4] = self;
              *(double *)&v21[5] = v17;
              *(double *)&v21[6] = v19;
              -[PKTextInputElement loadContentFocusingIfNeededWithReferencePoint:alwaysSetSelectionFromReferencePoint:rectOfInterest:completion:]((uint64_t)v9, 0, v21, v17, v19, *MEMORY[0x1E0C9D628], *(CGFloat *)(MEMORY[0x1E0C9D628] + 8), *(CGFloat *)(MEMORY[0x1E0C9D628] + 16), *(CGFloat *)(MEMORY[0x1E0C9D628] + 24));
            }
          }
        }
      }
    }
  }

}

void __91__PKTextInputReserveSpaceController_beginIfPossibleWithElement_atLocation_coordinateSpace___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "_reserveSpaceState");
  v4 = v8;
  if (v3 == 1)
  {
    if (v8)
    {
      v5 = *((_QWORD *)v8 + 3);
      v6 = *(void **)(a1 + 32);
      if (v5)
        v7 = v5 == 3;
      else
        v7 = 1;
      if (!v7)
      {
        objc_msgSend(v6, "_setTargetElementContent:", v8);
        objc_msgSend(*(id *)(a1 + 32), "set_targetPointInElement:", *(double *)(a1 + 40), *(double *)(a1 + 48));
        objc_msgSend(*(id *)(a1 + 32), "_updateReserveSpaceState");
LABEL_9:
        v4 = v8;
        goto LABEL_10;
      }
    }
    else
    {
      v6 = *(void **)(a1 + 32);
    }
    objc_msgSend(v6, "_finishAndResetStateInsertingWhitespace:", 0);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)reserveSpaceWhenReady
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "ReserveSpace: reserveSpaceWhenReady", v4, 2u);
  }

  if (-[PKTextInputReserveSpaceController isReserveSpaceActive](self, "isReserveSpaceActive"))
  {
    -[PKTextInputReserveSpaceController set_wasAskedToReserveSpace:](self, "set_wasAskedToReserveSpace:", 1);
    -[PKTextInputReserveSpaceController _updateReserveSpaceState](self, "_updateReserveSpaceState");
  }
}

- (void)cancelReserveSpaceIntro
{
  unint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[PKTextInputReserveSpaceController _reserveSpaceState](self, "_reserveSpaceState") - 1;
  v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3 >= 4)
      v5 = CFSTR("N");
    else
      v5 = CFSTR("Y");
    -[PKTextInputReserveSpaceController _targetElementContent](self, "_targetElementContent");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = *(void **)(v6 + 8);
    else
      v8 = 0;
    v9 = v8;
    v10 = 138412546;
    v11 = v5;
    v12 = 2048;
    v13 = v9;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "ReserveSpace: cancelIntro, canCancel: %@, element: %p", (uint8_t *)&v10, 0x16u);

  }
  if (v3 <= 3)
    -[PKTextInputReserveSpaceController _finishAndResetStateInsertingWhitespace:](self, "_finishAndResetStateInsertingWhitespace:", 0);
}

- (void)finishReserveSpaceAndInsertWhitespace:(BOOL)a3
{
  _BOOL8 v3;
  int64_t v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v5 = -[PKTextInputReserveSpaceController _reserveSpaceState](self, "_reserveSpaceState");
  v6 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v5)
      v7 = CFSTR("Y");
    else
      v7 = CFSTR("N");
    -[PKTextInputReserveSpaceController _targetElementContent](self, "_targetElementContent");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = *(void **)(v8 + 8);
    else
      v10 = 0;
    v11 = v10;
    v12 = 138412546;
    v13 = v7;
    v14 = 2048;
    v15 = v11;
    _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "ReserveSpace: finish. Can finish and remove placeholder: %@, element: %p", (uint8_t *)&v12, 0x16u);

  }
  if (v5)
    -[PKTextInputReserveSpaceController _finishAndResetStateInsertingWhitespace:](self, "_finishAndResetStateInsertingWhitespace:", v3);
}

- (void)_updateReserveSpaceState
{
  switch(-[PKTextInputReserveSpaceController _reserveSpaceState](self, "_reserveSpaceState"))
  {
    case 1:
      -[PKTextInputReserveSpaceController _moveToContentLoadedIfReady](self, "_moveToContentLoadedIfReady");
      break;
    case 2:
      -[PKTextInputReserveSpaceController _moveToShowingIntroIfReady](self, "_moveToShowingIntroIfReady");
      break;
    case 3:
      -[PKTextInputReserveSpaceController _moveToInsertingPlaceholderIfReady](self, "_moveToInsertingPlaceholderIfReady");
      break;
    case 4:
      -[PKTextInputReserveSpaceController _moveToShowingPlaceholderIfReady](self, "_moveToShowingPlaceholderIfReady");
      break;
    default:
      return;
  }
}

- (void)_moveToContentLoadedIfReady
{
  void *v3;

  -[PKTextInputReserveSpaceController _targetElementContent](self, "_targetElementContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PKTextInputReserveSpaceController _setReserveSpaceState:](self, "_setReserveSpaceState:", 2);
}

- (void)_moveToShowingIntroIfReady
{
  int64_t v3;
  int64_t v4;
  void *v5;
  id v6;

  -[PKTextInputReserveSpaceController _targetElementContent](self, "_targetElementContent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PKTextInputReserveSpaceController _preferredInsertionLocation](self, "_preferredInsertionLocation");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PKTextInputReserveSpaceController _finishAndResetStateInsertingWhitespace:](self, "_finishAndResetStateInsertingWhitespace:", 0);
  }
  else
  {
    v4 = v3;
    -[PKTextInputReserveSpaceController set_insertionCharacterLocation:](self, "set_insertionCharacterLocation:", v3);
    -[PKTextInputReserveSpaceController _setReserveSpaceState:](self, "_setReserveSpaceState:", 3);
    -[PKTextInputReserveSpaceController feedbackController](self, "feedbackController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReferenceElementContent:referenceRange:feedbackType:", v6, v4, 0, 3);

  }
}

- (void)_moveToInsertingPlaceholderIfReady
{
  void *v3;
  int v4;
  double v5;
  double v6;
  NSObject *v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id *v15;
  _QWORD v16[5];
  id v17;
  double v18;
  double v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;
  CGSize v27;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[PKTextInputReserveSpaceController _wasAskedToReserveSpace](self, "_wasAskedToReserveSpace")
    && -[PKTextInputReserveSpaceController _reserveSpaceState](self, "_reserveSpaceState") == 3)
  {
    -[PKTextInputReserveSpaceController _targetElementContent](self, "_targetElementContent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PKTextInputElementContent isSingleLineDocumentContent]((uint64_t)v3);
    if (v4)
      v5 = 100.0;
    else
      v5 = 0.0;
    if (v4)
      v6 = 0.0;
    else
      v6 = 30.0;
    -[PKTextInputReserveSpaceController _setReserveSpaceState:](self, "_setReserveSpaceState:", 4);
    v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v27.width = v5;
      v27.height = v6;
      NSStringFromCGSize(v27);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKTextInputReserveSpaceController _insertionCharacterLocation](self, "_insertionCharacterLocation");
      -[PKTextInputReserveSpaceController _targetElementContent](self, "_targetElementContent");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v10)
        v12 = *(void **)(v10 + 8);
      else
        v12 = 0;
      v13 = v12;
      *(_DWORD *)buf = 138412802;
      v21 = v8;
      v22 = 2048;
      v23 = v9;
      v24 = 2048;
      v25 = v13;
      _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "ReserveSpace: ready, insert placeholder of size: %@, location: %ld, element: %p", buf, 0x20u);

    }
    v14 = -[PKTextInputReserveSpaceController _insertionCharacterLocation](self, "_insertionCharacterLocation");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__PKTextInputReserveSpaceController__moveToInsertingPlaceholderIfReady__block_invoke;
    v16[3] = &unk_1E777C4A0;
    v16[4] = self;
    v17 = v3;
    v18 = v5;
    v19 = v6;
    v15 = v3;
    -[PKTextInputElementContent selectTextInRange:completion:](v15, v14, 0, v16);

  }
}

void __71__PKTextInputReserveSpaceController__moveToInsertingPlaceholderIfReady__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "_reserveSpaceState") == 4)
  {
    if (a2)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __71__PKTextInputReserveSpaceController__moveToInsertingPlaceholderIfReady__block_invoke_2;
      v5[3] = &unk_1E777C478;
      v4 = *(void **)(a1 + 40);
      v5[4] = *(_QWORD *)(a1 + 32);
      v6 = v4;
      -[PKTextInputElementContent _insertTextPlaceholderWithSize:completionHandler:]((uint64_t)v6, v5, *(double *)(a1 + 48), *(double *)(a1 + 56));

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_finishAndResetStateInsertingWhitespace:", 0);
    }
  }
}

void __71__PKTextInputReserveSpaceController__moveToInsertingPlaceholderIfReady__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_reserveSpaceState") == 4)
  {
    v3 = *(void **)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v3, "set_textPlaceholder:");
      objc_msgSend(*(id *)(a1 + 32), "feedbackController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_textPlaceholder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "beginDisplayForReserveSpacePlaceholder:", v5);

      objc_msgSend(*(id *)(a1 + 32), "_updateReserveSpaceState");
    }
    else
    {
      objc_msgSend(v3, "_finishAndResetStateInsertingWhitespace:");
    }
  }
  else
  {
    -[PKTextInputElementContent _removeTextPlaceholder:willInsertText:completionHandler:](*(_QWORD *)(a1 + 40), v6, 0, &__block_literal_global_69);
  }

}

- (void)_moveToShowingPlaceholderIfReady
{
  uint64_t v3;
  void *v4;
  int64_t v5;

  -[PKTextInputReserveSpaceController _textPlaceholder](self, "_textPlaceholder");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[PKTextInputReserveSpaceController _reserveSpaceState](self, "_reserveSpaceState");

    if (v5 == 4)
    {
      -[PKTextInputReserveSpaceController _startDismissTimerWithDelay:](self, "_startDismissTimerWithDelay:", 5.0);
      -[PKTextInputReserveSpaceController _setReserveSpaceState:](self, "_setReserveSpaceState:", 5);
    }
  }
}

- (void)_finishAndResetStateInsertingWhitespace:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;

  -[PKTextInputReserveSpaceController feedbackController](self, "feedbackController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelShowingReserveSpaceIntro");

  -[PKTextInputReserveSpaceController _targetElementContent](self, "_targetElementContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputReserveSpaceController _textPlaceholder](self, "_textPlaceholder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v6)
  {
    -[PKTextInputReserveSpaceController feedbackController](self, "feedbackController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputReserveSpaceController _textPlaceholder](self, "_textPlaceholder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endDisplayForReserveSpacePlaceholder:", v9);

    -[PKTextInputReserveSpaceController _textPlaceholder](self, "_textPlaceholder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rect");
    v14 = v13;
    v16 = v15;

    -[PKTextInputReserveSpaceController _textPlaceholder](self, "_textPlaceholder");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77__PKTextInputReserveSpaceController__finishAndResetStateInsertingWhitespace___block_invoke;
    v19[3] = &unk_1E777C4E8;
    v23 = a3;
    v19[4] = self;
    v20 = v6;
    v21 = v14;
    v22 = v16;
    -[PKTextInputElementContent _removeTextPlaceholder:willInsertText:completionHandler:]((uint64_t)v20, v17, 0, v19);

  }
  -[PKTextInputReserveSpaceController _setTargetElementContent:](self, "_setTargetElementContent:", 0);
  -[PKTextInputReserveSpaceController set_targetPointInElement:](self, "set_targetPointInElement:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[PKTextInputReserveSpaceController set_textPlaceholder:](self, "set_textPlaceholder:", 0);
  -[PKTextInputReserveSpaceController set_insertionCharacterLocation:](self, "set_insertionCharacterLocation:", 0x7FFFFFFFFFFFFFFFLL);
  -[PKTextInputReserveSpaceController set_wasAskedToReserveSpace:](self, "set_wasAskedToReserveSpace:", 0);
  -[PKTextInputReserveSpaceController _dismissTimer](self, "_dismissTimer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "invalidate");

  -[PKTextInputReserveSpaceController set_dismissTimer:](self, "set_dismissTimer:", 0);
  -[PKTextInputReserveSpaceController _setReserveSpaceState:](self, "_setReserveSpaceState:", 0);

}

void __77__PKTextInputReserveSpaceController__finishAndResetStateInsertingWhitespace___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;

  if (*(_BYTE *)(a1 + 64))
  {
    v3 = *(void **)(a1 + 32);
    v2 = *(_QWORD **)(a1 + 40);
    if (v2)
      v2 = (_QWORD *)v2[1];
    v4 = v2;
    objc_msgSend(v3, "_insertWhitespaceWithElement:atReferencePoint:completion:", v4, &__block_literal_global_23, *(double *)(a1 + 48), *(double *)(a1 + 56));

  }
}

- (void)_setReserveSpaceState:(int64_t)a3
{
  NSObject *v5;
  unint64_t reserveSpaceState;
  const __CFString *v7;
  const __CFString *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    reserveSpaceState = self->__reserveSpaceState;
    if (reserveSpaceState > 5)
      v7 = &stru_1E777DEE8;
    else
      v7 = off_1E777C580[reserveSpaceState];
    if ((unint64_t)a3 > 5)
      v8 = &stru_1E777DEE8;
    else
      v8 = off_1E777C580[a3];
    v13 = 138412546;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "ReserveSpace: state changed %@ -> %@", (uint8_t *)&v13, 0x16u);
  }

  v9 = -[PKTextInputReserveSpaceController isReserveSpaceActive](self, "isReserveSpaceActive");
  v10 = -[PKTextInputReserveSpaceController isReserveSpacePlaceholderVisible](self, "isReserveSpacePlaceholderVisible");
  self->__reserveSpaceState = a3;
  if (v9 != -[PKTextInputReserveSpaceController isReserveSpaceActive](self, "isReserveSpaceActive"))
  {
    -[PKTextInputReserveSpaceController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reserveSpaceControllerIsActiveChanged:", self);

  }
  if (v10 != -[PKTextInputReserveSpaceController isReserveSpacePlaceholderVisible](self, "isReserveSpacePlaceholderVisible"))
  {
    -[PKTextInputReserveSpaceController delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reserveSpaceControllerIsPlaceholderVisibleChanged:", self);

  }
  +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
  -[PKTextInputReserveSpaceController _updateReserveSpaceState](self, "_updateReserveSpaceState");
}

- (BOOL)isReserveSpaceActive
{
  return (unint64_t)(-[PKTextInputReserveSpaceController _reserveSpaceState](self, "_reserveSpaceState") - 1) < 5;
}

- (BOOL)isReserveSpacePlaceholderVisible
{
  return -[PKTextInputReserveSpaceController _reserveSpaceState](self, "_reserveSpaceState") == 5;
}

- (void)setCanvasControllerIsDrawing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  if (-[PKTextInputReserveSpaceController _canvasControllerIsDrawing](self, "_canvasControllerIsDrawing") != a3)
  {
    -[PKTextInputReserveSpaceController set_canvasControllerIsDrawing:](self, "set_canvasControllerIsDrawing:", v3);
    if (v3)
    {
      -[PKTextInputReserveSpaceController _dismissTimer](self, "_dismissTimer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "invalidate");

      -[PKTextInputReserveSpaceController set_dismissTimer:](self, "set_dismissTimer:", 0);
    }
    else if (-[PKTextInputReserveSpaceController isReserveSpaceActive](self, "isReserveSpaceActive"))
    {
      -[PKTextInputReserveSpaceController _startDismissTimerWithDelay:](self, "_startDismissTimerWithDelay:", 2.0);
    }
  }
}

- (void)_startDismissTimerWithDelay:(double)a3
{
  void *v5;
  id v6;

  -[PKTextInputReserveSpaceController _dismissTimer](self, "_dismissTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleAutodismissTimer, 0, 0, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextInputReserveSpaceController set_dismissTimer:](self, "set_dismissTimer:", v6);

}

- (void)_handleAutodismissTimer
{
  -[PKTextInputReserveSpaceController finishReserveSpaceAndInsertWhitespace:](self, "finishReserveSpaceAndInsertWhitespace:", 0);
}

- (int64_t)_preferredInsertionLocation
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  int v21;
  uint64_t v22;
  CGFloat x;
  CGFloat y;
  double width;
  CGFloat height;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CGFloat MidX;
  _BOOL4 v32;
  void *v33;
  int v34;
  void *v35;
  int32_t IntPropertyValue;
  int v37;
  _BOOL4 v38;
  void *v39;
  unint64_t v40;
  int v41;
  CGPoint v42;
  CGRect v43;
  CGRect v44;

  -[PKTextInputReserveSpaceController _targetElementContent](self, "_targetElementContent");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = *(void **)(v3 + 8);
  else
    v5 = 0;
  v6 = v5;
  -[PKTextInputElement coordinateSpace]((uint64_t)v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputReserveSpaceController _targetPointInElement](self, "_targetPointInElement");
  if (v4)
  {
    v11 = -[PKTextInputElementContent characterIndexClosestToPoint:inCoordinateSpace:forInsertingText:adjustForLastCharacter:]((id *)v4, v7, 0, 1, v9, v10);
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_17;
  }
  else
  {
    v11 = 0;
  }
  if (v11 < -[PKTextInputElementContent contentLength](v4))
  {
    v13 = 15;
    if (v11 > 15)
      v13 = v11;
    v14 = v13 - 15;
    v15 = -[PKTextInputElementContent contentLength](v4);
    v16 = v11 + 15 >= v15 ? v15 : v11 + 15;
    -[PKTextInputReserveSpaceController _targetPointInElement](self, "_targetPointInElement");
    if (v14 < v16)
    {
      v19 = v17;
      v20 = v18;
      v21 = 0;
      v22 = v14;
      while (1)
      {
        -[PKTextInputElementContent firstRectForRange:inCoordinateSpace:]((id *)v4, v22, 1uLL, v7);
        x = v43.origin.x;
        y = v43.origin.y;
        width = v43.size.width;
        height = v43.size.height;
        v42.x = v19;
        v42.y = v20;
        if (CGRectContainsPoint(v43, v42))
          break;
        v21 |= width == 0.0;
        if (v16 == ++v22)
          goto LABEL_16;
      }
      v28 = -[PKTextInputElementContent rangeOfCharacterAtIndex:](v4, v22);
      v30 = v28 + v29;
      if ((uint64_t)(v28 + v29) >= v16 - 1)
      {
        v32 = 0;
      }
      else
      {
        v44.origin.x = x;
        v44.origin.y = y;
        v44.size.width = width;
        v44.size.height = height;
        MidX = CGRectGetMidX(v44);
        v32 = v19 >= MidX;
        if (v19 >= MidX)
          v22 = v30;
      }
      v40 = v30;
      v41 = v32;
      if (v4 && v22 >= 1 && *(_QWORD *)(v4 + 64))
      {
        -[PKTextInputElementContent stringInRange:](v4, v22 - 1, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "length") == 1)
        {
          v34 = objc_msgSend(v8, "characterIsMember:", objc_msgSend(v33, "characterAtIndex:", 0));
          v41 &= v34 ^ 1;
          if (v34)
            --v22;
        }

      }
      -[PKTextInputElementContent stringInRange:](v4, v22, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      IntPropertyValue = u_getIntPropertyValue(objc_msgSend(v35, "characterAtIndex:", 0), UCHAR_GRAPHEME_CLUSTER_BREAK);

      v37 = v41;
      if (v41 && IntPropertyValue == 10 && v22 > v14)
      {
        v22 = v28;
      }
      else
      {
        if (IntPropertyValue != 10)
          v37 = 1;
        if (((v37 ^ 1) & v21) == 1 && v28 > v14)
        {
          v28 = -[PKTextInputElementContent rangeOfCharacterAtIndex:](v4, v28 - 1);
          v22 = v28;
        }
        else
        {
          if (v22 >= v16)
            LOBYTE(v37) = 1;
          v38 = IntPropertyValue == 10;
          if ((v37 & 1) != 0)
            goto LABEL_46;
          v22 = v40;
          v28 = v40;
        }
      }
      -[PKTextInputElementContent stringInRange:](v4, v28, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = u_getIntPropertyValue(objc_msgSend(v39, "characterAtIndex:", 0), UCHAR_GRAPHEME_CLUSTER_BREAK) == 10;

LABEL_46:
      if (v38)
        v12 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v12 = v22;
      goto LABEL_17;
    }
  }
LABEL_16:
  v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_17:

LABEL_19:
  return v12;
}

- (void)_insertWhitespaceWithElement:(id)a3 atReferencePoint:(CGPoint)a4 completion:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v16;
  _QWORD v17[4];
  id v18;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  v10 = a3;
  -[PKTextInputReserveSpaceController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reserveSpaceController:willFocusElement:", self, v10);

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__PKTextInputReserveSpaceController__insertWhitespaceWithElement_atReferencePoint_completion___block_invoke;
  v17[3] = &unk_1E777C538;
  v18 = v9;
  v12 = *MEMORY[0x1E0C9D628];
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v16 = v9;
  -[PKTextInputElement loadContentFocusingIfNeededWithReferencePoint:alwaysSetSelectionFromReferencePoint:rectOfInterest:completion:]((uint64_t)v10, 1, v17, x, y, v12, v13, v14, v15);

}

void __94__PKTextInputReserveSpaceController__insertWhitespaceWithElement_atReferencePoint_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  id *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = -[PKTextInputElementContent isSingleLineDocumentContent]((uint64_t)v3);
  v5 = CFSTR("\n\n");
  if (v4)
    v5 = CFSTR("  ");
  v13[0] = v5;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = v5;
  objc_msgSend(v6, "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__PKTextInputReserveSpaceController__insertWhitespaceWithElement_atReferencePoint_completion___block_invoke_2;
  v10[3] = &unk_1E777C510;
  v11 = v3;
  v12 = *(id *)(a1 + 32);
  v9 = (id *)v3;
  -[PKTextInputElementContent insertTextsToCommit:withAlternatives:activePreviewText:replacingRange:completion:](v9, v8, &unk_1E77ECDA8, 0, 0x7FFFFFFFFFFFFFFFLL, 0, v10);

}

void __94__PKTextInputReserveSpaceController__insertWhitespaceWithElement_atReferencePoint_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  if (a2)
  {
    v3 = -[PKTextInputElementContent selectedRange](*(_QWORD *)(a1 + 32));
    v5 = v4;
    if (v3)
      v6 = v3 == 0x7FFFFFFFFFFFFFFFLL;
    else
      v6 = 1;
    if (v6)
      v7 = v3;
    else
      v7 = v3 - 1;
    -[PKTextInputElementContent selectTextInRange:completion:](*(id **)(a1 + 32), v7, v5, *(void **)(a1 + 40));
  }
}

- (CGRect)placeholderFrameInCoordinateSpace:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v4 = a3;
  v5 = *MEMORY[0x1E0C9D628];
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (-[PKTextInputReserveSpaceController isReserveSpacePlaceholderVisible](self, "isReserveSpacePlaceholderVisible"))
  {
    -[PKTextInputReserveSpaceController _textPlaceholder](self, "_textPlaceholder");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[PKTextInputReserveSpaceController _targetElementContent](self, "_targetElementContent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[PKTextInputReserveSpaceController _targetElementContent](self, "_targetElementContent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKTextInputReserveSpaceController _textPlaceholder](self, "_textPlaceholder");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = -[PKTextInputElementContent frameForTextPlaceholder:inCoordinateSpace:]((uint64_t)v12, v13, v4);
        v6 = v14;
        v7 = v15;
        v8 = v16;

      }
    }
  }

  v17 = v5;
  v18 = v6;
  v19 = v7;
  v20 = v8;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)tapPointIsInPlaceholder:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  BOOL v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  y = a3.y;
  x = a3.x;
  if (!-[PKTextInputReserveSpaceController isReserveSpacePlaceholderVisible](self, "isReserveSpacePlaceholderVisible"))
    return 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[PKTextInputReserveSpaceController _textPlaceholder](self, "_textPlaceholder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__PKTextInputReserveSpaceController_tapPointIsInPlaceholder___block_invoke;
  v10[3] = &unk_1E777C560;
  v10[4] = &v11;
  *(CGFloat *)&v10[5] = x;
  *(CGFloat *)&v10[6] = y;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  v8 = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

BOOL __61__PKTextInputReserveSpaceController_tapPointIsInPlaceholder___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  _BOOL8 result;
  CGRect v8;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    result = 1;
  }
  else
  {
    objc_msgSend(a2, "rect");
    result = CGRectContainsPoint(v8, *(CGPoint *)(a1 + 40));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_BYTE *)(v6 + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)reportDebugStateDescription:(id)a3
{
  const __CFString *v5;
  const __CFString *v6;
  unint64_t v7;
  const __CFString *v8;
  id v9;

  v9 = a3;
  if (-[PKTextInputReserveSpaceController isReserveSpaceActive](self, "isReserveSpaceActive"))
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  (*((void (**)(id, const __CFString *, const __CFString *))a3 + 2))(v9, CFSTR("Reserve space active"), v5);
  if (-[PKTextInputReserveSpaceController isReserveSpacePlaceholderVisible](self, "isReserveSpacePlaceholderVisible"))
    v6 = CFSTR("Yes");
  else
    v6 = CFSTR("No");
  (*((void (**)(id, const __CFString *, const __CFString *))a3 + 2))(v9, CFSTR("Placeholder visible"), v6);
  v7 = -[PKTextInputReserveSpaceController _reserveSpaceState](self, "_reserveSpaceState");
  if (v7 > 5)
    v8 = &stru_1E777DEE8;
  else
    v8 = off_1E777C580[v7];
  (*((void (**)(id, const __CFString *, const __CFString *))a3 + 2))(v9, CFSTR("State"), v8);

}

- (PKTextInputReserveSpaceControllerDelegate)delegate
{
  return (PKTextInputReserveSpaceControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKTextInputFeedbackController)feedbackController
{
  return self->_feedbackController;
}

- (int64_t)_reserveSpaceState
{
  return self->__reserveSpaceState;
}

- (PKTextInputElementContent)_targetElementContent
{
  return self->__targetElementContent;
}

- (void)_setTargetElementContent:(id)a3
{
  objc_storeStrong((id *)&self->__targetElementContent, a3);
}

- (CGPoint)_targetPointInElement
{
  double x;
  double y;
  CGPoint result;

  x = self->__targetPointInElement.x;
  y = self->__targetPointInElement.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)set_targetPointInElement:(CGPoint)a3
{
  self->__targetPointInElement = a3;
}

- (int64_t)_insertionCharacterLocation
{
  return self->__insertionCharacterLocation;
}

- (void)set_insertionCharacterLocation:(int64_t)a3
{
  self->__insertionCharacterLocation = a3;
}

- (BOOL)_wasAskedToReserveSpace
{
  return self->__wasAskedToReserveSpace;
}

- (void)set_wasAskedToReserveSpace:(BOOL)a3
{
  self->__wasAskedToReserveSpace = a3;
}

- (BOOL)_canvasControllerIsDrawing
{
  return self->__canvasControllerIsDrawing;
}

- (void)set_canvasControllerIsDrawing:(BOOL)a3
{
  self->__canvasControllerIsDrawing = a3;
}

- (PKTextInputTextPlaceholder)_textPlaceholder
{
  return self->__textPlaceholder;
}

- (void)set_textPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->__textPlaceholder, a3);
}

- (NSTimer)_dismissTimer
{
  return self->__dismissTimer;
}

- (void)set_dismissTimer:(id)a3
{
  objc_storeStrong((id *)&self->__dismissTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__dismissTimer, 0);
  objc_storeStrong((id *)&self->__textPlaceholder, 0);
  objc_storeStrong((id *)&self->__targetElementContent, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
