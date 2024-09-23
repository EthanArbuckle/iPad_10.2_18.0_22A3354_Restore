@implementation ATGrappaSignatureProvider

- (ATGrappaSignatureProvider)initWithGrappaSession:(id)a3
{
  id v5;
  ATGrappaSignatureProvider *v6;
  ATGrappaSignatureProvider *v7;
  uint64_t v8;
  ATDeviceSettings *settings;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATGrappaSignatureProvider;
  v6 = -[ATGrappaSignatureProvider init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_grappaSession, a3);
    +[ATDeviceSettings sharedInstance](ATDeviceSettings, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    settings = v7->_settings;
    v7->_settings = (ATDeviceSettings *)v8;

  }
  return v7;
}

- (id)createSignature:(id *)a3 forData:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[ATGrappaSession createSignature:forData:](self->_grappaSession, "createSignature:forData:", a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
    *a3 = 0;
  }

  return v7;
}

- (id)verifySignature:(id)a3 forData:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length") && objc_msgSend(v6, "length"))
  {
    -[ATGrappaSession verifySignature:forData:](self->_grappaSession, "verifySignature:forData:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v7, "length") && !objc_msgSend(v6, "length"))
    {
      v9 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 4, 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_8:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_grappaSession, 0);
}

@end
