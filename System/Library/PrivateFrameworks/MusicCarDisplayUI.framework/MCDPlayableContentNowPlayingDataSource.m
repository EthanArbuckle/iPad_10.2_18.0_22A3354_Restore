@implementation MCDPlayableContentNowPlayingDataSource

- (id)_itemProperties
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[11];
  uint64_t v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v28 = objc_alloc(MEMORY[0x24BDDCB30]);
  v38 = *MEMORY[0x24BDDC2F8];
  v2 = objc_alloc(MEMORY[0x24BDDCB30]);
  v3 = *MEMORY[0x24BDDC100];
  v37[0] = *MEMORY[0x24BDDC160];
  v37[1] = v3;
  v4 = *MEMORY[0x24BDDC118];
  v37[2] = *MEMORY[0x24BDDC120];
  v37[3] = v4;
  v5 = *MEMORY[0x24BDDC0D8];
  v37[4] = *MEMORY[0x24BDDC110];
  v37[5] = v5;
  v6 = *MEMORY[0x24BDDC148];
  v37[6] = *MEMORY[0x24BDDC0F8];
  v37[7] = v6;
  v7 = *MEMORY[0x24BDDC150];
  v37[8] = *MEMORY[0x24BDDC140];
  v37[9] = v7;
  v37[10] = *MEMORY[0x24BDDC0D0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = *MEMORY[0x24BDDC388];
  v8 = (void *)MEMORY[0x24BDDCB30];
  v34 = *MEMORY[0x24BDDBDD8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertySetWithProperties:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v26;
  v35[1] = *MEMORY[0x24BDDC378];
  v9 = objc_alloc(MEMORY[0x24BDDCB30]);
  v33 = *MEMORY[0x24BDDBDA0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *MEMORY[0x24BDDC270];
  v10 = (void *)MEMORY[0x24BDDCB30];
  v30 = *MEMORY[0x24BDDBDD0];
  v11 = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v30, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "propertySetWithProperties:", v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v9, "initWithProperties:relationships:", v23, v13);
  v36[1] = v14;
  v35[2] = *MEMORY[0x24BDDC380];
  v15 = (void *)MEMORY[0x24BDDCB30];
  v29 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "propertySetWithProperties:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v2, "initWithProperties:relationships:", v25, v18);
  v39[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v28, "initWithProperties:relationships:", 0, v20);

  return v21;
}

- (id)requestLabel
{
  return CFSTR("CarPlay Now Playing Request - Playable Content");
}

@end
