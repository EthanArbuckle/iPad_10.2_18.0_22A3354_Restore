@implementation NSArray(ScopedIDs)

- (void)_gkUpdateInternalPlayersScopedIDs:()ScopedIDs
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  void (**v10)(_QWORD);

  v4 = a3;
  objc_msgSend(a1, "_gkMapWithBlock:", &__block_literal_global_318);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "_gkPlayersIDsFromInternals");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKPlayer gameBundleID](GKPlayer, "gameBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__NSArray_ScopedIDs___gkUpdateInternalPlayersScopedIDs___block_invoke_2;
    v8[3] = &unk_1E75B49F8;
    v9 = v5;
    v10 = v4;
    +[GKPlayer loadScopedIDsForPlayerIDs:gameBundleID:handler:](GKPlayer, "loadScopedIDsForPlayerIDs:gameBundleID:handler:", v6, v7, v8);

  }
  else
  {
    v4[2](v4);
  }

}

@end
