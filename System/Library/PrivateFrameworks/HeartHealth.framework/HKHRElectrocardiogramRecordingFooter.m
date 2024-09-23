@implementation HKHRElectrocardiogramRecordingFooter

- (HKHRElectrocardiogramRecordingFooter)initWithText:(id)a3 link:(id)a4 url:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKHRElectrocardiogramRecordingFooter *v11;
  uint64_t v12;
  NSString *footerText;
  uint64_t v14;
  NSString *footerLink;
  uint64_t v16;
  NSString *linkURL;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HKHRElectrocardiogramRecordingFooter;
  v11 = -[HKHRElectrocardiogramRecordingFooter init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    footerText = v11->_footerText;
    v11->_footerText = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    footerLink = v11->_footerLink;
    v11->_footerLink = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    linkURL = v11->_linkURL;
    v11->_linkURL = (NSString *)v16;

  }
  return v11;
}

- (NSString)footerText
{
  return self->_footerText;
}

- (NSString)footerLink
{
  return self->_footerLink;
}

- (NSString)linkURL
{
  return self->_linkURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkURL, 0);
  objc_storeStrong((id *)&self->_footerLink, 0);
  objc_storeStrong((id *)&self->_footerText, 0);
}

@end
