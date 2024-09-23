@implementation CHRecognitionSessionAutoRefineResult

- (CHRecognitionSessionAutoRefineResult)initWithStrokeGroupResult:(id)a3 strokeGroup:(id)a4 textResult:(id)a5 refinedColumns:(id)a6 strokeProvider:(id)a7
{
  id v13;
  id v14;
  CHRecognitionSessionAutoRefineResult *v15;
  CHRecognitionSessionAutoRefineResult *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *strokeIdentifiers;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  CHTokenizedTextResult *textResult;
  uint64_t v45;
  id v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSIndexSet *syntheticStrokeIndexes;
  CHStrokeGroupingManager *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  void *isMathMode;
  const char *v78;
  uint64_t v79;
  CHDrawing *drawing;
  char v82;
  id v83;
  id v84;
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  id v90;
  objc_super v91;

  v85 = a3;
  v13 = a4;
  v84 = a5;
  v83 = a6;
  v14 = a7;
  v91.receiver = self;
  v91.super_class = (Class)CHRecognitionSessionAutoRefineResult;
  v15 = -[CHRecognitionSessionAutoRefineResult init](&v91, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_strokeGroup, a4);
    objc_storeStrong((id *)&v16->_strokeGroupResult, a3);
    objc_storeStrong((id *)&v16->_textResult, a5);
    objc_msgSend_inputStrokeIdentifiers(v16->_strokeGroupResult, v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIdentifiersForData_withStrokeProvider_(CHStrokeUtilities, v23, (uint64_t)v22, (uint64_t)v14, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    strokeIdentifiers = v16->_strokeIdentifiers;
    v16->_strokeIdentifiers = (NSArray *)v26;

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v28, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputStrokeIdentifiers(v16->_strokeGroupResult, v34, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v40, (uint64_t)v39, (uint64_t)v14, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    textResult = v16->_textResult;
    v45 = MEMORY[0x1E0C809B0];
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = sub_1BE6B8D8C;
    v88[3] = &unk_1E77F3218;
    v46 = v43;
    v89 = v46;
    v47 = v33;
    v90 = v47;
    objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(textResult, v48, (uint64_t)v88, v49, v50, v51);
    objc_storeStrong((id *)&v16->_tokenOriginalBounds, v33);
    objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v52, v53, v54, v55, v56);
    v86[0] = v45;
    v86[1] = 3221225472;
    v86[2] = sub_1BE6B8E90;
    v86[3] = &unk_1E77F3240;
    v57 = (id)objc_claimAutoreleasedReturnValue();
    v87 = v57;
    objc_msgSend_enumerateObjectsUsingBlock_(v46, v58, (uint64_t)v86, v59, v60, v61);
    v67 = objc_msgSend_copy(v57, v62, v63, v64, v65, v66);
    syntheticStrokeIndexes = v16->_syntheticStrokeIndexes;
    v16->_syntheticStrokeIndexes = (NSIndexSet *)v67;

    objc_storeStrong((id *)&v16->_refinedTokenColumns, a6);
    v69 = [CHStrokeGroupingManager alloc];
    objc_msgSend_orderedLocales(v85, v70, v71, v72, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = 0;
    isMathMode = (void *)objc_msgSend_initWithStrokeProvider_sessionLastResult_strokeGroupingModel_locales_isInlineContinuousMode_inlineContinuousModeTargets_isMathMode_(v69, v76, (uint64_t)v14, 0, 0, (uint64_t)v75, 0, 0, v82, v83, v84);

    objc_msgSend_recognizableDrawingForStrokeGroup_translationVector_originalDrawing_orderedStrokesIDs_rescalingFactor_replacementStrokeGroup_(isMathMode, v78, (uint64_t)v13, 0, 0, 0, 0, 0.0, 0.0);
    v79 = objc_claimAutoreleasedReturnValue();
    drawing = v16->_drawing;
    v16->_drawing = (CHDrawing *)v79;

  }
  return v16;
}

- (CHStrokeGroup)strokeGroup
{
  return self->_strokeGroup;
}

- (CHTokenizedTextResult)textResult
{
  return self->_textResult;
}

- (NSArray)tokenOriginalBounds
{
  return self->_tokenOriginalBounds;
}

- (NSArray)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (CHStrokeGroupRecognitionResult)strokeGroupResult
{
  return self->_strokeGroupResult;
}

- (NSIndexSet)refinedTokenColumns
{
  return self->_refinedTokenColumns;
}

- (CHDrawing)drawing
{
  return self->_drawing;
}

- (NSIndexSet)syntheticStrokeIndexes
{
  return self->_syntheticStrokeIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syntheticStrokeIndexes, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_refinedTokenColumns, 0);
  objc_storeStrong((id *)&self->_strokeGroupResult, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_tokenOriginalBounds, 0);
  objc_storeStrong((id *)&self->_textResult, 0);
  objc_storeStrong((id *)&self->_strokeGroup, 0);
}

@end
