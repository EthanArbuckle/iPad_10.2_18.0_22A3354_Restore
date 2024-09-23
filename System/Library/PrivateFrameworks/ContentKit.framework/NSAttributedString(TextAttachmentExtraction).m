@implementation NSAttributedString(TextAttachmentExtraction)

- (id)wf_contentAsStringsAndAttachments
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(a1, "length");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__NSAttributedString_TextAttachmentExtraction__wf_contentAsStringsAndAttachments__block_invoke;
  v8[3] = &unk_24C4DFBD0;
  v8[4] = a1;
  v4 = v2;
  v9 = v4;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v3, 0, v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

@end
