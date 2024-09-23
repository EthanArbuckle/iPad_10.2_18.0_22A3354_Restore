@implementation PKTextInputTargetState

- (PKTextInputTargetState)init
{
  PKTextInputTargetState *v2;
  const char *v3;
  PKTextInputTargetState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKTextInputTargetState;
  v2 = -[PKTextInputTargetState init](&v6, sel_init);
  v4 = v2;
  if (v2)
    -[PKTextInputTargetState clear]((uint64_t)v2, v3);
  return v4;
}

- (__n128)clear
{
  SEL v3;
  SEL v4;
  void *v5;
  void *v6;
  SEL v7;
  void *v8;
  __n128 result;

  if (a1)
  {
    objc_setProperty_nonatomic_copy((id)a1, a2, 0, 48);
    objc_setProperty_nonatomic_copy((id)a1, v3, 0, 56);
    objc_setProperty_nonatomic_copy((id)a1, v4, 0, 16);
    v5 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    v6 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    objc_setProperty_nonatomic_copy((id)a1, v7, 0, 40);
    *(_QWORD *)(a1 + 64) = 0;
    *(_OWORD *)(a1 + 104) = xmmword_1BE4FE230;
    v8 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

    *(_QWORD *)(a1 + 72) = 0x7FFFFFFFFFFFFFFFLL;
    result = (__n128)xmmword_1BE4FE230;
    *(_OWORD *)(a1 + 120) = xmmword_1BE4FE230;
    *(_OWORD *)(a1 + 136) = xmmword_1BE4FE230;
    *(_QWORD *)(a1 + 88) = 0;
    *(_QWORD *)(a1 + 96) = 0;
    *(_BYTE *)(a1 + 8) = 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKTextInputTargetState *v4;
  const char *v5;
  uint64_t v6;
  NSString *uncommittedPendingText;
  NSString *activePreviewText;
  NSNumber *elementRecognitionIdentifier;
  const char *v10;
  NSNumber *writingSessionIdentifier;
  int64_t sessionCommitLength;
  int64_t lastCommittedCharacterLevelPosition;
  _NSRange inProgressGestureInitialSelectedRange;
  double lastUpdateTimestamp;
  _NSRange inProgressGestureSelectionRange;
  _NSRange inProgressGestureRangeToDelete;
  double inProgressGestureStartTimestamp;
  BOOL nextCommitShouldHavePrecedingSeparator;

  v4 = objc_alloc_init(PKTextInputTargetState);
  v6 = (uint64_t)v4;
  if (self)
  {
    uncommittedPendingText = self->_uncommittedPendingText;
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  uncommittedPendingText = 0;
  if (v4)
LABEL_3:
    objc_setProperty_nonatomic_copy(v4, v5, uncommittedPendingText, 48);
LABEL_4:
  if (self)
  {
    activePreviewText = self->_activePreviewText;
    if (!v6)
      goto LABEL_7;
    goto LABEL_6;
  }
  activePreviewText = 0;
  if (v6)
LABEL_6:
    objc_setProperty_nonatomic_copy((id)v6, v5, activePreviewText, 56);
LABEL_7:
  if (self)
  {
    elementRecognitionIdentifier = self->_elementRecognitionIdentifier;
    if (!v6)
      goto LABEL_10;
    goto LABEL_9;
  }
  elementRecognitionIdentifier = 0;
  if (v6)
LABEL_9:
    objc_setProperty_nonatomic_copy((id)v6, v5, elementRecognitionIdentifier, 16);
LABEL_10:
  if (self)
  {
    -[PKMathResultAttribution setString:](v6, self->_lastQueryItem);
    -[PKMathResultAttribution setDate:](v6, self->_handwritingShot);
    writingSessionIdentifier = self->_writingSessionIdentifier;
    if (!v6)
      goto LABEL_13;
    goto LABEL_12;
  }
  -[PKMathResultAttribution setString:](v6, 0);
  -[PKMathResultAttribution setDate:](v6, 0);
  writingSessionIdentifier = 0;
  if (v6)
LABEL_12:
    objc_setProperty_nonatomic_copy((id)v6, v10, writingSessionIdentifier, 40);
LABEL_13:
  if (self)
  {
    sessionCommitLength = self->_sessionCommitLength;
    if (!v6)
      goto LABEL_16;
    goto LABEL_15;
  }
  sessionCommitLength = 0;
  if (v6)
LABEL_15:
    *(_QWORD *)(v6 + 64) = sessionCommitLength;
LABEL_16:
  if (self)
  {
    lastCommittedCharacterLevelPosition = self->_lastCommittedCharacterLevelPosition;
    if (!v6)
      goto LABEL_19;
    goto LABEL_18;
  }
  lastCommittedCharacterLevelPosition = 0;
  if (v6)
LABEL_18:
    *(_QWORD *)(v6 + 72) = lastCommittedCharacterLevelPosition;
LABEL_19:
  if (self)
  {
    inProgressGestureInitialSelectedRange = self->_inProgressGestureInitialSelectedRange;
    if (!v6)
      goto LABEL_22;
    goto LABEL_21;
  }
  inProgressGestureInitialSelectedRange = (_NSRange)0;
  if (v6)
LABEL_21:
    *(_NSRange *)(v6 + 104) = inProgressGestureInitialSelectedRange;
LABEL_22:
  if (self)
  {
    -[PKTextInputTargetState setInProgressGestureStrokeUUID:](v6, self->_inProgressGestureStrokeUUID);
    lastUpdateTimestamp = self->_lastUpdateTimestamp;
    if (!v6)
      goto LABEL_25;
    goto LABEL_24;
  }
  -[PKTextInputTargetState setInProgressGestureStrokeUUID:](v6, 0);
  lastUpdateTimestamp = 0.0;
  if (v6)
LABEL_24:
    *(double *)(v6 + 96) = lastUpdateTimestamp;
LABEL_25:
  if (self)
  {
    inProgressGestureSelectionRange = self->_inProgressGestureSelectionRange;
    if (!v6)
      goto LABEL_28;
    goto LABEL_27;
  }
  inProgressGestureSelectionRange = (_NSRange)0;
  if (v6)
LABEL_27:
    *(_NSRange *)(v6 + 120) = inProgressGestureSelectionRange;
LABEL_28:
  if (self)
  {
    inProgressGestureRangeToDelete = self->_inProgressGestureRangeToDelete;
    if (!v6)
      goto LABEL_31;
    goto LABEL_30;
  }
  inProgressGestureRangeToDelete = (_NSRange)0;
  if (v6)
LABEL_30:
    *(_NSRange *)(v6 + 136) = inProgressGestureRangeToDelete;
LABEL_31:
  if (self)
  {
    inProgressGestureStartTimestamp = self->_inProgressGestureStartTimestamp;
    if (!v6)
      goto LABEL_34;
    goto LABEL_33;
  }
  inProgressGestureStartTimestamp = 0.0;
  if (v6)
LABEL_33:
    *(double *)(v6 + 88) = inProgressGestureStartTimestamp;
LABEL_34:
  if (!self)
  {
    nextCommitShouldHavePrecedingSeparator = 0;
    if (!v6)
      return (id)v6;
    goto LABEL_36;
  }
  nextCommitShouldHavePrecedingSeparator = self->_nextCommitShouldHavePrecedingSeparator;
  if (v6)
LABEL_36:
    *(_BYTE *)(v6 + 8) = nextCommitShouldHavePrecedingSeparator;
  return (id)v6;
}

- (void)setInProgressGestureStrokeUUID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKTextInputTargetState;
  -[PKTextInputTargetState description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKTextInputDebugStateIntrospector debugStateLineDescriptionForIntrospectable:](PKTextInputDebugStateIntrospector, "debugStateLineDescriptionForIntrospectable:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)reportDebugStateDescription:(id)a3
{
  void (**v4)(id, const __CFString *, void *);
  NSString *uncommittedPendingText;
  void *v6;
  NSNumber *writingSessionIdentifier;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  NSRange v16;
  void *v17;
  NSUUID *inProgressGestureStrokeUUID;
  void *v19;
  const __CFString *v20;
  void (**v21)(id, const __CFString *, void *);

  v4 = (void (**)(id, const __CFString *, void *))a3;
  uncommittedPendingText = self->_uncommittedPendingText;
  v21 = v4;
  if (uncommittedPendingText)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\"), uncommittedPendingText);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, CFSTR("uncommittedPendingText"), v6);

  }
  else
  {
    v4[2](v4, CFSTR("uncommittedPendingText"), &stru_1E777DEE8);
  }
  writingSessionIdentifier = self->_writingSessionIdentifier;
  if (writingSessionIdentifier)
  {
    -[NSNumber description](writingSessionIdentifier, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, CFSTR("writingSessionID"), v8);

  }
  else
  {
    v21[2](v21, CFSTR("writingSessionID"), &stru_1E777DEE8);
  }
  if (self->_activePreviewText)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\"), self->_activePreviewText);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, CFSTR("activePreviewText"), v9);

  }
  else
  {
    v21[2](v21, CFSTR("activePreviewText"), &stru_1E777DEE8);
  }
  -[NSNumber description](self->_elementRecognitionIdentifier, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2](v21, CFSTR("elementID"), v10);

  -[CHTextInputQueryItem itemStableIdentifier](self->_lastQueryItem, "itemStableIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2](v21, CFSTR("lastQueryItemID"), v12);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), self->_sessionCommitLength);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2](v21, CFSTR("sessionCommitLength"), v13);

  if (self->_handwritingShot)
    v14 = CFSTR("Yes");
  else
    v14 = CFSTR("No");
  v21[2](v21, CFSTR("handwritingShot"), (void *)v14);
  if (self->_lastCommittedCharacterLevelPosition == 0x7FFFFFFFFFFFFFFFLL)
  {
    v21[2](v21, CFSTR("lastCommittedCharacterLevelPosition"), CFSTR("None"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), self->_lastCommittedCharacterLevelPosition);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, CFSTR("lastCommittedCharacterLevelPosition"), v15);

  }
  v16.location = self->_inProgressGestureInitialSelectedRange.location;
  if (v16.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v21[2](v21, CFSTR("inProgressGestureInitialSelectedRange"), CFSTR("None"));
  }
  else
  {
    v16.length = self->_inProgressGestureInitialSelectedRange.length;
    NSStringFromRange(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, CFSTR("inProgressGestureInitialSelectedRange"), v17);

  }
  inProgressGestureStrokeUUID = self->_inProgressGestureStrokeUUID;
  if (inProgressGestureStrokeUUID)
  {
    -[NSUUID description](inProgressGestureStrokeUUID, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2](v21, CFSTR("inProgressGestureStrokeUUID"), v19);

  }
  else
  {
    v21[2](v21, CFSTR("inProgressGestureStrokeUUID"), CFSTR("None"));
  }
  if (self->_nextCommitShouldHavePrecedingSeparator)
    v20 = CFSTR("Yes");
  else
    v20 = CFSTR("No");
  v21[2](v21, CFSTR("nextCommitShouldHavePrecedingSeparator"), (void *)v20);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProgressGestureStrokeUUID, 0);
  objc_storeStrong((id *)&self->_activePreviewText, 0);
  objc_storeStrong((id *)&self->_uncommittedPendingText, 0);
  objc_storeStrong((id *)&self->_writingSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_handwritingShot, 0);
  objc_storeStrong((id *)&self->_lastQueryItem, 0);
  objc_storeStrong((id *)&self->_elementRecognitionIdentifier, 0);
}

@end
