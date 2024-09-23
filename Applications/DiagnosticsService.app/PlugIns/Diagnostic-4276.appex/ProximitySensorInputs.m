@implementation ProximitySensorInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v11;

  v11 = 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("noInputTimeout"), &off_10000CCF0, &off_10000CD00, 0, &v11));
  -[ProximitySensorInputs setNoInputTimeout:](self, "setNoInputTimeout:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("holdTime"), &off_10000CCF0, &off_10000CD10, &off_10000CD20, &v11));
  -[ProximitySensorInputs setHoldTime:](self, "setHoldTime:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromKey:maxLength:defaultValue:failed:", CFSTR("upImageFileName"), 256, &stru_10000C760, &v11));
  -[ProximitySensorInputs setUpImageFileName:](self, "setUpImageFileName:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_stringFromKey:maxLength:defaultValue:failed:", CFSTR("downImageFileName"), 256, &stru_10000C760, &v11));
  -[ProximitySensorInputs setDownImageFileName:](self, "setDownImageFileName:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", CFSTR("assetDownloadTimeout"), &off_10000CD30, &off_10000CD40, &off_10000CD50, &v11));
  -[ProximitySensorInputs setAssetDownloadTimeout:](self, "setAssetDownloadTimeout:", v9);

  return v11 == 0;
}

- (NSNumber)noInputTimeout
{
  return self->_noInputTimeout;
}

- (void)setNoInputTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_noInputTimeout, a3);
}

- (NSNumber)holdTime
{
  return self->_holdTime;
}

- (void)setHoldTime:(id)a3
{
  objc_storeStrong((id *)&self->_holdTime, a3);
}

- (NSString)upImageFileName
{
  return self->_upImageFileName;
}

- (void)setUpImageFileName:(id)a3
{
  objc_storeStrong((id *)&self->_upImageFileName, a3);
}

- (NSString)downImageFileName
{
  return self->_downImageFileName;
}

- (void)setDownImageFileName:(id)a3
{
  objc_storeStrong((id *)&self->_downImageFileName, a3);
}

- (NSNumber)assetDownloadTimeout
{
  return self->_assetDownloadTimeout;
}

- (void)setAssetDownloadTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_assetDownloadTimeout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDownloadTimeout, 0);
  objc_storeStrong((id *)&self->_downImageFileName, 0);
  objc_storeStrong((id *)&self->_upImageFileName, 0);
  objc_storeStrong((id *)&self->_holdTime, 0);
  objc_storeStrong((id *)&self->_noInputTimeout, 0);
}

@end
