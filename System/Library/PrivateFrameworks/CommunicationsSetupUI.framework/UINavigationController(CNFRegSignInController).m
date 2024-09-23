@implementation UINavigationController(CNFRegSignInController)

- (id)signInControllerInHierarchy
{
  void *v1;
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "viewControllers", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v2 = v5;
          goto LABEL_11;
        }
      }
      v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

- (void)popToSigninControllerAnimated:()CNFRegSignInController
{
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(a1, "signInControllerInHierarchy");
  v5 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v5;
  if (v5)
    v6 = (id)objc_msgSend(a1, "popToViewController:animated:", v5, a3);
  else
    objc_msgSend(a1, "popRecursivelyToRootController");

}

@end
