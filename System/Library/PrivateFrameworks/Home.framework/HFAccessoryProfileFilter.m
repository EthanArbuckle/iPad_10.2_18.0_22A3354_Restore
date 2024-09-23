@implementation HFAccessoryProfileFilter

+ (id)filterProfiles:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HFAccessoryProfileFilter_filterProfiles_options___block_invoke;
  v10[3] = &unk_1EA7389C0;
  v11 = v6;
  v12 = a1;
  v7 = v6;
  objc_msgSend(a3, "na_filter:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __51__HFAccessoryProfileFilter_filterProfiles_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t (**v28)(_QWORD, _QWORD);
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  _QWORD v50[4];
  id v51;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v3, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "byAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_shouldIncludeObject:passingNullableFilterSet:", v5, v6))
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v3, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "category");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "categoryType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "byCategoryTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "_shouldIncludeObject:passingNullableFilterSet:", v10, v11))
    {
      v47 = v8;
      v12 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "byClasses");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __51__HFAccessoryProfileFilter_filterProfiles_options___block_invoke_2;
      v50[3] = &unk_1EA731238;
      v14 = v3;
      v51 = v14;
      v49 = v13;
      v15 = objc_msgSend(v13, "na_any:", v50);
      objc_msgSend(*(id *)(a1 + 32), "byClasses");
      v48 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "_shouldIncludeObjectPassingFilter:shouldApplyFilter:", v15, v48 != 0))
      {
        v16 = *(void **)(a1 + 40);
        objc_msgSend(v14, "accessory");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "_shouldIncludeObjectPassingFilter:shouldApplyFilter:", objc_msgSend(v46, "hf_effectiveIsFavorite"), objc_msgSend(*(id *)(a1 + 32), "byFavorites")))
        {
          v43 = *(void **)(a1 + 40);
          objc_msgSend(v14, "accessory");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "manufacturer");
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "byManufacturers");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = v43;
          v42 = (void *)v19;
          v44 = (void *)v18;
          v45 = v17;
          if (objc_msgSend(v20, "_shouldIncludeObject:passingNullableFilterSet:", v18))
          {
            v39 = *(void **)(a1 + 40);
            objc_msgSend(v14, "accessory");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "model");
            v22 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "byModels");
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = v39;
            v38 = (void *)v23;
            v40 = (void *)v22;
            v41 = v21;
            if (objc_msgSend(v24, "_shouldIncludeObject:passingNullableFilterSet:", v22))
            {
              v25 = *(void **)(a1 + 40);
              objc_msgSend(v14, "accessory");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "room");
              v26 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "byRooms");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = (void *)v26;
              if (objc_msgSend(v25, "_shouldIncludeObject:passingNullableFilterSet:", v26))
              {
                objc_msgSend(*(id *)(a1 + 32), "byFilter");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (v27)
                {
                  v34 = v27;
                  objc_msgSend(*(id *)(a1 + 32), "byFilter");
                  v28 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                  v29 = ((uint64_t (**)(_QWORD, id))v28)[2](v28, v14);

                  v27 = v34;
                }
                else
                {
                  v29 = 1;
                }
                v31 = (void *)v48;
                v30 = v49;
                v8 = v47;

              }
              else
              {
                v29 = 0;
                v31 = (void *)v48;
                v30 = v49;
                v8 = v47;
              }

            }
            else
            {
              v29 = 0;
              v31 = (void *)v48;
              v30 = v49;
              v8 = v47;
            }

          }
          else
          {
            v29 = 0;
            v31 = (void *)v48;
            v30 = v49;
            v8 = v47;
          }

          v32 = v46;
        }
        else
        {
          v29 = 0;
          v31 = (void *)v48;
          v30 = v49;
          v32 = v46;
          v8 = v47;
        }

      }
      else
      {
        v29 = 0;
        v31 = (void *)v48;
        v30 = v49;
        v8 = v47;
      }

    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

uint64_t __51__HFAccessoryProfileFilter_filterProfiles_options___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

+ (BOOL)_shouldIncludeObjectPassingFilter:(BOOL)a3 shouldApplyFilter:(BOOL)a4
{
  return !a4 || a3;
}

+ (BOOL)_shouldIncludeObject:(id)a3 passingNullableFilterSet:(id)a4
{
  if (a3)
    a3 = (id)objc_msgSend(a4, "containsObject:");
  return objc_msgSend(a1, "_shouldIncludeObjectPassingFilter:shouldApplyFilter:", a3, a4 != 0);
}

@end
