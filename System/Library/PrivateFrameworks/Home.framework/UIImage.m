@implementation UIImage

void __45__UIImage_HFAdditions__hf_fetchImageFromURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D50];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "dataWithContentsOfURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", v6);
  HFLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 32);
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Successfully loaded image for URL : %@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(v5, "finishWithResult:", v7);
  }
  else
  {
    if (v9)
    {
      v11 = *(_QWORD *)(a1 + 32);
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Failed to load image for URL : %@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "na_genericError");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithError:", v12);

    v5 = (id)v12;
  }

}

@end
