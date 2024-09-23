@implementation TableViewManager

- (void)informOfNewCellLeftEdge:(double)a3 andWidth:(double)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  const char *v22;
  uint64_t v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  self->_cellLeftEdgeOrigin = a3;
  self->_cellContentWidth = a4;
  v5 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v29, v34, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        v12 = (void *)objc_msgSend_objectForKey_(*(void **)(*((_QWORD *)&v29 + 1) + 8 * i), v8, (uint64_t)CFSTR("headerCache"));
        if (v12)
        {
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v14 = (void *)objc_msgSend_subviews(v12, v8, v13);
          v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v25, v33, 16);
          if (v16)
          {
            v18 = v16;
            v19 = *(_QWORD *)v26;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v26 != v19)
                  objc_enumerationMutation(v14);
                v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
                objc_msgSend_frame(v21, v8, v17);
                objc_msgSend_setFrame_(v21, v22, v23, self->_cellLeftEdgeOrigin + 10.0);
              }
              v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v8, (uint64_t)&v25, v33, 16);
            }
            while (v18);
          }
        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v29, v34, 16);
    }
    while (v9);
  }
}

- (void)endEditing
{
  uint64_t v2;

  objc_msgSend_resignFirstResponder(self->_currentFirstResponder, a2, v2);
  self->_currentFirstResponder = 0;

  self->_currentFirstResponderCellPath = 0;
}

- (void)initializeTableViewManagerCommon
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  id v11;
  const char *v12;

  self->_detailTextColor = (UIColor *)(id)objc_msgSend__labelColor(MEMORY[0x24BDF6950], a2, v2);
  self->_selectedTextColor = (UIColor *)(id)objc_msgSend__labelColor(MEMORY[0x24BDF6950], v4, v5);
  self->_editTextColor = (UIColor *)(id)objc_msgSend_systemBlueColor(MEMORY[0x24BDF6950], v6, v7);
  self->_subtitleColor = (UIColor *)(id)objc_msgSend__secondaryLabelColor(MEMORY[0x24BDF6950], v8, v9);
  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  self->_tableDescriptorDict = v10;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend_setObject_forKey_(v10, v12, (uint64_t)v11, CFSTR("tableSectionArray"));
}

- (void)awakeFromNib
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_initializeTableViewManagerCommon(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)TableViewManager;
  -[TableViewManager awakeFromNib](&v4, sel_awakeFromNib);
}

- (TableViewManager)init
{
  TableViewManager *v2;
  const char *v3;
  uint64_t v4;
  TableViewManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TableViewManager;
  v2 = -[TableViewManager init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_initializeTableViewManagerCommon(v2, v3, v4);
  return v5;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  objc_super v7;

  v4 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2);
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self);
  objc_msgSend_setManagedTableView_(self, v6, 0);

  v7.receiver = self;
  v7.super_class = (Class)TableViewManager;
  -[TableViewManager dealloc](&v7, sel_dealloc);
}

- (void)setManagedTableView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  const char *v10;
  UITableView *managedTableView;
  const char *v12;
  id v13;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager setManagedTableView:]", 800, (uint64_t)"%@\n", v3, v4, v5, v6, (uint64_t)a3);
  objc_msgSend_setDelegate_(a3, a2, (uint64_t)self);
  objc_msgSend_setDataSource_(a3, v9, (uint64_t)self);
  managedTableView = self->_managedTableView;
  if (managedTableView != a3)
  {
    objc_msgSend_setDataSource_(managedTableView, v10, 0);
    objc_msgSend_setDelegate_(self->_managedTableView, v12, 0);

    v13 = a3;
    self->_managedTableView = (UITableView *)a3;
  }
}

- (UITableView)managedTableView
{
  return self->_managedTableView;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (TableViewManagerDelegate)delegate
{
  if (*((_QWORD *)self + 3))
    return (TableViewManagerDelegate *)*((_QWORD *)self + 3);
  return self;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  const char *v5;

  v4 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, a3);
  objc_msgSend_addObserver_selector_name_object_(v4, v5, (uint64_t)self, sel_uiTextFieldDidChange_, *MEMORY[0x24BDF7F58], 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  const char *v5;

  v4 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, a3);
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, *MEMORY[0x24BDF7F58], 0);
}

- (void)insertNewRows:(id)a3 atIndexPaths:(id)a4 withRowAnimation:(int64_t)a5
{
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  unint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  id v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  UITableView *managedTableView;
  const char *v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  int64_t v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, a2, (uint64_t)&v50, v54, 16);
  if (v8)
  {
    v11 = v8;
    v12 = 0;
    v13 = *(_QWORD *)v51;
    v48 = a5;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v51 != v13)
        objc_enumerationMutation(a4);
      v15 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v14);
      v16 = objc_msgSend_row(v15, v9, v10);
      v24 = objc_msgSend_section(v15, v17, v18);
      if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager insertNewRows:atIndexPaths:withRowAnimation:]", 800, (uint64_t)"section %d  row %d\n", v20, v21, v22, v23, v24);
      v25 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, v19, (uint64_t)CFSTR("tableSectionArray"));
      v28 = objc_msgSend_count(v25, v26, v27);
      if (v24 > v28)
        break;
      if (v24 >= v28)
      {
        v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v37 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x24BDBCED8], v36, (uint64_t)v34, CFSTR("sectionRows"));
        objc_msgSend_addObject_(v25, v38, v37);
        managedTableView = self->_managedTableView;
        v41 = objc_msgSend_indexSetWithIndex_(MEMORY[0x24BDD15E0], v40, v24);
        objc_msgSend_insertSections_withRowAnimation_(managedTableView, v42, v41, 3);
      }
      else
      {
        v30 = (void *)objc_msgSend_objectAtIndex_(v25, v29, v24);
        v34 = (id)objc_msgSend_objectForKey_(v30, v31, (uint64_t)CFSTR("sectionRows"));
        if (!v34)
        {
          v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend_setObject_forKey_(v30, v35, (uint64_t)v34, CFSTR("sectionRows"));
        }
      }
      if (v16 > objc_msgSend_count(v34, v32, v33) || v12 + v14 >= (unint64_t)objc_msgSend_count(a3, v43, v44))
        break;
      v46 = objc_msgSend_objectAtIndex_(a3, v45, v12 + v14);
      objc_msgSend_insertObject_atIndex_(v34, v47, v46, v16);
      if (v11 == ++v14)
      {
        v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v9, (uint64_t)&v50, v54, 16);
        v12 += v14;
        a5 = v48;
        if (v11)
          goto LABEL_3;
        goto LABEL_19;
      }
    }
  }
  else
  {
LABEL_19:
    objc_msgSend_insertRowsAtIndexPaths_withRowAnimation_(self->_managedTableView, v9, (uint64_t)a4, a5);
  }
}

- (void)appendNewRow:(id)a3 forSection:(unint64_t)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  UITableView *managedTableView;
  const char *v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  UITableView *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;

  v7 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  v10 = objc_msgSend_count(v7, v8, v9);
  if (v10 >= a4)
  {
    if (v10 > a4)
    {
      v12 = (void *)objc_msgSend_objectAtIndex_(v7, v11, a4);
      v14 = (id)objc_msgSend_objectForKey_(v12, v13, (uint64_t)CFSTR("sectionRows"));
    }
    else
    {
      v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v16 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x24BDBCED8], v15, (uint64_t)v14, CFSTR("sectionRows"));
      objc_msgSend_addObject_(v7, v17, v16);
      managedTableView = self->_managedTableView;
      v20 = objc_msgSend_indexSetWithIndex_(MEMORY[0x24BDD15E0], v19, a4);
      objc_msgSend_insertSections_withRowAnimation_(managedTableView, v21, v20, 100);
    }
    if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager appendNewRow:forSection:]", 800, (uint64_t)"appending row to section %d\n", v24, v25, v26, v27, a4);
    v28 = (void *)MEMORY[0x24BDD15D8];
    v29 = objc_msgSend_count(v14, v22, v23);
    v31 = objc_msgSend_indexPathForRow_inSection_(v28, v30, v29, a4);
    objc_msgSend_addObject_(v14, v32, (uint64_t)a3);
    v33 = self->_managedTableView;
    v35 = objc_msgSend_arrayWithObject_(MEMORY[0x24BDBCE30], v34, v31);
    objc_msgSend_insertRowsAtIndexPaths_withRowAnimation_(v33, v36, v35, 100);
  }
}

- (void)updateCellAtIndexPath:(id)a3 withNewRowInfo:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t CellDictForCellAtIndexPath;
  const char *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  id v34;
  void *v35;
  void *v38;

  v34 = a4;
  if (dword_2550F46C8 <= 800 && (dword_2550F46C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F46C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F46C8, (uint64_t)"-[TableViewManager updateCellAtIndexPath:withNewRowInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, (uint64_t)v34);
  CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a3, v34);
  if (CellDictForCellAtIndexPath)
  {
    v10 = (void *)CellDictForCellAtIndexPath;
    v11 = objc_msgSend_objectForKey_(v35, v9, (uint64_t)CFSTR("representedObject"));
    if (v11)
      objc_msgSend_setObject_forKey_(v10, v12, v11, CFSTR("representedObject"));
    v38 = (void *)objc_msgSend_objectForKey_(v35, v12, (uint64_t)CFSTR("items"));
    v15 = objc_msgSend_count(v38, v13, v14);
    if (v15)
    {
      v17 = v15;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      while (1)
      {
        v22 = (void *)objc_msgSend_objectAtIndex_(v38, v16, v21);
        v24 = (void *)objc_msgSend_objectForKey_(v22, v23, (uint64_t)CFSTR("itemType"));
        if (objc_msgSend_isEqualToString_(v24, v25, (uint64_t)CFSTR("editTextView")))
        {
          v26 = (void *)objc_msgSend_objectForKey_(v35, v16, (uint64_t)CFSTR("tag"));
          if (objc_msgSend_integerValue(v26, v27, v28) != 1987203160)
          {
            v30 = v20 + 1;
            v29 = v19;
            v31 = v18;
            goto LABEL_17;
          }
        }
        if (objc_msgSend_isEqualToString_(v24, v16, (uint64_t)CFSTR("labelView")))
          break;
        if (objc_msgSend_isEqualToString_(v24, v16, (uint64_t)CFSTR("multilineLabelView")))
        {
          v31 = v18 + 1;
          v30 = v20;
          v29 = v19;
          v20 = v18;
          goto LABEL_17;
        }
LABEL_18:
        if (v17 == ++v21)
          return;
      }
      v29 = v19 + 1;
      v30 = v20;
      v31 = v18;
      v20 = v19;
LABEL_17:
      v32 = objc_msgSend_objectForKey_(v22, v16, (uint64_t)CFSTR("startValue"));
      objc_msgSend_setValue_forItemOfType_atItemTypeIndex_inCellAtIndexPath_(self, v33, v32, v24, v20, a3);
      v18 = v31;
      v19 = v29;
      v20 = v30;
      goto LABEL_18;
    }
  }
}

- (BOOL)isCellAtIndexPath:(id)a3 identicalToNewRow:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t CellDictForCellAtIndexPath;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  int isEqualToString;
  uint64_t v49;

  if (dword_2550F46C8 <= 800 && (dword_2550F46C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F46C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F46C8, (uint64_t)"-[TableViewManager isCellAtIndexPath:identicalToNewRow:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v49);
  CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a3);
  if (CellDictForCellAtIndexPath)
  {
    v13 = (void *)CellDictForCellAtIndexPath;
    v14 = objc_msgSend_objectForKey_(a4, v12, (uint64_t)CFSTR("representedObject"));
    v18 = objc_msgSend_objectForKey_(v13, v15, (uint64_t)CFSTR("representedObject"));
    LOBYTE(CellDictForCellAtIndexPath) = 0;
    if (v14)
    {
      if (v18)
      {
        CellDictForCellAtIndexPath = objc_msgSend_delegate(self, v16, v17);
        if (CellDictForCellAtIndexPath)
        {
          objc_msgSend_delegate(self, v19, v20);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v23 = (void *)objc_msgSend_delegate(self, v21, v22);
            LODWORD(CellDictForCellAtIndexPath) = objc_msgSend_isRepresentedObject_identicalToRepresentedObject_(v23, v24, v14, v18);
            if ((_DWORD)CellDictForCellAtIndexPath)
            {
              v26 = (void *)objc_msgSend_objectForKey_(a4, v25, (uint64_t)CFSTR("items"));
              v28 = (void *)objc_msgSend_objectForKey_(v13, v27, (uint64_t)CFSTR("items"));
              v31 = objc_msgSend_count(v26, v29, v30);
              v35 = objc_msgSend_count(v28, v32, v33);
              LOBYTE(CellDictForCellAtIndexPath) = 1;
              if (v31 == v35)
              {
                v36 = v31 - 1;
                if (v31 >= 1)
                {
                  v37 = 0;
                  do
                  {
                    v38 = (void *)objc_msgSend_objectAtIndex_(v26, v34, v37);
                    v40 = (void *)objc_msgSend_objectForKey_(v38, v39, (uint64_t)CFSTR("itemType"));
                    v42 = (void *)objc_msgSend_objectAtIndex_(v28, v41, v37);
                    v44 = objc_msgSend_objectForKey_(v42, v43, (uint64_t)CFSTR("itemType"));
                    isEqualToString = objc_msgSend_isEqualToString_(v40, v45, v44);
                    LOBYTE(CellDictForCellAtIndexPath) = 1;
                    if (!isEqualToString)
                      break;
                  }
                  while (v36 != v37++);
                }
              }
            }
          }
          else
          {
            LOBYTE(CellDictForCellAtIndexPath) = 0;
          }
        }
      }
    }
  }
  return CellDictForCellAtIndexPath;
}

- (BOOL)updateRowAtIndexPath:(id)a3 withNewRowInfo:(id)a4
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  int isCellAtIndexPath_identicalToNewRow;

  if (dword_2550F46C8 <= 800 && (dword_2550F46C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F46C8, 0x320u)))
  {
    v7 = objc_msgSend_section(a3, a2, (uint64_t)a3);
    objc_msgSend_row(a3, v8, v9);
    sub_21A698FDC((uint64_t)&dword_2550F46C8, (uint64_t)"-[TableViewManager updateRowAtIndexPath:withNewRowInfo:]", 800, (uint64_t)"section %d  row %d\n", v10, v11, v12, v13, v7);
  }
  isCellAtIndexPath_identicalToNewRow = objc_msgSend_isCellAtIndexPath_identicalToNewRow_(self, a2, (uint64_t)a3, a4);
  if (isCellAtIndexPath_identicalToNewRow)
    objc_msgSend_updateCellAtIndexPath_withNewRowInfo_(self, v14, (uint64_t)a3, a4);
  return isCellAtIndexPath_identicalToNewRow;
}

- (void)updateSectionDataInIdenticalTable:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F46C8 <= 800 && (dword_2550F46C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F46C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F46C8, (uint64_t)"-[TableViewManager updateSectionDataInIdenticalTable:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v21);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, a2, (uint64_t)&v29, v34, 16);
  if (v24)
  {
    v9 = 0;
    v23 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(a3);
        v11 = (void *)objc_msgSend_objectForKey_(*(void **)(*((_QWORD *)&v29 + 1) + 8 * i), v8, (uint64_t)CFSTR("sectionRows"));
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v25, v33, 16);
        if (v13)
        {
          v14 = v13;
          v15 = 0;
          v16 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v26 != v16)
                objc_enumerationMutation(v11);
              v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
              v19 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x24BDD15D8], v8, v15 + j, v9);
              objc_msgSend_updateCellAtIndexPath_withNewRowInfo_(self, v20, v19, v18);
            }
            v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v8, (uint64_t)&v25, v33, 16);
            v15 += j;
          }
          while (v14);
        }
        ++v9;
      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v8, (uint64_t)&v29, v34, 16);
    }
    while (v24);
  }
}

- (BOOL)checkIfSectionDataSameInTable:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  int isCellAtIndexPath_identicalToNewRow;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v7 = a3;
  v55 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F46C8 <= 800 && (dword_2550F46C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F46C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F46C8, (uint64_t)"-[TableViewManager checkIfSectionDataSameInTable:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v41);
  v9 = objc_msgSend_count(v7, a2, (uint64_t)a3);
  v12 = (void *)objc_msgSend_managedTableView(self, v10, v11);
  if (v9 == objc_msgSend_numberOfSections(v12, v13, v14))
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v15, (uint64_t)&v49, v54, 16);
    if (!v16)
    {
      LOBYTE(isCellAtIndexPath_identicalToNewRow) = 1;
      return isCellAtIndexPath_identicalToNewRow;
    }
    v18 = v16;
    v19 = 0;
    v20 = *(_QWORD *)v50;
    v42 = *(_QWORD *)v50;
    v43 = v7;
LABEL_8:
    v21 = 0;
    v44 = v18;
    while (1)
    {
      if (*(_QWORD *)v50 != v20)
        objc_enumerationMutation(v7);
      v22 = (void *)objc_msgSend_objectForKey_(*(void **)(*((_QWORD *)&v49 + 1) + 8 * v21), v17, (uint64_t)CFSTR("sectionRows"));
      v25 = objc_msgSend_count(v22, v23, v24);
      v28 = (void *)objc_msgSend_managedTableView(self, v26, v27);
      if (v25 != objc_msgSend_numberOfRowsInSection_(v28, v29, v19))
        break;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v30, (uint64_t)&v45, v53, 16);
      if (v31)
      {
        v32 = v31;
        v33 = 0;
        v34 = *(_QWORD *)v46;
LABEL_14:
        v35 = 0;
        while (1)
        {
          if (*(_QWORD *)v46 != v34)
            objc_enumerationMutation(v22);
          v36 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v35);
          v37 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x24BDD15D8], v17, v33 + v35, v19);
          isCellAtIndexPath_identicalToNewRow = objc_msgSend_isCellAtIndexPath_identicalToNewRow_(self, v38, v37, v36);
          if (!isCellAtIndexPath_identicalToNewRow)
            return isCellAtIndexPath_identicalToNewRow;
          if (v32 == ++v35)
          {
            v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v17, (uint64_t)&v45, v53, 16);
            v33 += v35;
            if (v32)
              goto LABEL_14;
            break;
          }
        }
      }
      ++v19;
      ++v21;
      v7 = v43;
      v20 = v42;
      if (v21 == v44)
      {
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v17, (uint64_t)&v49, v54, 16);
        LOBYTE(isCellAtIndexPath_identicalToNewRow) = 1;
        if (v18)
          goto LABEL_8;
        return isCellAtIndexPath_identicalToNewRow;
      }
    }
  }
  LOBYTE(isCellAtIndexPath_identicalToNewRow) = 0;
  return isCellAtIndexPath_identicalToNewRow;
}

- (BOOL)updateSectionsIfMatchingExisting:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  int v10;
  uint64_t v12;

  if (dword_2550F46C8 <= 800 && (dword_2550F46C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F46C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F46C8, (uint64_t)"-[TableViewManager updateSectionsIfMatchingExisting:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v12);
  v10 = objc_msgSend_checkIfSectionDataSameInTable_(self, a2, (uint64_t)a3);
  if (v10)
    objc_msgSend_updateSectionDataInIdenticalTable_(self, v9, (uint64_t)a3);
  return v10;
}

- (void)deleteRowsAtIndexPaths:(id)a3 withRowAnimation:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  unint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  const char *v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  char v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  const char *v81;
  void *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  void *v86;
  const char *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  char v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t j;
  uint64_t v102;
  uint64_t v103;
  UITableView *managedTableView;
  const char *v105;
  uint64_t v106;
  const char *v107;
  TableViewManager *v109;
  id v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
  {
    v5 = objc_msgSend_managedTableView(self, a2, (uint64_t)a3);
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager deleteRowsAtIndexPaths:withRowAnimation:]", 800, (uint64_t)"managedTableView %@\n", v6, v7, v8, v9, v5);
  }
  v109 = self;
  if (objc_msgSend_count(a3, a2, (uint64_t)a3))
  {
    v11 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, v10, (uint64_t)CFSTR("tableSectionArray"));
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    v123 = 0u;
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v12, (uint64_t)&v120, v126, 16);
    if (v13)
    {
      v16 = v13;
      v17 = *(_QWORD *)v121;
LABEL_8:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v121 != v17)
          objc_enumerationMutation(a3);
        v19 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v18);
        v20 = objc_msgSend_row(v19, v14, v15);
        v23 = objc_msgSend_section(v19, v21, v22);
        if (v23 >= objc_msgSend_count(v11, v24, v25))
          break;
        v27 = (void *)objc_msgSend_objectAtIndex_(v11, v26, v23);
        v29 = (void *)objc_msgSend_objectForKey_(v27, v28, (uint64_t)CFSTR("sectionRows"));
        if (v20 >= objc_msgSend_count(v29, v30, v31))
          break;
        if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
          sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager deleteRowsAtIndexPaths:withRowAnimation:]", 800, (uint64_t)"row %d in section %d valid to delete\n", v32, v33, v34, v35, v20);
        if (v16 == ++v18)
        {
          v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v14, (uint64_t)&v120, v126, 16);
          if (v16)
            goto LABEL_8;
          goto LABEL_19;
        }
      }
    }
    else
    {
LABEL_19:
      v36 = (void *)objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCEB8], v14, (uint64_t)a3);
      objc_msgSend_sortUsingSelector_(v36, v37, (uint64_t)sel_compare_);
      if (objc_msgSend_count(v36, v38, v39))
      {
        v42 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v40, v41);
        v111 = (id)objc_msgSend_array(MEMORY[0x24BDBCEB8], v43, v44);
        v46 = (void *)objc_msgSend_objectAtIndex_(v36, v45, 0);
        v49 = objc_msgSend_section(v46, v47, v48);
        v51 = (void *)objc_msgSend_objectAtIndex_(v11, v50, v49);
        v53 = (void *)objc_msgSend_objectForKey_(v51, v52, (uint64_t)CFSTR("sectionRows"));
        v116 = 0u;
        v117 = 0u;
        v118 = 0u;
        v119 = 0u;
        v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v54, (uint64_t)&v116, v125, 16);
        if (v55)
        {
          v58 = v55;
          v59 = *(_QWORD *)v117;
          do
          {
            for (i = 0; i != v58; ++i)
            {
              if (*(_QWORD *)v117 != v59)
                objc_enumerationMutation(v36);
              v61 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
              if (objc_msgSend_section(v61, v56, v57) == v49)
              {
                v64 = objc_msgSend_row(v61, v62, v63);
                v66 = objc_msgSend_objectAtIndex_(v53, v65, v64);
                objc_msgSend_addObject_(v42, v67, v66);
              }
              else
              {
                objc_msgSend_removeObjectsInArray_(v53, v62, (uint64_t)v42);
                v69 = (void *)objc_msgSend_objectAtIndex_(v11, v68, v49);
                v71 = (void *)objc_msgSend_objectForKey_(v69, v70, (uint64_t)CFSTR("rowsOKToBeEmpty"));
                v74 = objc_msgSend_BOOLValue(v71, v72, v73);
                if (!objc_msgSend_count(v53, v75, v76) && (v74 & 1) == 0)
                  objc_msgSend_addObject_(v111, v77, (uint64_t)v69);
                objc_msgSend_removeAllObjects(v42, v77, v78);
                v49 = objc_msgSend_section(v61, v79, v80);
                v82 = (void *)objc_msgSend_objectAtIndex_(v11, v81, v49);
                v53 = (void *)objc_msgSend_objectForKey_(v82, v83, (uint64_t)CFSTR("sectionRows"));
              }
            }
            v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v56, (uint64_t)&v116, v125, 16);
          }
          while (v58);
        }
        if (objc_msgSend_count(v42, v56, v57))
        {
          objc_msgSend_removeObjectsInArray_(v53, v84, (uint64_t)v42);
          v86 = (void *)objc_msgSend_objectAtIndex_(v11, v85, v49);
          v88 = (void *)objc_msgSend_objectForKey_(v86, v87, (uint64_t)CFSTR("rowsOKToBeEmpty"));
          v91 = objc_msgSend_BOOLValue(v88, v89, v90);
          if (!objc_msgSend_count(v53, v92, v93) && (v91 & 1) == 0)
          {
            v94 = objc_msgSend_objectAtIndex_(v11, v84, v49);
            objc_msgSend_addObject_(v111, v95, v94);
          }
        }
        objc_msgSend_deleteRowsAtIndexPaths_withRowAnimation_(v109->_managedTableView, v84, (uint64_t)a3, a4);
        v114 = 0u;
        v115 = 0u;
        v112 = 0u;
        v113 = 0u;
        v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v96, (uint64_t)&v112, v124, 16);
        if (v97)
        {
          v99 = v97;
          v100 = *(_QWORD *)v113;
          do
          {
            for (j = 0; j != v99; ++j)
            {
              if (*(_QWORD *)v113 != v100)
                objc_enumerationMutation(v111);
              v102 = objc_msgSend_indexOfObject_(v11, v98, *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * j));
              if (v102 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v103 = v102;
                objc_msgSend_removeObjectAtIndex_(v11, v98, v102);
                managedTableView = v109->_managedTableView;
                v106 = objc_msgSend_indexSetWithIndex_(MEMORY[0x24BDD15E0], v105, v103);
                objc_msgSend_deleteSections_withRowAnimation_(managedTableView, v107, v106, a4);
              }
            }
            v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v98, (uint64_t)&v112, v124, 16);
          }
          while (v99);
        }
      }
    }
  }
}

- (void)deleteRowInSection:(unint64_t)a3 withTag:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
  {
    v7 = objc_msgSend_managedTableView(self, a2, a3);
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager deleteRowInSection:withTag:]", 800, (uint64_t)"managedTableView %@\n", v8, v9, v10, v11, v7);
  }
  v12 = (void *)objc_msgSend_indexPathOfCellWithTag_(self, a2, a4);
  if (v12)
  {
    v15 = (uint64_t)v12;
    if (objc_msgSend_section(v12, v13, v14) == a3)
    {
      v17 = objc_msgSend_arrayWithObject_(MEMORY[0x24BDBCE30], v16, v15);
      objc_msgSend_deleteRowsAtIndexPaths_withRowAnimation_(self, v18, v17, 100);
    }
  }
}

- (void)cleanTableViewForReuse
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
  {
    v4 = objc_msgSend_managedTableView(self, a2, v2);
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager cleanTableViewForReuse]", 800, (uint64_t)"managedTableView %@\n", v5, v6, v7, v8, v4);
  }
  v9 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  if (objc_msgSend_count(v9, v10, v11))
  {
    v14 = objc_msgSend_areAnimationsEnabled(MEMORY[0x24BDF6F90], v12, v13);
    objc_msgSend_setAnimationsEnabled_(MEMORY[0x24BDF6F90], v15, 0);
    objc_msgSend_endEditing(self, v16, v17);
    v18 = (void *)MEMORY[0x24BDD15E0];
    v21 = objc_msgSend_count(v9, v19, v20);
    v23 = objc_msgSend_indexSetWithIndexesInRange_(v18, v22, 0, v21);
    objc_msgSend_deleteSections_withRowAnimation_(self, v24, v23, 5);
    objc_msgSend_setAnimationsEnabled_(MEMORY[0x24BDF6F90], v25, v14);
  }
}

- (void)deleteAllRowsInSectionCore:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
  {
    v5 = objc_msgSend_managedTableView(self, a2, a3);
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager deleteAllRowsInSectionCore:]", 800, (uint64_t)"managedTableView %@\n", v6, v7, v8, v9, v5);
  }
  v10 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  if (objc_msgSend_count(v10, v11, v12) > a3)
  {
    v14 = (void *)objc_msgSend_objectAtIndex_(v10, v13, a3);
    v16 = (void *)objc_msgSend_objectForKey_(v14, v15, (uint64_t)CFSTR("sectionRows"));
    objc_msgSend_removeAllObjects(v16, v17, v18);
  }
}

- (void)deleteAllRowsInSection:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager deleteAllRowsInSection:]", 800, (uint64_t)"attempting to delete everything in section %d\n", v3, v4, v5, v6, a3);
  objc_msgSend_deleteAllRowsInSectionCore_(self, a2, a3);
  MEMORY[0x24BEDD108](self, sel_reloadSection_, a3);
}

- (void)deleteSections:(id)a3 withRowAnimation:(int64_t)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  _QWORD v13[7];

  v7 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  v10 = objc_msgSend_count(v7, v8, v9);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_21A713050;
  v13[3] = &unk_24DD07AD8;
  v13[5] = v7;
  v13[6] = v10;
  v13[4] = self;
  objc_msgSend_enumerateIndexesWithOptions_usingBlock_(a3, v11, 2, v13);
  objc_msgSend_deleteSections_withRowAnimation_(self->_managedTableView, v12, (uint64_t)a3, a4);
}

- (void)recordInitialSelectedMenuItemsForNewSection:(int64_t)a3
{
  void *SectionDictForSection;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t Index;
  const char *v20;
  uint64_t i;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;

  SectionDictForSection = (void *)objc_msgSend_getSectionDictForSection_(self, a2, a3);
  if (SectionDictForSection)
  {
    v6 = SectionDictForSection;
    v7 = (void *)objc_msgSend_objectForKey_(SectionDictForSection, v5, (uint64_t)CFSTR("sectionIsMenu"));
    if (objc_msgSend_BOOLValue(v7, v8, v9))
    {
      v11 = objc_msgSend_objectForKey_(v6, v10, (uint64_t)CFSTR("sectionRows"));
      if (v11)
      {
        v13 = (void *)v11;
        v14 = (void *)objc_msgSend_objectForKey_(v6, v12, (uint64_t)CFSTR("selectedMenuItemIndexSet"));
        v16 = (void *)objc_msgSend_objectForKey_(v6, v15, (uint64_t)CFSTR("selectedMenuItemTag"));
        if (v14)
        {
          Index = objc_msgSend_firstIndex(v14, v17, v18);
          if (Index != 0x7FFFFFFFFFFFFFFFLL)
          {
            for (i = Index; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend_indexGreaterThanIndex_(v14, v26, i))
            {
              v22 = (void *)objc_msgSend_objectAtIndex_(v13, v20, i);
              v24 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v23, 1);
              objc_msgSend_setObject_forKey_(v22, v25, v24, CFSTR("menuSelected"));
            }
          }
        }
        else if (v16)
        {
          v27 = objc_msgSend_integerValue(v16, v17, v18);
          v29 = (void *)objc_msgSend_indexPathOfCellWithTag_(self, v28, v27);
          v32 = objc_msgSend_row(v29, v30, v31);
          v34 = (void *)objc_msgSend_objectAtIndex_(v13, v33, v32);
          v36 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v35, 1);
          objc_msgSend_setObject_forKey_(v34, v37, v36, CFSTR("menuSelected"));
        }
      }
    }
  }
}

- (void)addSectionInfo:(id)a3 animated:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
  {
    v7 = objc_msgSend_managedTableView(self, a2, (uint64_t)a3);
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager addSectionInfo:animated:]", 800, (uint64_t)"managedTableView %@\n", v8, v9, v10, v11, v7);
  }
  v12 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  v15 = v12;
  if (a4)
  {
    v16 = objc_msgSend_count(v12, v13, v14);
    objc_msgSend_insertSectionInfo_atIndex_withRowAnimation_(self, v17, (uint64_t)a3, v16, 0);
  }
  else
  {
    objc_msgSend_setAnimationsEnabled_(MEMORY[0x24BDF6F90], v13, 0);
    v20 = objc_msgSend_count(v15, v18, v19);
    objc_msgSend_insertSectionInfo_atIndex_withRowAnimation_(self, v21, (uint64_t)a3, v20, 5);
    objc_msgSend_setAnimationsEnabled_(MEMORY[0x24BDF6F90], v22, 1);
  }
}

- (void)addSectionInfo:(id)a3
{
  objc_msgSend_addSectionInfo_animated_(self, a2, (uint64_t)a3, 1);
}

- (void)insertSectionInfo:(id)a3 atIndex:(unint64_t)a4 withRowAnimation:(int64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager insertSectionInfo:atIndex:withRowAnimation:]", 800, (uint64_t)"\n", a5, v5, v6, v7, v23);
  v12 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  if (objc_msgSend_count(v12, v13, v14) <= a4)
    objc_msgSend_addObject_(v12, v15, (uint64_t)a3);
  else
    objc_msgSend_insertObject_atIndex_(v12, v15, (uint64_t)a3, a4);
  objc_msgSend_recordInitialSelectedMenuItemsForNewSection_(self, v16, a4);
  v19 = (void *)objc_msgSend_managedTableView(self, v17, v18);
  v21 = objc_msgSend_indexSetWithIndex_(MEMORY[0x24BDD15E0], v20, a4);
  objc_msgSend_insertSections_withRowAnimation_(v19, v22, v21, a5);
}

- (void)deleteSection:(unint64_t)a3
{
  uint64_t v4;
  const char *v5;

  v4 = objc_msgSend_indexSetWithIndex_(MEMORY[0x24BDD15E0], a2, a3);
  objc_msgSend_deleteSections_withRowAnimation_(self, v5, v4, 0);
}

- (void)deleteSectionWithIdentifier:(id)a3 animated:(BOOL)a4
{
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;

  v6 = objc_msgSend_indexOfSectionWithIdentifier_(self, a2, (uint64_t)a3);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v6;
    if (a4)
    {
      v9 = objc_msgSend_indexSetWithIndex_(MEMORY[0x24BDD15E0], v7, v6);
      objc_msgSend_deleteSections_withRowAnimation_(self, v10, v9, 0);
    }
    else
    {
      objc_msgSend_setAnimationsEnabled_(MEMORY[0x24BDF6F90], v7, 0);
      v12 = objc_msgSend_indexSetWithIndex_(MEMORY[0x24BDD15E0], v11, v8);
      objc_msgSend_deleteSections_withRowAnimation_(self, v13, v12, 5);
      objc_msgSend_setAnimationsEnabled_(MEMORY[0x24BDF6F90], v14, 1);
    }
  }
}

- (void)deleteSectionWithIdentifier:(id)a3
{
  objc_msgSend_deleteSectionWithIdentifier_animated_(self, a2, (uint64_t)a3, 1);
}

- (void)setSectionValue:(id)a3 forKey:(id)a4 inSection:(unint64_t)a5
{
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;

  v8 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  if (objc_msgSend_count(v8, v9, v10) > a5)
  {
    v12 = (void *)objc_msgSend_objectAtIndex_(v8, v11, a5);
    objc_msgSend_setObject_forKey_(v12, v13, (uint64_t)a3, a4);
  }
}

- (id)commonAddOptionalBasicImage:(id)a3 withNeighborItem:(id)a4 toCellItems:(id)a5
{
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;

  if (!a3)
    return 0;
  v8 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], a2, (uint64_t)CFSTR("imageView"), CFSTR("itemType"), CFSTR("left"), CFSTR("position"), 0);
  objc_msgSend_setObject_forKey_(v8, v9, (uint64_t)a3, CFSTR("startValue"));
  if (a4)
  {
    objc_msgSend_setValue_forKey_(v8, v10, (uint64_t)a4, CFSTR("neighbor"));
    objc_msgSend_setValue_forKey_(v8, v11, (uint64_t)CFSTR("right"), CFSTR("position"));
  }
  objc_msgSend_addObject_(a5, v10, (uint64_t)v8);
  return v8;
}

- (id)commonAddOptionalStaticText:(id)a3 withNeighborItem:(id)a4 toCellItems:(id)a5
{
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;

  v8 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], a2, (uint64_t)CFSTR("labelView"), CFSTR("itemType"), 0);
  v10 = v8;
  if (a3)
    objc_msgSend_setValue_forKey_(v8, v9, (uint64_t)a3, CFSTR("startValue"));
  if (a4)
  {
    objc_msgSend_setValue_forKey_(v10, v9, (uint64_t)a4, CFSTR("neighbor"));
    objc_msgSend_setValue_forKey_(v10, v11, (uint64_t)CFSTR("right"), CFSTR("position"));
  }
  objc_msgSend_addObject_(a5, v9, (uint64_t)v10);
  return v10;
}

- (id)createRowStyleBasicWithImage:(id)a3 text1:(id)a4 text2:(id)a5 withTag:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  id v18;
  UIColor *detailTextColor;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  uint64_t v41;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleBasicWithImage:text1:text2:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v41);
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = objc_msgSend_commonAddOptionalBasicImage_withNeighborItem_toCellItems_(self, v14, (uint64_t)a3, 0, v13);
  objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v16, (uint64_t)a4, v15, v13);
  if (a5)
  {
    v18 = objc_alloc(MEMORY[0x24BDBCED8]);
    detailTextColor = self->_detailTextColor;
    v22 = objc_msgSend_systemLabelFont(TableViewManager, v20, v21);
    v23 = (void *)MEMORY[0x24BDD16E0];
    v26 = (void *)objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], v24, v25);
    v29 = objc_msgSend_userInterfaceLayoutDirection(v26, v27, v28);
    v31 = objc_msgSend_numberWithInteger_(v23, v30, 2 * (v29 == 0));
    v33 = (void *)objc_msgSend_initWithObjectsAndKeys_(v18, v32, (uint64_t)CFSTR("labelView"), CFSTR("itemType"), detailTextColor, CFSTR("color"), v22, CFSTR("font"), v31, CFSTR("alignment"), CFSTR("right"), CFSTR("position"), 0);
    objc_msgSend_setObject_forKey_(v33, v34, (uint64_t)a5, CFSTR("startValue"));
    objc_msgSend_addObject_(v13, v35, (uint64_t)v33);

  }
  v36 = (void *)MEMORY[0x24BDBCED8];
  v37 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v17, a6);
  v39 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v36, v38, (uint64_t)v13, CFSTR("items"), v37, CFSTR("tag"), 0);

  return v39;
}

- (id)createRowStyleSubtitleWitImage:(id)a3 mainText:(id)a4 subtitleText:(id)a5 withTag:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  id v20;
  UIColor *subtitleColor;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t Object;
  const char *v30;
  void *v31;
  const char *v32;
  const char *v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  uint64_t v39;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleSubtitleWitImage:mainText:subtitleText:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v39);
  if (!a4)
    return 0;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = objc_msgSend_commonAddOptionalBasicImage_withNeighborItem_toCellItems_(self, v14, (uint64_t)a3, 0, v13);
  v17 = (void *)objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v16, (uint64_t)a4, v15, v13);
  objc_msgSend_setValue_forKey_(v17, v18, (uint64_t)CFSTR("topRight"), CFSTR("position"));
  if (a5)
  {
    v20 = objc_alloc(MEMORY[0x24BDBCED8]);
    subtitleColor = self->_subtitleColor;
    v24 = objc_msgSend_smallSystemLabelFont(TableViewManager, v22, v23);
    v26 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v25, 4);
    Object = objc_msgSend_lastObject(v13, v27, v28);
    v31 = (void *)objc_msgSend_initWithObjectsAndKeys_(v20, v30, (uint64_t)CFSTR("labelView"), CFSTR("itemType"), subtitleColor, CFSTR("color"), v24, CFSTR("font"), v26, CFSTR("alignment"), Object, CFSTR("neighbor"), CFSTR("bottomLeft"), CFSTR("position"), 0);
    objc_msgSend_setObject_forKey_(v31, v32, (uint64_t)a5, CFSTR("startValue"));
    objc_msgSend_addObject_(v13, v33, (uint64_t)v31);

  }
  v34 = (void *)MEMORY[0x24BDBCED8];
  v35 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v19, a6);
  v37 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v34, v36, (uint64_t)v13, CFSTR("items"), v35, CFSTR("tag"), 0);

  return v37;
}

- (id)createRowStyleSubtitleWithRightImage:(id)a3 subtitleText:(id)a4 rightImage:(id)a5 withTag:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  id v19;
  UIColor *subtitleColor;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  id v32;
  const char *v33;
  void *v34;
  const char *v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  void *v40;
  uint64_t v42;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleSubtitleWithRightImage:subtitleText:rightImage:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v42);
  if (!a3)
    return 0;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = objc_alloc(MEMORY[0x24BDBCED8]);
  v16 = (void *)objc_msgSend_initWithObjectsAndKeys_(v14, v15, (uint64_t)CFSTR("labelView"), CFSTR("itemType"), a3, CFSTR("startValue"), CFSTR("topLeft"), CFSTR("position"), 0);
  objc_msgSend_addObject_(v13, v17, (uint64_t)v16);

  if (a4)
  {
    v19 = objc_alloc(MEMORY[0x24BDBCED8]);
    subtitleColor = self->_subtitleColor;
    v23 = objc_msgSend_smallSystemLabelFont(TableViewManager, v21, v22);
    v25 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v24, 4);
    v27 = objc_msgSend_objectAtIndex_(v13, v26, 0);
    v29 = (void *)objc_msgSend_initWithObjectsAndKeys_(v19, v28, (uint64_t)CFSTR("labelView"), CFSTR("itemType"), subtitleColor, CFSTR("color"), v23, CFSTR("font"), v25, CFSTR("alignment"), v27, CFSTR("neighbor"), CFSTR("bottomLeft"), CFSTR("position"), 0);
    objc_msgSend_setObject_forKey_(v29, v30, (uint64_t)a4, CFSTR("startValue"));
    objc_msgSend_addObject_(v13, v31, (uint64_t)v29);

  }
  if (a5)
  {
    v32 = objc_alloc(MEMORY[0x24BDBCED8]);
    v34 = (void *)objc_msgSend_initWithObjectsAndKeys_(v32, v33, (uint64_t)CFSTR("imageView"), CFSTR("itemType"), CFSTR("right"), CFSTR("position"), 0);
    objc_msgSend_setObject_forKey_(v34, v35, (uint64_t)a5, CFSTR("startValue"));
    objc_msgSend_addObject_(v13, v36, (uint64_t)v34);

  }
  v37 = (void *)MEMORY[0x24BDBCED8];
  v38 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v18, a6);
  v40 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v37, v39, (uint64_t)v13, CFSTR("items"), v38, CFSTR("tag"), 0);

  return v40;
}

- (id)createRowStyleSubtitleWithRightText:(id)a3 subtitleText:(id)a4 rightText:(id)a5 withTag:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  id v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  id v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  id v23;
  UIColor *subtitleColor;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  uint64_t v41;
  unint64_t v42;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleSubtitleWithRightText:subtitleText:rightText:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v41);
  if (!a3)
    return 0;
  v42 = a6;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = objc_alloc(MEMORY[0x24BDBCED8]);
  v16 = (void *)objc_msgSend_initWithObjectsAndKeys_(v14, v15, (uint64_t)CFSTR("labelView"), CFSTR("itemType"), a3, CFSTR("startValue"), CFSTR("topLeft"), CFSTR("position"), 0);
  objc_msgSend_addObject_(v13, v17, (uint64_t)v16);

  v18 = objc_alloc(MEMORY[0x24BDBCED8]);
  v20 = (void *)objc_msgSend_initWithObjectsAndKeys_(v18, v19, (uint64_t)CFSTR("labelView"), CFSTR("itemType"), CFSTR("right"), CFSTR("position"), a5, CFSTR("startValue"), 0);
  objc_msgSend_addObject_(v13, v21, (uint64_t)v20);

  if (a4)
  {
    v23 = objc_alloc(MEMORY[0x24BDBCED8]);
    subtitleColor = self->_subtitleColor;
    v27 = objc_msgSend_smallSystemLabelFont(TableViewManager, v25, v26);
    v29 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v28, 4);
    v31 = objc_msgSend_objectAtIndex_(v13, v30, 0);
    v33 = (void *)objc_msgSend_initWithObjectsAndKeys_(v23, v32, (uint64_t)CFSTR("labelView"), CFSTR("itemType"), subtitleColor, CFSTR("color"), v27, CFSTR("font"), v29, CFSTR("alignment"), v31, CFSTR("neighbor"), CFSTR("bottomLeft"), CFSTR("position"), 0);
    objc_msgSend_setObject_forKey_(v33, v34, (uint64_t)a4, CFSTR("startValue"));
    objc_msgSend_addObject_(v13, v35, (uint64_t)v33);

  }
  v36 = (void *)MEMORY[0x24BDBCED8];
  v37 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v22, v42);
  v39 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v36, v38, (uint64_t)v13, CFSTR("items"), v37, CFSTR("tag"), 0);

  return v39;
}

- (id)createRowStyleBasicWithText:(id)a3 centerImage:(id)a4 text2:(id)a5 withTag:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  id v18;
  UIColor *detailTextColor;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  uint64_t v41;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleBasicWithText:centerImage:text2:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v41);
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v14, (uint64_t)a3, 0, v13);
  objc_msgSend_commonAddOptionalBasicImage_withNeighborItem_toCellItems_(self, v16, (uint64_t)a4, v15, v13);
  if (a5)
  {
    v18 = objc_alloc(MEMORY[0x24BDBCED8]);
    detailTextColor = self->_detailTextColor;
    v22 = objc_msgSend_systemLabelFont(TableViewManager, v20, v21);
    v23 = (void *)MEMORY[0x24BDD16E0];
    v26 = (void *)objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], v24, v25);
    v29 = objc_msgSend_userInterfaceLayoutDirection(v26, v27, v28);
    v31 = objc_msgSend_numberWithInteger_(v23, v30, 2 * (v29 == 0));
    v33 = (void *)objc_msgSend_initWithObjectsAndKeys_(v18, v32, (uint64_t)CFSTR("labelView"), CFSTR("itemType"), detailTextColor, CFSTR("color"), v22, CFSTR("font"), v31, CFSTR("alignment"), CFSTR("right"), CFSTR("position"), 0);
    objc_msgSend_setObject_forKey_(v33, v34, (uint64_t)a5, CFSTR("startValue"));
    objc_msgSend_addObject_(v13, v35, (uint64_t)v33);

  }
  v36 = (void *)MEMORY[0x24BDBCED8];
  v37 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v17, a6);
  v39 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v36, v38, (uint64_t)v13, CFSTR("items"), v37, CFSTR("tag"), 0);

  return v39;
}

- (id)createRowStyleBasicEditableWithImage:(id)a3 labelText:(id)a4 currentValue:(id)a5 placeholderText:(id)a6 isSecure:(BOOL)a7 keyboardType:(int64_t)a8 withTag:(unint64_t)a9
{
  _BOOL4 v10;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const __CFString *v20;
  id v21;
  UIColor *editTextColor;
  const char *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  uint64_t v39;

  v10 = a7;
  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleBasicEditableWithImage:labelText:currentValue:placeholderText:isSecure:keyboardType:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, (uint64_t)a6, a7, a8, v39);
  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = objc_msgSend_commonAddOptionalBasicImage_withNeighborItem_toCellItems_(self, v17, (uint64_t)a3, 0, v16);
  objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v19, (uint64_t)a4, v18, v16);
  if (a5)
    v20 = (const __CFString *)a5;
  else
    v20 = &stru_24DD08368;
  v21 = objc_alloc(MEMORY[0x24BDBCED8]);
  editTextColor = self->_editTextColor;
  v24 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v23, 4);
  v26 = (void *)objc_msgSend_initWithObjectsAndKeys_(v21, v25, (uint64_t)CFSTR("editTextView"), CFSTR("itemType"), v20, CFSTR("startValue"), editTextColor, CFSTR("color"), CFSTR("right"), CFSTR("position"), v24, CFSTR("alignment"), 0);
  v28 = v26;
  if (a6)
    objc_msgSend_setObject_forKey_(v26, v27, (uint64_t)a6, CFSTR("placeholder"));
  if (v10)
  {
    v29 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v27, 1);
    objc_msgSend_setObject_forKey_(v28, v30, v29, CFSTR("secure"));
  }
  if (a8)
  {
    v31 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v27, a8);
    objc_msgSend_setObject_forKey_(v28, v32, v31, CFSTR("keyboardType"));
  }
  objc_msgSend_addObject_(v16, v27, (uint64_t)v28);

  v33 = (void *)MEMORY[0x24BDBCED8];
  v35 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v34, a9);
  v37 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v33, v36, (uint64_t)v16, CFSTR("items"), v35, CFSTR("tag"), 0);

  return v37;
}

- (id)createRowStyleBasicOnOffWithImage:(id)a3 labelText:(id)a4 isOn:(BOOL)a5 withTag:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v9;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  uint64_t v29;

  v9 = a5;
  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleBasicOnOffWithImage:labelText:isOn:withTag:]", 800, (uint64_t)"\n", a5, a6, v6, v7, v29);
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = objc_msgSend_commonAddOptionalBasicImage_withNeighborItem_toCellItems_(self, v14, (uint64_t)a3, 0, v13);
  objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v16, (uint64_t)a4, v15, v13);
  v17 = objc_alloc(MEMORY[0x24BDBCED8]);
  v19 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v18, v9);
  v21 = (void *)objc_msgSend_initWithObjectsAndKeys_(v17, v20, (uint64_t)CFSTR("switchView"), CFSTR("itemType"), CFSTR("right"), CFSTR("position"), v19, CFSTR("startValue"), 0);
  objc_msgSend_addObject_(v13, v22, (uint64_t)v21);

  v23 = (void *)MEMORY[0x24BDBCED8];
  v25 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v24, a6);
  v27 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v23, v26, (uint64_t)v13, CFSTR("items"), v25, CFSTR("tag"), 0);

  return v27;
}

- (id)createRowStyleBasicWholeCellButton:(id)a3 withTag:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  uint64_t v23;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleBasicWholeCellButton:withTag:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v23);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = objc_alloc(MEMORY[0x24BDBCED8]);
  v13 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v12, 1);
  v15 = (void *)objc_msgSend_initWithObjectsAndKeys_(v11, v14, (uint64_t)CFSTR("wholeCellButtonView"), CFSTR("itemType"), a3, CFSTR("startValue"), CFSTR("center"), CFSTR("position"), v13, CFSTR("alignment"), 0);
  objc_msgSend_addObject_(v10, v16, (uint64_t)v15);

  v17 = (void *)MEMORY[0x24BDBCED8];
  v19 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v18, a4);
  v21 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v17, v20, (uint64_t)v10, CFSTR("items"), v19, CFSTR("tag"), 0);

  return v21;
}

- (id)createRowStyleBasicButtons:(id)a3 title2:(id)a4 withTag:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  const char *v18;
  const char *v19;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  uint64_t v28;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleBasicButtons:title2:withTag:]", 800, (uint64_t)"\n", a5, v5, v6, v7, v28);
  if (!a3)
    return 0;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = objc_alloc(MEMORY[0x24BDBCED8]);
  v14 = (void *)objc_msgSend_initWithObjectsAndKeys_(v12, v13, (uint64_t)CFSTR("buttonView"), CFSTR("itemType"), a3, CFSTR("startValue"), 0);
  v16 = v14;
  if (a4)
  {
    objc_msgSend_addObject_(v11, v15, (uint64_t)v14);

    v17 = objc_alloc(MEMORY[0x24BDBCED8]);
    v16 = (void *)objc_msgSend_initWithObjectsAndKeys_(v17, v18, (uint64_t)CFSTR("buttonView"), CFSTR("itemType"), a4, CFSTR("startValue"), CFSTR("right"), CFSTR("position"), 0);
  }
  else
  {
    objc_msgSend_setObject_forKey_(v14, v15, (uint64_t)CFSTR("center"), CFSTR("position"));
  }
  objc_msgSend_addObject_(v11, v19, (uint64_t)v16);

  v21 = (void *)MEMORY[0x24BDBCED8];
  v23 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v22, a5);
  v25 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v24, 1);
  v27 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v21, v26, (uint64_t)v11, CFSTR("items"), v23, CFSTR("tag"), v25, CFSTR("noBackground"), 0);

  return v27;
}

- (id)createRowStyleTitledStaticMultiline:(id)a3 titleImage:(id)a4 bodyText:(id)a5 withTag:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  id v24;
  UIColor *detailTextColor;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  uint64_t v51;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleTitledStaticMultiline:titleImage:bodyText:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v51);
  if (!a3 || !a5)
    return 0;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v15 = (void *)objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v14, (uint64_t)a3, 0, v13);
  objc_msgSend_setObject_forKey_(v15, v16, (uint64_t)CFSTR("topLeft"), CFSTR("position"));
  if (a4)
  {
    v17 = objc_alloc(MEMORY[0x24BDBCED8]);
    v19 = objc_msgSend_objectAtIndex_(v13, v18, 0);
    v21 = (void *)objc_msgSend_initWithObjectsAndKeys_(v17, v20, (uint64_t)CFSTR("imageView"), CFSTR("itemType"), CFSTR("right"), CFSTR("position"), v19, CFSTR("neighbor"), 0);
    objc_msgSend_setObject_forKey_(v21, v22, (uint64_t)a4, CFSTR("startValue"));
    objc_msgSend_addObject_(v13, v23, (uint64_t)v21);

  }
  v24 = objc_alloc(MEMORY[0x24BDBCED8]);
  detailTextColor = self->_detailTextColor;
  v28 = objc_msgSend_systemLabelFont(TableViewManager, v26, v27);
  v30 = objc_msgSend_objectAtIndex_(v13, v29, 0);
  v31 = (void *)MEMORY[0x24BDD16E0];
  v34 = (void *)objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], v32, v33);
  v37 = objc_msgSend_userInterfaceLayoutDirection(v34, v35, v36);
  v39 = objc_msgSend_numberWithInteger_(v31, v38, 2 * (v37 == 0));
  v41 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v40, 1);
  v43 = (void *)objc_msgSend_initWithObjectsAndKeys_(v24, v42, (uint64_t)CFSTR("multilineLabelView"), CFSTR("itemType"), a5, CFSTR("startValue"), detailTextColor, CFSTR("color"), v28, CFSTR("font"), v30, CFSTR("neighbor"), CFSTR("right"), CFSTR("position"), v39, CFSTR("alignment"), v41, CFSTR("canCopy"), 0);
  objc_msgSend_addObject_(v13, v44, (uint64_t)v43);

  v45 = (void *)MEMORY[0x24BDBCED8];
  v47 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v46, a6);
  v49 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v45, v48, (uint64_t)v13, CFSTR("items"), v47, CFSTR("tag"), 0);

  return v49;
}

- (id)createRowStyleTitledParagraph:(id)a3 titleImage:(id)a4 bodyText:(id)a5 withTag:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  void *v25;
  UIColor *detailTextColor;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v40;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleTitledParagraph:titleImage:bodyText:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v40);
  if (!a3 || !a5)
    return 0;
  v13 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, (uint64_t)a3);
  v15 = (void *)objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v14, (uint64_t)a3, 0, v13);
  objc_msgSend_setObject_forKey_(v15, v16, (uint64_t)CFSTR("topLeft"), CFSTR("position"));
  if (a4)
  {
    v19 = (void *)MEMORY[0x24BDBCED8];
    v20 = objc_msgSend_objectAtIndex_(v13, v17, 0);
    v22 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v19, v21, (uint64_t)CFSTR("imageView"), CFSTR("itemType"), CFSTR("right"), CFSTR("position"), v20, CFSTR("neighbor"), 0);
    objc_msgSend_setObject_forKey_(v22, v23, (uint64_t)a4, CFSTR("startValue"));
    objc_msgSend_addObject_(v13, v24, (uint64_t)v22);
  }
  v25 = (void *)MEMORY[0x24BDBCED8];
  detailTextColor = self->_detailTextColor;
  v27 = objc_msgSend_systemLabelFont(TableViewManager, v17, v18);
  v29 = objc_msgSend_objectAtIndex_(v13, v28, 0);
  v31 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v30, 1);
  v33 = objc_msgSend_dictionaryWithObjectsAndKeys_(v25, v32, (uint64_t)CFSTR("multilineLabelView"), CFSTR("itemType"), a5, CFSTR("startValue"), detailTextColor, CFSTR("color"), v27, CFSTR("font"), v29, CFSTR("neighbor"), CFSTR("bottomLeft"), CFSTR("position"), v31, CFSTR("canCopy"), 0);
  objc_msgSend_addObject_(v13, v34, v33);
  v35 = (void *)MEMORY[0x24BDBCED8];
  v37 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v36, a6);
  return (id)objc_msgSend_dictionaryWithObjectsAndKeys_(v35, v38, (uint64_t)v13, CFSTR("items"), v37, CFSTR("tag"), 0);
}

- (id)createRowStyleTitledParagraphWithLeftImage:(id)a3 title:(id)a4 bodyText:(id)a5 withTag:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  const char *v13;
  id v14;
  id v15;
  const char *v16;
  const char *v17;
  id v18;
  UIColor *detailTextColor;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  uint64_t v36;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleTitledParagraphWithLeftImage:title:bodyText:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v36);
  if (!a4 || !a5)
    return 0;
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDBCED8]);
    a3 = (id)objc_msgSend_initWithObjectsAndKeys_(v15, v16, (uint64_t)CFSTR("imageView"), CFSTR("itemType"), CFSTR("topLeft"), CFSTR("position"), a3, CFSTR("startValue"), 0);
    objc_msgSend_addObject_(v14, v17, (uint64_t)a3);

  }
  objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v13, (uint64_t)a4, a3, v14);
  v18 = objc_alloc(MEMORY[0x24BDBCED8]);
  detailTextColor = self->_detailTextColor;
  v22 = objc_msgSend_systemLabelFont(TableViewManager, v20, v21);
  v24 = objc_msgSend_objectAtIndex_(v14, v23, 0);
  v26 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v25, 1);
  v28 = (void *)objc_msgSend_initWithObjectsAndKeys_(v18, v27, (uint64_t)CFSTR("multilineLabelView"), CFSTR("itemType"), a5, CFSTR("startValue"), detailTextColor, CFSTR("color"), v22, CFSTR("font"), v24, CFSTR("neighbor"), CFSTR("bottomLeft"), CFSTR("position"), v26, CFSTR("canCopy"), 0);
  objc_msgSend_addObject_(v14, v29, (uint64_t)v28);

  v30 = (void *)MEMORY[0x24BDBCED8];
  v32 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v31, a6);
  v34 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v30, v33, (uint64_t)v14, CFSTR("items"), v32, CFSTR("tag"), 0);

  return v34;
}

- (id)createRowStyleSegmentedControlWithItems:(id)a3 selectedSegmentIndex:(id)a4 enabled:(BOOL)a5 withTag:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  id v11;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  uint64_t v24;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleSegmentedControlWithItems:selectedSegmentIndex:enabled:withTag:]", 800, (uint64_t)"\n", a5, a6, v6, v7, v24);
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = objc_alloc(MEMORY[0x24BDBCED8]);
  v14 = (void *)objc_msgSend_initWithObjectsAndKeys_(v12, v13, (uint64_t)CFSTR("segmentedControlView"), CFSTR("itemType"), a3, CFSTR("segmentedControlItems"), a4, CFSTR("startValue"), CFSTR("center"), CFSTR("position"), 0);
  objc_msgSend_addObject_(v11, v15, (uint64_t)v14);

  v16 = (void *)MEMORY[0x24BDBCED8];
  v18 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v17, a6);
  v20 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v19, 1);
  v22 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v16, v21, (uint64_t)v11, CFSTR("items"), v18, CFSTR("tag"), v20, CFSTR("noBackground"), 0);

  return v22;
}

- (id)createRowStyleProgressViewWithCancelAndStatus:(id)a3 statusText:(id)a4 altText:(id)a5 withTag:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  id v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  const char *v53;
  const char *v54;
  void *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  void *v60;
  uint64_t v62;
  id v63;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleProgressViewWithCancelAndStatus:statusText:altText:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v62);
  if (!a3 || !a4)
    return 0;
  v63 = a5;
  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], v13, (uint64_t)CFSTR("progressView"), CFSTR("itemType"), a3, CFSTR("startValue"), CFSTR("top"), CFSTR("position"), 0);
  if (sub_21A731938((uint64_t)v14, v15, v16))
  {
    v18 = objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v17, 15);
    objc_msgSend_setObject_forKey_(v14, v19, v18, CFSTR("edgeInset"));
  }
  objc_msgSend_addObject_(v12, v17, (uint64_t)v14);
  v20 = (void *)MEMORY[0x24BDBCED8];
  v22 = objc_msgSend_objectAtIndex_(v12, v21, 0);
  v24 = objc_msgSend_dictionaryWithObjectsAndKeys_(v20, v23, (uint64_t)CFSTR("buttonView"), CFSTR("itemType"), CFSTR("UITextFieldClearButton"), CFSTR("buttonImage"), CFSTR("UITextFieldClearButtonPressed"), CFSTR("buttonSelectedImage"), &stru_24DD08368, CFSTR("startValue"), v22, CFSTR("neighbor"), CFSTR("right"), CFSTR("position"), 0);
  objc_msgSend_addObject_(v12, v25, v24);
  v26 = objc_alloc(MEMORY[0x24BDBCED8]);
  v28 = objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v27, 0);
  v31 = objc_msgSend_smallSystemLabelFont(TableViewManager, v29, v30);
  v33 = objc_msgSend_objectAtIndex_(v12, v32, 0);
  v35 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v34, 1);
  v37 = (void *)objc_msgSend_initWithObjectsAndKeys_(v26, v36, (uint64_t)CFSTR("multilineLabelView"), CFSTR("itemType"), v28, CFSTR("lineCount"), v31, CFSTR("font"), v33, CFSTR("neighbor"), v35, CFSTR("alignment"), CFSTR("bottom"), CFSTR("position"), 0);
  objc_msgSend_setObject_forKey_(v37, v38, (uint64_t)a4, CFSTR("startValue"));
  objc_msgSend_addObject_(v12, v39, (uint64_t)v37);

  if (v63)
  {
    v41 = objc_alloc(MEMORY[0x24BDBCED8]);
    v43 = objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v42, 0);
    v46 = objc_msgSend_smallSystemLabelFont(TableViewManager, v44, v45);
    v48 = objc_msgSend_objectAtIndex_(v12, v47, 2);
    v50 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v49, 1);
    v52 = (void *)objc_msgSend_initWithObjectsAndKeys_(v41, v51, (uint64_t)CFSTR("multilineLabelView"), CFSTR("itemType"), v43, CFSTR("lineCount"), v46, CFSTR("font"), v48, CFSTR("neighbor"), v50, CFSTR("alignment"), CFSTR("bottom"), CFSTR("position"), 0);
    objc_msgSend_setObject_forKey_(v52, v53, (uint64_t)v63, CFSTR("startValue"));
    objc_msgSend_addObject_(v12, v54, (uint64_t)v52);

  }
  v55 = (void *)MEMORY[0x24BDBCED8];
  v56 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v40, a6);
  v58 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v57, 1);
  v60 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v55, v59, (uint64_t)v12, CFSTR("items"), v56, CFSTR("tag"), v58, CFSTR("noBackground"), 0);

  return v60;
}

- (id)createRowStyleActivityStatus:(BOOL)a3 text1:(id)a4 grayedText1:(BOOL)a5 text2:(id)a6 grayedText2:(BOOL)a7 withTag:(unint64_t)a8
{
  _BOOL4 v8;
  _BOOL4 v10;
  _BOOL8 v12;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  void *v48;
  uint64_t v50;

  v8 = a7;
  v10 = a5;
  v12 = a3;
  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleActivityStatus:text1:grayedText1:text2:grayedText2:withTag:]", 800, (uint64_t)"\n", a5, (uint64_t)a6, a7, a8, v50);
  v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = (void *)objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v15, (uint64_t)a4, 0, v14);
  if (v10)
    objc_msgSend_setObject_forKey_(v16, v17, (uint64_t)self->_subtitleColor, CFSTR("color"));
  v18 = (void *)MEMORY[0x24BDBCED8];
  v19 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v17, v12);
  v21 = objc_msgSend_dictionaryWithObjectsAndKeys_(v18, v20, (uint64_t)CFSTR("activityView"), CFSTR("itemType"), v19, CFSTR("startValue"), CFSTR("right"), CFSTR("position"), 0);
  objc_msgSend_addObject_(v14, v22, v21);
  v25 = (void *)MEMORY[0x24BDBCED8];
  v26 = 72;
  if (v8)
    v26 = 96;
  v27 = *(uint64_t *)((char *)&self->super.isa + v26);
  v28 = objc_msgSend_systemLabelFont(TableViewManager, v23, v24);
  v29 = (void *)MEMORY[0x24BDD16E0];
  v32 = (void *)objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], v30, v31);
  v35 = objc_msgSend_userInterfaceLayoutDirection(v32, v33, v34);
  v37 = objc_msgSend_numberWithInteger_(v29, v36, 2 * (v35 == 0));
  v39 = objc_msgSend_objectAtIndex_(v14, v38, 1);
  v41 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v25, v40, (uint64_t)CFSTR("labelView"), CFSTR("itemType"), v27, CFSTR("color"), v28, CFSTR("font"), v37, CFSTR("alignment"), v39, CFSTR("neighbor"), CFSTR("left"), CFSTR("position"), 0);
  v43 = (uint64_t)v41;
  if (a6)
    objc_msgSend_setObject_forKey_(v41, v42, (uint64_t)a6, CFSTR("startValue"));
  objc_msgSend_addObject_(v14, v42, v43);
  v44 = (void *)MEMORY[0x24BDBCED8];
  v46 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v45, a8);
  v48 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v44, v47, (uint64_t)v14, CFSTR("items"), v46, CFSTR("tag"), 0);

  return v48;
}

- (id)createRowStyleDatePicker:(id)a3 minimumDate:(id)a4 maximumDate:(id)a5 withMode:(int64_t)a6 withTag:(unint64_t)a7
{
  uint64_t v7;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v27;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleDatePicker:minimumDate:maximumDate:withMode:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, a7, v7, v27);
  if (!a3)
    return 0;
  v13 = (void *)MEMORY[0x24BDBCED8];
  v14 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a6);
  v16 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v13, v15, (uint64_t)CFSTR("datePicker"), CFSTR("itemType"), a3, CFSTR("startValue"), v14, CFSTR("datePickerMode"), CFSTR("top"), CFSTR("position"), 0);
  v19 = v16;
  if (a4)
    objc_msgSend_setObject_forKey_(v16, v17, (uint64_t)a4, CFSTR("minValue"));
  if (a5)
    objc_msgSend_setObject_forKey_(v19, v17, (uint64_t)a5, CFSTR("maxValue"));
  v20 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v17, v18);
  objc_msgSend_addObject_(v20, v21, (uint64_t)v19);
  v22 = (void *)MEMORY[0x24BDBCED8];
  v24 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v23, a7);
  return (id)objc_msgSend_dictionaryWithObjectsAndKeys_(v22, v25, (uint64_t)v20, CFSTR("items"), v24, CFSTR("tag"), 0);
}

- (id)createRowStyleBasicWithUnreadBubble:(unint64_t)a3 text1:(id)a4 text2:(id)a5 withTag:(unint64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  UIColor *detailTextColor;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v45;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager createRowStyleBasicWithUnreadBubble:text1:text2:withTag:]", 800, (uint64_t)"\n", (uint64_t)a5, a6, v6, v7, v45);
  v12 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, a3);
  objc_msgSend_commonAddOptionalStaticText_withNeighborItem_toCellItems_(self, v13, (uint64_t)a4, 0, v12);
  v14 = (void *)MEMORY[0x24BDBCED8];
  v16 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v15, a3);
  v18 = objc_msgSend_dictionaryWithObjectsAndKeys_(v14, v17, (uint64_t)CFSTR("unreadBubbleCount"), CFSTR("itemType"), v16, CFSTR("startValue"), CFSTR("right"), CFSTR("position"), 0);
  objc_msgSend_addObject_(v12, v19, v18);
  v20 = (void *)MEMORY[0x24BDBCED8];
  detailTextColor = self->_detailTextColor;
  v24 = objc_msgSend_systemLabelFont(TableViewManager, v22, v23);
  v25 = (void *)MEMORY[0x24BDD16E0];
  v28 = (void *)objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], v26, v27);
  v31 = objc_msgSend_userInterfaceLayoutDirection(v28, v29, v30);
  v33 = objc_msgSend_numberWithInteger_(v25, v32, 2 * (v31 == 0));
  v35 = objc_msgSend_objectAtIndex_(v12, v34, 1);
  v37 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v20, v36, (uint64_t)CFSTR("labelView"), CFSTR("itemType"), detailTextColor, CFSTR("color"), v24, CFSTR("font"), v33, CFSTR("alignment"), v35, CFSTR("neighbor"), CFSTR("left"), CFSTR("position"), 0);
  v39 = (uint64_t)v37;
  if (a5)
    objc_msgSend_setObject_forKey_(v37, v38, (uint64_t)a5, CFSTR("startValue"));
  objc_msgSend_addObject_(v12, v38, v39);
  v40 = (void *)MEMORY[0x24BDBCED8];
  v42 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v41, a6);
  return (id)objc_msgSend_dictionaryWithObjectsAndKeys_(v40, v43, (uint64_t)v12, CFSTR("items"), v42, CFSTR("tag"), 0);
}

- (unint64_t)findAndSetItemObject:(id)a3 toValue:(id)a4 inCellWithInternalRowSectionTagValue:(unint64_t)a5
{
  unint64_t v7;
  void *RowArrayForSection;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  const char *v27;
  unint64_t result;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a5 >> 16;
  RowArrayForSection = (void *)objc_msgSend_getRowArrayForSection_(self, a2, (unsigned __int16)a5);
  if (v7 >= objc_msgSend_count(RowArrayForSection, v9, v10))
    return 0x7FFFFFFFFFFFFFFFLL;
  v12 = (void *)objc_msgSend_objectAtIndex_(RowArrayForSection, v11, v7);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = (void *)objc_msgSend_objectForKey_(v12, v13, (uint64_t)CFSTR("items"));
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v29, v33, 16);
  if (!v16)
    return 0x7FFFFFFFFFFFFFFFLL;
  v22 = v16;
  v23 = 0;
  v24 = *(_QWORD *)v30;
  while (2)
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v30 != v24)
        objc_enumerationMutation(v14);
      v26 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager findAndSetItemObject:toValue:inCellWithInternalRowSectionTagValue:]", 800, (uint64_t)"curItem %@\n", v18, v19, v20, v21, (uint64_t)v26);
      if ((id)objc_msgSend_objectForKey_(v26, v17, (uint64_t)CFSTR("cachedView")) == a3)
      {
        if (a4)
          objc_msgSend_setObject_forKey_(v26, v27, (uint64_t)a4, CFSTR("currentValue"));
        return v23;
      }
      objc_opt_class();
      v23 += objc_opt_isKindOfClass() & 1;
    }
    v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v29, v33, 16);
    result = 0x7FFFFFFFFFFFFFFFLL;
    if (v22)
      continue;
    break;
  }
  return result;
}

- (id)getInfoForItemOfType:(id)a3 atItemTypeIndex:(unint64_t)a4 inCell:(id)a5
{
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (void *)objc_msgSend_objectForKey_(a5, a2, (uint64_t)CFSTR("items"), 0);
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v17, v21, 16);
  if (v9)
  {
    v11 = v9;
    v12 = 0;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((id)objc_msgSend_objectForKey_(v15, v10, (uint64_t)CFSTR("itemType")) == a3)
        {
          if (v12 == a4)
            return v15;
          ++v12;
        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v17, v21, 16);
    }
    while (v11);
  }
  return 0;
}

- (id)getValueForItemOfType:(id)a3 atItemTypeIndex:(unint64_t)a4 inCell:(id)a5
{
  id result;
  const char *v6;
  id v7;
  const char *v8;

  result = (id)objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(self, a2, (uint64_t)a3, a4, a5);
  if (result)
  {
    v7 = result;
    result = (id)objc_msgSend_objectForKey_(result, v6, (uint64_t)CFSTR("currentValue"));
    if (!result)
      return (id)objc_msgSend_objectForKey_(v7, v8, (uint64_t)CFSTR("startValue"));
  }
  return result;
}

- (id)getValueForItemOfType:(id)a3 atItemTypeIndex:(unint64_t)a4 inCellAtIndexPath:(id)a5
{
  id result;
  const char *v9;

  result = (id)objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a5);
  if (result)
    return (id)objc_msgSend_getValueForItemOfType_atItemTypeIndex_inCell_(self, v9, (uint64_t)a3, a4, result);
  return result;
}

- (id)getValueForFirstItemOfType:(id)a3 inCellAtIndexPath:(id)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_getValueForItemOfType_atItemTypeIndex_inCellAtIndexPath_, a3);
}

- (id)getValueForFirstItemOfType:(id)a3 inCellWithTag:(int64_t)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_getValueForItemOfType_atItemTypeIndex_inCellWithTag_, a3);
}

- (id)getValueForItemOfType:(id)a3 atItemTypeIndex:(unint64_t)a4 inCellWithTag:(int64_t)a5
{
  void *v9;
  const char *v10;
  id result;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  TableViewManager *v26;
  id v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  result = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v33, v38, 16);
  if (result)
  {
    v13 = (uint64_t)result;
    v26 = self;
    v27 = a3;
    v28 = a4;
    v14 = *(_QWORD *)v34;
    v25 = *(_QWORD *)v34;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v14)
        objc_enumerationMutation(v9);
      result = (id)objc_msgSend_objectForKey_(*(void **)(*((_QWORD *)&v33 + 1) + 8 * v15), v12, (uint64_t)CFSTR("sectionRows"), v25);
      if (!result)
        break;
      v17 = result;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(result, v16, (uint64_t)&v29, v37, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v30;
        while (2)
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v30 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            v23 = (void *)objc_msgSend_objectForKey_(v22, v12, (uint64_t)CFSTR("tag"));
            if (v23 && objc_msgSend_integerValue(v23, v12, v24) == a5)
              return (id)objc_msgSend_getValueForItemOfType_atItemTypeIndex_inCell_(v26, v12, (uint64_t)v27, v28, v22);
          }
          v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v12, (uint64_t)&v29, v37, 16);
          if (v19)
            continue;
          break;
        }
      }
      ++v15;
      v14 = v25;
      if (v15 == v13)
      {
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v33, v38, 16);
        result = 0;
        if (v13)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (void)setValue:(id)a3 forItem:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t Letter;
  const char *v22;
  NSString *v23;
  SEL v24;
  const char *v25;
  uint64_t v26;

  if (dword_2550F4688 <= 800 && (dword_2550F4688 != -1 || sub_21A69876C((uint64_t)&dword_2550F4688, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4688, (uint64_t)"-[TableViewManager setValue:forItem:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v26);
  v12 = (void *)objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("itemType"));
  if (a3)
  {
    objc_msgSend_setObject_forKey_(a4, v11, (uint64_t)a3, CFSTR("startValue"));
    objc_msgSend_setObject_forKey_(a4, v13, (uint64_t)a3, CFSTR("currentValue"));
  }
  else
  {
    objc_msgSend_removeObjectForKey_(a4, v11, (uint64_t)CFSTR("currentValue"));
    objc_msgSend_removeObjectForKey_(a4, v15, (uint64_t)CFSTR("startValue"));
  }
  v16 = objc_msgSend_objectForKey_(a4, v14, (uint64_t)CFSTR("cachedView"));
  if (v16)
  {
    v17 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = (void *)MEMORY[0x24BDD17C8];
      Letter = objc_msgSend_stringByCapitalizingFirstLetter(v12, v18, v19);
      v23 = (NSString *)objc_msgSend_stringWithFormat_(v20, v22, (uint64_t)CFSTR("set%@Value:usingItemInfo:"), Letter);
      v24 = NSSelectorFromString(v23);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend_performSelector_withObject_withObject_(self, v25, (uint64_t)v24, v17, a4);
    }
  }
}

- (void)setMinValue:(id)a3 andMaxValue:(id)a4 forItem:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t Letter;
  const char *v22;
  NSString *v23;
  SEL v24;
  const char *v25;
  uint64_t v26;

  if (dword_2550F4688 <= 800 && (dword_2550F4688 != -1 || sub_21A69876C((uint64_t)&dword_2550F4688, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4688, (uint64_t)"-[TableViewManager setMinValue:andMaxValue:forItem:]", 800, (uint64_t)"\n", (uint64_t)a5, v5, v6, v7, v26);
  v13 = (void *)objc_msgSend_objectForKey_(a5, a2, (uint64_t)CFSTR("itemType"));
  if (!a3)
  {
    objc_msgSend_removeObjectForKey_(a5, v12, (uint64_t)CFSTR("minValue"));
    if (a4)
      goto LABEL_7;
LABEL_9:
    objc_msgSend_removeObjectForKey_(a5, v14, (uint64_t)CFSTR("maxValue"));
    goto LABEL_10;
  }
  objc_msgSend_setObject_forKey_(a5, v12, (uint64_t)a3, CFSTR("minValue"));
  if (!a4)
    goto LABEL_9;
LABEL_7:
  objc_msgSend_setObject_forKey_(a5, v14, (uint64_t)a4, CFSTR("maxValue"));
LABEL_10:
  v16 = objc_msgSend_objectForKey_(a5, v15, (uint64_t)CFSTR("cachedView"));
  if (v16)
  {
    v17 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = (void *)MEMORY[0x24BDD17C8];
      Letter = objc_msgSend_stringByCapitalizingFirstLetter(v13, v18, v19);
      v23 = (NSString *)objc_msgSend_stringWithFormat_(v20, v22, (uint64_t)CFSTR("set%@Value:usingItemInfo:"), Letter);
      v24 = NSSelectorFromString(v23);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend_performSelector_withObject_withObject_(self, v25, (uint64_t)v24, v17, a5);
    }
  }
}

- (void)setValue:(id)a3 forItemOfType:(id)a4 atItemTypeIndex:(unint64_t)a5 inCellWithTag:(int64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  TableViewManager *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t InfoForItemOfType_atItemTypeIndex_inCell;
  const char *v31;
  uint64_t v32;
  void *v33;
  id v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F4688 <= 800 && (dword_2550F4688 != -1 || sub_21A69876C((uint64_t)&dword_2550F4688, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4688, (uint64_t)"-[TableViewManager setValue:forItemOfType:atItemTypeIndex:inCellWithTag:]", 800, (uint64_t)"type = %@  index = %d  cell tag = %d\n", a5, a6, v6, v7, (uint64_t)a4);
  v35 = a4;
  v36 = a5;
  v12 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v41, v46, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v42;
    v32 = *(_QWORD *)v42;
    v33 = v12;
LABEL_7:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v17)
        objc_enumerationMutation(v12);
      v19 = (void *)objc_msgSend_objectForKey_(*(void **)(*((_QWORD *)&v41 + 1) + 8 * v18), v15, (uint64_t)CFSTR("sectionRows"));
      if (!v19)
        break;
      v21 = v19;
      v22 = self;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v37, v45, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v38;
        while (2)
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v38 != v25)
              objc_enumerationMutation(v21);
            v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            v28 = (void *)objc_msgSend_objectForKey_(v27, v15, (uint64_t)CFSTR("tag"));
            if (v28 && objc_msgSend_integerValue(v28, v15, v29) == a6)
            {
              InfoForItemOfType_atItemTypeIndex_inCell = objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(v22, v15, (uint64_t)v35, v36, v27);
              if (InfoForItemOfType_atItemTypeIndex_inCell)
                objc_msgSend_setValue_forItem_(v22, v31, (uint64_t)a3, InfoForItemOfType_atItemTypeIndex_inCell);
              return;
            }
          }
          v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v15, (uint64_t)&v37, v45, 16);
          if (v24)
            continue;
          break;
        }
      }
      ++v18;
      self = v22;
      v17 = v32;
      v12 = v33;
      if (v18 == v16)
      {
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v15, (uint64_t)&v41, v46, 16);
        if (v16)
          goto LABEL_7;
        return;
      }
    }
  }
}

- (void)setMinValue:(id)a3 andMaxValue:(id)a4 forItemOfType:(id)a5 atItemTypeIndex:(unint64_t)a6 inCellWithTag:(int64_t)a7
{
  uint64_t v7;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t InfoForItemOfType_atItemTypeIndex_inCell;
  const char *v30;
  uint64_t v31;
  void *v32;
  id v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F4688 <= 800 && (dword_2550F4688 != -1 || sub_21A69876C((uint64_t)&dword_2550F4688, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4688, (uint64_t)"-[TableViewManager setMinValue:andMaxValue:forItemOfType:atItemTypeIndex:inCellWithTag:]", 800, (uint64_t)"type = %@  index = %d  cell tag = %d\n", (uint64_t)a5, a6, a7, v7, (uint64_t)a5);
  v35 = a5;
  v36 = a6;
  v12 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v41, v46, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v42;
    v31 = *(_QWORD *)v42;
    v32 = v12;
LABEL_7:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v17)
        objc_enumerationMutation(v12);
      v19 = (void *)objc_msgSend_objectForKey_(*(void **)(*((_QWORD *)&v41 + 1) + 8 * v18), v15, (uint64_t)CFSTR("sectionRows"));
      if (!v19)
        break;
      v21 = v19;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v37, v45, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v38;
        while (2)
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v38 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            v27 = (void *)objc_msgSend_objectForKey_(v26, v15, (uint64_t)CFSTR("tag"));
            if (v27 && objc_msgSend_integerValue(v27, v15, v28) == a7)
            {
              InfoForItemOfType_atItemTypeIndex_inCell = objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(self, v15, (uint64_t)v35, v36, v26);
              if (InfoForItemOfType_atItemTypeIndex_inCell)
                objc_msgSend_setMinValue_andMaxValue_forItem_(self, v30, (uint64_t)a3, a4, InfoForItemOfType_atItemTypeIndex_inCell);
              return;
            }
          }
          v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v15, (uint64_t)&v37, v45, 16);
          if (v23)
            continue;
          break;
        }
      }
      ++v18;
      v17 = v31;
      v12 = v32;
      if (v18 == v16)
      {
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v15, (uint64_t)&v41, v46, 16);
        if (v16)
          goto LABEL_7;
        return;
      }
    }
  }
}

- (void)setValue:(id)a3 forItemOfType:(id)a4 atItemTypeIndex:(unint64_t)a5 inCellAtIndexPath:(id)a6
{
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t CellDictForCellAtIndexPath;
  const char *v18;
  uint64_t InfoForItemOfType_atItemTypeIndex_inCell;
  const char *v20;

  if (dword_2550F4688 <= 800 && (dword_2550F4688 != -1 || sub_21A69876C((uint64_t)&dword_2550F4688, 0x320u)))
  {
    objc_msgSend_section(a6, a2, (uint64_t)a3);
    objc_msgSend_row(a6, v11, v12);
    sub_21A698FDC((uint64_t)&dword_2550F4688, (uint64_t)"-[TableViewManager setValue:forItemOfType:atItemTypeIndex:inCellAtIndexPath:]", 800, (uint64_t)"type = %@  index = %d  section = %d  row = %d\n", v13, v14, v15, v16, (uint64_t)a4);
  }
  CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a6);
  if (CellDictForCellAtIndexPath)
  {
    InfoForItemOfType_atItemTypeIndex_inCell = objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(self, v18, (uint64_t)a4, a5, CellDictForCellAtIndexPath);
    if (InfoForItemOfType_atItemTypeIndex_inCell)
      objc_msgSend_setValue_forItem_(self, v20, (uint64_t)a3, InfoForItemOfType_atItemTypeIndex_inCell);
  }
}

- (BOOL)setNewRow:(id)a3 itemAttribute:(id)a4 forItemOfType:(id)a5 atItemTypeIndex:(unint64_t)a6 toValue:(id)a7
{
  TableViewManager *v7;
  const char *v11;

  v7 = self;
  LOBYTE(self) = 0;
  if (a3)
  {
    if (a4)
    {
      if (a5)
      {
        if (a7)
        {
          self = (TableViewManager *)objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(v7, a2, (uint64_t)a5, a6, a3);
          if (self)
          {
            if (a5 == CFSTR("editTextView") || a5 == CFSTR("labelView") || a5 == CFSTR("multilineLabelView"))
            {
              objc_msgSend_setObject_forKey_(self, v11, (uint64_t)a7, a4);
              LOBYTE(self) = 1;
            }
            else
            {
              LOBYTE(self) = 0;
            }
          }
        }
      }
    }
  }
  return (char)self;
}

- (void)setNewRow:(id)a3 tag:(unint64_t)a4
{
  uint64_t v5;
  const char *v6;

  v5 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a4);
  objc_msgSend_setObject_forKey_(a3, v6, v5, CFSTR("tag"));
}

- (void)setNewRow:(id)a3 representedObject:(id)a4
{
  objc_msgSend_setObject_forKey_(a3, a2, (uint64_t)a4, CFSTR("representedObject"));
}

- (void)setNewRow:(id)a3 accessoryType:(int64_t)a4
{
  uint64_t v5;
  const char *v6;

  v5 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a4);
  objc_msgSend_setObject_forKey_(a3, v6, v5, CFSTR("accessory"));
}

- (void)setNewRow:(id)a3 editingAccessoryType:(int64_t)a4
{
  uint64_t v5;
  const char *v6;

  v5 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a4);
  objc_msgSend_setObject_forKey_(a3, v6, v5, CFSTR("editingAccessory"));
}

- (void)setNewRow:(id)a3 accessoryView:(id)a4
{
  objc_msgSend_setObject_forKey_(a3, a2, (uint64_t)a4, CFSTR("accessoryView"));
}

- (void)setNewRow:(id)a3 editingAccessoryView:(id)a4
{
  objc_msgSend_setObject_forKey_(a3, a2, (uint64_t)a4, CFSTR("editingAccessoryView"));
}

- (void)setNewRow:(id)a3 verifierAccessoryType:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  if (dword_2550F4608 <= 800 && (dword_2550F4608 != -1 || sub_21A69876C((uint64_t)&dword_2550F4608, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4608, (uint64_t)"-[TableViewManager setNewRow:verifierAccessoryType:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v12);
  v10 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a4);
  objc_msgSend_setObject_forKey_(a3, v11, v10, CFSTR("verifierAccessory"));
}

- (void)setNewRow:(id)a3 editingStyle:(int64_t)a4
{
  uint64_t v5;
  const char *v6;

  v5 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a4);
  objc_msgSend_setObject_forKey_(a3, v6, v5, CFSTR("editingStyle"));
}

- (void)setNewRow:(id)a3 textFieldViewMode:(int64_t)a4
{
  uint64_t v5;
  const char *v6;

  v5 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a4);
  objc_msgSend_setObject_forKey_(a3, v6, v5, CFSTR("textFieldViewMode"));
}

- (void)setNewRow:(id)a3 selectableCell:(BOOL)a4
{
  uint64_t v5;
  const char *v6;

  v5 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, a4);
  objc_msgSend_setObject_forKey_(a3, v6, v5, CFSTR("selectableCell"));
}

- (void)setCellRowInfoItem:(id)a3 atIndex:(unint64_t)a4 forKey:(id)a5 toValue:(id)a6
{
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;

  if (a3)
  {
    if (a5)
    {
      if (a6)
      {
        v9 = (void *)objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("items"));
        if (v9)
        {
          v11 = (void *)objc_msgSend_objectAtIndex_(v9, v10, a4);
          if (v11)
            objc_msgSend_setObject_forKey_(v11, v12, (uint64_t)a6, a5);
        }
      }
    }
  }
}

- (void)makeFirstEditableCellCurrentResponder
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  UIView *FirstResponderInTableView_foundParentCell;
  const char *v9;
  uint64_t v10;
  UIView *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager makeFirstEditableCellCurrentResponder]", 800, (uint64_t)"\n", v2, v3, v4, v5, v13);
  v14 = 0;
  self->_currentFirstResponder = 0;

  self->_currentFirstResponderCellPath = 0;
  FirstResponderInTableView_foundParentCell = (UIView *)objc_msgSend_findFirstResponderInTableView_foundParentCell_(self, v7, (uint64_t)self->_managedTableView, &v14);
  if (FirstResponderInTableView_foundParentCell)
  {
    v11 = FirstResponderInTableView_foundParentCell;
    objc_msgSend_becomeFirstResponder(FirstResponderInTableView_foundParentCell, v9, v10);
    self->_currentFirstResponder = v11;
    self->_currentFirstResponderCellPath = (NSIndexPath *)(id)objc_msgSend_indexPathForCell_(self->_managedTableView, v12, v14);
  }
}

- (id)findFirstResponderInView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager findFirstResponderInView:]", 800, (uint64_t)"view = %@\n", v3, v4, v5, v6, (uint64_t)a3);
  v8 = (void *)objc_msgSend_subviews(a3, a2, (uint64_t)a3);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v21, v25, 16);
  if (v10)
  {
    v15 = v10;
    v16 = *(_QWORD *)v22;
LABEL_7:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v16)
        objc_enumerationMutation(v8);
      v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v17);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v19, (uint64_t)&v21, v25, 16);
        if (v15)
          goto LABEL_7;
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    v18 = 0;
  }
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager findFirstResponderInView:]", 800, (uint64_t)"returning %@\n", v11, v12, v13, v14, (uint64_t)v18);
  return v18;
}

- (id)findFirstResponderInTableView:(id)a3 fromSection:(unint64_t)a4 fromRow:(unint64_t)a5 foundParentCell:(id *)a6
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t FirstResponderInView;
  void *v26;

  v9 = a5;
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager findFirstResponderInTableView:fromSection:fromRow:foundParentCell:]", 800, (uint64_t)"section %d  from row %d\n", a5, (uint64_t)a6, v6, v7, a4);
  if (objc_msgSend_numberOfRowsInSection_(a3, a2, a4) <= v9)
  {
LABEL_11:
    v26 = 0;
    goto LABEL_12;
  }
  while (1)
  {
    v18 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x24BDD15D8], v13, v9, a4);
    if (v18)
      break;
LABEL_10:
    if (v9 >= objc_msgSend_numberOfRowsInSection_(a3, v19, a4))
      goto LABEL_11;
  }
  v20 = (void *)objc_msgSend_cellForRowAtIndexPath_(a3, v19, v18);
  if (!v20
    || (v22 = v20,
        v23 = objc_msgSend_contentView(v20, v19, v21),
        (FirstResponderInView = objc_msgSend_findFirstResponderInView_(self, v24, v23)) == 0))
  {
    ++v9;
    goto LABEL_10;
  }
  v26 = (void *)FirstResponderInView;
  if (a6)
    *a6 = v22;
LABEL_12:
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager findFirstResponderInTableView:fromSection:fromRow:foundParentCell:]", 800, (uint64_t)"returning %@\n", v14, v15, v16, v17, (uint64_t)v26);
  return v26;
}

- (id)findFirstResponderInTableView:(id)a3 foundParentCell:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t FirstResponderInTableView_fromSection_fromRow_foundParentCell;
  const char *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager findFirstResponderInTableView:foundParentCell:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v22);
  if (objc_msgSend_numberOfSections(a3, a2, (uint64_t)a3) < 1)
  {
LABEL_9:
    v20 = 0;
  }
  else
  {
    v16 = 0;
    while (1)
    {
      FirstResponderInTableView_fromSection_fromRow_foundParentCell = objc_msgSend_findFirstResponderInTableView_fromSection_fromRow_foundParentCell_(self, v11, (uint64_t)a3, v16, 0, a4);
      if (FirstResponderInTableView_fromSection_fromRow_foundParentCell)
        break;
      if (++v16 >= objc_msgSend_numberOfSections(a3, v18, v19))
        goto LABEL_9;
    }
    v20 = (void *)FirstResponderInTableView_fromSection_fromRow_foundParentCell;
  }
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager findFirstResponderInTableView:foundParentCell:]", 800, (uint64_t)"returning %@\n", v12, v13, v14, v15, (uint64_t)v20);
  return v20;
}

- (BOOL)becomeFirstResponderAtIndexPath:(id)a3
{
  UITableView *managedTableView;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *FirstResponderInTableView_fromSection_fromRow_foundParentCell;
  const char *v12;
  uint64_t v13;

  managedTableView = self->_managedTableView;
  v6 = objc_msgSend_section(a3, a2, (uint64_t)a3);
  v9 = objc_msgSend_row(a3, v7, v8);
  FirstResponderInTableView_fromSection_fromRow_foundParentCell = (void *)objc_msgSend_findFirstResponderInTableView_fromSection_fromRow_foundParentCell_(self, v10, (uint64_t)managedTableView, v6, v9, 0);
  objc_msgSend_becomeFirstResponder(FirstResponderInTableView_fromSection_fromRow_foundParentCell, v12, v13);
  return FirstResponderInTableView_fromSection_fromRow_foundParentCell != 0;
}

- (id)findNextResponderInTableView:(id)a3 foundParentCell:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *FirstResponderInTableView_fromSection_fromRow_foundParentCell;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v27;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager findNextResponderInTableView:foundParentCell:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v27);
  v11 = objc_msgSend_section(self->_currentFirstResponderCellPath, a2, (uint64_t)a3);
  FirstResponderInTableView_fromSection_fromRow_foundParentCell = (void *)(objc_msgSend_row(self->_currentFirstResponderCellPath, v12, v13)+ 1);
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager findNextResponderInTableView:foundParentCell:]", 800, (uint64_t)"current responder section %d  row %d\n", v16, v17, v18, v19, v11);
  while (v11 < objc_msgSend_numberOfSections(a3, v14, v15))
  {
    FirstResponderInTableView_fromSection_fromRow_foundParentCell = (void *)objc_msgSend_findFirstResponderInTableView_fromSection_fromRow_foundParentCell_(self, v25, (uint64_t)a3, v11, FirstResponderInTableView_fromSection_fromRow_foundParentCell, a4);
    if (FirstResponderInTableView_fromSection_fromRow_foundParentCell)
      goto LABEL_13;
    ++v11;
  }
  FirstResponderInTableView_fromSection_fromRow_foundParentCell = 0;
LABEL_13:
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager findNextResponderInTableView:foundParentCell:]", 800, (uint64_t)"returning %@\n", v21, v22, v23, v24, (uint64_t)FirstResponderInTableView_fromSection_fromRow_foundParentCell);
  return FirstResponderInTableView_fromSection_fromRow_foundParentCell;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  v10 = objc_msgSend_count(v3, v4, v5);
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager numberOfSectionsInTableView:]", 800, (uint64_t)"section count = %d\n", v6, v7, v8, v9, v10);
  return v10;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *RowArrayForSection;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;

  RowArrayForSection = (void *)objc_msgSend_getRowArrayForSection_(self, a2, a4);
  if (!RowArrayForSection)
    return 0;
  v12 = objc_msgSend_count(RowArrayForSection, v6, v7);
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager tableView:numberOfRowsInSection:]", 800, (uint64_t)"section %d row count = %d\n", v8, v9, v10, v11, a4);
  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 layoutMode:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *SectionDictForSection;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  ManagedTableViewCell *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t InfoForItemOfType_atItemTypeIndex_inCell;
  const char *v46;
  uint64_t v47;
  const char *v48;
  _BOOL4 v49;
  int v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  ManagedTableViewCell *gLayoutNoBackgroundCell;
  ManagedTableViewCell *v67;
  void *v68;
  const char *v69;
  id v70;
  TableViewManager *v71;
  const char *v72;
  const char *v73;
  ManagedTableViewCell *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  ManagedTableViewCell *v81;
  const char *v82;
  uint64_t v83;
  double v84;
  double v85;
  double v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  ManagedTableViewCell *v99;
  const char *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  const char *v113;
  const char *v114;
  const char *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  const char *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  const char *v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  const char *v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  const char *v154;
  void *v155;
  char isKindOfClass;
  const char *v157;
  uint64_t v158;
  void *v159;
  void *v160;
  const char *v161;
  NSString *v162;
  SEL v163;
  NSString *v164;
  SEL v165;
  const char *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  const char *v178;
  uint64_t v180;
  uint64_t Letter;
  id v182;
  void *v183;
  unsigned int v184;
  uint64_t v185;
  TableViewManager *v186;
  id obj;
  id obja;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  _BYTE v193[128];
  uint64_t v194;

  v5 = a5;
  v194 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
  {
    v9 = objc_msgSend_managedTableView(self, a2, (uint64_t)a3);
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager tableView:cellForRowAtIndexPath:layoutMode:]", 800, (uint64_t)"managedTableView %@\n", v10, v11, v12, v13, v9);
  }
  v14 = objc_msgSend_row(a4, a2, (uint64_t)a3);
  v17 = objc_msgSend_section(a4, v15, v16);
  v186 = self;
  SectionDictForSection = (void *)objc_msgSend_getSectionDictForSection_(self, v18, v17);
  v21 = (void *)objc_msgSend_objectForKey_(SectionDictForSection, v20, (uint64_t)CFSTR("sectionRows"));
  v23 = (void *)objc_msgSend_objectForKey_(SectionDictForSection, v22, (uint64_t)CFSTR("sectionIsMenu"));
  v184 = objc_msgSend_BOOLValue(v23, v24, v25);
  if (v14 >= objc_msgSend_count(v21, v26, v27))
    return 0;
  v34 = (void *)objc_msgSend_objectAtIndex_(v21, v28, v14);
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager tableView:cellForRowAtIndexPath:layoutMode:]", 800, (uint64_t)"section %d row %d\n", v30, v31, v32, v33, v17);
  v35 = (void *)objc_msgSend_objectForKey_(v34, v29, (uint64_t)CFSTR("accessory"));
  if (v35)
    v38 = objc_msgSend_integerValue(v35, v36, v37);
  else
    v38 = 0;
  v40 = (void *)objc_msgSend_objectForKey_(v34, v36, (uint64_t)CFSTR("editingAccessory"));
  if (v40)
    obj = (id)objc_msgSend_integerValue(v40, v41, v42);
  else
    obj = 0;
  v43 = (void *)objc_msgSend_valueForKey_(v34, v41, (uint64_t)CFSTR("selectableCell"));
  InfoForItemOfType_atItemTypeIndex_inCell = objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(v186, v44, (uint64_t)CFSTR("wholeCellButtonView"), 0, v34);
  v185 = v38;
  v49 = (objc_msgSend_BOOLValue(v43, v46, v47) & 1) != 0
     || InfoForItemOfType_atItemTypeIndex_inCell && !v43
     || v38 == 1
     || obj == (id)1;
  v51 = v49 | v184;
  v52 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v48, v49 | v184);
  objc_msgSend_setObject_forKey_(v34, v53, v52, CFSTR("selectable"));
  v55 = objc_msgSend_objectForKey_(v34, v54, (uint64_t)CFSTR("noBackground"));
  v56 = v34;
  v57 = v55;
  if (v55)
    v58 = CFSTR("NoBackgroundTypeCellID");
  else
    v58 = CFSTR("GenericTypeCellID");
  v183 = v56;
  v59 = objc_msgSend_objectForKey_(v56, (const char *)v56, (uint64_t)CFSTR("lastOwningCell"));
  if (v59)
  {
    gLayoutNoBackgroundCell = (ManagedTableViewCell *)v59;
    if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager tableView:cellForRowAtIndexPath:layoutMode:]", 800, (uint64_t)"cell is cached, freeing\n", v62, v63, v64, v65, v180);
    v67 = gLayoutNoBackgroundCell;
    v68 = v183;
    objc_msgSend_removeObjectForKey_(v183, v69, (uint64_t)CFSTR("lastOwningCell"));
    v70 = a4;
    v71 = v186;
    objc_msgSend_setParentTableManager_(gLayoutNoBackgroundCell, v72, (uint64_t)v186);
  }
  else
  {
    if (v5)
    {
      if (v57)
      {
        gLayoutNoBackgroundCell = v186->_gLayoutNoBackgroundCell;
        if (!gLayoutNoBackgroundCell)
        {
          v74 = [ManagedTableViewCell alloc];
          gLayoutNoBackgroundCell = (ManagedTableViewCell *)objc_msgSend_initWithStyle_reuseIdentifier_(v74, v75, 0, CFSTR("NoBackgroundTypeCellID"));
          v186->_gLayoutNoBackgroundCell = gLayoutNoBackgroundCell;
        }
      }
      else
      {
        gLayoutNoBackgroundCell = v186->_gLayoutGenericCell;
        if (!gLayoutNoBackgroundCell)
        {
          v81 = [ManagedTableViewCell alloc];
          gLayoutNoBackgroundCell = (ManagedTableViewCell *)objc_msgSend_initWithStyle_reuseIdentifier_(v81, v82, 0, CFSTR("GenericTypeCellID"));
          v186->_gLayoutGenericCell = gLayoutNoBackgroundCell;
        }
      }
      objc_msgSend_bounds(a3, v60, v61);
      v70 = a4;
      v68 = v183;
      if (v84 <= 0.0)
      {
        v71 = v186;
      }
      else
      {
        objc_msgSend_frame(gLayoutNoBackgroundCell, v76, v83);
        v86 = v85;
        objc_msgSend_bounds(a3, v87, v88);
        v71 = v186;
        if (v86 != v90)
        {
          objc_msgSend_frame(gLayoutNoBackgroundCell, v76, v89);
          v92 = v91;
          v94 = v93;
          objc_msgSend_bounds(a3, v95, v96);
          objc_msgSend_setFrame_(gLayoutNoBackgroundCell, v97, v98, v92, v94);
        }
      }
    }
    else
    {
      gLayoutNoBackgroundCell = (ManagedTableViewCell *)objc_msgSend_dequeueReusableCellWithIdentifier_(a3, v60, (uint64_t)v58);
      v70 = a4;
      v71 = v186;
      v68 = v183;
    }
    if (!gLayoutNoBackgroundCell)
    {
      if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager tableView:cellForRowAtIndexPath:layoutMode:]", 800, (uint64_t)"creating cell from scratch\n", v77, v78, v79, v80, v180);
      v99 = [ManagedTableViewCell alloc];
      gLayoutNoBackgroundCell = (ManagedTableViewCell *)(id)objc_msgSend_initWithStyle_reuseIdentifier_(v99, v100, 0, v58);
    }
    objc_msgSend_setParentTableManager_(gLayoutNoBackgroundCell, v76, (uint64_t)v71);
  }
  v101 = (void *)objc_msgSend_objectForKey_(SectionDictForSection, v73, (uint64_t)CFSTR("furthestTextInset"));
  v104 = objc_msgSend_integerValue(v101, v102, v103);
  objc_msgSend_setForcedRightmostEditTextInset_(gLayoutNoBackgroundCell, v105, v106, (double)v104);
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager tableView:cellForRowAtIndexPath:layoutMode:]", 800, (uint64_t)"cell is %@\n", v108, v109, v110, v111, (uint64_t)gLayoutNoBackgroundCell);
  objc_msgSend_setAccessoryType_(gLayoutNoBackgroundCell, v107, v185);
  objc_msgSend_setAccessoryView_(gLayoutNoBackgroundCell, v112, 0);
  objc_msgSend_setEditingAccessoryType_(gLayoutNoBackgroundCell, v113, (uint64_t)obj);
  objc_msgSend_setEditingAccessoryView_(gLayoutNoBackgroundCell, v114, 0);
  v116 = (void *)objc_msgSend_objectForKey_(v68, v115, (uint64_t)CFSTR("verifierAccessory"));
  if (v116)
  {
    v119 = objc_msgSend_integerValue(v116, v117, v118);
    objc_msgSend_setVerifierAccessoryView_forCell_(v71, v120, v119, gLayoutNoBackgroundCell);
  }
  if (v51)
  {
    objc_msgSend_setSelectionStyle_(gLayoutNoBackgroundCell, v117, 1);
    v123 = objc_msgSend_accessibilityTraits(gLayoutNoBackgroundCell, v121, v122);
    objc_msgSend_setAccessibilityTraits_(gLayoutNoBackgroundCell, v124, *MEMORY[0x24BDF73B0] | v123);
  }
  else
  {
    objc_msgSend_setSelectionStyle_(gLayoutNoBackgroundCell, v117, 0);
  }
  v126 = (void *)objc_msgSend_objectForKey_(v68, v125, (uint64_t)CFSTR("tag"));
  if (v126)
  {
    v129 = objc_msgSend_integerValue(v126, v127, v128);
    objc_msgSend_setTag_(gLayoutNoBackgroundCell, v130, v129);
  }
  v182 = v70;
  objc_msgSend_setCurrentIndexPath_(gLayoutNoBackgroundCell, v127, (uint64_t)v70);
  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  obja = (id)objc_msgSend_objectForKey_(v68, v131, (uint64_t)CFSTR("items"));
  v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v132, (uint64_t)&v189, v193, 16);
  if (!v133)
  {
LABEL_90:
    v39 = gLayoutNoBackgroundCell;
    if (v184)
    {
      v172 = (void *)objc_msgSend_objectForKey_(v183, v134, (uint64_t)CFSTR("menuSelected"));
      v175 = objc_msgSend_BOOLValue(v172, v173, v174);
      objc_msgSend_setMenuCell_visualStateToSelected_atIndexPath_(v71, v176, (uint64_t)gLayoutNoBackgroundCell, v175, v182);
    }
    v177 = objc_msgSend_objectForKey_(v183, v134, (uint64_t)CFSTR("accessibilityLabel"));
    if (v177)
      objc_msgSend_setAccessibilityLabel_(gLayoutNoBackgroundCell, v178, v177);
    objc_msgSend_setCellDict_(gLayoutNoBackgroundCell, v178, (uint64_t)v183);
    return v39;
  }
  v135 = v133;
  v136 = v17 | (v14 << 16);
  v137 = *(_QWORD *)v190;
LABEL_67:
  v138 = 0;
  while (1)
  {
    if (*(_QWORD *)v190 != v137)
      objc_enumerationMutation(obja);
    v139 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * v138);
    v140 = (void *)objc_msgSend_objectForKey_(v139, v134, (uint64_t)CFSTR("itemType"));
    v142 = objc_msgSend_objectForKey_(v139, v141, (uint64_t)CFSTR("startValue"));
    if (v142)
    {
      v144 = (void *)v142;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && objc_msgSend_isEqualToString_(v144, v145, (uint64_t)CFSTR("dynamicValue")))
      {
        objc_msgSend_delegate(v71, v145, v146);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v148 = (void *)objc_msgSend_delegate(v71, v143, v147);
          v151 = objc_msgSend_tag(gLayoutNoBackgroundCell, v149, v150);
          v153 = objc_msgSend_valueForItemOfType_atTypeIndex_inCellWithTag_(v148, v152, (uint64_t)v140, 0, v151);
          objc_msgSend_setObject_forKey_(v139, v154, v153, CFSTR("currentValue"));
        }
      }
      else if (!objc_msgSend_objectForKey_(v139, v145, (uint64_t)CFSTR("currentValue")))
      {
        objc_msgSend_setObject_forKey_(v139, v143, (uint64_t)v144, CFSTR("currentValue"));
      }
    }
    v155 = (void *)objc_msgSend_objectForKey_(v139, v143, (uint64_t)CFSTR("cachedView"));
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (v155)
    {
      if ((isKindOfClass & 1) != 0)
      {
        v159 = (void *)MEMORY[0x24BDD17C8];
        Letter = objc_msgSend_stringByCapitalizingFirstLetter(v140, v157, v158);
        v160 = v159;
        v71 = v186;
        v162 = (NSString *)objc_msgSend_stringWithFormat_(v160, v161, (uint64_t)CFSTR("set%@Value:usingItemInfo:"), Letter);
        v163 = NSSelectorFromString(v162);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend_performSelector_withObject_withObject_(v186, v157, (uint64_t)v163, v155, v139);
      }
      goto LABEL_88;
    }
    if ((isKindOfClass & 1) != 0)
    {
      v164 = (NSString *)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v157, (uint64_t)CFSTR("%@:"), v140);
      v165 = NSSelectorFromString(v164);
      if ((objc_opt_respondsToSelector() & 1) == 0)
        return gLayoutNoBackgroundCell;
      v155 = (void *)objc_msgSend_performSelector_withObject_(v71, v166, (uint64_t)v165, v139);
      if (!v155)
        return gLayoutNoBackgroundCell;
      goto LABEL_87;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    v155 = v140;
    if (!v140)
      return gLayoutNoBackgroundCell;
LABEL_87:
    objc_msgSend_setObject_forKey_(v139, v167, (uint64_t)v155, CFSTR("cachedView"));
LABEL_88:
    objc_msgSend_setTag_(v155, v157, v136);
    if (v135 == ++v138)
    {
      v135 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v134, (uint64_t)&v189, v193, 16);
      if (v135)
        goto LABEL_67;
      goto LABEL_90;
    }
  }
  if (dword_2550F4588 > 800)
    return gLayoutNoBackgroundCell;
  v39 = gLayoutNoBackgroundCell;
  if (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager tableView:cellForRowAtIndexPath:layoutMode:]", 800, (uint64_t)"invalid kTableCellItemTypeKey value '%@'\n", v168, v169, v170, v171, (uint64_t)v140);
  return v39;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return (id)objc_msgSend_tableView_cellForRowAtIndexPath_layoutMode_(self, a2, (uint64_t)a3, a4, 0);
}

- (id)getRepresentedObjectForCellAtIndexPath:(id)a3
{
  id result;
  const char *v4;

  result = (id)objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a3);
  if (result)
    return (id)objc_msgSend_objectForKey_(result, v4, (uint64_t)CFSTR("representedObject"));
  return result;
}

- (void)updateHeader:(id)a3 forSectionWithIdentifier:(id)a4
{
  objc_msgSend_indexOfSectionWithIdentifier_(self, a2, (uint64_t)a4);
  MEMORY[0x24BEDD108](self, sel_updateHeader_inSection_, a3);
}

- (void)updateHeader:(id)a3 inSection:(unint64_t)a4
{
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_setDescriptorObject_forKey_inSection_(self, a2, (uint64_t)a3, CFSTR("header"), a4);
    MEMORY[0x24BEDD108](self, sel_reloadSection_, a4);
  }
}

- (void)updateFooter:(id)a3 forSectionWithIdentifier:(id)a4
{
  objc_msgSend_indexOfSectionWithIdentifier_(self, a2, (uint64_t)a4);
  MEMORY[0x24BEDD108](self, sel_updateFooter_inSection_, a3);
}

- (void)updateFooter:(id)a3 inSection:(unint64_t)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  UITableView *managedTableView;
  const char *v11;
  uint64_t v12;
  const char *v13;
  const char *v14;

  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_setDescriptorObject_forKey_inSection_(self, a2, (uint64_t)a3, CFSTR("footer"), a4);
    if (!self->_handlingBulkUpdate)
    {
      v8 = objc_msgSend_areAnimationsEnabled(MEMORY[0x24BDF6F90], v6, v7);
      objc_msgSend_setAnimationsEnabled_(MEMORY[0x24BDF6F90], v9, 0);
      managedTableView = self->_managedTableView;
      v12 = objc_msgSend_indexSetWithIndex_(MEMORY[0x24BDD15E0], v11, a4);
      objc_msgSend_reloadSections_withRowAnimation_(managedTableView, v13, v12, 5);
      objc_msgSend_setAnimationsEnabled_(MEMORY[0x24BDF6F90], v14, v8);
    }
  }
}

- (void)setRepresentedObject:(id)a3 forCellAtIndexPath:(id)a4
{
  void *CellDictForCellAtIndexPath;
  const char *v6;

  CellDictForCellAtIndexPath = (void *)objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a4);
  if (CellDictForCellAtIndexPath)
    objc_msgSend_setObject_forKey_(CellDictForCellAtIndexPath, v6, (uint64_t)a3, CFSTR("representedObject"));
}

- (double)totalTableHeight
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;

  v4 = (void *)objc_msgSend_tableHeaderView(self->_managedTableView, a2, v2);
  objc_msgSend_frame(v4, v5, v6);
  v8 = v7 + 0.0;
  objc_msgSend_totalTableSectionsHeight(self, v9, v10);
  v12 = v11 + v8;
  v15 = (void *)objc_msgSend_tableFooterView(self->_managedTableView, v13, v14);
  objc_msgSend_frame(v15, v16, v17);
  return v12 + v18;
}

- (double)totalTableSectionsHeight
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t DescriptorObjectForKey_inSection;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_numberOfSections(self->_managedTableView, a2, v2) < 1)
  {
    v11 = 0.0;
  }
  else
  {
    v9 = 0;
    v10 = *MEMORY[0x24BDF65F8];
    v11 = 0.0;
    do
    {
      objc_msgSend_rectForSection_(self->_managedTableView, v4, v9);
      v18 = v17;
      if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager totalTableSectionsHeight]", 800, (uint64_t)"section %f\n", v13, v14, v15, v16, v18);
      v11 = v11 + *(double *)&v18;
      DescriptorObjectForKey_inSection = objc_msgSend_getDescriptorObjectForKey_inSection_(self, v12, (uint64_t)CFSTR("footer"), v9);
      if (DescriptorObjectForKey_inSection)
      {
        v22 = (void *)DescriptorObjectForKey_inSection;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v33 = v10;
          v34[0] = objc_msgSend_systemFontOfSize_(MEMORY[0x24BDF6A70], v20, v21, 15.0);
          v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, (uint64_t)v34, &v33, 1);
          objc_msgSend_boundingRectWithSize_options_attributes_context_(v22, v25, 1, v24, 0, 300.0, 1024.0);
          v11 = v11 + v30;
          if (dword_2550F4588 <= 800)
          {
            v31 = *(_QWORD *)&v30;
            if (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u))
              sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager totalTableSectionsHeight]", 800, (uint64_t)"Footer text %f\n", v26, v27, v28, v29, v31);
          }
        }
      }
      ++v9;
    }
    while (v9 < objc_msgSend_numberOfSections(self->_managedTableView, v20, v21));
  }
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager totalTableSectionsHeight]", 800, (uint64_t)"returning %f\n", v5, v6, v7, v8, *(uint64_t *)&v11);
  return v11;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *CellDictForCellAtIndexPath;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  double v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  double v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  double v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  void *SectionDictForSection;
  const char *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  double v61;
  const char *v62;
  uint64_t v63;
  const char *v64;

  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
  {
    v7 = objc_msgSend_managedTableView(self, a2, (uint64_t)a3);
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager tableView:heightForRowAtIndexPath:]", 800, (uint64_t)"managedTableView %@\n", v8, v9, v10, v11, v7);
  }
  CellDictForCellAtIndexPath = (void *)objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a4);
  if (!CellDictForCellAtIndexPath)
    return 44.0;
  v14 = (void *)objc_msgSend_objectForKey_(CellDictForCellAtIndexPath, v13, (uint64_t)CFSTR("cachedHeight"));
  v15 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_bounds(a3, v16, v17);
  *(float *)&v19 = v18;
  v22 = objc_msgSend_numberWithFloat_(v15, v20, v21, v19);
  v24 = (void *)objc_msgSend_objectForKey_(v14, v23, v22);
  if (!v24)
  {
    v33 = (void *)objc_msgSend_tableView_cellForRowAtIndexPath_layoutMode_(self, v25, (uint64_t)a3, a4, 1);
    if (v33)
    {
      v36 = v33;
      objc_msgSend_layoutSubviews(v33, v34, v35);
      objc_msgSend_neededContentHeight(v36, v37, v38);
      v32 = v39;
      v42 = objc_msgSend_section(a4, v40, v41);
      SectionDictForSection = (void *)objc_msgSend_getSectionDictForSection_(self, v43, v42);
      v46 = (void *)objc_msgSend_objectForKey_(SectionDictForSection, v45, (uint64_t)CFSTR("furthestTextInset"));
      v49 = (double)objc_msgSend_integerValue(v46, v47, v48);
      objc_msgSend_computedRightmostEditTextInset(v36, v50, v51);
      if (v54 > v49)
      {
        if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
        {
          objc_msgSend_computedRightmostEditTextInset(v36, v52, v53);
          sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager tableView:heightForRowAtIndexPath:]", 800, (uint64_t)"computed max edit text inset = %.1f\n", v55, v56, v57, v58, v59);
        }
        v60 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_computedRightmostEditTextInset(v36, v52, v53);
        v63 = objc_msgSend_numberWithInteger_(v60, v62, (uint64_t)v61);
        objc_msgSend_setObject_forKey_(SectionDictForSection, v64, v63, CFSTR("furthestTextInset"));
      }
      goto LABEL_18;
    }
    return 44.0;
  }
  objc_msgSend_floatValue(v24, v25, v26);
  v32 = v31;
  if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager tableView:heightForRowAtIndexPath:]", 800, (uint64_t)"using cached height: %.0f\n", v27, v28, v29, v30, *(uint64_t *)&v32);
LABEL_18:
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager tableView:heightForRowAtIndexPath:]", 800, (uint64_t)"returning %f\n", v27, v28, v29, v30, *(uint64_t *)&v32);
  return v32;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *DescriptorObjectForKey_inSection;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;

  DescriptorObjectForKey_inSection = (void *)objc_msgSend_getDescriptorObjectForKey_inSection_(self, a2, (uint64_t)CFSTR("headerCache"));
  if (DescriptorObjectForKey_inSection)
  {
    objc_msgSend_bounds(DescriptorObjectForKey_inSection, v6, v7);
    v13 = v12;
  }
  else
  {
    v13 = *MEMORY[0x24BDF7DE0];
  }
  if (dword_2550F4648 <= 800 && (dword_2550F4648 != -1 || sub_21A69876C((uint64_t)&dword_2550F4648, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4648, (uint64_t)"-[TableViewManager tableView:heightForHeaderInSection:]", 800, (uint64_t)"section %d returning %f\n", v8, v9, v10, v11, a4);
  return v13;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *DescriptorObjectForKey_inSection;

  if (dword_2550F4648 <= 800 && (dword_2550F4648 != -1 || sub_21A69876C((uint64_t)&dword_2550F4648, 0x320u)))
  {
    v6 = objc_msgSend_managedTableView(self, a2, (uint64_t)a3);
    sub_21A698FDC((uint64_t)&dword_2550F4648, (uint64_t)"-[TableViewManager tableView:titleForHeaderInSection:]", 800, (uint64_t)"managedTableView %@\n", v7, v8, v9, v10, v6);
  }
  DescriptorObjectForKey_inSection = (void *)objc_msgSend_getDescriptorObjectForKey_inSection_(self, a2, (uint64_t)CFSTR("header"), a4);
  if (DescriptorObjectForKey_inSection)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      DescriptorObjectForKey_inSection = 0;
  }
  if (dword_2550F4648 <= 800 && (dword_2550F4648 != -1 || sub_21A69876C((uint64_t)&dword_2550F4648, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4648, (uint64_t)"-[TableViewManager tableView:titleForHeaderInSection:]", 800, (uint64_t)"section %d returning %@\n", v11, v12, v13, v14, a4);
  return DescriptorObjectForKey_inSection;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *DescriptorObjectForKey_inSection;
  void *SectionDictForSection;
  const char *v13;

  DescriptorObjectForKey_inSection = (void *)objc_msgSend_getDescriptorObjectForKey_inSection_(self, a2, (uint64_t)CFSTR("header"));
  if (DescriptorObjectForKey_inSection)
  {
    SectionDictForSection = (void *)objc_msgSend_getSectionDictForSection_(self, v6, a4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend_setObject_forKey_(SectionDictForSection, v13, (uint64_t)DescriptorObjectForKey_inSection, CFSTR("headerCache"));
    else
      DescriptorObjectForKey_inSection = 0;
  }
  if (dword_2550F4648 <= 800 && (dword_2550F4648 != -1 || sub_21A69876C((uint64_t)&dword_2550F4648, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4648, (uint64_t)"-[TableViewManager tableView:viewForHeaderInSection:]", 800, (uint64_t)"section %d returning %@\n", v7, v8, v9, v10, a4);
  return DescriptorObjectForKey_inSection;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;

  v8 = *MEMORY[0x24BDF7DE0];
  if (dword_2550F4648 <= 800 && (dword_2550F4648 != -1 || sub_21A69876C((uint64_t)&dword_2550F4648, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4648, (uint64_t)"-[TableViewManager tableView:heightForFooterInSection:]", 800, (uint64_t)"section %d returning %f\n", v4, v5, v6, v7, a4);
  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id result;
  id v5;

  result = (id)objc_msgSend_getDescriptorObjectForKey_inSection_(self, a2, (uint64_t)CFSTR("footer"), a4);
  if (result)
  {
    v5 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v5;
    else
      return 0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id result;
  id v5;

  result = (id)objc_msgSend_getDescriptorObjectForKey_inSection_(self, a2, (uint64_t)CFSTR("footer"), a4);
  if (result)
  {
    v5 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return 0;
    else
      return v5;
  }
  return result;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  const char *v11;
  void *SectionDictForSection;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v30;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager tableView:willSelectRowAtIndexPath:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v30);
  v10 = objc_msgSend_section(a4, a2, (uint64_t)a3);
  SectionDictForSection = (void *)objc_msgSend_getSectionDictForSection_(self, v11, v10);
  if (!SectionDictForSection)
    return 0;
  v14 = (void *)objc_msgSend_objectForKey_(SectionDictForSection, v13, (uint64_t)CFSTR("sectionRows"));
  v17 = objc_msgSend_row(a4, v15, v16);
  if (v17 >= objc_msgSend_count(v14, v18, v19))
    return 0;
  v22 = objc_msgSend_row(a4, v20, v21);
  v24 = (void *)objc_msgSend_objectAtIndex_(v14, v23, v22);
  v26 = (void *)objc_msgSend_objectForKey_(v24, v25, (uint64_t)CFSTR("selectable"));
  if ((objc_msgSend_BOOLValue(v26, v27, v28) & 1) == 0)
    return 0;
  return a4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  const char *v12;
  uint64_t SectionDictForSection;
  const char *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  double v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager tableView:didSelectRowAtIndexPath:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v26);
  v11 = objc_msgSend_section(a4, a2, (uint64_t)a3);
  SectionDictForSection = objc_msgSend_getSectionDictForSection_(self, v12, v11);
  if (SectionDictForSection)
  {
    v15 = (void *)SectionDictForSection;
    v16 = objc_msgSend_cellForRowAtIndexPath_(self->_managedTableView, v14, (uint64_t)a4);
    v18 = (void *)objc_msgSend_objectForKey_(v15, v17, (uint64_t)CFSTR("sectionIsMenu"));
    v22 = 0.0;
    if (objc_msgSend_BOOLValue(v18, v19, v20))
    {
      objc_msgSend_selectMenuCellAtIndexPath_(self, v21, (uint64_t)a4);
      v22 = 0.15;
    }
    objc_msgSend_deselectRowAtIndexPath_animated_(a3, v21, (uint64_t)a4, 1);
    if (v16)
    {
      if (objc_msgSend_delegate(self, v23, v24))
        objc_msgSend_performSelector_withObject_afterDelay_(self, v25, (uint64_t)sel_deferedTouchInCellAtIndexPath_, a4, v22);
    }
  }
  else
  {
    objc_msgSend_deselectRowAtIndexPath_animated_(a3, v14, (uint64_t)a4, 1);
  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  void *CellDictForCellAtIndexPath;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;

  CellDictForCellAtIndexPath = (void *)objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a4);
  if (CellDictForCellAtIndexPath
    && (v6 = (void *)objc_msgSend_valueForKey_(CellDictForCellAtIndexPath, v5, (uint64_t)CFSTR("editingStyle"))) != 0)
  {
    return objc_msgSend_integerValue(v6, v7, v8);
  }
  else
  {
    return 0;
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend_delegate(self, v7, v8);
    MEMORY[0x24BEDD108](v9, sel_commitEditingStyle_forRowAtIndexPath_, a4);
  }
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_msgSend_delegate(self, v6, v7);
    MEMORY[0x24BEDD108](v8, sel_accessoryButtonTappedForRowWithIndexPath_, a4);
  }
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 1;
  v8 = objc_msgSend_delegate(self, v6, v7);
  return MEMORY[0x24BEDD108](v8, sel_shouldIndentWhileEditingRowAtIndexPath_, a4);
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *CellDictForCellAtIndexPath;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager tableView:shouldShowMenuForRowAtIndexPath:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v21);
  CellDictForCellAtIndexPath = (void *)objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a4);
  if (CellDictForCellAtIndexPath)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = (void *)objc_msgSend_objectForKey_(CellDictForCellAtIndexPath, v11, (uint64_t)CFSTR("items"), 0);
    CellDictForCellAtIndexPath = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v21, v25, 16);
    if (CellDictForCellAtIndexPath)
    {
      v15 = (uint64_t)CellDictForCellAtIndexPath;
      v16 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v12);
          v18 = (void *)objc_msgSend_objectForKey_(*(void **)(*((_QWORD *)&v21 + 1) + 8 * i), v14, (uint64_t)CFSTR("canCopy"));
          if (v18 && (objc_msgSend_BOOLValue(v18, v14, v19) & 1) != 0)
          {
            LOBYTE(CellDictForCellAtIndexPath) = 1;
            return (char)CellDictForCellAtIndexPath;
          }
        }
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v21, v25, 16);
        LOBYTE(CellDictForCellAtIndexPath) = 0;
        if (v15)
          continue;
        break;
      }
    }
  }
  return (char)CellDictForCellAtIndexPath;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  void *CellDictForCellAtIndexPath;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager tableView:canPerformAction:forRowAtIndexPath:withSender:]", 800, (uint64_t)"\n", (uint64_t)a5, (uint64_t)a6, v6, v7, v22);
  if (sel_copy_ == a4)
  {
    CellDictForCellAtIndexPath = (void *)objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a5);
    if (CellDictForCellAtIndexPath)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v13 = (void *)objc_msgSend_objectForKey_(CellDictForCellAtIndexPath, v12, (uint64_t)CFSTR("items"), 0);
      CellDictForCellAtIndexPath = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v22, v26, 16);
      if (CellDictForCellAtIndexPath)
      {
        v16 = (uint64_t)CellDictForCellAtIndexPath;
        v17 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v13);
            v19 = (void *)objc_msgSend_objectForKey_(*(void **)(*((_QWORD *)&v22 + 1) + 8 * i), v15, (uint64_t)CFSTR("canCopy"));
            if (v19 && (objc_msgSend_BOOLValue(v19, v15, v20) & 1) != 0)
            {
              LOBYTE(CellDictForCellAtIndexPath) = 1;
              return (char)CellDictForCellAtIndexPath;
            }
          }
          v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v22, v26, 16);
          LOBYTE(CellDictForCellAtIndexPath) = 0;
          if (v16)
            continue;
          break;
        }
      }
    }
  }
  else
  {
    LOBYTE(CellDictForCellAtIndexPath) = 0;
  }
  return (char)CellDictForCellAtIndexPath;
}

- (void)tableView:(id)a3 performAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  void *CellDictForCellAtIndexPath;
  const char *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager tableView:performAction:forRowAtIndexPath:withSender:]", 800, (uint64_t)"\n", (uint64_t)a5, (uint64_t)a6, v6, v7, v30);
  if (sel_copy_ == a4)
  {
    if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager tableView:performAction:forRowAtIndexPath:withSender:]", 800, (uint64_t)"copy:\n", (uint64_t)a5, (uint64_t)a6, v6, v7, v30);
    CellDictForCellAtIndexPath = (void *)objc_msgSend_getCellDictForCellAtIndexPath_(self, a2, (uint64_t)a5);
    if (CellDictForCellAtIndexPath)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v13 = (void *)objc_msgSend_objectForKey_(CellDictForCellAtIndexPath, v12, (uint64_t)CFSTR("items"));
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v31, v35, 16);
      if (v15)
      {
        v18 = v15;
        v19 = 0;
        v20 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v32 != v20)
              objc_enumerationMutation(v13);
            v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            v23 = (void *)objc_msgSend_objectForKey_(v22, v16, (uint64_t)CFSTR("canCopy"));
            if (v23)
            {
              if (objc_msgSend_BOOLValue(v23, v16, v24))
              {
                v25 = objc_msgSend_objectForKey_(v22, v16, (uint64_t)CFSTR("currentValue"));
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (v19)
                    objc_msgSend_appendFormat_(v19, v16, (uint64_t)CFSTR(" %@"), v25);
                  else
                    v19 = (void *)objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v16, v25);
                }
              }
            }
          }
          v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v31, v35, 16);
        }
        while (v18);
      }
      else
      {
        v19 = 0;
      }
      if (objc_msgSend_length(v19, v16, v17))
      {
        v28 = (void *)objc_msgSend_generalPasteboard(MEMORY[0x24BDF6C40], v26, v27);
        objc_msgSend_setString_(v28, v29, (uint64_t)v19);
      }
    }
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  NSUInteger length;
  NSUInteger location;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  unsigned __int16 v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *CellDictForCellAtIndexPath;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int isPartialStringValid_proposedSelectedRange_originalString_originalSelectedRange_errorDescription;
  char v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  char v65;
  uint64_t v66;
  int IsSecureAndUnchanged;
  uint64_t v68;
  _QWORD v69[2];
  uint64_t v70;
  void *v71;

  length = a4.length;
  location = a4.location;
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager textField:shouldChangeCharactersInRange:replacementString:]", 800, (uint64_t)"textField %@\n", a4.length, (uint64_t)a5, v5, v6, (uint64_t)a3);
  if (location == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v13 = (void *)MEMORY[0x24BDD15D8];
  v14 = objc_msgSend_tag(a3, a2, (uint64_t)a3) >> 16;
  v17 = objc_msgSend_tag(a3, v15, v16);
  v68 = objc_msgSend_indexPathForRow_inSection_(v13, v18, v14, v17);
  v21 = objc_msgSend_text(a3, v19, v20);
  IsSecureAndUnchanged = objc_msgSend_textFieldIsSecureAndUnchanged_(self, v22, (uint64_t)a3);
  if (IsSecureAndUnchanged)
  {
    v21 = objc_msgSend_string(MEMORY[0x24BDD17C8], v23, v24);
    v31 = (void *)objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v25, (uint64_t)a5);
    if (dword_2550F4588 > 800)
      goto LABEL_21;
    if (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u))
      sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager textField:shouldChangeCharactersInRange:replacementString:]", 800, (uint64_t)"starting secure text field edit (erasing old value)\n", v27, v28, v29, v30, v66);
  }
  else
  {
    v31 = (void *)objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v23, v21);
    if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager textField:shouldChangeCharactersInRange:replacementString:]", 800, (uint64_t)"current text %@\n", v33, v34, v35, v36, (uint64_t)v31);
    objc_msgSend_replaceCharactersInRange_withString_(v31, v32, location, length, a5);
  }
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
  {
    v37 = a5;
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager textField:shouldChangeCharactersInRange:replacementString:]", 800, (uint64_t)"text as it will be %@\n", v27, v28, v29, v30, (uint64_t)v31);
    goto LABEL_22;
  }
LABEL_21:
  v37 = a5;
LABEL_22:
  CellDictForCellAtIndexPath = (void *)objc_msgSend_getCellDictForCellAtIndexPath_(self, v26, v68);
  v40 = objc_msgSend_objectForKey_(CellDictForCellAtIndexPath, v39, (uint64_t)CFSTR("nsFormatter"));
  if (v40)
  {
    v43 = (void *)v40;
    v69[0] = location;
    v69[1] = length;
    v70 = 0;
    v71 = (void *)objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v41, (uint64_t)v31);
    isPartialStringValid_proposedSelectedRange_originalString_originalSelectedRange_errorDescription = objc_msgSend_isPartialStringValid_proposedSelectedRange_originalString_originalSelectedRange_errorDescription_(v43, v44, (uint64_t)&v71, v69, v21, location, length, &v70);
    if (isPartialStringValid_proposedSelectedRange_originalString_originalSelectedRange_errorDescription
      && (objc_msgSend_isEqualToString_(v71, v41, (uint64_t)v31) & 1) == 0)
    {
      v31 = (void *)objc_msgSend_stringWithString_(MEMORY[0x24BDD16A8], v41, (uint64_t)v71);
      objc_msgSend_setText_(a3, v51, (uint64_t)v31);
      v50 = 1;
    }
    else
    {
      v50 = 0;
    }
    if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager textField:shouldChangeCharactersInRange:replacementString:]", 800, (uint64_t)"formatter error: %@ outStr: %@\n", v45, v46, v47, v48, v70);
    if (!isPartialStringValid_proposedSelectedRange_originalString_originalSelectedRange_errorDescription)
      goto LABEL_40;
  }
  else
  {
    v50 = 0;
  }
  if (!objc_msgSend_delegate(self, v41, v42)
    || (objc_msgSend_delegate(self, v52, v53), (objc_opt_respondsToSelector() & 1) == 0)
    || (v54 = (void *)objc_msgSend_delegate(self, v52, v53),
        objc_msgSend_shouldChangeTextField_atIndexPath_forTextIndex_toString_(v54, v55, (uint64_t)a3, v68, 0, v31)))
  {
    v56 = objc_msgSend_tag(a3, v52, v53);
    objc_msgSend_findAndSetItemObject_toValue_inCellWithInternalRowSectionTagValue_(self, v57, (uint64_t)a3, v31, v56);
    if (IsSecureAndUnchanged)
    {
      v60 = objc_msgSend_string(MEMORY[0x24BDD17C8], v58, v59);
      if (objc_msgSend_isEqualToString_(v37, v61, v60))
      {
        v63 = objc_msgSend_notificationWithName_object_(MEMORY[0x24BDD16C8], v62, (uint64_t)CFSTR("TVM::Internal"), a3);
        objc_msgSend_uiTextFieldDidChange_(self, v64, v63);
      }
    }
    v65 = 1;
    return v65 & (v50 ^ 1);
  }
LABEL_40:
  v65 = 0;
  return v65 & (v50 ^ 1);
}

- (void)uiTextFieldDidChange:(id)a3
{
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = (void *)objc_msgSend_object(a3, a2, (uint64_t)a3);
  if (objc_msgSend_isDescendantOfView_(v4, v5, (uint64_t)self->_managedTableView))
  {
    v8 = objc_msgSend_tag(v4, v6, v7);
    v10 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x24BDD15D8], v9, v8 >> 16, (unsigned __int16)v8);
    objc_msgSend_delegate(self, v11, v12);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15 = objc_msgSend_delegate(self, v13, v14);
      MEMORY[0x24BEDD108](v15, sel_textFieldDidChangeAtIndexPath_, v10);
    }
  }
}

- (BOOL)textFieldShouldClear:(id)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  unsigned __int16 v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *CellDictForCellAtIndexPath;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t i;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  BOOL v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;

  v5 = (void *)objc_msgSend_string(MEMORY[0x24BDD16A8], a2, (uint64_t)a3);
  if (objc_msgSend_isEditing(a3, v6, v7))
  {
    v10 = (void *)MEMORY[0x24BDD15D8];
    v11 = objc_msgSend_tag(a3, v8, v9) >> 16;
    v14 = objc_msgSend_tag(a3, v12, v13);
    v16 = objc_msgSend_indexPathForRow_inSection_(v10, v15, v11, v14);
    CellDictForCellAtIndexPath = (void *)objc_msgSend_getCellDictForCellAtIndexPath_(self, v17, v16);
    if (objc_msgSend_objectForKey_(CellDictForCellAtIndexPath, v19, (uint64_t)CFSTR("nsFormatter"))
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v22 = (void *)MEMORY[0x24BDD16A8];
      v23 = objc_msgSend_text(a3, v20, v21);
      v5 = (void *)objc_msgSend_stringWithString_(v22, v24, v23);
      v27 = objc_msgSend_length(v5, v25, v26);
      if (v27)
      {
        v29 = v27;
        v30 = v27 - 1;
        for (i = 1; i <= v29; ++i)
        {
          if (!objc_msgSend_textField_shouldChangeCharactersInRange_replacementString_(self, v28, (uint64_t)a3, v30, i, &stru_24DD08368))break;
          --v30;
        }
        if (i != 1)
        {
          objc_msgSend_replaceCharactersInRange_withString_(v5, v28, v29 - (i - 1), i - 1, &stru_24DD08368);
          if (!objc_msgSend_delegate(self, v32, v33)
            || (objc_msgSend_delegate(self, v34, v35), (objc_opt_respondsToSelector() & 1) == 0)
            || (v37 = (void *)objc_msgSend_delegate(self, v34, v36),
                objc_msgSend_shouldChangeTextField_atIndexPath_forTextIndex_toString_(v37, v38, (uint64_t)a3, v16, 0, v5)))
          {
            objc_msgSend_setText_(a3, v34, (uint64_t)v5);
            v41 = 0;
LABEL_18:
            v44 = objc_msgSend_tag(a3, v39, v40);
            objc_msgSend_findAndSetItemObject_toValue_inCellWithInternalRowSectionTagValue_(self, v45, (uint64_t)a3, v5, v44);
            return v41;
          }
        }
      }
    }
    else if (!objc_msgSend_delegate(self, v20, v21)
           || (objc_msgSend_delegate(self, v39, v40), (objc_opt_respondsToSelector() & 1) == 0)
           || (v42 = (void *)objc_msgSend_delegate(self, v39, v40),
               objc_msgSend_shouldChangeTextField_atIndexPath_forTextIndex_toString_(v42, v43, (uint64_t)a3, v16, 0, v5)))
    {
      v41 = 1;
      goto LABEL_18;
    }
    return 0;
  }
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t NextResponderInTableView_foundParentCell;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  UIView *v28;
  const char *v29;
  NSIndexPath *v30;
  UITableView *managedTableView;
  BOOL v32;
  const char *v33;
  uint64_t v35;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager textFieldShouldReturn:]", 800, (uint64_t)"textField %@\n", v3, v4, v5, v6, (uint64_t)a3);
  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend_tag(a3, v9, v10) >> 16;
    v14 = (unsigned __int16)objc_msgSend_tag(a3, v12, v13);
    v17 = (void *)objc_msgSend_delegate(self, v15, v16);
    v19 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x24BDD15D8], v18, v11, v14);
    if (!objc_msgSend_shouldHandleReturnForTextField_atIndexPath_forTextIndex_(v17, v20, (uint64_t)a3, v19, 0))return 0;
  }
  v35 = 0;
  NextResponderInTableView_foundParentCell = objc_msgSend_findNextResponderInTableView_foundParentCell_(self, v9, (uint64_t)self->_managedTableView, &v35);
  if (NextResponderInTableView_foundParentCell)
  {
    v28 = (UIView *)NextResponderInTableView_foundParentCell;
    if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager textFieldShouldReturn:]", 800, (uint64_t)"got a nextResponder %@\n", v24, v25, v26, v27, (uint64_t)v28);
    objc_msgSend_becomeFirstResponder(v28, v22, v23);
    self->_currentFirstResponder = v28;

    v30 = (NSIndexPath *)(id)objc_msgSend_indexPathForCell_(self->_managedTableView, v29, v35);
    self->_currentFirstResponderCellPath = v30;
    managedTableView = self->_managedTableView;
    v32 = 1;
    objc_msgSend_scrollToRowAtIndexPath_atScrollPosition_animated_(managedTableView, v33, (uint64_t)v30, 0, 1);
  }
  else
  {
    objc_msgSend_resignFirstResponder(self->_currentFirstResponder, v22, v23);
    self->_currentFirstResponder = 0;

    self->_currentFirstResponderCellPath = 0;
    return 1;
  }
  return v32;
}

- (void)textFieldDidEndEditing:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  unsigned __int16 v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager textFieldDidEndEditing:]", 800, (uint64_t)"textField %@\n", v3, v4, v5, v6, (uint64_t)a3);
  if ((objc_msgSend_textFieldIsSecureAndUnchanged_(self, a2, (uint64_t)a3) & 1) == 0)
  {
    if (objc_msgSend_text(a3, v9, v10))
    {
      v13 = objc_msgSend_text(a3, v11, v12);
      v16 = objc_msgSend_tag(a3, v14, v15);
      objc_msgSend_findAndSetItemObject_toValue_inCellWithInternalRowSectionTagValue_(self, v17, (uint64_t)a3, v13, v16);
    }
    if (objc_msgSend_delegate(self, v11, v12))
    {
      objc_msgSend_delegate(self, v18, v19);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v22 = (void *)MEMORY[0x24BDD15D8];
        v23 = objc_msgSend_tag(a3, v20, v21) >> 16;
        v26 = objc_msgSend_tag(a3, v24, v25);
        v28 = objc_msgSend_indexPathForRow_inSection_(v22, v27, v23, v26);
        v31 = objc_msgSend_delegate(self, v29, v30);
        MEMORY[0x24BEDD108](v31, sel_textFieldDidEndEditingAtIndexPath_, v28);
      }
    }
  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  unsigned __int16 v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager textFieldShouldBeginEditing:]", 800, (uint64_t)"textField %@\n", v3, v4, v5, v6, (uint64_t)a3);
  if (objc_msgSend_isSecureTextEntry(a3, a2, (uint64_t)a3))
  {
    v11 = (void *)MEMORY[0x24BDD15D8];
    v12 = objc_msgSend_tag(a3, v9, v10) >> 16;
    v15 = objc_msgSend_tag(a3, v13, v14);
    v17 = objc_msgSend_indexPathForRow_inSection_(v11, v16, v12, v15);
    v20 = objc_msgSend_text(a3, v18, v19);
    objc_msgSend_setValue_forItemOfType_atItemTypeIndex_inCellAtIndexPath_(self, v21, v20, CFSTR("editTextView"), 0, v17);
  }
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int16 v12;
  const char *v13;

  v5 = objc_msgSend_tag(a3, a2, (uint64_t)a3);
  v12 = objc_msgSend_tag(a3, v6, v7);
  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager textFieldDidBeginEditing:]", 800, (uint64_t)"textField %@\n", v8, v9, v10, v11, (uint64_t)a3);
  self->_currentFirstResponder = (UIView *)a3;

  self->_currentFirstResponderCellPath = (NSIndexPath *)(id)objc_msgSend_indexPathForRow_inSection_(MEMORY[0x24BDD15D8], v13, v5 >> 16, v12);
}

- (void)switchAction:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  unsigned __int16 v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;

  v5 = objc_msgSend_tag(a3, a2, (uint64_t)a3);
  v8 = objc_msgSend_tag(a3, v6, v7);
  v11 = objc_msgSend_isOn(a3, v9, v10);
  v13 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v12, v11);
  v16 = objc_msgSend_tag(a3, v14, v15);
  if (objc_msgSend_findAndSetItemObject_toValue_inCellWithInternalRowSectionTagValue_(self, v17, (uint64_t)a3, v13, v16) != 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend_delegate(self, v18, v19))
  {
    objc_msgSend_delegate(self, v20, v21);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v24 = objc_msgSend_delegate(self, v22, v23);
      v26 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x24BDD15D8], v25, v5 >> 16, v8);
      MEMORY[0x24BEDD108](v24, sel_switchTouchedInCellAtIndexPath_forSwitchIndex_isOn_, v26);
    }
  }
}

- (void)buttonAction:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  unsigned __int16 v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;

  v5 = objc_msgSend_tag(a3, a2, (uint64_t)a3);
  v8 = objc_msgSend_tag(a3, v6, v7);
  v11 = objc_msgSend_tag(a3, v9, v10);
  if (objc_msgSend_findAndSetItemObject_toValue_inCellWithInternalRowSectionTagValue_(self, v12, (uint64_t)a3, 0, v11) != 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend_delegate(self, v13, v14))
  {
    objc_msgSend_delegate(self, v15, v16);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v19 = objc_msgSend_delegate(self, v17, v18);
      v21 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x24BDD15D8], v20, v5 >> 16, v8);
      MEMORY[0x24BEDD108](v19, sel_buttonTouchedInCellAtIndexPath_forButtonIndex_, v21);
    }
  }
}

- (void)segmentedControlValueChanged:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  unsigned __int16 v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;

  v5 = objc_msgSend_tag(a3, a2, (uint64_t)a3);
  v8 = objc_msgSend_tag(a3, v6, v7);
  v11 = objc_msgSend_selectedSegmentIndex(a3, v9, v10);
  v13 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v12, v11);
  v16 = objc_msgSend_tag(a3, v14, v15);
  if (objc_msgSend_findAndSetItemObject_toValue_inCellWithInternalRowSectionTagValue_(self, v17, (uint64_t)a3, v13, v16) != 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend_delegate(self, v18, v19))
  {
    objc_msgSend_delegate(self, v20, v21);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v24 = objc_msgSend_delegate(self, v22, v23);
      v26 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x24BDD15D8], v25, v5 >> 16, v8);
      MEMORY[0x24BEDD108](v24, sel_segmentedControlTouchedInCellAtIndexPath_forSegmentedControlIndex_selectedSegment_, v26);
    }
  }
}

- (void)selectedDateChanged:(id)a3
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  unsigned __int16 v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;

  v5 = objc_msgSend_tag(a3, a2, (uint64_t)a3);
  v8 = objc_msgSend_tag(a3, v6, v7);
  v11 = objc_msgSend_tag(a3, v9, v10);
  if (objc_msgSend_findAndSetItemObject_toValue_inCellWithInternalRowSectionTagValue_(self, v12, (uint64_t)a3, 0, v11) != 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend_delegate(self, v13, v14))
  {
    objc_msgSend_delegate(self, v15, v16);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v19 = objc_msgSend_delegate(self, v17, v18);
      v21 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x24BDD15D8], v20, v5 >> 16, v8);
      objc_msgSend_date(a3, v22, v23);
      MEMORY[0x24BEDD108](v19, sel_selectedDateChangedInCellAtIndexPath_forDatePickerIndex_withDate_, v21);
    }
  }
}

- (void)bulkUpdateBegin
{
  uint64_t v2;

  if (!self->_handlingBulkUpdate)
  {
    objc_msgSend_beginUpdates(self->_managedTableView, a2, v2);
    self->_handlingBulkUpdate = 1;
  }
}

- (void)bulkUpdateEnd
{
  uint64_t v2;

  if (self->_handlingBulkUpdate)
  {
    objc_msgSend_endUpdates(self->_managedTableView, a2, v2);
    self->_handlingBulkUpdate = 0;
  }
}

- (void)selectMenuCellAtIndexPath:(id)a3
{
  uint64_t v5;
  const char *v6;
  void *SectionDictForSection;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  char v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;

  v5 = objc_msgSend_section(a3, a2, (uint64_t)a3);
  SectionDictForSection = (void *)objc_msgSend_getSectionDictForSection_(self, v6, v5);
  if (SectionDictForSection)
  {
    v9 = SectionDictForSection;
    v10 = (void *)objc_msgSend_objectForKey_(SectionDictForSection, v8, (uint64_t)CFSTR("sectionIsMenu"));
    if (objc_msgSend_BOOLValue(v10, v11, v12))
    {
      v14 = objc_msgSend_indexOfSelectedRowInMenuSection_(self, v13, v5);
      v16 = (void *)objc_msgSend_objectForKey_(v9, v15, (uint64_t)CFSTR("sectionMenuOptions"));
      v19 = objc_msgSend_integerValue(v16, v17, v18);
      if (v14 != objc_msgSend_row(a3, v20, v21) || v5 != objc_msgSend_section(a3, v22, v23))
      {
        if (v14 != 0x7FFFFFFFFFFFFFFFLL && (v19 & 1) == 0)
        {
          v24 = objc_msgSend_indexPathForRow_inSection_(MEMORY[0x24BDD15D8], v22, v14, v5);
          v26 = objc_msgSend_cellForRowAtIndexPath_(self->_managedTableView, v25, v24);
          objc_msgSend_setMenuCell_visualStateToSelected_atIndexPath_(self, v27, v26, 0, v24);
        }
        v28 = objc_msgSend_cellForRowAtIndexPath_(self->_managedTableView, v22, (uint64_t)a3);
        objc_msgSend_setMenuCell_visualStateToSelected_atIndexPath_(self, v29, v28, 1, a3);
      }
    }
  }
}

- (id)cellInfoOfSelectedRowInMenuSection:(unint64_t)a3
{
  void *RowArrayForSection;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  RowArrayForSection = (void *)objc_msgSend_getRowArrayForSection_(self, a2, a3);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(RowArrayForSection, v4, (uint64_t)&v14, v18, 16);
  if (!v5)
    return 0;
  v7 = v5;
  v8 = *(_QWORD *)v15;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v8)
      objc_enumerationMutation(RowArrayForSection);
    v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
    v11 = (void *)objc_msgSend_objectForKey_(v10, v6, (uint64_t)CFSTR("menuSelected"));
    if (v11)
    {
      if ((objc_msgSend_BOOLValue(v11, v6, v12) & 1) != 0)
        return v10;
    }
    if (v7 == ++v9)
    {
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(RowArrayForSection, v6, (uint64_t)&v14, v18, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (unint64_t)indexOfSelectedRowInMenuSection:(unint64_t)a3
{
  void *RowArrayForSection;
  const char *v6;
  uint64_t v7;
  const char *v8;

  RowArrayForSection = (void *)objc_msgSend_getRowArrayForSection_(self, a2, a3);
  v7 = objc_msgSend_cellInfoOfSelectedRowInMenuSection_(self, v6, a3);
  if (v7 && RowArrayForSection)
    return objc_msgSend_indexOfObject_(RowArrayForSection, v8, v7);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)tagOfSelectedRowInMenuSection:(unint64_t)a3
{
  unint64_t result;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;

  result = objc_msgSend_cellInfoOfSelectedRowInMenuSection_(self, a2, a3);
  if (result)
  {
    v5 = (void *)objc_msgSend_objectForKey_((void *)result, v4, (uint64_t)CFSTR("tag"));
    return objc_msgSend_integerValue(v5, v6, v7);
  }
  return result;
}

- (void)setMenuCell:(id)a3 visualStateToSelected:(BOOL)a4 atIndexPath:(id)a5
{
  _BOOL8 v6;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *SectionDictForSection;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  char v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  void *InfoForItemOfType_atItemTypeIndex_inCell;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  const char *v42;
  void *v43;
  const char *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;

  v6 = a4;
  v9 = objc_msgSend_row(a5, a2, (uint64_t)a3);
  v12 = objc_msgSend_section(a5, v10, v11);
  SectionDictForSection = (void *)objc_msgSend_getSectionDictForSection_(self, v13, v12);
  if (SectionDictForSection)
  {
    v16 = SectionDictForSection;
    v19 = (void *)objc_msgSend_objectForKey_(SectionDictForSection, v15, (uint64_t)CFSTR("sectionRows"));
    if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    {
      v20 = objc_msgSend_section(a5, v17, v18);
      sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager setMenuCell:visualStateToSelected:atIndexPath:]", 800, (uint64_t)"section %d, row %d, selected = %s\n", v21, v22, v23, v24, v20);
    }
    if (v9 < objc_msgSend_count(v19, v17, v18))
    {
      v26 = (void *)objc_msgSend_objectForKey_(v16, v25, (uint64_t)CFSTR("sectionMenuOptions"));
      v29 = objc_msgSend_integerValue(v26, v27, v28);
      v31 = (void *)objc_msgSend_objectAtIndex_(v19, v30, v9);
      v33 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v32, v6);
      objc_msgSend_setObject_forKey_(v31, v34, v33, CFSTR("menuSelected"));
      InfoForItemOfType_atItemTypeIndex_inCell = (void *)objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(self, v35, (uint64_t)CFSTR("labelView"), 0, v31);
      v38 = (void *)objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(self, v37, (uint64_t)CFSTR("imageView"), 0, v31);
      v40 = (void *)objc_msgSend_objectForKey_(InfoForItemOfType_atItemTypeIndex_inCell, v39, (uint64_t)CFSTR("cachedView"));
      v43 = (void *)objc_msgSend_objectForKey_(v38, v41, (uint64_t)CFSTR("cachedView"));
      if (a3)
      {
        if (v6)
        {
          objc_msgSend_setObject_forKey_(InfoForItemOfType_atItemTypeIndex_inCell, v42, (uint64_t)self->_selectedTextColor, CFSTR("color"));
          objc_msgSend_setTextColor_(v40, v44, (uint64_t)self->_selectedTextColor);
          if ((v29 & 4) == 0)
          {
            v45 = a3;
            v46 = 3;
LABEL_16:
            objc_msgSend_setAccessoryType_(v45, v42, v46);
            return;
          }
          goto LABEL_13;
        }
        objc_msgSend_setObject_forKey_(InfoForItemOfType_atItemTypeIndex_inCell, v42, (uint64_t)self->_detailTextColor, CFSTR("color"));
        objc_msgSend_setTextColor_(v40, v52, (uint64_t)self->_detailTextColor);
        if ((v29 & 4) == 0)
        {
          v45 = a3;
          v46 = 0;
          goto LABEL_16;
        }
LABEL_19:
        objc_msgSend_setImage_(v43, v42, 0);
        v51 = v43;
        v50 = 0;
        goto LABEL_20;
      }
      if (v6)
      {
        if ((v29 & 4) != 0)
        {
LABEL_13:
          v47 = objc_msgSend_kitImageOfType_(ImageStore, v42, 1);
          objc_msgSend_setImage_(v43, v48, v47);
          v50 = objc_msgSend_kitImageOfType_(ImageStore, v49, 2);
          v51 = v43;
LABEL_20:
          MEMORY[0x24BEDD108](v51, sel_setHighlightedImage_, v50);
        }
      }
      else if ((v29 & 4) != 0)
      {
        goto LABEL_19;
      }
    }
  }
}

- (unint64_t)indexOfSectionWithIdentifier:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const char *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, v19, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = (void *)objc_msgSend_objectForKey_(v11, v7, (uint64_t)CFSTR("identifier"));
        if ((objc_msgSend_isEqualToString_(v12, v13, (uint64_t)a3) & 1) != 0)
          return objc_msgSend_indexOfObject_(v4, v7, (uint64_t)v11);
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)indexPathOfCellWithTag:(int64_t)a3
{
  void *v4;
  const char *v5;
  id result;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  result = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v33, v38, 16);
  if (result)
  {
    v8 = (uint64_t)result;
    v9 = *(_QWORD *)v34;
    v27 = *(_QWORD *)v34;
LABEL_3:
    v10 = 0;
    v28 = v8;
    while (1)
    {
      if (*(_QWORD *)v34 != v9)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
      result = (id)objc_msgSend_objectForKey_(v11, v7, (uint64_t)CFSTR("sectionRows"), v27);
      if (!result)
        break;
      v13 = result;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(result, v12, (uint64_t)&v29, v37, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v30;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v30 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            v19 = (void *)objc_msgSend_objectForKey_(v18, v7, (uint64_t)CFSTR("tag"));
            if (objc_msgSend_integerValue(v19, v20, v21) == a3)
            {
              v22 = (void *)MEMORY[0x24BDD15D8];
              v23 = objc_msgSend_indexOfObject_(v13, v7, (uint64_t)v18);
              v25 = objc_msgSend_indexOfObject_(v4, v24, (uint64_t)v11);
              return (id)objc_msgSend_indexPathForRow_inSection_(v22, v26, v23, v25);
            }
          }
          v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v7, (uint64_t)&v29, v37, 16);
          if (v15)
            continue;
          break;
        }
      }
      ++v10;
      v9 = v27;
      if (v10 == v28)
      {
        v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v33, v38, 16);
        result = 0;
        if (v8)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (id)indexPathOfFirstCellWithUnverifiedVerifier
{
  void *v3;
  const char *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v30, v35, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v31;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v25)
        objc_enumerationMutation(v3);
      v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v6);
      v8 = (void *)objc_msgSend_objectForKey_(v7, v5, (uint64_t)CFSTR("sectionRows"));
      if (!v8)
        break;
      v10 = v8;
      v23 = v6;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v26, v34, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v27;
LABEL_9:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)MEMORY[0x24BDD15D8];
          v16 = objc_msgSend_indexOfObject_(v10, v5, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14));
          v18 = objc_msgSend_indexOfObject_(v3, v17, (uint64_t)v7);
          v20 = (void *)objc_msgSend_indexPathForRow_inSection_(v15, v19, v16, v18);
          if (objc_msgSend_textFieldHasVerifierAtIndexPath_(self, v21, (uint64_t)v20))
          {
            if (!objc_msgSend_textFieldVerifiedAtIndexPath_(self, v5, (uint64_t)v20))
              return v20;
          }
          if (v12 == ++v14)
          {
            v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v5, (uint64_t)&v26, v34, 16);
            if (v12)
              goto LABEL_9;
            break;
          }
        }
      }
      v6 = v23 + 1;
      if (v23 + 1 == v24)
      {
        v20 = 0;
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v5, (uint64_t)&v30, v35, 16);
        if (v24)
          goto LABEL_3;
        return v20;
      }
    }
  }
  return 0;
}

- (BOOL)tagOfCellAtIndexPath:(id)a3 tag:(int64_t *)a4
{
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *RowArrayForSection;
  const char *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  BOOL result;

  v7 = objc_msgSend_row(a3, a2, (uint64_t)a3);
  v10 = objc_msgSend_section(a3, v8, v9);
  RowArrayForSection = (void *)objc_msgSend_getRowArrayForSection_(self, v11, v10);
  if (v7 >= objc_msgSend_count(RowArrayForSection, v13, v14))
    return 0;
  v16 = (void *)objc_msgSend_objectAtIndex_(RowArrayForSection, v15, v7);
  v20 = (void *)objc_msgSend_objectForKey_(v16, v17, (uint64_t)CFSTR("tag"));
  result = v20 != 0;
  if (a4)
  {
    if (v20)
    {
      *a4 = objc_msgSend_integerValue(v20, v18, v19);
      return 1;
    }
  }
  return result;
}

- (BOOL)textFieldHasVerifierAtIndexPath:(id)a3
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  const char *v9;
  uint64_t v11;

  v11 = 0;
  v3 = objc_msgSend_tagOfCellAtIndexPath_tag_(self, a2, (uint64_t)a3, &v11);
  if ((unint64_t)(v11 - 1987203159) < 2)
    v8 = v3;
  else
    v8 = 0;
  if (dword_2550F4608 <= 800 && (dword_2550F4608 != -1 || sub_21A69876C((uint64_t)&dword_2550F4608, 0x320u)))
  {
    v9 = "NO";
    if (v8)
      v9 = "YES";
    sub_21A698FDC((uint64_t)&dword_2550F4608, (uint64_t)"-[TableViewManager textFieldHasVerifierAtIndexPath:]", 800, (uint64_t)"returning %s\n", v4, v5, v6, v7, (uint64_t)v9);
  }
  return v8;
}

- (void)setVerifierCellAccessoryType:(int)a3 forCellsAtIndexPaths:(id)a4
{
  uint64_t v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  void *SectionDictForSection;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v5 = *(_QWORD *)&a3;
  v43 = *MEMORY[0x24BDAC8D0];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, a2, (uint64_t)&v38, v42, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v39;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v11)
        objc_enumerationMutation(a4);
      v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v12);
      v14 = objc_msgSend_row(v13, v8, v9);
      v17 = objc_msgSend_section(v13, v15, v16);
      SectionDictForSection = (void *)objc_msgSend_getSectionDictForSection_(self, v18, v17);
      if (!SectionDictForSection)
        break;
      v21 = (void *)objc_msgSend_objectForKey_(SectionDictForSection, v20, (uint64_t)CFSTR("sectionRows"));
      if (v14 < objc_msgSend_count(v21, v22, v23))
      {
        v24 = (void *)objc_msgSend_objectAtIndex_(v21, v8, v14);
        v26 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v25, v5);
        objc_msgSend_setObject_forKey_(v24, v27, v26, CFSTR("verifierAccessory"));
        if (dword_2550F4608 <= 800 && (dword_2550F4608 != -1 || sub_21A69876C((uint64_t)&dword_2550F4608, 0x320u)))
        {
          v30 = objc_msgSend_section(v13, v28, v29);
          sub_21A698FDC((uint64_t)&dword_2550F4608, (uint64_t)"-[TableViewManager setVerifierCellAccessoryType:forCellsAtIndexPaths:]", 800, (uint64_t)"section %d, row %d, type = %d\n", v31, v32, v33, v34, v30);
        }
        v35 = (void *)objc_msgSend_managedTableView(self, v28, v29);
        v37 = objc_msgSend_cellForRowAtIndexPath_(v35, v36, (uint64_t)v13);
        if (v37)
          objc_msgSend_setVerifierAccessoryView_forCell_(self, v8, v5, v37);
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v8, (uint64_t)&v38, v42, 16);
        if (v10)
          goto LABEL_3;
        return;
      }
    }
  }
}

- (BOOL)verifyStr1:(id)a3 forTag1:(unint64_t)a4 matchesStr2:(id)a5 forTag2:(unint64_t)a6
{
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;

  v9 = objc_msgSend_indexPathOfCellWithTag_(self, a2, a4);
  v11 = objc_msgSend_indexPathOfCellWithTag_(self, v10, a6);
  LOBYTE(a6) = 0;
  if (v9)
  {
    v14 = v11;
    if (v11)
    {
      LODWORD(a6) = objc_msgSend_isEqualToString_(a3, v12, (uint64_t)a5);
      if ((_DWORD)a6)
      {
        v19 = objc_msgSend_length(a3, v15, v16) ? 4 * (objc_msgSend_length(a5, v17, v18) != 0) : 0;
      }
      else
      {
        v20 = objc_msgSend_length(a5, v15, v16);
        v19 = v20 >= objc_msgSend_length(a3, v21, v22) ? 1 : 2;
      }
      v23 = objc_msgSend_arrayWithObjects_(MEMORY[0x24BDBCE30], v17, v9, v14, 0);
      objc_msgSend_setVerifierCellAccessoryType_forCellsAtIndexPaths_(self, v24, v19, v23);
      if (dword_2550F4608 <= 800 && (dword_2550F4608 != -1 || sub_21A69876C((uint64_t)&dword_2550F4608, 0x320u)))
      {
        v29 = "NO";
        if ((_DWORD)a6)
          v29 = "YES";
        sub_21A698FDC((uint64_t)&dword_2550F4608, (uint64_t)"-[TableViewManager verifyStr1:forTag1:matchesStr2:forTag2:]", 800, (uint64_t)"returning match = %s\n", v25, v26, v27, v28, (uint64_t)v29);
      }
    }
  }
  return a6;
}

- (BOOL)textFieldVerifiedAtIndexPath:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ValueForFirstItemOfType_inCellWithTag;
  const char *v15;
  uint64_t v16;
  const char *v17;
  int v18;
  const char *v19;
  uint64_t v21;

  if (dword_2550F4608 <= 800 && (dword_2550F4608 != -1 || sub_21A69876C((uint64_t)&dword_2550F4608, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4608, (uint64_t)"-[TableViewManager textFieldVerifiedAtIndexPath:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v21);
  if (objc_msgSend_textFieldHasVerifierAtIndexPath_(self, a2, (uint64_t)a3))
  {
    ValueForFirstItemOfType_inCellWithTag = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(self, v9, (uint64_t)CFSTR("editTextView"), 1987203159);
    v16 = objc_msgSend_getValueForFirstItemOfType_inCellWithTag_(self, v15, (uint64_t)CFSTR("editTextView"), 1987203160);
    v18 = 1;
    if (ValueForFirstItemOfType_inCellWithTag)
    {
      v10 = v16;
      if (v16)
        v18 = objc_msgSend_verifyStr1_forTag1_matchesStr2_forTag2_(self, v17, ValueForFirstItemOfType_inCellWithTag, 1987203159, v16, 1987203160);
    }
  }
  else
  {
    v18 = 1;
  }
  if (dword_2550F4608 <= 800 && (dword_2550F4608 != -1 || sub_21A69876C((uint64_t)&dword_2550F4608, 0x320u)))
  {
    v19 = "NO";
    if (v18)
      v19 = "YES";
    sub_21A698FDC((uint64_t)&dword_2550F4608, (uint64_t)"-[TableViewManager textFieldVerifiedAtIndexPath:]", 800, (uint64_t)"returning %s\n", v10, v11, v12, v13, (uint64_t)v19);
  }
  return v18;
}

+ (id)boldSystemLabelFont
{
  uint64_t v2;
  int v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  v3 = sub_21A731938((uint64_t)a1, a2, v2);
  v4 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend_labelFontSize(MEMORY[0x24BDF6A70], v5, v6);
  if (v3)
    return (id)objc_msgSend_systemFontOfSize_(v4, v7, v8);
  else
    return (id)objc_msgSend_boldSystemFontOfSize_(v4, v7, v8);
}

+ (id)systemLabelFont
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  sub_21A731938((uint64_t)a1, a2, v2);
  v3 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend_labelFontSize(MEMORY[0x24BDF6A70], v4, v5);
  return (id)objc_msgSend_systemFontOfSize_(v3, v6, v7);
}

+ (id)smallSystemLabelFont
{
  uint64_t v2;
  int v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  double v10;

  v3 = sub_21A731938((uint64_t)a1, a2, v2);
  v6 = (void *)MEMORY[0x24BDF6A70];
  if (v3)
  {
    objc_msgSend_smallSystemFontSize(MEMORY[0x24BDF6A70], v4, v5);
  }
  else
  {
    objc_msgSend_labelFontSize(MEMORY[0x24BDF6A70], v4, v5);
    v9 = v10 + -4.0;
  }
  return (id)objc_msgSend_systemFontOfSize_(v6, v7, v8, v9);
}

- (BOOL)textFieldIsSecureAndUnchanged:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  unsigned __int16 v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t CellDictForCellAtIndexPath;
  const char *v20;
  void *InfoForItemOfType_atItemTypeIndex_inCell;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager(private) textFieldIsSecureAndUnchanged:]", 800, (uint64_t)"textField %@\n", v3, v4, v5, v6, (uint64_t)a3);
  v9 = (void *)MEMORY[0x24BDD15D8];
  v10 = objc_msgSend_tag(a3, a2, (uint64_t)a3) >> 16;
  v13 = objc_msgSend_tag(a3, v11, v12);
  v15 = objc_msgSend_indexPathForRow_inSection_(v9, v14, v10, v13);
  if (!objc_msgSend_isSecureTextEntry(a3, v16, v17))
    return 0;
  CellDictForCellAtIndexPath = objc_msgSend_getCellDictForCellAtIndexPath_(self, v18, v15);
  InfoForItemOfType_atItemTypeIndex_inCell = (void *)objc_msgSend_getInfoForItemOfType_atItemTypeIndex_inCell_(self, v20, (uint64_t)CFSTR("editTextView"), 0, CellDictForCellAtIndexPath);
  v24 = (void *)objc_msgSend_text(a3, v22, v23);
  v26 = objc_msgSend_objectForKey_(InfoForItemOfType_atItemTypeIndex_inCell, v25, (uint64_t)CFSTR("startValue"));
  if (!objc_msgSend_isEqualToString_(v24, v27, v26))
    return 0;
  v30 = (void *)objc_msgSend_text(a3, v28, v29);
  v32 = objc_msgSend_objectForKey_(InfoForItemOfType_atItemTypeIndex_inCell, v31, (uint64_t)CFSTR("currentValue"));
  return objc_msgSend_isEqualToString_(v30, v33, v32);
}

- (void)deferedTouchInCellAtIndexPath:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;

  if (a3 && objc_msgSend_delegate(self, a2, (uint64_t)a3))
  {
    objc_msgSend_delegate(self, v5, v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = (void *)objc_msgSend_delegate(self, v7, v8);
      objc_msgSend_touchInCellAtIndexPath_(v9, v10, (uint64_t)a3);
    }
  }
}

- (id)getCellDictForCellAtIndexPath:(id)a3
{
  unint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *RowArrayForSection;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;

  v5 = objc_msgSend_row(a3, a2, (uint64_t)a3);
  v8 = objc_msgSend_section(a3, v6, v7);
  RowArrayForSection = (void *)objc_msgSend_getRowArrayForSection_(self, v9, v8);
  if (RowArrayForSection && (v13 = RowArrayForSection, v5 < objc_msgSend_count(RowArrayForSection, v11, v12)))
    return (id)objc_msgSend_objectAtIndex_(v13, v14, v5);
  else
    return 0;
}

- (void)reloadSection:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  UITableView *managedTableView;
  uint64_t v11;
  const char *v12;

  if (!self->_handlingBulkUpdate)
  {
    if (dword_2550F45C8 <= 800 && (dword_2550F45C8 != -1 || sub_21A69876C((uint64_t)&dword_2550F45C8, 0x320u)))
    {
      v5 = objc_msgSend_managedTableView(self, a2, a3);
      sub_21A698FDC((uint64_t)&dword_2550F45C8, (uint64_t)"-[TableViewManager(private) reloadSection:]", 800, (uint64_t)"managedTableView %@\n", v6, v7, v8, v9, v5);
    }
    managedTableView = self->_managedTableView;
    v11 = objc_msgSend_indexSetWithIndex_(MEMORY[0x24BDD15E0], a2, a3);
    objc_msgSend_reloadSections_withRowAnimation_(managedTableView, v12, v11, 0);
  }
}

- (id)getSectionDictForSection:(int64_t)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;

  v4 = (void *)objc_msgSend_objectForKey_(self->_tableDescriptorDict, a2, (uint64_t)CFSTR("tableSectionArray"));
  if (objc_msgSend_count(v4, v5, v6) <= (unint64_t)a3)
    return 0;
  else
    return (id)objc_msgSend_objectAtIndex_(v4, v7, a3);
}

- (id)getDescriptorObjectForKey:(id)a3 inSection:(int64_t)a4
{
  id result;
  const char *v6;

  result = (id)objc_msgSend_getSectionDictForSection_(self, a2, a4);
  if (result)
    return (id)objc_msgSend_objectForKey_(result, v6, (uint64_t)a3);
  return result;
}

- (void)setDescriptorObject:(id)a3 forKey:(id)a4 inSection:(int64_t)a5
{
  void *SectionDictForSection;
  const char *v8;

  SectionDictForSection = (void *)objc_msgSend_getSectionDictForSection_(self, a2, a5);
  if (SectionDictForSection)
  {
    if (a3)
      objc_msgSend_setObject_forKey_(SectionDictForSection, v8, (uint64_t)a3, a4);
    else
      objc_msgSend_removeObjectForKey_(SectionDictForSection, v8, (uint64_t)a4);
  }
}

- (id)getRowArrayForSection:(unint64_t)a3
{
  return (id)objc_msgSend_getDescriptorObjectForKey_inSection_(self, a2, (uint64_t)CFSTR("sectionRows"), a3);
}

- (void)setImageViewValue:(id)a3 usingItemInfo:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  double v24;
  double v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  void *v34;
  float v35;
  uint64_t v36;

  if (dword_2550F4688 <= 800 && (dword_2550F4688 != -1 || sub_21A69876C((uint64_t)&dword_2550F4688, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4688, (uint64_t)"-[TableViewManager(private) setImageViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v36);
  objc_msgSend_frame(a3, a2, (uint64_t)a3);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = objc_msgSend_objectForKey_(a4, v16, (uint64_t)CFSTR("currentValue"));
  objc_msgSend_setImage_(a3, v18, v17);
  if (v17)
  {
    v21 = (void *)objc_msgSend_image(a3, v19, v20);
    objc_msgSend_size(v21, v22, v23);
    v25 = v24;
    v28 = (void *)objc_msgSend_image(a3, v26, v27);
    objc_msgSend_size(v28, v29, v30);
    v15 = v33;
  }
  else
  {
    v34 = (void *)objc_msgSend_objectForKey_(a4, v19, (uint64_t)CFSTR("defaultHeight"));
    v25 = 0.0;
    if (v34)
    {
      objc_msgSend_floatValue(v34, v31, v32);
      v15 = v35;
    }
  }
  objc_msgSend_setFrame_(a3, v31, v32, v11, v13, v25, v15);
}

- (id)imageView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v9;
  const char *v10;
  uint64_t v12;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager(private) imageView:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v12);
  v9 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
  objc_msgSend_setImageViewValue_usingItemInfo_(self, v10, (uint64_t)v9, a3);
  return v9;
}

- (void)setLabelViewValue:(id)a3 usingItemInfo:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (dword_2550F4688 <= 800 && (dword_2550F4688 != -1 || sub_21A69876C((uint64_t)&dword_2550F4688, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4688, (uint64_t)"-[TableViewManager(private) setLabelViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v19);
  v10 = (void *)objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("currentValue"));
  objc_msgSend_setText_(a3, v11, (uint64_t)v10);
  if (v10
    && (v14 = objc_msgSend_newlineCharacterSet(MEMORY[0x24BDD14A8], v12, v13),
        (v16 = (void *)objc_msgSend_componentsSeparatedByCharactersInSet_(v10, v15, v14)) != 0))
  {
    v18 = objc_msgSend_count(v16, v12, v17);
  }
  else
  {
    v18 = 1;
  }
  objc_msgSend_setNumberOfLines_(a3, v12, v18);
}

- (id)labelView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  char v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  UIColor *detailTextColor;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  double v40;
  double v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v51;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager(private) labelView:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v51);
  v9 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  v12 = objc_msgSend_clearColor(MEMORY[0x24BDF6950], v10, v11);
  objc_msgSend_setBackgroundColor_(v9, v13, v12);
  objc_msgSend_setLabelViewValue_usingItemInfo_(self, v14, (uint64_t)v9, a3);
  v16 = objc_msgSend_objectForKey_(a3, v15, (uint64_t)CFSTR("font"));
  if (!v16)
    v16 = objc_msgSend_boldSystemLabelFont(TableViewManager, v17, v18);
  objc_msgSend_setFont_(v9, v17, v16);
  v20 = (void *)objc_msgSend_valueForKey_(a3, v19, (uint64_t)CFSTR("itemEnabled"));
  if (v20)
  {
    v23 = objc_msgSend_BOOLValue(v20, v21, v22);
    v25 = objc_msgSend_objectForKey_(a3, v24, (uint64_t)CFSTR("color"));
    if ((v23 & 1) == 0)
    {
      objc_msgSend_setTextColor_(v9, v26, (uint64_t)self->_subtitleColor);
      goto LABEL_14;
    }
  }
  else
  {
    v25 = objc_msgSend_objectForKey_(a3, v21, (uint64_t)CFSTR("color"));
  }
  detailTextColor = (UIColor *)v25;
  if (!v25)
    detailTextColor = self->_detailTextColor;
  objc_msgSend_setTextColor_(v9, v26, (uint64_t)detailTextColor);
LABEL_14:
  v29 = (void *)objc_msgSend_objectForKey_(a3, v27, (uint64_t)CFSTR("alignment"));
  if (v29)
  {
    v32 = objc_msgSend_integerValue(v29, v30, v31);
    objc_msgSend_setTextAlignment_(v9, v33, v32);
  }
  else
  {
    objc_msgSend_setTextAlignment_(v9, v30, 4);
  }
  objc_msgSend_setAdjustsFontSizeToFitWidth_(v9, v34, 1);
  v37 = (void *)objc_msgSend_font(v9, v35, v36);
  objc_msgSend_pointSize(v37, v38, v39);
  v41 = v40 + -4.0;
  v44 = (void *)objc_msgSend_font(v9, v42, v43);
  objc_msgSend_pointSize(v44, v45, v46);
  objc_msgSend_setMinimumScaleFactor_(v9, v48, v49, v41 / v47);
  return v9;
}

- (void)setMultilineLabelViewValue:(id)a3 usingItemInfo:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  if (dword_2550F4688 <= 800 && (dword_2550F4688 != -1 || sub_21A69876C((uint64_t)&dword_2550F4688, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4688, (uint64_t)"-[TableViewManager(private) setMultilineLabelViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v12);
  v10 = objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("currentValue"));
  objc_msgSend_setText_(a3, v11, v10);
}

- (id)multilineLabelView:(id)a3
{
  void *v3;
  const char *v4;

  v3 = (void *)objc_msgSend_labelView_(self, a2, (uint64_t)a3);
  objc_msgSend_setNumberOfLines_(v3, v4, 0);
  return v3;
}

- (void)setEditTextViewValue:(id)a3 usingItemInfo:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  if (dword_2550F4688 <= 800 && (dword_2550F4688 != -1 || sub_21A69876C((uint64_t)&dword_2550F4688, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4688, (uint64_t)"-[TableViewManager(private) setEditTextViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v12);
  v10 = objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("currentValue"));
  objc_msgSend_setText_(a3, v11, v10);
}

- (id)editTextView:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  const char *v67;
  uint64_t v68;

  v5 = objc_alloc(MEMORY[0x24BDF6EA8]);
  v8 = (id)objc_msgSend_initWithFrame_(v5, v6, v7, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend_setBorderStyle_(v8, v9, 0);
  v12 = objc_msgSend_clearColor(MEMORY[0x24BDF6950], v10, v11);
  objc_msgSend_setBackgroundColor_(v8, v13, v12);
  objc_msgSend_setAutocorrectionType_(v8, v14, 1);
  objc_msgSend_setAutocapitalizationType_(v8, v15, 0);
  objc_msgSend_setEnablesReturnKeyAutomatically_(v8, v16, 1);
  objc_msgSend_setDelegate_(v8, v17, (uint64_t)self);
  v19 = objc_msgSend_objectForKey_(a3, v18, (uint64_t)CFSTR("placeholder"));
  objc_msgSend_setPlaceholder_(v8, v20, v19);
  objc_msgSend_setEditTextViewValue_usingItemInfo_(self, v21, (uint64_t)v8, a3);
  v23 = (void *)objc_msgSend_objectForKey_(a3, v22, (uint64_t)CFSTR("secure"));
  if (v23)
  {
    v26 = objc_msgSend_BOOLValue(v23, v24, v25);
    objc_msgSend_setSecureTextEntry_(v8, v27, v26);
  }
  else
  {
    objc_msgSend_setSecureTextEntry_(v8, v24, 0);
  }
  v29 = (void *)objc_msgSend_objectForKey_(a3, v28, (uint64_t)CFSTR("textFieldViewMode"));
  if (v29)
  {
    v32 = objc_msgSend_integerValue(v29, v30, v31);
    objc_msgSend_setClearButtonMode_(v8, v33, v32);
  }
  else
  {
    objc_msgSend_setClearButtonMode_(v8, v30, 0);
  }
  v35 = objc_msgSend_objectForKey_(a3, v34, (uint64_t)CFSTR("font"));
  if (!v35)
    v35 = objc_msgSend_systemLabelFont(TableViewManager, v36, v37);
  objc_msgSend_setFont_(v8, v36, v35);
  v39 = objc_msgSend_objectForKey_(a3, v38, (uint64_t)CFSTR("color"));
  if (v39)
    objc_msgSend_setTextColor_(v8, v40, v39);
  else
    objc_msgSend_setTextColor_(v8, v40, (uint64_t)self->_editTextColor);
  v42 = (void *)objc_msgSend_objectForKey_(a3, v41, (uint64_t)CFSTR("keyboardType"));
  if (v42)
  {
    v45 = objc_msgSend_integerValue(v42, v43, v44);
    objc_msgSend_setKeyboardType_(v8, v46, v45);
  }
  v47 = (void *)objc_msgSend_objectForKey_(a3, v43, (uint64_t)CFSTR("returnKeyType"));
  if (v47)
  {
    v50 = objc_msgSend_integerValue(v47, v48, v49);
    objc_msgSend_setReturnKeyType_(v8, v51, v50);
  }
  v52 = (void *)objc_msgSend_objectForKey_(a3, v48, (uint64_t)CFSTR("alignment"));
  if (v52)
  {
    v56 = objc_msgSend_integerValue(v52, v53, v54);
  }
  else
  {
    v57 = (void *)objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], v53, v54);
    v56 = 2 * (objc_msgSend_userInterfaceLayoutDirection(v57, v58, v59) == 0);
  }
  objc_msgSend_setTextAlignment_(v8, v55, v56);
  objc_msgSend_setAdjustsFontSizeToFitWidth_(v8, v60, 1);
  v63 = (void *)objc_msgSend_font(v8, v61, v62);
  objc_msgSend_pointSize(v63, v64, v65);
  objc_msgSend_setMinimumFontSize_(v8, v67, v68, v66 + -4.0);
  return v8;
}

- (void)setSwitchViewValue:(id)a3 usingItemInfo:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (dword_2550F4688 <= 800 && (dword_2550F4688 != -1 || sub_21A69876C((uint64_t)&dword_2550F4688, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4688, (uint64_t)"-[TableViewManager(private) setSwitchViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v14);
  v10 = (void *)objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("currentValue"));
  v13 = objc_msgSend_BOOLValue(v10, v11, v12);
  MEMORY[0x24BEDD108](a3, sel_setOn_, v13);
}

- (id)switchView:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;

  v5 = objc_alloc(MEMORY[0x24BDF6E28]);
  v8 = (id)objc_msgSend_initWithFrame_(v5, v6, v7, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend_addTarget_action_forControlEvents_(v8, v9, (uint64_t)self, sel_switchAction_, 4096);
  v12 = objc_msgSend_clearColor(MEMORY[0x24BDF6950], v10, v11);
  objc_msgSend_setBackgroundColor_(v8, v13, v12);
  objc_msgSend_setSwitchViewValue_usingItemInfo_(self, v14, (uint64_t)v8, a3);
  return v8;
}

- (void)setActivityViewValue:(id)a3 usingItemInfo:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  if (dword_2550F4688 <= 800 && (dword_2550F4688 != -1 || sub_21A69876C((uint64_t)&dword_2550F4688, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4688, (uint64_t)"-[TableViewManager(private) setActivityViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v15);
  v10 = (void *)objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("currentValue"));
  if (objc_msgSend_BOOLValue(v10, v11, v12))
    objc_msgSend_startAnimating(a3, v13, v14);
  else
    objc_msgSend_stopAnimating(a3, v13, v14);
}

- (id)activityView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v9;
  const char *v10;
  id v11;
  const char *v12;
  const char *v13;
  uint64_t v15;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager(private) activityView:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v15);
  v9 = objc_alloc(MEMORY[0x24BDF67D0]);
  v11 = (id)objc_msgSend_initWithActivityIndicatorStyle_(v9, v10, 100);
  objc_msgSend_setHidesWhenStopped_(v11, v12, 1);
  objc_msgSend_setActivityViewValue_usingItemInfo_(self, v13, (uint64_t)v11, a3);
  return v11;
}

- (void)setButtonViewValue:(id)a3 usingItemInfo:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  if (dword_2550F4688 <= 800 && (dword_2550F4688 != -1 || sub_21A69876C((uint64_t)&dword_2550F4688, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4688, (uint64_t)"-[TableViewManager(private) setButtonViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v12);
  v10 = objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("currentValue"));
  objc_msgSend_setTitle_forState_(a3, v11, v10, 0);
}

- (id)buttonView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v22;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager(private) buttonView:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v22);
  v9 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("buttonImage"));
  v11 = objc_msgSend_objectForKey_(a3, v10, (uint64_t)CFSTR("buttonSelectedImage"));
  v14 = (void *)objc_msgSend_buttonWithType_(MEMORY[0x24BDF6880], v12, (v9 | v11) == 0);
  if (v9)
  {
    v15 = objc_msgSend_imageNamed_(MEMORY[0x24BDF6AC8], v13, v9);
    objc_msgSend_setImage_forState_(v14, v16, v15, 0);
  }
  if (v11)
  {
    v17 = objc_msgSend_imageNamed_(MEMORY[0x24BDF6AC8], v13, v11);
    objc_msgSend_setImage_forState_(v14, v18, v17, 1);
  }
  objc_msgSend_addTarget_action_forControlEvents_(v14, v13, (uint64_t)self, sel_buttonAction_, 64);
  objc_msgSend_setButtonViewValue_usingItemInfo_(self, v19, (uint64_t)v14, a3);
  objc_msgSend_setTitleColor_forState_(v14, v20, (uint64_t)self->_detailTextColor, 0);
  return v14;
}

- (id)segmentedControlView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  id v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v28;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager(private) segmentedControlView:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v28);
  v9 = objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("segmentedControlItems"));
  if (!v9)
    return 0;
  v11 = v9;
  v12 = (void *)objc_msgSend_valueForKey_(a3, v10, (uint64_t)CFSTR("currentValue"));
  v14 = (void *)objc_msgSend_valueForKey_(a3, v13, (uint64_t)CFSTR("itemEnabled"));
  v15 = objc_alloc(MEMORY[0x24BDF6D78]);
  v17 = (id)objc_msgSend_initWithItems_(v15, v16, v11);
  objc_msgSend_addTarget_action_forControlEvents_(v17, v18, (uint64_t)self, sel_segmentedControlValueChanged_, 4096);
  v21 = objc_msgSend_integerValue(v12, v19, v20);
  objc_msgSend_setSelectedSegmentIndex_(v17, v22, v21);
  if (v14)
  {
    v25 = objc_msgSend_BOOLValue(v14, v23, v24);
    objc_msgSend_setEnabled_(v17, v26, v25);
  }
  else
  {
    objc_msgSend_setEnabled_(v17, v23, 1);
  }
  return v17;
}

- (void)setProgressViewValue:(id)a3 usingItemInfo:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (dword_2550F4688 <= 800 && (dword_2550F4688 != -1 || sub_21A69876C((uint64_t)&dword_2550F4688, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4688, (uint64_t)"-[TableViewManager(private) setProgressViewValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v14);
  v10 = (void *)objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("currentValue"));
  if (v10)
  {
    objc_msgSend_floatValue(v10, v11, v12);
    MEMORY[0x24BEDD108](a3, sel_setProgress_, v13);
  }
}

- (id)progressView:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v9;
  const char *v10;
  id v11;
  const char *v12;
  uint64_t v14;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager(private) progressView:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v14);
  v9 = objc_alloc(MEMORY[0x24BDF6CF8]);
  v11 = (id)objc_msgSend_initWithProgressViewStyle_(v9, v10, 0);
  objc_msgSend_setProgressViewValue_usingItemInfo_(self, v12, (uint64_t)v11, a3);
  return v11;
}

- (void)setDatePickerValue:(id)a3 usingItemInfo:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  if (dword_2550F4688 <= 800 && (dword_2550F4688 != -1 || sub_21A69876C((uint64_t)&dword_2550F4688, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4688, (uint64_t)"-[TableViewManager(private) setDatePickerValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v22);
  v10 = objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("currentValue"));
  if (v10)
    objc_msgSend_setDate_(a3, v11, v10);
  v12 = (void *)objc_msgSend_valueForKey_(a4, v11, (uint64_t)CFSTR("datePickerMode"));
  v15 = objc_msgSend_integerValue(v12, v13, v14);
  objc_msgSend_setDatePickerMode_(a3, v16, v15);
  v18 = objc_msgSend_valueForKey_(a4, v17, (uint64_t)CFSTR("minValue"));
  objc_msgSend_setMinimumDate_(a3, v19, v18);
  v21 = objc_msgSend_valueForKey_(a4, v20, (uint64_t)CFSTR("maxValue"));
  MEMORY[0x24BEDD108](a3, sel_setMaximumDate_, v21);
}

- (id)datePicker:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v16;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager(private) datePicker:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v16);
  v9 = objc_alloc(MEMORY[0x24BDF69B8]);
  v12 = (id)objc_msgSend_initWithFrame_(v9, v10, v11, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend_addTarget_action_forControlEvents_(v12, v13, (uint64_t)self, sel_selectedDateChanged_, 4096);
  objc_msgSend_setDatePickerValue_usingItemInfo_(self, v14, (uint64_t)v12, a3);
  return v12;
}

- (void)setVerifierAccessoryView:(int)a3 forCell:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int isEditing;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  const char *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  id v39;

  isEditing = objc_msgSend_isEditing(a4, a2, *(uint64_t *)&a3);
  if (dword_2550F4608 <= 800)
  {
    if (dword_2550F4608 != -1 || sub_21A69876C((uint64_t)&dword_2550F4608, 0x320u))
    {
      v13 = "is NOT";
      if (isEditing)
        v13 = "is";
      sub_21A698FDC((uint64_t)&dword_2550F4608, (uint64_t)"-[TableViewManager(private) setVerifierAccessoryView:forCell:]", 800, (uint64_t)"cell %s editing\n", v8, v9, v10, v11, (uint64_t)v13);
    }
    if (dword_2550F4608 <= 800)
    {
      if (dword_2550F4608 != -1 || sub_21A69876C((uint64_t)&dword_2550F4608, 0x320u))
      {
        v14 = objc_msgSend_editingAccessoryView(a4, v6, v7);
        sub_21A698FDC((uint64_t)&dword_2550F4608, (uint64_t)"-[TableViewManager(private) setVerifierAccessoryView:forCell:]", 800, (uint64_t)"cell.editingAccessoryView = %@\n", v15, v16, v17, v18, v14);
      }
      if (dword_2550F4608 <= 800 && (dword_2550F4608 != -1 || sub_21A69876C((uint64_t)&dword_2550F4608, 0x320u)))
      {
        v19 = objc_msgSend_accessoryView(a4, v6, v7);
        sub_21A698FDC((uint64_t)&dword_2550F4608, (uint64_t)"-[TableViewManager(private) setVerifierAccessoryView:forCell:]", 800, (uint64_t)"cell.accessoryView = %@\n", v20, v21, v22, v23, v19);
      }
    }
  }
  switch(a3)
  {
    case 0:
      if (dword_2550F4608 <= 800 && (dword_2550F4608 != -1 || sub_21A69876C((uint64_t)&dword_2550F4608, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4608, (uint64_t)"-[TableViewManager(private) setVerifierAccessoryView:forCell:]", 800, (uint64_t)"verifier accessory type = kVerifierAccessoryTypeNone for cell %@\n", v8, v9, v10, v11, (uint64_t)a4);
      if (isEditing && objc_msgSend_editingAccessoryView(a4, v6, v7))
      {
        objc_msgSend_setEditingAccessoryView_(a4, v6, 0);
      }
      else if (objc_msgSend_accessoryView(a4, v6, v7))
      {
        objc_msgSend_setAccessoryView_(a4, v25, 0);
      }
      return;
    case 1:
      if (dword_2550F4608 > 800)
        goto LABEL_33;
      if (dword_2550F4608 == -1)
      {
        v24 = CFSTR("NotVerifiedFlat.png");
        if (!sub_21A69876C((uint64_t)&dword_2550F4608, 0x320u))
          goto LABEL_52;
      }
      else
      {
        v24 = CFSTR("NotVerifiedFlat.png");
      }
      v26 = "verifier accessory type = kVerifierAccessoryTypeInvalid for cell %@\n";
      goto LABEL_51;
    case 2:
      if (dword_2550F4608 <= 800 && (dword_2550F4608 != -1 || sub_21A69876C((uint64_t)&dword_2550F4608, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4608, (uint64_t)"-[TableViewManager(private) setVerifierAccessoryView:forCell:]", 800, (uint64_t)"verifier accessory type = kVerifierAccessoryTypeSmartInvalid for cell %@\n", v8, v9, v10, v11, (uint64_t)a4);
      if ((!isEditing || !objc_msgSend_editingAccessoryView(a4, v6, v7)) && !objc_msgSend_accessoryView(a4, v6, v7))
        return;
LABEL_33:
      v24 = CFSTR("NotVerifiedFlat.png");
      goto LABEL_52;
    case 3:
      if (dword_2550F4608 > 800)
        goto LABEL_44;
      if (dword_2550F4608 == -1)
      {
        v24 = CFSTR("VerifiedFlat.png");
        if (!sub_21A69876C((uint64_t)&dword_2550F4608, 0x320u))
          goto LABEL_52;
      }
      else
      {
        v24 = CFSTR("VerifiedFlat.png");
      }
      v26 = "verifier accessory type = kVerifierAccessoryTypeValid for cell %@\n";
LABEL_51:
      sub_21A698FDC((uint64_t)&dword_2550F4608, (uint64_t)"-[TableViewManager(private) setVerifierAccessoryView:forCell:]", 800, (uint64_t)v26, v8, v9, v10, v11, (uint64_t)a4);
LABEL_52:
      v27 = (void *)MEMORY[0x24BDD1488];
      v28 = objc_opt_class();
      v30 = objc_msgSend_bundleForClass_(v27, v29, v28);
      v32 = objc_msgSend_imageNamed_inBundle_(ImageStore, v31, (uint64_t)v24, v30);
      if (v32)
      {
        v33 = v32;
        v34 = objc_alloc(MEMORY[0x24BDF6AE8]);
        v39 = (id)objc_msgSend_initWithImage_(v34, v35, v33);
        if (isEditing)
        {
          objc_msgSend_setEditingAccessoryType_(a4, v36, 0);
          objc_msgSend_setEditingAccessoryView_(a4, v37, (uint64_t)v39);
        }
        else
        {
          objc_msgSend_setAccessoryType_(a4, v36, 0);
          objc_msgSend_setAccessoryView_(a4, v38, (uint64_t)v39);
        }

      }
      return;
    case 4:
      if (dword_2550F4608 <= 800 && (dword_2550F4608 != -1 || sub_21A69876C((uint64_t)&dword_2550F4608, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4608, (uint64_t)"-[TableViewManager(private) setVerifierAccessoryView:forCell:]", 800, (uint64_t)"verifier accessory type = kVerifierAccessoryTypeSmartValid for cell %@\n", v8, v9, v10, v11, (uint64_t)a4);
      if ((!isEditing || !objc_msgSend_editingAccessoryView(a4, v6, v7)) && !objc_msgSend_accessoryView(a4, v6, v7))
        return;
LABEL_44:
      v24 = CFSTR("VerifiedFlat.png");
      goto LABEL_52;
    default:
      return;
  }
}

- (void)setUnreadBubbleCountValue:(id)a3 usingItemInfo:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;

  if (dword_2550F4688 <= 800 && (dword_2550F4688 != -1 || sub_21A69876C((uint64_t)&dword_2550F4688, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4688, (uint64_t)"-[TableViewManager(private) setUnreadBubbleCountValue:usingItemInfo:]", 800, (uint64_t)"\n", v4, v5, v6, v7, v15);
  v10 = (void *)objc_msgSend_objectForKey_(a4, a2, (uint64_t)CFSTR("currentValue"));
  if (v10)
  {
    v13 = objc_msgSend_integerValue(v10, v11, v12);
    objc_msgSend_setCount_(a3, v14, v13);
  }
}

- (id)unreadBubbleCount:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  UnreadBubbleCount *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v15;

  if (dword_2550F4588 <= 800 && (dword_2550F4588 != -1 || sub_21A69876C((uint64_t)&dword_2550F4588, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4588, (uint64_t)"-[TableViewManager(private) unreadBubbleCount:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v15);
  v9 = [UnreadBubbleCount alloc];
  v12 = (id)objc_msgSend_initWithFrame_(v9, v10, v11, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend_setUnreadBubbleCountValue_usingItemInfo_(self, v13, (uint64_t)v12, a3);
  return v12;
}

@end
