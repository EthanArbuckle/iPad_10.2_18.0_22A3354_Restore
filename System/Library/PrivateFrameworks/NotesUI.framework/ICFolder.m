@implementation ICFolder

uint64_t __47__ICFolder_UI__foldersWithHashtagAsOnlyFilter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "smartFolderQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "tagSelectionWithManagedObjectContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "tagIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "standardizedContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  return v10;
}

void __42__ICFolder_UI__navigationBarIconWithSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  objc_msgSend((id)objc_opt_class(), "defaultNavigationBarIcon");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "drawInRect:blendMode:alpha:", 0, 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48), 1.0);
  objc_msgSend(*(id *)(a1 + 32), "navigationBarIconOverlaySystemImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithTintColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(double *)(a1 + 40);
  objc_msgSend(v4, "size");
  *(float *)&v6 = (v5 - v6) * 0.5;
  v7 = roundf(*(float *)&v6);
  v8 = *(double *)(a1 + 48);
  objc_msgSend(v4, "size");
  v10 = v8 - v9 + *(double *)(a1 + 48) / -5.0;
  v11 = roundf(v10);
  objc_msgSend(v4, "size");
  v13 = v12;
  objc_msgSend(v4, "size");
  objc_msgSend(v4, "drawInRect:blendMode:alpha:", 26, v7, v11, v13, v14, 1.0);

}

@end
