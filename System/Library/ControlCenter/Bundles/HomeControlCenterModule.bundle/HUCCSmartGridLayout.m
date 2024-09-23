@implementation HUCCSmartGridLayout

+ (id)layoutGeometry
{
  uint64_t v2;
  const char *v3;

  v2 = CCUIIsPortrait();
  return (id)objc_msgSend_layoutGeometryIsPortrait_(HUCCSmartGridLayout, v3, v2);
}

+ (id)layoutGeometryIsPortrait:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  _BOOL8 v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;

  v6 = objc_alloc_init(MEMORY[0x24BE4F488]);
  if (a3)
  {
    v7 = 1;
    objc_msgSend_setGridSize_(v6, v4, 2, 4);
  }
  else
  {
    objc_msgSend_currentDevice(MEMORY[0x24BDF69C8], v4, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_userInterfaceIdiom(v9, v10, v11);

    v7 = v12 == 1;
    if (v12 == 1)
      v14 = 4;
    else
      v14 = 2;
    if (v12 == 1)
      objc_msgSend_setGridSize_(v6, v13, 2, v14);
    else
      objc_msgSend_setGridSize_(v6, v13, 3, v14);
  }
  objc_msgSend_setIsPortrait_(v6, v8, v7);
  objc_msgSend_cellSize(HUCCSmartGridLayout, v15, v16);
  objc_msgSend_setCellSize_(v6, v17, v18);
  objc_msgSend_cellSpacing(HUCCSmartGridLayout, v19, v20);
  objc_msgSend_setCellSpacing_(v6, v21, v22);
  return v6;
}

+ (unint64_t)mosaicType
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend_currentDevice(MEMORY[0x24BDF69C8], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_userInterfaceIdiom(v3, v4, v5);

  if (v6 == 1)
    return 0;
  else
    return CCUIIsPortrait() ^ 1;
}

+ (id)layoutOptionsForViewSize:(CGSize)a3 andMosaicSize:(unint64_t)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  double v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[2];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_defaultOptionsForViewSize_(MEMORY[0x24BE4F468], a2, a4, a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend_serviceCellOptions(v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v8;
  objc_msgSend_sceneCellOptions(v5, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v11;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v12, (uint64_t)v63, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v59, v64, 16);
  if (v15)
  {
    v18 = v15;
    v19 = *(_QWORD *)v60;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v60 != v19)
          objc_enumerationMutation(v13);
        objc_msgSend_backgroundDisplayOptions(*(void **)(*((_QWORD *)&v59 + 1) + 8 * v20), v16, v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setDisplayStyle_(v21, v22, 3);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v59, v64, 16);
    }
    while (v18);
  }

  objc_msgSend_sceneCellOptions(v5, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_font(v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDescriptionFont_(v25, v29, (uint64_t)v28);

  objc_msgSend_setSceneCellOptions_(v5, v30, (uint64_t)v25);
  objc_msgSend_serviceCellOptions(v5, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v33;
  if (a4 == 1)
  {
    objc_msgSend_font(v33, v34, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fontWithSize_(v37, v38, v39, 11.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFont_(v36, v41, (uint64_t)v40);

    HUDefaultSizeForIconSize();
    objc_msgSend_setIconSize_(v36, v42, v43, v44);
    objc_msgSend_setLineSpacing_(v36, v45, v46, 0.0);
    objc_msgSend_setShowDescription_(v36, v47, 0);
    objc_msgSend_setIconToTitleSpacing_(v36, v48, v49, 4.0);
  }
  else
  {
    HUDefaultSizeForIconSize();
    objc_msgSend_setIconSize_(v36, v51, v52, v53);
    objc_msgSend_setCellInnerMargin_(v36, v54, v55, 16.0);
    objc_msgSend_setIconToTitleSpacing_(v36, v56, v57, 12.0);
  }
  objc_msgSend_setServiceCellOptions_(v5, v50, (uint64_t)v36);

  return v5;
}

@end
