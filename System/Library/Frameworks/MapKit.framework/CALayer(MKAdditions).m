@implementation CALayer(MKAdditions)

- (void)_mapkit_setActionsToRemoveDefaultImplicitActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("bounds");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v9[1] = CFSTR("position");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v9[2] = CFSTR("cornerRadius");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v4;
  v9[3] = CFSTR("transform");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  v9[4] = CFSTR("hidden");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  v9[5] = CFSTR("shadowOpacity");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setActions:", v8);

}

- (void)_mapkit_addAnimation:()MKAdditions forKey:completion:
{
  id v8;
  void *v9;
  id v10;

  v8 = a4;
  v10 = a3;
  +[MKCALayerCompletionDelegate delegateWithCompletion:](MKCALayerCompletionDelegate, "delegateWithCompletion:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", v9);

  objc_msgSend(a1, "addAnimation:forKey:", v10, v8);
}

- (id)currentLayer
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "presentationLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = a1;
  v4 = v2;

  return v4;
}

- (id)_mapKit_mapLayer
{
  id v2;
  void *v3;
  char isKindOfClass;
  uint64_t v5;

  if (!_mapKit_mapLayer_mapViewClass)
    _mapKit_mapLayer_mapViewClass = objc_opt_class();
  v2 = a1;
  do
  {
    CALayerGetDelegate();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      break;
    CALayerGetSuperlayer();
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v5;
  }
  while (v5);
  return v2;
}

- (uint64_t)getPresentationValue:()MKAdditions forKey:removeAnimation:
{
  return objc_msgSend(a1, "getPresentationValue:forValueKey:animationKey:removeAnimation:", a3, a4, a4, a5);
}

- (uint64_t)getPresentationValue:()MKAdditions forValueKey:animationKey:removeAnimation:
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;

  v10 = a4;
  v11 = a5;
  objc_msgSend(a1, "presentationLayer");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12
    && (v13 = (void *)v12,
        objc_msgSend(a1, "animationForKey:", v11),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v13,
        v14))
  {
    objc_msgSend(a1, "presentationLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("doublePosition")))
    {
      objc_msgSend(v15, "doublePosition");
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B18]), "_mapkit_initWithCADoublePoint:", v16, v17);
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("doubleBounds")))
    {
      objc_msgSend(v15, "doubleBounds");
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B18]), "_mapkit_initWithCADoubleRect:", v20, v21, v22, v23);
    }
    else
    {
      objc_msgSend(v15, "valueForKey:", v10);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v18;
    if (a6)
      objc_msgSend(a1, "removeAnimationForKey:", v11);
    if (a3)
      *a3 = objc_retainAutorelease(v24);

    v19 = 1;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_mapkit_removeAnimationImmediatelyForKey:()MKAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  id v9;

  v9 = a3;
  objc_msgSend(a1, "animationForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "completion");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void (**)(_QWORD, _QWORD))objc_msgSend(v7, "copy");

      objc_msgSend(v6, "setCompletion:", 0);
      objc_msgSend(a1, "removeAnimationForKey:", v9);
      if (v8)
        v8[2](v8, 0);

    }
    else
    {
      objc_msgSend(a1, "removeAnimationForKey:", v9);
    }

  }
}

@end
