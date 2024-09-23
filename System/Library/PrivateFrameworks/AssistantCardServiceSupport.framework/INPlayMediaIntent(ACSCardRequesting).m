@implementation INPlayMediaIntent(ACSCardRequesting)

- (void)requestCard:()ACSCardRequesting reply:
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v6)
  {
    objc_msgSend(a3, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "underlyingInteraction");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(a1, "mediaItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "mediaContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)v8;
    if (v8)
    {
      objc_msgSend(v10, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "length"))
      {

        goto LABEL_9;
      }
      objc_msgSend(v11, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v14)
      {
LABEL_9:
        v41 = v7;
        v15 = (void *)objc_opt_new();
        objc_msgSend(v11, "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        if (v17)
        {
          objc_msgSend(v11, "title");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD9EF8], "parameterForClass:keyPath:", objc_opt_class(), CFSTR("container.title"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v19);

          objc_msgSend(v10, "title");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v20, "length");

          if (!v21)
            goto LABEL_16;
          objc_msgSend(v10, "title");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v10, "title");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v25, "length");

          if (!v18)
          {
            v21 = 0;
LABEL_16:
            objc_msgSend(v11, "title");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v27, "length"))
            {
              objc_msgSend(v11, "artwork");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              if (v28)
              {
                v29 = CFSTR("container.artwork");
                v30 = v11;
                goto LABEL_23;
              }
            }
            else
            {

            }
            objc_msgSend(v10, "title");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v31, "length"))
            {
              v32 = 0;
              goto LABEL_25;
            }
            objc_msgSend(v10, "artwork");
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v32)
            {
LABEL_26:
              v33 = objc_alloc_init(MEMORY[0x24BE84E08]);
              objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", v18);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setTitle:", v34);

              objc_msgSend(v33, "title");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setMaxLines:", 1);

              if (objc_msgSend(v21, "length"))
              {
                objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", v21);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "setMaxLines:", 1);
                v44 = v36;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "setDescriptions:", v37);

              }
              if (v32)
              {
                v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA518]), "initWithIntentsImage:", v32);
                objc_msgSend(v38, "setCornerRoundingStyle:", 2);
                objc_msgSend(v33, "setThumbnail:", v38);

              }
              objc_msgSend(v33, "acs_setParameters:", v15);
              objc_msgSend(MEMORY[0x24BE84D80], "acs_uniquelyIdentifiedCard");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v33;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "setCardSections:", v40);

              v24 = v42;
              objc_msgSend(v39, "acs_setInteraction:", v42);
              v6[2](v6, v39, 0);

              v7 = v41;
              goto LABEL_31;
            }
            v29 = CFSTR("mediaItems[0].artwork");
            v30 = v10;
LABEL_23:
            objc_msgSend(v30, "artwork");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD9EF8], "parameterForClass:keyPath:", objc_opt_class(), v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v31);
LABEL_25:

            goto LABEL_26;
          }
          objc_msgSend(v10, "title");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0;
        }
        objc_msgSend(MEMORY[0x24BDD9EF8], "parameterForClass:keyPath:", objc_opt_class(), CFSTR("mediaItems[0].title"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v26);

        goto LABEL_16;
      }
    }
    v22 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BE15488];
    v45 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Content %@ is incompatible with this service"), v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 400, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v15);
    v24 = v42;
LABEL_31:

  }
}

- (uint64_t)servicePriorityForCardRequest:()ACSCardRequesting
{
  return 2;
}

@end
