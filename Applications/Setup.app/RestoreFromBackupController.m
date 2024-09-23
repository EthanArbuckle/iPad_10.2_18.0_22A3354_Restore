@implementation RestoreFromBackupController

- (RestoreFromBackupController)init
{
  NSBundle *v3;
  NSString *v4;
  NSBundle *v5;
  NSString *v6;
  dispatch_queue_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSNotificationCenter *v19;
  RestoreFromBackupController *v20;
  objc_super v22;
  SEL v23;
  id location;

  v23 = a2;
  v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v4 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", CFSTR("CHOOSE_BACKUP"), &stru_100284738, CFSTR("RestoreFromBackup"));
  v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
  v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("CHOOSE_BACKUP_DETAILED"), &stru_100284738, CFSTR("RestoreFromBackup"));
  location = 0;
  v22.receiver = self;
  v22.super_class = (Class)RestoreFromBackupController;
  location = -[RestoreFromBackupController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v22, "initWithTitle:detailText:icon:adoptTableViewScrollView:", v4, v6, 0, 1);
  objc_storeStrong(&location, location);

  if (location)
  {
    v7 = dispatch_queue_create("com.apple.setup.backup_list", 0);
    v8 = (void *)*((_QWORD *)location + 8);
    *((_QWORD *)location + 8) = v7;

    v9 = objc_alloc_init((Class)MBManager);
    v10 = (void *)*((_QWORD *)location + 1);
    *((_QWORD *)location + 1) = v9;

    v11 = objc_alloc_init((Class)NSMutableArray);
    v12 = (void *)*((_QWORD *)location + 6);
    *((_QWORD *)location + 6) = v11;

    v13 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v14 = (void *)*((_QWORD *)location + 21);
    *((_QWORD *)location + 21) = v13;

    v15 = sub_1000878C0();
    objc_msgSend(*((id *)location + 21), "setDirectionalLayoutMargins:", v15, v16, v17, v18, *(_QWORD *)&v15, *(_QWORD *)&v16, *(_QWORD *)&v17, *(_QWORD *)&v18, *(_QWORD *)&v15, *(_QWORD *)&v16, *(_QWORD *)&v17, *(_QWORD *)&v18);
    objc_msgSend(*((id *)location + 21), "setDelegate:", location);
    objc_msgSend(*((id *)location + 21), "setDataSource:", location);
    objc_msgSend(*((id *)location + 21), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*((id *)location + 21), "_setDrawsSeparatorAtTopOfSections:", 1);
    objc_msgSend(*((id *)location + 21), "setEstimatedRowHeight:", 60.0);
    objc_msgSend(location, "setListState:", 0);
    v19 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
    -[NSNotificationCenter addObserver:selector:name:object:](v19, "addObserver:selector:name:object:", location, "significantTimeChange", UIApplicationSignificantTimeChangeNotification, 0);

    objc_msgSend(*((id *)location + 21), "registerClass:forCellReuseIdentifier:", objc_opt_class(DeviceRestoreBackupCell), CFSTR("PBSnapshotCell"));
    *((_BYTE *)location + 81) = 0;
  }
  v20 = (RestoreFromBackupController *)location;
  objc_storeStrong(&location, 0);
  return v20;
}

- (void)dealloc
{
  NSNotificationCenter *v2;
  objc_super v3;
  SEL v4;
  RestoreFromBackupController *v5;

  v5 = self;
  v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  -[NSNotificationCenter removeObserver:](v2, "removeObserver:", v5);

  -[NSTimer invalidate](v5->_refreshTimer, "invalidate");
  v3.receiver = v5;
  v3.super_class = (Class)RestoreFromBackupController;
  -[RestoreFromBackupController dealloc](&v3, "dealloc");
}

- (void)significantTimeChange
{
  id v2;
  RestoreFromBackupController *v3;
  BOOL v4;
  id v5;

  v2 = -[RestoreFromBackupController navigationController](self, "navigationController", a2);
  v3 = (RestoreFromBackupController *)objc_msgSend(v2, "topViewController");
  v4 = 0;
  if (v3 == self)
  {
    v4 = 1;
    if (self->_listState != 2)
      v4 = self->_listState == 3;
  }

  if (v4)
  {
    v5 = -[RestoreFromBackupController tableView](self, "tableView");
    objc_msgSend(v5, "reloadData");

  }
}

- (id)mostSimilarRestorablesInsertRemainingIntoArray:(id)a3 getOtherUniqueDevicesCount:(unint64_t *)a4
{
  NSArray *v5;
  id v6;
  uint64_t v7;
  unint64_t i;
  id v9;
  id v10;
  unsigned __int8 v11;
  id v12;
  id v14;
  _QWORD __b[8];
  id v16;
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  unint64_t *v21;
  id location[2];
  RestoreFromBackupController *v23;
  id v24;
  _BYTE v25[128];

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = a4;
  v20 = 0;
  v24 = (id)MGCopyAnswer(CFSTR("DeviceClass"), 0);
  v19 = v24;
  v18 = +[NSMutableSet set](NSMutableSet, "set");
  v17 = +[NSMutableArray array](NSMutableArray, "array");
  memset(__b, 0, sizeof(__b));
  v5 = v23->_backupList;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
  if (v6)
  {
    v7 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v6; ++i)
      {
        if (*(_QWORD *)__b[2] != v7)
          objc_enumerationMutation(v5);
        v16 = *(id *)(__b[1] + 8 * i);
        v14 = objc_msgSend(v16, "backupUDID");
        if ((objc_msgSend(v18, "containsObject:", v14) & 1) != 0)
        {
LABEL_7:
          objc_msgSend(location[0], "addObject:", v16);
          goto LABEL_14;
        }
        if ((objc_msgSend(v16, "isThisDevice") & 1) != 0)
        {
          objc_msgSend(v17, "insertObject:atIndex:", v16, 0);
        }
        else
        {
          v9 = objc_msgSend(v16, "backup");
          v10 = objc_msgSend(v9, "deviceClass");
          v11 = objc_msgSend(v10, "isEqualToString:", v19);

          if ((v11 & 1) != 0)
          {
            objc_msgSend(v17, "addObject:", v16);
          }
          else
          {
            if (v23->_listState == 3)
              goto LABEL_7;
            ++v20;
            objc_msgSend(location[0], "insertObject:atIndex:", v16);
          }
        }
LABEL_14:
        objc_msgSend(v18, "addObject:", v14);
        objc_storeStrong(&v14, 0);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
    }
    while (v6);
  }

  if (v21)
    *v21 = v20;
  v12 = v17;
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (void)_updateTable:(id)a3 toMatchArray:(id)a4 withVisibleArray:(id)a5 maxVisible:(unint64_t)a6 fromOldSection:(int64_t)a7 toNewSection:(int64_t)a8
{
  id v13;
  NSIndexSet *v14;
  id v15;
  NSIndexSet *v16;
  id v17;
  id v18;
  uint64_t v19;
  unint64_t i;
  unint64_t v21;
  id v22;
  NSIndexPath *v23;
  NSIndexPath *v24;
  id v25;
  NSIndexPath *v26;
  id v27;
  NSIndexPath *v28;
  char *v29;
  char *v30;
  char *v31;
  unint64_t v32;
  id v33;
  NSIndexPath *v34;
  id v35;
  id v36;
  uint64_t v37;
  unint64_t j;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[8];
  id v44;
  id v45;
  id v46;
  id v47[3];
  char *v48;
  char *v49;
  int v50;
  id v51;
  id v52;
  id v53;
  _QWORD __b[8];
  id v55;
  char *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  int64_t v61;
  int64_t v62;
  unint64_t v63;
  id v64;
  id v65;
  id location[2];
  RestoreFromBackupController *v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE v76[128];
  _BYTE v77[128];

  v67 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v65 = 0;
  objc_storeStrong(&v65, a4);
  v64 = 0;
  objc_storeStrong(&v64, a5);
  v63 = a6;
  v62 = a7;
  v61 = a8;
  objc_msgSend(location[0], "beginUpdates");
  v60 = +[NSMutableArray array](NSMutableArray, "array");
  v59 = +[NSMutableArray array](NSMutableArray, "array");
  v58 = objc_msgSend(v64, "count");
  if (!v58 || objc_msgSend(v65, "count"))
  {
    if (!v58 && objc_msgSend(v65, "count"))
    {
      v15 = location[0];
      v16 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v61);
      objc_msgSend(v15, "insertSections:withRowAnimation:", v16, 0);

    }
    v57 = objc_msgSend(v64, "copy");
    v56 = 0;
    memset(__b, 0, sizeof(__b));
    v17 = v65;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v77, 16);
    if (v18)
    {
      v19 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v18; ++i)
        {
          if (*(_QWORD *)__b[2] != v19)
            objc_enumerationMutation(v17);
          v55 = *(id *)(__b[1] + 8 * i);
          v21 = (unint64_t)v56;
          if (v21 >= (unint64_t)objc_msgSend(v64, "count"))
          {
            v27 = v60;
            v28 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v56, v61);
            objc_msgSend(v27, "addObject:", v28);

            objc_msgSend(v64, "addObject:", v55);
          }
          else
          {
            v53 = objc_msgSend(v64, "objectAtIndexedSubscript:", v56);
            if ((objc_msgSend(v55, "isEqual:", v53) & 1) == 0)
            {
              v52 = objc_msgSend(v57, "indexOfObject:", v55);
              if (v52 == (id)0x7FFFFFFFFFFFFFFFLL)
              {
                v25 = v60;
                v26 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v56, v61);
                objc_msgSend(v25, "addObject:", v26);

                objc_msgSend(v64, "insertObject:atIndex:", v55, v56);
              }
              else
              {
                v22 = location[0];
                v23 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v52, v62);
                v24 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v56, v61);
                objc_msgSend(v22, "moveRowAtIndexPath:toIndexPath:", v23, v24);

                v51 = objc_msgSend(v64, "indexOfObject:", v55);
                if (v51 != (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  objc_msgSend(v64, "removeObjectAtIndex:", v51);
                  objc_msgSend(v64, "insertObject:atIndex:", v55, v56);
                }
              }
            }
            objc_storeStrong(&v53, 0);
          }
          if ((unint64_t)++v56 >= v63)
          {
            v50 = 2;
            goto LABEL_26;
          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v77, 16);
      }
      while (v18);
    }
    v50 = 0;
LABEL_26:

    v73 = 0;
    v72 = 0;
    v74 = 0;
    v75 = 0;
    v49 = 0;
    v48 = 0;
    v29 = (char *)objc_msgSend(v64, "count");
    if (v29 > v56)
    {
      v30 = v56;
      v31 = (char *)objc_msgSend(v64, "count");
      v69 = v30;
      v68 = (char *)(v31 - v56);
      v70 = v30;
      v71 = (char *)(v31 - v56);
      v47[2] = (id)(v31 - v56);
      v47[1] = v30;
      v48 = v30;
      v49 = (char *)(v31 - v56);
    }
    while (1)
    {
      v32 = (unint64_t)v56;
      if (v32 >= (unint64_t)objc_msgSend(v64, "count"))
        break;
      v47[0] = objc_msgSend(v64, "objectAtIndexedSubscript:", v56);
      v46 = objc_msgSend(v57, "indexOfObject:", v47[0]);
      v33 = v59;
      v34 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v46, v62);
      objc_msgSend(v33, "addObject:", v34);

      objc_storeStrong(v47, 0);
      ++v56;
    }
    objc_msgSend(v64, "removeObjectsInRange:", v48, v49);
    objc_storeStrong(&v57, 0);
  }
  else
  {
    v13 = location[0];
    v14 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v62);
    objc_msgSend(v13, "deleteSections:withRowAnimation:", v14, 0);

    objc_msgSend(v64, "removeAllObjects");
  }
  v45 = +[NSMutableSet set](NSMutableSet, "set");
  if (v67->_listState == 2)
  {
    memset(v43, 0, sizeof(v43));
    v35 = v64;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", v43, v76, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v43[2];
      do
      {
        for (j = 0; j < (unint64_t)v36; ++j)
        {
          if (*(_QWORD *)v43[2] != v37)
            objc_enumerationMutation(v35);
          v44 = *(id *)(v43[1] + 8 * j);
          v39 = v45;
          v40 = objc_msgSend(v44, "hashString");
          LOBYTE(v39) = objc_msgSend(v39, "containsObject:", v40);

          if ((v39 & 1) != 0)
          {
            v67->_shouldForceShowTimeStampOnBackups = 1;
            v50 = 7;
            goto LABEL_42;
          }
          v41 = v45;
          v42 = objc_msgSend(v44, "hashString");
          objc_msgSend(v41, "addObject:", v42);

        }
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", v43, v76, 16);
      }
      while (v36);
    }
    v50 = 0;
LABEL_42:

  }
  objc_msgSend(location[0], "insertRowsAtIndexPaths:withRowAnimation:", v60, 0);
  objc_msgSend(location[0], "deleteRowsAtIndexPaths:withRowAnimation:", v59, 0);
  objc_msgSend(location[0], "endUpdates");
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(location, 0);
}

- (void)updateVisibleSnapshots
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t i;
  char v17;
  id v18;
  unsigned __int8 v19;
  unint64_t v20;
  id v21;
  id v22;
  id v23;
  NSIndexSet *v24;
  id v25;
  void *v26;
  id v27;
  void **block;
  int v29;
  int v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  char v34;
  id v35;
  char v36;
  id v37;
  _QWORD __b[8];
  id v39;
  uint64_t v40;
  int v41;
  BOOL v42;
  id location;
  _QWORD v44[2];
  id v45;
  _BYTE v46[128];

  v45 = self;
  v44[1] = a2;
  v2 = -[RestoreFromBackupController tableView](self, "tableView");
  objc_msgSend(v2, "beginUpdates");

  if (*((_DWORD *)v45 + 14) == 3 || *((_DWORD *)v45 + 14) == 2)
  {
    v44[0] = 0;
    location = +[NSMutableArray array](NSMutableArray, "array");
    v3 = objc_msgSend(v45, "mostSimilarRestorablesInsertRemainingIntoArray:getOtherUniqueDevicesCount:", location, v44);
    v4 = (void *)*((_QWORD *)v45 + 5);
    *((_QWORD *)v45 + 5) = v3;

    if (*((_DWORD *)v45 + 14) == 3)
    {
      v44[0] = 0x7FFFFFFFFFFFFFFFLL;
    }
    else if (*((_DWORD *)v45 + 14) == 2)
    {
      v44[0] = objc_msgSend(*((id *)v45 + 5), "count");
    }
    v5 = objc_msgSend(*((id *)v45 + 5), "arrayByAddingObjectsFromArray:", location);
    v6 = (void *)*((_QWORD *)v45 + 5);
    *((_QWORD *)v45 + 5) = v5;

    v42 = 0;
    v7 = objc_msgSend(*((id *)v45 + 6), "count");
    v8 = 0;
    if (v7)
    {
      v9 = objc_msgSend(*((id *)v45 + 5), "count");
      v8 = 0;
      if (v9)
      {
        v10 = objc_msgSend(*((id *)v45 + 6), "count");
        v11 = objc_msgSend(*((id *)v45 + 5), "count");
        v8 = 0;
        if (v10 != v11)
        {
          v12 = objc_msgSend(*((id *)v45 + 6), "count");
          v8 = 1;
          if (v12 != (id)1)
            v8 = objc_msgSend(*((id *)v45 + 5), "count") == (id)1;
        }
      }
    }
    v42 = v8;
    v41 = 0;
    v40 = 0;
    memset(__b, 0, sizeof(__b));
    v13 = *((id *)v45 + 3);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
    if (v14)
    {
      v15 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v14; ++i)
        {
          if (*(_QWORD *)__b[2] != v15)
            objc_enumerationMutation(v13);
          v39 = *(id *)(__b[1] + 8 * i);
          v36 = 0;
          v34 = 0;
          v17 = 0;
          if ((objc_msgSend(v39, "isCompatible") & 1) == 0)
          {
            v18 = v39;
            v37 = objc_msgSend(v45, "availableUpdateVersion");
            v36 = 1;
            v19 = objc_msgSend(v18, "isCompatibleWithUpdateToSystemVersion:");
            v17 = 0;
            if ((v19 & 1) == 0)
            {
              v35 = objc_msgSend(v45, "betaEnrollmentStateManager");
              v34 = 1;
              v17 = objc_msgSend(v35, "isRestorableSeedEnrolled:", v39) ^ 1;
            }
          }
          if ((v34 & 1) != 0)

          if ((v36 & 1) != 0)
          if ((v17 & 1) != 0)
            ++v40;
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
      }
      while (v14);
    }

    if (v40 <= 0)
    {
      v41 = 0;
    }
    else
    {
      v20 = v40;
      if (v20 >= (unint64_t)objc_msgSend(*((id *)v45 + 3), "count"))
        v41 = 2;
      else
        v41 = 1;
    }
    *((_DWORD *)v45 + 19) = v41;
    v21 = v45;
    v22 = objc_msgSend(v45, "tableView");
    objc_msgSend(v21, "_updateTable:toMatchArray:withVisibleArray:maxVisible:fromOldSection:toNewSection:", v22, *((_QWORD *)v45 + 5), *((_QWORD *)v45 + 6), v44[0], 0, 0);

    if (v42)
    {
      v23 = objc_msgSend(v45, "tableView");
      v24 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 0);
      objc_msgSend(v23, "_reloadSectionHeaderFooters:withRowAnimation:", v24, 0);

    }
    if (objc_msgSend(*((id *)v45 + 5), "count"))
    {
      if (*((_DWORD *)v45 + 14) != 2
        || (v25 = objc_msgSend(*((id *)v45 + 6), "count"), v25 == objc_msgSend(*((id *)v45 + 5), "count")))
      {
        v26 = &_dispatch_main_q;
        block = _NSConcreteStackBlock;
        v29 = -1073741824;
        v30 = 0;
        v31 = sub_100088CA8;
        v32 = &unk_100280730;
        v33 = v45;
        dispatch_async((dispatch_queue_t)v26, &block);

        objc_storeStrong(&v33, 0);
      }
    }
    objc_storeStrong(&location, 0);
  }
  else if (*((_DWORD *)v45 + 14) == 1)
  {
    objc_msgSend(*((id *)v45 + 6), "removeAllObjects");
  }
  v27 = objc_msgSend(v45, "tableView");
  objc_msgSend(v27, "endUpdates");

}

- (void)setListState:(int)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  id v7;
  NSIndexSet *v8;
  id v9;
  NSIndexSet *v10;
  id v11;
  NSIndexSet *v12;
  id v13;
  NSIndexSet *v14;
  id v15;
  NSIndexSet *v16;
  id v17;
  NSIndexSet *v18;
  id v19;
  NSIndexSet *v20;
  id v21;
  NSIndexSet *v22;
  id v23;
  NSIndexSet *v24;
  id v25;
  NSIndexSet *v26;
  id v27;
  NSIndexSet *v28;
  id v29;
  id v30;
  id v31;
  os_log_t oslog[15];
  NSObject *v33;
  int listState;
  int v35;
  SEL v36;
  RestoreFromBackupController *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  uint8_t buf[24];

  v37 = self;
  v36 = a2;
  v35 = a3;
  if (a3 == self->_listState)
    return;
  listState = 0;
  listState = v37->_listState;
  v37->_listState = v35;
  v3 = -[RestoreFromBackupController tableView](v37, "tableView");
  v4 = objc_msgSend(v3, "numberOfSections");

  v33 = v4;
  v5 = -[RestoreFromBackupController tableView](v37, "tableView");
  objc_msgSend(v5, "beginUpdates");

  if (!listState && v35 == -1)
  {
    v7 = -[RestoreFromBackupController tableView](v37, "tableView");
    v8 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 0);
    objc_msgSend(v7, "deleteSections:withRowAnimation:", v8, 0);

    v9 = -[RestoreFromBackupController tableView](v37, "tableView");
    v63 = 0;
    v62 = -[RestoreFromBackupController _backupListErrorSectionCount](v37, "_backupListErrorSectionCount");
    v64 = 0;
    v65 = v62;
    oslog[14] = v62;
    oslog[13] = 0;
    v10 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v62);
    objc_msgSend(v9, "insertSections:withRowAnimation:", v10, 0);

LABEL_31:
    if (v37->_listState != 2 && v37->_listState != 3)
    {
      v29 = -[RestoreFromBackupController navigationItem](v37, "navigationItem");
      v30 = objc_msgSend(v29, "rightBarButtonItem");
      objc_msgSend(v30, "setEnabled:", 0);

    }
    v31 = -[RestoreFromBackupController tableView](v37, "tableView");
    objc_msgSend(v31, "endUpdates");

    return;
  }
  if (listState == -1 && !v35)
  {
    v11 = -[RestoreFromBackupController tableView](v37, "tableView");
    v59 = 0;
    v58 = -[RestoreFromBackupController _backupListErrorSectionCount](v37, "_backupListErrorSectionCount");
    v60 = 0;
    v61 = v58;
    oslog[12] = v58;
    oslog[11] = 0;
    v12 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v58);
    objc_msgSend(v11, "deleteSections:withRowAnimation:", v12, 0);

    v13 = -[RestoreFromBackupController tableView](v37, "tableView");
    v14 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 0);
    objc_msgSend(v13, "insertSections:withRowAnimation:", v14, 0);

    goto LABEL_31;
  }
  if (listState == -1 && v35 == 2)
  {
    v15 = -[RestoreFromBackupController tableView](v37, "tableView");
    v55 = 0;
    v54 = -[RestoreFromBackupController _backupListErrorSectionCount](v37, "_backupListErrorSectionCount");
    v56 = 0;
    v57 = v54;
    oslog[10] = v54;
    oslog[9] = 0;
    v16 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v54);
    objc_msgSend(v15, "deleteSections:withRowAnimation:", v16, 0);

    -[RestoreFromBackupController updateVisibleSnapshots](v37, "updateVisibleSnapshots");
    goto LABEL_31;
  }
  if (!listState && v37->_listState == 2)
  {
    v17 = -[RestoreFromBackupController tableView](v37, "tableView");
    v18 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 0);
    objc_msgSend(v17, "deleteSections:withRowAnimation:", v18, 0);

    -[RestoreFromBackupController updateVisibleSnapshots](v37, "updateVisibleSnapshots");
    goto LABEL_31;
  }
  if (listState == 2 && v37->_listState == 3)
  {
    -[RestoreFromBackupController updateVisibleSnapshots](v37, "updateVisibleSnapshots");
    goto LABEL_31;
  }
  if (!listState && v37->_listState == 1)
  {
    v19 = -[RestoreFromBackupController tableView](v37, "tableView");
    v20 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 0);
    objc_msgSend(v19, "deleteSections:withRowAnimation:", v20, 0);

    v21 = -[RestoreFromBackupController tableView](v37, "tableView");
    v51 = 0;
    v50 = -[RestoreFromBackupController _noBackupsFoundSectionCount](v37, "_noBackupsFoundSectionCount");
    v52 = 0;
    v53 = v50;
    oslog[8] = v50;
    oslog[7] = 0;
    v22 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v50);
    objc_msgSend(v21, "insertSections:withRowAnimation:", v22, 0);

    goto LABEL_31;
  }
  if (listState == 1 && (v37->_listState == 2 || v37->_listState == 3))
  {
    v23 = -[RestoreFromBackupController tableView](v37, "tableView");
    v47 = 0;
    v46 = -[RestoreFromBackupController _noBackupsFoundSectionCount](v37, "_noBackupsFoundSectionCount");
    v48 = 0;
    v49 = v46;
    oslog[6] = v46;
    oslog[5] = 0;
    v24 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v46);
    objc_msgSend(v23, "deleteSections:withRowAnimation:", v24, 0);

    -[RestoreFromBackupController updateVisibleSnapshots](v37, "updateVisibleSnapshots");
    goto LABEL_31;
  }
  if ((listState == 2 || listState == 3) && v37->_listState == 1)
  {
    -[RestoreFromBackupController updateVisibleSnapshots](v37, "updateVisibleSnapshots");
    v25 = -[RestoreFromBackupController tableView](v37, "tableView");
    v43 = 0;
    v42 = v33;
    v44 = 0;
    v45 = v33;
    oslog[4] = v33;
    oslog[3] = 0;
    v26 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v33);
    objc_msgSend(v25, "deleteSections:withRowAnimation:", v26, 0);

    v27 = -[RestoreFromBackupController tableView](v37, "tableView");
    v39 = 0;
    v38 = -[RestoreFromBackupController _noBackupsFoundSectionCount](v37, "_noBackupsFoundSectionCount");
    v40 = 0;
    v41 = v38;
    oslog[2] = v38;
    oslog[1] = 0;
    v28 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, v38);
    objc_msgSend(v27, "insertSections:withRowAnimation:", v28, 0);

    goto LABEL_31;
  }
  oslog[0] = (os_log_t)(id)_BYLoggingFacility(v6);
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_10003CBAC((uint64_t)buf, listState, v37->_listState);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "Tried to transition from state %i to state %i", buf, 0xEu);
  }
  objc_storeStrong((id *)oslog, 0);
}

- (void)updateListStateWithReload:(BOOL)a3
{
  NSObject *v3;
  os_log_type_t v4;
  _WORD v5[7];
  os_log_type_t v6;
  os_log_t oslog;
  BOOL v8;
  SEL v9;
  RestoreFromBackupController *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  if (self->_backupList && !v10->_scanningForUpdate)
  {
    if (-[NSArray count](v10->_backupList, "count"))
    {
      if (v10->_listState < 2u || v10->_listState == -1)
      {
        -[RestoreFromBackupController setListState:](v10, "setListState:", 2);
      }
      else if (v8)
      {
        -[RestoreFromBackupController updateVisibleSnapshots](v10, "updateVisibleSnapshots");
      }
    }
    else
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(0);
      v6 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v3 = oslog;
        v4 = v6;
        sub_100038C3C(v5);
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "No backups found", (uint8_t *)v5, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      -[RestoreFromBackupController setListState:](v10, "setListState:", 1);
    }
  }
}

- (void)setBackupList:(id)a3 forceReload:(BOOL)a4 withError:(id)a5
{
  char v7;
  char v8;
  id v9;
  BOOL v10;
  id location[2];
  RestoreFromBackupController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = a4;
  v9 = 0;
  objc_storeStrong(&v9, a5);
  if (v9)
  {
    if (!v12->_listState)
      -[RestoreFromBackupController setListState:](v12, "setListState:", 0xFFFFFFFFLL);
  }
  else if (location[0] != v12->_backupList)
  {
    v8 = (-[NSArray isEqual:](v12->_backupList, "isEqual:", location[0]) ^ 1) & 1;
    objc_storeStrong((id *)&v12->_backupList, location[0]);
    v7 = 1;
    if ((v8 & 1) == 0)
      v7 = v10;
    -[RestoreFromBackupController updateListStateWithReload:](v12, "updateListStateWithReload:", v7 & 1);
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)filteredRestorableItemsFromBackupList:(id)a3
{
  id v3;
  id v4;
  _QWORD **v5;
  uint64_t v6;
  unint64_t i;
  id v8;
  char v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t j;
  id v14;
  RestorableBackupItem *v15;
  id v16;
  uint64_t v18;
  _QWORD **v19;
  _QWORD v20[8];
  id v21;
  _QWORD __b[8];
  id v23;
  id v24;
  id location[3];
  _BYTE v26[128];
  _BYTE v27[128];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = +[NSMutableArray array](NSMutableArray, "array");
  memset(__b, 0, sizeof(__b));
  v3 = location[0];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
  if (v4)
  {
    v5 = (_QWORD **)&__b[2];
    v6 = *(_QWORD *)__b[2];
    do
    {
      for (i = 0; i < (unint64_t)v4; ++i)
      {
        if (**v5 != v6)
          objc_enumerationMutation(v3);
        v23 = *(id *)(__b[1] + 8 * i);
        v8 = objc_msgSend(v23, "productType");
        v9 = objc_msgSend(v8, "containsString:", CFSTR("RealityDevice")) ^ 1;

        if ((v9 & 1) != 0)
        {
          memset(v20, 0, sizeof(v20));
          v10 = objc_msgSend(v23, "snapshots");
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v20, v26, 16);
          if (v11)
          {
            v18 = v6;
            v19 = v5;
            v12 = *(_QWORD *)v20[2];
            do
            {
              for (j = 0; j < (unint64_t)v11; ++j)
              {
                if (*(_QWORD *)v20[2] != v12)
                  objc_enumerationMutation(v10);
                v21 = *(id *)(v20[1] + 8 * j);
                if (objc_msgSend(v21, "state", v18, v19) == 3)
                {
                  v14 = v24;
                  v15 = +[RestorableBackupItem restorableBackupItemWithBackup:snapshot:](RestorableBackupItem, "restorableBackupItemWithBackup:snapshot:", v23, v21);
                  objc_msgSend(v14, "addObject:", v15);

                }
              }
              v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v20, v26, 16);
            }
            while (v11);
            v5 = v19;
            v6 = v18;
          }

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
    }
    while (v4);
  }

  v16 = v24;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (void)updateBackupListCompletion:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  os_signpost_type_t v7;
  os_signpost_id_t v8;
  NSObject *update_backup_list_queue;
  void **v10;
  int v11;
  int v12;
  void (*v13)(id *);
  void *v14;
  RestoreFromBackupController *v15;
  id v16[3];
  os_log_type_t v17;
  os_log_t oslog;
  uint8_t buf[16];
  uint64_t v20;
  char v21;
  os_log_t log;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id location[2];
  RestoreFromBackupController *v28;
  uint8_t v29[24];

  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  v25 = 0;
  v3 = (id)_BYSignpostSubsystem();
  v4 = _BYSignpostCreate(v3);
  v24 = v5;
  v23 = (void *)v4;

  log = (os_log_t)(id)_BYSignpostSubsystem();
  v21 = 1;
  v20 = (uint64_t)v23;
  if (v23 && v20 != -1 && os_signpost_enabled(log))
  {
    v6 = log;
    v7 = v21;
    v8 = v20;
    sub_100038C3C(buf);
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, v7, v8, "BackupListLoadBackups", " enableTelemetry=YES ", buf, 2u);
  }
  objc_storeStrong((id *)&log, 0);
  oslog = (os_log_t)(id)_BYSignpostSubsystem();
  v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000342B4((uint64_t)v29, (uint64_t)v23);
    _os_log_impl((void *)&_mh_execute_header, oslog, v17, "BEGIN [%lld]: BackupListLoadBackups  enableTelemetry=YES ", v29, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v25 = v23;
  v26 = v24;
  update_backup_list_queue = v28->_update_backup_list_queue;
  v10 = _NSConcreteStackBlock;
  v11 = -1073741824;
  v12 = 0;
  v13 = sub_100089E24;
  v14 = &unk_1002819C8;
  v15 = v28;
  v16[0] = location[0];
  v16[1] = v25;
  v16[2] = v26;
  dispatch_async(update_backup_list_queue, &v10);
  objc_storeStrong(v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(location, 0);
}

- (void)refreshBackupListFromTimer:(id)a3
{
  RestoreFromBackupController *v3;
  void **v4;
  int v5;
  int v6;
  void (*v7)(id *, void *);
  void *v8;
  RestoreFromBackupController *v9;
  id location[2];
  RestoreFromBackupController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v4 = _NSConcreteStackBlock;
  v5 = -1073741824;
  v6 = 0;
  v7 = sub_10008A8DC;
  v8 = &unk_1002819F0;
  v9 = v11;
  -[RestoreFromBackupController updateBackupListCompletion:](v3, "updateBackupListCompletion:", &v4);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)cancelRestoreAndRemovePrimaryAppleAccount
{
  ProximitySetupController *v2;
  BOOL v3;
  id v4;

  v2 = -[RestoreFromBackupController proximitySetupController](self, "proximitySetupController");
  v3 = !-[ProximitySetupController signedIniCloudAccount](v2, "signedIniCloudAccount");

  if (!self->_appleAccountRemoved && v3)
  {
    self->_appleAccountRemoved = 1;
    v4 = +[BuddyAccountTools sharedBuddyAccountTools](BuddyAccountTools, "sharedBuddyAccountTools");
    objc_msgSend(v4, "removePrimaryAccountCompletion:", 0);

  }
}

- (void)scanForUpdateIfNecessaryForBackupList:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t i;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  BYSoftwareUpdateCache *v12;
  NSObject *v13;
  os_log_type_t v14;
  _WORD v15[7];
  os_log_type_t v16;
  os_log_t v17;
  void **v18;
  int v19;
  int v20;
  void (*v21)(uint64_t, void *, void *, void *);
  void *v22;
  RestoreFromBackupController *v23;
  id v24;
  id v25;
  uint8_t buf[15];
  os_log_type_t v27;
  os_log_t oslog;
  _QWORD __b[8];
  id v30;
  char v31;
  int v32;
  id v33;
  id location[2];
  RestoreFromBackupController *v35;
  _BYTE v36[128];

  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = 0;
  objc_storeStrong(&v33, a4);
  if (!v35->_scannedForUpdate && objc_msgSend(location[0], "count"))
  {
    v31 = 0;
    memset(__b, 0, sizeof(__b));
    v5 = location[0];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
    if (v6)
    {
      v7 = *(_QWORD *)__b[2];
      do
      {
        for (i = 0; i < (unint64_t)v6; ++i)
        {
          if (*(_QWORD *)__b[2] != v7)
            objc_enumerationMutation(v5);
          v30 = *(id *)(__b[1] + 8 * i);
          if ((objc_msgSend(v30, "isCompatible") & 1) == 0)
            v31 = 1;
          if ((v31 & 1) != 0)
          {
            v32 = 2;
            goto LABEL_18;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
      }
      while (v6);
    }
    v32 = 0;
LABEL_18:

    if ((v31 & 1) != 0)
    {
      oslog = (os_log_t)(id)_BYLoggingFacility(v9);
      v27 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v10 = oslog;
        v11 = v27;
        sub_100038C3C(buf);
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "Found an incompatible snapshot. Scanning for OS update...", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      -[RestoreFromBackupController setScanningForUpdate:](v35, "setScanningForUpdate:", 1);
      v12 = -[RestoreFromBackupController softwareUpdateCache](v35, "softwareUpdateCache");
      v18 = _NSConcreteStackBlock;
      v19 = -1073741824;
      v20 = 0;
      v21 = sub_10008ADC0;
      v22 = &unk_100281A18;
      v23 = v35;
      v24 = location[0];
      v25 = v33;
      -[BYSoftwareUpdateCache scanUsingCache:withCompletion:](v12, "scanUsingCache:withCompletion:", 1, &v18);

      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v24, 0);
      objc_storeStrong((id *)&v23, 0);
    }
    else if (v33)
    {
      v17 = (os_log_t)(id)_BYLoggingFacility(v9);
      v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v17;
        v14 = v16;
        sub_100038C3C(v15);
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "All snapshots are compatible for restore", (uint8_t *)v15, 2u);
      }
      objc_storeStrong((id *)&v17, 0);
      (*((void (**)(id, _QWORD))v33 + 2))(v33, 0);
    }
    v32 = 0;
  }
  else
  {
    if (v33)
      (*((void (**)(id, _QWORD))v33 + 2))(v33, 0);
    v32 = 1;
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
}

- (void)setRefreshTimerToDuration:(double)a3
{
  id v3;
  RestoreFromBackupController *v4;
  NSTimer *v5;
  NSTimer *refreshTimer;

  v3 = -[RestoreFromBackupController navigationController](self, "navigationController");
  v4 = (RestoreFromBackupController *)objc_msgSend(v3, "topViewController");

  if (v4 == self)
  {
    -[NSTimer invalidate](self->_refreshTimer, "invalidate");
    v5 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "refreshBackupListFromTimer:", 0, 0, a3);
    refreshTimer = self->_refreshTimer;
    self->_refreshTimer = v5;

  }
}

- (void)viewDidLoad
{
  RestoreFromBackupController *v2;
  UITableView *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  NSArray *v8;
  objc_super v9;
  SEL v10;
  RestoreFromBackupController *v11;
  _QWORD v12[2];

  v11 = self;
  v10 = a2;
  v9.receiver = self;
  v9.super_class = (Class)RestoreFromBackupController;
  -[RestoreFromBackupController viewDidLoad](&v9, "viewDidLoad");
  v2 = v11;
  v3 = -[RestoreFromBackupController backupsTableView](v11, "backupsTableView");
  -[RestoreFromBackupController setTableView:](v2, "setTableView:", v3);

  v4 = -[RestoreFromBackupController tableView](v11, "tableView");
  objc_msgSend(v4, "setSeparatorStyle:", 1);

  v5 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:transitionDuration:transitionSpeed:", CFSTR("Start"), 0.01, 1.0);
  v12[0] = v5;
  v6 = objc_msgSend(objc_alloc((Class)OBAnimationState), "initWithStateName:darkStateName:transitionDuration:transitionSpeed:", CFSTR("Light"), CFSTR("Dark"), 1.0, 1.0);
  v12[1] = v6;
  v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2);

  v7 = -[RestoreFromBackupController buddy_animationController:animatedStates:startAtFirstState:](v11, "buddy_animationController:animatedStates:startAtFirstState:", CFSTR("iCloudBackup"), v8, 1);
  -[RestoreFromBackupController setAnimationController:](v11, "setAnimationController:", v7);

  objc_storeStrong((id *)&v8, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  OBAnimationController *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;
  BFFFlowItemDelegate *v10;
  objc_super v11;
  char *i;
  char v13;
  id location;
  id v15;
  char v16;
  BOOL v17;
  SEL v18;
  RestoreFromBackupController *v19;

  v19 = self;
  v18 = a2;
  v17 = a3;
  v3 = -[RestoreFromBackupController animationController](self, "animationController");
  -[OBAnimationController startAnimation](v3, "startAnimation");

  if (!v19->_refreshTimer)
    -[RestoreFromBackupController setRefreshTimerToDuration:](v19, "setRefreshTimerToDuration:", 20.0);
  v16 = -[RestoreFromBackupController isMovingToParentViewController](v19, "isMovingToParentViewController") & 1;
  if (v16 || !v19->_backupList)
  {
    -[RestoreFromBackupController updateBackupListCompletion:](v19, "updateBackupListCompletion:", 0);
    if ((v16 & 1) != 0)
    {
      -[RestoreFromBackupController updateListStateWithReload:](v19, "updateListStateWithReload:", 0);
      v4 = -[RestoreFromBackupController navigationController](v19, "navigationController");
      v5 = objc_msgSend(v4, "viewControllers");
      v15 = objc_msgSend(v5, "mutableCopy");

      location = objc_opt_new(NSMutableArray);
      v13 = 0;
      for (i = (char *)objc_msgSend(v15, "count") - 2; ((unint64_t)i & 0x8000000000000000) == 0; --i)
      {
        v6 = objc_msgSend(v15, "objectAtIndexedSubscript:", i);
        v7 = objc_opt_class(BuddyAppleIDSignInController);
        isKindOfClass = objc_opt_isKindOfClass(v6, v7);

        if ((isKindOfClass & 1) != 0)
        {
          v13 = 1;
          break;
        }
        v9 = objc_msgSend(v15, "objectAtIndexedSubscript:", i);
        objc_msgSend(location, "addObject:", v9);

      }
      if ((v13 & 1) != 0)
      {
        v10 = -[RestoreFromBackupController delegate](v19, "delegate");
        -[BFFFlowItemDelegate removeViewControllersOnNextPush:](v10, "removeViewControllersOnNextPush:", location);

      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v15, 0);
    }
  }
  v11.receiver = v19;
  v11.super_class = (Class)RestoreFromBackupController;
  -[RestoreFromBackupController viewDidAppear:](&v11, "viewDidAppear:", v17);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  BOOL v5;
  SEL v6;
  RestoreFromBackupController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4 = 0;
  v4 = self->_refreshTimer != 0;
  -[NSTimer invalidate](self->_refreshTimer, "invalidate");
  objc_storeStrong((id *)&v7->_refreshTimer, 0);
  if (v4
    && (-[RestoreFromBackupController isMovingFromParentViewController](v7, "isMovingFromParentViewController") & 1) != 0)
  {
    -[RestoreFromBackupController cancelRestoreAndRemovePrimaryAppleAccount](v7, "cancelRestoreAndRemovePrimaryAppleAccount");
  }
  v3.receiver = v7;
  v3.super_class = (Class)RestoreFromBackupController;
  -[RestoreFromBackupController viewDidDisappear:](&v3, "viewDidDisappear:", v5);
}

- (void)setupWithAlternateChoice:(id)a3
{
  uint64_t v3;
  BuddyEnrollmentCoordinator *v4;
  id v5;
  BuddyPendingRestoreState *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char *v12;
  BFFFlowItemDelegate *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19[3];
  id v20;
  unint64_t v21;
  os_log_type_t v22;
  os_log_t oslog;
  id location[2];
  RestoreFromBackupController *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  uint8_t buf[24];

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog = (os_log_t)(id)_BYLoggingFacility(v3);
  v22 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100038C28((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, v22, "Running iCloud Restore escape hatch: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4 = -[RestoreFromBackupController enrollmentCoordinator](v25, "enrollmentCoordinator");
  v5 = -[BuddyEnrollmentCoordinator mdmEnrollmentChannel](v4, "mdmEnrollmentChannel");

  if (v5 != (id)2)
    -[RestoreFromBackupController cancelRestoreAndRemovePrimaryAppleAccount](v25, "cancelRestoreAndRemovePrimaryAppleAccount");
  v6 = -[RestoreFromBackupController pendingRestoreState](v25, "pendingRestoreState");
  -[BuddyPendingRestoreState clearBackupItem](v6, "clearBackupItem");

  v7 = -[RestoreFromBackupController navigationController](v25, "navigationController");
  v8 = objc_msgSend(v7, "viewControllers");
  v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", &stru_100281A58);

  v21 = (unint64_t)v9;
  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = -[RestoreFromBackupController navigationController](v25, "navigationController");
    v11 = objc_msgSend(v10, "viewControllers");
    v12 = (char *)objc_msgSend(v11, "count");
    v27 = (char *)(v21 + 1);
    v26 = &v12[~v21];
    v28 = (char *)(v21 + 1);
    v29 = v26;
    v19[2] = v26;
    v19[1] = (id)(v21 + 1);
    v20 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v21 + 1, v26);

    v13 = -[RestoreFromBackupController delegate](v25, "delegate");
    v14 = -[RestoreFromBackupController navigationController](v25, "navigationController");
    v15 = objc_msgSend(v14, "viewControllers");
    v16 = objc_msgSend(v15, "objectsAtIndexes:", v20);
    -[BFFFlowItemDelegate removeViewControllersOnNextPush:](v13, "removeViewControllersOnNextPush:", v16);

    v17 = -[RestoreFromBackupController navigationController](v25, "navigationController");
    v18 = objc_msgSend(v17, "viewControllers");
    v19[0] = objc_msgSend(v18, "objectAtIndexedSubscript:", v21);

    objc_msgSend(v19[0], "selectChoiceForIdentifier:", location[0]);
    objc_storeStrong(v19, 0);
    objc_storeStrong(&v20, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)showRestoreWarningsIfNeededForRestorable:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  unsigned __int8 v7;
  NSBundle *v8;
  NSString *v9;
  NSBundle *v10;
  id v11;
  NSString *v12;
  UIAlertController *v13;
  id v14;
  id v15;
  NSBundle *v16;
  NSString *v17;
  UIAlertAction *v18;
  id v19;
  NSBundle *v20;
  NSString *v21;
  UIAlertAction *v22;
  NSBundle *v23;
  NSString *v24;
  NSString *v25;
  NSBundle *v26;
  NSString *v27;
  NSString *v28;
  UIAlertController *v29;
  id v30;
  id v31;
  NSBundle *v32;
  NSString *v33;
  UIAlertAction *v34;
  id v35;
  NSBundle *v36;
  NSString *v37;
  UIAlertAction *v38;
  id v39;
  id v40;
  void **v41;
  int v42;
  int v43;
  void (*v44)(_QWORD *, void *);
  void *v45;
  id v46;
  void **v47;
  int v48;
  int v49;
  void (*v50)(_QWORD *, void *);
  void *v51;
  id v52;
  id v53;
  void **v54;
  int v55;
  int v56;
  void (*v57)(_QWORD *, void *);
  void *v58;
  id v59;
  void **v60;
  int v61;
  int v62;
  void (*v63)(_QWORD *, void *);
  void *v64;
  id v65;
  id v66;
  char v67;
  char v68;
  id v69;
  void **v70;
  int v71;
  int v72;
  uint64_t (*v73)(uint64_t);
  void *v74;
  id v75;
  id v76;
  id v77;
  id location[2];
  RestoreFromBackupController *v79;
  id v80;

  v79 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v77 = 0;
  objc_storeStrong(&v77, a4);
  v70 = _NSConcreteStackBlock;
  v71 = -1073741824;
  v72 = 0;
  v73 = sub_10008C3C8;
  v74 = &unk_100281A80;
  v75 = v77;
  v76 = objc_retainBlock(&v70);
  v5 = objc_msgSend(location[0], "backup");
  v69 = objc_msgSend(v5, "deviceClass");

  v68 = objc_msgSend(v69, "isEqualToString:", CFSTR("iPad")) & 1;
  v80 = (id)MGCopyAnswer(CFSTR("DeviceClass"), 0);
  v6 = v80;
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("iPad"));

  v67 = v7 & 1;
  v66 = 0;
  if ((v68 & 1) == 0 || (v67 & 1) != 0)
  {
    if ((v68 & 1) == 0 && (v67 & 1) != 0)
    {
      v53 = objc_msgSend(v69, "uppercaseString");
      v23 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v24 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("CROSS_DEVICE_CLASS_TO_IPAD_RESTORE_%@"), v53);
      v25 = -[NSBundle localizedStringForKey:value:table:](v23, "localizedStringForKey:value:table:", v24, &stru_100284738, CFSTR("RestoreFromBackup"));
      v26 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v27 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("CROSS_DEVICE_CLASS_TO_IPAD_RESTORE_WARNING_%@"), v53);
      v28 = -[NSBundle localizedStringForKey:value:table:](v26, "localizedStringForKey:value:table:", v27, &stru_100284738, CFSTR("RestoreFromBackup"));
      v29 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v25, v28, 1);
      v30 = v66;
      v66 = v29;

      v31 = v66;
      v32 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v33 = -[NSBundle localizedStringForKey:value:table:](v32, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100284738, CFSTR("RestoreFromBackup"));
      v47 = _NSConcreteStackBlock;
      v48 = -1073741824;
      v49 = 0;
      v50 = sub_10008C4B4;
      v51 = &unk_100281AA8;
      v52 = v76;
      v34 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v33, 1, &v47);
      objc_msgSend(v31, "addAction:", v34);

      v35 = v66;
      v36 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v37 = -[NSBundle localizedStringForKey:value:table:](v36, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100284738, CFSTR("RestoreFromBackup"));
      v41 = _NSConcreteStackBlock;
      v42 = -1073741824;
      v43 = 0;
      v44 = sub_10008C508;
      v45 = &unk_100281AA8;
      v46 = v76;
      v38 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v37, 0, &v41);
      objc_msgSend(v35, "addAction:", v38);

      objc_storeStrong(&v46, 0);
      objc_storeStrong(&v52, 0);
      objc_storeStrong(&v53, 0);
    }
  }
  else
  {
    v8 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v9 = -[NSBundle localizedStringForKey:value:table:](v8, "localizedStringForKey:value:table:", CFSTR("CROSS_DEVICE_CLASS_FROM_IPAD_RESTORE"), &stru_100284738, CFSTR("RestoreFromBackup"));
    v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v11 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("CROSS_DEVICE_CLASS_FROM_IPAD_RESTORE_WARNING"));
    v12 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", v11, &stru_100284738, CFSTR("RestoreFromBackup"));
    v13 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, v12, 1);
    v14 = v66;
    v66 = v13;

    v15 = v66;
    v16 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v17 = -[NSBundle localizedStringForKey:value:table:](v16, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_100284738, CFSTR("RestoreFromBackup"));
    v60 = _NSConcreteStackBlock;
    v61 = -1073741824;
    v62 = 0;
    v63 = sub_10008C408;
    v64 = &unk_100281AA8;
    v65 = v76;
    v18 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, 1, &v60);
    objc_msgSend(v15, "addAction:", v18);

    v19 = v66;
    v20 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v21 = -[NSBundle localizedStringForKey:value:table:](v20, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_100284738, CFSTR("RestoreFromBackup"));
    v54 = _NSConcreteStackBlock;
    v55 = -1073741824;
    v56 = 0;
    v57 = sub_10008C45C;
    v58 = &unk_100281AA8;
    v59 = v76;
    v22 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v21, 0, &v54);
    objc_msgSend(v19, "addAction:", v22);

    objc_storeStrong(&v59, 0);
    objc_storeStrong(&v65, 0);
  }
  if (v66)
  {
    v39 = -[RestoreFromBackupController navigationController](v79, "navigationController");
    v40 = objc_msgSend(v39, "topViewController");
    objc_msgSend(v40, "presentViewController:animated:completion:", v66, 1, 0);

  }
  else
  {
    (*((void (**)(id, uint64_t))v76 + 2))(v76, 1);
  }
  objc_storeStrong(&v66, 0);
  objc_storeStrong(&v69, 0);
  objc_storeStrong(&v76, 0);
  objc_storeStrong(&v75, 0);
  objc_storeStrong(&v77, 0);
  objc_storeStrong(location, 0);
}

- (void)_presentNetworkWarningForRestorable:(id)a3 completion:(id)a4
{
  BuddyNetworkProvider *v5;
  id v6;
  id v7;
  void **v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  int v14;
  id v15;
  id v16;
  id location[2];
  RestoreFromBackupController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v5 = -[RestoreFromBackupController networkProvider](v18, "networkProvider");
  v6 = objc_msgSend(location[0], "snapshot");
  v15 = +[BuddyRestoreNetworkAlertController alertControllerForNetworkConnectionWithProvider:estimatedRestoreSize:](BuddyRestoreNetworkAlertController, "alertControllerForNetworkConnectionWithProvider:estimatedRestoreSize:", v5, objc_msgSend(v6, "estimatedRestoreSize"));

  if (v15)
  {
    v8 = _NSConcreteStackBlock;
    v9 = -1073741824;
    v10 = 0;
    v11 = sub_10008C70C;
    v12 = &unk_100280780;
    v13 = v16;
    objc_msgSend(v15, "setRestoreOverCellular:", &v8);
    v7 = -[RestoreFromBackupController showModalWiFiSettingsBlock](v18, "showModalWiFiSettingsBlock");
    objc_msgSend(v15, "setPresentWiFiSettings:", v7);

    -[RestoreFromBackupController presentViewController:animated:completion:](v18, "presentViewController:animated:completion:", v15, 1, 0);
    objc_storeStrong(&v13, 0);
    v14 = 0;
  }
  else
  {
    (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
    v14 = 1;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)controllerNeedsToRun
{
  BuddyPendingRestoreState *v2;
  RestorableBackupItem *v3;
  BOOL v4;

  v2 = -[RestoreFromBackupController pendingRestoreState](self, "pendingRestoreState", a2, self);
  v3 = -[BuddyPendingRestoreState backupItem](v2, "backupItem");
  v4 = v3 == 0;

  return v4;
}

- (id)restorableItemAtIndexPath:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id location[2];
  RestoreFromBackupController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = objc_msgSend(location[0], "row");
  v7 = 0;
  if (-[NSMutableArray count](v10->_visibleSimilarRestorables, "count"))
  {
    v3 = -[NSMutableArray objectAtIndexedSubscript:](v10->_visibleSimilarRestorables, "objectAtIndexedSubscript:", v8);
    v4 = v7;
    v7 = v3;

  }
  v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[2];
  RestoreFromBackupController *v5;
  int64_t v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v5->_listState == -1)
  {
    v6 = -[RestoreFromBackupController _backupListErrorSectionCount](v5, "_backupListErrorSectionCount");
  }
  else if (v5->_listState == 1)
  {
    v6 = -[RestoreFromBackupController _noBackupsFoundSectionCount](v5, "_noBackupsFoundSectionCount");
  }
  else
  {
    v6 = 1;
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id location[2];
  RestoreFromBackupController *v7;
  int64_t v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v7->_listState == 1 || v7->_listState == -1)
  {
    v8 = a4 != 0;
  }
  else if (v7->_listState == 3 || v7->_listState == 2)
  {
    v8 = (int64_t)-[NSMutableArray count](v7->_visibleSimilarRestorables, "count");
  }
  else
  {
    v8 = 1;
  }
  objc_storeStrong(location, 0);
  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  NSBundle *v5;
  NSBundle *v6;
  id location[2];
  RestoreFromBackupController *v9;
  NSString *v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v9->_listState != -1 || a4)
  {
    if (v9->_listState != 1 || a4)
    {
      v10 = 0;
    }
    else
    {
      v6 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v10 = -[NSBundle localizedStringForKey:value:table:](v6, "localizedStringForKey:value:table:", CFSTR("NO_BACKUPS_AVAILABLE"), &stru_100284738, CFSTR("RestoreFromBackup"));

    }
  }
  else
  {
    v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v10 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("CANNOT_LOAD_BACKUPS"), &stru_100284738, CFSTR("RestoreFromBackup"));

  }
  objc_storeStrong(location, 0);
  return v10;
}

- (int64_t)tableView:(id)a3 titleAlignmentForFooterInSection:(int64_t)a4
{
  id location[2];
  RestoreFromBackupController *v7;
  int64_t v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((v7->_listState == -1 || v7->_listState == 1) && !a4)
    v8 = 1;
  else
    v8 = 4;
  objc_storeStrong(location, 0);
  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  BuddyTableSectionHeaderView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIFontDescriptor *v10;
  UIFontDescriptor *v11;
  UIFont *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v19;
  id v20;
  double v21;
  int64_t v22;
  id location[2];
  RestoreFromBackupController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  v21 = 0.0;
  if (a4 > 0)
    v21 = 26.0;
  v5 = [BuddyTableSectionHeaderView alloc];
  sub_10008CF4C();
  v20 = -[BuddyTableSectionHeaderView initWithPadding:](v5, "initWithPadding:", v6, v7, v8, v9);
  v19 = 4;
  if (!v22 && (v24->_listState == 1 || v24->_listState == -1))
    v19 = 1;
  v10 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleTitle2);
  v11 = -[UIFontDescriptor fontDescriptorWithSymbolicTraits:](v10, "fontDescriptorWithSymbolicTraits:", 2);
  v12 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v11, 0.0);
  v13 = objc_msgSend(v20, "sectionLabel");
  objc_msgSend(v13, "setFont:", v12);

  v14 = -[RestoreFromBackupController tableView:titleForHeaderInSection:](v24, "tableView:titleForHeaderInSection:", location[0], v22);
  v15 = objc_msgSend(v20, "sectionLabel");
  objc_msgSend(v15, "setText:", v14);

  v16 = objc_msgSend(v20, "sectionLabel");
  objc_msgSend(v16, "setTextAlignment:", v19);

  v17 = v20;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v17;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  NSBundle *v5;
  id v6;
  NSBundle *v7;
  id v8;
  int compatibleRestoresState;
  NSBundle *v10;
  id v11;
  NSString *v12;
  id v13;
  NSBundle *v14;
  id v15;
  NSString *v16;
  id v17;
  UIDevice *v18;
  NSString *v19;
  NSString *v20;
  uint64_t v21;
  NSString *v22;
  char v24;
  NSString *v25;
  char v26;
  id v27;
  os_log_t oslog;
  id obj;
  id v30;
  id v31;
  id v32;
  int v33;
  _BYTE *v34;
  id location[2];
  RestoreFromBackupController *v36;
  NSString *v37;
  uint8_t buf[24];

  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v34 = (_BYTE *)a4;
  if (v36->_listState != -1 || v34)
  {
    if (v36->_listState != 1 || v34)
    {
      if (v36->_listState != 2 && v36->_listState != 3
        || v34 != (char *)objc_msgSend(location[0], "numberOfSections") - 1)
      {
        goto LABEL_34;
      }
      v32 = 0;
      compatibleRestoresState = v36->_compatibleRestoresState;
      if (compatibleRestoresState)
      {
        if (compatibleRestoresState == 1)
        {
          v10 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v11 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("SOME_INCOMPATIBLE_SNAPSHOTS"));
          v12 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", v11, &stru_100284738, CFSTR("RestoreFromBackup"));
          v13 = v32;
          v32 = v12;

        }
        else if (compatibleRestoresState == 2)
        {
          v14 = +[NSBundle mainBundle](NSBundle, "mainBundle");
          v15 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("ALL_INCOMPATIBLE_SNAPSHOTS"));
          v16 = -[NSBundle localizedStringForKey:value:table:](v14, "localizedStringForKey:value:table:", v15, &stru_100284738, CFSTR("RestoreFromBackup"));
          v17 = v32;
          v32 = v16;

        }
      }
      if (v32)
      {
        v31 = 0;
        obj = 0;
        v18 = +[UIDevice currentDevice](UIDevice, "currentDevice");
        v19 = -[UIDevice systemVersion](v18, "systemVersion");
        v20 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", v32, CFSTR("%@"), &obj, v19);
        objc_storeStrong(&v31, obj);
        v30 = v20;

        if (v30)
        {
          v37 = (NSString *)v30;
          v33 = 1;
        }
        else
        {
          oslog = (os_log_t)(id)_BYLoggingFacility(v21);
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            v26 = 0;
            v24 = 0;
            if ((_BYIsInternalInstall() & 1) != 0)
            {
              v22 = (NSString *)v31;
            }
            else if (v31)
            {
              v27 = objc_msgSend(v31, "domain");
              v26 = 1;
              v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v27, objc_msgSend(v31, "code"));
              v25 = v22;
              v24 = 1;
            }
            else
            {
              v22 = 0;
            }
            sub_100039500((uint64_t)buf, (uint64_t)v22);
            _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Failed to format compatibility title: %{public}@", buf, 0xCu);
            if ((v24 & 1) != 0)

            if ((v26 & 1) != 0)
          }
          objc_storeStrong((id *)&oslog, 0);
          v37 = 0;
          v33 = 1;
        }
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v31, 0);
      }
      else
      {
        v33 = 0;
      }
      objc_storeStrong(&v32, 0);
      if (!v33)
      {
LABEL_34:
        v37 = 0;
        v33 = 1;
      }
    }
    else
    {
      v7 = +[NSBundle mainBundle](NSBundle, "mainBundle");
      v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("RESTORE_ALTERNATIVE_DETAILS"));
      v37 = -[NSBundle localizedStringForKey:value:table:](v7, "localizedStringForKey:value:table:", v8, &stru_100284738, CFSTR("RestoreFromBackup"));

      v33 = 1;
    }
  }
  else
  {
    v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("PROBLEM_LOADING_BACKUPS_DETAILS"));
    v37 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", v6, &stru_100284738, CFSTR("RestoreFromBackup"));

    v33 = 1;
  }
  objc_storeStrong(location, 0);
  return v37;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  NSBundle *v5;
  NSString *v6;
  UIColor *v7;
  id v8;
  UIFont *v9;
  id v11;
  _BYTE *v12;
  id location[2];
  RestoreFromBackupController *v14;
  id v15;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = (_BYTE *)a4;
  if (-[RestoreFromBackupController _showAllFooterPresent](v14, "_showAllFooterPresent")
    && v12 == (char *)objc_msgSend(location[0], "numberOfSections") - 1)
  {
    v11 = +[UIButton buttonWithType:](UIButton, "buttonWithType:", 1);
    v5 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v6 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", CFSTR("SHOW_ALL_BACKUPS"), &stru_100284738, CFSTR("RestoreFromBackup"));
    objc_msgSend(v11, "setTitle:forState:", v6, 0);

    v7 = +[UIColor linkColor](UIColor, "linkColor");
    objc_msgSend(v11, "setTitleColor:forState:", v7, 0);

    v8 = objc_msgSend(v11, "titleLabel");
    v9 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
    objc_msgSend(v8, "setFont:", v9);

    objc_msgSend(v11, "addTarget:action:forControlEvents:", v14, "showAllBackups", 64);
    v15 = v11;
    objc_storeStrong(&v11, 0);
  }
  else
  {
    v15 = 0;
  }
  objc_storeStrong(location, 0);
  return v15;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  id v15[2];
  id location[2];
  RestoreFromBackupController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15[1] = (id)a4;
  v15[0] = -[RestoreFromBackupController tableView:viewForHeaderInSection:](v17, "tableView:viewForHeaderInSection:", location[0], a4);
  objc_msgSend(location[0], "bounds");
  v6 = v5;
  objc_msgSend(location[0], "layoutMargins");
  v8 = v6 - v7;
  objc_msgSend(location[0], "layoutMargins");
  v10 = v8 - v9;
  v11 = objc_msgSend(v15[0], "sectionLabel");
  objc_msgSend(v11, "setPreferredMaxLayoutWidth:", v10);

  objc_msgSend(v15[0], "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v13 = v12;
  objc_storeStrong(v15, 0);
  objc_storeStrong(location, 0);
  return v13;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v5;
  BOOL v6;
  id v7;
  BOOL v8;
  id v9;
  BOOL v10;
  BOOL v12;
  int64_t v13;
  id location[2];
  RestoreFromBackupController *v15;
  double v16;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = a4;
  if (!-[RestoreFromBackupController _largerThanStandardAX](v15, "_largerThanStandardAX")
    && (v15->_listState == 2 || v15->_listState == 3)
    && -[RestoreFromBackupController _showAllFooterPresent](v15, "_showAllFooterPresent")
    && (_BYTE *)a4 == (char *)objc_msgSend(location[0], "numberOfSections") - 1)
  {
    v16 = 62.0;
  }
  else
  {
    v5 = -[RestoreFromBackupController tableView:viewForFooterInSection:](v15, "tableView:viewForFooterInSection:", location[0], a4);
    v6 = v5 != 0;

    v12 = v6;
    v7 = -[RestoreFromBackupController tableView](v15, "tableView");
    v8 = (uint64_t)objc_msgSend(v7, "numberOfSections") > v13 + 1;

    v9 = -[RestoreFromBackupController tableView:titleForHeaderInSection:](v15, "tableView:titleForHeaderInSection:", location[0], v13 + 1);
    v10 = v9 != 0;

    if (!v12 && v8 && v10)
      v16 = 0.0;
    else
      v16 = UITableViewAutomaticDimension;
  }
  objc_storeStrong(location, 0);
  return v16;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  objc_storeStrong(&v6, a4);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return UITableViewAutomaticDimension;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  SpinnerTableCell *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSBundle *v11;
  NSString *v12;
  id v13;
  NSBundle *v14;
  NSString *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSBundle *v20;
  id v21;
  NSString *v22;
  id v23;
  NSBundle *v24;
  NSString *v25;
  id v26;
  unsigned __int8 v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  UIFont *v40;
  id v41;
  id v42;
  NSBundle *v43;
  NSString *v44;
  id v45;
  id v46;
  NSString *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  UIFont *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  id v61;
  id v62;
  UIColor *v63;
  id v64;
  id v66;
  _BOOL8 v67;
  char v68;
  id v69;
  char v70;
  id v71;
  char v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id location[2];
  RestoreFromBackupController *v79;

  v79 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v77 = 0;
  objc_storeStrong(&v77, a4);
  v76 = 0;
  switch(v79->_listState)
  {
    case 0xFFFFFFFF:
      v75 = objc_msgSend(v77, "section");
      v7 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
      v8 = v76;
      v76 = v7;

      v9 = objc_msgSend(v76, "textLabel");
      objc_msgSend(v9, "setTextAlignment:", 1);

      if (v75 == (id)1)
      {
        v10 = objc_msgSend(v76, "textLabel");
        v11 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v12 = -[NSBundle localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", CFSTR("TRY_AGAIN_CELL"), &stru_100284738, CFSTR("RestoreFromBackup"));
        objc_msgSend(v10, "setText:", v12);

        goto LABEL_13;
      }
      if (v75 == (id)2)
        goto LABEL_10;
      if (v75 == (id)3)
      {
        v13 = objc_msgSend(v76, "textLabel");
        v14 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v15 = -[NSBundle localizedStringForKey:value:table:](v14, "localizedStringForKey:value:table:", CFSTR("RESTORE_ALTERNATIVE_FROM_MAC_OR_PC"), &stru_100284738, CFSTR("RestoreFromBackup"));
        objc_msgSend(v13, "setText:", v15);

      }
      goto LABEL_13;
    case 0:
      v5 = -[SpinnerTableCell initWithStyle:reuseIdentifier:]([SpinnerTableCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
      v6 = v76;
      v76 = v5;

      objc_msgSend(v76, "setSelectionStyle:", 0);
      break;
    case 1:
      v74 = objc_msgSend(v77, "section");
      v16 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
      v17 = v76;
      v76 = v16;

      v18 = objc_msgSend(v76, "textLabel");
      objc_msgSend(v18, "setTextAlignment:", 1);

      if (v74 == (id)1)
      {
LABEL_10:
        v19 = objc_msgSend(v76, "textLabel");
        v20 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v21 = +[UIDevice modelSpecificLocalizedStringKeyForKey:](UIDevice, "modelSpecificLocalizedStringKeyForKey:", CFSTR("RESTORE_ALTERNATIVE_NEW"));
        v22 = -[NSBundle localizedStringForKey:value:table:](v20, "localizedStringForKey:value:table:", v21, &stru_100284738, CFSTR("RestoreFromBackup"));
        objc_msgSend(v19, "setText:", v22);

      }
      else if (v74 == (id)2)
      {
        v23 = objc_msgSend(v76, "textLabel");
        v24 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v25 = -[NSBundle localizedStringForKey:value:table:](v24, "localizedStringForKey:value:table:", CFSTR("RESTORE_ALTERNATIVE_FROM_MAC_OR_PC"), &stru_100284738, CFSTR("RestoreFromBackup"));
        objc_msgSend(v23, "setText:", v25);

      }
LABEL_13:
      v26 = objc_msgSend(v76, "textLabel");
      objc_msgSend(v26, "setNumberOfLines:", 0);

      break;
    case 2:
    case 3:
      v73 = -[RestoreFromBackupController restorableItemAtIndexPath:](v79, "restorableItemAtIndexPath:", v77);
      v72 = 0;
      v70 = 0;
      v68 = 0;
      v27 = 1;
      if ((objc_msgSend(v73, "isCompatible") & 1) == 0)
      {
        v71 = -[RestoreFromBackupController availableUpdateVersion](v79, "availableUpdateVersion");
        v70 = 1;
        v27 = 1;
        if ((objc_msgSend(v73, "isCompatibleWithUpdateToSystemVersion:") & 1) == 0)
        {
          v69 = -[RestoreFromBackupController betaEnrollmentStateManager](v79, "betaEnrollmentStateManager");
          v68 = 1;
          v27 = objc_msgSend(v69, "isRestorableSeedEnrolled:", v73);
        }
      }
      if ((v68 & 1) != 0)

      if ((v70 & 1) != 0)
      v72 = v27 & 1;
      v28 = objc_msgSend(location[0], "dequeueReusableCellWithIdentifier:", CFSTR("PBSnapshotCell"));
      v29 = v76;
      v76 = v28;

      if (!v76)
      {
        v76 = -[DeviceRestoreBackupCell initWithStyle:reuseIdentifier:]([DeviceRestoreBackupCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("PBSnapshotCell"));

      }
      v30 = objc_msgSend(v76, "textLabel");
      if ((v72 & 1) != 0)
      {
        v34 = +[UIColor _labelColor](UIColor, "_labelColor");
        objc_msgSend(v30, "setTextColor:", v34);

        v35 = objc_msgSend(v76, "detailTextLabel");
        v36 = +[UIColor _labelColor](UIColor, "_labelColor");
        objc_msgSend(v35, "setTextColor:", v36);

        objc_msgSend(v76, "setSelectionStyle:", 3);
      }
      else
      {
        v31 = +[UIColor _secondaryLabelColor](UIColor, "_secondaryLabelColor");
        objc_msgSend(v30, "setTextColor:", v31);

        v32 = objc_msgSend(v76, "detailTextLabel");
        v33 = +[UIColor _secondaryLabelColor](UIColor, "_secondaryLabelColor");
        objc_msgSend(v32, "setTextColor:", v33);

        objc_msgSend(v76, "setSelectionStyle:", 0);
      }
      objc_msgSend(v76, "setAccessoryType:", 1);
      v67 = 0;
      v67 = v79->_listState == 3 || v79->_shouldForceShowTimeStampOnBackups;
      v37 = objc_msgSend(v76, "textLabel");
      v38 = objc_msgSend(v73, "dateStringWithStyle:", v67);
      objc_msgSend(v37, "setText:", v38);

      v39 = objc_msgSend(v76, "textLabel");
      v40 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline);
      objc_msgSend(v39, "setFont:", v40);

      v66 = 0;
      if ((v72 & 1) != 0)
      {
        v41 = objc_msgSend(v73, "deviceInfoString");
        v42 = v66;
        v66 = v41;

      }
      else
      {
        v43 = +[NSBundle mainBundle](NSBundle, "mainBundle");
        v44 = -[NSBundle localizedStringForKey:value:table:](v43, "localizedStringForKey:value:table:", CFSTR("REQUIRED_OS_VERSION_%@"), &stru_100284738, CFSTR("RestoreFromBackup"));
        v45 = objc_msgSend(v73, "snapshot");
        v46 = objc_msgSend(v45, "systemVersion");
        v47 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v44, v46);
        v48 = v66;
        v66 = v47;

      }
      v49 = objc_msgSend(v76, "imageView");
      v50 = objc_msgSend(v73, "backup");
      v51 = objc_msgSend(v50, "productType");
      v52 = -[RestoreFromBackupController traitCollection](v79, "traitCollection");
      v53 = +[BuddyDeviceImageUtilities imageForDeviceModelWithModel:traitCollection:](_TtC5Setup25BuddyDeviceImageUtilities, "imageForDeviceModelWithModel:traitCollection:", v51, v52);
      objc_msgSend(v49, "setImage:", v53);

      v54 = objc_msgSend(v76, "detailTextLabel");
      objc_msgSend(v54, "setText:", v66);

      v55 = objc_msgSend(v76, "detailTextLabel");
      v56 = +[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote);
      objc_msgSend(v55, "setFont:", v56);

      sub_10008CF4C();
      objc_msgSend(v76, "setSeparatorInset:", v57, v58, v59, v60);
      v61 = objc_msgSend(v73, "snapshot");
      v62 = objc_msgSend(v61, "commitID");
      objc_msgSend(v76, "setAccessibilityIdentifier:", v62);

      objc_storeStrong(&v66, 0);
      objc_storeStrong(&v73, 0);
      break;
    default:
      break;
  }
  v63 = +[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor");
  objc_msgSend(v76, "setBackgroundColor:", v63);

  v64 = v76;
  objc_storeStrong(&v76, 0);
  objc_storeStrong(&v77, 0);
  objc_storeStrong(location, 0);
  return v64;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  char isKindOfClass;
  char v8;
  char v10;
  BuddyBetaEnrollmentStateManager *v11;
  char v12;
  NSString *v13;
  id v14;
  int v15;
  id v16;
  id location[2];
  RestoreFromBackupController *v18;
  id v19;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v5 = objc_msgSend(location[0], "cellForRowAtIndexPath:", v16);
  v6 = objc_opt_class(SpinnerTableCell);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v19 = 0;
    v15 = 1;
  }
  else
  {
    v14 = -[RestoreFromBackupController restorableItemAtIndexPath:](v18, "restorableItemAtIndexPath:", v16);
    v12 = 0;
    v10 = 0;
    v8 = 0;
    if (v14)
    {
      v8 = 0;
      if ((objc_msgSend(v14, "isCompatible") & 1) == 0)
      {
        v13 = -[RestoreFromBackupController availableUpdateVersion](v18, "availableUpdateVersion");
        v12 = 1;
        v8 = 0;
        if ((objc_msgSend(v14, "isCompatibleWithUpdateToSystemVersion:") & 1) == 0)
        {
          v11 = -[RestoreFromBackupController betaEnrollmentStateManager](v18, "betaEnrollmentStateManager");
          v10 = 1;
          v8 = !-[BuddyBetaEnrollmentStateManager isRestorableSeedEnrolled:](v11, "isRestorableSeedEnrolled:", v14);
        }
      }
    }
    if ((v10 & 1) != 0)

    if ((v12 & 1) != 0)
    if ((v8 & 1) != 0)
      v19 = 0;
    else
      v19 = v16;
    v15 = 1;
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v19;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  RestoreFromBackupController *v5;
  void **v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, char);
  void *v10;
  RestoreFromBackupController *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id location[2];
  RestoreFromBackupController *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  if (v18->_listState == -1)
  {
    v15 = objc_msgSend(v16, "section");
    if (v15 == (id)1)
    {
      -[RestoreFromBackupController setListState:](v18, "setListState:", 0);
      -[RestoreFromBackupController updateBackupListCompletion:](v18, "updateBackupListCompletion:", 0);
      goto LABEL_15;
    }
    if (v15 == (id)2)
    {
LABEL_5:
      -[RestoreFromBackupController setupWithAlternateChoice:](v18, "setupWithAlternateChoice:", CFSTR("setUpAsNew"));
      goto LABEL_15;
    }
    if (v15 == (id)3)
      -[RestoreFromBackupController setupWithAlternateChoice:](v18, "setupWithAlternateChoice:", CFSTR("restoreFromiTunesBackup"));
  }
  else
  {
    if (v18->_listState != 1)
    {
      objc_msgSend(location[0], "deselectRowAtIndexPath:animated:", v16, 1);
      v13 = -[RestoreFromBackupController restorableItemAtIndexPath:](v18, "restorableItemAtIndexPath:", v16);
      v5 = v18;
      v6 = _NSConcreteStackBlock;
      v7 = -1073741824;
      v8 = 0;
      v9 = sub_10008EA64;
      v10 = &unk_100281AF8;
      v11 = v18;
      v12 = v13;
      -[RestoreFromBackupController showRestoreWarningsIfNeededForRestorable:completion:](v5, "showRestoreWarningsIfNeededForRestorable:completion:", v13, &v6);
      objc_storeStrong(&v12, 0);
      objc_storeStrong((id *)&v11, 0);
      objc_storeStrong(&v13, 0);
      goto LABEL_15;
    }
    v14 = objc_msgSend(v16, "section");
    if (v14 == (id)1)
      goto LABEL_5;
    if (v14 == (id)2)
      -[RestoreFromBackupController setupWithAlternateChoice:](v18, "setupWithAlternateChoice:", CFSTR("restoreFromiTunesBackup"));
  }
LABEL_15:
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)showAllBackups
{
  -[RestoreFromBackupController setListState:](self, "setListState:", 3, a2, self);
}

- (void)handleDebugGesture
{
  __CFString *v2;
  __CFString *v3;
  id v4;
  UIAlertAction *v5;
  id v6;
  UIAlertAction *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  BOOL v13;
  id location;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  id v19[2];
  RestoreFromBackupController *v20;

  v20 = self;
  v19[1] = (id)a2;
  v19[0] = objc_msgSend(objc_alloc((Class)sub_10008EF40()), "initWithName:", CFSTR("com.apple.mobilebackup"));
  v18 = objc_msgSend(v19[0], "enabledLevel") == (id)4;
  v17 = CFSTR("iCloud Restore Debug Logging");
  if (v18)
    v2 = CFSTR("Debug Logging is Enabled");
  else
    v2 = CFSTR("Debug Logging is Disabled");
  v16 = v2;
  if (v18)
    v3 = CFSTR("Disable Debug Logging");
  else
    v3 = CFSTR("Enable Debug Logging");
  v15 = v3;
  location = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v17, v16, 1);
  v4 = location;
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_10008F02C;
  v11 = &unk_100281B20;
  v13 = v18;
  v12 = v19[0];
  v5 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v15, 0, &v8);
  objc_msgSend(v4, "addAction:", v5, v8, v9, v10, v11);

  v6 = location;
  v7 = +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  objc_msgSend(v6, "addAction:", v7);

  -[RestoreFromBackupController presentViewController:animated:completion:](v20, "presentViewController:animated:completion:", location, 1, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v19, 0);
}

- (BOOL)_largerThanStandardAX
{
  UIApplication *v2;
  NSString *v3;
  BOOL v4;

  v2 = +[UIApplication sharedApplication](UIApplication, "sharedApplication", a2, self);
  v3 = -[UIApplication preferredContentSizeCategory](v2, "preferredContentSizeCategory");
  v4 = UIContentSizeCategoryCompareToCategory(UIContentSizeCategoryExtraLarge, v3) == NSOrderedAscending;

  return v4;
}

- (unint64_t)_backupListErrorSectionCount
{
  BuddyEnrollmentCoordinator *v2;
  BOOL v3;

  v2 = -[RestoreFromBackupController enrollmentCoordinator](self, "enrollmentCoordinator");
  v3 = (id)-[BuddyEnrollmentCoordinator mdmEnrollmentChannel](v2, "mdmEnrollmentChannel") == (id)2;

  if (v3)
    return 3;
  else
    return 4;
}

- (unint64_t)_noBackupsFoundSectionCount
{
  BuddyEnrollmentCoordinator *v2;
  BOOL v3;

  v2 = -[RestoreFromBackupController enrollmentCoordinator](self, "enrollmentCoordinator");
  v3 = (id)-[BuddyEnrollmentCoordinator mdmEnrollmentChannel](v2, "mdmEnrollmentChannel") == (id)2;

  if (v3)
    return 2;
  else
    return 3;
}

- (BOOL)_showAllFooterPresent
{
  BOOL v2;
  id v3;

  v2 = 0;
  if (self->_listState == 2)
  {
    v3 = -[NSMutableArray count](self->_visibleSimilarRestorables, "count", a2);
    return v3 < (id)-[NSArray count](self->_similarRestorables, "count");
  }
  return v2;
}

- (BFFFlowItemDelegate)delegate
{
  return (BFFFlowItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RestorableBackupItem)selectedRestorable
{
  return self->_selectedRestorable;
}

- (void)setSelectedRestorable:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRestorable, a3);
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRestoreState, a3);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySetupController, a3);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProvider, a3);
}

- (id)showModalWiFiSettingsBlock
{
  return self->_showModalWiFiSettingsBlock;
}

- (void)setShowModalWiFiSettingsBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BuddyBetaEnrollmentStateManager)betaEnrollmentStateManager
{
  return self->_betaEnrollmentStateManager;
}

- (void)setBetaEnrollmentStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_betaEnrollmentStateManager, a3);
}

- (BYSoftwareUpdateCache)softwareUpdateCache
{
  return self->_softwareUpdateCache;
}

- (void)setSoftwareUpdateCache:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateCache, a3);
}

- (BuddyEnrollmentCoordinator)enrollmentCoordinator
{
  return self->_enrollmentCoordinator;
}

- (void)setEnrollmentCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_enrollmentCoordinator, a3);
}

- (BOOL)scanningForUpdate
{
  return self->_scanningForUpdate;
}

- (void)setScanningForUpdate:(BOOL)a3
{
  self->_scanningForUpdate = a3;
}

- (NSString)availableUpdateVersion
{
  return self->_availableUpdateVersion;
}

- (void)setAvailableUpdateVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (UITableView)backupsTableView
{
  return self->_backupsTableView;
}

- (void)setBackupsTableView:(id)a3
{
  objc_storeStrong((id *)&self->_backupsTableView, a3);
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
  objc_storeStrong((id *)&self->_animationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_backupsTableView, 0);
  objc_storeStrong((id *)&self->_availableUpdateVersion, 0);
  objc_storeStrong((id *)&self->_enrollmentCoordinator, 0);
  objc_storeStrong((id *)&self->_softwareUpdateCache, 0);
  objc_storeStrong((id *)&self->_betaEnrollmentStateManager, 0);
  objc_storeStrong(&self->_showModalWiFiSettingsBlock, 0);
  objc_storeStrong((id *)&self->_networkProvider, 0);
  objc_storeStrong((id *)&self->_proximitySetupController, 0);
  objc_storeStrong((id *)&self->_pendingRestoreState, 0);
  objc_storeStrong((id *)&self->_selectedRestorable, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_update_backup_list_queue, 0);
  objc_storeStrong((id *)&self->_visibleSimilarRestorables, 0);
  objc_storeStrong((id *)&self->_similarRestorables, 0);
  objc_storeStrong((id *)&self->_backupList, 0);
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_backupManager, 0);
}

@end
