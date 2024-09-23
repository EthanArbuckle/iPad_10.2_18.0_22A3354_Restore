@implementation HKEmergencyCardGroupTableItem

- (void)setSubitems:(id)a3
{
  NSArray *v5;
  NSArray *subitems;
  NSMutableArray *v7;
  NSMutableArray *cumulativeRowOffsets;
  NSArray *v9;

  v5 = (NSArray *)a3;
  objc_storeStrong((id *)&self->_allSubItems, a3);
  subitems = self->_subitems;
  self->_subitems = v5;
  v9 = v5;

  v7 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](v9, "count"));
  cumulativeRowOffsets = self->_cumulativeRowOffsets;
  self->_cumulativeRowOffsets = v7;

}

- (void)_getSubitem:(id *)a3 andSubitemRow:(int64_t *)a4 forTableViewRow:(int64_t)a5
{
  NSArray *v8;
  id v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_subitems;
  v9 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      v11 = 0;
      v12 = a5;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v11);
        v14 = objc_msgSend(v13, "numberOfRows", (_QWORD)v16);
        a5 = v12 - v14;
        if (v12 < v14)
        {
          v9 = v13;
          a5 = v12;
          goto LABEL_11;
        }
        v11 = (char *)v11 + 1;
        v12 -= v14;
      }
      while (v9 != v11);
      v9 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  v15 = objc_retainAutorelease(v9);
  *a3 = v15;
  *a4 = a5;

}

- (void)setData:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKEmergencyCardGroupTableItem;
  v4 = a3;
  -[HKEmergencyCardTableItem setData:](&v5, sel_setData_, v4);
  -[NSArray makeObjectsPerformSelector:withObject:](self->_allSubItems, "makeObjectsPerformSelector:withObject:", sel_setData_, v4, v5.receiver, v5.super_class);

}

- (void)setProfileFirstName:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKEmergencyCardGroupTableItem;
  v4 = a3;
  -[HKEmergencyCardTableItem setProfileFirstName:](&v5, sel_setProfileFirstName_, v4);
  -[NSArray makeObjectsPerformSelector:withObject:](self->_allSubItems, "makeObjectsPerformSelector:withObject:", sel_setProfileFirstName_, v4, v5.receiver, v5.super_class);

}

- (void)setOwningViewController:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKEmergencyCardGroupTableItem;
  v4 = a3;
  -[HKEmergencyCardTableItem setOwningViewController:](&v5, sel_setOwningViewController_, v4);
  -[NSArray makeObjectsPerformSelector:withObject:](self->_allSubItems, "makeObjectsPerformSelector:withObject:", sel_setOwningViewController_, v4, v5.receiver, v5.super_class);

}

- (BOOL)hasPresentableData
{
  NSArray *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSArray *subitems;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_allSubItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasPresentableData", (_QWORD)v14))
          -[NSArray addObject:](v3, "addObject:", v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  subitems = self->_subitems;
  self->_subitems = v3;

  -[HKEmergencyCardGroupTableItem subitems](self, "subitems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") != 0;

  return v12;
}

- (int64_t)numberOfRows
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_subitems;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "numberOfRows", (_QWORD)v9);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndex:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  id v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  v6 = a3;
  -[HKEmergencyCardGroupTableItem _getSubitem:andSubitemRow:forTableViewRow:](self, "_getSubitem:andSubitemRow:forTableViewRow:", &v10, &v11, a4);
  v7 = v10;
  objc_msgSend(v7, "tableView:cellForRowAtIndex:", v6, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndex:(int64_t)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  id v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v6 = a3;
  -[HKEmergencyCardGroupTableItem _getSubitem:andSubitemRow:forTableViewRow:](self, "_getSubitem:andSubitemRow:forTableViewRow:", &v11, &v12, a4);
  v7 = v11;
  objc_msgSend(v7, "tableView:estimatedHeightForRowAtIndex:", v6, v12);
  v9 = v8;

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndex:(int64_t)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  id v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  v6 = a3;
  -[HKEmergencyCardGroupTableItem _getSubitem:andSubitemRow:forTableViewRow:](self, "_getSubitem:andSubitemRow:forTableViewRow:", &v11, &v12, a4);
  v7 = v11;
  objc_msgSend(v7, "tableView:heightForRowAtIndex:", v6, v12);
  v9 = v8;

  return v9;
}

- (BOOL)shouldHighlightRowAtIndex:(int64_t)a3
{
  id v3;
  char v4;
  id v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  -[HKEmergencyCardGroupTableItem _getSubitem:andSubitemRow:forTableViewRow:](self, "_getSubitem:andSubitemRow:forTableViewRow:", &v6, &v7, a3);
  v3 = v6;
  v4 = objc_msgSend(v3, "shouldHighlightRowAtIndex:", v7);

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndex:(int64_t)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v6 = a3;
  -[HKEmergencyCardGroupTableItem _getSubitem:andSubitemRow:forTableViewRow:](self, "_getSubitem:andSubitemRow:forTableViewRow:", &v8, &v9, a4);
  v7 = v8;
  objc_msgSend(v7, "tableView:didSelectRowAtIndex:", v6, v9);

}

- (BOOL)canEditRowAtIndex:(int64_t)a3
{
  id v3;
  char v4;
  id v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  -[HKEmergencyCardGroupTableItem _getSubitem:andSubitemRow:forTableViewRow:](self, "_getSubitem:andSubitemRow:forTableViewRow:", &v6, &v7, a3);
  v3 = v6;
  v4 = objc_msgSend(v3, "canEditRowAtIndex:", v7);

  return v4;
}

- (int64_t)editingStyleForRowAtIndex:(int64_t)a3
{
  id v3;
  int64_t v4;
  id v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  -[HKEmergencyCardGroupTableItem _getSubitem:andSubitemRow:forTableViewRow:](self, "_getSubitem:andSubitemRow:forTableViewRow:", &v6, &v7, a3);
  v3 = v6;
  v4 = objc_msgSend(v3, "editingStyleForRowAtIndex:", v7);

  return v4;
}

- (int64_t)commitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  id v5;
  int64_t v6;
  id v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  -[HKEmergencyCardGroupTableItem _getSubitem:andSubitemRow:forTableViewRow:](self, "_getSubitem:andSubitemRow:forTableViewRow:", &v8, &v9, a4);
  v5 = v8;
  v6 = objc_msgSend(v5, "commitEditingStyle:forRowAtIndex:", a3, v9);

  return v6;
}

- (void)didCommitEditingStyle:(int64_t)a3 forRowAtIndex:(int64_t)a4
{
  id v5;
  id v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  -[HKEmergencyCardGroupTableItem _getSubitem:andSubitemRow:forTableViewRow:](self, "_getSubitem:andSubitemRow:forTableViewRow:", &v6, &v7, a4);
  v5 = v6;
  objc_msgSend(v5, "didCommitEditingStyle:forRowAtIndex:", a3, v7);

}

- (void)commitEditing
{
  -[NSArray makeObjectsPerformSelector:](self->_subitems, "makeObjectsPerformSelector:", sel_commitEditing);
}

- (NSArray)subitems
{
  return self->_subitems;
}

- (NSString)titleForHeader
{
  return self->_titleForHeader;
}

- (void)setTitleForHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleForHeader, 0);
  objc_storeStrong((id *)&self->_subitems, 0);
  objc_storeStrong((id *)&self->_allSubItems, 0);
  objc_storeStrong((id *)&self->_cumulativeRowOffsets, 0);
}

@end
