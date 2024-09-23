@implementation PKTextInputElement

- (id)initWithElementInteraction:(void *)a3 elementIdentifier:(void *)a4 orderInContainer:
{
  id v8;
  id v9;
  id *v10;
  void *v11;
  char v12;
  uint64_t v13;
  objc_super v15;

  v8 = a2;
  v9 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)PKTextInputElement;
    v10 = (id *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 10, a2);
      objc_storeStrong(a1 + 15, a3);
      a1[11] = a4;
      -[PKTextInputElement _containerInteractionView](a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_opt_respondsToSelector();
      v13 = 1;
      if ((v12 & 1) != 0)
        v13 = 2;
      a1[7] = (id)v13;

    }
  }

  return a1;
}

- (id)_containerInteractionView
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v1[10], "interactionView");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v1[10], "view");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = 0;
    }
  }
  return a1;
}

- (id)initWithTextInput:(id *)a1
{
  id v3;
  id *v4;
  void *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)PKTextInputElement;
    v4 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 13, v3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeWeak(a1 + 8, v3);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v3, "textInputView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeWeak(a1 + 8, v5);

      }
      a1[7] = 0;
      PKScribbleInteractionInTextInput(v3);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = a1[9];
      a1[9] = (id)v6;

    }
  }

  return a1;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  PKTextInputElement *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self && self->__waitingForMatchingDidFinishWriting)
  {
    v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = self;
      _os_log_fault_impl(&dword_1BE213000, v3, OS_LOG_TYPE_FAULT, "Element deallocated while waiting for matching didEndWriting. %@", buf, 0xCu);
    }

  }
  v4.receiver = self;
  v4.super_class = (Class)PKTextInputElement;
  -[PKTextInputElement dealloc](&v4, sel_dealloc);
}

- (id)coordinateSpace
{
  uint64_t v1;

  if (WeakRetained)
  {
    v1 = *(_QWORD *)(WeakRetained + 56);
    if ((unint64_t)(v1 - 1) >= 2)
    {
      if (v1)
        WeakRetained = 0;
      else
        WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(WeakRetained + 64));
    }
    else
    {
      -[PKTextInputElement _containerInteractionView]((id *)WeakRetained);
      WeakRetained = objc_claimAutoreleasedReturnValue();
    }
  }
  return (id)WeakRetained;
}

- (double)frame
{
  uint64_t v2;
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 56);
    if ((unint64_t)(v2 - 1) >= 2)
    {
      if (v2)
        return *(double *)(a1 + 8);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      -[PKTextInputElement coordinateSpace](a1);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (id)v9;
      if (WeakRetained && v9)
      {
        objc_msgSend(WeakRetained, "bounds");
        if (v10 != WeakRetained)
          v11 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(WeakRetained, v10, v11, v12, v13, v14);
        *(double *)(a1 + 8) = v11;
        *(double *)(a1 + 16) = v12;
        *(double *)(a1 + 24) = v13;
        *(double *)(a1 + 32) = v14;
      }

    }
    else
    {
      v3 = *(_QWORD *)(a1 + 120);
      WeakRetained = *(id *)(a1 + 80);
      objc_msgSend(WeakRetained, "frameForElement:", v3);
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v6;
      *(_QWORD *)(a1 + 24) = v7;
      *(_QWORD *)(a1 + 32) = v8;
    }

    return *(double *)(a1 + 8);
  }
  return 0.0;
}

- (double)hitToleranceFrameFromElementFrame:(double)a3
{
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;

  if (!a1)
    return 0.0;
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKTextInputElement isFocused]((uint64_t)a1))
  {
    objc_msgSend(v10, "firstResponderAttractionHorizontal");
    v12 = v11;
    objc_msgSend(v10, "firstResponderAttractionVertical");
  }
  else
  {
    objc_msgSend(v10, "textInputViewHitTestSlackHorizontal");
    v12 = v14;
    objc_msgSend(v10, "textInputViewHitTestSlackVertical");
  }
  v15 = v13;
  objc_opt_self();
  v16 = -v15;
  v17 = -v12;
  v18 = v12 * -1.25;
  -[PKTextInputElement _scribbleInteraction](a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "hitToleranceInsetsWithDefaultInsets:element:", a1[15], v16, v17, v16, v18);
    v16 = v21;
    v17 = v22;
  }
  v23 = +[PKTextInputElement hitToleranceFrameFromElementFrame:insets:](a2, a3, a4, a5, v16, v17);

  return v23;
}

- (uint64_t)isFocused
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 56);
    if ((unint64_t)(v2 - 1) >= 2)
    {
      if (v2)
      {
        return 0;
      }
      else
      {
        -[PKTextInputElement _textInputResponder](result);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isFirstResponder");

        return v8;
      }
    }
    else if (objc_msgSend(*(id *)(result + 80), "supportsIsElementFocused"))
    {
      v3 = *(void **)(v1 + 80);
      v4 = *(_QWORD *)(v1 + 120);
      v5 = v3;
      v6 = objc_msgSend(v5, "isElementFocused:", v4);

      return v6;
    }
    else
    {
      return *(_BYTE *)(v1 + 50) != 0;
    }
  }
  return result;
}

- (_QWORD)_scribbleInteraction
{
  unint64_t v1;

  if (a1)
  {
    v1 = a1[7];
    if (v1 <= 2)
      return *(id *)((char *)a1 + qword_1BE4FC1A8[v1]);
    a1 = 0;
  }
  return a1;
}

+ (double)hitToleranceFrameFromElementFrame:(double)a3 insets:(double)a4
{
  void *v9;
  double v10;
  double v11;
  void *v12;

  objc_opt_self();
  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minimumWritingSpaceWidth");
  v11 = v10;

  if (a3 < v11)
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "minimumWritingSpaceWidth");

  }
  return a1 + a6;
}

- (id)description
{
  unint64_t elementType;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  NSNumber *recognitionIdentifier;
  void *v40;
  objc_super v42;
  CGRect v43;
  CGRect v44;

  if (self)
  {
    elementType = self->__elementType;
    if (elementType > 2)
      v4 = CFSTR("?");
    else
      v4 = off_1E77788A0[elementType];
  }
  else
  {
    v4 = CFSTR("UITextInputView");
  }
  -[PKTextInputElement coordinateSpace]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  -[PKTextInputElement coordinateSpace]((uint64_t)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_9:
    v27 = (void *)MEMORY[0x1E0CB3940];
    v44.origin.x = -[PKTextInputElement frame]((uint64_t)self);
    NSStringFromCGRect(v44);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("frameInElement: %@"), v26);
    goto LABEL_10;
  }
  v8 = -[PKTextInputElement frame]((uint64_t)self);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PKTextInputElement coordinateSpace]((uint64_t)self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputElement coordinateSpace]((uint64_t)self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v15, v17, v8, v10, v12, v14);
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = (void *)MEMORY[0x1E0CB3940];
  v43.origin.x = v18;
  v43.origin.y = v20;
  v43.size.width = v22;
  v43.size.height = v24;
  NSStringFromCGRect(v43);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("frameInWindow: %@"), v26);
LABEL_10:
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (self && self->__containerInteraction)
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    v30 = self->_containerElementIdentifier;
    objc_msgSend(v29, "stringWithFormat:", CFSTR(", containerElementID: %@, orderInContainer: %ld"), v30, self->__orderInContainer);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = &stru_1E777DEE8;
  }
  -[PKTextInputElement referenceView]((id *)&self->super.isa);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)MEMORY[0x1E0CB3940];
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("<%@: %p>"), v35, v32);
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = CFSTR("None");
  }
  v42.receiver = self;
  v42.super_class = (Class)PKTextInputElement;
  -[PKTextInputElement description](&v42, sel_description);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (self)
    recognitionIdentifier = self->_recognitionIdentifier;
  else
    recognitionIdentifier = 0;
  objc_msgSend(v37, "stringByAppendingFormat:", CFSTR(" type: %@, recognitionID: %@%@, %@, referenceView: %@"), v4, recognitionIdentifier, v31, v28, v36);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

- (id)referenceView
{
  id *v1;

  if (WeakRetained)
  {
    v1 = WeakRetained;
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 8);
    if (!WeakRetained)
    {
      if (v1[10])
      {
        -[PKTextInputElement _containerInteractionView](v1);
        WeakRetained = (id *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        WeakRetained = 0;
      }
    }
  }
  return WeakRetained;
}

- (const)debugElementTypeDescription
{
  unint64_t length;

  if (result)
  {
    length = result[1].length;
    if (length > 2)
      return CFSTR("?");
    else
      return off_1E77788A0[length];
  }
  return result;
}

- (id)_textInputResponder
{
  id *v1;
  id WeakRetained;
  id v3;

  if (a1)
  {
    v1 = (id *)(a1 + 104);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = objc_loadWeakRetained(v1);
    else
      v3 = 0;

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)updateWithFocusedTextInput:(uint64_t)a1
{
  id v3;
  id v4;

  v3 = a2;
  if (a1 && *(_QWORD *)(a1 + 56) == 1)
  {
    v4 = v3;
    objc_storeWeak((id *)(a1 + 104), v3);
    v3 = v4;
  }

}

- (void)updateFromEquivalentElement:(uint64_t)a1
{
  _BYTE *v3;
  char v4;
  uint64_t v5;

  v3 = a2;
  if (a1)
  {
    if (v3)
    {
      v4 = v3[50];
      v5 = *((_QWORD *)v3 + 11);
    }
    else
    {
      v4 = 0;
      v5 = 0;
    }
    *(_BYTE *)(a1 + 50) = v4;
    *(_QWORD *)(a1 + 88) = v5;
  }

}

- (uint64_t)shouldBeginAtLocation:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;

  if (!a1)
    return 0;
  -[PKTextInputElement _scribbleInteraction](a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "shouldBeginAtLocation:", a2, a3);
  else
    v7 = 1;

  return v7;
}

- (void)didTargetElementForTouches:(void *)a3 event:
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (a1)
  {
    -[PKTextInputElement _scribbleInteraction](a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "didTargetElement:forTouches:event:", a1[15], v7, v5);

  }
}

- (BOOL)containsPoint:(double)a3 inCoordinateSpace:(double)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  CGFloat v11;
  CGPoint v12;
  CGRect v13;

  if (result)
  {
    v6 = result;
    v7 = a2;
    -[PKTextInputElement coordinateSpace](v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v7, v8, a3, a4, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v11 = v10;

    v13.origin.x = -[PKTextInputElement frame](v6);
    v12.x = v9;
    v12.y = v11;
    return CGRectContainsPoint(v13, v12);
  }
  return result;
}

- (id)isEquivalentToElement:(id *)a1
{
  _QWORD *v3;
  id *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id *v9;
  id *v10;
  id WeakRetained;
  id v12;
  id v13;

  v3 = a2;
  v4 = (id *)v3;
  if (!a1)
    goto LABEL_20;
  if (v3)
    v5 = (id)v3[7];
  else
    v5 = 0;
  if (a1[7] != v5)
    goto LABEL_19;
  if (a1[14])
  {
    if (v3)
    {
      v6 = (void *)v3[14];
      if (v6)
      {
        a1 = (id *)objc_msgSend(v6, "isEqualToNumber:");
        goto LABEL_20;
      }
    }
  }
  if (!a1[10])
  {
    v10 = a1 + 13;
    WeakRetained = objc_loadWeakRetained(v10);

    if (WeakRetained)
    {
      if (v4)
        v12 = objc_loadWeakRetained(v4 + 13);
      else
        v12 = 0;
      v13 = objc_loadWeakRetained(v10);
      a1 = (id *)objc_msgSend(v12, "isEqual:", v13);

      goto LABEL_20;
    }
LABEL_19:
    a1 = 0;
    goto LABEL_20;
  }
  if (!-[PKTextInputElement _isFromSameContainerAsElement:]((uint64_t)a1, v4))
    goto LABEL_19;
  a1 = (id *)a1[15];
  if (a1)
  {
    if (v4)
      v7 = v4[15];
    else
      v7 = 0;
    v8 = v7;
    v9 = a1;
    a1 = (id *)objc_msgSend(v8, "isEqual:", v9);

  }
LABEL_20:

  return a1;
}

- (uint64_t)_isFromSameContainerAsElement:(uint64_t)a1
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    v6 = *((id *)v3 + 10);
    if (v6)
    {
      v7 = v6;
      v8 = v4[10];
      v9 = *(id *)(a1 + 80);
      v5 = objc_msgSend(v9, "isEqual:", v8);

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (uint64_t)isInFrontOfElement:(uint64_t)a1
{
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v3 = a2;
  if (a1)
  {
    -[PKTextInputElement referenceView]((id *)a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputElement referenceView](v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isDescendantOfView:", v5);

    v7 = *(_QWORD *)(a1 + 56);
    if (v7 == 2)
    {
      if (-[PKTextInputElement _isFromSameContainerAsElement:](a1, v3))
      {
        if (v3)
          v9 = v3[11];
        else
          v9 = 0;
        v6 = *(_QWORD *)(a1 + 88) < (uint64_t)v9;
      }
    }
    else if (v7 == 1 && -[PKTextInputElement _isFromSameContainerAsElement:](a1, v3))
    {
      if (v3)
        v8 = v3[11];
      else
        v8 = 0;
      v6 = *(_QWORD *)(a1 + 88) >= (uint64_t)v8;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)isEditableElement
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id *v6;
  id WeakRetained;
  void *v8;
  id v9;
  char isKindOfClass;

  v1 = a1;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 80))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v2 = *(void **)(v1 + 80);
        v3 = *(_QWORD *)(v1 + 120);
        v4 = v2;
        v5 = objc_msgSend(v4, "isEditableElement:", v3);
LABEL_8:
        v1 = v5;

        return v1;
      }
    }
    else
    {
      v6 = (id *)(a1 + 104);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
      if (WeakRetained)
      {
        v8 = WeakRetained;
        v9 = objc_loadWeakRetained(v6);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v4 = objc_loadWeakRetained(v6);
          v5 = +[PKTextInputElementsFinder isResponderEditableTextInput:]((uint64_t)PKTextInputElementsFinder, v4);
          goto LABEL_8;
        }
      }
    }
    return 1;
  }
  return v1;
}

- (BOOL)isElementView:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  id v5;
  _BOOL8 v6;
  id *v7;
  id WeakRetained;
  id v9;
  id v10;

  v3 = a2;
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 56);
    if ((unint64_t)(v4 - 1) < 2)
    {
      -[PKTextInputElement _containerInteractionView]((id *)a1);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v5 == v3;
LABEL_9:

      goto LABEL_10;
    }
    if (!v4)
    {
      v7 = (id *)(a1 + 104);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
      if (WeakRetained == v3)
      {
        v6 = 1;
        v5 = v3;
      }
      else
      {
        v5 = WeakRetained;
        v9 = objc_loadWeakRetained(v7);
        objc_msgSend(v9, "textInputView");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v6 = v10 == v3;

      }
      goto LABEL_9;
    }
  }
  v6 = 0;
LABEL_10:

  return v6;
}

- (uint64_t)containsView:(id *)a1
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (a1)
  {
    -[PKTextInputElement referenceView](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = objc_msgSend(v3, "isDescendantOfView:", v4);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)loadContentFocusingIfNeededWithReferencePoint:(void *)a3 alwaysSetSelectionFromReferencePoint:(double)a4 rectOfInterest:(double)a5 completion:(CGFloat)a6
{
  id v17;
  id *v18;
  unint64_t v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v24;
  void *v25;
  char isKindOfClass;
  id WeakRetained;
  NSObject *v28;
  uint64_t v29;
  _QWORD v30[4];
  id *v31;
  id v32;
  uint64_t v33;
  id v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  _QWORD v39[4];
  id *v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v46 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  if (a1)
  {
    v18 = -[PKTextInputElementContent initWithElement:]((id *)[PKTextInputElementContent alloc], (void *)a1);
    v19 = *(_QWORD *)(a1 + 56);
    if (v19 >= 2)
    {
      if (v19 == 2)
      {
        v47.origin.x = -[PKTextInputElement _safeHitFrame](a1);
        v49.origin.x = a6;
        v49.origin.y = a7;
        v49.size.width = a8;
        v49.size.height = a9;
        v48 = CGRectIntersection(v47, v49);
        x = v48.origin.x;
        y = v48.origin.y;
        width = v48.size.width;
        height = v48.size.height;
        -[PKTextInputElement _containerInteractionView]((id *)a1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __131__PKTextInputElement_loadContentFocusingIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_rectOfInterest_completion___block_invoke_2;
          v30[3] = &unk_1E77787B8;
          v31 = v18;
          v32 = v24;
          v35 = x;
          v36 = y;
          v37 = width;
          v38 = height;
          v33 = a1;
          v34 = v17;
          -[PKTextInputElement focusElementIfNeededWithReferencePoint:alwaysSetSelectionFromReferencePoint:completion:](a1, a2, v30, a4, a5);

        }
        else
        {
          v28 = os_log_create("com.apple.pencilkit", "PencilTextInput");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = *(_QWORD *)(a1 + 80);
            *(_DWORD *)buf = 138412546;
            v43 = a1;
            v44 = 2112;
            v45 = v29;
            _os_log_error_impl(&dword_1BE213000, v28, OS_LOG_TYPE_ERROR, "Failed to load content for web element because the interaction view is nil. element: %@, interaction: %@", buf, 0x16u);
          }

          (*((void (**)(id, id *))v17 + 2))(v17, v18);
        }

      }
      goto LABEL_25;
    }
    if ((-[PKTextInputElement isEditableElement](a1) & 1) == 0 && !*(_QWORD *)(a1 + 56))
      goto LABEL_17;
    if (!-[PKTextInputElement shouldPostponeFocusing]((_QWORD *)a1)
      || -[PKTextInputElement isFocused](a1))
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __131__PKTextInputElement_loadContentFocusingIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_rectOfInterest_completion___block_invoke;
      v39[3] = &unk_1E7778768;
      v40 = v18;
      v41 = v17;
      -[PKTextInputElement focusElementIfNeededWithReferencePoint:alwaysSetSelectionFromReferencePoint:completion:](a1, a2, v39, a4, a5);

LABEL_25:
      goto LABEL_26;
    }
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 80), "interaction");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_20:
        (*((void (**)(id, id *))v17 + 2))(v17, v18);
        goto LABEL_25;
      }
      WeakRetained = *(id *)(a1 + 120);
      if (!WeakRetained
        || (objc_opt_respondsToSelector() & 1) == 0
        || !objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EF5D8B10))
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
LABEL_17:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    }
    -[PKTextInputElementContent loadDataIfNeededWithTextInput:]((uint64_t)v18, WeakRetained);
    goto LABEL_19;
  }
LABEL_26:

}

- (uint64_t)shouldPostponeFocusing
{
  uint64_t v1;
  void *v2;
  char v3;
  void *v4;
  char v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double MaxY;
  _BOOL4 v26;
  CGRect v28;
  CGRect v29;

  v1 = (uint64_t)a1;
  if (a1)
  {
    -[PKTextInputElement _scribbleInteraction](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "focusWillTransformElement:", *(_QWORD *)(v1 + 120));

    if ((v3 & 1) != 0)
    {
      return 1;
    }
    else
    {
      +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "UCBPaletteEnabled");

      if ((v5 & 1) != 0)
      {
        return 0;
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)(v1 + 64));
        objc_msgSend(WeakRetained, "window");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
        {
          -[PKTextInputElement _containerInteractionView]((id *)v1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "window");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v7)
            goto LABEL_12;
        }
        -[PKTextInputElement coordinateSpace](v1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = -[PKTextInputElement frame](v1);
          v12 = v11;
          v14 = v13;
          v16 = v15;
          -[PKTextInputElement coordinateSpace](v1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v17, v7, v10, v12, v14, v16);
          v20 = v19;
          v22 = v21;
          v24 = v23;

          objc_msgSend(v7, "bounds");
          MaxY = CGRectGetMaxY(v28);
          v29.origin.x = v18;
          v29.origin.y = v20;
          v29.size.width = v22;
          v29.size.height = v24;
          v26 = MaxY - CGRectGetMaxY(v29) < 120.0;
          v1 = v24 <= 120.0 && v26;
        }
        else
        {
LABEL_12:
          v1 = 0;
        }

      }
    }
  }
  return v1;
}

uint64_t __131__PKTextInputElement_loadContentFocusingIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_rectOfInterest_completion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
    -[PKTextInputElementContent loadDataIfNeededWithTextInput:](*(_QWORD *)(a1 + 32), a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)focusElementIfNeededWithReferencePoint:(void *)a3 alwaysSetSelectionFromReferencePoint:(double)a4 completion:(double)a5
{
  id v9;
  void (**v10)(_QWORD, _QWORD);
  uint64_t v11;
  double x;
  double y;
  double width;
  double height;
  BOOL v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  int v25;
  id v26;
  void *v27;
  int v28;
  id WeakRetained;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  _BOOL4 v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  dispatch_time_t v48;
  _QWORD v49[5];
  void *v50;
  _QWORD block[5];
  void *v52;
  _QWORD aBlock[5];
  void (**v54)(_QWORD, _QWORD);
  _QWORD v55[4];
  id v56;
  void (**v57)(_QWORD, _QWORD);
  BOOL v58;
  CGPoint v59;
  CGRect v60;

  v9 = a3;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (!a1)
    goto LABEL_39;
  v11 = *(_QWORD *)(a1 + 56);
  if ((unint64_t)(v11 - 1) >= 2)
  {
    if (v11)
      goto LABEL_39;
    v28 = -[PKTextInputElement isFocused](a1);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    if (WeakRetained
      && (-[PKTextInputElement coordinateSpace](a1),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          v30,
          v30))
    {
      if (!v28 || a2)
      {
        -[PKTextInputElement coordinateSpace](a1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "textInputView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v31, v32, a4, a5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
        v35 = v34;

        +[PKTextInputUITextInputInterface setSelectionWithReferencePoint:inTextInput:](PKTextInputUITextInputInterface, "setSelectionWithReferencePoint:inTextInput:", WeakRetained, v33, v35);
      }
      objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "textInputTraits");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "keyboardType");

      if (v38 == 122)
      {
        v39 = 1;
        if (!v10)
          goto LABEL_38;
      }
      else
      {
        -[PKTextInputElement _promoteKeyWindowIfNecessary:](WeakRetained);
        -[PKTextInputElement _textInputResponder](a1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = +[PKTextInputUITextInputInterface makeTextInputFirstResponder:forPencilInput:](PKTextInputUITextInputInterface, "makeTextInputFirstResponder:forPencilInput:", v44, 1);

        if (!v10)
        {
LABEL_38:

          goto LABEL_39;
        }
      }
    }
    else
    {
      v39 = 0;
      if (!v10)
        goto LABEL_38;
    }
    if ((v28 & v39) == 1)
    {
      ((void (**)(_QWORD, id))v10)[2](v10, WeakRetained);
    }
    else
    {
      +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "debugFirstResponderArtificialDelay");
      v47 = v46;

      v48 = dispatch_time(0, (uint64_t)(v47 * 1000000000.0));
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke;
      v55[3] = &unk_1E7778808;
      v57 = v10;
      v58 = v39;
      v56 = WeakRetained;
      dispatch_after(v48, MEMORY[0x1E0C80D38], v55);

    }
    goto LABEL_38;
  }
  if (*(_QWORD *)(a1 + 80))
  {
    v60.origin.x = -[PKTextInputElement frame](a1);
    x = v60.origin.x;
    y = v60.origin.y;
    width = v60.size.width;
    height = v60.size.height;
    v59.x = a4;
    v59.y = a5;
    v16 = CGRectContainsPoint(v60, v59);
    v17 = x + width;
    if (a4 <= x + width)
      v17 = a4;
    if (a4 < x)
      v17 = x;
    v18 = y + height;
    if (a5 <= y + height)
      v18 = a5;
    if (a5 < y)
      v18 = y;
    if (!v16)
    {
      a4 = v17;
      a5 = v18;
    }
    -[PKTextInputElement _containerInteractionView]((id *)a1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputElement _promoteKeyWindowIfNecessary:](v19);

    v20 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_2;
    aBlock[3] = &unk_1E7778768;
    aBlock[4] = a1;
    v54 = v10;
    v21 = _Block_copy(aBlock);
    v22 = objc_loadWeakRetained((id *)(a1 + 104));
    if (v22)
    {
      v23 = v22;
      v24 = *(id *)(a1 + 80);
      if ((objc_msgSend(v24, "supportsIsElementFocused") & 1) != 0)
      {
        v25 = -[PKTextInputElement isFocused](a1);

        if (v25)
        {
          block[0] = v20;
          block[1] = 3221225472;
          block[2] = __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_4;
          block[3] = &unk_1E7778858;
          block[4] = a1;
          v52 = v21;
          v26 = v21;
          dispatch_async(MEMORY[0x1E0C80D38], block);
          v27 = v52;
LABEL_33:

          goto LABEL_39;
        }
      }
      else
      {

      }
    }
    v40 = *(void **)(a1 + 80);
    v41 = *(_QWORD *)(a1 + 120);
    v49[0] = v20;
    v49[1] = 3221225472;
    v49[2] = __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_5;
    v49[3] = &unk_1E7778768;
    v49[4] = a1;
    v50 = v21;
    v42 = v21;
    v43 = v40;
    objc_msgSend(v43, "focusElement:initialFocusSelectionReferencePoint:completion:", v41, v49, a4, a5);

    v27 = v50;
    goto LABEL_33;
  }
  if (v9)
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
LABEL_39:

}

- (double)_safeHitFrame
{
  double result;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v7;

  if (!a1)
    return 0.0;
  result = -[PKTextInputElement frame](a1);
  if (*(_QWORD *)(a1 + 56) == 2)
  {
    -[PKTextInputElement frame](a1);
    if (v3 * 0.5 <= 4.0)
      v5 = v3 * 0.5;
    else
      v5 = 4.0;
    if (v4 * 0.5 <= 4.0)
      v6 = v4 * 0.5;
    else
      v6 = 4.0;
    v7.origin.x = -[PKTextInputElement frame](a1);
    *(_QWORD *)&result = (unint64_t)CGRectInset(v7, v5, v6);
  }
  return result;
}

void __131__PKTextInputElement_loadContentFocusingIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_rectOfInterest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __131__PKTextInputElement_loadContentFocusingIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_rectOfInterest_completion___block_invoke_3;
    v9[3] = &unk_1E7778790;
    v11 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 32);
    -[PKTextInputElementContent loadDataIfNeededWithWebDocumentSourceView:textInput:rectOfInterest:completion:](v4, v5, a2, v9, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88));

  }
  else
  {
    v6 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 48);
      if (v7)
        v8 = *(_QWORD *)(v7 + 80);
      else
        v8 = 0;
      *(_DWORD *)buf = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_error_impl(&dword_1BE213000, v6, OS_LOG_TYPE_ERROR, "Failed to load content for web element because it returned a nil focusedTextInput. element: %@, interaction: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

uint64_t __131__PKTextInputElement_loadContentFocusingIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_rectOfInterest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)evaluateLineBreakForTapAtLocation:(char)a3 weakCursor:(void *)a4 allowTrailingWhitespace:(double)a5 completion:(CGFloat)a6
{
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  double v24;
  CGFloat v25;
  double v26;
  char v27;
  char v28;
  CGRect v29;
  CGRect v30;

  v11 = a4;
  if (a1)
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tapToLineBreakVerticalDistance");
    v14 = v13;

    -[PKTextInputElement coordinateSpace](a1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputElement frame](a1);
    v29.origin.x = 0.0;
    v29.size.height = 1.0;
    v29.origin.y = a6;
    v30 = CGRectInset(v29, 0.0, -v14);
    x = v30.origin.x;
    y = v30.origin.y;
    width = v30.size.width;
    height = v30.size.height;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __102__PKTextInputElement_evaluateLineBreakForTapAtLocation_weakCursor_allowTrailingWhitespace_completion___block_invoke;
    v21[3] = &unk_1E77787E0;
    v22 = v15;
    v23 = v11;
    v27 = a3;
    v24 = a5;
    v25 = a6;
    v21[4] = a1;
    v26 = v14;
    v28 = a2;
    v20 = v15;
    -[PKTextInputElement loadContentFocusingIfNeededWithReferencePoint:alwaysSetSelectionFromReferencePoint:rectOfInterest:completion:](a1, 0, v21, a5, a6, x, y, width, height);

  }
}

void __102__PKTextInputElement_evaluateLineBreakForTapAtLocation_weakCursor_allowTrailingWhitespace_completion___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void (*v8)(void);
  uint64_t NonWhitespace;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  id *v19;
  CGRect v20;

  v19 = a2;
  if (!-[PKTextInputElementContent isSingleLineDocumentContent]((uint64_t)v19)
    && ((v3 = *(unsigned __int8 *)(a1 + 80),
         v4 = -[PKTextInputElementContent contentLength]((uint64_t)v19),
         -[PKTextInputElement coordinateSpace](*(_QWORD *)(a1 + 32)),
         v5 = (void *)objc_claimAutoreleasedReturnValue(),
         v6 = -[PKTextInputElementContent characterIndexClosestToPoint:inCoordinateSpace:forInsertingText:adjustForLastCharacter:](v19, v5, 0, 0, *(double *)(a1 + 56), *(double *)(a1 + 64)), v5, v6 != 0x7FFFFFFFFFFFFFFFLL)? (v7 = v6 <= v4): (v7 = 0), v7))
  {
    if (!v3
      || !v4
      || (NonWhitespace = -[PKTextInputElementContent indexOfLastNonWhitespaceCharacter]((uint64_t)v19),
          NonWhitespace == 0x7FFFFFFFFFFFFFFFLL)
      || NonWhitespace >= v6)
    {
      if (v4 < 1)
        v10 = -[PKTextInputElementContent caretRectInCoordinateSpace:]((uint64_t)v19, *(void **)(a1 + 40));
      else
        -[PKTextInputElementContent firstRectForRange:inCoordinateSpace:](v19, v4 - 1, 1uLL, *(void **)(a1 + 40));
      v14 = v10;
      v15 = v11;
      v16 = v12;
      v17 = v13;
      if (!CGRectIsNull(*(CGRect *)&v10))
      {
        v18 = *(double *)(a1 + 64);
        v20.origin.x = v14;
        v20.origin.y = v15;
        v20.size.width = v16;
        v20.size.height = v17;
        if (v18 > CGRectGetMaxY(v20) + *(double *)(a1 + 72))
        {
          if (*(_BYTE *)(a1 + 81))
            -[PKTextInputElementContent setSelectionWithReferencePoint:completionHandler:](v19, &__block_literal_global_12, *(double *)(a1 + 56), *(double *)(a1 + 64));
        }
      }
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v8();

}

- (void)_promoteKeyWindowIfNecessary:(void *)a1
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = a1;
  v2 = objc_opt_class();
  PKDynamicCast(v2, v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_responderWindow");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isKeyWindow") & 1) == 0)
    objc_msgSend(v4, "makeKeyWindow");

}

uint64_t __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 48))
    v3 = *(_QWORD *)(a1 + 32);
  else
    v3 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    +[PKTextInputUITextInputInterface makeTextInputFirstResponder:forPencilInput:](PKTextInputUITextInputInterface, "makeTextInputFirstResponder:forPencilInput:", v3, 1);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 80);
  else
    v5 = 0;
  if (objc_msgSend(v5, "supportsIsElementFocused"))
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  else
  {
    v7 = -[PKTextInputElement frame](*(_QWORD *)(a1 + 32));
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
      v15 = *(void **)(v14 + 80);
    else
      v15 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_3;
    v16[3] = &unk_1E7778830;
    v16[4] = v14;
    v18 = *(id *)(a1 + 40);
    v17 = v3;
    objc_msgSend(v15, "requestElementsInRect:completion:", v16, v7, v9, v11, v13);

  }
}

void __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_3(_QWORD *a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = a2;
  v6 = v5;
  v13 = v5;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    if (objc_msgSend(v5, "count") <= a3)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a1[4];
      if (v9)
        v10 = *(void **)(v9 + 120);
      else
        v10 = 0;
      v7 = objc_msgSend(v10, "isEqual:", v8);

    }
    v6 = v13;
  }
  v11 = a1[4];
  if (v11)
    *(_BYTE *)(v11 + 50) = v7;
  v12 = a1[6];
  if (v12)
  {
    (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, a1[5]);
    v6 = v13;
  }

}

void __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 104));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);

}

void __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_6;
  block[3] = &unk_1E7778880;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __109__PKTextInputElement_focusElementIfNeededWithReferencePoint_alwaysSetSelectionFromReferencePoint_completion___block_invoke_6(uint64_t a1)
{
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (double)clampedReferencePoint:(uint64_t)a1
{
  double result;
  double v4;
  double v5;

  if (!a1)
    return 0.0;
  result = -[PKTextInputElement _safeHitFrame](a1);
  if (a2 >= result)
  {
    v5 = result + v4;
    result = a2;
    if (a2 > v5)
      return v5;
  }
  return result;
}

- (_NSRange)activeAffectedRange
{
  id *p_isa;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  p_isa = (id *)&self->super.isa;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (p_isa)
    v6 = objc_loadWeakRetained(p_isa + 13);
  else
    v6 = 0;
  objc_msgSend(v6, "selectedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 && v8)
  {
    if (p_isa)
      v11 = objc_loadWeakRetained(p_isa + 13);
    else
      v11 = 0;
    objc_msgSend(v11, "beginningOfDocument");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (p_isa)
        v12 = objc_loadWeakRetained(p_isa + 13);
      else
        v12 = 0;
      objc_msgSend(v12, "beginningOfDocument");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "offsetFromPosition:toPosition:", v13, v5);

      if (p_isa)
        p_isa = (id *)objc_loadWeakRetained(p_isa + 13);
      v9 = (void *)objc_msgSend(p_isa, "offsetFromPosition:toPosition:", v5, v8);

    }
    else
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  v14 = v10;
  v15 = (NSUInteger)v9;
  result.length = v15;
  result.location = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerElementIdentifier, 0);
  objc_storeStrong((id *)&self->_recognitionIdentifier, 0);
  objc_destroyWeak((id *)&self->_textInput);
  objc_destroyWeak((id *)&self->__writingSession);
  objc_storeStrong((id *)&self->__containerInteraction, 0);
  objc_storeStrong((id *)&self->__viewScribbleInteraction, 0);
  objc_destroyWeak((id *)&self->_elementTextInputView);
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
}

- (void)_beginSuppressingFieldPlaceholder
{
  PKTextInputElement *v2;
  void *v3;
  uint64_t v4;
  NSObject *containerElementIdentifier;
  int v6;
  void *v7;
  PKTextInputElement *v8;

  v2 = self;
  if (self)
  {
    if (self->__requestingPlaceholderSuppression || self->__elementType > 1uLL)
      return;
    -[PKTextInputElement _scribbleInteraction](self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self = (PKTextInputElement *)objc_loadWeakRetained((id *)&v2->_textInput);
  }
  else
  {
    v3 = 0;
  }
  v8 = self;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = -[PKTextInputElement textAlignment](v8, "textAlignment");
    else
      v4 = 4;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E777DEE8);
    -[PKTextInputElement _setOverridePlaceholder:alignment:](v8, "_setOverridePlaceholder:alignment:", v7, v4);

    if (v2)
LABEL_16:
      v2->__requestingPlaceholderSuppression = 1;
  }
  else
  {
    if (!v3)
    {

      return;
    }
    if (v2)
      containerElementIdentifier = v2->_containerElementIdentifier;
    else
      containerElementIdentifier = 0;
    v6 = objc_msgSend(v3, "beginSuppressingPlaceholderForElement:", containerElementIdentifier);

    if (v2 && v6)
      goto LABEL_16;
  }
}

- (void)_finishSuppressingFieldPlaceholderIfNeeded
{
  void *v3;
  id WeakRetained;
  NSObject *containerElementIdentifier;

  if (self)
  {
    if (self->__elementType > 1uLL)
    {
LABEL_11:
      self->__requestingPlaceholderSuppression = 0;
      return;
    }
    -[PKTextInputElement _scribbleInteraction](self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  }
  else
  {
    v3 = 0;
    WeakRetained = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "_setOverridePlaceholder:alignment:", 0, objc_msgSend(WeakRetained, "textAlignment"));
  }
  else if (v3)
  {
    if (self)
      containerElementIdentifier = self->_containerElementIdentifier;
    else
      containerElementIdentifier = 0;
    objc_msgSend(v3, "endSuppressingPlaceholderForElement:", containerElementIdentifier);
  }

  if (self)
    goto LABEL_11;
}

- (BOOL)showSelectionCommands
{
  id WeakRetained;
  void *v3;
  BOOL v4;

  if (!self)
    return 0;
  if (self->__elementType > 1uLL)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  if (!WeakRetained)
    return 0;
  v3 = WeakRetained;
  v4 = +[PKTextInputUITextInputInterface showSelectionCommandsForTextInput:](PKTextInputUITextInputInterface, "showSelectionCommandsForTextInput:", WeakRetained);

  return v4;
}

- (_NSRange)activePreviewRange
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  if (self && self->__elementType <= 1uLL && (WeakRetained = objc_loadWeakRetained((id *)&self->_textInput)) != 0)
  {
    v3 = WeakRetained;
    v4 = +[PKTextInputUITextInputInterface activePreviewRangeInTextInput:](PKTextInputUITextInputInterface, "activePreviewRangeInTextInput:", WeakRetained);
    v6 = v5;

  }
  else
  {
    v6 = 0;
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v7 = v4;
  v8 = v6;
  result.length = v8;
  result.location = v7;
  return result;
}

- (BOOL)clearActivePreview
{
  id WeakRetained;
  void *v3;
  BOOL v4;

  if (!self)
    return 0;
  if (self->__elementType > 1uLL)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  if (!WeakRetained)
    return 0;
  v3 = WeakRetained;
  v4 = +[PKTextInputUITextInputInterface clearActivePreviewInTextInput:](PKTextInputUITextInputInterface, "clearActivePreviewInTextInput:", WeakRetained);

  return v4;
}

- (id)selectionHighlightColor
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  if (self)
  {
    if (self->__elementType > 1uLL)
      goto LABEL_12;
    WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    if (WeakRetained)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(WeakRetained, "selectionHighlightColor");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(WeakRetained, "tintColor");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "colorWithAlphaComponent:", 0.2);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
        if (v3)
          return v3;
        goto LABEL_12;
      }
    }
  }
  else
  {
    WeakRetained = 0;
  }

LABEL_12:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "performSelector:", sel_selectionHighlightColor);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (CGRect)selectionClipRectInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect result;

  v4 = a3;
  -[PKTextInputElement coordinateSpace]((uint64_t)self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (self)
      WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    else
      WeakRetained = 0;
    +[PKTextInputUtilities selectionClipRectForTextInput:](PKTextInputUtilities, "selectionClipRectForTextInput:", WeakRetained);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v23.origin.x = v8;
    v23.origin.y = v10;
    v23.size.width = v12;
    v23.size.height = v14;
    if (!CGRectIsNull(v23))
    {
      -[PKTextInputElement coordinateSpace]((uint64_t)self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v15, v4, v8, v10, v12, v14);
      v10 = v16;
      v12 = v17;
      v14 = v18;

    }
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D628];
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v19 = v8;
  v20 = v10;
  v21 = v12;
  v22 = v14;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)notifyTextInputTextWillChange
{
  id WeakRetained;
  id v3;

  if (self && self->__elementType <= 1uLL)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    if (WeakRetained)
    {
      v3 = WeakRetained;
      +[PKTextInputUITextInputInterface notifyTextWillChangeInTextInput:](PKTextInputUITextInputInterface, "notifyTextWillChangeInTextInput:", WeakRetained);

    }
  }
}

- (void)notifyTextInputTextDidChange
{
  id WeakRetained;
  id v3;

  if (self && self->__elementType <= 1uLL)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    if (WeakRetained)
    {
      v3 = WeakRetained;
      +[PKTextInputUITextInputInterface notifyTextDidChangeInTextInput:](PKTextInputUITextInputInterface, "notifyTextDidChangeInTextInput:", WeakRetained);

    }
  }
}

- (void)swapWritingStateWithElement:(id)a3
{
  _BYTE *v4;
  BOOL waitingForMatchingDidFinishWriting;
  BOOL v6;

  v4 = a3;
  if (self)
  {
    waitingForMatchingDidFinishWriting = self->__waitingForMatchingDidFinishWriting;
    if (v4)
      goto LABEL_3;
  }
  else
  {
    waitingForMatchingDidFinishWriting = 0;
    if (v4)
    {
LABEL_3:
      v6 = v4[49] != 0;
      if (!self)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  v6 = 0;
  if (self)
LABEL_4:
    self->__waitingForMatchingDidFinishWriting = v6;
LABEL_5:
  if (v4)
    v4[49] = waitingForMatchingDidFinishWriting;

}

- (void)didMoveToWritingSession:(id)a3
{
  if (self)
    objc_storeWeak((id *)&self->__writingSession, a3);
}

- (void)willBeginWriting
{
  NSObject *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  int v7;
  PKTextInputElement *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    if (self->__waitingForMatchingDidFinishWriting)
    {
      v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        v7 = 138412290;
        v8 = self;
        _os_log_fault_impl(&dword_1BE213000, v3, OS_LOG_TYPE_FAULT, "Element received willBeginWriting while waiting for matching didEndWriting. %@", (uint8_t *)&v7, 0xCu);
      }

    }
    self->__waitingForMatchingDidFinishWriting = 1;
  }
  -[PKTextInputElement _beginSuppressingFieldPlaceholder](self, "_beginSuppressingFieldPlaceholder");
  -[PKTextInputElement _scribbleInteraction](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self)
  {
    objc_msgSend(v4, "willBeginWritingInElement:", self->_containerElementIdentifier);

    WeakRetained = objc_loadWeakRetained((id *)&self->__writingSession);
  }
  else
  {
    objc_msgSend(v4, "willBeginWritingInElement:", 0);

    WeakRetained = 0;
  }
  -[PKTextInputWritingSession willBeginWritingInElement:]((uint64_t)WeakRetained, self);

}

- (void)didEndWriting
{
  NSObject *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  int v7;
  PKTextInputElement *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self && self->__waitingForMatchingDidFinishWriting)
    goto LABEL_6;
  v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_fault_impl(&dword_1BE213000, v3, OS_LOG_TYPE_FAULT, "Element received didEndWriting without a matching willBeginWriting. %@", (uint8_t *)&v7, 0xCu);
  }

  if (self)
LABEL_6:
    self->__waitingForMatchingDidFinishWriting = 0;
  -[PKTextInputElement _finishSuppressingFieldPlaceholderIfNeeded](self, "_finishSuppressingFieldPlaceholderIfNeeded");
  -[PKTextInputElement _scribbleInteraction](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self)
  {
    objc_msgSend(v4, "didFinishWritingInElement:", self->_containerElementIdentifier);

    WeakRetained = objc_loadWeakRetained((id *)&self->__writingSession);
  }
  else
  {
    objc_msgSend(v4, "didFinishWritingInElement:", 0);

    WeakRetained = 0;
  }
  -[PKTextInputWritingSession didEndWritingInElement:]((uint64_t)WeakRetained, self);

}

- (void)didInsertText
{
  PKTextInputElement *v2;
  PKTextInputElement *v3;

  v2 = self;
  if (self)
    self = (PKTextInputElement *)objc_loadWeakRetained((id *)&self->__writingSession);
  v3 = self;
  -[PKTextInputWritingSession didInsertTextInElement:]((uint64_t)self, v2);

}

@end
