@implementation MKImportAnalytics

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  _QWORD v4[15];
  _QWORD v5[16];

  v5[15] = *MEMORY[0x24BDAC8D0];
  v4[0] = &unk_24E36BE20;
  v4[1] = &unk_24E36BE38;
  v5[0] = CFSTR("account");
  v5[1] = CFSTR("application");
  v4[2] = &unk_24E36BE50;
  v4[3] = &unk_24E36BE68;
  v5[2] = CFSTR("bookmark");
  v5[3] = CFSTR("calendar");
  v4[4] = &unk_24E36BE80;
  v4[5] = &unk_24E36BE98;
  v5[4] = CFSTR("contact");
  v5[5] = CFSTR("container");
  v4[6] = &unk_24E36BEB0;
  v4[7] = &unk_24E36BEC8;
  v5[6] = CFSTR("file");
  v5[7] = CFSTR("message");
  v4[8] = &unk_24E36BEE0;
  v4[9] = &unk_24E36BEF8;
  v5[8] = CFSTR("placeholder");
  v5[9] = CFSTR("accessibility_setting");
  v4[10] = &unk_24E36BF10;
  v4[11] = &unk_24E36BF28;
  v5[10] = CFSTR("display_setting");
  v5[11] = CFSTR("image");
  v4[12] = &unk_24E36BF40;
  v4[13] = &unk_24E36BF58;
  v5[12] = CFSTR("video");
  v5[13] = CFSTR("photo_album");
  v4[14] = &unk_24E36BF70;
  v5[14] = CFSTR("sim");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 15);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)contentTypes;
  contentTypes = v2;

}

- (MKImportAnalytics)initWithContentType:(int64_t)a3
{
  MKImportAnalytics *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *contentType;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MKImportAnalytics;
  v4 = -[MKImportAnalytics init](&v10, sel_init);
  if (v4)
  {
    v5 = (void *)contentTypes;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    contentType = v4->_contentType;
    v4->_contentType = (NSString *)v7;

  }
  return v4;
}

- (void)complete:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  id v7;
  void *v8;
  __CFString *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.import"), self->_contentType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("-1");
  if (v3)
    v5 = CFSTR("0");
  v8 = v4;
  v9 = v5;
  v6 = v9;
  v7 = v4;
  AnalyticsSendEventLazy();

}

id __30__MKImportAnalytics_complete___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("type");
  v3[1] = CFSTR("code");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)send:(id)a3
{
  void *v3;
  NSString *contentType;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  contentType = self->_contentType;
  v5 = (__CFString *)a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.import.error.code"), contentType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("unknown");
  if (v5)
    v7 = v5;
  v8 = v7;

  v11 = v6;
  v9 = v8;
  v10 = v6;
  AnalyticsSendEventLazy();

}

id __26__MKImportAnalytics_send___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("type");
  v3[1] = CFSTR("code");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)send:(id)a3 extension:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;

  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  if (!-[__CFString length](v6, "length"))
  {

    v6 = CFSTR("unknown");
  }
  if (!-[__CFString length](v7, "length"))
  {

    v7 = CFSTR("unknown");
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.import.error.format"), self->_contentType);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v6;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  v10 = v11;
  AnalyticsSendEventLazy();

}

id __36__MKImportAnalytics_send_extension___block_invoke(uint64_t a1)
{
  __int128 v1;
  _QWORD v3[3];
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_OWORD *)(a1 + 32);
  v3[0] = CFSTR("type");
  v3[1] = CFSTR("format");
  v4 = v1;
  v3[2] = CFSTR("extension");
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
}

@end
