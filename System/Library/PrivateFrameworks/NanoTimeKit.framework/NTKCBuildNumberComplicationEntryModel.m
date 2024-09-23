@implementation NTKCBuildNumberComplicationEntryModel

+ (id)modelWithBuildNum:(id)a3
{
  NSString *v3;
  NTKCBuildNumberComplicationEntryModel *v4;
  NSString *buildNum;
  NSString *v6;
  NSString *prefixString;
  void *v8;

  v3 = (NSString *)a3;
  v4 = objc_alloc_init(NTKCBuildNumberComplicationEntryModel);
  buildNum = v4->buildNum;
  v4->buildNum = v3;
  v6 = v3;

  prefixString = v4->prefixString;
  v4->prefixString = (NSString *)CFSTR("Phone");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKTimelineEntryModel setEntryDate:](v4, "setEntryDate:", v8);
  return v4;
}

- (id)entryForComplicationFamily:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", self->prefixString);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", self->buildNum);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0C943F8], "templateWithHeaderTextProvider:body1TextProvider:", v5, v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 3:
      objc_msgSend(MEMORY[0x1E0C94540], "textProviderWithFormat:", CFSTR("%@ %@"), v5, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 8:
      objc_msgSend(MEMORY[0x1E0C94300], "templateWithInnerTextProvider:outerTextProvider:", v6, v5);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 9:
      -[NTKCBuildNumberComplicationEntryModel entryForComplicationFamily:](self, "entryForComplicationFamily:", 10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "complicationTemplate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94238], "templateWithCircularTemplate:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v12 = (void *)v10;

      if (!v12)
        goto LABEL_7;
      goto LABEL_13;
    case 10:
      v13 = (void *)MEMORY[0x1E0C942A8];
      goto LABEL_11;
    case 11:
      objc_msgSend(MEMORY[0x1E0C943B0], "templateWithHeaderTextProvider:bodyTextProvider:", v5, v6);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 12:
      v13 = (void *)MEMORY[0x1E0C94378];
LABEL_11:
      objc_msgSend(v13, "templateWithLine1TextProvider:line2TextProvider:", v5, v6);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v12 = (void *)v8;
      if (v8)
      {
LABEL_13:
        v14 = (void *)MEMORY[0x1E0C94490];
        -[NTKTimelineEntryModel entryDate](self, "entryDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "entryWithDate:complicationTemplate:", v15, v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
LABEL_7:
        v7 = 0;
      }
      break;
    default:
      break;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->buildNum, 0);
  objc_storeStrong((id *)&self->prefixString, 0);
}

@end
