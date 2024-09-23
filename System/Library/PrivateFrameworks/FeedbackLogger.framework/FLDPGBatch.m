@implementation FLDPGBatch

- (FLDPGBatch)initWithBundleID:(id)a3 payload:(id)a4
{
  id v7;
  id v8;
  FLDPGBatch *v9;
  FLDPGBatch *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[FLDPGBatch init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    objc_storeStrong((id *)&v10->_payload, a4);
  }

  return v10;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
