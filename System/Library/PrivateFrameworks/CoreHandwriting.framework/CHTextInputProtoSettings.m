@implementation CHTextInputProtoSettings

+ (id)sharedSettings
{
  if (qword_1EF568000 != -1)
    dispatch_once(&qword_1EF568000, &unk_1E77F15F0);
  return (id)qword_1EF567FF8;
}

- (BOOL)isScribbleActive
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD);
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, const char *, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v2 = sub_1BE609DD0();
  objc_msgSend_sharedSettings(v2, v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = sub_1BE6B6308;
    v20 = &unk_1E77F2290;
    v22 = &v23;
    v21 = v8;
    v9 = (void (**)(_QWORD))MEMORY[0x1C3B81A84](&v17);
    if (objc_msgSend_isMainThread(MEMORY[0x1E0CB3978], v10, v11, v12, v13, v14, v17, v18, v19, v20))
      v9[2](v9);
    else
      dispatch_sync(MEMORY[0x1E0C80D38], v9);
    v15 = *((_BYTE *)v24 + 24) != 0;

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)autoLineBreakEnabled
{
  return self->_autoLineBreakEnabled;
}

- (BOOL)autoLineBreakRequireWeakCursor
{
  return self->_autoLineBreakRequireWeakCursor;
}

- (double)autoLineBreakMinVerticalDistance
{
  return self->_autoLineBreakMinVerticalDistance;
}

- (double)autoLineBreakDualBreakVerticalDistance
{
  return self->_autoLineBreakDualBreakVerticalDistance;
}

- (double)autoLineBreakAreaWidthFactor
{
  return self->_autoLineBreakAreaWidthFactor;
}

- (BOOL)lineBreakVerticalBarGestureEnabled
{
  return self->_lineBreakVerticalBarGestureEnabled;
}

- (BOOL)lineBreakVerticalBarUpToDelete
{
  return self->_lineBreakVerticalBarUpToDelete;
}

- (double)subwordGestureEndingSpeedRange
{
  return self->_subwordGestureEndingSpeedRange;
}

- (double)subwordGestureSpeedThreshold
{
  return self->_subwordGestureSpeedThreshold;
}

- (BOOL)preventLeftoverCharsInSubwordGestures
{
  return self->_preventLeftoverCharsInSubwordGestures;
}

@end
