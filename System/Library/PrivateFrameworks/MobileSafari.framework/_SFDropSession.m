@implementation _SFDropSession

+ (BOOL)dropSession:(id)a3 containsItemsMatching:(void *)a4 allowedTypeIdentifiers:(id)a5 allowedClasses:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  char v16;
  id v17;
  uint64_t (**v18)(_QWORD);
  _QWORD aBlock[4];
  id v21;
  id v22;
  _QWORD v23[5];

  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v9, "localDragSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  if (!a4)
    goto LABEL_5;
  if (!v12)
    goto LABEL_5;
  objc_msgSend(v9, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = __90___SFDropSession_dropSession_containsItemsMatching_allowedTypeIdentifiers_allowedClasses___block_invoke;
  v23[3] = &__block_descriptor_40_e20_B16__0__UIDragItem_8l;
  v23[4] = a4;
  v15 = objc_msgSend(v14, "safari_containsObjectPassingTest:", v23);

  if ((v15 & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
LABEL_5:
    aBlock[0] = v13;
    aBlock[1] = 3221225472;
    aBlock[2] = __90___SFDropSession_dropSession_containsItemsMatching_allowedTypeIdentifiers_allowedClasses___block_invoke_2;
    aBlock[3] = &unk_1E21E3308;
    v21 = v11;
    v17 = v9;
    v22 = v17;
    v18 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
    if (objc_msgSend(v10, "count") && (objc_msgSend(v17, "hasItemsConformingToTypeIdentifiers:", v10) & 1) != 0)
      v16 = 1;
    else
      v16 = v18[2](v18);

  }
  return v16;
}

+ (void)dropSession:(id)a3 loadObjectsUsingLocalObjectLoader:(void *)a4 objectLoader:(void *)a5 completionHandler:(id)a6
{
  void *v9;
  id v10;
  id v11;

  v9 = (void *)MEMORY[0x1E0DC3758];
  v10 = a6;
  objc_msgSend(a3, "items");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_sf_loadObjectsFromDragItems:usingLocalObjectLoader:objectLoader:completionHandler:", v11, a4, a5, v10);

}

@end
