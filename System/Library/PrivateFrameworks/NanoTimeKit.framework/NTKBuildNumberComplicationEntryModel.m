@implementation NTKBuildNumberComplicationEntryModel

+ (id)modelWithBuildNum:(id)a3
{
  NSString *v3;
  NTKBuildNumberComplicationEntryModel *v4;
  NSString *buildNum;
  NSString *v6;
  NSString *prefixString;
  void *v8;

  v3 = (NSString *)a3;
  v4 = objc_alloc_init(NTKBuildNumberComplicationEntryModel);
  buildNum = v4->buildNum;
  v4->buildNum = v3;
  v6 = v3;

  prefixString = v4->prefixString;
  v4->prefixString = (NSString *)CFSTR("Watch");

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
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", self->prefixString);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", self->buildNum);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  switch(a3)
  {
    case 1:
      v8 = (void *)MEMORY[0x1E0C943F8];
      objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("tram.fill"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "templateWithHeaderImageProvider:headerTextProvider:body1TextProvider:", v9, v5, v6);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x1E0C94540], "textProviderWithFormat:", CFSTR("%@ %@"), v5, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 8:
      objc_msgSend(MEMORY[0x1E0C94300], "templateWithInnerTextProvider:outerTextProvider:", v6, v5);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 9:
      -[NTKBuildNumberComplicationEntryModel entryForComplicationFamily:](self, "entryForComplicationFamily:", 10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "complicationTemplate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94238], "templateWithCircularTemplate:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 10:
      v17 = (void *)MEMORY[0x1E0C942A8];
      goto LABEL_11;
    case 11:
      v13 = (void *)MEMORY[0x1E0C943B0];
      objc_msgSend(MEMORY[0x1E0C944E0], "symbolImageProviderWithSystemName:", CFSTR("tram.fill"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "templateWithHeaderImageProvider:headerTextProvider:bodyTextProvider:", v9, v5, v6);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v14 = (void *)v10;

      if (v14)
        goto LABEL_8;
      goto LABEL_13;
    case 12:
      v17 = (void *)MEMORY[0x1E0C94378];
LABEL_11:
      objc_msgSend(v17, "templateWithLine1TextProvider:line2TextProvider:", v5, v6);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v14 = (void *)v11;
      if (v11)
      {
LABEL_8:
        v15 = (void *)MEMORY[0x1E0C94490];
        -[NTKTimelineEntryModel entryDate](self, "entryDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "entryWithDate:complicationTemplate:", v16, v14);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
LABEL_13:
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
