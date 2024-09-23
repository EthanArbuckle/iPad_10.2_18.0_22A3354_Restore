@implementation HUMultiStateControlPanelConfiguration

- (HUControlPanelRule)rule
{
  return (HUControlPanelRule *)+[HUControlPanelClassRule ruleWithControlItemClass:](HUControlPanelClassRule, "ruleWithControlItemClass:", objc_opt_class());
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)setupControlsForCell:(id)a3 item:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HUMultiStateControlView *v21;
  void *v22;
  HUMultiStateControlView *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  HUMultiStateControlView *v44;
  id obj;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  v8 = v5;
  if (!v8)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;
  v11 = v8;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v7, objc_opt_class());

LABEL_7:
    v11 = 0;
  }
  v40 = v11;

  v14 = objc_opt_class();
  objc_msgSend(v6, "controlItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "anyObject");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v41 = v8;
  if (!v16)
  {
LABEL_14:
    v18 = 0;
    goto LABEL_15;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v16;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v14, objc_opt_class());

    goto LABEL_14;
  }
LABEL_15:

  v21 = objc_alloc_init(HUMultiStateControlView);
  v42 = v6;
  v22 = v6;
  v23 = v21;
  objc_msgSend(v22, "identifierForControlItem:", v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMultiStateControlView setIdentifier:](v23, "setIdentifier:", v24);

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v18, "possibleValueSet");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sortedValues");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v26;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v27)
  {
    v28 = v27;
    v46 = *(_QWORD *)v48;
    v29 = *MEMORY[0x1E0D30D18];
    v30 = *MEMORY[0x1E0D30C60];
    v43 = v18;
    v44 = v23;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v48 != v46)
          objc_enumerationMutation(obj);
        v32 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v18, "possibleValueSet");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "displayResultsForValue:", v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "objectForKeyedSubscript:", v29);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", v30);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = (void *)v36;
        if (v35)
        {
          -[HUMultiStateControlView addPossibleValue:withTitle:](v23, "addPossibleValue:withTitle:", v32, v35);
        }
        else if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v37, "imageIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          HUImageNamed(v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
            -[HUMultiStateControlView addPossibleValue:withImage:](v44, "addPossibleValue:withImage:", v32, v39);
          else
            NSLog(CFSTR("Multi-state control item %@ does not have an image for possible value %@!"), v43, v32);

          v18 = v43;
          v23 = v44;
        }
        else
        {
          NSLog(CFSTR("Multi-state control item %@ does not have a title or image for possible value %@!"), v18, v32);
        }

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v28);
  }

  objc_msgSend(v40, "setControlView:", v23);
}

@end
