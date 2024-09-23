@implementation MUPlaceTextActivityProvider

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return &stru_1E2E05448;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D96DB0]))
  {
    -[MUPlaceActivityProvider mapItem](self, "mapItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    HTMLStringForAnnotatedSnapshotImageWithMapItems(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceActivityProvider activityTitle](self, "activityTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlaceActivityProvider mapItem](self, "mapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HTMLStringForMapItemDetailsWithTitle(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUPlaceActivityProvider activityURL](self, "activityURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _MULocalizedStringFromThisBundle(CFSTR("View on Apple Maps [POI Sharing]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HTMLStringForURLWithLabel(v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    HTMLBodyWrapperStringWithFormat(CFSTR("%@<br><br>%@<br><br>%@"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D96DC0]) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D96DA0]) & 1) != 0)
  {
    v22 = 0;
  }
  else
  {
    -[MUPlaceActivityProvider activityTitle](self, "activityTitle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

@end
