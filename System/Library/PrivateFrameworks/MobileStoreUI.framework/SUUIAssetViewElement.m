@implementation SUUIAssetViewElement

- (SUUIAssetViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIAssetViewElement *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSURL *keyCertificateURL;
  void *v19;
  uint64_t v20;
  NSURL *keyServerURL;
  void *v22;
  void *v23;
  uint64_t v24;
  NSURL *url;
  objc_super v27;

  v8 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SUUIAssetViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v27, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("offset"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      objc_msgSend(v10, "doubleValue");
    else
      v11 = 0x7FF8000000000000;
    *(_QWORD *)&v9->_initialPlaybackTime = v11;
    objc_msgSend(v8, "getAttribute:", CFSTR("duration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
      objc_msgSend(v12, "doubleValue");
    else
      v13 = 0x7FF8000000000000;
    *(_QWORD *)&v9->_playbackDuration = v13;
    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
      v9->_itemIdentifier = objc_msgSend(v14, "longLongValue");
    objc_msgSend(v8, "getAttribute:", *MEMORY[0x24BE51848]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "length"))
      objc_storeStrong((id *)&v9->_secureKeyDeliveryType, v15);
    objc_msgSend(v8, "getAttribute:", CFSTR("key-cert-url"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v16);
      keyCertificateURL = v9->_keyCertificateURL;
      v9->_keyCertificateURL = (NSURL *)v17;

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("key-server-url"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v19);
      keyServerURL = v9->_keyServerURL;
      v9->_keyServerURL = (NSURL *)v20;

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("is-itunes-stream"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_ITunesStream = objc_msgSend(v22, "BOOLValue");
    objc_msgSend(v8, "getAttribute:", CFSTR("src"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "length"))
    {
      v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v23);
      url = v9->_url;
      v9->_url = (NSURL *)v24;

    }
  }

  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIAssetViewElement *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSURL *v9;
  NSURL *keyCertificateURL;
  NSURL *v11;
  NSURL *keyServerURL;
  NSString *v13;
  NSString *secureKeyDeliveryType;
  NSURL *v15;
  NSURL *url;
  objc_super v18;

  v4 = (SUUIAssetViewElement *)a3;
  v18.receiver = self;
  v18.super_class = (Class)SUUIAssetViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v18, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SUUIAssetViewElement initialPlaybackTime](v4, "initialPlaybackTime");
    self->_initialPlaybackTime = v7;
    self->_itemIdentifier = -[SUUIAssetViewElement itemIdentifier](v4, "itemIdentifier");
    -[SUUIAssetViewElement playbackDuration](v4, "playbackDuration");
    self->_playbackDuration = v8;
    -[SUUIAssetViewElement keyCertificateURL](v4, "keyCertificateURL");
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    keyCertificateURL = self->_keyCertificateURL;
    self->_keyCertificateURL = v9;

    -[SUUIAssetViewElement keyServerURL](v4, "keyServerURL");
    v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
    keyServerURL = self->_keyServerURL;
    self->_keyServerURL = v11;

    -[SUUIAssetViewElement secureKeyDeliveryType](v4, "secureKeyDeliveryType");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    secureKeyDeliveryType = self->_secureKeyDeliveryType;
    self->_secureKeyDeliveryType = v13;

    self->_ITunesStream = -[SUUIAssetViewElement isITunesStream](v4, "isITunesStream");
    -[SUUIAssetViewElement URL](v4, "URL");
    v15 = (NSURL *)objc_claimAutoreleasedReturnValue();
    url = self->_url;
    self->_url = v15;

  }
  return v6;
}

- (double)initialPlaybackTime
{
  return self->_initialPlaybackTime;
}

- (void)setInitialPlaybackTime:(double)a3
{
  self->_initialPlaybackTime = a3;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (double)playbackDuration
{
  return self->_playbackDuration;
}

- (NSString)secureKeyDeliveryType
{
  return self->_secureKeyDeliveryType;
}

- (NSURL)URL
{
  return self->_url;
}

- (BOOL)isITunesStream
{
  return self->_ITunesStream;
}

- (NSURL)keyCertificateURL
{
  return self->_keyCertificateURL;
}

- (NSURL)keyServerURL
{
  return self->_keyServerURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_secureKeyDeliveryType, 0);
}

@end
