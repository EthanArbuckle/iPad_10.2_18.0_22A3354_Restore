@implementation UIView(MKCrossPlatformOperations)

+ (uint64_t)_maps_setDoesNotTranslateAutoresizingConstraintsForViewsDictionary:()MKCrossPlatformOperations
{
  return objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_67);
}

+ (void)_mapkit_animateWithDuration:()MKCrossPlatformOperations animations:completion:
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  double v12;

  v8 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__UIView_MKCrossPlatformOperations___mapkit_animateWithDuration_animations_completion___block_invoke;
  v10[3] = &unk_1E20D9068;
  v12 = a2;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "animateWithDuration:animations:completion:", v10, a5, a2);

}

+ (void)_mapkit_animateFromCurrentStateWithDuration:()MKCrossPlatformOperations animations:completion:
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  double v12;

  v8 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __103__UIView_MKCrossPlatformOperations___mapkit_animateFromCurrentStateWithDuration_animations_completion___block_invoke;
  v10[3] = &unk_1E20D9068;
  v12 = a2;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:", 4, v10, a5, a2, 0.0);

}

- (uint64_t)_mapkit_fittingSize
{
  return objc_msgSend(a1, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
}

- (BOOL)_mapkit_isRTL
{
  return objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection") == 1;
}

- (uint64_t)_mapkit_insertSubviewBelowAllOtherSubviews:()MKCrossPlatformOperations
{
  return objc_msgSend(a1, "insertSubview:atIndex:", a3, 0);
}

- (id)_mapkit_constraintsPinningSubviewToBounds:()MKCrossPlatformOperations
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  objc_msgSend(a1, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  objc_msgSend(a1, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  objc_msgSend(a1, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (uint64_t)_mapkit_YCoordinateAtDistance:()MKCrossPlatformOperations inDirection:fromEdge:
{
  uint64_t v9;
  double v13;
  double MaxY;

  objc_msgSend(a1, "bounds");
  if (a5 == 3 || a5 == 1)
  {
    MaxY = CGRectGetMaxY(*(CGRect *)&v9);
    goto LABEL_6;
  }
  v13 = 0.0;
  if (!a5)
  {
    MaxY = CGRectGetMinY(*(CGRect *)&v9);
LABEL_6:
    v13 = MaxY;
  }
  return objc_msgSend(a1, "_mapkit_YCoordinateAtDistance:inDirection:fromYCoordinate:", a4, a2, v13);
}

- (double)_mapkit_rectWithSize:()MKCrossPlatformOperations XCoordinate:atDistance:inDirection:fromEdge:
{
  objc_msgSend(a1, "_mapkit_YCoordinateAtDistance:inDirection:fromEdge:", a5);
  return a4;
}

- (double)_mapkit_YCoordinateAtDistance:()MKCrossPlatformOperations inDirection:fromYCoordinate:
{
  if (a5 != 1)
    a1 = -a1;
  return a1 + a2;
}

- (uint64_t)_mapkit_YCoordinate:()MKCrossPlatformOperations liesInDirection:startingFromYCoordinate:
{
  if (a1 == a2)
    return 0;
  else
    return (a5 != 0) ^ (a1 < a2);
}

@end
