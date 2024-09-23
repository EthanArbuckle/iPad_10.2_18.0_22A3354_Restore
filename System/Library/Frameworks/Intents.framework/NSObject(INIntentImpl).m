@implementation NSObject(INIntentImpl)

+ (uint64_t)intents_widgetPlistRepresentableInDict:()INIntentImpl key:error:
{
  return objc_msgSend(a3, "_intents_widgetPlistRepresentableForKey:ofClass:error:", a4, a1);
}

+ (id)intents_arrayOfWidgetPlistRepresentableInDict:()INIntentImpl key:error:resultTransformer:
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "intents_safeObjectForKey:ofType:", v11, objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v30 = a5;
    v32 = v11;
    v33 = v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v31 = v13;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v37;
LABEL_4:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v35 = 0;
          objc_msgSend(a1, "makeFromWidgetPlistableRepresentation:error:", v19, &v35);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v35;
          if (v21)
          {
            v26 = v21;
            if (v30)
              *v30 = objc_retainAutorelease(v21);

LABEL_22:
            v11 = v32;
            v10 = v33;
            v13 = v31;
            v27 = v34;

            v28 = 0;
            goto LABEL_23;
          }
          if (v12)
            v12[2](v12, v20);
          objc_msgSend(v34, "addObject:", v20);

        }
        else
        {
          v22 = (void *)MEMORY[0x1E0CB3940];
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "stringWithFormat:", CFSTR("Unable to decode %@; expected a dictionary form but found %@"),
            v24,
            v19);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          INIntentError(8001, v25, 0);
          v26 = (id)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            if (v30)
            {
              v26 = objc_retainAutorelease(v26);
              *v30 = v26;
            }
            goto LABEL_22;
          }
        }
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          if (v16)
            goto LABEL_4;
          break;
        }
      }
    }

    v27 = v34;
    v28 = (void *)objc_msgSend(v34, "copy");
    v11 = v32;
    v10 = v33;
    v13 = v31;
LABEL_23:

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

@end
