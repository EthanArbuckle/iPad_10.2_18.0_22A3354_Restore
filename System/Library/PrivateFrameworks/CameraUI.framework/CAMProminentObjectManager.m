@implementation CAMProminentObjectManager

- (CAMProminentObjectManager)init
{
  CAMProminentObjectManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMProminentObjectManager;
  result = -[CAMProminentObjectManager init](&v3, sel_init);
  if (result)
    result->_viewportAspectRatio = 0;
  return result;
}

- (void)_setCurrentObject:(id)a3 forPointOfInterest:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CAMMetadataObjectResult *v8;
  CAMMetadataObjectResult *currentObject;
  BOOL v10;
  void *v11;
  CAMMetadataObjectResult *v12;

  y = a4.y;
  x = a4.x;
  v8 = (CAMMetadataObjectResult *)a3;
  currentObject = self->_currentObject;
  if (currentObject != v8)
  {
    v12 = v8;
    v10 = -[CAMProminentObjectManager _isMetadataObject:semanticallyEqualToMetadataObject:](self, "_isMetadataObject:semanticallyEqualToMetadataObject:", currentObject, v8);
    objc_storeStrong((id *)&self->_currentObject, a3);
    v8 = v12;
    if (!v10)
    {
      self->_currentObjectPointOfInterest.x = x;
      self->_currentObjectPointOfInterest.y = y;
      -[CAMProminentObjectManager delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "prominentObjectManager:didChangeCurrentObject:", self, v12);

      -[CAMProminentObjectManager _updateCurrentMRCActionWhenReady](self, "_updateCurrentMRCActionWhenReady");
      v8 = v12;
    }
  }

}

- (void)_setCurrentMachineReadableCodeAction:(id)a3
{
  -[CAMProminentObjectManager _setCurrentMachineReadableCodeAction:updatePreviousAction:](self, "_setCurrentMachineReadableCodeAction:updatePreviousAction:", a3, 1);
}

- (void)_setCurrentMachineReadableCodeAction:(id)a3 updatePreviousAction:(BOOL)a4
{
  _BOOL4 v4;
  BCSAction *v7;
  BCSAction *currentAction;
  BOOL v9;
  id WeakRetained;
  BCSAction *v11;

  v4 = a4;
  v7 = (BCSAction *)a3;
  currentAction = self->_currentAction;
  if (currentAction != v7)
  {
    v11 = v7;
    if (currentAction)
      v9 = !v4;
    else
      v9 = 1;
    if (!v9)
      objc_storeStrong((id *)&self->_previousAction, currentAction);
    objc_storeStrong((id *)&self->_currentAction, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "prominentObjectManager:didChangeCurrentMachineReadableCodeAction:", self, v11);

    v7 = v11;
  }

}

- (CAMMetadataObjectResult)currentObject
{
  return self->_currentObject;
}

- (BOOL)isCurrentObjectExpiring
{
  CAMMetadataObjectResult *currentObject;

  currentObject = self->_currentObject;
  return currentObject && currentObject == self->_expiringObject;
}

- (BOOL)isCurrentObjectLikelyEqualToObject:(id)a3
{
  return -[CAMProminentObjectManager _isMetadataObject:semanticallyEqualToMetadataObject:](self, "_isMetadataObject:semanticallyEqualToMetadataObject:", a3, self->_currentObject);
}

- (BCSAction)currentMachineReadableCodeAction
{
  BCSAction *v3;

  if (-[CAMProminentObjectManager currentObjectType](self, "currentObjectType") == 2)
    v3 = self->_currentAction;
  else
    v3 = 0;
  return v3;
}

- (unint64_t)currentObjectType
{
  return -[CAMProminentObjectManager typeForMetadataObject:](self, "typeForMetadataObject:", self->_currentObject);
}

- (unint64_t)typeForMetadataObject:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
    {
      v4 = 1;
    }
    else if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
    {
      v4 = 2;
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)reset
{
  _BOOL4 v3;
  BCSDetectedCode *currentlyParsingCode;
  BCSAction *previousAction;
  CAMMetadataObjectResult *expiringObject;
  id v7;

  v3 = -[CAMProminentObjectManager isCurrentObjectExpiring](self, "isCurrentObjectExpiring");
  currentlyParsingCode = self->_currentlyParsingCode;
  self->_currentlyParsingCode = 0;

  previousAction = self->_previousAction;
  self->_previousAction = 0;

  expiringObject = self->_expiringObject;
  self->_expiringObject = 0;

  -[CAMProminentObjectManager _setCurrentMachineReadableCodeAction:updatePreviousAction:](self, "_setCurrentMachineReadableCodeAction:updatePreviousAction:", 0, 0);
  -[CAMProminentObjectManager _setCurrentObject:forPointOfInterest:](self, "_setCurrentObject:forPointOfInterest:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  if (v3 != -[CAMProminentObjectManager isCurrentObjectExpiring](self, "isCurrentObjectExpiring"))
  {
    -[CAMProminentObjectManager delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "prominentObjectManagerDidChangeIsCurrentObjectExpiring:", self);

  }
}

- (void)updateWithCandidateObjects:(id)a3
{
  CAMMetadataObjectResult *v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  uint64_t v11;
  CAMMetadataObjectResult *v12;
  CAMMetadataObjectResult *expiringObject;
  CAMMetadataObjectResult *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[CAMProminentObjectManager _candidateObjectMatchingCurrentObject:](self, "_candidateObjectMatchingCurrentObject:", v16);
  v4 = (CAMMetadataObjectResult *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "prominentObjectManagerPointOfInterestInNormalizedDeviceSpace:", self);
  v7 = v6;
  v9 = v8;

  v10 = -[CAMProminentObjectManager isCurrentObjectExpiring](self, "isCurrentObjectExpiring");
  if (!objc_msgSend(v16, "count"))
  {
    -[CAMProminentObjectManager _beginExpiringCurrentObjectIfNeeded](self, "_beginExpiringCurrentObjectIfNeeded");
LABEL_7:
    v12 = 0;
    expiringObject = self->_expiringObject;
    goto LABEL_8;
  }
  -[CAMProminentObjectManager _mostSignificantObjectFromObjects:preferredObject:pointOfInterest:](self, "_mostSignificantObjectFromObjects:preferredObject:pointOfInterest:", v16, v4, v7, v9);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (CAMMetadataObjectResult *)v11;
  if (v11 && (CAMMetadataObjectResult *)v11 == v4)
  {
    v12 = v4;
    expiringObject = v4;
    goto LABEL_8;
  }
  -[CAMProminentObjectManager _beginExpiringCurrentObjectIfNeeded](self, "_beginExpiringCurrentObjectIfNeeded");
  expiringObject = v12;
  if (!v12)
    goto LABEL_7;
LABEL_8:
  v14 = expiringObject;

  -[CAMProminentObjectManager _setCurrentObject:forPointOfInterest:](self, "_setCurrentObject:forPointOfInterest:", v14, v7, v9);
  if (v10 != -[CAMProminentObjectManager isCurrentObjectExpiring](self, "isCurrentObjectExpiring"))
  {
    -[CAMProminentObjectManager delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "prominentObjectManagerDidChangeIsCurrentObjectExpiring:", self);

  }
}

- (void)_beginExpiringCurrentObjectIfNeeded
{
  double v3;
  double v4;
  double v5;
  CAMMetadataObjectResult *currentObject;
  CAMMetadataObjectResult *v8;
  dispatch_time_t v9;
  CAMMetadataObjectResult *v10;
  _QWORD block[4];
  CAMMetadataObjectResult *v12;
  id v13;
  id location;

  -[CAMProminentObjectManager _expirationTimeForObjectType:](self, "_expirationTimeForObjectType:", -[CAMProminentObjectManager typeForMetadataObject:](self, "typeForMetadataObject:", self->_currentObject));
  v4 = v3;
  -[CAMProminentObjectManager _expirationTimeForObjectType:](self, "_expirationTimeForObjectType:", -[CAMProminentObjectManager typeForMetadataObject:](self, "typeForMetadataObject:", self->_expiringObject));
  if (v4 > 0.0 && v4 >= v5)
  {
    currentObject = self->_currentObject;
    if (currentObject != self->_expiringObject)
    {
      objc_storeStrong((id *)&self->_expiringObject, currentObject);
      v8 = self->_expiringObject;
      objc_initWeak(&location, self);
      v9 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__CAMProminentObjectManager__beginExpiringCurrentObjectIfNeeded__block_invoke;
      block[3] = &unk_1EA328F00;
      objc_copyWeak(&v13, &location);
      v12 = v8;
      v10 = v8;
      dispatch_after(v9, MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

void __64__CAMProminentObjectManager__beginExpiringCurrentObjectIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleExpiredObject:", *(_QWORD *)(a1 + 32));

}

- (void)_handleExpiredObject:(id)a3
{
  CAMMetadataObjectResult *v4;
  void *v5;
  CAMMetadataObjectResult *v6;

  v4 = (CAMMetadataObjectResult *)a3;
  if (self->_expiringObject == v4)
  {
    self->_expiringObject = 0;
    v6 = v4;

    if (self->_currentObject == v6)
      -[CAMProminentObjectManager _setCurrentObject:forPointOfInterest:](self, "_setCurrentObject:forPointOfInterest:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[CAMProminentObjectManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prominentObjectManagerDidChangeIsCurrentObjectExpiring:", self);

    v4 = v6;
  }

}

- (double)_expirationTimeForObjectType:(unint64_t)a3
{
  double result;

  result = 0.45;
  if (a3 != 1)
    result = 0.0;
  if (a3 == 2)
    return 4.0;
  return result;
}

- (BOOL)_isMetadataObject:(id)a3 semanticallyEqualToMetadataObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  NSObject *v14;
  id v15;
  id BCSDetectedCodeClass;
  void *v17;
  id v18;
  id v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (objc_msgSend(v7, "isMemberOfClass:", objc_opt_class()))
    {
      v9 = -[CAMProminentObjectManager typeForMetadataObject:](self, "typeForMetadataObject:", v6);
      if (v9)
      {
        if (v9 == 2)
        {
          v15 = v6;
          BCSDetectedCodeClass = getBCSDetectedCodeClass();
          objc_msgSend(v15, "underlyingMachineReadableCodeObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(BCSDetectedCodeClass, "detectedCodeWithMachineReadableObject:", v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = v8;
          v19 = getBCSDetectedCodeClass();
          objc_msgSend(v18, "underlyingMachineReadableCodeObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "detectedCodeWithMachineReadableObject:", v20);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = objc_msgSend(v10, "isLikelyEqualToCode:", v11);
          goto LABEL_13;
        }
        if (v9 == 1)
        {
          objc_msgSend(v6, "uniqueIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "uniqueIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", v10);
LABEL_13:
          v13 = v12;

          goto LABEL_14;
        }
      }
      else
      {
        v14 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[CAMProminentObjectManager _isMetadataObject:semanticallyEqualToMetadataObject:].cold.1((uint64_t)v6, v14);

      }
    }
    v13 = 0;
  }
  else
  {
    v13 = v7 == 0;
  }
LABEL_14:

  return v13;
}

- (BOOL)_isPoint:(CGPoint)a3 equalToPoint:(CGPoint)a4 tolerance:(double)a5
{
  BOOL v5;

  v5 = vabdd_f64(a3.x, a4.x) <= a5;
  return vabdd_f64(a3.y, a4.y) <= a5 && v5;
}

- (id)_candidateObjectMatchingCurrentObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_currentObject)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (-[CAMProminentObjectManager _isMetadataObject:semanticallyEqualToMetadataObject:](self, "_isMetadataObject:semanticallyEqualToMetadataObject:", self->_currentObject, v11, (_QWORD)v14))
          {
            v12 = v11;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_12:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_mostSignificantObjectFromObjects:(id)a3 preferredObject:(id)a4 pointOfInterest:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  double v13;
  double v14;
  double v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  id v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  int v38;
  double v39;
  id v40;
  id v41;
  BOOL v42;
  CAMMetadataObjectResult **p_candidateObject;
  _BOOL4 v44;
  _BOOL4 v45;
  double v46;
  id v47;
  CAMMetadataObjectResult *v48;
  char v50;
  CAMProminentObjectManager *v51;
  double point[3];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;
  CGPoint v58;
  CGRect v59;

  y = a5.y;
  x = a5.x;
  v57 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(v9, "count");
  if (v10 || v11)
  {
    -[CAMProminentObjectManager _referenceBoundsForAspectRatio:](self, "_referenceBoundsForAspectRatio:", -[CAMProminentObjectManager viewportAspectRatio](self, "viewportAspectRatio"));
    CEKExpandNormalizedPoint();
    point[0] = v13;
    v15 = v14;
    if (self->_currentObject)
      v16 = !-[CAMProminentObjectManager _isPoint:equalToPoint:tolerance:](self, "_isPoint:equalToPoint:tolerance:", self->_currentObjectPointOfInterest.x, self->_currentObjectPointOfInterest.y, x, y, 0.001);
    else
      LOBYTE(v16) = 0;
    v54 = 0u;
    v55 = 0u;
    *(_OWORD *)&point[1] = 0u;
    v53 = 0u;
    v17 = v9;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &point[1], v56, 16);
    if (v18)
    {
      v19 = v18;
      v50 = v16;
      v51 = self;
      v20 = 0;
      v21 = *(_QWORD *)v53;
      v22 = 1.79769313e308;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v53 != v21)
            objc_enumerationMutation(v17);
          v24 = *(id *)(*(_QWORD *)&point[2] + 8 * i);
          objc_msgSend(v24, "underlyingMetadataObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "bounds");

          CEKExpandNormalizedRect();
          v27 = v26;
          v29 = v28;
          v31 = v30;
          v33 = v32;
          UIRectGetCenter();
          v35 = v34;
          v37 = v36;
          v38 = objc_msgSend(v24, "isMemberOfClass:", objc_opt_class());
          if (v38)
          {
            v59.origin.x = v27;
            v59.origin.y = v29;
            v59.size.width = v31;
            v59.size.height = v33;
            v58.x = point[0];
            v58.y = v15;
            if (CGRectContainsPoint(v59, v58))
            {
              v41 = v24;

              LOBYTE(v16) = 1;
              v20 = v41;
              self = v51;
              goto LABEL_26;
            }
          }
          if (v24 == v10)
            v39 = ((v15 - v37) * (v15 - v37) + (point[0] - v35) * (point[0] - v35)) * 0.5625;
          else
            v39 = (v15 - v37) * (v15 - v37) + (point[0] - v35) * (point[0] - v35);
          if (v39 < v22)
          {
            if (((v39 > 0.0625) & ~v38) != 0)
            {
              v22 = v39;
            }
            else
            {
              v40 = v24;

              v22 = v39;
              v20 = v40;
            }
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &point[1], v56, 16);
        if (v19)
          continue;
        break;
      }
      self = v51;
      LOBYTE(v16) = v50;
    }
    else
    {
      v20 = 0;
    }
LABEL_26:

    v12 = v10;
    v42 = -[CAMProminentObjectManager _isMetadataObject:semanticallyEqualToMetadataObject:](self, "_isMetadataObject:semanticallyEqualToMetadataObject:", v20, self->_currentObject);
    if (!v20 || v42)
      goto LABEL_31;
    p_candidateObject = &self->_candidateObject;
    v44 = -[CAMProminentObjectManager _isMetadataObject:semanticallyEqualToMetadataObject:](self, "_isMetadataObject:semanticallyEqualToMetadataObject:", v20, self->_candidateObject);
    if ((v16 & 1) == 0)
    {
      v45 = v44;
      -[CAMProminentObjectManager _selectionDelayForNewObject:](self, "_selectionDelayForNewObject:", v20);
      if (v46 != 0.0)
      {
        if (!v45)
        {
          objc_storeStrong((id *)&self->_candidateObject, v20);
          self->_candidateTimestamp = CFAbsoluteTimeGetCurrent();
          goto LABEL_31;
        }
        if (CFAbsoluteTimeGetCurrent() - self->_candidateTimestamp <= v46)
          goto LABEL_31;
      }
    }
    v47 = v20;

    v48 = *p_candidateObject;
    *p_candidateObject = 0;

    v12 = v47;
LABEL_31:

    goto LABEL_32;
  }
  v12 = 0;
LABEL_32:

  return v12;
}

- (double)_selectionDelayForNewObject:(id)a3
{
  id v4;
  CAMMetadataObjectResult *currentObject;
  double v6;
  unint64_t v7;

  v4 = a3;
  if (_selectionDelayForNewObject__onceToken != -1)
    dispatch_once(&_selectionDelayForNewObject__onceToken, &__block_literal_global_2);
  currentObject = self->_currentObject;
  if (!currentObject || (v6 = 0.75, currentObject == self->_expiringObject))
  {
    v7 = -[CAMProminentObjectManager typeForMetadataObject:](self, "typeForMetadataObject:", v4);
    if (!v7 || v7 == 2)
    {
      v6 = 0.25;
    }
    else
    {
      v6 = 0.0;
      if (v7 == 1)
        v6 = *(double *)&_selectionDelayForNewObject__textSelectionDelay;
    }
  }

  return v6;
}

CFIndex __57__CAMProminentObjectManager__selectionDelayForNewObject___block_invoke()
{
  CFIndex result;
  double v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppIntegerValue(CFSTR("CAMTextSelectionDelayMilliseconds"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = fmax((double)result / 1000.0, 0.0);
  else
    v1 = 0.25;
  _selectionDelayForNewObject__textSelectionDelay = *(_QWORD *)&v1;
  return result;
}

- (CGRect)_referenceBoundsForAspectRatio:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  switch(a3)
  {
    case 0:
      v5 = 1.33333333;
      break;
    case 1:
      v5 = 1.77777778;
      break;
    case 2:
      v5 = 1.5;
      break;
    case 3:
      v5 = 1.0;
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_referenceBounds");
      v8 = v7;
      v10 = v9;

      v5 = v10 / v8;
      break;
    default:
      v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      break;
  }
  v11 = 1.0;
  v12 = v3;
  v13 = v4;
  result.size.height = v11;
  result.size.width = v5;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)_updateCurrentMRCActionWhenReady
{
  unint64_t v3;
  BCSDetectedCode *currentlyParsingCode;
  CAMMetadataObjectResult *v5;
  id BCSDetectedCodeClass;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  CAMProminentObjectManager *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[CAMProminentObjectManager currentObjectType](self, "currentObjectType");
  currentlyParsingCode = self->_currentlyParsingCode;
  if (v3 == 2)
  {
    if (!currentlyParsingCode)
    {
      v5 = self->_currentObject;
      BCSDetectedCodeClass = getBCSDetectedCodeClass();
      -[CAMMetadataObjectResult underlyingMachineReadableCodeObject](v5, "underlyingMachineReadableCodeObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(BCSDetectedCodeClass, "detectedCodeWithMachineReadableObject:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[BCSAction detectedCode](self->_currentAction, "detectedCode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isLikelyEqualToCode:", v9);

      if ((v10 & 1) == 0)
      {
        -[BCSAction detectedCode](self->_previousAction, "detectedCode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v8, "isLikelyEqualToCode:", v11);

        if (v12)
        {
          -[CAMProminentObjectManager _setCurrentMachineReadableCodeAction:](self, "_setCurrentMachineReadableCodeAction:", self->_previousAction);
        }
        else
        {
          v13 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v18 = v8;
            _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "Parsing machine readable code (%{public}@)", buf, 0xCu);
          }

          objc_storeStrong((id *)&self->_currentlyParsingCode, v8);
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __61__CAMProminentObjectManager__updateCurrentMRCActionWhenReady__block_invoke;
          v14[3] = &unk_1EA329118;
          v15 = v8;
          v16 = self;
          objc_msgSend(v15, "parseCodeWithCompletion:", v14);

        }
      }

    }
  }
  else
  {
    self->_currentlyParsingCode = 0;

    -[CAMProminentObjectManager _setCurrentMachineReadableCodeAction:](self, "_setCurrentMachineReadableCodeAction:", 0);
  }
}

void __61__CAMProminentObjectManager__updateCurrentMRCActionWhenReady__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__CAMProminentObjectManager__updateCurrentMRCActionWhenReady__block_invoke_2;
  v11[3] = &unk_1EA3290F0;
  v12 = v6;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v13 = v7;
  v14 = v8;
  v15 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __61__CAMProminentObjectManager__updateCurrentMRCActionWhenReady__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v3;
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "Failed to parse machine readable code (%{public}@): %{public}@", (uint8_t *)&v16, 0x16u);

    }
    v5 = *(void **)(a1 + 48);
    v6 = 0;
LABEL_5:
    objc_msgSend(v5, "_setCurrentMachineReadableCodeAction:", v6);
    return;
  }
  objc_msgSend(*(id *)(a1 + 56), "detectedCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(*(_QWORD *)(a1 + 48) + 56);

  v9 = os_log_create("com.apple.camera", "Camera");
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7 == v8)
  {
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 56), "dataTypeDisplayString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 40);
      v16 = 138543618;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Received action of type %{public}@ for machine readable code (%{public}@)", (uint8_t *)&v16, 0x16u);

    }
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(void **)(v14 + 56);
    *(_QWORD *)(v14 + 56) = 0;

    v5 = *(void **)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    goto LABEL_5;
  }
  if (v10)
  {
    v11 = *(void **)(a1 + 40);
    v16 = 138543362;
    v17 = v11;
    _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Ignored action for machine readable code (%{public}@) because parsing was cancelled", (uint8_t *)&v16, 0xCu);
  }

}

- (CAMProminentObjectManagerDelegate)delegate
{
  return (CAMProminentObjectManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)viewportAspectRatio
{
  return self->_viewportAspectRatio;
}

- (void)setViewportAspectRatio:(int64_t)a3
{
  self->_viewportAspectRatio = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentAction, 0);
  objc_storeStrong((id *)&self->_previousAction, 0);
  objc_storeStrong((id *)&self->_currentlyParsingCode, 0);
  objc_storeStrong((id *)&self->_candidateObject, 0);
  objc_storeStrong((id *)&self->_expiringObject, 0);
  objc_storeStrong((id *)&self->_currentObject, 0);
}

- (void)_isMetadataObject:(uint64_t)a1 semanticallyEqualToMetadataObject:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "CAMMetadataObjectResult is not nil, but its type (%{public}@) is not recognized by the prominent object manager.", (uint8_t *)&v5, 0xCu);

}

@end
