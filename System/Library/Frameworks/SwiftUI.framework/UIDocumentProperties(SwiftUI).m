@implementation UIDocumentProperties(SwiftUI)

- (uint64_t)initWithTitle:()SwiftUI iconProvider:imageProvider:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  id v13;
  uint64_t v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v11 = (void *)getLPLinkMetadataClass_softClass;
  v20 = getLPLinkMetadataClass_softClass;
  if (!getLPLinkMetadataClass_softClass)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __getLPLinkMetadataClass_block_invoke;
    v16[3] = &unk_1E1B1B9F8;
    v16[4] = &v17;
    __getLPLinkMetadataClass_block_invoke((uint64_t)v16);
    v11 = (void *)v18[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v17, 8);
  v13 = objc_alloc_init(v12);
  objc_msgSend(v13, "setTitle:", v8);
  objc_msgSend(v13, "setIconProvider:", v9);
  objc_msgSend(v13, "setImageProvider:", v10);
  v14 = objc_msgSend(a1, "initWithMetadata:", v13);

  return v14;
}

@end
