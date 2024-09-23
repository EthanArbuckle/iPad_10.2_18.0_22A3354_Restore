@implementation CPSClusterEstimatesView

- (id)_labelFont
{
  id v2;
  id v3;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14[3];
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v14[2] = self;
  v14[1] = (id)a2;
  v6 = (void *)MEMORY[0x24BDF6A78];
  v5 = *MEMORY[0x24BDF77D0];
  v7 = (id)-[CPSClusterEstimatesView traitCollection](self, "traitCollection");
  v14[0] = (id)objc_msgSend(v6, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5);

  v17 = *MEMORY[0x24BDF78A0];
  v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7868]);
  v18[0] = v8;
  v13 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17);

  v9 = v14[0];
  v15 = *MEMORY[0x24BDF7770];
  v16 = v13;
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v2 = (id)objc_msgSend(v9, "fontDescriptorByAddingAttributes:");
  v3 = v14[0];
  v14[0] = v2;

  v12 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v14[0], 0.0);
  v11 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v14, 0);
  return v11;
}

@end
