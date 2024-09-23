@implementation EDRichLinkData

- (EDRichLinkData)initWithPersistentID:(id)a3 title:(id)a4 url:(id)a5 data:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EDRichLinkData *v15;
  EDRichLinkData *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)EDRichLinkData;
  v15 = -[EDRichLinkData init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_persistentID, a3);
    objc_storeStrong((id *)&v16->_title, a4);
    objc_storeStrong((id *)&v16->_url, a5);
    objc_storeStrong((id *)&v16->_data, a6);
  }

  return v16;
}

- (EDRichLinkData)initWithTitle:(id)a3 url:(id)a4 data:(id)a5
{
  id v9;
  id v10;
  id v11;
  EDRichLinkData *v12;
  EDRichLinkData *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EDRichLinkData;
  v12 = -[EDRichLinkData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_url, a4);
    objc_storeStrong((id *)&v13->_data, a5);
  }

  return v13;
}

- (EDPersistedRichLinkID)persistentID
{
  return self->_persistentID;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)url
{
  return self->_url;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
}

@end
