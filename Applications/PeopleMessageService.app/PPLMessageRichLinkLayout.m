@implementation PPLMessageRichLinkLayout

+ (id)createRichLinkLayoutWithURL:(id)a3 title:(id)a4 imageData:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)LPLinkMetadata);
  objc_msgSend(v10, "setTitle:", v8);

  objc_msgSend(v10, "setURL:", v9);
  if (v7)
  {
    v11 = objc_msgSend(objc_alloc((Class)LPImage), "initWithData:MIMEType:", v7, CFSTR("image/png"));
    objc_msgSend(v10, "setImage:", v11);

  }
  v12 = objc_msgSend(objc_alloc((Class)MSMessageRichLinkLayout), "initWithLinkMetadata:", v10);

  return v12;
}

@end
