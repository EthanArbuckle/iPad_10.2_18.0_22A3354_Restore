@implementation HKPickerViewTitleMeasurer

+ (id)_pickerTitleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 23.5);
}

+ (double)pickerView:(id)a3 maxWidthForComponent:(int64_t)a4
{
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "delegate");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = 0.0;
  if (v8)
  {
    v10 = (void *)v8;
    objc_msgSend(v7, "dataSource");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v7, "dataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "numberOfComponentsInPickerView:", v7);

      if (v14 > a4)
      {
        objc_msgSend(v7, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_respondsToSelector();

        objc_msgSend(v7, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_opt_respondsToSelector();

        objc_msgSend(v7, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_opt_respondsToSelector();

        if ((v16 & 1) == 0 || (v18 & 1) != 0 || (v20 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKPickerViewTitleMeasurer.m"), 36, CFSTR("Measurement of views and attributed titles are unsupported."));

        }
        objc_msgSend(v7, "dataSource");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "pickerView:numberOfRowsInComponent:", v7, a4);

        if (v22 >= 1)
        {
          v23 = 0;
          v24 = *MEMORY[0x1E0DC1138];
          do
          {
            objc_msgSend(v7, "delegate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "pickerView:titleForRow:forComponent:", v7, v23, a4);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v33 = v24;
            objc_msgSend(a1, "_pickerTitleFont");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v34[0] = v27;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "sizeWithAttributes:", v28);
            v30 = v29 + 20.0;

            if (v9 < (double)(uint64_t)v30)
              v9 = (double)(uint64_t)v30;

            ++v23;
          }
          while (v22 != v23);
        }
      }
    }
    else
    {

    }
  }

  return v9;
}

@end
