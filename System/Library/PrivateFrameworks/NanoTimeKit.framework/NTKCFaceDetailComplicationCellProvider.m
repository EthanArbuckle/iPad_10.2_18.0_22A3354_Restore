@implementation NTKCFaceDetailComplicationCellProvider

- (NTKCFaceDetailComplicationCellProvider)initWithTableView:(id)a3 listProvider:(id)a4
{
  id v7;
  id v8;
  NTKCFaceDetailComplicationCellProvider *v9;
  NTKCFaceDetailComplicationCellProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKCFaceDetailComplicationCellProvider;
  v9 = -[NTKCFaceDetailComplicationCellProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tableView, a3);
    objc_storeStrong((id *)&v10->_listProvider, a4);
  }

  return v10;
}

- (id)cellForItem:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[NTKCFaceDetailComplicationCellProvider tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "ntk_itemType");
  if (v7 > 6)
    v8 = 0;
  else
    v8 = off_1E6BD6CF0[v7];
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, v8);
  switch(objc_msgSend(v5, "ntk_itemType"))
  {
    case 0:
      objc_msgSend(v9, "textLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", &stru_1E6BDC918);
      goto LABEL_17;
    case 1:
    case 2:
      -[NTKCFaceDetailComplicationCellProvider listProvider](self, "listProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "ntk_localizedNameWithOptions:forRichComplicationSlot:", 1, objc_msgSend(v10, "pickerListProviderSlotIsRich"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", v11);

      goto LABEL_16;
    case 3:
      NTKCompanionClockFaceLocalizedString(CFSTR("EDIT_MODE_LABEL_COMPLICATIONS_COMPANION_MORE"), CFSTR("More…"));
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    case 4:
      objc_msgSend(v5, "ntk_contactIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKPeopleComplicationContactsCache sharedCache](NTKPeopleComplicationContactsCache, "sharedCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "contactForId:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "textLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "font");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[NTKPeopleDetailComplicationPickerDataSource sharedFormatter](NTKPeopleDetailComplicationPickerDataSource, "sharedFormatter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = *MEMORY[0x1E0DC1138];
      v36[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "attributedStringFromContact:defaultAttributes:", v16, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v21, "length"))
      {
        NTKClockFaceLocalizedString(CFSTR("COMPLICATION_PICKER_PEOPLE_NO_NAME"), CFSTR("No Name"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v22);

        v21 = (void *)v23;
      }
      objc_msgSend(v9, "textLabel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setAttributedText:", v21);

      objc_msgSend(v9, "setAccessoryType:", 0);
      break;
    case 5:
      objc_msgSend(v5, "homeLocalizedName");
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v25 = (void *)v13;
      objc_msgSend(v9, "textLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", v25);

      v27 = v9;
      v28 = 1;
      goto LABEL_18;
    case 6:
      objc_msgSend(v5, "localizedName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v10);
LABEL_16:

LABEL_17:
      v27 = v9;
      v28 = 0;
LABEL_18:
      objc_msgSend(v27, "setAccessoryType:", v28);
      break;
    default:
      break;
  }
  objc_msgSend(v5, "ntk_identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailComplicationCellProvider listProvider](self, "listProvider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "pickerSelectedItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "ntk_identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v29, "isEqualToString:", v32);

  objc_msgSend(v9, "ntk_setPickerSelected:", v33);
  return v9;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NTKComplicationPickerListProvider)listProvider
{
  return self->_listProvider;
}

- (void)setListProvider:(id)a3
{
  objc_storeStrong((id *)&self->_listProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listProvider, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
