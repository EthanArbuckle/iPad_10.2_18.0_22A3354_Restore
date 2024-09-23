@implementation ManagedTableViewCell

- (ManagedTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ManagedTableViewCell;
  return -[ManagedTableViewCell initWithStyle:reuseIdentifier:](&v5, sel_initWithStyle_reuseIdentifier_, a3, a4);
}

- (void)prepareForReuse
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F4868 <= 800)
  {
    if (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u))
    {
      v4 = (void *)objc_msgSend_currentIndexPath(self, a2, v2);
      objc_msgSend_section(v4, v5, v6);
      v9 = (void *)objc_msgSend_currentIndexPath(self, v7, v8);
      objc_msgSend_row(v9, v10, v11);
      sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell prepareForReuse]", 800, (uint64_t)"cell %@ section %d row %d\n", v12, v13, v14, v15, (uint64_t)self);
    }
    if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
    {
      v16 = (void *)objc_msgSend_parentTableManager(self, a2, v2);
      v19 = (void *)objc_msgSend_managedTableView(v16, v17, v18);
      v22 = objc_msgSend_visibleCells(v19, v20, v21);
      sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell prepareForReuse]", 800, (uint64_t)"visible cells %@\n", v23, v24, v25, v26, v22);
    }
  }
  objc_msgSend_setTag_(self, a2, 0);
  self->_cellXEdgeInset = 0.0;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v29 = (void *)objc_msgSend_cellDict(self, v27, v28);
  v31 = (void *)objc_msgSend_objectForKey_(v29, v30, (uint64_t)CFSTR("items"));
  v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v50, v54, 16);
  if (v33)
  {
    v35 = v33;
    v36 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v51 != v36)
          objc_enumerationMutation(v31);
        v38 = (void *)objc_msgSend_objectForKey_(*(void **)(*((_QWORD *)&v50 + 1) + 8 * i), v34, (uint64_t)CFSTR("cachedView"));
        v41 = objc_msgSend_superview(v38, v39, v40);
        if (v41 == objc_msgSend_contentView(self, v42, v43))
        {
          if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
            sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell prepareForReuse]", 800, (uint64_t)"removing view %@ from superview\n", v45, v46, v47, v48, (uint64_t)v38);
          objc_msgSend_removeFromSuperview(v38, v34, v44);
        }
      }
      v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v50, v54, 16);
    }
    while (v35);
  }
  v49.receiver = self;
  v49.super_class = (Class)ManagedTableViewCell;
  -[ManagedTableViewCell prepareForReuse](&v49, sel_prepareForReuse);
}

- (void)dealloc
{
  objc_super v3;

  self->_cellDict = 0;
  self->_currentIndexPath = 0;
  v3.receiver = self;
  v3.super_class = (Class)ManagedTableViewCell;
  -[ManagedTableViewCell dealloc](&v3, sel_dealloc);
}

- (void)setCellDict:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;

  if (self->_cellDict != a3)
  {
    v5 = a3;

    self->_cellDict = (NSMutableDictionary *)a3;
    if (a3)
      objc_msgSend_setNeedsLayout(self, v6, v7);
  }
}

- (double)edgeInsetValue:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  float v6;

  v3 = (void *)objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("edgeInset"));
  if (!v3)
    return 10.0;
  objc_msgSend_floatValue(v3, v4, v5);
  return v6;
}

- (double)horizontalSpacingForView:(id)a3 withItem:(id)a4
{
  const char *v6;
  double v7;
  double result;

  objc_msgSend_frame(a3, a2, (uint64_t)a3);
  if (v7 == 0.0)
    return 0.0;
  objc_msgSend_edgeInsetValue_(self, v6, (uint64_t)a4);
  return result;
}

- (double)verticalSpacingForView:(id)a3 withItem:(id)a4
{
  const char *v5;
  double result;
  double v7;
  void *v8;
  const char *v9;
  int isEqualToString;

  objc_msgSend_frame(a3, a2, (uint64_t)a3);
  result = 0.0;
  if (v7 > 0.0)
  {
    v8 = (void *)objc_msgSend_valueForKey_(a4, v5, (uint64_t)CFSTR("itemType"), 0.0);
    isEqualToString = objc_msgSend_isEqualToString_(v8, v9, (uint64_t)CFSTR("labelView"));
    result = 5.0;
    if (isEqualToString)
      return 2.0;
  }
  return result;
}

- (double)verticalInset
{
  uint64_t v2;
  const char *v4;
  double result;

  if (sub_21A731938((uint64_t)self, a2, v2))
    return 12.0;
  objc_msgSend_edgeInsetValue_(self, v4, 0);
  return result;
}

- (double)leftInsetForView:(id)a3 withItem:(id)a4
{
  const char *v6;
  double result;

  if (sub_21A731938((uint64_t)self, a2, (uint64_t)a3))
    return 15.0;
  objc_msgSend_edgeInsetValue_(self, v6, (uint64_t)a4);
  return result;
}

- (double)rightInsetForView:(id)a3 withItem:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double result;
  double v14;

  if (sub_21A731938((uint64_t)self, a2, (uint64_t)a3))
  {
    if (!objc_msgSend_objectForKey_(a4, v7, (uint64_t)CFSTR("edgeInset")))
    {
      v10 = (void *)objc_msgSend_cellDict(self, v7, v9);
      v12 = objc_msgSend_valueForKey_(v10, v11, (uint64_t)CFSTR("accessory"));
      result = 0.0;
      if (!v12)
        return 15.0;
      return result;
    }
LABEL_8:
    objc_msgSend_edgeInsetValue_(self, v7, (uint64_t)a4);
    return result;
  }
  if (!a3)
    goto LABEL_8;
  objc_msgSend_frame(a3, v7, v8);
  result = 0.0;
  if (v14 > 0.0)
    goto LABEL_8;
  return result;
}

- (double)usableContentWidthForItem:(id)a3 withVerticalNeighborView:(id)a4
{
  double width;
  double v8;
  double v9;
  const char *v10;
  uint64_t isEqualToString;
  const char *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  double v20;
  double v21;

  width = self->_modifiedContentViewFrame.size.width;
  if (a3)
  {
    objc_msgSend_rightInsetForView_withItem_(self, a2, 0, a3);
    v9 = v8;
    isEqualToString = objc_msgSend_objectForKey_(a3, v10, (uint64_t)CFSTR("position"));
    if (!a4)
      goto LABEL_9;
  }
  else
  {
    v14 = sub_21A731938((uint64_t)self, a2, 0);
    isEqualToString = 0;
    if (v14)
      v9 = 15.0;
    else
      v9 = 10.0;
    if (!a4)
      goto LABEL_9;
  }
  isEqualToString = objc_msgSend_isEqualToString_((void *)isEqualToString, v12, (uint64_t)CFSTR("bottom"));
  if ((isEqualToString & 1) == 0)
  {
    objc_msgSend_frame(a4, v12, v13);
    v20 = v9 + v21;
    return width - v20;
  }
LABEL_9:
  if (sub_21A731938(isEqualToString, v12, v13))
  {
    width = width - v9;
    v17 = (void *)objc_msgSend_cellDict(self, v15, v16);
    v19 = objc_msgSend_valueForKey_(v17, v18, (uint64_t)CFSTR("accessory"));
    v20 = 0.0;
    if (!v19)
      v20 = v9;
    return width - v20;
  }
  return width + v9 * -2.0;
}

- (double)usableContentWidth
{
  double result;

  objc_msgSend_usableContentWidthForItem_withVerticalNeighborView_(self, a2, 0, 0);
  return result;
}

- (void)calculatePositionForView:(id)a3 forItem:(id)a4 atItemIndex:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  double v21;
  double forcedRightmostEditTextInset;
  double v23;
  double y;
  double v25;
  double width;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __CFString *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  char isEqualToString;
  const __CFString *v55;
  char v56;
  char v57;
  char v58;
  char v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  double v67;
  float v68;
  float v69;
  double v70;
  float v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  double v78;
  const char *v80;
  uint64_t v81;
  double v82;
  double v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  float v91;
  double v92;
  double v93;
  double v94;
  float v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  double v99;
  float v100;
  double v101;
  double v102;
  double v103;
  float v104;
  double v105;
  int v106;
  double v107;
  uint64_t v108;
  double v109;
  CGRect v110;

  if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell calculatePositionForView:forItem:atItemIndex:]", 800, (uint64_t)"\n", a5, v5, v6, v7, v108);
  v11 = (void *)objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("neighbor"));
  v13 = objc_msgSend_edgeInsetValue_(self, v12, (uint64_t)a4);
  v109 = v16;
  if (v11)
  {
    v17 = (void *)objc_msgSend_objectForKey_(v11, v14, (uint64_t)CFSTR("cachedView"));
    objc_msgSend_frame(v17, v18, v19);
    forcedRightmostEditTextInset = v21;
    y = v23;
    width = v25;
    v28 = v27;
  }
  else
  {
    if (sub_21A731938(v13, v14, v15))
    {
      y = self->_modifiedContentViewFrame.origin.y;
      objc_msgSend_usableContentWidth(self, v29, v30);
      width = v31;
      forcedRightmostEditTextInset = 15.0;
    }
    else
    {
      forcedRightmostEditTextInset = 10.0;
      v110 = CGRectInset(self->_modifiedContentViewFrame, 10.0, 0.0);
      y = v110.origin.y;
      width = v110.size.width;
    }
    v17 = 0;
    v28 = 44.0;
  }
  v32 = objc_msgSend_objectForKey_(a4, v20, (uint64_t)CFSTR("position"));
  if (v32)
    v39 = (__CFString *)v32;
  else
    v39 = CFSTR("left");
  if (dword_2550F4868 <= 800)
  {
    if (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u))
      sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell calculatePositionForView:forItem:atItemIndex:]", 800, (uint64_t)"itemInfo position '%@'\n", v35, v36, v37, v38, (uint64_t)v39);
    if (dword_2550F4868 <= 800)
    {
      if (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u))
        sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell calculatePositionForView:forItem:atItemIndex:]", 800, (uint64_t)"itemInfo neighbor '%@'\n", v35, v36, v37, v38, (uint64_t)v11);
      if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell calculatePositionForView:forItem:atItemIndex:]", 800, (uint64_t)"neighbor frame=(x = %.1f, y = %.1f, w = %.1f, h = %.1f)\n", v35, v36, v37, v38, *(uint64_t *)&forcedRightmostEditTextInset);
    }
  }
  objc_msgSend_frame(a3, v33, v34);
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  v50 = (void *)objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], v48, v49);
  if (objc_msgSend_userInterfaceLayoutDirection(v50, v51, v52) == 1)
  {
    isEqualToString = objc_msgSend_isEqualToString_(v39, v53, (uint64_t)CFSTR("left"));
    v55 = CFSTR("right");
    if ((isEqualToString & 1) == 0)
    {
      v56 = objc_msgSend_isEqualToString_(v39, v53, (uint64_t)CFSTR("right"));
      v55 = CFSTR("left");
      if ((v56 & 1) == 0)
      {
        v57 = objc_msgSend_isEqualToString_(v39, v53, (uint64_t)CFSTR("topLeft"));
        v55 = CFSTR("topRight");
        if ((v57 & 1) == 0)
        {
          v58 = objc_msgSend_isEqualToString_(v39, v53, (uint64_t)CFSTR("topRight"));
          v55 = CFSTR("topLeft");
          if ((v58 & 1) == 0)
          {
            v59 = objc_msgSend_isEqualToString_(v39, v53, (uint64_t)CFSTR("bottomLeft"));
            v55 = CFSTR("bottomRight");
            if ((v59 & 1) == 0)
            {
              if (objc_msgSend_isEqualToString_(v39, v53, (uint64_t)CFSTR("bottomRight")))
                v55 = CFSTR("bottomLeft");
              else
                v55 = 0;
            }
          }
        }
      }
    }
    if (v55)
      v39 = (__CFString *)v55;
  }
  v60 = objc_msgSend_isEqualToString_(v39, v53, (uint64_t)CFSTR("center"));
  if ((_DWORD)v60)
  {
    if (!v17)
    {
      if (sub_21A731938(v60, v61, v62))
      {
        v63 = (void *)objc_msgSend_contentView(self, v61, v62);
        objc_msgSend_bounds(v63, v64, v65);
        width = v66;
      }
      v67 = 0.5;
      v68 = (width - v45) * 0.5;
      v69 = floorf(v68);
      if (v69 <= 0.0)
        v69 = 0.0;
      forcedRightmostEditTextInset = v69;
      goto LABEL_44;
    }
    goto LABEL_48;
  }
  if (objc_msgSend_isEqualToString_(v39, v61, (uint64_t)CFSTR("top")))
  {
    if (v17)
      goto LABEL_48;
    v95 = (width - v45) * 0.5;
    forcedRightmostEditTextInset = floorf(v95);
LABEL_75:
    v43 = v109;
    goto LABEL_49;
  }
  if (!objc_msgSend_isEqualToString_(v39, v61, (uint64_t)CFSTR("left")))
  {
    if (objc_msgSend_isEqualToString_(v39, v90, (uint64_t)CFSTR("right")))
    {
      v93 = width + forcedRightmostEditTextInset;
      if (v17)
      {
        objc_msgSend_horizontalSpacingForView_withItem_(self, v61, (uint64_t)a3, a4);
        forcedRightmostEditTextInset = v93 + v94;
        *(float *)&v94 = (v28 - v47) * 0.5;
        v43 = y + floorf(*(float *)&v94);
        goto LABEL_49;
      }
      forcedRightmostEditTextInset = v93 - v45;
      v70 = v28 - v47;
      v67 = 0.5;
      goto LABEL_45;
    }
    if (objc_msgSend_isEqualToString_(v39, v61, (uint64_t)CFSTR("bottom")))
    {
      if (!v17)
      {
        v67 = 0.5;
        v104 = (width - v45) * 0.5;
        forcedRightmostEditTextInset = forcedRightmostEditTextInset + floorf(v104);
LABEL_44:
        v70 = v28 - v47;
LABEL_45:
        v71 = v70 * v67;
        v43 = floorf(v71);
        goto LABEL_49;
      }
      v96 = (void *)objc_msgSend_contentView(self, v61, v62);
      objc_msgSend_frame(v96, v97, v98);
      v100 = (v99 - v45) * 0.5;
      forcedRightmostEditTextInset = floorf(v100);
    }
    else
    {
      if (objc_msgSend_isEqualToString_(v39, v61, (uint64_t)CFSTR("topLeft")))
      {
        if (v17)
          goto LABEL_48;
        objc_msgSend_leftInsetForView_withItem_(self, v61, (uint64_t)a3, a4);
        forcedRightmostEditTextInset = v102;
        goto LABEL_75;
      }
      if (objc_msgSend_isEqualToString_(v39, v61, (uint64_t)CFSTR("topRight")))
      {
        if (!v17)
          goto LABEL_48;
        objc_msgSend_horizontalSpacingForView_withItem_(self, v61, (uint64_t)a3, a4);
        forcedRightmostEditTextInset = width + forcedRightmostEditTextInset + v103;
        goto LABEL_75;
      }
      if (objc_msgSend_isEqualToString_(v39, v61, (uint64_t)CFSTR("bottomLeft")))
      {
        if (v17)
        {
          objc_msgSend_verticalSpacingForView_withItem_(self, v61, (uint64_t)a3, a4);
          v43 = v28 + y + v105;
          goto LABEL_49;
        }
        goto LABEL_48;
      }
      v106 = objc_msgSend_isEqualToString_(v39, v61, (uint64_t)CFSTR("bottomRight"));
      if (!v17 || !v106)
      {
LABEL_48:
        forcedRightmostEditTextInset = v41;
        goto LABEL_49;
      }
      objc_msgSend_horizontalSpacingForView_withItem_(self, v61, (uint64_t)a3, a4);
      forcedRightmostEditTextInset = width + forcedRightmostEditTextInset + v107;
    }
    v43 = v109 + v28 + y;
    goto LABEL_49;
  }
  v91 = (v28 - v47) * 0.5;
  v43 = floorf(v91);
  if (v17)
  {
    forcedRightmostEditTextInset = forcedRightmostEditTextInset - v45;
    objc_msgSend_horizontalSpacingForView_withItem_(self, v90, (uint64_t)a3, a4);
    v45 = v45 - v92;
  }
  else
  {
    objc_msgSend_leftInsetForView_withItem_(self, v90, (uint64_t)a3, a4);
    forcedRightmostEditTextInset = v101;
  }
LABEL_49:
  v72 = (void *)objc_msgSend_reuseIdentifier(self, v61, v62);
  if ((objc_msgSend_isEqualToString_(v72, v73, (uint64_t)CFSTR("NoBackgroundTypeCellID")) & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend_frame(a3, v74, v75);
      if (forcedRightmostEditTextInset < v109 && v78 > 0.0)
        forcedRightmostEditTextInset = v109;
      objc_msgSend_frame(a3, v76, v77);
      if (v82 > 0.0)
      {
        objc_msgSend_verticalInset(self, v80, v81);
        if (v43 < v83)
          v43 = v83;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (forcedRightmostEditTextInset > self->_computedRightmostEditTextInset)
      self->_computedRightmostEditTextInset = forcedRightmostEditTextInset;
    v45 = v45 - (self->_forcedRightmostEditTextInset - forcedRightmostEditTextInset);
    forcedRightmostEditTextInset = self->_forcedRightmostEditTextInset;
  }
  objc_msgSend_setFrame_(a3, v84, v85, forcedRightmostEditTextInset, v43, v45, v47);
  if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell calculatePositionForView:forItem:atItemIndex:]", 800, (uint64_t)"view.frame set to frame=(x = %.1f, y = %.1f, w = %.1f, h = %.1f)\n", v86, v87, v88, v89, *(uint64_t *)&forcedRightmostEditTextInset);
}

- (double)calculateFrameSizeForView:(id)a3 forItem:(id)a4 atItemIndex:(unint64_t)a5 withRemainingContentWidth:(double)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  double v23;
  int v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  double v73;
  double v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  double v88;
  float v89;
  float v90;
  float v91;
  double v92;
  float v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  double v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  float v131;
  float v132;
  float v133;
  double v134;
  NSString *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t isKindOfClass;
  const char *v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  double v159;
  CGFloat v160;
  double v161;
  CGFloat v162;
  double v163;
  CGFloat v164;
  double v165;
  CGFloat v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  double v172;
  double v173;
  double v174;
  objc_class *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  NSString *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  _QWORD v185[2];
  CGRect v186;
  CGRect v187;
  CGRect modifiedContentViewFrame;

  v185[1] = *MEMORY[0x24BDAC8D0];
  if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"\n", a5, v6, v7, v8, v180);
  v14 = (void *)objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("position"));
  objc_msgSend_edgeInsetValue_(self, v15, (uint64_t)a4);
  if ((objc_msgSend_isEqualToString_(v14, v16, (uint64_t)CFSTR("bottomLeft")) & 1) != 0
    || objc_msgSend_isEqualToString_(v14, v17, (uint64_t)CFSTR("bottom")))
  {
    v19 = (void *)objc_msgSend_objectForKey_(a4, v17, (uint64_t)CFSTR("neighbor"));
    if (v19)
    {
      v21 = objc_msgSend_objectForKey_(v19, v20, (uint64_t)CFSTR("cachedView"));
      objc_msgSend_usableContentWidthForItem_withVerticalNeighborView_(self, v22, (uint64_t)a4, v21);
    }
    else
    {
      objc_msgSend_usableContentWidthForItem_withVerticalNeighborView_(self, v20, (uint64_t)a4, 0);
    }
    a6 = v23;
    v24 = 1;
  }
  else
  {
    v24 = 0;
  }
  v25 = (void *)objc_msgSend_cellDict(self, v17, v18);
  v27 = (void *)objc_msgSend_objectForKey_(v25, v26, (uint64_t)CFSTR("items"));
  if (objc_msgSend_count(v27, v28, v29) - 1 == a5)
    v34 = 1;
  else
    v34 = v24;
  if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
  {
    v35 = "NO";
    if (v34)
      v35 = "YES";
    sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"isLastItem = %s\n", v30, v31, v32, v33, (uint64_t)v35);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_frame(a3, v36, v37);
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    if (!objc_msgSend_text(a3, v46, v47))
      goto LABEL_54;
    if (objc_msgSend_numberOfLines(a3, v48, v49) == 1)
    {
      v52 = (void *)objc_msgSend_text(a3, v50, v51);
      v184 = *MEMORY[0x24BDF65F8];
      v185[0] = objc_msgSend_font(a3, v53, v54);
      v56 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v55, (uint64_t)v185, &v184, 1);
      objc_msgSend_boundingRectWithSize_options_attributes_context_(v52, v57, 32, v56, 0, a6, 1.79769313e308);
    }
    else
    {
      if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
      {
        objc_msgSend_numberOfLines(a3, v50, v51);
        sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"laying out UILabel to width = %.1f (number of lines %d)\n", v121, v122, v123, v124, *(uint64_t *)&a6);
      }
      v125 = (void *)objc_msgSend_text(a3, v50, v51);
      v182 = *MEMORY[0x24BDF65F8];
      v183 = objc_msgSend_font(a3, v126, v127);
      v129 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v128, (uint64_t)&v183, &v182, 1);
      objc_msgSend_boundingRectWithSize_options_attributes_context_(v125, v130, 1, v129, 0, a6, 1.79769313e308);
    }
    v39 = v58;
    v41 = v59;
    v131 = v60;
    v132 = ceilf(v131);
    v43 = v132;
    v133 = v61;
    v134 = ceilf(v133);
    if (v132 == 0.0)
      v45 = 0.0;
    else
      v45 = v134;
    if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
    {
      v186.origin.x = v39;
      v186.origin.y = v41;
      v186.size.width = v43;
      v186.size.height = v45;
      v135 = NSStringFromCGRect(v186);
      sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"computed text rect = %@ (remainingContentWidth %.3f)\n", v136, v137, v138, v139, (uint64_t)v135);
    }
    if (v34)
    {
      v43 = a6;
      objc_msgSend_setFrame_(a3, v48, v49, v39, v41, a6, v45);
    }
    else
    {
LABEL_54:
      objc_msgSend_setFrame_(a3, v48, v49, v39, v41, v43, v45);
    }
    a6 = a6 - v43;
    if (dword_2550F4868 <= 800)
    {
      if (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u))
      {
        objc_msgSend_frame(a3, v140, v141);
        v143 = v142;
        objc_msgSend_frame(a3, v144, v145);
        sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"UILabel size set to=(w = %.1f, h = %.1f)\n", v146, v147, v148, v149, v143);
      }
LABEL_59:
      if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"returning remainingContentWidth of %.1f\n", v96, v97, v98, v99, *(uint64_t *)&a6);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_sizeToFit(a3, v108, v109);
        if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
        {
          objc_msgSend_frame(a3, v110, v111);
          v113 = v112;
          objc_msgSend_frame(a3, v114, v115);
          sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"UIButton size set to=(w = %.1f, h = %.1f)\n", v116, v117, v118, v119, v113);
        }
        objc_msgSend_frame(a3, v110, v111);
        a6 = a6 - v120;
      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0)
        {
          if (sub_21A731938(isKindOfClass, v152, v153))
          {
            v156 = (void *)objc_msgSend_contentView(self, v154, v155);
            objc_msgSend_frame(v156, v157, v158);
            v160 = v159;
            v162 = v161;
            v164 = v163;
            v166 = v165;
            v169 = (void *)objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], v167, v168);
            objc_msgSend_scale(v169, v170, v171);
            if (v172 == 2.0)
              v173 = 7.5;
            else
              v173 = 7.0;
            v187.origin.x = v160;
            v187.origin.y = v162;
            v187.size.width = v164;
            v187.size.height = v166;
            modifiedContentViewFrame = CGRectInset(v187, 5.0, v173);
          }
          else
          {
            modifiedContentViewFrame = self->_modifiedContentViewFrame;
          }
          objc_msgSend_setFrame_(a3, v154, v155, modifiedContentViewFrame.origin.x, modifiedContentViewFrame.origin.y, modifiedContentViewFrame.size.width, modifiedContentViewFrame.size.height);
        }
        else
        {
          objc_msgSend_frame(a3, v152, v153);
          a6 = a6 - v174;
          if (dword_2550F4868 > 800)
            return a6;
          if (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u))
          {
            v175 = (objc_class *)objc_opt_class();
            v181 = NSStringFromClass(v175);
            sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"size calculation for this class %@ is not yet supported\n", v176, v177, v178, v179, (uint64_t)v181);
          }
        }
      }
      goto LABEL_59;
    }
    v64 = (void *)MEMORY[0x24BDF6A70];
    objc_msgSend_labelFontSize(MEMORY[0x24BDF6A70], v62, v63);
    v67 = (void *)objc_msgSend_systemFontOfSize_(v64, v65, v66);
    v70 = (void *)objc_msgSend_font(a3, v68, v69);
    objc_msgSend_pointSize(v70, v71, v72);
    v74 = v73;
    objc_msgSend_pointSize(v67, v75, v76);
    if (v74 > v79)
      v67 = (void *)objc_msgSend_font(a3, v77, v78);
    objc_msgSend_frame(a3, v77, v78);
    v81 = v80;
    v83 = v82;
    objc_msgSend_lineHeight(v67, v84, v85);
    v89 = a6 * 0.5;
    v90 = floorf(v89);
    if (v34)
    {
      v91 = a6;
      v90 = v91;
    }
    v92 = ceilf(v90);
    v93 = v88;
    objc_msgSend_setFrame_(a3, v86, v87, v81, v83, v92, ceilf(v93));
    a6 = a6 - v92;
    if (dword_2550F4868 <= 800)
    {
      if (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u))
      {
        objc_msgSend_frame(a3, v94, v95);
        v101 = v100;
        objc_msgSend_frame(a3, v102, v103);
        sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell calculateFrameSizeForView:forItem:atItemIndex:withRemainingContentWidth:]", 800, (uint64_t)"UITextField size set to=(w = %.1f, h = %.1f)\n", v104, v105, v106, v107, v101);
      }
      goto LABEL_59;
    }
  }
  return a6;
}

- (void)repositionView:(id)a3 ifOverlapsPreviousView:(id)a4
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  const char *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double MinX;
  CGFloat MaxX;
  CGFloat v33;
  double v34;
  double v35;
  const char *v36;
  uint64_t v37;
  CGFloat v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  objc_msgSend_frame(a3, a2, (uint64_t)a3);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend_frame(a4, v14, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v39.origin.x = v7;
  v39.origin.y = v9;
  v39.size.width = v11;
  v39.size.height = v13;
  v44.origin.x = v17;
  v44.origin.y = v19;
  v44.size.width = v21;
  v44.size.height = v23;
  if (CGRectIntersectsRect(v39, v44))
  {
    v38 = v13;
    v28 = v11;
    v29 = v9;
    v30 = v7;
    if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell repositionView:ifOverlapsPreviousView:]", 800, (uint64_t)"view %@ collides with %@\n", v24, v25, v26, v27, (uint64_t)a3);
    v40.origin.x = v17;
    v40.origin.y = v19;
    v40.size.width = v21;
    v40.size.height = v23;
    MinX = CGRectGetMinX(v40);
    v41.origin.x = v30;
    v41.origin.y = v29;
    v41.size.width = v28;
    v41.size.height = v38;
    if (MinX < CGRectGetMinX(v41))
    {
      v42.origin.x = v17;
      v42.origin.y = v19;
      v42.size.width = v21;
      v42.size.height = v23;
      MaxX = CGRectGetMaxX(v42);
      v33 = v30;
      v34 = MaxX;
      v43.origin.x = v33;
      v43.origin.y = v29;
      v43.size.width = v28;
      v43.size.height = v38;
      v35 = v21 - (v34 - (CGRectGetMinX(v43) + -10.0));
      objc_msgSend_setFrame_(a4, v36, v37, v17, v19, v35, v23);
    }
  }
}

- (void)layoutSubviews
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  int isEqualToString;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGRect *p_modifiedContentViewFrame;
  double v54;
  double v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  double v65;
  double v66;
  const char *v67;
  uint64_t v68;
  double v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  double v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  double v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  double v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  const char *v120;
  double v121;
  double v122;
  const char *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  double v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  double MaxY;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  double v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  double v158;
  double v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  char v168;
  id obj;
  uint64_t *p_neededContentHeight;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  objc_super v175;
  _BYTE v176[128];
  uint64_t v177;
  CGRect v178;
  CGRect v179;

  v177 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F4868 <= 800)
  {
    if (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u))
    {
      v8 = (void *)objc_msgSend_currentIndexPath(self, a2, v2);
      objc_msgSend_section(v8, v9, v10);
      v13 = (void *)objc_msgSend_currentIndexPath(self, v11, v12);
      objc_msgSend_row(v13, v14, v15);
      sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"cell %@ section %d row %d\n", v16, v17, v18, v19, (uint64_t)self);
    }
    if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"current forced max edit text inset = %.1f\n", v4, v5, v6, v7, *(_QWORD *)&self->_forcedRightmostEditTextInset);
  }
  v175.receiver = self;
  v175.super_class = (Class)ManagedTableViewCell;
  -[ManagedTableViewCell layoutSubviews](&v175, sel_layoutSubviews);
  v22 = (void *)objc_msgSend_reuseIdentifier(self, v20, v21);
  isEqualToString = objc_msgSend_isEqualToString_(v22, v23, (uint64_t)CFSTR("NoBackgroundTypeCellID"));
  self->_computedRightmostEditTextInset = 0.0;
  objc_msgSend_verticalInset(self, v25, v26);
  v30 = v29;
  v168 = isEqualToString;
  if (isEqualToString)
    objc_msgSend_setBackgroundView_(self, v27, 0);
  v31 = (void *)objc_msgSend_contentView(self, v27, v28);
  v34 = objc_msgSend_frame(v31, v32, v33);
  v39 = v37;
  if (self->_cellXEdgeInset != v37)
  {
    v40 = v38;
    self->_cellXEdgeInset = v37;
    v41 = (void *)objc_msgSend_parentTableManager(self, v35, v36);
    v34 = objc_msgSend_informOfNewCellLeftEdge_andWidth_(v41, v42, v43, v39, v40);
  }
  if (sub_21A731938(v34, v35, v36))
  {
    if (objc_msgSend_isEditing(self, v44, v45) && objc_msgSend_accessoryType(self, v46, v47))
    {
      objc_msgSend_frame(self, v46, v47);
      p_modifiedContentViewFrame = &self->_modifiedContentViewFrame;
      v55 = v54 + -33.0;
      goto LABEL_22;
    }
  }
  else
  {
    v56 = (void *)objc_msgSend_parentTableManager(self, v44, v45);
    v59 = (void *)objc_msgSend_managedTableView(v56, v57, v58);
    if (objc_msgSend_style(v59, v60, v61) == 1)
    {
      v62 = (void *)objc_msgSend_contentView(self, v46, v47);
      objc_msgSend_frame(v62, v63, v64);
      v66 = v65;
      objc_msgSend_frame(self, v67, v68);
      if (v66 == v69)
      {
        p_modifiedContentViewFrame = &self->_modifiedContentViewFrame;
        v70 = (void *)objc_msgSend_contentView(self, v46, v47);
        objc_msgSend_frame(v70, v71, v72);
        *(CGRect *)&v50 = CGRectInset(v178, 10.0, 0.0);
        goto LABEL_22;
      }
    }
  }
  p_modifiedContentViewFrame = &self->_modifiedContentViewFrame;
  v73 = (void *)objc_msgSend_contentView(self, v46, v47);
  objc_msgSend_frame(v73, v74, v75);
LABEL_22:
  p_modifiedContentViewFrame->origin.x = v50;
  p_modifiedContentViewFrame->origin.y = v51;
  p_modifiedContentViewFrame->size.width = v55;
  p_modifiedContentViewFrame->size.height = v52;
  objc_msgSend_usableContentWidth(self, v48, v49);
  v83 = v82;
  if (dword_2550F4868 >= 801)
  {
    p_neededContentHeight = (uint64_t *)&self->_neededContentHeight;
    self->_neededContentHeight = 44.0;
  }
  else
  {
    if (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u))
      sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"initial content width = %.1f\n", v78, v79, v80, v81, *(uint64_t *)&v83);
    v84 = dword_2550F4868;
    p_neededContentHeight = (uint64_t *)&self->_neededContentHeight;
    self->_neededContentHeight = 44.0;
    if (v84 <= 800 && (v84 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
    {
      v85 = objc_msgSend_contentView(self, v76, v77);
      sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"contentView %@\n", v86, v87, v88, v89, v85);
    }
  }
  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  v90 = (void *)objc_msgSend_cellDict(self, v76, v77);
  obj = (id)objc_msgSend_objectForKey_(v90, v91, (uint64_t)CFSTR("items"));
  v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v92, (uint64_t)&v171, v176, 16);
  if (v93)
  {
    v101 = v93;
    v102 = 0;
    v103 = 0;
    v104 = *(_QWORD *)v172;
    do
    {
      v105 = 0;
      v106 = v102;
      do
      {
        if (*(_QWORD *)v172 != v104)
          objc_enumerationMutation(obj);
        v107 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * v105);
        v102 = (void *)objc_msgSend_objectForKey_(v107, v94, (uint64_t)CFSTR("cachedView"));
        if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
          sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"item index %d cached view %@\n", v109, v110, v111, v112, v103 + v105);
        objc_msgSend_calculateFrameSizeForView_forItem_atItemIndex_withRemainingContentWidth_(self, v108, (uint64_t)v102, v107, v103 + v105, v83);
        v114 = v113;
        objc_msgSend_calculatePositionForView_forItem_atItemIndex_(self, v115, (uint64_t)v102, v107, v103 + v105);
        if (v106)
          objc_msgSend_repositionView_ifOverlapsPreviousView_(self, v116, (uint64_t)v102, v106);
        v118 = (void *)objc_msgSend_contentView(self, v116, v117);
        objc_msgSend_addSubview_(v118, v119, (uint64_t)v102);
        objc_msgSend_horizontalSpacingForView_withItem_(self, v120, (uint64_t)v102, v107);
        v122 = v121;
        if (objc_msgSend_objectForKey_(v107, v123, (uint64_t)CFSTR("edgeInset")))
        {
          objc_msgSend_edgeInsetValue_(self, v124, (uint64_t)v107);
          v30 = v130;
        }
        v83 = v114 - v122;
        if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
          sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"remaining content width = %.1f\n", v126, v127, v128, v129, *(uint64_t *)&v83);
        objc_msgSend_frame(v102, v124, v125);
        MaxY = CGRectGetMaxY(v179);
        if (MaxY > *(double *)p_neededContentHeight)
        {
          *(double *)p_neededContentHeight = MaxY;
          if (dword_2550F4868 <= 800)
          {
            if (dword_2550F4868 == -1)
            {
              if (!sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u))
                goto LABEL_54;
              MaxY = *(double *)p_neededContentHeight;
            }
            sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"adjusted _neededContentHeight to %.1f\n", v131, v132, v133, v134, *(uint64_t *)&MaxY);
          }
        }
LABEL_54:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_setIsAccessibilityElement_(v102, v94, 0);
          v138 = objc_msgSend_accessibilityTraits(v102, v136, v137);
          objc_msgSend_setAccessibilityTraits_(self, v139, v138);
          objc_msgSend_accessibilityActivationPoint(v102, v140, v141);
          objc_msgSend_setAccessibilityActivationPoint_(self, v142, v143);
        }
        ++v105;
        v106 = v102;
      }
      while (v101 != v105);
      v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v94, (uint64_t)&v171, v176, 16);
      v103 += v105;
    }
    while (v101);
  }
  if ((v168 & 1) == 0)
  {
    v100 = *(double *)p_neededContentHeight;
    if (*(double *)p_neededContentHeight > 44.0)
    {
      v100 = v30 + v100;
      *(double *)p_neededContentHeight = v100;
      if (dword_2550F4868 <= 800)
      {
        if (dword_2550F4868 == -1)
        {
          if (!sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u))
            goto LABEL_65;
          v100 = *(double *)p_neededContentHeight;
        }
        sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"adjusted _neededContentHeight by kStandardEdgeInset to %.1f\n", v96, v97, v98, v99, *(uint64_t *)&v100);
      }
    }
  }
LABEL_65:
  v144 = (void *)objc_msgSend_cellDict(self, v94, v95, v100);
  v148 = (void *)objc_msgSend_objectForKey_(v144, v145, (uint64_t)CFSTR("cachedHeight"));
  if (!v148)
  {
    v148 = (void *)objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v146, v147);
    v151 = (void *)objc_msgSend_cellDict(self, v149, v150);
    objc_msgSend_setObject_forKey_(v151, v152, (uint64_t)v148, CFSTR("cachedHeight"));
  }
  v153 = *(double *)p_neededContentHeight;
  *(float *)&v153 = *(double *)p_neededContentHeight;
  v154 = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v146, v147, v153);
  v155 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_bounds(self, v156, v157);
  *(float *)&v159 = v158;
  v162 = objc_msgSend_numberWithFloat_(v155, v160, v161, v159);
  objc_msgSend_setObject_forKey_(v148, v163, v154, v162);
  if (dword_2550F4868 <= 800 && (dword_2550F4868 != -1 || sub_21A69876C((uint64_t)&dword_2550F4868, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4868, (uint64_t)"-[ManagedTableViewCell layoutSubviews]", 800, (uint64_t)"final _neededContentHeight = %.1f\n", v164, v165, v166, v167, *p_neededContentHeight);
}

- (id)accessibilityValue
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t ValueForFirstItemOfType_inCellAtIndexPath;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  objc_super v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v4 = (void *)objc_msgSend_cellDict(self, a2, v2);
  v6 = (void *)objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("items"));
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v31, v35, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v32;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(v6);
      v14 = (void *)objc_msgSend_objectForKey_(*(void **)(*((_QWORD *)&v31 + 1) + 8 * v13), v9, (uint64_t)CFSTR("cachedView"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v31, v35, 16);
        if (v11)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    if (!v14)
      goto LABEL_12;
    return (id)objc_msgSend_accessibilityValue(v14, v9, v10);
  }
  else
  {
LABEL_12:
    v16 = (void *)objc_msgSend_parentTableManager(self, v9, v10);
    v19 = objc_msgSend_currentIndexPath(self, v17, v18);
    ValueForFirstItemOfType_inCellAtIndexPath = objc_msgSend_getValueForFirstItemOfType_inCellAtIndexPath_(v16, v20, (uint64_t)CFSTR("unreadBubbleCount"), v19);
    if (ValueForFirstItemOfType_inCellAtIndexPath)
    {
      v22 = (void *)ValueForFirstItemOfType_inCellAtIndexPath;
      v23 = sub_21A690C10((uint64_t)CFSTR("status.alerts.plural"), (uint64_t)CFSTR("AirportAccessibility"));
      if (objc_msgSend_integerValue(v22, v24, v25) == 1)
        v23 = sub_21A690C10((uint64_t)CFSTR("status.alerts.singular"), (uint64_t)CFSTR("AirportAccessibility"));
      v27 = (void *)MEMORY[0x24BDD17C8];
      v28 = objc_msgSend_localizedStringFromNumber_numberStyle_(MEMORY[0x24BDD16F0], v26, (uint64_t)v22, 0);
      return (id)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v27, v29, v23, CFSTR("%@"), 0, v28);
    }
    else
    {
      v30.receiver = self;
      v30.super_class = (Class)ManagedTableViewCell;
      return -[ManagedTableViewCell accessibilityValue](&v30, sel_accessibilityValue);
    }
  }
}

- (TableViewManager)parentTableManager
{
  return self->_parentTableManager;
}

- (void)setParentTableManager:(id)a3
{
  self->_parentTableManager = (TableViewManager *)a3;
}

- (NSMutableDictionary)cellDict
{
  return self->_cellDict;
}

- (NSIndexPath)currentIndexPath
{
  return self->_currentIndexPath;
}

- (void)setCurrentIndexPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1040);
}

- (double)neededContentHeight
{
  return self->_neededContentHeight;
}

- (double)computedRightmostEditTextInset
{
  return self->_computedRightmostEditTextInset;
}

- (double)forcedRightmostEditTextInset
{
  return self->_forcedRightmostEditTextInset;
}

- (void)setForcedRightmostEditTextInset:(double)a3
{
  self->_forcedRightmostEditTextInset = a3;
}

@end
