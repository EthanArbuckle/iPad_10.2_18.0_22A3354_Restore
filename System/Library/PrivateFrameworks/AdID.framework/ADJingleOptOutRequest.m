@implementation ADJingleOptOutRequest

- (id)init:(id)a3 state:(BOOL)a4 timestamp:(double)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v7 = a4;
  v19[2] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)ADJingleOptOutRequest;
  v8 = -[ADJingleRequest init:withCompletion:](&v17, sel_init_withCompletion_, a3, a6);
  v9 = v8;
  if (v8)
  {
    v10 = (_QWORD *)MEMORY[0x24BE02290];
    if (!v7)
      v10 = (_QWORD *)MEMORY[0x24BE02288];
    objc_msgSend(v8, "setBagKey:", *v10);
    v18[0] = CFSTR("dsid");
    objc_msgSend(v9, "DSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = CFSTR("oo-timestamp");
    v19[0] = v11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "AD_jsonString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dataUsingEncoding:", 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRequestBody:", v15);

  }
  return v9;
}

@end
