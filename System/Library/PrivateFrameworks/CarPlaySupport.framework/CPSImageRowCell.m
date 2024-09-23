@implementation CPSImageRowCell

- (void)configureWithImageRowItem:(id)a3 selectGridItemBlock:(id)a4 selectTitleBlock:(id)a5 showActivityIndicator:(BOOL)a6 bundleIdentifier:(id)a7
{
  uint64_t v7;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  id v22;
  id v23;
  id location[2];
  CPSImageRowCell *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = 0;
  objc_storeStrong(&v22, a5);
  v21 = a6;
  v20 = 0;
  objc_storeStrong(&v20, a7);
  v15 = (void *)MEMORY[0x24BE15378];
  v18 = (id)objc_msgSend(location[0], "text");
  v17 = (id)objc_msgSend(location[0], "gridImages");
  v16 = (id)objc_msgSend(location[0], "imageTitles");
  v12 = v23;
  v13 = v22;
  v14 = v21;
  LOBYTE(v7) = objc_msgSend(location[0], "isEnabled") & 1;
  v19 = (id)objc_msgSend(v15, "configurationWithText:images:imageTitles:selectGridItemBlock:selectTitleBlock:showActivityIndicator:enabled:bundleIdentifier:", v18, v17, v16, v12, v13, v14, v7, v20);

  -[CPUIImageRowCell applyConfiguration:](v25, "applyConfiguration:", v19);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

@end
