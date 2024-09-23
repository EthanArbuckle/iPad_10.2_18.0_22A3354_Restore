@implementation MCCertificatePickerController

- (id)navigationTitle
{
  return MCUILocalizedString(CFSTR("CERTIFICATES"));
}

- (void)_setCellPropertiesOnSpecifier:(id)a3 forCertificate:(__SecCertificate *)a4
{
  __CFString *v5;
  void *v6;
  CFAbsoluteTime v7;
  CFDateRef v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = (__CFString *)SecCertificateCopySubjectSummary(a4);
  if (v5)
    objc_msgSend(v10, "setProperty:forKey:", v5, CFSTR("kMCCellTitleKey"));
  v6 = (void *)SecCertificateCopyIssuerSummary();
  if (v6)
    objc_msgSend(v10, "setProperty:forKey:", v6, CFSTR("kMCCellIssuerKey"));
  SecCertificateNotValidAfter();
  v8 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v7);
  v9 = v10;
  if (v8)
  {
    objc_msgSend(v10, "setProperty:forKey:", v8, CFSTR("kMCCellExpirationDateKey"));
    v9 = v10;
  }
  objc_msgSend(v9, "setProperty:forKey:", a4, CFSTR("kMCCertificateDetailsCertificateRefKey"));

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  const void *ValueAtIndex;
  CFTypeID v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  int v13;
  CFTypeRef v14;
  objc_class *v15;
  void *v16;
  int Count;
  CFIndex v18;
  uint64_t v19;
  __SecIdentity *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  objc_class *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CFTypeRef result;
  void *values[4];
  void *keys[5];

  keys[4] = *(void **)MEMORY[0x1E0C80C00];
  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "values");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    result = 0;
    if ((int)objc_msgSend(v5, "count") < 1)
    {
      v15 = 0;
      v16 = 0;
LABEL_33:
      v26 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v15;
      v27 = v15;

      v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
      return v4;
    }
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v5, 0);
    v7 = CFGetTypeID(ValueAtIndex);
    v29 = v3;
    if (v7 == CFDataGetTypeID())
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0x7FFFFFFFLL);
      v9 = (void *)*MEMORY[0x1E0CD7028];
      keys[0] = *(void **)MEMORY[0x1E0CD6C98];
      keys[1] = v9;
      v10 = (void *)*MEMORY[0x1E0CD6F30];
      keys[2] = *(void **)MEMORY[0x1E0CD6F28];
      keys[3] = v10;
      v11 = (void *)*MEMORY[0x1E0C9AE50];
      values[0] = *(void **)MEMORY[0x1E0CD6CB0];
      values[1] = v11;
      values[2] = v5;
      values[3] = v8;
      v12 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (SecItemCopyMatching(v12, &result))
      {
        if (result)
          CFRelease(result);
        result = 0;
      }
      CFRelease(v12);

      v13 = 0;
      v14 = result;
      if (!result)
      {
LABEL_29:
        v16 = 0;
        v15 = 0;
LABEL_30:
        if (result)
          CFRelease(result);
        v3 = v29;
        goto LABEL_33;
      }
    }
    else if (v7 == SecIdentityGetTypeID())
    {
      v14 = v5;
      v13 = 0;
      result = v14;
      if (!v14)
        goto LABEL_29;
    }
    else
    {
      if (v7 != SecCertificateGetTypeID())
        goto LABEL_29;
      v14 = v5;
      result = v14;
      v13 = 1;
      if (!v14)
        goto LABEL_29;
    }
    Count = CFArrayGetCount((CFArrayRef)v14);
    if (Count < 1)
      goto LABEL_29;
    v18 = 0;
    v15 = 0;
    v16 = 0;
    v31 = *MEMORY[0x1E0D80780];
    v19 = Count;
    v30 = *MEMORY[0x1E0D80938];
    while (1)
    {
      keys[0] = 0;
      v20 = (__SecIdentity *)CFArrayGetValueAtIndex((CFArrayRef)result, v18);
      if (v13)
        break;
      SecIdentityCopyCertificate(v20, (SecCertificateRef *)keys);
      if (keys[0])
        goto LABEL_22;
LABEL_25:
      if (v19 == ++v18)
        goto LABEL_30;
    }
    keys[0] = (void *)CFRetain(v20);
    if (!keys[0])
      goto LABEL_25;
LABEL_22:
    if (v15)
    {
      if (v16)
      {
LABEL_24:
        objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, objc_opt_class(), 3, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setProperty:forKey:", objc_opt_class(), v31);
        objc_msgSend(v21, "setProperty:forKey:", v16, v30);
        -[MCCertificatePickerController _setCellPropertiesOnSpecifier:forCertificate:](self, "_setCellPropertiesOnSpecifier:forCertificate:", v21, keys[0]);
        v22 = (void *)MEMORY[0x1E0C99D20];
        objc_msgSend(v5, "objectAtIndex:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "arrayWithObject:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setValues:", v24);

        -[objc_class addObject:](v15, "addObject:", v21);
        CFRelease(keys[0]);

        goto LABEL_25;
      }
    }
    else
    {
      v15 = (objc_class *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (v16)
        goto LABEL_24;
    }
    v25 = objc_alloc(MEMORY[0x1E0CB37E8]);
    +[MCCertificatePickerCell defaultCellHeight](MCCertificatePickerCell, "defaultCellHeight");
    v16 = (void *)objc_msgSend(v25, "initWithFloat:");
    goto LABEL_24;
  }
  return v4;
}

- (void)setRowToSelect
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  int *v7;
  id WeakRetained;
  char v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (int)*MEMORY[0x1E0D805A0];
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2) = (Class)0x7FFFFFFFFFFFFFFFLL;
  v3 = (int)*MEMORY[0x1E0D80628];
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + v3);
  v5 = (int *)MEMORY[0x1E0D805C0];
  if (*(_QWORD *)(v4 + (int)*MEMORY[0x1E0D805C0]))
  {
    v7 = (int *)MEMORY[0x1E0D805D0];
    WeakRetained = objc_loadWeakRetained((id *)(v4 + (int)*MEMORY[0x1E0D805D0]));
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)(*(char **)((char *)&self->super.super.super.super.super.super.isa + v3) + *v7));
      objc_msgSend(v10, *(SEL *)(*(char **)((char *)&self->super.super.super.super.super.super.isa + v3) + *v5));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        -[MCCertificatePickerController specifiers](self, "specifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v13)
        {
          v14 = v13;
          v15 = 0;
          v16 = *(_QWORD *)v22;
          while (2)
          {
            v17 = 0;
            v20 = v15 + v14;
            do
            {
              if (*(_QWORD *)v22 != v16)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17), "values");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "lastObject");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v11 == v19)
              {
                *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2) = (Class)(v15 + v17);
                goto LABEL_14;
              }
              ++v17;
            }
            while (v14 != v17);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
            v15 = v20;
            if (v14)
              continue;
            break;
          }
        }
LABEL_14:

      }
    }
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MCCertificatePickerController;
  -[PSListItemsController tableView:cellForRowAtIndexPath:](&v14, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    -[MCCertificatePickerController specifierAtIndex:](self, "specifierAtIndex:", -[MCCertificatePickerController indexForIndexPath:](self, "indexForIndexPath:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertyForKey:", CFSTR("kMCCellTitleKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v10);

    objc_msgSend(v9, "propertyForKey:", CFSTR("kMCCellIssuerKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIssuer:", v11);

    objc_msgSend(v9, "propertyForKey:", CFSTR("kMCCellExpirationDateKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExpirationDate:", v12);

  }
  return v7;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5;
  id WeakRetained;
  char *v7;

  -[MCCertificatePickerController specifierAtIndex:](self, "specifierAtIndex:", -[MCCertificatePickerController indexForIndexPath:](self, "indexForIndexPath:", a4));
  v7 = (char *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(*(Class *)&v7[*MEMORY[0x1E0D805B8]]);
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                              + (int)*MEMORY[0x1E0D80620]));
    objc_msgSend(v5, "setRootController:", WeakRetained);

    objc_msgSend(v5, "setParentController:", self);
    objc_msgSend(v5, "setSpecifier:", v7);
    -[MCCertificatePickerController showController:](self, "showController:", v5);
  }

}

@end
