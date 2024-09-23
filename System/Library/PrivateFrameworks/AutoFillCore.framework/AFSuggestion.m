@implementation AFSuggestion

- (AFSuggestion)initWithTitle:(id)a3 subTitle:(id)a4 usernameAndPasswordPayload:(id)a5 creditCardPayload:(id)a6 oneTimeCodePayload:(id)a7 leadingImage:(CGImage *)a8 trailingImage:(CGImage *)a9 applicationKey:(id)a10 applicationBundleId:(id)a11 altDSID:(id)a12 customInfoType:(unint64_t)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  AFSuggestion *v26;
  uint64_t v27;
  NSString *title;
  uint64_t v29;
  NSString *subTitle;
  uint64_t v31;
  NSDictionary *usernameAndPasswordPayload;
  uint64_t v33;
  NSDictionary *creditCardPayload;
  uint64_t v35;
  NSDictionary *oneTimeCodePayload;
  uint64_t v37;
  NSString *applicationKey;
  uint64_t v39;
  NSString *applicationBundleId;
  uint64_t v41;
  NSString *altDSID;
  objc_super v45;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v45.receiver = self;
  v45.super_class = (Class)AFSuggestion;
  v26 = -[AFSuggestion init](&v45, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v18, "copy");
    title = v26->_title;
    v26->_title = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    subTitle = v26->_subTitle;
    v26->_subTitle = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    usernameAndPasswordPayload = v26->_usernameAndPasswordPayload;
    v26->_usernameAndPasswordPayload = (NSDictionary *)v31;

    v33 = objc_msgSend(v21, "copy");
    creditCardPayload = v26->_creditCardPayload;
    v26->_creditCardPayload = (NSDictionary *)v33;

    v35 = objc_msgSend(v22, "copy");
    oneTimeCodePayload = v26->_oneTimeCodePayload;
    v26->_oneTimeCodePayload = (NSDictionary *)v35;

    v26->_leadingImage = a8;
    v26->_trailingImage = a9;
    v37 = objc_msgSend(v23, "copy");
    applicationKey = v26->_applicationKey;
    v26->_applicationKey = (NSString *)v37;

    v39 = objc_msgSend(v24, "copy");
    applicationBundleId = v26->_applicationBundleId;
    v26->_applicationBundleId = (NSString *)v39;

    v41 = objc_msgSend(v25, "copy");
    altDSID = v26->_altDSID;
    v26->_altDSID = (NSString *)v41;

    v26->_customInfoType = a13;
  }

  return v26;
}

- (AFSuggestion)initWithTitle:(id)a3 subTitle:(id)a4 usernameAndPasswordPayload:(id)a5 leadingImage:(CGImage *)a6 trailingImage:(CGImage *)a7 applicationKey:(id)a8 applicationBundleId:(id)a9 altDSID:(id)a10 customInfoType:(unint64_t)a11
{
  return -[AFSuggestion initWithTitle:subTitle:usernameAndPasswordPayload:creditCardPayload:oneTimeCodePayload:leadingImage:trailingImage:applicationKey:applicationBundleId:altDSID:customInfoType:](self, "initWithTitle:subTitle:usernameAndPasswordPayload:creditCardPayload:oneTimeCodePayload:leadingImage:trailingImage:applicationKey:applicationBundleId:altDSID:customInfoType:", a3, a4, a5, 0, 0, a6, a7, a8, a9, a10, a11);
}

- (AFSuggestion)initWithTitle:(id)a3 subTitle:(id)a4 usernameAndPasswordPayload:(id)a5 leadingImage:(CGImage *)a6 trailingImage:(CGImage *)a7 customInfoType:(unint64_t)a8
{
  return -[AFSuggestion initWithTitle:subTitle:usernameAndPasswordPayload:creditCardPayload:oneTimeCodePayload:leadingImage:trailingImage:applicationKey:applicationBundleId:altDSID:customInfoType:](self, "initWithTitle:subTitle:usernameAndPasswordPayload:creditCardPayload:oneTimeCodePayload:leadingImage:trailingImage:applicationKey:applicationBundleId:altDSID:customInfoType:", a3, a4, a5, 0, 0, a6, a7, 0, 0, 0, a8);
}

- (AFSuggestion)initWithTitle:(id)a3 applicationKey:(id)a4 applicationBundleId:(id)a5 altDSID:(id)a6 customInfoType:(unint64_t)a7
{
  return -[AFSuggestion initWithTitle:subTitle:usernameAndPasswordPayload:creditCardPayload:oneTimeCodePayload:leadingImage:trailingImage:applicationKey:applicationBundleId:altDSID:customInfoType:](self, "initWithTitle:subTitle:usernameAndPasswordPayload:creditCardPayload:oneTimeCodePayload:leadingImage:trailingImage:applicationKey:applicationBundleId:altDSID:customInfoType:", a3, 0, 0, 0, 0, 0, 0, a4, a5, a6, a7);
}

- (AFSuggestion)initWithTitle:(id)a3 subTitle:(id)a4 creditCardPayload:(id)a5 customInfoType:(unint64_t)a6
{
  return -[AFSuggestion initWithTitle:subTitle:usernameAndPasswordPayload:creditCardPayload:oneTimeCodePayload:leadingImage:trailingImage:applicationKey:applicationBundleId:altDSID:customInfoType:](self, "initWithTitle:subTitle:usernameAndPasswordPayload:creditCardPayload:oneTimeCodePayload:leadingImage:trailingImage:applicationKey:applicationBundleId:altDSID:customInfoType:", a3, a4, 0, a5, 0, 0, 0, 0, 0, 0, a6);
}

- (AFSuggestion)initWithTitle:(id)a3 subtitle:(id)a4 oneTimeCodePayload:(id)a5 customInfoType:(unint64_t)a6
{
  return -[AFSuggestion initWithTitle:subTitle:usernameAndPasswordPayload:creditCardPayload:oneTimeCodePayload:leadingImage:trailingImage:applicationKey:applicationBundleId:altDSID:customInfoType:](self, "initWithTitle:subTitle:usernameAndPasswordPayload:creditCardPayload:oneTimeCodePayload:leadingImage:trailingImage:applicationKey:applicationBundleId:altDSID:customInfoType:", a3, a4, 0, 0, a5, 0, 0, 0, 0, 0, a6);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (NSDictionary)usernameAndPasswordPayload
{
  return self->_usernameAndPasswordPayload;
}

- (NSDictionary)creditCardPayload
{
  return self->_creditCardPayload;
}

- (NSDictionary)oneTimeCodePayload
{
  return self->_oneTimeCodePayload;
}

- (CGImage)leadingImage
{
  return self->_leadingImage;
}

- (CGImage)trailingImage
{
  return self->_trailingImage;
}

- (unint64_t)customInfoType
{
  return self->_customInfoType;
}

- (NSString)applicationKey
{
  return self->_applicationKey;
}

- (NSString)applicationBundleId
{
  return self->_applicationBundleId;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_applicationBundleId, 0);
  objc_storeStrong((id *)&self->_applicationKey, 0);
  objc_storeStrong((id *)&self->_oneTimeCodePayload, 0);
  objc_storeStrong((id *)&self->_creditCardPayload, 0);
  objc_storeStrong((id *)&self->_usernameAndPasswordPayload, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
