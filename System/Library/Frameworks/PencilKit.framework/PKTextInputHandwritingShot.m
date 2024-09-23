@implementation PKTextInputHandwritingShot

- (PKTextInputHandwritingShot)initWithCanvasController:(id)a3 elementsController:(id)a4 languageSpec:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKTextInputHandwritingShot *v12;
  PKTextInputHandwritingShot *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *inputElementsContentByRecognitionID;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKTextInputHandwritingShot;
  v12 = -[PKTextInputHandwritingShot init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_canvasController, a3);
    objc_storeStrong((id *)&v13->_elementsController, a4);
    objc_storeStrong((id *)&v13->_languageSpec, a5);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    inputElementsContentByRecognitionID = v13->__inputElementsContentByRecognitionID;
    v13->__inputElementsContentByRecognitionID = v14;

  }
  return v13;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  +[PKTextInputDebugStateIntrospector debugStateLineDescriptionForIntrospectable:](PKTextInputDebugStateIntrospector, "debugStateLineDescriptionForIntrospectable:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)PKTextInputHandwritingShot;
  -[PKTextInputHandwritingShot description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" %@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setInputDrawing:(id)a3 inputInProgressStroke:(id)a4
{
  unint64_t v6;
  PKDrawing *v7;
  PKDrawing *inputDrawing;
  PKStroke *v9;
  PKStroke *inputInProgressStroke;
  double x;
  double y;
  double height;
  double width;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double MidY;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  id *v34;
  CGFloat MidX;
  double v36;
  unint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v37 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (*(_OWORD *)&self->_inputDrawing != __PAIR128__(v6, v37))
  {
    -[PKTextInputHandwritingShot shotState](self, "shotState");
    if (!v6 || !self->_inputInProgressStroke)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      -[PKTextInputHandwritingShot set_lastDrawingUpdateTimestamp:](self, "set_lastDrawingUpdateTimestamp:");
    }
    v7 = (PKDrawing *)objc_msgSend((id)v37, "copy");
    inputDrawing = self->_inputDrawing;
    self->_inputDrawing = v7;

    v9 = (PKStroke *)objc_msgSend((id)v6, "copy");
    inputInProgressStroke = self->_inputInProgressStroke;
    self->_inputInProgressStroke = v9;

    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    if (v37 | v6)
    {
      if (v6)
        objc_msgSend((id)v6, "_bounds");
      else
        objc_msgSend((id)v37, "bounds");
      v22 = v15;
      v23 = v16;
      v24 = v17;
      v25 = v18;
      MidX = CGRectGetMidX(*(CGRect *)&v15);
      v38.origin.x = v22;
      v38.origin.y = v23;
      v38.size.width = v24;
      v38.size.height = v25;
      MidY = CGRectGetMidY(v38);
      if (v37)
      {
        objc_msgSend((id)v37, "bounds");
        x = v26;
        y = v27;
        width = v28;
        height = v29;
      }
      if (v6)
      {
        objc_msgSend((id)v6, "_bounds");
        v41.origin.x = v30;
        v41.origin.y = v31;
        v41.size.width = v32;
        v41.size.height = v33;
        v39.origin.x = x;
        v39.origin.y = y;
        v39.size.width = width;
        v39.size.height = height;
        v40 = CGRectUnion(v39, v41);
        x = v40.origin.x;
        y = v40.origin.y;
        width = v40.size.width;
        height = v40.size.height;
      }
      -[PKTextInputHandwritingShot canvasController](self, "canvasController", *(_QWORD *)&MidX);
      v34 = (id *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputCanvasController canvasCoordinateSpace](v34);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v36;
    }
    else
    {
      v19 = 0;
      v20 = *MEMORY[0x1E0C9D538];
      MidY = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
    -[PKTextInputHandwritingShot _fetchTextInputElementsIfNeededWithReferenceHitPoint:referenceSearchArea:referenceCoordSpace:](self, "_fetchTextInputElementsIfNeededWithReferenceHitPoint:referenceSearchArea:referenceCoordSpace:", v19, v20, MidY, x, y, width, height);
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
    -[PKTextInputHandwritingShot _evaluateSubmissionReadyness](self, "_evaluateSubmissionReadyness");

  }
}

- (void)_setInputElementsByRecognitionID:(id)a3
{
  NSDictionary *v5;
  NSDictionary *v6;

  v5 = (NSDictionary *)a3;
  if (self->__inputElementsByRecognitionID != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__inputElementsByRecognitionID, a3);
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
    -[PKTextInputHandwritingShot _evaluateSubmissionReadyness](self, "_evaluateSubmissionReadyness");
    v5 = v6;
  }

}

- (void)_setShotState:(int64_t)a3
{
  void *v4;

  self->_shotState = a3;
  -[PKTextInputHandwritingShot delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handwritingShotDidChangeState:", self);

  +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
}

- (void)_setDidRequestTextInputElements:(BOOL)a3
{
  if (self->__didRequestTextInputElements != a3)
  {
    self->__didRequestTextInputElements = a3;
    +[PKTextInputDebugStateIntrospector debugStateDidChange](PKTextInputDebugStateIntrospector, "debugStateDidChange");
  }
}

- (void)_fetchTextInputElementsIfNeededWithReferenceHitPoint:(CGPoint)a3 referenceSearchArea:(CGRect)a4 referenceCoordSpace:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  id v12;
  void *v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  _QWORD v24[5];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.y;
  v10 = a3.x;
  v12 = a5;
  -[PKTextInputHandwritingShot _inputElementsByRecognitionID](self, "_inputElementsByRecognitionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

  }
  else if (!-[PKTextInputHandwritingShot _didRequestTextInputElements](self, "_didRequestTextInputElements"))
  {
    -[PKTextInputHandwritingShot _setDidRequestTextInputElements:](self, "_setDidRequestTextInputElements:", 1);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v15 = v14;
    -[PKTextInputHandwritingShot elementsController](self, "elementsController");
    v16 = (double *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = v16[6];
    else
      v17 = 0.0;
    v18 = v15 - v17;

    if (v18 <= 1.0
      && ((-[PKTextInputHandwritingShot elementsController](self, "elementsController"),
           v19 = objc_claimAutoreleasedReturnValue(),
           (v20 = (void *)v19) == 0)
        ? (v21 = 0)
        : (v21 = *(void **)(v19 + 40)),
          v22 = v21,
          v20,
          v22))
    {
      -[PKTextInputHandwritingShot _setInputElementsByRecognitionID:](self, "_setInputElementsByRecognitionID:", v22);

    }
    else
    {
      -[PKTextInputHandwritingShot elementsController](self, "elementsController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __123__PKTextInputHandwritingShot__fetchTextInputElementsIfNeededWithReferenceHitPoint_referenceSearchArea_referenceCoordSpace___block_invoke;
      v24[3] = &unk_1E7778020;
      v24[4] = self;
      -[PKTextInputElementsController updateTextInputElementsWithReferenceHitPoint:referenceSearchArea:referenceCoordSpace:completion:]((uint64_t)v23, v12, v24, v10, v9, x, y, width, height);

    }
  }

}

void __123__PKTextInputHandwritingShot__fetchTextInputElementsIfNeededWithReferenceHitPoint_referenceSearchArea_referenceCoordSpace___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "elementsController");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = *(void **)(v2 + 40);
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "_setInputElementsByRecognitionID:", v5);
}

- (void)beginRecognitionWithRecognitionManager:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  int v15;
  PKTextInputHandwritingShot *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  PKTextInputHandwritingShot *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PKTextInputHandwritingShot _setShotState:](self, "_setShotState:", 3);
  -[PKTextInputHandwritingShot _setupStrokeProvider](self, "_setupStrokeProvider");
  -[PKTextInputHandwritingShot languageSpec](self, "languageSpec");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    -[PKTextInputRecognitionManager setRecognitionLocales:]((uint64_t)v5, *(void **)(v6 + 24));

  v8 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputHandwritingShot strokeProvider](self, "strokeProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134218754;
    v16 = self;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = self;
    _os_log_impl(&dword_1BE213000, v8, OS_LOG_TYPE_DEFAULT, "HWShot %p %@, will begin recognition request, strokeProvider: %@, shot: <%@>", (uint8_t *)&v15, 0x2Au);

  }
  _PKSignpostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  _PKSignpostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_make_with_pointer(v12, self);

  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "HandwritingShot", (const char *)&unk_1BE532412, (uint8_t *)&v15, 2u);
  }

  v14 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_1BE213000, v14, OS_LOG_TYPE_INFO, "BEGIN \"HandwritingShot\", (uint8_t *)&v15, 2u);
  }

  -[PKTextInputRecognitionManager beginRecognitionRequestWithDataSource:](v5, self);
}

- (void)recognitionManager:(id)a3 recognitionDidFinishWithQueryItems:(id)a4 duration:(double)a5
{
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  PKTextInputHandwritingShot *v17;
  int v18;
  PKTextInputHandwritingShot *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  PKTextInputHandwritingShot *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a4, "copy", a3);
  -[PKTextInputHandwritingShot _setResultQueryItems:](self, "_setResultQueryItems:", v8);

  -[PKTextInputHandwritingShot setRecognitionDuration:](self, "setRecognitionDuration:", a5);
  v9 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputHandwritingShot recognitionDuration](self, "recognitionDuration");
    v18 = 134218754;
    v19 = self;
    v20 = 2112;
    v21 = v10;
    v22 = 2048;
    v23 = v11;
    v24 = 2112;
    v25 = self;
    _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEFAULT, "HWShot %p %@, finished recognition request in %0.3fs. Shot: <%@>", (uint8_t *)&v18, 0x2Au);

  }
  _PKSignpostLog();
  v12 = objc_claimAutoreleasedReturnValue();
  _PKSignpostLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_make_with_pointer(v13, self);

  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE213000, v12, OS_SIGNPOST_INTERVAL_END, v14, "HandwritingShot", (const char *)&unk_1BE532412, (uint8_t *)&v18, 2u);
  }

  v15 = os_log_create("com.apple.pencilkit", ");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1BE213000, v15, OS_LOG_TYPE_INFO, "END \"HandwritingShot\", (uint8_t *)&v18, 2u);
  }

  -[PKTextInputHandwritingShot _setShotState:](self, "_setShotState:", 4);
  v16 = os_log_create("com.apple.pencilkit", "Latency");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    -[PKTextInputHandwritingShot recognitionDuration](self, "recognitionDuration");
    v18 = 134217984;
    v19 = v17;
    _os_log_impl(&dword_1BE213000, v16, OS_LOG_TYPE_DEFAULT, "Last recognition duration: %g", (uint8_t *)&v18, 0xCu);
  }

}

- (void)_evaluateSubmissionReadyness
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if ((unint64_t)(-[PKTextInputHandwritingShot shotState](self, "shotState") - 2) >= 3)
  {
    -[PKTextInputHandwritingShot _inputElementsByRecognitionID](self, "_inputElementsByRecognitionID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PKTextInputHandwritingShot inputDrawing](self, "inputDrawing");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {

      }
      else
      {
        -[PKTextInputHandwritingShot inputInProgressStroke](self, "inputInProgressStroke");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v5)
          return;
      }
      if (!-[PKTextInputHandwritingShot shotState](self, "shotState"))
        -[PKTextInputHandwritingShot _setShotState:](self, "_setShotState:", 1);
      +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "continuousRecognition");

      v8 = 0.0;
      if ((v7 & 1) == 0)
      {
        +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "recognitionCoalescingDelay");
        v8 = v10;

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v12 = v11;
      -[PKTextInputHandwritingShot _lastDrawingUpdateTimestamp](self, "_lastDrawingUpdateTimestamp");
      v14 = v12 - v13;
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__evaluateSubmissionReadyness, 0);
      if (v14 >= v8)
        -[PKTextInputHandwritingShot _setShotState:](self, "_setShotState:", 2);
      else
        -[PKTextInputHandwritingShot performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__evaluateSubmissionReadyness, 0, v8 - v14);
    }
  }
}

- (id)textInputElementForRecognitionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[PKTextInputHandwritingShot _inputElementsByRecognitionID](self, "_inputElementsByRecognitionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[PKTextInputHandwritingShot elementsController](self, "elementsController");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = *(void **)(v7 + 40);
    else
      v9 = 0;
    v10 = v9;
    objc_msgSend(v10, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)textInputElementContentForRecognitionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKTextInputHandwritingShot _inputElementsContentByRecognitionID](self, "_inputElementsContentByRecognitionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isPotentiallyTargetingElement:(id)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[PKTextInputHandwritingShot _potentiallyTargetedElementRecognitionIDs](self, "_potentiallyTargetedElementRecognitionIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
      v6 = (void *)v4[14];
    else
      v6 = 0;
    v7 = v6;

    if (v7)
    {
      -[PKTextInputHandwritingShot _potentiallyTargetedElementRecognitionIDs](self, "_potentiallyTargetedElementRecognitionIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        v9 = (void *)v4[14];
      else
        v9 = 0;
      v10 = v9;
      LOBYTE(v7) = objc_msgSend(v8, "containsIndex:", objc_msgSend(v10, "unsignedIntegerValue"));

    }
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return (char)v7;
}

- (id)_closestInputElementForStrokeIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v17[13];
  _QWORD v18[4];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  -[PKTextInputHandwritingShot _inputElementsByRecognitionID](self, "_inputElementsByRecognitionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputHandwritingShot strokeProvider](self, "strokeProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centroidForSlicesWithIdentifiers:", v4);
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "boundsForSliceIdentifiers:", v4);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__7;
  v23 = __Block_byref_object_dispose__7;
  v24 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0x7FEFFFFFFFFFFFFFLL;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__PKTextInputHandwritingShot__closestInputElementForStrokeIdentifiers___block_invoke;
  v17[3] = &unk_1E7779058;
  v17[7] = v8;
  v17[8] = v10;
  v17[9] = v11;
  v17[10] = v12;
  v17[11] = v13;
  v17[12] = v14;
  v17[4] = self;
  v17[5] = &v19;
  v17[6] = v18;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v17);
  v15 = (id)v20[5];
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v19, 8);

  return v15;
}

void __71__PKTextInputHandwritingShot__closestInputElementForStrokeIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  double v34;
  uint64_t v35;
  id *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  CGRect v43;
  CGRect v44;

  v42 = a3;
  -[PKTextInputElement coordinateSpace]((uint64_t)v42);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "canvasController");
    v6 = (id *)objc_claimAutoreleasedReturnValue();
    v7 = -[PKTextInputElement frame]((uint64_t)v42);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[PKTextInputElement coordinateSpace]((uint64_t)v42);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PKTextInputCanvasController convertRect:toCanvasFromCoordinateSpace:](v6, v14, v7, v9, v11, v13);
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v43.origin.x = v15;
    v43.origin.y = v17;
    v43.size.width = v19;
    v43.size.height = v21;
    v22 = 0.0;
    if (!CGRectContainsPoint(v43, *(CGPoint *)(a1 + 56)))
    {
      v23 = -[PKTextInputElement hitToleranceFrameFromElementFrame:](v42, v15, v17, v19, v21);
      v25 = v24;
      v27 = v26;
      v29 = v28;
      if ((-[PKTextInputElement isFocused]((uint64_t)v42) & 1) != 0
        || (v44.origin.x = v23,
            v44.origin.y = v25,
            v44.size.width = v27,
            v44.size.height = v29,
            CGRectIntersectsRect(v44, *(CGRect *)(a1 + 72))))
      {
        v30 = *(double *)(a1 + 56);
        v31 = *(double *)(a1 + 64);
        if (v30 >= v15)
        {
          v32 = v15 + v19;
          v33 = v30 <= v15 + v19;
          v15 = *(double *)(a1 + 56);
          if (!v33)
            v15 = v32;
        }
        if (v31 >= v17)
        {
          v34 = v17 + v21;
          v33 = v31 <= v17 + v21;
          v17 = *(double *)(a1 + 64);
          if (!v33)
            v17 = v34;
        }
        v22 = (v31 - v17) * (v31 - v17) + (v30 - v15) * (v30 - v15);
      }
      else
      {
        v22 = 1.79769313e308;
      }
    }
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v38 = *(void **)(v35 + 40);
    v36 = (id *)(v35 + 40);
    v37 = v38;
    if (v38
      && (v39 = a1 + 48, vabdd_f64(v22, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)) < 0.00999999978))
    {
      if (-[PKTextInputElement isInFrontOfElement:]((uint64_t)v42, v37))
      {
        v36 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
LABEL_20:
        objc_storeStrong(v36, a3);
        *(double *)(*(_QWORD *)(*(_QWORD *)v39 + 8) + 24) = v22;
      }
    }
    else if (v22 != 1.79769313e308)
    {
      v41 = *(_QWORD *)(a1 + 48);
      v40 = a1 + 48;
      if (v22 <= *(double *)(*(_QWORD *)(v41 + 8) + 24))
      {
        v39 = v40;
        goto LABEL_20;
      }
    }
  }

}

- (void)_loadAndSaveContentFocusingIfNeededForElement:(id)a3 referenceCanvasPoint:(CGPoint)a4 strokesBounds:(CGRect)a5 completion:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  _QWORD *v14;
  void (**v15)(id, void *);
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  int v39;
  id *v40;
  char v41;
  _QWORD v42[5];
  _QWORD *v43;
  void (**v44)(id, void *);
  double v45;
  double v46;
  double v47;
  double v48;
  char v49;
  char v50;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4.y;
  v12 = a4.x;
  v14 = a3;
  v15 = (void (**)(id, void *))a6;
  -[PKTextInputHandwritingShot _inputElementsContentByRecognitionID](self, "_inputElementsContentByRecognitionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v17 = (void *)v14[14];
  else
    v17 = 0;
  v18 = v17;
  objc_msgSend(v16, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v15[2](v15, v19);
  }
  else
  {
    -[PKTextInputElement coordinateSpace]((uint64_t)v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[PKTextInputHandwritingShot delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handwritingShot:willFocusAndLoadDataForTargetElement:", self, v14);

      -[PKTextInputHandwritingShot canvasController](self, "canvasController");
      v22 = (id *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputCanvasController canvasCoordinateSpace](v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputElement coordinateSpace]((uint64_t)v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v23, v24, v12, v11, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

      v26 = -[PKTextInputElement clampedReferencePoint:]((uint64_t)v14, v25);
      v28 = v27;
      -[PKTextInputHandwritingShot canvasController](self, "canvasController");
      v29 = (id *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputCanvasController canvasCoordinateSpace](v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputElement coordinateSpace]((uint64_t)v14);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v30, v31, x, y, width, height);
      v34 = v33;
      v36 = v35;
      v38 = v37;

      if (-[PKTextInputHandwritingShot cursorIsWeakAtStart](self, "cursorIsWeakAtStart"))
        v39 = !-[PKTextInputHandwritingShot writingIsActiveAtStart](self, "writingIsActiveAtStart");
      else
        v39 = 0;
      v41 = -[PKTextInputElement isFocused]((uint64_t)v14);
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __122__PKTextInputHandwritingShot__loadAndSaveContentFocusingIfNeededForElement_referenceCanvasPoint_strokesBounds_completion___block_invoke;
      v42[3] = &unk_1E77790A8;
      v49 = v41;
      v50 = v39;
      v42[4] = self;
      v45 = v12;
      v46 = v11;
      v43 = v14;
      v47 = v26;
      v48 = v28;
      v44 = v15;
      -[PKTextInputElement loadContentFocusingIfNeededWithReferencePoint:alwaysSetSelectionFromReferencePoint:rectOfInterest:completion:]((uint64_t)v43, v39, v42, v26, v28, v32, v34, v36, v38);

    }
    else
    {
      v40 = -[PKTextInputElementContent initWithElement:]((id *)[PKTextInputElementContent alloc], v14);
      v15[2](v15, v40);

    }
  }

}

void __122__PKTextInputHandwritingShot__loadAndSaveContentFocusingIfNeededForElement_referenceCanvasPoint_strokesBounds_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  void *v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;
  CGRect v31;
  CGRect v32;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 88))
  {
LABEL_14:
    v5 = 0;
    goto LABEL_15;
  }
  if (*(_BYTE *)(a1 + 89))
  {
LABEL_3:
    v5 = 1;
    goto LABEL_15;
  }
  v6 = -[PKTextInputElementContent selectedRange]((uint64_t)v3);
  v8 = v7;
  v5 = 0;
  if (!objc_msgSend(*(id *)(a1 + 32), "writingIsActiveAtStart") && !v8 && v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "cursorIsForcedStrongAtStart") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "canvasController");
      v9 = (id *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputCanvasController canvasCoordinateSpace](v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PKTextInputElementContent caretRectInCoordinateSpace:]((uint64_t)v4, v10);
      v13 = v12;
      v15 = v14;
      v17 = v16;

      v31.origin.x = v11;
      v31.origin.y = v13;
      v31.size.width = v15;
      v31.size.height = v17;
      if (!CGRectIsNull(v31))
      {
        v32.origin.x = v11;
        v32.origin.y = v13;
        v32.size.width = v15;
        v32.size.height = v17;
        v18 = CGRectGetMidY(v32) - *(double *)(a1 + 64);
        v19 = v18 >= 0.0 ? v18 : -v18;
        +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "strongCursorMaximumYDistance");
        v22 = v21;

        if (v19 > v22)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handwritingShotDidOverrideStrongCursor:", *(_QWORD *)(a1 + 32));

          goto LABEL_3;
        }
      }
    }
    goto LABEL_14;
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "_inputElementsContentByRecognitionID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *(_QWORD **)(a1 + 40);
  if (v25)
    v25 = (_QWORD *)v25[14];
  v26 = v25;
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v4, v26);

  if (v5)
  {
    objc_initWeak(&location, v4);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __122__PKTextInputHandwritingShot__loadAndSaveContentFocusingIfNeededForElement_referenceCanvasPoint_strokesBounds_completion___block_invoke_2;
    v27[3] = &unk_1E7779080;
    v28 = *(id *)(a1 + 48);
    objc_copyWeak(&v29, &location);
    -[PKTextInputElementContent setSelectionWithReferencePoint:completionHandler:]((id *)v4, v27, *(double *)(a1 + 72), *(double *)(a1 + 80));
    objc_destroyWeak(&v29);

    objc_destroyWeak(&location);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __122__PKTextInputHandwritingShot__loadAndSaveContentFocusingIfNeededForElement_referenceCanvasPoint_strokesBounds_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);

}

- (void)_setupStrokeProvider
{
  void *v3;
  void *v4;
  void *v5;
  PKDrawing *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  PKTextInputStrokeProvider *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PKTextInputHandwritingShot inputDrawing](self, "inputDrawing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputHandwritingShot inputInProgressStroke](self, "inputInProgressStroke");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputHandwritingShot delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handwritingShotStrokeIdentifiersToExcludeFromRecognition:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(PKDrawing);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = v3;
  objc_msgSend(v3, "strokes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "_strokeUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v5, "containsObject:", v13);

        if ((v14 & 1) == 0)
          -[PKDrawing addNewStroke:](v6, "addNewStroke:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  if (v16)
    -[PKDrawing addNewStroke:](v6, "addNewStroke:", v16);
  v15 = -[PKTextInputStrokeProvider initWithDrawing:]([PKTextInputStrokeProvider alloc], "initWithDrawing:", v6);
  -[PKTextInputHandwritingShot setStrokeProvider:](self, "setStrokeProvider:", v15);

}

- (NSArray)textInputTargets
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  PKTextInputHandwritingShot *v12;
  id v13;

  -[PKTextInputHandwritingShot _submittedTextInputTargets](self, "_submittedTextInputTargets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputHandwritingShot _inputElementsByRecognitionID](self, "_inputElementsByRecognitionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __46__PKTextInputHandwritingShot_textInputTargets__block_invoke;
    v11 = &unk_1E7777490;
    v12 = self;
    v13 = v4;
    v6 = v4;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v8);
    -[PKTextInputHandwritingShot set_submittedTextInputTargets:](self, "set_submittedTextInputTargets:", v6, v8, v9, v10, v11, v12);

  }
  return -[PKTextInputHandwritingShot _submittedTextInputTargets](self, "_submittedTextInputTargets");
}

void __46__PKTextInputHandwritingShot_textInputTargets__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id *v7;
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
  double v18;
  void *v19;
  id v20;

  v20 = a2;
  v5 = a3;
  -[PKTextInputElement coordinateSpace]((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "canvasController");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    v8 = -[PKTextInputElement frame]((uint64_t)v5);
    v12 = -[PKTextInputCanvasController convertRect:toCanvasFromCoordinateSpace:](v7, v6, v8, v9, v10, v11);
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16880]), "initWithIdentifier:frame:", v20, v12, v14, v16, v18);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v19);

  }
}

- (id)recognitionManager:(id)a3 textInputTargetForItemStableIdentifier:(id)a4 strokeIdentifiers:(id)a5 simultaneousItemStableIdentifiers:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v10, "count"))
  {
    v12 = v10;
    -[PKTextInputHandwritingShot _inputElementsByRecognitionID](self, "_inputElementsByRecognitionID");
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v53;
LABEL_4:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v53 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v17);
        if ((-[PKTextInputElement isFocused]((uint64_t)v18) & 1) != 0)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
          if (v15)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v19 = v18;

      if (v19)
      {
        objc_msgSend(v12, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[PKTextInputHandwritingShot _shouldTargetFirstResponderElement:strokeIdentifiers:](self, "_shouldTargetFirstResponderElement:strokeIdentifiers:", v19, v20);

        if (v21)
        {
          v19 = v19;
          v22 = (id *)v19;
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_10:

      v19 = 0;
    }
    objc_msgSend(v12, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputHandwritingShot _closestInputElementForStrokeIdentifiers:](self, "_closestInputElementForStrokeIdentifiers:", v23);
    v22 = (id *)objc_claimAutoreleasedReturnValue();

LABEL_15:
    -[PKTextInputHandwritingShot delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[PKTextInputHandwritingShot delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handwritingShot:preferredTargetElementForQueryItemStableIdentifier:simultaneousItemStableIdentifiers:proposedTargetElement:", self, v9, v11, v22);
      v26 = objc_claimAutoreleasedReturnValue();

      v22 = (id *)v26;
    }
    if (v22)
    {
      -[PKTextInputElement coordinateSpace]((uint64_t)v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        -[PKTextInputHandwritingShot canvasController](self, "canvasController");
        v28 = (id *)objc_claimAutoreleasedReturnValue();
        v29 = -[PKTextInputElement frame]((uint64_t)v22);
        v31 = v30;
        v33 = v32;
        v35 = v34;
        -[PKTextInputElement coordinateSpace]((uint64_t)v22);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = -[PKTextInputCanvasController convertRect:toCanvasFromCoordinateSpace:](v28, v36, v29, v31, v33, v35);
        v39 = v38;
        v41 = v40;
        v43 = v42;

        v44 = objc_alloc(MEMORY[0x1E0D16880]);
        v45 = v22[14];
        v27 = (void *)objc_msgSend(v44, "initWithIdentifier:frame:", v45, v37, v39, v41, v43);

        -[PKTextInputHandwritingShot _potentiallyTargetedElementRecognitionIDs](self, "_potentiallyTargetedElementRecognitionIDs");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v46)
        {
          v47 = objc_alloc_init(MEMORY[0x1E0CB3788]);
          -[PKTextInputHandwritingShot set_potentiallyTargetedElementRecognitionIDs:](self, "set_potentiallyTargetedElementRecognitionIDs:", v47);

        }
        -[PKTextInputHandwritingShot _potentiallyTargetedElementRecognitionIDs](self, "_potentiallyTargetedElementRecognitionIDs");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v22[14];
        objc_msgSend(v48, "addIndex:", objc_msgSend(v49, "unsignedIntegerValue"));

      }
    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BOOL)_shouldTargetFirstResponderElement:(id)a3 strokeIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  _QWORD v20[4];
  id v21;
  PKTextInputHandwritingShot *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v6 = a3;
  v7 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  -[PKTextInputHandwritingShot strokeProvider](self, "strokeProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "boundsForSliceIdentifiers:", v7);
  if (*((_BYTE *)v29 + 24))
    goto LABEL_3;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  -[PKTextInputHandwritingShot _inputElementsByRecognitionID](self, "_inputElementsByRecognitionID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __83__PKTextInputHandwritingShot__shouldTargetFirstResponderElement_strokeIdentifiers___block_invoke;
  v20[3] = &unk_1E77790D0;
  v22 = self;
  v23 = &v28;
  v21 = v6;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = v16;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v20);

  if (*((_BYTE *)v29 + 24))
  {
LABEL_3:
    if (-[PKTextInputHandwritingShot cursorIsWeakAtStart](self, "cursorIsWeakAtStart"))
    {
      v18 = 0;
      *((_BYTE *)v29 + 24) = 0;
    }
    else
    {
      v18 = *((_BYTE *)v29 + 24) != 0;
    }
  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v28, 8);
  return v18;
}

void __83__PKTextInputHandwritingShot__shouldTargetFirstResponderElement_strokeIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  id *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  BOOL IsNull;
  id v31;
  CGRect v32;
  CGRect v33;

  v31 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = a2;
  if (v7)
    v9 = *(void **)(v7 + 112);
  else
    v9 = 0;
  v10 = v9;
  v11 = objc_msgSend(v8, "isEqualToNumber:", v10);

  if (v11)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v12 = v31;
  }
  else
  {
    -[PKTextInputElement coordinateSpace]((uint64_t)v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v31;
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "canvasController");
      v14 = (id *)objc_claimAutoreleasedReturnValue();
      v15 = -[PKTextInputElement frame]((uint64_t)v31);
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[PKTextInputElement coordinateSpace]((uint64_t)v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[PKTextInputCanvasController convertRect:toCanvasFromCoordinateSpace:](v14, v22, v15, v17, v19, v21);
      v25 = v24;
      v27 = v26;
      v29 = v28;

      v32.origin.x = v23;
      v32.origin.y = v25;
      v32.size.width = v27;
      v32.size.height = v29;
      v33 = CGRectIntersection(v32, *(CGRect *)(a1 + 56));
      IsNull = CGRectIsNull(v33);
      v12 = v31;
      if (!IsNull)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        *a4 = 1;
      }
    }
  }

}

- (void)recognitionManager:(id)a3 fetchContentInfoForTextInputTarget:(id)a4 strokeIdentifiers:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSObject *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  void (**v39)(id, void *);
  uint8_t buf[4];
  PKTextInputHandwritingShot *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  PKTextInputHandwritingShot *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *))a6;
  -[PKTextInputHandwritingShot _submittedTargetContentInfoByTargetID](self, "_submittedTargetContentInfoByTargetID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputTargetIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v12[2](v12, v15);
  }
  else
  {
    objc_msgSend(v10, "inputTargetIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputHandwritingShot textInputElementForRecognitionIdentifier:](self, "textInputElementForRecognitionIdentifier:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17
      && (-[PKTextInputElement coordinateSpace]((uint64_t)v17),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v18,
          v18))
    {
      objc_msgSend(v11, "allObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputHandwritingShot strokeProvider](self, "strokeProvider");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startingPointForSlicesWithIdentifiers:", v19);
      v22 = v21;
      v24 = v23;

      -[PKTextInputHandwritingShot strokeProvider](self, "strokeProvider");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "boundsForSliceIdentifiers:", v19);
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;

      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __113__PKTextInputHandwritingShot_recognitionManager_fetchContentInfoForTextInputTarget_strokeIdentifiers_completion___block_invoke;
      v36[3] = &unk_1E77790F8;
      v36[4] = self;
      v37 = v10;
      v38 = v11;
      v39 = v12;
      -[PKTextInputHandwritingShot _loadAndSaveContentFocusingIfNeededForElement:referenceCanvasPoint:strokesBounds:completion:](self, "_loadAndSaveContentFocusingIfNeededForElement:referenceCanvasPoint:strokesBounds:completion:", v17, v36, v22, v24, v27, v29, v31, v33);

    }
    else
    {
      v34 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v41 = self;
        v42 = 2112;
        v43 = v35;
        v44 = 2112;
        v45 = v10;
        v46 = 2112;
        v47 = self;
        _os_log_error_impl(&dword_1BE213000, v34, OS_LOG_TYPE_ERROR, "HWShot %p %@, no element found for text input target %@. Returning nil content info. Shot: %@", buf, 0x2Au);

      }
      v12[2](v12, 0);
    }

  }
}

void __113__PKTextInputHandwritingShot_recognitionManager_fetchContentInfoForTextInputTarget_strokeIdentifiers_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_contentInfoFromElementContent:textInputTarget:strokeIdentifiers:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_saveSubmittedTargetContentInfo:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)submittedTargetContentInfoForRecognitionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PKTextInputHandwritingShot _submittedTargetContentInfoByTargetID](self, "_submittedTargetContentInfoByTargetID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_saveSubmittedTargetContentInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[PKTextInputHandwritingShot _submittedTargetContentInfoByTargetID](self, "_submittedTargetContentInfoByTargetID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "mutableCopy");

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "textInputTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputTargetIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, v7);

  -[PKTextInputHandwritingShot set_submittedTargetContentInfoByTargetID:](self, "set_submittedTargetContentInfoByTargetID:", v8);
}

- (_NSRange)_selectedTextRangeForElementContent:(id)a3 textInputTarget:(id)a4 strokeSliceIdentifiers:(id)a5
{
  id *v9;
  id v10;
  id v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  void *v15;
  void *v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  id v20;
  id v21;
  char v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  NSUInteger v33;
  NSUInteger v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  int v40;
  PKTextInputHandwritingShot *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  id v49;
  __int16 v50;
  PKTextInputHandwritingShot *v51;
  uint64_t v52;
  NSRange v53;
  _NSRange result;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = (id *)a3;
  v10 = a5;
  v11 = a4;
  v12 = -[PKTextInputElementContent selectedRange]((uint64_t)v9);
  v14 = v13;
  -[PKTextInputHandwritingShot delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inputTargetIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v15, "handwritingShot:inProgressGestureInitialSelectedRangeForElementRecognitionIdentifier:", self, v16);
  v19 = v18;

  if (v17 == 0x7FFFFFFFFFFFFFFFLL || v17 + v19 > -[PKTextInputElementContent contentLength]((uint64_t)v9))
  {
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v9)
        v20 = v9[1];
      else
        v20 = 0;
      v21 = v20;
      v22 = -[PKTextInputElement isFocused]((uint64_t)v21);

      if ((v22 & 1) != 0)
        goto LABEL_14;
      -[PKTextInputHandwritingShot strokeProvider](self, "strokeProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "centroidForSlicesWithIdentifiers:", v10);
      v25 = v24;
      v27 = v26;

      -[PKTextInputHandwritingShot canvasController](self, "canvasController");
      v28 = (id *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputCanvasController canvasCoordinateSpace](v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v9)
      {
        v17 = -[PKTextInputElementContent characterIndexClosestToPoint:inCoordinateSpace:forInsertingText:adjustForLastCharacter:](v9, v29, 1, 1, v25, v27);

        v19 = 0;
        v31 = 0x7FFFFFFFFFFFFFFFLL;
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_16;
      }
      else
      {

        v17 = 0;
        v19 = 0;
      }
    }
    else
    {
      v17 = v12;
      v19 = v14;
    }
  }
  if (v19 + v17 <= -[PKTextInputElementContent contentLength]((uint64_t)v9))
  {
    v31 = v17;
    goto LABEL_16;
  }
  v32 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v53.location = v17;
    v53.length = v19;
    NSStringFromRange(v53);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[PKTextInputElementContent contentLength]((uint64_t)v9);
    if (v9)
      v38 = v9[1];
    else
      v38 = 0;
    v39 = v38;
    v40 = 134219266;
    v41 = self;
    v42 = 2112;
    v43 = v35;
    v44 = 2112;
    v45 = v36;
    v46 = 2048;
    v47 = v37;
    v48 = 2112;
    v49 = v39;
    v50 = 2112;
    v51 = self;
    _os_log_error_impl(&dword_1BE213000, v32, OS_LOG_TYPE_ERROR, "HWShot %p %@, Invalid selected range %@ for content length %ld. Reverting to undefined. Element: %@. Shot: %@.", (uint8_t *)&v40, 0x3Eu);

  }
LABEL_14:
  v19 = 0;
  v31 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_16:

  v33 = v31;
  v34 = v19;
  result.length = v34;
  result.location = v33;
  return result;
}

- (id)_contentInfoFromElementContent:(id)a3 textInputTarget:(id)a4 strokeIdentifiers:(id)a5
{
  id *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id WeakRetained;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  size_t v53;
  size_t v54;
  __CFString *v55;
  void *v56;
  void *v57;
  id *v58;
  void *v59;
  __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  SEL v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD v73[5];
  id v74;
  id *v75;
  void *v76;
  _QWORD *v77;
  uint64_t v78;
  size_t v79;
  SEL v80;
  void *v81;
  _QWORD v82[5];

  v9 = (id *)a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x1E0D16818]);
  objc_msgSend(v12, "setTextInputTarget:", v10);
  objc_msgSend(v12, "setTextContentLength:", -[PKTextInputElementContent contentLength]((uint64_t)v9));
  objc_msgSend(v12, "setActivePreviewRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  objc_msgSend(v12, "setContentType:", -[PKTextInputHandwritingShot _contentTypeForElementContent:](self, "_contentTypeForElementContent:", v9));
  -[PKTextInputHandwritingShot delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputTargetIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLastCharacterLevelPosition:", objc_msgSend(v13, "handwritingShot:lastCharacterLevelPositionForElementRecognitionIdentifier:", self, v14));

  v15 = -[PKTextInputElementContent isSingleLineDocumentContent]((uint64_t)v9);
  objc_msgSend(v12, "setIsSingleLine:", v15);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((v15 & 1) != 0)
      v16 = 0;
    else
      v16 = -[PKTextInputElementContent supportsAutoLineBreaks]((uint64_t)v9);
    objc_msgSend(v12, "setSupportsAutoLineBreaks:", v16);
  }
  objc_msgSend(v12, "setIsCursorStrong:", -[PKTextInputHandwritingShot cursorIsWeakAtStart](self, "cursorIsWeakAtStart") ^ 1);
  if (v9)
  {
    v17 = v9[2];
    objc_msgSend(v12, "setAutoCapitalizationMode:", -[PKTextInputHandwritingShot _autoCapitalizationModeForTextInputTraits:](self, "_autoCapitalizationModeForTextInputTraits:", v17));

    v18 = v9[2];
  }
  else
  {
    objc_msgSend(v12, "setAutoCapitalizationMode:", -[PKTextInputHandwritingShot _autoCapitalizationModeForTextInputTraits:](self, "_autoCapitalizationModeForTextInputTraits:", 0));
    v18 = 0;
  }
  v19 = v18;
  objc_msgSend(v12, "setAutoCorrectionMode:", -[PKTextInputHandwritingShot _autoCorrectionModeForTextInputTraits:](self, "_autoCorrectionModeForTextInputTraits:", v19));

  objc_msgSend(v11, "allObjects");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = -[PKTextInputHandwritingShot _selectedTextRangeForElementContent:textInputTarget:strokeSliceIdentifiers:](self, "_selectedTextRangeForElementContent:textInputTarget:strokeSliceIdentifiers:", v9, v10, v20);
  objc_msgSend(v12, "setSelectedTextRange:", v21, v22);
  objc_msgSend(v10, "inputTargetIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputHandwritingShot textInputElementForRecognitionIdentifier:](self, "textInputElementForRecognitionIdentifier:", v23);
  v24 = objc_claimAutoreleasedReturnValue();

  v72 = v11;
  v66 = a2;
  v68 = (void *)v24;
  if (v24)
    WeakRetained = objc_loadWeakRetained((id *)(v24 + 104));
  else
    WeakRetained = 0;
  v26 = (void *)MEMORY[0x1E0DC1290];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "languageIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v26, "defaultWritingDirectionForLanguage:", v28);

  if (v9)
    v30 = v9[1];
  else
    v30 = 0;
  v31 = v30;
  v32 = objc_msgSend(v31, "activeAffectedRange");

  v71 = (void *)v20;
  v67 = WeakRetained;
  if (v32 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9)
      v33 = v9[9];
    else
      v33 = 0;
    v34 = v33;
    objc_msgSend(v34, "contextBefore");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_msgSend(v35, "length");
    if (v36)
      v29 = objc_msgSend(v35, "_isNaturallyRTL");
    objc_msgSend(v12, "setBaseWritingDirection:", -[PKTextInputHandwritingShot chWritingDirectionFrom:useDefault:](self, "chWritingDirectionFrom:useDefault:", v29, v36 == 0));
  }
  else
  {
    objc_msgSend(WeakRetained, "beginningOfDocument");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "positionFromPosition:offset:", v37, v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "tokenizer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "rangeEnclosingPosition:withGranularity:inDirection:", v35, 4, v29);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "textInRange:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "length");
    if (v41)
      v29 = objc_msgSend(v40, "_isNaturallyRTL");
    objc_msgSend(v12, "setBaseWritingDirection:", -[PKTextInputHandwritingShot chWritingDirectionFrom:useDefault:](self, "chWritingDirectionFrom:useDefault:", v29, v41 == 0));

    v20 = (uint64_t)v71;
  }

  -[PKTextInputHandwritingShot strokeProvider](self, "strokeProvider");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v43 = objc_msgSend(v42, "slicesWithIdentifiers:significantlyOverlapRect:", v20);

  objc_msgSend(v12, "setStrokeCoveredTextRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  if (v43)
  {
    v44 = -[PKTextInputHandwritingShot _correctableTextRangeIntersectingStrokesWithIdentifiers:inInputTarget:elementContent:](self, "_correctableTextRangeIntersectingStrokesWithIdentifiers:inInputTarget:elementContent:", v72, v10, v9);
    objc_msgSend(v12, "setStrokeCoveredTextRange:", v44, v45);
  }
  v69 = v10;
  v46 = objc_msgSend(v12, "strokeCoveredTextRange");
  v48 = v47;
  v49 = objc_msgSend(v12, "textContentLength");
  v50 = objc_msgSend(v12, "selectedTextRange");
  v52 = -[PKTextInputHandwritingShot _substringReferenceRangeForStrokeCoveredRange:contentLength:selectedRange:](self, "_substringReferenceRangeForStrokeCoveredRange:contentLength:selectedRange:", v46, v48, v49, v50, v51);
  v54 = v53;
  -[PKTextInputHandwritingShot _textContentSubstringInRange:forElementContent:](self, "_textContentSubstringInRange:forElementContent:", v52, v53, v9);
  v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v54 == -[__CFString length](v55, "length"))
  {
    v56 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v57 = malloc_type_calloc(v54, 0x20uLL, 0x1000040E0EAB150uLL);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), 65532);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v52 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v82[0] = 0;
    v82[1] = v82;
    v82[2] = 0x2020000000;
    v82[3] = 0;
    -[PKTextInputHandwritingShot canvasController](self, "canvasController");
    v58 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputCanvasController canvasCoordinateSpace](v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __95__PKTextInputHandwritingShot__contentInfoFromElementContent_textInputTarget_strokeIdentifiers___block_invoke;
    v73[3] = &unk_1E7779120;
    v78 = v52;
    v79 = v54;
    v77 = v82;
    v73[4] = self;
    v80 = v66;
    v81 = v57;
    v74 = v56;
    v75 = v9;
    v76 = v70;
    -[PKTextInputElementContent enumerateBoundsForCharactersInRange:inCoordinateSpace:reverse:block:]((uint64_t)v75, v52, v54, v59, 0, v73);

    _Block_object_dispose(v82, 8);
  }
  if (v56)
  {
    v60 = v56;

  }
  else if (v55)
  {
    v60 = v55;
  }
  else
  {
    v60 = &stru_1E777DEE8;
  }
  objc_msgSend(v12, "setReferenceSubstring:range:characterRects:", v60, v52, v54, v57);
  free(v57);
  -[PKTextInputHandwritingShot _protectedCharacterIndexesInRange:forElementContent:](self, "_protectedCharacterIndexesInRange:forElementContent:", v52, v54, v9);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProtectedCharacterIndexes:", v61);

  -[PKTextInputHandwritingShot delegate](self, "delegate");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "inputTargetIdentifier");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setContainsCommittedStrokes:", objc_msgSend(v62, "handwritingShot:hasCommittedResultsInSessionToElementRecognitionIdentifier:", self, v63));

  v64 = (void *)objc_msgSend(v12, "copy");
  return v64;
}

void __95__PKTextInputHandwritingShot__contentInfoFromElementContent_textInputTarget_strokeIdentifiers___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, double a4, double a5, double a6, double a7)
{
  unint64_t v8;
  double *v9;
  id v10;
  id v11;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v8 >= *(_QWORD *)(a1 + 80))
  {
    v13 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 88));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      NSStringFromRange(*(NSRange *)(a1 + 72));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      v19 = 134219010;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      v23 = 2048;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      _os_log_error_impl(&dword_1BE213000, v13, OS_LOG_TYPE_ERROR, "HWShot %p %@, character offset %ld beyond range %@ when enumerating char bounds. Shot: %@", (uint8_t *)&v19, 0x34u);

    }
    *a3 = 1;
  }
  else
  {
    v9 = (double *)(*(_QWORD *)(a1 + 96) + 32 * v8);
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_textContentSubstringInRange:forElementContent:", a2, 1, *(_QWORD *)(a1 + 48));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (objc_msgSend(v10, "length") != 1)
      {
        v11 = *(id *)(a1 + 56);

      }
      objc_msgSend(*(id *)(a1 + 40), "appendString:", v11);

    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  }
}

- (int)chWritingDirectionFrom:(int64_t)a3 useDefault:(BOOL)a4
{
  int v4;
  int v5;
  int v6;

  v4 = 254;
  v5 = 255;
  if (!a4)
    v5 = 1;
  v6 = 254;
  if (!a4)
    v6 = 0;
  if (!a3)
    v4 = v6;
  if (a3 == 1)
    return v5;
  else
    return v4;
}

- (_NSRange)_substringReferenceRangeForStrokeCoveredRange:(_NSRange)a3 contentLength:(int64_t)a4 selectedRange:(_NSRange)a5
{
  BOOL v7;
  BOOL v8;
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  NSRange v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;
  NSRange v18;

  v7 = a3.location != 0x7FFFFFFFFFFFFFFFLL && a3.length != 0;
  v8 = v7 && a3.location + a3.length <= a4;
  if (v8)
    length = a3.length;
  else
    length = 0;
  if (v7 && a3.location + a3.length <= a4)
    location = a3.location;
  else
    location = 0x7FFFFFFFFFFFFFFFLL;
  if (a5.location == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_18:
    if (location == 0x7FFFFFFFFFFFFFFFLL)
      v11 = 0;
    else
      v11 = length;
    if (location == 0x7FFFFFFFFFFFFFFFLL)
      a5.location = a4;
    else
      a5.location = location;
    goto LABEL_24;
  }
  v11 = 2000;
  if (a5.length < 0x7D0)
    v11 = a5.length;
  if (v8)
  {
    v18.location = a5.location;
    v18.length = v11;
    v12 = NSUnionRange(a3, v18);
    length = v12.length;
    location = v12.location;
    goto LABEL_18;
  }
LABEL_24:
  v13 = 60;
  if (a5.location < 0x3C)
    v13 = a5.location;
  v14 = a5.location - v13;
  v15 = v11 + v13 + 60 - ((v11 + 60 - a4 + a5.location) & ~((uint64_t)(v11 + 60 - a4 + a5.location) >> 63));
  result.length = v15;
  result.location = v14;
  return result;
}

- (int)_contentTypeForElementContent:(id)a3
{
  id *v3;
  void *v4;
  int v5;
  uint64_t v6;
  int v7;

  v3 = (id *)a3;
  -[PKTextInputElementContent textContentType](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend((id)objc_opt_class(), "_contentTypeFromTextContentType:", v4);
  }
  else
  {
    if (v3)
      v6 = objc_msgSend(v3[2], "keyboardType");
    else
      v6 = 0;
    v5 = objc_msgSend((id)objc_opt_class(), "_contentTypeFromKeyboardType:", v6);
  }
  v7 = v5;

  return v7;
}

- (int)_autoCapitalizationModeForTextInputTraits:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "autocapitalizationType");
  if (v3 > 3)
    return 3;
  else
    return dword_1BE4FC690[v3];
}

- (int)_autoCorrectionModeForTextInputTraits:(id)a3
{
  if (objc_msgSend(a3, "autocorrectionType") == 1)
    return 2;
  else
    return 1;
}

- (id)_textContentSubstringInRange:(_NSRange)a3 forElementContent:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  __CFString *v8;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  v7 = v6;
  if (location == 0x7FFFFFFFFFFFFFFFLL
    || !length
    || (-[PKTextInputElementContent stringInRange:]((uint64_t)v6, location, length),
        (v8 = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = &stru_1E777DEE8;
  }

  return v8;
}

- (id)_protectedCharacterIndexesInRange:(_NSRange)a3 forElementContent:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  void *v8;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  v7 = v6;
  if (location == 0x7FFFFFFFFFFFFFFFLL
    || !length
    || (-[PKTextInputElementContent protectedCharacterIndexesInRange:]((uint64_t)v6, location, length),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (_NSRange)_correctableTextRangeIntersectingStrokesWithIdentifiers:(id)a3 inInputTarget:(id)a4 elementContent:(id)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  id v32;
  void *v33;
  NSUInteger v34;
  NSUInteger v35;
  uint64_t v36;
  NSUInteger v37;
  NSUInteger v38;
  _NSRange result;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PKTextInputHandwritingShot delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inputTargetIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "handwritingShot:activePreviewRangeForElementRecognitionIdentifier:queryItemStableIdentifier:", self, v12, 0);
  v15 = v14;

  v16 = 0x7FFFFFFFFFFFFFFFLL;
  if ((v13 == 0x7FFFFFFFFFFFFFFFLL || !v15) && -[PKTextInputElementContent contentLength]((uint64_t)v10))
  {
    -[PKTextInputHandwritingShot strokeProvider](self, "strokeProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "boundsForSliceIdentifiers:", v18);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    -[PKTextInputHandwritingShot canvasController](self, "canvasController");
    v27 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputCanvasController canvasCoordinateSpace](v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKTextInputHandwritingShot delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "handwritingShot:shouldSuppressGesturesForStrokesBounds:coordinateSpace:", self, v28, v20, v22, v24, v26);

    if ((v30 & 1) != 0
      || (!v10 ? (v31 = 0) : (v31 = (void *)v10[1]),
          v32 = v31,
          -[PKTextInputElement coordinateSpace]((uint64_t)v32),
          v33 = (void *)objc_claimAutoreleasedReturnValue(),
          v33,
          v32,
          !v33))
    {
      v35 = 0;
      v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v16 = -[PKTextInputHandwritingShot _editingGestureCorrectableRangeForStrokeBounds:InInputTarget:elementContent:](self, "_editingGestureCorrectableRangeForStrokeBounds:InInputTarget:elementContent:", v9, v10, v20, v22, v24, v26);
      v35 = v34;
    }

  }
  else
  {
    v35 = 0;
  }
  if (v35)
    v36 = v16;
  else
    v36 = 0x7FFFFFFFFFFFFFFFLL;

  v37 = v36;
  v38 = v35;
  result.length = v38;
  result.location = v37;
  return result;
}

- (_NSRange)_editingGestureCorrectableRangeForStrokeBounds:(CGRect)a3 InInputTarget:(id)a4 elementContent:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id *v17;
  void *v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  unint64_t v39;
  uint64_t v40;
  double MaxX;
  uint64_t v42;
  uint64_t v43;
  double MaxY;
  uint64_t v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double v60;
  unint64_t v61;
  uint64_t v62;
  NSUInteger v63;
  NSUInteger v64;
  double v65;
  double v66;
  _QWORD v67[11];
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[11];
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[4];
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[9];
  _QWORD v83[9];
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  _NSRange result;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v13 = (uint64_t)v12;
  if (v12)
    v14 = (void *)v12[1];
  else
    v14 = 0;
  v15 = v14;
  -[PKTextInputElement coordinateSpace]((uint64_t)v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PKTextInputHandwritingShot canvasController](self, "canvasController");
    v17 = (id *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputCanvasController canvasCoordinateSpace](v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v18, v16, x, y, width, height);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v65 = width;
    v66 = height;
    if (v13)
      v26 = *(void **)(v13 + 8);
    else
      v26 = 0;
    v27 = v26;
    v28 = -[PKTextInputElement frame]((uint64_t)v27);
    v30 = v29;
    v32 = v31;
    v34 = v33;

    v93.origin.x = v19;
    v93.origin.y = v21;
    v93.size.width = v23;
    v93.size.height = v25;
    v99.origin.x = v28;
    v99.origin.y = v30;
    v99.size.width = v32;
    v99.size.height = v34;
    v94 = CGRectIntersection(v93, v99);
    v35 = v94.origin.x;
    v36 = v94.origin.y;
    v37 = v94.size.width;
    v38 = v94.size.height;
    v39 = -[PKTextInputElementContent contentLength](v13);
    if (v13)
      v40 = -[PKTextInputElementContent characterIndexClosestToPoint:inCoordinateSpace:forInsertingText:adjustForLastCharacter:]((id *)v13, v16, 0, 1, v35, v36);
    else
      v40 = 0;
    v95.origin.x = v35;
    v95.origin.y = v36;
    v95.size.width = v37;
    v95.size.height = v38;
    MaxX = CGRectGetMaxX(v95);
    if (v13)
      v42 = -[PKTextInputElementContent characterIndexClosestToPoint:inCoordinateSpace:forInsertingText:adjustForLastCharacter:]((id *)v13, v16, 0, 1, MaxX, v36);
    else
      v42 = 0;
    v88 = 0;
    v89 = &v88;
    v90 = 0x2020000000;
    if (v40 >= v42)
      v43 = v42;
    else
      v43 = v40;
    v91 = v43;
    v96.origin.x = v35;
    v96.origin.y = v36;
    v96.size.width = v37;
    v96.size.height = v38;
    MaxY = CGRectGetMaxY(v96);
    if (v13)
      v45 = -[PKTextInputElementContent characterIndexClosestToPoint:inCoordinateSpace:forInsertingText:adjustForLastCharacter:]((id *)v13, v16, 0, 1, v35, MaxY);
    else
      v45 = 0;
    v97.origin.x = v35;
    v97.origin.y = v36;
    v97.size.width = v37;
    v97.size.height = v38;
    v46 = CGRectGetMaxX(v97);
    v98.origin.x = v35;
    v98.origin.y = v36;
    v98.size.width = v37;
    v98.size.height = v38;
    v47 = CGRectGetMaxY(v98);
    if (v13)
      v48 = -[PKTextInputElementContent characterIndexClosestToPoint:inCoordinateSpace:forInsertingText:adjustForLastCharacter:]((id *)v13, v16, 0, 1, v46, v47);
    else
      v48 = 0;
    v49 = 0;
    v84 = 0;
    v85 = &v84;
    v86 = 0x2020000000;
    if (v45 <= v48)
      v50 = v48;
    else
      v50 = v45;
    v87 = v50;
    v51 = v89[3];
    v52 = 0x7FFFFFFFFFFFFFFFLL;
    if (v51 != 0x7FFFFFFFFFFFFFFFLL && v50 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v53 = 20;
      if (v51 > 20)
        v53 = v89[3];
      v54 = MEMORY[0x1E0C809B0];
      v83[0] = MEMORY[0x1E0C809B0];
      v83[1] = 3221225472;
      v83[2] = __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke;
      v83[3] = &unk_1E7779148;
      *(double *)&v83[5] = v35;
      *(double *)&v83[6] = v36;
      *(CGFloat *)&v83[7] = v37;
      *(CGFloat *)&v83[8] = v38;
      v83[4] = &v88;
      -[PKTextInputElementContent enumerateBoundsForCharactersInRange:inCoordinateSpace:reverse:block:](v13, v53 - 20, v51 - v53 + 21, v16, 1, v83);
      v55 = v85[3];
      if ((uint64_t)(v39 - v55) >= 20)
        v56 = 20;
      else
        v56 = v39 - v55;
      v82[0] = v54;
      v82[1] = 3221225472;
      v82[2] = __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke_2;
      v82[3] = &unk_1E7779148;
      *(double *)&v82[5] = v35;
      *(double *)&v82[6] = v36;
      *(CGFloat *)&v82[7] = v37;
      *(CGFloat *)&v82[8] = v38;
      v82[4] = &v84;
      -[PKTextInputElementContent enumerateBoundsForCharactersInRange:inCoordinateSpace:reverse:block:](v13, v55, v56, v16, 0, v82);
      v57 = v89[3];
      v58 = v85[3] - v57 + 1;
      v78 = 0;
      v79 = &v78;
      v80 = 0x2020000000;
      v81 = 0x7FFFFFFFFFFFFFFFLL;
      v77[0] = 0;
      v77[1] = v77;
      v77[2] = 0x2020000000;
      v77[3] = 0;
      v73 = 0;
      v74 = &v73;
      v75 = 0x2020000000;
      v76 = 0x7FFFFFFFFFFFFFFFLL;
      v72[0] = v54;
      v72[1] = 3221225472;
      v72[2] = __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke_3;
      v72[3] = &unk_1E7779170;
      *(double *)&v72[7] = v35;
      *(double *)&v72[8] = v36;
      *(CGFloat *)&v72[9] = v37;
      *(CGFloat *)&v72[10] = v38;
      v72[4] = v77;
      v72[5] = &v78;
      v72[6] = &v73;
      -[PKTextInputElementContent enumerateBoundsForCharactersInRange:inCoordinateSpace:reverse:block:](v13, v57, v58, v16, 0, v72);
      v68 = 0;
      v69 = &v68;
      v70 = 0x2020000000;
      v71 = 0x7FFFFFFFFFFFFFFFLL;
      v67[0] = v54;
      v67[1] = 3221225472;
      v67[2] = __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke_4;
      v67[3] = &unk_1E7779170;
      *(double *)&v67[7] = v35;
      *(double *)&v67[8] = v36;
      *(CGFloat *)&v67[9] = v37;
      *(CGFloat *)&v67[10] = v38;
      v67[4] = v77;
      v67[5] = &v78;
      v67[6] = &v68;
      -[PKTextInputElementContent enumerateBoundsForCharactersInRange:inCoordinateSpace:reverse:block:](v13, v57, v58, v16, 1, v67);
      v59 = v69[3];
      if (v59 == 0x7FFFFFFFFFFFFFFFLL
        || v74[3] == 0x7FFFFFFFFFFFFFFFLL
        || v59 >= -[PKTextInputElementContent contentLength](v13))
      {
        if (v65 >= v66)
          v60 = v65;
        else
          v60 = v66;
        v52 = 0x7FFFFFFFFFFFFFFFLL;
        v49 = 0;
        if (v60 <= 10.0)
        {
          v61 = v79[3];
          if (v61 != 0x7FFFFFFFFFFFFFFFLL && v61 < v39)
          {
            v52 = -[PKTextInputElementContent rangeOfCharacterAtIndex:](v13, v61);
            v49 = v62;
          }
        }
      }
      else
      {
        v52 = v74[3];
        v49 = v69[3] - v52 + 1;
      }
      _Block_object_dispose(&v68, 8);
      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(v77, 8);
      _Block_object_dispose(&v78, 8);
    }
    _Block_object_dispose(&v84, 8);
    _Block_object_dispose(&v88, 8);

  }
  else
  {
    v49 = 0;
    v52 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v63 = v52;
  v64 = v49;
  result.length = v64;
  result.location = v63;
  return result;
}

BOOL __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  _BOOL8 result;
  CGRect v11;

  v11.size.height = a7;
  v11.size.width = a6;
  v11.origin.y = a5;
  v11.origin.x = a4;
  result = CGRectIntersectsRect(*(CGRect *)(a1 + 40), v11);
  if (result)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  else
    *a3 = 1;
  return result;
}

BOOL __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke_2(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  _BOOL8 result;
  CGRect v9;

  v9.size.height = a6;
  v9.size.width = a5;
  v9.origin.y = a4;
  v9.origin.x = a3;
  result = CGRectIntersectsRect(*(CGRect *)(a1 + 40), v9);
  if (result)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  return result;
}

void __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke_3(uint64_t a1, uint64_t a2, _BYTE *a3, double a4, double a5, double a6, double a7)
{
  double width;
  uint64_t v13;
  CGRect v15;

  v15 = CGRectIntersection(*(CGRect *)&a4, *(CGRect *)(a1 + 56));
  if (v15.size.width >= v15.size.height)
    width = v15.size.width;
  else
    width = v15.size.height;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (width > (double)*(unint64_t *)(v13 + 24))
  {
    *(_QWORD *)(v13 + 24) = (unint64_t)width;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
  if (v15.size.width > a6 * 0.5 || v15.size.height > a7 * 0.5)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
    *a3 = 1;
  }
}

void __106__PKTextInputHandwritingShot__editingGestureCorrectableRangeForStrokeBounds_InInputTarget_elementContent___block_invoke_4(uint64_t a1, uint64_t a2, _BYTE *a3, double a4, double a5, double a6, double a7)
{
  double width;
  uint64_t v13;
  CGRect v15;

  v15 = CGRectIntersection(*(CGRect *)&a4, *(CGRect *)(a1 + 56));
  if (v15.size.width >= v15.size.height)
    width = v15.size.width;
  else
    width = v15.size.height;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (width > (double)*(unint64_t *)(v13 + 24))
  {
    *(_QWORD *)(v13 + 24) = (unint64_t)width;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
  if (v15.size.width > a6 * 0.5 || v15.size.height > a7 * 0.5)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
    *a3 = 1;
  }
}

+ (int)_contentTypeFromTextContentType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC54A0]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC5410]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC5418]) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC5498]) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC5490]) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC5420]))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)_contentTypeFromKeyboardType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA)
    return 0;
  else
    return dword_1BE4FC6A0[a3 - 1];
}

- (void)reportDebugStateDescription:(id)a3
{
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void (**v20)(id, const __CFString *, const __CFString *);

  v20 = (void (**)(id, const __CFString *, const __CFString *))a3;
  v4 = -[PKTextInputHandwritingShot shotState](self, "shotState");
  if (v4 > 4)
    v5 = &stru_1E777DEE8;
  else
    v5 = off_1E7779190[v4];
  v20[2](v20, CFSTR("state"), v5);
  -[PKTextInputHandwritingShot _inputElementsByRecognitionID](self, "_inputElementsByRecognitionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[PKTextInputHandwritingShot _inputElementsByRecognitionID](self, "_inputElementsByRecognitionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v8, "count"));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("Not ready");
  }

  v20[2](v20, CFSTR("inputElements"), v9);
  if (-[PKTextInputHandwritingShot _didRequestTextInputElements](self, "_didRequestTextInputElements"))
    v10 = CFSTR("Yes");
  else
    v10 = CFSTR("No");
  v20[2](v20, CFSTR("requestedElements"), v10);
  -[PKTextInputHandwritingShot inputDrawing](self, "inputDrawing");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[PKTextInputHandwritingShot inputDrawing](self, "inputDrawing");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "strokes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%ld visible strokes"), objc_msgSend(v14, "count"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, CFSTR("inputDrawing"), v15);

  }
  else
  {
    v20[2](v20, CFSTR("inputDrawing"), CFSTR("None"));
  }

  -[PKTextInputHandwritingShot inputInProgressStroke](self, "inputInProgressStroke");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[PKTextInputHandwritingShot inputInProgressStroke](self, "inputInProgressStroke");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%lu points"), objc_msgSend(v18, "_pointsCount"));
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, CFSTR("inProgressStroke"), v19);

  }
  else
  {
    v20[2](v20, CFSTR("inProgressStroke"), CFSTR("None"));
  }

}

- (PKTextInputCanvasController)canvasController
{
  return self->_canvasController;
}

- (PKTextInputElementsController)elementsController
{
  return self->_elementsController;
}

- (PKTextInputHandwritingShotDelegate)delegate
{
  return (PKTextInputHandwritingShotDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKDrawing)inputDrawing
{
  return self->_inputDrawing;
}

- (PKStroke)inputInProgressStroke
{
  return self->_inputInProgressStroke;
}

- (BOOL)writingIsActiveAtStart
{
  return self->_writingIsActiveAtStart;
}

- (void)setWritingIsActiveAtStart:(BOOL)a3
{
  self->_writingIsActiveAtStart = a3;
}

- (BOOL)cursorIsWeakAtStart
{
  return self->_cursorIsWeakAtStart;
}

- (void)setCursorIsWeakAtStart:(BOOL)a3
{
  self->_cursorIsWeakAtStart = a3;
}

- (BOOL)cursorIsForcedStrongAtStart
{
  return self->_cursorIsForcedStrongAtStart;
}

- (void)setCursorIsForcedStrongAtStart:(BOOL)a3
{
  self->_cursorIsForcedStrongAtStart = a3;
}

- (NSNumber)writingSessionIdentifier
{
  return self->_writingSessionIdentifier;
}

- (void)setWritingSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)shotState
{
  return self->_shotState;
}

- (PKTextInputStrokeProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (void)setStrokeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_strokeProvider, a3);
}

- (NSArray)resultQueryItems
{
  return self->_resultQueryItems;
}

- (void)_setResultQueryItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (double)recognitionDuration
{
  return self->_recognitionDuration;
}

- (void)setRecognitionDuration:(double)a3
{
  self->_recognitionDuration = a3;
}

- (PKTextInputLanguageSpec)languageSpec
{
  return self->_languageSpec;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (NSDictionary)_inputElementsByRecognitionID
{
  return self->__inputElementsByRecognitionID;
}

- (NSMutableDictionary)_inputElementsContentByRecognitionID
{
  return self->__inputElementsContentByRecognitionID;
}

- (NSMutableIndexSet)_potentiallyTargetedElementRecognitionIDs
{
  return self->__potentiallyTargetedElementRecognitionIDs;
}

- (void)set_potentiallyTargetedElementRecognitionIDs:(id)a3
{
  objc_storeStrong((id *)&self->__potentiallyTargetedElementRecognitionIDs, a3);
}

- (NSArray)_submittedTextInputTargets
{
  return self->__submittedTextInputTargets;
}

- (void)set_submittedTextInputTargets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDictionary)_submittedTargetContentInfoByTargetID
{
  return self->__submittedTargetContentInfoByTargetID;
}

- (void)set_submittedTargetContentInfoByTargetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (double)_lastDrawingUpdateTimestamp
{
  return self->__lastDrawingUpdateTimestamp;
}

- (void)set_lastDrawingUpdateTimestamp:(double)a3
{
  self->__lastDrawingUpdateTimestamp = a3;
}

- (BOOL)_didRequestTextInputElements
{
  return self->__didRequestTextInputElements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__submittedTargetContentInfoByTargetID, 0);
  objc_storeStrong((id *)&self->__submittedTextInputTargets, 0);
  objc_storeStrong((id *)&self->__potentiallyTargetedElementRecognitionIDs, 0);
  objc_storeStrong((id *)&self->__inputElementsContentByRecognitionID, 0);
  objc_storeStrong((id *)&self->__inputElementsByRecognitionID, 0);
  objc_storeStrong((id *)&self->_languageSpec, 0);
  objc_storeStrong((id *)&self->_resultQueryItems, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
  objc_storeStrong((id *)&self->_writingSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_inputInProgressStroke, 0);
  objc_storeStrong((id *)&self->_inputDrawing, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_elementsController, 0);
  objc_storeStrong((id *)&self->_canvasController, 0);
}

@end
