@implementation INImage

void __49__INImage_IntentsUI__fetchUIImageWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7)
  {
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithData:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  }
  else
  {
    if (v9)
    {
      v13 = *MEMORY[0x1E0CBD670];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      {
        v14 = 136315394;
        v15 = "-[INImage(IntentsUI) fetchUIImageWithCompletion:]_block_invoke";
        v16 = 2112;
        v17 = v10;
        _os_log_error_impl(&dword_1DC055000, v13, OS_LOG_TYPE_ERROR, "%s UIImage loading failed with error: %@", (uint8_t *)&v14, 0x16u);
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
