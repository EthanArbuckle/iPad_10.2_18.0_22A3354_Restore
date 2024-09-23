@implementation AEDelegatingTransitionAnimationCoordinator

- (AEDelegatingTransitionAnimationCoordinator)initWithWrappedCoordinator:(id)a3
{
  id v5;
  AEDelegatingTransitionAnimationCoordinator *v6;
  AEDelegatingTransitionAnimationCoordinator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEDelegatingTransitionAnimationCoordinator;
  v6 = -[AEDelegatingTransitionAnimationCoordinator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__wrappedCoordinator, a3);
    v7->_enableDoubleSidedAnimations = 1;
  }

  return v7;
}

- (id)optionsForAnimatingTileWithIdentifier:(PXTileIdentifier *)a3 animationType:(int64_t)a4 fromGeometry:(PXTileGeometry *)a5 fromUserData:(id)a6 toGeometry:(PXTileGeometry *)a7 toUserData:(id)a8
{
  id v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGSize size;
  CGSize var2;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CGSize v29;
  CGSize v30;
  void *v31;
  _OWORD v33[12];
  _OWORD v34[12];
  _OWORD v35[5];
  unint64_t v36;

  v14 = a8;
  v15 = a6;
  -[AEDelegatingTransitionAnimationCoordinator _wrappedCoordinator](self, "_wrappedCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_OWORD *)&a3->var1[5];
  v35[2] = *(_OWORD *)&a3->var1[3];
  v35[3] = v17;
  v35[4] = *(_OWORD *)&a3->var1[7];
  v36 = a3->var1[9];
  v18 = *(_OWORD *)&a3->var1[1];
  v35[0] = *(_OWORD *)&a3->var0;
  v35[1] = v18;
  v19 = *(_OWORD *)&a5->var7.height;
  v34[8] = *(_OWORD *)&a5->var6;
  v34[9] = v19;
  v20 = *(_OWORD *)&a5->var8.size.height;
  v34[10] = *(_OWORD *)&a5->var8.origin.y;
  v34[11] = v20;
  v21 = *(_OWORD *)&a5->var3.c;
  v34[4] = *(_OWORD *)&a5->var3.a;
  v34[5] = v21;
  v22 = *(_OWORD *)&a5->var4;
  v34[6] = *(_OWORD *)&a5->var3.tx;
  v34[7] = v22;
  size = a5->var0.size;
  v34[0] = a5->var0.origin;
  v34[1] = size;
  var2 = a5->var2;
  v34[2] = a5->var1;
  v34[3] = var2;
  v25 = *(_OWORD *)&a7->var7.height;
  v33[8] = *(_OWORD *)&a7->var6;
  v33[9] = v25;
  v26 = *(_OWORD *)&a7->var8.size.height;
  v33[10] = *(_OWORD *)&a7->var8.origin.y;
  v33[11] = v26;
  v27 = *(_OWORD *)&a7->var3.c;
  v33[4] = *(_OWORD *)&a7->var3.a;
  v33[5] = v27;
  v28 = *(_OWORD *)&a7->var4;
  v33[6] = *(_OWORD *)&a7->var3.tx;
  v33[7] = v28;
  v29 = a7->var0.size;
  v33[0] = a7->var0.origin;
  v33[1] = v29;
  v30 = a7->var2;
  v33[2] = a7->var1;
  v33[3] = v30;
  objc_msgSend(v16, "optionsForAnimatingTileWithIdentifier:animationType:fromGeometry:fromUserData:toGeometry:toUserData:", v35, a4, v34, v15, v33, v14);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGSize size;
  CGSize var2;
  _OWORD v23[12];
  _OWORD v24[5];
  unint64_t v25;

  v12 = a7;
  -[AEDelegatingTransitionAnimationCoordinator _wrappedCoordinator](self, "_wrappedCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_OWORD *)&a5->var1[5];
  v24[2] = *(_OWORD *)&a5->var1[3];
  v24[3] = v14;
  v24[4] = *(_OWORD *)&a5->var1[7];
  v25 = a5->var1[9];
  v15 = *(_OWORD *)&a5->var1[1];
  v24[0] = *(_OWORD *)&a5->var0;
  v24[1] = v15;
  v16 = *(_OWORD *)&a6->var7.height;
  v23[8] = *(_OWORD *)&a6->var6;
  v23[9] = v16;
  v17 = *(_OWORD *)&a6->var8.size.height;
  v23[10] = *(_OWORD *)&a6->var8.origin.y;
  v23[11] = v17;
  v18 = *(_OWORD *)&a6->var3.c;
  v23[4] = *(_OWORD *)&a6->var3.a;
  v23[5] = v18;
  v19 = *(_OWORD *)&a6->var4;
  v23[6] = *(_OWORD *)&a6->var3.tx;
  v23[7] = v19;
  size = a6->var0.size;
  v23[0] = a6->var0.origin;
  v23[1] = size;
  var2 = a6->var2;
  v23[2] = a6->var1;
  v23[3] = var2;
  LOBYTE(a6) = objc_msgSend(v13, "getInitialGeometry:initialUserData:forAppearingTileWithIdentifier:toGeometry:toUserData:", a3, a4, v24, v23, v12);

  return (char)a6;
}

- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7
{
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGSize size;
  CGSize var2;
  _OWORD v23[12];
  _OWORD v24[5];
  unint64_t v25;

  v12 = a7;
  -[AEDelegatingTransitionAnimationCoordinator _wrappedCoordinator](self, "_wrappedCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_OWORD *)&a5->var1[5];
  v24[2] = *(_OWORD *)&a5->var1[3];
  v24[3] = v14;
  v24[4] = *(_OWORD *)&a5->var1[7];
  v25 = a5->var1[9];
  v15 = *(_OWORD *)&a5->var1[1];
  v24[0] = *(_OWORD *)&a5->var0;
  v24[1] = v15;
  v16 = *(_OWORD *)&a6->var7.height;
  v23[8] = *(_OWORD *)&a6->var6;
  v23[9] = v16;
  v17 = *(_OWORD *)&a6->var8.size.height;
  v23[10] = *(_OWORD *)&a6->var8.origin.y;
  v23[11] = v17;
  v18 = *(_OWORD *)&a6->var3.c;
  v23[4] = *(_OWORD *)&a6->var3.a;
  v23[5] = v18;
  v19 = *(_OWORD *)&a6->var4;
  v23[6] = *(_OWORD *)&a6->var3.tx;
  v23[7] = v19;
  size = a6->var0.size;
  v23[0] = a6->var0.origin;
  v23[1] = size;
  var2 = a6->var2;
  v23[2] = a6->var1;
  v23[3] = var2;
  LOBYTE(a6) = objc_msgSend(v13, "getFinalGeometry:finalUserData:forDisappearingTileWithIdentifier:fromGeometry:fromUserData:", a3, a4, v24, v23, v12);

  return (char)a6;
}

- (BOOL)useDoubleSidedAnimationForUpdatedTileWithIdentifier:(PXTileIdentifier *)a3 fromGeometry:(PXTileGeometry *)a4 fromUserData:(id)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  id v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGSize size;
  CGSize var2;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGSize v27;
  CGSize v28;
  char v29;
  int v30;
  _OWORD v32[12];
  _OWORD v33[12];
  _OWORD v34[5];
  unint64_t v35;

  v12 = a5;
  v13 = a7;
  if (!-[AEDelegatingTransitionAnimationCoordinator enableDoubleSidedAnimations](self, "enableDoubleSidedAnimations"))
    goto LABEL_6;
  -[AEDelegatingTransitionAnimationCoordinator _wrappedCoordinator](self, "_wrappedCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(_OWORD *)&a3->var1[5];
  v34[2] = *(_OWORD *)&a3->var1[3];
  v34[3] = v15;
  v34[4] = *(_OWORD *)&a3->var1[7];
  v35 = a3->var1[9];
  v16 = *(_OWORD *)&a3->var1[1];
  v34[0] = *(_OWORD *)&a3->var0;
  v34[1] = v16;
  v17 = *(_OWORD *)&a4->var7.height;
  v33[8] = *(_OWORD *)&a4->var6;
  v33[9] = v17;
  v18 = *(_OWORD *)&a4->var8.size.height;
  v33[10] = *(_OWORD *)&a4->var8.origin.y;
  v33[11] = v18;
  v19 = *(_OWORD *)&a4->var3.c;
  v33[4] = *(_OWORD *)&a4->var3.a;
  v33[5] = v19;
  v20 = *(_OWORD *)&a4->var4;
  v33[6] = *(_OWORD *)&a4->var3.tx;
  v33[7] = v20;
  size = a4->var0.size;
  v33[0] = a4->var0.origin;
  v33[1] = size;
  var2 = a4->var2;
  v33[2] = a4->var1;
  v33[3] = var2;
  v23 = *(_OWORD *)&a6->var7.height;
  v32[8] = *(_OWORD *)&a6->var6;
  v32[9] = v23;
  v24 = *(_OWORD *)&a6->var8.size.height;
  v32[10] = *(_OWORD *)&a6->var8.origin.y;
  v32[11] = v24;
  v25 = *(_OWORD *)&a6->var3.c;
  v32[4] = *(_OWORD *)&a6->var3.a;
  v32[5] = v25;
  v26 = *(_OWORD *)&a6->var4;
  v32[6] = *(_OWORD *)&a6->var3.tx;
  v32[7] = v26;
  v27 = a6->var0.size;
  v32[0] = a6->var0.origin;
  v32[1] = v27;
  v28 = a6->var2;
  v32[2] = a6->var1;
  v32[3] = v28;
  v29 = objc_msgSend(v14, "useDoubleSidedAnimationForUpdatedTileWithIdentifier:fromGeometry:fromUserData:toGeometry:toUserData:", v34, v33, v12, v32, v13);

  if ((v29 & 1) != 0)
  {
    LOBYTE(v30) = 1;
    goto LABEL_7;
  }
  if (a3->var0 - 3 > 2 || a3->var1[1] == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    LOBYTE(v30) = 0;
    goto LABEL_7;
  }
  LOBYTE(v30) = 0;
  if (a3->var1[0] == 1215219281 && v12 != v13)
    v30 = objc_msgSend(v12, "isEqual:", v13) ^ 1;
LABEL_7:

  return v30;
}

- (BOOL)enableDoubleSidedAnimations
{
  return self->_enableDoubleSidedAnimations;
}

- (void)setEnableDoubleSidedAnimations:(BOOL)a3
{
  self->_enableDoubleSidedAnimations = a3;
}

- (PXTileTransitionAnimationCoordinator)_wrappedCoordinator
{
  return self->__wrappedCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__wrappedCoordinator, 0);
}

@end
