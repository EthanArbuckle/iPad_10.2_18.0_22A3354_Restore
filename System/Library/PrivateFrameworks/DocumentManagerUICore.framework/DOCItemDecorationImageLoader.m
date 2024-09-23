@implementation DOCItemDecorationImageLoader

+ (id)_typeForItemAccessType:(int64_t)a3
{
  id result;
  void *v6;

  if ((unint64_t)a3 < 3)
    return off_24D72ACE0[a3];
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DOCItemDecorationImageLoader.m"), 25, CFSTR("Unhandled case"));

  return result;
}

+ (id)itemAccessDecorationForType:(int64_t)a3 size:(CGSize)a4 scale:(double)a5
{
  double height;
  double width;
  void *v9;
  void *v10;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a1, "_typeForItemAccessType:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "vendorBadgeDecorationForType:size:scale:", v9, width, height, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)vendorBadgeDecorationForType:(id)a3 size:(CGSize)a4 scale:(double)a5
{
  double height;
  double width;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[2];

  height = a4.height;
  width = a4.width;
  v17[1] = *MEMORY[0x24BDAC8D0];
  v8 = (objc_class *)MEMORY[0x24BE51AB0];
  v9 = a3;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithSize:scale:", width, height, a5);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AA0]), "initWithType:", v9);

  v17[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prepareImagesForDescriptors:", v12);

  objc_msgSend(v11, "imageForDescriptor:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "CGImage");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithCGImage:", v14);

  return v15;
}

@end
