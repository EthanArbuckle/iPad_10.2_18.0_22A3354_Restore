@implementation UINavigationController(MFUtilities)

- (id)mf_viewControllerOfClass:()MFUtilities startFromTopOfStack:
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0;
  objc_msgSend(a1, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a4)
    v8 = 2;
  else
    v8 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__UINavigationController_MFUtilities__mf_viewControllerOfClass_startFromTopOfStack___block_invoke;
  v11[3] = &unk_1E5A69EB8;
  v11[4] = &v12;
  v11[5] = a3;
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", v8, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

@end
