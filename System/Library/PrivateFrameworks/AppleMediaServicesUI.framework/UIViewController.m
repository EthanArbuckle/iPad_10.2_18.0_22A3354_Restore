@implementation UIViewController

void __102__UIViewController_AppleMediaServices__ams_dismissViewControllerAnimated_includePresented_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 48);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __102__UIViewController_AppleMediaServices__ams_dismissViewControllerAnimated_includePresented_completion___block_invoke_2;
  v6[3] = &unk_24CB50C30;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v5, "ams_dismissViewControllerAnimated:completion:", v4, v6);

}

_QWORD *__102__UIViewController_AppleMediaServices__ams_dismissViewControllerAnimated_includePresented_completion___block_invoke_2(_QWORD *result)
{
  if (result[4] == result[5])
    return (_QWORD *)(*(uint64_t (**)(void))(result[6] + 16))();
  return result;
}

uint64_t __108__UIViewController_AppleMediaServices__ams_transitionFromViewController_toViewController_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
