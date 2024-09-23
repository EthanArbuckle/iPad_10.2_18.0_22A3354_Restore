@implementation MPMediaItem(_QLUtilities)

+ (id)playingInfoFromAsset:()_QLUtilities withDefaultTitle:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  void *v32;
  void *v33;
  id v35;
  _QWORD v36[4];
  id v37;

  v5 = a3;
  v35 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDB2588];
  objc_msgSend(v5, "commonMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDB1E38];
  objc_msgSend(v7, "metadataItemsFromArray:withKey:keySpace:", v8, *MEMORY[0x24BDB1D88], *MEMORY[0x24BDB1E38]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDDBB10]);
  v13 = (void *)MEMORY[0x24BDB2588];
  objc_msgSend(v5, "commonMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "metadataItemsFromArray:withKey:keySpace:", v14, *MEMORY[0x24BDB1D80], v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BDDBAF8]);
  objc_msgSend((id)objc_opt_class(), "ql_propertyTitleFromAsset:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v19 = v18;
  else
    v19 = v35;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BDDBCD8]);
  v20 = (void *)MEMORY[0x24BDB2588];
  objc_msgSend(v5, "commonMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "metadataItemsFromArray:withKey:keySpace:", v21, *MEMORY[0x24BDB1D90], v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dataValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24 && objc_msgSend(v24, "length"))
  {
    objc_msgSend(MEMORY[0x24BEBD640], "imageWithData:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_alloc(MEMORY[0x24BDDC7C0]);
    objc_msgSend(v25, "size");
    v28 = v27;
    v30 = v29;
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __67__MPMediaItem__QLUtilities__playingInfoFromAsset_withDefaultTitle___block_invoke;
    v36[3] = &unk_24C725CD8;
    v37 = v25;
    v31 = v25;
    v32 = (void *)objc_msgSend(v26, "initWithBoundsSize:requestHandler:", v36, v28, v30);
    if (v32)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, *MEMORY[0x24BDDBB20]);

  }
  v33 = (void *)objc_msgSend(v6, "copy");

  return v33;
}

+ (id)playingInfoFromAsset:()_QLUtilities withDefaultTitle:playbackDuration:elapsedTime:
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDDC7B8], "playingInfoFromAsset:withDefaultTitle:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDDBC58]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDDC518]);

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
}

+ (id)ql_propertyTitleFromAsset:()_QLUtilities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDB2588];
  objc_msgSend(a3, "commonMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataItemsFromArray:withKey:keySpace:", v4, *MEMORY[0x24BDB1DA0], *MEMORY[0x24BDB1E38]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
