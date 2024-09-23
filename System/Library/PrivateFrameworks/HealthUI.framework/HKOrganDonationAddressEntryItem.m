@implementation HKOrganDonationAddressEntryItem

- (HKOrganDonationAddressEntryItem)initWithRegistrant:(id)a3
{
  id v4;
  HKOrganDonationAddressEntryItem *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *statesDict;
  NSArray *v11;
  void *v12;
  void *v13;
  NSArray *sortedStateKeys;
  NSArray *v15;
  uint64_t v16;
  NSString *address1;
  uint64_t v18;
  NSString *address2;
  uint64_t v20;
  NSString *city;
  uint64_t v22;
  NSString *state;
  uint64_t v24;
  NSString *zipcode;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HKOrganDonationAddressEntryItem;
  v5 = -[HKOrganDonationAddressEntryItem init](&v27, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99D80];
    HKHealthUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathForResource:ofType:", CFSTR("USStateAbbreviations"), CFSTR("plist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithContentsOfFile:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    statesDict = v5->_statesDict;
    v5->_statesDict = (NSDictionary *)v9;

    v11 = (NSArray *)objc_msgSend(&unk_1E9CE9C08, "mutableCopy");
    -[NSDictionary allKeys](v5->_statesDict, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sortedArrayUsingSelector:", sel_localizedCompare_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v11, "addObjectsFromArray:", v13);

    sortedStateKeys = v5->_sortedStateKeys;
    v5->_sortedStateKeys = v11;
    v15 = v11;

    objc_msgSend(v4, "address1");
    v16 = objc_claimAutoreleasedReturnValue();
    address1 = v5->_address1;
    v5->_address1 = (NSString *)v16;

    objc_msgSend(v4, "address2");
    v18 = objc_claimAutoreleasedReturnValue();
    address2 = v5->_address2;
    v5->_address2 = (NSString *)v18;

    objc_msgSend(v4, "city");
    v20 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (NSString *)v20;

    objc_msgSend(v4, "state");
    v22 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v22;

    objc_msgSend(v4, "zip");
    v24 = objc_claimAutoreleasedReturnValue();
    zipcode = v5->_zipcode;
    v5->_zipcode = (NSString *)v24;

  }
  return v5;
}

- (id)cell
{
  HKOrganDonationAddressCell *cell;
  HKOrganDonationAddressCell *v4;
  HKOrganDonationAddressCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIPickerView *v11;
  UIPickerView *statePicker;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  cell = self->_cell;
  if (!cell)
  {
    v4 = -[HKOrganDonationAddressCell initWithStyle:reuseIdentifier:]([HKOrganDonationAddressCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    v5 = self->_cell;
    self->_cell = v4;

    -[HKOrganDonationAddressCell setDelegate:](self->_cell, "setDelegate:", self);
    -[HKOrganDonationAddressCell streetOneTextField](self->_cell, "streetOneTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", self->_address1);

    -[HKOrganDonationAddressCell streetTwoTextField](self->_cell, "streetTwoTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", self->_address2);

    -[HKOrganDonationAddressCell cityTextField](self->_cell, "cityTextField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", self->_city);

    -[HKOrganDonationAddressCell stateTextField](self->_cell, "stateTextField");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", self->_state);

    -[HKOrganDonationAddressCell zipCodeTextField](self->_cell, "zipCodeTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", self->_zipcode);

    v11 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E0DC3AE0]);
    statePicker = self->_statePicker;
    self->_statePicker = v11;

    -[UIPickerView setDataSource:](self->_statePicker, "setDataSource:", self);
    -[UIPickerView setDelegate:](self->_statePicker, "setDelegate:", self);
    if (self->_state)
    {
      -[NSDictionary allKeysForObject:](self->_statesDict, "allKeysForObject:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIPickerView selectRow:inComponent:animated:](self->_statePicker, "selectRow:inComponent:animated:", -[NSArray indexOfObject:](self->_sortedStateKeys, "indexOfObject:", v14), 0, 0);
    }
    +[HKHostingAreaLayoutView viewHostingView:](HKHostingAreaLayoutView, "viewHostingView:", self->_statePicker);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOrganDonationAddressCell stateTextField](self->_cell, "stateTextField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInputView:", v15);

    cell = self->_cell;
  }
  return cell;
}

- (id)formattedKeyAndValue
{
  id v3;
  void *v4;
  const __CFString *address1;
  const __CFString *address2;
  const __CFString *city;
  const __CFString *state;
  const __CFString *zipcode;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  if (self->_address1)
    address1 = (const __CFString *)self->_address1;
  else
    address1 = &stru_1E9C4C428;
  objc_msgSend(v3, "setObject:forKey:", address1, CFSTR("address1"));
  if (self->_address2)
    address2 = (const __CFString *)self->_address2;
  else
    address2 = &stru_1E9C4C428;
  objc_msgSend(v4, "setObject:forKey:", address2, CFSTR("address2"));
  if (self->_city)
    city = (const __CFString *)self->_city;
  else
    city = &stru_1E9C4C428;
  objc_msgSend(v4, "setObject:forKey:", city, CFSTR("city"));
  if (self->_state)
    state = (const __CFString *)self->_state;
  else
    state = &stru_1E9C4C428;
  objc_msgSend(v4, "setObject:forKey:", state, CFSTR("state"));
  if (self->_zipcode)
    zipcode = (const __CFString *)self->_zipcode;
  else
    zipcode = &stru_1E9C4C428;
  objc_msgSend(v4, "setObject:forKey:", zipcode, CFSTR("zip"));
  return v4;
}

- (void)updateCellDisplay
{
  id v3;

  -[HKOrganDonationAddressCell stateTextField](self->_cell, "stateTextField");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", self->_state);

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return -[NSArray count](self->_sortedStateKeys, "count", a3, a4);
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v6;
  void *v7;
  __CFString *v8;

  -[NSArray objectAtIndexedSubscript:](self->_sortedStateKeys, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_statesDict, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v6, v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E9C4C428;
  }

  return v8;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  NSDictionary *statesDict;
  void *v7;
  NSString *v8;
  NSString *state;
  id v10;

  statesDict = self->_statesDict;
  -[NSArray objectAtIndexedSubscript:](self->_sortedStateKeys, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](statesDict, "objectForKey:", v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  state = self->_state;
  self->_state = v8;

  -[HKOrganDonationAddressEntryItem updateCellDisplay](self, "updateCellDisplay");
  -[HKSimpleDataEntryItem delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataEntryItemDidUpdateValue:", self);

}

- (void)textFieldDidChangeValue:(id)a3 forCell:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[HKOrganDonationAddressCell streetOneTextField](self->_cell, "streetOneTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v14)
  {
    objc_msgSend(v14, "text");
    v10 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v11 = 48;
    goto LABEL_9;
  }
  -[HKOrganDonationAddressCell streetTwoTextField](self->_cell, "streetTwoTextField");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v14)
  {
    objc_msgSend(v14, "text");
    v10 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v11 = 56;
    goto LABEL_9;
  }
  -[HKOrganDonationAddressCell cityTextField](self->_cell, "cityTextField");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v14)
  {
    objc_msgSend(v14, "text");
    v10 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v11 = 64;
    goto LABEL_9;
  }
  -[HKOrganDonationAddressCell zipCodeTextField](self->_cell, "zipCodeTextField");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v14;
  if (v8 == v14)
  {
    objc_msgSend(v14, "text");
    v10 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v11 = 80;
LABEL_9:
    v12 = *(Class *)((char *)&self->super.super.isa + v11);
    *(Class *)((char *)&self->super.super.isa + v11) = v10;

    -[HKSimpleDataEntryItem delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataEntryItemDidUpdateValue:", self);

    v9 = v14;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedStateKeys, 0);
  objc_storeStrong((id *)&self->_statesDict, 0);
  objc_storeStrong((id *)&self->_statePicker, 0);
  objc_storeStrong((id *)&self->_zipcode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_address2, 0);
  objc_storeStrong((id *)&self->_address1, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
