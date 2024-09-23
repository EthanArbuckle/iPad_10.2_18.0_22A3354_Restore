@implementation AFUIImageResource

+ (id)imageResourceWithAppPunchOut:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "imageResourceFromKey:pressedKey:punchOut:", 0, 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)imageResourceWithLocalResourceName:(id)a3 pressedResourceName:(id)a4 localPunchOut:(id)a5 bundle:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  AFUIImageResource *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(AFUIImageResource);
  -[AFUIImageResource setLocalResourceBundle:](v13, "setLocalResourceBundle:", v9);

  -[AFUIImageResource setLocalResourceName:](v13, "setLocalResourceName:", v12);
  -[AFUIImageResource setLocalPressedResourceName:](v13, "setLocalPressedResourceName:", v11);

  -[AFUIImageResource setLocalPunchOut:](v13, "setLocalPunchOut:", v10);
  return v13;
}

+ (id)imageResourceFromKey:(id)a3 pressedKey:(id)a4 punchOut:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  AFUIImageResource *v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "appIconMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v10)
  {
    objc_msgSend(v9, "appIconMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v9, "appIcon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
  }
  objc_msgSend(v12, "resourceUrl");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scaleFactor");
  if (v15 <= 0.0)
    v16 = 1.0;
  else
    v16 = v15;
  objc_msgSend(v13, "resourceUrl");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scaleFactor");
  v19 = v18;
  if (v12)
  {
    objc_msgSend(v12, "pixelWidth");
    v21 = v20 / v16;
    objc_msgSend(v12, "pixelHeight");
    v23 = v22 / v16;
  }
  else
  {
    v21 = *MEMORY[0x24BDBF148];
    v23 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  if (v19 <= 0.0)
    v19 = 1.0;
  v24 = objc_alloc_init(AFUIImageResource);
  -[AFUIImageResource setRemoteURL:](v24, "setRemoteURL:", v14);
  -[AFUIImageResource setRemoteScale:](v24, "setRemoteScale:", v16);
  -[AFUIImageResource setRemotePressedURL:](v24, "setRemotePressedURL:", v17);
  -[AFUIImageResource setRemotePressedScale:](v24, "setRemotePressedScale:", v19);
  -[AFUIImageResource setLogoSize:](v24, "setLogoSize:", v21, v23);
  -[AFUIImageResource setRemotePunchOut:](v24, "setRemotePunchOut:", v9);

  return v24;
}

- (void)getLogoWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    -[AFUIImageResource localResourceName](self, "localResourceName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __43__AFUIImageResource_getLogoWithCompletion___block_invoke;
      v7[3] = &unk_24D7A35E0;
      v7[4] = self;
      v8 = v4;
      -[AFUIImageResource _fetchLocalResourcesWithCompletion:](self, "_fetchLocalResourcesWithCompletion:", v7);

    }
    else
    {
      -[AFUIImageResource remoteURL](self, "remoteURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        -[AFUIImageResource _fetchRemoteResourcesWithCompletion:](self, "_fetchRemoteResourcesWithCompletion:", v4);
      else
        (*((void (**)(id, _QWORD, _QWORD, _QWORD))v4 + 2))(v4, 0, 0, 0);
    }
  }

}

uint64_t __43__AFUIImageResource_getLogoWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "_fetchRemoteResourcesWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (CGSize)logoSize
{
  double width;
  CGFloat height;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = *MEMORY[0x24BDBF148];
  height = *(double *)(MEMORY[0x24BDBF148] + 8);
  -[AFUIImageResource localResourceName](self, "localResourceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[AFUIImageResource _imageInLocalResourceBundleNamed:](self, "_imageInLocalResourceBundleNamed:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "size");
      width = v8;
      height = v9;
    }

  }
  if (width <= 0.0)
  {
    width = self->_logoSize.width;
    height = self->_logoSize.height;
  }

  v10 = width;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_fetchLocalResourcesWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *, void *, void *);

  v9 = (void (**)(id, void *, void *, void *))a3;
  -[AFUIImageResource localResourceName](self, "localResourceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIImageResource localPressedResourceName](self, "localPressedResourceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIImageResource localPunchOut](self, "localPunchOut");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v7 = 0;
    if (v5)
      goto LABEL_3;
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  -[AFUIImageResource _imageInLocalResourceBundleNamed:](self, "_imageInLocalResourceBundleNamed:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
LABEL_3:
  -[AFUIImageResource _imageInLocalResourceBundleNamed:](self, "_imageInLocalResourceBundleNamed:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9[2](v9, v7, v8, v6);

}

- (id)_imageInLocalResourceBundleNamed:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BEBD640];
  v5 = a3;
  -[AFUIImageResource localResourceBundle](self, "localResourceBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_deviceSpecificImageNamed:inBundle:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_fetchRemoteResourcesWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD block[4];
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  _QWORD v27[4];
  NSObject *v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;

  v4 = a3;
  -[AFUIImageResource remoteURL](self, "remoteURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIImageResource remotePressedURL](self, "remotePressedURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AFUIImageResource remotePunchOut](self, "remotePunchOut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__0;
  v32[4] = __Block_byref_object_dispose__0;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__0;
  v30[4] = __Block_byref_object_dispose__0;
  v31 = 0;
  v6 = dispatch_group_create();
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v6);
  objc_msgSend(MEMORY[0x24BEA8520], "sharedURLSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __57__AFUIImageResource__fetchRemoteResourcesWithCompletion___block_invoke;
  v27[3] = &unk_24D7A3608;
  v29 = v32;
  v10 = v6;
  v28 = v10;
  v11 = (id)objc_msgSend(v8, "imageTaskWithHTTPGetRequest:client:completionHandler:", v18, self, v27);

  dispatch_group_enter(v10);
  objc_msgSend(MEMORY[0x24BEA8520], "sharedURLSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v9;
  v24[1] = 3221225472;
  v24[2] = __57__AFUIImageResource__fetchRemoteResourcesWithCompletion___block_invoke_2;
  v24[3] = &unk_24D7A3608;
  v26 = v30;
  v13 = v10;
  v25 = v13;
  v14 = (id)objc_msgSend(v12, "imageTaskWithHTTPGetRequest:client:completionHandler:", v17, self, v24);

  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __57__AFUIImageResource__fetchRemoteResourcesWithCompletion___block_invoke_3;
  block[3] = &unk_24D7A3630;
  v22 = v32;
  v23 = v30;
  v20 = v5;
  v21 = v4;
  v15 = v5;
  v16 = v4;
  dispatch_group_notify(v13, v7, block);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

}

void __57__AFUIImageResource__fetchRemoteResourcesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __57__AFUIImageResource__fetchRemoteResourcesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __57__AFUIImageResource__fetchRemoteResourcesWithCompletion___block_invoke_3(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), a1[4]);
}

- (NSString)localResourceName
{
  return self->_localResourceName;
}

- (void)setLocalResourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)localPressedResourceName
{
  return self->_localPressedResourceName;
}

- (void)setLocalPressedResourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SAUIAppPunchOut)localPunchOut
{
  return self->_localPunchOut;
}

- (void)setLocalPunchOut:(id)a3
{
  objc_storeStrong((id *)&self->_localPunchOut, a3);
}

- (NSBundle)localResourceBundle
{
  return self->_localResourceBundle;
}

- (void)setLocalResourceBundle:(id)a3
{
  objc_storeStrong((id *)&self->_localResourceBundle, a3);
}

- (NSURL)remoteURL
{
  return self->_remoteURL;
}

- (void)setRemoteURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)remotePressedURL
{
  return self->_remotePressedURL;
}

- (void)setRemotePressedURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SAUIAppPunchOut)remotePunchOut
{
  return self->_remotePunchOut;
}

- (void)setRemotePunchOut:(id)a3
{
  objc_storeStrong((id *)&self->_remotePunchOut, a3);
}

- (double)remoteScale
{
  return self->_remoteScale;
}

- (void)setRemoteScale:(double)a3
{
  self->_remoteScale = a3;
}

- (double)remotePressedScale
{
  return self->_remotePressedScale;
}

- (void)setRemotePressedScale:(double)a3
{
  self->_remotePressedScale = a3;
}

- (void)setLogoSize:(CGSize)a3
{
  self->_logoSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remotePunchOut, 0);
  objc_storeStrong((id *)&self->_remotePressedURL, 0);
  objc_storeStrong((id *)&self->_remoteURL, 0);
  objc_storeStrong((id *)&self->_localResourceBundle, 0);
  objc_storeStrong((id *)&self->_localPunchOut, 0);
  objc_storeStrong((id *)&self->_localPressedResourceName, 0);
  objc_storeStrong((id *)&self->_localResourceName, 0);
}

@end
