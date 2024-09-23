@implementation ICOCRGenerator

+ (id)ocrStringFromImage:(CGImage *)a3 title:(id *)a4 languages:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = objc_alloc_init((Class)getVNSessionClass());
  v10 = (void *)objc_msgSend(objc_alloc((Class)getVNImageRequestHandlerClass()), "initWithCGImage:options:session:", a3, MEMORY[0x1E0C9AA70], v9);
  objc_msgSend(a1, "ocrStringFromImageRequestHandler:title:languages:session:", v10, a4, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)ocrStringFromImageURL:(id)a3 title:(id *)a4 languages:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init((Class)getVNSessionClass());
  v11 = (void *)objc_msgSend(objc_alloc((Class)getVNImageRequestHandlerClass()), "initWithURL:options:session:", v9, MEMORY[0x1E0C9AA70], v10);

  objc_msgSend(a1, "ocrStringFromImageRequestHandler:title:languages:session:", v11, a4, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)ocrStringFromImageRequestHandler:(id)a3 title:(id *)a4 languages:(id)a5 session:(id)a6
{
  void *v8;
  objc_class *v9;
  void *v10;
  id v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  float v19;
  void *v20;
  void *v22;
  void *v23;
  __CFString *v24;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id obj;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v29 = a5;
  v26 = a6;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2050000000;
  v8 = (void *)getVNRecognizeTextRequestClass_softClass;
  v49 = getVNRecognizeTextRequestClass_softClass;
  if (!getVNRecognizeTextRequestClass_softClass)
  {
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __getVNRecognizeTextRequestClass_block_invoke;
    v45[3] = &unk_1E76C77A8;
    v45[4] = &v46;
    __getVNRecognizeTextRequestClass_block_invoke((uint64_t)v45);
    v8 = (void *)v47[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v46, 8);
  v31 = objc_alloc_init(v9);
  objc_msgSend(v31, "setRecognitionLanguages:", v29);
  v52[0] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "performRequests:error:", v10, 0);

  objc_msgSend(v31, "results");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "count"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v30;
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v35)
    {
      v34 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v42 != v34)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v36, "topCandidates:", 3, v26);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
          if (v14)
          {
            v15 = 0;
            v16 = *(_QWORD *)v38;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v38 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
                objc_msgSend(v18, "confidence");
                if (v19 >= 0.5)
                {
                  objc_msgSend(v11, "appendString:", CFSTR("\n"));
                  if ((v15 & 1) != 0)
                    objc_msgSend(v11, "appendString:", CFSTR("\t"));
                  objc_msgSend(v18, "string");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "appendString:", v20);

                  v15 = 1;
                }
              }
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
            }
            while (v14);
          }
          if (objc_msgSend(v36, "isTitle"))
          {
            if (objc_msgSend(v13, "count") && a4 != 0)
            {
              objc_msgSend(v13, "firstObject");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "string");
              *a4 = (id)objc_claimAutoreleasedReturnValue();

            }
          }

        }
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v35);
    }

    v23 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v23, "ic_trimmedString");
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = 0;
  }
  if (!-[__CFString length](v24, "length", v26))
  {

    v24 = CFSTR(" ");
  }
  objc_msgSend(v27, "releaseCachedResources");

  return v24;
}

@end
