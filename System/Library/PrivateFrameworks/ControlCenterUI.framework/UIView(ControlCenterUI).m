@implementation UIView(ControlCenterUI)

- (uint64_t)ccui_setFramePreservingTransform:()ControlCenterUI
{
  __int128 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "transform");
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v12 = *MEMORY[0x1E0C9BAA8];
  v13 = v10;
  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(a1, "setTransform:", &v12);
  objc_msgSend(a1, "setFrame:", a2, a3, a4, a5);
  v12 = v15;
  v13 = v16;
  v14 = v17;
  return objc_msgSend(a1, "setTransform:", &v12);
}

@end
