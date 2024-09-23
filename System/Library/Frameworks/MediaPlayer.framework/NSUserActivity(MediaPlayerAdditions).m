@implementation NSUserActivity(MediaPlayerAdditions)

- (id)externalMediaContentIdentifier
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_internalUserActivity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForIdentifier:", CFSTR("UAPayloadIdentifierExternalMediaContentIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "payloadForIdentifier:", CFSTR("UAPayloadIdentifierExternalMediaContentIdentifier"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
      if (v2)
        objc_msgSend(v1, "setPayload:object:identifier:", v3, v2, CFSTR("UAPayloadIdentifierExternalMediaContentIdentifier"));
    }
    else
    {
      v2 = 0;
    }

  }
  v4 = (void *)objc_msgSend(v2, "copy");

  return v4;
}

- (void)setExternalMediaContentIdentifier:()MediaPlayerAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(a1, "_internalUserActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForIdentifier:", CFSTR("UAPayloadIdentifierExternalMediaContentIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__NSUserActivity_MediaPlayerAdditions__setExternalMediaContentIdentifier___block_invoke;
    v10[3] = &unk_1E3161A60;
    v11 = v4;
    objc_msgSend(v5, "setPayloadIdentifier:object:withBlock:", CFSTR("UAPayloadIdentifierExternalMediaContentIdentifier"), v11, v10);

  }
  else if (v6)
  {
    objc_msgSend(v5, "setPayloadIdentifier:object:withBlock:", CFSTR("UAPayloadIdentifierExternalMediaContentIdentifier"), 0, 0);
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(a1, "_setExternalMediaContentBundleIdentifier:", v9);

}

- (id)_externalMediaContentBundleIdentifier
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_internalUserActivity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForIdentifier:", CFSTR("UAPayloadIdentifierExternalMediaContentBundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "payloadForIdentifier:", CFSTR("UAPayloadIdentifierExternalMediaContentBundleIdentifier"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
      if (v2)
        objc_msgSend(v1, "setPayload:object:identifier:", v3, v2, CFSTR("UAPayloadIdentifierExternalMediaContentBundleIdentifier"));
    }
    else
    {
      v2 = 0;
    }

  }
  v4 = (void *)objc_msgSend(v2, "copy");

  return v4;
}

- (void)_setExternalMediaContentBundleIdentifier:()MediaPlayerAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(a1, "_internalUserActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForIdentifier:", CFSTR("UAPayloadIdentifierExternalMediaContentBundleIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __81__NSUserActivity_MediaPlayerAdditions___setExternalMediaContentBundleIdentifier___block_invoke;
    v8[3] = &unk_1E3161A60;
    v9 = v4;
    objc_msgSend(v5, "setPayloadIdentifier:object:withBlock:", CFSTR("UAPayloadIdentifierExternalMediaContentBundleIdentifier"), v9, v8);

  }
  else if (v6)
  {
    objc_msgSend(v5, "setPayloadIdentifier:object:withBlock:", CFSTR("UAPayloadIdentifierExternalMediaContentBundleIdentifier"), 0, 0);
  }

}

@end
