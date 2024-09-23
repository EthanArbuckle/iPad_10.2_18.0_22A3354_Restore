@implementation NTKCornerComplicationConfiguration

- (id)orderedComplicationSlots
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("top-left");
  v3[1] = CFSTR("top-right");
  v3[2] = CFSTR("bottom-left");
  v3[3] = CFSTR("bottom-right");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NTKCornerComplicationConfiguration)initWithTopLeftComplication:(unint64_t)a3 topRightComplication:(unint64_t)a4 bottomLeftComplication:(unint64_t)a5 bottomRightComplication:(unint64_t)a6
{
  NTKCornerComplicationConfiguration *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NTKCornerComplicationConfiguration;
  result = -[NTKCornerComplicationConfiguration init](&v11, sel_init);
  if (result)
  {
    result->_topLeftComplication = a3;
    result->_topRightComplication = a4;
    result->_bottomLeftComplication = a5;
    result->_bottomRightComplication = a6;
  }
  return result;
}

- (id)defaultSelectedComplicationSlotForDevice:(id)a3
{
  return CFSTR("top-left");
}

- (id)complicationSlotDescriptors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[4];
  _QWORD v25[4];
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NTKAllSignatureCircularTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addIndexes:", v3);

  NTKAllSignatureCornerTypes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_topLeftComplication);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypeRankedListWithDefaultTypes(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_topRightComplication);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypeRankedListWithDefaultTypes(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bottomLeftComplication);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypeRankedListWithDefaultTypes(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bottomRightComplication);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NTKComplicationTypeRankedListWithDefaultTypes(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = CFSTR("top-left");
  NTKComplicationSlotDescriptor(8, v4, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v17;
  v24[1] = CFSTR("top-right");
  NTKComplicationSlotDescriptor(8, v4, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v18;
  v24[2] = CFSTR("bottom-left");
  NTKComplicationSlotDescriptor(8, v4, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v19;
  v24[3] = CFSTR("bottom-right");
  NTKComplicationSlotDescriptor(8, v4, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NTKCornerComplicationConfiguration)init
{
  return -[NTKCornerComplicationConfiguration initWithTopLeftComplication:topRightComplication:bottomLeftComplication:bottomRightComplication:](self, "initWithTopLeftComplication:topRightComplication:bottomLeftComplication:bottomRightComplication:", 43, 10, 3, 7);
}

- (BOOL)complicationExistenceInvalidatesSnapshot
{
  return 0;
}

- (id)richComplicationSlotsForDevice:(id)a3
{
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("top-left");
  v4[1] = CFSTR("top-right");
  v4[2] = CFSTR("bottom-left");
  v4[3] = CFSTR("bottom-right");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
