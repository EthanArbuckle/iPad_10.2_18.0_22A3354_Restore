@implementation BMPBAppClipLaunchEvent

- (BOOL)hasURLHash
{
  return self->_uRLHash != 0;
}

- (BOOL)hasClipBundleID
{
  return self->_clipBundleID != 0;
}

- (BOOL)hasAppBundleID
{
  return self->_appBundleID != 0;
}

- (BOOL)hasWebAppBundleID
{
  return self->_webAppBundleID != 0;
}

- (BOOL)hasLaunchReason
{
  return self->_launchReason != 0;
}

- (BOOL)hasFullURL
{
  return self->_fullURL != 0;
}

- (BOOL)hasReferrerURL
{
  return self->_referrerURL != 0;
}

- (BOOL)hasReferrerBundleID
{
  return self->_referrerBundleID != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)BMPBAppClipLaunchEvent;
  -[BMPBAppClipLaunchEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBAppClipLaunchEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uRLHash;
  NSString *clipBundleID;
  NSString *appBundleID;
  NSString *webAppBundleID;
  NSString *launchReason;
  NSString *fullURL;
  NSString *referrerURL;
  NSString *referrerBundleID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uRLHash = self->_uRLHash;
  if (uRLHash)
    objc_msgSend(v3, "setObject:forKey:", uRLHash, CFSTR("URLHash"));
  clipBundleID = self->_clipBundleID;
  if (clipBundleID)
    objc_msgSend(v4, "setObject:forKey:", clipBundleID, CFSTR("clipBundleID"));
  appBundleID = self->_appBundleID;
  if (appBundleID)
    objc_msgSend(v4, "setObject:forKey:", appBundleID, CFSTR("appBundleID"));
  webAppBundleID = self->_webAppBundleID;
  if (webAppBundleID)
    objc_msgSend(v4, "setObject:forKey:", webAppBundleID, CFSTR("webAppBundleID"));
  launchReason = self->_launchReason;
  if (launchReason)
    objc_msgSend(v4, "setObject:forKey:", launchReason, CFSTR("launchReason"));
  fullURL = self->_fullURL;
  if (fullURL)
    objc_msgSend(v4, "setObject:forKey:", fullURL, CFSTR("fullURL"));
  referrerURL = self->_referrerURL;
  if (referrerURL)
    objc_msgSend(v4, "setObject:forKey:", referrerURL, CFSTR("referrerURL"));
  referrerBundleID = self->_referrerBundleID;
  if (referrerBundleID)
    objc_msgSend(v4, "setObject:forKey:", referrerBundleID, CFSTR("referrerBundleID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBAppClipLaunchEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uRLHash)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_clipBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_appBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_webAppBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_launchReason)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_fullURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_referrerURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_referrerBundleID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uRLHash)
  {
    objc_msgSend(v4, "setURLHash:");
    v4 = v5;
  }
  if (self->_clipBundleID)
  {
    objc_msgSend(v5, "setClipBundleID:");
    v4 = v5;
  }
  if (self->_appBundleID)
  {
    objc_msgSend(v5, "setAppBundleID:");
    v4 = v5;
  }
  if (self->_webAppBundleID)
  {
    objc_msgSend(v5, "setWebAppBundleID:");
    v4 = v5;
  }
  if (self->_launchReason)
  {
    objc_msgSend(v5, "setLaunchReason:");
    v4 = v5;
  }
  if (self->_fullURL)
  {
    objc_msgSend(v5, "setFullURL:");
    v4 = v5;
  }
  if (self->_referrerURL)
  {
    objc_msgSend(v5, "setReferrerURL:");
    v4 = v5;
  }
  if (self->_referrerBundleID)
  {
    objc_msgSend(v5, "setReferrerBundleID:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uRLHash, "copyWithZone:", a3);
  v7 = (void *)v5[7];
  v5[7] = v6;

  v8 = -[NSString copyWithZone:](self->_clipBundleID, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSString copyWithZone:](self->_appBundleID, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  v12 = -[NSString copyWithZone:](self->_webAppBundleID, "copyWithZone:", a3);
  v13 = (void *)v5[8];
  v5[8] = v12;

  v14 = -[NSString copyWithZone:](self->_launchReason, "copyWithZone:", a3);
  v15 = (void *)v5[4];
  v5[4] = v14;

  v16 = -[NSString copyWithZone:](self->_fullURL, "copyWithZone:", a3);
  v17 = (void *)v5[3];
  v5[3] = v16;

  v18 = -[NSString copyWithZone:](self->_referrerURL, "copyWithZone:", a3);
  v19 = (void *)v5[6];
  v5[6] = v18;

  v20 = -[NSString copyWithZone:](self->_referrerBundleID, "copyWithZone:", a3);
  v21 = (void *)v5[5];
  v5[5] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *uRLHash;
  NSString *clipBundleID;
  NSString *appBundleID;
  NSString *webAppBundleID;
  NSString *launchReason;
  NSString *fullURL;
  NSString *referrerURL;
  NSString *referrerBundleID;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((uRLHash = self->_uRLHash, !((unint64_t)uRLHash | v4[7]))
     || -[NSString isEqual:](uRLHash, "isEqual:"))
    && ((clipBundleID = self->_clipBundleID, !((unint64_t)clipBundleID | v4[2]))
     || -[NSString isEqual:](clipBundleID, "isEqual:"))
    && ((appBundleID = self->_appBundleID, !((unint64_t)appBundleID | v4[1]))
     || -[NSString isEqual:](appBundleID, "isEqual:"))
    && ((webAppBundleID = self->_webAppBundleID, !((unint64_t)webAppBundleID | v4[8]))
     || -[NSString isEqual:](webAppBundleID, "isEqual:"))
    && ((launchReason = self->_launchReason, !((unint64_t)launchReason | v4[4]))
     || -[NSString isEqual:](launchReason, "isEqual:"))
    && ((fullURL = self->_fullURL, !((unint64_t)fullURL | v4[3]))
     || -[NSString isEqual:](fullURL, "isEqual:"))
    && ((referrerURL = self->_referrerURL, !((unint64_t)referrerURL | v4[6]))
     || -[NSString isEqual:](referrerURL, "isEqual:")))
  {
    referrerBundleID = self->_referrerBundleID;
    if ((unint64_t)referrerBundleID | v4[5])
      v13 = -[NSString isEqual:](referrerBundleID, "isEqual:");
    else
      v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;

  v3 = -[NSString hash](self->_uRLHash, "hash");
  v4 = -[NSString hash](self->_clipBundleID, "hash") ^ v3;
  v5 = -[NSString hash](self->_appBundleID, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_webAppBundleID, "hash");
  v7 = -[NSString hash](self->_launchReason, "hash");
  v8 = v7 ^ -[NSString hash](self->_fullURL, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_referrerURL, "hash");
  return v9 ^ -[NSString hash](self->_referrerBundleID, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[7])
    -[BMPBAppClipLaunchEvent setURLHash:](self, "setURLHash:");
  if (v4[2])
    -[BMPBAppClipLaunchEvent setClipBundleID:](self, "setClipBundleID:");
  if (v4[1])
    -[BMPBAppClipLaunchEvent setAppBundleID:](self, "setAppBundleID:");
  if (v4[8])
    -[BMPBAppClipLaunchEvent setWebAppBundleID:](self, "setWebAppBundleID:");
  if (v4[4])
    -[BMPBAppClipLaunchEvent setLaunchReason:](self, "setLaunchReason:");
  if (v4[3])
    -[BMPBAppClipLaunchEvent setFullURL:](self, "setFullURL:");
  if (v4[6])
    -[BMPBAppClipLaunchEvent setReferrerURL:](self, "setReferrerURL:");
  if (v4[5])
    -[BMPBAppClipLaunchEvent setReferrerBundleID:](self, "setReferrerBundleID:");

}

- (NSString)uRLHash
{
  return self->_uRLHash;
}

- (void)setURLHash:(id)a3
{
  objc_storeStrong((id *)&self->_uRLHash, a3);
}

- (NSString)clipBundleID
{
  return self->_clipBundleID;
}

- (void)setClipBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_clipBundleID, a3);
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleID, a3);
}

- (NSString)webAppBundleID
{
  return self->_webAppBundleID;
}

- (void)setWebAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_webAppBundleID, a3);
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (void)setLaunchReason:(id)a3
{
  objc_storeStrong((id *)&self->_launchReason, a3);
}

- (NSString)fullURL
{
  return self->_fullURL;
}

- (void)setFullURL:(id)a3
{
  objc_storeStrong((id *)&self->_fullURL, a3);
}

- (NSString)referrerURL
{
  return self->_referrerURL;
}

- (void)setReferrerURL:(id)a3
{
  objc_storeStrong((id *)&self->_referrerURL, a3);
}

- (NSString)referrerBundleID
{
  return self->_referrerBundleID;
}

- (void)setReferrerBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_referrerBundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webAppBundleID, 0);
  objc_storeStrong((id *)&self->_uRLHash, 0);
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_referrerBundleID, 0);
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_fullURL, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
}

@end
