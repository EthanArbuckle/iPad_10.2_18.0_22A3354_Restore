@implementation MPModelSong(MPCModelQueueFeederAdditions)

+ (id)mqf_requiredItemPlaybackProperties
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _QWORD v50[3];
  _QWORD v51[9];
  _QWORD v52[9];
  _QWORD v53[27];

  v53[25] = *MEMORY[0x24BDAC8D0];
  v42 = objc_alloc(MEMORY[0x24BDDCB30]);
  v0 = *MEMORY[0x24BDDC0D8];
  v53[0] = *MEMORY[0x24BDDC160];
  v53[1] = v0;
  v1 = *MEMORY[0x24BDDC110];
  v53[2] = *MEMORY[0x24BDDC0E0];
  v53[3] = v1;
  v2 = *MEMORY[0x24BDDC0F8];
  v53[4] = *MEMORY[0x24BDDC100];
  v53[5] = v2;
  v3 = *MEMORY[0x24BDDC120];
  v53[6] = *MEMORY[0x24BDDC118];
  v53[7] = v3;
  v4 = *MEMORY[0x24BDDC0E8];
  v53[8] = *MEMORY[0x24BDDC0D0];
  v53[9] = v4;
  v5 = *MEMORY[0x24BDDC188];
  v53[10] = *MEMORY[0x24BDDC150];
  v53[11] = v5;
  v6 = *MEMORY[0x24BDDC130];
  v53[12] = *MEMORY[0x24BDDC138];
  v53[13] = v6;
  v7 = *MEMORY[0x24BDDC140];
  v53[14] = *MEMORY[0x24BDDC128];
  v53[15] = v7;
  v8 = *MEMORY[0x24BDDC178];
  v53[16] = *MEMORY[0x24BDDC148];
  v53[17] = v8;
  v9 = *MEMORY[0x24BDDC180];
  v53[18] = *MEMORY[0x24BDDC108];
  v53[19] = v9;
  v10 = *MEMORY[0x24BDDC0F0];
  v53[20] = *MEMORY[0x24BDDC168];
  v53[21] = v10;
  v11 = *MEMORY[0x24BDDC170];
  v53[22] = *MEMORY[0x24BDDCD28];
  v53[23] = v11;
  v53[24] = *MEMORY[0x24BDDC158];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 25);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = *MEMORY[0x24BDDC378];
  v12 = objc_alloc(MEMORY[0x24BDDCB30]);
  v13 = *MEMORY[0x24BDDBDC0];
  v50[0] = *MEMORY[0x24BDDBDA0];
  v50[1] = v13;
  v50[2] = *MEMORY[0x24BDDBDB8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = *MEMORY[0x24BDDC270];
  v14 = (void *)MEMORY[0x24BDDCB30];
  v47 = *MEMORY[0x24BDDBDD0];
  v15 = v47;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v47, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "propertySetWithProperties:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v40;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v12, "initWithProperties:relationships:", v39, v37);
  v52[0] = v36;
  v51[1] = *MEMORY[0x24BDDC380];
  v16 = (void *)MEMORY[0x24BDDCB30];
  v46 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "propertySetWithProperties:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v34;
  v51[2] = *MEMORY[0x24BDDC388];
  v17 = (void *)MEMORY[0x24BDDCB30];
  v45 = *MEMORY[0x24BDDBDD8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "propertySetWithProperties:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v32;
  v51[3] = *MEMORY[0x24BDDC398];
  objc_msgSend(MEMORY[0x24BDDC8B8], "mqf_requiredItemPlaybackProperties");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v31;
  v51[4] = *MEMORY[0x24BDDC3A0];
  objc_msgSend(MEMORY[0x24BDDC878], "mqf_requiredItemPlaybackProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v18;
  v51[5] = *MEMORY[0x24BDDC3B0];
  objc_msgSend(MEMORY[0x24BDDC940], "mqf_requiredItemPlaybackProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v19;
  v51[6] = *MEMORY[0x24BDDC3B8];
  objc_msgSend(MEMORY[0x24BDDCA00], "mqf_requiredItemPlaybackProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v20;
  v51[7] = *MEMORY[0x24BDDC390];
  v21 = (void *)MEMORY[0x24BDDCB30];
  v44 = *MEMORY[0x24BDDBE40];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "propertySetWithProperties:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v23;
  v51[8] = *MEMORY[0x24BDDC3A8];
  v24 = (void *)MEMORY[0x24BDDCB30];
  v25 = *MEMORY[0x24BDDBE68];
  v43[0] = *MEMORY[0x24BDDBE78];
  v43[1] = v25;
  v43[2] = *MEMORY[0x24BDDBE70];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "propertySetWithProperties:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v52[8] = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v42, "initWithProperties:relationships:", v38, v28);

  return v29;
}

@end
