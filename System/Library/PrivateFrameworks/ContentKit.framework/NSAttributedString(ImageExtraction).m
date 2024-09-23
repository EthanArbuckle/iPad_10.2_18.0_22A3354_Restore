@implementation NSAttributedString(ImageExtraction)

- (void)containedImageFiles
{
  void *v2;
  id *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = (void *)objc_opt_new();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v3 = (id *)getNSAttachmentAttributeNameSymbolLoc_ptr_17319;
  v18 = getNSAttachmentAttributeNameSymbolLoc_ptr_17319;
  v4 = MEMORY[0x24BDAC760];
  if (!getNSAttachmentAttributeNameSymbolLoc_ptr_17319)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __getNSAttachmentAttributeNameSymbolLoc_block_invoke_17320;
    v14[3] = &unk_24C4E3118;
    v14[4] = &v15;
    __getNSAttachmentAttributeNameSymbolLoc_block_invoke_17320(v14);
    v3 = (id *)v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (v3)
  {
    v5 = *v3;
    v6 = objc_msgSend(a1, "length");
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __58__NSAttributedString_ImageExtraction__containedImageFiles__block_invoke;
    v12[3] = &unk_24C4E0EF8;
    v12[4] = a1;
    v7 = v2;
    v13 = v7;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v5, 0, v6, 0, v12);

    v8 = v13;
    v9 = v7;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSAttributedStringKey getNSAttachmentAttributeName(void)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("WFWebArchive+ImageExtraction.m"), 16, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

@end
