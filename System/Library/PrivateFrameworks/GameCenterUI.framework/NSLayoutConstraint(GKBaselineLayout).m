@implementation NSLayoutConstraint(GKBaselineLayout)

+ (id)_gkBaselineConstraintsForViewsFontsLeadings:()GKBaselineLayout superview:options:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[4];
  _QWORD v32[5];
  id v33;

  v7 = a3;
  v8 = a4;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__10;
  v32[4] = __Block_byref_object_dispose__10;
  v33 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__10;
  v29[4] = __Block_byref_object_dispose__10;
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __102__NSLayoutConstraint_GKBaselineLayout___gkBaselineConstraintsForViewsFontsLeadings_superview_options___block_invoke;
  v23[3] = &unk_1E59C82F0;
  v26 = v31;
  v27 = v32;
  v12 = v9;
  v24 = v12;
  v28 = v29;
  v13 = v10;
  v25 = v13;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v23);
  objc_msgSend(v12, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 3, 0, v14, 3, 1.0, 0.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 4, 0, v15, 4, 1.0, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v16);
  objc_msgSend(v13, "addObject:", v17);
  if ((a5 & 2) != 0)
  {
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __102__NSLayoutConstraint_GKBaselineLayout___gkBaselineConstraintsForViewsFontsLeadings_superview_options___block_invoke_2;
    v20[3] = &unk_1E59C6B90;
    v21 = v8;
    v22 = v13;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v20);

  }
  v18 = v13;

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v32, 8);

  return v18;
}

@end
