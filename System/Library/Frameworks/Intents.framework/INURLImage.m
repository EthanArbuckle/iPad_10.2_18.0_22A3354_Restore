@implementation INURLImage

void __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v5 = a3;
    +[INImage imageWithImageData:](INImage, "imageWithImageData:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_2;
    v12[3] = &unk_1E228FDE8;
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v6, "_retrieveImageDataWithReply:", v12);

    v7 = v13;
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB3388];
    v15[0] = a3;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = a3;
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6003, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *, double, double))(v8 + 16))(v8, 0, 0, v7, 0.0, 0.0);

  }
}

uint64_t __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_113(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "stopAccessingSecurityScopedResource");
  return result;
}

void __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_115(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "_imageData");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_imageSize");
  v8 = v7;
  v10 = v9;

  (*(void (**)(uint64_t, id, _QWORD, id, double, double))(v4 + 16))(v4, v11, 0, v5, v8, v10);
}

void __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_119(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  if (!v10)
  {
    v13 = 0;
    if (v7)
      goto LABEL_19;
LABEL_15:
    v20 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v21 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      v50 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]_block_invoke";
      v51 = 2112;
      v52 = v21;
      v53 = 2112;
      v54 = v10;
      v55 = 2112;
      v56 = v9;
      _os_log_impl(&dword_18BEBC000, v20, OS_LOG_TYPE_INFO, "%s Image %@ failed to load with response %@, error %@", buf, 0x2Au);
    }
    v22 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6003, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *, double, double))(v22 + 16))(v22, 0, 0, v23, 0.0, 0.0);
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (!v7)
  {
    v13 = v12;
    goto LABEL_15;
  }
  if (v12)
  {
    if (objc_msgSend(v12, "statusCode") < 200 || (v13 = v10, objc_msgSend(v12, "statusCode") >= 300))
    {
      v14 = v7;
      v15 = v12;
      objc_msgSend(MEMORY[0x1E0CB3940], "if_stringWithData:", v14);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = 0x1E0C99000;
      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v14, 0, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("error"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v46 = v18;
          objc_msgSend(MEMORY[0x1E0CB3940], "if_stringWithData:", v19);
          v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v17 = 0x1E0C99000;
LABEL_40:
            v38 = (void *)MEMORY[0x1E0CB3680];
            v39 = objc_msgSend(v15, "statusCode");
            if (v39)
              v40 = v39;
            else
              v40 = 400;
            objc_msgSend(v38, "localizedStringForStatusCode:", v40);
            v16 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_44;
          }
          v46 = v18;
          v45 = v19;
          objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("message"));
          v16 = (id)objc_claimAutoreleasedReturnValue();
          if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {

            objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("description"));
            v35 = objc_claimAutoreleasedReturnValue();
            if (v35)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v36 = (void *)v35;
              else
                v36 = 0;
            }
            else
            {
              v36 = 0;
            }
            v37 = (void *)v35;
            v16 = v36;

          }
        }

        v17 = 0x1E0C99000uLL;
        if (!v16)
          goto LABEL_40;
      }
LABEL_44:

      v41 = *(_QWORD *)(a1 + 56);
      v42 = (void *)MEMORY[0x1E0CB35C8];
      v47 = *MEMORY[0x1E0CB2D50];
      v48 = v16;
      objc_msgSend(*(id *)(v17 + 3456), "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6003, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *, double, double))(v41 + 16))(v41, 0, 0, v44, 0.0, 0.0);

      v13 = v10;
      goto LABEL_45;
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "_imageSize");
  if (v25 <= 0.0 || (v26 = v24, v24 <= 0.0))
  {
    +[INImage imageWithImageData:](INImage, "imageWithImageData:", v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]_block_invoke";
      v51 = 2112;
      v52 = v23;
      _os_log_impl(&dword_18BEBC000, v34, OS_LOG_TYPE_INFO, "%s Loading image size for image %@", buf, 0x16u);
    }
    objc_msgSend(v23, "_loadImageDataAndSizeWithHelper:accessSpecifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
LABEL_27:

    goto LABEL_45;
  }
  v27 = v25;
  v28 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v29 = *(void **)(a1 + 32);
    v30 = (void *)MEMORY[0x1E0CB37E8];
    v31 = v28;
    objc_msgSend(v30, "numberWithDouble:", v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v50 = "-[_INURLImage(INPortableImageLoader) _loadImageDataAndSizeWithHelper:accessSpecifier:completion:]_block_invoke";
    v51 = 2112;
    v52 = v29;
    v53 = 2112;
    v54 = v32;
    v55 = 2112;
    v56 = v33;
    _os_log_impl(&dword_18BEBC000, v31, OS_LOG_TYPE_INFO, "%s Image %@ came with size {%@, %@}, preserving that", buf, 0x2Au);

  }
  (*(void (**)(double, double))(*(_QWORD *)(a1 + 56) + 16))(v26, v27);
LABEL_45:

}

void __97___INURLImage_INPortableImageLoader___loadImageDataAndSizeWithHelper_accessSpecifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "_imageData");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_imageSize");
  v8 = v7;
  v10 = v9;

  (*(void (**)(uint64_t, id, _QWORD, id, double, double))(v4 + 16))(v4, v11, 0, v5, v8, v10);
}

@end
