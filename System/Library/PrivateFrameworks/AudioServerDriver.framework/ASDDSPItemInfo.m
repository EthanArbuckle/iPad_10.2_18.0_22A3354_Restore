@implementation ASDDSPItemInfo

- (ASDDSPItemInfo)initWithDictionary:(id)a3 resourcePath:(id)a4
{
  id v6;
  id v7;
  ASDDSPItemInfo *v8;
  ASDDSPItemInfo *v9;
  void *v10;
  __objc2_class **v11;
  ASDDSPItemInfo *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASDDSPItemInfo;
  v8 = -[ASDDSPItemInfo init](&v14, sel_init);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqual:", CFSTR("DSPGraph")) & 1) != 0)
    {
      v11 = off_24DBC8F10;
    }
    else if ((objc_msgSend(v10, "isEqual:", CFSTR("AUStrip")) & 1) != 0)
    {
      v11 = off_24DBC8EC0;
    }
    else
    {
      if (!objc_msgSend(v10, "isEqual:", CFSTR("PropertyStrip")))
      {
        v12 = 0;
        goto LABEL_10;
      }
      v11 = off_24DBC8F60;
    }
    v12 = (ASDDSPItemInfo *)objc_msgSend(objc_alloc(*v11), "initWithDictionary:resourcePath:", v6, v7);
LABEL_10:

    goto LABEL_11;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

@end
