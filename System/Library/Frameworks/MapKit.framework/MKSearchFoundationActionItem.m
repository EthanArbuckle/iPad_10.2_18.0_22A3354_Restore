@implementation MKSearchFoundationActionItem

+ (id)defaultActionItemDestinationMapItemData:(id)a3 mapItem:(id)a4
{
  id v5;
  id v6;
  MKSearchFoundationActionItem *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MKSearchFoundationActionItem);
  objc_msgSend(v6, "_messageID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8 == 0;
  if (v8)
  {
    objc_msgSend(v6, "_messageID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFActionItem setMessageIdentifier:](v7, "setMessageIdentifier:", v10);

    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "_messageURLString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFActionItem setMessageURL:](v7, "setMessageURL:", v13);

  }
  if (objc_msgSend(v6, "_isStandAloneBrand"))
  {
    objc_msgSend(v6, "phoneNumber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
    if (v14)
    {
      objc_msgSend(v6, "phoneNumber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setPhoneNumber:](v7, "setPhoneNumber:", v15);

    }
    goto LABEL_12;
  }
  if (v5 && objc_msgSend(v6, "_canGetDirections"))
    -[SFActionItem setMapsData:](v7, "setMapsData:", v5);
  else
    v9 = 1;
  objc_msgSend(v6, "phoneNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_10;
LABEL_12:

  return v7;
}

@end
