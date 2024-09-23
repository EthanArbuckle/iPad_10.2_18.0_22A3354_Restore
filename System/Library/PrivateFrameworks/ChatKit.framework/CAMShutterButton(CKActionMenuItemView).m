@implementation CAMShutterButton(CKActionMenuItemView)

+ (uint64_t)actionMenuShutterButton
{
  void *v0;

  v0 = (void *)MEMORY[0x1E0D0D0F8];
  CAMShutterButtonSpecMake();
  return objc_msgSend(v0, "shutterButtonWithSpec:");
}

- (void)setEnabled:()CKActionMenuItemView animated:
{
  void *v5;
  void *v6;
  _QWORD v7[5];
  char v8;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CAMShutterButton_CKActionMenuItemView__setEnabled_animated___block_invoke;
  v7[3] = &unk_1E274CA88;
  v7[4] = a1;
  v8 = a3;
  v5 = _Block_copy(v7);
  v6 = v5;
  if (a4)
    +[CKActionMenuItem animate:completion:](CKActionMenuItem, "animate:completion:", v5, 0);
  else
    (*((void (**)(void *))v5 + 2))(v5);

}

- (uint64_t)setSelected:()CKActionMenuItemView animated:
{
  uint64_t result;
  uint64_t v8;

  result = objc_msgSend(a1, "mode");
  if ((result & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (a3)
      v8 = 5;
    else
      v8 = 1;
    return objc_msgSend(a1, "setMode:animated:", v8, a4);
  }
  return result;
}

@end
