@implementation NTKFaceSlotComplicationDetailListProvider

- (NTKFaceSlotComplicationDetailListProvider)initWithRichSlot:(BOOL)a3 complicationFamily:(int64_t)a4 complications:(id)a5 selectedComplication:(id)a6
{
  id v10;
  id v11;
  NTKFaceSlotComplicationDetailListProvider *v12;
  uint64_t v13;
  NSArray *complications;
  objc_super v16;

  v10 = a5;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NTKFaceSlotComplicationDetailListProvider;
  v12 = -[NTKFaceSlotComplicationDetailListProvider init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    complications = v12->_complications;
    v12->_complications = (NSArray *)v13;

    objc_storeStrong((id *)&v12->_pickerSelectedItem, a6);
    v12->_pickerListProviderSlotIsRich = a3;
    v12->_pickerComplicationFamily = a4;
  }

  return v12;
}

- (NSDiffableDataSourceSnapshot)pickerListDataSourceSnapshot
{
  -[NTKFaceSlotComplicationDetailListProvider _buildDataIfNeeded](self, "_buildDataIfNeeded");
  return self->_pickerListDataSourceSnapshot;
}

- (void)_buildDataIfNeeded
{
  NTKFaceSlotComplicationDetailListProviderStringSectionInfo *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!self->_pickerListDataSourceSnapshot)
  {
    v3 = -[NTKFaceSlotComplicationDetailListProviderStringSectionInfo initWithGroupName:]([NTKFaceSlotComplicationDetailListProviderStringSectionInfo alloc], "initWithGroupName:", &stru_1E6BDC918);
    v4 = objc_alloc_init(MEMORY[0x1E0DC3398]);
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", v5);

    -[NTKFaceSlotComplicationDetailListProvider complications](self, "complications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v6, v3);

    -[NTKFaceSlotComplicationDetailListProvider setPickerListDataSourceSnapshot:](self, "setPickerListDataSourceSnapshot:", v4);
  }
}

- (NTKComplicationItem)pickerSelectedItem
{
  return self->_pickerSelectedItem;
}

- (BOOL)pickerListProviderSlotIsRich
{
  return self->_pickerListProviderSlotIsRich;
}

- (int64_t)pickerComplicationFamily
{
  return self->_pickerComplicationFamily;
}

- (NSArray)complications
{
  return self->_complications;
}

- (void)setComplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setPickerListDataSourceSnapshot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerListDataSourceSnapshot, 0);
  objc_storeStrong((id *)&self->_complications, 0);
  objc_storeStrong((id *)&self->_pickerSelectedItem, 0);
}

@end
