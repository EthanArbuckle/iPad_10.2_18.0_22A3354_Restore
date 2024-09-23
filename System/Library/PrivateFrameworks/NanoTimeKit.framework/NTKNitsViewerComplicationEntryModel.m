@implementation NTKNitsViewerComplicationEntryModel

+ (id)tritiumModel
{
  NTKNitsViewerComplicationEntryModel *v2;
  void *v3;

  v2 = objc_alloc_init(NTKNitsViewerComplicationEntryModel);
  v2->_nitsValue = -1.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKTimelineEntryModel setEntryDate:](v2, "setEntryDate:", v3);

  return v2;
}

+ (id)modelWithNits:(float)a3
{
  NTKNitsViewerComplicationEntryModel *v4;
  void *v5;

  v4 = objc_alloc_init(NTKNitsViewerComplicationEntryModel);
  v4->_nitsValue = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKTimelineEntryModel setEntryDate:](v4, "setEntryDate:", v5);

  return v4;
}

- (id)entryForComplicationFamily:(int64_t)a3
{
  float nitsValue;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  nitsValue = self->_nitsValue;
  if (nitsValue == -1.0)
  {
    v6 = CFSTR("----");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.0f"), nitsValue);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  switch(a3)
  {
    case 8:
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("NITS"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94300], "templateWithInnerTextProvider:outerTextProvider:", v8, v7);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 9:
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("NITS"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C942A8], "templateWithLine1TextProvider:line2TextProvider:", v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94238], "templateWithCircularTemplate:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0C94490];
      -[NTKTimelineEntryModel entryDate](self, "entryDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "entryWithDate:complicationTemplate:", v14, v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    case 10:
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("NITS"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C942A8], "templateWithLine1TextProvider:line2TextProvider:", v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 11:
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", CFSTR("NITS"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C943B0], "templateWithHeaderTextProvider:bodyTextProvider:", v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v11 = (void *)v9;
      v15 = (void *)MEMORY[0x1E0C94490];
      -[NTKTimelineEntryModel entryDate](self, "entryDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "entryWithDate:complicationTemplate:", v12, v11);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

@end
