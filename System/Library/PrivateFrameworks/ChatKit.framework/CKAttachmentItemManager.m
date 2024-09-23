@implementation CKAttachmentItemManager

+ (id)attachmentWithFileURL:(id)a3 size:(CGSize)a4 transferGUID:(id)a5 guid:(id)a6 createdDate:(id)a7 shareURL:(id)a8
{
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  height = a4.height;
  width = a4.width;
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a3;
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "classForFilename:", v20);

  v22 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v21, "__ck_attachmentItemClass")), "initWithFileURL:size:transferGUID:guid:createdDate:shareURL:", v18, v17, v16, v15, v14, width, height);
  return v22;
}

@end
