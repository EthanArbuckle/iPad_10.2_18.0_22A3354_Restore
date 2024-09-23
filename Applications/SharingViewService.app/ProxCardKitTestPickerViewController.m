@implementation ProxCardKitTestPickerViewController

- (ProxCardKitTestPickerViewController)init
{
  id v3;
  ProxCardKitTestPickerViewController *v4;
  void *v5;
  uint64_t v6;
  PRXAction *nextAction;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  ProxCardKitTestPickerViewController *v12;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  v3 = objc_alloc_init((Class)PRXPickerContentView);
  v4 = -[ProxCardKitTestPickerViewController initWithContentView:](self, "initWithContentView:", v3);

  if (v4)
  {
    -[ProxCardKitTestPickerViewController setTitle:](v4, "setTitle:", CFSTR("ProxCardKit Test"));
    -[ProxCardKitTestPickerViewController setSubtitle:](v4, "setSubtitle:", CFSTR("Which One?"));
    -[ProxCardKitTestPickerViewController setDismissalType:](v4, "setDismissalType:", 3);
    -[ProxCardKitTestPickerViewController setData:](v4, "setData:", &off_1001837D8);
    location = 0;
    objc_initWeak(&location, v4);
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_100109F0C;
    v17 = &unk_10017E008;
    objc_copyWeak(&v18, &location);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", CFSTR("Next"), 0, &v14));
    v6 = objc_claimAutoreleasedReturnValue(-[ProxCardKitTestPickerViewController addAction:](v4, "addAction:", v5, v14, v15, v16, v17));
    nextAction = v4->_nextAction;
    v4->_nextAction = (PRXAction *)v6;

    -[PRXAction setEnabled:](v4->_nextAction, "setEnabled:", 0);
    v8 = objc_alloc_init((Class)PRXTextField);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ProxCardKitTestPickerViewController contentView](v4, "contentView"));
    objc_msgSend(v9, "setTextField:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ProxCardKitTestPickerViewController contentView](v4, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textField"));
    objc_msgSend(v11, "setPlaceholder:", CFSTR("Other"));

    v12 = v4;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v4;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ProxCardKitTestPickerViewController data](self, "data", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ProxCardKitTestPickerViewController data](self, "data", a3, a4, a5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", a4));

  return v7;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  -[PRXAction setEnabled:](self->_nextAction, "setEnabled:", a4 > 0);
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_nextAction, 0);
}

@end
