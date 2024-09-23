@implementation ADJingleSegmentRequest

- (id)init:(id)a3 forceSegments:(BOOL)a4 withCompletion:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)ADJingleSegmentRequest;
  v6 = -[ADJingleRequest init:withCompletion:](&v16, sel_init_withCompletion_, a3, a5);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setBagKey:", *MEMORY[0x24BE02298]);
    if (a4)
    {
      v19[0] = CFSTR("dsid");
      objc_msgSend(v7, "DSID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v8;
      v20[1] = CFSTR("1");
      v19[1] = CFSTR("ioflag");
      v19[2] = CFSTR("gflag");
      v20[2] = CFSTR("1");
      v9 = (void *)MEMORY[0x24BDBCE70];
      v10 = v20;
      v11 = v19;
    }
    else
    {
      v17[0] = CFSTR("dsid");
      objc_msgSend(v7, "DSID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v8;
      v18[1] = CFSTR("0");
      v17[1] = CFSTR("ioflag");
      v17[2] = CFSTR("gflag");
      v18[2] = CFSTR("1");
      v9 = (void *)MEMORY[0x24BDBCE70];
      v10 = v18;
      v11 = v17;
    }
    objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "AD_jsonString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataUsingEncoding:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRequestBody:", v14);

  }
  return v7;
}

@end
