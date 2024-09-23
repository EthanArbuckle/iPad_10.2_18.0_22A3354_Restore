@implementation WHASetupRoomPickerViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupRoomPickerViewController viewWillAppear:]", 30, "RoomPicker ViewWillAppear\n");
  v5.receiver = self;
  v5.super_class = (Class)WHASetupRoomPickerViewController;
  -[SVSBaseViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  if (sub_1001174E0())
    objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "_setUsesDynamicRowHeight:", 1);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupRoomPickerViewController viewDidDisappear:]", 30, "RoomPicker ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)WHASetupRoomPickerViewController;
  -[WHASetupRoomPickerViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleChooseButton:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  dispatch_source_t v10;
  WHASetupRoomPickerViewController *v11;

  v4 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupRoomPickerViewController handleChooseButton:]", 30, "RoomPicker Choose button\n");
  if (!BYTE1(self->_chooseButton))
  {
    BYTE1(self->_chooseButton) = 1;
    objc_msgSend(*(id *)((char *)&self->_roomPickerView + 1), "setHidden:", 1);
    objc_msgSend(*(id *)(&self->_roomChosen + 1), "setHidden:", 0);
    objc_msgSend(*(id *)((char *)&self->_progressView + 1), "startAnimating");
    objc_msgSend(*(id *)((char *)&self->_progressSpinner + 1), "setHidden:", 0);
    if (objc_msgSend(self->super._mainController, "testMode"))
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1001213D4;
      v9[3] = &unk_10017E1A0;
      v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
      v11 = self;
      v5 = v10;
      dispatch_source_set_event_handler(v5, v9);
      SFDispatchTimerSet(v5, 1.0, -1.0, -4.0);
      dispatch_resume(v5);

    }
    else
    {
      v6 = (uint64_t)objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "selectedRowInComponent:", 0);
      if ((v6 & 0x8000000000000000) == 0)
      {
        v7 = v6;
        if (v6 <= (uint64_t)objc_msgSend(*(id *)((char *)&self->_firstSuggestedIndex + 1), "count"))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_firstSuggestedIndex + 1), "objectAtIndexedSubscript:", v7));
          objc_msgSend(self->super._mainController, "chooseRoom:", v8);

        }
      }
    }
  }

}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupRoomPickerViewController handleDismissButton:]", 30, "RoomPicker Dismiss button\n");
  objc_msgSend(self->super._mainController, "dismiss:", 5);

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->_firstSuggestedIndex + 1), "count", a3, a4);
}

- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSAttributedStringKey v14;
  void *v15;

  if (a4 < 0 || (uint64_t)objc_msgSend(*(id *)((char *)&self->_firstSuggestedIndex + 1), "count", a3) <= a4)
  {
    v12 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_firstSuggestedIndex + 1), "objectAtIndexedSubscript:", a4));
    if (*(uint64_t *)((char *)&self->_progressLabel + 1) <= a4)
      v8 = 0.2;
    else
      v8 = 0.0;
    v9 = objc_alloc((Class)NSAttributedString);
    v14 = NSObliquenessAttributeName;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
    v15 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v12 = objc_msgSend(v9, "initWithString:attributes:", v7, v11);

  }
  return v12;
}

- (int64_t)firstSuggestedIndex
{
  return *(int64_t *)((char *)&self->_progressLabel + 1);
}

- (void)setFirstSuggestedIndex:(int64_t)a3
{
  *(UILabel **)((char *)&self->_progressLabel + 1) = (UILabel *)a3;
}

- (NSArray)rooms
{
  return *(NSArray **)((char *)&self->_firstSuggestedIndex + 1);
}

- (void)setRooms:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_firstSuggestedIndex + 1), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_firstSuggestedIndex + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressSpinner + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)(&self->_roomChosen + 1), 0);
  objc_storeStrong((id *)((char *)&self->_roomPickerView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end
