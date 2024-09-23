@implementation NSReadMutableAttributedStringWithCoder

Class ___NSReadMutableAttributedStringWithCoder_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Class Class;
  Class v10;
  Class v11;
  Class v12;
  Class v13;
  Class v14;
  Class v15;
  Class v16;
  Class v17;
  Class v18;
  Class result;

  v0 = (void *)MEMORY[0x1E0C99E20];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  qword_1ECD09400 = (uint64_t)(id)objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  Class = objc_getClass("NSParagraphStyle");
  if (Class)
    objc_msgSend((id)qword_1ECD09400, "addObject:", Class);
  v10 = objc_getClass("NSGlyphInfo");
  if (v10)
    objc_msgSend((id)qword_1ECD09400, "addObject:", v10);
  v11 = objc_getClass("NSTextAlternatives");
  if (v11)
    objc_msgSend((id)qword_1ECD09400, "addObject:", v11);
  v12 = objc_getClass("NSTextAttachment");
  if (v12)
    objc_msgSend((id)qword_1ECD09400, "addObject:", v12);
  v13 = objc_getClass("NSShadow");
  if (v13)
    objc_msgSend((id)qword_1ECD09400, "addObject:", v13);
  v14 = objc_getClass("NSAdaptiveImageGlyph");
  if (v14)
    objc_msgSend((id)qword_1ECD09400, "addObject:", v14);
  v15 = objc_getClass("NSFont");
  if (v15)
    objc_msgSend((id)qword_1ECD09400, "addObject:", v15);
  v16 = objc_getClass("UIFont");
  if (v16)
    objc_msgSend((id)qword_1ECD09400, "addObject:", v16);
  v17 = objc_getClass("NSColor");
  if (v17)
    objc_msgSend((id)qword_1ECD09400, "addObject:", v17);
  v18 = objc_getClass("UIColor");
  if (v18)
    objc_msgSend((id)qword_1ECD09400, "addObject:", v18);
  qword_1ECD09408 = objc_msgSend((id)qword_1ECD09400, "mutableCopy");
  result = objc_getClass("NSTextEncapsulation");
  if (result)
    return (Class)objc_msgSend((id)qword_1ECD09408, "addObject:", result);
  return result;
}

@end
