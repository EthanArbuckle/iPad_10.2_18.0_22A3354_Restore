@implementation UIResponder(_NTKResponderFix)

- (uint64_t)_ntk_becomeFirstResponder
{
  void (**v2)(void);
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v9 = objc_msgSend(a1, "becomeFirstResponder");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__UIResponder__NTKResponderFix___ntk_becomeFirstResponder__block_invoke;
  v5[3] = &unk_1E6BD1498;
  v5[4] = a1;
  v5[5] = &v6;
  v2 = (void (**)(void))_Block_copy(v5);
  v2[2]();
  ((void (*)(void (**)(void)))v2[2])(v2);
  ((void (*)(void (**)(void)))v2[2])(v2);
  v3 = *((unsigned __int8 *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

@end
