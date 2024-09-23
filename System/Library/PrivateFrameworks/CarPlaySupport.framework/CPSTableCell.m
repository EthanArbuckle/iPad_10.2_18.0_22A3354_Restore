@implementation CPSTableCell

- (void)configureWithListItem:(id)a3 spinning:(BOOL)a4 environment:(id)a5 playbackState:(int64_t)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  int64_t v15;
  char v16;
  id v17;
  BOOL v18;
  double v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v30;
  id v31;
  char v32;
  id v33;
  char v34;
  id v35;
  id v36;
  int64_t v37;
  id v38;
  BOOL v39;
  id location[2];
  CPSTableCell *v41;

  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v39 = a4;
  v38 = 0;
  objc_storeStrong(&v38, a5);
  v37 = a6;
  v36 = 0;
  v30 = objc_msgSend(location[0], "accessoryType");
  if (v30)
  {
    if (v30 == 1)
    {
      v8 = (id)objc_msgSend(MEMORY[0x24BE153D0], "accessoryWithDisclosureIndicator");
      v9 = v36;
      v36 = v8;

    }
    else if (v30 == 2)
    {
      v34 = 0;
      v32 = 0;
      if ((objc_msgSend(v38, "isUserApplication") & 1) != 0)
      {
        v35 = (id)objc_msgSend(MEMORY[0x24BE153D0], "accessoryWithCloudIcon");
        v34 = 1;
        objc_storeStrong(&v36, v35);
      }
      else
      {
        v33 = (id)objc_msgSend(MEMORY[0x24BE153D0], "accessoryWithiCloudIcon");
        v32 = 1;
        objc_storeStrong(&v36, v33);
      }
      if ((v32 & 1) != 0)

      if ((v34 & 1) != 0)
    }
  }
  else
  {
    v26 = (id)objc_msgSend(location[0], "accessoryImage");

    if (v26)
    {
      v24 = (void *)MEMORY[0x24BE153D0];
      v25 = (id)objc_msgSend(location[0], "accessoryImage");
      v6 = (id)objc_msgSend(v24, "accessoryWithImage:");
      v7 = v36;
      v36 = v6;

    }
  }
  v20 = (void *)MEMORY[0x24BE153D8];
  v23 = (id)objc_msgSend(location[0], "text");
  v22 = (id)objc_msgSend(location[0], "detailText");
  v21 = (id)objc_msgSend(location[0], "image");
  v16 = objc_msgSend(location[0], "isExplicitContent");
  v17 = v36;
  v18 = v39;
  objc_msgSend(location[0], "playbackProgress");
  v14 = v10 > 0.0;
  objc_msgSend(location[0], "playbackProgress");
  v19 = v11;
  v15 = v37;
  LOBYTE(v12) = v14;
  LOBYTE(v13) = objc_msgSend(location[0], "playingIndicatorLocation") == 0;
  BYTE1(v13) = objc_msgSend(location[0], "isEnabled") & 1;
  v31 = (id)objc_msgSend(v20, "configurationWithText:detailText:image:showExplicit:accessory:showActivityIndicator:showPlaybackProgress:playbackProgress:playbackState:playingIndicatorLeadingSide:isEnabled:", v23, v22, v21, v16 & 1, v17, v18, v19, v12, v15, v13);

  -[CPUITableCell applyConfiguration:](v41, "applyConfiguration:", v31);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

@end
